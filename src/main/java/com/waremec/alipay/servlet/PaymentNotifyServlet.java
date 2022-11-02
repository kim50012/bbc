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
import org.dom4j.Document;
import org.dom4j.DocumentHelper;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.waremec.alipay.domain.AlipayInfo;
import com.waremec.alipay.domain.NotifyData;
import com.waremec.alipay.service.AlipayService;
import com.waremec.alipay.util.AlipayNotify;
import com.waremec.framework.utilities.ApplicationContextUtils;
import com.waremec.logging.AlipayNotifyLog;

 
/** 
* @Package com.waremec.alipay.servlet 
* @FileName PaymentNotifyServlet
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:08:28 
*  
*/
@WebServlet(name = "paymentNotify", urlPatterns = { "/alipay/paymentNotify/*" })
public class PaymentNotifyServlet extends AlipayBaseServlet {
	private static final long serialVersionUID = 1L;
    
	private final transient Log logger = LogFactory.getLog(PaymentNotifyServlet.class);
	private final transient Log notifyLogger = LogFactory.getLog(AlipayNotifyLog.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentNotifyServlet() {
        super();
        logger.info("============PaymentNotifyServlet=============");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 logger.info("============PaymentNotifyServlet.doGet=============");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("=========================== alipay payment notify start ===========================");
		notifyLogger.info("=========================== alipay payment notify start ===========================");
		
		logger.info("IP====" + request.getRemoteAddr());
		notifyLogger.info("IP====" + request.getRemoteAddr());
		
		String sysId = getSysId(request,"/alipay/paymentNotify/");
		
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
				String name =  iter.next();
				String[] values = requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				}
				
//				logger.info("params=>" + name +  "=" + valueStr);
				
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
				params.put(name, valueStr);
			}
			
			logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ alipay payment notify POST params ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			for (String key : params.keySet()) {
				logger.info("params==>" +  key + "=" + params.get(key));
			}
			logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ alipay payment notify POST params ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			
			notifyLogger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ alipay payment notify POST params ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
			for (String key : params.keySet()) {
				notifyLogger.info("params==>" +  key + "=" + params.get(key));
			}
			notifyLogger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ alipay payment notify POST params ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			
			//RSA签名解密
		   	if(alipayInfo.getSignType().equals("0001")) {
		   		params = AlipayNotify.decrypt(params, alipayInfo);
		   	}
		   	
			//XML解析notify_data数据
			Document doc_notify_data = DocumentHelper.parseText(params.get("notify_data"));
			
			//商户订单号
			String out_trade_no = doc_notify_data.selectSingleNode( "//notify/out_trade_no" ).getText();
			//支付宝交易号
			String trade_no = doc_notify_data.selectSingleNode( "//notify/trade_no" ).getText();
			//交易状态
			String trade_status = doc_notify_data.selectSingleNode( "//notify/trade_status" ).getText();

			
			logger.info("out_trade_no======" + out_trade_no);
			logger.info("trade_no==========" + trade_no);
			logger.info("trade_status======" + trade_status);
			
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			if(AlipayNotify.verifyNotify(params, alipayInfo)){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码
				logger.info("===请在这里加上商户的业务逻辑程序代码 start===");
				notifyLogger.info("===请在这里加上商户的业务逻辑程序代码 start===");
				
				
				//1.写入日志文件
				XStream xstream = new XStream(new DomDriver());  
		    	xstream.alias("notify", NotifyData.class);  
		    	NotifyData notifyData = (NotifyData)xstream.fromXML(params.get("notify_data"));
		    	notifyData.setNotify_data(params.get("notify_data"));
		    	
				///////////////////
				Map<String,Object> notifyMap = new HashMap<String,Object>();
				notifyMap.put("orderId", null);
//				notifyMap.put("orderId", IntegerUtils.valueOf(out_trade_no));
				notifyMap.put("notifyData", notifyData);
				
				resultMsg = alipayService.insertAlipayNotifyAndLogging(notifyMap);
				
				logger.info("DB操作结果 out_trade_no=== " + out_trade_no + ", resultMsg====" + resultMsg);
				notifyLogger.info("DB操作结果 out_trade_no=== " + out_trade_no + ", resultMsg====" + resultMsg);
				
				
				logger.info("===请在这里加上商户的业务逻辑程序代码 end===");
				notifyLogger.info("===请在这里加上商户的业务逻辑程序代码 end===");
				/*//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				
				if(trade_status.equals("TRADE_FINISHED")){//交易成功且结束，即不可再做任何操作 
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
						
					//注意：
					//该种交易状态只在两种情况下出现
					//1、开通了普通即时到账，买家付款成功后。
					//2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。

//					out.println("success");	//请不要修改或删除
					resultMsg = "success";
				} else if (trade_status.equals("TRADE_SUCCESS")){//交易成功，且可对该交易做操作，如：多级分润、退款等。
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序
						
					//注意：
					//该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。
					
//					out.println("success");	//请不要修改或删除
					resultMsg = "success";
				}*/

				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
					

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{//验证失败
//				out.println("fail");
				resultMsg = "fail";
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			resultMsg = "fail";
		}
		
		 logger.info("resultMsg=====" + resultMsg);
		 notifyLogger.info("resultMsg=====" + resultMsg);
		 
		try {
			PrintWriter writer = response.getWriter();
			
			writer.write(resultMsg);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("=========================== alipay payment notify end ===========================");
		notifyLogger.info("=========================== alipay payment notify end ===========================");
		
		
		
	}

}
