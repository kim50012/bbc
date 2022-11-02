package com.waremec.framework.utilities;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class ApplicationContextUtils {
	private static  ApplicationContext ac ;
	private static  ApplicationContextUtils applicationContextUtils ;
	
	private ApplicationContextUtils(){
//		System.out.println("=========ApplicationContextUtils=====================");
	}
	
	 public static void init(ServletContext servletContext) {  
		 if(applicationContextUtils == null){
			 applicationContextUtils = new ApplicationContextUtils();
			 ac = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		 }
		 
	 }
	
	
	public static <T> T getBean(Class<T> clazz) {
	   T service = (T) ac.getBean(clazz);
       return service;
    }
	
	
}
