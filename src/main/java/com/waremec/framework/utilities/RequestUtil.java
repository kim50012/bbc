package com.waremec.framework.utilities;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class RequestUtil {
	
	public static String getBasePath() {
		return getBasePath(ServletActionContext.getRequest());
	}
	
	public static String getBasePath(HttpServletRequest request) {
		String basePath = "/";
		try {
			String path = request.getContextPath();
			basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
		} catch (Exception e) {
		}
		return basePath;
	} 
	
	public static String getRequestIP() {
		return getRequestIP(ServletActionContext.getRequest());
	}

	public static String getRequestIP(HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		if ("127.0.0.1".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip)) {
			try {
				ip = InetAddress.getLocalHost().getHostAddress();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
		}
		return ip;
	}
	
	public static String getRequestLanguage() {
		return getRequestValue("hl");
	}
	
	public static String getRequestValue(String key) {
		String value = "";
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			value = request.getParameter(key).toString();
		} catch (Exception e) {
		}
		return value;
	}
	 
	public static String getLanguageChangeUrl(String changeto) {
		HttpServletRequest request = ServletActionContext.getRequest();
		// Logs.output(ServletActionContext.getActionMapping());
		String rawUrl = (String) request.getAttribute("javax.servlet.forward.request_uri");
		
		rawUrl = StringUtil.isEmpty(rawUrl) ? request.getRequestURI() : rawUrl;
		if (!StringUtil.isEmpty(request.getQueryString())) {
			rawUrl = rawUrl + "?" + request.getQueryString();
		}
		
		String changeTo = "hl=" + changeto;
		if (StringUtil.isEmpty(getRequestLanguage())) {
			String splitor = "?";
			if (rawUrl.contains("?")) {
				splitor = "&";
			}
			rawUrl = rawUrl + splitor + changeTo;
		} else {
			String originIs = "hl=" + getRequestLanguage();
			rawUrl = rawUrl.replace(originIs, changeTo);
		}
		return rawUrl;
	}
}
