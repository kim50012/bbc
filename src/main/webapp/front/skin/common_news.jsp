<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<% 
	
	String path = request.getContextPath();
	String basePath = "";
	if(request.getServerPort() == 80){
		
	 basePath = request.getScheme()+"://"+request.getServerName()+ "/";
	}else{		
	 basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
%>
<c:set var="basePath" value="<%=basePath %>" />
	<meta charset="utf-8">
	<meta http-equiv="pragma" 			content="no-cache"> 
	<meta http-equiv="Cache-Control" 	content="no-store, must-revalidate"> 
	<meta http-equiv="expires"			content="Wed, 26 Feb 1997 08:21:57 GMT"> 
	<meta http-equiv="expires" 			content="0"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>대한항공</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="/front/skin/lib/css/default.css" />
	<link rel="stylesheet" href="/front/skin/lib/css/content.css" />
	<link rel="stylesheet" href="/front/skin/lib/css/jquery.bxslider.css" />
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
	<script type="text/javascript" src="<c:url value="/admin/js/template.js" />"></script>
	<script type="text/javascript" src="<c:url value="/admin/js/select2.min.js" />"></script>
	<script type="text/javascript" src="<c:url value="/admin/js/select2_locale_zh-CN.js" />"></script>
	<script src="/front/skin/lib/js/jquery-1.11.3.min.js"></script>
	<script src="/front/skin/lib/js/default.js"></script>
	<script src="/front/skin/lib/js/ui.js"></script>
	<script type="text/javascript" src="/front/skin/lib/js/jquery.bxslider.js"></script>
	  <script id="tpl_news_item"  type="javascript/html">
 			<div class="list">
					<a href="javascript:;"onclick="reqnewsview({{d}},{{e}})">
					<div class="list-img"><img src="images/page/img_list01.jpg" alt="" class="max"/></div>
					<div class="list-txt">
						<p class="list-title">{{a}}</p>
						<p class="list-cont">{{#b}}<br></p>
						<p class="list-date">{{c}}</p>
					</div>
				</a>
			</div>

 </script>