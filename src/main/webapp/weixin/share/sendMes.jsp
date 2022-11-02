<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0L);
	
	if(request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control","no-cache");
	
	String path = request.getContextPath();
	String basePath = "";
	if(request.getServerPort() == 80){
		
	 basePath = request.getScheme()+"://"+request.getServerName()+ "/";
	}else{
		
	 basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
	
	String strCurrentTime = String.valueOf(System.currentTimeMillis());
	
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="format-detection" content="telephone=no" />
<meta name="viewport" content="initial-scale=0.8, maximum-scale=0.8, user-scalable=no,target-densitydpi=medium-dpi">
<!-- HTTP 1.1 -->  
<meta http-equiv="pragma" content="no-cache">  
<!-- HTTP 1.0 -->  
<meta http-equiv="cache-control" content="no-cache">  
<!-- Prevent caching at the proxy server -->  
<meta http-equiv="expires" content="0">  
<title>模板</title>
   
<style type="text/css">
    .share_item{
    margin-bottom: 20px;
    }
    .share_item input{width:50%;height:30px;border: 1px solid #CFEBF0;}
    .share_item label{width:20%;display: inline-block;text-align: right;}
</style>    
<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#submes').click(function(){
		$('#sub').submit();
	})  
})
</script>
</head>
<body>
		<div style="text-align: center;">
		<form id="sub" action="/wx/share/send_message.htm" method="post">
		<div  class="share_item">模板消息</div>
		<div  class="share_item"><label>SHOPID :</label><input id="" class="textsize" name="shopid" type="text" placeholder="店铺id..."/></div>
		<div  class="share_item"><label>opendID :</label><input id="" class="textsize" name="openid" type="text" placeholder="微信openid..."/></div>
		<div  class="share_item"><label>模板ID :</label><input id="" class="textsize" name="modelid" type="text" placeholder="模板id..."/></div>
		<div  class="share_item"><label >标题:</label><input  id="first" name="title"  placeholder="标题..."/></div>
		<div class="share_item"><label>模板时间:</label><input id="sec"  name="showtime" class="textsize"  type="text" placeholder="模板时间..."/></div>
		<div class="share_item"><label>奖品信息:</label><input id="thr"  name="jiangpinxinxi" class="textsize"  type="text" placeholder="奖品信息..."/></div>
		<div class="share_item"><label>remark:</label><input id=""  name="remark" class="textsize"  type="text" placeholder="活动注明..."/></div>
		
		<div style=" width: 100px; height: 40px;color: white; display: inline-block;line-height: 35px; background-color: #75ba1f;" id="submes" >提交</div>
		</form>
		</div>
</body>
</html>