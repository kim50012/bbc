<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jqueryScroll/jcarousellite_1.0.1.min.js"></script>
<script type="text/javascript">
jQuery(function($){
	//foot-rolling
		$(".roll-banner").jCarouselLite({
			btnNext: ".roll-banner .view-con .next",
			btnPrev: ".roll-banner .view-con .prev",
			auto: 800,
			speed: 1000,
			scroll: 1,
			visible: 1,
			vertical: true
		});
		//gnb brand-list
		var brandCnt = 0;
		$(".brand-list .view-con span").click(function(){
			brandMotion($(this));
		});
		brandMotion = function(obj){
			brandCnt--;
			if(brandCnt < 0) 
			brandCnt = obj.parent().parent().find("ul").size() - 1;
			brandCnt = brandCnt % (obj.parent().parent().find("ul").size());
			obj.parent().parent().find("ul").hide();
			obj.parent().parent().find("ul:eq("+ brandCnt +")").show();
		}
		//category-view
		var category = $(".main-banner ul.main li > span.cate");
		category.mouseenter(function(){
			category.each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.png" , "_off.png"));
			});
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.png" , "_on.png"));
			$("div.depth").stop().animate({"left" : "-704px"});
			$(this).parent().find("div.depth .depth-menu ul li").eq(0).attr("class" , "on");
			$(this).parent().find("div.depth").stop().animate({"left" : "99px"});
		});
		//banner-motion 
		var banner = $(".banner-menu ul li a");

		// motion start
		banner
		.everyTime(5000, 'banner', function(i) {
			if(i > 0) {
				idx = i % banner.size();
				banner.eq(idx).click();
			}
		});
		// banner mouseover 
		banner.mouseout(function(){
			var tagTxt = $(this).attr("href");
			bannerStart(tagTxt);
		});
		// banner stop 
		banner.mouseover(function(){
			banner.stopTime();
			bannerClick($(this));
		});
		// banner stop
		$(".main-banner .view-con span.stop").click(function(){
			banner.stopTime();
			imgReplace($(this));
		});
		// banner restart 
		$(".main-plan .view-con span.play").click(function(){
			bannerpoi = $(".banner-menu ul").find(" li.on a").attr("href");
			bannerStart(bannerpoi);
			imgReplace($(this));
		});
		//banner start  
		banner.click(function(){
			bannerClick($(this));
			return false;
		});
		//  banner click common 
		bannerClick = function(obj){
			$(".banner-list ul li").stop().animate({"opacity" : 0} , 400);
			$(".banner-menu ul li").attr("class" , "");
			obj.parent().attr("class" , "on");
			$(obj.attr("href")).stop().animate({"opacity" : "1" , "z-index" : "3"} , 500);
			return false;
		};
		// banner restart
		bannerStart = function(obj){
			banner.each(function(x){
				if($(this).attr("href") == obj){
					banner.everyTime(3000, 'banner', function(i) {
						idx = (x + i) % banner.size();
						banner.eq(idx).click();
					});
				}
			});
		};
		// banner left right move
		var bannerCnt = 0;
		$("div.brand-promotion .view-con span").click(function(){
			bannerMotion($(this));
		});
		bannerMotion = function(obj){
			bannerCnt--;
			if(bannerCnt < 0)
			bannerCnt = obj.parent().parent().find(" ul li").size() - 1;
			bannerCnt = bannerCnt % (obj.parent().parent().find("ul li").size());
			obj.parent().parent().find("ul li").hide();
			obj.parent().parent().find("ul li:eq("+ bannerCnt +")").show();
		}
		// nation-product tab-mrnu
		$(".nation-product .tab-menu ul li a").click(function(){
			$(".product-nation ul > li").hide();
			$(".product-nation ul > li ul li").show();
			$(".nation-product .tab-menu ul li").attr("class" , "");
			$(this).parent().attr("class" , "on");
			$($(this).attr("href")).show();
			return false;
		});

		//vertical-view 
		$(".theme-product p.title").click(function(){
			$(".theme-product ul li").attr("class" , "");
			$(this).parent().attr("class" , "on");
		});

		//new-brand 
		$(".new-brand .view-con a").click(function(){
			itemBanner($(this));	
			return false;
		}).mouseover(function(){
			itemBanner($(this));	
		});
		itemBanner = function(obj){
			$(".brand-banner ul li").hide();
			$(".new-brand .view-con a").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.png" , "_off.png"));
			});
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.png" , "_on.png"));
			$(obj.attr("href")).show();
		}
		// best-tab 
		$(".best .tab ul li a").click(function(){
			$(".best .tab ul li a").each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif") );
			});
			$(".set-list").hide();
			$(".best .tab ul li").attr("class" , "");
			$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif") );
			$(this).parent().attr("class" , "on");
			$($(this).attr("href")).show();
			return false;
		});
		//nerw-arrival
		var arrivalCnt = 0;
		$(".nerw-arrival .view-con span").click(function(){
			arrivalCnt--;
			if(arrivalCnt < 0)
			arrivalCnt = $(this).parent().parent().find("ul li ul").size() - 1;
			arrivalCnt = arrivalCnt % ($(this).parent().parent().find("ul li ul").size());
			$(this).parent().parent().find("ul li ul").hide();
			$(this).parent().parent().find("ul li ul:eq("+ arrivalCnt +")").show();
		});
		//popular 
		$(".popular .navi ul li").click(function(){
			popularCon($(this));
			return false;
		}).mouseout(function(){
			popularCon($(this));
		});
		popularCon = function(obj){
			$(".popular .navi ul li").attr("class" , "");
			obj.attr("class" , "on");
			$(obj.find("a").attr("href")).show();
		};
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="main">
				<div class="gnb-banner">
					<div class="gnb-navi">
						<ul class="gnb-main">
							<li><span class="gnb-cate"><img src="/images/shop/cn/main/new_cate01_off.png" alt="?????????" /></span>
								<div class="gnb-depth">
									<div class="gnb-depth-menu">
										<ul>
											<li><span><a href="#">????????????</a></span>
												<ul>
													<li><a href="#">?????????</a></li>
													<li><a href="#">??????</a></li>
													<li><a href="#">??????</a></li>
													<li><a href="#">??????</a></li>
													<li><a href="#">????????????</a></li>
													<li><a href="#">????????????</a></li>
													<li><a href="#">??????</a></li>
													<li><a href="#">??????</a></li>
													<li><a href="#">??????/?????????</a></li>
													<li><a href="#">????????????</a></li>
													<li><a href="#">????????????</a></li>
												</ul>
											</li>
											<li><a href="#">??????</a></li>
											<li><a href="#">??????/??????</a></li>
											<li><a href="#">????????????</a></li>
											<li><a href="#">????????????</a></li>
											<li><a href="#">??????</a></li>
											<li><a href="#">??????</a></li>
										</ul>
									</div><!-- end depth-menu -->
									<div class="gnb-relation-list">
										<p class="title"><img src="/images/shop/cn/main/tit_brand_best.gif" alt="BRAND BEST" /></p>
										<ul>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
												<p class="brand"><a href="#">?????????/KIEHL</a></p>
												<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
												<p class="price">
													<span>$22</span>
													<span>(??? ???135)</span>
												</p>
											</li>
										</ul>
									</div><!-- end gnb-relation-list -->
									<div class="gnb-link-banner">
										<ul>
											<li><a href="#"><img src="/images/shop/cn/common/banner_common01.jpg" alt="" /></a></li>
											<li><a href="#"><img src="/images/shop/cn/common/banner_common02.jpg" alt="" /></a></li>
											<li><a href="#"><img src="/images/shop/cn/common/banner_common03.jpg" alt="" /></a></li>
											<li><a href="#"><img src="/images/shop/cn/common/banner_common04.jpg" alt="" /></a></li>
										</ul>	
									</div><!-- end gnb-link-banner -->
								</div><!-- end gnb-depth -->
							</li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate02_off.png" alt="??????" /></a></span></li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate03_off.png" alt="???/??????" /></a></span></li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate04_off.png" alt="??????/??????" /></a></span></li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate05_off.png alt="??????/??????" /></a></span></li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate06_off.png" alt="????????????" /></a></span></li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate07_off.png" alt="??????" /></a></span></li>
							<li><span><a href="#"><img src="/images/shop/cn/main/new_cate08_off.png" alt="????????????" /></a></span></li>
						</ul>
					</div><!-- end banner-navi -->
					<div class="plan-banner">
						<div class="banner-menu">
							<ul>
								<li class="on"><a href="#banner01">?????????1</a></li>
								<li><a href="#banner02">?????????2</a></li>
								<li><a href="#banner03">?????????3</a></li>
								<li><a href="#banner04">?????????4</a></li>
							</ul>
						</div><!-- enmd banner-menu -->
						<div class="banner-list">
							<ul>
								<li id="banner01"><a href="#"><img src="/images/shop/cn/main/mb01_01.jpg" alt="" /></a></li>
								<li id="banner02"><a href="#"><img src="/images/shop/cn/main/mb01_02.jpg" alt="" /></a></li>
								<li id="banner03"><a href="#"><img src="/images/shop/cn/main/mb01_03.jpg" alt="" /></a></li>
								<li id="banner04"><a href="#"><img src="/images/shop/cn/main/mb01_04.jpg" alt="" /></a></li>
							</ul>
						</div><!-- end banner-list -->
					</div><!-- end plan-banner -->
					<div class="banner-promotion">
						<ul>
							<li><a href="#"><img src="/images/shop/cn/main/main_v_banner01.gif" alt="??????????????????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/main_v_banner02.gif" alt="????????????????????? ???????????????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/main_v_banner03.gif" alt="?????????" /></a></li>
							<li>
								<div class="brand-promotion">
									<div class="view-con">
										<span class="prev"><img src="/images/shop/cn/main/btn_prev.gif" alt="prev" /></span>
										<span class="next"><img src="/images/shop/cn/main/btn_next.gif" alt="next" /></span>
									</div><!-- end view-con -->
									<ul>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/120X120.gif" alt="??????/LANCOME" /></a></p>
											<p class="brand"><a href="#">??????/LANCOME</a></p>
											<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
											<p class="price">
												<span>$175</span>
												<span>(??? ???1,075)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/120X120_01.gif" alt="??????/LANCOME" /></a></p>
											<p class="brand"><a href="#">??????/LANCOME</a></p>
											<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
											<p class="price">
												<span>$175</span>
												<span>(??? ???1,075)</span>
											</p>
										</li>
									</ul>
								</div><!-- end brand-promotion-->
							</li>
						</ul>
					</div><!-- end banner-promotion -->
				</div><!-- end main-banner -->
				<div class="section-banner">
					<ul>
						<li><a href="#"><img src="/images/shop/cn/main/250X100.gif"  alt="" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/250X100.gif"  alt="" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/250X100.gif"  alt="" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/250X100.gif"  alt="" /></a></li>
					</ul>
				</div><!-- end section-banner -->
				<div class="nation-product">
					<dl>
						<dt><img src="/images/shop/cn/main/tit_kpmall.gif" alt="?????? ???????????? korea product mall" /></dt>
						<dd>
							<div class="tab-menu">
								<ul>
									<li class="on"><a href="#tab-menu01">Get it Beauty??????????????????</a></li>
									<li><a href="#tab-menu02">??????????????????</a></li>
									<li><a href="#tab-menu03">????????????????????????????????????</a></li>
								</ul>
							</div><!-- end tab-menu -->
							<div class="product-nation">
								<ul>
									<li id="tab-menu01">
										<ul class="list">
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
										</ul>
									</li>
									<li id="tab-menu02">
										<ul class="list">
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
										</ul>
									</li>
									<li id="tab-menu03">
										<ul class="list">
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
											<li>
												<p class="photo"><a href="#"><img src="/images/shop/cn/main/140X140.gif" alt="??????/LANCOME" /></a></p>
												<p class="brand"><a href="#">??????/LANCOME</a></p>
												<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
												<p class="price">
													<span>$175</span>
													<span>(??? ???1,075)</span>
												</p>
											</li>
										</ul>
									</li>
								</ul>
							</div><!-- end nation-product -->
						</dd>
					</dl>
				</div><!-- end nation-product -->
				<div class="theme-section">
					<div class="theme-product">
						<ul class="main">
							<li class="on">
								<p class="title"><span><img src="/images/shop/cn/main/theme01.png" alt="?????????????????? ????????? ????????????" /></span></p>
								<div class="theme-detail">
									<p class="theme-title"><img src="/images/shop/cn/main/theme_title.gif" alt="???????????????????????? MOM???s & BABY" /></p>
									<ul class="theme-list">
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
									</ul>
								</div><!-- end theme-detail -->
							</li>
							<li>
								<p class="title"><span><img src="/images/shop/cn/main/theme01.png" alt="?????????????????? ????????? ????????????" /></span></p>
								<div class="theme-detail">
									<p class="theme-title"><img src="/images/shop/cn/main/theme_title.gif" alt="???????????????????????? MOM???s & BABY" /></p>
									<ul class="theme-list">
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
									</ul>
								</div><!-- end theme-detail -->
							</li>
							<li>
								<p class="title"><span><img src="/images/shop/cn/main/theme01.png" alt="?????????????????? ????????? ????????????" /></span></p>
								<div class="theme-detail">
									<p class="theme-title"><img src="/images/shop/cn/main/theme_title.gif" alt="???????????????????????? MOM???s & BABY" /></p>
									<ul class="theme-list">
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
									</ul>
								</div><!-- end theme-detail -->
							</li>
							<li>
								<p class="title"><span><img src="/images/shop/cn/main/theme01.png" alt="?????????????????? ????????? ????????????" /></span></p>
								<div class="theme-detail">
									<p class="theme-title"><img src="/images/shop/cn/main/theme_title.gif" alt="???????????????????????? MOM???s & BABY" /></p>
									<ul class="theme-list">
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
									</ul>
								</div><!-- end theme-detail -->
							</li>
							<li>
								<p class="title"><span><img src="/images/shop/cn/main/theme01.png" alt="?????????????????? ????????? ????????????" /></span></p>
								<div class="theme-detail">
									<p class="theme-title"><img src="/images/shop/cn/main/theme_title.gif" alt="???????????????????????? MOM???s & BABY" /></p>
									<ul class="theme-list">
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X80.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$22</span>
												<span>(??? ???135)</span>
											</p>
										</li>
									</ul>
								</div><!-- end theme-detail -->
							</li>
						</ul>
					</div><!-- end theme-product -->
					<div class="sale-brand">
						<div class="hot-sale">
							<p class="title"><img src="/images/shop/cn/main/sale_title.gif" alt="EVERY DAY HOT SALE" /></p>
							<p class="title-cn">???????????????????????????</p>
							<p class="photo"><img src="/images/shop/cn/main/temp_120X120.gif" alt="" /></p>
							<div class="rate-price">
								<p class="rate">50</p>
								<p class="price">
									<span class="us">$100</span>
									<span class="cn">(??? ???135)</span>
								</p>
							</div><!-- end rate-price -->
						</div><!-- end hot-sale -->
						<div class="new-brand">
							<div class="view-con">
								<a href="#new01"><img src="/images/shop/cn/main/banner_on.png" alt="1" /></a>
								<a href="#new02"><img src="/images/shop/cn/main/banner_off.png" alt="2" /></a>
								<a href="#new03"><img src="/images/shop/cn/main/banner_off.png" alt="3" /></a>
							</div><!-- end view-con -->
							<div class="brand-banner">
								<ul>
									<li id="new01"><a href="#"><img src="/images/shop/cn/main/brand_banner01.gif" alt="" /></a></li>
									<li id="new02"><a href="#"><img src="/images/shop/cn/main/brand_banner02.gif" alt="" /></a></li>
									<li id="new03"><a href="#"><img src="/images/shop/cn/main/brand_banner03.gif" alt="" /></a></li>
								</ul>
							</div><!-- end brand-banner -->
						</div><!-- end new-brand -->
					</div><!-- end sale-brand -->
				</div><!-- end theme-section -->
				<div class="best-new">
					<div class="best">
						<p class="heading"><img src="/images/shop/cn/main/tit_bestseller.gif" alt="???????????? BESTSELLER" /></p>
						<div class="tab">
							<ul>
								<li class="on"><a href="#pattern01"><img src="/images/shop/cn/main/tab01_on.gif" alt="?????????" /></a></li>
								<li><a href="#pattern02"><img src="/images/shop/cn/main/tab02_off.gif" alt="??????" /></a></li>
								<li><a href="#pattern03"><img src="/images/shop/cn/main/tab03_off.gif" alt="???/??????" /></a></li>
								<li><a href="#pattern04"><img src="/images/shop/cn/main/tab04_off.gif" alt="??????" /></a></li>
								<li><a href="#pattern05"><img src="/images/shop/cn/main/tab05_off.gif" alt="????????????" /></a></li>
							</ul>
						</div><!-- end tab -->
						<div class="product-set">
							<ul class="main">
								<li id="pattern01" class="set-list">
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li id="pattern02" class="set-list">
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li id="pattern03" class="set-list">
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li id="pattern04" class="set-list">
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li id="pattern05" class="set-list">
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
							</ul>
						</div><!-- end product-set -->
					</div><!-- end best -->
					<div class="nerw-arrival">
						<p class="heading"><img src="/images/shop/cn/main/tit_arrival.gif" alt="???????????? NEW ARRIVAL" /></p>
						<div class="view-con">
							<span class="prev"><img src="/images/shop/cn/main/prev_off.gif" alt="prev" /></span>
							<span class="next"><img src="/images/shop/cn/main/next_on.gif" alt="next" /></span>
						</div><!-- end view-con -->
						<div class="product-set">
							<ul class="main">
								<li>
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">?????????/KIEHL S</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li>
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li>
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li>
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
								<li>
									<ul>
										<li class="first-child">
											<div class="photo">
												<p class="pic"><a href="#"><img src="/images/shop/cn/main/160X160.gif" alt="" /></a></p>
												<p class="best"><img src="/images/shop/cn/main/best_one.png" alt="best1" /></p>
											</div><!-- end photo -->
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/main/80X8001.gif" alt="" /></a></p>
											<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
											<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
											<p class="price">
												<span>$79</span>
												<span>(??? ???485)</span>
											</p>
										</li>
									</ul>
								</li>
							</ul>
						</div><!-- end product-set -->
					</div><!-- end new -->
				</div><!-- end best-new -->
				<div class="popular">
					<div class="navi">
						<p><img src="/images/shop/cn/main/popular.gif" alt="????????????" /></p>
						<ul>
							<li class="on"><a href="#pop01">????????????</a></li>
							<li><a href="#pop02">GUCCI</a></li>
							<li><a href="#pop03">??????T??????</a></li>
							<li><a href="#pop04">?????????</a></li>
							<li><a href="#pop05">????????????</a></li>
							<li><a href="#pop06">?????????</a></li>
						</ul>
					</div><!-- end navi -->
					<div class="list-popular">
						<ul id="pop01">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
						<ul id="pop02">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
						<ul id="pop02">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
						<ul id="pop03">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
						<ul id="pop04">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
						<ul id="pop05">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
						<ul id="pop06">
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
							<li>
								<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
								<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
								<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
								<p class="price">
									<span>$79</span>
									<span>(??? ???485)</span>
								</p>
							</li>
						</ul>
					</div><!-- end list-basic -->
				</div><!-- end popular -->
				<div class="sale-brand-list">
					<div class="sale-section">
						<p class="title"><img src="/images/shop/cn/main/tit_salebrand.gif" alt="???????????? SALE BRAND" /></p>
						<div class="brand-wrap">
							<div class="view-con">
								<span class="prev"><img src="/images/shop/cn/main/mf_left_arrow.gif"  alt="prev" /></span>
								<span class="next"><img src="/images/shop/cn/main/mf_right_arrow.gif"  alt="next" /></span>
							</div><!-- end view-con -->
							<div class="list-wrap">
								<ul>
									<li class="on"><span><a href="#"><img src="/images/shop/cn/main/120X65.gif" alt="DAKS" /></a></span></li>
									<li><span><a href="#"><img src="/images/shop/cn/main/120X65.gif" alt="DAKS" /></a></span></li>
									<li><span><a href="#"><img src="/images/shop/cn/main/120X65.gif" alt="DAKS" /></a></span></li>
									<li><span><a href="#"><img src="/images/shop/cn/main/120X65.gif" alt="DAKS" /></a></span></li>
									<li><span><a href="#"><img src="/images/shop/cn/main/120X65.gif" alt="DAKS" /></a></span></li>
									<li><span><a href="#"><img src="/images/shop/cn/main/120X65.gif" alt="DAKS" /></a></span></li>
								</ul>
							</div><!-- end list-wrap -->
						</div><!-- end brand-wrap -->
						<div class="sale-listing">
							<ul>
								<li class="first-child"><img src="/images/shop/cn/main/banner_brand.gif" alt="?????????/DAKS 30~40% ?????????????????????" /></li>
								<li>
									<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
									<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
									<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
									<p class="price">
										<span>$79</span>
										<span>(??? ???485)</span>
									</p>
								</li>
								<li>
									<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
									<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
									<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
									<p class="price">
										<span>$79</span>
										<span>(??? ???485)</span>
									</p>
								</li>
								<li>
									<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
									<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
									<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
									<p class="price">
										<span>$79</span>
										<span>(??? ???485)</span>
									</p>
								</li>
								<li>
									<p class="photo"><a href="#"><img src="/images/shop/cn/main/thum_img01.gif" alt="" /></a></p>
									<p class="brand"><a href="#">??????????????????/ELIZABETH ARDEN</a></p>
									<p class="product-name"><a href="#">?????? CLX???????????????????????? 30capsX3</a></p>
									<p class="price">
										<span>$79</span>
										<span>(??? ???485)</span>
									</p>
								</li>
							</ul>
						</div><!-- end sale-list -->
					</div><!-- end sale-section -->
				</div><!-- end sale-brand -->
				<div class="roll-banner">
					<div class="view-con">
						<span class="prev"><img src="/images/shop/cn/main/roll_prev.gif" alt="prev" /></span>
						<span class="next"><img src="/images/shop/cn/main/roll_next.gif" alt="next" /></span>
					</div><!-- end view-con -->
					<ul>
						<li><a href="#"><img src="../../images/shop/cn/main/roll01.gif" alt="" /></a></li>
						<li><a href="#"><img src="../../images/shop/cn/main/roll02.gif" alt="" /></a></li>
						<li><a href="#"><img src="../../images/shop/cn/main/roll03.gif" alt="" /></a></li>
					</ul>
				</div><!-- end roll-banner -->
				<div class="guide">
					<div class="guide-info01">
						<p class="tit">????????????</p>
						<p class="telnum"><img src="/images/shop/cn/main/tel_num.gif"  alt="1577- 0161 ?????????????????? 9:30 - 18:30 ?????????????????? 9:30 - 20:00 " /></p>
						<ul>
							<li><a href="#"><img src="/images/shop/cn/main/ico_cust01.gif"  alt="????????????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/ico_cust02.gif"  alt="1:1??????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/ico_cust03.gif"  alt="?????????????????????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/ico_cust04.gif"  alt="????????????????????????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/ico_cust05.gif"  alt="????????????" /></a></li>
						</ul>
					</div><!-- end guide-info -->
					<div class="guide-info02">
						<div class="tit-box">
							<p class="tit">????????????</p>
							<p class="btn"><a href="#"><img src="/images/shop/cn/main/btn_more.gif"  alt="??????" /></a></p>
						</div>
						<ul>
							<li><a href="#">?????????????????????????????????</a></li>	
							<li><a href="#">????????????????????????????????????...</a></li>	
							<li><a href="#">?????????????????????????????????...</a></li>	
							<li><a href="#">?????????????????????????????????</a></li>	
							<li><a href="#">???????????????????????????</a></li>	
							<li><a href="#">??????????????????????????????</a></li>	
						</ul>
					</div><!-- end guide-info02 -->
					<div class="main-banner-area">
						<ul>
							<li><a href="#"><img src="/images/shop/cn/main/main_banner01.gif"  alt="?????????????????????" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/main/main_banner02.gif"  alt="????????????????????????????????????" /></a></li>
						</ul>
					</div><!-- end main-banner-area -->
				</div><!-- end guide -->
			</div><!-- end main -->
			
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/newquickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>