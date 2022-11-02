package com.waremec.framework.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.stereotype.Component;

import com.waremec.framework.utilities.ApplicationContextUtils;
import com.waremec.framework.utilities.LabelUtil;

@Component
public class LabelListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		LabelUtil.reloadLabel(event.getServletContext());
		
		ApplicationContextUtils.init(event.getServletContext());
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
