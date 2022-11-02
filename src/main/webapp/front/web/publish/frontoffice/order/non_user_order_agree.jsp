<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
jQuery(function($){
	
	$('.guide-line').jScrollPane({showArrows: true});
			
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-location">
				<a href="#">홈으로</a>
				<span>&gt;</span>
				<strong>장바구니</strong>
			</div><!-- end page-location -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="//image.ssgdfs.com/images/shop/order/step01_on.gif" alt="step01 장바구니" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step02_off.gif" alt="step02 주문서작성" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step03_off.gif" alt="step03 결제하기" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step04_off.gif" alt="step04 주문완료" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>주문하실 상품 및 수량이 모두 맞는지 다시 한 번 확인해 주십시오. </li>
						<li>수정이 필요할 경우 목록 하단의 이전화면으로 버튼을 클릭하시면 장바구니 화면으로 이동합니다. </li>
						<li>주문고객정보는 반드시 <span>출국자 본인과 일치</span>해야 합니다. 특히 <span>여권정보를 정확히 입력</span>해 주십시오. </li>
						<li>출국자정보가 상이할 경우 출국시 인도장에서 상품을 수령하실 수 없으니 모든 정보를 정확히 입력해 주십시오. </li>
					</ul>
				</div><!-- end step -->
				<div class="user-info benefit-con">
					<p class="tit">
						<img src="//image.ssgdfs.com/images/shop/order/recommend_login.gif" alt="로그인하시면 혜택을 확인하실 수 있습니다." />
					</p>
					<p class="benefit"><img src="//image.ssgdfs.com/images/shop/order/member_benefit.gif" alt="회원님께 드리는 혜택" /></p>
					<p class="benefit-list">
						<img src="//image.ssgdfs.com/images/shop/order/img_savemoney.gif" alt="신규가입적립금" class="first-child" />
						<img src="//image.ssgdfs.com/images/shop/order/img_unrestricted.gif" alt="무제한할인찬스" />
						<img src="//image.ssgdfs.com/images/shop/order/img_giftcard.gif" alt="신세계상품권" />
					</p>
				</div><!-- end benefit-con -->
			</div><!-- end order-step -->
			<div class="user-agree">
				<h3 class="line-none"><img src="//image.ssgdfs.com/images/shop/order/h3_user_agree.gif" alt="개인정보보호 동의" /></h3>
				<h4><img src="//image.ssgdfs.com/images/shop/order/h4_user_agree01.gif" alt="신세계 인터넷 면세점 구매 약관동의" /></h4>
				<div class="guide-line">
					<div style="width: 900px; height: 1000px;"></div>
				</div><!-- guide-line -->
				<h4><img src="//image.ssgdfs.com/images/shop/order/h4_user_agree02.gif" alt="비회원 개인정보보호 동의" /></h4>
				<div class="guide-line">
					<div style="width: 900px; height: 1000px;"></div>
				</div><!-- end guide-line -->
				<div class="btn-set">
					<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_next_step.gif" alt="다음단계로" /></a>
					<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_go_basket.gif" alt="장바구니로 이동" /></a>
				</div><!-- end btn-set -->
			</div><!-- end user-agree -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



