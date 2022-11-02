package com.waremec.alipay.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

 
/** 
* @Package com.waremec.alipay.servlet 
* @FileName MerchantServlet
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:08:20 
*  
*/
@WebServlet(name = "merchantServlet", urlPatterns = { "/alipay/merchant/*" })
public class MerchantServlet extends AlipayBaseServlet {
	private static final long serialVersionUID = 1L;
	private final transient Log logger = LogFactory.getLog(MerchantServlet.class);    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MerchantServlet() {
        super();
        logger.info("============MerchantServlet=============");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.info("============PaymentNotifyServlet.doGet=============");
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.info("============PaymentNotifyServlet.doPost=============");
	}

}
