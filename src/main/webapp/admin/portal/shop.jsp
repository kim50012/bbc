<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  
  <title>微信公众号关联信息</title>
  
  <script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  
 
    
  
  <style type="text/css">
  	* {
  		padding: 0; margin: 0;
  	}
	 
	.item { display:block;word-break: break-all; word-wrap: break-word; margin-bottom: 10px;background-color: #fff;padding: 10px; }
	
	
	#container{
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
		background-color: #fff;
		position: relative;
	}
	
	table{border:0;margin:0;border-collapse:collapse;}
	table td{padding:5;}
	
	.button{
		border: 1px solid green;
		background-color: #e3e3e3;
		padding:5px 20px;
		  border-radius: 20px;
		  display: inline-block;
		  cursor: pointer;
		  font-weight: bold;
	}
	
	.button + .button{
		margin-left: 20px;
	}
  </style>
   <script type="text/javascript">
   function generateUrl(data){
	    console.log(data);
	    $.ajax({
		 	data : data,
			 type : "POST",
			 cache:false,
			 async: false,
			 url : "/wx/share/generate.htm",   
			success : function(res) {
				 console.log('success res:');
				 console.log(res);
				 if(res.success){
				 	$('#weixiUrl').val(res.url);
				 }else{
					$('#weixiUrl').val(res.err_msg);
				 }
				 
			},
			error : function(xhr, status, e){ 
			}
		});
	    
	    
	    
   }
   
   $(function(){
	   
	  /*  $('#shopId').change(function(){
		   var val = $(this).val();
		   if(val != ''){
			   window.location = '/wx/share/index.htm?shopId=' +  val;
		   }
	   }); */
	   
	   $('#ssoBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var menuId = $('#menuId').val() || '';
		   var ssoId  = $('#ssoId').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(menuId == ''){
			   alert('Menu ID不能为空!');
			   return;
		   }
		   if(ssoId == ''){
			   alert('SSO ID不能为空!');
			   return;
		   }
		   if(menuId < 900000000){
			   alert('Menu ID格式不正确');
			   return;
		   }
		   
		   generateUrl({
				type : 'sso'
				,shopId: shopId
				,menuId:menuId
				,ssoId: ssoId
		   });
		   
	   });
	   $('#sso2Btn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var url = $('#url').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(url == ''){
			   alert('URL不能为空!');
			   return;
		   }
		    
		   
		   generateUrl({
				type : 'sso2'
				,shopId: shopId
				,url : url
		   });
		   
	   });
	   $('#menuBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var menuId = $('#menuId').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(menuId == ''){
			   alert('Menu ID不能为空!');
			   return;
		   }
		   
		   generateUrl({
				type : 'menu'
				,shopId: shopId
				,menuId:menuId
		   });
		   
	   });
	   $('#letterBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var openid = $('#openid').val() || '';
		   var letterId = $('#letterId').val() || '';
		   var url = $('#url').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(openid == ''){
			   alert('openid ID不能为空!');
			   return;
		   }
		   if(letterId == ''){
			   alert('Letter ID不能为空!');
			   return;
		   }
		   
		   generateUrl({
				type : 'letter'
				,shopId: shopId
				,letterId: letterId
				,openid: openid
		   });
		   
	   });
	   $('#shareBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var openid = $('#openid').val() || '';
		   var url = $('#url').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(openid == ''){
			   alert('openid ID不能为空!');
			   return;
		   }
		   if(url == ''){
			   alert('URL不能为空!');
			   return;
		   }
		   
		   generateUrl({
				type : 'share'
				,shopId: shopId
				,url: url
				,openid: openid
		   });
		   
	   });
	   $('#eventBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var openid = $('#openid').val() || '';
		   var eventId = $('#eventId').val() || '';
		   var url = $('#url').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(openid == ''){
			   alert('openid ID不能为空!');
			   return;
		   }
		   if(eventId == ''){
			   alert('event ID不能为空!');
			   return;
		   }
		   if(url == ''){
			   alert('URL不能为空!');
			   return;
		   }
		   
		   generateUrl({
				type : 'event'
				,shopId: shopId
				,url: url
				,openid: openid
				,eventId: eventId
		   });
		   
	   });
	   $('#adviceBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var url = $('#url').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(url == ''){
			   alert('URL不能为空!');
			   return;
		   }
		   
		   generateUrl({
				type : 'advice'
				,shopId: shopId
				,url: url
		   });
		   
	   });
	   $('#normalBtn').click(function(){
		   var shopId = $('#shopId').val() || '';
		   var url = $('#url').val() || '';
		   
		   if(shopId == ''){
			   alert('Shop ID不能为空!');
			   return;
		   }
		   if(url == ''){
			   alert('URL不能为空!');
			   return;
		   }
		   
		   generateUrl({
				type : 'normal'
				,shopId: shopId
				,url: url
		   });
		   
	   });
	    
   });
  </script>
  
 </head>
 <body style="background-color: #eee;min-width:1000px;">
  <div id="container" >
  	
  	 <h3>生成公众账号信息</h3>
  	 
  	<table width="100%" >
	  <tr>
		<td width="10%">Shop ID: </td>
		<td width="23%">
		<input type="text" id="shopId"  style="width: 90%; height:26px;" value="${shopId }" />
		</td>
	 
		<td width="10%">公众号名称:</td>
		<td width="23%">
			<input type="text" id="menuId"  style="width: 90%; height:26px;"  />
		</td>
		<td width="10%">orgappid:</td>
		<td width="23%">
			<input type="text" id="eventId"  style="width: 90%; height:26px;"  />
		</td>
	  </tr>
	  <tr>
		<td width="10%">appid:</td>
		<td width="23%">
			<input type="text" id="openid" style="width: 90%; height:26px;"  />
		</td>
	 
		<td width="10%">appSecret:</td>
		<td width="23%">
			<input type="text" id="letterId"  style="width: 90%; height:26px;"  />
		</td>
		<td width="10%">SSO ID:</td>
		<td width="23%">
			<input type="text" id="ssoId"  style="width: 90%; height:26px;"  /> 
		</td>
	  </tr>
	  <tr>
		<td>URL:</td>
		<td colspan="5"><input type="text" id="url" style="width: 98%; height:26px;"  /> </td>
	  </tr>
	  <tr>
		<td colspan="6" style="text-align: center;">
			<div style="padding-top:10px;">
				<span class="button" id="normalBtn">普通</span>
				<span class="button" id="menuBtn">Menu</span>
				<span class="button" id="ssoBtn">Web SSO</span>
				<span class="button" id="sso2Btn">SSO(New)</span>
				<span class="button" id="adviceBtn">通知</span>
				<span class="button" id="eventBtn">Event分享</span>
				<span class="button" id="letterBtn">分享(有Letter)</span>
				<span class="button" id="shareBtn">分享(无Letter)</span>
			</div>
		
		</td>
	  </tr>
	  </table>
	  	 
  </div>
 
 <div style="margin: 10px auto; width: 95%;">
  <div class="item">
  	<h3 style="padding-bottom: 10px;">微信URL:</h3>
  	<textarea id="weixiUrl"  rows="4" style="width:99%;font-size: 15px; resize: none;" disabled="disabled"></textarea>
  	 
  </div> 
 
   <div style="margin: 10px auto; width: 95%;">
   <%--  <div class="item">标题:${shareInfo.title }</div>
 	<div class="item">描述:${shareInfo.desc }</div>  
 	<div class="item">链接:${shareInfo.link }</div>
 	  <div class="item">图标:<img alt="" src="${shareInfo.imgUrl }" style="width: 100px;height: 100px; vertical-align:middle;"></div> --%>
  </div> 

 </body> 
