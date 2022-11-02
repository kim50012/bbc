package com.waremec.framework.web.listener;

import javax.servlet.ServletRequestAttributeEvent;
import javax.servlet.ServletRequestAttributeListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Application Lifecycle Listener implementation class
 * MyServletRequestAttributeListener
 *
 */
@WebListener
public class MyServletRequestAttributeListener implements ServletRequestAttributeListener {

	protected final transient Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Default constructor.
	 */
	public MyServletRequestAttributeListener() {
		// TODO Auto-generated constructor stub
//		logger.info("========MyServletRequestAttributeListener()========");
	}

	/**
	 * @see ServletRequestAttributeListener#attributeAdded(ServletRequestAttributeEvent)
	 */
	public void attributeAdded(ServletRequestAttributeEvent event) {
//		// TODO Auto-generated method stub
//		logger.info("========MyServletRequestAttributeListener.attributeAdded()========");
//		ServletRequest request = event.getServletRequest();
//		// 获取添加的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
//		logger.info( "request范围内添加了名为" + name + "，值为" + value + "的属性!");
	}

	/**
	 * @see ServletRequestAttributeListener#attributeRemoved(ServletRequestAttributeEvent)
	 */
	public void attributeRemoved(ServletRequestAttributeEvent event) {
//		// TODO Auto-generated method stub
//		logger.info("========MyServletRequestAttributeListener.attributeRemoved()========");
//		ServletRequest request = event.getServletRequest();
//		// 获取被删除的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
//		logger.info(   "request范围内名为" + name + "，值为" + value + "的属性被删除了!");
	}

	/**
	 * @see ServletRequestAttributeListener#attributeReplaced(ServletRequestAttributeEvent)
	 */
	public void attributeReplaced(ServletRequestAttributeEvent event) {
//		// TODO Auto-generated method stub
//		logger.info("========MyServletRequestAttributeListener.attributeReplaced()========");
//		ServletRequest request = event.getServletRequest();
//		// 获取被删除的属性名和属性值
//		String name = event.getName();
//		Object value = event.getValue();
//		logger.info(  "request范围内名为" + name + "，值为" + value + "的属性被替换了!");
	}

}
