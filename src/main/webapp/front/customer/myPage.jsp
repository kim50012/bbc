<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>用户中心</title>
<style type="text/css">
	body{
		background-color: #F5F5F5;
	}
</style>
<%@ include file="/front/skin/common.jsp"%>
<script>

//-- Common Page usage Counting
counter({
	 pageTp : 6,				//SHOP_MYPAGE
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

</script>
</head>
<body>

	<div class="user_head">
		<div>
			<div style="float: left;width: 95px;">
				<a href="/front/customer/myInformation.htm">
					<img alt="" src="${customer.WX_IF_HEADIMGURL }" class="head_portrait">
				</a>
			</div>
			<div style="float: left;margin-left: 5px;width: 85px;margin-bottom: 10px;height: 80px;line-height: 138px;">
				<span style="">${customer.CUST_NICK_NM }</span>
			</div>
			<c:if test="${customer.GRADE_NM !=null}">
				<div class="split_line_white"></div>
				<div style="float: left;margin-left: 5px;height: 75px;line-height: 138px;">
					<span >${customer.GRADE_NM }</span>
				</div>
			</c:if>
			
			<div style="float: right;margin-right: 10px;">
				<a href="/front/customer/myInformationUpdate.htm">
					<img alt="" src="/front/skin/main/img/icon/btn_edit.png" class="edit">
				</a>
			</div>
		</div>
	</div>
	<div class="user_order">
		<div style="float: left;width: 3%;">
			<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
		</div>
		<div onclick="location.href='/front/order/orderList.htm?orderIndex=2'" style="float: left;width: 24%;text-align: center;">
			<center>
				<div class="icon_order_obligation"></div>
			</center>
			<div class="icon_spec">待付款</div>
		</div>
		<div onclick="location.href='/front/order/orderList.htm?orderIndex=3'" style="float: left;width: 24%;text-align: center;">
			<center>
			<div class="icon_order_tobeshipped"></div>
			</center>
			<div class="icon_spec">待发货</div>
		</div>
		<div onclick="location.href='/front/order/orderList.htm?orderIndex=4'" style="float: left;width: 24%;text-align: center;">
			<center>
			<div class="icon_order_receive"></div>
			</center>
			<div class="icon_spec">待收货</div>
		</div>
		<div onclick="location.href='/front/order/orderList.htm?orderIndex=5'" style="float: left;width: 24%;text-align: center;">
			<center>
			<div class="icon_order_evaluate"></div>
			</center>
			<div class="icon_spec">待评价</div>
		</div>
	</div>
	<div class="user_consume">
		<div class="user_consume_note">
			<span style="margin-left: 5px;">购买金额</span>
			<div class="user_note">
				<c:choose>
					<c:when test="${customer.PRICE_SUM==null }">0</c:when>
					<c:otherwise>${customer.PRICE_SUM }</c:otherwise>
				</c:choose>
			</div>
		</div> 
		<div class="user_integral_note">
			<div style="float: left;width: 3%;">
				<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
			</div>
			<span  style="margin-left: 5px;">积分</span>
			<div class="user_note">
				<c:choose>
					<c:when test="${customer.CUST_POINT==null }">0</c:when>
					<c:otherwise>${customer.CUST_POINT }</c:otherwise>
				</c:choose>
			</div>
		</div> 
	</div>
	<div class="user_link">
		<ul>
			<li onclick="location.href='/front/order/orderList.htm?shopId=${sessionScope.sessionSkin.shopId}'" >
				<img src="/front/skin/main/img/order/icon_order.png" class="icon_link"/>
				<span class="spec_link">全部订单</span>
				<img src="/front/skin/main/img/order/right.png" class="link_right"/>
			</li>
			<li onclick="location.href='/front/cart/cart.htm?shopId=${sessionScope.sessionSkin.shopId}'">
				<img src="/front/skin/main/img/order/icon_cart.png" class="icon_link"/>
				<span class="spec_link">购物车</span>
				<img src="/front/skin/main/img/order/right.png" class="link_right"/>
			</li>
			<li onclick="location.href='/front/favorites/favorites.htm?shopId=${sessionScope.sessionSkin.shopId}'">
				<img src="/front/skin/main/img/order/icon_collect.png" class="icon_link"/>
				<span class="spec_link">收藏列表</span>
				<img src="/front/skin/main/img/order/right.png" class="link_right"/>
			</li>
			<li onclick="location.href='/front/order/couponList.htm?shopId=${sessionScope.sessionSkin.shopId}'">
				<img src="/front/skin/main/img/order/icon_coupon.png" class="icon_link"/>
				<span class="spec_link">我的优惠券</span>
				<img src="/front/skin/main/img/order/right.png" class="link_right"/>
			</li>
			<li onclick="location.href='/front/customer/preViewList.htm?shopId=${sessionScope.sessionSkin.shopId}'">
				<img src="/front/skin/main/img/order/comment.png" class="icon_link"/>
				<span class="spec_link">我的评论</span>
				<img src="/front/skin/main/img/order/right.png" class="link_right"/>
			</li>
			<li onclick="location.href='/front/customer/likeList.htm?shopId=${sessionScope.sessionSkin.shopId}'">
				<img src="/front/skin/main/img/order/praise.png" class="icon_link"/>
				<span class="spec_link">我的点赞</span>
				<img src="/front/skin/main/img/order/right.png" class="link_right"/>
			</li>
		</ul>
	</div>
	

<%@ include file="/front/skin/common_bottom.jsp"%>	
	
<!-- 	<div class="bottom_fixed length2"> -->
<!-- 		<a href="/front/main/main2.htm"> -->
<!-- 			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image"> -->
<!-- 		</a> -->
<!-- 	</div> -->
</body>
</html>