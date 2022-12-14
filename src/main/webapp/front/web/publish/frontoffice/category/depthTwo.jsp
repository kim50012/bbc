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
<script type="text/javascript" src="/js/jquery/category.js"></script>
<script type="text/javascript" src="/js/jquery/pattern_search.js"></script>
<!-- <script type="text/javascript" src="/js/jquery/productlist.js"></script> -->
<script type="text/javascript">
jQuery(function($){
	
	$(".view-select").selectbox();

	$(".depth-select").selectbox();

	$(".list-basic .photo").mouseover(function(){
		single = $(this).find("ul").attr("class");
		if(single == "link-menu"){
			$(this).find(".link-menu").show();
		} 
		$(this).find("span").show();
	}).mouseout(function(){
		if(single == "link-menu"){
			$(this).find(".link-menu").hide();
		} 
		$(this).find("span").hide();
	});

	   $(".link-menu li").mouseover(function(){
		   $(".link-menu li").each(function(){
				$(this).removeClass("on");
			});
			$(this).addClass("on");
    });

	var banner = $(".banner-menu ul li a");
		/*** ?????? ?????? ?????? ?????? ***/
		banner
		.everyTime(5000, 'banner', function(i) {
			if(i > 0) {
				idx = i % banner.size();
				banner.eq(idx).click();
			}
		});
		/*** ?????? ????????? ??? mouseover ***/

		banner.mouseout(function(){
			var tagTxt = $(this).attr("href");
			bannerStart(tagTxt);
		
		});
		/*** ?????? ?????? ***/
		banner.mouseover(function(){
			banner.stopTime();
			bannerClick($(this));
		});
		/*** ???????????? ***/
		$("div.banner .view-con span.stop").click(function(){
			banner.stopTime();
			imgReplace($(this));
			
			
		});
		/*** ???????????? ***/
		$("div.banner .view-con span.play").click(function(){
			bannerpoi = $(".banner-menu ul").find(" li.selected a").attr("href");
			bannerStart(bannerpoi);
			imgReplace($(this));
			
		});
		/*** ?????? ??????  ***/
		banner.click(function(){
			bannerClick($(this));
			return false;
		});
		/***  banner click ?????? ***/

		bannerClick = function(obj){
			$(".banner-list ul li").stop().animate({"opacity" : 0} , 400);
			$(".banner-menu ul li").attr("class" , "");
			obj.parent().attr("class" , "selected");
			$(obj.attr("href")).stop().animate({"opacity" : "1"} , 500);
			$(obj.attr("href")).css({"z-index" : "3"});
			return false;
		};
		/*** ?????? ?????????  ***/
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
		
		/* ????????? ??????*/
		
		imgReplace = function(obj){
			$(".banner .view-con span").each(function(){
				$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			});
			obj.find("img").attr("src" , obj.find("img").attr("src").replace("_off.gif" , "_on.gif"));
		}

		// best-banner

		$(".best-banner ul li p.title").click(function(){
			$(".best-banner ul li p.banner").hide();
			$(this).next().show();
		});

		// ???????????? ??????

		$(".best-navi ul li a").click(function(){
				$(".best-navi ul li").attr("class" , "");
				$(".best-product ul.single").hide()
				$($(this).attr("href")).show();
				$(this).parent().attr("class" , "selected");
				return false;
		});

		//tab-view 

		$(".brand-best ul.cate-tab li a").click(function(){
			$("ul.cate-tab li").attr("class" , "");
			tabView($(this));
			return false;
		});

		$(".brand-best ul.sort-menu li a").click(function(){
			$("ul.sort-menu li").attr("class" , "");
			tabView($(this));
			return false;
		});
		tabView = function(obj){
			$(".brand-best ul.single").hide();
			$(obj.attr("href")).show();
			obj.parent().attr("class" , "on");
		}
});
</script>
</head>
<body >
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="depth-title">
				<p class="category-title"><img src="/images/shop/cn/category/category01.gif" alt="?????????" /></p>
				<!-- 0811 <div class="page-location">~</div>??? ??????-->
				<div class="page-location">
					<ul>
						<li>??????</li>
						<li>
							<select class="depth-select">
								<option>111111111111</option>
							</select>
						</li>
					</ul>
				</div><!-- end page-location -->
			</div><!-- end  depth-title -->
			<div  class="category">
				<div class="best-five">
					<p  class="title"><img src="/images/shop/cn/category/best_five.gif" alt="??????BEST" /></p>
					<div class="list-basic">
						<ul class="list">
							<li>
								<div class="info">
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
							<li>
								<div class="info">
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
							<li>
								<div class="info">
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
							<li>
								<div class="info">
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
							<li>
								<div class="info">
									<p class="icon">
										<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
										<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
										<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
										<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
				</div><!-- end best-banner -->
				<div class="depth-menu">
					<dl>
						<dt><img src="/images/shop/cn/category/categoryS01.png"  alt="?????????" /></dt>
						<dd>
							<ul class="first-child">
								<li class="on"><a href="#sub-depth01">??????</a></li>
								<li><a href="#sub-depth02">???????????? </a></li>
								<li><a href="#sub-depth03">??????</a></li>
								<li><a href="#sub-depth04">??????/??????</a></li>
								<li><a href="#sub-depth05">????????????</a></li>
								<li><a href="#sub-depth06">????????????</a></li>
								<li><a href="#sub-depth07">??????</a></li>
								<li><a href="#sub-depth08">??????</a></li>
							</ul>
							<ul class="sub-depth">
								<li>
									<ul id="sub-depth01">
										<li class="on"><a href="#">??????</a></li>
										<li><a href="#">?????????</a></li>
										<li><a href="#">??????</a></li>
										<li><a href="#">??????</a></li>
										<li><a href="#">??????</a></li>
										<li><a href="#">????????????</a></li>
										<li><a href="#">????????????</a></li>
										<li><a href="#"> ??????</a></li>
										<li><a href="#">??????</a></li>
										<li><a href="#">??????/?????????</a></li>
										<li><a href="#">???????????? </a></li>
										<li><a href="#">????????????</a></li>
									</ul>
								</li>
							</ul>
						</dd>
					</dl>
				</div><!-- end depth-menu -->
				<div class="pattern-search">
					<table>
						<caption>??????/?????? ??????</caption>
						<colgroup>
							<col width="100px" />
							<col width="700px" />
							<col width="200px" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="colgroup" colspan="2" class="title">
									<p class="title">????????????</p>
									<p class="btn"><span><img src="/images/shop/cn/category/btn_search_detail.gif" alt="????????????/????????????" /></span></p>
								</th>
								<!-- 0810 rowspan="4"??? ??????-->
								<td rowspan="3" class="range-search">
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
								<th scope="row">????????????</th>
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
								<th scope="row">??????</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="sex01" />
											<label for="sex01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="sex02" />
											<label for="sex02">??????</label>
										</li>
										<li>
											<input type="checkbox" id="sex03" />
											<label for="sex03">??????</label>
										</li>
										<!-- 0810 ?????? ?????? -->
									</ul>
								</td>
							</tr>
							<!-- 0810 <td class="color">~</td>??? ??????-->
							<tr>
								<th scope="row">??????</th>
								<td class="color">
									<ul>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="color01" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????????</label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????? </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????? </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????? </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">?????? </label>
										</li>
										<li>
											<input type="checkbox" id="color02" />
											<label for="color01">??????</label>
										</li>
									</ul>
								</td>
							</tr>
							<!-- //<td class="color">~</td>??? ??????-->
							<tr class="option">
								<th scope="row">??????</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="benefit01" />
											<label for="benefit01">??????</label>
										</li>
										<li>
											<input type="checkbox" id="benefit02" />
											<label for="benefit02">??????</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th>????????????</th>
								<td class="result" colspan="2">
									<div class="selected-item">
										<ul>
											<li>ANNA SUI<span><img src="//image.ssgdfs.com/images/shop/guide/remove.jpg" alt="X" /></span></li>
											<li>ANNA SUI<span>X</span></li>
										</ul>
										<p><a href="#">????????????</a></p>
									</div><!-- end selected-item -->
									<p><input type="image" src="/images/shop/cn/category/btn_search.gif" alt="??????" /></p>
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end pattern-search -->
				<div class="product-list">
				<div class="pager">
						<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="??????" /></a>
						<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="??????" /></a>
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
						<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="??????" /></a>
						<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="?????????" /></a>
						<p class="counter"><span>1</span>/<span class="total">100</span></p>
					</div><!-- end pager -->
				<div class="list-con">
					<div class="list-sort">
						<ul>
							<li class="first-child selected"><a href="#">?????????</a></li>
							<li><a href="#">?????????????????????</a></li>
							<li><a href="#">??????????????????</a></li>
							<li><a href="#">???????????????</a></li>
							<li><a href="#">???????????????</a></li>
							<li><a href="#">???????????????</a></li>
						</ul>
					</div><!-- end list-sort -->
					<div class="list-view-con">
						<div class="list-pattern">
							<p><a href="#basic" class="on">?????????</a></p>
							<p><a href="#small">?????????</a></p>
						</div>
						<div class="select-wrap">
							<select class="view-select" title="????????? ??? ?????? ??????">
								<option>1?????????60???</option>
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
										<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
										<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
					<div class="list-table listing" id="small">
						<table summary="?????? ???????????? ????????? ?????????/????????? ???????????? ????????? ?????? ??????/?????? ????????? ????????? ???">
							<caption>?????? ?????????</caption>
							<colgroup>
								<col width="119" />
								<col width="369" />
								<col width="95" span="3" />
								<col width="222px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="first-child">??????</th>
									<th scope="col">??????/?????????</th>
									<th scope="col">REF_NO</th>
									<th scope="col">?????????</th>
									<th scope="col">????????????</th>
									<th scope="col">??????/??????</th>
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
											<img src="/images/shop/cn/common/t_icon04.gif" alt="??????" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="?????????" />
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
										<p class="total-count">(101???)</p>
									</td>
									<td>
										<p class="price">
											<span class="origin">$80</span>
											<span class="us-currency">$39</span>
											<span class="nation-currency">(???54,970)</span>
										</p>
									</td>
									<td class="order">
										<ul>
											<li>	
												<span>
													<img src="/images/shop/cn/product/list/linking_menu01_off.gif" alt="??????" />
												</span>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu02_off.gif" alt="????????????" />
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu03_off.gif" alt="????????????" />
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu04_off.gif" alt="?????????" />
												</a>
											</li>
											<li>
												<a href="#">
													<img src="/images/shop/cn/product/list/linking_menu05_off.gif" alt="????????????" />
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
					<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="??????" /></a>
					<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="??????" /></a>
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
					<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="??????" /></a>
					<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="?????????" /></a>
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