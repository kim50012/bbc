<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript">
jQuery(function($){
	
	/* selectbox */	
	$("#color").selectbox();
	$("#size").selectbox();
	$("#weight").selectbox();
	$("#capacity").selectbox();
	$(".lately-regi").selectbox();
	
	$(".depth-select").selectbox();
		
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<p class="list-counter"><span>最终分类名里共有 <span class="num">1,298</span>件商品.</span></p>
			<div class="product-list">
				<div class="pager">
					<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/cn/common/btn_page_first.gif" alt="처음" /></a>
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
					<p class="counter"><span>1</span>/<span class="total">100</span></p>
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
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS01.gif" alt="sale" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS02.gif" alt="best" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS03.gif" alt="new" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS04.gif" alt="赠品" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS05.gif" alt="打折券" />
									</p>
									<p class="photo">
										<a href="#" title="ULTRA FACIAL 125ML"><img src="//image.ssgdfs.com/images/shop/cn/product/list/temp_image.gif" alt="" /></a>
										<span><img src="//image.ssgdfs.com/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
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
									<p class="photo"><img src="//image.ssgdfs.com//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p>
								</td>
								<td class="explain">
									<p class="icon">
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS01.gif" alt="sale" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS02.gif" alt="best" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS03.gif" alt="new" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS04.gif" alt="赠品" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS05.gif" alt="打折券" />
									</p>
									<p class="brand"><a href="#">[KIEHL'S]</a></p>
									<p class="product-name"><a href="#">ULTRA FACIAL 125ML</a></p>
									<span class="ref-no"><span>REF_NO</span> : S0666610</span>
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
												<img src="//image.ssgdfs.com/images/shop/cn/product/list/linking_menu01_off.gif" alt="预览" />
											</span>
										</li>
										<li>
											<a href="#">
												<img src="//image.ssgdfs.com/images/shop/cn/product/list/linking_menu02_off.gif" alt="商品比较" />
											</a>
										</li>
										<li>
											<a href="#">
												<img src="//image.ssgdfs.com/images/shop/cn/product/list/linking_menu03_off.gif" alt="关注商品" />
											</a>
										</li>
										<li>
											<a href="#">
												<img src="//image.ssgdfs.com/images/shop/cn/product/list/linking_menu04_off.gif" alt="购物车" />
											</a>
										</li>
										<li>
											<a href="#">
												<img src="//image.ssgdfs.com/images/shop/cn/product/list/linking_menu05_off.gif" alt="立即购买" />
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
					<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음" /></a>
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
				<div class="list-basic">
					<ul class="single">
						<li class="first-child">
							<p class="icon">
								<img src="//image.ssgdfs.com/images/shop/cn/common/IconS01.gif" alt="sale" />
								<img src="//image.ssgdfs.com/images/shop/cn/common/IconS02.gif" alt="best" />
								<img src="//image.ssgdfs.com/images/shop/cn/common/IconS03.gif" alt="new" />
								<img src="//image.ssgdfs.com/images/shop/cn/common/IconS04.gif" alt="사은품" />
								<img src="//image.ssgdfs.com/images/shop/cn/common/IconS05.gif" alt="쿠폰" />
							</p>
							<div class="photo">
								<a href="#" title="ULTRA FACIAL 125ML">
									<img src="//image.ssgdfs.com/images/shop/cn/product/list/temp_image.gif" alt="상품명" />
								</a>
								<span class="prdtPreview" value="03450000101"><img src="//image.ssgdfs.com/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
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
			</div><!-- [D] //product-list 추가 -->
   
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
	
	<div class="layer-detail" style="display: block;">
		<div class="preview-product">
			<div class="info-product">
			<div class="photo-info">
				<ul class="social-menu">
					<li class="first-child"><a href="#"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/social02.gif" alt="twitter" /></a></li>
					<li><a href="#"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/social03.gif" alt="facebook" /></a></li>
					<li><a href="#"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/social04.gif" alt="weibo" /></a></li>
					<li>
						<span><img src="//image.ssgdfs.com/images/shop/cn/product/detail/icon_like.gif" alt="good" /></span>
						<span class="count">4759</span>
					</li>
				</ul>
				<div class="zoom-product">
					<a href="//image.ssgdfs.com/images/shop/product/detail/big_img01.gif" rel="selected" class="jqzoom">
					<img src="//image.ssgdfs.com/images/shop/product/detail/big_photo01.gif" alt="" /></a>
				</div><!-- end zoom-product -->
				<!-- 0929 이미지 추가 -->
				<p class="large-view">
					<a href="#">鼠标悬停在图片上面，可以放大图片。</a>
					<a href="#"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_detail_vew.gif" alt="详细信息" /></a>
				</p>
				<!-- //0929 이미지 추가 -->
				<div class="pattern-list">
					<div class="view-con">
						<span class="prev"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_pad_prev.gif" alt="prev" /></span>
						<span class="next"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_pad_next.gif" alt="next" /></span>
					</div><!-- end view-con -->
					<div class="pattern-wrap">
						<ul>
							<li>
								<a href="javascript:void(0);" rel="{gallery: 'selected' , smallimage:'//image.ssgdfs.com/images/shop/product/detail/middle01.jpg', largeimage: '//image.ssgdfs.com/images/shop/product/detail/big_img01.jpg'}">
									<img src="//image.ssgdfs.com/images/shop/product/detail/small_img01.jpg" alt="" />
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" rel="{gallery: 'selected' , smallimage:'//image.ssgdfs.com/images/shop/product/detail/middle02.jpg', largeimage: '//image.ssgdfs.com/images/shop/product/detail/big_img02.jpg'}">
									<img src="//image.ssgdfs.com/images/shop/product/detail/small_img02.jpg" alt="" />
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" rel="{gallery: 'selected' , smallimage:'//image.ssgdfs.com/images/shop/product/detail/middle03.jpg', largeimage: '//image.ssgdfs.com/images/shop/product/detail/big_img03.jpg'}">
									<img src="//image.ssgdfs.com/images/shop/product/detail/small_img03.jpg" alt="" />
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" rel="{gallery: 'selected' , smallimage:'//image.ssgdfs.com/images/shop/product/detail/middle04.jpg', largeimage: '//image.ssgdfs.com/images/shop/product/detail/big_img04.jpg'}">
									<img src="//image.ssgdfs.com/images/shop/product/detail/small_img04.jpg" alt="" />
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" rel="{gallery: 'selected' , smallimage:'//image.ssgdfs.com/images/shop/product/detail/middle05.jpg', largeimage: '///image.ssgdfs.comimages/shop/cn/product/detail/big_img05.jpg'}">
									<img src="//image.ssgdfs.com/images/shop/product/detail/small_img05.jpg" alt="" />
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" rel="{gallery: 'selected' , smallimage:'//image.ssgdfs.com/images/shop/product/detail/middle05.jpg', largeimage: '//image.ssgdfs.com/images/shop/product/detail/big_img05.jpg'}">
									<img src="//image.ssgdfs.com/images/shop/product/detail/small_img05.jpg" alt="" />
								</a>
							</li>
						</ul>
					</div><!-- end pattern-wrap -->
				</div><!-- end pattern-list -->						
			</div><!-- end photo-info -->
			
			
			
			
						
						<!-- 0929 미리보기수정 -->
						
						<form action="#">
						<fieldset>
							<legend>주문전 선택 서식</legend>
							<div class="info-explain">
								<div>
									<p class="icon">
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS01.gif" alt="打折" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS02.gif" alt="BEST" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS03.gif" alt="NEW" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS04.gif" alt="赠品" />
										<img src="//image.ssgdfs.com/images/shop/cn/common/IconS05.gif" alt="打折券" />
									</p>
									<p class="detail-top-title">[중문브랜드명]<span>영문브랜드명</span></p>
									<p class="detail-top-txt">
										Perfectionist [CP+R] Wrinkle Lifting/Firming Serum 100ml Perfectionist [CP+R] Wrinkle Lifting/Firming Serum 100ml
									</p>
								</div>
								<div class="option-choice">
									<table summary="商品">
										<caption>商品</caption>
										<colgroup>
											<col width="95px;" />
											<col width="270px;" />
										</colgroup>
										<tfoot>
											<tr>
												<!-- 0927 총합계금액 -->
												<th scope="row">总合计金额</th>
												<td>
													<span class="origin">$12,123.00</span>
													<strong class="change">(￦1,102,345)</strong>
												</td>
											</tr>
										</tfoot>
										<tbody>
											<tr>
												<th scope="row"><p class="product-num"><span>REF. NO</span></p></th>
												<td>S066610</td>
											</tr>
											<tr>
												<th scope="row" class="sell-price">商品咨询</th>
												<td class="sell-price">051-000-0000</td>
											</tr>
											<tr>
												<th scope="row" class="sell-price">销售价</th>
												<td class="sell-price">
													<span>$123(￦12,345)</span>
													<!-- 할인전 판매가격은 class="s-price" 추가 -->
													<span class="s-price">$123(￦12,345)</span>
												</td>
											</tr>
											<tr>
												<th scope="row" class="discount">折扣价</th>
												<td class="discount">
													 <span class="us">$47</span>
													 <span class="nation">(￦100,000)</span>
													 <span class="rate">(1%<span class="down">↓</span>)</span>
												</td>
											</tr>
											
											<!-- 비회원 -->
											<tr>
												<th scope="row" class="member">会员等级/会员价</th>
												<td class="member">
													<a href="#"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_login.gif" alt="登陆" /></a>
													<a href="#"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_cacl.gif" alt="计算器" /></a>
												</td>
											</tr>
											<!-- //비회원 -->
											
											<!-- 회원 -->
											 <tr>
												<th scope="row" class="member grade">Honours VIP</th>
												<td class="member">
													<span class="us-currency">
														$152
														<a href="#">
															<img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_cacl.gif" alt="计算器" />
														</a>
													</span>
													<span>(￦300,052)</span>
												</td>
											</tr>
											<!-- //회원 -->
											<tr>
												<th scope="row" class="rate">积分 </th>
												<td class="rate">
													<div class="save-rate">
														<strong class="origin">￦1,234</strong> 可立即使用  积分介绍
													</div><!-- end save-rate -->
												</td>
											</tr>											
											<!--
												비회원
											<tr>
												<th scope="row" class="rate">적립금</th>
												<td class="member">￦</td>
											</tr>
											 -->
											<tr>
												<th scope="row" class="coupon">打折券</th>
												<td class="coupon">
													<div class="down-list">
														<ul>
															<li><a href="#">4월 벗꽃놀이 쿠폰 $47(1%<span>↓</span>)</a></li>
															<li><a href="#">4월 벗꽃놀이 쿠폰 $47(1%<span>↓</span>)</a></li>
														</ul>
														<div class="link-view">
															<p class="coupon-down"><a href="#">下载优惠券</a></p>
															<p class="more-view"><a href="#">more</a></p>
														</div>
													</div><!-- end dwon-list -->
												</td>
											</tr>
											<!-- 사이즈 -->
											<tr>
												<th scope="row" class="product-option">尺寸</th>
												<td class="product-option">
													<select id="size" title="请选择。">
														<option>请选择。</option>
													</select>
												</td>
											</tr>
											
											
											<!-- 무게 -->
											<tr>
												<th scope="row" class="product-option">重量</th>
												<td class="product-option">
													<select id="weight" title="请选择。">
														<option>请选择。</option>
													</select>
												</td>
											</tr>
											
											
											<!-- 컬러 -->
											<tr>
												<th scope="row" class="product-option">颜色</th>
												<td class="product-option">
													<select id="color" title="请选择。">
														<option>请选择。</option>
														<option>111</option>
														<option>222</option>
														<option>333</option>
													</select>				
												</td>
											</tr>
											
											
											<!-- 용량 -->
											<tr>
												<th scope="row" class="product-option">规格</th>
												<td class="product-option">
													<select id="capacity" title="请选择。">
														<option>请选择。</option>
													</select>
												</td>
											</tr>
											
											
											<!-- 수량 -->
											<tr>
												<th scope="row" class="num">数量</th>
												<td class="num">
													<div>
														<ul>
															<li class="selected"><a href="#">1</a></li>
															<li><a href="#">2</a></li>
															<li><a href="#">3</a></li>
															<li><a href="#">4</a></li>
															<li><a href="#">5</a></li>
														</ul>
														<p class="number">
															<input type="text" />
															<span class="plus"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_plus.gif" alt="plus" /></span>
															<span class="minus"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_minus.gif" alt="minus" /></span>
														</p>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="button-group">
									<span><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_direct_buy.gif" alt="立即购买" /></span>
									<a href="#go-basket"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_basket.gif" alt="购物车" /></a>
									<a href="#go-wish"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_wish_list.gif" alt="关注商品" /></a>
								
								</div><!-- end button-group -->
								<!-- 일시품절 -->
								<div class="sold-out" style="display:none;">
									<p>
										<img src="//image.ssgdfs.com/images/shop/cn/product/detail/soldout_txt01.gif" alt="很抱歉，该商品一时断货" />
									</p>
									<p class="comment">
										商品咨询请利用页面下方的<span>商品Q&amp;A。</span>
									</p>
								</div>
								
								
								<!-- 판매중지 -->
								<div class="sold-out sold-out01" style="display:none;">
									<p>
										<img src="//image.ssgdfs.com/images/shop/cn/product/detail/soldout_txt02.gif" alt="很抱歉，该商品已停止销售。" />
									</p>
									<p class="comment">
										商品咨询请利用页面下方的<span>商品Q&amp;A。</span>
									</p>
								</div>
							</div><!-- end sold-out -->
						</fieldset>
					</form>
					
					
					<!-- //0929 미리보기수정 -->
					
					
</div><!-- end info-product -->
		</div><!-- end preview-product -->
	</div><!-- end layer-detail -->
		
</div><!-- end wrapper -->
</body>
</html>

