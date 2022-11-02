<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/colorzone.css" rel="stylesheet" type="text/css" />
<link href="/css/plan.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.gzoom.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript" src="/js/jquery/colorzone.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation">  
				<p class="title"><img src="/images/shop/cn/common/title_colorzone.gif" alt="色彩空间" /></p>
				<a href="#">主页 </a><span>&gt;</span><strong>色彩空间</strong>
			</div>
			<div class="color-choice-box">
				<div class="color-txt">
					<p class="txt"><img src="/images/shop/cn/colorzone/color_main_txt.gif" alt="请选择您所希望的分类，快速查询您想要的颜色。" /></p>
					<p class="color-search"><a href="#"><img src="/images/shop/cn/colorzone/btn_color_search.gif" alt="color search" /></a></p>
				</div>
				<div class="color-box color-banner">
					<img src="/images/shop/cn/colorzone/color_main_banner.jpg" alt="COLOR ZONE - 为对色彩敏感的顾客设计的空间。从头到脚用自己喜欢的颜色搭配。" />
				</div>
				<div class="color-box">
					<ul>
						<li class="first-child">
							<input type="checkbox" id="white"  name="color" />
							<label for="white"><img src="/images/shop/cn/colorzone/color_white.gif" alt="white" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="beige" name="color" />
							<label for="beige"><img src="/images/shop/cn/colorzone/color_beige.gif" alt="beige" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="lightpink" name="color" />
							<label for="lightpink"><img src="/images/shop/cn/colorzone/color_ivory.gif" alt="ivory" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="ivory" name="color" />
							<label for="ivory"><img src="/images/shop/cn/colorzone/color_gold.gif" alt="gold" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="sky" name="color" />
							<label for="sky"><img src="/images/shop/cn/colorzone/color_sky.gif" alt="sky" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="blue" name="color" />
							<label for="blue"><img src="/images/shop/cn/colorzone/color_blue.gif" alt="blue" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="navy" name="color" />
							<label for="navy"><img src="/images/shop/cn/colorzone/color_navy.gif" alt="navy" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
					</ul>
					<ul class="center-line">
						<li class="first-child">
							<input type="checkbox" id="purple" name="color" />
							<label for="purple"><img src="/images/shop/cn/colorzone/color_purple.gif" alt="purple" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="violet" name="color" />
							<label for="violet"><img src="/images/shop/cn/colorzone/color_violet.gif" alt="violet" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="pink" name="color" />
							<label for="pink"><img src="/images/shop/cn/colorzone/color_pink.gif" alt="pink" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="red"  name="color" />
							<label for="red"><img src="/images/shop/cn/colorzone/color_red.gif" alt="red" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="brown" name="color" />
							<label for="brown"><img src="/images/shop/cn/colorzone/color_brown.gif" alt="brown" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="darkgreen" name="color" />
							<label for="darkgreen"><img src="/images/shop/cn/colorzone/color_khaki.gif" alt="khaki" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="green" name="color" />
							<label for="green"><img src="/images/shop/cn/colorzone/color_green.gif" alt="green" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="yellowgreen" name="color" />
							<label for="yellowgreen"><img src="/images/shop/cn/colorzone/color_olive.gif" alt="olive" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
					</ul>
					<ul>
						<li class="first-child">
							<input type="checkbox" id="yellow"  name="color" />
							<label for="yellow"><img src="/images/shop/cn/colorzone/color_yellow.gif" alt="yellow" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="lightgray" name="color" />
							<label for="lightgray"><img src="/images/shop/cn/colorzone/color_silver.gif" alt="silver" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="gray" name="color" />
							<label for="gray"><img src="/images/shop/cn/colorzone/color_gray.gif" alt="gray" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="darkgray" name="color" />
							<label for="darkgray"><img src="/images/shop/cn/colorzone/color_charcoal.gif" alt="charcoal" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="black" name="color" />
							<label for="black"><img src="/images/shop/cn/colorzone/color_black.gif" alt="black" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="rainbow" name="color" />
							<label for="rainbow"><img src="/images/shop/cn/colorzone/color_rainbow.gif" alt="rainbow" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
						<li>
							<input type="checkbox" id="pattern" name="color" />
							<label for="pattern"><img src="/images/shop/cn/colorzone/color_pattern.gif" alt="pattern" /></label>
							<span><img src="/images/shop/cn/colorzone/color_on.png" alt="check" /></span>
						</li>
					</ul>
				</div><!-- end color-box -->
			</div><!-- end color-choice -->
			<div class="mycolor-box">
				<div class="mycolor-goods">
					<p><img src="/images/shop/cn/colorzone/my_color.gif" alt="我的色彩" /></p>
					<p class="color"><img src="/images/shop/cn/colorzone/mycolor_14.gif" alt="brown" /></p>
					<p><a href="#"><img src="/images/shop/cn/colorzone/btn_color_goods.gif" alt="查看喜欢的颜色商品" /></a></p>
				</div>
				<div class="mycolor-list-box">
					<div class="mycolor-list">
						<ul>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_white02.gif" alt="white" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_ivory02.gif" alt="ivory" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_beige02.gif" alt="beige" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_gold02.gif" alt="gold" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_sky02.gif" alt="sky" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_blue02.gif" alt="blue" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_navy02.gif" alt="navy" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_purple02.gif" alt="purple" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_violet02.gif" alt="violet" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_pink02.gif" alt="pink" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_red02.gif" alt="red" /></a></li>
						</ul>
						<ul class="mycolor-list02">
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_brown02.gif" alt="brown" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_khaki02.gif" alt="khaki" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_green02.gif" alt="green" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_olive02.gif" alt="olive" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_yellow02.gif" alt="yellow" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_silver02.gif" alt="silver" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_gray02.gif" alt="gray" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_charcoal02.gif" alt="charcoal" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_black02.gif" alt="black" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_rainbow02.gif" alt="rainbow" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/colorzone/color_pattern02.gif" alt="pattern" /></a></li>
						</ul>
					</div>
					<div class="mycolor-save">
						<p class="mycolor-tit-gray">COLOR</p>
						<ul>
							<li class="my-gray">gray</li>
						</ul>
						<p><a href="#"><img src="/images/shop/cn/colorzone/btn_save_mycolor.gif" alt="保存" /></a></p>
					</div>
				</div><!-- mycolor-list -->
			</div><!-- end mycolor-box -->
			<div class="recommend-colorbox">
				<p class="colortxt">为您推荐与阳光明媚的今日相配的蓝色。</p>
				<ul class="recommend-list">
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_khaki_off.gif" alt="khaki" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_green_off.gif" alt="green" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_olive_off.gif" alt="olive" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_yellow_off.gif" alt="yellow" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_ivory_off.gif" alt="ivory" /></a></li>
					<li class="on"><a href="#"><img src="/images/shop/cn/colorzone/color_brown_on.gif" alt="brown" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_white_off.gif" alt="white" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_gold_off.gif" alt="gold" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_beige_off.gif" alt="beige" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_rainbow_off.gif" alt="rainbow" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_pattern_off.gif" alt="pattern" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_purple_off.gif" alt="purple" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_violet_off.gif" alt="violet" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_pink_off.gif" alt="pink" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_red_off.gif" alt="red" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_sky_off.gif" alt="sky" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_blue_off.gif" alt="blue" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_navy_off.gif" alt="navy" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_silver_off.gif" alt="silver" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_gray_off.gif" alt="gray" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_charcoal_off.gif" alt="charcoal" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_black_off.gif" alt="black" /></a></li>
				</ul>
				<div class="list-basic listing">
					<ul>
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
			</div><!-- end recommend-color -->
			<div class="color-hotitem">
				<div class="color-product">
					<p>褐色人气商品</p>
				</div>
				<div class="list-basic">
					<ul>
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
						<li>
							<div class="info">
								<p class="photo">
									<a href="#" title="ULTRA FACIAL 125ML"><img src="/images/shop/cn/product/list/160X160.gif" alt="" /></a>
									<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								</p>
								<p class="brand"><a href="#">兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER兰蔻/ESTEE LAUDER</a></p>
								<p class="product-name">
									<a href="#">
										Advanced Night Repair<br /> 
										Synchronized Recovery Complex<br />
										Face &amp; Eye Set
									</a>
								</p>
								<p class="price">
									<span class="origin">$80</span>
									<span class="us-currency">$3,090</span>
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
				</div>
				<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="more" /></a></p>
			</div><!-- end color-hotitem -->
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>