<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>

<script type="text/javascript">
jQuery(function($){

		$('.terms-scroll').jScrollPane({showArrows: true});
			
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
				<strong>주문서 작성</strong>
			</div><!-- end page-location -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="//image.ssgdfs.com/images/shop/order/step01_off.gif" alt="step01 장바구니" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step02_on.gif" alt="step02 주문서작성" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step03_off.gif" alt="step03 결제하기" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step04_off.gif" alt="step04 주문완료" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>주문하실 상품 및 수량이 모두 맞는지 다시 한 번 확인해 주십시오.</li>
						<li>수정이 필요할 경우 목록 하단의 이전화면으로 버튼을 클릭하시면 장바구니 화면으로 이동합니다</li>
						<li>주문고객정보는 반드시<span>출국자 본인과 일치</span>해야 합니다. 특히 <span>여권정보를 정확히 입력</span>해주십시오.</li>
						<li>출국자정보가 상이할 경우 출국시 인도장에서 상품을 수령하실 수 없으니 모든 정보를 정확히 입력해 주십시오.</li>
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
				</div><!-- end benefit-con -->s
			</div><!-- end order-step -->
			<div class="terms-box">
				<h3><img src="//image.ssgdfs.com/images/shop/order/h3_terms_agree.gif" alt="개인정보보호동의" /></h3>
				<p class="form-tit"><img src="//image.ssgdfs.com/images/shop/order/terms_tit01.gif" alt="신세계인터넷면세점 구매 약관 동의" /></p>
				<div class="terms-scroll">
					<div class="terms-box">
					<p>신세계인터넷면세점 이용약관</p>

					 <p>제 1 장 총 칙 </p>
					
					
					
					<p>제 1 조 (목적)</p>
					
					 <p>본 약관은 (주)조선호텔 (이하 "회사"라 칭함)이 운영하는 사이버 쇼핑몰(신세계인터넷면세점; http://www.ssgdfs.com)(이하 "쇼핑몰"이라 함)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 함)를 이용함에 있어 쇼핑몰과 이용자의 권리•의무 및 책임사항을 규정하여 고객 권익을 보호함을 목적으로 합니다. </p>
					
					
					
					<p>제 2 조 (약관의 효력 및 개정) </p>
					
					<p>1. 본 약관은, "회사"가 본 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 "쇼핑몰"의 서비스 화면을 통하여 이를 게시하거나 기타의 방법으로 회원에게 통지함으로써 그 효력이 발생됩니다.</p>
					
					<p>2. "회사"는 영업상 중요한 사유가 발생될 경우와 기타 "회사"가 필요하다고 인정하는 경우에 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래 기본법」, 「전자 서명법」, 「정보통신망 이용촉진 및 정보보호등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자 보호법」, 「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. </p>
					
					<p>3. "회사"는 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 적용일자 7일 이전부터 적용일자 전일까지 제1항과 같은 방법으로 공지 또는 통지합니다. 이 때, 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만, 이미 계약을 체결한자가 "회사"의 동의를 얻은 경우 개정약관 조항을 적용할 수 있습니다.</p>
					
					 <p>4. 회원은 개정된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, "쇼핑몰"서비스화면에 게시된 개정된 약관에 대해 "동의하지 않음"의 의사 표현이 없을 경우 개정된 약관에 동의하는 것으로 간주됩니다.</p>


					</div>
				</div><!-- end terms-box -->
					<p class="terms-yn-box">
						<input type="radio" id="terms-yes1" name="terms-yn1" /><label for="terms-yes1">동의함</label>
						<input type="radio" id="terms-no1" name="terms-yn1" /><label for="terms-no1">동의하지 않음</label>
					</p>
				<div class="terms-box">
				<p class="form-tit"><img src="//image.ssgdfs.com/images/shop/order/terms_tit02.gif" alt="비회원 개인정보보호 동의" /></p>
					<div class="terms-scroll">
						<div class="terms-box">
						<p>신세계인터넷면세점 이용약관</p>

						 <p>제 1 장 총 칙 </p>
						
						
						
						<p>제 1 조 (목적)</p>
						
						 <p>본 약관은 (주)조선호텔 (이하 "회사"라 칭함)이 운영하는 사이버 쇼핑몰(신세계인터넷면세점; http://www.ssgdfs.com)(이하 "쇼핑몰"이라 함)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 함)를 이용함에 있어 쇼핑몰과 이용자의 권리•의무 및 책임사항을 규정하여 고객 권익을 보호함을 목적으로 합니다. </p>
						
						
						
						<p>제 2 조 (약관의 효력 및 개정) </p>
						
						<p>1. 본 약관은, "회사"가 본 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 "쇼핑몰"의 서비스 화면을 통하여 이를 게시하거나 기타의 방법으로 회원에게 통지함으로써 그 효력이 발생됩니다.</p>
						
						<p>2. "회사"는 영업상 중요한 사유가 발생될 경우와 기타 "회사"가 필요하다고 인정하는 경우에 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래 기본법」, 「전자 서명법」, 「정보통신망 이용촉진 및 정보보호등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자 보호법」, 「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다. </p>
						
						<p>3. "회사"는 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 적용일자 7일 이전부터 적용일자 전일까지 제1항과 같은 방법으로 공지 또는 통지합니다. 이 때, 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만, 이미 계약을 체결한자가 "회사"의 동의를 얻은 경우 개정약관 조항을 적용할 수 있습니다.</p>
						
						 <p>4. 회원은 개정된 약관에 동의하지 않을 경우 회원 탈퇴를 요청할 수 있으며, "쇼핑몰"서비스화면에 게시된 개정된 약관에 대해 "동의하지 않음"의 의사 표현이 없을 경우 개정된 약관에 동의하는 것으로 간주됩니다.</p>
						</div>
					</div><!-- end terms-scroll -->
					<p class="terms-yn-box">
						<input type="radio" id="terms-yes2" name="terms-yn2" /><label for="terms-yes2">동의함</label>
						<input type="radio" id="terms-no2" name="terms-yn2" /><label for="terms-no2">동의하지 않음</label>
					</p>
				</div><!-- end terms-box -->
			</div>
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_next.gif" alt="다음단계로" /></a>
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_cancel_w.gif" alt="취소" /></a>
			</div><!-- end order-btn -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



