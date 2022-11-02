package com.waremec.framework.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class MyServletContextListener
 *
 */
@WebListener
public class MyServletContextListener implements ServletContextListener {
	protected final transient Log logger = LogFactory.getLog(this.getClass());
    /**
     * Default constructor. 
     */
    public MyServletContextListener() {
        // TODO Auto-generated constructor stub
//    	logger.info("========MyServletContextListener()========");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent event)  { 
//    	logger.info("========MyServletContextListener.contextInitialized()========");
//    	
//    	ServletContext servletContext = (ServletContext) event.getServletContext();
//		logger.info("----" + servletContext.getServletContextName() + "请求被初始化----");
//    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent event)  {
//    	logger.info("========MyServletContextListener.contextDestroyed()========");
//    	
//    	ServletContext servletContext = (ServletContext) event.getServletContext();
//		logger.info("----" + servletContext.getServletContextName() + "请求被销毁----");
    	
    }
	
}
