package com.waremec.alipay.action;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.alipay.domain.AlipayInfo;
import com.waremec.alipay.domain.AlipayOrderInfo;
import com.waremec.alipay.service.AlipayService;
import com.waremec.alipay.util.AlipaySubmit;
import com.waremec.alipay.util.UtilDate;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;

/** 
* @Package com.waremec.alipay.action 
* @FileName AlipayAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:08:47 
*  
*/
@Controller("alipayAction")
@Scope(ScopeType.prototype)
public class AlipayAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private final transient Log logger = LogFactory.getLog(AlipayAction.class);
	
	
	//支付宝网关地址
	private static final String ALIPAY_PAY_GATEWAY = "http://wappaygw.alipay.com/service/rest.htm?";
	/**
	 * 手机网页即时到账授权接口 
	 */
	private static final String ALIPAY_WAP_TRADE_CREATE_DIRECT = "alipay.wap.trade.create.direct";
	
	/**
	 * 手机网页即时到账交易接口
	 */
	private static final String ALIPAY_WAP_AUTH_AUTHANDEXECUTE = "alipay.wap.auth.authAndExecute";
	
	/**
	 * 即时到账批量退款有密接口
	 */
	private static final String REFUND_FASTPAY_BY_PLATFORM_PWD = "refund_fastpay_by_platform_pwd";
 
	@Resource
	private AlipayService alipayService;
	
	/**
	 * 支付宝申请付款 - mobile 
	 * @return
	 */
	public String payment() {
		logger.info("=========================== payment start ===========================");
		
		try {
			Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			
			AlipayInfo alipayInfo = alipayService.selectAlipayInfoByShopId(shopId);
			
			//从数据库库获取预支付订单信息
			///////////////////
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("ORDER_ID", orderId);
			map.put("JOB_TYPE", "NOR");
			
			AlipayOrderInfo alipayOrderInfo = alipayService.getAlipayOrderInfoById(map);
			//////////////////
			
			//支付宝网关地址
			final String ALIPAY_GATEWAY_NEW = ALIPAY_PAY_GATEWAY;
			////////////////////////////////////调用授权接口alipay.wap.trade.create.direct获取授权码token//////////////////////////////////////
			//返回格式
			final String format = "xml";
			//必填，不需要修改
			//返回格式
			final String v = "2.0";
			//必填，不需要修改
			
			//请求号
			String req_id = UtilDate.getOrderNum();  //从数据库获取或从页面自定义生成
			//必填，须保证每次请求都是唯一
			
			//req_data详细信息
			
			//服务器异步通知页面路径
			//String notify_url = "http://商户网关地址/WS_WAP_PAYWAP-JAVA-UTF-8/notify_url.jsp";
			String notify_url = "http://hzm.hsadchina.com/alipay/paymentNotify/" + alipayInfo.getSysId();
			//需http://格式的完整路径，不能加?id=123这类自定义参数
			
			//页面跳转同步通知页面路径
			//String call_back_url = "http://127.0.0.1:8080/WS_WAP_PAYWAP-JAVA-UTF-8/call_back_url.jsp";
			String call_back_url = "http://hzm.hsadchina.com/alipay/callback/" + alipayInfo.getSysId();
			//需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
			
			//操作中断返回地址
			//String merchant_url = "http://127.0.0.1:8080/WS_WAP_PAYWAP-JAVA-UTF-8/xxxxxx.jsp";
			String merchant_url = "http://hzm.hsadchina.com/alipay/merchant/" + alipayInfo.getSysId();
			//用户付款中途退出返回商户的地址。需http://格式的完整路径，不允许加?id=123这类自定义参数
			
			//商户订单号
//			String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
//			String out_trade_no = UtilDate.getOrderNum() + UtilDate.getThree();
			String out_trade_no = alipayOrderInfo.getOut_trade_no();
			//商户网站订单系统中唯一订单号，必填
			
			//订单名称
//			String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
			String subject = alipayOrderInfo.getSubject();
			//必填
			
			//付款金额
//			String total_fee = new String(request.getParameter("WIDtotal_fee").getBytes("ISO-8859-1"),"UTF-8");
			String total_fee = alipayOrderInfo.getTotal_fee();
			//必填
			
			//请求业务参数详细
			String req_data  = "<direct_trade_create_req>" //根节点 
					+ 		"<notify_url>" + notify_url + "</notify_url>"//：服务器异 步通知页面路径 
					+ 		"<call_back_url>" + call_back_url + "</call_back_url>"//：支付 成功跳转页面路径
					+ 		"<seller_account_name>" + alipayInfo.getSellerEmail() + "</seller_account_name>"//：卖家支付宝账号 
					+ 		"<out_trade_no>" + out_trade_no + "</out_trade_no>"//商户 网站唯一订单号 
					+ 		"<subject>" + subject + "</subject>" //商品名称 
					+ 		"<total_fee>" + total_fee + "</total_fee>"//交易金额 
					+ 		"<merchant_url>" + merchant_url + "</merchant_url>"//：操作 中断返回地址
					+ 		"<sys_id>" + alipayInfo.getSysId() + "</sys_id>" //如何增加扩展业务参数 7.4
					+ "</direct_trade_create_req>";
			//必填
			
			//////////////////////////////////////////////////////////////////////////////////
			
			///////LOGGGING //////////////////
			logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼" + ALIPAY_WAP_TRADE_CREATE_DIRECT + "▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			logger.info("alipayGateway=========" + ALIPAY_GATEWAY_NEW);
			logger.info("service===============" + ALIPAY_WAP_TRADE_CREATE_DIRECT);
			logger.info("partner===============" + alipayInfo.getPartnerId());
			logger.info("charset===============" + alipayInfo.getInputCharset());
			logger.info("sec_id================" + alipayInfo.getSignType());
			logger.info("format================" + format);
			logger.info("v=====================" + v);
			logger.info("req_id================" + req_id);
			logger.info("req_data==============" + req_data);
			logger.info("call_back_url=========" + call_back_url);
			logger.info("seller_account_name===" + alipayInfo.getSellerEmail());
			logger.info("out_trade_no==========" + out_trade_no);
			logger.info("subject===============" + subject);
			logger.info("total_fee=============" + total_fee);
			logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲" + ALIPAY_WAP_TRADE_CREATE_DIRECT + "▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			///////LOGGGING //////////////////
			
			//把请求参数打包成数组
			Map<String, String> sParaTempToken = new HashMap<String, String>();
			sParaTempToken.put("service", ALIPAY_WAP_TRADE_CREATE_DIRECT);//接口名称
			sParaTempToken.put("partner", alipayInfo.getPartnerId());//合作者身 份 ID  商户签约的支付宝账号对 应的支付宝唯一用户号。 以 2088 开头的 16 位纯数 字组成。 
			sParaTempToken.put("_input_charset", alipayInfo.getInputCharset());
			sParaTempToken.put("sec_id", alipayInfo.getSignType());//签名方式 0001：RSA 签名算法 ,MD5：MD5 签名算法 
			sParaTempToken.put("format", format);//请求参数 格式  固定取值 xml。 
			sParaTempToken.put("v", v);//接口版本号  固定取值 2.0。 
			sParaTempToken.put("req_id", req_id); //请求号  用于关联请求与响应，防止 请求重播。 支付宝限制来自同一个 partner 的请求号必须唯 一。
			sParaTempToken.put("req_data", req_data);//请求业务 参数 
			
			//建立请求
			String sHtmlTextToken = AlipaySubmit.buildRequest(ALIPAY_GATEWAY_NEW,"", "",sParaTempToken ,alipayInfo);
			//URLDECODE返回的信息
			///////LOGGGING //////////////////
			logger.info("sHtmlTextToken before=" + sHtmlTextToken);
			///////LOGGGING //////////////////
			sHtmlTextToken = URLDecoder.decode(sHtmlTextToken,alipayInfo.getInputCharset());
			///////LOGGGING //////////////////
			logger.info("sHtmlTextToken after==" + sHtmlTextToken);
			///////LOGGGING //////////////////
			//获取token
			String request_token = AlipaySubmit.getRequestToken(sHtmlTextToken,alipayInfo);
			
			logger.info("request_token=========" + request_token);
			//out.println(request_token);
			
			////////////////////////////////////根据授权码token调用交易接口alipay.wap.auth.authAndExecute//////////////////////////////////////
			
			//业务详细
			req_data = "<auth_and_execute_req><request_token>" + request_token + "</request_token></auth_and_execute_req>";
			//必填
			
			logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼" + ALIPAY_WAP_AUTH_AUTHANDEXECUTE + "▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			logger.info("alipayGateway=========" + ALIPAY_GATEWAY_NEW);
			logger.info("service===============" + ALIPAY_WAP_AUTH_AUTHANDEXECUTE);
			logger.info("partner===============" + alipayInfo.getPartnerId());
			logger.info("charset===============" + alipayInfo.getInputCharset());
			logger.info("sec_id================" + alipayInfo.getSignType());
			logger.info("format================" + format);
			logger.info("v=====================" + v);
			logger.info("req_id================" + req_id);
			logger.info("req_data==============" + req_data);
			logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲" + ALIPAY_WAP_AUTH_AUTHANDEXECUTE + "▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", ALIPAY_WAP_AUTH_AUTHANDEXECUTE); //接口名称
			sParaTemp.put("partner", alipayInfo.getPartnerId());//合作者身 份 ID  商户签约的支付宝账号对 应的支付宝唯一用户号。 以 2088 开头的 16 位纯数 字组成。 
			sParaTemp.put("_input_charset", alipayInfo.getInputCharset());
			sParaTemp.put("sec_id", alipayInfo.getSignType());//签名方式 0001：RSA 签名算法 ,MD5：MD5 签名算法 
			sParaTemp.put("format", format); //请求参数 格式  固定取值 xml。 
			sParaTemp.put("v", v); //接口版本号  固定取值 2.0。 
			sParaTemp.put("req_data", req_data);//请求业务 参数 
			
			//建立请求
			String sHtmlText = AlipaySubmit.buildRequest(ALIPAY_GATEWAY_NEW, sParaTemp, "get", "确认",alipayInfo);
			//out.println(sHtmlText);
			
			logger.info("sHtmlText=" + sHtmlText);
			
			request.put("sHtmlText", sHtmlText);
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			request.put("err_msg", e.getMessage());
			return "paymentError";
		}
		
		logger.info("=========================== payment end ===========================");
		
		return "payment";
	}
	
	
	/**
	 * 支付宝-支付宝即时到账批量退款有密接口 - backoffice
	 * @return
	 */
	public String payrefund(){
		
		logger.info("=========================== payrefund start ===========================");
		
		boolean success = true;
		String err_msg = "";
		
		try {
			Integer shopId = getBackSessionShopId();

			logger.info("shopId=" + shopId);
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			
			if (orderId == null) {
				logger.error("orderId不存在");
				throw new Exception("orderId不存在");
			}
			if (shopId == null) {
				logger.error("shopId不存在");
				throw new Exception("shopId不存在");
			}
			
			AlipayInfo alipayInfo = alipayService.selectAlipayInfoByShopId(shopId);
			
			//从数据库获取订单信息
			Map<String,Object> orderMap = new HashMap<String,Object>();
			orderMap.put("CUST_SYS_ID", null);
			orderMap.put("SHOP_ID", 	shopId);
			orderMap.put("ORDER_ID", 	orderId);
			orderMap.put("JOB_TYPE", 	"RFD");
			
			AlipayOrderInfo alipayOrderInfo = alipayService.getAlipayOrderInfoById(orderMap);
			
			////////////////////////////////////请求参数//////////////////////////////////////
			/**
		     * 支付宝提供给商户的服务接入网关URL(新)
		     */
			final String alipayGatewayNew = "https://mapi.alipay.com/gateway.do?";
			
			//服务器异步通知页面路径
//			String notify_url = "http://www.hasdchina.com/refund_fastpay_by_platform_pwd-JAVA-UTF-8/notify_url.jsp";
			String notify_url = "http://hzm.hsadchina.com/alipay/refund/" + alipayInfo.getSysId();
			//需http://格式的完整路径，不允许加?id=123这类自定义参数
			
			//卖家支付宝帐户
//			String seller_email = new String(request.getParameter("WIDseller_email").getBytes("ISO-8859-1"),"UTF-8");
			String seller_email = alipayInfo.getSellerEmail();
			//必填
			
			//退款当天日期
//			String refund_date = new String(request.getParameter("WIDrefund_date").getBytes("ISO-8859-1"),"UTF-8");
			//必填，格式：年[4位]-月[2位]-日[2位] 小时[2位 24小时制]:分[2位]:秒[2位]，如：2007-10-01 13:13:13
			String refund_date = UtilDate.getDateFormatter();
			
			//批次号
//			String batch_no = new String(request.getParameter("WIDbatch_no").getBytes("ISO-8859-1"),"UTF-8");
			//必填，格式：当天日期[8位]+序列号[3至24位]，如：201008010000001
//			String batch_no = UtilDate.getDate() + RandomUtils.generateNumberRandom(10);
			String batch_no = alipayService.selectCreatedAlipayBatchNo(orderId);
			
			//退款笔数
//			String batch_num = new String(request.getParameter("WIDbatch_num").getBytes("ISO-8859-1"),"UTF-8");
			//必填，参数detail_data的值中，“#”字符出现的数量加1，最大支持1000笔（即“#”字符出现的数量999个）
//			String batch_num = "1";
			String batch_num = alipayOrderInfo.getBatch_num();
			
			//退款详细数据
//			String detail_data = new String(request.getParameter("WIDdetail_data").getBytes("ISO-8859-1"),"UTF-8");
			//必填，具体格式请参见接口技术文档
//			单笔数据集参数说明 
//			 	单笔数据集格式为：
//			 	第一笔交易退款数据集#第二笔交易退款数据集#第三笔 交易退款数据集…#第 N 笔交易退款数据集； 
//			 	交易退款数据集的格式为：原付款支付宝交易号^退款总金额^退款理由； 
//			 	不支持退分润功能。 
//			String detail_data = "2015042100001000930069199526^0.01^测试";
			String detail_data = alipayOrderInfo.getTrade_no() + "^" + alipayOrderInfo.getRefund_fee() + "^" + alipayOrderInfo.getRefund_reason();
			
			
			
			logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼" + REFUND_FASTPAY_BY_PLATFORM_PWD + "▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			logger.info("alipayGateway=========" + alipayGatewayNew);
			logger.info("service===============" + REFUND_FASTPAY_BY_PLATFORM_PWD);
			logger.info("partner===============" + alipayInfo.getPartnerId());
			logger.info("charset===============" + alipayInfo.getInputCharset());
			logger.info("notify_url============" + notify_url);
			logger.info("seller_email==========" + seller_email);
			logger.info("refund_date===========" + refund_date);
			logger.info("batch_no==============" + batch_no);
			logger.info("batch_num=============" + batch_num);
			logger.info("detail_data===========" + detail_data);
			logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲" + REFUND_FASTPAY_BY_PLATFORM_PWD + "▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			
			//////////////////////////////////////////////////////////////////////////////////
			
			//把请求参数打包成数组
			Map<String, String> sParaTemp = new HashMap<String, String>();
			sParaTemp.put("service", REFUND_FASTPAY_BY_PLATFORM_PWD);
			sParaTemp.put("partner", alipayInfo.getPartnerId());
			sParaTemp.put("_input_charset", alipayInfo.getInputCharset());
			sParaTemp.put("notify_url", notify_url);
			sParaTemp.put("seller_email", seller_email);
			sParaTemp.put("refund_date", refund_date);
			sParaTemp.put("batch_no", batch_no);
			sParaTemp.put("batch_num", batch_num);
			sParaTemp.put("detail_data", detail_data);
			
			//建立请求
			String sHtmlText = AlipaySubmit.buildRequest(alipayGatewayNew,sParaTemp,"get","确认",alipayInfo);
			//out.println(sHtmlText);
			logger.info("sHtmlText=" + sHtmlText);
			
			request.put("sHtmlText", sHtmlText);
			
		} catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			 success = false;
			 err_msg =e.getMessage();
		}
		
		
		
		logger.info("=========================== payrefund end ===========================");
		
		return "payrefund";
		
	}
	
}
