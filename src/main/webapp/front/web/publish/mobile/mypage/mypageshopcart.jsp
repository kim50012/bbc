<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>
	<div id="wrap">


<!-- 		<form id="payment" action="/front/orderConfirm/orderConfirm.htm" method="post"> -->
		<form id="payment" action="/front/web/publish/mobile/order/orderConfirm.htm" method="post">
			<input type="hidden" id="priceOptionId" name="priceOptionId" />
			<input type="hidden" id="goods_qty_num" name="goods_qty_num" />
		</form> 	
	
		<!--  Container : S -->
		<section id="container" class="mypage">
			<div class="location">
				<a href="javascript:history.back();" class="arrow"><i>back page</i></a>
				<h2>장바구니</h2>
				<a href="#" class="btn-menu"><i>back page</i></a>
				<div class="menu-sub">
					<ul>
						<li><a href="/front/web/publish/mobile/main/index.htm"><i class="ico-menu-sub01"></i>홈피</a></li>
						<li><a href="/front/web/publish/mobile/brand/category.htm"><i class="ico-menu-sub03"></i>분류</a></li>
					</ul>
				</div>
			</div>
			
			<section class="product-list" style="min-height:200px;">
				<ul>
					
					<c:set var="totalAmount" value="${0 }" />
					<c:forEach var="cartlist" items="${cartlist}" varStatus="status">
					
						<c:set var="totalAmount" value="${totalAmount + cartlist.CART_PRICE_SUM }" />
					
						<!-- 상품 하나 : S -->
						<li class="item-box" id="liItem_${cartlist.DISPLAY_ID}">
							<!-- 해당상품 선택 -->
							<div class="input-checkbox input-mypage">
								<label>
									<i class="checkbox">choice</i>
									<input type="checkbox" id="chkProd" name="chkProd" value="${cartlist.DISPLAY_ID}" checked/>
								</label>
							</div>
							
							<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId=${cartlist.DISPLAY_ID}"><img src="${cartlist.GOODS_LIST_IMG_URL }" alt="" /></a></p>
							<div class="text-box">
								<h2>${cartlist.DESC_TITLE}</h2>
								<h3 style="margin-right: 10px;">${cartlist.DESC_DETAIL}</h3>
								
								<p class="cache-compare">
									销售价 ￥ ${cartlist.PRICE_UNIT_SALES}(￥ ${cartlist.PRICE_RANGE_HIGH})
								</p>
								
								<p class="price"><!-- 금액 -->
									￥ ${cartlist.PRICE_UNIT_SALES}
								</p>
								
								<input type="hidden" id="displayId_${cartlist.DISPLAY_ID}" value="${cartlist.DISPLAY_ID}" />
								<input type="hidden" id="cartUnitPrice_${cartlist.DISPLAY_ID}" value="${cartlist.PRICE_UNIT_SALES}" />
								<input type="hidden" id="cartTotalPrice_${cartlist.DISPLAY_ID}" value="${cartlist.CART_PRICE_SUM}" />
								
								<div class="volume">
									<button class="btn-minus" value="">
										<img src="/front/web/publish/img/content/btn-minus.gif" alt="" />
									</button>
									<input type="number" id="cartCnt_${cartlist.DISPLAY_ID}" value="${cartlist.CART_GOODS_QTY}" title="상품갯수" />
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
		</section>
		<!--  Container : E -->
		
		<!--  하단메뉴 : S -->
		<aside id="aside-menu">
			<div class="mypage-menu type2">
				<div class="input-checkbox input-mypage">
						<label>
							<i class="checkbox"></i>전체
							<input type="checkbox" id="chkAll" name="chkAll" checked/>
						</label>
					</div>
				<a onclick="deleteItem();" class="btn-delete">삭제</a>
				<div class="total" style="width: 160px;">
					<strong>합계</strong>
					<p class="price" style="width: 120px;line-height: 49px;padding-top: 0px;font-size: 125%;"><!-- 금액 -->
						￥<font id="totalAmt" style="line-height: 49px;padding-top: 0px;font-size: 125%;">${totalAmount }</font>
						<input type="hidden" id="total_amount" value="${totalAmount }"/>
					</p>
				</div>
				<a onclick="payment();" class="last" style="margin-left: 280px;">주문하기</a>
			</div>
		</aside>
		
		<a href="#" id="btn-top">top button</a>
		<!--  하단메뉴 : E -->

		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 

	</div>
	
	<script>
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
		        	var unitCnt = $("#cartCnt_"+list[i].value).val();
		        	var unitAmt = $("#cartUnitPrice_"+list[i].value).val();
		        	unit_sum_amt = Number(unitCnt) * Number(unitAmt);
		        }
		        total_amt = total_amt + unit_sum_amt;
		    }
		    $("#totalAmt").html(total_amt);
		    $("#total_amount").val(total_amt);
		}

		
		function deleteItem() {
		    var list = $("input[name='chkProd']");
		    for(var i = 0; i < list.length; i++){
		    	unit_sum_amt = 0;
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
					var displayId = list[i].value;
					$.ajax({
				 			data:{
				 				displayId : displayId
				 	 		},
						type : "POST",
						url : "/front/web/publish/mobile/brand/mypageshopcartDelete.htm",
						success : function(data) {
							$("#liItem_"+displayId).remove();
						},
						error : function(xhr, status, e) {
							alert("삭제가 되지 않았습니다.");
						}
					});		        
		        
		        }
		    }
		}
		

		function payment() {
			if ($("#total_amount").val() == 0) {
				alert("상품을 선택하세요.");
				return;
			}
			var priceOptionId = "";
			var goods_qty_num = "";
			
		    var list = $("input[name='chkProd']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
			    	var id = list[i].value;
			    	var qty = $("#cartCnt_"+list[i].value).val();
					priceOptionId +=  id + ",";
					goods_qty_num +=  qty + ",";
		        }
		    }			
			
			priceOptionId = priceOptionId.substr(0, priceOptionId.length - 1);
			goods_qty_num = goods_qty_num.substr(0, goods_qty_num.length - 1);
		 
			$('#priceOptionId','#payment').val(priceOptionId);
			$('#goods_qty_num','#payment').val(goods_qty_num);
			$('#payment').submit();
		}		
		
	</script>
</body>
</html>

