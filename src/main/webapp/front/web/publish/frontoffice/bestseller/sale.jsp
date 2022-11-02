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
				<a href="#">主页 </a><span>&gt;</span><strong>礼品馆</strong>
			</div>
			<div class="sale-container">
				<div class="saletab-box">
					<ul>
						<li class="on"><a href="#"><img src="/images/shop/cn/bestseller/sale_tab01_on.gif" alt="打折商品" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/bestseller/sale_tab02_off.gif" alt="查看全部打折商品" /></a></li>
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
						<ul>
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
					<div class="text-list">
						<div class="list-box">
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
						</div>
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
				<div class="seller-product-box02">
					<ul class="seller-tab-box">
						<li class="tab-on"><a href="#"><img src="/images/shop/cn/colorzone/color_tab01_on.gif" alt="化妆品" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab02_off.gif" alt="香水" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab03_off.gif" alt="包/钱包" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab04_off.gif" alt="手表/饰品" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab05_off.gif" alt="时尚/配饰" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab06_off.gif" alt="电子产品" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab07_off.gif" alt="食品" /></a></li>
						<li><a href="#"><img src="/images/shop/cn/colorzone/color_tab08_off.gif" alt="韩国品牌" /></a></li>
					</ul>
					<div class="seller-product-box">									
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
											</ul>
										</td>
									</tr>
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
						<p class="seller-title">最终分类名里共有 <span>1,298</span>件商品。</p>
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
				</div><!-- end seller-product-box02 -->
			</div><!-- end seller-container -->
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>