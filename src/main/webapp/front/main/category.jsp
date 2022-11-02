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
	 pageId : pageId || '',
	 goodsId : goodsId || '',
	 displayId : displayId || '',
});
</script>
</head>
<body>

<header class="headerMain">
	<div class="searchPmd">
		<div class="title">
			<input id="title" type="text"/>	
		</div>
		<div class="btnSearch" onClick="doSearch();"></div>
	</div>
</header>


<nav class="headerCategory">
	<div class="shop_class">
		<div class="inner">
					<ul>
			<c:forEach  var="item" items="${classList }" varStatus="status">
				<c:if test="${item.LVL_GC eq 1 }">
					</ul>
					<h2>${item.SGC_NM_GC }</h2>
					<ul>
				</c:if>
				
				<c:if test="${item.LVL_GC eq 2 }">
						<li onclick="doSearch('${item.SGC_ID_GC }','class')">${item.SGC_NM_GC }</li>
				</c:if>
			</c:forEach>
					</ul>
		</div>
	</div>
	<div style="height: 150px;"></div>
</nav>


<%@ include file="/front/skin/common_bottom.jsp"%>
</body>
</html>
