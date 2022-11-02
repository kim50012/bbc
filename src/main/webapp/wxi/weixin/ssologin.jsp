<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
  
 </head>
 <body>
 
 	returnCode= ${returnMap.returnCode} <br>
 	returnMsg= ${returnMap.returnMsg} <br>
 	openid =  ${returnMap.openid}<br>
 	nickname = ${returnMap.nickname}<br>
 	sex =  ${returnMap.sex}<br>
 	country =  ${returnMap.country}<br>
 	province =  ${returnMap.province}<br>
 	city =  ${returnMap.city}<br>
 	language =  ${returnMap.language}<br>
 	subscribeTime =  ${returnMap.subscribeTime}<br>
 	url =  ${returnMap.url}<br>
 	headImgUrl = 
 	<img style="width: 50%;" alt="" src="${returnMap.headImgUrl }">
 	 
 </body> 
</html>