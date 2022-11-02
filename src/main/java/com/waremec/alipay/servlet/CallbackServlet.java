package com.waremec.alipay.servlet;

import java.io.IOException;
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
import com.waremec.alipay.service.AlipayService;
import com.waremec.alipay.util.AlipayNotify;
import com.waremec.framework.utilities.ApplicationContextUtils;

/** 
* @Package com.waremec.alipay.servlet 
* @FileName CallbackServlet
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:08:12 
*  
*/
@WebServlet(urlPatterns = { "/alipay/callback/*"  })
public class CallbackServlet extends AlipayBaseServlet {
	private static final long serialVersionUID = 1L;
       
	private final transient Log logger = LogFactory.getLog(CallbackServlet.class);
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CallbackServlet() {
        super();
        logger.info("============CallbackServlet=============");
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		logger.info("=========================== callback start ===========================");
		AlipayService alipayService = ApplicationContextUtils.getBean(AlipayService.class);
		
		String sysId = getSysId(request,"/alipay/callback/");
		logger.info("sysId=" + sysId);
		 
		boolean success = false;
		
		try {
			 AlipayInfo alipayInfo = alipayService.selectAlipayInfoByKey(sysId);
			
			//获取支付宝GET过来反馈信息
			Map<String,String> params = new HashMap<String,String>();
			Map<String, String[]> requestParams = request.getParameterMap();
			for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
				String name = iter.next();
				String[] values = requestParams.get(name);
				String valueStr = "";
				for (int i = 0; i < values.length; i++) {
					valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
				}
				
				logger.info("params==>" +  name + "=" + valueStr);
				
				//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
//				logger.info("valueStr=" + valueStr);
				params.put(name, valueStr);
			}

			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
			//交易状态
			String result = new String(request.getParameter("result").getBytes("ISO-8859-1"),"UTF-8");
			
			String request_token  = new String(request.getParameter("request_token").getBytes("ISO-8859-1"),"UTF-8");

			logger.info("out_trade_no======" + out_trade_no);
			logger.info("trade_no==========" + trade_no);
			logger.info("result============" + result);
			logger.info("request_token=====" + request_token);
			
			request.setAttribute("out_trade_no", out_trade_no);
			request.setAttribute("trade_no", trade_no);
			request.setAttribute("result", result);
			
			//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			
			//计算得出通知验证结果
			boolean verify_result = AlipayNotify.verifyReturn(params,alipayInfo);
			logger.info("verify_result=====" + verify_result);
			if(verify_result){//验证成功
				//////////////////////////////////////////////////////////////////////////////////////////
				//请在这里加上商户的业务逻辑程序代码
				
				//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
				
					//判断该笔订单是否在商户网站中已经做过处理
						//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
						//如果有做过处理，不执行商户的业务程序

				
				//该页面可做页面美工编辑
				success = true;
				//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

				//////////////////////////////////////////////////////////////////////////////////////////
			}else{
				//该页面可做页面美工编辑
				success = false;
				throw new Exception("支付出现异常");
			}
			
		}catch (NullPointerException e) {
			// TODO: handle exception
			success = false;
			request.setAttribute("err_msg",e.getMessage());
			logger.error(e.getMessage());
		}catch (Exception e) {
			// TODO: handle exception
			success = false;
			request.setAttribute("err_msg",e.getMessage());
			
			logger.error(e.getMessage());
		}
		
		 
		logger.info("success============" + success);
		
		request.setAttribute("success", success);
		
		logger.info("=========================== callback end ===========================");
		request.getRequestDispatcher("/alipay/callback.jsp").forward(request, response);
		
		
	}

}
