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
				<a href="#">?????????</a><span>&gt;</span><strong>??????</strong>
			</div>
			<div class="coupon-zone">
				<div class="coupon-info">
					<div class="area-info">
						<img src="/images/shop/cn/couponbox/bg_html.gif" alt="????????????????????????" />
					</div><!-- end area-info -->
					<div class="info-register">
						<div class="coupon-box">
							<p class="section-title"><img src="/images/shop/cn/couponbox/coupon_top_title.gif" alt="COUPON ???????????????????????????????????????????????????" /></p>
								<div class="popular-coupon">
								<ul>
									<li>
										<div class="down-info info-type01">
											<p class="info"><img src="/images/shop/cn/couponbox/couponset_txt01.gif" alt="??????5~20%??? ????????????(??????????????????????????????) " /></p>
										</div><!-- end down-info -->
									</li>
									<li>
										<div class="down-info info-type02">
										<p class="info"><img src="/images/shop/cn/couponbox/couponset_txt02.gif" alt="???????????????????????????????????? " /></p>
									</li>
									<li>
										<div class="down-info info-type03">
										<p class="info"><img src="/images/shop/cn/couponbox/couponset_txt03.gif" alt="?????????2%???????????????!(???????????????????????? " /></p>
									</li>
								</ul>
								<span class="plus01"><img src="/images/shop/cn/couponbox/ico_plus.png" alt="plus" /></span>
								<span class="plus02"><img src="/images/shop/cn/couponbox/ico_plus.png" alt="plus" /></span>
							</div><!-- end popular-coupon -->
						</div>
						<div class="coupon-tab">
							<ul>
								<li><a href="#"><img src="/images/shop/cn/couponbox/top_txt01.gif" alt="???????????????" /></a></li>
								<li><a href="#"><img src="/images/shop/cn/couponbox/top_txt02.gif" alt="?????????????????????" /></a></li>
								<li><a href="#"><img src="/images/shop/cn/couponbox/top_txt03.gif" alt="?????????????????????" /></a></li>
							</ul>
						</div>
					</div><!-- end info-regster -->
				</div><!-- end coupon-info -->
				<div class="coupon-section">
					<p class="title-line"><img src="/images/shop/cn/couponbox/sub_title.gif" alt="COUPON" /></p>
					<p class="down-all"><a href="#"><img src="/images/shop/cn/couponbox/coupon_all_down.gif" alt="???????????? ????????????" /></a></p>
					<div class="coupon-list">
						<div class="coupon-navi">
							<ul>
								<li class="selected"><a href="#">?????? ?????? ?????? ??????</a></li>
								<li><a href="#">?????? 17% ?????? ?????? ??????</a></li>
								<li><a href="#">?????? ?????? ??????</a></li>
								<li><a href="#">?????? ??????</a></li>
								<li><a href="#">??????????????? ?????? ?????? ?????? ???</a></li>
							</ul>
							<p><a href="#"><img src="/images/shop/cn/couponbox/link_search_coupon.gif" alt="?????? ????????? ?????? ??????" /></a></p>
						</div><!-- end coupon-navi -->
						<div class="coupon-set">
							<p class="comment"><img src="/images/shop/cn/couponbox/search_comment01.gif" alt="?????? ?????? ??? ?????? 17% ??????!! ??? ?????? ????????? ?????? ????????? 9??? ?????? ?????? ?????? / ????????????" /></p>
							<p class="btn-coupon">
								<a href="#"><img src="/images/shop/cn/couponbox/check_all.gif" alt="?????? ??????" /></a>
								<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="??????????????????" /></a>
							</p>
							<div class="rating-guide">
								<div class="guide-rate">
									<p><img src="/images/shop/cn/couponbox/title_guide_sub.gif" alt="????????????" /></p>
									<ul>
										<li>??? ????????? ?????? ????????? ????????? ???????????? ????????? 1?????? ?????? ????????? ???????????????.</li>
										<li>??????????????? ????????? ??????????????? ?????? ?????? ????????? ?????? ????????? ????????????.</li>
										<li>????????? ???????????? ????????? ?????? ?????????. ?????? ?????? ?????? ??????????????? ????????????.</li>
									</ul>
								</div><!-- end guide-rate -->
								<div class="exclude-brand">
									<dl>
										<dt><img src="/images/shop/cn/couponbox/exclude_brand.gif" alt="???????????????????????????????????????" /></dt>
										<dd>
											<ul>
												<li>????????????</li>
												<li>????????????</li>
												<li>????????????</li>
												<li>????????????</li>
												<li>????????????</li>
												<li>????????????</li>
												<li>????????????</li>
												<li>????????????</li>
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
												<img src="/images/shop/cn/common/rate_type01.gif" alt="??????" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check01" />
											<label for="coupon-check01">??????+????????????</label>
											<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="?????? ????????????" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type02">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">$999</span>
												<img src="/images/shop/cn/common/rate_type02.gif" alt="??????" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check02" />
											<label for="coupon-check02">??????????????????</label>
											<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="?????? ????????????" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type03">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">999%</span>
												<img src="/images/shop/cn/common/rate_type03.gif" alt="??????" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check03" />
											<label for="coupon-check03">??????+????????????</label>
											<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="?????? ????????????" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type04">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">$999</span>
												<img src="/images/shop/cn/common/rate_type04.gif" alt="??????" />
											</p>
											<p class="comment">?????? $ 25  ?????? ??????</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check04" />
											<label for="coupon-check04">????????????</label>
											<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="?????? ????????????" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type02">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">$999</span>
												<img src="/images/shop/cn/common/rate_type02.gif" alt="??????" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check05" />
											<label for="coupon-check05">??????????????????</label>
											<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="?????? ????????????" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type03">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">999%</span>
												<img src="/images/shop/cn/common/rate_type03.gif" alt="??????" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check06" />
											<label for="coupon-check06">????????????</label>
											<a href="#"><img src="/images/shop/cn/couponbox/download.gif" alt="?????? ????????????" /></a>
										</p>
									</li>
								</ul>
							</div><!-- end listing-coupon -->
						</div><!-- end coupon-set -->
					</div><!-- end coupon-list -->
				</div><!-- end coupon-section -->
				<div class="use-guide">
					<div class="guide">
						<p class="title-line"><img src="/images/shop/cn/couponbox/coupon_title02.gif" alt="?????????????????????" /></p>
						<ul>
							<li>???????????????????????????1???????????????</li>
							<li>???????????????????????????????????????</li>
							<li>?????????????????????7??????????????????????????????????????? </li>
							<li>????????????????????????(1577-0161)???</li>
						</ul>
					</div><!-- end guide -->
					<div class="inquiry">
						<p><img src="/images/shop/cn/couponbox/inquiry_tit.gif" alt="??????????????????????????????????????????FAQ ??? 1:1?????????" /></p>
						<ul>
							<li><a href="#"><img src="/images/shop/cn/couponbox/btn_inquiry01.gif" alt="?????????FAQ" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/couponbox/btn_inquiry02.gif" alt="1:1 ??????" /></a></li>
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