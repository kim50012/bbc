<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/front/skin/common.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>品牌故事</title>
<script type="text/javascript" src="/front/js/rotate3di.js"></script>
<script type="text/javascript">
//-- Common Page usage Counting
counter({
	 pageTp : 18,				//SHOP_INTRO
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});
</script>
</head>

<c:forEach var="item" items="${temp01 }" varStatus="status">  
	
		${item.BODY_TAG }    
				
</c:forEach>		
	<!-- container end-->
	
	
</html>