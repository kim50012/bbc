package com.waremec.alipay.servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/** 
* @Package com.waremec.alipay.servlet 
* @FileName AlipayBaseServlet
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:55 
*  
*/
public abstract class AlipayBaseServlet extends HttpServlet {

	/**  
	* 
	*/
	private static final long serialVersionUID = 1L;

	protected  String getSysId(HttpServletRequest request, String basepath) {
		
		String uri = request.getRequestURI();
		
		if(!uri.endsWith("/")){
			uri = uri + "/";
		}
		
		uri = uri.substring(basepath.length());
		uri = uri.substring(0,uri.indexOf("/"));
		return uri;
	}
}
