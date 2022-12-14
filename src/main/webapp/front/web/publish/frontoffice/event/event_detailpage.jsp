<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/base_cn.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<link href="/css/event.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/event_common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>

</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation submainloc-line">  
				<p class="title"><img src="/images/shop/cn/common/title_event.gif" alt="???????????????????????? ??????" /></p>
				<a href="#">??????</a><span>&gt;</span><a href="#">??????</a><span>&gt;</span><strong>?????????</strong>
			</div>
			<div class="event">
				<div class="selecting search-type-top">
					<form action="#">
					<fieldset>
						<legend>????????? ?????? ??????</legend>
						<dl class="total">
							<dt>???????????? <span>&gt;</span></dt>
							<dd>
								<select class="event-all">
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
									<option>?????????????????????</option>
								</select>
							</dd>
						</dl>
					</fieldset>
					</form>
				</div><!-- end plan-search -->
				<div class="detail-box">
					html ??????
				</div>
				<p class="elist-title">??????????????????</p>
				<div class="list-basic listing" id="basic">
					<ul class="list">
						<li>
							<div class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="sale" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="best" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="new" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="??????" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="?????????" />
								</p>
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/temp_image.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="??????" /></span>
								</p>
								<p class="brand"><a href="#">??????/LANCOME ??????/LANCOME??????/LANCO</a></p>
								<p class="product-name">
									<a href="#">
										?????? ????????????????????? ???????????????
										?????? ????????????????????? ???????????????
										(??????????????????????????????)
									</a>
								</p>
								<p class="price">
									<span class="origin">$89</span>
									<span class="us-currency">$2,999</span>
									<span class="nation-currency">(??? ???10,075)</span>
								</p>
								<ul class="link-menu">
									<li class="menu01 on"><a href="#">?????? ??????</a></li>
									<li class="menu02"><a href="#">?????? ??????</a></li>
									<li class="menu03"><a href="#">?????????</a></li>
									<li class="menu04"><a href="#">?????? ??????</a></li>
								</ul>
							</div><!-- end info -->
						</li>
					</ul>
				</div><!-- end list-basic -->
				<div class="event-more">	
					<!-- ????????? -->
					<p><a href="#"><img src="/images/shop/cn/event/btn_event01.gif" alt="????????????" /></a></p>
					<!-- ???????????? -->
					<p><a href="#"><img src="/images/shop/cn/event/btn_event02.gif" alt="???????????? " /></a></p>
				</div>
			</div><!-- end event -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>