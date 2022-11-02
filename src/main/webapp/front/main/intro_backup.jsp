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
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 18,				//SHOP_INTRO
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

function doSearch(title,flag){
	if(flag=='class'){
		location.href='/front/main/list.htm?shopGradeClassId='+title;
	}else if(flag=='brand'){
		location.href='/front/main/list.htm?brandId='+title;
	}else{
		location.href='/front/main/list.htm';
	}
}
</script>

</head>
<body>

	<div id="container" style="margin-top: 0px; padding-top: 0px;">
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
	


<div class="bottomNavmenu">
	<nav>
		<div id="bottomNavmenu_ul" class="nav_4">
			<ul class="box">
				<li>
					<a href="javascript:;" class=""><span>关于我们</span></a>
					<dl>
						<dd><a href="http://www.hanzhimeng.com/pulmuone/newyear/index.html"><span>乐活</span></a></dd>
						<dd><a href="/front/main/main.htm"><span>店铺</span></a></dd>
					</dl>
				</li>
				<li>
					<a href="javascript:;" class=""><span>促销</span></a>
					<dl>
						<dd><a href="/front/promotion/promotionList.htm"><span>促销</span></a></dd>
						<dd><a href="/front/promotion/promotionResultList.htm"><span>发表中奖者</span></a></dd>
					</dl>
				</li>
				<li>
					<a href="javascript:;" class=""><span>生活信息</span></a>
					<dl>
						<dd><a href="/front/blog/blogList.htm?blogGroupId=10004"><span>料理室</span></a></dd>
						<dd><a href="/front/blog/blogList.htm?blogGroupId=10005"><span>生活手册</span></a></dd>
					</dl>
				</li>
			</ul>
		</div>
	</nav>
	<div id="bottomNavmenu_masklayer" class="masklayer_div on">&nbsp;</div>
</div>
<script type="text/javascript">
	bottomNavmenu.bindClick(document.getElementById("bottomNavmenu_ul").querySelectorAll("li>a"), document.getElementById("bottomNavmenu_masklayer"));
</script>		
	
</body>
</html>
