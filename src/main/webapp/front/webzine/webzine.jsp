<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	 pageTp : 16,				//PROMOTION_RESULTVIEW
	 pageId : '${webzinePageId }' || '',
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

	<div id="container" class="top">
	    <section id="contents">
			<c:forEach var="item" items="${webzineMap }" varStatus="status">  
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
	
	
</body>
</html>
