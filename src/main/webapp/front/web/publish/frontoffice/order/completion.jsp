<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 장바구니

</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
jQuery(function($){
	
			/*** select box ***/

			$("#passport-year").selectbox();
			$("#passport-month").selectbox();
			$("#passport-date").selectbox();
			
			$("#cellphone-number").selectbox();
			
			$("#starting").selectbox();
			$("#via-choice").selectbox();
			
			$("#daparture-hour").selectbox();
			$("#daparture-min").selectbox();
			
			$("#destination-choice").selectbox();
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
				<strong>결제하기</strong>
			</div><!-- end page-location -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="//image.ssgdfs.com/images/shop/order/step01_off.gif" alt="step01 장바구니" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step02_off.gif" alt="step02 주문서작성" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step03_off.gif" alt="step03 결제하기" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step04_on.gif" alt="step04 주문완료" /></p></li>
					</ul>
					<!-- [D] 0811 <ul class="step-notice">~</ul> 변경 -->
					<ul class="step-notice">
						<li>인터넷면세점에서 구매하신 상품은 공항 또는 항만의 정해진 인도장에서만 수령이 가능합니다.</li>
						<li>상품주문내역은<span>마이페이지&gt;주문내역에서 확인하실 수 있으며 교환권도 출력</span>하실 수 있습니다.</li>
						<li>주문서를 출력하셔서 출국 당일 인도장에서 제시하시면 보다 신속하게 인도받으실 수 있습니다.</li>
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
			<div class="completion-box">
				<!-- [D] 0811 <p class="tit">~</p> 변경 -->
				<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/completion_tit.gif" alt="성공적으로 상품주문이 완료되었습니다." /></p>
				<p class="txt"><img src="//image.ssgdfs.com/images/shop/order/completion_txt.gif" alt="신세계 인터넷 면세점을 이용해 주셔서 감사합니다." /></p>
				<p class="number">
					<span class="completion-name">홍길동</span>
					<img src="//image.ssgdfs.com/images/shop/order/completion_no.gif" alt="님의 주문번호는" />
					<span class="completion-no">123485</span>
					<img src="//image.ssgdfs.com/images/shop/order/completion_no2.gif" alt="입니다." />
				</p>
			</div>
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_order_info.gif" alt="주문기본정보" /></h3>
			<div class="order-board">
				<table summary="결제를 위한 고객 정보 확인 게시판" class="info-check">
					<caption>고객 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="320px" />
						<col width="178px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span>주문번호</span></th>
							<td class="order-no">0000000<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order_sheet.gif" alt="주문서출력" /></a></td>
							<th scope="row"><span>주문일시</span></th>
							<td class="date">2013-05-01 15:19:34</td>
						</tr>
						<tr>
							<th scope="row"><span>주문상태<a href="#"><img src="//image.ssgdfs.com/images/shop/order/ico_help.gif" alt="도움말" /></a></span></th>
							<td>주문처리중</td>
							<th scope="row"><span>상품인도장</span></th>
							<td><p>인천공항 서편인도장<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_product_info.gif" alt="인도장 안내" /></a></p></td>
						</tr>
					</tbody>
				</table>
				<p class="check-tit">- 주문자 정보<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_info_change.gif" alt="주문정보 변경 안내" /></a></p>
				<table summary="결제를 위한 주문자 정보 확인 게시판" class="info-check">
					<caption>주문자 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="320px" />
						<col width="178px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span>성명(ID)</span></th>
							<td>홍길동<span>(fgk234)</span></td>
							<th scope="row"><span>생년월일(성별)</span></th>
							<td>2013-01-30(남성)</td>
						</tr>
						<tr>
							<th scope="row"><span>휴대폰</span></th>
							<td>010-2566-4547</td>
							<th scope="row"><span>연락처</span></th>
							<td>051-534-6619</td>
						</tr>
						<tr>
							<th scope="row"><span>이메일</span></th>
							<td colspan="3">Bingplan@ssgdfs.com</td>
						</tr>
						<tr>
							<!-- [D] 0811 text변경 -->
							<th scope="row"><span>기타 정보</span></th>
							<td colspan="3">예쁘게 블라블라~</td>
						</tr>
					</tbody>
				</table>
				<p class="check-tit">- 여권 정보</p>
				<table summary="결제를 위한 여권 정보 확인 게시판" class="info-check">
					<caption>여권 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="320px" />
						<col width="178px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span>국적</span></th>
							<td>KOR<span>(한국)</span></td>
							<!-- [D] 0811 text변경 -->
							<th scope="row"><span>영문이름</span></th>
							<td>HONG GILDONG</td>
						</tr>
						<tr>
							<th scope="row"><span>여권번호</span></th>
							<td>M53456388</td>
							<th scope="row"><span>여권 만료일</span></th>
							<td>2020-07-06</td>
						</tr>
					</tbody>
				</table>
				<p class="check-tit">- 출국 정보</p>
				<table summary="결제를 위한 출국 정보 확인 게시판" class="info-check">
					<caption>출국 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="320px" />
						<col width="178px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span>출국일시</span></th>
							<td colspan="3">2013-06-30<span>17:45</span></td>
						</tr>
						<tr>
							<th scope="row"><span>출발지</span></th>
							<td>코비하</td>
							<th scope="row"><span>도착지</span></th>
							<td>미국/괌/사이판</td>
						</tr>
						<tr>
							<th scope="row"><span>편명</span></th>
							<td>KOBEE</td>
							<th scope="row"><span>직항/경유여부</span></th>
							<td>직항</td>
						</tr>
						<!-- [D] 0811 e-티켓 <tr>~</tr> 추가 -->
						<tr>
							<th scope="row"><span>e-티켓</span></th>
							<td colspan="3">
								<p class="e-ticket"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_e_ticket.gif" alt="e-티켓 등록" /></a></p>
								<p class="plus">* 2013-05-02 15:19 까지 관련파일을 등록하지 않으시면 기간만료로 인해 주문이 자동으로 취소됩니다.</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_order_product_info.gif" alt="주문 상픔정보" /></h3>
			<div class="basket">
				<table summary="주문한 상픔정보 표">
					<caption>주문 상픔정보</caption>
					<colgroup>
						<col width="119px" />
						<col width="580px" />
						<col width="99px" span="3" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="bor-non" colspan="2">상품명</th>
							<th scope="col">수량</th>
							<th scope="col">적립금</th>
							<th scope="col">구매금액</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_sale.gif" alt="sale" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_best.gif" alt="best" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_new.gif" alt="new" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="사은품" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="쿠폰" />
								</p>								
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="copy-right">가장 퍼펙트한 화장품</p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
							</td>
							<td>2</td>
							<td>1,000원</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
						</tr>
						<tr>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_sale.gif" alt="sale" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_best.gif" alt="best" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_new.gif" alt="new" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="사은품" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="쿠폰" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#">[54NS 1BO3M1]</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
							</td>
							<td>2</td>
							<td>1,000원</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			<div class="freebie">
				<h3><img src="//image.ssgdfs.com/images/shop/order/h3_freebie.gif" alt="사은품" /></h3>
				<div class="occasion occ-completion">
					<ul class="ceremony-listing">
						<li>
							<div class="list-ceremony">
								<ul>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name">키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name">키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li class="bor-none">
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name">키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name">키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name">키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li class="bor-none">
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name">키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
								</ul>
							</div><!-- end list-ceremony -->
						</li>
					</ul>
				</div><!-- end freebie -->
			</div>
			<h3 class="payment-tit"><img src="//image.ssgdfs.com/images/shop/order/h3_payment_info.gif" alt="결제정보" /></h3>
			<div class="total-price">
				<ul>
					<li class="order">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit01.gif" alt="상품합계금액" /></p>
						<p class="order-price"><span class="dollar">$4,498</span><span>(￦50,054,403)</span><img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="minus" /></p>
					</li>
					<li class="discount">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit02.gif" alt="할인/적립금사용금액" /></p>
						<p class="discount-price"><span class="dollar">$745.4</span><span>(￦40,513,108)</span></p>
						<div class="discount-box">
							<div class="total-title"><img src="//image.ssgdfs.com/images/shop/order/total_title01.gif" alt="할인금액" /><p>$<span>467.0 (￦413,108)</span></p></div>
							<dl class="first">
								<dt><img src="//image.ssgdfs.com/images/shop/order/basic_discount.gif" alt="기본할인" /></dt>
								<dd>
									<ul>
										<li class="coupon-box">
											<span class="dis-txt">온라인 회원 할인</span>
											<span class="dis-pri">$4.40 (￦6,450)</span>
										</li>
										<li class="coupon-box">
											<span class="dis-txt">온라인 회원 할인</span>
											<span class="dis-pri">$4.40 (￦6,450)</span>
										</li>
										<li><span class="pay-price">$367.0 (￦413,108)</span></li>
									</ul>
								</dd>
							</dl>
						</div>
						<div class="total-title"><img src="//image.ssgdfs.com/images/shop/order/total_title02.gif" alt="적립금 사용금액" /><p>$<span>467.0 (￦413,108)</span></p></div>
						<dl class="first">
							<dt><img src="//image.ssgdfs.com/images/shop/order/sin_point.gif" alt="신세계포인트" /></dt>
							<dd><span class="pay-price">P 123,456</span></dd>
						</dl>
					</li>
					<li class="payment">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit03.gif" alt="총결제금액" /></p>
						<p class="payment-price"><span class="ori">$4,031</span><span>(￦40,513,108)</span><img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="equal" class="equal" /></p>
					</li>
				</ul>
				<p class="total-txt">
					<strong>홍길동</strong> 회원님은 <span class="font-red">신용카드</span>를 사용하여 <span class="font-red">일시불</span>로 결제하셨습니다.
					<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_receipt.gif" alt="영수증출력" /></a>
				</p>
			</div><!-- end total-price -->
			<span class="bill">매출전표 또는 현금영수증은 "영수증 출력"을 통해 발급받으실 수 있습니다.</span>
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_go_on.gif" alt="계속 쇼핑하기" /></a>
			</div><!-- end order-btn -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



