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
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
jQuery(function($){
	
		/*** 롤링 ***/
		
		$("div.relation-list div.view-con span").click(function(){
			btn = $(this).attr("class");
			targetList = $("div.list ul");
			targetLen = $("div.list ul li").width();
			listView(btn , targetList , targetLen , "h");
			targetList.width(targetLen* $("div.list ul li").size());
		});

		var flag = true;
			listView = function(btn, tagetList, targetlen , type){
				if(flag){
					flag = false;
					poi = tagetList.position();
					poiX = poi.left;
					poiY = poi.top;
					size = (tagetList.find("li").size()-5)*targetLen;
					
					if(btn == "prev"){
						if(type == "h"){
							if(poiX <= size*-1) {
								targetList.stop();
							}else {
								targetList.stop().animate({"left" : poiX -targetLen} , 500);
							}
						}else if(type == "v"){
							if(poiY <= size*-1) {
								targetList.stop();
							}else {
								targetList.stop().animate({"top" : poiY -targetLen} , 500);
							}
						}
					}else if(btn == "next"){
						if(type == "h"){
							if(poiX == 0) {
								targetList.stop();
							}else {
								targetList.stop().animate({"left" : poiX +targetLen} , 500);
							}
						}else if(type == "v")  {
							if(poiY == 0) {
								targetList.stop();
							}else {
								targetList.stop().animate({"top" : poiY +targetLen} , 500);
							}
						}
					}
					setTimeout(function(){flag = true;}, 500);
				}
			}

			/*** select box ***/

			$(".color").selectbox();
			$(".size").selectbox();
			$(".coupon-select").selectbox();

			/*** layer-view ***/
			$("span.btn-layer").click(function(){
				$(this).parent().parent().find(".basket-layer").show();
			});
			$(".layer-close").click(function(){
				$(this).parent().parent().parent().find(".basket-layer").hide();
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
						<li>장바구니에 담긴 상품은 <strong>3일간 저장</strong>됩니다. (구매한 상품은 장바구니에서 자동삭제 됩니다) </li>
						<li>상품수량 수정은 수정버튼을 클릭해서 수정하시면 됩니다.</li>
						<li>장바구니에 담긴 상품은 재고가 소진될 경우 <img src="//image.ssgdfs.com/images/shop/order/order_-impossible.gif" alt="[주문불가]" />로 표기 됩니다.</li>
						<li>장바구니에 보관된 상품은 판매금액 또는 할인율이 변경될 수 있습니다.</li>
						<li><span>내국인은 1회 출국에 $3000까지 구매</span> 가능합니다.</li>
						<li>쿠폰 사용시 면세한도 적용금액은 변동될 수 있습니다.</li>
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
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_basket_in.gif" alt="장바구니에 담은 상픔" /></h3>
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="58px" />
						<col width="101px" />
						<col width="340px" />
						<col width="99px" span="4" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="2" class="frst-chiild"><input type="checkbox" title="전체선택" /></th>
							<th scope="col" class="info">상품명</th>
							<th scope="col">혜택</th>
							<th scope="col">수량</th>
							<th scope="col">판매금액</th>
							<th scope="col">구매금액</th>
							<th scope="col">주문/위시/삭제</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="first-child"><input type="checkbox" title="해당상품 선택" /></td>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_sale.gif" alt="sale" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_best.gif" alt="best" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_new.gif" alt="new" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="사은품" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_coupon.gif" alt="쿠폰" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="copy-right">가장 퍼펙트한 화장품</p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
								<div class="option">
									<p>검정/여성용/기타<span class="btn-layer"><img src="/images/shop/order/btn_option.gif" alt="更改选项" /></span></p>
									<div class="basket-layer">
										<div class="layer-head">
											<p class="title"><img src="//image.ssgdfs.com/images/shop/order/option_layer_title.gif" alt="更改选项" /></p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="close" /></p>
										</div><!-- end layer-head -->
										<div class="layer-body">
											<p class="top-tit"><span>[TAG HEUER]</span> TAG HEUER CARRERA</p>
											<div class="layer-table">
												<table summary="상품옵션 재설정 서식">
													<caption>옵션 설정</caption>
													<colgroup>
														<col width="91px" />
														<col width="*" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" class="first-child"><img src="//image.ssgdfs.com/images/shop/order/th_layer_pattern.gif" alt="구분" /></th>
															<th scope="col"><img src="//image.ssgdfs.com/images/shop/order/th_choice_option.gif" alt="옵션 선택" /></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">색상</th>
															<td>
																<select class="color" title="색상을 선택하세요">
																	<option>색상</option>
																</select>
															</td>
														</tr>
														<tr>
															<th scope="row">사이즈</th>
															<td>
																<select class="size" title="사이즈를 선택하세요">
																	<option>사이즈</option>
																</select>
															</td>
														</tr>
													</tbody>
												</table>
											</div><!-- end option -->
											<div class="btn-set">
												<input type="image" src="//image.ssgdfs.com/images/shop/order/btn_change.gif" alt="取消" /> 
												<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_soupon_reset.gif" alt="变更选项" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
								</div><!-- end option -->
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
							<td>
								<div class="number">
									<p class="num">
										<span class="up"><img src="//image.ssgdfs.com/images/shop/order/btn_up.gif" alt="추가" /></span>
										<input type="text" title="수량을 입력 선택" />
										<span class="down"><img src="//image.ssgdfs.com/images/shop/order/btn_down.gif" alt="감소" /></span>
									</p>
									<p class="update"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_update.gif" alt="수정" /></a></p>
								</div><!-- end number -->
							</td>
							<td>
								<span class="origin">$168</span>
								<span class="discount">$134</span>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
							<td>
								<ul>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_direct.gif" alt="바로구매" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_dell.gif" alt="삭제" /></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="first-child"><input type="checkbox" title="해당상품 선택" /></td>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_sale.gif" alt="sale" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_best.gif" alt="best" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_new.gif" alt="new" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="사은품" />
									<img src="//image.ssgdfs.com/images/shop/product/list/icon_coupon.gif" alt="쿠폰" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">[KIEHL`S]</a></p>
								<p class="product"><a href="#">ULTRA FACIAL CREAM 125ML</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
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
							<td>
								<div class="number">
									<p class="num">
										<span class="up"><img src="//image.ssgdfs.com/images/shop/order/btn_up.gif" alt="추가" /></span>
										<input type="text" title="수량을 입력 선택" />
										<span class="down"><img src="//image.ssgdfs.com/images/shop/order/btn_down.gif" alt="감소" /></span>
									</p>
									<p class="update"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_update.gif" alt="수정" /></a></p>
								</div><!-- end number -->
							</td>
							<td>
								<span class="origin">$168</span>
								<span class="discount">$134</span>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
							<td>
								<ul>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_disable_order.gif" alt="주문불가" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_dell.gif" alt="삭제" /></a></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			<div class="btn-set">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_dell_product.gif" alt="선택상품 삭제" /></a>
			</div><!-- end btn-set -->
			<div class="total-price basket-box">
				<ul>
					<li class="total-product">
						<dl class="head-cell">
							<dt><img src="//image.ssgdfs.com/images/shop/order/head_cell01.gif" alt="상품합계" /></dt>
							<dd><span>$4,498</span><img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="-" class="minus" /></dd>
						</dl>
						<dl class="pattern">
							<dt><img src="//image.ssgdfs.com/images/shop/order/basket_txt01_1.gif" alt="상품종류" /></dt>
							<dd>2종</dd>
							<dt><img src="//image.ssgdfs.com/images/shop/order/basket_txt01_2.gif" alt="상품수량" /></dt>
							<dd>4개</dd>
						</dl>
					</li>
					<li class="discount-price">
						<dl class="head-cell">
							<dt><img src="//image.ssgdfs.com/images/shop/order/head_cell02.gif" alt="할인금액" /></dt>
							<dd><span>$ 467</span><img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="=" class="equal" /></dd>
						</dl>
						<dl class="pattern">
							<dt>온라인 회원 할인</dt>
							<dd>$ 33.60</dd>
						</dl>
					</li>
					<li class="total-sum">
						<dl class="head-cell">
							<dt><img src="//image.ssgdfs.com/images/shop/order/head_cell03.gif" alt="총구매금액" /></dt>
							<dd><span class="discount">$ 4,031 </span>(￦ 4,513,108)</dd>
						</dl>
						<dl class="pattern pattern-type01">
							<dt><img src="//image.ssgdfs.com/images/shop/order/basket_txt02_1.gif" alt="면세한도 적용금액 (국내브랜드 제외)" /></dt>
							<dd>$1,832 (￦2,049,092)</dd>
						</dl>
					</li>
				</ul>
			</div><!-- end total-price -->
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_order.gif" alt="주문서 작성" /></a>
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_go_on.gif" alt="쇼핑계속하기" /></a>
			</div><!-- end order-btn -->
			<div class="freebie">
				<h3 class="num">현재 장바구니 구매 시 받을 수 있는 사은품</h3>
				<div class="occasion">
					<ul class="ceremony-listing">
						<li>
							<div class="ceremony">
								<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/detail/150X150.gif" alt="사은행사 상품명" /></p>
								<div class="ceremony-info">
									<p class="title">크리니크</p>
										<p class="condition">스킨 상품, $100이상 구매 시 택일지급
										<span class="ceremony-item">스킨50ml/메이크업파레트/클렌징오일100ml/파우치</span></p>
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
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												화이트 프로그램 마스크 1매 증정
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
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
			<div class="freebie">
				<h3 class="num"><span>$4,000</span>구매 시 받을 수 있는 사은품</h3>
				<div class="occasion">
					<ul class="ceremony-listing">
						<li>
							<div class="ceremony">
								<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/detail/150X150.gif" alt="사은행사 상품명" /></p>
								<div class="ceremony-info">
									<p class="title">크리니크</p>
										<p class="condition">스킨 상품, $100이상 구매 시 택일지급
										<span class="ceremony-item">스킨50ml/메이크업파레트/클렌징오일100ml/파우치</span></p>
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
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_useble_coupon.gif" alt="사용 가능한 할인쿠폰" /></h3>
			<div class="user-join">
				<p><img src="//image.ssgdfs.com/images/shop/order/title_join_comment.gif" alt="신세계 인터넷 면세점 회원으로 가입하시면 더 큰 할인 혜택을 받으실 수 있습니다." /></p>
				<div class="user-link">
					<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_member_join.gif" alt="회원가입" /></a>
					<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_login.gif" alt="로그인" /></a>
				</div><!-- end user-link -->
			</div><!-- end user-join -->
			<h3><img src="//image.ssgdfs.com/images/shop/order/h3_relation.gif" alt="연관상품" /></h3>
			<div class="relation-list">
				<div class="view-con">
					<span class="prev"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_prev.gif" alt="이전" /></span>
					<span class="next"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_rel_next.gif" alt="다음" /></span>
				</div><!-- end view-con -->
				<div class="list">
					<ul>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/110X1110.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
								<span class="origin">$49.40</span>
								<span class="won">(54,970<span>원</span>)</span>
							</p>
						</li>
					</ul>
				</div><!-- end list-->
			</div><!-- end relation-list -->
			<div class="banner">
				<ul>
					<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_banner.gif" alt="클라란스 봄맞이 사은행사" /></a></li>
					<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_banner.gif" alt="클라란스 봄맞이 사은행사" /></a></li>
					<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_banner.gif" alt="클라란스 봄맞이 사은행사" /></a></li>
					<li><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_banner.gif" alt="클라란스 봄맞이 사은행사" /></a></li>
				</ul>
			</div><!-- end banner -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



