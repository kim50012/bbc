<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>我的优惠券</title>
<link href='http://www.youziku.com/webfont/NameCSS/29854' rel='stylesheet' type='text/css'/>
<style type="text/css">

</style>
</head>
<body style="background: #F5F5F5;">

	<div class="myCoupon">
		<ul class="coupon_tabSt1 tab">
			<li  class="on">
				<a href="#pCont1">
					<span>全部</span>
				</a>
			</li>
			<li>
				<a href="#pCont2">
					<span>即将过期</span>
				</a>
			</li>
		</ul>
		<div id="pCont1" class="tabSt1Cont">
			<div style="height: 60px;width: 100%;display: block;"></div>
			<c:forEach var="list" items="${couponAll }" varStatus="status">
				<c:choose>
					<c:when test="${list.STATUS_ID eq '2' }">
						<div class="couponValid">
							<div class="jineValid">${list.FACE_VALUE }</div>
							<div class="coupon_content">
								<div style="width: 100%;">
									<img alt="" src="/front/skin/main/img/order/content_blue.png" height="30" style="margin-top: 35px;">
								</div>
								<div style="width: 100%;">
									<p class="desc_blue">满<span style="color:#19898e;">${list.BUY_AMOUNT }</span>元即可用<span style="color:#19898e;">${list.FACE_VALUE }</span>元优惠券</p>
								</div>
							</div>
							<div class="coupon_status">
								<div class="status">
									<img alt="" src="/front/skin/main/img/order/status2.png"  width="54px" /> 
								</div>
								<div class="dateStart">
									<p>${list.VALIDITY_F_DT }</p>
									<p>${list.VALIDITY_T_DT }</p>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="couponInvalid">
							<div class="jineInvalid">${list.FACE_VALUE }</div>
							<div class="coupon_content">
								<div style="width: 100%;">
									<img alt="" src="/front/skin/main/img/order/content_gray.png" height="30" style="margin-top: 35px;">
								</div>
								<div style="width: 100%;">
									<p class="desc_gray">满${list.BUY_AMOUNT }元即可用${list.FACE_VALUE }元优惠券</p>
								</div>
							</div>
							<div class="coupon_status">
								<div class="status">
									<c:if test="${list.STATUS_ID eq '3' }">
										<img alt="" src="/front/skin/main/img/order/status3.png"  width="54px" /> 
									</c:if>
									<c:if test="${list.STATUS_ID eq '4' }">
										<img alt="" src="/front/skin/main/img/order/status4.png"  width="54px" /> 
									</c:if>
								</div>
								<div class="dateStart">
									<p>${list.VALIDITY_F_DT }</p>
									<p>${list.VALIDITY_T_DT }</p>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div id="pCont2" class="tabSt1Cont">
		<div style="height: 60px;width: 100%;display: block;"></div>
			<c:forEach var="list" items="${couponOutOfDate }" varStatus="status">
				<div class="couponValid">
					<div class="jineValid">${list.FACE_VALUE }</div>
					<div class="coupon_content">
						<div style="width: 100%;">
							<img alt="" src="/front/skin/main/img/order/content_blue.png" height="30" style="margin-top: 35px;">
						</div>
						<div style="width: 100%;">
							<p class="desc_blue">满<span style="color:#19898e;">${list.BUY_AMOUNT }</span>元即可用<span style="color:#19898e;">${list.FACE_VALUE }</span>元优惠券</p>
						</div>
					</div>
					<div class="coupon_status">
						<div class="status">
							<img alt="" src="/front/skin/main/img/order/status2.png"  width="54px" /> 
						</div>
						<div class="dateStart">
							<p>${list.VALIDITY_F_DT }</p>
							<p>${list.VALIDITY_T_DT }</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>