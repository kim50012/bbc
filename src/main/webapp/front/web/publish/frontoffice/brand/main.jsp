<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/brand.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/brand.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body"> 
			<div class="page-submainlocation">  
				<p class="title"><img src="/images/shop/cn/common/title_brand.gif" alt="新世界网上免税店 Brand " /></p>
				<a href="#">主页</a><span>&gt;</span><strong>品牌</strong>
			</div>
			<div class="brand">
				<div class="search-main-banner">
					<div class="brand-search-form">
						<form action="#">
						<fieldset>
							<legend>브랜드검색</legend>
							<div class="input-area">
								<span class="brand-search">搜索品牌</span>
								<input type="text" value="请用品牌名搜索。" title="请用品牌名搜索。" />
								<input type="image" src="/images/shop/cn/brand/btn_search.gif" alt="搜索" />
								<span>简单搜索入驻新世界免税店的所有品牌。</span>
							</div><!-- end input-area -->
							<div class="result">
								<div class="category">
									<div class="list-con">
										<input type="checkbox" id="all-choice" />
										<label for="all-choice">全部分类</label>
									</div><!-- end list-con -->
									<div class="list">
										<ul class="cate-list">
											<li>
												<input type="checkbox" id="cate01" />
												<label for="cate01">化妆品</label>
											</li>
											<li>
												<input type="checkbox" id="cate02" />
												<label for="cate02">香水</label>
											</li>
											<li>
												<input type="checkbox" id="cate03" />
												<label for="cate03">包/钱包</label>
											</li>
											<li>
												<input type="checkbox" id="cate04" />
												<label for="cate04">手表/饰品</label>
											</li>
											<li>
												<input type="checkbox" id="cate05" />
												<label for="cate05">时尚/配饰</label>
											</li>
											<li>
												<input type="checkbox" id="cate06" />
												<label for="cate06">电子产品</label>
											</li>
											<li>
												<input type="checkbox" id="cate07" />
												<label for="cate07">饰品</label>
											</li>
											<li>
												<input type="checkbox" id="cate08" />
												<label for="cate05">韩国品牌</label>
											</li>
										</ul>
										<ul class="brand-order">
											<li>
												<input type="checkbox" id="brand-order01" />
												<label for="brand-order01">新品牌</label>
											</li>
											<li>
												<input type="checkbox" id="brand-order02" />
												<label for="brand-order02">店铺独家品牌</label>
											</li>
										</ul>
									</div><!-- end list -->
									<div class="banner">
										<img src="/images/shop/cn/brand/temp_banner.gif" alt="대용량 기획전 
										더오래 쓰고 저렴한!" />
									</div><!-- end banner -->
								</div><!-- end category -->
								<div id="sharSortDiv" class="char-sort">
									<div class="list-con">
										<span class="title">按ABC搜索结果</span>
									</div><!-- end list-con -->
									<div class="char-menu">
										<ul class="alpa">
											<li class="selected"><a href="#alpa01">A</a></li>
											<li><a href="#alpa02">B</a></li>
											<li><a href="#">C</a></li>
											<li><a href="#">D</a></li>
											<li><a href="#">E</a></li>
											<li><a href="#">F</a></li>
											<li><a href="#">G</a></li>
											<li><a href="#">H</a></li>
											<li><a href="#">I</a></li>
											<li><a href="#">J</a></li>
											<li><a href="#">K</a></li>
											<li><a href="#">L</a></li>
											<li><a href="#">M</a></li>
											<li><a href="#">N</a></li>
											<li><a href="#">O</a></li>
											<li><a href="#">P</a></li>
											<li><a href="#">Q</a></li>
											<li><a href="#">R</a></li>
											<li><a href="#">S</a></li>
											<li><a href="#">T</a></li>
											<li><a href="#">U</a></li>
											<li><a href="#">V</a></li>
											<li><a href="#">W</a></li>
											<li><a href="#">X</a></li>
											<li><a href="#">Y</a></li>
											<li><a href="#">Z</a></li>
										</ul>
									</div><!-- end char-menu -->
									<div class="result-list">
										<ul id="result" class="result" style="display:none;">
											<li class="result-no">검색 결과가<br />없습니다.</li>
										</ul>
										<ul class="main" id="view01" style="display: block; z-index:8;">
											<li>
												<ul>
													<li class="selected">
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
													<li>
														<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
													</li>
												</ul>
											</li>
										</ul>
										<p class="open"><span>查看更多</span></p>
									</div><!-- end reult-list -->
									<div class="brand-all-view">
										<div id="allListingDiv" class="listing-all">
											<ul class="main" id="view01" style="display: block; z-index:8;">
												<li>
													<ul>
														<li class="selected"><span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
															<div class="brand-info">
																<div class="info-layer">
																	<div class="info-wrap">
																		<div class="brand-pattern">
																			<p class="photo"><a href="#"><img src="/images/shop/cn/brand/temp_brand.gif" alt="" /></a></p>
																			<ul class="pattern">
																				<li><a href="#"><img src="/images/shop/cn/brand/btn_over01.gif" alt="网上销售" /></a></li>
																				<li><a href="#"><img src="/images/shop/cn/brand/btn_over02.gif" alt="店铺独家" /></a></li>
																				<li><a href="#"><img src="/images/shop/cn/brand/btn_over03.gif" alt="品牌赠送活动" /></a></li>
																				<li><a href="#"><img src="/images/shop/cn/brand/btn_over04.gif" alt="品牌促销" /></a></li>
																			</ul>
																		</div><!-- end brand pattern -->
																	</div><!-- end info-wrap -->
																</div><!-- end info-layer -->
															</div><!-- end brand-info -->
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
													</ul>
												</li>
												<li>
													<ul>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">AAAAAAAAAAAA</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
													</ul>
												</li>
												<li>
													<ul>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
													</ul>
												</li>
											</ul>
											<ul class="main" id="view02">
												<li>
													<ul>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
														<li>
															<span><a href="#">하하하하하</a><span><img src="/images/shop/cn/brand/layer_icon_off.gif" alt="!" /></span></span>
														</li>
													</ul>
												</li>
											</ul>
										</div><!-- end listing-all -->
										<div class="best-brand">
											<p class="title"><img src="/images/shop/cn/brand/title_best_brand.gif" alt="BEST BRAND" /></p>
											<ul>
												<li><a href="#"><img src="/images/shop/cn/category/temp_brand.gif" alt="ROCKPORT" /></a></li>
												<li><a href="#"><img src="/images/shop/cn/category/temp_brand.gif" alt="ROCKPORT" /></a></li>
												<li><a href="#"><img src="/images/shop/cn/category/temp_brand.gif" alt="ROCKPORT" /></a></li>
												<li><a href="#"><img src="/images/shop/cn/category/temp_brand.gif" alt="ROCKPORT" /></a></li>
												<li><a href="#"><img src="/images/shop/cn/category/temp_brand.gif" alt="ROCKPORT" /></a></li>
											</ul>
										</div><!-- end best-brand -->
										<div class="all-list-con">
											<div class="list-view">
												<a href="#view01"><img src="/images/shop/cn/brand/brand_page_on.png" alt="1" /></a>
												<a href="#view02"><img src="/images/shop/cn/brand/brand_page_off.png" alt="2" /></a>
												<a href="#"><img src="/images/shop/cn/brand/brand_page_off.png" alt="3" /></a>
												<a href="#"><img src="/images/shop/cn/brand/brand_page_off.png" alt="4" /></a>
											</div><!-- end list-view -->
											<p class="close"><span>关闭</span></p>
										</div><!-- end all-list-con -->
									</div><!-- end brand-all-view -->
								</div><!-- end char-sort -->
							</div><!-- end result -->
						</fieldset>
						</form>
					</div><!-- end brand-search-form -->
					<div class="main-banner">
						<div class="view-con">
							<span class="play"><img src="/images/shop/cn/brand/btn_play_on.gif" alt="시작" /></span>
							<span class="stop"><img src="/images/shop/cn/brand/btn_stop_off.gif" alt="정지" /></span>
						</div><!-- end view-con -->
						<div class="banner-menu">
							<a href="#main-banner01"><img src="/images/shop/cn/brand/brand_page_off.gif" alt="1" /></a>
							<a href="#main-banner02"><img src="/images/shop/cn/brand/brand_page_off.gif" alt="2" /></a>
							<a href="#main-banner03"><img src="/images/shop/cn/brand/brand_page_off.gif" alt="3" /></a>
							<a href="#main-banner04"><img src="/images/shop/cn/brand/brand_page_off.gif" alt="4" /></a>
							<a href="#main-banner05"><img src="/images/shop/cn/brand/brand_page_off.gif" alt="5" /></a>
						</div><!-- end banner-menu -->
						<div class="banner-list">
							<ul>
								<li id="main-banner01"><a href="#"><img src="/images/shop/cn/brand/temp_banner01.gif" alt="" /></a></li>
								<li id="main-banner02"><a href="#"><img src="/images/shop/cn/brand/temp_banner02.gif" alt="" /></a></li>
								<li id="main-banner03"><a href="#"><img src="/images/shop/cn/brand/temp_banner03.gif" alt="" /></a></li>
								<li id="main-banner04"><a href="#"><img src="/images/shop/cn/brand/temp_banner04.gif" alt="" /></a></li>
								<li id="main-banner05"><a href="#"><img src="/images/shop/cn/brand/temp_banner05.gif" alt="" /></a></li>
							</ul>
						</div><!-- end banner-list -->
					</div><!--  end main-banner -->
					<div class="hot-item-ten">
						<div class="item-menu">
							<p class="title"><img src="/images/shop/cn/brand/title_hot_item.gif" alt="BEST BRAND  BEST ITEM" /></p>
							<ul>
								<li class="first-child selected">
									<a href="#brand-hot01"><img src="/images/shop/cn/brand/temp_brand_menu01.gif" alt="CHANEL" /></a>
								</li>
								<li>
									<a href="#brand-hot02"><img src="/images/shop/cn/brand/temp_brand_menu02.gif" alt="LA MER" /></a>
								</li>
								<li><a href="#"><img src="/images/shop/cn/brand/temp_brand_menu03.gif" alt="SK-II" /></a></li>
								<li><a href="#"><img src="/images/shop/cn/brand/temp_brand_menu04.gif" alt="KIEHLS" /></a></li>
							</ul>
						</div><!-- item-menu -->
						<div class="brand-product-wrap">
							<ul class="main">
								<li id="brand-hot01">
									<ul>
										<li class="first-child">
											<ul>
												<li>
													<p class="photo">
														<a href="#"><img src="/images/shop/cn/brand/160X160.gif" alt="상품명" /></a>
													</p>
													<div class="product-info-layer" style="display:block;">
														<p class="product-name">
															<a href="#">
																Advanced Night Repair<br />
																Synchorized Recovery Complex<br />
																Face &amp; Eye Set
															</a>
														</p>
														<p class="price">
															<span class="origin">$89</span>
															<span class="us-currency">$130,00</span>
															<span class="nation-currency">(￦54,970)</span>
														</p>
													</div><!-- end product-info-layer -->
												</li>
												<li>
													<p class="photo">
														<a href="#"><img src="/images/shop/cn/brand/160X160.gif" alt="상품명" /></a>
													</p>
													<div class="product-info-layer">
														<p class="product-name">
															<a href="#">
																Advanced Night Repair<br />
																Synchorized Recovery Complex<br />
																Face &amp; Eye Set
															</a>
														</p>
														<p class="price">
															<span class="origin">$89</span>
															<span class="us-currency">$130,00</span>
															<span class="nation-currency">(￦54,970)</span>
														</p>
													</div><!-- end product-info-layer -->
												</li>
											</ul>											
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>										
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/brand/80X80.gif" alt="상품명" /></a></p>
											<div class="product-info-layer">
												<p class="product-name">
													<a href="#">
														Advanced Night Repair<br />
														Synchorized Recovery Complex<br />
														Face &amp; Eye Set
													</a>
												</p>
												<p class="price">
													<span class="origin">$89</span>
													<span class="us-currency">$130,00</span>
													<span class="nation-currency">(￦54,970)</span>
												</p>
											</div><!-- end product-info-layer -->
										</li>
									</ul>
								</li>
							</ul>
						</div><!-- end brand-product-wrap -->
					</div><!-- end hot-item-ten -->
				</div><!-- end search-main-banner -->
				<div class="list-tab" id="brand-tab01">
					<ul class="tab-menu">
						<li class="selected"><a href="#brand-tab01"><img src="/images/shop/cn/brand/tab01_on.gif" alt="店铺独家品牌" /></a></li>
						<li><a href="#brand-tab02"><img src="/images/shop/cn/brand/tab02_off.gif" alt="品牌全新企划" /></a></li>
					</ul>
					<div class="section-title">
						<p><img src="/images/shop/cn/brand/tab01_txt.gif" alt="该品牌只能在实体店铺购买。部分商品(太阳镜、香水等)可在网上购买。" /></p>
					</div><!-- end section-title -->
					<div class="brand-list">
						<ul>
							<li>
								<p>
									<a href="#">
										<img src="//image.ssgdfs.com/images/shop/brand/bran_smaple.gif" alt="" />
									</a>
								</p>
								<div class="able">
								</div><!-- end able -->
							</li>
							<li>
								<p>
									<a href="#">
										<img src="//image.ssgdfs.com/images/shop/brand/bran_smaple.gif" alt="" />
									</a>
								</p>
								<div class="able">
									<span>化妆品/香水/太阳镜</span>
									<span>可在网上购买</span>
								</div><!-- end able -->
							</li>
							<li>
								<p>
									<a href="#">
										<img src="//image.ssgdfs.com/images/shop/brand/bran_smaple.gif" alt="" />
									</a>
								</p>
								<div class="able">
									<span>化妆品/香水/太阳镜</span>
									<span>可在网上购买</span>
								</div><!-- end able -->
							</li>
							<li>
								<p>
									<a href="#">
										<img src="//image.ssgdfs.com/images/shop/brand/bran_smaple.gif" alt="" />
									</a>
								</p>
								<div class="able">
									<span>化妆品/香水/太阳镜</span>
									<span>可在网上购买</span>
								</div><!-- end able -->
							</li>
							<li>
								<p>
									<a href="#">
										<img src="//image.ssgdfs.com/images/shop/brand/bran_smaple.gif" alt="" />
									</a>
								</p>
								<div class="able">
									<span>化妆品/香水/太阳镜</span>
									<span>可在网上购买</span>
								</div><!-- end able -->
							</li>
						</ul>
					</div><!-- end brand-list -->
				</div><!-- end list-tab -->
				<div class="list-tab" id="brand-tab02">
					<ul class="tab-menu">
						<li><a href="#brand-tab01"><img src="/images/shop/cn/brand/tab01_off.gif" alt="店铺独家品牌" /></a></li>
						<li class="selected"><a href="#brand-tab02"><img src="/images/shop/cn/brand/tab02_on.gif" alt="品牌全新企划" /></a></li>
					</ul>
					<div class="brand-banner-list">
						<ul>
							<li>
								<a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a>
							</li>
							<li>
								<a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a>
							</li>
							<li>
								<a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a>
							</li>
							<li>
								<a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a>
							</li>
							<li>
								<a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a>
							</li>
							<li>
								<a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a>
							</li>
						</ul>
					</div><!-- end brand-list -->
				</div><!-- end list-tab -->
			</div><!-- end brand -->
		
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>