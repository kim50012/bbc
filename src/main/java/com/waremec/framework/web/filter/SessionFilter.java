package com.waremec.framework.web.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;
import org.apache.struts2.ServletActionContext;

public class SessionFilter implements Filter {

	protected final transient Log logger = LogFactory.getLog(this.getClass());
	
	public static final Boolean PRINT_ABLE =true;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		String path = request.getServletPath();  
		String method = request.getMethod();

		String requestURL = request.getRequestURL().toString();
		 
		logger.info("########################### SessionFilter ####################################");
		logger.info(requestURL + " " + method );
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = iter.next();
			String[] values =requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			
			//乱码解决，这段代码在出现乱码时使用。 
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			//logger.info("##### params==>" +  name + "=" + valueStr);
		}
		 
		logger.info("########################### SessionFilter ####################################");

		if(path.startsWith("/admin/")){		//back office page
			
			AdminUser adminUser = (AdminUser) request.getSession().getAttribute(SessionUtils.BACK_USER_SESSION);
			
			if(adminUser == null && !isIgnoredUrl(path)){
				if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
					response.setHeader("sessionstatus", "timeout");
					PrintWriter writer = response.getWriter(); 
					writer.print("{\"success\":false}");
					writer.close();
				}else{
					response.sendRedirect("/admin/error/timeout.htm");
					return;
				}
			}
			
		}

		if(path.startsWith("/pms/")){//back office page
			
			AdminUser adminUser = (AdminUser) request.getSession().getAttribute(SessionUtils.BACK_USER_SESSION);
			
			if(adminUser == null && !isIgnoredUrl(path)){
				if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
					response.setHeader("sessionstatus", "timeout");
					PrintWriter writer = response.getWriter(); 
					writer.print("{\"success\":false}");
					writer.close();
				}else{
					//未登录用户跳转到login页面
					request.getSession().setAttribute("goUrl", request.getRequestURL()+"?"+ request.getQueryString());
					response.sendRedirect("/pms/login/login.htm");
					return;
				}
			}
			
		}
		/**
		 * /openwx/
		 */
		if(path.startsWith("/openwx/")){//拦截appid
			
			String key = "/openwx/";
			int appidLength = 18;
			String appid = path.toString().substring(key.length(), ( key.length() + appidLength));
			request.setAttribute("pushAppId", appid);
			request.getServletContext().getRequestDispatcher("/wxthirdparty/thirdpartyCallback.htm").forward(request,response);
			return;
		}
		
		if(path.startsWith("/front/")){	//手机

			HttpSession session = request.getSession();

			setSessionSkin(request, 68);
			SessionSkin sessionSkin = (SessionSkin) session.getAttribute(SessionUtils.SESSION_SKIN);

			if(true){
				SessionMember sessionMember = (SessionMember) 	session.getAttribute(SessionUtils.SESSION_MEMEBER);
				if(sessionMember == null){
					logger.error("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
					logger.error("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
					logger.error("URL=" + path);
					logger.error("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
					logger.error("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
				}
				else {
					String curLang = LabelUtil.getCurrentLanguage();
					String sesLang = sessionMember.getLang();
					if (!curLang.equals(sesLang)) {
						LabelUtil.setLanguage(sessionMember.getLang());
					}
					//logger.info("##### curLang==>" +  curLang);
					//logger.info("##### sesLang==>" +  sesLang);
				}
				
			}
			
			if(!isIgnoredUrl(path)){
				Integer shopId = IntegerUtils.valueOf(request.getParameter("shopId"));
				if(shopId != null){
					if(sessionSkin == null){
						setSessionSkin(request, shopId);
					}else{
						Integer oldShopId = sessionSkin.getShopId();
						if(oldShopId.intValue() != shopId.intValue()){
							setSessionSkin(request, shopId);
							
							SessionMember sessionMember = (SessionMember) session.getAttribute(SessionUtils.SESSION_MEMEBER);
							if(sessionMember != null){
								session.removeAttribute(SessionUtils.SESSION_MEMEBER);
							}
						}
					}
				}else{
					
					if(sessionSkin == null){
						

						if(path.startsWith("/front/bbc/badMatch/getPage.htm?pageName=page2")){	//手机
							return;
						}
						else {
							logger.error("!!!!!!!!!!!!!!!!!!!!!! session filter error 2222");
							
							if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
								response.setHeader("sessionstatus", "timeout");
								PrintWriter writer = response.getWriter(); 
								writer.print("{\"success\":false}");
								writer.close();
							}else{
								String goUrl = request.getRequestURL()+"?"+ request.getQueryString();
								String strPtourl = goUrl;
								goUrl = URLEncoder.encode(goUrl, "utf-8");
								request.getSession().setAttribute("goUrl", goUrl);
								request.getSession().setAttribute("strPtourl", strPtourl);
								request.getRequestDispatcher("/fronterror/timeout.htm").forward(request, response);
								return;
							}
						}
						
					} 
					else {

						SessionMember sessionMember = (SessionMember) session.getAttribute(SessionUtils.SESSION_MEMEBER);
						if(sessionMember == null){

							if(!path.startsWith("/front/bbc/badMatch/getData.htm")){	//手机
								String goUrl = request.getRequestURL()+"?"+ request.getQueryString();
								String strPtourl = goUrl;
								goUrl = URLEncoder.encode(goUrl, "utf-8");
								request.getSession().setAttribute("goUrl", goUrl);
								request.getSession().setAttribute("strPtourl", strPtourl);
								request.getRequestDispatcher("/fronterror/timeout.htm").forward(request, response);
								return;
							}
							
						}
					}
				}
			}

			//TODO 
			if(isReqiredSessionMemberUrl(path)){
				SessionMember sessionMember = (SessionMember) session.getAttribute(SessionUtils.SESSION_MEMEBER);
				if(sessionMember == null){
					
					logger.error("!!!!!!!!!!!!!!!!!!!!!! session filter error 3333");
					
					if("XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))){
						response.setHeader("sessionstatus", "timeout");
						PrintWriter writer = response.getWriter(); 
						writer.print("{\"success\":false}");
						writer.close();
					}else{
						request.getRequestDispatcher("/fronterror/timeout.htm").forward(request, response);
						return;
					}
				}
			}
		}
		 chain.doFilter(req, res);
	}

	@Override
	public void destroy() {
	}

	
	
	private boolean isReqiredSessionMemberUrl(String url){
		return false;
	}
	//检查是否需要登录
	private boolean isIgnoredUrl(String url){
		if(url.startsWith("/admin/login/login.htm")){
			return true;
		} 
		
		else if(url.startsWith("/pms/login/login.htm")){
			return true;
		}
		
		else if(url.startsWith("/admin/login/loginCheck.htm")){
			return true;
		}
		
		else if(url.startsWith("/pms/login/loginCheck.htm")){
			return true;
		}
		
		else if(url.startsWith("/admin/error")){
			return true;
		}

		else if(url.startsWith("/front/bbc/mbr/bbcLogin")){
			return true;
		}

		else if(url.startsWith("/front/bbc/mbr/oauth.htm")){
			return true;
		}

		else if(url.startsWith("/front/bbc/clb/bbcLoginCheck")){
			return true;
		}

		else if(url.startsWith("/front/bbc/mbr/userAddRequest")){
			return true;
		}

		else if(url.startsWith("/front/bbc/mbr/userAddSave")){
			return true;
		}

		else if(url.startsWith("/front/bbc/badMatch/userInsert.htm")){
			return true;
		}
		
		else if(url.startsWith("/admin/login/saveUser.htm")){
			return true;
		}
		else if(url.startsWith("/pms/login/savePMSUser.htm")){
			return true;
		}
		
		else if(url.startsWith("/pms/login/register.htm")){
			return true;
		}
		
		else if(url.startsWith("/admin/login/proveUser.htm")){
			return true;
		}
		
		else if(url.startsWith("/pms/login/proveUser.htm")){
			return true;
		}
		
		else if(url.startsWith("/front/css")){
			return true;
		}else if(url.startsWith("/fronterror")){
			return true;
		}else if(url.startsWith("/marketing/webzine")){
			return true;
		}else if(url.startsWith("/admin/buyApplyManage/buyApplyUpdate")){
			return true;
		}
	 
		return false;
	}
	
	private void setSessionSkin(HttpServletRequest request, Integer shopId){
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
		MainService mainService = wac.getBean(MainService.class);
		
		SessionSkin sessionSkin = mainService.getSessionSkinByShopId(shopId);
		request.getSession().setAttribute(SessionUtils.SESSION_SKIN, sessionSkin);
	}
}
