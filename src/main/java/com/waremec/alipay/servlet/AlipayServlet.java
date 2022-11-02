package com.waremec.alipay.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 
* @Package com.waremec.alipay.servlet 
* @FileName AlipayServlet
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:08:01 
*  
*/
@WebServlet(urlPatterns = { "/alipay/pay/*"  })
public class AlipayServlet extends AlipayBaseServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlipayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String prefix = "/alipay/pay/";
    	
		// TODO Auto-generated method stub
//		Integer ordreId = IntegerUtils.valueOf(request.getParameter("orderId"));
		
		System.out.println(request.getRequestURI());
		
		String requestURI = request.getRequestURI();
		if(!requestURI.endsWith("/")){
			requestURI = requestURI + "/";
		}
		
		requestURI = requestURI.substring(prefix.length());
		requestURI = requestURI.substring(0,requestURI.indexOf("/"));
		
		System.out.println("===========servelt=============");
		System.out.println("requestURI=" + requestURI);
		
		
	}

}
