<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>대한항공</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="lib/css/default.css" />
	<link rel="stylesheet" href="lib/css/content.css" />
	<link rel="stylesheet" href="lib/css/jquery.bxslider.css" />
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
	<script src="lib/js/jquery-1.11.3.min.js"></script>
	<script src="lib/js/default.js"></script>
	<script src="lib/js/ui.js"></script>
	<script type="text/javascript" src="lib/js/jquery.bxslider.js"></script>
	<%-- <%@ include file="/front/skin/common.jsp"%> --%>
</head>

<body>
<div id="wrap">
	<!-- s:header -->
	<div id="header">
		<a href="#" class="logo fl-l"><img src="images/common/logo.jpg" width="114" height="44" alt="logo" /></a>
		<a href="#" class="menu fl-r"><img src="images/common/btn_menu.jpg" width="40" height="44" alt="menu" /></a>
		<a href="#" class="search fl-r"><img src="images/common/btn_search.jpg" width="40" height="44" alt="search" /></a>
	</div>
	<!-- //e:header -->
	<!-- s:contentWrap -->
	<div id="contentWrap">
	<c:forEach var="item" items="${temp01 }" varStatus="status">  
		<div class="travel mt24">
			<div class="img-wrap">
			<c:if test="${item.TMPL_NO eq '12' }">
					${item.HEADER_TAG}
				</c:if>
				<c:if test ="${item.TMPL_NO != 01}">
					${item.BODY_TAG }
				</c:if>
				<c:if test="${item.FOOTER_FLG eq 'Y'}">
					${item.FOOTER_TAG}
				</c:if>	
			</div>
			</div>			
	</c:forEach>					
		 <div class="event mt24">
			<ul class="slider">
				<c:forEach var="item" items="${temp01 }" varStatus="status">
				<c:if test ="${item.TMPL_NO == 01}">  
				<li>
					<a href="#">
						<div class="img-wrap">
							<img src="${item.VAL01}" alt="event" class="max"/>
						</div>			
						<div class="txt-wrap">
							<p class="title-en">EVENT</p>
							<span class="line"></span>
							<p class="topic">预订暑期优惠</p>
							<p class="summary-en">Maison Dining</p>
						</div>
					</a>					
				</li>
				</c:if>
				</c:forEach>
			</ul>
		</div>
		<script type="text/javascript">
			$(document).ready(function(e){
				$(window).load(function(){
					//메인 배너
					$('.slider').bxSlider({
						mode: 'fade',
						speed:1000,
						auto: true,
						autoControls: false,
						controls: false
					});
				});
			});
		</script>
		<div class="notice mt24">
			<p><u>News & Notices</u><a href="#"><span class="fl-r">More</span></a></p>
			<dl class="mt20">
				<a href="#">
					<dt>中韩新航线，出行新选择 5月24日起</dt>
					<dd>2016.07.25</dd>
				</a>				
			</dl>
			<dl class="mt15">
				<a href="#">
					<dt>中韩新航线，出行新选择 5月24日起</dt>
					<dd>2016.07.25</dd>
				</a>				
			</dl>
			</dl>
		</div>
	</div>
	<!-- //e:contentWrap -->
	<!-- s:footer -->
	<div id="footer">
		<ul>
			<li>电话预订 <span>40065-88888</span></li>
			<li>营业时间 <span>07:00 ~ 21:00</span></li>
		</ul>
		<p class="mt10">Copyright 2016 &copy; KOREAN AIR . All right Reserved.</p>
	</div>
	<!-- //e:footer -->
	<!-- s:navi-->
	<div class="navi-wrap">
		<div class="navi">
			<ul>
				<li>
					<div><a href="#">HOME</a></div>
				</li>
				<li>
					<div><a href="#">DEAL &amp; OFFERS</a></div>
					<ul class="two">
						<li><a href="#">- Special Offer</a></li>
						<li><a href="#">- Promotions</a></li>
					</ul>
				</li>
				<li>
					<div><a href="#">BOOK A FLIGHT</a></div>
				</li>
				<li>
					<div><a href="#">ARTICLE</a></div>
					<ul class="two">
						<li><a href="#">- 女人喜欢的味道</a></li>
						<li><a href="#">- 免税商店 热门产品</a></li>
						<li><a href="#">- 编辑推荐</a></li>
					</ul>
				</li>
				<li>
					<div><a href="#">EVENT</a></div>
				</li>
				<li>
					<div><a href="#">KOREAN AIR</a></div>
					<ul class="two">
						<li><a href="#">- About Us</a></li>
						<li><a href="#">- SKY PASS</a></li>
						<li><a href="#">- VIP Service</a></li>
						<li><a href="#">- News & Notice</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<a href="#" class="btn-close"><img src="images/common/btn_close.png" alt="close" width="40" height="44"/></a>
	</div>
	<!-- //e:navi-->
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('.txt-wrap').each(function(){
			$(this).css({'margin-top':-($(this).height()/2)});
		});
	});
</script>

</body>
</html>
