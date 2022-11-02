<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/coupon.css" rel="stylesheet" type="text/css" />
<link href="/css/couponzone.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.slider.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/brand.js"></script>
<script type="text/javascript">
jQuery(function($){
	$(".price-slider").slider({
			range: true,
			min: 0,
			max: 1600,
			orientation: "horizontal",
			value: 100,
			values: [ 0, 1600 ],
			slide: function( event, ui ) {
				 $(".ui-slider-handle" ).eq(0).find("span.range-text").text( + ui.values[ 0 ]);
				 $(".ui-slider-handle" ).eq(1).find("span.range-text").text( + ui.values[ 1 ]);
				 $(".max").val("$"+ui.values[ 1 ]);
				 $(".min").val("$"+ui.values[ 0 ]);
			}
		});
		$(".ui-slider-handle" ).eq(0).find("span.range-text").text($(".price-slider" ).slider( "values", 0 ));
		$(".ui-slider-handle" ).eq(1).find("span.range-text").text( $(".price-slider" ).slider( "values", 1 ));
		$(".max").val($(".price-slider" ).slider( "values", 1 ));
		$(".min").val($(".price-slider" ).slider( "values", 0 ));


		$(".qna-board tr td a").click(function(){
			$(".qna-board tr.answer").children().hide();
			question = $(this).parent().parent();
			question.next().children().show();
			return false;
		});

		$(".coupon-set").hide();
		$("#coupon-set01").show();

		$(".coupon-navi ul li a").click(function(){
			naviClick($(this));
			return false;
		});
		$(".coupon-navi ul li a").mouseover(function(){
			naviClick($(this));
			return false;
		});
		$(".coupon-navi p a").click(function(){
			$(".coupon-set").hide();
			$($(this).attr("href")).show();
			return false;
		});
		naviClick = function(obj){
			$(".coupon-navi ul li").attr("class" , "");
			obj.parent().attr("class" , "selected");
			$(".coupon-set").hide();
			$(obj.attr("href")).show();
		}
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation">  
				<p class="title"><img src="/images/shop/cn/common/title_coupon.gif" alt="COUPON" /></p>
				<a href="#">홈으로</a><span>&gt;</span><strong>쿠폰</strong>
			</div>
			<div class="coupon-zone">
				<div class="coupon-info">
					<div class="area-info">
						<img src="/images/shop/cn/couponbox/bg_html.gif" alt="新世界网上免税店" />
					</div><!-- end area-info -->
					<div class="info-register">
						<div class="coupon-box">
							<p class="section-title"><img src="/images/shop/cn/couponbox/coupon_top_title.gif" alt="COUPON 专为新世界免税店会员提供的特别优惠" /></p>
							<div class="popular-coupon">
								<ul>
									<li>
										<div class="down-info info-type01">
											<p class="info"><img src="/images/shop/cn/couponbox/couponset_txt01.gif" alt="适用5~20%的 基本折扣(各品牌折扣率存在差异) " /></p>
										</div><!-- end down-info -->
									</li>
									<li>
										<div class="down-info info-type02">
										<p class="info"><img src="/images/shop/cn/couponbox/couponset_txt02.gif" alt="用多种优惠券享受折上再折 " /></p>
									</li>
									<li>
										<div class="down-info info-type03">
										<p class="info"><img src="/images/shop/cn/couponbox/couponset_txt03.gif" alt="再加上2%的购物积分!(各品牌存在差异） " /></p>
									</li>
								</ul>
								<span class="plus01"><img src="/images/shop/cn/couponbox/ico_plus.png" alt="plus" /></span>
								<span class="plus02"><img src="/images/shop/cn/couponbox/ico_plus.png" alt="plus" /></span>
							</div><!-- end popular-coupon -->
						</div>
						<div class="coupon-tab">
							<ul>
								<li><a href="#"><img src="/images/shop/cn/couponbox/top_txt01.gif" alt="注册优惠券" /></a></li>
								<li><a href="#"><img src="/images/shop/cn/couponbox/top_txt02.gif" alt="优惠券使用指南" /></a></li>
								<li><a href="#"><img src="/images/shop/cn/couponbox/top_txt03.gif" alt="查看我的优惠券" /></a></li>
							</ul>
						</div>
					</div><!-- end info-regster -->
				</div><!-- end coupon-info -->
				<div class="coupon-section">
					<div class="section-container">
						<p class="title-line"><img src="/images/shop/cn/couponbox/coupon_title01.gif" alt="COUPON" /></p>
						<p class="down-all"><a href="#"><img src="/images/shop/cn/couponbox/btn_all_down.gif" alt="下载全部优惠券" /></a></p>
						<div class="coupon-list">
							<div class="coupon-navi">
								<ul>
									<li class="selected"><a href="#coupon-set01">주말 추가 할인 쿠폰</a></li>
									<li><a href="#coupon-set03">최대 17% 파워 할인 쿠폰</a></li>
									<li><a href="#">할인 정률 쿠폰</a></li>
									<li><a href="#">더블 쿠폰</a></li>
									<li><a href="#">정액쿠폰에 정률 쿠폰 한번 더</a></li>
								</ul>
								<p><a href="#coupon-set02"><img src="/images/shop/cn/couponbox/btn_coupon_search.gif" alt="搜索按购买金额赠送的优惠券" /></a></p>
							</div><!-- end coupon-navi -->
							<div class="coupon-set" id="coupon-set01">
								<p class="comment"><img src="/images/shop/cn/couponbox/coupon_tit_s01.gif" alt="NEW COUPON 请享受新世界免税店的全新优惠券。" /></p>
								<p class="btn-coupon">
									<a href="#"><img src="/images/shop/cn/couponbox/btn_all.gif" alt="选择全部" /></a>
									<a href="#"><img src="/images/shop/cn/couponbox/btn_download.gif" alt="下载所选优惠券" /></a>
								</p>
								<div class="listing-coupon">
									<ul>
										<li>
											<div class="coupon coupon-type01">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type01.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check01" />
												<label for="coupon-check01">정액+정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type02">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type02.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check02" />
												<label for="coupon-check02">할인정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type03">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type03.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check03" />
												<label for="coupon-check03">정액+정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type04">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type04.gif" alt="折扣" />
												</p>
												<p class="comment">최대 $ 25  파워 쿠폰</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check04" />
												<label for="coupon-check04">더블쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type02">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type02.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check05" />
												<label for="coupon-check05">할인정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type03">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type03.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check06" />
												<label for="coupon-check06">더블쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
									</ul>
								</div><!-- end listing-coupon -->
							</div><!-- end coupon-set -->
							<div class="coupon-set" id="coupon-set02">
								<p class="comment"><img src="/images/shop/cn/couponbox/search_title01.gif" alt="搜索按购买金额赠送的优惠券" />
									<span><img src="/images/shop/cn/couponbox/search_title01_sub.gif" alt="请查询按购买金额可使用的优惠券。" /></span>
								</p>
								<p class="setting-txt">请设定购买金额</p>
								<div class="price-range-search">
									<div class="price-range">
										<div class="price-slider">
										</div><!-- end price-slider -->
									</div><!-- end price-range -->	
									<div class="search-range">
										<input type="text" class="min" /> ~
										<input type="text" class="max" />
										<input type="image" src="/images/shop/cn/couponbox/btn_search.gif" alt="搜索" />
									</div><!-- end search-range -->
								</div><!-- end price-range-search -->
								<p class="down-txt">可以下载按购买金额使用的优惠券。</p>
								<p class="btn-coupon">
									<a href="#"><img src="/images/shop/cn/couponbox/btn_all.gif" alt="选择全部" /></a>
									<a href="#"><img src="/images/shop/cn/couponbox/btn_download.gif" alt="下载所选优惠券" /></a>
								</p>
								<div class="listing-coupon">
									<ul>
										<li>
											<div class="coupon coupon-type01">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type01.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check01" />
												<label for="coupon-check01">정액+정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type02">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type02.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check02" />
												<label for="coupon-check02">할인정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type03">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type03.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check03" />
												<label for="coupon-check03">정액+정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type04">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type04.gif" alt="折扣" />
												</p>
												<p class="comment">최대 $ 25  파워 쿠폰</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check04" />
												<label for="coupon-check04">더블쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type02">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type02.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check05" />
												<label for="coupon-check05">할인정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type03">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type03.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check06" />
												<label for="coupon-check06">더블쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
									</ul>
								</div><!-- end listing-coupon -->
							</div><!-- end coupon-set -->
							<div class="coupon-set" id="coupon-set03">
								<p class="comment"><img src="/images/shop/cn/couponbox/search_comment01.gif" alt="쿠폰그룹명" /></p>
								<p class="btn-coupon">
									<a href="#"><img src="/images/shop/cn/couponbox/btn_all.gif" alt="选择全部" /></a>
									<a href="#"><img src="/images/shop/cn/couponbox/btn_download.gif" alt="下载所选优惠券" /></a>
								</p>
								<div class="rating-guide">
									<div class="guide-rate">
										<ul>
											<li>본 쿠폰은 모든 상품에 적용이 가능하나 주문당 1개의 쿠폰 사용만 가능합니다.</li>
											<li>다운받으신 쿠폰의 유효기간은 쿠폰 별로 다르니 확인 하시기 바랍니다.</li>
											<li>쿠폰당 할인율이 다르게 적용 됩니다. 상품 구매 시에 유념하시기 바랍니다.</li>
										</ul>
									</div><!-- end guide-rate -->
									<div class="exclude-brand">
										<dl>
											<dt><img src="/images/shop/cn/couponbox/exclude_brand.gif" alt="不可适用优惠券的商品或品牌" /></dt>
											<dd>
												<ul>
													<li>브랜드명</li>
													<li>브랜드명</li>
													<li>브랜드명</li>
													<li>브랜드명</li>
													<li>브랜드명</li>
													<li>브랜드명</li>
													<li>브랜드명</li>
													<li>브랜드명</li>
												</ul>
												<ul>
													<li>상품명</li>
													<li>상품명</li>
													<li>상품명</li>
													<li>상품명</li>
													<li>상품명</li>
													<li>상품명</li>
													<li>상품명</li>
													<li>상품명</li>
												</ul>
											</dd>
										</dl>
									</div><!-- end exclude brand -->
								</div><!-- end rate-guide -->
								<div class="listing-coupon">
									<ul>
										<li>
											<div class="coupon coupon-type01">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type01.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check01" />
												<label for="coupon-check01">정액+정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type02">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type02.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check02" />
												<label for="coupon-check02">할인정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type03">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type03.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check03" />
												<label for="coupon-check03">정액+정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type04">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type04.gif" alt="折扣" />
												</p>
												<p class="comment">최대 $ 25  파워 쿠폰</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check04" />
												<label for="coupon-check04">더블쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type02">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">$999</span>
													<img src="/images/shop/cn/common/rate_type02.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check05" />
												<label for="coupon-check05">할인정률쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
										<li>
											<div class="coupon coupon-type03">
												<span class="title">SHINSEFAE DUTY FREE COUPON</span>
												<p>
													<span class="rate">999%</span>
													<img src="/images/shop/cn/common/rate_type03.gif" alt="折扣" />
												</p>
											</div><!-- end coupon -->
											<p class="check-down">
												<input type="checkbox" id="coupon-check06" />
												<label for="coupon-check06">더블쿠폰</label>
												<a href="#"><img src="/images/shop/cn/couponbox/btn_down.gif" alt="下载" /></a>
											</p>
										</li>
									</ul>
								</div><!-- end listing-coupon -->
							</div><!-- end coupon-set --> <!-- [D] 0906 앞에 주석 닫기 -->
						</div><!-- end coupon-list -->
					</div><!-- end section-container -->
				</div><!-- end coupon-section -->
				<div class="use-guide">
					<div class="guide">
						<p class="title-line"><img src="/images/shop/cn/couponbox/coupon_title02.gif" alt="优惠券使用指南" /></p>
						<ul>
							<li>每个订单号只可使用1张优惠券。</li>
							<li>退货时部分优惠券不予退还。</li>
							<li>优惠券不适用于7折以下折扣商品及部分品牌。 </li>
							<li>详情咨询客服中心(1577-0161)。</li>
						</ul>
					</div><!-- end guide -->
					<div class="inquiry">
						<p><img src="/images/shop/cn/couponbox/inquiry_tit.gif" alt="关于优惠券更详细的内容请利用FAQ 或 1:1咨询。" /></p>
						<ul>
							<li><a href="#"><img src="/images/shop/cn/couponbox/btn_inquiry01.gif" alt="优惠券FAQ" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/couponbox/btn_inquiry02.gif" alt="1:1 咨询" /></a></li>
						</ul>
					</div><!-- end inquiry -->
				</div><!-- end use-guide -->
			</div><!-- end coupon-zone -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>