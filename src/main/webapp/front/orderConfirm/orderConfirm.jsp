<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>订单确认</title>
<meta http-equiv="expires" content="0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">

<link href='http://www.youziku.com/webfont/NameCSS/29854' rel='stylesheet' type='text/css'/>

<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>
<style type="text/css">



</style>


 
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 5,				//SHOP_ORDERCONFIRM
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

var checkStock = 0;
$(function(){
	$('.receive-info').click(function(){
		toGoodsReceipt();
	});
	
	calculatePrice();
	
	$('.coupon-button').click(function(){
		openCouponListPopup();	
	});
	$('#closeBtn').click(function(event){
		couponCancelConfirm();
	 	event.stopPropagation();   
	});

})

function showDetail(shop_Id, display_Id){
	location.href='/front/detail/detail.htm?shopId=' + shop_Id + '&displayId=' + display_Id; 
}

function calculatePrice(){
	var totalPrice =  0;
	var totalGoodsPrice =  0;
	var totalTransPrice = 0;
   $('input[name="priceNums"]').each(function(idx){
	   totalGoodsPrice += parseFloat($(this).val());
   });
   
   //totalGoodsPrice = parseFloat(totalGoodsPrice).toFixed(2);
   
//    $('input[name="transFeeOne"]').each(function(idx){
// 	   totalTransPrice += parseFloat($(this).val());
//    });
   $('input[name="transFees"]').each(function(idx){
	   totalTransPrice += parseFloat($(this).val());
   });
   
   //totalTransPrice = parseFloat(totalTransPrice).toFixed(2);
   
   
   $('#transFee').text(parseFloat(totalTransPrice).toFixed(2));
	$('#priceGoods').text(parseFloat(totalGoodsPrice).toFixed(2));
	$('#priceSum').text((parseFloat(totalTransPrice) + parseFloat(totalGoodsPrice)).toFixed(2));
}
	 	
 
//修改商品的数量
function updateNum(num,priceOptionId){
	
	//$("#buyAmount").val(amount);
	//$("#couponDiscount").val(val);
		
	var orderNum=parseInt($("#orderNum" + priceOptionId).val());
	var stock_In=parseInt($("#stock_In" + priceOptionId).val());
	
	if((orderNum+num) < 1){
		alertTip("商品数量已为最少");
		return;
	}
	if((orderNum+num) > stock_In){
		alertTip("商品数量已达到最大库存");
		return;
	}

	if($("#couponId").val()!="" && $("#couponItemId").val()!=""){
		confirmTip('若修改数量则需要重新选择优惠券。确定要修改数量吗?');
		var times=0;
		$(".confirm-button").click(function(){
			times++;
			if(times==1){
				if(closePopup()){
					//
				}else{
					return false;
				}
			}
		});
// 		if(confirm("若修改数量则需要重新选择优惠券。确定要修改数量吗?")){
// 			couponCancel();
// 		}else{
// 			return;
// 		}
	}
	

	var priceOne=Number($("#priceOne" + priceOptionId).val());
	var priceNum=Number($("#priceNum" + priceOptionId).val());
	var orderRealNum = orderNum+num;
	var priceRealNum = (priceNum+priceOne * num).toFixed(2);
	
	$("#orderNum" + priceOptionId).val(orderRealNum);
	$("#priceNum" + priceOptionId).val(priceRealNum);	

	$("#orderNum" + priceOptionId).data('stock',orderRealNum);
	
	var priceNums=document.getElementsByName("priceNums");
	var priceSum=0;
	for(var i=0;i<priceNums.length;i++){
		priceSum=priceSum+Number(priceNums[i].value);
	}
	var transFeeSum=0;
	var transFees=document.getElementsByName("transFees");
	for(var i=0;i<transFees.length;i++){
		transFeeSum=transFeeSum+Number(transFees[i].value);
	}
	
	$('#priceGoods').text(priceSum.toFixed(2));
	$('#priceSum').text((priceSum+transFeeSum).toFixed(2));
}
//跳转到顾客收货地址页面
function toGoodsReceipt(){
	var addressId="${requestScope.addressMap.ADDRESS_ID}";
	var priceOptionId=$('#priceOptionId').val();
	var orderNums=document.getElementsByName("orderNum");
	var orderNum=0;
	var goodsQtyOne="";
	for(var i=0;i<orderNums.length;i++){
		orderNum=orderNum+Number(orderNums[i].value);
		if(i==orderNums.length-1){
			goodsQtyOne=goodsQtyOne+orderNums[i].value;
		}else{
			goodsQtyOne=goodsQtyOne+orderNums[i].value+',';
		}
	}
	window.location.href="/front/orderConfirm/goodsReceipt.htm?addressId="+addressId+"&priceOptionId="+priceOptionId+"&goods_qty_num="+goodsQtyOne; 
}
//保存订单。
function saveOrderConfirm(){
	 
	var addressProvinceId=$('#addressProvinceId').val();
	var addressCityId=$('#addressCityId').val();
	var addressDistrictId=$('#addressDistrictId').val();
	var addressDetail=$('#addressDetail').text();
	var receiptorName=$('#receiptorName').text();
	var adrMobile=$('#adrMobile').text();
	var priceSum=$('#priceSum').text();
	var transFee=$('#transFee').text();
	var custMsg=$('#custMsg').val();
	var orderNums=document.getElementsByName("orderNum");
	var priceTTBeforeNego=$('#priceGoods').text();
	var priceTTAfterNego=priceTTBeforeNego;
	var orderNum=0;
	var goodsQtyOne="";
	
	for(var i=0;i<orderNums.length;i++){
		orderNum=orderNum+Number(orderNums[i].value);
		if(i==orderNums.length-1){
			goodsQtyOne=goodsQtyOne+orderNums[i].value;
		}else{
			goodsQtyOne=goodsQtyOne+orderNums[i].value+',';
		}
	}
	var priceOptionId=$('#priceOptionId').val();
	var transTypeId=$('#trainsport').find("option:selected").val();
	
	if(addressCityId == ''){
		alertTip('收货地址不能为空!');
		return false;
	}
	//coupon info add 20150526
	var couponId = $("#couponId").val();
	var couponItemId = $("#couponItemId").val();
	
	//*****checkstock*****
	$('input[name="orderNum"]').each(function(idx){

		var $this = $(this);
		var stockIn = $this.data('stock');
		var goodsId  = $this.data('goods');
		var displayId  = $this.data('display');
		var priceOptionId  = $this.data('option');
		/* console.log('========================');
		console.log(stockIn);
		console.log(priceOptionId);
		console.log('========================'); */
		$.ajax({
		 	data:{goodsId:goodsId,displayId:displayId,priceOptionId:priceOptionId},
			type : "POST",
			cache: false,
			url : "/front/orderConfirm/checkStock.htm",  //调用OrderConfirm中的saveOrderConfirm方法，保存订单信息。
			success : function(data) {

				if(stockIn > data.STOCK_NOW){
					checkStock = checkStock + 1;
				}
			},
			error : function(xhr, status, e){
				alertTip("error: " + status);
			}
		});
	});
	if (checkStock > 0) {
		alertTip('"您所挑选的商品已下架"\n或者\n"您所挑选的商品库存不足".');
		return;
	}
	//*****checkstock*****
	
	var param={
		addressProvinceId : addressProvinceId
		,addressCityId : addressCityId
		,addressDistrictId : addressDistrictId
		,addressDetail : addressDetail
		,receiptopName : receiptorName
		,adrMobile : adrMobile
		,priceSum : priceSum
		,transFee : transFee
		,custMsg : custMsg
		,goodsQty : orderNum
		,goodsQtyOne : goodsQtyOne
		,priceOptionId : priceOptionId
		,transTypeId : transTypeId
		,priceTTBeforeNego : priceTTBeforeNego
		,priceTTAfterNego : priceTTAfterNego
		,sysdate: new Date()
		,couponId : couponId
		,couponItemId : couponItemId
	};
	 $.ajax({
	 	data:param,
		type : "POST",
		cache:false,
		url : "/front/orderConfirm/saveOrderConfirm.htm",  //调用OrderConfirm中的saveOrderConfirm方法，保存订单信息。
		success : function(data) {
			if(data.success){
				//alertTip("确认订单成功");
				//alertTip(data.data.orderId);
				//alertTip('fee'+data.data.totalFee);
				$('#orderId','#payform').val(data.data.orderId);
				//$('#totalPrice','#payform').val(data.data.totalFee);
				//$('#custOrderId','#payform').val(data.data.custOrderId);
				//$('#shopNm','#payform').val(data.data.shopNm);
				 
				/* $('#payform').attr('action','/wx/pay/payment.htm?showwxpaytitle=1');
				$('#payform').submit(); */
				
				
				var url = '/wx/pay/payment.htm'
					 + '?showwxpaytitle=1'
					 + '&orderId=' + data.data.orderId 
					 + '&shopId=' + '${sessionScope.sessoinMember.shopId}'
					 + '&o=' + '${sessionScope.sessoinMember.openid}';
					 
				window.location.href = url;
			}else{
				alertTip("确认失败!\n" + data.err_msg);	
			}
		},
		error : function(xhr, status, e){
			alertTip("error: " + status);
		}
	});
}

function openCouponListPopup(){

	var param={
		jobType : "USABLE"
			   };
	$.ajax({
		data : param,
		dataType : "json",
		type : "POST",
		cache : false,
		url : "/front/orderConfirm/getUsebleCouponList.htm", 
		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			if(data.list.length!=0){
				$('#tab1').html("");
				
				for(var i=0;i<data.list.length;i++){
					var htm='';
						htm+='<div class="couponValid" onclick="couponSeleced('+data.list[i].BUY_AMOUNT+','+data.list[i].FACE_VALUE+','+data.list[i].COUPON_ID+','+data.list[i].COUPON_ITEM_ID+');">'+
							 '	<div class="jineValid">'+data.list[i].FACE_VALUE+'</div>'+
							 '	    <div class="coupon_content">'+
							 '			<div style="width: 100%;">'+
							 '				<img alt="" src="/front/skin/main/img/order/content_blue.png" height="30" style="margin-top: 35px;">'+
							 '			</div>'+
							 '			<div style="width: 100%;">'+
							 '				<p class="desc_blue">满<span style="color:#19898e;">'+data.list[i].BUY_AMOUNT+'</span>元即可用<span style="color:#19898e;">'+data.list[i].FACE_VALUE+'</span>元优惠券</p>'+
							 '			</div>'+
						     '		</div>'+
						     '		<div class="coupon_status">'+
							 '			<div class="status">'+
							 '				<img alt="" src="/front/skin/main/img/order/status2.png"  width="54px" /> '+
							 '			</div>'+
							 '			<div class="dateStart">'+
							 '				<p>'+data.list[i].VALIDITY_F_DT+'</p>'+
							 '				<p>'+data.list[i].VALIDITY_T_DT+'</p>'+
							 '			</div>'+
						     ' 		</div>'+
							 '</div>';
					$("#tab1").append(htm);
				}
				
			}
		},
		error : function(a, msg, c) {
			alertTip("error: " + msg);
		}
	});

	$('#container').addClass('on layerZindex');
	$('.couponListPopup').show();
}

function closeCouponListPopup() {
	$('#container').removeClass('on layerZindex');
	$('.couponListPopup').hide();
}

function couponSeleced(amount,val,id,itemId){

	var totalPrice = parseFloat($("#priceGoods").text());
	var priceSum = parseFloat($("#priceSum").text());
	var priceSum1 = priceSum-val;
	var couponAmount = parseFloat(amount);
	
	if(totalPrice < couponAmount){
		alertTip("购买金额满"+couponAmount+"元方可使用的优惠券");
		return;
	}else{
		closeCouponListPopup();
		$(".couponText").html(val+"元优惠券");
		$("#closeBtn").show();
		$("#couponId").val(id);
		$("#couponItemId").val(itemId);
		$("#buyAmount").val(amount);
		$("#couponDiscount").val(val);
		$("#totalTitle").html("优惠后总计 : ");
		//$("#couponPrice").html("-"+val+"优惠");
		
		$('#priceSum').text(parseFloat(priceSum1).toFixed(2)); // parseFloat(priceSum)).toFixed(2)
	}
}

function couponCancelConfirm(){
	
// 	var str = "您确定不使用优惠券吗?";

// 	if(confirm(str)){
// 		couponCancel();
// 	}
	confirmTip('您确定不使用优惠券吗?');
	var times=0;
	$(".confirm-button").click(function(){
		times++;
		if(times==1){
			if(closePopup()){
				couponCancel();
			}else{
				return false;
			}
		}
	});
}

function couponCancel(){

	$(".couponText").html("");
	$("#closeBtn").hide();
	$("#couponId").val("");
	$("#couponItemId").val("");
	$("#buyAmount").val("");
	$("#couponDiscount").val("");
	$("#couponPrice").html("");
	$("#totalTitle").html("合计：");
	
	$('#priceSum').text(parseFloat($("#priceGoods").text()));
}


</script>

</head>
<body>


	<form id="payform" action="" method="post">
		<input type="hidden" id="orderId" name="orderId"	value=""/>
		<input type="hidden" id="totalPrice" name="totalPrice"	value=""/>
		<input type="hidden" id="custOrderId" name="custOrderId"	value=""/>
		<input type="hidden" id="shopNm" name="shopNm"	value=""/>
	</form>

	<!-- =========================== -->
	<input type="hidden" id="priceOptionId" 	value="${requestScope.priceOptionId}"/>
	<input type="hidden" id="addressProvinceId" value="${requestScope.addressMap.ADR_PROVINCE_ID }" />
	<input type="hidden" id="addressCityId" 	value="${requestScope.addressMap.ADR_CITY_ID }" />
	<input type="hidden" id="addressDistrictId" value="${requestScope.addressMap.ADR_DISTRICT_ID }" />
	<!-- =========================== -->
	
	<input type="hidden" id="couponId" name="couponId" value="" />
	<input type="hidden" id="couponItemId" name="couponItemId" value="" />
	<input type="hidden" id="buyAmount" name="buyAmount" value="" />
	
	<div style="display:none;background: #F5F5F5;" class="couponListPopup" >
		<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="closeCouponListPopup();" class="close"/>

	<div class="myCoupon">
		<div class="coupon_title">
			<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
			<span class="title_style">即将过期</span> 	  
		</div>
		<div id="pCont1" class="tabSt1Cont">
			<div style="height: 20px;width: 100%;display: block;"></div>
			<div id="tab1"></div>
		</div>
	</div>
	</div>

	<!-- container -->
	<div id="container"  style="padding-top:0;">
		<section id="contents">
		 	<div class="receive-info" >
			 	<dl> 
				    <dt>
				    	<span class="label-perfix"></span>收货地址
				    </dt> 
				    <dd>
						${requestScope.addressMap.ADR_PROVINCE_NM}
						${requestScope.addressMap.ADR_CITY_NM}
						${requestScope.addressMap.ADR_DISTRICT_NM }
						<span id="addressDetail">${requestScope.addressMap.ADR_DETAIL }</span>
						<c:if test="${requestScope.addressMap.ADR_DETAIL =='' or (empty requestScope.addressMap.ADR_DETAIL) }">请填写收货地址</c:if>
					</dd> 
				    <dd>
				    	<span id="receiptorName">${requestScope.addressMap.RECEIPTOR_NM }</span> 
				    	&nbsp;&nbsp;&nbsp; 
				    	<span id="adrMobile">${requestScope.addressMap.ADR_MOBILE }</span>
				    </dd>
				</dl> 
				
				<div class="arrow-right">
					<img src="/front/skin/main/img/orderConfirm/right01.png" />
				</div>
		 	</div>
		 	
		 	<div class="sale_price">
				<img alt="" src="/front/skin/main/img/triangle.png" class="triangle">
				<span class="title_style">${requestScope.shopName }</span> 	  
			</div>
			
			<!-- Start 商品信息 -->
			<ul class="confimOrder">
				<c:forEach items="${list}" var="list" varStatus="status">
					<li>
						<a>
							<c:set var="imgUrl" value="/front/img_prd/demoComp/no_image.png"></c:set>
							<c:if test="${not empty list.goods_List_Img_Url}">
								<c:set var="imgUrl" value="${list.goods_List_Img_Url }"></c:set>
							</c:if>
							 
							<span class="thumb" onclick="showDetail(${list.shop_Id },${list.display_Id});">
								<img src="${imgUrl }">
								<br/>
								<span class="trans">
									运费:<span id="transFeeOne">${list.trans_fee}</span>元
								</span>
						  	</span>
						 
							<span class="title" onclick="showDetail(${list.shop_Id },${list.display_Id});">${list.desc_Title }</span>
							<span class="name" onclick="showDetail(${list.shop_Id },${list.display_Id});">
								<c:if test="${not empty list.spec_Nm1 }">
									${list.spec_Nm1 }：${list.spec_Value1 } 
								</c:if>
								<c:if test="${not empty list.spec_Nm2}">
									&nbsp;&nbsp;${list.spec_Nm2 }：${list.spec_Value2 }
								</c:if>
							</span>
							<span class="rmb">
								<img src="/front/skin/main/img/orderConfirm/left.png" onclick="updateNum(-1,${list.price_Option_Id});"/>
								<input type="text" id="orderNum${list.price_Option_Id}" name="orderNum" value="${list.goods_qty}" readonly="readonly"
										data-goods="${list.goods_Id}"
										data-display="${list.display_Id}"
										data-option="${list.price_Option_Id}"
										data-stock="${list.goods_qty}" />
								<input type="hidden" id="priceOne${list.price_Option_Id}" value="${list.price_Unit_Sales }" />
								<input type="hidden" id="stock_In${list.price_Option_Id}" value="${list.stock_In}" />
								<img src="/front/skin/main/img/orderConfirm/plus.png" onclick="updateNum(1,${list.price_Option_Id});"/>
								<span class="price">
									￥<input readonly="readonly" id="priceNum${list.price_Option_Id}" name="priceNums" value="${list.price_Unit_Sales*list.goods_qty}0"/>
									<input type="hidden" id="transFees${list.price_Option_Id}" name="transFees" value="${list.trans_fee}"/>
								</span>
							</span>
						</a>
					</li>
				</c:forEach>
			</ul>
				<!-- End 商品信息 -->
				
				<ul class="orderBlank">
					<li>
						<span class="label-perfix"></span>
						<span class="addressWay" style="" >配货方式：</span>
						<select class="trains" style="width: 63%;" id="trainsport">
							<c:forEach items="${mapIdea}" var="idea" varStatus="status">
							<c:if test="${idea.TRANS_TYPE_ID==1}">
								<option value="1" selected="selected" >快递</option>
							</c:if>
							<c:if test="${idea.TRANS_TYPE_ID==2}">
								<option value="2">EMS</option> 
							</c:if>
							<c:if test="${idea.TRANS_TYPE_ID==3}">
								<option value="3">平邮</option>	
							</c:if>
							<c:if test="${idea.TRANS_TYPE_ID==4}">
								<option value="4">自提</option>	
							</c:if>
						</c:forEach>
						</select>
					</li>
					<li>
						 <input class="leaveMessage" id="custMsg" type="text" placeholder="给卖家留言" />	
					</li>
				</ul>
				
			 	<div class="coupon-button" >
					<span class="label-perfix"></span>使用优惠券&nbsp;&nbsp;
					<span class="couponText" ></span>&nbsp;
					<a id="closeBtn"  href="javascript:void(0);" style="display:none;">
						<img alt="" border="0" src="/front/skin/pumeiduo/img/btn_close.png" width="14px" style="vertical-align: middle;padding-bottom:2px;"/>&nbsp;
					</a>
					<div class="arrow-right">
						<img src="/front/skin/main/img/orderConfirm/right01.png" />
					</div>
			 	</div>
			 	<br/>
			 	<br/>
			 	<br/>
			 	<br/>
				
				<div class="footerFixed">
					 <div class="priceTotal">
					 	<span id="totalTitle">合计：</span>
					 	<span id="priceSum" style="color:red;font-size:20px;">00</span>&nbsp;元
					 </div>
					 <div class="summaryTotal">
					 	<span >商品：<span id="priceGoods">00</span>元&nbsp;</span>
					 	<span >物流：<span id="transFee">0</span>元</span>
					 	<span id="couponPrice"></span>
					 </div>
					 <div class="btnGroupR">
						<a class="btn theme1" onclick="saveOrderConfirm();">提交订单</a> 
					</div>
				</div>
				 
		</section>
	</div>
	<!-- //container --> 
		
</body>
</html>