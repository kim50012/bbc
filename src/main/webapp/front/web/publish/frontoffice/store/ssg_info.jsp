<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout_store.css" rel="stylesheet" type="text/css" />
<link href="/css/store.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script> 

<!-- selectbox 있을경우 추가 -->
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 
	/* 게시판 검색 */ 
	$("#table-search").selectbox(); 	
	
});  
//]]>
</script> 
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store01.jsp"%>
			<div id="contents">
				<div class="page-sublocation">         
					<a href="#">主页</a><span>&gt;</span><a href="#">新世界免税店</a><span>&gt;</span><strong>新世界免税店介绍</strong>
				</div> 
				<div class="location-title visual01">
					<h3><img src="/images/shop/cn/store/h3_title01.gif" alt="company introduce" /></h3>
					<p><img src="/images/shop/cn/store/h3_comment01.gif" alt="介绍新世界免税店" /></p>
				</div> 			
				 
				<h4><img src="/images/shop/cn/store/title_ssgdf_info.gif" alt="新世界免税店简介" /></h4> 
				<div class="ssg-info">
					<p><img src="/images/shop/cn/store/img_ssg_info.gif" alt="" /></p>
					<p class="info-txt">
						新世界免税店位于海云台乐园酒店新馆，面积有7,273㎡(2,200坪），是韩国南部最大规模的世界级免税店。
						宽敞而高雅的购物空间宛如大型展台，里面有卡地亚、蒂芙尼、古驰、宝格丽、劳力士、伯爵、 I.W.C为首的100多个精品店，云集250多个著名品牌，
						可以感受世界全新潮流和购物之乐趣，并满足顾客的多种需求。
						新世界免税店不仅每月推出品牌优惠和按购买金额赠送礼品，而且为游客准备各种特别活动，使每一位顾客尽享实惠的购物。
						新世界免税店不单是购物空间，更是作为釜山引以为豪的观光明所而出名。
					</p>
					<p class="info-txt">地址 - 釜山广域市海云台区海云台海边路296</p>
					<p class="info-txt">代表电话 - 1577-0161</p>
					<p class="info-txt">营业时间 - 09:30 ~ 20:00(全年无休)</p>
					<p class="info-txt">传真 - 051-746-5201</p>
				</div><!-- end map-info -->
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



