<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<link href="/css/patternsearch.css" rel="stylesheet" type="text/css" />
<link href="/css/brand.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.scrollTo-min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.slider.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript" src="/js/jquery/pattern_search.js"></script>
<script type="text/javascript" src="/js/jquery/brand.js"></script>
<script type="text/javascript">
jQuery(function($){
	$(".pattern-search").hide();
	$("#item01").show();
	$(".result-char-set").hide();
	$("#alpa01").show();

	var tabSearch = $(".section-search .tab-menu li");

	tabSearch.find("a").click(function(){
		$(".pattern-search").hide();
		tabSearch.attr("class" , "");
		$(this).parent().attr("class" , "selected");
		$($(this).attr("href")).show();
		return false;
	});
	var charSearch = $(".char-con .char-menu ul li");
	charSearch.find("a").click(function(){
		$(".result-char-set").hide();
		tabSearch.attr("class" , "");
		$(this).parent().attr("class" , "selected");
		$($(this).attr("href")).show();
		return false;
	});


		$(".btn").click(function(){
			$("ul").append(html);
			$(window).scrollTo( "100000", 800, {queue:true} );
			return false;
		});
		var html = "";
		 html += '<li>';
		 html += '<p class="icon">';
		 html += '<img src="/images/shop/cn/product/list/icon_sale.gif" alt="sale" />';
		 html += '<img src="/images/shop/cn/product/list/icon_best.gif" alt="best" />';
		 html += '<img src="/images/shop/cn/product/list/icon_new.gif" alt="new" />';
	 	 html += '<img src="/images/shop/cn/product/list/icon_gift.gif" alt="사은품" />';
		 html += '<img src="/images/shop/cn/product/list/icon_gift.gif" alt="쿠폰" />';
		 html += '</p>';
		 html += '<div class="photo">';
		 html += '<a href="#" title="ULTRA FACIAL 125ML">';
		 html += '<img src="/images/shop/cn/product/list/160X160.gif" alt="상품명" />';
	 	 html += '</a>';
		 html += '<span><a href="#"><img src="/images/shop/cn/product/list/link_preview.png" alt="미리보기" /></a></span>';
		 html += '<ul class="link-menu">';
		 html += '<li class="menu01 on"><a href="#">미리보기</a></li>';
		 html += '<li class="menu02"><a href="#">관심상품</a></li>';
		 html += '<li class="menu03"><a href="#">장바구니</a></li>';
	 	 html += '<li class="menu04"><a href="#">바로구매</a></li>';
		 html += '</ul>';
		 html += '</div><!-- end photo -->';
		 html += '<p class="brand"><a href="#">[KIEHLS]</a></p>';
		 html += '<p class="product-name"><a href="#">ULTRA FACIAL 125ML</a></p>';
		 html += '<p class="price">';
		 html += '<span class="origin">$80</span>';
		 html += '<span class="us-currency">$39</span>';
		 html += '<span class="nation-currency">(￦54,970원)</span>';
		 html += '</p>';
		 html += '</li>';
	$(".product-list .more-view span").click(function(){
		$(this).parent().parent().find("div.list-basic ul").append(html);
		$(window).scrollTo( "100000", 800, {queue:true} );
	});
	
	$(".brand-event .more-view").click(function(){
        $("div.brand-event dl").css({"overflow": "visible" });  
    });


});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation">  
				<p class="title"><img src="/images/shop/cn/common/title_brand.gif" alt="新世界网上免税店 Brand " /></p>
				<a href="#">主页</a><span>&gt;</span><a href="#">品牌</a><span>&gt;</span><strong>品牌名</strong>
			</div>
			<div class="brand">
				<div class="char-search">
					<form action="#">
					<fieldset>
						<legend>철자별 브랜드 검색</legend>	
						<div class="char-con">
							<p class="title"><img src="/images/shop/cn/brand/title_brand_list.gif" alt="BRAND LIST" /></p>
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
							<p class="link-nation">
								<a href="#"><img src="/images/shop/cn/brand/btn_korea_brand.gif" alt="韩国品牌" /></a>
							</p>
						</div><!-- end char-con -->
						<div class="big-box">
							<div class="result-brand">
								<div class="result-char-set" id="alpa01">
									<p class="result-char">C</p>
									<p class="result-char-k" style="display:none;">국내<br />브랜드</p>
									<div class="listing-result">
										<ul>
											<li class="selected"><span><a href="#">AAAAAAAAAAA</a></span></li>
											<li><span><a href="#">WWWWWWWWWWW</a></span></li>
											<li><span><a href="#">WWWWWWWWWWW</a></span></li>
											<li><span><a href="#">WWWWWWWWWWW</a></span></li>
											<li><span><a href="#">WWWWWWWWWWW</a></span></li>
											<li><span><a href="#">WWWWWWWWWWW</a></span></li>
											<li><span><a href="#">WWWWWWWWWWW</a></span></li>
										</ul>
									</div><!-- end listing-result -->
								</div><!-- end result-char-set -->
							</div><!-- end result-brand -->
						</div><!-- end big-box -->
					</fieldset>
					</form>
				</div><!-- end char-search -->
				<div class="store-intro">
					<div class="store-banner">
						<a href="#"><img src="/images/shop/cn/brand/temp_store_banner.gif" alt="CLINIQUE" /></a>
					</div><!-- end store-banner -->
				</div><!-- end store-intro -->
				<p class="title-best"><img src="/images/shop/cn/brand/s_title01.gif" alt="各品牌人气商品" /></p>
				<div class="list-basic">
					<ul class="single">
						<li class="first-child">
							<p class="icon">
								<img src="/images/shop/cn/common/IconS01.gif" alt="sale" />
								<img src="/images/shop/cn/common/IconS02.gif" alt="best" />
								<img src="/images/shop/cn/common/IconS03.gif" alt="new" />
								<img src="/images/shop/cn/common/IconS04.gif" alt="사은품" />
								<img src="/images/shop/cn/common/IconS05.gif" alt="쿠폰" />
							</p>
							<div class="photo">
								<a href="#" title="ULTRA FACIAL 125ML">
									<img src="/images/shop/cn/product/list/temp_image.gif" alt="상품명" />
								</a>
								<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								<ul class="link-menu">
									<li class="menu01 on"><a href="#">미리보기</a></li>
									<li class="menu02"><a href="#">관심상품</a></li>
									<li class="menu03"><a href="#">장바구니</a></li>
									<li class="menu04"><a href="#">바로구매</a></li>
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
				<div class="freebie">
					<h3 class="num"><img src="/images/shop/cn/brand/s_title02.gif" alt="赠品" /></h3>
					<div class="occasion">
						<ul class="ceremony-listing">
							<li>
								<div class="ceremony">
									<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/detail/150X150.gif" alt="사은행사 상품명" /></p>
									<div class="ceremony-info">
										<p class="title">伊丽莎白雅顿/ELIZABETH ARDEN</p>
											<p class="condition">雅顿 CLX黄金导航面部胶囊
											<span class="ceremony-item">30capsX3 / 42ml (再生&保湿&弹性)</span></p>
											<p class="ceremony-term">2013.07~2013.09.10</p>
									</div><!-- end ceremony-info -->
								</div><!-- end ceremony -->
								<div class="list-ceremony">
									<ul>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div>
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL
													ULTRA FACIAL
												</p>
											</div><!-- end div -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div>
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL ULTRA FACIAL
												</p>
											</div><!-- end div -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div>
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL ULTRA FACIAL
												</p>
											</div><!-- end div -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div>
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL ULTRA FACIAL
												</p>
											</div><!-- end div -->
										</li>
									</ul>
								</div><!-- end list-ceremony -->
							</li>
						</ul>
				
					</div><!-- [D] 0906 누락된 div추가 -->
				</div><!-- end freebie -->
				<h3><img src="/images/shop/cn/brand/s_title03.gif" alt="品牌活动" /></h3>
				<div class="relation-plan">
					<table summary="기획전명과 기간을 명시하는 표">
						<caption>관련기획전</caption>
						<colgroup>
							<col width="70px" />
							<col width="730px" />
							<col width="200px" />
						</colgroup>
						<tbody>
							<tr>
								<td><p><img src="/images/shop/cn/event/btn_ing.gif" alt="正在进行" /></p></td>
								<td class="selected"><a href="#"><span>[댓글이벤트]</span> 클라란스 댓글 이벤트 당첨자</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
							<tr>
								<td><p><img src="/images/shop/cn/event/btn_end.gif" alt="已结束" /></p></td>
								<td><a href="#"><span>[댓글이벤트]</span> 클라란스 댓글 이벤트 당첨자</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end relation-plan-->
				<h3><img src="/images/shop/cn/brand/s_title04.gif" alt="品牌企划" /></h3>
				<div class="relation-plan">
					<table summary="기획전명과 기간을 명시하는 표">
						<caption>관련기획전</caption>
						<colgroup>
							<col width="800px" />
							<col width="200px" />
						</colgroup>
						<tbody>
							<tr>
								<td class="selected"><a href="#">기획전 타이틀이 들어갑니다.</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
							<tr>
								<td><a href="#">기획전 타이틀이 들어갑니다.</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
							<tr>
								<td><a href="#">기획전 타이틀이 들어갑니다.</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
							<tr>
								<td><a href="#">기획전 타이틀이 들어갑니다.</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end relation-plan-->
				<h3><img src="/images/shop/cn/brand/s_title05.gif" alt="只能在实体店铺购买的商品" /></h3>
				<!-- 0826 class="plan-depth" 추가 -->
				<div class="relation-plan plan-depth">
					<table summary="기획전명과 기간을 명시하는 표">
						<caption>관련기획전</caption>
						<colgroup>
							<col width="350px" />
							<col width="140px" />
							<col width="350px" />
							<col width="140px" />
						</colgroup>
						<tbody>
							<tr class="category-table">
								<td class="selected"><a href="#">1depth 카테고리명</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
								<td><a href="#">1depth 카테고리명</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
							<tr class="category-table">
								<td><a href="#">1depth 카테고리명</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
								<td><a href="#">1depth 카테고리명</a></td>
								<td class="date">2013.04.25~2013.05.15</td>
							</tr>
							<tr class="no-product-txt">
								<td colspan="4">没有只能在实体店铺购买的商品。</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end relation-plan-->
				<!-- 
				<div class="brand-category-menu">
					<ul>
						<li class="on"><a href="#">化妆品</a></li>
						<li><a href="#">香水</a></li>
					</ul>
				</div>
				
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
				</div> --><!-- end depth-menu -->
				
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
											<!-- 0826 remove 이미지 경로 변경 -->
											<li>ANNA SUI<span><img src="/images/shop/cn/category/remove.jpg" alt="X" /></span></li>
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
						<a href="#" class="first"><img src="/images/shop/cn/common/btn_page_first.gif" alt="처음" /></a>
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
										<img src="/images/shop/cn/common/IconS01.gif" alt="sale" />
										<img src="/images/shop/cn/common/IconS02.gif" alt="best" />
										<img src="/images/shop/cn/common/IconS03.gif" alt="new" />
										<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
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
									<th scope="col" class="first-child">이미지</th>
									<th scope="col">브랜드/상품명</th>
									<th scope="col">REF_NO</th>
									<th scope="col">상품평</th>
									<th scope="col">가격</th>
									<th scope="col">담기/구매</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="first-child">
										<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p>
									</td>
									<td class="explain">
										<p class="icon">
											<img src="/images/shop/cn/common/IconS01.gif" alt="sale" />
											<img src="/images/shop/cn/common/IconS02.gif" alt="best" />
											<img src="/images/shop/cn/common/IconS03.gif" alt="new" />
											<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
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
			</div><!-- end brand -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>