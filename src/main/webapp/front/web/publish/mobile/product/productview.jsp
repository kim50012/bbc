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
				<h2 style="position: absolute;text-align: center;width: 80%;margin-left:10%;margin-right:10%;font-size: 19px;font-weight: normal;overflow: hidden;height: 30px;">${detail.DESC_TITLE }</h2>
				<div class="menu-sub">
					<ul>
						<li><a href="/front/web/publish/mobile/main/index.htm"><i class="ico-menu-sub01">首页</i></a></li>
						<!-- <li><a href="#"><i class="ico-menu-sub02">搜索</i></a></li>
						<li><a href="#"><i class="ico-menu-sub03">菜单</i></a></li>
						<li><a href="#"><i class="ico-menu-sub04">消息</i></a></li>
						<li><a href="#" class="btn-share"><i class="ico-menu-sub05">共有</i></a></li> -->
					</ul>
				</div>
			</div>
			<!-- 2015.10.13 상단 변경 : E -->
			
			<!-- 상품 상세 : S -->
			<section class="product-view">
				<div class="swiper-container2">
			        <div class="swiper-wrapper">
			            <c:if test="${detail.GOODS_DTL_SLIDE_IMG1_URL != null}">
				            <div class="swiper-slide">
				            	<a href="#"><img src="${detail.GOODS_DTL_SLIDE_IMG1_URL }" alt=""/></a>
				            </div>
			            </c:if>
			            <c:if test="${detail.GOODS_DTL_SLIDE_IMG2_URL != null}">
				            <div class="swiper-slide">
				            	<a href="#"><img src="${detail.GOODS_DTL_SLIDE_IMG2_URL }" alt=""/></a>
				            </div>
			            </c:if>
			            <c:if test="${detail.GOODS_DTL_SLIDE_IMG3_URL != null}">
				            <div class="swiper-slide">
				            	<a href="#"><img src="${detail.GOODS_DTL_SLIDE_IMG3_URL }" alt=""/></a>
				            </div>
			            </c:if>
			            <c:if test="${detail.GOODS_DTL_SLIDE_IMG4_URL != null}">
				            <div class="swiper-slide">
				            	<a href="#"><img src="${detail.GOODS_DTL_SLIDE_IMG4_URL }" alt=""/></a>
				            </div>
			            </c:if>
			            <c:if test="${detail.GOODS_DTL_SLIDE_IMG5_URL != null}">
				            <div class="swiper-slide">
				            	<a href="#"><img src="${detail.GOODS_DTL_SLIDE_IMG5_URL }" alt=""/></a>
				            </div>
			            </c:if>
			        </div>
			        <p class="add-text">${detail.DESC_DETAIL }</p>
			        <!-- Add Pagination -->
			        <div class="swiper-pagination2"></div>
			    </div>
			    
			    <div class="detail">

					<div class="ico-group">
						<c:if test="${detail.PRICE_UNIT_SALES < detail.PRICE_ORG}">
							<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
						</c:if>
						<c:if test="${detail.SUM_SALES_QTY > 9}">
							<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
						</c:if>
						<c:if test="${detail.NEW_TYPE == 'Y'}">
							<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
						</c:if>
					</div>
					
			    	<h2>
			    		<!-- <span>韩</span> -->${detail.DESC_TITLE }
			    		<!-- <a href="#"><img src="http://image.ssgdfm.com/images/shop/cn/mobile_new/content/btn-brand.gif" alt="" /></a> -->
			    	</h2>
			    	<h3>${detail.DESC_DETAIL }</h3>
			    	
			    	<!-- 2015.10.20 로그인 후 : S -->
			    	<p class="price-sale">
			    		<strong>회원가</strong>
			    		${detail.RATE }<span>%</span>
			    	</p>
			    	<!-- 2015.10.20 로그인 후 : E -->
			    	
			    	<p class="price">
 						￥ ${detail.PRICE_UNIT_SALES }
						<span>(￥ ${detail.PRICE_ORG }) </span>
					</p>
					
					<div class="volume">
						<button class="btn-minus">
							<img src="/front/web/publish/img/content/btn-minus.gif" alt="" />
						</button>
						<input id="prodCnt" type="number" value="1" title="상품갯수" />
						<button class="btn-plus">
							<img src="/front/web/publish/img/content/btn-plus.gif" alt="" />
						</button>
					</div>
			    </div>
			</section>
			<!-- 상품 상세 : E -->
			
		    <!-- 제품 상세 탭 4개 : S -->
		    <!-- 2015.10.15 android fixed 스크립트 오류로 재작업 : S -->
		    <div class="product-tap-menu">
		    	<ul>
		    		<li class="on"><a href="#">상품상세</a></li>
		    		<li><a href="#">기본정보</a></li>
		    		<li><a href="#">구매후기<c:if test="${detail.REVIEW_POINT_CNT > 0 }"><font color="red">(${detail.REVIEW_POINT_CNT })</font></c:if></a></li>
		    		<li><a href="#">상품문의</a></li>
		    	</ul>
	    	</div>
		    <!-- 2015.10.15 android fixed 스크립트 오류로 재작업 : E -->
		    <div class="product-tap">
		    	<ul>
			    	<!-- 첫번째 탭  : S -->
		    		<li class="tap01 on">
		    			<a href="#">상품상세</a>
				    	<div class="tap-detail">
				    		<div class="text-box">
								<c:forEach var="specList" items="${specList}" varStatus="status">
					    			<h3>${specList.SPEC_NM}</h3>
					    			<p>${specList.SPEC_VALUE_NM}</p>
				    			</c:forEach>
				    		</div>
				    	
				    		<div class="text-box">
								<c:forEach var="list" items="${imageList }" varStatus="status">  
									<c:if test="${list.HEADER_FLG == 'Y' }">
										${list.HEADER_TAG}
									</c:if>  
									<c:if test="${list.TMPL_NO != '99' }">
										${list.BODY_TAG }
									</c:if>  
									<c:if test="${list.TMPL_NO == '99' }">
										<c:if test="${detail.IS_MAIN == '1' }">
											${list.BODY_TAG }
										</c:if>
										<c:if test="${detail.IS_MAIN != '1' }">
										<pre style="white-space: pre-wrap;font-size:1rem;">${list.BODY_TAG }</pre>
										</c:if>
									</c:if>
									
										
									<c:if test="${list.FOOTER_FLG=='Y'}">
										${list.FOOTER_TAG}
									</c:if>			
								</c:forEach>
				    		</div>
				    	</div>
				    	
		    		</li>
			    	<!-- 첫번째 탭  : E -->
			    	
			    	<!-- 두번째 탭  : S -->
		    		<li class="tap02">
		    			<a href="#">기본정보</a>
				    	<div class="tap-detail">

				    		<div class="text-box">
				    			<h3>싸다구몰 (SSADAgu)</h3>
<!-- 				    			<h4>商品说明</h4> -->
				    			<p>좋은 품질, 좋은 가격, 좋은 제품 및 좋은 소식, 좋은 내용이 있으면 공유해 드립니다^^</p>
				    			
				    			<h3>싸다구몰 소개</h3>
<!-- 				    			<h4>取消订购</h4> -->
				    			<ul class="ico-list">
				    				<li>1. 중량집단(中粮集团）/ 요우하오똥시（有好东西） / 쩡구(正谷）제품 위주로 맛있는 식품, 과일, 유기농 제품의 내용을 매일 올려 드리도록 하겠습니다. </li>
				    				<li>2. 좋은 제품 공구도 할 예정입니다. 좋은 많이 찾아서 소개해 드리도록 하겠습니다. </li>
				    				<li>3. 최강의 다이어트 건강 보조 식품 “야식의 천사” 제품의 중국 판매 수권서(총대리권)을 받아 판매 하고 있습니다. 구매를 원하시는 분이 계시면 위쳇으로 연락부탁드립니다. </li>
				    				<li>4. 중량집단, 요후하오똥시에 구매한 이력이 있으시면, 저희 링크를 타고 구매를 하시더라도 구매 포인트는 다른 사업자로 들어갑니다. 이점 구매하실때 확인부탁드리고, 만약 구매가 어려우실때 제게 개인적으로 연락 주시면, 구매 대행도 해드립니다. </li>
				    				<li>5. 향후 영수증까지 발행 예정이니 믿고 구매 하셔도 됩니다. </li>
				    				<li>6. 중국생활에서 불편하거나 궁금하시거나 문의 사항이 있으시면 공유해 주세요. 아는 한도에서 최대한 도와 드리겠습니다^^</li>
				    			</ul>
				    			
				    		</div>
				    	</div>
		    		</li>
			    	<!-- 두번째 탭  : E -->
			    	<script></script>
			    	
			    	<!-- 세번째 탭  : S -->
		    		<li class="tap03">
		    			<a href="#">구매후기<c:if test="${detail.REVIEW_POINT_CNT > 0 }"><font color="red">(${detail.REVIEW_POINT_CNT })</font></c:if></a>
				    	<div class="tap-detail">
				    		<div class="comment-title">
				    			최근<strong>15개</strong> 리뷰까지 보여집니다.
				    			<a onclick="$('#reviewPopup').show();"><img src="/front/web/publish/img/content/btn-comment.gif" alt="" /></a>
				    		</div>
				    		<div class="comment-cont">
				    		

								<c:forEach var="reviewList" items="${reviewList}" varStatus="status">				    		
				    		
				    			<!-- 댓글 하나 : S -->
		    					<div class="comment-box">
		    						<a href="#">
			    						<p class="user-id">${reviewList.CUST_NICK_NM }<!-- <span>(${reviewList.CREATED_DT })</span> --></p>
			    							<h3>${reviewList.REVIEW_TITLE }</h3>
			    						<p class="date">${reviewList.CREATED_DT }</p>
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
		    					<div class="comment-detail">
		    						<div class="text">
		    							<pre style="white-space: pre-wrap;">${reviewList.REVIEW_DESC }</pre>
		    							<br>
		    							<img src="${reviewList.IMG1_URL }">
		    						</div>
		    					</div>
				    			<!-- 댓글 하나 : E -->
				    			
				    			</c:forEach>
				    			
				    			
				    		</div>
				    		<!--
				    		<div class="btn-group">
				    			<a href="#" class="btn-block"><span>查看更多评价</span></a>
				    		</div>
				    		-->
				    	</div>
		    		</li>
			    	<!-- 세번째 탭  : E -->
			    	
			    	<!-- 네번째 탭  : S -->
		    		<li class="tap04">
		    			<a href="#">상품문의</a>
				    	<div class="tap-detail">
				    		<div class="phone-box">
				    			<a href="tel:186-0058-3451"><i class="ico-phone"></i>문의전화 186-0058-3451 <span>(09:30~17:30)</span></a>
				    		</div>
				    		
				    		<div class="text-box">
				    			<h3>온라인 쇼핑몰</h3>
				    			<ul class="ico-list">
				    				<li>한국어로 중국에서 편하게 쇼핑을 할 수 있습니다.</li>
				    				<li>구매 대행 업무까지 진행합니다.</li>
				    				<li>자세한 사항은 문의전화 주시면 상세히 설명 드리겠습니다.</li>
				    			</ul>
				    			
				    			<h3>공동 구매</h3>
				    			<p>공동 구매도 진행하오니 공동 구매가 필요한 물품에 대하여 문의 주시면 저희가 직접 준비하여 공동 구매 진행을 합니다.</p>
				    			
				    		</div>
				    	</div>
		    		</li>
			    	<!-- 네번째 탭  : E -->
		    	</ul>
		    </div>
		    <!-- 제품 상세 탭 4개 : E -->
			
			<!-- 分类BEST : S -->
			<section class="product-list color04">
				<div class="header-title">
					<h1>BEST</h1>
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
					<li class="item-kind type2">
						<%@ include file="/front/web/publish/mobile/common/commonCategory.jsp"%> 
					</li>
				</ul>
			</section>
			<!-- 分类BEST : E -->
			
			<!-- 2015.10.13 카테고리 추가 : S -->
			<section class="category-box">
				<c:forEach var="brandList" items="${brandList}" varStatus="status">
				<div>
					<h3><i class="ico-category0008"></i> ${brandList.BRAND_NM}</h3>
					<ul>
						<li style="width:100%;">전화번호 : ${brandList.TEL}</li>
						<li style="width:100%;">주소 : ${brandList.ADDR}</li>
						<li style="width:100%;">소개 : ${brandList.INTRO}</li>
					</ul>
					<a href="/front/web/publish/mobile/brand/brand.htm?brandId=${brandList.BRAND_ID}" class="btn-more">전체상품보기</a>
				</div>
				</c:forEach>
			</section>
			<!-- 2015.10.13 카테고리 추가 : E -->
		</section>
		<!--  Container : E -->
		
		<!--  하단메뉴 : S -->
		<aside id="aside-menu">
			<div class="detail-btn">
				<!-- 좋아요 등록 되었으면 클래스 on 추가 -->
<!-- 				<a href="#" class="btn-heart">26</a> -->
				<!-- //좋아요 등록 되었으면 클래스 on 추가 -->
				<!-- 즐겨찾기 등록 되었으면 클래스 on 추가 -->
<!-- 				<a href="#" class="btn-liked on">찜하기</a> -->
				<!-- //즐겨찾기 등록 되었으면 클래스 on 추가 -->
				
				
				<c:if test="${detail.ITEM_TYPE == 2 }">
					<a href="${detail.ITEM_URL }" class="btn-pay" style="width: 100%;margin-left: 0;">구매 사이트로 가기</a>
				</c:if>
				<c:if test="${detail.ITEM_TYPE != 2 }">
					<a onclick="addCart(true);" class="btn-shopping" style="width:210px;left: 0;">장바구니</a>
					<a onclick="addCart(false);" class="btn-pay">구매하기</a>
				</c:if>
				
				<!-- 2015.10.13 상품이 없을때
				<a href="#" class="sold-out">很抱歉，该商品一时断货</a>
				 -->
			</div>
		</aside>
		
		<a href="#" id="btn-top">top button</a>
		<!--  하단메뉴 : E -->
		
		
		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 
		

		<section class="popup-layout" id="reviewPopup">
			<div class="bg"></div>
			<div class="popup-box" style="top: 5%;">
				<h1 style="background: #d31919;">상품 구매 후기를 남겨주세요.</h1>
				
			    <div class="comment-box" style="padding-top:50px">
					<div class="assessment-box">
						<ul>
							<li>
								<strong>평점</strong>
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
							
							var displayId = "${detail.DISPLAY_ID }";
							var pageCurr = $("#userStar").val();
							var listClassName = $("#reviewDesc").val();
							var reviewTitle = $("#reviewTitle").val();

							if (reviewTitle == "") {
								alert("제목을 입력하세요.");
								return;
							}

							if (reviewTitle == "") {
								alert("내용을 입력하세요.");
								return;
							}

							var reviewImg1 = '';
							
							
							$('.js-img-show').each(function(idx){
								if(idx < 1){
									eval('('+ 'reviewImg' + (idx+ 1) + ' = ' + $(this).data('fileId') + ' )');
								}
							});								
							
							$.ajax({
						 			data:{
						 				displayId : displayId
						 	 			,pageCurr : pageCurr
						 	 			,listClassName : listClassName
						 	 			,reviewTitle : reviewTitle
						 	 			,reviewImg1 : reviewImg1
						 	 		},
								type : "POST",
								url : "/front/web/publish/mobile/brand/productcommentInsert.htm",
								success : function(data) {
									location.reload();
								},
								error : function(xhr, status, e) {
									alert("리뷰 등록시 오류가 발생하였습니다.");
								}
							});
							
						}
					</script>
					<br>
					<div class="input" style="border-top: 1px solid #bdbdbd;margin-top:10px;"><input type="text" id="reviewTitle" title="제목" placeholder="제목" /></div>
					<div class="input"><textarea id="reviewDesc" title="상품 구매 후기를 남겨주세요." placeholder="상품 구매 후기를 남겨주세요."></textarea></div>
					
					<p class="text" style="padding-bottom: 5px;padding-top: 3px;">
						<i class="ico-warning2"></i>사진등록
					</p>

					<style>
						.imgDiv{width: 100%;height:auto; min-height: 80px;background-color: #ffffff;position: relative;}
						.imgshow{width:65px;height:65px;border: 1px solid #d6d6d6;text-align: center;line-height:65px;float: left;margin-left: 10px;margin-bottom:3%; position: relative;}
						.imgshow span{font-size: 40px;color: #d6d6d6;display: inline-block;}
					</style>

					<div class="imgDiv js-img-warp">
						<div class="imgshow js-img-add" id="preview" onclick="chooseImage();">
							<div class="close" onclick="deleteImg(this);" style="display:none;">x</div>
							<span>+</span>
						</div>
						<div style="clear: both;"></div>
					</div>
					
					<p class="text">
						<i class="ico-warning2"></i>상품 후기를 남겨주시면 추첨하여<br />소정의 상품을 드립니다.
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
		

		function addCart(cart) {
			
			var displayId = "${detail.DISPLAY_ID }";
			var pageCurr = $("#prodCnt").val();
			var price = "${detail.PRICE_UNIT_SALES }";
			
			$.ajax({
		 			data:{
		 				displayId : displayId
		 	 			,pageCurr : pageCurr
		 	 			,price : price
		 	 		},
				type : "POST",
				url : "/front/web/publish/mobile/brand/mypageshopcartInsert.htm",
				success : function(data) {
					if (cart) {
						alert("장바구니에 등록 되었습니다.");	
					}
					else {
						window.location ="/front/web/publish/mobile/mypage/mypageshopcart.htm";
					}
				},
				error : function(xhr, status, e) {
					alert("장바구니 등록 시 오류가 발생 하였습니다.");
				}
			});
			
		}		
		
	</script>
	
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
	/*************************************************/
	/****************  图像接口  **********************/
	/*************************************************/
	// 图片接口
	//拍照、本地选图
	var images = {
	  localId: [],
	  serverId: []
	};
	
	//拍照或从手机相册中选图接口
	function chooseImage(){
	  	wx.chooseImage({
	    	success: function (res) {
	    		images.localId = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	    		//alert('已选择 ' + res.localIds.length + ' 张图片');
	    		
	    		if(res.localIds.length > 1){
	    			alert('이미지는 1개만 업로드 가능합니다.');
	    		}
	    	}
	    	,fail: function(res){
	    	}
	    	,complete: function(res){
	    		uploadImage();
	    	}
	    	,cancel: function(res){
	    	} 
		});
	}
	
	//上传接口
	function uploadImage(){
	
		var i = 0, length = images.localId.length; 
	
		if (images.localId.length == 0) {
			return;
		}  
		
		images.serverId = [];
		  
		if(length > 1) {
		   	alert('이미지는 1개만 업로드 가능합니다.');
		}
		function upload() {
			
			var imgId = images.localId.shift();
			
			if(!!imgId){
				wx.uploadImage({
		        	localId: imgId,
		        	success: function (res) {
		 		      	$.ajax({
		 		    		async: false,  
			        	 	data:{
			        	 		shopId: '${detail.SHOP_ID }',
			        	 		mediaId: res.serverId,
			        	 		fileType: 1,   //1:图片  2：语音
			        	 		date : new Date()
			        	 	},
			 				type : "POST",
			 				url : "/wx/media/download.htm",
			 				timeout : 15000,
			 				success : function(res) {
			 					
		 					 	if(res.success){
	
		 							var fileId = res.data.fileId;
		 							var fullUrl = res.data.fullUrl;
		 					
	// 		 						var imgItem = '<li class="js-img-show" style="width: 20%;height: 90px;margin-bottom: 10px;" id="preview' + fileId + '" data-file-id="' + fileId + '">'
	// 					 				+ '<a onclick="deleteImg(' + fileId + ')">'
	// 					 				+ '<img style="height:80px;max-height:80px;margin: 0;border: solid 1px #e2dbdb;margin: 2px;" src="' + fullUrl + '">삭제'
	// 					 				+ '</a>'
	// 					 				+ '</li>';
			 						
	// 		 						$('#imgShowDiv').before(imgItem);
			 					 	
	
			 						var imgItem = '<div class="imgshow js-img-show" id="preview' + fileId + '" data-file-id="' + fileId + '">' 
								 				+ '<div class="close" onclick="deleteImg(' + fileId + ');">x</div>'
								 				+ '<img class="upload-img" alt="" src="' + fullUrl + '"/>'
								 				+ '</div>';
			 						
			 						$('.js-img-add').before(imgItem);
	
						 		    $(".imgshow").each(function(){
						 		    	if($(this).find('img').length>0){
						 		    		$(this).find(".close").show();
						 		    		$(this).css("border","0");
						 		    	}
						 		    });					 	
			 					 	
			 					}//end if
	
		 					},
			 				error : function(xhr, status, e) {
			 					alert("error: " + status);
			 				}
		  				});
		          
		            	upload();
		            	
		        	},
			        fail: function (res) {
			        	alert(JSON.stringify(res));
			        }
		      	});
			}
	    }
	   
	   	upload();
	}	

	
		$(function(){ 
			  wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
				    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
				    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
				    signature: "${signInfo.signature }",// 必填，签名，见附录1
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
			  		    title: '${detail.DESC_TITLE }', // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${detail.DESC_TITLE }', // 分享标题
			  		    desc: '${detail.DESC_DETAIL }', // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		
			  	});
			  
		});
	</script>	
	
</body>
</html>

