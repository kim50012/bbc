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
jQuery(function($){
	$(".coupon-progress").hide();
	$("#coupon01").show();
	$('.inside').jScrollPane({showArrows: true});
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
		<h1><img src="//image.ssgdfs.com/images/shop/couponbox/h1_guide.gif" alt="쿠폰 이용안내" /> </h1>
		<p class="close"><span onclick="self.close();"><img src="//image.ssgdfs.com/images/shop/order/btn_close_pop.gif" alt="닫기" /></span></p>
	</div><!-- end head -->
	<div id="body">
		<div class="coupon-zone">
			<h2><img src="//image.ssgdfs.com/images/shop/couponbox/h2_use_guide.gif" alt="쿠폰 이용 안내" /></h2>
			<ul class="guide-line">
				<li>쿠폰, 적립금 사용 후 최종결제금액이 \50,000이상일 경우 사용 가능합니다.</li>
				<li>발행일로부터 6개월간 사용하실수 있습니다.</li>
				<li>1주문서에 1장만 사용 가능합니다.</li>
				<li>주문취소시 사용하신 현금쿠폰은 소멸됩니다.(환불불가)</li>
				<li>현금쿠폰 사용후 남은 잔액은 소멸됩니다.(환불불가)</li>
				<li>1회 출국시 1장만 사용 가능합니다.</li>
				<li>30%이상 할인상품 및 일부 브랜드는 사용이 불가합니다.</li>
			</ul>
			<h2><img src="//image.ssgdfs.com/images/shop/couponbox/h2_register_guide.gif" alt="쿠폰 등록 안내" /></h2>
			<dl>
				<dt>쿠폰 등록이란?</dt>
				<dd>
					- 화폐와 같은 형태로 발행되는 신세계 인터넷면세점 이용권과 영수증, 문자 및 이메일로 받으시는 쿠폰의 핀번호<br />
					입력을 통하여 주문결제시 사용 가능합니다.
				</dd>
				<dt>쿠폰 등록 및 사용 안내</dt>
				<dd class="step">
					<ul>
						<li>
							<p class="step01">
								신세계 인터넷 면세점<br />
								방문
							</p>
						</li>
						<li>
							<p class="step02">
								쿠폰 등록<br />
								(쿠폰번호 등록)
							</p>
						</li>
						<li><p class="step03">상품 구매</p></li>
						<li>
							<p class="step04">
								주문서 작성 시<br />
								쿠폰 사용
							</p>
						</li>
					</ul>
				</dd>
			</dl>
			<p class="link-regi"><a href="#"><img src="//image.ssgdfs.com/images/shop/couponbox/link_coupon_regi.gif" alt="쿠폰 등록 바로 가기" /></a></p>
		</div><!-- end coupon-zone -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>



