package com.waremec.weixin.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.logging.WeixinNotifyLog;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.pay.OrderBill;
import com.waremec.weixin.domain.pay.OrderPayInsert;
import com.waremec.weixin.domain.pay.OrderQueryRequest;
import com.waremec.weixin.domain.pay.OrderQueryResponse;
import com.waremec.weixin.domain.pay.PayCloseOrderRequest;
import com.waremec.weixin.domain.pay.PayCloseOrderResponse;
import com.waremec.weixin.domain.pay.PayDownloadbillRequest;
import com.waremec.weixin.domain.pay.PayDownloadbillResponse;
import com.waremec.weixin.domain.pay.PayRefundInsert;
import com.waremec.weixin.domain.pay.PayRefundQueryRequest;
import com.waremec.weixin.domain.pay.PayRefundQueryResponse;
import com.waremec.weixin.domain.pay.PayRefundRequest;
import com.waremec.weixin.domain.pay.PayRefundResponse;
import com.waremec.weixin.domain.pay.PaySign;
import com.waremec.weixin.domain.pay.PaySignInfo;
import com.waremec.weixin.domain.pay.PaymentNotify;
import com.waremec.weixin.domain.pay.SendRedPackRequest;
import com.waremec.weixin.domain.pay.SendRedPackResponse;
import com.waremec.weixin.domain.pay.UnifiedOrderResponse;
import com.waremec.weixin.domain.pay.WeixinOrderInfo;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.exception.WeixinErrorException;
import com.waremec.weixin.exception.WeixinPayUnifiedOrderException;
import com.waremec.weixin.utils.IPUtils;
import com.waremec.weixin.utils.PayBillUtils;
import com.waremec.weixin.utils.PaymentErrorCode;
import com.waremec.weixin.utils.PaymentUtils;
import com.waremec.weixin.utils.ServletRequestUtils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.weixin.utils.XmlUtils;
import com.waremec.wpt.front.service.EventService;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinPayAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:05:16 
*  
*/
@Controller("weixinPayAction")
@Scope(ScopeType.prototype)
public class WeixinPayAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	
	private final transient Log logger = LogFactory.getLog(this.getClass());
	private final transient Log notifyLogger = LogFactory.getLog(WeixinNotifyLog.class);
	
	

	@Resource
	EventService eventService;
	
	private static final String CHARSET = "UTF-8";
	private static final String PAY_NORMAL = "NOR";
	private static final String PAY_REFUND = "RFD"; 

	/**
	 * <h1>统一下单</h1>
	*	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>除被扫支付场景以外，商户系统先调用该接口在微信支付服务后台生成预支付交易单，返回正确的预支付交易回话标识后再按扫码、JSAPI、APP等不同场景生成交易串调起支付</dd>
	 *		<dt>是否需要证书</dt>
	 *			<dd>不需要</dd>
	 *	</dl>	
	 */
	private static final String PAY_UNIFED_ORDER_URL 	= "https://api.mch.weixin.qq.com/pay/unifiedorder";
	/**
	 * <h1>查询订单</h1>
	 *	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>该接口提供所有微信支付订单的查询，商户可以通过该接口主动查询订单状态，完成下一步的业务逻辑。</dd>
	 *		<dt>需要调用查询接口的情况：</dt>
	 *			<dd>当商户后台、网络、服务器等出现异常，商户系统最终未接收到支付通知；</dd>
	 *	  		<dd>调用支付接口后，返回系统错误或未知交易状态情况；</dd>
	 *	  		<dd>调用被扫支付API，返回USERPAYING的状态；</dd>
	 *	  		<dd>调用关单或撤销接口API之前，需确认支付状态；</dd>
	 *		<dt>是否需要证书</dt>
	 *			<dd>不需要</dd>
	 *	</dl>	
	 */
	private static final String PAY_ORDER_QUERY_URL 		= "https://api.mch.weixin.qq.com/pay/orderquery";
	/**
	 * <h1>关闭订单</h1>
	 *	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>以下情况需要调用关单接口：商户订单支付失败需要生成新单号重新发起支付，要对原订单号调用关单，  避免重复支付；系统下单后，用户支付超时，系统退出不再受理，避免用户继续，请调用关单接口。</dd>
	 *		<dt>是否需要证书</dt>
	 *			<dd>不需要</dd>
	 *	</dl>
	 */
	private static final String PAY_CLOSE_ORDER_URL 		= "https://api.mch.weixin.qq.com/pay/closeorder";
	/**
	 * <h1>申请退款</h1>
	 *	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>当交易发生之后一段时间内，由于买家或者卖家的原因需要退款时，卖家可以通过退款接口将支付款退还给买家，<br>
					微信支付将在收到退款请求并且验证成功之后，按照退款规则将支付款按原路退到买家帐号上。</dd>
	 *		<dt>注意：</dt>
	 *			<dd>1.交易时间超过半年的订单无法提交退款；</dd>
	 *			<dd>2.微信支付退款支持单笔交易分多次退款，多次退款需要提交原支付订单的商户订单号和设置不同的退款单号。 
	   				一笔退款失败后重新提交，要采用原来的退款单号。总退款金额不能超过用户实际支付金额。</dd>
	 *		<dt>是否需要证书</dt>
	 *			<dd>请求需要双向证书。</dd>
	 *	</dl>
	 */
	private static final String PAY_REFUND_URL 			= "https://api.mch.weixin.qq.com/secapi/pay/refund";
	/**
	 * <h1>查询退款</h1>
	 * 	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>提交退款申请后，通过调用该接口查询退款状态。退款有一定延时，用零钱支付的退款20分钟内到账， 
					银行卡支付的退款3个工作日后重新查询退款状态。</dd>
	 *		<dt>是否需要证书</dt>
	 *			<dd>不需要</dd>				
	 *	</dl>
	 */
	private static final String PAY_REFUND_QUERY_URL 	= "https://api.mch.weixin.qq.com/pay/refundquery";
	/**
	 * 	<h1>下载对账单</h1>
	 *	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>商户可以通过该接口下载历史交易清单。比如掉单、系统错误等导致商户侧和微信侧数据不一致，通过对账单核对后可校正支付状态。</dd>
	 *		<dt>注意：</dt>
	 *			<dd>1.微信侧未成功下单的交易不会出现在对账单中。支付成功后撤销的交易会出现在对账单中，跟原支付单订单号一致，bill_type为REVOKED；</dd>
	 *			<dd>2.微信在次日9点启动生成前一天的对账单，建议商户10点后再获取； </dd>
	 *			<dd>3.对账单中涉及金额的字段单位为“元”。</dd>
	 *		<dt>是否需要证书</dt>
	 *			<dd>不需要</dd>
	 *	</dl>
	 */
	private static final String PAY_DOWNLOAD_BILL_URL 	= "https://api.mch.weixin.qq.com/pay/downloadbill";
	/**
	 * 	<h1>测速上报</h1>
	 *	<dl>
	 *		<dt>应用场景</dt>
	 *			<dd>商户在调用微信支付提供的相关接口时，会得到微信支付返回的相关信息以及获得整个接口的响应时间。为提高整体的服务水平，协助商户一起提高服务质量，微信支付提供了相关接口调用耗时和返回信息的主动上报接口，微信支付可以根据商户侧上报的数据进一步优化网络部署，完善服务监控，和商户更好的协作为用户提供更好的业务体验。</dd>
	 *		<dt>是否需要证书</dt>
	 *		<dd>不需要</dd>
	 *	</dl>
	 */
	private static final String PAYITIL_REPORT_URL 		= "https://api.mch.weixin.qq.com/payitil/report";
	/**
	 * 
	 */
	private static final String SENDREDPACK 			= "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack";
	
	public String index() throws Exception {
		return "index";
	}
	
	public String paymentNotify() throws Exception {
		logger.info("=========================== paymentNotify start ===========================");
		notifyLogger.info("=========================== paymentNotify start ===========================");

		String returnXml = "";

		try {
			String xml = ServletRequestUtils.readStreamParameter(getRequest());

			logger.info("weixin Payment Notify Post Data ==" + xml);
			notifyLogger.info("weixin Payment Notify Post Data ==" + xml);

//			PaymentNotify paymentNotify = XmlUtils.parseXml2PaymentNotify(xml);
			PaymentNotify paymentNotify = XmlUtils.parseXml2Obj(xml, PaymentNotify.class);
			String key = paymentNotify.getKey();
			
			AppInfo appInfo 	= weixinService.selectAppInfoByKey(key);
			MchInfo mchInfo 	= weixinService.selectMchInfoByKey(key);

			OrderPayInsert orderPay = new OrderPayInsert();
			
			Integer shopId 		= IntegerUtils.valueOf(getAttachInfo(paymentNotify.getAttach(), "shopId"));
			Integer total_fee 	= IntegerUtils.valueOf(getAttachInfo(paymentNotify.getAttach(), "total_fee"));
			Integer orderId 	= IntegerUtils.valueOf(getAttachInfo(paymentNotify.getAttach(), "orderId"));

//			paymentNotify.setTotal_fee(total + "");
//			paymentNotify.setCash_fee(total + "");

			orderPay.setCustSysId(null);
			orderPay.setShopId(shopId);
			orderPay.setOrderId(orderId);
			orderPay.setPayment(paymentNotify);

			Map<String, Object> resultMap = weixinOrderService.saveNotifyOrder(orderPay);

			String errMsg = (String) resultMap.get("OUT_ERR_MSG");
			logger.info("DB处理结果=" + errMsg);
			notifyLogger.error("DB处理结果=" + errMsg);
			if ("S".equals(errMsg)) {
				returnXml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
			} else {
				String msg = "DB处理结果=" + errMsg + ",orderId=" + orderId;
				throw new Exception(msg);
			}

		} catch (Exception e) {
			logger.error("paymentNotify>>>" + e.getMessage());
			notifyLogger.error("paymentNotify>>>" + e.getMessage());
			returnXml = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[" + e.getMessage() + "]]></return_msg></xml>";
		}
		logger.info("returnXml=" + returnXml);
		notifyLogger.info("returnXml=" + returnXml);
		request.put("result", returnXml);
		logger.info("=========================== paymentNotify end ===========================");
		notifyLogger.info("=========================== paymentNotify end ===========================");
		return "paymentNotify";
	}
	public String paymentNotify2() throws Exception {
		logger.info("=========================== paymentNotify2 start ===========================");
		notifyLogger.info("=========================== paymentNotify2 start ===========================");
		
		String returnXml = "";
		
		try {
			String xml = ServletRequestUtils.readStreamParameter(getRequest());
			
			logger.info("weixin Payment Notify Post Data ==" + xml);
			notifyLogger.info("weixin Payment Notify Post Data ==" + xml);
			
//			PaymentNotify paymentNotify = XmlUtils.parseXml2PaymentNotify(xml);
			PaymentNotify paymentNotify = XmlUtils.parseXml2Obj(xml, PaymentNotify.class);
			String key = paymentNotify.getKey();
			
			AppInfo appInfo 	= weixinService.selectAppInfoByKey(key);
			MchInfo mchInfo 	= weixinService.selectMchInfoByKey(key);
			
			OrderPayInsert orderPay = new OrderPayInsert();
			
			Integer shopId 		= IntegerUtils.valueOf(getAttachInfo(paymentNotify.getAttach(), "shopId"));
			Integer total_fee 	= IntegerUtils.valueOf(getAttachInfo(paymentNotify.getAttach(), "total_fee"));
			Integer orderId 	= IntegerUtils.valueOf(getAttachInfo(paymentNotify.getAttach(), "orderId"));
			
//			paymentNotify.setTotal_fee(total + "");
//			paymentNotify.setCash_fee(total + "");
			
			orderPay.setCustSysId(null);
			orderPay.setShopId(shopId);
			orderPay.setOrderId(orderId);
			orderPay.setPayment(paymentNotify);
			
			Map<String, Object> resultMap = weixinOrderService.saveNotifyOrder(orderPay);
			
			String errMsg = (String) resultMap.get("OUT_ERR_MSG");
			logger.info("DB处理结果=" + errMsg);
			notifyLogger.error("DB处理结果=" + errMsg);
			if ("S".equals(errMsg)) {
				returnXml = "<xml><return_code><![CDATA[SUCCESS]]></return_code><return_msg><![CDATA[OK]]></return_msg></xml>";
			} else {
				String msg = "DB处理结果=" + errMsg + ",orderId=" + orderId;
				throw new Exception(msg);
			}
			
		} catch (Exception e) {
			logger.error("paymentNotify>>>" + e.getMessage());
			notifyLogger.error("paymentNotify>>>" + e.getMessage());
			returnXml = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[" + e.getMessage() + "]]></return_msg></xml>";
		}
		logger.info("returnXml=" + returnXml);
		notifyLogger.info("returnXml=" + returnXml);
		request.put("result", returnXml);
		logger.info("=========================== paymentNotify2 end ===========================");
		notifyLogger.info("=========================== paymentNotify2 end ===========================");
		return "paymentNotify2";
	}

	/**
	 * 公众号支付-统一下单接口 - mobile
	 * @return
	 */
	public String payment() {

		logger.info("=========================== payment start ===========================");
		
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			
			request.put("isWeixinBrowser", isWeixinBrowser());
			request.put("isAndroid", isAndroid());
			
			Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			request.put("shopId", shopId);
			request.put("orderId", orderId);
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			/////////
			String url = getFullUrl();
//			logger.info("fullUrl=========" + url);

			String ticket = weixinService.getApiTicket(appInfo);
//			logger.info("ticket==========" + ticket);
			//生成JS-SDK权限验证的签名
			if (StringUtils.isNotEmpty(ticket)) {
				request.put("signInfo", WeixinSignUtils.sign(ticket, url));
			}

			request.put("appInfo", appInfo);
			/////////
			
			Map<String,Object> map = new HashMap<String,Object>();
//			map.put("CUST_SYS_ID", custSysId);
//			map.put("SHOP_ID", shopId);
			map.put("ORDER_ID", orderId);
			map.put("JOB_TYPE", PAY_NORMAL);
			
			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(map);
			
			getRequest().setAttribute("orderInfo", orderInfo);
			
			Integer total_fee 		= orderInfo.getTotal_fee();
			String total_fee2 		= orderInfo.getTotal_fee2(); 
			String custOrderId 		= orderInfo.getCustOrderId();
			String shopNm 			= orderInfo.getShopNm();
			String out_trade_no	 	= orderInfo.getOut_trade_no();
			String spbill_create_ip = getRequest().getRemoteAddr();
			String feeType 			= "CNY";
			String nofityUrl 		=  appInfo.getDomain() + "/wx/pay/paymentNotify.htm?key=" + appInfo.getSysId();
 			String oepnid 			= getRequest().getParameter("o");
			String body 			= orderInfo.getBody();
			
			Map<String,String> attachMap = new HashMap<String, String>();
			if(shopId != null){
				attachMap.put("shopId", shopId +"");
			}
			if(total_fee != null){
				attachMap.put("total_fee", total_fee +"");
			}
			if(orderId != null){
				attachMap.put("orderId", orderId +"");
			}
			
			String attach 			= setAttachInfo(attachMap);
			
			
			
			if(StringUtils.isEmpty(appInfo.getSysId())){
				logger.error("error01:sysId为空");
				throw new Exception("error01:sysId为空");
			}
			if(StringUtils.isEmpty(oepnid)){
				logger.error("error02:oepnid为空");
				throw new Exception("error02:oepnid为空");
			}

			logger.info("total_fee=========" + total_fee);
			logger.info("out_trade_no======" + out_trade_no);
			logger.info("spbill_create_ip==" + spbill_create_ip);
			logger.info("nofityUrl=========" + nofityUrl);
			logger.info("feeType===========" + feeType);
			logger.info("oepnid============" + oepnid);
			logger.info("body==============" + body);
			logger.info("attach============" + attach);
			logger.info("custOrderId=======" + custOrderId);
			logger.info("shopNm============" + shopNm);

//			getRequest().setAttribute("total_fee", 		total_fee);
//			getRequest().setAttribute("total_fee2", 	total_fee2);
//			getRequest().setAttribute("custOrderId", 	custOrderId);
//			getRequest().setAttribute("shopNm", 		shopNm);

			PaySign sign = new PaySign();
			sign.setAppid(appInfo.getAppId());
			sign.setMch_id(mchInfo.getMchId());
			sign.setBody(body);
			sign.setAttach(attach);
			sign.setOut_trade_no(out_trade_no);
			sign.setFee_type(feeType);
//			sign.setTotal_fee(1);
			sign.setTotal_fee(total_fee);
			sign.setSpbill_create_ip(spbill_create_ip);
			sign.setNotify_url(nofityUrl);
			sign.setOpenid(oepnid);

			String xml = WeixinSignUtils.paySign(sign, mchInfo);

			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);

			HttpPost httppost = new HttpPost(PAY_UNIFED_ORDER_URL);
			logger.info("-----------------unifiedorder request start-----------------------");
			logger.info("executing request:" + httppost.getRequestLine());
			logger.info("POST Data=\n" + xml);

			httppost.setEntity(new StringEntity(xml,CHARSET));

			response = httpclient.execute(httppost);

			logger.info("-----------------unifiedorder request end-----------------------");
			HttpEntity entity = response.getEntity();
//			StringBuffer results = new StringBuffer();
			String result = "";
			logger.info("-----------------unifiedorder response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}*/
//				logger.info("Response content:\n" + results.toString());
				result = EntityUtils.toString(entity, CHARSET);
				logger.info("Response content:\n" +result);
				logger.info("-----------------unifiedorder response end-----------------------");
			}
			EntityUtils.consume(entity);

//			UnifiedOrderResponse interfaceResponse = XmlUtils.parseXml2UnifiedOrderResponse(result);
			UnifiedOrderResponse interfaceResponse = XmlUtils.parseXml2Obj(result, UnifiedOrderResponse.class);
			logger.info(interfaceResponse.toString());

			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				String prepay_id = interfaceResponse.getPrepay_id();
				logger.info("prepay_id=" + prepay_id);
				PaySignInfo paySignInfo = WeixinSignUtils.sign(appInfo, mchInfo ,"prepay_id=" + prepay_id);
				request.put("paySignInfo", paySignInfo);

			} else {
				logger.error("-----------------payment error-----------------------");
				if(interfaceResponse.getReturn_code().equals("FAIL")){ 
					throw new Exception(interfaceResponse.getReturn_msg());
				}else if(interfaceResponse.getResult_code().equals("FAIL")){
					String errorCode = interfaceResponse.getErr_code();
					logger.error("err_code===" + errorCode);
					logger.error("err_msg====" + interfaceResponse.getReturn_msg());
					logger.error("desc=======" + PaymentErrorCode.getDesc(errorCode));
					logger.error("reason=====" + PaymentErrorCode.getReason(errorCode));
					logger.error("method=====" + PaymentErrorCode.getMethod(errorCode));
					throw new WeixinPayUnifiedOrderException(interfaceResponse.getErr_code());
				}else{
					throw new Exception("cuowu");
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			request.put("err_msg", e.getMessage());
			return "paymentError";
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		logger.info("=========================== payment end ===========================");
		return "payment";
	}
	
	/**
	 * 微信重新下单功能 - 失效时间20150427
	 * 与payment合并
	 * @return
	 * @deprecated
	 */
	public String repayment(){
		
		logger.info("=========================== repayment start ===========================");
		
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			
			request.put("isWeixinBrowser", isWeixinBrowser());
			request.put("isAndroid", isAndroid());
			
			Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			request.put("shopId", shopId);
			request.put("orderId", orderId);
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);
			
			///////
			String url = getFullUrl();
			logger.info("fullUrl=========" + url);

			String ticket = weixinService.getApiTicket(appInfo);
			logger.info("ticket==========" + ticket);
			if (StringUtils.isNotEmpty(ticket)) {
				request.put("signInfo", WeixinSignUtils.sign(ticket, url));
			}

			request.put("appInfo", appInfo);
			///////
			
			Map<String,Object> map = new HashMap<String,Object>();
//			map.put("CUST_SYS_ID", 	custSysId);
//			map.put("SHOP_ID", 		shopId);
			map.put("ORDER_ID", 	orderId);
			map.put("JOB_TYPE", 	PAY_NORMAL);
			
			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(map);
			
			getRequest().setAttribute("orderInfo", orderInfo);
			
//			Integer totalPrice 		= IntegerUtils.valueOf((new DecimalFormat("#.00").format(Double.valueOf(totalPrice2))).replaceAll("\\.", ""));
			Integer total_fee 		= orderInfo.getTotal_fee();
			String total_fee2 		= orderInfo.getTotal_fee2(); 
			String custOrderId 		= orderInfo.getCustOrderId();
			String shopNm 			= orderInfo.getShopNm();

			String out_trade_no	 	= orderInfo.getOut_trade_no();
			String spbill_create_ip = getRequest().getRemoteAddr();
			String feeType 			= "CNY";
			String nofityUrl 		= appInfo.getDomain() + "/wx/pay/paymentNotify.htm?key=" + appInfo.getSysId();
 			String oepnid 			= getRequest().getParameter("o");
			String body 			= orderInfo.getBody();
			
			Map<String,String> attachMap = new HashMap<String, String>();
			if(shopId != null){
				attachMap.put("shopId", shopId +"");
			}
			if(total_fee != null){
				attachMap.put("total_fee", total_fee +"");
			}
			if(orderId != null){
				attachMap.put("orderId", orderId +"");
			}
			
			String attach 			= setAttachInfo(attachMap);

			if(StringUtils.isEmpty(appInfo.getSysId())){
				logger.error("error01:sysId为空");
				throw new Exception("error01:sysId为空");
			}
			if(StringUtils.isEmpty(oepnid)){
				logger.error("error02:oepnid为空");
				throw new Exception("error02:oepnid为空");
			}
			
			logger.info("total_fee=========" + total_fee);
			logger.info("out_trade_no======" + out_trade_no);
			logger.info("spbill_create_ip==" + spbill_create_ip);
			logger.info("nofityUrl=========" + nofityUrl);
			logger.info("feeType===========" + feeType);
			logger.info("oepnid============" + oepnid);
			logger.info("body==============" + body);
			logger.info("attach============" + attach);
			logger.info("custOrderId=======" + custOrderId);
			logger.info("shopNm============" + shopNm);

//			getRequest().setAttribute("orderId", 		orderId);
//			getRequest().setAttribute("total_fee", 		total_fee);
//			getRequest().setAttribute("total_fee2", 	total_fee2);
//			getRequest().setAttribute("custOrderId", 	custOrderId);
//			getRequest().setAttribute("shopNm", 		shopNm);

			PaySign sign = new PaySign();
			sign.setAppid(appInfo.getAppId());
			sign.setMch_id(mchInfo.getMchId());
			sign.setBody(body);
			sign.setAttach(attach);
			sign.setOut_trade_no(out_trade_no);
			sign.setFee_type(feeType);
//			sign.setTotal_fee(1);
			sign.setTotal_fee(total_fee);
			sign.setSpbill_create_ip(spbill_create_ip);
			sign.setNotify_url(nofityUrl);
			sign.setOpenid(oepnid);

			String xml = WeixinSignUtils.paySign(sign, mchInfo);

			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------unifiedorder2 request start-----------------------");
			HttpPost httppost = new HttpPost(PAY_UNIFED_ORDER_URL);
			logger.info("executing request:" + httppost.getRequestLine());
		 
			logger.info("POST Data=" + xml);

			httppost.setEntity(new StringEntity(xml, CHARSET));

			response = httpclient.execute(httppost);
			logger.info("-----------------unifiedorder2 request end-----------------------");
			HttpEntity entity = response.getEntity();
//			StringBuffer results = new StringBuffer();
			String result = "";
			logger.info("-----------------unifiedorder2 response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}

				logger.info("Response content:\n" + results.toString());*/
				result = EntityUtils.toString(entity, CHARSET);

				logger.info("Response content:\n" + result);
				
				logger.info("-----------------unifiedorder2 response end-----------------------");
			}
			EntityUtils.consume(entity);

//			UnifiedOrderResponse interfaceResponse = XmlUtils.parseXml2UnifiedOrderResponse(result);
			UnifiedOrderResponse interfaceResponse = XmlUtils.parseXml2Obj(result, UnifiedOrderResponse.class);
			logger.info(interfaceResponse.toString());

			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				String prepay_id = interfaceResponse.getPrepay_id();
				logger.info("prepay_id=" + prepay_id);
				PaySignInfo paySignInfo = WeixinSignUtils.sign(appInfo, mchInfo ,"prepay_id=" + prepay_id);
				
				request.put("paySignInfo", paySignInfo);

			} else {
				logger.error("-----------------payment error-----------------------");
				
				if(interfaceResponse.getResult_code().equals("FAIL")){
					String errorCode = interfaceResponse.getErr_code();
					logger.error("err_code===" + errorCode);
					logger.error("err_msg====" + interfaceResponse.getReturn_msg());
					logger.error("desc=======" + PaymentErrorCode.getDesc(errorCode));
					logger.error("reason=====" + PaymentErrorCode.getReason(errorCode));
					logger.error("method=====" + PaymentErrorCode.getMethod(errorCode));
					throw new WeixinPayUnifiedOrderException(interfaceResponse.getErr_code());
				}else{
					throw new Exception(interfaceResponse.getReturn_msg());
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			request.put("err_msg", e.getMessage());

			return "paymentError";
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		
		logger.info("=========================== repayment start ===========================");
		
		return "payment";
	}
	
	
	
	 public String qrpaynoti() throws UnsupportedEncodingException {
		 logger.info("(((((((((((((((((((((((((((((");
		 
		String postData= ServletRequestUtils.readStreamParameter(getRequest());
		logger.info("postData==>" +  postData);
		
		
//		<xml>
//		<appid><![CDATA[wxf4ff15142f410758]]></appid>
//		<openid><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></openid>
//		<mch_id><![CDATA[1225226202]]></mch_id>
//		<is_subscribe><![CDATA[Y]]></is_subscribe>
//		<nonce_str><![CDATA[GJaf6TqebjVj5Qy2]]></nonce_str>
//		<product_id><![CDATA[P10010110]]></product_id>
//		<sign><![CDATA[EC69C6BB66F6A9F927F54CDA698A227E]]></sign>
//		</xml>
		
		postData = "<xml>"
				+ "<appid><![CDATA[wxf4ff15142f410758]]></appid>"
				+ "<openid><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></openid>"
				+ "<mch_id><![CDATA[1225226202]]></mch_id>"
				+ "<is_subscribe><![CDATA[Y]]></is_subscribe>"
				+ "<nonce_str><![CDATA[GJaf6TqebjVj5Qy2]]></nonce_str>"
				+ "<product_id><![CDATA[P10010110]]></product_id>"
				+ "<sign><![CDATA[EC69C6BB66F6A9F927F54CDA698A227E]]></sign>"
				+ "</xml>";
		
		
		
		// 调用parseXml方法解析xml格式请求消息到map里
		try {
			Map<String,String> requestMap = XmlUtils.parseXml2Map(postData);
			
			String appid 	 	 = requestMap.get("appid");	// 
			String openid 		 = requestMap.get("openid");	// 
			String mch_id 	 	 = requestMap.get("mch_id");	// 
			String is_subscribe  = requestMap.get("is_subscribe");	// 
			String nonce_str 	 = requestMap.get("nonce_str");	// 
			String product_id 	 = requestMap.get("product_id");	// 
			
			logger.info("appid========" + appid);
			logger.info("openid=======" + openid);
			logger.info("mch_id=======" + mch_id);
			logger.info("is_subscribe=" + is_subscribe);
			logger.info("nonce_str====" + nonce_str);
			logger.info("product_id===" + product_id);
			
			
			AppInfo appInfo = weixinService.selectAppInfoByAppId(appid);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(appInfo.getShopId());
			//验证数据有效性
			WeixinSignUtils.checkSign(postData, mchInfo);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("###############################################################");
		 
		
		 
		 
		 return NONE;
	 }
	
	
	
	
	
	/**
	 * 
	 * 	应用场景
	 * 		该接口提供所有微信支付订单的查询，商户可以通过该接口主动查询订单状态，完成下一步的业务逻辑。
	 *	需要调用查询接口的情况：
	 * 		◆　当商户后台、网络、服务器等出现异常，商户系统最终未接收到支付通知；
	 * 		◆　调用支付接口后，返回系统错误或未知交易状态情况；
	 * 		◆　调用被扫支付API，返回USERPAYING的状态；
	 * 		◆　调用关单或撤销接口API之前，需确认支付状态；
	 * 
	 * @return
	 */
	public String orderquery(){
		
		logger.info("=========================== orderquery start ===========================");
		
		boolean success = true;
		String err_msg = "";

		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			Integer shopId = getBackSessionShopId();

			logger.info("shopId=" + shopId);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
 
			String userId =getBackSessionUserId();

			if (orderId == null) {
				logger.error("orderId不存在");
				throw new Exception("orderId不存在");
			}
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			
			//从数据库获取订单信息
			Map<String,Object> orderMap = new HashMap<String,Object>();
			orderMap.put("CUST_SYS_ID", null);
			orderMap.put("SHOP_ID", 	shopId);
			orderMap.put("ORDER_ID", 	orderId);
			orderMap.put("JOB_TYPE", 	PAY_NORMAL);
			
			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(orderMap);
			
			//Logging 
			String transaction_id 	= orderInfo.getTransaction_id() ;
			String out_trade_no 	= orderInfo.getOut_trade_no() ; 
			
			logger.info("appid===========" + appInfo.getAppId());
			logger.info("mch_id==========" + mchInfo.getMchId());
			logger.info("transaction_id==" + transaction_id);
			logger.info("out_trade_no====" + out_trade_no);
			
			
			OrderQueryRequest interfaceRequest = new OrderQueryRequest();
			
			interfaceRequest.setAppid(appInfo.getAppId());
			interfaceRequest.setMch_id(mchInfo.getMchId());
			interfaceRequest.setTransaction_id(transaction_id);
			interfaceRequest.setOut_trade_no(out_trade_no);
	 
			String xml = WeixinSignUtils.orderQueryRequestSign(interfaceRequest , mchInfo);
 
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------orderquery request start-----------------------");
			HttpPost httppost = new HttpPost(PAY_ORDER_QUERY_URL);
			logger.info("executing request:" + httppost.getRequestLine());

			logger.info("POST Data=\n" + xml);

		//	httppost.setEntity(new StringEntity(xml));
			
 			httppost.setEntity(new StringEntity(xml,CHARSET));
 			
// 			System.out.println(EntityUtils.getContentCharSet(httppost.getEntity()));

			response = httpclient.execute(httppost);
			logger.info("-----------------orderquery request end-----------------------");
			HttpEntity entity = response.getEntity();
			
			String result = "";
			logger.info("-----------------orderquery response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}*/
				
				result = EntityUtils.toString(entity, CHARSET);

				logger.info("Response content:\n" + result);
				logger.info("-----------------orderquery response end-----------------------");
			}
			EntityUtils.consume(entity);
			
			
//			OrderQueryResponse interfaceResponse = XmlUtils.parseXml2OrderQueryResponse(result);
			OrderQueryResponse interfaceResponse = XmlUtils.parseXml2Obj(result, OrderQueryResponse.class);
			
			logger.info(interfaceResponse);
			

			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				
				WeixinSignUtils.checkSign(result, mchInfo);
				 // success
				String trade_state = interfaceResponse.getTrade_state();
				 
				Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 rtnMap.put("success", true);
				 rtnMap.put("data", interfaceResponse.toString());
				 rtnMap.put("trade_state", trade_state);
				 
				 renderJSON(rtnMap);
				 logger.info("=========================== orderquery end ===========================");
				return NONE;
				
			} else {
				//error
				logger.error("-----------------orderquery error-----------------------");
				if(interfaceResponse.getReturn_code().equals("FAIL")){
					 throw new WeixinErrorException(interfaceResponse.getReturn_msg());
				}else{
					throw new WeixinErrorException(interfaceResponse.getErr_code_des());
				}
			}
			
		}catch (WeixinErrorException e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();

		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 logger.info("=========================== orderquery end ===========================");
		return NONE;
		
	}
	
	/**
	 * 关闭订单
	 * @return
	 */
	public String closeorder(){
		logger.info("=========================== closeorder start ===========================");
		
		boolean success = true;
		String err_msg = "";

		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			Integer shopId = getBackSessionShopId();

			logger.info("shopId=" + shopId);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			Integer orderId 	= IntegerUtils.valueOf(getRequest().getParameter("orderId"));
 
			String userId =getBackSessionUserId();

			if (orderId == null) {
				logger.error("orderId不存在");
				throw new Exception("orderId不存在");
			}
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			
			//从数据库获取订单信息
			Map<String,Object> orderMap = new HashMap<String,Object>();
			orderMap.put("CUST_SYS_ID", null);
			orderMap.put("SHOP_ID", 	shopId);
			orderMap.put("ORDER_ID", 	orderId);
			orderMap.put("JOB_TYPE", 	PAY_NORMAL);
			
			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(orderMap);
			
			//Logging 
 			String out_trade_no 	= orderInfo.getOut_trade_no() ;
			//for test 
			logger.info("appid===========" + appInfo.getAppId());
			logger.info("mch_id==========" + mchInfo.getMchId());
			logger.info("out_trade_no====" + out_trade_no);
			
			
			PayCloseOrderRequest interfaceRequest = new PayCloseOrderRequest();
			
			interfaceRequest.setAppid(appInfo.getAppId());
			interfaceRequest.setMch_id(mchInfo.getMchId());
			interfaceRequest.setOut_trade_no(out_trade_no);
	 
			String xml = WeixinSignUtils.payCloseOrderRequestSign(interfaceRequest , mchInfo);
 
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------closeorder request start-----------------------");
			HttpPost httppost = new HttpPost(PAY_CLOSE_ORDER_URL);
			logger.info("executing request:" + httppost.getRequestLine());

			logger.info("POST Data=\n" + xml);

			httppost.setEntity(new StringEntity(xml, CHARSET));

			response = httpclient.execute(httppost);
			logger.info("-----------------closeorder request end-----------------------");
			HttpEntity entity = response.getEntity();
//			StringBuffer results = new StringBuffer();
			String result = "";
			logger.info("-----------------closeorder response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}

				logger.info("Response content:\n" + results.toString());*/
				result = EntityUtils.toString(entity, CHARSET);

				logger.info("Response content:\n" + result);
				logger.info("-----------------closeorder response end-----------------------");
			}
			EntityUtils.consume(entity);
			
			
			WeixinSignUtils.checkSign(result, mchInfo);
			
//			PayCloseOrderResponse interfaceResponse = XmlUtils.parseXml2PayCloseOrderResponse(result);
			PayCloseOrderResponse interfaceResponse = XmlUtils.parseXml2Obj(result, PayCloseOrderResponse.class);
			
			logger.info(interfaceResponse);
			

			if (interfaceResponse.getReturn_code().equals("SUCCESS") ) {
				 // success
				 
				Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 rtnMap.put("success", true);
				 rtnMap.put("data", interfaceResponse.toString());
				 
				 renderJSON(rtnMap);
				 logger.info("=========================== closeorder end ===========================");
				return NONE;
				
			} else {
				//error
				logger.error("-----------------closeorder error-----------------------");
				 throw new WeixinErrorException(interfaceResponse.getErr_code_des());
				 
				//getRequest().setAttribute("err_msg", uor.getReturn_msg());

			 
			}
			
		}catch (WeixinErrorException e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();

		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 logger.info("=========================== orderquery end ===========================");
		return NONE;
	}
	
	/**
	 * 申请退款
	 * @return
	 */
	public String payrefund(){
		
		logger.info("=========================== payrefund start ===========================");
		
		boolean success = true;
		String err_msg = "";

		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			Integer shopId = getBackSessionShopId();

			logger.info("shopId=" + shopId);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			Integer orderId 	= IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			Integer custSysId 	= IntegerUtils.valueOf(getRequest().getParameter("custSysId"));
			String userId =getBackSessionUserId();

			if (orderId == null) {
				logger.error("orderId不存在");
				throw new Exception("orderId不存在");
			}
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			if (custSysId == null) {
				logger.error("custSysId不存在");
				throw new Exception("custSysId不存在");
			}
			
			//从数据库获取订单信息
			Map<String,Object> orderMap = new HashMap<String,Object>();
			orderMap.put("CUST_SYS_ID", null);
			orderMap.put("SHOP_ID", 	shopId);
			orderMap.put("ORDER_ID", 	orderId);
			orderMap.put("JOB_TYPE", 	PAY_REFUND);
			
			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(orderMap);
			
			//Logging 
			String transaction_id 	= orderInfo.getTransaction_id();
			String out_trade_no 	= orderInfo.getOut_trade_no();
			String out_refund_no 	= orderInfo.getOut_refund_no();
			Integer total_fee  		= orderInfo.getTotal_fee();
			Integer refund_fee  	= orderInfo.getRefund_fee();
			String op_user_id 		= userId;
			
			logger.info("appid============" + appInfo.getAppId());
			logger.info("mch_id===========" + mchInfo.getMchId());
//			logger.info("device_info======" + "");
			logger.info("transaction_id===" + transaction_id);
			logger.info("out_trade_no=====" + out_trade_no);
			logger.info("out_refund_no====" + out_refund_no);
			logger.info("total_fee========" + total_fee);
			logger.info("refund_fee=======" + refund_fee);
			logger.info("op_user_id=======" + op_user_id);
			
			
			PayRefundRequest interfaceRequest = new PayRefundRequest();
			
			interfaceRequest.setAppid(appInfo.getAppId());
			interfaceRequest.setMch_id(mchInfo.getMchId());
//			interfaceRequest.setDevice_info("");
			interfaceRequest.setTransaction_id(transaction_id);
			interfaceRequest.setOut_trade_no(out_trade_no);
			interfaceRequest.setOut_refund_no(out_refund_no);
//			payRefundRequst.setTotal_fee(1);
//			payRefundRequst.setRefund_fee(1);
			interfaceRequest.setTotal_fee(total_fee);
			interfaceRequest.setRefund_fee(refund_fee);
			interfaceRequest.setOp_user_id(op_user_id);
	 
			String xml = WeixinSignUtils.payRefundReqeustSign(interfaceRequest , mchInfo);
 
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------payrefund request start-----------------------");
			HttpPost httppost = new HttpPost(PAY_REFUND_URL);
			logger.info("executing request:" + httppost.getRequestLine());

			logger.info("POST Data=\n" + xml);

			httppost.setEntity(new StringEntity(xml, CHARSET));

			response = httpclient.execute(httppost);
			logger.info("-----------------payrefund request end-----------------------");
			HttpEntity entity = response.getEntity();
//			StringBuffer results = new StringBuffer();
			String result = "";
			logger.info("-----------------payrefund response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}

				logger.info("Response content:\n" + results.toString());*/
				result = EntityUtils.toString(entity, CHARSET);

				logger.info("Response content:\n" + result);
				logger.info("-----------------payrefund response end-----------------------");
			}
			EntityUtils.consume(entity);
			
			
			WeixinSignUtils.checkSign(result, mchInfo);
			
//			PayRefundResponse interfaceResponse = XmlUtils.parseXml2PayRefundResponse(result);
			PayRefundResponse interfaceResponse = XmlUtils.parseXml2Obj(result, PayRefundResponse.class);
			
			logger.info(interfaceResponse);
			
			PayRefundInsert refund = new PayRefundInsert();
			refund.setShopId(shopId);
			refund.setOrderId(orderId);
			refund.setCustSysId(custSysId);
			refund.setRefundInfo(interfaceResponse);
			
			weixinOrderService.savePayRefundResult(refund);


			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				 // success
				
			} else {
				//error
				logger.error("-----------------payment error-----------------------");
				 throw new WeixinErrorException(interfaceResponse.getReturn_msg());
				 
				//getRequest().setAttribute("err_msg", uor.getReturn_msg());

			 
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();

		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 logger.info("=========================== payrefund end ===========================");
		return NONE;
	}
	
	public String payrefundquery(){
		
		logger.info("=========================== payrefundquery start ===========================");
		
		boolean success = true;
		String err_msg = "";

		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			Integer shopId = getBackSessionShopId();

			logger.info("shopId=" + shopId);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			Integer orderId 	= IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			String userId =getBackSessionUserId();

			if (orderId == null) {
				logger.error("orderId不存在");
				throw new Exception("orderId不存在");
			}
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			//从数据库获取订单信息
			Map<String,Object> orderMap = new HashMap<String,Object>();
			orderMap.put("CUST_SYS_ID", null);
			orderMap.put("SHOP_ID", 	shopId);
			orderMap.put("ORDER_ID", 	orderId);
			orderMap.put("JOB_TYPE", 	PAY_REFUND);
			
			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(orderMap);
			
			//Logging 
			String transaction_id 	= orderInfo.getTransaction_id() ;
			String out_trade_no 	= orderInfo.getOut_trade_no() ;
			String out_refund_no 	= orderInfo.getOut_refund_no();
			String refund_id 		=  "";
			
			logger.info("appid============" + appInfo.getAppId());
			logger.info("mch_id===========" + mchInfo.getMchId());
			logger.info("device_info======" + "");
			logger.info("transaction_id===" + transaction_id);
			logger.info("out_trade_no=====" + out_trade_no);
			logger.info("out_refund_no====" + out_refund_no);
			logger.info("refund_id========" + refund_id);
			
			
			PayRefundQueryRequest interfaceRequest = new PayRefundQueryRequest();
			
			interfaceRequest.setAppid(appInfo.getAppId());
			interfaceRequest.setMch_id(mchInfo.getMchId());
//			interfaceRequest.setDevice_info("");
			interfaceRequest.setTransaction_id(transaction_id);
			interfaceRequest.setOut_trade_no(out_trade_no);
			interfaceRequest.setOut_refund_no(out_refund_no);
			interfaceRequest.setRefund_id(refund_id);
	 
			String xml = WeixinSignUtils.payRefundQueryRequestSign(interfaceRequest , mchInfo);
 
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------payrefundquery request start-----------------------");
			HttpPost httppost = new HttpPost(PAY_REFUND_QUERY_URL);
			logger.info("executing request:" + httppost.getRequestLine());

			logger.info("POST Data=\n" + xml);

			httppost.setEntity(new StringEntity(xml, CHARSET));

			response = httpclient.execute(httppost);
			logger.info("-----------------payrefundquery request end-----------------------");
			HttpEntity entity = response.getEntity();
//			StringBuffer results = new StringBuffer();
			String result = "";
			logger.info("-----------------payrefundquery response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}

				logger.info("Response content:\n" + results.toString());*/
				result = EntityUtils.toString(entity, CHARSET);

				logger.info("Response content:\n" + result);
				logger.info("-----------------payrefundquery response end-----------------------");
			}
			EntityUtils.consume(entity);
			
			
			WeixinSignUtils.checkSign(result, mchInfo);
			
//			PayRefundQueryResponse interfaceResponse = XmlUtils.parseXml2PayRefundQueryResponse(result);
			PayRefundQueryResponse interfaceResponse = XmlUtils.parseXml2Obj(result, PayRefundQueryResponse.class);
			
			logger.info(interfaceResponse);

			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				 // success
				 Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 rtnMap.put("success", true);
				 rtnMap.put("data", interfaceResponse.toString());
				 
				 renderJSON(rtnMap);
			} else {
				//error
				logger.error("-----------------payrefundquery error-----------------------");
				 throw new WeixinErrorException(interfaceResponse.getErr_code_des());
				 
				//getRequest().setAttribute("err_msg", uor.getReturn_msg());

			 
			}

		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();

		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 logger.info("=========================== payrefundquery end ===========================");
		return NONE;
	}
	
	public String downloadbill(){
		
		logger.info("=========================== downloadbill start ===========================");

		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			Integer shopId = getBackSessionShopId();

			logger.info("shopId=" + shopId);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			if (appInfo == null) {
				logger.error("Key值无效:： key=" + key);
				throw new Exception("Key值无效:： key=" + key);
			}

			if (mchInfo == null) {
				logger.error("商户信息不存在");
				throw new Exception("商户信息不存在");
			}

			String orderId = getRequest().getParameter("orderId");
			
			//从数据库获取订单信息
			Map<String,Object> orderMap = new HashMap<String,Object>();
			
			//Logging 
			
			 PayDownloadbillRequest interfaceRequest = new PayDownloadbillRequest();
			 
			 interfaceRequest.setAppid(appInfo.getAppId());
			 interfaceRequest.setMch_id(mchInfo.getMchId());
//			 interfaceRequest.setDevice_info("");
			 interfaceRequest.setBill_date("20150313");
			 interfaceRequest.setBill_type(getRequest().getParameter("bill_type"));
			

			
			String xml = WeixinSignUtils.payDownloadbillRequestSign(interfaceRequest , mchInfo);
 
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------downloadbill request start-----------------------");
			HttpPost httppost = new HttpPost(PAY_DOWNLOAD_BILL_URL);
			logger.info("executing request:" + httppost.getRequestLine());

			logger.info("POST Data=\n" + xml);

			httppost.setEntity(new StringEntity(xml, CHARSET));

			response = httpclient.execute(httppost);
			logger.info("-----------------downloadbill request end-----------------------");
			HttpEntity entity = response.getEntity();
			StringBuffer results = new StringBuffer();
			List<String> resultList = new ArrayList<String>();
			boolean isError = false;
			int i = 0;
			logger.info("-----------------downloadbill response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					
					if(i++ == 0){
						if(text.contains("FAIL")){
							isError = true;
						}
					}
					
					if(isError){
						results.append(text);
					}else{
						resultList.add(text);
					}
					 
					logger.info(text);
				}

				logger.info("Response content:\n" + results.toString());
				logger.info("-----------------downloadbill response end-----------------------");
			}
			EntityUtils.consume(entity);
			
			
			request.put("isError", isError);
			request.put("resultList", resultList);
			 
			
			if(!isError){
				 
				OrderBill orderBill = PayBillUtils.convert2OrderBill(resultList);
				
				request.put("orderBill", orderBill);
				 
			}else{
//				PayDownloadbillResponse billResponse = XmlUtils.parseXml2PayDownloadbillResponse(results.toString());
				PayDownloadbillResponse billResponse = XmlUtils.parseXml2Obj(results.toString(), PayDownloadbillResponse.class);
				
				request.put("err", billResponse);
			}

		} catch (Exception e) {
			logger.error(e.getMessage());

		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		
		logger.info("=========================== downloadbill end ===========================");
		return "downloadbill";
	}
	
	/**
	 * 发送红包
	 * @return
	 */
	public String sendRedPack(){
		
		logger.info("=========================== sendRedPack start ===========================");
	
		boolean success = true;
		String err_msg = "";
	
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			
			SessionMember sessionMember = getSessionMember();
			if (sessionMember == null) {
				String errorMsg = "用户没有关注公众号";
				logger.error(errorMsg);
				throw new Exception(errorMsg);
			}
			Integer shopId =  sessionMember.getShopId();
			
			/*Integer shopId = getBackSessionShopId();
			logger.info("shopId=" + shopId);*/
	
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);
			 
			Integer eventId = IntegerUtils.valueOf(getRequest().getParameter("eventId"));
			Integer prizeId = IntegerUtils.valueOf(getRequest().getParameter("prizeId"));
			
			if (eventId == null) {
				String errorMsg = "eventId is null";
				logger.error(errorMsg);
				throw new Exception(errorMsg);
			}
			if (prizeId == null) {
				String errorMsg = "prizeId is null";
				logger.error(errorMsg);
				throw new Exception(errorMsg);
			}
			
			// 从数据库获取红包信息
			Map<String,Object> searchMap = new HashMap<String,Object>();
			
			searchMap.put("SHOP_ID", shopId);
			searchMap.put("CUST_SYS_ID", sessionMember.getCustSysId());
			searchMap.put("EVENT_ID", eventId);
			searchMap.put("PRIZE_ID", prizeId);
			Map<String,Object> orderMap = eventService.selectRedParkInfo(searchMap);
			
	 
			String mch_billno 	=	 (String)orderMap.get("MCH_BILLNO") ;
			String nick_name 	=	 (String)orderMap.get("NICK_NAME") ;
			String send_name 	=	 (String)orderMap.get("SEND_NAME") ;
			String openid 		=	 (String)orderMap.get("OPENID") ;
			Integer total_amount = IntegerUtils.valueOf((String)orderMap.get("TOTAL_AMOUNT")) ;
			String wishing 		= (String)orderMap.get("WISHING") ;
			String client_ip 	= getRequest().getRemoteAddr() ;
			String act_name 	= (String)orderMap.get("ACT_NAME") ;
			String remark 		= (String)orderMap.get("REMARK") ;
			String cust_nick_nm  = (String)orderMap.get("CUST_NICK_NM") ;
			String prize_desc 		= (String)orderMap.get("PRIZE_DESC") ;
			String op_user_id 	= "SYSTEM";
			
			logger.info("appid=========" + appInfo.getAppId());
			logger.info("mch_id========" + mchInfo.getMchId());
			logger.info("device_info===" + "");
			logger.info("mch_billno====" + mch_billno);
			logger.info("nick_name=====" + nick_name);
			logger.info("send_name=====" + send_name);
			logger.info("openid========" + openid);
			logger.info("total_amount==" + total_amount);
			logger.info("wishing=======" + wishing);
			logger.info("client_ip=====" + client_ip);
			logger.info("act_name======" + act_name);
			logger.info("remark========" + remark);
			logger.info("cust_nick_nm==" + cust_nick_nm);
			logger.info("prize_desc====" + prize_desc);
			
			
			SendRedPackRequest interfaceRequest = new SendRedPackRequest();   
			
			interfaceRequest.setMch_billno(mch_billno) ; //String(28)
			interfaceRequest.setMch_id(mchInfo.getMchId());
			interfaceRequest.setWxappid(appInfo.getAppId());
			interfaceRequest.setNick_name(nick_name); //String(32)
			interfaceRequest.setSend_name(send_name); //String(32)
			interfaceRequest.setRe_openid(openid);
			interfaceRequest.setTotal_amount(total_amount);
			interfaceRequest.setMin_value(total_amount);
			interfaceRequest.setMax_value(total_amount);
			interfaceRequest.setTotal_num(1);
			interfaceRequest.setWishing(wishing);//String(128)
			interfaceRequest.setClient_ip(client_ip);
			interfaceRequest.setAct_name(act_name); //String(32)
			interfaceRequest.setRemark(remark); //String(256)
//			sendRedPackRequest.setLogo_imgurl("商户logo的url");
//			sendRedPackRequest.setShare_content("分享文案");
//			sendRedPackRequest.setShare_url("分享链接");
//			sendRedPackRequest.setShare_imgurl("分享的图片");
	 
			String xml = WeixinSignUtils.sendRedPackRequestSign(interfaceRequest , mchInfo); 
	
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------sendredpark request start-----------------------");
			HttpPost httppost = new HttpPost(SENDREDPACK);
			logger.info("executing request:" + httppost.getRequestLine());
	
			logger.info("POST Data=\n" + xml);
	
 			httppost.setEntity(new StringEntity(xml, "utf-8"));
 			
// 			System.out.println(EntityUtils.getContentCharSet(httppost.getEntity()));
	
			response = httpclient.execute(httppost);
			logger.info("-----------------sendredpark request end-----------------------");
			HttpEntity entity = response.getEntity();
 			StringBuffer results = new StringBuffer();
		 
			logger.info("-----------------sendredpark response start-----------------------");
			logger.info("Response Status: " + response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				 BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}
//				logger.info("Response content:\n" + results.toString()); 
				
				/*System.out.println(EntityUtils.getContentCharSet(entity));
				result = EntityUtils.toString(entity);*/

				logger.info("Response content:\n" + results.toString());
				logger.info("-----------------sendredpark response end-----------------------");
			}
			EntityUtils.consume(entity);
			
//			SendRedPackResponse interfaceResponse = XmlUtils.parseXml2SendRedPackResponse(results.toString());
			SendRedPackResponse interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
			
			logger.info(interfaceResponse.toString());
	
			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				 // success
				//发送红包无SIGN信息
				//WeixinSignUtils.checkSign(results.toString(), mchInfo);
				
				
				eventService.saveRedParkSendResult(searchMap);
				
				try {
					
					Long messageId = weixinTemplateMessageService.sendRedPackNotice(appInfo, openid, "first", cust_nick_nm, prize_desc, "恭喜您获得微信红包一个，期待您的再次参与！","");
					
					weixinTemplateMessageService.updateSendStatus(messageId, "success");
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				
				//发送通知消息
				
				
				 Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 rtnMap.put("success", true);
				 rtnMap.put("msg", interfaceResponse.getErr_code_des());
				 
				 renderJSON(rtnMap);
				 
				 return NONE;
				
			} else {
				//error
				logger.error("-----------------sendredpark error-----------------------");
				
				String errorMsg = "发送失败!\\n";
				
				if (interfaceResponse.getReturn_code().equals("FAIL")){
					errorMsg += "错误原因=" + interfaceResponse.getReturn_msg();
				}else{
					String err_code =  interfaceResponse.getErr_code();
					String err_code_des =  interfaceResponse.getErr_code_des();
					errorMsg += "错误码=" + err_code + ", 错误描述=" + err_code_des;
				}
				
				 Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 
				 rtnMap.put("success", false);
				 rtnMap.put("err_msg", errorMsg);
				 
				 renderJSON(rtnMap);
				return NONE;
			}
	
		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
	
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 
		 logger.info("=========================== sendRedPack end ===========================");
		 
		return NONE;
	}
	
	
public String manualSendRedPack(){
		
		logger.info("=========================== sendRedPack start ===========================");
	
		boolean success = true;
		String err_msg = "";
	
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			
			 
			Integer shopId =  IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);
			 
			Integer eventId = IntegerUtils.valueOf(getRequest().getParameter("eventId"));
			Integer prizeId = IntegerUtils.valueOf(getRequest().getParameter("prizeId"));
			Integer custSysId = IntegerUtils.valueOf(getRequest().getParameter("custSysId"));
			
			if (eventId == null) {
				String errorMsg = "eventId is null";
				logger.error(errorMsg);
				throw new Exception(errorMsg);
			}
			if (prizeId == null) {
				String errorMsg = "prizeId is null";
				logger.error(errorMsg);
				throw new Exception(errorMsg);
			}
			
			// 从数据库获取红包信息
			Map<String,Object> searchMap = new HashMap<String,Object>();
			
			searchMap.put("SHOP_ID", shopId);
			searchMap.put("CUST_SYS_ID", custSysId);
			searchMap.put("EVENT_ID", eventId);
			searchMap.put("PRIZE_ID", prizeId);
			Map<String,Object> orderMap = eventService.selectRedParkInfo(searchMap);
			
	 
			String mch_billno 		= (String)orderMap.get("MCH_BILLNO") ;
			String nick_name 		= (String)orderMap.get("NICK_NAME") ;
			String send_name 		= (String)orderMap.get("SEND_NAME") ;
			String openid 			= (String)orderMap.get("OPENID") ;
			Integer total_amount 	= IntegerUtils.valueOf((String)orderMap.get("TOTAL_AMOUNT")) ;
			Integer plaze_status 	= (Integer)orderMap.get("PRIZE_STATUS");
			String wishing 			= (String)orderMap.get("WISHING") ;
			String client_ip 		= getRequest().getRemoteAddr() ;
			String act_name 		= (String)orderMap.get("ACT_NAME") ;
			String remark 			= (String)orderMap.get("REMARK") ;
			String cust_nick_nm  	= (String)orderMap.get("CUST_NICK_NM") ;
			String prize_desc 		= (String)orderMap.get("PRIZE_DESC") ;
			String op_user_id 		= "SYSTEM";
			
			logger.info("appid=========" + appInfo.getAppId());
			logger.info("mch_id========" + mchInfo.getMchId());
			logger.info("device_info===" + "");
			logger.info("mch_billno====" + mch_billno);
			logger.info("nick_name=====" + nick_name);
			logger.info("send_name=====" + send_name);
			logger.info("openid========" + openid);
			logger.info("total_amount==" + total_amount);
			logger.info("wishing=======" + wishing);
			logger.info("client_ip=====" + client_ip);
			logger.info("act_name======" + act_name);
			logger.info("remark========" + remark);
			logger.info("cust_nick_nm==" + cust_nick_nm);
			logger.info("prize_desc====" + prize_desc);
			logger.info("plaze_status==" + plaze_status);
			
			
			if(plaze_status == 1){
				SendRedPackRequest interfaceRequest = new SendRedPackRequest();   
				
				interfaceRequest.setMch_billno(mch_billno) ; //String(28)
				interfaceRequest.setMch_id(mchInfo.getMchId());
				interfaceRequest.setWxappid(appInfo.getAppId());
				interfaceRequest.setNick_name(nick_name); //String(32)
				interfaceRequest.setSend_name(send_name); //String(32)
				interfaceRequest.setRe_openid(openid);
//				interfaceRequest.setRe_openid("o1yuEtw8Pa1BiDLhP3WfLZuaQyAI");//金东一
//				interfaceRequest.setRe_openid("o1yuEt5YXOfp7plDiruzfzO3_gVQ");// 오정은
//				interfaceRequest.setRe_openid("o1yuEtw_X9NGER5XVd0L7mUE8YXU");// 박찬희
				interfaceRequest.setTotal_amount(total_amount);
				interfaceRequest.setMin_value(total_amount);
				interfaceRequest.setMax_value(total_amount);
				interfaceRequest.setTotal_num(1);
				interfaceRequest.setWishing(wishing);//String(128)
				interfaceRequest.setClient_ip(client_ip);
				interfaceRequest.setAct_name(act_name); //String(32)
				interfaceRequest.setRemark(remark); //String(256)
//				sendRedPackRequest.setLogo_imgurl("商户logo的url");
//				sendRedPackRequest.setShare_content("分享文案");
//				sendRedPackRequest.setShare_url("分享链接");
//				sendRedPackRequest.setShare_imgurl("分享的图片");
		 
				String xml = WeixinSignUtils.sendRedPackRequestSign(interfaceRequest , mchInfo); 
		
				httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
				logger.info("-----------------sendredpark request start-----------------------");
				HttpPost httppost = new HttpPost(SENDREDPACK);
				logger.info("executing request:" + httppost.getRequestLine());
		
				logger.info("POST Data=\n" + xml);
		
	 			httppost.setEntity(new StringEntity(xml, "utf-8"));
	 			
//	 			System.out.println(EntityUtils.getContentCharSet(httppost.getEntity()));
		
				response = httpclient.execute(httppost);
				logger.info("-----------------sendredpark request end-----------------------");
				HttpEntity entity = response.getEntity();
	 			StringBuffer results = new StringBuffer();
			 
				logger.info("-----------------sendredpark response start-----------------------");
				logger.info("Response Status: " + response.getStatusLine());
				if (entity != null) {
					logger.info("Response content length: " + entity.getContentLength());
					 BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
					String text;
					while ((text = bufferedReader.readLine()) != null) {
						results.append(text);
						logger.info(text);
					}
//					logger.info("Response content:\n" + results.toString()); 
					
					/*System.out.println(EntityUtils.getContentCharSet(entity));
					result = EntityUtils.toString(entity);*/

					logger.info("Response content:\n" + results.toString());
					logger.info("-----------------sendredpark response end-----------------------");
				}
				EntityUtils.consume(entity);
				
//				SendRedPackResponse interfaceResponse = XmlUtils.parseXml2SendRedPackResponse(results.toString());
				SendRedPackResponse interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
				
				logger.info(interfaceResponse.toString());
		
				if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
					 // success
					//发送红包无SIGN信息
					//WeixinSignUtils.checkSign(results.toString(), mchInfo);
					
					
					eventService.saveRedParkSendResult(searchMap);
					
					try {
						
						Long messageId = weixinTemplateMessageService.sendRedPackNotice(appInfo, openid,"first", cust_nick_nm, prize_desc, "抱歉，因为系统原因，未正常发出红包，现将红包补发给您，快去查收吧~","remark");
						
						weixinTemplateMessageService.updateSendStatus(messageId, "success");
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					
					
					//发送通知消息
					
					
					 Map<String,Object> rtnMap = new HashMap<String,Object>();
						
					 rtnMap.put("success", true);
					 rtnMap.put("msg", interfaceResponse.getErr_code_des());
					 
					 renderJSON(rtnMap);
					 
					 return NONE;
					
				} else {
					//error
					logger.error("-----------------sendredpark error-----------------------");
					
					String errorMsg = "发送失败!\\n";
					
					if (interfaceResponse.getReturn_code().equals("FAIL")){
						errorMsg += "错误原因=" + interfaceResponse.getReturn_msg();
					}else{
						String err_code =  interfaceResponse.getErr_code();
						String err_code_des =  interfaceResponse.getErr_code_des();
						errorMsg += "错误码=" + err_code + ", 错误描述=" + err_code_des;
					}
					
					 Map<String,Object> rtnMap = new HashMap<String,Object>();
						
					 
					 rtnMap.put("success", false);
					 rtnMap.put("err_msg", errorMsg);
					 
					 renderJSON(rtnMap);
					return NONE;
				}
			}else{
				logger.info("已发送过，不在发送");
				 Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 rtnMap.put("success", true);
				 rtnMap.put("msg", "已发送过，不在发送");
				 
				 renderJSON(rtnMap);
				 
				 return NONE;
			}
			
			
	
		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
	
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 
		 logger.info("=========================== sendRedPack end ===========================");
		 
		return NONE;
	}
	
 
	public String redpack(){
		
	
		boolean success = true;
		String err_msg = "";
	
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			
			Integer shopId =  IntegerUtils.valueOf(getRequest().getParameter("shopId"));
	 
	
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);
			  
	 
			String mch_billno 	=	 System.currentTimeMillis() + "";
			String nick_name 	=	 "testnick_name" ;
			String send_name 	=	 "testsend_name" ;
			String openid 		=	getRequest().getParameter("openid");
			Integer total_amount =  100;
			String wishing 		= "testwishing" ;
			String client_ip 	= getRequest().getRemoteAddr() ;
			String act_name 	= "testact_name";
			String remark 		= "testremark";
			String op_user_id 	= "SYSTEM";
			
			logger.info("appid=========" + appInfo.getAppId());
			logger.info("mch_id========" + mchInfo.getMchId());
			logger.info("device_info===" + "");
			logger.info("mch_billno====" + mch_billno);
			logger.info("nick_name=====" + nick_name);
			logger.info("send_name=====" + send_name);
			logger.info("openid========" + openid);
			logger.info("total_amount==" + total_amount);
			logger.info("wishing=======" + wishing);
			logger.info("client_ip=====" + client_ip);
			logger.info("act_name======" + act_name);
			logger.info("remark========" + remark);
			
			
			SendRedPackRequest interfaceRequest = new SendRedPackRequest();   
			
			interfaceRequest.setMch_billno(mch_billno) ; //String(28)
			interfaceRequest.setMch_id(mchInfo.getMchId());
			interfaceRequest.setWxappid(appInfo.getAppId());
			interfaceRequest.setNick_name(nick_name); //String(32)
			interfaceRequest.setSend_name(send_name); //String(32)
			interfaceRequest.setRe_openid(openid);
//			interfaceRequest.setRe_openid("o1yuEtw8Pa1BiDLhP3WfLZuaQyAI");//金东一
			interfaceRequest.setTotal_amount(total_amount);
			interfaceRequest.setMin_value(total_amount);
			interfaceRequest.setMax_value(total_amount);
			interfaceRequest.setTotal_num(1);
			interfaceRequest.setWishing(wishing);//String(128)
			interfaceRequest.setClient_ip(client_ip);
			interfaceRequest.setAct_name(act_name); //String(32)
			interfaceRequest.setRemark(remark); //String(256)
//			sendRedPackRequest.setLogo_imgurl("商户logo的url");
//			sendRedPackRequest.setShare_content("分享文案");
//			sendRedPackRequest.setShare_url("分享链接");
//			sendRedPackRequest.setShare_imgurl("分享的图片");
	 
			String xml = WeixinSignUtils.sendRedPackRequestSign(interfaceRequest , mchInfo); 
	
			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
			logger.info("-----------------sendredpark request start-----------------------");
			HttpPost httppost = new HttpPost(SENDREDPACK);
			logger.info("executing request:" + httppost.getRequestLine());
	
			logger.info("POST Data=\n" + xml);
	
 			httppost.setEntity(new StringEntity(xml, "utf-8"));
 			
// 			System.out.println(EntityUtils.getContentCharSet(httppost.getEntity()));
	
			response = httpclient.execute(httppost);
			logger.info("-----------------sendredpark request end-----------------------");
			HttpEntity entity = response.getEntity();
 			StringBuffer results = new StringBuffer();
		 
			logger.info("-----------------sendredpark response start-----------------------");
			logger.info("Response Status: " + response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				 BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}
//				logger.info("Response content:\n" + results.toString()); 
				
				/*System.out.println(EntityUtils.getContentCharSet(entity));
				result = EntityUtils.toString(entity);*/

				logger.info("Response content:\n" + results.toString());
				logger.info("-----------------sendredpark response end-----------------------");
			}
			EntityUtils.consume(entity);
			
//			SendRedPackResponse interfaceResponse = XmlUtils.parseXml2SendRedPackResponse(results.toString());
			SendRedPackResponse interfaceResponse = null;
			try {
				interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
			} catch (Exception e) {
				logger.error("sendredpark0000001:" + e.getMessage());
				try {
					String source = results.toString();
					byte[] bs = source.getBytes("gbk");
					//用新的字符编码生成字符串
					String dist = new String(bs, "utf8");
					interfaceResponse = XmlUtils.parseXml2Obj(dist, SendRedPackResponse.class);
				} catch (Exception e2) {
					// TODO: handle exception
					logger.error("sendredpark0000002:" + e2.getMessage());
					throw e2;
				}
			}
			
			logger.info(interfaceResponse.toString());
	
			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				 // success
				//发送红包无SIGN信息
				//WeixinSignUtils.checkSign(results.toString(), mchInfo);
				
				 Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 rtnMap.put("success", true);
				 rtnMap.put("msg", interfaceResponse.getErr_code_des());
				 
				 renderJSON(rtnMap);
				 
				 return NONE;
				
			} else {
				//error
				logger.error("-----------------sendredpark error-----------------------");
				
				String errorMsg = "发送失败!\\n";
				
				if (interfaceResponse.getReturn_code().equals("FAIL")){
					errorMsg += "错误原因=" + interfaceResponse.getReturn_msg();
				}else{
					String err_code =  interfaceResponse.getErr_code();
					String err_code_des =  interfaceResponse.getErr_code_des();
					errorMsg += "错误码=" + err_code + ", 错误描述=" + err_code_des;
				}
				
				 Map<String,Object> rtnMap = new HashMap<String,Object>();
					
				 
				 rtnMap.put("success", false);
				 rtnMap.put("err_msg", errorMsg);
				 
				 renderJSON(rtnMap);
				return NONE;
			}
	
		} catch (Exception e) {
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
	
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		 
		 logger.info("=========================== sendRedPacktsst end ===========================");
		 
		return NONE;
	}
	
	
	
	
	
	/** 
	*
	* @return
	*/
	public String paynative(){
		logger.info("=========================== paynative start ===========================");
		
		CloseableHttpClient httpclient = null;
		CloseableHttpResponse response = null;
		try {
			
			request.put("isWeixinBrowser", isWeixinBrowser());
			request.put("isAndroid", isAndroid());
			
			Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			request.put("shopId", shopId);
//			request.put("orderId", orderId);
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);

			request.put("appInfo", appInfo);
			/////////
			
			Map<String,Object> map = new HashMap<String,Object>();
//			map.put("ORDER_ID", orderId);
//			map.put("JOB_TYPE", PAY_NORMAL);
//			
//			WeixinOrderInfo orderInfo = weixinOrderService.getWeixinOrderInfoById(map);
//			
//			getRequest().setAttribute("orderInfo", orderInfo);
//			
			Integer total_fee 		= 1;//orderInfo.getTotal_fee();
			String total_fee2 		= "1";//orderInfo.getTotal_fee2(); 
			String custOrderId 		= System.currentTimeMillis() +"";//orderInfo.getCustOrderId();
			String shopNm 			= "8";//orderInfo.getShopNm();
			String out_trade_no	 	= System.currentTimeMillis() +"";//orderInfo.getOut_trade_no();
			String spbill_create_ip = IPUtils.getLocalIPv4();
			String feeType 			= "CNY";
			String nofityUrl 		=  appInfo.getDomain() + "/wx/pay/paymentNotify2.htm?key=" + appInfo.getSysId();
 			String oepnid 			= "";//getRequest().getParameter("o");
			String body 			= "body"; //orderInfo.getBody();
			String product_id 		=  getRequest().getParameter("product_id") ;
			
			Map<String,String> attachMap = new HashMap<String, String>();
			if(shopId != null){
				attachMap.put("shopId", shopId +"");
			}
			if(total_fee != null){
				attachMap.put("total_fee", total_fee +"");
			}
			if(orderId != null){
				attachMap.put("orderId", orderId +"");
			}
			
			String attach 			= setAttachInfo(attachMap);
			
			
			
			if(StringUtils.isEmpty(appInfo.getSysId())){
				logger.error("error01:sysId为空");
				throw new Exception("error01:sysId为空");
			}
	 
			logger.info("total_fee=========" + total_fee);
			logger.info("out_trade_no======" + out_trade_no);
			logger.info("spbill_create_ip==" + spbill_create_ip);
			logger.info("nofityUrl=========" + nofityUrl);
			logger.info("feeType===========" + feeType);
			logger.info("body==============" + body);
			logger.info("attach============" + attach);
			logger.info("custOrderId=======" + custOrderId);
			logger.info("shopNm============" + shopNm);
			logger.info("product_id========" + product_id);

			PaySign sign = new PaySign();
			sign.setAppid(appInfo.getAppId());
			sign.setMch_id(mchInfo.getMchId());
			sign.setBody(body);
			sign.setAttach(attach);
			sign.setOut_trade_no(out_trade_no);
			sign.setFee_type(feeType);
//			sign.setTotal_fee(1);
			sign.setTotal_fee(total_fee);
			sign.setSpbill_create_ip(spbill_create_ip);
			sign.setNotify_url(nofityUrl);
			sign.setProduct_id(product_id);

			String xml = WeixinSignUtils.payNativeSign(sign, mchInfo);

			httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);

			HttpPost httppost = new HttpPost(PAY_UNIFED_ORDER_URL);
			logger.info("-----------------unifiedorder request start-----------------------");
			logger.info("executing request:" + httppost.getRequestLine());
			logger.info("POST Data=\n" + xml);

			httppost.setEntity(new StringEntity(xml,CHARSET));

			response = httpclient.execute(httppost);

			logger.info("-----------------unifiedorder request end-----------------------");
			HttpEntity entity = response.getEntity();
//			StringBuffer results = new StringBuffer();
			String result = "";
			logger.info("-----------------unifiedorder response start-----------------------");
			logger.info(response.getStatusLine());
			if (entity != null) {
				logger.info("Response content length: " + entity.getContentLength());
				/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
				String text;
				while ((text = bufferedReader.readLine()) != null) {
					results.append(text);
					logger.info(text);
				}*/
//				logger.info("Response content:\n" + results.toString());
				result = EntityUtils.toString(entity, CHARSET);
				logger.info("Response content:\n" +result);
				logger.info("-----------------unifiedorder response end-----------------------");
			}
			EntityUtils.consume(entity);

//			UnifiedOrderResponse interfaceResponse = XmlUtils.parseXml2UnifiedOrderResponse(result);
			UnifiedOrderResponse interfaceResponse = XmlUtils.parseXml2Obj(result, UnifiedOrderResponse.class);
			logger.info(interfaceResponse.toString());

			if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
				String prepay_id = interfaceResponse.getPrepay_id();
				String code_url = interfaceResponse.getCode_url();
				logger.info("prepay_id=" + prepay_id);
				logger.info("code_url=" + code_url);
				
				
				
				request.put("code_url", code_url);

			} else {
				logger.error("-----------------payment error-----------------------");
				if(interfaceResponse.getReturn_code().equals("FAIL")){ 
					throw new Exception(interfaceResponse.getReturn_msg());
				}else if(interfaceResponse.getResult_code().equals("FAIL")){
					String errorCode = interfaceResponse.getErr_code();
					logger.error("err_code===" + errorCode);
					logger.error("err_msg====" + interfaceResponse.getReturn_msg());
					logger.error("desc=======" + PaymentErrorCode.getDesc(errorCode));
					logger.error("reason=====" + PaymentErrorCode.getReason(errorCode));
					logger.error("method=====" + PaymentErrorCode.getMethod(errorCode));
					throw new WeixinPayUnifiedOrderException(interfaceResponse.getErr_code());
				}else{
					throw new Exception("cuowu");
				}
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
			request.put("err_msg", e.getMessage());
			return "paymentError";
		} finally {
			if (response != null) {
				try {
					response.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
			if (httpclient != null) {
				try {
					httpclient.close();
				} catch (IOException e) {
					logger.error(e.getMessage());
				}
			}
		}
		logger.info("=========================== payment end ===========================");
		
		return "paynative";
	}
	
	
	public String test(){
		logger.info("=================");
		return "test";
	}
	
	/**
	 * 检测是不是来自微信浏览器
	 * @return
	 */
	public boolean isWeixinBrowser(){
		String userAgent = getRequest().getHeader("User-Agent");
		return userAgent.indexOf("MicroMessenger") > 0;
	}
	
	/**
	 * 检测是不是来自android手机
	 * @return
	 */
	public boolean isAndroid(){
		String userAgent = getRequest().getHeader("User-Agent");
		return userAgent.indexOf("Android") > -1 || userAgent.indexOf("Linux") > -1;
	}
	
	private String getAttachInfo(String text, String key){
		String result = "";
		
		if(StringUtils.isNotEmpty(text)){
			//以“&”字符切割字符串
			String[] strSplitText = text.split("&");
			//把切割后的字符串数组变成变量与数值组合的字典数组
			Map<String, String> paraText = new HashMap<String, String>();
			for (int i = 0; i < strSplitText.length; i++) {
				//获得第一个=字符的位置
				int nPos = strSplitText[i].indexOf("=");
				//获得字符串长度
				int nLen = strSplitText[i].length();
				//获得变量名
				String strKey = strSplitText[i].substring(0, nPos);
				//获得数值
				String strValue = strSplitText[i].substring(nPos+1,nLen);
				//放入MAP类中
				paraText.put(strKey, strValue);
			}
			result = paraText.get(key);
		}
		return result;
	}
	
	
	private String setAttachInfo(Map<String, String> map){
		String result = "";
		
		Map<String, String> pmap = new HashMap<String, String>();
		if (!map.isEmpty()) {
			for (String key : map.keySet()) {
	            String value = map.get(key);
	            if (value == null || value.equals("")) {
	                continue;
	            }
	            pmap.put(key, value);
	        }
        }
		
		if(!pmap.isEmpty()){
			 List<String> keys = new ArrayList<String>(pmap.keySet());
//		     Collections.sort(keys);
	        for (int i = 0; i < keys.size(); i++) {
	            String key = keys.get(i);
	            String value = pmap.get(key);
	            if (i == keys.size() - 1) {//拼接时，不包括最后一个&字符
	            	result += key + "=" + value;
	            } else {
	            	result += key + "=" + value + "&";
	            }
	        }
		}
	 
		return result;
	}
 
}
