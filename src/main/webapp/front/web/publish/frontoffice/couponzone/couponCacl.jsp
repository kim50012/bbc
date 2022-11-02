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
				<p class="title"><img src="//image.ssgdfs.com/images/shop/common/title_coupon.gif" alt="COUPON" /></p>
				<a href="#">홈으로</a><span>&gt;</span><strong>쿠폰</strong>
			</div>
			<div class="coupon-zone">
				<div class="coupon-info">
					<div class="area-info">
						<img src="//image.ssgdfs.com/images/shop/couponbox/bg_html.gif" alt="" />
					</div><!-- end area-info -->
					<div class="info-register">
						<p class="section-title"><img src="//image.ssgdfs.com/images/shop/couponbox/coupon_title.gif" alt="COUPON ZONE 쿠폰 이상의 감동! 신세계 인터넷 면세점 쿠폰" /></p>
						<p class="btn-set-guide">
							<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/btn_guide.gif" alt="쿠폰 이용안내" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/btn_my_coupon.gif" alt="나의 보유 쿠폰 보기" /></a>
						</p>
						<div class="regist-section">
							<div class="guide-regi">
								<div class="notice">
									<dl>
										<dt><img src="//image.ssgdfs.com/images/shop/couponbox/guide_title.gif" alt="신세계인터넷면세점의 쿠폰 철칙 No.3" /> </dt>
										<dd>
											<ul>
												<li>
													<img src="//image.ssgdfs.com/images/shop/couponbox/num01.gif" alt="1" />
													<img src="//image.ssgdfs.com/images/shop/couponbox/guide_line01.gif" alt="쿠폰을 잘 보시면 할인혜택이 커집니다." />
												</li>
												<li>
													<img src="//image.ssgdfs.com/images/shop/couponbox/num02.gif" alt="2" />
													<img src="//image.ssgdfs.com/images/shop/couponbox/guide_line02.gif" alt="영수증 버리지 마세요. 쿠폰번호가 숨어 있어요." />
												</li>
												<li>
													<img src="//image.ssgdfs.com/images/shop/couponbox/num03.gif" alt="3" />
													<img src="//image.ssgdfs.com/images/shop/couponbox/guide_line03.gif" alt="결제 완료 문자. 꼭 확인 하시고 쿠폰 번호 챙기세요" />
												</li>
											</ul>
										</dd>
									</dl>
								</div><!-- end notice -->
								<div class="register-coupon">
									<p class="title"><img src="//image.ssgdfs.com/images/shop/couponbox/title_register.gif" alt="신세계 인터넷 면세점 쿠폰등록" /></p>
									<p class="btn"><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/btn_register.gif" alt="쿠폰등록하기" /></a></p>
									<p class="comment"><img src="//image.ssgdfs.com/images/shop/couponbox/regist_comment.gif" alt="보유하신 쿠폰의 PIN 번호를 등록하세요!!" /></p>
								</div><!-- end regster-coupon -->
							</div><!-- end guide-regi -->
							<div class="popular-coupon">
								<ul>
									<li>
										<div class="down-info info-type01">
											<p class="zone-title">
												<img src="//image.ssgdfs.com/images/shop/couponbox/list_title01.gif" alt="인기쿠폰 SHINSEGAE DUTYFREE" />
											</p>
											<p class="info"><img src="//image.ssgdfs.com/images/shop/couponbox/temp_coupon.gif" alt="최대 " /></p>
											<p class="down">
												<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/btn_down.gif" alt="쿠폰다운로드" /></a>
											</p>
										</div><!-- end down-info -->
									</li>
									<li>
										<div class="down-info info-type02">
											<p class="zone-title"><img src="//image.ssgdfs.com/images/shop/couponbox/list_title02.gif" alt="알뜰쿠폰 SHINSEGAE DUTYFREE" /></p>
											<p class="info">
												<img src="//image.ssgdfs.com/images/shop/couponbox/temp_coupon02.gif" alt="더블쿠폰으로 더욱 알차게 쇼핑을 즐기세요!!" />
											</p><!-- end info -->
											<p class="down"><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/btn_down.gif" alt="쿠폰다운로드" /></a></p>
										</div><!-- end down-info -->
									</li>
									<li>
										<div class="down-info info-type03">
											<p class="zone-title"><img src="//image.ssgdfs.com/images/shop/couponbox/list_title03.gif" alt="마감임박 쿠폰 SHINSEGAE DUTYFREE" /></p>
											<ul>
												<li><a href="#"><span>[마감 3일전]</span> PRADA 기획 쿠폰</a></li>
												<li><a href="#"><span>[마감 3일전]</span> PRADA 기획 쿠폰</a></li>
												<li><a href="#"><span>[마감 3일전]</span> PRADA 기획 쿠폰</a></li>
												<li><a href="#"><span>[마감 3일전]</span> PRADA 기획 쿠폰</a></li>
											</ul>
										</div><!-- end down-info -->
									</li>
								</ul>
							</div><!-- end popular-coupon -->
						</div><!-- end register-section -->
					</div><!-- end info-regster -->
				</div><!-- end coupon-info -->
				<div class="coupon-section">
					<p class="title-line"><img src="//image.ssgdfs.com/images/shop/couponbox/sub_title.gif" alt="COUPON" /></p>
					<p class="down-all"><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/coupon_all_down.gif" alt="쿠폰전체 다운로드" /></a></p>
					<div class="coupon-list">
						<div class="coupon-navi">
							<ul>
								<li class="selected"><a href="#">주말 추가 할인 쿠폰</a></li>
								<li><a href="#">최대 17% 파워 할인 쿠폰</a></li>
								<li><a href="#">할인 정률 쿠폰</a></li>
								<li><a href="#">더블 쿠폰</a></li>
								<li><a href="#">정액쿠폰에 정률 쿠폰 한번 더</a></li>
							</ul>
							<p><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/link_search_coupon.gif" alt="구매 금액별 쿠폰 검색" /></a></p>
						</div><!-- end coupon-navi -->
						<div class="coupon-set">
							<p class="comment"><img src="//image.ssgdfs.com/images/shop/couponbox/search_comment.gif" alt="구매 금액별 구매 금액대별로 사용가능 한 쿠폰을 검색해 보세요." /></p>
							<p class="btn-coupon">
								<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/check_all.gif" alt="전체 선택" /></a>
								<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰다운로드" /></a>
							</p>
							<div class="price-range-search">
								<div class="price-range">
									<div class="price-slider">		
									</div><!-- end price-slider -->
								</div><!-- end price-range -->	
								<div class="search-range">
									<input type="text" class="min" /> ~
									<input type="text" class="max" />
									<input type="image" src="//image.ssgdfs.com/images/shop/couponbox/btn_search.gif" alt="검색" />
								</div><!-- end search-range -->
							</div><!-- end price-range-search -->
							<div class="listing-coupon">
								<ul>
									<li>
										<div class="coupon coupon-type01">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">999%</span>
												<img src="//image.ssgdfs.com/images/shop/common/rate_type01.gif" alt="할인" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check01" />
											<label for="coupon-check01">정액+정률쿠폰</label>
											<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰 다운로드" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type02">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">$999</span>
												<img src="//image.ssgdfs.com/images/shop/common/rate_type02.gif" alt="할인" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check02" />
											<label for="coupon-check02">할인정률쿠폰</label>
											<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰 다운로드" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type03">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">999%</span>
												<img src="//image.ssgdfs.com/images/shop/common/rate_type03.gif" alt="할인" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check03" />
											<label for="coupon-check03">정액+정률쿠폰</label>
											<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰 다운로드" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type04">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">$999</span>
												<img src="//image.ssgdfs.com/images/shop/common/rate_type04.gif" alt="할인" />
											</p>
											<p class="comment">최대 $ 25  파워 쿠폰</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check04" />
											<label for="coupon-check04">더블쿠폰</label>
											<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰 다운로드" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type02">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">$999</span>
												<img src="//image.ssgdfs.com/images/shop/common/rate_type02.gif" alt="할인" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check05" />
											<label for="coupon-check05">할인정률쿠폰</label>
											<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰 다운로드" /></a>
										</p>
									</li>
									<li>
										<div class="coupon coupon-type03">
											<span class="title">SHINSEFAE DUTY FREE COUPON</span>
											<p>
												<span class="rate">999%</span>
												<img src="//image.ssgdfs.com/images/shop/common/rate_type03.gif" alt="할인" />
											</p>
										</div><!-- end coupon -->
										<p class="check-down">
											<input type="checkbox" id="coupon-check06" />
											<label for="coupon-check06">더블쿠폰</label>
											<a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/download.gif" alt="쿠폰 다운로드" /></a>
										</p>
									</li>
								</ul>
							</div><!-- end listing-coupon -->
						</div><!-- end coupon-set -->
					</div><!-- end coupon-list -->
				</div><!-- end coupon-section -->
				<div class="use-guide">
					<div class="guide">
						<p class="title-line"><img src="//image.ssgdfs.com/images/shop/couponbox/title_guide.gif" alt="쿠폰이용안내" /></p>
						<ul>
							<li>쿠폰, 적립금 사용 후 최종결제금액이 ￦50,000이상일 경우 사용 가능합니다.</li>
							<li>30%이상 할인상품 및 일부 브랜드는 사용이 불가합니다.</li>
							<li>발행일로부터 6개월간 사용하실수 있습니다.</li>
							<li>1주문서에 1장만 사용 가능합니다.</li>
							<li>주문취소시 사용하신 현금쿠폰은 소멸됩니다.(환불불가)</li>
							<li>현금쿠폰 사용후 남은 잔액은 소멸됩니다.(환불불가)</li>
							<li>1회 출국시 1장만 사용 가능합니다.</li>
						</ul>
					</div><!-- end guide -->
					<div class="inquiry">
						<p class="title-line"><img src="//image.ssgdfs.com/images/shop/couponbox/title_inquiry.gif" alt="쿠폰문의" /></p>
						<p><img src="//image.ssgdfs.com/images/shop/couponbox/guide_comment.gif" alt="쿠폰에 대해 궁금하신 사항은 아래의 메뉴를 통하여 질문 가능 합니다. " /></p>
						<ul>
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/one_one.gif" alt="1:1문의 바로가기" /></a></li>
							<li><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/link_faq.gif" alt="쿠폰 FAQ 바로가기" /></a></li>
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