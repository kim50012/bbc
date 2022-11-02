<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
	
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Simple jsp page</title>
</head>
<body>
	<h3>Exception:</h3>
	<s:property value="exception" />

	<h3>Stack trace:</h3>
	<pre>
       <s:property value="exceptionStack" />
   </pre>
</body>
</html>