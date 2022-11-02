<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/patternsearch.css" rel="stylesheet" type="text/css" />
<link href="/css/category.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.slider.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/category_main.js"></script>
<script type="text/javascript" src="/js/jquery/category.js"></script>
<script type="text/javascript" src="/js/jquery/pattern_search.js"></script>
<!-- <script type="text/javascript" src="/js/jquery/productlist.js"></script> -->
<script type="text/javascript">
jQuery(function($){
	$(".view-select").selectbox();
	$(".depth-select").selectbox();
});
</script>
</head>
<body >
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="depth-title">
				<p class="category-title"><img src="/images/shop/cn/category/category01.gif" alt="화장품" /></p>
				<!-- 0811 <div class="page-location">~</div>로 변경-->
				<div class="page-location">
					<ul>
						<li>首页</li>
						<li>
							<select class="depth-select">
								<option>111111111111</option>
							</select>
						</li>
					</ul>
				</div><!-- end page-location -->
			</div><!-- end  depth-title -->
			<div  class="category">
				<div class="top-banner">
					<div class="banner">
						<div class="view-con">
							<span class="play"><img src="//image.ssgdfs.com/images/shop/plan/btn_play.gif" alt="play" /></span>
							<span class="stop"><img src="//image.ssgdfs.com/images/shop/plan/btn_stop.gif" alt="stop" /></span>
						</div><!-- end view-con -->
						<div class="banner-menu menu-type05">
							<ul>
								<li class="selected"><a href="#banner01">绿茶精萃保湿卸妆油</a></li>
								<li><a href="#banner02">绿茶精萃保湿卸妆油</a></li>
								<li><a href="#banner03">绿茶精萃保湿卸妆油</a></li>
								<li><a href="#banner04">绿茶精萃保湿卸妆油</a></li>
								<li><a href="#banner05">绿茶精萃保湿卸妆油</a></li>
							</ul>
						</div><!-- end plan-menu menu-type05 -->
						<div class="banner-list">
							<ul>
								<li id="banner01">
									<a href="#brand-pattern01"><img src="/images/shop/cn/category/temp01.gif" alt="绿茶精萃保湿卸妆油" /></a>
								</li>
								<li id="banner02">
									<a href="#brand-pattern02"><img src="/images/shop/cn/category/temp01.gif" alt="绿茶精萃保湿卸妆油" /></a>
								</li>
								<li id="banner03">
									<a href="#"><img src="/images/shop/cn/category/temp01.gif" alt="绿茶精萃保湿卸妆油" /></a>
								</li>
								<li id="banner04">
									<a href="#"><img src="/images/shop/cn/category/temp01.gif" alt="绿茶精萃保湿卸妆油" /></a>>
								</li>
								<li id="banner05">
									<a href="#"><img src="/images/shop/cn/category/temp01.gif" alt="绿茶精萃保湿卸妆油" /></a>>
								</li>
							</ul>
						</div><!-- end banner-list -->
					</div><!-- end banner -->
					<div class="best-banner">
						<ul>
							<li class="selected">
								<p class="title">BANNER TITLE</p>
								<p class="banner"><a href="#"><img src="/images/shop/cn/category/banner_sample01.gif" alt="BANNER-NAME" /></a></p>
							</li>
							<li>
								<p class="title">BANNER TITLE</p>
								<p class="banner"><a href="#"><img src="/images/shop/cn/category/banner_sample01.gif" alt="BANNER-NAME" /></a></p>
							</li>
							<li>
								<p class="title">BANNER TITLE</p>
								<p class="banner"><a href="#"><img src="/images/shop/cn/category/banner_sample01.gif" alt="BANNER-NAME" /></a></p>
							</li>
							<li>
								<p class="title">BANNER TITLE</p>
								<p class="banner"><a href="#"><img src="/images/shop/cn/category/banner_sample01.gif" alt="BANNER-NAME" /></a></p>
							</li>
						</ul>
					</div><!-- end  best-banner -->
				</div><!-- end top-banner -->
				<div class="best-product">
						<div class="best-wrap">
							<div class="best-navi">
									<p><img src="/images/shop/cn/category/title_best.gif" alt="BEST品牌" /></p>
									<ul>
										<li class="selected">
											<a href="#brand-pattern01"><img src="/images/shop/cn/category/temp_brand01.gif" alt="SKIN" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#brand-pattern02"><img src="/images/shop/cn/category/temp_brand01.gif" alt="HERA" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#"><img src="/images/shop/cn/category/temp_brand01.gif" alt="OHUI" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#"><img src="/images/shop/cn/category/temp_brand01.gif" alt="BELIF" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#"><img src="/images/shop/cn/category/temp_brand01.gif" alt="SUM" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#"><img src="/images/shop/cn/category/temp_brand01.gif" alt="LEE" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#"><img src="/images/shop/cn/category/temp_brand01.gif" alt="SULWHASOO" /></a>
											<p><span class="on"></span></p>
										</li>
										<li>
											<a href="#"><img src="/images/shop/cn/category/temp_brand01.gif" alt="AMOREPACIFIC" /></a>
											<p><span class="on"></span></p>
										</li>
									</ul>
							</div><!-- end best-navi -->
							<div class="list-basic listing-best">
								<ul class="single" id="brand-pattern01">
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
								</ul>
								<ul class="single" id="brand-pattern02">
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
								</ul>
							</div><!-- end list-basic -->
						</div><!-- end best-wrap -->
				</div><!-- end best-product -->
				<div class="nation-product">
					<dl>
						<dt><img src="/images/shop/cn/category/korea_product.gif" alt="韩国 商品专区 korea product mall" /></dt>
						<dd>
							<div class="list-basic listing-best">
								<ul class="single">
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
									<li>
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<div class="photo">
											<a href="#" title="ULTRA FACIAL 125ML">
												<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
											</a>
											<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
											<ul class="link-menu">
												<li class="menu01 on"><a href="#">商品比较</a></li>
												<li class="menu02"><a href="#">关注商品</a></li>
												<li class="menu03"><a href="#">购物车</a></li>
												<li class="menu04"><a href="#">立即购买</a></li>
											</ul>
										</div><!-- end photo -->
										<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
										<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
										<p class="price">
											<span class="us-currency">$ 2,999</span>
											<span class="nation-currency">(约 ￥10,075)</span>
										</p>
									</li>
								</ul>
							</div><!-- end list-basic -->
						</dd>
					</dl>
				</div><!-- end nation-product -->
				<div class="brand-best">
					<div class="tab-menu">
						<ul class="cate-tab">
							<li class="on"><a href="#cate-tab01">BEST SELLER</a></li>
							<li><a href="#cate-tab02">BRAND NEW</a></li>
						</ul>
						<ul class="sort-menu">
							<li ><a href="#">儿童</a></li>
							<li><a href="#">男士</a></li>
							<li><a href="#"> 头部护理</a></li>
							<li><a href="#">身体护理</a></li>
							<li><a href="#">洁面/防晒 </a></li>
							<li><a href="#">彩妆</a></li>
							<li><a href="#">基础护理</a></li>
							<li class="on"><a href="#">全部</a></li>
						</ul>
					</div><!-- end sort-menu -->
					<div class="list-basic">
							<ul id="cate-tab01" class="single">
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
							</ul>
							<ul id="cate-tab01" class="single">
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
								<li>
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<div class="photo">
										<a href="#" title="ULTRA FACIAL 125ML">
											<img src="/images/shop/cn/product/list/temp_image.gif" alt="商品" />
										</a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">商品比较</a></li>
											<li class="menu02"><a href="#">关注商品</a></li>
											<li class="menu03"><a href="#">购物车</a></li>
											<li class="menu04"><a href="#">立即购买</a></li>
										</ul>
									</div><!-- end photo -->
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
								</li>
							</ul>
						</div><!-- end list-basic -->
				</div><!-- end brand-best -->
				<div class="depth-menu">
					<dl>
						<dt><img src="/images/shop/cn/category/categoryS01.png"  alt="化妆品" /></dt>
						<dd>
							<ul class="first-child">
								<li class="on"><a href="#sub-depth01">全部</a></li>
								<li><a href="#">基础护理 </a></li>
								<li><a href="#">彩妆</a></li>
								<li><a href="#">洁面/防晒</a></li>
								<li><a href="#">身体护理</a></li>
								<li><a href="#">头部护理</a></li>
								<li><a href="#">男士</a></li>
								<li><a href="#">儿童</a></li>
							</ul>
								<ul class="sub-depth">
								<li>
									<ul id="sub-depth01">
										<li class="on"><a href="#">全部</a></li>
										<li><a href="#">化妆水</a></li>
										<li><a href="#">乳液</a></li>
										<li><a href="#">精华</a></li>
										<li><a href="#">面霜</a></li>
										<li><a href="#">眼部护理</a></li>
										<li><a href="#">唇部护理</a></li>
										<li><a href="#"> 弹力</a></li>
										<li><a href="#">美白</a></li>
										<li><a href="#">面膜/面贴膜</a></li>
										<li><a href="#">免税专用 </a></li>
										<li><a href="#">护肤套装</a></li>
									</ul>
								</li>
							</ul>
						</dd>
					</dl>
				</div><!-- end depth-menu -->
				<div class="pattern-search">
					<table>
						<caption>조건/상세 검색</caption>
						<colgroup>
							<col width="100px" />
							<col width="700px" />
							<col width="200px" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="colgroup" colspan="2" class="title">
									<p class="title">条件搜索</p>
									<p class="btn"><span><img src="/images/shop/cn/category/btn_search_detail.gif" alt="简便搜索/详细搜索" /></span></p>
								</th>
								<!-- 0810 rowspan="4"로 변경-->
								<td rowspan="5" class="range-search">
									<div class="range-price price-hori">
										<div class="distribution">
											<ul>
												<li class="on"><span style="width: 20%; height: 1%;"></span></li>
												<li class="on"><span style="width: 30%; height: 1%;"></span></li>
												<li class="on"><span style="width: 40%; height: 1%;"></span></li>
												<li class="on"><span style="width: 50%; height: 1%;"></span></li>
												<li class="on"><span style="width: 100%; height: 1%;"></span></li>
												<li class="on"><span style="width: 50%; height: 1%;"></span></li>
												<li class="on"><span style="width: 20%; height: 1%;"></span></li>
												<li class="on"><span style="width: 10%; height: 1%;"></span></li>
												<li class="on"><span style="width: 25%; height: 1%;"></span></li>
												<li class="on"><span style="width: 30%; height: 1%;"></span></li>
											</ul> 	
										</div><!-- end distribution  -->
										<div class="price-slider">
										</div><!-- end price-slider -->
										<div class="input-area">
											<input type="text" class="min" /> ~
											<input type="text" class="max" />
										</div><!-- end input-area -->
									</div><!-- end range-search -->
								</td>
							</tr>
							<tr>
								<th scope="row">选择品牌</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="brand01" />
											<label for="brand01">ANNA</label>
										</li>
										<!-- <li>
											<input type="checkbox" id="brand02" />
											<label for="brand03"></label>
										</li>
										<li>
											<input type="checkbox" id="brand03" />
											<label for="brand30"></label>
										</li> -->
									</ul>
								</td>
							</tr>
							<tr class="option">
								<th scope="row">性别</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="sex01" />
											<label for="sex01">女士</label>
										</li>
										<li>
											<input type="checkbox" id="sex02" />
											<label for="sex02">男士</label>
										</li>
										<li>
											<input type="checkbox" id="sex03" />
											<label for="sex03">共用</label>
										</li>
										<!-- 0810 유아 삭제 -->
									</ul>
								</td>
							</tr>
							<!-- 0810 <td class="color">~</td>로 변경-->
							<tr>
								<th scope="row">颜色</th>
								<td class="color">
									<ul>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">金色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">红色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">紫色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">灰色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">蓝色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">粉色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">银色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">藏青色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">天蓝色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">绿色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">米色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">褐色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">土黄色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">黄色</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">橄榄绿</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">暗灰色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">蓝紫色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">象牙色</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">黑色 </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">黑色 </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">白色 </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">混合 </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">图案</label>
										</li>
									</ul>
								</td>
							</tr>
							<!-- //<td class="color">~</td>로 변경-->
							<tr class="option">
								<th scope="row">优惠</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="benefit01" />
											<label for="benefit01">打折</label>
										</li>
										<li>
											<input type="checkbox" id="benefit02" />
											<label for="benefit02">赠品</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>选择条件</th>
								<td class="result" colspan="2">
									<div class="selected-item">
										<ul>
											<li>ANNA SUI<span><img src="//image.ssgdfs.com/images/shop/guide/remove.jpg" alt="X" /></span></li>
											<li>ANNA SUI<span>X</span></li>
										</ul>
										<p><a href="#">全部解除</a></p>
									</div><!-- end selected-item -->
									<p><input type="image" src="/images/shop/cn/category/btn_search.gif" alt="검색" /></p>
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end pattern-search -->
				<p class="list-counter"><span>最终分类名里共有 <span class="num">1,298</span>件商品.</span></p>
				<div class="product-list">
					<div class="pager">
						<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음" /></a>
						<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
						<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막" /></a>
						<p class="counter"><span>1</span>/<span class="total">100</span></p>
					</div><!-- end pager -->
				<div class="list-con">
					<div class="list-sort">
						<ul>
							<li class="first-child selected"><a href="#">排行榜</a></li>
							<li><a href="#">按人气商品排序</a></li>
							<li><a href="#">按新商品排序</a></li>
							<li><a href="#">按低价排序</a></li>
							<li><a href="#">按高价排序</a></li>
							<li><a href="#">按品牌排序</a></li>
						</ul>
					</div><!-- end list-sort -->
					<div class="list-view-con">
						<div class="list-pattern">
							<p><a href="#basic" class="on">图片型</a></p>
							<p><a href="#small">列表型</a></p>
						</div>
						<div class="select-wrap">
							<select class="view-select" title="리스트 뷰 범위 선택">
								<option>1次查看60个</option>
							</select>
						</div>
					</div><!-- end list-view-con -->
				</div><!-- end list-con -->
				<div class="list-basic listing" id="basic">
						<ul class="list">
							<li>
								<div class="info">
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
									</p>
									<p class="photo">
										<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/temp_image.gif" alt="" /></a>
										<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME 兰蔻/LANCOME兰蔻/LANCO</a></p>
									<p class="product-name">
										<a href="#">
											兰蔻 精华肌底液兰蔻 精华肌底液
											兰蔻 精华肌底液兰蔻 精华肌底液
											(小精华肌底液小底液小)
										</a>
									</p>
									<p class="price">
										<span class="origin">$89</span>
										<span class="us-currency">$2,999</span>
										<span class="nation-currency">(约 ￥10,075)</span>
									</p>
									<ul class="link-menu">
										<li class="menu01 on"><a href="#">商品 比较</a></li>
										<li class="menu02"><a href="#">关注 商品</a></li>
										<li class="menu03"><a href="#">购物车</a></li>
										<li class="menu04"><a href="#">立即 购买</a></li>
									</ul>
								</div><!-- end info -->
							</li>
						</ul>
					</div><!-- end list-basic -->
					<div class="list-table listing" id="small">
						<table summary="상품 정보전달 이미지 브랜드/상품명 제품번호 상품펼 가격 담기/구매 메뉴로 구성된 표">
							<caption>상품 리스트</caption>
							<colgroup>
								<col width="119" />
								<col width="369" />
								<col width="95" span="3" />
								<col width="222px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="first-child">图片</th>
									<th scope="col">品牌/商品名</th>
									<th scope="col">REF_NO</th>
									<th scope="col">商品评</th>
									<th scope="col">销售金额</th>
									<th scope="col">装入/购买</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="first-child">
										<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p>
									</td>
									<td class="explain">
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<p class="brand"><a href="#">[KIEHL'S]</a></p>
										<p class="product-name"><a href="#">ULTRA FACIAL 125ML</a></p>
									</td>
									<td>5066610</td>
									<td>
										<p class="star-point">
											<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="1" />
											<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="2" />
											<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="3" />
											<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="4" />
											<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="5" />
										</p>
										<p class="total-count">(101개)</p>
									</td>
									<td>
										<p class="price">
											<span class="origin">$80</span>
											<span class="us-currency">$39</span>
											<span class="nation-currency">(￦54,970)</span>
										</p>
									</td>
									<td class="order">
										<ul>
											<li>	
												<span>
													<img src="/images/shop/cn/product/list/linking_menu01_off.gif" alt="预览" />
												</span>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu02_off.gif" alt="商品比较" />
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu03_off.gif" alt="关注商品" />
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu04_off.gif" alt="购物车" />
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu05_off.gif" alt="立即购买" />
												</a>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- list-table -->
				</div><!-- end product-list -->
				<div class="pager">
					<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음" /></a>
					<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">6</a>
					<a href="#">7</a>
					<a href="#">8</a>
					<a href="#">9</a>
					<a href="#">10</a>
					<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
					<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막" /></a>
				</div><!-- end pager -->
			</div><!-- end category -->
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>