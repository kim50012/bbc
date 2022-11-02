<%@ include file="/front/skin/common.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${userDefinePageData.get(0).PAGE_NM }</title>
<style type="text/css">

</style>
<script type="text/javascript"> 

//-- Common Page usage Counting
counter({
	 pageTp : 82,				
	 pageId : '${pageId}' || '',
	 goodsId : '' || '',
	 displayId : '' || ''
});

</script>
</head>
<body>

	<div id="container" class="top">
	    <section id="contents">
			<c:forEach var="item" items="${userDefinePageData }" varStatus="status">  
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
	
	<!-- //container -->
	<a href="#" class="bottom_totop">top</a>
	
</body>
</html>
