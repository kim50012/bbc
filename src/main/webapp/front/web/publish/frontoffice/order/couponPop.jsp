<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
jQuery(function($){	
	$(".coupon-progress").hide();
	$("#coupon01").show();
	/* [D] 0812 삭제  $('.inside').jScrollPane({showArrows: true});  */
	$(".tab-menu ul li a").click(function(){
		$(".coupon-progress").hide();
		$(".tab-menu ul li").removeClass("selected");
		$(this).parent().addClass("selected");
		$($(this).attr("href")).show();
		$('.inside').jScrollPane({showArrows: true});
		return false;
	});

});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1>查看及使用优惠券</h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox_scroll">
		
				<div class="order">
					<div class="tab-menu">
						<ul class="coupon-tab p-coupon">
							<li class="first-child selected"><a href="#coupon01">可使用优惠券</a></li><!-- 拥有优惠券(보유쿠폰)=> 可使用优惠券(사용가능한쿠폰) 으로 수정-->
							<li><a href="#coupon02">可下载优惠券</a></li>
							
						</ul>
					</div><!-- end tab-menu -->
					<div id="coupon01" class="coupon-progress">
						<p class="guide">选择将要适用的优惠券后点击“使用优惠券”按钮，系统将自动输入折扣金额。</p>
						<div class="coupon-table">
							<table summary ="적용할 쿠폰 타입 쿠폰 금액을 선택하는 표">
								<caption>적용쿠폰</caption>
								<colgroup>
									<col width="101px" />
									<col width="110px" />
									<col width="225px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first-child">区分</th>
										<th scope="col" class="re-size">优惠券种类</th>
										<th scope="col">选择优惠券</th>
									</tr>
								</thead>
							</table>
							<div class="inside-no">
								<table summary="区分 , 优惠券种类, 选择优惠券">
									<colgroup>
										<col width="103px" />
										<col width="100px" />
										<col width="207px" />
									</colgroup>
									<tbody>
										<tr>
											<td rowspan="2" class="first-child">
											<input type="radio" id="overwriting00" />
											<label for="overwriting00">可重复</label>
											</td>
											<td class="coupon re-size" style="width: 110px"><p>Power</p><p>优惠券</p></td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="pcoupon01" />
														<label for="pcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon02" />
														<label for="pcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon03" />
														<label for="pcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>	
										<tr>
											<td class="coupon re-size" style="width: 110px">婚礼优惠券</td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="pcoupon01" />
														<label for="pcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon02" />
														<label for="pcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon03" />
														<label for="pcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>	
										<tr>
											<td rowspan="2" class="first-child">
												<input type="radio" id="overwriting01" />
												<label for="overwriting01">不可重复</label>
											</td>
											<td class="coupon re-size" style="width: 110px">双重优惠券</td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="pcoupon01" />
														<label for="pcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon02" />
														<label for="pcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon03" />
														<label for="pcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>	
										<tr>
											<td class="coupon re-size" style="width: 110px">双重优惠券</td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="pcoupon01" />
														<label for="pcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon02" />
														<label for="pcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon03" />
														<label for="pcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>				
									</tbody>
								</table>
							</div><!-- end inside-no -->
						</div><!-- end coupon-table -->
						<div class="coupon-table coupon-result">
							<table summary="적용될 상품금액 현황을 보여주는 표">
								<caption>상품 금액</caption>
								<colgroup>
									<col width="100px" />
									<col width="136px" />
									<col width="86px" />
									<col width="107px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first-child">商品金额</th>
										<th scope="col">选择优惠券</th>
										<th scope="col">折扣金额</th>
										<th scope="col">适用折扣金额</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first-child">
											<span class="origin">$1,000</span>
											<span>(约 ￥125.00)</span>
										</td>
										<td class="coupon">
											<ul>
												<li>쿠폰명 [ 00% ]</li>
												<li>쿠폰명 [ 00% ]</li>
												<li>쿠폰명 [ 00% ]</li>
											</ul>
										</td>
										<td><p>-$1,000</p><p>(约 ￥125.00)</p></td>
										<td>
											<span class="discount">$1,000</span>
											<span>(约 ￥125.00)</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!-- end coupon-result -->
						<div class="btn-set">
							<a href="#"><img src="/images/shop/cn/order/btn_close_cn.gif" alt="关闭" /></a>
							<a href="#"><img src="/images/shop/cn/order/btn_add_coupon.gif" alt="使用优惠券" /></a>
						</div><!-- end btn-set -->
					</div><!-- end coupon01 -->
					<div id="coupon02"  class="coupon-progress">
						<p class="guide">选择将要适用的优惠券后点击“使用优惠券”按钮，系统将自动输入折扣金额。</p>
						<div class="coupon-table">
							<table summary ="적용할 쿠폰 타입 쿠폰 금액을 선택하는 표">
								<caption>적용쿠폰</caption>
								<colgroup>
									<col width="101px" />
									<col width="110px" />
									<col width="225px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first-child">拥有优惠券</th>
										<th scope="col" class="re-size">可下载优惠券</th>
										<th scope="col">选择优惠券</th>
									</tr>
								</thead>
							</table>
							<div class="inside-no">
								<table summary="적용 쿠폰 정보 선택 하는 표">
									<colgroup>
										<col width="102px" />
										<col width="110px" />
										<col width="205px" />
									</colgroup>
									<tbody>
										<tr>
											<td rowspan="2" class="first-child">
												不可重复
											</td>
											<td class="coupon re-size" style="width: 110px"><p>Power</p><p>优惠券</p></td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="pcoupon011" />
														<label for="pcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon012" />
														<label for="pcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon013" />
														<label for="pcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td class="coupon re-size">婚礼优惠券</td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="wcouponc011" />
														<label for="wcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="wcoupon012" />
														<label for="wcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="wcoupon013" />
														<label for="wcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td rowspan="2" class="first-child">
												不可重复
											</td>
											<td class="coupon re-size">双重优惠券</td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="pcoupon021" />
														<label for="pcoupon001">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon022" />
														<label for="pcoupon002">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="pcoupon023" />
														<label for="pcoupon003">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td class="coupon re-size">双重优惠券</td>
											<td class="coupon-price">
												<ul>
													<li>
														<input type="checkbox" id="wcouponc021" />
														<label for="wcoupon01">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="wcoupon022" />
														<label for="wcoupon02">쿠폰명 [ 할인율 00% ]</label>
													</li>
													<li>
														<input type="checkbox" id="wcoupon023" />
														<label for="wcoupon03">쿠폰명 [ 할인율 00% ]</label>
													</li>
												</ul>
											</td>
										</tr>					
									</tbody>
								</table>
								<div class="line-txt-cn">
									没有可下载的优惠券。
								</div>
							</div><!-- end inside-no -->
						</div><!-- end coupon-table -->
						<div class="btn-set">
							<a href="#"><img src="/images/shop/cn/order/btn_all_down.gif" alt="全部选择" /></a>
							<a href="#"><img src="/images/shop/cn/order/btn_close_cn.gif" alt="关闭" /></a>
							<a href="#"><img src="/images/shop/cn/order/btn_soupon_down.gif" alt="下载" /></a>
						</div><!-- end btn-set -->
					</div><!-- end coupon02 -->

				</div><!-- end order -->
				
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>



