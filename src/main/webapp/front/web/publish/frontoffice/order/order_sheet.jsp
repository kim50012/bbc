<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 장바구니</title>
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
			$("#nationality").selectbox();

			$("#birthday-year").selectbox();
			$("#birthday-month").selectbox();
			$("#birthday-date").selectbox();
			
			$("#gender").selectbox();
			$("#cellphone-number").selectbox();
			$("#cu-mail").selectbox();
			
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
				<a href="#">홈으로</a><span>&gt;</span><a href="#">홈으로</a><span>&gt;</span><strong>장바구니</strong>
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
				</div><!-- end benefit-con -->
			</div><!-- end order-step -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_order_product.gif" alt="주문 상픔" /></h3>
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="119px" />
						<col width="430px" />
						<col width="109px" span="3" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first-child" colspan="2">상품명</th>
							<th scope="col">혜택</th>
							<th scope="col">수량</th>
							<th scope="col">판매금액</th>
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
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#">[54NS 1BO3M1]</a></p>
							</td>
							<td>
								<dl>
									<dt><img src="//image.ssgdfs.com/images/shop/order/dis_td.gif" alt="할인" /></dt>
									<dd>
										<span>$33.60</span>
										<span>(20%)</span>
									</dd>
								</dl>
							</td>
								<td>2</td>
							<td>
								<span class="origin">$168</span>
								<span class="discount">$134</span>
							</td>
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
								<p class="copy-right">가장 퍼펙트한 화장품</p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
							</td>
							<td>
								<dl>
									<dt><img src="//image.ssgdfs.com/images/shop/order/dis_td.gif" alt="할인" /></dt>
									<dd>
										<span>$33.60</span>
										<span>(20%)</span>
									</dd>
								</dl>
							</td>
							<td>2</td>
							<td>
								<span class="origin">$168</span>
								<span class="discount">$134</span>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			<p class="product-modify">상품 수정을 위해 <a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_basket.gif" alt="장바구니" /></a>로 이동</p>
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_customer_info.gif" alt="고객정보입력" /></h3>
			<div class="order-board">
				<table summary="주문서 작성을 위한 고객 정보 입력 게시판">
					<caption>고객 정보 입력</caption>
					<colgroup>
						<col width="177px" />
						<col width="317px" />
						<col width="177px" />
						<col width="320px" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_name_e.gif" alt="영문이름" /></th>
							<td colspan="3" class="name">
								<label for="last-name">Last Name(성)</label><input type="text" title="Last Name(성)" name="name" id="last-name" />
								<label for="first-name">First Name(이름)</label><input type="text" title="First Name(이름)" name="name" id="first-name" />
								<span>여권상의 이름을 띄어씌기 없이 정확히 기재해 주세요.</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_passportnumber.gif" alt="여권번호" /></th>
							<td><input type="text" title="여권번호" /></td>
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/order_birthday.gif" alt="생년월일/성별" /></th>
							<td class="select-container">
								<select id="birthday-year" title="태어난 연도를 선택해주세요">
									<option>2019</option>
								</select><span>년</span>
								<select id="birthday-month" title="태어난 월을 선택해주세요">
									<option>12</option>
									<option>11</option>
									<option>10</option>
								</select><span>월</span>
								<select id="birthday-date" title="태어난 날짜를 선택해주세요">
									<option>31</option>
								</select><span>일</span>
								<p>
									<select id="gender" title="성별을 선택해주세요">
										<option>남</option>
										<option>여</option>
									</select>
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_nationality.gif" alt="국적" /></th>
							<td class="nationality">
								<select id="nationality" title="국적을 선택해주세요">
									<option>국적선택</option>
								</select>
							</td>
							<!--  [D] 0811 <th>~</th> 이미지 변경 -->
							<th scope="row" class="bor-left"><img src="//image.ssgdfs.com/images/shop/order/expiration_date.gif" alt="여권만료일" /></th>
							<td class="select-container">
								<select id="passport-year" title="여권유효기간 연도를 선택해주세요">
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
									<option>2019</option>
								</select><span>년</span>
								
								<select id="passport-month" title="여권유효기간 월을 선택해주세요">
									<option>12</option>
								</select><span>월</span>
								<select id="passport-date" title="여권유효기간 날짜를 선택해주세요">
									<option>31</option>
								</select><span>일</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_email.gif" alt="이메일" /></th>
							<td colspan="3" class="mail-box">
								<input type="text" title="이메일" /><span>@</span><input type="text" title="이메일" />
								<select id="cu-mail" title="이메일 주소 뒷자리를 선택해주세요">
									<option>naver.com</option>
									<option>hanmail.net</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_cellphone.gif" alt="휴대푠" /></th>
							<td colspan="3" class="cellphone-box">
								<select id="cellphone-number" title="핸드폰번호 앞자리를 선택해주세요">
									<option>010</option>
									<option>011</option>
									<option>016</option>
								</select>
								-<input type="text" title="휴대전화 가운데 자리" />-<input type="text" title="휴대전화 마지막 자리" />
								<input type="checkbox" id="sms-yes" name="sms-yes"/><label for="sms-yes">SMS 수신동의</label>
								<span class="txt-tipping">SMS 수신 동의 시, 해당 주문 내역에 대하여 입력하신 연락처로 SMS 안내를 해드립니다.</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_password.gif" alt="비밀번호" /></th>
							<td colspan="3" class="password-box">
								<input type="text" title="비밀번호" />
								<span class="txt-tipping">주문 조회 시 주문번호와 비밀번호를 입력하여야 조회가 가능합니다.</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_departure_info.gif" alt="출국정보입력" /></h3>
			<div class="order-board">
				<table summary="주문서 작성을 위한 고객 정보 입력 게시판">
					<caption>고객 정보 입력</caption>
					<colgroup>
						<col width="177px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_departure_date.gif" alt="출국일" /></th>
							<td class="departure-date">
								<div>
									<p>
										<input type="text" title="출국연도" class="year"/>년
										<input type="text" title="출국월" />월
										<input type="text" title="출국일" />일
										<a href="#"><img src="//image.ssgdfs.com/images/shop/order/ico_calender.gif" alt="달력" /></a>
									</p>
									<p>
										<select id="daparture-hour" title="출국시간을 선택해주세요">
											<option>00</option>
										</select><span>시</span>
										<select id="daparture-min" title="출국 몇분을 선택해주세요">
											<option>00</option>
										</select><span>분</span>
									</p>
									<span class="font-red">2013년 00월 00일 00시 00분</span>
									<span class="txt-tipping daparture">출국일자(년/월/일/시/분)을 정확하게 선택해 주셔야 결제하실 수 있습니다.</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_starting.gif" alt="출발지" /></th>
							<td class="starting">
								<div>
									<select id="starting" title="출발지를 선택해주세요">
										<option>출발지선택</option>
									</select>
									<span class="txt-tipping">해외 여행 시(국제선 탑승)에만 구매가 가능하오며, 국내 여행 시(제주도 포함)에는 불가능합니다.</span>
									<span class="txt-tipping">천재지변이나 기상악화로 인한 부득이한 경우는 상품 수령이 불가능 할 수 있습니다.</span>
									<span class="txt-tipping">출국공항이 다를 경우 물건인도가 되지 않으니 정확한 출발지를 입력해주시기 바랍니다</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_flight_name.gif" alt="편명" /></th>
							<td class="flight-name">
								<div>
									<p>
										<input type="text" title="항공편명" /><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_flight_name.gif" alt="편명검색" /></a>
										<a href="#" class="inquiry"> &gt; 인천공항 편명 조회</a>
									</p>
									<span class="txt-tipping">항공편/배편 명이 정확하지 않으면 상품 인도가 불가능하오니 정확한 출발편명을 기재해 주시기 바랍니다.</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_direct_via.gif" alt="직항/경유 여부" /></th>
							<td class="via-choice">
								<div>
									<div class="radio-hei">
										<p>
											<input type="radio" id="direct" name="direct-via" /><label for="direct">직항</label>
											<input type="radio" id="via" name="direct-via" class="via" /><label for="via">경유</label>
										</p>
										<p class="via-select">
											<select id="via-choice" title="경유지를 선택해주세요">
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
												<option>경유지선택</option>
											</select>
										</p>
										<span>액체 및 젤류 구매가 불가능합니다.</span>
									</div>
									<span class="txt-tipping">출국 정보를 정확히 기재하시면, 액체류, 젤류 포함 모든 제품이 구매 가능합니다. (단, 미국 애틀란타 출국 시 구매불가)<a href="#" class="restriction"><img src="//image.ssgdfs.com/images/shop/order/btn_restriction_info.gif" alt="기내반입 제한안내" /></a></span>
									<span class="txt-tipping">미국/호주 직항인 경우 주문가능시간이 다르오니 공지를 확인해 주시기 바랍니다.</span>
									<span class="txt-tipping">추후 국내 귀국 시에는 반드시 해당상품(액체류, 젤류)을 모두 수하물 처리하시고 탑승하시기 바랍니다.</span>
									<span class="txt-tipping">동일국가(국외)내 환승 하시는 고객님의 경우 경유로 체크해주시기 바랍니다.</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_destination.gif" alt="도착지" /></th>
							<td class="destination-choice">
								<div>
									<select id="destination-choice" title="도착지를 선택해주세요">
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
										<option>도착지선택</option>
									</select>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_payment_info.gif" alt="결제정보" /></h3>
			<div class="total-price">
				<ul>
					<li class="order">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit01.gif" alt="상품합계금액" /></p>
						<p class="order-price"><span class="dollar">$4,498</span><span>(￦5,054,403)</span><img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="minus" /></p>
					</li>
					<li class="discount">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit02.gif" alt="할인/적립금 사용금액" /></p>
						<p class="discount-price"><span class="dollar">$745.4</span><span>(￦4,513,108)</span></p>
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
										<span class="dis-txt">쿠폰할인 (개별상품)</span>
										<span class="dis-pri">$4.40 (￦6,450)</span>
									</li>
									<li><span class="pay-price">$367.0 (￦413,108)</span></li>
								</ul>
							</dd>
						</dl>
						<div class="total-title"><img src="//image.ssgdfs.com/images/shop/order/total_title02.gif" alt="적립금 사용금액" /><p>$<span>467.0 (￦413,108)</span></p></div>
						<dl class="first">
							<dt><img src="//image.ssgdfs.com/images/shop/order/sin_point.gif" alt="신세계포인트" /></dt>
							<dd>
								P <input type="text" title="포인트 조회" /><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_check.gif" alt="조회" /></a>
								<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">즉시사용</label><span class="point">(사용가능 포인트 <span class="font-red">123,456</span>원)</span></p>
							</dd>
						</dl>
					</li>
					<li class="payment">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit03.gif" alt="총결제금액" /></p>
						<p class="payment-price"><span class="ori">$4,031</span><span>(￦44,513,108)</span><img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="equal" class="equal" /></p>
					</li>
				</ul>
				<p class="total-order">
					<a href="#" class="btn-join"><img src="//image.ssgdfs.com/images/shop/order/btn_join.gif" alt="회원가입" /></a><img src="//image.ssgdfs.com/images/shop/order/joingo_txt.gif" alt="신세계인터넷면세점 회원으로 가입하시면 더 많은 혜택을 받으실 수 있습니다." />
				</p>
			</div><!-- end total-price -->
			<h3 class="etc-info-top"><img src="//image.ssgdfs.com/images/shop/order/h3_etc_info.gif" alt="기타정보입력" /></h3>
			<div class="etc-info">
				<span class="txt-tipping"><img src="//image.ssgdfs.com/images/shop/order/etc_info_txt01.gif" alt="상품설명에서 선택사항기입을 요청한 경우에 한하여 메모하여 주시기 바랍니다.(그 외 내용은 접수되지 않습니다.)" /></span>
				<span class="txt-tipping"><img src="//image.ssgdfs.com/images/shop/order/etc_info_txt02.gif" alt="추가 기입사항은 50자 까지 기입이 가능합니다." /></span>
				<textarea cols="160" rows="5"></textarea>
			</div><!-- end etc-info -->
			<!-- [D] 0812 <div class="order-btn">~</div>로 변경-->
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order_con.gif" alt="주문서확인" /></a>
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order_cancel.gif" alt="주문 취소" /></a>
			</div><!-- end order-btn -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



