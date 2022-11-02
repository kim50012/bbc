<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="58px" />
						<col width="101px" />
						<col width="340px" />
						<col width="99px" span="4" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="2" class="frst-chiild"><input type="checkbox" title="all-check" /></th>
							<th scope="col" class="info">商品名</th>
							<th scope="col">优惠</th>
							<th scope="col">销售金额</th>
							<th scope="col">数量</th>
							<th scope="col">购买金额</th>
							<th scope="col">订购/删除</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="first-child"><input type="checkbox" title="해당상품 선택" /></td>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p> 
								<p class="product"><a href="#">光感精华素 EX 50ml</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
								<div class="option">
									<p class="opt">Natural Skin (01)<span class="btn-layer"><img src="/images/shop/cn/order/btn_option.gif" alt="更改选项" /></span></p>
									<div class="basket-layer">
										<div class="layer-head">
											<p class="title"><img src="/images/shop/cn/order/layer_title.gif" alt="更改选项" /></p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="닫기" /></p>
										</div><!-- end layer-head -->
										<div class="layer-body">
											<p class="top-tit"><span>[TAG HEUER]</span> TAG HEUER CARRERA</p>
											<div class="layer-table">
												<table summary="상품옵션 재설정 서식">
													<caption>옵션 설정</caption>
													<colgroup>
														<col width="91px" />
														<col width="*" />
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">색상</th>
															<td>
																<select class="color" title="색상을 선택하세요">
																	<option>색상</option>
																</select>
															</td>
														</tr>
														<tr>
															<th scope="row">사이즈</th>
															<td>
																<select class="size" title="사이즈를 선택하세요">
																	<option>사이즈</option>
																</select>
															</td>
														</tr>
													</tbody>
												</table>
											</div><!-- end option -->
											<div class="btn-set">
												<input type="image" src="/images/shop/cn/order/btn_change.gif" alt="取消" /> 
												<a href="#"><img src="/images/shop/cn/order/btn_opt_reset.gif" alt="变更选项" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
								</div><!-- end option -->
							</td>
							<td>
								<dl>
									<dt>积分</dt>
									<dd>
										<span class="nation-currency">￦1,234</span>
									</dd>
									<dt>打折 </dt>
									<dd>
										<span class="nation-currency">$33.60</span>
										<span class="nation-currency">(约 ￥10.30)</span>
										<span class="rating">(20%)</span>
										<p><a href="#"><img src="/images/shop/cn/order/btn_coupon.gif" alt="下载优惠券" /></a></p>
									</dd>
								</dl>
							</td>
							<td>
								<span class="origin">$168</span>
								<span class="nation-currency">$168</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
							<td>
								<div class="number">
									<div class="num">
										<input type="text" title="数量" />
										<p class="btn-num">
											<span class="up"><img src="/images/shop/cn/order/btn_up.gif" alt="plus" /></span>
											<span class="down"><img src="/images/shop/cn/order/btn_down.gif" alt="minus" /></span>
										</p>
									</div>
								</div><!-- end number -->
								<p class="update"><a href="#"><img src="/images/shop/cn/order/btn_num.gif" alt="更改数量" /></a></p>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
							<td>
								<ul>
									<li><a href="#"><img src="/images/shop/cn/order/btn_buy.gif" alt="立即购买" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_wish.gif" alt="关注商品" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_dell.gif" alt="删除" /></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="first-child"><input type="checkbox" title="해당상품 선택" /></td>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p> 
								<p class="product"><a href="#">光感精华素 EX 50ml</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
								<div class="option">
									<p class="opt">Natural Skin (01)<span class="btn-layer"><img src="/images/shop/cn/order/btn_option.gif" alt="更改选项" /></span></p>
									<div class="basket-layer">
										<div class="layer-head">
											<p class="title"><img src="/images/shop/cn/order/layer_title.gif" alt="更改选项" /></p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="close" /></p>
										</div><!-- end layer-head -->
										<div class="layer-body">
											<p class="top-tit"><span>[TAG HEUER]</span> TAG HEUER CARRERA</p>
											<div class="layer-table">
												<table summary="상품옵션 재설정 서식">
													<caption>옵션 설정</caption>
													<colgroup>
														<col width="91px" />
														<col width="*" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="first-child"><img src="//image.ssgdfs.com/images/shop/order/th_layer_pattern.gif" alt="구분" /></th>
															<th scope="col"><img src="//image.ssgdfs.com/images/shop/order/th_choice_option.gif" alt="옵션 선택" /></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">색상</th>
															<td>
																<select class="color" title="색상을 선택하세요">
																	<option>색상</option>
																</select>
															</td>
														</tr>
														<tr>
															<th scope="row">사이즈</th>
															<td>
																<select class="size" title="사이즈를 선택하세요">
																	<option>사이즈</option>
																</select>
															</td>
														</tr>
													</tbody>
												</table>
											</div><!-- end option -->
											<div class="btn-set">
												<input type="image" src="//image.ssgdfs.com/images/shop/order/btn_change.gif" alt="取消" /> 
												<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_soupon_reset.gif" alt="变更选项" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
								</div><!-- end option -->
							</td>
							<td>
								<dl>
									<dt>积分</dt>
									<dd>
										<span class="nation-currency">￦1,234</span>
									</dd>
									<dt>打折 </dt>
									<dd>
										<span class="nation-currency">$33.60</span>
										<span class="nation-currency">(约 ￥10.30)</span>
										<span class="rating">(20%)</span>
										<p>优惠券下载完毕</p>
									</dd>
								</dl>
							</td>
							<td>
								<span class="origin">$168</span>
								<span class="nation-currency">$168</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
							<td>
								<div class="number">
									<div class="num">
										<input type="text" title="数量" />
										<p class="btn-num">
											<span class="up"><img src="/images/shop/cn/order/btn_up.gif" alt="plus" /></span>
											<span class="down"><img src="/images/shop/cn/order/btn_down.gif" alt="minus" /></span>
										</p>
									</div>
								</div><!-- end number -->
								<p class="update"><a href="#"><img src="/images/shop/cn/order/btn_num.gif" alt="更改数量" /></a></p>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
							<td>
								<ul>
									<li><a href="#"><img src="/images/shop/cn/order/btn_buy.gif" alt="立即购买" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_wish.gif" alt="关注商品" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_dell.gif" alt="删除" /></a></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="120px" />
						<col width="370px" />
						<col width="99px" />
						<col width="109px" />
						<col width="99px" />
						<col width="99px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first-child" colspan="2">商品名</th>
							<th scope="col">优惠</th>
							<th scope="col">优惠券</th>
							<th scope="col">销售金额</th>
							<th scope="col">数量</th>
							<th scope="col">购买金额</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
								</p>
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
								<p class="product">
										<a href="#">
											兰蔻 精华肌底液(环采臻皙光感精华素环采臻皙
											光感精华素 EX 50ml
										</a>
								</p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<p class="opt">Natural Skin (01)</p>
							</td>
							<td>
								<dl>
									<dt>积分</dt>
									<dd>
										<span class="nation-currency">￦1,234</span>
									</dd>
									<dt>打折 </dt>
									<dd>
										<span class="nation-currency">$33.60</span>
										<span class="nation-currency">(约 ￥10.30)</span>
										<span class="rating">(20%)</span>
										<p><a href="#"><img src="/images/shop/cn/order/btn_coupon.gif" alt="下载优惠券" /></a></p>
									</dd>
								</dl>
							</td>
							<td>
								<div>
									<a href="#"><img src="/images/shop/cn/order/btn_use.gif" alt="使用优惠券" /></a>
								</div>
								<span class="coupon-apply">20%优惠券</span></td>
							<td>
								<span class="origin">$168</span>
								<span class="nation-currency">$168</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
							<td>
									2
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



