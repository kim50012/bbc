<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
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
 <!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>无标题文档</title>  
  
	<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
//写cookies 
function setCookie(name,value) { 
    var Days = 30; 
    var exp = new Date(); 
    exp.setTime(exp.getTime() + Days*24*60*60*1000); 
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString(); 
} 

//读取cookies 
function getCookie(name) { 
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return unescape(arr[2]); 
    else 
        return null; 
} 

//删除cookies 
function delCookie(name) { 
    var exp = new Date(); 
    exp.setTime(exp.getTime() - 1); 
    var cval=getCookie(name); 
    if(cval!=null) 
        document.cookie= name + "="+cval+";expires="+exp.toGMTString(); 
} 


 	function saveInfo(){
 		
 		var username = $('#username').val();
 		var phonenum = $('#phonenum').val();
 		var email = $('#email').val();
 		
 		setCookie("username",username);
 		setCookie("phonenum",phonenum);
 		setCookie("email",email);
 	}
 	
function loadInfo(){
 		
 		var username = getCookie("username") || '';
 		var phonenum = getCookie("phonenum") || '';
 		var email = getCookie("email") || '';
 		
 		$('#username').val(username);
 		$('#phonenum').val(phonenum) ;
 		$('#email').val(email) ;
 		
 	}
function removeInfo(){
 	  delCookie("username")  ;
 		  delCookie("phonenum")  ;
 		  delCookie("email")  ;
 	}
function reload(){
	window.location.reload();
 	}
</script>
 
</head>
<body onload="loadInfo()">
	 <form action="">
			用户名：<input type="text" id="username" ><br>
			电话:<input type="tel" id="phonenum" ><br>
			Email:<input type="email" id="email" ><br>
			
			<input type="button" onclick="saveInfo();" value="保存数据">&nbsp; 
			<input type="button" onclick="removeInfo();" value="删除数据">&nbsp;
			<input type="button" onclick="reload();" value="重新加载">
	 </form>
	 
	 
	 

</body>
</html>