<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.baidu.ueditor.ActionEnter" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

    request.setCharacterEncoding( "utf-8" );
	response.setHeader("Content-Type" , "text/html");
	
	String rootPath = application.getRealPath( "/" );
	String serverConfig = new ActionEnter( request, rootPath ).exec();
//	System.out.println("==== ueditor config ====" );
//	System.out.println("rootPath====>" + rootPath);
// 	System.out.println("config======>" + serverConfig);
//	System.out.println("==== ueditor config ====" );
	out.write(serverConfig);
	
%>