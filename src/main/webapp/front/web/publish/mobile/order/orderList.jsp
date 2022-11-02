<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Order List" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<style>
	#brand .tap > li > a {
		width: 25%;
	}
	#brand .tap .brand-two > a {
    	left: 25%;
    }
	#brand .tap .brand-three > a {
    	left: 50%;
    }
	#brand .tap .brand-four > a {
    	left: 75%;
    }
    .coupon-list ul .bg {
		top: 0px;left: 4px;height: 85px;
    }
</style>
<body>
	<div id="wrap">
		<!--  Brand : S -->
		<section id="brand">
			<div class="top-menu">
				<a href="#" class="on">나의 주문 내역</a>
				<a href="/front/web/publish/mobile/mypage/mypage.htm">나의 페이지로 이동</a>
			</div>
			<ul class="tap" style="max-height:50px;">
				<!-- 브랜드 첫번쨰 : S -->
				<li class="brand-one <c:if test="${orderIndex eq 1 }">on</c:if>">
					<a href="orderList.htm?orderIndex=1">전체주문</a>
					<div class="view">

					</div>
				</li>
				<!-- 브랜드 첫번쨰 : E -->
				
				<!-- 브랜드 두번쨰 : S -->
				<li class="brand-two <c:if test="${orderIndex eq 2 }">on</c:if>">
					<a href="orderList.htm?orderIndex=2">지불대기</a>
					<div class="view">

					</div>
				</li>
				<!-- 브랜드 두번쨰 : E -->
				
				<!-- 브랜드 세번쨰 : S -->
				<li class="brand-three <c:if test="${orderIndex eq 3 }">on</c:if>">
					<a href="orderList.htm?orderIndex=3">배송대기</a>
					<div class="view">

					</div>
				</li>
				<!-- 브랜드 세번쨰 : E -->
				
				<!-- 브랜드 네번쨰 : S -->
				<li class="brand-four <c:if test="${orderIndex eq 4 }">on</c:if>">
					<a href="orderList.htm?orderIndex=4">수령대기</a>
					<div class="view">

					</div>
				</li>
				<!-- 브랜드 네번쨰 : E -->
			</ul>
		</section>
		<!--  Brand : E -->
		
		<section class="coupon-box">

			<!-- ======================================== -->
			<c:forEach var="list" items="${myOrderList }" varStatus="status">
			<!-- orderorder -->
				<c:if test="${list.FLAG eq 'Y' }">
					<section class="box">
						<div class="title">
							<h1 style="font-size: 14px;">오더번호 : ${list.ORDER_OUT_ID }</span></h1>
						</div>
						<div class="coupon-all">
							<h2><a href="#" style="border-top: 0px solid #d6d6d6;border-bottom: 1px solid #d6d6d6;"><i class="ico-warning2"></i>클릭하여 전체 상품 보기</a></h2>
							<div class="scroll">
								<div class="info" style="margin-bottom: -10px;">
				</c:if>
							
				${list.DESC_TITLE } X ${list.GOODS_QTY } (￥ ${list.PRICE_UNIT_SUM })<br>
							
				<c:if test="${list.MIN_FLAG eq 'Y' }">
								</div> 
							</div>
						</div>
						<div class="coupon-list">
							<ul>
								<li class="type1">
									<a href="#">
										<i class="bg" style="width: 95px;background: url(${list.GOODS_LIST_IMG_URL }) no-repeat;background-size: 95px;"></i>
										<p>결제 금액</p>
										<h2><strong>￥ ${list.TOTAL_PRICE }</strong> 元</h2>
										<span>${list.STATUS_NM }</span>
									</a>
								</li>
							</ul>
						</div>	
						
						<c:if test="${list.STATUS_ID eq 10 }">
							<section class="coupon-box" style="position: initial;background-color: #ffffff;text-align: center;padding-bottom: 20px;">
								<div class="btn-group" style="position: initial;">
									<a onclick="cancel('${list.ORDER_ID}')">오더삭제</a>
									<a onclick="paymentSingle('${list.ORDER_ID}')">결제하기</a>
								</div>
							</section>
						</c:if>
						
					</section>
				</c:if>
			</c:forEach>
			<!-- ======================================== -->		
		
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		</section>	


		<%@ include file="/front/web/publish/mobile/common/menu_bottom.jsp"%> 
	
				
		
	</div>
	
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
$(function(){ 
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: '${signInfo.timestamp }', // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
		       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		        		//界面操作
		        		,'closeWindow'				//关闭当前网页窗口接口
		        		,'chooseImage'				//拍照或从手机相册中选图接口
		        		,'uploadImage'				//上传图片接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		wx.onMenuShareTimeline({
	  		    title: '${brandOne.BRAND_NM } - 상품 목록 페이지 입니다.', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${brandOne.BRAND_NM }', // 分享标题
	  		    desc: '상품 목록 페이지 입니다.', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
		});
	  	
	  	
	  	wx.error(function(res){
	  	    
	  	});
	  
});
</script>
<script type="text/javascript">

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

	window.location.href = '/wx/pay/payment.htm' 
						 + '?showwxpaytitle=1' 
						 + '&orderId=' + orderId 
						 + '&shopId=' + '${sessionScope.sessoinMember.shopId}'
						 + '&o=' + '${sessionScope.sessoinMember.openid}' ;
	
}

function cancel(orderId){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	var times=0;
	times++;
	if(times==1){
		$.ajax({
			data: {
				orderId: orderId
			},
			dataType: "json",
			type: "POST",
			url: "/front/order/cancelOrder.htm",
			success: function(data){ 
				if(data.status == "S") {
					alert("삭제 되었습니다.");
					window.location.reload();
				} else {
					alert("오류가 발생했습니다.");
				}
			},
			error: function(a, msg, c){
				alertTip("error: " + msg);
			}
		});
	}
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
</body>
</html>
