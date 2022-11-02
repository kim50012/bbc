<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<title>订单详情</title>
<style type="text/css">
	body{
		background-color: #F5F5F5;
	}
	.order{
	background-color: #fff;
}
</style>
</head>
<body>
	<div style="margin-bottom: 50px;">
		<div class="order_inf_address">
			<div class="address_title">
				<div class="divCss"></div>
				<span class="getMessage">收货信息</span>
			</div>
			<c:forEach var="list" items="${orderList }" varStatus="status">
				<c:if test="${list.FLAG == 'Y' }">
					<div class="address_content">
						<span class="address_inf">
							${list.PROVINCE_NM }
							${list.CITY_NM }
							${list.DISTRICT_NM }
							${list.ADR_DETAIL }
						</span>
					</div>
					<div class="right_icon">
						<img src="/front/skin/main/img/orderConfirm/right.png" />
					</div>
					<div class="consignee">
						<span class="address_inf">
							${list.ADR_RECEIPTOR_NM } 
							&nbsp;&nbsp;&nbsp;&nbsp;   
							${list.ADR_MOBILE }
						</span>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class=sale_price>
			<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
			<c:forEach var="list" items="${orderList }" varStatus="status">
				<c:if test="${list.FLAG == 'Y' }">
					<span class="title_style">${list.SHOP_NM }</span>   
				</c:if>
			</c:forEach>
		</div>
		<ul class="order">
			<c:forEach var="list" items="${orderList }" varStatus="status">
				<li>
				<a href="/front/detail/detail.htm?shopId=${list.SHOP_ID }&displayId=${list.DISPLAY_ID }">
					<span class="thumb">
						<c:if test="${list.GOODS_LIST_IMG_URL==NULL }">
							<img src="/front/img_prd/demoComp/no_image.png" alt="" />
						</c:if>
						<c:if test="${list.GOODS_LIST_IMG_URL!=NULL }">
							<img src="${list.GOODS_LIST_IMG_URL }" alt="" />
						</c:if>
					</span>
					<span class="title">
						${list.GOODS_NM }
					</span>
					<span class="spec">
						${list.SPEC_NM_1 }:${list.SPEC_VALUE_NM_1 }
						&nbsp;
						${list.SPEC_NM_2 }:${list.SPEC_VALUE_NM_2 }
					</span> 
					<span class="spec">
						X${list.GOODS_QTY }
					</span>
<!-- 					<span class="price"> -->
<%-- 						￥${list.PRICE_UNIT_SUM } --%>
<!-- 					</span> -->
				</a>
			</li> 
			<div class="menu">
				<a class="button_order" href='/front/order/returnGoods.htm?orderId=${list.ORDER_ID }
				&goodsId=${list.GOODS_ID}&displayId=${list.DISPLAY_ID}&priceOptionId=${list.PRICE_OPTION_ID}'>退款/退货</a>
			</div>
			<a href="#" class="splitline_gray"></a>
			</c:forEach>
		</ul>
		
		
<!-- 		<div class="payment"> -->
<!-- 			<div class="address_title"> -->
<!-- 				<div class="divCss"></div> -->
<!-- 				<span class="getMessage">付款信息</span> -->
<!-- 			</div> -->
<%-- 			<c:forEach var="list" items="${orderList }" varStatus="status"> --%>
<%-- 				<c:if test="${list.MIN_FLAG == 'Y' }"> --%>
<!-- 					<div class="address_title"> -->
<!-- 						<div class="order_detail_left"> -->
<!-- 							<span class="address_inf"> -->
<!-- 								商品金额： -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<div class="order_detail_right"> -->
<!-- 							<span class="address_inf"> -->
<%-- 								￥${list.TOTAL_PRICE } --%>
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="address_title"> -->
<!-- 						<div class="order_detail_left"> -->
<!-- 							<span class="address_inf"> -->
<!-- 								运费： -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<div class="order_detail_right"> -->
<!-- 							<span class="address_inf"> -->
<%-- 								￥${list.TOTAL_TRANS_FEE } --%>
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<a href="#" class="splitline_gray" style="margin-top: 10px;"></a> -->
<!-- 					<div class="address_title"> -->
<!-- 						<div class="order_detail_left"> -->
<!-- 							<span class="address_inf"> -->
<!-- 								付款金额： -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<div class="order_detail_right"> -->
<!-- 							<span class="address_inf"> -->
<%-- 								￥${list.TOTAL_TRANS_FEE +list.TOTAL_PRICE} --%>
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->

<!-- 		<div class="payment"> -->
<!-- 			<div class="address_title"> -->
<!-- 				<div class="divCss"></div> -->
<!-- 				<span class="getMessage">付款信息</span> -->
<!-- 			</div> -->
<%-- 			<c:forEach var="list" items="${orderList }" varStatus="status"> --%>
<%-- 				<c:if test="${list.MIN_FLAG == 'Y' }"> --%>
<!-- 					<div class="address_title"> -->
<!-- 						<div class="order_detail_left"> -->
<!-- 							<span class="address_inf"> -->
<!-- 								商品金额： -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<div class="order_detail_right"> -->
<!-- 							<span class="address_inf"> -->
<%-- 								￥${list.TOTAL_PRICE } --%>
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="address_title"> -->
<!-- 						<div class="order_detail_left"> -->
<!-- 							<span class="address_inf"> -->
<!-- 								运费： -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<div class="order_detail_right"> -->
<!-- 							<span class="address_inf"> -->
<%-- 								￥${list.TOTAL_TRANS_FEE } --%>
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<a href="#" class="splitline_gray" style="margin-top: 10px;"></a> -->
<!-- 					<div class="address_title"> -->
<!-- 						<div class="order_detail_left"> -->
<!-- 							<span class="address_inf"> -->
<!-- 								付款金额： -->
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 						<div class="order_detail_right"> -->
<!-- 							<span class="address_inf"> -->
<%-- 								￥${list.TOTAL_TRANS_FEE +list.TOTAL_PRICE} --%>
<!-- 							</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
	</div>
</body>
</html>