package com.waremec.alipay.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.alipay.domain.AlipayInfo;
import com.waremec.alipay.domain.NotifyData;
import com.waremec.alipay.service.AlipayService;
import com.waremec.alipay.util.AlipayNotify;
import com.waremec.framework.utilities.ApplicationContextUtils;
import com.waremec.logging.AlipayRefundNotifyLog;

 
/** 
* @Package com.waremec.alipay.servlet 
* @FileName RefundServlet
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:08:34 
*  
*/
@WebServlet(name = "refundServlet", urlPatterns = { "/alipay/refund/*" })
public class RefundServlet extends AlipayBaseServlet {
	private static final long serialVersionUID = 1L;
     
	private final transient Log logger = LogFactory.getLog(RefundServlet.class);
	private final transient Log notifyLogger = LogFactory.getLog(AlipayRefundNotifyLog.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RefundServlet() {
        super();
        logger.info("============RefundServlet=============");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 logger.info("============RefundServlet.doGet=============");
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.info("=========================== refund start ===========================");
		notifyLogger.info("=========================== refund start ===========================");
		
		logger.info("IP====" + request.getRemoteAddr());
		notifyLogger.info("IP====" + request.getRemoteAddr());
		 
		 String sysId = getSysId(request,"/alipay/refund/");
			
		AlipayService alipayService = ApplicationContextUtils.getBean(AlipayService.class);
	 
		String resultMsg = "";
		try {
			
			 logger.info("sysId=" + sysId);
			 notifyLogger.info("sysId=" + sysId);
			 
			 AlipayInfo alipayInfo = alipayService.selectAlipayInfoByKey(sysId);
			
			//获取支付宝POST过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map<String, String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = iter.next();
				String[] values = requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				}
				
//					logger.info("params=>" + name +  "=" + valueStr);
				
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}
			
			logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ alipay refund notify POST params ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			for (String key : params.keySet()) {
				logger.info("params==>" +  key + "=" + params.get(key));
			}
			logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ alipay refund notify POST params ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			
			notifyLogger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ alipay refund notify POST params ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			for (String key : params.keySet()) {
				notifyLogger.info("params==>" +  key + "=" + params.get(key));
			}
			notifyLogger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ alipay refund notify POST params ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			///////基本参数
			//通知时间
			String notify_time  = new String(request.getParameter("notify_time").getBytes("ISO-8859-1"),"UTF-8");
			//通知类型
			String notify_type  = new String(request.getParameter("notify_type").getBytes("ISO-8859-1"),"UTF-8");
			//通知校验 ID 
			String notify_id  = new String(request.getParameter("notify_id").getBytes("ISO-8859-1"),"UTF-8");
			//签名方式
			String sign_type  = new String(request.getParameter("sign_type").getBytes("ISO-8859-1"),"UTF-8");
			///////业务参数 
			//退款批次号
			String batch_no = new String(request.getParameter("batch_no").getBytes("ISO-8859-1"),"UTF-8");
			//批量退款数据中转账成功的笔数    0<= success_num<= 总退款笔 数
			String success_num = new String(request.getParameter("success_num").getBytes("ISO-8859-1"),"UTF-8");
			//批量退款数据中的详细信息
			// 	退手续费结果返回格式：交 易号^退款金额^处理结果 $退费账号^退费账户 ID^退 费金额^处理结果； 
			//  不退手续费结果返回格式： 交易号^退款金额^处理结果。
			// 若退款申请提交成功，处理结果 会返回“SUCCESS”。 若提交失败，退款的处理结果中 会有报错码，参见“9.1  即时到 账批量退款业务错误码”
			String result_details = new String(request.getParameter("result_details").getBytes("ISO-8859-1"),"UTF-8");
			
//			logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ alipay refund notify POST params2 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
//			logger.info( "notify_time=" + notify_time);
//			logger.info( "notify_type=" + notify_type);
//			logger.info( "notify_id=" + notify_id);
//			logger.info( "sign_type=" + sign_type);
//			logger.info( "batch_no=" + batch_no);
//			logger.info( "success_num=" + success_num);
//			logger.info( "result_details=" + result_details);
//			logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ alipay refund notify POST params2 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			
			
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
//				if(AlipayNotify.verify(params)){//验证成功
			if(AlipayNotify.verifyRefundNitify(params, alipayInfo)){
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码
				logger.info("===请在这里加上商户的业务逻辑程序代码(refund) start===");
				notifyLogger.info("===请在这里加上商户的业务逻辑程序代码(refund) start===");
				
				
				//交易号
				String trade_no = "";
				//退款金额
				String total_fee = "";
				//处理结果
				String refund_status = "";
				
				if(result_details.indexOf("$") > -1){
					String[] array = result_details.split("^");
					trade_no = array[0];
					total_fee = array[1];
					refund_status = array[2];
				}else{
					String[] array = result_details.split("$");
					array = array[0].split("^");
					trade_no = array[0];
					total_fee = array[1];
					refund_status = array[2];
				}
				
				NotifyData notifyData = new NotifyData();
				
				notifyData.setTrade_no(trade_no);
				notifyData.setTotal_fee(total_fee);
				if(refund_status.equalsIgnoreCase("SUCCESS")){
					notifyData.setRefund_status("REFUND_REQ_SUCCESS");
				}else{
					notifyData.setRefund_status("REFUND_REQ_FAIL");
					notifyData.setRefund_error_code(refund_status);
				}
				notifyData.setGmt_refund(notify_time);
				notifyData.setNotify_type(notify_type);
				notifyData.setNotify_id(notify_id);
				
				
				Map<String,Object> notifyMap = new HashMap<String,Object>();
				notifyMap.put("orderId", null);
				notifyMap.put("notifyData", notifyData);
				
				resultMsg = alipayService.insertAlipayNotifyAndLogging(notifyMap);
				
				logger.info("DB操作结果 trade_no=== " + trade_no + ", resultMsg====" + resultMsg);
				notifyLogger.info("DB操作结果 trade_no=== " + trade_no + ", resultMsg====" + resultMsg);
				
				logger.info("===请在这里加上商户的业务逻辑程序代码(refund) end===");
				notifyLogger.info("===请在这里加上商户的业务逻辑程序代码(refund) end===");
				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				
				//判断是否在商户网站中已经做过了这次通知返回的处理
					//如果没有做过处理，那么执行商户的业务程序
					//如果有做过处理，那么不执行商户的业务程序
					
//					out.println("success");	//请不要修改或删除
//				resultMsg = "success";
				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{//验证失败
//					out.println("fail");
				resultMsg = "fail";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resultMsg = "fail";
		}
		
		 logger.info("resultMsg=====" + resultMsg);
		 
			try {
				PrintWriter writer = response.getWriter();
				
				writer.write(resultMsg);
				writer.flush();
				writer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			logger.info("=========================== refund end ===========================");
	
		
	}

}
