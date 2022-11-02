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
				<h2 style="position: absolute;text-align: center;width: 80%;margin-left:10%;margin-right:10%;font-size: 19px;font-weight: normal;overflow: hidden;height: 30px;">상품 리뷰</h2>
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
			

		    <div class="product-tap" style="margin-top: 5px;">
		    	<ul>
			    	<!-- 첫번째 탭  : S -->
		    		<li class="tap01 on">

			    		<a href="#" style="text-align:left;padding-left:10px;">최신 상품 리뷰</a>
				    	<div class="tap-detail">
				    		<div class="comment-title">
				    			총 <strong>${totalRecords }개</strong>의 리뷰가 있습니다.
				    		</div>
				    		<div class="comment-cont">
				    		

								<c:forEach var="reviewList" items="${reviewList}" varStatus="status">				    		
				    		
				    			<!-- 글 하나 : S -->
		    					<div class="comment-box-reply" style="padding-top:20px; padding-bottom:20px; padding-left: 105px;">
						            <c:if test="${reviewList.GOODS_LIST_IMG_URL != null}">
							            <img src="${reviewList.GOODS_LIST_IMG_URL }" style="width: 90px;height: 90px;position: absolute;border: solid 1px #e6e6e6;left: 5px;" onclick="window.location='/front/web/publish/mobile/product/productview.htm?displayId=${reviewList.DISPLAY_ID }';"/>
						            </c:if>
		    						<a href="/front/web/publish/mobile/product/productview.htm?displayId=${reviewList.DISPLAY_ID }">
			    						<p class="user-id">${reviewList.CUST_NICK_NM }<p>
			    						<p class="date"><span>${reviewList.CREATED_DT }</span></p>
			    						<h3>[상품] ${reviewList.DESC_TITLE } <font color="red"></font></h3>
			    						<p class="user-id" style="color:#888888;">${reviewList.REVIEW_TITLE }</p>
			    						<p class="user-id" style="color:#888888;">${reviewList.REVIEW_DESC }</p>
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

							            <c:if test="${reviewList.IMG1_URL != null}">
								            <img src="${reviewList.IMG1_URL }" style="width: 70%;border: solid 1px #e6e6e6;left: 5px;"/>
							            </c:if>
		    						</a>
		    					</div>
				    			<!-- 글 하나 : E -->
				    			
				    			</c:forEach>
				    			
				    			
				    		</div>
				    		
				    		<br>
				    		<br>
				    		<br>
				            <c:if test="${totalRecords > 10}">	
					    		<div class="btn-group">
					    			<a onclick="getList();" class="btn-block"><span>리뷰 더보기</span></a>
					    		</div>
				            </c:if>
				    	</div>				    	
		    		</li>
			    	<!-- 첫번째 탭  : E -->
			    	
		    	</ul>
		    </div>
		    <!-- 제품 상세 탭 4개 : E -->
			
		<a href="#" id="btn-top">top button</a>
		<!--  하단메뉴 : E -->
		<br>
		<br>
		<br>
		<br>
		
        <%@ include file="/front/web/publish/mobile/common/menu_bottom.jsp"%>
		<%@ include file="/front/web/publish/mobile/common/footer.jsp"%> 
		
		
	</div>
	
	<script>

		var pageCurrGetList = "${pageCurr}";
		var pageUnitGetList = "${pageUnit}";
		var totalRecords = "${totalRecords}";
		var ing = false;
	
		function getList() {

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
		 				pageCurr : pageCurrGetList
		 	 			,pageUnit : pageUnitGetList
		 	 		},
				type : "POST",
				url : "/front/web/publish/mobile/product/reviewGetList.htm",
				success : function(data) {

					console.log = data;
					
					var reviewList = data.data || [];
					
					console.log = reviewList;
					
					if(reviewList.length > 0 ){

	    				for(var i=0;i<reviewList.length;i++){

						var html = '';
							html = html 
							+  '<div class="comment-box-reply" style="padding-left: 105px;">'
							+  '<img src="'+reviewList[i].GOODS_LIST_IMG_URL+'" style="width: 90px;height: 90px;position: absolute;border: solid 1px #e6e6e6;left: 5px; onclick="goToloc('+reviewList.DISPLAY_ID+');"/>'
							;

							html = html 
							+	'<a href="/front/web/publish/mobile/product/productview.htm?displayId='+reviewList.DISPLAY_ID+'">'
							+	'	<p class="user-id">' + reviewList[i].CUST_NICK_NM + '<p>'
		    				+		'<p class="date"><span>'+reviewList[i].CREATED_DT+'</span></p>'
		    				+	'		<h3>[상품]'+ reviewList[i].DESC_TITLE + '</h3>'
		    				+	'	<p class="user-id" style="color:#888888;">' + reviewList[i].REVIEW_TITLE + '<p>'
		    				+	'	<p class="user-id" style="color:#888888;">' + reviewList[i].REVIEW_DESC + '<p>'
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

							if (reviewList[i].IMG1_URL != null){
								html = html +  ' <img src="'+reviewList[i].IMG1_URL+'" style="width: 70%;border: solid 1px #e6e6e6;left: 5px;"/>';
							}
							
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
	  		    title: '최신 상품 리뷰', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		    },
	  		    cancel: function () { 
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '최신 상품 리뷰', // 分享标题
	  		    desc: '상품에 대한 사용자 리뷰 페이지 입니다.', // 分享描述
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

