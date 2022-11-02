<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>我的订单</title>
<%@ include file="/front/main/messageTip.jsp"%>
<style type="text/css">
	.sale_price .title_style {width: 65%;}
</style>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 7,				//SHOP_ORDERLIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

var pricetotal = 0;
var id = 0;
 
function show(obj,orderId) {
	//判断按钮的状态
	if($(obj).find(".selecteImg").css("display")=="none"){
		$(obj).find(".selecteImg").css("display","block");
		$(".selecteAllImg").css("display","block");
// 		var price=$("#price"+orderId).text().substr(1,$("#price"+orderId).text().length);
		var price=$("#price"+orderId).val();
		pricetotal=Number(pricetotal)+parseFloat(price);
	}else{
		$(obj).find(".selecteImg").css("display","none");
		$(".selecteAllImg").css("display","none");
		var price=$("#price"+orderId).text().substr(1,$("#price"+orderId).text().length);
		pricetotal=Number(pricetotal)-Number(price);
	}
	$("#priceTotal").text(pricetotal);
}
function showAll(){
	if($(".selecteAllImg").css("display")=="none"){
		$(".selecteAllImg").css("display","block");
		$(".selecteImg").css("display","block");
		var goodsOrderPrice=$(".goods_class_price").text();
		var array=goodsOrderPrice.split("￥");
		for(var i=0;i<array.length;i++){
			pricetotal=Number(pricetotal)+Number(array[i]);
		}
		$("#priceTotal").text(pricetotal);
	}else{
		$(".selecteAllImg").css("display","none");
		$(".selecteImg").css("display","none");
		$("#priceTotal").text(0);
	}
}
function payment(){
	//checkOrder
	var orderId="";
	var checkOrder=document.getElementsByName("checkOrder");
	for(var i=0;i<checkOrder.length;i++){
		var checkOrderId=checkOrder[i].id;
		if(!($('#'+checkOrderId).css("display")=="none")){
			var selectedId=checkOrderId.split("checkOrder");
			orderId=orderId+selectedId[1]+",";
		}
	}
	orderId=orderId.substr(0,orderId.length-1);
	//到付款页面
}

function paymentSingle(orderId){
	//到付款页面
	
	
	/* $('input[name="orderId"]','#payform').val(orderId);
	$('#payform').attr('action','/wx/pay/repayment.htm?showwxpaytitle=1');
	$('#payform').submit(); */
	
	window.location.href = '/wx/pay/payment.htm' 
						 + '?showwxpaytitle=1' 
						 + '&orderId=' + orderId 
						 + '&shopId=' + '${sessionScope.sessoinMember.shopId}'
						 + '&o=' + '${sessionScope.sessoinMember.openid}' ;
	
}

function cancel(orderId){
	confirmTip('确定要删除该订单吗？');
	var times=0;
	$(".confirm-button").click(function(){
		times++;
		if(times==1){
			if(closePopup()){
				$.ajax({
					data: {
						orderId: orderId
					},
					dataType: "json",
					type: "POST",
					url: "/front/order/cancelOrder.htm",
					success: function(data){ 
						if(data.status == "S") {
							alertTip("取消成功");
							window.location.reload();
						} else {
							alertTip("取消失败");
						}
					},
					error: function(a, msg, c){
						alertTip("error: " + msg);
					}
				});
			}else{
				return false;
			}
		}
	});
}

function remind(orderId){
	$.ajax({
		data: {
			orderId: orderId
		},
		dataType: "json",
		type: "POST",
		url: "/front/order/remindOrder.htm",
		success: function(data){ 
			if(data.status == "S") {
				alertTip("提醒成功");
			} else {
				alertTip("提醒失败");
			}
		},
		error: function(a, msg, c){
			alertTip("error: " + msg);
		}
	});
}

//物流信息
function transShow(orderId) {
	
	if (orderId == '') {
		
		alertTip('请重新加载页面.');
		return;
	}
	location.href = "/front/order/transDlt.htm?orderId="+orderId;
}

//退款申请
function refund(orderId, custSysId) {
	
	if (orderId == '' || custSysId == '') {
		
		alertTip('请重新加载页面.');
		return;
	}
	confirmTip('您确定申请退款?');
	var times=0;
	$(".confirm-button").click(function(){
		times++;
		if(times==1){
			if(closePopup()){
				//
				$.ajax({
					data: {orderId : orderId,isRefundReqis:1},
					dataType: "json",
					type: "POST",
					url: "/front/order/refund.htm",
					success: function(data){
						
						if (data.status == "S") {
							
							alertTip("申请退款成功.");
							location.reload();
						} else {
							
							alertTip("无法申请退款.");
						}
					},
					error: function(a, msg, c){
						alertTip("error: " + msg);
					}
				});
			}else{
				return false;
			}
		}
	});
}
//退款申请
function refundNo(orderId, custSysId) {
	
	if (orderId == '' || custSysId == '') {
		
		alertTip('请重新加载页面.');
		return;
	}
	
	confirmTip('您确定取消申请退款?');
	var times=0;
	$(".confirm-button").click(function(){
		times++;
		if(times==1){
			if(closePopup()){
				$.ajax({
					data: {orderId : orderId,isRefundReqis:0},
					dataType: "json",
					type: "POST",
					url: "/front/order/refund.htm",
					success: function(data){
						
						if (data.status == "S") {
							
							alertTip("取消申请退款成功.");
							location.reload();
						} else {
							
							alertTip("无法取消申请退款.");
						}
					},
					error: function(a, msg, c){
						alertTip("error: " + msg);
					}
				});
			}else{
				return false;
			}
		}
	});
	
// 	if (confirm('您确定取消申请退款?')) {
// 		$.ajax({
// 			data: {orderId : orderId,isRefundReqis:0},
// 			dataType: "json",
// 			type: "POST",
// 			url: "/front/order/refund.htm",
// 			success: function(data){
				
// 				if (data.status == "S") {
					
// 					alertTip("取消申请退款成功.");
// 					location.reload();
// 				} else {
					
// 					alertTip("无法取消申请退款.");
// 				}
// 			},
// 			error: function(a, msg, c){
// 				alertTip("error: " + msg);
// 			}
// 		});
// 	} 
}

//确认收货
function receipt(orderId) {
	
	if (orderId == '') {
		
		alertTip('请重新加载页面.');
		return;
	}
	
	confirmTip('确认已收货?');
	var times=0;
	$(".confirm-button").click(function(){
		times++;
		if(times==1){
			if(closePopup()){
				//
				$.ajax({
					data: {orderId : orderId},
					dataType: "json",
					type: "POST",
					url: "/front/order/receipt.htm",
					success: function(data){
						
						if (data.status == "S") {
							
							alertTip("收货成功.");
							location.reload();
						} else {
							
							alertTip("订单异常,无法收货.");
						}
					},
					error: function(a, msg, c){
						alertTip("error: " + msg);
					}
				});
			}else{
				return false;
			}
		}
	});
}
</script>
</head>
<body>

<%@ include file="/front/skin/common_bottom.jsp"%>

<form id="payform" action="" method="post">
	<input type="hidden" name="orderId"	value=""/>
</form>

	<div class="myorder">
<!-- 		<section id="contents"> -->
			<ul class="tabOrder">
				<li id="tab1" <c:if test="${orderIndex eq 1 }"> class="on" </c:if>><a href="/front/order/orderList.htm">全部</a></li>
				<li id="tab2" <c:if test="${orderIndex eq 2 }"> class="on" </c:if>><a href="/front/order/orderList.htm?orderIndex=2">待付款</a></li>
				<li id="tab3" <c:if test="${orderIndex eq 3 }"> class="on" </c:if>><a href="/front/order/orderList.htm?orderIndex=3">待发货</a></li>
				<li id="tab4" <c:if test="${orderIndex eq 4 }"> class="on" </c:if>><a href="/front/order/orderList.htm?orderIndex=4">待收货</a></li>
				<li id="tab5" <c:if test="${orderIndex eq 5 }"> class="on" </c:if>><a href="/front/order/orderList.htm?orderIndex=5">待评价</a></li>
			</ul>
			<a  class="splitline_gray"></a>
			<div class="tabSt1Cont"  style="<c:if test="${orderIndex eq 2 }">margin-bottom:50px;</c:if>">
				<c:choose>
					<c:when test="${empty myOrderList}">
						<c:choose>
							<c:when test="${orderIndex eq 2}">
				 				<div class="ui-noCount">
									<div class="ui-noCountImg">
										<img alt="" src="/front/skin/main/img/order/payment.png">
									</div>
								 	<div class="ui-noCountText">目前没有待付款订单</div>
								 	<div class="ui-noCountBtn" onclick="location.href='/front/main/home.htm?shopId=${sessionScope.sessionSkin.shopId}'">赶紧去逛</div>
								</div>
							</c:when>
							<c:when test="${orderIndex eq 3}">
				 				<div class="ui-noCount">
									<div class="ui-noCountImg">
										<img alt="" src="/front/skin/main/img/order/delivery.png">
									</div>
								 	<div class="ui-noCountText">目前没有待发货订单</div>
								 	<div class="ui-noCountBtn" onclick="location.href='/front/main/home.htm?shopId=${sessionScope.sessionSkin.shopId}'">赶紧去逛</div>
								</div>
							</c:when>
							<c:when test="${orderIndex eq 4}">
				 				<div class="ui-noCount">
									<div class="ui-noCountImg">
										<img alt="" src="/front/skin/main/img/order/receive.png">
									</div>
								 	<div class="ui-noCountText">目前没有待收货订单</div>
								 	<div class="ui-noCountBtn" onclick="location.href='/front/main/home.htm?shopId=${sessionScope.sessionSkin.shopId}'">赶紧去逛</div>
								</div>
							</c:when>
							<c:when test="${orderIndex eq 5}">
				 				<div class="ui-noCount">
									<div class="ui-noCountImg">
										<img alt="" src="/front/skin/main/img/order/appraise.png">
									</div>
								 	<div class="ui-noCountText">目前没有待评价订单</div>
								 	<div class="ui-noCountBtn" onclick="location.href='/front/main/home.htm?shopId=${sessionScope.sessionSkin.shopId}'">赶紧去逛</div>
								</div>
							</c:when>
							<c:otherwise>
				 				<div class="ui-noCount">
									<div class="ui-noCountImg">
										<img alt="" src="/front/skin/main/img/order/appraise.png">
									</div>
								 	<div class="ui-noCountText">目前没有订单</div>
								 	<div class="ui-noCountBtn" onclick="location.href='/front/main/home.htm?shopId=${sessionScope.sessionSkin.shopId}'">赶紧去逛</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${myOrderList }" varStatus="status">
						<!-- ======================================== -->
							<c:if test="${list.FLAG eq 'Y' }">
								<div class="sale_price">
									<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
									<c:if test="${list.STATUS_ID eq 10  and orderIndex eq 2}">
										<div class="circleDiv" onclick="show(this,'${list.ORDER_ID }');" style="float: left;">
											<img alt="" src="/front/skin/main/img/cart/tick_b.png" class="selecteImg" name="checkOrder" id="checkOrder${list.ORDER_ID }">
											
										</div>
									</c:if>
									
									<span class="title_style">订单: ${list.ORDER_OUT_ID }</span>   
									<c:if test="${orderIndex eq 1 }">
										<div style="float: right;">
								 	 		<div class="desc" style="margin-right: 3px;">
								 	 			<c:choose>
									 	 			<c:when test="${list.IS_REFUND_REQ eq 'Y' or list.STATUS_ID eq 21}">
														<c:choose>
															<c:when test="${list.STATUS_ID eq 60 }">
																退款成功
															</c:when>
															<c:otherwise>
																退款处理中														
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														${list.STATUS_NM }
													</c:otherwise>
												</c:choose>
								 	 		</div> 
								 	 	</div> 
									</c:if>
									
									<c:if test="${orderIndex ne 1 }">
										<div class="more" onclick="">
											<div class=""></div> 
											<div class="desc"></div> 
										</div>   
									</c:if>
									
								</div>
							</c:if>
							<ul class="order">
								<li>
									<a href="/front/order/orderInformation.htm?statusId=${list.STATUS_ID }&orderId=${list.ORDER_ID}">
										<span class="thumb">
											<c:choose>
												<c:when test="${not empty list.GOODS_LIST_IMG_URL }">
													<img src="${list.GOODS_LIST_IMG_URL }" alt="" />
												</c:when><c:otherwise>
													<img src="/front/img_prd/demoComp/no_image.png" alt="" />
												</c:otherwise>
											</c:choose>	
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
										<span class="price">
											￥${list.PRICE_UNIT_SUM }
										</span>
									</a>
								</li> 
							</ul>
							<c:if test="${list.MIN_FLAG eq 'Y' }">
								<a class="split_area" style="height:90px;" >
									<div style="height:25px;">
										<span class="goods_transfee_total">运费 : ${list.TOTAL_TRANS_FEE } 元</span>
									</div>
									<div style="height:25px;">
										<span class="goods_transfee_total">使用优惠 : ${list.COUPON_PRICE } 元</span>
									</div>
									<div style="height:25px;">
										<span class="goods_count_total">共 ${list.TOTAL_QTY } 件商品</span>
										<span class="goods_price_total">实付 : ${list.TOTAL_PRICE } 元</span>
									</div>
									<input type="hidden" id="price${list.ORDER_ID}" value="${list.TOTAL_PRICE }">
								</a>
								<c:if test="${list.STATUS_ID eq 10 }">
									<div style="width: 100%;text-align: right;">
										<a class="button_order"  onclick="cancel('${list.ORDER_ID}')">删除订单</a>
										<a class="button_order" onclick="paymentSingle('${list.ORDER_ID}')">付款</a>
									</div>
									<a class="splitline_gray"></a> 
								</c:if>
								<c:if test="${list.STATUS_ID eq 20 }">
									<div style="width: 100%;text-align: right;">
										<%-- <a class="button_order"  onclick="cancel('${list.ORDER_ID}')">删除订单</a> --%>
										<c:if test="${list.IS_REFUND_REQ eq 'N'}">
											<a class="button_order"  onclick="remind('${list.ORDER_ID}')">提醒发货</a>
											<a class="button_order" onclick="refund('${list.ORDER_ID}','${list.CUST_SYS_ID}');" >退款申请</a>
										</c:if>
										<c:if test="${list.IS_REFUND_REQ eq 'Y'}">
											<a class="button_order" onclick="refundNo('${list.ORDER_ID}','${list.CUST_SYS_ID}');" >撤销申请</a>
										</c:if>
									</div>
									<a  class="splitline_gray"></a> 
								</c:if>
								<c:if test="${list.STATUS_ID eq 30 }">
									<div style="width: 100%;text-align: right;">
										<c:if test="${list.IS_REFUND_REQ eq 'N'}">
											<a class="button_order" onclick="transShow('${list.ORDER_ID}');" >查看物流</a>
											<a class="button_order" onclick="receipt('${list.ORDER_ID}');">确认收货</a>
											<a class="button_order" onclick="refund('${list.ORDER_ID}','${list.CUST_SYS_ID}');" >退款申请</a>
										</c:if>
										<c:if test="${list.IS_REFUND_REQ eq 'Y'}">
											<a class="button_order" onclick="transShow('${list.ORDER_ID}');" >查看物流</a>
											<a class="button_order" onclick="refundNo('${list.ORDER_ID}','${list.CUST_SYS_ID}');" >撤销申请</a>
										</c:if>
									</div>
									<a  class="splitline_gray"></a> 
								</c:if>
								<c:if test="${list.STATUS_ID eq 40 }">
									<div style="width: 100%;text-align: right;">
										<%-- <a class="button_order"  onclick="cancel('${list.ORDER_ID}')">删除订单</a> --%>
										<c:if test="${list.REVIEW_COUNT eq 0 }">
											<a class="button_order" href='/front/order/review.htm?orderId=${list.ORDER_ID}'>评价</a>
										</c:if>
									</div>
									<a  class="splitline_gray"></a> 
								</c:if>
							</c:if>
						</c:forEach>
						<!-- ======================================== -->
					</c:otherwise>
				</c:choose>
				
				<c:if test="${orderIndex eq 2 }">
					<div class="foot" style="display:none;">
						<div class="circleDivFooter" onclick="showAll();">
							<img alt="" src="/front/skin/main/img/cart/tick_b.png" class="selecteAllImg">
						</div>
						<div class="footRight">
							<div class="sum">总计：<span class="sumPrice" id="priceTotal">0</span>元</div>
						</div>
						<div class="jiesuan" onclick="jiesuan();" >
							<a  class="btn-icon icon-edit" onclick="payment();"><span class="btn-tip">付款</span></a>
						</div>
					</div>
				</c:if>
				
			</div>
			


	<br />
	<br />
	<br />
	<br />
			 
			 
<!-- 		</section> -->
	</div>
<!-- 	<div class="bottom_fixed length2">
		<a href="/front/main/main2.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image">
		</a>
		<a href="/front/customer/myPage.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image">
		</a>
	</div> -->
</body>
</html>