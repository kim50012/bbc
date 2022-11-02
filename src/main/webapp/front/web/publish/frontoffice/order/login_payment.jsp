<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 결제하기

</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
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
						<li class="first-child"><p><img src="//image.ssgdfs.com/images/shop/order/step01_off.gif" alt="step01 장바구니" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step02_off.gif" alt="step02 주문서작성" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step03_on.gif" alt="step03 결제하기" /></p></li>
						<li><p><img src="//image.ssgdfs.com/images/shop/order/step04_off.gif" alt="step04 주문완료" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>주문하실 상품 및 수량이 모두 맞는지 다시 한 번 확인해 주십시오.</li>
						<li>수정이 필요할 경우 목록 하단의 이전화면으로 버튼을 클릭하시면 장바구니 화면으로 이동합니다</li>
						<li>주문고객정보는 반드시<span>출국자 본인과 일치</span>해야 합니다. 특히 <span>여권정보를 정확히 입력</span>해주십시오.</li>
						<li>출국자정보가 상이할 경우 출국시 인도장에서 상품을 수령하실 수 없으니 모든 정보를 정확히 입력해 주십시오.</li>
					</ul>
				</div><!-- end step -->
				<div class="user-info">
					<p>
						<span><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honour VIP" /></span>
						<span class="user">홍길동님</span> 반갑습니다!
					</p>
					<dl>
						<dt><img src="//image.ssgdfs.com/images/shop/order/dt_discoupon.gif" alt="할인쿠폰" /></dt>
						<dd>7<span><img src="//image.ssgdfs.com/images/shop/order/num_txt.gif" alt="장" /></span></dd>
						<dt><img src="//image.ssgdfs.com/images/shop/order/dt_save_mom.gif" alt="적립금" /></dt>
						<dd>12,000<span><img src="//image.ssgdfs.com/images/shop/order/currency_txt.gif" alt="원" /></span></dd>
						<dt><img src="//image.ssgdfs.com/images/shop/order/dt_leave_date.gif" alt="출국일자" /></dt>
						<dd>
							<span>2013<img src="//image.ssgdfs.com/images/shop/order/year_txt.gif" alt="년" /></span>
							<span  class="mon">06<img src="//image.ssgdfs.com/images/shop/order/mon_txt.gif" alt="월" /></span>
							<span class="day">19<img src="//image.ssgdfs.com/images/shop/order/day_txt.gif" alt="일" /></span>
						</dd>
					</dl>
				</div><!-- end user-info -->
			</div><!-- end order-step -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_order_product_info.gif" alt="주문 상픔정보" /></h3>
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
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
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="copy-right">가장 퍼펙트한 화장품</p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
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
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#">[54NS 1BO3M1]</a></p>
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
				<h3><img src="//image.ssgdfs.com/images/shop/order/h3_freebie_choice.gif" alt="사은품선택" /></h3>
				<div class="occasion">
					<ul class="ceremony-listing">
						<li>
							<div class="ceremony">
								<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/detail/150X150.gif" alt="사은행사 상품명" /></p>
								<div class="ceremony-info">
									<p class="title">크리니크</p>
									<p class="condition">스킨 상품, $100이상 구매 시 택일지급</p>
									<p class="ceremony-item">스킨50ml/메이크업파레트/클렌징오일100ml/파우치</p>
									<p class="ceremony-term">2013.07~2013.09.10</p>
								</div><!-- end ceremony-info -->
							</div><!-- end ceremony -->
							<div class="list-ceremony">
								<ul>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매<br />
												증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매<br />
												증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매<br />
												증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매<br />
												증정
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
						<p class="order-price"><span class="dollar">$4,498</span><span>(￦5,054,403)</span><img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="minus" /></p>
					</li>
					<li class="discount">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit02.gif" alt="할인/적립금사용금액" /></p>
						<p class="discount-price"><span class="dollar">$745.4</span><span>(￦4,513,108)</span></p>
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
							<dl>
								<dt><img src="//image.ssgdfs.com/images/shop/order/coupon_discount.gif" alt="쿠폰할인" /></dt>
								<dd>
									<ul>
										<li class="coupon-box">
											<span class="dis-txt">현금 쿠폰</span>
											<span class="dis-pri">$4.40 (￦6,450)</span>
										</li>
										<li class="coupon-box">
											<span class="dis-txt">더블 쿠폰</span>
											<span class="dis-pri">$4.40 (￦6,450)</span>
										</li>
										<li><span class="pay-price">$367.0 (￦413,108)</span></li>
									</ul>
								</dd>
							</dl>
						</div>
						<div class="total-title"><img src="//image.ssgdfs.com/images/shop/order/total_title02.gif" alt="적립금 사용금액" /><p>$<span>467.0 (￦413,108)</span></p></div>
						<dl class="first">
							<dt><img src="//image.ssgdfs.com/images/shop/order/now_use_money.gif" alt="즉시사용적립금" /></dt>
							<dd><span class="pay-price">$367.0 (￦413,108)</span></dd>
						</dl>
						<dl>
							<dt><img src="//image.ssgdfs.com/images/shop/order/possession_money.gif" alt="보유적립금" /></dt>
							<dd><span class="pay-price">$367.0 (￦413,108)</span></dd>
						</dl>
						<dl>
							<dt><img src="//image.ssgdfs.com/images/shop/order/sin_point.gif" alt="신세계포인트" /></dt>
							<dd><span class="pay-price">P 123,456</span></dd>
						</dl>
					</li>
					<li class="payment">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit03.gif" alt="최종결제금액" /></p>
						<p class="payment-price"><span class="ori">$4,031</span><span>(￦4,513,108)</span><img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="equal" class="equal" /></p>
						<div class="final-pay-box">
							<div class="final-payment">
								<dl>
									<dt><img src="//image.ssgdfs.com/images/shop/order/limit.gif" alt="면세한도적용금액(국내브랜드 제외)" /></dt>
									<dd>$1,832(￦4,513,108)</dd>
								</dl>
							</div>
							<div class="final-payment">
								<dl>
									<dt><img src="//image.ssgdfs.com/images/shop/order/product_save_money.gif" alt="상품적립금" /></dt>
									<dd>$1,832</dd>
								</dl>
							</div>
						</div>
					</li>
				</ul>
			</div><!-- end total-price -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_customer_info02.gif" alt="고객정보" /></h3>
			<div class="order-board">
				<table summary="결제를 위한 고객 정보 확인 게시판">
					<caption>고객 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="320px" />
						<col width="178px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_name_e.gif" alt="영문이름" /></th>
							<td>HONG GIL DONG</td>
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/order_name_k.gif" alt="한글이름" /></th>
							<td>홍길동</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_nationality.gif" alt="국적" /></th>
							<td>KOR</td>
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/order_birthday.gif" alt="생년월일" /></th>
							<td>1979년 10월 10일 (남성)</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_passportnumber.gif" alt="여권번호" /></th>
							<td>M000000000</td>
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/expiration_date.gif" alt="여권만료일" /></th>
							<td>2015년 12월 14일</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_email.gif" alt="이메일" /></th>
							<td>abc@nate.com</td>
							<th scope="row"class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/order_cellphone.gif" alt="휴대푠" /></th>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/demand.gif" alt="추가요구사항" /></th>
							<td colspan="3">어머니 선물용이니 포장 이쁘게 부탁드립니다.</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_departure_info02.gif" alt="출국정보" /></h3>
			<div class="tipping-top">
				<span class="txt-tipping"><img src="//image.ssgdfs.com/images/shop/order/departure_txt01.gif" alt="해외티켓(비행기표, 배표)에 기재된 정확한 출발지, 출국일시를 입력해 주십시오." /></span>
				<span class="txt-tipping"><img src="//image.ssgdfs.com/images/shop/order/departure_txt02.gif" alt="정보가 정확하지 않은 경우 상품을 수령하실 수 없으니 유의하시기 바랍니다. 출발지, 출국일시에 따라 주문 가능한 시간이 정해져 있습니다. "/></span>
			</div>
			<div class="order-board bor-top">
				<table summary="결제를 위한 고객 정보 확인 게시판">
					<caption>고객 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="320px" />
						<col width="178px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th><img src="//image.ssgdfs.com/images/shop/order/departure_date.gif" alt="출국일시" /></th>
							<td colspan="3" class="departure-date">2013-05-31<span>17:45</span></td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_starting.gif" alt="출발지" /></th>
							<td>인천동편</td>
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/arrival.gif" alt="도착지" /></th>
							<td>미국/괌/사이판</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_flight_name.gif" alt="편명" /></th>
							<td>KE123</td>
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/direct_via.gif" alt="직항/경유 여부" /></th>
							<td>직항</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/take_info.gif" alt="인도장안내" /></th>
							<td colspan="3" class="departure-take">
								<p>2011-11-01일 부터 출국편명에 따라 인천공항 상품 인도장이 여객터미널 인도장과 탑승동 인도장으로 분리 운영되며 <br />
									입력하신 <span>KE128 편명은 탑승동 인도장에서 상품을 수령</span>하셔야 하오니 상품인도시 착오 없으시기 바랍니다.<br />
									출국편명 및 인도장 구별이 명확하지 않은경우에는 여객터미널 인도장을 먼저 방문하셔서 정확한 수령장소를 확인하시기 바랍니다. 
								</p>
								<p><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_take_info.gif" alt="인천인도장 분리운영 안내" /></a></p>
								<p><input type="checkbox" id="departure-ch" /><label for="departure-ch">출국(편명)정보 및 인도장 안내사항 확인</label></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_payment_option.gif" alt="결제정보입력" /></h3>
			<div class="order-board bor-top">
				<table summary="결제를 위한 고객 정보 확인 게시판">
					<caption>고객 정보 확인</caption>
					<colgroup>
						<col width="179px" />
						<col width="820px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/payment_option_choice.gif" alt="결제수단선택" /></th>
							<td>
								<p class="payment-option">
									<input type="radio" id="credit-card" name="payment-option" /><label for="credit-card">신용카드</label>
									<input type="radio" id="credit-transfer" name="payment-option" /><label for="credit-transfer">계좌이체</label>
									<input type="radio" id="china-card" name="payment-option" /><label for="china-card">은련카드</label>
								</p>
								<p class="tipping-box">
									<span class="txt-tipping">"결제하기" 버튼을 클릭하면 지불정보를 안전하게 암호화하기 위한 플러그인이 설치됩니다.</span>
									<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_installation.gif" alt="수동설치" /></a>
								</p>
								<span class="txt-tipping">플러그인 설치가 되지 않는 경우에는 LGUPLUS 플러그인을 수동으로 설치 하여 실행 하십시오.</span>
								<span class="txt-tipping">"관리자 권한상승 오류" 발생시 관리자 권한상승 오류시 해결방법을 참고하시어 PC설정을 변경하시기 바랍니다.</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/promotion.gif" alt="프로모션" /></th>
							<td>
								<div>
									<strong>국민카드 결제 시 최대 50,000원 캐시백</strong>
									<span class="txt-tipping">30만원/60만원/100만원 이상 결제시 1.5만원/3만원/5만원 (신청필수)</span>
									<span class="txt-tipping">기간 : 2013.00.00 ~ 2013.00.00일 </span>
								</div>
								<div class="promotion-box">
									<strong>법인 및 BC, 선불, 기프트, 체크카드 제외</strong>
									<span class="txt-tipping">지인을 사칭하거나 급박한 상황을 빙자한 금전 피해사례가 빈번하게 발생되고 있으니, 금전 요구시 전화로 반드시 대화 상대를 확인하십시오. </span>
								</div>
								<div class="promotion-box">
									<strong>30만원 이상 결제 시 공인인증 의무사용</strong><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_certificate.gif" alt="공인인증안내" /></a>
									<span class="txt-tipping">2005년 11월1일부터 금융감독원 전자금융거래 안정성 강화에 따라,</span>
									<span class="txt-tipping">30만원 이상일 경우 모든 인터넷 쇼핑의 신용카드 결제 시 공인인증서를 반드시 사용하도록 정하고 있습니다.</span>
									<span class="txt-tipping">주로 이용하시는 고객님의 카드를 확인하신 후 해당하는 인증을 받으시기 바랍니다. </span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/receipt.gif" alt="현금영수증신청" /></th>
							<td>
								<div>
									<strong>현금영수증 안내 </strong>
									<span class="txt-tipping">
										정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하 정보통신망법)의 개정으로 인해 2012년 8월 18일부터 주민등록번호 사용이 제한됩니다.
									</span>
								</div>
								<div class="promotion-box">
									<strong>실시간 계좌 이체 안내 </strong>
									<span class="txt-tipping">실시간 계좌 이체시 웹 상에서 계좌이체, 잔액조회, 거래내역조회 등을 실시간으로 확인할 수 있습니다. </span>
									<span class="txt-tipping">고객의 입력정보를 암호화하여 ksnet보안 시스템과 은행 시스템과 연결, 안전하게 처리 됩니다. </span>
									<span class="txt-tipping">제일은행 실시간 계좌이체로 결제된 주문은 주말취소가 불가능 합니다. </span>
									<span class="txt-tipping">30만원 이상 결제시와 국민은행, 외환은행, 금융결제원 결제시에는 휴대폰 인증 사용이 불가능합니다. </span>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->

			<dl class="order-agree">
				<dt><img src="//image.ssgdfs.com/images/shop/order/order_agree.gif" alt="주문동의" /></dt>
				<dd>
					<img src="//image.ssgdfs.com/images/shop/order/order_agree_txt.gif" alt="주문동의" />
					<p><input type="checkbox" id="agree" name="agree" title="동의합니다" /><label for="agree">동의합니다.</label> (전자상거래법 제8조 제2항)</p>
				</dd>
			</dl>
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_payment.gif" alt="결제하기" /></a>
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order_cancel.gif" alt="주문취소" /></a>
			</div><!-- end order-btn -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



