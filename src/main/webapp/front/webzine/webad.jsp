<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/front/skin/common.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>商品名称 -> 公告页面</title>
<style type="text/css">

</style>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 17,				//PROMOTION_RESULTVIEW
	 pageId : '${pageId }' || '',
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
function loadFunction(){
	var positionType=$("#positionType").val();
	if(positionType=='BOTTOM'){
		$(".bgPng").attr("style","bottom:0px;");
	}else if(positionType=='TOP'){
		$(".bgPng").attr("style","top:0px;");
	}
}
</script>
<style>

	.webzineArea {position:relative;  padding-top:0 !important;min-height:100%; width:100%;height:100%;}
	.webzineArea h2 {display:none;}
	.webzineArea .sliderList {position:relative; height:100%; overflow:hidden;}
	.webzineArea .sliderList ul {position:relative; height:100%; width:100% !important; background:#fff;}
	.webzineArea .sliderList div {background-color:#f9292b;width:100%;height:100%;}
	.webzineArea .sliderList div .imgMerry {display:none;position:absolute;z-index:98;width:55%;height:auto;top:12%;left:10%;}
	.webzineArea .sliderList div .imgLogo {position:absolute;z-index:94;width:75%;height:auto;top:22%;left:15%;}
	.webzineArea .sliderList div .imgHappy {display:none;position:absolute;z-index:97;width:50%;height:auto;top:65%;left:40%;}
	.webzineArea .sliderList li {position:absolute;height:100%;}
	.webzineArea .sliderList li:first-child {position:relative !important;}
	.webzineArea .sliderList li a {display:block;}
	.webzineArea .sliderpage {position:absolute; display:none; bottom:10px; width:100%; text-align:center;}

	.arrow {position:absolute; top:90%; left:90%; width:10%;height:auto;}
	.arrow img {position:absolute; width:30%;height:auto;}
	.bgPng {position:absolute;width:100%;height:150px;}

</style>
</head>
<body onload="loadFunction();">

	<div id="container" class="top">
	    <section id="contents">
			<c:forEach var="item" items="${webzineMap }" varStatus="status"> 
				<input type="hidden" value="${item.VAL03 }" id="positionType"/>
				${item.BODY_TAG }   
				<%-- <c:if test="${item.HEADER_FLG eq 'Y' }">
					${item.HEADER_TAG}
				</c:if>
				
					${item.BODY_TAG } 
				
				<c:if test="${item.FOOTER_FLG eq 'Y'}">
					${item.FOOTER_TAG}
				</c:if>	 --%>		
			</c:forEach>			
		</section>
	</div>
	<!-- container end-->
	
	
</body>
</html>
