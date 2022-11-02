<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0L);

	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />
 --%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>客户购买申请管理</title>
<link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/common.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/custom.css" />

<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/CJL.0.1.js"></script>
<script type="text/javascript" src="/admin/js/ImagePreviewd.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
<script type="text/javascript" src="/admin/js/template.js"></script>
<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/admin/js/select2.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin/js/jquery.ui.datepicker-zh-CN.js"></script>

<style type="text/css">
body{margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 16px;}
.text-title-msg{font-size:16px;margin-left:20px;}
.text-title-time{font-size:18px;margin-left:20px;}
.close-html-span{font-size:16px;margin-left:20px;}
</style>

<script type="text/javascript">
	var flag=10;
	$(function() {
		$(".text-title-time").text(flag);
		flag--;
		setInterval(function(){
			$(".text-title-time").text(flag);
			flag--;
			if(flag==0){
				window.close();
			}
		},1000);
		$(".close-html-span").click(function(){
			window.close();
		});
		$(".close-html-span").hover(function(){
			$(this).attr("style","color:#07d;");
		},function(){
			$(this).attr("style","");
		});
	});
	
</script>
</head>

<body>
	<span class="text-title-msg">认证成功</span><br>
	<span  class="text-title-time">10</span>秒后关闭本页面<br>
	<span class="close-html-span">点击立即关闭页面</span>
</body>
</html>