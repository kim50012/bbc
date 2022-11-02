<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
 </head>
 <body style="background-color: #eee;min-width:1000px;">
 
 

 
 
  <div >
  	 <c:choose>
	  <c:when test="${success }">
	  同步成功
	  </c:when>
	 <c:otherwise>
	  同步失败<br>
	  失败原因: ${err_msg }
	 </c:otherwise>
	 </c:choose>
    </div>

 </body> 
</html>