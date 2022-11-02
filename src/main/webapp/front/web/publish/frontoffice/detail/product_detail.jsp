<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/detail.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.slider.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.transform2d.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/detail.js"></script>
<script type="text/javascript">
jQuery(function($){
	/*$('.rate-list').jScrollPane({showArrows: true});*/
	
	$('.card-benefit').jScrollPane({showArrows: true});
	
	
	/* selectbox */	
	$("#color").selectbox();
	$("#size").selectbox();
	$("#weight").selectbox();
	$("#capacity").selectbox();
	$(".lately-regi").selectbox();
	
	$(".depth-select").selectbox();
	

	$("div.test").hide();
	$("div.test").eq(0).show();

	$(".pattern-menu .list ul li a").click(function(){
		$("div.test").hide();
		$($(this).attr("href")).show();
	});
	
	
	
	$("table").css("z-index" ,"1");
	$("table td").css("z-index" ,"1");
	$("table td div").click(function(){
		$(this).parent().parent().parent().parent().parent().css("z-index" ,"2");	
		$(this).css("z-index" ,"10");			
	});
	$("table td div").focusout(function(){
		$(this).css("z-index" ,"1");			
	});
	$(".primeumReviewList .tit-box .select-box").css("z-index", "10");
			
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="depth-title">
				<div class="page-location">
					<ul>
						<li>主页</li>
						<li>
							<select class="depth-select">
								<option>111111111111</option>
							</select>
						</li>
						<li>
							<select class="depth-select">
								<option>111111111111</option>
							</select>
						</li>
						<li>
							<select class="depth-select">
								<option>111111111111</option>
							</select>
						</li>
					</ul>
				</div><!-- end page-location -->
			</div><!-- end  depth-title -->
			<div class="product-detail">
				<div class="info-product">
					<div class="photo-info">
						<ul class="social-menu">
							<li class="first-child"><a href="#"><img src="/images/shop/cn/product/detail/social02.gif" alt="twitter" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/product/detail/social03.gif" alt="facebook" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/product/detail/social04.gif" alt="weibo" /></a></li>
							<li>
								<span><img src="/images/shop/cn/product/detail/icon_like.gif" alt="good" /></span>
								<span class="count">4759</span>
							</li>
						</ul>
						<!-- 0823 [D] 이미지 경로 수정 -->
						<div class="zoom-product">
							<a href="//image.ssgdfs.com/images/shop/product/detail/big_img01.gif" rel="selected" class="jqzoom">
							<img src="//image.ssgdfs.com/images/shop/product/detail/big_photo01.gif" alt="" /></a>
						</div><!-- end zoom-product -->
						<p class="large-view"><a href="#">鼠标悬停在图片上面，可以放大图片。</a></p>
						<div class="pattern-list">
							<div class="view-con">
								<span class="prev"><img src="/images/shop/cn/product/detail/btn_pad_prev.gif" alt="prev" /></span>
								<span class="next"><img src="/images/shop/cn/product/detail/btn_pad_next.gif" alt="next" /></span>
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
						<!-- 0823 [D] 이미지 경로 수정 -->
						
						</div><!-- end photo-info -->
						
						
						
						
						
						
						
						<form action="#">
						<fieldset>
							<legend>주문전 선택 서식</legend>
							<div class="info-explain">
								<div>
									<p class="icon">
										<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
										<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
										<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
										<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
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
														<strong class="origin">￦1,234</strong> 可立即使用 <a href="#rate">积分介绍</a>
														<div class="layer-modal layer-large" id="rate">
															<div class="head">
																<p class="title"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/h1_save_rate.gif" alt="积分介绍" /></p>
																<p class="close"><img src="//image.ssgdfs.com/images/shop/cn/product/detail/btn_close.gif" alt="X" /></p>
															</div><!-- end head -->
															<div class="body">
																<p class="rate">
																	Family 회원 2%,<br />
																	적립금은 회원할인 후 쿠폰 적용가의 30%까지<br />
																	사용가능하며,<br />
																	적립금은 상품인도가 완료된 후 적립됩니다.
																</p>
																<p class="layer-btn"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_savemoney_go.gif" alt="적립금 바로가기" /></a></p>
															</div><!-- end body -->
														</div><!-- end layer-modal -->
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
									<span><img src="/images/shop/cn/product/detail/btn_direct_buy.gif" alt="立即购买" /></span>
									<a href="#go-basket"><img src="/images/shop/cn/product/detail/btn_basket.gif" alt="购物车" /></a>
									<a href="#go-wish"><img src="/images/shop/cn/product/detail/btn_wish_list.gif" alt="关注商品" /></a>
									<div class="layer-modal" id="go-basket">
										<div class="head">
											<p class="title"><img src="//image.ssgdfs.com/images/shop/product/detail/title_basket_in.gif" alt="购物车" /></p>
											<p class="close"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_close.gif" alt="X" /></p>
										</div><!-- end head -->
										<div class="body">
											<!-- 0927 -->
											<p>
												상품이 장바구니에 담겼습니다.<br />
												바로 확인 하시겠습니까?
											</p>
											<p class="btn">
												<a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_yes.gif" alt="yes" /></a>
												<a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_no.gif" alt="no" /></a>
											</p>
										</div><!-- end body -->
									</div><!-- end layer-modal -->
									<div class="layer-modal" id="go-wish">
										<div class="head">
											<p class="title"><img src="//image.ssgdfs.com/images/shop/product/detail/title_wish.gif" alt="关注商品" /></p>
											<p class="close"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_close.gif" alt="X" /></p>
										</div><!-- end head -->
										<div class="body">
											<p>
												상품이 위시리스트에 담겼습니다.<br />
												바로 확인 하시겠습니까?
											</p>
											<p class="btn">
												<a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_yes.gif" alt="yes" /></a>
												<a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_no.gif" alt="no" /></a>
											</p>
										</div><!-- end body -->
									</div><!-- end layer-modal -->
								</div><!-- end button-group -->
								<!-- 일시품절 -->
								<div class="sold-out" style="display:none;">
									<p>
										<img src="/images/shop/cn/product/detail/soldout_txt01.gif" alt="很抱歉，该商品一时断货" />
									</p>
									<p class="comment">
										商品咨询请利用页面下方的<span>商品Q&amp;A。</span>
									</p>
								</div>
								
								
								<!-- 판매중지 -->
								<div class="sold-out sold-out01" style="display:none;">
									<p>
										<img src="/images/shop/cn/product/detail/soldout_txt02.gif" alt="很抱歉，该商品已停止销售。" />
									</p>
									<p class="comment">
										商品咨询请利用页面下方的<span>商品Q&amp;A。</span>
									</p>
								</div>
							</div><!-- end sold-out -->
						</fieldset>
					</form>
					
					
					
					
					
						<!-- 
						<form action="#">
						<fieldset>
							<legend>주문전 선택 서식</legend>
							<div class="info-explain">
								<div>
									<p class="icon">
										<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
										<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
										<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
										<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
										<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
									</p>
									<p class="detail-top-title">[중문브랜드명]<span>영문브랜드명</span></p>
									<p class="detail-top-txt">
										Perfectionist [CP+R] Wrinkle Lifting/Firming Serum 100ml Perfectionist [CP+R] Wrinkle Lifting/Firming Serum 100ml
									</p>
								</div>
								<div class="option-choice">
									<table summary="상품의 상세정보를 설명 판매가 할인가 적립금 한인카트 할인쿠폰 정보제공 컬러 사이즈 수량을 선택 서식">
										<caption>상품 설명</caption>
										<colgroup>
											<col width="95px;" />
											<col width="270px;" />
										</colgroup>
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
												<td class="sell-price">$ 55 (\12,345)</td>
											</tr>
											
											<tr>
												<th scope="row" class="member">会员等级/会员价</th>
												<td class="member">
													<a href="#"><img src="/images/shop/cn/product/detail/btn_login.gif" alt="登陆" /></a>
													<a href="#"><img src="/images/shop/cn/product/detail/btn_cacl.gif" alt="计算器" /></a>
												</td>
											</tr>
											 <tr>
												<th scope="row" class="member grade">Honours VIP</th>
												<td class="member">
													<span class="us-currency">
														$152
														<a href="#">
															<img src="/images/shop/cn/product/detail/btn_cacl.gif" alt="알뜰계산기" />
														</a>
													</span>
													<span>(约 ￥135.33) 5%↓ </span>
												</td>
											</tr>
											
											
											<tr>
												<th scope="row" class="rate">积分 </th>
												
												<td><p class="be-login">注册新世界免税店会员，可享受优惠券、积分等多种优惠。 <a href="#">立即注册会员</a></p></td>
												 
												<td class="rate">
													<div class="save-rate">
														<strong class="origin">￦1,234</strong>可立即使用 <a href="#rate">积分介绍</a>
														
														<div class="layer-modal layer-large" style="display:none;">
															<div class="head">
																<p class="title"><img src="/images/shop/cn/product/detail/layorpopup_title.gif" alt="积分可在订购时立即使用" /></p>
																<p class="close"><img src="/images/shop/cn/product/detail/btn_close.gif" alt="X" /></p>
															</div>
															<div class="body">
																<div class="rate-list">
																	<p>可使用的积分会根据最终付款金额 发生变动。</p>
																	<p><a href="#"><img src="/images/shop/cn/product/detail/layorpopup_btn.gif" alt="立即查看积分介绍" /></a></p>
																</div>
															</div>
														</div>
													</div>
												</td>
											</tr>	
											<tr>
												<th scope="row" class="rate">적립금</th>
												<td class="member">￦</td>
											</tr>
											<tr>
												<th scope="row" class="coupon">打折券</th>
												
												<td><p class="be-login">注册新世界免税店会员，可享受优惠券、积分等多种优惠。 <a href="#">立即注册会员</a></p></td>
												
												<td class="coupon">
													<div class="down-list">
														<ul>
															<li><a href="#">4월 벗꽃놀이 쿠폰 $47(1%<span>↓</span>)</a></li>
															<li><a href="#">4월 벗꽃놀이 쿠폰 $47(1%<span>↓</span>)</a></li>
														</ul>														
														<div class="link-view">
															<p class="coupon-down"><a href="#">下载优惠券</a></p>
														</div>
													</div>
												</td>
											</tr>
											<tr class="first-select">
												<th scope="row" class="product-option">颜色</th>
												<td class="product-option">
													<select id="capacity" title="용량을 선택해주세요">
														<option>선택하세요</option>
													</select>
												</td>
											</tr>
											
											<tr>
												<th scope="row" class="product-option">尺寸</th>
												<td class="product-option">
													<select id="color" title="색상을 선택해주세요">
														<option>선택하세요</option>
														<option>111</option>
														<option>222</option>
														<option>333</option>
													</select>				
												</td>
											</tr>
											
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
															<span class="plus"><img src="/images/shop/cn/product/detail/btn_plus.gif" alt="추가" /></span>
															<span class="minus"><img src="/images/shop/cn/product/detail/btn_minus.gif" alt="감소" /></span>
														</p>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="button-group">
									<span><img src="/images/shop/cn/product/detail/btn_direct_buy.gif" alt="立即购买" /></span>
									<a href="#go-basket"><img src="/images/shop/cn/product/detail/btn_basket.gif" alt="购物车" /></a>
									<a href="#go-wish"><img src="/images/shop/cn/product/detail/btn_wish_list.gif" alt="关注商品" /></a>
									<div class="layer-modal" id="go-basket">
										<div class="head">
											<p class="title"><img src="/images/shop/cn/product/detail/title_basket_in.gif" alt="장바구니 담기" /></p>
											<p class="close"><img src="/images/shop/cn/product/detail/btn_close.gif" alt="X" /></p>
										</div>
										<div class="body">
											<p>
												상품이 장바구니에 담겼습니다.<br />
												바로 확인 하시겠습니까?
											</p>
											<p class="btn">
												<a href="#"><img src="/images/shop/cn/product/detail/btn_yes.gif" alt="예" /></a>
												<a href="#"><img src="/images/shop/cn/product/detail/btn_no.gif" alt="아니오" /></a>
											</p>
										</div>
									</div>
									<div class="layer-modal" id="go-wish">
										<div class="head">
											<p class="title"><img src="/images/shop/cn/product/detail/title_wish.gif" alt="위시리스트 담기" /></p>
											<p class="close"><img src="/images/shop/cn/product/detail/btn_close.gif" alt="X" /></p>
										</div>
										<div class="body">
											<p>
												상품이 위시리스트에 담겼습니다.<br />
												바로 확인 하시겠습니까?
											</p>
											<p class="btn">
												<a href="#"><img src="/images/shop/cn/product/detail/btn_yes.gif" alt="예" /></a>
												<a href="#"><img src="/images/shop/cn/product/detail/btn_no.gif" alt="아니오" /></a>
											</p>
										</div>
									</div>
								</div>
								
								<div class="sold-out" style="display:none;">
									<p>
										<img src="/images/shop/cn/product/detail/soldout_txt01.gif" alt="很抱歉，该商品一时断货" />
									</p>
									<p class="comment">
										商品咨询请利用页面下方的<span>商品Q&amp;A。</span>
									</p>
								</div>
								
								<div class="sold-out sold-out01" style="display:none;">
									<p>
										<img src="/images/shop/cn/product/detail/soldout_txt02.gif" alt="很抱歉，该商品已停止销售。" />
									</p>
									<p class="comment">
										商品咨询请利用页面下方的<span>商品Q&amp;A。</span>
									</p>
							</div>
						</div>
					</fieldset>
					</form>
					
					-->
					
					
					
					
					<!-- 0823 수정 -->
					<div class="benefit">
						<div class="logo-box">
							<p class="logo">
								<img src="/images/shop/cn/product/detail/temp_logo.gif" alt="logo" />
								<span>
									<a href="#"><img src="/images/shop/cn/product/detail/btn_allbrand01.gif" alt="logo" /></a>
									<a href="#"><img src="/images/shop/cn/product/detail/btn_allbrand02.gif" alt="logo" /></a>
								</span>
							</p>
							<div class="event">
								<span>企划展</span>
								<ul>
									<li>기획전 명이 들어갑니다.</li>
									<li>기획전 명이 들어갑니다.</li>
								</ul>
								<p>查看更多</p>
							</div>
							<div class="event">
								<span>活动</span>
								<ul>
									<li>이벤트 명이 들어갑니다.</li>
									<li>이벤트 명이 들어갑니다.</li>
								</ul>
								<p class="event-more">查看更多</p>
							</div>
						</div>
						<!-- //0823 수정 -->
						
						
						<!-- best -->
						<div class="best">
							<p class="tit"><img src="/images/shop/cn/product/detail/benefit_stit01.gif" alt="品牌 BEST" /></p>
							<div class="view-con">
								<span class="prev"><img src="/images/shop/cn/product/detail/btn_benefit_prev.gif" alt="prev" /></span>
								<span class="next"><img src="/images/shop/cn/product/detail/btn_benefit_next.gif" alt="next" /></span>
							</div>
							<div class="best-box">
								<ul>
									<li>
										<p class="pro-img"><img src="/images/shop/cn/product/detail/img_70x70.gif" alt="image" /></p>
										<div>
											<p class="product-tit">科颜氏/KIEHL </p>
											<p class="s-tit">FACI FACI ULTRA FACI...</p>
											<p class="price">$82</p>
											<p class="china-price">(约 ￥135)</p>
										</div>
									</li>
									<li>
										<p class="pro-img"><img src="/images/shop/cn/product/detail/img_70x70.gif" alt="image" /></p>
										<div>
											<p class="product-tit">科颜氏/KIEHL </p>
											<p class="s-tit">ULTRA FACI ULTRA FACI...</p>
											<p class="price">$22</p>
											<p class="china-price">(约 ￥135)</p>
										</div>
									</li>
								</ul>
							</div>
						</div><!-- end best -->
						<!-- best -->
						<div class="best">
							<p class="tit"><img src="/images/shop/cn/product/detail/benefit_stit02.gif" alt="分类 BEST" /></p>
							<div class="view-con">
								<span class="prev"><img src="/images/shop/cn/product/detail/btn_benefit_prev.gif" alt="prev" /></span>
								<span class="next"><img src="/images/shop/cn/product/detail/btn_benefit_next.gif" alt="next" /></span>
							</div>
							<div class="best-box">
								<ul>
									<li>
										<p class="pro-img"><img src="/images/shop/cn/product/detail/img_70x70.gif" alt="image" /></p>
										<div>
											<p class="product-tit">科颜氏/KIEHL </p>
											<p class="s-tit">FACI FACI ULTRA FACI...</p>
											<p class="price">$82</p>
											<p class="china-price">(约 ￥135)</p>
										</div>
									</li>
									<li>
										<p class="pro-img"><img src="/images/shop/cn/product/detail/img_70x70.gif" alt="image" /></p>
										<div>
											<p class="product-tit">科颜氏/KIEHL </p>
											<p class="s-tit">ULTRA FACI ULTRA FACI...</p>
											<p class="price">$22</p>
											<p class="china-price">(约 ￥135)</p>
										</div>
									</li>
								</ul>
							</div>
						</div><!-- end best -->
						<div class="card-benefit">
							<div class="card-box">
								<ul>
									<li>
										<p>卡优惠</p>
										三星卡优惠 $47 10%
									</li>
									<li>
										<p>卡优惠</p>
										三星卡优惠 $47 10%
									</li>
									<li>
										<p>卡优惠</p>
										三星卡优惠 $47 10%
									</li>
								</ul>
							</div>
						</div>
					</div><!-- end benefit -->
				</div><!-- end info-product -->
				<div class="relation-product">
					<div class="relation-tab">
						<ul>
							<li class="selected"><a href="#relation01">相关商品</a></li>
							<li><a href="#relation02">预览此商品的顾客一同购买的商品</a></li>
						</ul>
					</div><!-- end relation-tab -->
					<div class="relation-list">
						<div class="view-con">
							<span class="prev"><img src="/images/shop/cn/product/detail/btn_prev.gif" alt="이전" /></span>
							<span class="next"><img src="/images/shop/cn/product/detail/btn_rel_next.gif" alt="다음" /></span>
						</div><!-- end view-con -->
						<div class="list" id="relation01">
							<ul>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
							</ul>
						</div><!-- end relation01 -->
						<div class="list" id="relation02">
							<ul>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
								<li>
									<p class="photo">
										<a href="#"><img src="/images/shop/cn/product/detail/110x110.gif" width="110" height="110" alt="" /></a>
									</p>
									<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
									<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
									<p class="price">
										<span class="us-currency">$ 175</span>
										<span class="nation-currency">(约 ￥1,075)</span>
									</p>
								</li>
							</ul>
						</div><!-- end relation02 -->
					</div><!-- end relation-list -->
				</div><!-- end relation-product -->
				<div class="freebie">
					<h3 class="num"><img src="/images/shop/cn/product/detail/title_01.gif" alt="赠品" /></h3>
					<div class="occasion">
						<ul class="ceremony-listing">
							<li>
								<div class="ceremony">
									<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/detail/150X150.gif" alt="사은행사 상품명" /></p>
									<div class="ceremony-info">
										<p class="title">伊丽莎白雅顿/ELIZABETH ARDEN</p>
											<p class="condition">雅顿 CLX黄金导航面部胶囊
											<span class="ceremony-item">30capsX3 / 42ml (再生&amp;保湿&amp;弹性)</span></p>
											<p class="ceremony-term">2013.07~2013.09.10</p>
									</div><!-- end ceremony-info -->
								</div><!-- end ceremony -->
								<div class="list-ceremony">
									<ul>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div class="info">
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL
													ULTRA FACIAL
												</p>
											</div><!-- end info -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div class="info">
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL ULTRA FACIAL
												</p>
											</div><!-- end info -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div class="info">
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL ULTRA FACIAL
												</p>
											</div><!-- end info -->
										</li>
										<li>
											<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
											<div class="info">
												<p class="product-name">科颜氏/KIEHL S</p>
												<p class="freebie">
													ULTRA FACIALULTRA FACIAL ULTRA FACIAL
												</p>
											</div><!-- end info -->
										</li>
									</ul>
								</div><!-- end list-ceremony -->
							</li>
						</ul>
					</div><!-- end freebie -->
				</div><!-- end list -->
				<div class="product-review" id="detail-info">
					<ul class="detail-tab">
                    	<li class="first-child detail-tab-on"><a href="#detail-info"><img src="/images/shop/cn/product/detail/productdetail_tab01_on.gif" alt="商品详细信息" /></a></li>
                    	<li><a href="#product-comment"><img src="/images/shop/cn/product/detail/productdetail_tab02.gif" alt="商品评价" /><span>(10)</span></a></li>
                    	<li><a href="#product-qna"><img src="/images/shop/cn/product/detail/productdetail_tab03.gif" alt="商品q&amp;a" /><span>(10)</span></a></li>
                    	<li><a href="#product-cancel"><img src="/images/shop/cn/product/detail/productdetail_tab04.gif" alt="取消订购/退货指南" /></a></li>
                    	<li><a href="#dutyfree"><img src="/images/shop/cn/product/detail/productdetail_tab05.gif" alt="免税店使用指南" /></a></li>
                    	<li><a href="#deliver-method"><img src="/images/shop/cn/product/detail/productdetail_tab06.gif" alt="商品领取指南" /></a></li>
                    </ul>

                	<table summary="주문취소 및 반품 안내에 대한 내용이 담긴 게시판" class="cancel-txt">
                    	<caption>주문취소 및 반품안내 게시판</caption>
                        <colgroup>
                        	<col width="225px" />
                            <col width="774px" />
                        </colgroup>
                        <tbody>
                        	<tr>
                            	<th scope="col">상품명</th>
                            	<td></td>
                            </tr>
                        	<tr>
                            	<th scope="col">성별</th>
                            	<td></td>
                            </tr>
                        	<tr>
                            	<th scope="col">색상</th>
                            	<td>WHITE</td>
                            </tr>
                        	<tr>
                            	<th scope="col">사이즈</th>
                            	<td>FREE</td>
                            </tr>
                        	<tr>
                            	<th scope="col">용량 및 중량</th>
                            	<td>125ML</td>
                            </tr>
                        	<tr>
                            	<th scope="row">타입</th>
                            	<td>DRY</td>
                            </tr>
                        	<tr>
                            	<th scope="col">제조국</th>
                            	<td>미국</td>
                            </tr>
                        	<tr>
                            	<th scope="col">제조사, 수입자 또는 판매국</th>
                            	<td>L'Oreal Luxe</td>
                            </tr>
                        	<tr>
                            	<th scope="col">소재 및 주요성분</th>
                            	<td>
									<p>안타티신 (빙하 당단백질 추출물) Antarcticine</p><br />
									<p>남극 대륙의 빙하에서 추출한 당단백질인 안타티신은 피부를 눈에 띄게 매끄럽고 촉촉하게 가꾸어 줍니다. 또한, 피부의 수분 </p>
									<p>손실을 막아주어 기후 변화로부터 피부를 보호합니다.</p><br />
									<p>임페라타 실린드리카 (사막 식물 추출물) Imperata Cylindrica</p><br />
									<p>임페라타 실린드리카는 호주 사막의 매우 건조한 환경에서 서식하는 식물입니다. 즉각적으로 수분을 공급하고 유지 시켜주며</p>
									<p>칼륨을 고농도로 함유하고 있어 피부 수분을 효과적으로 저장, 유지해줍니다.</p>
								</td>
                            </tr>
                        	<tr>
                            	<th scope="col">
									식품의약품 안정청 허가번호 및 <br />
									부작용발생 가능성
								</th>
                            	<td>부작용 없음</td>
                            </tr>
                        	<tr>
                            	<th scope="col">사용시 주의사항</th>
                            	<td>테스트후 사용 요망</td>
                            </tr>
                        	<tr>
                            	<th scope="col">품질 보증기준</th>
                            	<td>품질보증기간 구입후 1주일 이내 </td>
                            </tr>
                        	<tr>
                            	<th scope="col">A/S 책임자와 전화번호</th>
                            	<td>챔임자 : 김길동, 전화번호:051-111-1111</td>
                            </tr>
                        	<tr>
                            	<th scope="col">사용방법</th>
                            	<td>상품제공시 첨부되는 첨부문서 확인</td>
                            </tr>
                        	<tr>
                            	<th scope="col">보증서 제공여부</th>
                            	<td>첨부문서 확인</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    
                    
                    
                    
                    <!-- 0927 순서 cancel-txt밑으로 이동 및 col width="225px"col width="774px"로 변경 해주세요~!! -->
					<div class="view-explain">
						<div class="detail-expalin">
							<div class="info-table">
								<table summary="选项信息">
									<caption>选项信息</caption>
									<colgroup>
										<col width="225px" />
										<col width="774px" />
									</colgroup>
									<tbody>
										<tr>
											<!-- 옵션정보 -->
											<th scope="row">选项信息</th>
											<td class="option-info">
												<p>사이즈 : <span>지름 49mm, 두께 14mm</span></p> / 
												<p>무게 : <span>55g</span></p> /
												<p>용량 : <span>100ml</span></p>
											</td>
										</tr>
										<tr>
											<!-- 상품설명 -->
											<th scope="row">商品说明</th>
											<td>
												퍼펙셔니스트 [CP+R] 링클/퍼밍 세럼 100ml<br />
												피부 노화에 팽팽하게 맞설 수 있도록 끊임없는 연구 끝에 탄생한 퍼펙셔니스트[CP+R]<br />
												콜라겐 생성 능력을 강화시키는 혁신적인 테크놀로지로 눈에 띄는 노화와 주름에 지속적인 변화를 선사합니다.<br />
												3일 후 나타난 CPR-75 테크놀로지의 in-virto실험결과 기준<br />
												바르는 순간, 주름은 더욱 완하되어 보이고 부드럽고 매끄러워지도록 도와줍니다.<br />
												피부의 콜라겐 생성 능력을 강화시켜 피부속부터 차오르는 탄력을 경험하도록 합니다.
											</td>
										</tr>
										<tr>
											<!-- 소재표시 및설명 -->
											<th scope="row">素材及说明</th>
											<td>용량 : 100ml</td>
										</tr>
										<tr>
											<!-- 상품특징 -->
											<th scope="row">商品特征</th>
											<td>
												색상 - NO.17:BONE<br />
												완벽한 파운데이션 선택을 위해, 매장에서 직접 색상을 확인해주세요.<br />
												(더블 웨어 리퀴드 파운데이션이 2012년 10월, 아시아 여성에 더욱 적합한 칼라들로 다양해졌습니다.<br />
												또한, 기존 칼라도 미세한 차이가 느껴질 수 있으므로, 매장에서 나에게 맞는 색상을 다시 한번 확인해 주세요.
											</td>
										</tr>
										<tr>
											<!-- 참고사항 -->
											<th scope="row">参考事项</th>
											<td>상품 포장은 3개 중 2개만 되어있습니다.</td>
										</tr>
										<tr>
											<!-- 상품문의처 -->
											<th scope="row">商品咨询</th>
											<td>051)749-1446</td>
										</tr>
										<tr class="detail-view">
											<th><p><img src="/images/shop/cn/product/detail/detail_view.gif" alt="Detail View" /></p></th>
											<td>
												<div><img src="/images/shop/cn/product/detail/img_detail_view.jpg" alt="detail_info" /></div>
											</td>
										</tr>
									</tbody>
								</table>
							</div><!-- end info-table -->
						</div><!-- end detail-explain -->
					</div><!-- end view-explain -->
					<!-- 0927 순서 //cancel-txt밑으로 이동 -->
					
					
					
					
					
             	</div><!-- end product-review -->
				<div class="product-review" id="product-comment">
                	<ul class="detail-tab">
                    	<li class="first-child"><a href="#detail-info"><img src="/images/shop/cn/product/detail/productdetail_tab01.gif" alt="商品详细信息" /></a></li>
                    	<li class="detail-tab-on"><a href="#product-comment"><img src="/images/shop/cn/product/detail/productdetail_tab02_on.gif" alt="商品评价" /><span>(10)</span></a></li>
                    	<li><a href="#product-qna"><img src="/images/shop/cn/product/detail/productdetail_tab03.gif" alt="商品q&amp;a" /><span>(10)</span></a></li>
                    	<li><a href="#product-cancel"><img src="/images/shop/cn/product/detail/productdetail_tab04.gif" alt="取消订购/退货指南" /></a></li>
                    	<li><a href="#dutyfree"><img src="/images/shop/cn/product/detail/productdetail_tab05.gif" alt="免税店使用指南" /></a></li>
                    	<li><a href="#deliver-method"><img src="/images/shop/cn/product/detail/productdetail_tab06.gif" alt="商品领取指南" /></a></li>
                    </ul>
                	<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_02.gif" alt="Premium商品评价" /><span>(10)</span></p>
                        <p class="select-box">
                            <select class="lately-regi" title="보고자 하는 등록일 순서를 선택해주세요">
                                <option>按最近发表日排序</option>
                            </select>
                        </p>
                    </div>
                	<table summary="Premium商品评价">
                    	<caption>Premium商品评价</caption>
                        <colgroup>
                        	<col width="525px" />
                            <col width="64px" />
                        	<col width="170px" />
                            <col width="65px" />
                        	<col width="85px" />
                            <col width="65px" />
                        </colgroup>
                        <thead>
                        	<tr>
                            	<th scope="row">题目</th>
                            	<th scope="row">评分</th>
                            	<th scope="row">作者</th>
                            	<th scope="row">购买与否</th>
                            	<th scope="row">发表日期</th>
                            	<th scope="row">浏览数</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
                            	<td>
                                	<p class="product-img"><img src="/images/shop/cn/product/detail/img_60x60.gif" alt="image" /></p>
                                    <p class="product-txt"><a href="#"><span>수분감 굿</span></a></p>
                                </td>
                            	<td>
	                            	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td class="buy-ok">购买</td>
                            	<td>2013-10-23</td>
                            	<td>9999</td>
                            </tr>
                        	<tr>
                            	<td>
                                	<p class="product-img"><img src="/images/shop/cn/product/detail/img_60x60.gif" alt="image" /></p>
                                    <p class="product-txt"><a href="#"><span>수분감 굿</span></a><img src="/images/shop/cn/product/detail/icon_mobile.png" alt="mobile" class="ico-mobile" /></p>
                                </td>
                            	<td>
	                            	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td class="buy-ok">购买</td>
                            	<td>2013-10-23</td>
                            	<td>9999</td>
                            </tr>
                        	<tr>
                            	<td>
                                	<p class="product-img"><img src="/images/shop/cn/product/detail/img_60x60.gif" alt="image" /></p>
                                    <p class="product-txt"><a href="#"><span>수분감 굿</span></a></p>
                                </td>
                            	<td>
	                            	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>非购买</td>
                            	<td>2013-10-23</td>
                            	<td>9999</td>
                            </tr>
                        	<tr>
                            	<td>
                                	<p class="product-img"><img src="/images/shop/cn/product/detail/img_60x60.gif" alt="image" /></p>
                                    <p class="product-txt"><a href="#"><span>수분감 굿</span></a></p>
                                </td>
                            	<td>
	                            	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td class="buy-ok">购买</td>
                            	<td>2013-10-23</td>
                            	<td>9999</td>
                            </tr>
                        	<tr>
                            	<td>
                                	<p class="product-img"><img src="/images/shop/cn/product/detail/img_60x60.gif" alt="image" /></p>
                                    <p class="product-txt"><a href="#"><span>수분감 굿</span></a></p>
                                </td>
                            	<td>
	                            	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>非购买</td>
                            	<td>2013-10-23</td>
                            	<td>9999</td>
                            </tr>
                            <tr class="no-registration">
                            	<td colspan="6">没有Premium商品评价。</td>
                            </tr>
                        </tbody>
                    </table>
					 <div class="pager">
						<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="previous" /></a>
                       	<strong>1</strong>
                       	<a href="#">2</a>
                       	<a href="#">3</a>
                       	<a href="#">4</a>
                       	<a href="#">5</a>
                       	<a href="#">6</a>
                       	<a href="#">7</a>
                       	<a href="#">8</a>
                       	<a href="#">9</a>
                       	<a href="#">10</a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="next" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="last" /></a>
                        <p class="btn-right">
							<a href="#"><img src="/images/shop/cn/product/detail/btn_review.gif" alt="写商品评价" /></a>
						</p>
                    </div><!-- end pager -->
                </div><!-- end product-review -->
            	<div class="product-review">
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_03.gif" alt="一般商品评价" /><span>(10)</span></p>
                        <p class="select-box">
                            <select class="lately-regi" title="보고자 하는 등록일 순서를 선택해주세요">
                                <option>按最近发表日排序</option>
                            </select>
                        </p>
                    </div>
                	<table summary="一般商品评价">
                    	<caption>一般商品评价</caption>					
                        <colgroup>
                        	<col width="55px" />
                            <col width="565px" />
                        	<col width="80px" />
                            <col width="60px" />
                        	<col width="155px" />
                            <col width="85px" />
                        </colgroup>
                        <thead>
                        	<tr>
                            	<th scope="row">序号</th>
                            	<th scope="row">题目</th>
                            	<th scope="row">评分</th>
                            	<th scope="row">作者</th>
                            	<th scope="row">购买与否</th>
                            	<th scope="row">发表日期</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
                            	<td>10</td>
                            	<td class="tit-align"><a href="#">면세점 통해서 백화점 반가격에 구입했어요</a></td>
                            	<td>
                                	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td class="buy-ok">购买</td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                        	<tr>
                            	<td>10</td>
                            	<td class="tit-align"><a href="#">면세점 통해서 백화점 반가격에 구입했어요</a><img src="/images/shop/cn/product/detail/icon_mobile.png" alt="mobile" /></td>
                            	<td>
                                	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                                <!-- 구매 -->
                            	<td class="buy-ok">购买</td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                        	<tr>
                            	<td colspan="6" class="board-txtbox">
									<div class="borad-txt">
										<div class="star-box">
											<!-- 가격 -->
											<p class="star"><span class="tit">价格</span>
												<span>
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
													<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
													<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
												</span>
											</p>
											<!-- 디자인 -->
											<p class="star"><span class="tit">设计</span>
												<span>
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점5" />
												</span>
											</p>
											<!-- 품질 -->
											<p class="star"><span class="tit">品质</span>
												<span>
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점5" />
												</span>
											</p>
											<!-- 만족도 -->
											<p class="star"><span class="tit">满意度</span>
												<span>
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
													<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
													<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
													<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
												</span>
											</p>
										<p class="mobile-top"><img src="/images/shop/cn/product/detail/icon_mobile.png" alt="mobile" />在手机版新世界网上免税店撰写。</p>
										<p class="txt">면세점 통해서 백화점 반가격에 구입했네요<br />아이좋아라얼랄라올렐레</p>
										</div>
									</div>
                                </td>
                            </tr>
                        	<tr>
                            	<td>10</td>
                            	<td class="tit-align"><a href="#">면세점 통해서 백화점 반가격에 구입했어요</a></td>
                            	<td>
                                	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                                <!-- 비구매 -->
                            	<td>非购买</td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                        	<tr>
                            	<td>10</td>
                            	<td class="tit-align"><a href="#">면세점 통해서 백화점 반가격에 구입했어요</a></td>
                            	<td>
                                	<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
                                    <img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
                                    <img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
                                </td>
                            	<td>非购买</td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                            <tr class="no-registration">
                            	<td colspan="6">没有一般商品评价。</td>
                            </tr>
                        </tbody>
                    </table>
					<div class="pager">
						<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="previous" /></a>
                        <strong>1</strong>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                        <a href="#">9</a>
						<a href="#">10</a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="next" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="last" /></a>
                        <p class="btn-right">
							<a href="#"><img src="/images/shop/cn/product/detail/btn_review.gif" alt="写商品评价" /></a>
						</p>
						<p class="exclude-comment">
							本商品属于健康食品以及医疗器械，依据相关法律不能发表商品评价。
						</p>
                    </div><!-- end pager -->
                </div><!-- end product-review -->
				<div class="product-review" id="product-qna">
					<ul class="detail-tab">
                    	<li class="first-child"><a href="#detail-info"><img src="/images/shop/cn/product/detail/productdetail_tab01.gif" alt="商品详细信息" /></a></li>
                    	<li><a href="#product-comment"><img src="/images/shop/cn/product/detail/productdetail_tab02.gif" alt="商品评价" /><span>(10)</span></a></li>
                    	<li class="detail-tab-on"><a href="#product-qna"><img src="/images/shop/cn/product/detail/productdetail_tab03_on.gif" alt="商品q&amp;a" /><span>(10)</span></a></li>
                    	<li><a href="#product-cancel"><img src="/images/shop/cn/product/detail/productdetail_tab04.gif" alt="取消订购/退货指南" /></a></li>
                    	<li><a href="#dutyfree"><img src="/images/shop/cn/product/detail/productdetail_tab05.gif" alt="免税店使用指南" /></a></li>
                    	<li><a href="#deliver-method"><img src="/images/shop/cn/product/detail/productdetail_tab06.gif" alt="商品领取指南" /></a></li>
                    </ul>
					<div class="tit-box">
                        <p class="board-title board-type01"><img src="/images/shop/cn/product/detail/title_04.gif" alt="商品q&amp;a" /></p>
                    </div>
					<div class="board-top-txt">
						<span class="txt-tipping">提出您对商品的提问，负责人将快速回复您。</span>
						<span class="txt-tipping">若提前查看其他顾客的咨询内容，则能够更加迅速了解有用的商品信息。.</span>
						<span class="txt-tipping">与商品无关的一般咨询请利用<a href="#">1:1 咨询。</a></span>
						<span class="txt-tipping">我的咨询内容可在<a href="#">我的页面</a>查看。</span>
					</div>
					 <p class="select-box box-type01">
                         <select class="lately-regi" title="보고자 하는 등록일 순서를 선택해주세요">
                           <option>按最近发表日排序</option>
                        </select>
                    </p>
                	<table summary="商品q&amp;a">
                    	<caption>商品q&amp;a</caption>
                        <colgroup>
                        	<col width="60px" />
                            <col width="100px" />
                        	<col width="690px" />
                            <col width="135px" />
                        	<col width="85px" />
                        </colgroup>
                        <thead>
                        	<tr>
                            	<th scope="row">序号</th>
                            	<th scope="row">回复状态</th>
                            	<th scope="row">题目</th>
                            	<th scope="row">编者</th>
                            	<th scope="row">发表日</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<tr>
                            	<td>10</td>
                            	<!-- 답변준비중 -->
                            	<td class="buy-ok">正在准备回复</td>
                            	<td class="tit-align answer-ok"><a href="#">블라블라제목</a><img src="/images/shop/cn/product/detail/ico_secret.gif" alt="비공개" class="secret" /></td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                        	<tr>
                            	<td>10</td>
                            	<!-- 답변완료 -->
                            	<td>已回复</td>
                            	<td class="tit-align"><a href="#">블라블라제목</a></td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                        	<tr>
                            	<td colspan="6" class="board-txtbox">
									<div class="borad-txt">
										<div class="qna-box">
											<p class="qna-q">
												<img src="/images/shop/cn/product/detail/ico_q.gif" alt="Q" />
												<span>
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
												</span>
											</p>
											<p class="qna-a">
												<img src="/images/shop/cn/product/detail/ico_a.gif" alt="A" />
												<span>
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
													롤롤랄랄롤롤룰룰
												</span>
											</p>
											<span class="btn-remove"><img src="/images/shop/cn/product/detail/btn_board_remove.gif"  alt="삭제" /></span>
										</div><!-- end board-txtbox  -->
									</div><!-- end qna-box -->
                                </td>
                            </tr>
                        	<tr>
                            	<td>10</td>
                            	<td>已回复</td>
                            	<td class="tit-align"><a href="#">블라블라제목</a></td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                        	<tr>
                            	<td>10</td>
                            	<td>已回复</td>
                            	<td class="tit-align"><a href="#">블라블라제목</a></td>
                            	<td><span class="uesrid-name">ABC***</span></td>
                            	<td>2013-10-23</td>
                            </tr>
                            <tr class="no-registration">
                            	<td colspan="5">没有商品咨询。</td>
                            </tr>
                        </tbody>
                    </table>
					<div class="pager">
						<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="previous" /></a>
                        <strong>1</strong>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#">6</a>
                        <a href="#">7</a>
                        <a href="#">8</a>
                        <a href="#">9</a>
                        <a href="#">10</a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="next" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="last" /></a>
						<p class="btn-right"><a href="#"><img src="/images/shop/cn/product/detail/btn_inquiry.gif" alt="咨询" /></a></p>
                    </div><!-- end pager -->
                </div><!-- end product-review -->
				<div class="product-review" id="product-cancel">
					<ul class="detail-tab">
                    	<li class="first-child"><a href="#detail-info"><img src="/images/shop/cn/product/detail/productdetail_tab01.gif" alt="商品详细信息" /></a></li>
                    	<li><a href="#product-comment"><img src="/images/shop/cn/product/detail/productdetail_tab02.gif" alt="商品评价" /><span>(10)</span></a></li>
                    	<li><a href="#product-qna"><img src="/images/shop/cn/product/detail/productdetail_tab03.gif" alt="商品q&amp;a" /><span>(10)</span></a></li>
                    	<li class="detail-tab-on"><a href="#product-cancel"><img src="/images/shop/cn/product/detail/productdetail_tab04_on.gif" alt="取消订购/退货指南" /></a></li>
                    	<li><a href="#dutyfree"><img src="/images/shop/cn/product/detail/productdetail_tab05.gif" alt="免税店使用指南" /></a></li>
                    	<li><a href="#deliver-method"><img src="/images/shop/cn/product/detail/productdetail_tab06.gif" alt="商品领取指南" /></a></li>
                    </ul>
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_05.gif" alt="取消订购/退回指南" /></p>
                    </div>
                	<table summary="取消订购/退回指南" class="cancel-txt">
                    	<caption>取消订购/退回指南</caption>
                        <colgroup>
                        	<col width="225px" />
                            <col width="774px" />
                        </colgroup>
                        <tbody>
                        	<tr>
                            	<th scope="col" rowspan="2">取消订购</th>
                            	<td>
									<!-- 0923 수정 -->
									<ol>
										<li><img src="/images/shop/cn/product/detail/cancel_step.gif" alt="01. 我的页面  &gt; 点击订购号码  &gt;02. 点击订单下方的取消订购按钮 &gt;03. 订购取消完成" /></li>
									</ol>
								</td>
                            </tr>
							<tr>
								<td>
									<ul>
										<li> 
											取消订购可直接在 <a href="#">我的页面 &gt; 订购明细</a>中进行。<br />
											- 点击订单号码后，再点击订单下方的取消订购按钮，取消订购将被受理。
										</li>
										<li>已向海关报告的订单不能在网上进行取消，此时请咨询客服中心。(客服中心：1577-0161)</li>
										<li>若需要在客服中心工作时间以外咨询，请在<a href="#">1:1 咨询 </a>留言。</li>
										<li>太阳镜由于其商品特殊性，取货之后无法取消，因此订购时请慎重选择。</li>
									</ul>
								</td>
							</tr>
                        	<tr>
                            	<th scope="col">交换及退货、退款</th>
                            	<td>
									<ul>
										<li>免税商品因顾客单纯的变心而要退货时，不予退货。但若商品本身存在问题或不良时，则予以退货。<br />
   											- 交换只限于同样商品，若无库存，将不能进行交换。
										</li>
										<li>退货时，必须返还购买时所赠送的礼品后，才可以退款。</li>
										<li>依据本公司的付款方式，只能退还扣除优惠券或积分以外的金额。</li>
										<li>
											对于游客亲自携带从免税店购买的商品入境申请退货时，必须在出境后最初入境时向海关申报所携带的商品。(欲退货的商品总额在$400 以下时除外) 若没有申报，则不予退货。
										</li>
										<li>对于在海外通过国际邮递申请退货的免税品，可通过国际邮递进行退货。</li>
										<li>依据本公司的付款方式，最终退款金额为扣除优惠券或积分以外的金额。</li>
									</ul>
									<!-- //0923 수정 -->
								</td>
                            </tr>
                        </tbody>
                    </table>
             	</div><!-- end product-review -->
				<div class="product-review" id="dutyfree">
					<ul class="detail-tab">
                    	<li class="first-child"><a href="#detail-info"><img src="/images/shop/cn/product/detail/productdetail_tab01.gif" alt="商品详细信息" /></a></li>
                    	<li><a href="#product-comment"><img src="/images/shop/cn/product/detail/productdetail_tab02.gif" alt="商品评价" /><span>(10)</span></a></li>
                    	<li><a href="#product-qna"><img src="/images/shop/cn/product/detail/productdetail_tab03.gif" alt="商品q&amp;a" /><span>(10)</span></a></li>
                    	<li><a href="#product-cancel"><img src="/images/shop/cn/product/detail/productdetail_tab04.gif" alt="取消订购/退货指南" /></a></li>
                    	<li class="detail-tab-on"><a href="#dutyfree"><img src="/images/shop/cn/product/detail/productdetail_tab05_on.gif" alt="免税店使用指南" /></a></li>
                    	<li><a href="#deliver-method"><img src="/images/shop/cn/product/detail/productdetail_tab06.gif" alt="商品领取指南" /></a></li>
                    </ul>
					<div class="tit-box">
						<!-- 0923 -->
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_06.gif" alt="新世界免税店仅限于国外旅游的顾客购买商品。" /><span><img src="/images/shop/cn/product/detail/title_06_1.gif" alt="(国内旅游时不可购买)" /></span></p>
                        <!-- //0923 -->
                    </div>
                	<table summary="新世界免税店仅限于国外旅游的顾客购买商品。" class="cancel-txt">
                    	<caption>新世界免税店仅限于国外旅游的顾客购买商品。</caption>
                        <colgroup>
                        	<col width="225px" />
                            <col width="774px" />
                        </colgroup>
                        <tbody>
                        	<tr>
                            	<th scope="col">访问免税店</th>
                            	<td>
									<ul>
										<li>新世界免税店全年无休运营。</li>
										<li>必须由出境者本人携带护照（可带复印件）访问免税店。</li>
										<li>记住出境日期后访问免税店，可购买商品。</li>
										<li>若离出境日期有30日以上，则需携带电子机票或预约单。</li>
									</ul>
								</td>
                            </tr>
                        	<tr>
                            	<th scope="col">使用网上免税店</th>
                            	<td>
									<ul>
										<li>新世界免税店可24小时购买商品，购买时只有正确填写顾客的护照信息和出境信息，才能领取商品。</li>
									</ul>
								</td>
                            </tr>
                        </tbody>
                    </table>
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_07.gif" alt="各出境地点的可订购时间" /></p>
                    </div>
                    
                    </table>
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_07.gif" alt="各出境地点的可订购时间" /></p>
                    </div>
                    <!-- 0925 table~table 삭제 후 변경 -->
                	<div class="airtime">
						<table summary="各出境地点的可订购时间">
                   			<caption>各出境地点的可订购时间</caption>
							<colgroup>  
								<col width="225px" /> 
								<col width="235px" /> 
								<col width="320px" />    
							</colgroup> 
							<tbody> 
								<tr> 
									<th rowspan="2"><span>从仁川国际机场出境时</span></th>
									<td><span>23时以后出境</span></td>  
									<td><span>截止至10时为止</span></td>   
								</tr>   
								<tr>  
									<td><span>07时以后出境</span></td>  
									<td><span>截止至前一天18时为止</span></td>   
								</tr>   
								<tr> 
									<th rowspan="2"><span>从金浦/大邱机场出境时</span></th>
									<td><span>08时以前出境</span></td>  
									<td><span>截止至前二日18时为止</span></td>   
								</tr>    
								<tr>  
									<td><span>08时以后出境</span></td>  
									<td><span>截止至前一天 18时为止</span></td>   
								</tr>  
								<tr> 
									<th rowspan="7"><span>从金海机场/釜山港出境时</span></th>
									<td><span>07时以后 ，12时以前出境</span></td>  
									<td><span>截止至前一天18时为止</span></td>   
								</tr>     
								<tr>  
									<td><span>13时以前出境</span></td>  
									<td><span>截止至09时为止</span></td>   
								</tr>     
								<tr>  
									<td><span>14时以前出境</span></td>  
									<td><span>截止至10时为止</span></td>   
								</tr>     
								<tr>  
									<td><span>15时以前出境</span></td>  
									<td><span>截止至11时为止</span></td>   
								</tr>     
								<tr>  
									<td><span>16时以前出境</span></td>  
									<td><span>截止至12时为止</span></td>   
								</tr>     
								<tr>  
									<td><span>17时以前出境</span></td>  
									<td><span>截止至13时为止</span></td>   
								</tr>     
								<tr>  
									<td><span>17时以前出境</span></td>  
									<td><span>截止至14时为止</span></td>   
								</tr> 
							</tbody>
						</table>
					</div>
					<!-- //0925 table~table 삭제 후 변경 -->
                    <!-- 
                	<table summary="各出境地点的可订购时间" class="cancel-txt">
                    	<caption>各出境地点的可订购时间</caption>
                        <colgroup>
                        	<col width="225px" />
                            <col width="774px" />
                        </colgroup>
                        <tbody>
                        	<tr>
                            	<th scope="col">从仁川国际机场出境时</th>
                            	<td>
									<ul class="trance">
										<li>23时以后出境 -------------------- 截止至10时为止</li>
										<li>07时以后出境 -------------------- 截止至前一天18时为止</li>
									</ul>
								</td>
                            </tr>
                        	<tr>
                            	<th scope="col">从金浦/大邱机场出境时</th>
                            	<td>
									<ul class="trance">
										<li>08时以前出境 -------------------- 截止至前二天18时为止</li>
										<li>08时以后出境  -------------------- 截止至前一天18时为止 </li>
									</ul>
								</td>
                            </tr>
                        	<tr>
                            	<th scope="col">从金海机场/釜山港出境时</th>
                            	<td>
									<ul class="trance">
										<li>07时以后 , 12时以前出境 ----------  截止至前一天18时为止</li>
										<li>13时以前出境 -------------------- 截止至09时为止</li>
										<li>14时以前出境 -------------------- 截止至10时为止</li>
										<li>15时以前出境 -------------------- 截止至11时为止</li>
										<li>16时以前出境 -------------------- 截止至12时为止</li>
										<li>17时以前出境 -------------------- 截止至13时为止</li>
										<li>17时以前出境 -------------------- 截止至14时为止</li>
									</ul>
								</td>
                            </tr>
                        </tbody>
                    </table>
                    -->
                    <!-- 
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/purchase_limit.gif" alt="구매한도" /></p>
                    </div>
                	<table summary="신세계 면세점 이용가능 고객에 대한 안내 내용이 담긴 게시판" class="cancel-txt">
                    	<caption>면세 이용 가능 고객 안내 게시판</caption>
                        <colgroup>
                        	<col width="225px" />
                            <col width="774px" />
                        </colgroup>
                        <tbody>
                        	<tr>
                            	<th scope="col">내국인</th>
                            	<td><p>내국인의 총 구매한도는 미화 $3000이며 입국 시 여행자 1인당 면세금액은 미화 $400 이오니 이점 유의하시기 바랍니다</p></td>
                            </tr>
                        	<tr>
                            	<th scope="col">외국인(교포)</th>
                            	<td><p>외국인의 구매한도액은 제한이 없으며 1인당 면세금액은 내국인과 동일하게 미화 $400 이오니 이점 유의하시기 바랍니다</p></td>
                            </tr>
                        </tbody>
                    </table>
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/special_order.gif" alt="스페셜오더" /></p>
                    </div>
					<ul class="special-box">
						<li>
							스페셜오더는 신세계면세점 매장에서 판매되고 있는 상품 중에 신세계인터넷면세점에서 판매되고 있지 않은 상품을 해당 코너에 확인 후에 상품이 있을 때, 인터넷에서 주문하실 수 있는 <strong>특별 주문 서비스</strong>입니다.
						</li>
						<li>
							찾으시는 상품이 없거나, 상품이 품절일 때는 스페셜오더를 이용해주세요. 신속하게 재고 유무를 확인하여 구매하실 수 있도록 도와 드리겠습니다.
						</li>
					</ul>-->
					
					<div class="tit-box">
                        <p class="board-title board-type01"><img src="/images/shop/cn/product/detail/title_08.gif" alt="出境时请放心购买免税商品。" /></p>
						<p class="guide-pop"><a href="#"><img src="/images/shop/cn/product/detail/btn_guide_open.gif" alt="详细查看携带液体类、凝胶类到机内的规定" /></a></p>
                    </div>
					<ul class="special-box">
						<li>使用网上免税店购物时，液体类和凝胶类商品装入安全防揭透明加封袋并贴好收据后送达至取货处，因此可以购买液体类和凝胶类商品。</li>
						<li>在韩国转机或经由时，限制购买液体类和凝胶类商品，望顾客敬请留意。</li>
						<li>回国时，请托运限制携带机内的商品。</li>
					</ul>
            	</div><!-- end product-review -->
				<div class="product-review" id="deliver-method">
					<ul class="detail-tab">
                    	<li class="first-child"><a href="#detail-info"><img src="/images/shop/cn/product/detail/productdetail_tab01.gif" alt="商品详细信息" /></a></li>
                    	<li><a href="#product-comment"><img src="/images/shop/cn/product/detail/productdetail_tab02.gif" alt="商品评价" /><span>(10)</span></a></li>
                    	<li><a href="#product-qna"><img src="/images/shop/cn/product/detail/productdetail_tab03.gif" alt="商品q&amp;a" /><span>(10)</span></a></li>
                    	<li><a href="#product-cancel"><img src="/images/shop/cn/product/detail/productdetail_tab04.gif" alt="取消订购/退货指南" /></a></li>
                    	<li><a href="#dutyfree"><img src="/images/shop/cn/product/detail/productdetail_tab05.gif" alt="免税店使用指南" /></a></li>
                    	<li class="detail-tab-on"><a href="#deliver-method"><img src="/images/shop/cn/product/detail/productdetail_tab06_on.gif" alt="商品领取指南" /></a></li>
                    </ul>
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_09.gif" alt="商品取货指南" /></p>
                    </div>
					<table summary="商品取货指南" class="cancel-txt">
                    	<caption>商品取货指南</caption>
                        <colgroup>
                        	<col width="200px" />
                            <col width="799px" />
                        </colgroup>
                        <tbody>
                        	<tr>
                            	<th scope="col">取货注意事项</th>
                            	<td>
									<ul>
										<li>必须在指定的保税区（机场或釜山港）领取商品。</li>
										<li>不能配送到顾客的住址。</li>
										<li>免税商品不能用邮递方法寄出，且没有特定的保管所，因此必须在出境之前领取。（不可在入境时领取）</li>
									</ul>
								</td>
                            </tr>
                        	<tr>
                            	<th scope="col" rowspan="2">商品取货步骤</th>
								<td>
									<!-- 0923 -->
									<ol class="take-step">
										<li><img src="/images/shop/cn/product/detail/take_step.gif" alt="01. 到达新世界网上免税店取货处&gt;02. 出示订单与护照&gt;03. 确认护照信息是否一致后领取商品并签署姓名&gt;04. 取货成功" /></li>
									</ol>
									<!-- //0923 -->
								</td>
							</tr>
							<tr>
                            	<td>
									<ul>
										<li>
											出境当天办完出境手续之后，于登机前在新世界网上免税店取货处取货。
										</li>
										<li>
											取货时必须出示出境者本人的护照、登机牌、订单（订购号码）。
										</li>
										<li>
											若无法打印订单，则在纸张记录订购号码与护照、登机牌一同出示便可领取商品。
										</li>
										<li>
											领取商品之后，如商品存在问题，请立即告知新世界网上免税店取货处的职员。对于出境之后的商品，新世界网上免税店将不予负责。
										</li>
										<li>
											若订单上输入的英文姓名、生年月日等出国信息有误，则无法领取商品，因此<span>订购商品时请准确输入信息（与护照一致的信息）。</span>
										</li>
									</ul>
								</td>
                            </tr>
                        </tbody>
                    </table>
					<div class="tit-box">
                        <p class="board-title"><img src="/images/shop/cn/product/detail/title_10.gif" alt="取货处位置导向" /></p>
                    </div> 

					 <!-- 0826 인도장 안내 수정 -->
					<div class="airlist">
						<ul class="airlist-con" id="airlist-con">
							<li class="on"><a href="#" class="tit">仁川国际机场西边取货处</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_west.gif" alt="仁川国际机场西边取货处" /></div> 
									<div class="map-info">
										<p class="title">仁川国际机场西边取货处</p>
										<p class="txt"><span>位置</span>: 通过3号出境审查台，乘咨询台前方的扶梯上楼后，</p>
										<p class="txt02">位于韩亚航空贵宾休息室前面。</p>
										<p class="tel"><span>联系方式</span>: 032-743-2709</p>
									</div>   
								</div>
							</li>
							<li><a href="#" class="tit">仁川国际机场东边取货处</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_east.gif" alt="仁川国际机场东边取货处" /></div>
									<div class="map-info">
										<p class="title">仁川国际机场东边取货处</p>
										<p class="txt"><span>位置</span>: 位于航站楼2号出国审查台楼上（4楼），</p>
										<p class="txt02">大韩航空贵宾休息室对面</p>
										<p class="tel"><span>联系方式</span>: 032-743-2674</p>
									</div> 
								</div>
							</li> 
							<li><a href="#" class="tit">仁川国际机场登机楼</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_boarding.gif" alt="仁川国际机场登机楼" /></div>
									<div class="map-info">
										<p class="title">仁川国际机场登机楼</p>
										<p class="txt"><span>位置</span>: 从机场快轨下车后乘扶梯上楼，</p>
										<p class="txt02">位于121号登机口前面。</p>
										<p class="tel"><span>联系方式</span>: 032-743-2757</p>
									</div>  
								</div>
							</li>
							<li><a href="#" class="tit">金浦国际机场</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_gimpo.gif" alt="金浦国际机场" /></div>
									<div class="map-info">
										<p class="title">金浦国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场3楼出国审查台后，</p>
										<p class="txt02">位于36号登机口前面。</p> 
										<p class="tel"><span>联系方式</span>: 02-2666-5285</p>
									</div> 
								</div>
							</li>
							<li><a href="#" class="tit">大邱国际机场</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_daegu.gif" alt="大邱国际机场" /></div>
									<div class="map-info map-tow">
										<p class="title">大邱国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于左侧。</p> 
										<p class="tel"><span>联系方式</span>: 053-981-8277</p>
									</div> 
								</div>
							</li>
							<li><a href="#" class="tit">金海国际机场</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_gimhae.gif" alt="金海国际机场" /></div>
									<div class="map-info map-tow">
										<p class="title">金海国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于右侧。</p>
										<p class="tel"><span>联系方式</span>: 051-971-5901</p>
									</div> 
								</div>
							</li>
							<li><a href="#" class="tit">釜山港</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_busan.gif" alt="釜山港" /></div>
									<div class="map-info map-tow">
										<p class="title">釜山港</p>
										<p class="txt"><span>位置</span>: 通过码头2楼出国审查台后，位于右侧。</p> 
										<p class="tel"><span>联系方式</span>: 051-465-0181</p>
									</div> 
								</div>
							</li> 
						</ul>
					</div>
					<!-- //[D] 0826 인도장 안내 수정 통으로 변경 -->
				</div><!-- end product-review -->
			</div><!-- end product-detail -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>