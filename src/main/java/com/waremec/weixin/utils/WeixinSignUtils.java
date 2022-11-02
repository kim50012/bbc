package com.waremec.weixin.utils;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import com.thoughtworks.xstream.io.xml.XppDriver;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.annotation.SignFieldMeta;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.SignInfo;
import com.waremec.weixin.domain.pay.OrderQueryRequest;
import com.waremec.weixin.domain.pay.PayCloseOrderRequest;
import com.waremec.weixin.domain.pay.PayDownloadbillRequest;
import com.waremec.weixin.domain.pay.PayRefundQueryRequest;
import com.waremec.weixin.domain.pay.PayRefundRequest;
import com.waremec.weixin.domain.pay.PaySign;
import com.waremec.weixin.domain.pay.PaySignInfo;
import com.waremec.weixin.domain.pay.QrCodeRequest;
import com.waremec.weixin.domain.pay.SendRedPackRequest;
import com.waremec.weixin.exception.InvalidParamsException;
import com.waremec.weixin.exception.InvalidSignException;
import com.waremec.weixin.service.WeixinService;

/** 
* @Package com.waremec.weixin.utils 
* @FileName WeixinSignUtils
* @Description  微信签名工具类
* @author taebem 
* @date 2015年5月7日 下午3:59:16 
*  
*/
public class WeixinSignUtils {

	public static final String KEY_STORE_TYPE = "PKCS12";

	private static final transient Log logger = LogFactory.getLog(WeixinSignUtils.class);

	private static final String SIGN = "sign";
	
	/** 
	* 生成JS-SDK权限验证的签名
	* 
	* <h3>注意事项</h3>
	* <ol>
	* <li>签名用的noncestr和timestamp必须与wx.config中的nonceStr和timestamp相同。</li>
	* <li>签名用的url必须是调用JS接口页面的完整URL。</li>
	* <li>出于安全考虑，开发者必须在服务器端实现签名的逻辑。</li>
	* </ol>
	* 参与签名的字段包括noncestr（随机字符串）, 有效的jsapi_ticket, timestamp（时间戳）, url（当前网页的URL，不包含#及其后面部分）
	* @param jsapi_ticket
	* @param url
	* @return
	*/
	public static SignInfo sign(String jsapi_ticket, String url) {
		SignInfo returns = new SignInfo();

		String nonce_str = create_nonce_str();
		String timestamp = create_timestamp();
		String string1;
		String signature = "";

		// 注意这里参数名必须全部小写，且必须有序
		string1 = "jsapi_ticket=" 	+ jsapi_ticket 
				+ "&noncestr=" 		+ nonce_str 
				+ "&timestamp=" 	+ timestamp 
				+ "&url=" 			+ url;
//		logger.info(string1);

		try {
			MessageDigest crypt = MessageDigest.getInstance("SHA-1");
			crypt.reset();
			crypt.update(string1.getBytes("UTF-8"));
			signature = byteToHex(crypt.digest());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			logger.error("NoSuchAlgorithmException message:" + e.getMessage());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error("UnsupportedEncodingException message:" + e.getMessage());
		}

		returns.setUrl(url);
		returns.setJsapi_ticket(jsapi_ticket);
		returns.setNonceStr(nonce_str);
		returns.setTimestamp(timestamp);
		returns.setSignature(signature);

		return returns;

	}

	/** 
	* 生成微信支付签名
	* <h3>备注</h3>
	* 备注：prepay_id 通过微信支付统一下单接口拿到，paySign 采用统一的微信支付 Sign 签名生成方法，
	* 注意这里 appId 也要参与签名，appId 与 config 中传入的 appId 一致，
	* 即最后参与签名的参数有appId, timeStamp, nonceStr, package, signType
	* @param appInfo 公众账号信息
	* @param mchInfo 微信商户号信息
	* @param packageInfo   统一支付接口返回的prepay_id参数值，提交格式如：prepay_id=*** 
	* @return
	*/
	public static PaySignInfo sign(AppInfo appInfo,  MchInfo mchInfo, String packageInfo) {

		PaySignInfo returns = new PaySignInfo();

		String nonceStr = RandomUtils.generateRandomString();
		String timeStamp = create_timestamp();
		String string1;

		// packageInfo = URLEncoder.encode(packageInfo);

		string1 = "appId=" 		+ appInfo.getAppId() 
				+ "&nonceStr=" 	+ nonceStr 
				+ "&package=" 	+ packageInfo 
				+ "&signType=" 	+ "MD5" 
				+ "&timeStamp=" + timeStamp;
		// System.out.println(string1);
		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();
		logger.info("stringSignTemp=\n" + stringSignTemp);
		String paySign = EncryptUtils.MD5(stringSignTemp);

		logger.info("paySign==" + paySign);

		returns.setTimestamp(timeStamp);
		returns.setNonceStr(nonceStr);
		returns.setPackageInfo(packageInfo);
		returns.setSignType("MD5");
		returns.setPaySign(paySign);

		return returns;
	}

	public static String payDownloadbillRequestSign(PayDownloadbillRequest item, MchInfo mchInfo) {
		String nonce_str = RandomUtils.generateRandomString();
		String string1 = "";

		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 += "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getBill_date())) {// 对账单日起
			string1 += "&bill_date=" + item.getBill_date();
		} else {
			throw new InvalidParamsException("bill_date");
		}

		if (StringUtils.isNotEmpty(item.getBill_type())) {// 账单类型
			string1 += "&bill_type=" + item.getBill_type();
		}

		if (StringUtils.isNotEmpty(item.getDevice_info())) {// 设备号
			string1 += "&device_info=" + item.getDevice_info();
		}

		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("body");
		}
		string1 += "&nonce_str=" + nonce_str; // 随机字符串

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.debug("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.debug("newSign==" + newSign);

		item.setNonce_str(nonce_str);
		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}
	
	 
	
	
	public static String orderQueryRequestSign2(OrderQueryRequest item, MchInfo mchInfo) {
		
		Field[] fields = item.getClass().getDeclaredFields();
		
		Map<String,Object> map = new TreeMap<String,Object>();
		
		for (Field field : fields) {
			field.setAccessible(true);
			
			SignFieldMeta meta = field.getAnnotation(SignFieldMeta.class);
			if(meta != null){
				//字段的名称
				String fieldName = field.getName();
				Object fieldValue = null;
				try {
					fieldValue = field.get(item);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				if(StringUtil.isNotEmpty(fieldValue)){
					map.put(fieldName, fieldValue);
				}else{
					if(meta.isRequired()){
						throw new InvalidParamsException(fieldName);
					}
				}
			} 
		}
		
		String string1 = "";
		int i = 0;
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			if (i++ > 0) {
				string1 += "&";
			}

			string1 += entry.getKey() + "=" + entry.getValue();
			// System.out.println(entry.getKey()+"="+entry.getValue());
		}
		
		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.info("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.info("newSign==" + newSign);

		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
		
	}
	
	public static String orderQueryRequestSign(OrderQueryRequest item, MchInfo mchInfo) {
 		String nonce_str = RandomUtils.generateRandomString();
		String string1;

		
		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {//  
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}
		
		if (StringUtils.isNotEmpty(item.getMch_id())) {//  
			string1 += "&mch_id=" + item.getMch_id();
		}else {
			throw new InvalidParamsException("mch_id");
		}
		
		string1 += "&nonce_str=" + nonce_str; 
		 
		if (StringUtils.isEmpty(item.getOut_trade_no()) && StringUtils.isEmpty(item.getTransaction_id())) {//  
			throw new InvalidParamsException("查询订单错误：商户订单号，微信订单号不能都为空");
		}
		
		if (StringUtils.isNotEmpty(item.getOut_trade_no())) {//  
			string1 += "&out_trade_no=" + item.getOut_trade_no();
		} 
		
		if (StringUtils.isNotEmpty(item.getTransaction_id())) {//  
			string1 += "&transaction_id=" + item.getTransaction_id();
		} 

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.info("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.info("newSign==" + newSign);

		item.setNonce_str(nonce_str);
		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}
	
	/** 
	* 发送红包 - Request签名
	* @param item
	* @param mchInfo
	* @return
	*/
	public static String sendRedPackRequestSign(SendRedPackRequest item, MchInfo mchInfo) {
		String nonce_str = RandomUtils.generateRandomString();
		String string1;
		
		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAct_name())) {//  
			string1 = "act_name=" + item.getAct_name();
		} else {
			throw new InvalidParamsException("act_name");
		}

		if (StringUtils.isNotEmpty(item.getClient_ip())) {//  
			string1 += "&client_ip=" + item.getClient_ip();
		}else {
			throw new InvalidParamsException("client_ip");
		}

		if (StringUtils.isNotEmpty(item.getLogo_imgurl())) {//  
			string1 += "&logo_imgurl=" + item.getLogo_imgurl();
		}  
		
		if(item.getMax_value() != null){
			string1 += "&max_value=" + item.getMax_value();
		}else{
			throw new InvalidParamsException("max_value");
		}
		
		if (StringUtils.isNotEmpty(item.getMch_billno())) {//  
			string1 += "&mch_billno=" + item.getMch_billno();
		}else {
			throw new InvalidParamsException("mch_billno");
		}
		if (StringUtils.isNotEmpty(item.getMch_id())) {//  
			string1 += "&mch_id=" + item.getMch_id();
		}else {
			throw new InvalidParamsException("mch_id");
		}
		
		if(item.getMin_value() != null){
			string1 += "&min_value=" + item.getMin_value();
		}else{
			throw new InvalidParamsException("min_value");
		}
		
		if (StringUtils.isNotEmpty(item.getNick_name())) {//  
			string1 += "&nick_name=" + item.getNick_name();
		}else {
			throw new InvalidParamsException("nick_name");
		}
		
		string1 += "&nonce_str=" + nonce_str; 

		if (StringUtils.isNotEmpty(item.getRe_openid())) {//  
			string1 += "&re_openid=" + item.getRe_openid();
		}else {
			throw new InvalidParamsException("re_openid");
		}
		
		if (StringUtils.isNotEmpty(item.getRemark())) {//  
			string1 += "&remark=" + item.getRemark();
		}else {
			throw new InvalidParamsException("remark");
		}
		
		if (StringUtils.isNotEmpty(item.getSend_name())) {//  
			string1 += "&send_name=" + item.getSend_name();
		}else {
			throw new InvalidParamsException("send_name");
		}
		
		if (StringUtils.isNotEmpty(item.getShare_content())) {//  
			string1 += "&share_content=" + item.getShare_content();
		}
 	
		if (StringUtils.isNotEmpty(item.getShare_imgurl())) {//  
			string1 += "&share_imgurl=" + item.getShare_imgurl();
		}
		
		if (StringUtils.isNotEmpty(item.getShare_url())) {//  
			string1 += "&share_url=" + item.getShare_url();
		}
		if (StringUtils.isNotEmpty(item.getSub_mch_id())) {//  
			string1 += "&sub_mch_id=" + item.getSub_mch_id();
		}
		
		if(item.getTotal_amount() != null){
			string1 += "&total_amount=" + item.getTotal_amount();
		}else{
			throw new InvalidParamsException("total_amount");
		}
		
		if(item.getTotal_num() != null){
			string1 += "&total_num=" + item.getTotal_num();
		}else{
			throw new InvalidParamsException("total_num");
		}

		if (StringUtils.isNotEmpty(item.getWishing())) {
			string1 += "&wishing=" + item.getWishing();
		}else{
			throw new InvalidParamsException("wishing");
		}
		
		if (StringUtils.isNotEmpty(item.getWxappid())) {
			string1 += "&wxappid=" + item.getWxappid();
		}else{
			throw new InvalidParamsException("wxappid");
		}

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.info("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.info("newSign==" + newSign);

		item.setNonce_str(nonce_str);
		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}

	
	public static String payCloseOrderRequestSign(PayCloseOrderRequest item, MchInfo mchInfo) {
		String nonce_str = RandomUtils.generateRandomString();
		String string1;

		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("mch_id");
		}
		string1 += "&nonce_str=" + nonce_str; // 随机字符串
 

		if (StringUtils.isNotEmpty(item.getOut_trade_no())) {// 商户订单号
			string1 += "&out_trade_no=" + item.getOut_trade_no();
		} else {
			throw new InvalidParamsException("out_trade_no");
		}
		    
		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.debug("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.debug("newSign==" + newSign);

		item.setNonce_str(nonce_str);
		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}
	
	public static String payRefundQueryRequestSign(PayRefundQueryRequest item, MchInfo mchInfo) {
		String nonce_str = RandomUtils.generateRandomString();
		String string1;

		
		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getDevice_info())) {// 设备号
			string1 += "&device_info=" + item.getDevice_info();
		}

		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("mch_id");
		}
		string1 += "&nonce_str=" + nonce_str; // 随机字符串

		if (StringUtils.isNotEmpty(item.getOut_refund_no())) {// 
			string1 += "&out_refund_no=" + item.getOut_refund_no();
		}  

		if (StringUtils.isNotEmpty(item.getOut_trade_no())) {// 
			string1 += "&out_trade_no=" + item.getOut_trade_no();
		} else {
			throw new InvalidParamsException("out_trade_no");
		}

		if (StringUtils.isNotEmpty(item.getRefund_id())) {// 
			string1 += "&refund_id=" + item.getRefund_id();
		} 

		if (StringUtils.isNotEmpty(item.getTransaction_id())) {//  
			string1 += "&transaction_id=" + item.getTransaction_id();
		}  

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.debug("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.debug("newSign==" + newSign);

		item.setNonce_str(nonce_str);
		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}
	
	public static String payRefundReqeustSign(PayRefundRequest item,MchInfo mchInfo) {

		String nonce_str = RandomUtils.generateRandomString();
		String string1;

		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getDevice_info())) {// 设备号
			string1 += "&device_info=" + item.getDevice_info();
		}

		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("mch_id");
		}
		string1 += "&nonce_str=" + nonce_str; // 随机字符串

		if (StringUtils.isNotEmpty(item.getOp_user_id())) {// 操作员
			string1 += "&op_user_id=" + item.getOp_user_id();
		} else {
			throw new InvalidParamsException("op_user_id");
		}

		if (StringUtils.isNotEmpty(item.getOut_refund_no())) {// 商户退款单号
			string1 += "&out_refund_no=" + item.getOut_refund_no();
		} else {
			throw new InvalidParamsException("out_refund_no");
		}

		if (StringUtils.isNotEmpty(item.getOut_trade_no())) {// 商户订单号
			string1 += "&out_trade_no=" + item.getOut_trade_no();
		} else {
			throw new InvalidParamsException("out_trade_no");
		}

		if (item.getRefund_fee() != null) {// 退款金额
			string1 += "&refund_fee=" + item.getRefund_fee();
		} else {
			throw new InvalidParamsException("refund_fee");
		}

		if (StringUtils.isNotEmpty(item.getRefund_fee_type())) {// 货币种类
			string1 += "&refund_fee_type=" + item.getRefund_fee_type();
		}

		if (item.getTotal_fee() != null) {// 总金额
			string1 += "&total_fee=" + item.getTotal_fee();
		} else {
			throw new InvalidParamsException("refund_fee");
		}

		if (StringUtils.isNotEmpty(item.getTransaction_id())) {// 微信订单号
			string1 += "&transaction_id=" + item.getTransaction_id();
		} else {
			throw new InvalidParamsException("transaction_id");
		}

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.debug("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.debug("newSign==" + newSign);

		item.setNonce_str(nonce_str);
		item.setSign(newSign);

		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}

	public static String paySign(PaySign item, MchInfo mchInfo) {

		String nonce_str = RandomUtils.generateRandomString();
		String string1;

		item.setTrade_type("JSAPI");
		item.setNonce_str(nonce_str);

		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getAttach())) {// 附加数据
			string1 += "&attach=" + item.getAttach();
		}

		if (StringUtils.isNotEmpty(item.getBody())) {// 商品描述
			string1 += "&body=" + item.getBody();
		} else {
			throw new InvalidParamsException("body");
		}
		if (StringUtils.isNotEmpty(item.getDetail())) {// 商品详情
			string1 += "&detail=" + item.getDetail();
		}

		if (StringUtils.isNotEmpty(item.getDevice_info())) {// 设备号
			string1 += "&device_info=" + item.getDevice_info();
		}
		if (StringUtils.isNotEmpty(item.getFee_type())) {// 货币类型
			string1 += "&fee_type=" + item.getFee_type();
		}

		if (StringUtils.isNotEmpty(item.getGoods_tag())) {// 商品标记
			string1 += "&goods_tag=" + item.getGoods_tag();
		}
		if (StringUtils.isNotEmpty(item.getLimit_pay())) {// 指定支付方式
			string1 += "&limit_pay=" + item.getLimit_pay();
		}

		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("mch_id");
		}

		string1 += "&nonce_str=" + item.getNonce_str();

		if (StringUtils.isNotEmpty(item.getNotify_url())) {// 通知地址
			string1 += "&notify_url=" + item.getNotify_url();
		} else {
			throw new InvalidParamsException("notify_url");
		}

		if (StringUtils.isNotEmpty(item.getOpenid())) {// 用户标识
			string1 += "&openid=" + item.getOpenid();
		}

		if (StringUtils.isNotEmpty(item.getOut_trade_no())) {// 商户订单号
			string1 += "&out_trade_no=" + item.getOut_trade_no();
		} else {
			throw new InvalidParamsException("out_trade_no");
		}

		if (StringUtils.isNotEmpty(item.getProduct_id())) {// 商品ID
			string1 += "&product_id=" + item.getProduct_id();
		}

		if (StringUtils.isNotEmpty(item.getSpbill_create_ip())) {// 终端IP
			string1 += "&spbill_create_ip=" + item.getSpbill_create_ip();
		} else {
			throw new InvalidParamsException("spbill_create_ip");
		}

		if (StringUtils.isNotEmpty(item.getTime_expire())) {// 交易结束时间
			string1 += "&time_expire=" + item.getTime_expire();
		}
		if (StringUtils.isNotEmpty(item.getTime_start())) {// 交易起始时间
			string1 += "&time_start=" + item.getTime_start();
		}

		if (item.getTotal_fee().intValue() > 0) {// 总金额
			string1 += "&total_fee=" + item.getTotal_fee();
		} else {
			System.out.println(item.getTotal_fee());
			throw new InvalidParamsException("total_fee");
		}

		string1 += "&trade_type=" + item.getTrade_type();

		// System.out.println("string1=\n" + string1);

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.debug("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);

		logger.debug("newSign==" + newSign);

		item.setSign(newSign);
		
		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);

		return xml;
	}
	public static String payNativeSign(PaySign item, MchInfo mchInfo) {
		
		String nonce_str = RandomUtils.generateRandomString();
		String string1 = "";
		
		item.setTrade_type("NATIVE");
		item.setNonce_str(nonce_str);
		
		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getAttach())) {// 附加数据
			string1 += "&attach=" + item.getAttach();
		}
		
		if (StringUtils.isNotEmpty(item.getBody())) {// 商品描述
			string1 += "&body=" + item.getBody();
		} else {
			throw new InvalidParamsException("body");
		}
		if (StringUtils.isNotEmpty(item.getDetail())) {// 商品详情
			string1 += "&detail=" + item.getDetail();
		}
		
		if (StringUtils.isNotEmpty(item.getDevice_info())) {// 设备号
			string1 += "&device_info=" + item.getDevice_info();
		}
		if (StringUtils.isNotEmpty(item.getFee_type())) {// 货币类型
			string1 += "&fee_type=" + item.getFee_type();
		}
		
		if (StringUtils.isNotEmpty(item.getGoods_tag())) {// 商品标记
			string1 += "&goods_tag=" + item.getGoods_tag();
		}
		
		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("mch_id");
		}
		
		string1 += "&nonce_str=" + item.getNonce_str();
		
		if (StringUtils.isNotEmpty(item.getNotify_url())) {// 通知地址
			string1 += "&notify_url=" + item.getNotify_url();
		} else {
			throw new InvalidParamsException("notify_url");
		}
		
		if (StringUtils.isNotEmpty(item.getOpenid())) {// 用户标识
			string1 += "&openid=" + item.getOpenid();
		}
		
		if (StringUtils.isNotEmpty(item.getOut_trade_no())) {// 商户订单号
			string1 += "&out_trade_no=" + item.getOut_trade_no();
		} else {
			throw new InvalidParamsException("out_trade_no");
		}
		
		if (StringUtils.isNotEmpty(item.getProduct_id())) {// 商品ID
			string1 += "&product_id=" + item.getProduct_id();
		}
		
		if (StringUtils.isNotEmpty(item.getSpbill_create_ip())) {// 终端IP
			string1 += "&spbill_create_ip=" + item.getSpbill_create_ip();
		} else {
			throw new InvalidParamsException("spbill_create_ip");
		}
		
		if (StringUtils.isNotEmpty(item.getTime_expire())) {// 交易结束时间
			string1 += "&time_expire=" + item.getTime_expire();
		}
		if (StringUtils.isNotEmpty(item.getTime_start())) {// 交易起始时间
			string1 += "&time_start=" + item.getTime_start();
		}
		
		if (item.getTotal_fee().intValue() > 0) {// 总金额
			string1 += "&total_fee=" + item.getTotal_fee();
		} else {
			System.out.println(item.getTotal_fee());
			throw new InvalidParamsException("total_fee");
		}
		
		string1 += "&trade_type=" + item.getTrade_type();
		
		logger.info("string1=\n" + string1);
		
		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();
		
		logger.info("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);
		
		logger.info("newSign==" + newSign);
		
		item.setSign(newSign);
		
		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
		xstream.alias("xml", item.getClass());
		String xml = xstream.toXML(item);
		
		return xml;
	}

	public static String getQrCodePaymentUrl(QrCodeRequest item, MchInfo mchInfo) {
		String nonce_str = RandomUtils.generateRandomString();
		String time_stamp = create_timestamp();
		String string1;
		
		// 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：
		if (StringUtils.isNotEmpty(item.getAppid())) {// 公众账号ID
			string1 = "appid=" + item.getAppid();
		} else {
			throw new InvalidParamsException("appid");
		}

		if (StringUtils.isNotEmpty(item.getMch_id())) {// 商户号
			string1 += "&mch_id=" + item.getMch_id();
		} else {
			throw new InvalidParamsException("mch_id");
		}
		string1 += "&nonce_str=" + nonce_str; // 随机字符串

		if (StringUtils.isNotEmpty(item.getProduct_id())) {//商品ID : 商户定义的商品id 或者订单号
			string1 += "&product_id=" + item.getProduct_id();
		} else {
			throw new InvalidParamsException("product_id");
		}
		 
		
		string1 += "&time_stamp=" + time_stamp; // 随机字符串

		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();

		logger.debug("stringSignTemp==\n" + stringSignTemp);
		String sign = EncryptUtils.MD5(stringSignTemp);

		logger.debug("sign==" + sign);
		
//		二维码中的内容为链接，形式为：
//		weixin：//wxpay/bizpayurl?sign=XXXXX&appid=XXXXX&mch_id=XXXXX&product_id=XXXXXX&time_stamp=XXXXXX&nonce_str=XXXXX
		StringBuffer sb = new StringBuffer();
		sb.append("weixin://wxpay/bizpayurl")
		  .append("?sign=").append(sign)
		  .append("&appid=").append(item.getAppid())
		  .append("&mch_id=").append(item.getMch_id())
		  .append("&product_id=").append(item.getProduct_id())
		  .append("&time_stamp=").append(time_stamp)
		  .append("&nonce_str=").append(nonce_str);
		
		logger.debug("link url ==>" + sb.toString());
//		item.setNonce_str(nonce_str);
//		item.setTime_stamp(time_stamp);
//		item.setSign(newSign);

//		XStream xstream = new XStream(new XppDriver(new XmlFriendlyNameCoder("_-", "_")));
//		xstream.alias("xml", item.getClass());
//		String xml = xstream.toXML(item);

		return sb.toString();
	}
	
	
	
	/**
	 * <h3>微信签名算法</h3>
	 * 
	 * @param String xml xml字符串
	 * @param String secretKey API密钥的值
	 * 
	 *            <h4>签名生成的通用步骤如下：</h4>
	 *            第一步，设所有发送或者接收到的数据为集合M，将集合M内非空参数值的参数按照参数名ASCII码从小到大排序（字典序），
	 *            使用URL键值对的格式（即key1=value1&key2=value2…）拼接成字符串stringA。<br>
	 * 
	 *            <h4>特别注意以下重要规则：</h4>
	 *            <ul>
	 *            <li>参数名ASCII码从小到大排序（字典序）；</li>
	 *            <li>如果参数的值为空不参与签名；</li>
	 *            <li>参数名区分大小写；</li>
	 *            <li>验证调用返回或微信主动通知签名时，传送的sign参数不参与签名，将生成的签名与该sign值作校验。</li>
	 *            <li>微信接口可能增加字段，验证签名时必须支持增加的扩展字段</li>
	 *            </ul>
	 * 
	 *            第二步，在stringA最后拼接上key=(API密钥的值)得到stringSignTemp字符串，
	 *            并对stringSignTemp进行MD5运算，再将得到的字符串所有字符转换为大写，得到sign值signValue。<br>
	 *            举例：<br>
	 *            <code>
	 * 假设传送的参数如下：<br>
	 * appid：	wxd930ea5d5a258f4f<br>
	 * mch_id：	10000100<br>
	 * device_info：1000<br>
	 * body：test<br>
	 * nonce_str：	ibuaiVcKdpRxkhJA<br>
	 * </code> 第一步：对参数按照key=value的格式，并按照参数名ASCII字典序排序如下：<br>
	 *            <code>
	 * stringA="appid=wxd930ea5d5a258f4f&body=test&device_info=1000&mch_id=10000100&nonce_str=ibuaiVcKdpRxkhJA";<br>
	 * </code> 第二步：拼接API密钥：<br>
	 *            <code>
	 * stringSignTemp="stringA&key=192006250b4c09247ec02edce69f6a2d"<br>
	 * sign=MD5(stringSignTemp).toUpperCase()="9A0A8659F005D6984697E2CA0A9CF3B7"<br>
	 * </code>
	 */
	@SuppressWarnings("unchecked")
	public static void checkSign(String xml, MchInfo mchInfo) {
		logger.info("responseXml==" + xml);
		Map<String, String> map = new TreeMap<String, String>();
		Document document;
		try {
			document = DocumentHelper.parseText(xml);
			// 得到xml根元素
			Element root = document.getRootElement();
			// 得到根元素的所有子节点
			List<Element> elementList = root.elements();
			// 遍历所有子节点
			for (Element e : elementList) {
				if (StringUtils.isNotEmpty(e.getText())) {
					map.put(e.getName(), e.getText());
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
			throw new InvalidSignException("xml解析错误! err_msg:" + e.getMessage());
		}

		String sign = map.get("sign");

		String string1 = "";
		int i = 0;
		for (Map.Entry<String, String> entry : map.entrySet()) {
			if ("sign".equals(entry.getKey()) || "key".equals(entry.getKey())) {
				continue;
			}

			if (i++ > 0) {
				string1 += "&";
			}

			string1 += entry.getKey() + "=" + entry.getValue();
			// System.out.println(entry.getKey()+"="+entry.getValue());
		}
		// System.out.println(string1);
		String stringSignTemp = string1 + "&key=" + mchInfo.getSecretKey();
		logger.info("stringSignTemp==\n" + stringSignTemp);
		String newSign = EncryptUtils.MD5(stringSignTemp);
		logger.info("sign=====" + sign);
		logger.info("newSign==" + newSign);

		if (!sign.equals(newSign)) {
			logger.error("签名信息无效 sign=" + sign + ",newSign=" + newSign);
			throw new InvalidSignException("签名信息无效 sign=" + sign + ",newSign=" + newSign);
		}

	}
	
	
	
	
	public static boolean verifyWechatResponseSign(String xml,String key){
		Map<String, String> map = null;
		try {
			map = XmlUtils.parseXml2Map(xml);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		String string1 = "";
		String sign = map.get(SIGN);
		
		Map<String,Object> treemap = new TreeMap<String,Object>();
        Set<Entry<String, String>> sets = map.entrySet();  
        for(Entry<String, String> entry : sets) {  
        	treemap.put(entry.getKey(), entry.getValue());
        }  
        Iterator<Entry<String, Object>> titer = treemap.entrySet().iterator();
        while(titer.hasNext()){  
            Map.Entry ent= (Map.Entry ) titer.next();
            
            String k = ent.getKey().toString();
            if(ent.getValue() == null){
            	continue;
            }
            String v = ent.getValue().toString();
            if(StringUtils.isBlank(v)){
            	continue;	
            }
            if(k.equals(SIGN)){
            	continue;
            }
            
            string1 += "&" + ent.getKey().toString() + "=" + ent.getValue().toString();
        }  
        string1 = string1.substring(1);
        
        String stringSignTemp = string1 + "&key=" + key;
//        String newSign = MD5(stringSignTemp);  
        String newSign = EncryptUtils.MD5(stringSignTemp);  
        
//        System.out.println("oldSign=" + sign);
//        System.out.println("newSign=" + newSign);
        
        logger.info("oldSign==" + sign);
        logger.info("newSign==" + newSign);
        
		return newSign.equals(sign);
		
	}
	 

	public static void main(String[] args) {
		
		
//		MchInfo mchInfo = new MchInfo();	
//		mchInfo.setSecretKey("aea79ad5bf514ab9bcdb18fbb6f522dc");
//		
//		OrderQueryRequest interfaceRequest = new OrderQueryRequest();
//		
//		interfaceRequest.setAppid(null);
//		interfaceRequest.setMch_id("222222");
//		interfaceRequest.setTransaction_id(null);
//		interfaceRequest.setOut_trade_no("dddd");
// 
//		try {
//			String xml = WeixinSignUtils.orderQueryRequestSign(interfaceRequest , mchInfo);
//			System.out.println(xml);
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		
//		
//		try {
//			String xml2 = WeixinSignUtils.orderQueryRequestSign2(interfaceRequest , mchInfo);
//			System.out.println(xml2);
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
		
		
		// System.out.println("-----------------------");
		//
		//
		// System.out.println("-----------------------");

//		MchInfo mchInfo = new MchInfo();	
//		mchInfo.setSecretKey("aea79ad5bf514ab9bcdb18fbb6f522dc");
//		
//	 
//		
//		String xml = "<xml><return_code><![CDATA[SUCCESS]]></return_code>" + "<return_msg><![CDATA[OK]]></return_msg>"
//				+ "<appid><![CDATA[wx51d650117c444974]]></appid>" + "<mch_id><![CDATA[10019315]]></mch_id>"
//				+ "<nonce_str><![CDATA[Nn6AFL1ApfryryNY]]></nonce_str>" + "<sign><![CDATA[3EA0EE7AEA659A92B77C0032521F6202]]></sign>"
//				+ "<result_code><![CDATA[SUCCESS]]></result_code>" + "<transaction_id><![CDATA[1008960499201503170032740450]]></transaction_id>"
//				+ "<out_trade_no><![CDATA[10055]]></out_trade_no>" + "<out_refund_no><![CDATA[10055]]></out_refund_no>"
//				+ "<refund_id><![CDATA[2008960499201503180001951935]]></refund_id>" + "<refund_channel><![CDATA[]]></refund_channel>"
//				+ "<refund_fee>1</refund_fee>" + "<coupon_refund_fee>0</coupon_refund_fee>" + "<total_fee>1</total_fee>"
//				+ "<coupon_refund_count>0</coupon_refund_count>" + "<cash_refund_fee>1</cash_refund_fee>" + "</xml>";
//
//		mchInfo.setSecretKey("aea79ad5bf514ab9bcdb18fbb6f522dc");
//		checkSign(xml, mchInfo);
		
		
	
		

		System.out.println("-----------------------");
		
//		public static String getQrCodePaymentUrl(QrCodeRequest item, MchInfo mchInfo) {
		
		
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
		WeixinService weixinService = ac.getBean(WeixinService.class);
		
		AppInfo appInfo = weixinService.selectAppInfoByShopId(8);
		MchInfo mchInfo = weixinService.selectMchInfoByShopId(appInfo.getShopId());
		
		QrCodeRequest request = new QrCodeRequest();
		request.setAppid(appInfo.getAppId());
		request.setMch_id(mchInfo.getMchId());
		request.setProduct_id("P10010110");
		 
		String url = getQrCodePaymentUrl(request,mchInfo);
		
		System.out.println("url=" + url);
		
		
		/*String xml = "<xml>"
				+ "<appid><![CDATA[wxf4ff15142f410758]]></appid>"
		+ "<openid><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></openid>"
		+ "<mch_id><![CDATA[1225226202]]></mch_id>"
		+ "<is_subscribe><![CDATA[Y]]></is_subscribe>"
		+ "<nonce_str><![CDATA[GJaf6TqebjVj5Qy2]]></nonce_str>"
		+ "<product_id><![CDATA[P10010110]]></product_id>"
		+ "<sign><![CDATA[EC69C6BB66F6A9F927F54CDA698A227E]]></sign>"
		+ "</xml>";
		checkSign(xml, mchInfo);*/
		
		
//		
//		private String appid;
//		private String mch_id;
//		private String time_stamp;
//		private String nonce_str;
//		private String product_id;
		  
		   
		   System.out.println("-----------------------");
		 
		/*
		 * PayRefundRequest pay = new PayRefundRequest();
		 * pay.setAppid("wx2421b1c4370ec43b"); pay.setMch_id("10000100");
		 * pay.setOp_user_id("op_user_id"); pay.setOut_refund_no("1415701182");
		 * pay.setOut_trade_no("1415757673"); pay.setRefund_fee(1);
		 * pay.setTotal_fee(1); pay.setTransaction_id("1234");
		 * 
		 * try { String xml = WeixinSignUtil.payRefundReqeustSign(pay, "111");
		 * System.out.println(xml); } catch (Exception e1) {
		 * e1.printStackTrace();
		 * 
		 * 
		 * }
		 * 
		 * System.out.println("-----------------------");
		 */

		// String src =
		// "appid=wxf4ff15142f410758&attach=支付测试&body=JSAPI支付测试&fee_type=CNY&mch_id=1225226202&nonce_str=B01Y5jNBjYLg0wWbBso1NUsgmUTnwu98&notify_url=waremec.com.cn&openid=o1yuEtw1PN5sc6W6Bxd7Q4hty2hY&out_trade_no=1423736998194waremec&spbill_create_ip=118.186.222.40&total_fee=1&trade_type=JSAPI&key=eX3fYhAbuJkLk80ZqF6sWmuzcDryulbR";
		// String sign = "05B851AE950F417B282540EB1D98880F";
		// String newSign = "";
		//
		// try {
		// // 生成一个MD5加密计算摘要
		// MessageDigest md = MessageDigest.getInstance("MD5");
		// // 计算md5函数
		// md.update(src.getBytes());
		// // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
		// // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
		// newSign = new BigInteger(1, md.digest()).toString(16).toUpperCase();
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		//
		// System.out.println("sign=====" + sign);
		// System.out.println("newSign==" + newSign);
		// System.out.println("newSign==" + EncryptUtils.MD5(src));

		// String jsapi_ticket =
		// "sM4AOVdWfPE4DxkXGEs8VJl-AIHkTEsq72jXJO0nU0I4fr90Yoatgqbkc7EyafQAtgc64s7l6PIuqAoGUxgAmw";
		// // 注意 URL 一定要动态获取，不能 hardcode
		// String url = "http://example.com";
		// System.out.println(sign(jsapi_ticket,url));

		/*
		 * String out_trade_no = System.currentTimeMillis() + "waremec"; String
		 * spbill_create_ip = "118.186.222.40";
		 * 
		 * PaySign sign = new PaySign(); sign.setAppid(APPID);
		 * sign.setMch_id(ACCOUNT); sign.setBody("JSAPI支付测试");
		 * sign.setAttach("支付测试"); sign.setOut_trade_no(out_trade_no);
		 * sign.setFee_type("CNY"); sign.setTotal_fee(1);
		 * sign.setSpbill_create_ip(spbill_create_ip);
		 * sign.setNotify_url("www.baidu.com"); sign.setOpenid(OPENID);
		 * 
		 * try { paySign(sign,APIKEY); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
	};

	private static String byteToHex(final byte[] hash) {
		Formatter formatter = new Formatter();
		for (byte b : hash) {
			formatter.format("%02x", b);
		}
		String result = formatter.toString();
		formatter.close();
		return result;
	}

	private static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

	private static String create_timestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	



}
