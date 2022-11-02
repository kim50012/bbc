package com.waremec.framework.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.wpt.admin.domain.MenuLinkType;

public class MenuFilter implements Filter {

	protected final transient Log logger = LogFactory.getLog(this.getClass());

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		String path = servletRequest.getServletPath();

		if (MenuLinkType.hasUrl(path)) {
			int topMenuType = MenuLinkType.getTopMenuType(path);
			servletRequest.setAttribute("topMenuType", topMenuType);
			servletRequest.setAttribute("leftMenuLelel1", MenuLinkType.getLeftMenuLelel1(path));
			servletRequest.setAttribute("leftMenuLelel2", MenuLinkType.getLeftMenuLelel2(path));

		}

		chain.doFilter(request, response);

	}

	@Override
	public void destroy() {
	}

}
