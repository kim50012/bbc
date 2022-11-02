package com.waremec.framework.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println(request.getServletPath());
//		System.out.println(request.getRequestURI());
		String requestUrl = request.getRequestURI();
		if(requestUrl.equals("/admin") || requestUrl.equals("/admin/")){
			response.sendRedirect("/admin/login/login.htm");
		}else if(requestUrl.equals("/portal") || requestUrl.equals("/portal/")){
			response.sendRedirect("/portal/index.htm");
		}else if(requestUrl.equals("/portal/bisai") || requestUrl.equals("/portal/bisai/")){
			response.sendRedirect("/hsad/index.htm");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
