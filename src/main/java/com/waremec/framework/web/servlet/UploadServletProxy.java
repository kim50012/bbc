package com.waremec.framework.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * Servlet implementation class CoreServletProxy
 */
public class UploadServletProxy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	 Log logger = LogFactory.getLog(UploadServletProxy.class);
	 
	 private String targetBean;
	 private UploadServlet proxy;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServletProxy() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		 this.targetBean = "uploadServlet";
        getServletBean();
        proxy.init(getServletConfig());
        
        logger.info(targetBean + "初始化成功................");
        System.out.println(targetBean + "初始化成功................");
	}

	
    private void getServletBean() {
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        this.proxy = (UploadServlet) wac.getBean(targetBean);
    }
    

    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        proxy.service(req, res);
    }

}
