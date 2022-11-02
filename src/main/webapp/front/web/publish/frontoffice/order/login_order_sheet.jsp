<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 장바구니</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.slider.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery-ui-1.10.2.custom.min.js"></script>
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
			
			$("#cellphone-number").selectbox();
			$("#cu-mail").selectbox();
			
			$("#starting").selectbox();
			$("#via-choice").selectbox();
			
			$("#daparture-hour").selectbox();
			$("#daparture-min").selectbox();
			
			$("#destination-choice").selectbox();

			$( "#datepicker").datepicker({
				prevText: "이전",
				nextText: "다음",
				yearSuffix: "년",
				showMonthAfterYear: true,
				dateFormat: "yy/mm/dd",
				monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"]
			});
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
						<li class="first-child"><p><img src="/images/shop/cn/order/step01_off.gif" alt="step01 购物车" /></p></li>
						<li><p><img src="/images/shop/cn/order/step02_on.gif" alt="填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_off.gif" alt="付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_off.gif" alt="订购完成" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>请再次确认您所购买的商品以及数量是否正确。</li>
						<li>若需要修改，则点击目录下方的‘前一页’按钮返回购物车画面。</li>
						<li>订购者信息必须与出境者本人一致。 请务必正确填写护照信息。</li>
						<li class="notice">如出境者信息不一致，将无法在免税品取货处领取商品，因此要准确输入所有信息。</li>
					</ul>
				</div><!-- end step -->
				<div class="user-info">
					<p>
						<span><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honour VIP" /></span>
						<span class="user">홍길동님</span>  您好!
					</p>
					<dl>
						<dt>折扣优惠券</dt>
						<dd>7<span>张</span></dd>
						<dt>积分 </dt>
						<dd>￦12,000</dd>
						<dt>出境日期 </dt>
						<dd>YYYY.MM.DD</dd>
					</dl>
				</div><!-- end user-info -->
			</div><!-- end order-step -->
			<h3><img src="/images/shop/cn/order/h3_product_in.gif" alt="订购商品  请再次确认商品数量、选项信息是否正确。如需要修改，请按‘修改订购商品’按钮到购物车修改。" /></h3>
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="110px" />
						<col width="385px" />
						<col width="99px" />
						<col width="109px" />
						<col width="99px" />
						<col width="99px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first-child" colspan="2">商品名</th>
							<th scope="col">优惠</th>
							<th scope="col">优惠券</th>
							<th scope="col">销售金额</th>
							<th scope="col">数量</th>
							<th scope="col">购买金额</th>
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
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
								<p class="product">
										<a href="#">
											兰蔻 精华肌底液(环采臻皙光感精华素环采臻皙
											光感精华素 EX 50ml
										</a>
								</p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<p class="opt">Natural Skin (01)</p>
							</td>
							<td>
								<dl>
									<dt>积分</dt>
									<dd>
										<span class="nation-currency">￦1,234</span>
									</dd>
									<dt>打折 </dt>
									<dd>
										<span class="nation-currency">$33.60</span>
										<span class="nation-currency">(约 ￥10.30)</span>
										<span class="rating">(20%)</span>
										<p><a href="#"><img src="/images/shop/cn/order/btn_coupon.gif" alt="下载优惠券" /></a></p>
									</dd>
								</dl>
							</td>
							<td>
								<div>
									<a href="#"><img src="/images/shop/cn/order/btn_use.gif" alt="使用优惠券" /></a>
								</div>
								<span class="coupon-apply">20%优惠券</span></td>
							<td>
								<span class="origin">$168</span>
								<span class="nation-currency">$168</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
							<td>
									2
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="currency">(约 ￥10,075)</span>
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
						<col width="179px" />
						<col width="820px" />
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
							<td>
								<div class="notify-box">
									<input type="text" title="여권번호" />
									<div class="notify">
										<p class="tit">
											<img src="//image.ssgdfs.com/images/shop/order/notify_tit.gif" alt="여권번호를 다시 확인해 주세요" />
											<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_x.gif" alt="close" /></a>
										</p>
										<p><img src="//image.ssgdfs.com/images/shop/order/notify_txt.gif" alt="출국여권상의 여권번호와 일치하지 않는 경우 상품수령이 불가능 합니다." /></p>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_birthday.gif" alt="생년월일/성별" /></th>
							<td>1970년 10월 10일 [남자]</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_nationality.gif" alt="국적" /></th>
							<td class="nationality">
								<select id="nationality" title="국적을 선택해주세요">
									<option>국적선택</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_expiration_date.gif" alt="여권유효기간" /></th>
							<td class="select-container">
								<select id="passport-year" title="여권유효기간 연도를 선택해주세요">
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
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/order_cellphone.gif" alt="휴대폰" /></th>
							<td class="cellphone-box">
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
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_departure_info.gif" alt="출국정보입력" /></h3>
			<div class="order-board">
				<p class="btn-top"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_lately_info_call.gif" alt="저장된출국정보불러오기" /></a></p>
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
										<input type="text" title="출국연도" class="year" id="datepicker" />년
										<input type="text" title="출국월" />월
										<input type="text" title="출국일" />일
										<a href="#"><img src="//image.ssgdfs.com/images/shop/order/ico_calender.gif" alt="달력" /></a>
									</p>
									<p>
										<select id="daparture-hour" title="출국시간을 선택해주세요">
											<option>00</option>
											<option>00</option>
										</select><span>시</span>
										<select id="daparture-min" title="출국 몇분을 선택해주세요">
											<option>00</option>
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
											</select>
										</p>
										<span>액체 및 젤류 구매가 불가능합니다.</span>
									</div>
									<span class="txt-tipping">출국 정보를 정확히 기재하시면, 액체류, 젤류 포함 모든 제품이 구매 가능합니다. (단, 미국 애틀란타 출국 시 구매불가)<a href="#" class="restriction"><img src="//image.ssgdfs.com/images/shop/order/btn_restriction_info.gif" alt="기내반입 제한안내" /></a></span>
									<span class="txt-tipping">미국/호주 직항인 경우 주문가능시간이 다르오니 공지를 확인해 주시기 바랍니다.</span>
									<span class="txt-tipping">추후 국내 귀국 시에는 반드시 해당상품(액체류, 젤류)을 모두 수하물 처리하시고 탑승하시기 바랍니다.</span>
									<span class="txt-tipping">동일국가(국외)내 환승 하시는 고객님의 경우 경유로 체크해주시기 바랍니다.</span>
									<span class="txt-tipping">동일국가(국외)내 환승 하시는 고객님의 경우 경유로 체크해주시기 바랍니다.</span>
									<span class="txt-tipping">동일국가(국외)내 환승 하시는 고객님의 경우 경유로 체크해주시기 바랍니다.</span>
									<span class="txt-tipping">동일국가(국외)내 환승 하시는 고객님의 경우 경유로 체크해주시기 바랍니다.</span>
									<span class="txt-tipping">동일국가(국외)내 환승 하시는 고객님의 경우 경유로 체크해주시기 바랍니다.</span>
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
									</select>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			<h3 class="payment-tit"><img src="//image.ssgdfs.com/images/shop/order/h3_payment_info.gif" alt="결제정보" /></h3>
			<div class="total-price">
				<ul>
					<li class="order">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit01.gif" alt="상품합계금액" /></p>
						<p class="order-price"><span class="dollar">$4,498</span><span>(￦50,054,403)</span><img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="minus" /></p>
					</li>
					<li class="discount">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit02.gif" alt="할인/적립금 사용금액" /></p>
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
											<span class="dis-txt">쿠폰할인 (개별상품)</span>
											<span class="dis-pri">$4.40 (￦6,450)</span>
										</li>
										<li><span class="pay-price">$367.0 (￦413,108)</span></li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt><img src="//image.ssgdfs.com/images/shop/order/coupon_discount.gif" alt="쿠폰할인" /></dt>
								<dd>
									<p class="coupon-box">
										$ <input type="text" title="사용가능 쿠폰" /><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_coupon_apply02.gif" alt="쿠폰조회및적용" /></a>
										<span class="coupon-txt">사용가능 쿠폰</span> <span class="font-red">00</span><span class="coupon-txt">장</span>
									</p>
									<span class="pay-price">$367.0 (￦413,108)</span>
									<span class="txt-tipping">
										30%이상 할인된 상품 및 일부 브랜드는 쿠폰적용 기준금액에서 제외됩니다.
									</span>
								</dd>
							</dl>
						</div>
						<div class="total-title"><img src="//image.ssgdfs.com/images/shop/order/total_title02.gif" alt="적립금 사용금액" /><p>$<span>467.0 (￦413,108)</span></p></div>
						<dl class="first">
							<dt><img src="//image.ssgdfs.com/images/shop/order/now_use_money.gif" alt="즉시사용적립금" /></dt>
							<dd>
								<p class="coupon-box">￦ <input type="text" title="즉시사용적립금" /></p>
								<span class="pay-price">$367.0 (￦413,108)</span>
								<p><input type="checkbox" id="now-use-money" name="now-use-money" /><label for="now-use-money">즉시사용</label>
								<span class="point">(예상 적립금 ￦<span class="font-red">123,456</span>원)</span></p>
							</dd>
						</dl>
						<dl>
							<dt><img src="//image.ssgdfs.com/images/shop/order/possession_money.gif" alt="보유적립금" /></dt>
							<dd>
								<p class="coupon-box">￦ <input type="text" title="보유적립금" /></p>
								<span class="pay-price">$367.0 (￦413,108)</span>
								<p><input type="checkbox" id="possession-money" name="possession-money" /><label for="possession-money">전액사용</label>
								<span class="point">(예상 적립금 ￦<span class="font-red">123,456</span></span> / <span class="point">보유 적립금 ￦<span class="font-red">123,456</span>)</span></p>
								<span class="txt-tipping">적립금은 회원할인 후 쿠폰적용가의 30%까지 사용가능합니다.</span>
								<span class="txt-tipping">적립금 사용은 보유 분에 한해서 사용하실 수 있습니다.</span>
							</dd>
						</dl>
						<dl>
							<dt><img src="//image.ssgdfs.com/images/shop/order/sin_point.gif" alt="신세계포인트" /></dt>
							<dd>
								<p class="coupon-box">P <input type="text" title="포인트 조회" /><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_check.gif" alt="조회" /></a></p>
								<span class="pay-price">P123,113</span>
								<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">사용하기</label><span class="point">(사용가능 포인트 <span class="font-red">123,456</span>원)</span></p>
							</dd>
						</dl>
					</li>
					<li class="payment">
						<p class="tit"><img src="//image.ssgdfs.com/images/shop/order/head_cell_tit03.gif" alt="총결제금액" /></p>
						<p class="payment-price"><span class="ori">$4,031</span><span>(￦40,513,108)</span><img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="equal" class="equal" /></p>
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
									<dd>￦97,832</dd>
								</dl>
							</div>
						</div>
					</li>
				</ul>
			</div><!-- end total-price -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_etc_info.gif" alt="기타정보입력" /></h3>
			<div class="etc-info">
				<span class="txt-tipping"><img src="//image.ssgdfs.com/images/shop/order/etc_info_txt01.gif" alt="상품설명에서 선택사항기입을 요청한 경우에 한하여 메모하여 주시기 바랍니다.(그 외 내용은 접수되지 않습니다.)" /></span>
				<span class="txt-tipping"><img src="//image.ssgdfs.com/images/shop/order/etc_info_txt02.gif" alt="추가 기입사항은 50자 까지 기입이 가능합니다." /></span>
				<textarea cols="160" rows="5"></textarea>
			</div><!-- end etc-info -->
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order_con.gif" alt="주문서 확인" /></a>
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order_cancel.gif" alt="주문 취소" /></a>
			</div><!-- end order-btn -->
		</div><!-- end body -->

		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



