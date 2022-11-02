package com.waremec.framework.web.listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class
 * MyServletContextAttributeListener
 *
 */
@WebListener
public final class MyServletContextAttributeListener implements ServletContextAttributeListener {
	protected final transient Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Default constructor.
	 */
	public MyServletContextAttributeListener() {
		// TODO Auto-generated constructor stub
//		logger.info("========MyServletContextAttributeListener()========");
	}

	/**
	 * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
	 */
	public void attributeAdded(ServletContextAttributeEvent event) {
		// TODO Auto-generated method stub
//		logger.info("========MyServletContextAttributeListener.attributeAdded()========");
//
//		ServletContext application = event.getServletContext();
//		// 获取添加的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
//		logger.info("ServletContext范围内添加了名为" + name + "，值为" + value + "的属性!");

	}

	/**
	 * @see ServletContextAttributeListener#attributeReplaced(ServletContextAttributeEvent)
	 */
	public void attributeReplaced(ServletContextAttributeEvent event) {
		// TODO Auto-generated method stub
//		logger.info("========MyServletContextAttributeListener.attributeReplaced()========");
//		ServletContext application = event.getServletContext();
//		//获取被替换的属性名和属性值  
//        String name = event.getName();  
//        Object value = event.getValue();  
//        logger.info("ServletContext范围内名为"  + name + "，值为" + value + "的属性被替换了!"); 
	}

	/**
	 * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
	 */
	public void attributeRemoved(ServletContextAttributeEvent event) {
		// TODO Auto-generated method stub
//		logger.info("========MyServletContextAttributeListener.attributeRemoved()========");
//		ServletContext application = event.getServletContext();
//		// 获取被删除的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
//		logger.info("ServletContext范围内名为" + name + "，值为" + value + "的属性被删除了!");
	}

}
