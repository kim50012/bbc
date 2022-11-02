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
<%@ include file="/admin/template/uiInc.jsp"%>
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
<title>获取图文群发总数据</title>
   
<style type="text/css">
	.share_item span{width:50%;height:30px;display: inline-block;margin: 10px;border-width: 1px;}
    .share_item input{width:50%;height:30px;border: 1px solid #CFEBF0;}
    .share_item label{width:15%;display: inline-block;text-align: right;padding-right: 5px;}
    .share_but{ width: 100px; height: 40px;color: white; display: inline-block;text-align:center;line-height: 35px; background-color: #75ba1f;}
</style>    
<script type="text/javascript">

function judgeDate(a,b)   
			{   
			 var date1 = a.replace(/-/g, "/");   
			 var date2 = b.replace(/-/g, "/");      
			 var d1 = new Date(date1);   
			 var d2 = new Date(date2);   
			 return Date.parse(d1) - Date.parse(d2)
			}   
$(function(){
	$(".startdate").datepicker(); 
	$(".tjstart").datepicker(); 
	$(".tjend").datepicker(); 
})
function submes(){
			var id=$('#shopid').val()||'';
			var start=$('#start').val()||'';
			if(id==""){
				alert("店铺ID不能为空!");return;
			};
			if(start==""){
				alert("起始时间不能为空!");return;
			};
		  	$.ajax({
	  		    type: "POST",
	  		    url: "/wx/share/getTjData.htm",
	  		    data: {shopId:id,startDate:start},
	  		    dataType: "json",
	  		    async:"false",
	  		    success: function(res){
		  		  	if(res.success){
		  		  		alert(res.msg);
		  		  	}else{
		  		  		alert(res.msg);
		  		  	}
	  		    	
	  		    },
	  		    error :function(data){
	  					alert("响应错误...");
	  		    }
	  		})
}
	function searchmes(){
		var id=$('#shopid').val()||'';
		var tjstart=$('#tjstart').val()||'';
		var tjend=$('#tjend').val()||'';
	
		if(tjstart==''){
			alert("开始时间不能为空..");return;
		}
		if(tjend==''){
			alert("结束时间不能为空..");return;
		}
		if(tjstart!=''&&tjend!=''){
			var boo=	judgeDate(tjstart,tjend);
			
		 	if(boo>0){
		 		alert("开始时间大于结束时间了..");
		 		return;
		 	}
		 	if(boo<=(-86400000*31)){
		 		alert("大于一个月范围了..");
		 		return;
		 	}
		 	if( jDate(tjend)<86400000){
		 		alert("结束时间超出范围..");
		 		return;
		 	}
		 	$('.share form').submit();
		}
	}
	function jDate(a)   
	{   
	 var date1 = a.replace(/-/g, "/");   
	 var d1 = new Date(date1);   
	 var d2 = new Date();   
	 return d2- Date.parse(d1);
	}   
</script>
</head>
<body>
		<div class="share"  style="text-align: center;">
		<form   method="post" action="/wx/share/getTjData.htm"> 
		<div  class="share_item" ><label></label><span> 获取图文群发总数据</span></div>
		<div  class="share_item"><label>SHOPID : </label><input id="shopid" class="textsize"name="shopId" type="text" placeholder="店铺ID..."/></div>
		<div  class="share_item"><label>统计开始时间 : </label><input style="width:20%;" id="tjstart" class="tjstart" name="startDate" type="text" placeholder="开始时间..."/>
		<label style="width: 7%;">统计结束时间 : </label><input style="width:20%;" id="tjend" class="tjend" name="endDate" type="text" placeholder="结束时间..."/>
		</div>
		<div  class="share_item" ><label></label><span style="color:red;text-align: left;">*可查询微信群发统计数据(一个月范围内)</span></div>
		<div onclick="searchmes()" class="share_but">查询</div>
		<div  class="share_item" ><label></label><span style="color:red;text-align: left;">${tjdata}</span></div>
		</form>
		</div>
</body>
</html>