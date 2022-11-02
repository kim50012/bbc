<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>主页</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">

</style>
<script type="text/javascript">
function doSearch(title,flag){
	if(flag=='class'){
		location.href='/front/main/list.htm?shopGradeClassId='+title;
	}else if(flag=='brand'){
		location.href='/front/main/list.htm?brandId='+title;
	}else{
		location.href='/front/main/list.htm';
	}
}

//-- Common Page usage Counting
counter({
	 pageTp : 1,				//SHOP_MAIN
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});
</script>
</head>
<body>

<header class="headerSkin1">
	<div class="searchSkin1">
<!-- 		<div class="title"> -->
<%-- 			<input id="title" type="text" value="${goodsName }"/>	 --%>
<!-- 		</div> -->
		<div class="navBtn1"></div>
		<div class="navSearch" onClick="window.location='/front/main/list.htm';"></div>
		<div class="listCart" onClick="window.location='/front/cart/cart.htm';"></div>
	</div>
</header>
	

	<div id="container" style="margin-top: 0px;">
	

		<section class="visualBnr" style="display:none;">
			<div class="sliderList" data-slider="1">
				<ul>
<%-- 					<c:forEach var="bannerList" items="${bannerList}" varStatus="status">   --%>
<%-- 						${bannerList.TAG } --%>
<%-- 					 </c:forEach> --%>
				</ul>
			</div>
			<div class="sliderpage"></div>
		</section>	
	
	    <section id="contents">
			<c:forEach var="item" items="${temp01 }" varStatus="status">  
				<c:if test="${item.HEADER_FLG eq 'Y' }">
					${item.HEADER_TAG}
				</c:if>
				
					${item.BODY_TAG }    
				
				<c:if test="${item.FOOTER_FLG eq 'Y'}">
					${item.FOOTER_TAG}
				</c:if>			
			</c:forEach>			
		</section>
	</div>
	<!-- container end-->
	
	<!-- Quick link -->
	<nav class="headerQuickLink">
		<div class="shop_class">
			<div class="inner">
				<h2>商品分类</h2>
				<ul>
					<c:forEach  var="item" items="${classList }" varStatus="status">
						<li onclick="doSearch('${item.SGC_ID }','class')">${item.SGC_NM }</li>
					</c:forEach>
				</ul>
				<h2>品牌</h2>
				<ul>
					<c:forEach  var="item" items="${brandList }" varStatus="status">
						<li onclick="doSearch('${item.BRAND_ID }','brand')">${item.BRAND_NM }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div style="height: 150px;"></div>
	</nav>
	
	<!-- //container -->
	<div class="bottom_fixed length2">
		<a href="/front/customer/myPage.htm">
<!-- 			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image"> -->
			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image">
		</a>
<!-- 		<a href="/front/customer/myPage.htm"> -->
<!-- 			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image"> -->
<!-- 		</a> -->
	</div>
	<a href="#" class="bottom_totop">top</a>
	
</body>
</html>
