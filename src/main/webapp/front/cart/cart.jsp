<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>购物车</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 4,				//SHOP_CART
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

	//显示或隐藏一张图片，并计算出block状态的图片的数量
	function show(obj) {
		if($(obj).find('.selecteImg').is(':hidden')){
		 	$(obj).find('.selecteImg').show();
		}else{
			$(obj).find('.selecteImg').hide();
		}
 
		if($('img[name="selectedImg"]').size() == $('img[name="selectedImg"]:not(:hidden)').size()){
			$(".selecteAllImg").show();
		}else{
			$(".selecteAllImg").hide();
		}  
		calculatePrice();
	}
	//显示或隐藏所有图片，并计算出block状态的图片的数量
	function showAll() {
		//判断主按钮的显示，隐藏
		if($(".selecteAllImg").is(':hidden')){
			$(".selecteAllImg").show();
			$('img[name="selectedImg"]').show();
		}else{
			$(".selecteAllImg").hide();
			$('img[name="selectedImg"]').hide();
		}
		calculatePrice();
	}

	//点击数量加减一
	function changeQty(obj, value) {
		var $this = $(obj).parent();
		//商品数量
		var num = parseInt($this.find(".goodsQty").val());
		//商品单价
		var unitSales = $this.data('unitSales');
		num += value;
		if (num < 1) {
			num = 1;
		}
		var price = unitSales * num;
		
		$this.find(".goodsQty").val(num);
		$this.closest('li').find(".priceQty").val(parseFloat(price).toFixed(2));
		
		calculatePrice();
	}
					
	function calculatePrice(){
		var totalPrice = 0;
	   $('img[name="selectedImg"]:not(:hidden)').each(function(idx){
	      totalPrice +=  parseFloat($(this).closest('li').find('.priceQty').val());
	   });
	   $('#priceTotal').text(parseFloat(totalPrice).toFixed(2));
	   $('#totalCount').text($('img[name="selectedImg"]:not(:hidden)').size());
	}
	//更改购物车状态为删除状态
	function deleteCart(obj) {
		
		confirmTip('确定要删除本条商品吗 ？');
		var times=0;
		$(".confirm-button").click(function(){
			times++;
			if(times==1){
				if(closePopup()){
					//
					var shopId = $(obj).data('shopId');
					var goodsId = $(obj).data('goodsId');
					var displayId = $(obj).data('displayId');
					var custSysId = $(obj).data('custSysId');
					var priceOptionId = $(obj).data('priceOptionId');
					var params = {
						shopId : shopId,
						goodsId : goodsId,
						displayId : displayId,
						custSysId : custSysId,
						priceOptionId : priceOptionId,
					}
				  //alert( goodsId+"--"+shopId+"--"+displayId+"--"+custSysId+"--"+priceOptionId);
					$.ajax({
						data : params,
						dataType : "json",
						type : "POST",
						cache : false,
						url : "/front/cart/delete.htm",
						success : function(data) {
							if (data.status == "S") {
								alertTip("删除成功");
								window.location.href = "/front/cart/cart.htm";
							} else {
								alertTip("请检查信息,重新点击更新 .");
							}
						},

						error : function(a, msg, c) {
							alertTip("error: " + msg);
						}
					});
				}else{
					return false;
				}
			}
		});
		
// 		if (window.confirm("确定要删除本条商品吗 ？")) {
// 			var shopId = $(obj).data('shopId');
// 			var goodsId = $(obj).data('goodsId');
// 			var displayId = $(obj).data('displayId');
// 			var custSysId = $(obj).data('custSysId');
// 			var priceOptionId = $(obj).data('priceOptionId');
// 			var params = {
// 				shopId : shopId,
// 				goodsId : goodsId,
// 				displayId : displayId,
// 				custSysId : custSysId,
// 				priceOptionId : priceOptionId,
// 			}
// 		  //alert( goodsId+"--"+shopId+"--"+displayId+"--"+custSysId+"--"+priceOptionId);
// 			$.ajax({
// 				data : params,
// 				dataType : "json",
// 				type : "POST",
// 				cache : false,
// 				url : "/front/cart/delete.htm",
// 				success : function(data) {
// 					if (data.status == "S") {
// 						alertTip("删除成功");
// 						window.location.href = "/front/cart/cart.htm";
// 					} else {
// 						alertTip("请检查信息,重新点击更新 .");
// 					}
// 				},

// 				error : function(a, msg, c) {
// 					alertTip("error: " + msg);
// 				}
// 			});
// 		}
	}

	function payment() {
		if ($("#totalCount").text() == 0) {
			alertTip("请选择要结算的商品!");
			return;
		}
		var priceOptionId = "";
		var goods_qty_num = "";
		
	    $('img[name="selectedImg"]:not(:hidden)').each(function(idx){
	    	var id = $(this).data('id');
	    	var qty = $('#qty' + id).val();
			priceOptionId +=  id + ",";
			goods_qty_num +=  qty + ",";
	    	
	    });
		
		priceOptionId = priceOptionId.substr(0, priceOptionId.length - 1);
	  // alert(priceOptionId);
		goods_qty_num = goods_qty_num.substr(0, goods_qty_num.length - 1);
		//  alert(goods_qty_num);
	 
		$('#priceOptionId','#form1').val(priceOptionId);
		$('#goods_qty_num','#form1').val(goods_qty_num);
		$('#form1').submit();
		//window.location.href = "/front/orderConfirm/orderConfirm.htm?priceOptionId=" + priceOptionId + "&goods_qty_num=" + goods_qty_num;
	}
</script>
</head>
<body>
	
	<form id="form1" action="/front/orderConfirm/orderConfirm.htm" method="post">
		<input type="hidden" id="priceOptionId" name="priceOptionId" />
		<input type="hidden" id="goods_qty_num" name="goods_qty_num" />
	</form> 
	
	   <div class="cart-header theme1">
			<div class="headLogo"></div>
			<div class="circleDiv" onclick="showAll();">
				<img alt="" src="/front/skin/main/img/cart/tick_b.png" class="selecteAllImg">
			</div>
		 	<h2>购物车</h2>
		</div> 
		
		<!-- container -->
		<div id="container" class="tp2">
			<section id="contents">
				<ul class="cartlist2">
				<c:choose>
					<c:when test="${empty cartlist}">
		 				<div class="ui-noCount">
							<div class="ui-noCountImg">
								<img alt="" src="/front/skin/main/img/order/trolley.png">
							</div>
						 	<div class="ui-noCountText">购物车还是空的,</br>去挑几件中意的商品吧</div>
						 	<div class="ui-noCountBtn" style="margin-left: 35%; margin-top: 30px;" onclick="location.href='/front/main/home.htm?shopId=${sessionScope.sessionSkin.shopId}'">赶紧去逛</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- start循环遍历购物车商品 -->
						<c:forEach items="${cartlist}" var="item">
							<li>
								<div class="liDiv">
									<!-- 选择按钮 -->
									<div class="circleDiv" onclick="show(this);">
<%-- 										<img data-id="${item.CART_PRICE_OPTION_ID}" class="selecteImg" name="selectedImg"  alt="" src="/front/skin/main/img/cart/tick_g.png" > --%>
										<img data-id="${item.DISPLAY_ID}" class="selecteImg" name="selectedImg"  alt="" src="/front/skin/main/img/cart/tick_g.png" >
									</div>
									
									<div class="middleDiv">
											<!-- 商品图片 -->
											<div class="goodsImg">
												<img alt="" src="${item.GOODS_LIST_IMG_URL }">
											</div>
											
											<!-- 商品信息 -->
											<div class="goodsDesc">
												<div class="text">${item.DESC_TITLE}</div>
												<div class="bottom" data-id="${item.DISPLAY_ID}" data-unit-sales="${item.PRICE_UNIT_SALES}" >
													<div class="minus" onclick="changeQty(this,-1);"></div>
													<div class="num">
														<input type="text" id="qty${item.DISPLAY_ID}" class="goodsQty" value="${item.CART_GOODS_QTY }" readonly="readonly" /> 
													</div>
													<div class="plus" onclick="changeQty(this,1);"></div>
												</div>
											</div>
										 
									</div>
									<!-- 删除和商品价格 -->
									<div class="rightDiv">
										<div class="money">
											<span style="margin-left: 3px">￥</span>
											<input class="priceQty" value="${item.CART_PRICE_SUM}" readonly="readonly" />
										</div>
										<div class="delete" onclick="deleteCart(this);"
											data-goods-id="${item.GOODS_ID}" data-shop-id="${item.SHOP_ID}" data-display-id="${item.DISPLAY_ID}"
											data-cust-sys-id="${item.CART_CUST_SYS_ID}" data-price-option-id="${item.DISPLAY_ID}">
											<img alt="" src="/front/skin/main/img/cart/delete.png"> 
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
						<!-- start循环遍历购物车商品 -->
					</c:otherwise>
				</c:choose>
				</ul>
			 
				 
			</section>
		</div>
		<!-- //container -->
	 
	 <br />
	 <br />
	 <br />
	 <br />
	 <br />

		<!-- cart-footer -->
		<div class="footerFixed">
			<div class="circleDiv" onclick="showAll();">
				<img alt="" src="/front/skin/main/img/cart/tick_g.png" class="selecteAllImg">
			</div>
			<div class="priceTotalDiv">
			 	总计：<span id="priceTotal">0.00</span>元
			</div>
			<div class="btnGroupR">
				<a class="btn theme1" onclick="payment();">结算(<span class="count" id="totalCount">0</span>)</a> 
			</div>
			 
		</div>

	 
</body>
</html>
