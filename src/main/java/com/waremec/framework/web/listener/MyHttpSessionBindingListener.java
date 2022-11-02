package com.waremec.framework.web.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class MyHttpSessionBindingListener
 *
 */
@WebListener
public class MyHttpSessionBindingListener implements HttpSessionBindingListener {
	protected final transient Log logger = LogFactory.getLog(this.getClass());
    /**
     * Default constructor. 
     */
    public MyHttpSessionBindingListener() {
        // TODO Auto-generated constructor stub
//    	logger.info("========MyHttpSessionBindingListener()========");
    }

	/**
     * @see HttpSessionBindingListener#valueUnbound(HttpSessionBindingEvent)
     */
    public void valueUnbound(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
    	logger.info("========MyHttpSessionBindingListener.valueUnbound()========");
    	HttpSession session = event.getSession();
		//  
		String name = event.getName();
		Object value = event.getValue();
		logger.info( "session范围内名为" + name + "，值为" + value + "的属性被删除了!");
    }

	/**
     * @see HttpSessionBindingListener#valueBound(HttpSessionBindingEvent)
     */
    public void valueBound(HttpSessionBindingEvent event)  { 
    	logger.info("========MyHttpSessionBindingListener.valueBound()========");
    	HttpSession session = event.getSession();
		//  
		String name = event.getName();
		Object value = event.getValue();
		logger.info(  "session范围内名为" + name + "，值为" + value + "的属性被被绑定了!");
    }
	
}
