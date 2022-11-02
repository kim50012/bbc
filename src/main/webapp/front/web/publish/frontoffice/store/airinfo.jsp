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
			<%@include file="/publish/frontoffice/include/sidebar_store05.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">使用指南</a><span>&gt;</span><strong>取货处位置介绍</strong>
				</div>  
				<div class="location-title visual05">
					<h3><img src="/images/shop/cn/store/h3_title05.gif" alt="information" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！我们将为顾客的购物方便尽最大的努力。" /></p>
				</div>
				<h4><img src="/images/shop/cn/store/title_airinfo.gif" alt="取货处指南" /></h4> 
				
				<div class="airlist">
					<ul class="airlist-con" id="airlist-con">
						<li><p class="title"><img src="/images/shop/cn/store/stitle_incheon_west.gif" alt="仁川国际机场西边取货处" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_west.gif" alt="仁川国际机场西边取货处" /></div> 
								<div class="map-info">
									<p class="title">仁川国际机场西边取货处</p>
									<p class="txt"><span>位置</span>: 通过3号出境审查台，乘咨询台前方的扶梯上楼后，</p>
									<p class="txt02">位于韩亚航空贵宾休息室前面。</p>
									<p class="tel"><span>联系方式</span>: 032-743-2709</p>
								</div>   
							</div>
						</li>
						<li><p class="title"><img src="/images/shop/cn/store/stitle_incheon_east.gif" alt="仁川国际机场东边取货处" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_east.gif" alt="仁川国际机场东边取货处" /></div>
								<div class="map-info">
									<p class="title">仁川国际机场东边取货处</p>
									<p class="txt"><span>位置</span>: 位于航站楼2号出国审查台楼上（4楼），</p>
									<p class="txt02">大韩航空贵宾休息室对面</p>
									<p class="tel"><span>联系方式</span>: 032-743-2674</p>
								</div> 
							</div>
						</li> 
						<li><p class="title"><img src="/images/shop/cn/store/stitle_incheon_boarding.gif" alt="仁川国际机场登机楼" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_boarding.gif" alt="仁川国际机场登机楼" /></div>
								<div class="map-info">
									<p class="title">仁川国际机场登机楼</p>
									<p class="txt"><span>位置</span>: 从机场快轨下车后乘扶梯上楼，</p>
									<p class="txt02">位于121号登机口前面。</p>
									<p class="tel"><span>联系方式</span>: 032-743-2757</p>
								</div>  
							</div>
						</li> 
						<li><p class="title"><img src="/images/shop/cn/store/stitle_gimpo.gif" alt="金浦国际机场" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_gimpo.gif" alt="金浦国际机场" /></div>
								<div class="map-info">
									<p class="title">金浦国际机场</p>
									<p class="txt"><span>位置</span>: 通过机场3楼出国审查台后，</p>
									<p class="txt02">位于36号登机口前面。</p> 
									<p class="tel"><span>联系方式</span>: 02-2666-5285</p>
								</div> 
							</div>
						</li>
						<li><p class="title"><img src="/images/shop/cn/store/stitle_daegu.gif" alt="大邱国际机场" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_daegu.gif" alt="大邱国际机场" /></div>
								<div class="map-info map-tow">
									<p class="title">大邱国际机场</p>
									<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于左侧。</p> 
									<p class="tel"><span>联系方式</span>: 053-981-8277</p>
								</div> 
							</div>
						</li>
						<li><p class="title"><img src="/images/shop/cn/store/stitle_gimhae.gif" alt="金海国际机场" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_gimhae.gif" alt="金海国际机场" /></div>
								<div class="map-info map-tow">
									<p class="title">金海国际机场</p>
									<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于右侧。</p>
									<p class="tel"><span>联系方式</span>: 051-971-5901</p>
								</div> 
							</div>
						</li>
						<li><p class="title"><img src="/images/shop/cn/store/stitle_busan.gif" alt="釜山港" /></p>
							<div class="conbox">
								<div class="map"><img src="/images/shop/cn/product/detail/img_busan.gif" alt="釜山港" /></div>
								<div class="map-info map-tow">
									<p class="title">釜山港</p>
									<p class="txt"><span>位置</span>: 通过码头2楼出国审查台后，位于右侧。</p> 
									<p class="tel"><span>联系方式</span>: 051-465-0181</p>
								</div> 
							</div>
						</li>
					</ul>
				</div>
				 
				
				
			</div><!-- end contents -->
		</div><!-- end body --> 
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



