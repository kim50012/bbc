<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>主页</title>
<%@ include file="/front/skin/common.jsp"%>
<script type="text/javascript" src="/front/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="/front/js/slick.js"></script><!-- 左右滑动插件 -->
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/slick.css" />
<style type="text/css">
	.image img{
		width:100%;
	}
/*2016 11 25 add*/
.slick-slider{margin-bottom:0px;}
#container,#contents,.slick-slider,.slick-list,.slick-track,.image,.image img{height:100%;}

</style>
<script type="text/javascript">
//-- Common Page usage Counting
counter({
	 pageTp : 16,				//PROMOTION_RESULTVIEW
	 pageId : '${webzinePageId }' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

function doSearch(title,flag){
	alert("微杂志预览页面：doSearch方法");
	if(flag=='class'){
		location.href='/front/main/list.htm?shopGradeClassId='+title;
	}else if(flag=='brand'){
		location.href='/front/main/list.htm?brandId='+title;
	}else{
		location.href='/front/main/list.htm';
	}
}

</script>

<script type="text/javascript">
	//左右滑动
	$(document).ready(function() { 
	    $('.fade').slick({
	    	dots: true
	    });
	    $('.slick-prev.slick-arrow').hide();
	    $('.slick-next.slick-arrow').hide();
	}); 
</script>
</head>
<body>

	<div id="container" class="top">
	    <section id="contents">
			<%-- <c:forEach var="item" items="${webzineMap }" varStatus="status">  
				<c:if test="${item.HEADER_FLG eq 'Y' }">
					${item.HEADER_TAG}
				</c:if>
				
					${item.BODY_TAG }    
				
				<c:if test="${item.FOOTER_FLG eq 'Y'}">
					${item.FOOTER_TAG}
				</c:if>			
			</c:forEach>	 --%>
				
			<div class="slider fade"> 
				<c:forEach items="${list }" var="list" varStatus="status">
					<div><div class="image"><img src="${list.VAL01 }"/></div></div>
				</c:forEach>
				<!-- <div><div class="image"><img src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_28_32173.jpg"/></div></div> 
				<div><div class="image"><img src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_10075.jpg"/></div></div> 
				<div><div class="image"><img src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_54448.jpg"/></div></div> 
				<div><div class="image"><img src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_63290.jpg"/></div></div> 
				<div><div class="image"><img src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_23431.jpg"/></div></div> 
				<div><div class="image"><img src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_79528.jpg"/></div></div>  -->
			</div>			
			<!-- HEADER "51" -->
			<!-- <div class="webzineArea">
				<div class="sliderList" data-slider="1">
					<ul>
						<li><img class="image" src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_28_32173.jpg" alt="" /></li>
						<li><img class="image" src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_10075.jpg" alt="" /></li>
						<li><img class="image" src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_54448.jpg" alt="" /></li>
						<li><img class="image" src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_63290.jpg" alt="" /></li>
						<li><img class="image" src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_23431.jpg" alt="" /></li>
						<li><img class="image" src="/uploads/16/2015/06/03/16_shop_2015_06_03_17_02_29_79528.jpg" alt="" /></li>
					</ul>
				</div>
				<div class="arrow"><img src="/images/webzine/arrow.png" /></div>
			</div> -->
		</section>
	</div>
	<!-- container end-->
	
	
</body>
</html>
