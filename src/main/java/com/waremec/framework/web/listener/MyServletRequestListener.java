package com.waremec.framework.web.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class MyServletRequestListener
 *
 */
@WebListener
public class MyServletRequestListener implements ServletRequestListener {
	protected final transient Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Default constructor.
	 */
	public MyServletRequestListener() {
		// TODO Auto-generated constructor stub
//		logger.info("========MyServletRequestListener()========");
	}

	/**
	 * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
	 */
	public void requestDestroyed(ServletRequestEvent sre) {
		// TODO Auto-generated method stub
//		logger.info("========MyServletRequestListener.requestDestroyed()========");
//		HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
//		logger.info("----发向" + request.getRequestURI() + "请求被销毁----");
	}

	/**
	 * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
	 */
	public void requestInitialized(ServletRequestEvent sre) {
		// TODO Auto-generated method stub
//		logger.info("========MyServletRequestListener.requestInitialized()========");
//		HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
//		logger.info("----发向" + request.getRequestURI() + "请求被初始化----");
	}

}
