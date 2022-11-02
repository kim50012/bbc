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
				<p class="title"><img src="/images/shop/cn//common/title_colorzone.gif" alt="色彩空间" /></p>
				<a href="#">主页 </a><span>&gt;</span><strong>色彩空间</strong>
			</div>
			<div class="color-choice-box">
				<div class="color-txt">
					<p class="txt"><img src="/images/shop/cn//colorzone/color_main_txt.gif" alt="请选择您所希望的分类，快速查询您想要的颜色。" /></p>
					<p class="color-search"><a href="#"><img src="/images/shop/cn/colorzone/btn_color_search.gif" alt="color search" /></a></p>
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
			<div class="color-container">
				<ul class="color-tab-box">
					<li class="tab-on"><a href="#"><img src="/images/shop/cn/colorzone/color_tab01_on.gif" alt="化妆品" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab02_off.gif" alt="香水" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab03_off.gif" alt="包/钱包" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab04_off.gif" alt="手表/饰品" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab05_off.gif" alt="时尚/配饰" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab06_off.gif" alt="电子产品" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab07_off.gif" alt="食品" /></a></li>
					<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab08_off.gif" alt="韩国品牌" /></a></li>
				</ul>
				<div class="color-product-box">				
					<div class="color-product-type">
						<div class="color-product">
							<p>化妆品共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>香水共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>包/钱包共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>手表/饰品共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>时尚/配饰共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>电子产品共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>食品共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="더보기" /></a></p>
					<div class="color-product-type">
						<div class="color-product">
							<p>韩国品牌共有<span><span class="count">1,005개</span>个商品。</span></p>
						</div>
						<div class="list-con">
							<div class="list-sort">
								<ul>
									<li class="first-child selected"><a href="#">按排行榜</a></li>
									<li><a href="#">按人气商品排序 </a></li>
									<li><a href="#">按新商品排序</a></li>
									<li><a href="#">按低价排序</a></li>
									<li><a href="#">按高价排序</a></li>
									<li><a href="#">按品牌排序</a></li>
								</ul>
							</div><!-- end list-sort -->
						</div><!-- end list-con -->
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
							</ul>
						</div>
					</div>
					<p class="more-view"><a href="#"><img src="/images/shop/cn/brand/btn_more_view.gif" alt="more" /></a></p>
				</div><!-- end color-product-box -->
			</div><!-- end color-container -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>