<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<c:set var="title" value="Community" />
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
		            	<c:if test="${displayId == 8 }">
							<li><a href="/front/bbc/clb/clbDetMy.htm?intClbsq=9"><i class="ico-menu-sub01">首页</i></a></li>
		            	</c:if>
		            	<c:if test="${displayId < 8 }">
							<li><a href="/front/web/publish/mobile/main/index.htm"><i class="ico-menu-sub01">首页</i></a></li>
		            	</c:if>
		            							
						<li><a href="#" class="btn-share"><i class="ico-menu-sub03">共有</i></a></li>
					</ul>					
				</div>
			</div>
			<!-- 2015.10.13 상단 변경 : E -->
			

			<!-- 상품 상세 : S -->
			<section class="product-view">
<!-- 			    <div class="detail"> -->
<!-- 			    	<h2> -->
<!-- 			    		커뮤니티 입니다. -->
<!-- 			    	</h2> -->
<!-- 			    </div> -->
			
				<div class="swiper-container2" style="margin: 0;">
			        <div class="swiper-wrapper">
		            	<c:if test="${displayId != 8 }">
				            <div class="swiper-slide">
				            	<a href="#"><img src="/front/web/publish/img/main_bbs.jpg" alt="" style="width: 100%;" /></a>
				            </div>
				            <div class="swiper-slide">
				            	<a href="#"><img src="/front/web/publish/img/main_bbs2.jpg" alt="" style="width: 100%;" /></a>
				            </div>
		            	</c:if>
		            	<c:if test="${displayId == 8 }">
				            <div class="swiper-slide">
				            	<a href="#"><img src="/front/web/publish/img/bbc.jpg" alt="" style="width: 100%;" /></a>
				            </div>
		            	</c:if>
			        </div>
			        <p class="add-text" style="padding-top: 8px;">
			        <c:if test="${displayId == 1 }">커뮤니티 - 최신글 보기</c:if>
			        <c:if test="${displayId == 2 }">맛집소개</c:if>
			        <c:if test="${displayId == 3 }">정보공유</c:if>
			        <c:if test="${displayId == 4 }">Q&A</c:if>
			        <c:if test="${displayId == 5 }">생활정보</c:if>
			        <c:if test="${displayId == 6 }">갤러리</c:if>
			        <c:if test="${displayId == 7 }">건의사항 & 광고문의</c:if>
			        <c:if test="${displayId == 8 }">북배수다방</c:if>
			        </p>
			        <!-- Add Pagination -->
			        <div class="swiper-pagination2"></div>
			    </div>
			</section>
			<!-- 상품 상세 : E -->				
			
		    <!-- 제품 상세 탭 4개 : S -->
		    <!-- 2015.10.15 android fixed 스크립트 오류로 재작업 : S -->
		    <div class="product-tap-menu">
		    	<ul>
		    		<li class="on">
			    		<a href="#" style="width: 50%;">
					        <c:if test="${displayId == 1 }">커뮤니티 전체 최신글</c:if>
					        <c:if test="${displayId == 2 }">맛집소개 최신글</c:if>
					        <c:if test="${displayId == 3 }">정보공유 최신글</c:if>
					        <c:if test="${displayId == 4 }">Q&A 최신글</c:if>
					        <c:if test="${displayId == 5 }">생활정보 최신글</c:if>
					        <c:if test="${displayId == 6 }">갤러리 최신글</c:if>
					        <c:if test="${displayId == 7 }">건의사항 & 광고문의 최신글</c:if>
					        <c:if test="${displayId == 8 }">북배수다방 최신글</c:if>
			    		</a>
		    		</li>
		    	</ul>
	    	</div>
		    <!-- 2015.10.15 android fixed 스크립트 오류로 재작업 : E -->
		    <div class="product-tap" style="margin-top: 5px;">
		    	<ul>
			    	<!-- 첫번째 탭  : S -->
		    		<li class="tap01 on">

			    		<a href="#" style="width: 50%;text-align:left;padding-left:10px;">
					        <c:if test="${displayId == 1 }">커뮤니티 전체 최신글</c:if>
					        <c:if test="${displayId == 2 }">맛집소개 최신글</c:if>
					        <c:if test="${displayId == 3 }">정보공유 최신글</c:if>
					        <c:if test="${displayId == 4 }">Q&A 최신글</c:if>
					        <c:if test="${displayId == 5 }">생활정보 최신글</c:if>
					        <c:if test="${displayId == 6 }">갤러리 최신글</c:if>
					        <c:if test="${displayId == 7 }">건의사항 & 광고문의 최신글</c:if>
					        <c:if test="${displayId == 8 }">북배수다방 최신글</c:if>
			    		</a>
				    	<div class="tap-detail">
				    		<div class="comment-title">
				    			총 <strong>${totalRecords }개</strong> 글이 있습니다.
				    			<a onclick="$('#reviewPopup').show();"><img src="/front/web/publish/img/content/btn-story-comment.gif" alt="" /></a>
				    		</div>
				    		<div class="comment-cont">
				    		

								<c:forEach var="reviewList" items="${reviewList}" varStatus="status">				    		
				    		
				    			<!-- 글 하나 : S -->
		    					<div class="comment-box-reply" <c:if test="${reviewList.IMG1_URL != null}">style="padding-left: 75px;"</c:if>>
						            <c:if test="${reviewList.IMG1_URL != null}">
							            <img src="${reviewList.IMG1_URL }" style="width: 60px;height: 60px;position: absolute;border: solid 1px #e6e6e6;left: 5px;" onclick="window.location='communityListDetail.htm?displayId=${displayId }&goodsId=${reviewList.REVIEW_ID }';"/>
						            </c:if>
		    						<a href="communityListDetail.htm?displayId=${displayId }&goodsId=${reviewList.REVIEW_ID }">
			    						<p class="user-id">${reviewList.CUST_NICK_NM }
			    							<h3>
									        <c:if test="${reviewList.DISPLAY_ID == 1 }">[커뮤니티]</c:if>
									        <c:if test="${reviewList.DISPLAY_ID == 2 }">[맛집소개]</c:if>
									        <c:if test="${reviewList.DISPLAY_ID == 3 }">[정보공유]</c:if>
									        <c:if test="${reviewList.DISPLAY_ID == 4 }">[Q&A]</c:if>
									        <c:if test="${reviewList.DISPLAY_ID == 5 }">[생활정보]</c:if>
									        <c:if test="${reviewList.DISPLAY_ID == 6 }">[갤러리]</c:if>
									        <c:if test="${reviewList.DISPLAY_ID == 7 }">[건의사항 & 광고문의]</c:if>			    							
			    								${reviewList.REVIEW_TITLE } <font color="red">[${reviewList.CNT}]</font>
			    							</h3>
			    						<p class="date"><i class="ico-warning3"></i>&nbsp;<span>${reviewList.TOTAL_GPA }</span><span style="right: 0px;position: absolute;padding-right: 10px;">${reviewList.CREATED_DT }</span></p>
			    						<p class="ico-star">
								            <c:if test="${reviewList.AVG_GOODS_DISPLAY_GPA == 0}">
								            	<i class="zero">별이 없음</i>
								            </c:if>
								            <c:if test="${reviewList.AVG_GOODS_DISPLAY_GPA == 1}">
								            	<i class="one">매우 안좋음</i>
								            </c:if>
								            <c:if test="${reviewList.AVG_GOODS_DISPLAY_GPA == 2}">
								            	<i class="two">안좋음</i>
								            </c:if>
								            <c:if test="${reviewList.AVG_GOODS_DISPLAY_GPA == 3}">
								            	<i class="three">보통</i>
								            </c:if>
								            <c:if test="${reviewList.AVG_GOODS_DISPLAY_GPA == 4}">
								            	<i class="four">좋음</i>
								            </c:if>
								            <c:if test="${reviewList.AVG_GOODS_DISPLAY_GPA == 5}">
								            	<i class="five">매우 좋음</i>
								            </c:if>
			    						</p>
		    						</a>
		    					</div>
				    			<!-- 글 하나 : E -->
				    			
				    			</c:forEach>
				    			
				    			
				    		</div>
				    		
				    		<div class="comment-title">
				    			<a onclick="$('#reviewPopup').show();"><img src="/front/web/publish/img/content/btn-story-comment.gif" alt="" /></a>
				    		</div>
				    		<br>
				    		<br>
				    		<br>
				            <c:if test="${totalRecords > 15}">	
					    		<div class="btn-group">
					    			<a onclick="getList();" class="btn-block"><span>최신글 더보기</span></a>
					    		</div>
				            </c:if>
				    	</div>				    	
		    		</li>
			    	<!-- 첫번째 탭  : E -->
			    	
		    	</ul>
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
		<br>
		<br>
		<br>
		<br>
		
		<c:if test="${displayId != 8 }">
            <%@ include file="/front/web/publish/mobile/common/menu_bottom2.jsp"%> 
        </c:if>
		
		
		<div style="display:none;">
		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 
		</div>

		<aside class="share-wrap">
			<div class="bg"></div>
			<div class="share-box" style="bottom: 0px;">
				<ul>
					<li class="share01"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=1">최신글</a></li>
					<li class="share02"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=2">맛집소개</a></li>
					<li class="share03"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=3">정보공유</a></li>
					<li class="share04"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=4">Q&A</a></li>
					<li class="share05"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=5">생활정보</a></li>
					<li class="share06"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=6">갤러리</a></li>
					<li class="share07"><a href="/front/web/publish/mobile/product/communityList.htm?displayId=7">건의사항 & 광고문의</a></li>
				</ul>
				<div class="btn-group">
					<a href="#" class="btn-black">
						<span>취소</span>
					</a>
				</div>
			</div>
		</aside>

		<!-- 글쓰기 팝업창 : S -->
		<section class="popup-layout" id="reviewPopup">
			<div class="bg"></div>
			<div class="popup-box" style="top: 5%;">
				<h1 style="background: #d31919;">글쓰기</h1>
				
			    <div class="comment-box" style="padding-top:50px">
					<div class="assessment-box" style="display:none;">
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

					<div class="input"><input type="text" id="reviewTitle" title="제목" placeholder="제목" /></div>
					<div class="input"><textarea id="reviewDesc" title="내용을 입력하세요." placeholder="내용을 입력하세요."></textarea></div>
					
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
		<!-- 글쓰기 팝업창 : E -->
		
	</div>
	
	<script>
		
		function deleteImg(id) {
			$('#preview'+id).remove();
		}
	
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
			var reviewTitle = $("#reviewTitle").val();

			if (reviewTitle == "") {
				alert("제목을 입력하세요.");
				return;
			}

			if (listClassName == "") {
				alert("내용을 입력하세요.");
				return;
			}
			

			var reviewImg1 = reviewImg2 = reviewImg3 = reviewImg4 = reviewImg5 = reviewImg6 = reviewImg7 = reviewImg8 = reviewImg9 = '';
			
			
			$('.js-img-show').each(function(idx){
				if(idx < 9){
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
		 	 			,reviewImg2 : reviewImg2
		 	 			,reviewImg3 : reviewImg3
		 	 			,reviewImg4 : reviewImg4
		 	 			,reviewImg5 : reviewImg5
		 	 			,reviewImg6 : reviewImg6
		 	 			,reviewImg7 : reviewImg7
		 	 			,reviewImg8 : reviewImg8
		 	 			,reviewImg9 : reviewImg9
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

		var pageCurrGetList = "${pageCurr}";
		var pageUnitGetList = "${pageUnit}";
		var totalRecords = "${totalRecords}";
		var ing = false;
		
		function goToloc(id) {
			window.location='communityListDetail.htm?displayId=${displayId }&goodsId='+id;
		}
		
		function getList() {

			var displayId = "${displayId }";

			if (ing) {
				return;
			}
			
			ing = true;
			
			if ((pageCurrGetList * pageUnitGetList) >= totalRecords) {
				ing = false;
				return;
			}			
			
			pageCurrGetList++;
			
			$.ajax({
		 			data:{
		 				displayId : displayId
		 	 			,pageCurr : pageCurrGetList
		 	 			,pageUnit : pageUnitGetList
		 	 		},
				type : "POST",
				url : "/front/web/publish/mobile/product/communityGetList.htm",
				success : function(data) {

					console.log = data;
					
					var reviewList = data.data || [];
					
					console.log = reviewList;
					
					if(reviewList.length > 0 ){

	    				for(var i=0;i<reviewList.length;i++){

							var html = '';
							if (reviewList[i].IMG1_URL != "" && reviewList[i].IMG1_URL != null)
							{
								html = html 
								+  '<div class="comment-box-reply" style="padding-left: 75px;">'
								+  '<img src="'+reviewList[i].IMG1_URL+'" style="width: 60px;height: 60px;position: absolute;border: solid 1px #e6e6e6;left: 5px; onclick="goToloc('+reviewList.REVIEW_ID+');"/>'
								;
							}
							else 
							{
								html = html 
								+  '<div class="comment-box-reply">'
								;
							}

							html = html 
							+	'<a href="communityListDetail.htm?displayId=${displayId }&goodsId='+reviewList[i].REVIEW_ID+'">'
							+	'	<p class="user-id">' + reviewList[i].CUST_NICK_NM
		    				+	'		<h3>'
							;

							if (reviewList[i].DISPLAY_ID == "1"){
								html = html +  '[커뮤니티]';
							}

							if (reviewList[i].DISPLAY_ID == "2"){
								html = html +  '[맛집소개]';
							}

							if (reviewList[i].DISPLAY_ID == "3"){
								html = html +  '[정보공유]';
							}

							if (reviewList[i].DISPLAY_ID == "4"){
								html = html +  '[Q&A]';
							}

							if (reviewList[i].DISPLAY_ID == "5"){
								html = html +  '[생활정보]';
							}

							if (reviewList[i].DISPLAY_ID == "6"){
								html = html +  '[갤러리]';
							}

							if (reviewList[i].DISPLAY_ID == "7"){
								html = html +  '[건의사항 & 광고문의]';
							}

							html = html 
							+ reviewList[i].REVIEW_TITLE
							+		'</h3>'
		    				+		'<p class="date">'+reviewList[i].CREATED_DT+'</p>'
		    				+		'<p class="ico-star">'
							;
							

							if (reviewList[i].AVG_GOODS_DISPLAY_GPA == "0"){
								html = html +  '<i class="zero">별이 없음</i>';
							}

							if (reviewList[i].AVG_GOODS_DISPLAY_GPA == "1"){
								html = html +  '<i class="one">매우 안좋음</i>';
							}

							if (reviewList[i].AVG_GOODS_DISPLAY_GPA == "2"){
								html = html +  '<i class="two">안좋음</i>';
							}

							if (reviewList[i].AVG_GOODS_DISPLAY_GPA == "3"){
								html = html +  '<i class="three">보통</i>';
							}

							if (reviewList[i].AVG_GOODS_DISPLAY_GPA == "4"){
								html = html +  '<i class="four">좋음</i>';
							}

							if (reviewList[i].AVG_GOODS_DISPLAY_GPA == "5"){
								html = html +  '<i class="five">매우 좋음</i>';
							}

							html = html 
							+		'</p>'
	    					+		'</a>'
	    					+		'</div>'
							;
	    					
							$('.comment-cont').append(html);
	    				}
	    				
						
						ing = false;
		    		}					
					
				},
				error : function(xhr, status, e) {
					alert("오류가 발생하였습니다.");
					ing = false;
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
    		
    		if(res.localIds.length > 9){
    			alert('이미지는 최대 9개까지 업로드 가능합니다.');
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
	  
	if(length > 9) {
	   	alert('이미지는 9개까지 업로드 가능합니다.');
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
		        	 		shopId: '${shopId }',
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
	  		    title: '커뮤니티 - 수다방', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '커뮤니티 - 수다방', // 分享标题
	  		    desc: '커뮤니티를 위한 수다방 입니다, 자유롭게 참여하세요~', // 分享描述
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

