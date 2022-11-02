<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- 	请在微信商店中确认订单状态 <br>
	
	商户订单号 : ${out_trade_no }<br>
	支付宝交易号 : ${trade_no }<br>
	交易状态: ${result }<br> --%>
 
<!doctype html>
<html>
<head>
<title>支付宝支付通知页面</title>
<%@ include file="/front/skin/common.jsp"%>
 
 
 <style type="text/css">
 
 .mtitle{
 	position: relative; line-height: 40px; text-align: center;margin-top: 50px; margin-bottom: 50px;
 }
 
 .mtitle img{
 	width: 40px;height: 40px; display: inline-block;
 }
 
 .mtitle span{
 	font-size: 1.4em
 }
 
 .dhr{
 	width: 90%;height: 1px;background-color: #eeeeee; margin-left: auto;margin-right: auto; margin-bottom: 20px;
 }
 
 .mitem{
 	color: #979797; padding-left: 15px;margin-bottom: 20px;
 }
 
 .mconf{
 	padding-left: 15px; font-size: 1em;margin-top: 20px;
 }
 </style>
 </head>
 <body>
 
 <!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		
		<c:choose>
			<c:when test="${success }">
			
			<div class="mtitle">
	 			<img alt="" src="/alipay/images/tick.png">
	 			<span>支付宝付款申请提交成功。</span>
			</div>
			
			
			<div class="dhr" ></div>
			
			<div class="mitem">
				交易号: ${trade_no }
			</div>
			<div class="mitem">
				订单号: ${out_trade_no }
			</div>
			
			
			<div class="mconf">
				付款处理结果可在微信"我的订单"页面中确认。<br>
				谢谢!
			</div>
			
			</c:when>
			<c:otherwise>
			<div class="mtitle">
	 			<img alt="" src="/alipay/images/lose.png">
	 			<span>支付宝付款申请提交失败!</span>
			</div>
			
			
			<div class="dhr" ></div>
			
			<!-- <div class="mitem">
				交易号: 2015042400001000930069635284 
			</div> -->
			<div class="mitem">
				订单号: ${out_trade_no }
			</div>
			
			
			<div class="mconf">
				付款处理结果可在微信"我的订单"页面中确认。<br>
				谢谢!
			</div>
			</c:otherwise>
		</c:choose>
		
			
		 
		</section>
	</div>	
 
 </body> 
</html>



