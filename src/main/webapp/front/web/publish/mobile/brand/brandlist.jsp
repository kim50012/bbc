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
		<section id="container">
			<div class="location">
				<a href="javascript:history.back();" class="arrow"><i>back page</i></a>
				<h2>가맹점 목록</h2>
<!-- 				<a href="#" class="btn-means box-v" data="item-box-v"><i>back page</i></a> -->
<!-- 				<a href="#" class="btn-means " data="item-box" ><i>back page</i></a> -->
			</div>
			
			<!-- 첫번째 내용 : S -->
			<div class="event-box">

				<c:forEach var="brandList" items="${brandList}" varStatus="status">

					<article class="box" style="min-height:120px;">
						<a href="/front/web/publish/mobile/brand/brand.htm?brandId=${brandList.BRAND_ID}">
							<img src="${brandList.BRAND_IMG}" alt="" />
							<div class="text-box">
								<p class="left">${brandList.BRAND_NM}</p>
								<p class="right">전체 상품 보러 가기</p>
							</div>
						</a>
					</article>
				
				</c:forEach>
				
			</div>
			<!-- 첫번째 내용 : E -->
		</section>

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
	   		    						+	'			<span class="type01">NEW</span>'
	   		    						+	'			<span class="type04">EVT</span>'
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
	   		    						+	'				<a href="#" class="btn-liked on">liked</a>'
	   		    						+	'				<a href="#" class="btn-shopping">shopping</a>'
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
	  		    title: '${brandOne.BRAND_NM } - 가맹점 목록 페이지 입니다.', // 分享标题
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
	  		    desc: '가맹점 목록 페이지 입니다.', // 分享描述
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

