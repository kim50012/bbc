<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
$(function($){
	
	$('.scroll-pane').jScrollPane({showArrows: true});
	/* 레이어팝업 클릭 */
	$(".pop-box").hide();
	$(".coupon-pop-box a").click(function(){
		$(this).next().show();
		return false;
	});

	$(".pop-box p.title a").click(function(){
		$(this).parent().parent().hide();
	});
});
	

</script>

</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/order/h1_calculator.gif" alt="计算器" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="order">
			<div class="detail-pop">
				<table summary="计算器">
					<caption>计算器</caption>
					<colgroup>
						<col width="132px" />
						<col width="136px" />
						<col width="166px" />
					</colgroup>
					<tbody>
						<tr>
							<th colspan="3" class="first-child ">
								<div class="copy-product">
									<p class="pop-product-name">[에스티로더]Perfectionist [CP+R] Wrinkle Lifting</p>
									<p class="pop-product-info">상품명상품명상품명상품명상품명</p>
								</div>
							</th>
						</tr>
						<tr>
							<th scope="row" colspan="2"><img src="/images/shop/cn/order/calculator_tit01.gif" alt="销售价" /></th>
							<td>$52(￦57,380)</td>
						</tr>
						<tr>
							<th scope="row" colspan="2"><img src="/images/shop/cn/order/calculator_tit02.gif" alt="折扣价" /></th>
							<td>$52(￦57,380)</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/calculator_tit03.gif" alt="网上会员价: Family" /></th>
							<th><span class="grade">HONOURS VIP</span></th>
							<td>$52(￦57,380)</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/calculator_tit04.gif" alt="打折券" /></th>
							<th>
								<div class="coupon-pop-box">
									<a href="#"><img src="/images/shop/cn/order/calculator_btn.gif" alt="查询可用优惠券" /></a>
									<div class="pop-box">
										<p class="title">
											<img src="/images/shop/cn/order/calculator_layer.gif" alt="可适用优惠券" /><a href="#"><img src="/images/shop/cn/order/btn_close_pop.gif" alt="close" /></a>
										</p>
										<div class="scroll-pane">
											<div class="coupon-list">
												<p>
													<input type="radio" id="thanks-coupon" name="use-coupon" />
													<label for="thanks-coupon">고객감사 10% 할인쿠폰</label>
												</p>
												<p>
													<input type="radio" id="event-coupon" name="use-coupon" />
													<label for="event-coupon">4월 이벤트 기획전 $1 할인쿠폰</label>	
												</p>
												<p>
													<input type="radio" id="thanks-coupon" name="use-coupon" />
													<label for="thanks-coupon">고객감사 10% 할인쿠폰</label>
												</p>
												<p>
													<input type="radio" id="event-coupon" name="use-coupon" />
													<label for="event-coupon">4월 이벤트 기획전 $1 할인쿠폰</label>	
												</p>
												<p>
													<input type="radio" id="thanks-coupon" name="use-coupon" />
													<label for="thanks-coupon">고객감사 10% 할인쿠폰</label>
												</p>
												<p>
													<input type="radio" id="event-coupon" name="use-coupon" />
													<label for="event-coupon">4월 이벤트 기획전 $1 할인쿠폰</label>	
												</p>
												<p>
													<input type="radio" id="thanks-coupon" name="use-coupon" />
													<label for="thanks-coupon">고객감사 10% 할인쿠폰</label>
												</p>
											</ul>
										</div><!-- end scrollpane -->
									</div><!-- end pop-box -->
									<p class="btn"><a href="#"><img src="/images/shop/cn/order/btn_close_s.gif" alt="关闭" /></a></p>
								</div><!-- end  coupon-list-->
							</th>
							<td>$52(￦57,380)</td>
						</tr>
						<tr>
							<th scope="row">
								<img src="/images/shop/cn/order/calculator_tit05.gif" alt="拥有积分" />
								<p><input type="checkbox" title="적립금 사용여부 체크" id="use-money" name="use-money" /><label for="use-money">￦10,000</label></p>
							</th>
							<th><input type="text" title="사용 적립금" /></th>
							<td>-$10</td>
						</tr>
						<tr>
							<th scope="row">
								<img src="/images/shop/cn/order/calculator_tit06.gif" alt="可立即使用积分" />
								<p><input type="checkbox" title="즉시할인 적립금 사용여부 체크" id="now-save" name="now-save" /><label for="now-save">￦10,000</label></p>
							</th>
							<th><input type="text" title="사용 적립금" /></th>
							<td>$52(￦57,380)</td>
						</tr>
						<tr class="final">
							<th scope="row" colspan="2"><img src="/images/shop/cn/order/calculator_tit07.gif" alt="最终预付金额" /></th>
							<td class="final-price">
								<span class="ori">$4,031</span>
								<span>(￦4,513,108)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end passport -->
			<span class="txt-tipping">今日汇率$1 ≒ ￥6.38</span>
			<div class="btn-set">
				<a href="#"><img src="/images/shop/cn/order/btn_close_s.gif" alt="关闭" /></a>
				<input type="image" src="/images/shop/cn/order/calculator_btn02.gif" alt="计算" />
			</div><!-- end btn-close -->
			<div class="notice-section cal-box">
				<ul class="notice">
					<li>在发放的优惠券中选择可适用优惠券，折扣金额将被自动计算。</li>
					<li>7折以下折扣商品或部分品牌有可能不适用优惠券。</li>
					<li>拥有积分最多可使用优惠券适用价的30%。</li>
					<li>可立即使用的优惠券是购买相应商品时将要发放的积分，<br /> 购买商品时可以立即使用。 </li>
				</ul>
			</div>			
		</div><!-- end order -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>