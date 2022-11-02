<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/order/h1_product_review.gif" alt="商品评论" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox_scroll">
				<div class="product-pop review-pop">
					<div class="detail-pop">
						<div class="product-container review-con">
							<p class="img-product"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="商品" /></p>
							<div class="product-info">
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="copy-right">가장 퍼펙트한 화장품</p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
							</div>
						</div>
						<table summary=" 商品评论">
							<caption> 商品评论</caption>
							<colgroup>
								<col width="110px" />
								<col width="430px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><img src="/images/shop/cn/order/review_tit01.gif" alt="商品评价种类" /></th>
									<td>
										<p class="postion-type">
											<input type="radio" id="normal-posting" name="posting-type"/><label for="normal-posting">Premium商品评价</label>
											<input type="radio" id="secret-posting" name="posting-type" /><label for="secret-posting">一般商品评价</label>
										</p>
									</td>
								</tr><!--
								<tr>
									<th scope="row"><img src="/images/shop/cn/order/review_tit02.gif" alt="商品评论" /></th>
									<td>
										<div class="s-container">
											<p class="img-product"><img src="/images/shop/cn/order/temp_review.gif" alt="상품정보이미지" /></p>
											<div class="product-info">
												<p class="brand"><a href="#">[KIEHL`S]</a></p>
												<p class="copy-right">가장 퍼펙트한 화장품</p>
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML</a></p>
												<p class="product-num"><a href="#">REF. NO : PEANU-MD.F/97</a></p>
											</div>
										</div>  //product-container 
									</td>
								</tr>-->
								<tr>
									<th scope="row"><img src="/images/shop/cn/order/review_tit03.gif" alt="商品评论" /></th>
									<td>
										<div class="star-box">
											<p>价格</p>
											<ul>
												<li>
													<input type="radio" id="p-star5" name="price" />
													<label for="p-star5">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="p-star4" name="price" />
													<label for="p-star4">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="p-star3" name="price" />
													<label for="p-star3">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="p-star2" name="price" />
													<label for="p-star2">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="p-star1" name="price" />
													<label for="p-star1">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
											</ul>
										</div>
										<div class="star-box">
											<p>设计</p>
											<ul>
												<li>
													<input type="radio" id="d-star5" name="degin" />
													<label for="d-star5">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="d-star4" name="degin" />
													<label for="d-star4">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="d-star3" name="degin" />
													<label for="d-star3">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="d-star2" name="degin" />
													<label for="d-star2">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="d-star1" name="degin" />
													<label for="d-star1">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
											</ul>
										</div>
										<div class="star-box">
											<p>品质</p>
											<ul>
												<li>
													<input type="radio" id="q-star5" name="quality" />
													<label for="q-star5">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="q-star4" name="quality" />
													<label for="q-star4">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="q-star3" name="quality" />
													<label for="q-star3">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="q-star2" name="quality" />
													<label for="q-star2">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="q-star1" name="quality" />
													<label for="q-star1">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
											</ul>
										</div>
										<div class="star-box">
											<p>满意度</p>
											<ul>
												<li>
													<input type="radio" id="c-star5" name="contentment" />
													<label for="c-star5">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="c-star4" name="contentment" />
													<label for="c-star4">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="c-star3" name="contentment" />
													<label for="c-star3">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="c-star2" name="contentment" />
													<label for="c-star2">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
												<li>
													<input type="radio" id="c-star1" name="contentment" />
													<label for="c-star1">
														<img src="/images/shop/cn/product/detail/star_on.gif" alt="star1" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star2" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star3" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star4" />
														<img src="/images/shop/cn/product/detail/star_off.gif" alt="star5" />
													</label>
												</li>
											</ul>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row"><img src="/images/shop/cn/order/review_tit03.gif" alt="题目" /></th>
		
									<td><input type="text" title="제목" /></td>
								</tr>
								<tr>
									<th scope="row">
										<img src="/images/shop/cn/order/review_tit04.gif" alt="内容" />
									</th>
									<td><textarea rows="4" cols="65"></textarea></td>
								</tr>
								<tr>
									<th scope="row">
										<img src="/images/shop/cn/order/review_tit05.gif" alt="添加图片" />
									</th>
									<td class="add-image">
										<div class="add-box">
											<p>
												<input type="text" title="제목" /><span class="file-box"><input type="file" class="file-add" /></span>
												<span class="file-name">사진.gif<a href="#"><img src="/images/shop/cn/order/btn_x02.gif" alt="close" /></a></span>
											</p>
											<p>
												<input type="text" title="제목" /><span class="file-box"><input type="file" class="file-add" /></span>
												<span class="file-name">사진.gif<a href="#"><img src="/images/shop/cn/order/btn_x02.gif" alt="close" /></a></span>
											</p>
											<p>
												<input type="text" title="제목" /><span class="file-box"><input type="file" class="file-add" /></span>
												<span class="file-name">사진.gif<a href="#"><img src="/images/shop/cn/order/btn_x02.gif" alt="close" /></a></span>
											</p>
										</div>
										<p class="txt-tipping">只能添加JPG(JPEG), GIF 格式的图片，且文件名必须为英文或数字。</p>
										<p class="txt-tipping">图片最多能够添加3个。</p>
									</td>
								</tr>
							</tbody>
						</table>
						<span class="txt-tipping">购买商品后写Premium商品评价，. 则通选择<a href="#">赠送积分\○○。</a></span>
						<div class="btn-set">
							<a href="#"><img src="/images/shop/cn/order/btn_cancel_b.gif" alt="确认" /></a>
							<input type="image" src="/images/shop/cn/order/btn_ok.gif" alt="取消" />
						</div><!-- end btn-close -->
					</div><!-- end detail-pop -->
				</div><!-- end product-pop -->

			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>