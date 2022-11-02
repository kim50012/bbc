package com.waremec.framework.web.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.waremec.wpt.front.domain.PageUrlType;
import com.waremec.wpt.front.service.CounterService;

@Component
public class CounterListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {

		System.out.println("<<<<<<<<<<<counterlisterner>>>>>>");
		
		ServletContext servletContext = sce.getServletContext();
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		
		
		CounterService counterService = (CounterService) context.getBean("counterService");
		
		List<PageUrlType> list = counterService.getPageUrlType();
	 
		synchronized (servletContext) {
			
			servletContext.setAttribute("counterType", list);
		}
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
