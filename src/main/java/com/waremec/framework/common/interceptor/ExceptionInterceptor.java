package com.waremec.framework.common.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.ExceptionHolder;
import com.waremec.framework.common.exception.AjaxException;

public class ExceptionInterceptor extends AbstractInterceptor {
	
	private static final long serialVersionUID = 1L;
 
	private final transient Log logger = LogFactory.getLog(ExceptionInterceptor.class);
	
	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		// TODO Auto-generated method stub
		String result = null;
		try {
			logger.debug("ExceptionInterceptor.intercept() is called!");
			result = ai.invoke();
		}catch(Exception e){
			logger.error(ai.toString(), e);
			ai.getStack().push(new ExceptionHolder(e));
			System.out.println(" is AjaxException===" +  (e instanceof AjaxException));
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("errorMsg", e.getMessage());
			
			String xRequestedWith = request.getHeader("X-Requested-With");
			if (!StringUtils.isEmpty(xRequestedWith)) {
				// ajax请求
				// 转换成ajax异常，并放入stack中
//				ai.getStack().push(new ExceptionHolder(new AjaxException(e.getMessage())));
				ai.getStack().push(new ExceptionHolder(new AjaxException("系统太累了，需要休息一下！")));
				
//				ActionContext actionContext = ai.getInvocationContext();   
//				HttpServletRequest request= (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);   
 				
				
				result = "ajax-error";		
			}else{
				result = "error";
			}
		}
		
		return result;
	}

}
