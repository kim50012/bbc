<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/bestseller.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<link href="/css/patternsearch.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.gzoom.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript" src="/js/jquery/pattern_search.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation">  
				<p class="title"><img src="/images/shop/cn/common/title_sale.gif" alt="打折商品展" /></p>
				<a href="#">主页 </a><span>&gt;</span><strong>打折商品</strong>
			</div>
			<div class="sale-container">
				<div class="gifttab-box">
					<ul>
						<li class="on"><a href="#"><img src="/images/shop/cn/bestseller/plan_tab01_on.gif" alt="Beauty" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/bestseller/plan_tab02_off.gif" alt="季节" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/bestseller/plan_tab03_off.gif" alt="主题" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/bestseller/plan_tab04_off.gif" alt="赠送赠品" /></a></li>
					</ul>
				</div>
				<div class="seller-product-box">
					<div class="tab-all">
						<p class="img-txt">
							<span><a href="#"><img src="/images/shop/cn/bestseller/btn_imglist.gif" alt="图片型目录" /></a>
							<a href="#"><img src="/images/shop/cn/bestseller/btn_textlist.gif" alt="文本型目录" /></a></span>
						</p>
						<p class="page-num">
							<span class="page-all"><span class="on">1</span>/<span>20</span></span>
							<a href="#"><img src="/images/shop/cn/bestseller/btn_prev.gif" alt="previous" /></a>
							<a href="#"><img src="/images/shop/cn/bestseller/btn_next.gif" alt="next" /></a>
						</p>
						<a href="#" class="all-pro"><img src="/images/shop/cn/bestseller/btn_all_product.gif" alt="查看全部目录+" /></a>
					</div>
					<!-- 이미지형 -->
					<div class="img-list">
						<ul class="show-box">
							<li><a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner01.gif" alt="banner" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/brand/banner02.gif" alt="banner" /></a></li>
						</ul>
					</div>
					<!-- 리스트형 -->
					<div class="text-list show-box">
						<table summary="세일 목록" >
							<caption>세일 목록</caption>
							<colgroup>
								<col width="750px" />
								<col width="249px" />
							</colgroup>
							<tbody>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
								<tr>
									<th><a href="#">打折商品打折商品打折商品打折商品打折商品打折商品打折商品</a></th>
									<td><span>0000.00.00-0000.00.00</span></td>
								</tr>
							</tbody>
						</table>
					</div><!-- text-list -->
					<!-- style="background:#ededed;" 영역확인용 지워주세요~ -->
					<p class="big-img" style="background:#ededed;"><img src="/images/shop/cn/brand/banner03.gif" alt="image" /></p>
					<h3>KENZO<span>(100)</span></h3>
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
					<div class="list-basic listing">
						<ul>
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
					<div class="pager">
						<a href="#" class="first"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="previous" /></a>
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
						<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="next" /></a>
						<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="last" /></a>
					</div><!-- end pager -->
				</div><!-- end seller-product-box -->
			</div><!-- end seller-container -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>