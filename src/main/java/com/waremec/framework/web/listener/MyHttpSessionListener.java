package com.waremec.framework.web.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class MyHttpSessionListener
 *
 */
@WebListener
public class MyHttpSessionListener implements HttpSessionListener {

	protected final transient Log logger = LogFactory.getLog(this.getClass());
    /**
     * Default constructor. 
     */
    public MyHttpSessionListener() {
        // TODO Auto-generated constructor stub
//    	logger.info("========MyHttpSessionListener()========");
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent event)  { 
//         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionListener.sessionCreated()========");
//    	
//    	HttpSession session = event.getSession();
//		// 获取被删除的属性名和属性值
//		String id = session.getId();
//		logger.info("---- session id=" + id + "请求被初始化----");
    	
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent event)  { 
//         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionListener.sessionDestroyed()========");
//    	HttpSession session = event.getSession();
//		// 获取被删除的属性名和属性值
//		String id = session.getId();
//		logger.info("---- session id=" + id + "请求被销毁----");
    }
	
}
