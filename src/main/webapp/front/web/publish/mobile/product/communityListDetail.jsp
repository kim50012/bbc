<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>
	<div id="wrap">
		
		<!--  Container : S -->
		<section id="product-view" >
			
			<!-- 2015.10.13 상단 변경 : S -->
			<div class="location">
				<a href="javascript:history.back();" class="arrow"><i>back page</i></a>
				<div class="menu-sub">
					<ul>
<!-- 						<li><a href="/front/web/publish/mobile/main/index.htm"><i class="ico-menu-sub01">首页</i></a></li> -->
		            	<c:if test="${review.DISPLAY_ID == 8 }">
							<li><a href="/front/bbc/clb/clbDetMy.htm?intClbsq=9"><i class="ico-menu-sub01">首页</i></a></li>
		            	</c:if>
		            	<c:if test="${review.DISPLAY_ID < 8 }">
							<li><a href="/front/web/publish/mobile/product/communityList.htm?displayId=1"><i class="ico-menu-sub01">首页</i></a></li>
		            	</c:if>
					</ul>
				</div>
			</div>
			<!-- 2015.10.13 상단 변경 : E -->
			

			<!-- 상품 상세 : S -->
			<section class="product-view">
			    <div class="detail">
			    	<h2>
			    		${review.REVIEW_TITLE }
			    	</h2>
			    	<h3>${review.CUST_NICK_NM } &nbsp; &nbsp; ${review.CREATED_DT }</h3>
			    </div>		
			    <div class="detail" style="font-size: 14px;">
			    	<pre style="white-space: pre-wrap;">${review.REVIEW_DESC }</pre>
			    </div>		
			
				<div style="padding:8px;">

			            <c:if test="${review.IMG1_URL != null}">
				            <img src="${review.IMG1_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG2_URL != null}">
				            <img src="${review.IMG2_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG3_URL != null}">
				            <img src="${review.IMG3_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG4_URL != null}">
				            <img src="${review.IMG4_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG5_URL != null}">
				            <img src="${review.IMG5_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG6_URL != null}">
				            <img src="${review.IMG6_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG7_URL != null}">
				            <img src="${review.IMG7_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG8_URL != null}">
				            <img src="${review.IMG8_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            <c:if test="${review.IMG9_URL != null}">
				            <img src="${review.IMG9_URL }" alt=""/>
				            <div style="height:8px;"></div>
			            </c:if>
			            
				</div>
			
				<div class="swiper-container2" style="display:none;">
			        <div class="swiper-wrapper">
			            <c:if test="${review.IMG1_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG1_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG2_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG2_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG3_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG3_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG4_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG4_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG5_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG5_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG6_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG6_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG7_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG7_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG8_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG8_URL }" alt=""/></a></div>
			            </c:if>
			            <c:if test="${review.IMG9_URL != null}">
				            <div class="swiper-slide"><a href="#"><img src="${review.IMG9_URL }" alt=""/></a></div>
			            </c:if>
			        </div>
			        <!-- Add Pagination -->
			        <div class="swiper-pagination2"></div>
			    </div>
			</section>
			<!-- 상품 상세 : E -->	
			
		    <!-- 제품 상세 탭 4개 : S -->
		    <!-- 2015.10.15 android fixed 스크립트 오류로 재작업 : S -->
		    <div class="product-tap-menu">
		    	<ul>
		    		<li class="on"><a href="#">댓글</a></li>
		    	</ul>
	    	</div>
		    <!-- 2015.10.15 android fixed 스크립트 오류로 재작업 : E -->
		    <div class="product-tap">
		    	<ul>
			    	<!-- 첫번째 탭  : S -->
		    		<li class="tap01 on">

		    			<a href="#">댓글</a>
				    	<div class="tap-detail">
				    		<div class="comment-title">
				    			총 <strong>${review.CNT }개</strong> 댓글이 있습니다.
				    			<a onclick="$('#reviewPopup').show();"><img src="/front/web/publish/img/content/btn-story-rp.gif" alt="" /></a>
				    		</div>
				    		<div class="comment-cont">
				    		

								<c:forEach var="reviewList" items="${reviewList}" varStatus="status">				    		
				    		
				    			<!-- 댓글 하나 : S -->
		    					<div class="comment-box-reply">
		    						<a href="#">
			    						<p class="user-id">${reviewList.CUST_NICK_NM } &nbsp; ${reviewList.CREATED_DT }
			    							<h3 style="font-weight: normal;"><pre style="white-space: pre-wrap;">${reviewList.REVIEW_DESC }</pre></h3>
			    						<p class="date">&nbsp;</p>
			    						<p class="ico-star">
								            <c:if test="${reviewList.GOODS_DISPLAY_GPA == 0}">
								            	<i class="zero">별이 없음</i>
								            </c:if>
								            <c:if test="${reviewList.GOODS_DISPLAY_GPA == 1}">
								            	<i class="one">매우 안좋음</i>
								            </c:if>
								            <c:if test="${reviewList.GOODS_DISPLAY_GPA == 2}">
								            	<i class="two">안좋음</i>
								            </c:if>
								            <c:if test="${reviewList.GOODS_DISPLAY_GPA == 3}">
								            	<i class="three">보통</i>
								            </c:if>
								            <c:if test="${reviewList.GOODS_DISPLAY_GPA == 4}">
								            	<i class="four">좋음</i>
								            </c:if>
								            <c:if test="${reviewList.GOODS_DISPLAY_GPA == 5}">
								            	<i class="five">매우 좋음</i>
								            </c:if>
			    						</p>
		    						</a>
		    					</div>
				    			<!-- 댓글 하나 : E -->
				    			
				    			</c:forEach>
				    			
				    			
				    		</div>
				    		
				    		<div class="comment-title">
				    			<a onclick="$('#reviewPopup').show();"><img src="/front/web/publish/img/content/btn-story-rp.gif" alt="" /></a>
				    		</div>
				    		
				    	</div>				    	
		    		</li>
			    	<!-- 첫번째 탭  : E -->
			    	
		    	</ul>
		    	
				    		<br>
				    		<br>
				    		<br>
				    		<br>
				    		<br>
		    </div>
		    <!-- 제품 상세 탭 4개 : E -->
			
			<!-- 分类BEST : S -->
			<section class="product-list color04" style="display:none;">
				<div class="header-title">
					<h1>BEST 상품 추천</h1>
				</div>
				<ul>
					<c:forEach var="goodsListBest" items="${goodsListBest}" varStatus="status">
						<!-- 상품 하나 : S -->

						<li class="item-box-v kind-list01">
							<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListBest.DISPLAY_ID}">
								<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsListBest.DISPLAY_ID}"><img src="${goodsListBest.GOODS_LIST_IMG_URL}" alt="" /></a></p>
								<div class="text-box">
									<h2>[${goodsListBest.SGC_NM}]</h2>
									<h3>${goodsListBest.DESC_TITLE}</h3>
									
									<p class="price">
										￥ ${goodsListBest.PRICE_UNIT_SALES}
										<span>(￥${goodsListBest.PRICE_RANGE_HIGH}) </span>
									</p>
									
									<div class="ico-group">
										<span class="type01">NEW</span>
										<span class="type04">EVT</span>
									</div>
								</div>
							</a>
						</li>	
						<!-- 상품 하나 : E -->
					 </c:forEach>	

										
					<!-- 상품 카테고리 종류?? -->
					<li class="item-kind type2">
						<%@ include file="/front/web/publish/mobile/common/commonCategory.jsp"%> 
					</li>
				</ul>
			</section>
			<!-- 分类BEST : E -->
			
		<a href="#" id="btn-top">top button</a>
		<!--  하단메뉴 : E -->
		
		<div style="display:none;">
		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 
		</div>

		<section class="popup-layout" id="reviewPopup">
			<div class="bg"></div>
			<div class="popup-box" style="top: 10%;">
				<h1 style="background: #d31919;">댓글 쓰기</h1>
				
			    <div class="comment-box" style="padding-top:50px">
					<div class="assessment-box">
						<ul>
							<li>
								<strong>별점</strong>
								<button class="off" id="star1" onclick="starClick(1);return false;">1</button>
								<button class="off" id="star2" onclick="starClick(2);return false;">2</button>
								<button class="off" id="star3" onclick="starClick(3);return false;">3</button>
								<button class="off" id="star4" onclick="starClick(4);return false;">4</button>
								<button class="off" id="star5" onclick="starClick(5);return false;">5</button>
								<input type="hidden" id="userStar" value="0" />
							</li>
						</ul>
					</div>
					<script>
						function starClick(a) {
							$("#star1").attr("class", "off");
							$("#star2").attr("class", "off");
							$("#star3").attr("class", "off");
							$("#star4").attr("class", "off");
							$("#star5").attr("class", "off");
							if (a > 4) { $("#star5").removeClass("off"); }
							if (a > 3) { $("#star4").removeClass("off"); }
							if (a > 2) { $("#star3").removeClass("off"); }
							if (a > 1) { $("#star2").removeClass("off"); }
							if (a > 0) { $("#star1").removeClass("off"); }
							$("#userStar").val(a);
						}
						function addReview() {
							
							var displayId = "${displayId }";
							var pageCurr = $("#userStar").val();
							var listClassName = $("#reviewDesc").val();
// 							var reviewTitle = $("#reviewTitle").val();
							var goodsId = "${review.REVIEW_ID }";
							
							var spaceCheck = listClassName.replace(/[\t\n ]/g, "");
							if (spaceCheck == "") {
								alert("내용을 입력하세요.");
								return;
							}
							
							$.ajax({
						 			data:{
						 				displayId : displayId
						 	 			,pageCurr : pageCurr
						 	 			,listClassName : listClassName
// 						 	 			,reviewTitle : reviewTitle
						 	 			,goodsId : goodsId
						 	 		},
								type : "POST",
								url : "/front/web/publish/mobile/brand/productcommentInsert.htm",
								success : function(data) {
									location.reload();
								},
								error : function(xhr, status, e) {
									alert("댓글 등록시 오류가 발생하였습니다.");
								}
							});
							
						}
					</script>
					
<!-- 					<div class="input"><input type="text" id="reviewTitle" title="제목" placeholder="제목" /></div> -->
					<div class="input"><textarea id="reviewDesc" title="댓글을 입력하세요." placeholder="댓글을 입력하세요."></textarea></div>
					
					<p class="text">
						<i class="ico-warning2"></i>원글의 별점을 주세요 ^^<br />
					</p>
					<div class="btn-group type2">
						<a onclick="$('#reviewPopup').hide();" class="btn-gray">
							<span>취소</span>
						</a>
						<a onclick="addReview();" class="btn-red">
							<span>남기기</span>
						</a>
					</div>
				</div>				
			</div>
		</section>		
		
	</div>
	
	<script>
		$('.volume .btn-minus').click(function(){
			var number = parseInt($('.volume input').val());
			if(number > 0){
				$('.volume input').val(number -1);
			}
			return false;
		});
		$('.volume .btn-plus').click(function(){
			var number = parseInt($('.volume input').val());
			$('.volume input').val(number +1);
			return false;
		});
		
	
		
	</script>
	
</body>
</html>

