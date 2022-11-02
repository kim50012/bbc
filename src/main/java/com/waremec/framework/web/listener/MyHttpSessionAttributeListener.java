package com.waremec.framework.web.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class MyHttpSessionAttributeListener
 *
 */
@WebListener
public final class MyHttpSessionAttributeListener implements HttpSessionAttributeListener {
	protected final transient Log logger = LogFactory.getLog(this.getClass());
    /**
     * Default constructor. 
     */
    public MyHttpSessionAttributeListener() {
        // TODO Auto-generated constructor stub
//    	logger.info("========MyHttpSessionAttributeListener()========");
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent event)  { 
//         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionAttributeListener.attributeRemoved()========");
//		HttpSession session = event.getSession();
//		// 获取被删除的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
////		logger.info("session范围内名为" + name + "，值为" + value + "的属性被删除了!");
//		logger.info(name + "=" + value);
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionAttributeListener.attributeAdded()========");
//    	HttpSession session = event.getSession();
//		// 获取添加的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
////		logger.info("session范围内添加了名为" + name + "，值为" + value + "的属性!");
//		logger.info(name + "=" + value);
    	
    	
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent event)  { 
         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionAttributeListener.attributeReplaced()========");
//    	HttpSession session = event.getSession();
//		// 获取被删除的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
////		logger.info("session范围内名为" + name + "，值为" + value + "的属性被替换了!");
//		Object newValue = session.getAttribute(name);
//		logger.info(name + "= [old=" + value + ", new=" + newValue + "]");
//		
	
    }
	
}
