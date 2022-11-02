package com.waremec.framework.web.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.test.context.web.WebAppConfiguration;

/**
 * Application Lifecycle Listener implementation class MyHttpSessionActivationListener
 *
 */
@WebListener
@WebAppConfiguration
public class MyHttpSessionActivationListener implements HttpSessionActivationListener {
	protected final transient Log logger = LogFactory.getLog(this.getClass());
    /**
     * Default constructor. 
     */
    public MyHttpSessionActivationListener() {
        // TODO Auto-generated constructor stub
//    	logger.info("========MyHttpSessionActivationListener()========");
    }

	/**
     * @see HttpSessionActivationListener#sessionDidActivate(HttpSessionEvent)
     */
    public void sessionDidActivate(HttpSessionEvent event)  { 
         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionActivationListener.sessionDidActivate()========");
//    	String id = event.getSession().getId();
//    	logger.info("====session从硬盘回到内存了 id=" +id);
    }

	/**
     * @see HttpSessionActivationListener#sessionWillPassivate(HttpSessionEvent)
     */
    public void sessionWillPassivate(HttpSessionEvent event)  { 
         // TODO Auto-generated method stub
//    	logger.info("========MyHttpSessionActivationListener.sessionWillPassivate()========");
//    	String id = event.getSession().getId();
//    	logger.info("====session被序列化到硬盘了 id=" +id);
    }
	
}
