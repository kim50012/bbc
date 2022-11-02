<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ include file="/admin/template/tagsInc.jsp"%> 
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title id="js-meta-title">登录超时</title>
<!-- ▲ Common config -->

<style type="text/css"> 

	body{
		background-color: #e9e9e9;
	}

 	 .error-popup{
 	  	border: 1px solid #e5e5e5;
 	  	margin-right: auto;
 	  	margin-left: auto;
 	  	width: 350px;
 	  	margin-top: 100px;
 	  	 /* box-shadow:1px 1px 1px 1px  #d3d3d3;   */
 	  	 background-color: #e5e5e5;
 	 }
 	 
 	 .popup-header{
 	 	background-color: #626262;
 	 	border-top-left-radius:5px;
 	 	border-top-right-radius:5px;
 	 }
 	 
 	 .popup-header-title{
 	 	color: #ffffff;
 	 	height: 40px;
 	 	line-height: 40px;
 	 	margin-left: 20px;
 	 	font-size: 14px;
 	 	display: inline-block;
 	 }
 	 .popup-content{
 	 	 background-color: #fff;
 	 	 border-bottom-left-radius:5px;
 	 	border-bottom-right-radius:5px;
 	 	padding : 30px ;
 	 }
 	 .popup-content-warp{ 
 	 		text-align: center;
 	 		
 	 }
 	 
 	 .tip-msg{
 	 	line-height: 26px;
 	 	font-size: 14px;
 	 }
 	 </style>
<script type="text/javascript">
 	//  alert('系统已经自动退出\n请重新登录');
 	//top.location.href = '/admin';
 $(function(){
	 settime();
 }); 
 
 var countdown=5; 
 var timer;
 function settime() { 
 	if (countdown == 0) { 
 		clearTimeout(timer);
 		countdown = 5;
 		$('.countdown').text(0); //"免费获取验证码"
 		top.location.href = '/admin';
 	} else { 
	 	$('.countdown').text(countdown); 
 		countdown--; 
 		timer = setTimeout(function() { 
 	 		settime(); 
 	 	},1000); 
 	} 
 	
 } 
 	
 </script>
 	 
<body>

<!-- <span id="time" onclick="settime();">dddd</span>
   -->
   
   		<div class="error-popup">
   			<div class="popup-header">
   				<div class="popup-header-title">
   					系统提示
   				</div>
   			</div>
   			<div class="popup-content">
   			 	<div class="popup-content-warp">
   			 		<div class="tip-msg">系统已经自动退出，请重登陆</div>
   			 		<div class="tip-msg"><span class="countdown">5</span>秒后，自动跳转至登陆页面...</div>
   			 		<div style="margin-top:30px;"> 
   			 			 <span class="button" onclick="javascript:top.location.href = '/admin';">
   			 			 	 <span class="button-icon skip"></span>
   			 			        立即跳转
   			 			 </span>
   			 		</div>
   			 	</div>
   			</div>
   		</div>
 	  
</body>
</html>
