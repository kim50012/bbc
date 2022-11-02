<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>
	<div id="wrap">

		<input type="hidden" id="hdPageCurr" value="0"/>
		<input type="hidden" id="hdPageUnit" value="10"/>
		<input type="hidden" id="hdPageTotal" value="40"/>

		<%@ include file="/front/web/publish/mobile/common/head_sub.jsp"%> 
		<%@ include file="/front/web/publish/mobile/common/gnb.jsp"%> 
		
		<!--  Container : S -->
		<section id="main-cont">
			<div class="swiper-container">
		        <div class="swiper-wrapper">
    
					<c:forEach var="bannerList" items="${bannerList}" varStatus="status">  
			            <div class="swiper-slide">
			            	<a href="${bannerList.LINK_URL}"><img src="${bannerList.LIST_IMG_URL}" alt=""/></a>
			            </div>
					 </c:forEach>
					 
		        </div>
		        <!-- Add Pagination -->
		        <div class="swiper-pagination"></div>
		    </div>
			<div class="link-menu">
				<ul>
					<li><a href="/front/web/publish/mobile/brand/brandlist.htm"><img src="/front/web/publish/img/main/img-link-menu01.gif" alt=""> 브랜드존</a></li>
					<li><a href="/front/web/publish/mobile/product/productlist.htm?brandId=0&shopGradeClassId=0&orderby=SALES_QTY_DESC"><img src="/front/web/publish/img/main/img-link-menu02.gif" alt=""> 인기상품</a></li>
					<li><a href="/front/web/publish/mobile/brand/brand.htm?brandId=11"><img src="/front/web/publish/img/main/img-link-menu03.gif" alt=""> 특가상품</a></li>
					<li><a onclick="alert('준비중입니다.');"><img src="/front/web/publish/img/main/img-link-menu04.gif" alt=""> 이벤트</a></li>
					<li><a onclick="alert('준비중입니다.');"><img src="/front/web/publish/img/main/img-link-menu05.gif" alt=""> 쿠폰존</a></li>
				</ul>
			</div>
			
			<section class="hot-sale">
				<h2>
					<P>금주 할인 상품</P>
				</h2>
				 
				 <div class="swiper-container2">
			        <div class="swiper-wrapper" style="min-height:200px;">
			        
							<c:forEach var="goodsListTop" items="${goodsListTop}" varStatus="status">

					            <c:if test="${status.count%2 == 1}">
					            	<div class="swiper-slide">
					            </c:if>
					            
				            	<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListTop.DISPLAY_ID}">
				            		<span class="sale">할인</span>
				            		<div class="mask">
				            			<img src="${goodsListTop.GOODS_LIST_IMG_URL}" alt=""/>
				            		</div>
				            		<p class="text">
				            			￥ ${goodsListTop.PRICE_UNIT_SALES}
				            			<span>(￥ ${goodsListTop.PRICE_RANGE_HIGH})</span>
				            		</p>
				            	</a>
					            	
					            <c:if test="${status.count%2 == 0}">
					            	 </div>
					            </c:if>
							 </c:forEach>		
			            
			        </div>
			        <!-- Add Pagination -->
			        <div class="swiper-pagination2"></div>
			    </div>
			</section>
			<div class="logo_org_product">
				<img src="/front/web/publish/img/main_banner_02.jpg" alt="" />
			</div>
			
			
			<!-- 첫번째 상품 목록 : S -->
			<section class="product-list color01">
				<div class="header-title">
					<h1>추천상품</h1>
				</div>
				<ul>

					<c:forEach var="goodsListBest" items="${goodsListBest}" varStatus="status">


						<!-- 상품 하나 : S -->
						<li class="item-box-v">
							<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListBest.DISPLAY_ID}">
								<p class="img"><img src="${goodsListBest.GOODS_LIST_IMG_URL}" alt="" /></p>
								<div class="text-box height-auto">
									<h2>[${goodsListBest.SGC_NM}]</h2>
									<h3>${goodsListBest.DESC_TITLE}</h3>
									
									<p class="price">
										￥ ${goodsListBest.PRICE_UNIT_SALES}
										<span>(￥${goodsListBest.PRICE_RANGE_HIGH}) </span>
									</p>
									
									<div class="ico-group">
										<c:if test="${goodsListBest.PRICE_UNIT_SALES < goodsListBest.PRICE_RANGE_HIGH}">
											<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
										</c:if>
										<c:if test="${goodsListBest.SALES_CNT > 9}">
											<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
										</c:if>
										<c:if test="${goodsListBest.NEW_TYPE == 'Y'}">
											<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
										</c:if>
									</div>
								</div>
							</a>
						</li>
						<!-- 상품 하나 : E -->

					 </c:forEach>						
					
					<!-- 상품 카테고리 종류?? -->
					<li class="item-kind">
						<div class="title">
							<h2>찾고 있는 상품이<br />없나요?</h2>
							<p>아래<span>카테고리</span>에서 찾아보세요.</p>
						</div>
						<ul class="kind-list">
							<li><a href="/publish/mobile/product/productlist.htm?shopGradeClassId=10288">식품</a></li>
							<li><a href="/front/web/publish/mobile/product/productlist.htm?shopGradeClassId=10518">건강</a></li>
							<li><a href="/front/web/publish/mobile/product/productlist.htm?shopGradeClassId=10510">생필품</a></li>
							<li><a href="/front/web/publish/mobile/product/productlist.htm?shopGradeClassId=10511">홈데코</a></li>
						</ul>
					</li>
				</ul>
				<a href="/front/web/publish/mobile/product/productlist.htm?brandId=0&shopGradeClassId=0&orderby=SALES_QTY_DESC" class="btn-more-product">더보기</a>
			</section>
			<!-- 첫번째 상품 목록 : E -->
			
			<!-- 배너 : S -->
			<div class="swiper-banner">
		        <div class="swiper-wrapper">
		            <div class="swiper-slide"><a href="http://bbc.manhuaking.cn/front/web/publish/mobile/product/productview.htm?displayId=10199"><img src="/front/web/publish/img/main/main_banner_03.jpg" alt=""/></a></div>
		            <div class="swiper-slide"><a href="http://bbc.manhuaking.cn/front/web/publish/mobile/product/productview.htm?displayId=10199"><img src="/front/web/publish/img/main/main_banner_04.jpg" alt=""/></a></div>
		        </div>
		        <!-- Add Pagination -->
		        <div class="swiper-pagination3"></div>
		    </div>
			<!-- 배너 : E-->
			
			
			<!-- 두번째 상품 목록 : S -->
			<section class="product-list color02">
				<div class="header-title">
					<h1>상품목록</h1>
				</div>
				<ul>
				
					<c:forEach var="goodsListOne" items="${goodsListOne}" varStatus="status">

						<!-- 상품 하나 : S -->
						<li class="item-box-v">
							<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListOne.DISPLAY_ID}">
								<p class="img"><img src="${goodsListOne.GOODS_LIST_IMG_URL}" alt="" /></p>
								<div class="text-box height-auto">
									<h2>[${goodsListOne.SGC_NM}]</h2>
									<h3>${goodsListOne.DESC_TITLE}</h3>
									
									<p class="price">
										￥ ${goodsListOne.PRICE_UNIT_SALES}
										<span>(￥${goodsListOne.PRICE_RANGE_HIGH}) </span>
									</p>
									
									<div class="ico-group">
										<c:if test="${goodsListOne.PRICE_UNIT_SALES < goodsListOne.PRICE_RANGE_HIGH}">
											<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
										</c:if>
										<c:if test="${goodsListOne.SALES_CNT > 9}">
											<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
										</c:if>
										<c:if test="${goodsListOne.NEW_TYPE == 'Y'}">
											<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
										</c:if>
									</div>
								</div>
							</a>
						</li>
						<!-- 상품 하나 : E -->

					 </c:forEach>						
					
				
					
				</ul>
				<a href="/front/web/publish/mobile/product/productlist.htm" class="btn-more-product">더보기</a>
			</section>
			<!-- 두번째 상품 목록 : E -->
			
			<!-- 세번째 상품 목록 : S -->
			<section class="product-list color03">
				<ul>
				
					<c:forEach var="goodsListTwo" items="${goodsListTwo}" varStatus="status">

						<!-- 상품 하나 : S -->
						<li class="item-box">
							<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListTwo.DISPLAY_ID}">
								<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListTwo.DISPLAY_ID}"><img src="${goodsListTwo.GOODS_LIST_IMG_URL}" alt="" /></a></p>
								<div class="text-box type2">
									<h2>[${goodsListTwo.SGC_NM}] <span>韩</span></h2>
									<h3>${goodsListTwo.DESC_TITLE}</h3>
									
									<p class="price">
										￥ ${goodsListTwo.PRICE_UNIT_SALES}
										<span>(￥${goodsListTwo.PRICE_RANGE_HIGH}) </span>
									</p>
									<!-- 선택 된 상태는 good에 클래스 on을 추가 -->
									<!-- <p class="good"><a href="#"><i class="ico-heart"></i>37</a></p> -->
									<p class="good on"><a href="javscript:void();"><i class="ico-heart"></i>${goodsListTwo.SALES_CNT}</a></p>
									<!-- //선택 된 상태는 good에 클래스 on을 추가 -->
									
									<div class="ico-group">
										<c:if test="${goodsListTwo.PRICE_UNIT_SALES < goodsListTwo.PRICE_RANGE_HIGH}">
											<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
										</c:if>
										<c:if test="${goodsListTwo.SALES_CNT > 9}">
											<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
										</c:if>
										<c:if test="${goodsListTwo.NEW_TYPE == 'Y'}">
											<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
										</c:if>
									</div>
								</div>
							</a>
						</li>
						<!-- 상품 하나 : E -->
						
					 </c:forEach>						
					
				</ul>
			</section>
			<!-- 세번째 상품 목록 : E -->
			
			
			<!-- 브랜드 목록 : S -->
			<!--
			<section class="brand-list">
				<div class="header-title">
					<h1>流行品牌</h1>
				</div>
				<div class="list">
					<a href="#" class="img"><img src="http://image.ssgdfm.com/images/shop/cn/mobile_new/main/img-banner-visual.jpg" alt="" /></a>
					<ul>
						<li><a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile/main/009.jpg" alt="" /></a></li>
						<li><a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile/main/013.jpg" alt="" /></a></li>
						<li><a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile/main/001.jpg" alt="" /></a></li>
						<li><a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile/main/002.jpg" alt="" /></a></li>
						<li><a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile/main/003.jpg" alt="" /></a></li>
						<li><a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile/main/004.jpg" alt="" /></a></li>
					</ul>
				</div>
				<a href="#" class="btn-more-product">查看更多</a>
			</section>
			-->
			<!-- 브랜드 목록 : E -->
			
			
			<!-- 네번째 상품 목록 : S -->
			<section class="product-list">
				<div class="header-title center">
					<h1>유행상품</h1>
				</div>
				<ul>

					<c:forEach var="goodsListThree" items="${goodsListThree}" varStatus="status">

						<!-- 상품 하나 : S -->
						<li class="item-box-v">
							<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListThree.DISPLAY_ID}"><img src="${goodsListThree.GOODS_LIST_IMG_URL}" alt="" /></a></p>
							<div class="text-box">
								<h2>[${goodsListThree.SGC_NM}] <span>韩</span></h2>
								<h3>${goodsListThree.DESC_TITLE}</h3>
								
								<p class="price">
									￥ ${goodsListThree.PRICE_UNIT_SALES}
									<span>(￥${goodsListThree.PRICE_RANGE_HIGH}) </span>
								</p>
								<!-- 선택 된 상태는 good에 클래스 on을 추가 -->
								<p class="good on"><a href="javascript:void();"><i class="ico-heart"></i>${goodsListThree.SALES_CNT}</a></p>
								<!-- //선택 된 상태는 good에 클래스 on을 추가 -->
								
								<div class="ico-group">
										<c:if test="${goodsListThree.PRICE_UNIT_SALES < goodsListThree.PRICE_RANGE_HIGH}">
											<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
										</c:if>
										<c:if test="${goodsListThree.SALES_CNT > 9}">
											<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
										</c:if>
										<c:if test="${goodsListThree.NEW_TYPE == 'Y'}">
											<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
										</c:if>
								</div>
								
								<a href="/front/web/publish/mobile/product/productlist.htm?brandId=0&shopGradeClassId=0&orderby=SALES_QTY_DESC" class="btn-more">more</a>
							</div>
							<div class="detail-item">
								<div class="bg"></div>
								<div class="detail-text">
									<p class="classify"><span>포인트</span>사용가능</p> 
									<h2>￥ ${goodsListThree.PRICE_UNIT_SALES}</h2>
									<ul class="appraisal">
										<li><strong>${goodsListThree.SALES_CNT}</strong>개 판매</li>
										<li><strong>${goodsListThree.STOCK_QTY}</strong>개 보유</li>
									</ul>
									<div class="detail-btn">
										<!-- 즐겨찾기 등록 되었으면 클래스 on 추가 -->
										<a 
											<c:if test="${goodsListThree.FAVORITES_GOODS_FLAG == 'Y'}">
												onclick="removeFavorite(${goodsListThree.GOODS_ID}, ${goodsListThree.DISPLAY_ID}, $(this));"
												
												class="btn-liked on"
											</c:if>
											<c:if test="${goodsListThree.FAVORITES_GOODS_FLAG != 'Y'}">
												onclick="addFavorite(${goodsListThree.GOODS_ID}, ${goodsListThree.DISPLAY_ID}, $(this));"
												
												class="btn-liked"
											</c:if>
										>liked</a>
										<!-- //즐겨찾기 등록 되었으면 클래스 on 추가 -->	
										
										<a onclick="addCart(${goodsListThree.DISPLAY_ID}, 1,  ${goodsListThree.PRICE_UNIT_SALES},  ${goodsListThree.ITEM_TYPE});" class="btn-shopping">shopping</a>
										<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListThree.DISPLAY_ID}" class="btn-pay">구매하기</a>
									</div>
									<a href="#" class="btn-close">close</a>
								</div>
							</div>
						</li>
						<!-- 상품 하나 : E -->						
						
						
					 </c:forEach>					
				

					<!-- 상품 카테고리 종류?? -->
					<!--
					<li class="item-kind type2">
						<div class="title">
							<h2>金东一 </h2>
							<p>常看的分类(如下) 请按分类查询商品</p>
						</div>
						<ul class="kind-list">
							<li><a href="#">香水</a></li>
							<li><a href="#">化妆品</a></li>
							<li><a href="#">时尚配饰</a></li>
							<li><a href="#">手表/饰品</a></li>
						</ul>
					</li>
					-->
				</ul>
			</section>
			<!-- 네번째 상품 목록 : E -->
			

			<!-- 다섯번째 상품 목록 : S -->
			<section class="product-list">
				<div class="header-title center">
					<h1>기타상품</h1>
				</div>
				<ul id="J_SearchListTarget">
			
				</ul>
				<div class="loading-ajax">로딩중~</div>
			</section>
			<!-- 다섯번째 상품 목록 : E -->
			
		</section>
		<!--  Container : E -->
		
		<%@ include file="/front/web/publish/mobile/common/menu_bottom.jsp"%> 
		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 
		
	</div>

	<script>
	
		/* 스크롤 내렸을 경우 나머지 리스트 보여주기 */
		$(function(){
			//var i = 3; //처음에 보여주는 갯수
			//$('.product-list .item-box:gt(' + i + ')').hide();
			
			var ing = false;
			
			scrollT();
			$(window).scroll(function(){
				scrollT();
			});
			
			
			function scrollT(){
				
				var doc_h = $(document).outerHeight(); //전체 사이즈
				var win_h = $(window).outerHeight(); //윈도우 사이즈
				var scroll_T = $(window).scrollTop(); //스크롤 사이즈
				var footer_h = $('#footer').outerHeight()-200;
				if(doc_h < win_h + scroll_T + footer_h){
					
					if (ing) {
						return;
					}
					
					ing = true;
					
					$(".loading-ajax").show();
					
					var pageCurr = $('#hdPageCurr').val();
					var pageUnit = $('#hdPageUnit').val();
					var totalCount = $('#hdPageTotal').val();
					var goodsName = $.trim($("#searchTitle").val());
					
					if ((pageCurr * pageUnit) >= totalCount) {
						$(".loading-ajax").hide();
						ing = false;
						return;
					}
					pageCurr++;

					$.ajax({
				 			data:{
				 	 			pageCurr : pageCurr
				 	 			,pageUnit : pageUnit
				 	 			,goodsName : goodsName
				 	 			,orderby : "DISPLAY_ID"
				 	 		},
						type : "POST",
						url : "/front/web/publish/mobile/brand/productcommentSelect.htm",
						success : function(data) {
							
							var goodsList = data.data || [];
							if(goodsList.length > 0 ){

								$('#hdPageCurr').val(pageCurr);
								$('#hdPageTotal').val(goodsList[0].TOTAL_CNT);
								$('#spnTotalCount').html(goodsList[0].TOTAL_CNT);
								
	   		    				for(var i=0;i<goodsList.length;i++){
	   		    					var favHtml = "";
	   		    					var iconHtml1 = "";
	   		    					var iconHtml2 = "";
	   		    					var iconHtml3 = "";

	   		    					if (goodsList[i].PRICE_UNIT_SALES < goodsList[i].PRICE_RANGE_HIGH) {
	   		    						iconHtml1 = '				<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>';
	   		    					}
	   		    					if (goodsList[i].SALES_CNT > 9) {
	   		    						iconHtml2 = '				<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>';
	   		    					}
	   		    					if (goodsList[i].NEW_TYPE == "Y") {
	   		    						iconHtml3 = '				<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>';
	   		    					}

	   		    					if (goodsList[i].FAVORITES_GOODS_FLAG == "Y") {
	   		    						favHtml = '				<a onclick="removeFavorite('+goodsList[i].GOODS_ID+', '+goodsList[i].DISPLAY_ID+', $(this));" class="btn-liked on">liked</a>';
	   		    					}
	   		    					else {
	   		    						favHtml = '				<a onclick="removeFavorite('+goodsList[i].GOODS_ID+', '+goodsList[i].DISPLAY_ID+', $(this));" class="btn-liked">liked</a>';
	   		    					}
	   		    					
	   		    					var html = ''
	   		    						+	'<li class="item-box">'
	   		    						+	'	<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId='+goodsList[i].DISPLAY_ID+'"><img src="'+goodsList[i].GOODS_LIST_IMG_URL+'" alt="" /></a></p>'
	   		    						+	'	<div class="text-box">'
	   		    						+	'		<a href="/front/web/publish/mobile/product/productview.htm?displayId='+goodsList[i].DISPLAY_ID+'">'
	   		    						+	'			<h2>['+goodsList[i].SGC_NM+']</h2>'
	   		    						+	'			<h3>'+goodsList[i].DESC_TITLE+'</h3>'
	   		    						+	'			<p class="price-cost">'
	   		    						+	'				￥ '+goodsList[i].PRICE_RANGE_HIGH+''
	   		    						+	'			</p>'
	   		    						+	'			<p class="price">'
	   		    						+	'				￥ '+goodsList[i].PRICE_UNIT_SALES+''
	   		    						+	'				<span>(￥ '+goodsList[i].PRICE_RANGE_HIGH+') </span>'
	   		    						+	'			</p>'
	   		    						+	'		</a>'
	   		    						+	'		<p class="good on"><a href="#"><i class="ico-heart"></i>'+goodsList[i].SALES_CNT+'</a></p>'
	   		    						+	'		<div class="ico-group">'
	   		    						+	iconHtml1
	   		    						+	iconHtml2
	   		    						+	iconHtml3
	   		    						+	'		</div>'
	   		    						+	'		<a href="#" class="btn-more">more</a>'
	   		    						+	'	</div>'
	   		    						+	'	<div class="detail-item">'
	   		    						+	'		<div class="bg"></div>'
	   		    						+	'		<div class="detail-text">'
	   		    						+	'			<p class="classify"><span>포인트</span>사용가능</p> '
	   		    						+	'			<h2>￥ '+goodsList[i].PRICE_UNIT_SALES+'</h2>'
	   		    						+	'			<ul class="appraisal">'
	   		    						+	'				<li><strong>'+goodsList[i].SALES_CNT+'</strong>개 판매</li>'
	   		    						+	'				<li><strong>'+goodsList[i].STOCK_QTY+'</strong>개 보유</li>'
	   		    						+	'			</ul>'
	   		    						+	'			<div class="detail-btn">'
	   		    						+   favHtml
	   		    						+	'				<a onclick="addCart('+goodsList[i].DISPLAY_ID+', 1,  '+goodsList[i].PRICE_UNIT_SALES+',  '+goodsList[i].ITEM_TYPE+');" class="btn-shopping">shopping</a>'
	   		    						+	'				<a href="/front/web/publish/mobile/product/productview.htm?displayId='+goodsList[i].DISPLAY_ID+'" class="btn-pay">구매하기</a>'
	   		    						+	'			</div>'
	   		    						+	'			<a href="#" class="btn-close">close</a>'
	   		    						+	'		</div>'
	   		    						+	'	</div>'
	   		    						+	'</li>';
	   		    						
									$('#J_SearchListTarget').append(html);
	   		    				}
								
							}
							
							$(".loading-ajax").hide();
							ing = false;
							
						},
						error : function(xhr, status, e) {
							$(".loading-ajax").hide();
							ing = false;
						}
					});					
					
					//이부분에서 ajax로 불러오면 될듯 싶네요
					//i+=3;
					//$('.product-list [class*=item-box]:lt(' + i + ')').show();
				}
			};
		})
	</script>	
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
	  		    title: '쇼핑몰 입니다.', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '쇼핑몰', // 分享标题
	  		    desc: '쇼핑몰 입니다.', // 分享描述
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
</body>
</html>

