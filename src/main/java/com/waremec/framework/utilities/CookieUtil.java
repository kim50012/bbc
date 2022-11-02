package com.waremec.framework.utilities;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class CookieUtil {
	public static final String COOKIE_LOGIN_ID = "COOKIE_LOGIN_ID";
	public static final String COOKIE_CURRENT_LANGUAGE = "COOKIE_CURRENT_LANGUAGE";
	
	public static String getCookieValue(String name) {
		String value = "";
		try {
			value = getCookie(name).getValue();
		} catch (Exception e) {
		}
		return value == null ? "" : value;
	}
	
	public static void removeCookie(String name){
		try {
			Cookie cookie = getCookie(name);
			if(cookie != null) {
				cookie.setMaxAge(0);
				//cookie.setPath("/");
				ServletActionContext.getResponse().addCookie(cookie);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static Cookie getCookie(String name) {
		Cookie returns = null;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			Cookie[] cookies = request.getCookies();
			if (null != cookies) {
				for (Cookie cookie : cookies) {
					if (name.equalsIgnoreCase(cookie.getName())) {
						returns = cookie;
						break;
					}
				}
			}
		} catch (Exception e) {
		}
		return returns;
	}

	public static void setCookie(String name, String value, int expiry) {
		setCookie(name, value, expiry, DateType.ByHour);
	}

	public static void setCookie(String name, String value, int expiry,
			DateType dateType) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();

			Cookie cookie = getCookie(name);
			if(cookie != null){
				cookie.setValue(value);
			}else{
				cookie = new Cookie(name, value);
			}

			int maxage = -1;
			switch (dateType) {
			case ByDate:
				maxage = 60 * 60 * 24 * expiry;
				break;
			case ByHour:
				maxage = 60 * 60 * expiry;
				break;
			case ByMinute:
				maxage = 60 * expiry;
				break;
			case BySecond:
				maxage = expiry;
				break;
			default:
				maxage = -1;
				break;
			}

			if (maxage > 0) {
				cookie.setPath("/");
				cookie.setMaxAge(maxage);
			}

			response.addCookie(cookie);
		} catch (Exception e) {
		}
	}
}
