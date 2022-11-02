<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>支付错误页面</title>
<%@ include file="/front/skin/common.jsp"%>
 </head>
 <body style="background-color: #f5f5f5;">
 
 <!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		
		<div class="paymentArea">
			<h3>预支付订单生成失败</h3>
			<h3>订单:${custOrderId}</h3>
			<h2>￥${total_fee2}</h2>
		</div>
		<ul class="paymentInfo">
			<li>
				 收款信息
			</li>
			<li>
				 收款人:<span>${shopNm}</span>
			</li>
			<li>
				 项目:<span>${custOrderId}</span>
			</li>
			<li style="line-height: 30px;color: red;">
				 错误信息:${err_msg } 
			</li>
		</ul>	
		
		<!-- <div>
			<div class="btnWarp">
				<a class="btn1 theme1" onclick="chooseWXPay();">立即支付</a> 
			</div>
		</div> -->
		</section>
	</div>	
 
 </body> 
</html>