<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
  
  <title>微信分享链接生成页面</title>
  
  <script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
   <style type="text/css">
  	* {
  		padding: 0; margin: 0;
  	}
   
	.inputarea{
		  border: 1px solid red; padding-top: 10px;
		  text-align: center;
	}
	.inputarea input{
		  width: 90%;
		  height: 40px;
		  padding-left: 10px;
	}
  </style>
  <script type="text/javascript">
  
  </script>
    
  
 
 </head>
 <body>
 
 	<div class="inputarea">
 		<input type="text" id="title" 	placeholder="分享标题" 	/>
 	</div>
 	<div class="inputarea">
 		<input type="text" id="desc" 	placeholder="分享描述" 	/>
 	</div>
 	<div class="inputarea">
 		<input type="text" id="link" 	placeholder="分享链接" 	/>
 	</div>
 	<div class="inputarea">
 		<input type="text" id="imgUrl" 	placeholder="分享图标 " 	/>
 	</div>
   

 </body> 
</html>