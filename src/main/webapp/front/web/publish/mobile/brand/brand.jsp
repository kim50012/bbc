<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Online Shop" />
<%@ include file="/front/web/publish/mobile/common/head.jsp"%> 
<body>

<input type="hidden" id="hdPageCurr" value="${pageCurr }"/>
<input type="hidden" id="hdPageUnit" value="${pageUnit }"/>
<input type="hidden" id="hdPageTotal" value="${totalCount }"/>
<input type="hidden" id="hdBrandId" value="${brandId }"/>
<input type="hidden" id="hdShopGradeClassId" value="${shopGradeClassId }"/>

	<div id="wrap">
		<%@ include file="/front/web/publish/mobile/common/head_sub.jsp"%> 
		<%@ include file="/front/web/publish/mobile/common/gnb.jsp"%> 
		
		<!--  Container : S -->
		<!-- 2015.10.29 brand-layout 클래스 추가 -->
		<section id="container" class="brand-layout" style="min-height: 600px;">
			<div class="location">
				<a href="javascript:history.back();" class="arrow"><i>back page</i></a>
				<h2>${brandOne.BRAND_NM }</h2>
				<a href="#" class="btn-means box-v" data="item-box-v"><i>back page</i></a>
				<a href="#" class="btn-means " data="item-box" ><i>back page</i></a>
			</div>
			
			<div class="brand-visual"><img alt="" src="${brandOne.BRAND_IMG }"></div>
			
			<div class="search-result">
				<c:set var="aTitle1" value="상품분류" />
				<c:set var="aTitle2" value="가맹점" />
				<c:set var="aTitle3" value="정렬" />
				<a href="#" id="aTitle1">상품분류<i class="arrow"></i></a>
				<!-- 
					만약 클릭 이벤트 동작안되게 할려면
					클래스 disabled 을 추가하시면 됩니다 
					<a href="#" class="disabled">所有产品<i class="arrow"></i></a>
				-->
				<div class="search-menu">
					<ul>
			            <li <c:if test="${shopGradeClassId == 0 or shopGradeClassId == null}">class="on"</c:if>><a href="/front/web/publish/mobile/brand/brand.htm?shopGradeClassId=&brandId=${brandId}&orderby=${orderby }">전체상품</a></li>
						<c:forEach var="classList" items="${classList}" varStatus="status">
							<li <c:if test="${classList.SGC_ID == shopGradeClassId}">class="on"<c:set var="aTitle1" value="${classList.SGC_NM}" /></c:if>><a href='/front/web/publish/mobile/brand/brand.htm?shopGradeClassId=${classList.SGC_ID}&brandId=${brandId}&orderby=${orderby }'>${classList.SGC_NM}</a></li>
						</c:forEach>
					</ul>
				</div>
				
				<a href="#" id="aTitle2">가맹점<i class="arrow"></i></a>
				<div class="search-menu">
					<ul>
			            <li <c:if test="${brandId == 0 or brandId == null}">class="on"</c:if>><a href="/front/web/publish/mobile/product/productlist.htm?brandId=&shopGradeClassId=${shopGradeClassId}&orderby=${orderby }">전체</a></li>
						<c:forEach var="brandList" items="${brandList}" varStatus="status">
							<li <c:if test="${brandList.BRAND_ID == brandId}">class="on"<c:set var="aTitle2" value="${brandList.BRAND_NM}" /></c:if>><a href='/front/web/publish/mobile/brand/brand.htm?brandId=${brandList.BRAND_ID}&shopGradeClassId=${shopGradeClassId}&orderby=${orderby }'>${brandList.BRAND_NM}</a></li>
						</c:forEach>
					</ul>
				</div>
				
				<a href="#" id="aTitle3">정렬<i class="arrow"></i></a>
				<div class="search-menu">
					<ul>
						<li <c:if test="${orderby == ''}">class="on"<c:set var="aTitle3" value="최신상품" /></c:if>><a href="/front/web/publish/mobile/brand/brand.htm?brandId=${brandId}&shopGradeClassId=${shopGradeClassId}&orderby=">최신상품</a></li>
						<li <c:if test="${orderby == 'PRICE_ASC'}">class="on"<c:set var="aTitle3" value="가격 ↓" /></c:if>><a href="/front/web/publish/mobile/brand/brand.htm?brandId=${brandId}&shopGradeClassId=${shopGradeClassId}&orderby=PRICE_ASC">가격 ↓</a></li>
						<li <c:if test="${orderby == 'PRICE_DESC'}">class="on"<c:set var="aTitle3" value="가격 ↑" /></c:if>><a href="/front/web/publish/mobile/brand/brand.htm?brandId=${brandId}&shopGradeClassId=${shopGradeClassId}&orderby=PRICE_DESC">가격 ↑</a></li>
						<li <c:if test="${orderby == 'SALES_QTY_DESC'}">class="on"<c:set var="aTitle3" value="판매량" /></c:if>><a href="/front/web/publish/mobile/brand/brand.htm?brandId=${brandId}&shopGradeClassId=${shopGradeClassId}&orderby=SALES_QTY_DESC">판매량</a></li>
					</ul>
				</div>
				<div class="search-bg"></div>
			</div>
			
			<script>
			$("#aTitle1").html('${aTitle1}<i class="arrow"></i>');
			$("#aTitle2").html('${aTitle2}<i class="arrow"></i>');
			$("#aTitle3").html('${aTitle3}<i class="arrow"></i>');
			</script>
			
			<!-- 2015.10.23 검색결과 이동 : S -->
			<p class="brand-search-result"><span>전체 ${totalCount }건</span></p>
			<!-- 2015.10.23 검색결과 이동 : E -->
			
			<section class="product-list">
				<ul id="J_SearchListTarget">

					<c:forEach var="goodsList" items="${goodsList}" varStatus="status">

						<!-- 상품 하나 : S -->
						<li class="item-box">
							<p class="img"><a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsList.DISPLAY_ID}"><img src="${goodsList.GOODS_LIST_IMG_URL}" alt="" /></a></p>
							<div class="text-box">
								<!-- 2015.10.23 a링크 추가 : S -->
								<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsList.DISPLAY_ID}">
									<h2>[${goodsList.SGC_NM}]</h2>
									<h3>${goodsList.DESC_TITLE}</h3>
									
									<p class="price-cost"> <!-- 원가 -->
										￥ ${goodsList.PRICE_RANGE_HIGH}
									</p>
									<p class="price"><!-- 금액 -->
										￥ ${goodsList.PRICE_UNIT_SALES}
										<span>(￥ ${goodsList.PRICE_RANGE_HIGH}) </span>
									</p>
								</a>
								<!-- 2015.10.23 a링크 추가 : E -->
								
								<!-- 선택 된 상태는 good에 클래스 on을 추가 -->
								<p class="good on"><a href="#"><i class="ico-heart"></i>${goodsList.SALES_CNT}</a></p>
								<!-- //선택 된 상태는 good에 클래스 on을 추가 -->
								
								<div class="ico-group">
									<c:if test="${goodsList.PRICE_UNIT_SALES < goodsList.PRICE_RANGE_HIGH}">
										<span><img src="/front/web/publish/img/content/ico-group03.gif" alt="할인" /></span>
									</c:if>
									<c:if test="${goodsList.SALES_CNT > 9}">
										<span><img src="/front/web/publish/img/content/ico-group04.gif" alt="인기" /></span>
									</c:if>
									<c:if test="${goodsList.NEW_TYPE == 'Y'}">
										<span><img src="/front/web/publish/img/content/ico-group02.gif" alt="신상" /></span>
									</c:if>
								</div>
								
								
								<a href="#" class="btn-more">more</a>
							</div>
							<div class="detail-item">
								<div class="bg"></div>
								<div class="detail-text">
									<p class="classify"><span>포인트</span>사용가능</p> 
									<h2>￥ ${goodsList.PRICE_UNIT_SALES}</h2>
									<ul class="appraisal">
										<li><strong>${goodsList.SALES_CNT}</strong>개 판매</li>
										<li><strong>${goodsList.STOCK_QTY}</strong>개 보유</li>
									</ul>
									<div class="detail-btn">
										<!-- 즐겨찾기 등록 되었으면 클래스 on 추가 -->
										<a 
											<c:if test="${goodsList.FAVORITES_GOODS_FLAG == 'Y'}">
												onclick="removeFavorite(${goodsList.GOODS_ID}, ${goodsList.DISPLAY_ID}, $(this));"
												
												class="btn-liked on"
											</c:if>
											<c:if test="${goodsList.FAVORITES_GOODS_FLAG != 'Y'}">
												onclick="addFavorite(${goodsList.GOODS_ID}, ${goodsList.DISPLAY_ID}, $(this));"
												
												class="btn-liked"
											</c:if>
										>liked</a>
										<!-- //즐겨찾기 등록 되었으면 클래스 on 추가 -->
										
										<!-- 상품이 있을때 -->
										<a onclick="addCart(${goodsList.DISPLAY_ID}, 1,  ${goodsList.PRICE_UNIT_SALES},  ${goodsList.ITEM_TYPE});" class="btn-shopping">shopping</a>
										<a href="/front/web/publish/mobile/product/productview.htm?displayId=${goodsList.DISPLAY_ID}" class="btn-pay">구매하기</a>
										
										<!-- 2015.10.14 상품이 없을때 
										<a href="#" class="sold-out">很抱歉，一时断货</a>
										-->
									</div>
									<a href="#" class="btn-close">close</a>
								</div>
							</div>
						</li>
						<!-- 상품 하나 : E -->						
						
						<!-- 상품 하나 : E -->

					 </c:forEach>		
					 		
					
				</ul>
				<div class="loading-ajax">로딩중~</div>
			</section>
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
					var shopGradeClassId = $('#hdShopGradeClassId').val();
					var brandId = $('#hdBrandId').val();
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
				 	 			,brandId : brandId
				 	 			,shopGradeClassId : shopGradeClassId
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
</body>
</html>

