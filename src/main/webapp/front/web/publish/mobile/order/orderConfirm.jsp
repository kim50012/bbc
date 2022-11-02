<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>
	<div id="wrap">


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
		
		<input type="hidden" id="couponId" name="couponId" value="" />
		<input type="hidden" id="couponItemId" name="couponItemId" value="" />
		<input type="hidden" id="buyAmount" name="buyAmount" value="" />
		
		<!-- =========================== -->
		
		<div style="display:none;background: #F5F5F5;" class="couponListPopup" >
<!-- 			<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="closeCouponListPopup();" class="close"/> -->
	
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
	

		<!-- =========================== -->
		<!-- 본문 시작 -->
		<!-- =========================== -->
		<section id="container" class="mypage">
			<div class="location">
				<h2>주문하기</h2>
			</div>		 	
		 	
			<c:if test="${requestScope.addressMap.ADR_DETAIL =='' or (empty requestScope.addressMap.ADR_DETAIL) }">
				<div class="box" style="line-height: 300%;padding-top: 20px;padding-bottom: 20px;" id="receive-info">
					<p style="line-height: 300%;"><a href="#">배송지 : <strong class="txt-red">배송지를 입력해주세요.</strong></a><span id="addressDetail"></span><span id="adrMobile"></span></p>
				</div>
			</c:if>
			
			<c:if test="${requestScope.addressMap.ADR_DETAIL !='' and (not empty requestScope.addressMap.ADR_DETAIL) }">
				<div class="box" style="line-height: 300%;padding-top: 10px;padding-bottom: 10px;">
					<p style="line-height: 300%;">
						<a href="#" style="background: none;">
							<strong class="txt-black" id="receiptorName">${requestScope.addressMap.RECEIPTOR_NM }</strong> <span id="adrMobile">${requestScope.addressMap.ADR_MOBILE }</span>
							<br>
							${requestScope.addressMap.ADR_PROVINCE_NM}${requestScope.addressMap.ADR_CITY_NM}${requestScope.addressMap.ADR_DISTRICT_NM }<span id="addressDetail">${requestScope.addressMap.ADR_DETAIL }</span>
						</a>
					</p>
				</div>
				<div class="box" style="line-height: 300%;padding-top: 20px;padding-bottom: 20px;" id="receive-info">
					<p style="line-height: 300%;"><a href="#"><strong class="txt-red">+ 배송지 신규 등록</strong></a><span id="addressDetail"></span><span id="adrMobile"></span></p>
				</div>
			</c:if>
			
			<div class="box" style="margin-bottom: 0px;">
				<p><a href="#" style="background: none;">상품목록</a></p>
			</div>
			
			

			<section class="product-list">
				<ul>
					
					<c:set var="totalAmount" value="${0 }" />
					<c:forEach var="list" items="${list}" varStatus="status">
					
						<c:set var="totalAmount" value="${totalAmount + (list.price_Unit_Sales * list.goods_qty) }" />
					
						<!-- 상품 하나 : S -->
						<li class="item-box" id="liItem_${list.display_Id}">
							<!-- 해당상품 선택 -->
							<div class="input-checkbox input-mypage" style="display:none;">
								<label>
									<i class="checkbox">choice</i>
									<input type="checkbox" id="chkProd" name="chkProd" value="${list.display_Id}" checked/>
								</label>
							</div>
							
							<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId=${list.display_Id}"><img src="${list.goods_List_Img_Url }" alt="" /></a></p>
							<div class="text-box">
								<h2>${list.desc_Title}</h2>
								<h3 style="margin-right: 10px;">${list.desc_Detail}</h3>
								
								<p class="cache-compare">
									판매가 ￥ ${list.price_Unit_Sales}
								</p>
								
								<p class="price"><!-- 금액 -->
									￥ ${list.price_Unit_Sales}
								</p>
								
								<input type="hidden" id="displayId_${list.display_Id}" value="${list.display_Id}" />
								<input type="hidden" id="cartUnitPrice_${list.display_Id}" value="${list.price_Unit_Sales}" />
								<input type="hidden" id="cartTotalPrice_${list.display_Id}" value="${list.trans_fee * list.goods_qty}" />
								
								<div class="volume">
									<button class="btn-minus" value="">
										<img src="/front/web/publish/img/content/btn-minus.gif" alt="" />
									</button>
									<input type="number" id="orderNum${list.display_Id}" name="orderNum" value="${list.goods_qty}" title="상품갯수" 
										data-goods="${list.goods_Id}"
										data-display="${list.display_Id}"
										data-option="${list.display_Id}"
										data-stock="${list.goods_qty}" />
									<button class="btn-plus" value="">
										<img src="/front/web/publish/img/content/btn-plus.gif" alt="" />
									</button>
								</div>
								
							</div>
						</li>
						<!-- 상품 하나 : E -->
					
					</c:forEach>
					
				</ul>
				
			</section>	
			

			<div class="box" style="margin-top: 10px;margin-bottom: 0px;">
				<p><a href="#" style="background: none;">배송 추가 요청 사항</a></p>
			</div>	
			<div class="box">
				<div class="find-box" style="display:block;">
					<div class="input-box">			
						<div class="email" style="display:none;">
							<div>
							<select id="trainsport">
								<c:forEach items="${mapIdea}" var="idea" varStatus="status">
								<c:if test="${idea.TRANS_TYPE_ID==1}">
									<option value="1" selected="selected" >택배</option>
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
							</div>
						</div>				
						
						<div class="email">
							<div>
								<input id="custMsg" type="text" placeholder="배송 요청 사항을 남겨 주세요." />
							</div>
						</div>	
					</div>
				</div>	
				<br><br><br><br>
			</div>	

						 
		 	<div class="coupon-button" style="display:none;">
				<span class="label-perfix"></span>使用优惠券&nbsp;&nbsp;
				<span class="couponText" ></span>&nbsp;
				<a id="closeBtn"  href="javascript:void(0);" style="display:none;">
<!-- 					<img alt="" border="0" src="/front/skin/pumeiduo/img/btn_close.png" width="14px" style="vertical-align: middle;padding-bottom:2px;"/>&nbsp; -->
				</a>
				<div class="arrow-right">
					<img src="/front/skin/main/img/orderConfirm/right01.png" />
				</div>
		 	</div>
		 	
			
			<div class="footerFixed" style="display:none;">
				 <div class="priceTotal">
				 	<span id="totalTitle">合计：</span>
<%-- 				 	<span id="priceSum" style="color:red;font-size:20px;">${totalAmount }</span>&nbsp;元 --%>
				 </div>
				 <div class="summaryTotal">
				 	<span >商品：<span id="priceGoods">${totalAmount }</span>元&nbsp;</span>
				 	<span >物流：<span id="transFee">0</span>元</span>
				 	<span id="couponPrice"></span>
				 </div>
				 <div class="btnGroupR">
					<a class="btn theme1" onclick="saveOrderConfirm();">提交订单</a> 
				</div>
			</div>
				 
		</section>
		
		

		<!--  하단메뉴 : S -->
		<aside id="aside-menu">
			<div class="mypage-menu type2">
				<div class="total" style="width: 260px;left: 0px;">
					<strong>합계</strong>
					<p class="price" style="width: 120px;line-height: 49px;padding-top: 0px;font-size: 125%;"><!-- 금액 -->
						￥<font id="totalAmt" style="line-height: 49px;padding-top: 0px;font-size: 125%;">${totalAmount }</font>
						<input type="hidden" id="priceSum" value="${totalAmount }"/>
					</p>
				</div>
				<a onclick="saveOrderConfirm();" class="last" style="margin-left: 260px;">결제하기</a>
			</div>
		</aside>
		
		<a href="#" id="btn-top">top button</a>
		<!--  하단메뉴 : E -->		
		
	</div>
 

<script type="text/javascript">


$(window).load(function(){
    $("input[name='chkProd']").click(function () { //리스트 항목이 모두 선택되면 전체 선택 체크
    	totalSum();
    });
    $('#aside-menu .input-mypage input').change(function(){
		if($(this).is(":checked")){
			$('.product-list').find(':checkbox').prop('checked', true)
			.parent().addClass('check');
		}else{
			$('.product-list').find(':checkbox').prop('checked', false)
			.parent().removeClass('check');
		};
    	totalSum();
		return false;
    });
});	
$('.volume .btn-minus').click(function(){
	var number = parseInt($(this).next().val());
	if(number > 0){
		$(this).next().val(number -1);
	}
	totalSum();
	return false;
});
$('.volume .btn-plus').click(function(){
	var number = parseInt($(this).prev().val());
	$(this).prev().val(number +1);
	totalSum();
	return false;
});

function totalSum() {
    var list = $("input[name='chkProd']");
    var total_amt = 0;
    var unit_sum_amt = 0;
    for(var i = 0; i < list.length; i++){
    	unit_sum_amt = 0;
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
        	var unitCnt = $("#orderNum"+list[i].value).val();
        	var unitAmt = $("#cartUnitPrice_"+list[i].value).val();
        	unit_sum_amt = Number(unitCnt) * Number(unitAmt);
        }
        total_amt = total_amt + unit_sum_amt;
    }
    $("#totalAmt").html(total_amt);
    $("#priceSum").val(total_amt);
}



var checkStock = 0;
$(function(){
	$('#receive-info').click(function(){
		toGoodsReceipt();
	});
	
// 	calculatePrice();
	
	$('.coupon-button').click(function(){
		openCouponListPopup();	
	});
	$('#closeBtn').click(function(event){
		couponCancelConfirm();
	 	event.stopPropagation();   
	});

})

// function showDetail(shop_Id, display_Id){
// 	location.href='/front/detail/detail.htm?shopId=' + shop_Id + '&displayId=' + display_Id; 
// }

// function calculatePrice(){
// 	var totalPrice =  0;
// 	var totalGoodsPrice =  0;
// 	var totalTransPrice = 0;
//    	$('input[name="priceNums"]').each(function(idx){
// 	   totalGoodsPrice += parseFloat($(this).val());
//    	});
//    	$('input[name="transFees"]').each(function(idx){
// 	   totalTransPrice += parseFloat($(this).val());
//    	});
//    	$('#transFee').text(parseFloat(totalTransPrice).toFixed(2));
// 	$('#priceGoods').text(parseFloat(totalGoodsPrice).toFixed(2));
// 	$('#priceSum').text((parseFloat(totalTransPrice) + parseFloat(totalGoodsPrice)).toFixed(2));
// }
	 	
 
//修改商品的数量
function updateNum(num,priceOptionId){
	var orderNum=parseInt($("#orderNum" + priceOptionId).val());
	var stock_In=parseInt($("#stock_In" + priceOptionId).val());
	if((orderNum+num) < 1){
		alert("商品数量已为最少");
		return;
	}
	if((orderNum+num) > stock_In){
		alert("商品数量已达到最大库存");
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
	$('#priceSum').val((priceSum+transFeeSum).toFixed(2));
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
	window.location.href="/front/web/publish/mobile/order/goodsReceipt.htm?addressId="+addressId+"&priceOptionId="+priceOptionId+"&goods_qty_num="+goodsQtyOne; 
}
//保存订单。
function saveOrderConfirm(){
	 
	alert("준비중입니다.");
	return
	
	var addressProvinceId=$('#addressProvinceId').val();
	var addressCityId=$('#addressCityId').val();
	var addressDistrictId=$('#addressDistrictId').val();
	var addressDetail=$('#addressDetail').text();
	var receiptorName=$('#receiptorName').text();
	var adrMobile=$('#adrMobile').text();
	var priceSum=$('#priceSum').val();
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

	console.log("priceSum : " + priceSum);
	
	var priceOptionId=$('#priceOptionId').val();
	var transTypeId=$('#trainsport').find("option:selected").val();
	
	if(addressCityId == ''){
		alert('收货地址不能为空!');
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
			url : "/front/web/publish/mobile/order/checkStock.htm",  //调用OrderConfirm中的saveOrderConfirm方法，保存订单信息。
			success : function(data) {

				if(stockIn > data.STOCK_NOW){
					checkStock = checkStock + 1;
				}
			},
			error : function(xhr, status, e){
				alert("error: " + status);
			}
		});
	});
	if (checkStock > 0) {
		alert('"您所挑选的商品已下架"\n或者\n"您所挑选的商品库存不足".');
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
		url : "/front/web/publish/mobile/order/saveOrderConfirm.htm",  //调用OrderConfirm中的saveOrderConfirm方法，保存订单信息。
		success : function(data) {
			if(data.success){
				$('#orderId','#payform').val(data.data.orderId);
				var url = '/wx/pay/payment.htm'
					 + '?showwxpaytitle=1'
					 + '&orderId=' + data.data.orderId 
					 + '&shopId=' + '${sessionScope.sessoinMember.shopId}'
					 + '&o=' + '${sessionScope.sessoinMember.openid}';
					 
				window.location.href = url;
			}else{
				alert("确认失败!\n" + data.err_msg);	
			}
		},
		error : function(xhr, status, e){
			alert("error: " + status);
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
			alert("error: " + msg);
		}
	});

	$('.couponListPopup').show();
}

function closeCouponListPopup() {
	$('.couponListPopup').hide();
}

function couponSeleced(amount,val,id,itemId){

	var totalPrice = parseFloat($("#priceGoods").text());
	var priceSum = parseFloat($("#priceSum").val());
	var priceSum1 = priceSum-val;
	var couponAmount = parseFloat(amount);
	
	if(totalPrice < couponAmount){
		alert("购买金额满"+couponAmount+"元方可使用的优惠券");
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
		
		$('#priceSum').val(parseFloat(priceSum1).toFixed(2)); // parseFloat(priceSum)).toFixed(2)
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
	
	$('#priceSum').val(parseFloat($("#priceGoods").text()));
}


</script>
		
</body>

</html>