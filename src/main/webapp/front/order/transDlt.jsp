<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>物流详情</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css"> 

.ui-transBg {width: 100%; height: 255px; background-color: #ffffff; box-shadow: 0 0 3px #d5d5d5;}

.ui-transTitleBg {width: 100%; height: 30px; margin-top: 20px;}
.ui-transTitle {float: left; height: 30px; line-height: 30px; padding-left: 10px;}

.ui-transStatusBg {width: 100%; height: 30px; margin-top: 10px;}
.ui-transStatus {height: 30px; line-height: 30px; margin-left: 50px; text-align: left;}

.ui-transComBg {width: 100%; height: 30px; margin-top: 10px;}
.ui-transComT {float: left; width: 70px; height: 30px; line-height: 30px; margin-left: 50px; text-align: left;}
.ui-transComC {float: left; height: 30px; line-height: 30px; margin-left: 20px;}
</style>
</head>
<body style="background-color: #f5f5f5;">

	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
			<ul class="clogistics">
			   <li>
					<div class="title">物流信息</div>
				</li>  
				<li>
					 订单号:<span>${requestScope.myTrans.ORDER_OUT_ID}</span>
				</li>
				<li>
					 订单状态： <span>卖家已发货</span>
				</li>
				 
				<li>
					发货时间:<span>${requestScope.myTrans.STS_PAYMENT_DT}</span>
				</li>
				<li>
					运单号:<span>${requestScope.myTrans.TRANS_NO}</span>
				</li>
				<li>
					物流:<span>${requestScope.myTrans.TRANS_COMP_NM}</span>
				</li>
			</ul>	
			
			<div>
		 
			 	<div class="btnWarp">
					<a class="btn1 theme1" onclick="javascript:history.back();">返回</a> 
				</div>
		 
			
			 
			
		</div>
			
		</section>
	</div>
<!-- ui-transTitleBackColor -->
 
</body>
</html>