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
		<section id="container" class="mypage" style="min-height:200px;">
			<div class="location">
				<a href="javascript:history.back();" class="arrow"><i>back page</i></a>
				<h2>나의 찜 리스트</h2>
				<a href="#" class="btn-menu"><i>back page</i></a>
				<div class="menu-sub">
					<ul>
						<li><a href="/front/web/publish/mobile/main/index.htm"><i class="ico-menu-sub01"></i>홈피</a></li>
						<li><a href="/front/web/publish/mobile/brand/category.htm"><i class="ico-menu-sub03"></i>분류</a></li>
					</ul>
				</div>
			</div>
			
			<section class="product-list">
				<ul>
				
					<c:set var="totalAmount" value="${0 }" />
					<c:forEach var="cartlist" items="${favoriteslist}" varStatus="status">
					
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
								<h3>${cartlist.DESC_DETAIL}</h3>
								
								<p class="price-cost"> <!-- 원가 -->
									￥ ${cartlist.PRICE_RANGE_HIGH}
								</p>
								<p class="price"><!-- 금액 -->
									${cartlist.PRICE_UNIT_SALES}
								</p>
								<!-- 선택 된 상태는 good에 클래스 on을 추가 -->
								<!-- <p class="good"><a href="#"><i class="ico-heart"></i>37</a></p> -->
								<p class="good on"><a href="#"><i class="ico-heart"></i>${cartlist.SUM_SALES_QTY}</a></p>
								<!-- //선택 된 상태는 good에 클래스 on을 추가 -->

								<div class="ico-group">
									<c:if test="${cartlist.PRICE_UNIT_SALES < cartlist.PRICE_RANGE_HIGH}">
										<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
									</c:if>
									<c:if test="${cartlist.SALES_CNT > 9}">
										<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
									</c:if>
									<c:if test="${cartlist.NEW_TYPE == 'Y'}">
										<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
									</c:if>
								</div>								
								
								<a href="#" class="btn-more">more</a>
							</div>
							<div class="detail-item">
								<div class="bg"></div>
								<div class="detail-text">
									<p class="classify"><span>포인트</span>사용가능</p> 
									<h2>约 ￥3.35</h2>
									<ul class="appraisal">
										<li><strong>${cartlist.SALES_CNT}</strong>개 판매</li>
										<li><strong>${cartlist.REVIEW_POINT_CNT}</strong>개 평가</li>
									</ul>
									<div class="detail-btn">
										<!-- 즐겨찾기 등록 되었으면 클래스 on 추가 -->
										<a id="star${cartlist.DISPLAY_ID}"
											<c:if test="${cartlist.FAVORITES_GOODS_FLAG == 'Y'}">
												onclick="removeFavorite(${cartlist.GOODS_ID}, ${cartlist.DISPLAY_ID}, $(this));"
												
												class="btn-liked on"
											</c:if>
											<c:if test="${cartlist.FAVORITES_GOODS_FLAG != 'Y'}">
												onclick="addFavorite(${cartlist.GOODS_ID}, ${cartlist.DISPLAY_ID}, $(this));"
												
												class="btn-liked"
											</c:if>
										>liked</a>
										<!-- //즐겨찾기 등록 되었으면 클래스 on 추가 -->
										
										<a onclick="addCart(${cartlist.DISPLAY_ID}, 1,  ${cartlist.PRICE_UNIT_SALES},  ${cartlist.ITEM_TYPE});" class="btn-shopping">shopping</a>
										<a href="/front/web/publish/mobile/product/productview.htm?displayId=${cartlist.DISPLAY_ID}" class="btn-pay">구매하기</a>
										<input type="hidden" id="goodsid${cartlist.DISPLAY_ID}" value="${cartlist.GOODS_ID}">
									</div>
									<a href="#" class="btn-close">close</a>
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
				<a onclick="deleteItem();" class="btn-delete" style="display:none;">삭제</a>
				<div class="total" style="width: 160px;display:none;">
					<strong>합계</strong>
					<p class="price" style="width: 120px;line-height: 49px;padding-top: 0px;font-size: 125%;"><!-- 금액 -->
						￥<font id="totalAmt" style="line-height: 49px;padding-top: 0px;font-size: 125%;">${totalAmount }</font>
						<input type="hidden" id="total_amount" value="${totalAmount }"/>
					</p>
				</div>
				<a onclick="deleteList();" class="last" style="margin-left: 280px;">삭제하기</a>
			</div>
		</aside>
		
		<a href="#" id="btn-top">top button</a>
		<!--  하단메뉴 : E -->

		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 

	</div>
	
	<script>
		$(window).load(function(){
		    $('#aside-menu .input-mypage input').change(function(){
				if($(this).is(":checked")){
					$('.product-list').find(':checkbox').prop('checked', true)
					.parent().addClass('check');
				}else{
					$('.product-list').find(':checkbox').prop('checked', false)
					.parent().removeClass('check');
				};
				return false;
		    });
		});	

		function deleteList() {

		    var list = $("input[name='chkProd']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
			    	var id = list[i].value;
			    	removeFavorite($("#goodsid"+id).val(), id, $("#star"+id));
		        }
		    }
		    window.location = "/front/web/publish/mobile/mypage/mypageinterest.htm";
		}
		
	</script>
</body>
</html>