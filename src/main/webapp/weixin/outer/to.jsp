<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	String url = request.getParameter("url");

	System.out.print("url=" + url);
%>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, no-store" />
<meta http-equiv="expires" content="Wed,26 Feb 1997 08:21:57 GMT" />
<meta http-equiv="refresh" content="0;url=<%=url %>" />
</head>
<body>
</body>
</html>