<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>

<link rel="stylesheet" href="/css/main_cn.css" type="text/css"   />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/cn_main_banner.css" rel="stylesheet" type="text/css" />




<script src="/js/cn/jquery-1.4.2.min.js" type="text/javascript"></script>









<script type="text/javascript">
jQuery(function($){

	    //1뎁스 이벤트
		$(".new-planning .view-con > ul > li").mouseover(function(){
			var target = $(".new-planning .view-con > ul > li");
			target.children("span").removeClass("selected");
			target.children("ul").hide();
			//진행중인 이벤트 스톱
			target.find("ul > li > a").stopTime();
			bannercon = $(this);
			bannercon.find("span").addClass("selected");
			bannercon.find("ul").show();
		}).mouseout(function(){
			$(".view-con ul li ul").hide();
			bannercon = $(this);
			bannercon.find("ul li a").everyTime(3000, 'banner', function(i) {
				if(i > 0) {
					var idx = parseInt(Math.random() * 100 % (bannercon.find("ul li a").size()));
					bannercon.find("ul li a").eq(idx).click();
				}
			});

		});
		//2뎁스 이벤트
		$(".new-planning .view-con > ul > li ").mouseover(function(){
			var target = $(this).find("a");
			target.stopTime();
			bannerClick(target);
		});
		
		//2뎁스 클릭이벤트
		$(".new-planning  .view-con > ul > li > a").click(function(){
			bannerClick($(this));
		});
		
		//클릭함수
		 bannerClick = function(obj){
			$(".new-planning ul.plan-list li").stop().animate({"opacity" : 0} , 400);;
			$(".new-planning  .view-con ul li  a").attr("class" , "");
			obj.addClass("on");
			$(obj.attr("href")).stop().animate({"opacity" : "1"} , 500);
			return false;
		};

		//이벤트시작
		// 트리거는 이벤트 밑에..
		var menuno = parseInt(Math.random() * 100 % 8);
		var target = $(".new-planning  .view-con > ul > li:eq("+menuno+")");
		target.find("span").addClass("selected");
		target.trigger("mouseout");

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

		$(".main-banner").mouseleave(function(){
			$("div.depth").stop().animate({"left" : "-704px"});
			category.each(function(){
				$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.png" , "_off.png"));
			});
		});


		var autoEvbanner = $("div.plan-banner div.event-banner");
		var mds = $("div.mds");

	
			autoEvbanner.everyTime(5000, 'autoEvbanner', function(i) {
				autoEvbanner.find("div.play-con span.play").click();
			});
			mds.everyTime(5000, 'mds', function(i) {
				mds.find("div.play-con span.play").click();
			});
		


		var bannerCnt = 0;

		// 세일 배너
		$("div.sale-banner .view-con span").click(function(){
			bannerMotion($(this));
		});

		// 이벤트 배너
		autoEvbanner.find(".play-con span.play").click(function(){
			bannerMotion($(this));
		});

		// mds choice 
		mds.find(".play-con span.play").click(function(){
			bannerMotion($(this));
		});
		
		// 좌우 이동 공통 
		
		bannerMotion = function(obj){
			bannerCnt--;
			if(bannerCnt < 0)
			bannerCnt = obj.parent().parent().find("div.section-wrap ul li").size() - 1;
			bannerCnt = bannerCnt % (obj.parent().parent().find("div.section-wrap ul li").size());
			obj.parent().parent().find("div.section-wrap ul li").hide();
			obj.parent().parent().find("div.section-wrap ul li:eq("+ bannerCnt +")").show();
		}

		
		/* animation 슬라이드 열기 닫기*/

		$(".main-section .event-banner p.title").mouseenter(function(){
			$(this).next().animate({"left" : "249px"});
			$(this).next().find("span").click(function(){
				$(this).parent().stop().animate({"left" : "-760px"});
				$(this).parent().prev().find("img").attr("src" , $(this).parent().prev().find("img").attr("src").replace("_on.gif" , "_off.gif "));;
			});
			$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_off.gif" , "_on.gif "));;
		});
		
		
		// 기획전 메뉴
		
		$(".plan-navi ul li").mouseover(function(){
			
			$(".plan-navi ul li").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif "));;
			});
			$(".plan-navi ul li").attr("class" , "");
			$("div.plan-set li").hide();
			$($(this).attr("href")).show();
			$(this).attr("class" , "selected");
			$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_off.gif" , "_on.gif "));;
		});

		// rolling auto banner

		$(".roll-list").jCarouselLite({
			btnNext: ".banner-roll .view-con .next",
			btnPrev: ".banner-roll .view-con .prev",
			auto: 800,
			speed: 1000,
			scroll: 1,
			vertical: true
		});
		// 신상품 롤링
		$(".arrival-list").jCarouselLite({
			btnNext: ".arrival .view-con .next",
			btnPrev: ".arrival .view-con .prev",
			scroll: 3,
			speed: 1000
		});
		// 뎁스 메뉴 마우스 오버
		$(".depth-menu ul li span").mouseover(function(){
			$(".depth-menu ul li").attr("class" , "");
			$(this).parent().attr("class" , "on");
			$(this).parent().find("ul").show();
		});
			
		$('.auto-complete dd').jScrollPane({showArrows: true});

		// top-banner close 

		$(".main-top-banner span").click(function(){
			$(this).parent().hide();
		});
});
</script>










<script src="/js/cn/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="/js/cn/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="/js/cn/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="/js/cn/jquery.cnmainbanner.js" type="text/javascript" ></script>
<script src="/js/cn/jquery-1.7.min.js" type="text/javascript"></script>





<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/masonry.pkgd.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.imagesloaded.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/plan_main.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>




<script src="/js/cn/jquery.ssgdfs_mainbanner.js" type="text/javascript"></script>
<script src="/js/cn/jquery.pointbanner.js" type="text/javascript"></script>
<script src="/js/cn/jquery-ui.min.js" type="text/javascript"></script>
<script src="/js/cn/jquery.scrollTabMenu.js" type="text/javascript"></script>
<script src="/js/cn/jquery.acc.rolling.js" type="text/javascript"></script>
<script src="/js/cn/jquery.fnews.js" type="text/javascript"></script>
<script src="/js/cn/jquery.banner.js" type="text/javascript" ></script>
<script src="/js/cn/jquery-imgrolleffect.js" type="text/javascript" ></script>

</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
		
			<!-- content S -->
			<div id="content">
				<!-- main_banner_cn S -->
				<div class="main_visual_banner">
					<ul>
						<li class="menu_navi">
							<div class="main">
								<div class="navi-banner">
									<div class="main-banner">
										<ul class="main">
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate01_off.png"  alt="화장품" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a></p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a></p> 
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a></p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate02_off.png" alt="향수" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list02.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list02.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list02.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list02.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate03_off.png" alt="가방/지갑" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate04_off.png" alt="시계/악세사리" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate05_off.png" alt="패션/잡화" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a></p> 
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate06_off.png" alt="전자제품" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate07_off.png" alt="식품" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list03.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
											<li><span class="cate"><a href="#"><img src="/images/shop/cn/main/new_cate08_off.png" alt="국내브랜드" /></a></span>
												<div class="depth">
													<div class="depth-menu">
														<ul>
															<li>
																<span><a href="#">基础护理</a></span>
																<ul>
																	<li>
																		<a href="#">化妆水</a>
																		<ul>
																			<li><a href="#">ANNA SUI</a></li>
																			<li><a href="#">BIODERMA/BIODERMA</a></li>
																			<li><a href="#">BIOTHERM</a></li>
																			<li><a href="#">BURT’S BEES</a></li>
																			<li><a href="#">CARITA</a></li>
																			<li><a href="#">DELLECX-C</a></li>
																			<li><a href="#">CLARINS</a></li>
																			<li><a href="#">CLINIQUE</a></li>
																			<li><a href="#">DIOR</a></li>
																			<li><a href="#">DR.SKIN</a></li>
																		</ul>
																	</li>
																	<li><span><a href="#">乳液</a></span></li>
																	<li><span><a href="#">精华</a></span></li>
																	<li><span><a href="#">面霜</a></span></li>
																	<li><span><a href="#">眼部护理</a></span></li>
																	<li><span><a href="#">唇部护理</a></span></li>
																	<li><span><a href="#">弹力</a></span></li>
																	<li><span><a href="#">美白</a></span></li>
																	<li><span><a href="#">面膜/面贴膜</a></span></li>
																	<li><span><a href="#">免税专用</a></span></li>
																	<li><span><a href="#">护肤套装</a></span></li>
																</ul>
															</li>
															<li><span><a href="#">彩妆</a></span></li>
															<li><span><a href="#">洁面/防晒</a></span></li>
															<li><span><a href="#">身体护理</a></span></li>
															<li><span><a href="#">头部护理</a></span></li>
															<li><span><a href="#">男士</a></span></li>
															<li><span><a href="#">儿童</a></span></li>
														</ul>

													</div><!-- end depth-menu -->
													<div class="relation-list">
															<div class="main_img_list_tit">
																<img src="/images/shop/cn/main/tit_brand_best.gif"  alt="brand best." />
															</div>
															 <!-- main Image List --->
															<ul class="main_img_list">
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a></p> 
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															<li>
																<p><a href="#"><img src="/images/shop/cn/main/temp_main_img_list04.gif"  alt="" /></a></p>
																<p><a href="#" class="p_name">科颜氏/KIEHL S</a> <a href="#" class="p_info">ULTRA FACIAL</a> </p>
																<p><a href="#" class="p_price">$22(约 ￥135)</a></p>
															</li>
															</ul>
															<!-- main Image List --->
													</div><!-- end reation-list -->
												</div><!-- end depth -->
											</li>
										</ul>
									</div><!-- end main-banner -->
									
								</div><!-- end navi-banner -->
						
						</li>
						<li class="main_visual_banner">
							<!-- cn_main_banner S -->
							<div class="main-popular-plan">
								<div class="main-plan">
									<div class="view-con">
										<span class="play"><img src="//image.ssgdfs.com/images/shop/plan/btn_play.gif" alt="play" /></span>
										<span class="stop"><img src="//image.ssgdfs.com/images/shop/plan/btn_stop.gif" alt="stop" /></span>
									</div><!-- end view-con -->
		
									
									<div class="plan-menu menu-type01">
										<ul>
											<li class="selected"><a href="#plan01">鞋垫电子</a></li>
											<li><a href="#plan02">鞋垫电子</a></li>
											<li><a href="#plan03">鞋垫电子</a></li>
											<li><a href="#plan04">鞋垫电子</a></li>
										</ul>
									</div><!-- end plan-menu menu-type01 -->
									 
									<div class="plan-list">
										<ul>
											<li id="plan01"><a href="#"><img src="//image.ssgdfs.com/images/shop/plan/temp_banner01.jpg" alt="기획전내용"  width="500px" height="400px" /></a></li>
											<li id="plan02"><a href="#"><img src="//image.ssgdfs.com/images/shop/plan/temp_banner02.jpg" alt="기획전내용"  width="500px" height="400px"  /></a></li>
											<li id="plan03"><a href="#"><img src="//image.ssgdfs.com/images/shop/plan/temp_banner03.jpg" alt="기획전내용"   width="500px" height="400px"  /></a></li>
											<li id="plan04"><a href="#"><img src="//image.ssgdfs.com/images/shop/plan/temp_banner04.jpg" alt="기획전내용"  width="500px" height="400px"  /></a></li>
										</ul>
									</div><!-- end plan-list -->
								</div><!-- end main-plan -->
								
							</div><!-- end main-popular-plan -->
							<!-- cn_main_banner E -->
						</li>
						<li class="n_block"><a href="#"><img src="/images/shop/cn/main/main_v_banner01.gif" alt="" /></a></li>
						<li class="n_block"><a href="#"><img src="/images/shop/cn/main/main_v_banner02.gif" alt="" /></a></li>
						<li class="n_block"><a href="#"><img src="/images/shop/cn/main/main_v_banner03.gif" alt="" /></a></li>
						<li class="n_block">
							<img src="/images/shop/cn/main/main_v_banner04.gif" alt="" />
						</li>
					</ul>
				</div>
				<!-- main_banner_cn E -->
				
				<!-- f_banner S -->
				<div class="f_banner" >
					<ul>
					<li>
						<a href="#"><img src="/images/shop/cn/main/main_f_banner01.gif" alt="" width="248px;"/></a>
					</li>
					<li>
						<a href="#"><img src="/images/shop/cn/main/main_f_banner02.gif" alt="" width="248px;" /></a>
					</li>
					<li>
						<a href="#"><img src="/images/shop/cn/main/main_f_banner03.gif" alt="" width="248px;" /></a>
					</li>
					<li class="last_banner">
						<a href="#"><img src="/images/shop/cn/main/main_f_banner04.gif" alt="" width="248px;" /></a>
					</li>
					</ul>
				</div>
				<!-- f_banner E -->
	
	
				<!-- tab_list_bx S -->
				
					<div class="tab_list_bx">
					
					<div class="tab_tit_bx">
						<div class="tab_tit">
							<p><img src="/images/shop/cn/main/tit_kpmall.gif" alt="韩国鞋垫产品 KOREA PRODUCT MALL "/></p>
						</div>
					</div>
					<div id="scrollTabs">
						<div id="scrollTabs_tab_container">
							<a style="width:218px; text-align:center;">美容产品选择热点问题 GET IT BEAUTY</a>
							<a style="width:218px; text-align:center;">鞋垫电子</a>
							<a style="width:220px; text-align:center;">玩累护肤化妆品</a>
						</div>
	
	
						<div id="scrollTabs_content_container" style="clear:both">
							<div id="scrollTabs_content_inner">
								<div class="scrollTabs_content">
									<ul class="t_list">
										<li>
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											
										</li>
										<li>
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											
										</li>
										<li class="last_p">
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											</a>
										</li>
									</ul>
								</div>
								<div class="scrollTabs_content">
									<ul class="t_list">
										<li>
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											
										</li>
										<li>
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											
										</li>
										<li class="last_p">
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											</a>
										</li>
									</ul>
								</div>
								<div class="scrollTabs_content">
									<ul class="t_list">
										<li>
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											
										</li>
										<li>
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											
										</li>
										<li class="last_p">
											<a href="#">
											<img src="/images/shop/cn/main/p_img01.gif" alt="" />
											</a>
											<a href="#" class="ps_name">兰蔻/LANCOME</a>
											<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a>
											<a href="#" class="price">$ 175(约 ￥1,075)</a>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div style="clear:both"></div>
					</div>
	
	
	
					<script type="text/javascript">
					$(function(){
						$("#scrollTabs").scTabs({
							autoOrder	: true,         //자동 롤링 설정
							autoplayInterval : 3000,    //자동 재생시 롤링 속도 (3000=3초)  
							animSpeed : 300,            //스크롤 스피드  
							initialTab	: 0,            //시작 탭 (0=첫번째) 
							autoHeight : false,          //세로 크기 자동 조정(false시 style에서 높이 설정값으로 적용)   
							animation :	"easeInOutExpo",//애니메이션 타입
							direction :	"horizontal",   // horizontal가로  vertical세로
							onEvent : "click"      //mouseenter(마우스 오버시 탭 이동) 또는 click(클릭시 탭 이동)
						});
					});
	
					</script>
	
				</div>
				<!-- tab_list_bx E -->
	
	
	
	
	
	
	
				<div class="acc_ctn_bx">
	
	
					<div class="acc_contents_wrap">
	
	
						<!--첫번째 아이템-->
						<div class="acc_contents">
							<!--메뉴바-->
							<div class="barmenu">
								<img class="off" src="/images/shop/cn/main/menu_off_01.png" alt=""/><!--비활성 이미지-->
	
							</div>
							<!--내용박스 및 아이콘-->
							<div class="mainbox">
								<div class="thumnail_img"><img class="thumb" src="/images/shop/cn/main/icon01.png" alt="" /></div><!--비활성 이미지-->
								<!-- Image List -->
								<div class="acc_img_list">
									<ul>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim2.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim3.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim4.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim5.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim6.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									</ul>
								</div>
								<!-- Image List -->
	
							</div>
						</div>
	
						<!--두번째 아이템-->
						<div class="acc_contents">
							<div class="barmenu">
								<img class="off" src="/images/shop/cn/main/menu_off_02.png" alt=""/>
							</div>
							<div class="mainbox">
								<div class="thumnail_img"><img class="thumb" src="/images/shop/cn/main/icon02.png" alt="" /></div>
								<!-- Image List -->
								<div class="acc_img_list">
									<ul>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim2.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim3.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim4.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim5.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim6.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									</ul>
								</div>
								<!-- Image List -->
							</div>
						</div>
	
						<!--세번째 아이템-->
						<div class="acc_contents">
							<div class="barmenu">
								<img class="off" src="/images/shop/cn/main/menu_off_03.png" alt=""/>
							</div>
							<div class="mainbox">
								<div class="thumnail_img"><img class="thumb" src="/images/shop/cn/main/icon03.png" alt="" /></div>
								<!-- Image List -->
								<div class="acc_img_list">
									<ul>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim2.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim3.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim4.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim5.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim6.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									</ul>
								</div>
								<!-- Image List -->
							</div>
						</div>
	
						<!--네번째 아이템-->
						<div class="acc_contents">
							<div class="barmenu">
								<img class="off" src="/images/shop/cn/main/menu_off_04.png" alt=""/>
							</div>
							<div class="mainbox">
								<div class="thumnail_img"><img class="thumb" src="/images/shop/cn/main/icon04.png" alt="" /></div>
								<!-- Image List -->
								<div class="acc_img_list">
									<ul>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim2.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim3.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim4.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim5.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim6.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									</ul>
								</div>
								<!-- Image List -->
							</div>
						</div>
	
						<!--다섯째 아이템-->
						<div class="acc_contents">
							<div class="barmenu">
								<img class="off" src="/images/shop/cn/main/menu_off_05.png" alt=""/>
							</div>
							<div class="mainbox">
								<div class="thumnail_img"><img class="thumb" src="/images/shop/cn/main/icon05.png" alt="" /></div>
								<!-- Image List -->
								<div class="acc_img_list">
									<ul>
									<li>
	
										<a href="#"><img src="/images/shop/cn/main/thkim.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim2.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim3.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim4.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim5.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									<li>
										<a href="#"><img src="/images/shop/cn/main/thkim6.gif" width="78" height="78" alt="" /></a>
										<a href="#" class="ps_name">科颜氏/KIEHL S</a><br/>
										<a href="#" class="ps_info">ULTRA FACIAL</a><br/>
										<a href="#" class="price">$22(约 ￥135)</a>
									</li>
									</ul>
								</div>
								<!-- Image List -->
							</div>
						</div>
					</div>
	
					<div class="acc_banner">
						<a href="#"><img src="/images/shop/cn/main/50p.gif" alt="" /></a>
					</div>
	
	
					<!-- acc_list_point S -->
					<div class="acc_list_point">
						<div id="slideshow2" class="point_banner_wrapper">
							<div class="wrapper-Num"></div>
						   
								<!-- 컨텐츠 반복 -->
								<div  class="point_wrapper-li" out="images/point_off.png" over="images/point_on.png"  rel='0' >
									<a href="#"><img src="/images/shop/cn/main/p_list.gif" alt="" /></a>
								</div>
								 <!-- 컨텐츠 반복 -->
	
								  <!-- 컨텐츠 반복 -->
								<div  class="point_wrapper-li"  out="images/point_off.png" over="images/point_on.png"  rel='1'>
								<a href="#"><img src="/images/shop/cn/main/p_list02.gif" alt="" /></a>		 
								</div>
								 <!-- 컨텐츠 반복 -->
	
								  <!-- 컨텐츠 반복 -->
								<div  class="point_wrapper-li"  out="images/point_off.png" over="images/point_on.png"  rel='2'>
								<a href="#"><img src="/images/shop/cn/main/p_list.gif"  alt="" /></a>
								</div>
								 <!-- 컨텐츠 반복 -->
	
								
						   
					 </div>
					<script type="text/javascript">
					 $(window).load(function() {  
						   var options = {};
							options['animSpeed'] = 10; //애니시간
							options['pauseTime'] = 3000; //대기시간
							options['moveType'] = 'fade'; //이동방향   top or bottom
							options['tailType'] = 'images'; //tail 버튼   number or images
							$("#slideshow2").pointlisteFfect(options);
					 });
					 
					</script>
					</div>
					<!-- acc_list_point E -->
	
				</div>
	
	
	
	
	
	
	

	
				<div class="bestseller_bx">
					<div class="bestseller_ctn">
						<div class="tit_cn"><img src="/images/shop/cn/main/tit_bestseller.gif" alt="畅销商品 BESTSELLER" /></div>
						<div class="bestseller_ctn_bx">
							<div class="best-product">
								<div class="tab-menu">
									<ul>
										<li class="selected w01"><a href="#"><img src="/images/shop/cn/main/tab01_on.gif" alt="化妆品" /></a></li>
										<li class="w02"><a href="#"><img src="/images/shop/cn/main/tab02_off.gif" alt="香水" /></a></li>
										<li class="w03"><a href="#"><img src="/images/shop/cn/main/tab03_off.gif" alt="包/钱包" /></a></li>
										<li class="w04"><a href="#"><img src="/images/shop/cn/main/tab04_off.gif" alt="食品" /></a></li>
										<li class="w05"><a href="#"><img src="/images/shop/cn/main/tab05_off.gif" alt="韩国品牌" /></a></li>
									</ul>
								</div><!-- end tab-menu -->
								
								<div id="section01" class="ranking">
									<!-- Image List -->
									<div class="best_img_list">
										<ul>
										<li>
											<p><a href="#"><img src="/images/shop/cn/main/thkim.gif"  alt="" /></a></p>
											<p><a href="#" class="ps_name">伊丽莎白雅顿/ELIZABETH ARDEN</a></p>
											<p><a href="#" class="ps_info">雅顿 CLX黄金导航面部胶囊</a></p>
											<p><a href="#" class="ps_info">30capsX3 / 42ml (再生&保湿&弹性) </a></p>
											<p><a href="#" class="price">$79(约 ￥485)</a></p>
										</li>
										<li>
											<p><a href="#"><img src="/images/shop/cn/main/thkim2.gif"  alt="" /></a> </p>
											<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
											<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
											<p><a href="#" class="price">$22(约 ￥135)</a> </p>
										</li>
										<li>
											<p><a href="#"><img src="/images/shop/cn/main/thkim3.gif"  alt="" /></a></p>
											<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
											<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
											<p><a href="#" class="price">$22(约 ￥135)</a> </p>
										</li>
										<li>
											<p><a href="#"><img src="/images/shop/cn/main/thkim4.gif"  alt="" /></a> </p>
											<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
											<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
											<p><a href="#" class="price">$22(约 ￥135)</a> </p>
										</li>
										<li>
											<p><a href="#"><img src="/images/shop/cn/main/thkim5.gif"  alt="" /></a> </p>
											<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
											<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
											<p><a href="#" class="price">$22(约 ￥135)</a> </p>
										</li>
										</ul>
									</div>
									<!-- Image List -->
								</div><!-- end ranking -->
							</div><!-- end best-product -->
						</div>
					</div>
					<div class="arrival_ctn">
						<div class="tit_cn"><img src="/images/shop/cn/main/tit_arrival.gif" alt="新品上市 NEW ARRIVAL" /></div>
						<div class="arrival_ctn_ctl">
							<a href="#"><img src="/images/shop/cn/main/btn_arrow_left.gif"  alt="prev" /></a> <a href="#"><img src="/images/shop/cn/main/btn_arrow_right.gif"  alt="next" /></a>
						</div>
						<!-- Image List -->
						<div class="arrival_img_list">
							<ul>
							<li>
								<p><a href="#"><img src="/images/shop/cn/main/thkim.gif"  alt="" /></a></p>
								<p><a href="#" class="ps_name">伊丽莎白雅顿/ELIZABETH ARDEN</a></p>
								<p><a href="#" class="ps_info">雅顿 CLX黄金导航面部胶囊</a></p>
								<p><a href="#" class="ps_info">30capsX3 / 42ml (再生&保湿&弹性) </a></p>
								<p><a href="#" class="price">$79(约 ￥485)</a></p>
							</li>
							<li>
								<p><a href="#"><img src="/images/shop/cn/main/thkim2.gif"  alt="" /></a> </p>
								<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
								<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
								<p><a href="#" class="price">$22(约 ￥135)</a> </p>
							</li>
							<li>
								<p><a href="#"><img src="/images/shop/cn/main/thkim3.gif"  alt="" /></a> </p>
								<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
								<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
								<p><a href="#" class="price">$22(约 ￥135)</a> </p>
							</li>
							<li>
								<p><a href="#"><img src="/images/shop/cn/main/thkim4.gif"  alt="" /></a> </p>
								<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
								<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
								<p><a href="#" class="price">$22(约 ￥135)</a> </p>
							</li>
							<li>
								<p><a href="#"><img src="/images/shop/cn/main/thkim5.gif"  alt="" /></a> </p>
								<p><a href="#" class="ps_name">科颜氏/KIEHL S</a> </p>
								<p><a href="#" class="ps_info">ULTRA FACIAL</a> </p>
								<p><a href="#" class="price">$22(约 ￥135)</a> </p>
							</li>
							</ul>
						</div>
						<!-- Image List -->
					</div>
				</div>
	
	
	
	
	
	
	
	
	
				<div class="slideshow-wrapper_bg">
	
				 <div class="br_list_bx">
					<div class="br_tab_tit">
						<img src="/images/shop/cn/main/tit_salebrand.gif"  alt="折扣品牌 SALE BRAND" />
					</div>
	
					<div class="sale_info">
						<img src="/images/shop/cn/main/event_sale.gif"  alt="达克斯/DAKS 30~40% 折扣销售的季节 2013.05.27 ~ 直到存货" />
					 </div>
				 </div>
	
				 
	
	
	
				 <div id="slideshow" class="slideshow-wrapper">
				 <div class="wrapper-Num">
						<div  class="wrapper-left"><p><img src="/images/shop/cn/main/mf_left_arrow.gif"  alt="" /></p></div>
						<div  class="wrapper-html"></div> 
						<div  class="wrapper-right"><p><img src="/images/shop/cn/main/mf_right_arrow.gif"  alt="" /></p></div> 
				 </div>		 
				   <div  class="slideshow-html">			  
							<!-- 컨텐츠 반복 -->
							<div  class="wrapper-li" out="images/01.jpg" over="images/01_on.jpg"  rel='0' >	
								
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
								
								
							</div>
							 <!-- 컨텐츠 반복 -->
							  <!-- 컨텐츠 반복 -->
							<div  class="wrapper-li"  out="images/02.jpg" over="images/02_on.jpg"  rel='1'>
								
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
								
								
							</div>
							 <!-- 컨텐츠 반복 -->
							  <!-- 컨텐츠 반복 -->
							<div  class="wrapper-li"  out="images/03.jpg" over="images/03_on.jpg"  rel='2'>
								
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
								
								
							</div>
							 <!-- 컨텐츠 반복 -->
							  <!-- 컨텐츠 반복 -->
							<div  class="wrapper-li"  out="images/04.jpg" over="images/04_on.jpg"  rel='3'>				
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img01.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
							</div>
							 <!-- 컨텐츠 반복 -->
	
							  <!-- 컨텐츠 반복 -->
							<div  class="wrapper-li"  out="images/05.jpg" over="images/05_on.jpg"  rel='4'>			
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
							</div>
							 <!-- 컨텐츠 반복 -->
							<!-- 컨텐츠 반복 -->
							<div  class="wrapper-li"  out="images/06.jpg" over="images/06_on.jpg"  rel='5'>			
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img03.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
							</div>
							 <!-- 컨텐츠 반복 -->
							 <!-- 컨텐츠 반복 -->
							<div  class="wrapper-li"  out="images/10.jpg" over="images/10_on.jpg"  rel='5'>			
								<ul class="br_list">
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li>
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
									<li class="last_p">
										<a href="#">
										<img src="/images/shop/cn/main/b_img02.gif" alt="" />
										<p class="ps_name">兰蔻/LANCOME</p>
										<p class="ps_info">兰蔻 精华肌底液(小黑…</p>
										<p class="price">$ 175(约 ￥1,075)</p>
										</a>
									</li>
								</ul>
							</div>
							 <!-- 컨텐츠 반복 -->
					   </div>
					 </div>
					 </div>
					<script type="text/javascript">
					 $(window).load(function() {  
						   var options = {};
							options['animSpeed'] = 1000; //애니시간
							options['pauseTime'] = 4000; //대기시간
							options['pagecut'] = 6; //페이지컷 0부터 시작
							options['moveType'] = 'fade'; //이동형태  top,bottom,fade
							options['tailType'] = 'images'; //tail 버튼   
						$("#slideshow").brdbannereFfect(options);
					 });
					 
					</script>
	
	
	
	
	
	
	
	
					<div id="tablist_banner">		  
					<div class="tablist_title">
						  <!-- 타이틀영역 -->
					</div>
					<div class="tablist_body">
						  <div class="tablist_left">
								 <div class="ssgdfs_left_tab">
										<!-- 탭영역 (클릭을위하여 li로 배치) -->
										<ul>
											<li  class="on"></li>
											<li  class="off  link" ></li>
											<li  class="off  link" ></li>
										</ul>
										<!-- 탭영역 -->						
								 </div>
								 <!-- 업체리스트 부분 -->
								 <div  class="ssgdfs_tab_menu"><ul></ul></div>
								 <!-- 업체리스트 부분 -->
						  </div>
						  <div class="tablist_adbody">
							   <div class="ad">
									
									<span class="tabname" title="光彩皮肤"></span>
										<!-- Image List -->
										<div class="img_list_tlist">
											<ul>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img01.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 1705(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 1705(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li class="last_list">
												<a href="#"><img src="/images/shop/cn/main/thum_img04.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											</ul>
										</div>
										<!-- Image List -->
	
	
							   </div>
							   <div class="ad">
									<span class="tabname" title="GUCCI"></span>
									<!-- Image List -->
										<div class="img_list_tlist">
											<ul>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif" alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li class="last_list">
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											</ul>
										</div>
										<!-- Image List -->
							   </div>
							   <div class="ad">
									<span class="tabname" title="男士T恤衫"></span>
									<!-- Image List -->
										<div class="img_list_tlist">
											<ul>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 475(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 475(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li class="last_list">
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											</ul>
										</div>
										<!-- Image List -->
	
							   </div>
							   <div class="ad">
									 <span class="tabname" title="补水霜"></span>
									<!-- Image List -->
										<div class="img_list_tlist">
											<ul>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif" alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 1005(约 ￥1,075)</a>
												</div>
											</li>
											<li class="last_list">
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											</ul>
										</div>
										<!-- Image List -->
	
							   </div>
							   <div class="ad">
									 <span class="tabname" title="有机奶粉"></span>
									<!-- Image List -->
										<div class="img_list_tlist">
											<ul>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img02.gif" alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 1175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 1275(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li class="last_list">
												<a href="#"><img src="/images/shop/cn/main/thum_img03.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											</ul>
										</div>
										<!-- Image List -->
	
	
							   </div>
							   <div class="ad">
									 <span class="tabname" title="正官庄"></span>
									<!-- Image List -->
										<div class="img_list_tlist">
											<ul>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img04.gif" alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img04.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li>
												<a href="#"><img src="/images/shop/cn/main/thum_img04.gif"   alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											<li class="last_list">
												<a href="#"><img src="/images/shop/cn/main/thum_img04.gif"  alt="" /></a>
												<div class="t_bx">
												<a href="#" class="ps_name">兰蔻/LANCOME</a><br/>
												<a href="#" class="ps_info">兰蔻 精华肌底液(小黑…</a><br/>
												<a href="#" class="price">$ 175(约 ￥1,075)</a>
												</div>
											</li>
											</ul>
										</div>
										<!-- Image List -->
							   </div>
	
							  
							
						  </div>
					</div>
			</div>
			<script type="text/javascript">
				$(window).load(function() {	
					  var options = {};
						options['animSpeed'] = 0; //애니시간
						options['pauseTime'] = 2000; //대기시간
				   $('#tablist_banner').tablisteffect(options);
			});
			</script>
	
	
	
	
	
	
	
	
	
	
	
					<div class="footer_news-wrapper_bx">
					<div id="news_slideshow" class="footer_news-wrapper">
						<p class="tit_notice"><img src="/images/shop/cn/main/tit_notice.gif"  alt="" /></p>
						 <div class="coroll">
							<ul>
								<li><img src="/images/shop/cn/main/btn_up.gif"  alt="" class="btn prev" /></li>
								<li><img src="/images/shop/cn/main/btn_down.gif" alt="" class="btn next" /></li>
							</ul>
						 </div>
								<!-- 컨텐츠 반복 -->
								<div  class="wrapper_news-li" rel='0' >				    
									<a href="#">中国语手机版开业纪念活动获奖者公布 1</a>
								</div>
								 <!-- 컨텐츠 반복 -->
	
								  <!-- 컨텐츠 반복 -->
								<div  class="wrapper_news-li" rel='1'>				
								   <a href="#">中国语手机版开业纪念活动获奖者公布 2</a>
								</div>
								 <!-- 컨텐츠 반복 -->
	
								  <!-- 컨텐츠 반복 -->
								<div  class="wrapper_news-li" rel='2'>				  
								   <a href="#">中国语手机版开业纪念活动获奖者公布 3</a>
								</div>
								 <!-- 컨텐츠 반복 -->
	
								  <!-- 컨텐츠 반복 -->
								<div  class="wrapper_news-li" rel='3'>				
								   <a href="#">中国语手机版开业纪念活动获奖者公布 4</a>
								</div>
								 <!-- 컨텐츠 반복 -->
	
								  <!-- 컨텐츠 반복 -->
								<div  class="wrapper_news-li"  rel='4'>			
								   <a href="#">中国语手机版开业纪念活动获奖者公布 5</a>
								</div>
								 <!-- 컨텐츠 반복 -->
								   <!-- 컨텐츠 반복 -->
								<div  class="wrapper_news-li"  rel='5'>			
								   <a href="#">中国语手机版开业纪念活动获奖者公布 6</a>
								</div>
								 <!-- 컨텐츠 반복 -->
						   
					 </div>
				 </div>
				<script type="text/javascript">
				 $(window).load(function() {  
					   var options = {};
						options['animSpeed'] = 1000; //애니시간
						options['pauseTime'] = 2000; //대기시간
						options['moveType'] = 'top'; //이동방향   top or bottom
					
						$("#news_slideshow").ssgdfseFfect(options);
				 });
				 
				</script>
	
	
	
	
				<div class="footer_info_bx">
					<div class="footer_info1">
						<p class="tit">
							客服中心
						</p>
						<p class="telnum">
							<img src="/images/shop/cn/main/tel_num.gif"  alt="1577- 0161 网上购物咨询 9:30 - 18:30 店铺利用咨询 9:30 - 20:00 " />
						</p>
						<ul>
						<li><a href="#"><img src="/images/shop/cn/main/ico_cust01.gif"  alt="常见问题" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/ico_cust02.gif"  alt="1:1咨询" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/ico_cust03.gif"  alt="免税店利用指南" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/ico_cust04.gif"  alt="网上购物问题解决" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/main/ico_cust05.gif"  alt="付款指南" /></a></li>
						</ul>
					</div>
					<div class="footer_info2">
						<div class="tit-box">
							<p class="tit">
								常见问题
							</p>
							<p class="btn">
								<a href="#"><img src="/images/shop/cn/main/btn_more.gif"  alt="更多" /></a>
							</p>
						</div>
							<ul>
							<li><a href="#">出国前应怎样进行取消？</a></li>	
							<li><a href="#">出国事项及会员信息变更时...</a></li>	
							<li><a href="#">订购后无法打印交换券该...</a></li>	
							<li><a href="#">如何使用优惠券和积分？</a></li>	
							<li><a href="#">可以用哪些卡付款？</a></li>	
							<li><a href="#">注册会员有什么优惠？</a></li>	
							</ul>
					</div>
					<div class="main_banner_area">
						<p class="m_banner1"><a href="#"><img src="/images/shop/cn/main/main_banner01.gif"  alt="各楼层柜台介绍" /></a></p>
						<p  class="m_banner2"><a href="#"><img src="/images/shop/cn/main/main_banner02.gif"  alt="节俭购物小贴士下载优惠券" /></a></p>
					</div>
				</div>
				
				
			</div>
 			
		</div><!-- end body -->
		
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



