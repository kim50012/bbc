<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/plan.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<link href="/css/bestseller.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript" src="/js/jquery/plan.js"></script>
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
					<div class="product-list">
						<div class="list-table listing" id="small">
							<table summary="상품 정보전달 이미지 브랜드/상품명 제품번호 상품펼 가격 담기/구매 메뉴로 구성된 표">
								<caption>상품 리스트</caption>
								<colgroup>
									<col width="119px" />
									<col width="464px" />
									<col width="95px" />
									<col width="95px" />
									<col width="222px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first-child">商品图片</th>
										<th scope="col">品牌/商品名</th>
										<th scope="col">商品评价</th>
										<th scope="col">价格</th>
										<th scope="col">加入/购买</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first-child">
											<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p>
										</td>
										<td class="explain">
											<p class="icon">
												<img src="//image.ssgdfs.com/images/shop/product/list/sIcon01.gif" alt="sale" />
												<img src="//image.ssgdfs.com/images/shop/product/list/sIcon02.gif" alt="best" />
												<img src="//image.ssgdfs.com/images/shop/product/list/sIcon03.gif" alt="new" />
												<img src="//image.ssgdfs.com/images/shop/product/list/sIcon04.gif" alt="사은품" />
												<img src="//image.ssgdfs.com/images/shop/product/list/sIcon04.gif" alt="쿠폰" />
											</p>
											<p class="brand"><a href="#">[KIEHL'S]</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL 125ML</a></p>
											<span class="ref-no"><span>REF_NO</span> : S0666610</span>
										</td>
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
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约 ￥54,970)</span>
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
				</div>
			</div><!-- end plan -->
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>