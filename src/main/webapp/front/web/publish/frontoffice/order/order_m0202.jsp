<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 购物车</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/order_cn.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
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
			
			$("#destination-choice3").selectbox();

			$(".coupon-select").selectbox();
			
			/* 레이어팝업 클릭 */
			$("div.basket-layer-wrap").hide();
			$(".btn-layer a").click(function(){
				$(this).parent().parent().find("div.basket-layer-wrap").show();
				return false;
			});

			$(".layer-close").click(function(){
				$(this).parent().parent().hide();
			});
			
			$("div.sample-con a").click(function(){
				$(this).next("div.basket-layer-wrap").show();
				return false;
			});

			$(".layer-body-cn .btn-set a").click(function(){
				$(this).parent().parent().parent().hide();
			});
			
			
			/* z-index관련 */
			$("table").css("z-index" ,"1");
			$("table td").css("z-index" ,"1");
			$("table td div").click(function(){
				$(this).parent().parent().parent().parent().parent().css("z-index" ,"2");	
				$(this).css("z-index" ,"10");			
			});
			$("table td div").focusout(function(){
				$(this).css("z-index" ,"1");			
			})
			
	
			$("table td.select-container div").click(function(){
				$(this).css("z-index" ,"50");
			});
			$("table td.select-year02 div").click(function(){
				$(this).css("z-index" ,"40");
			});
			
			$("table td.nationality div").click(function(){
				$(this).css("z-index" ,"45");
			});
			$("table td.departure-date div").click(function(){
				$(this).css("z-index" ,"38");
			});
			$("table td.starting .cn-help-txt li").css("z-index" ,"1");
			$("table td div.destination-box div").click(function(){
				$(this).css("z-index" ,"30");
				
			});
			$("table td .destination div").click(function(){
				$(this).css("z-index" ,"30");
				
			});
			
			$("table td.mail-box div").click(function(){
				$(this).css("z-index" ,"40");
				
			});
			$("table td.starting div").click(function(){
				$(this).css("z-index" ,"35");
				
			});
			

 			$(".order-board").eq(0).css("z-index" ,"6");
 			$("h3").eq(0).css("z-index" ,"60");
 			$(".order-board").eq(1).css("z-index" ,"5");
 			$("h3").eq(1).css("z-index" ,"5");
 			$(".order-board").eq(2).css("z-index" ,"4");
 			$("h3").eq(2).css("z-index" ,"4");
 			$(".terms-box").css("z-index" ,"1");
 			$(".order-title").css("z-index" ,"1");
 			
			
	});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-location">
				<a href="#">返回主页</a><span>&gt;</span><strong>填写订单</strong>
			</div><!-- end page-location -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="/images/shop/cn/order/step01_off.gif" alt="step01 购物车" /></p></li>
						<li><p><img src="/images/shop/cn/order/step02_on.gif"  alt="step02 填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_off.gif"  alt="step03 付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_off.gif"  alt="step04 订购完成" /></p></li>
					</ul>
					<ul class="step-notice-cn">
						<li>请再次确认您所购买的商品以及数量是否正确。</li>
						<li>若需要修改，则点击目录下方的‘前一页’按钮返回购物车画面。</li>
						<li>订购者信息必须与出境者本人一致。 请务必正确填写护照信息。</li>
						<li><span>如出境者信息不一致，将无法在免税品取货处领取商品，因此要准确输入所有信息。</span></li>
					</ul>
				</div><!-- end step -->
				<div class="user-info" >
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

			<h3><img src="/images/shop/cn/order/tit_m0202_01.gif" alt="订购商品" />
				<span><img src="/images/shop/cn/order/ordersheet_sub_title01.gif" alt="请再次确认商品数量、选项信息是否正确。如需要修改，请按‘修改订购商品’按钮到购物车修改。" /></span>
			</h3>
			
			<!-- 0909 col width 수정 및 td 추가 -->
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="110px" />
						<col width="380px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="2">商品名</th>
							<th scope="col">优惠</th>
							<th scope="col">优惠券</th>
							<th scope="col">销售金额</th>
							<th scope="col">数量</th>
							<th scope="col">购买金额</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="first-child photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
								</p>
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p> 
								<p class="product"><a href="#">光感精华素 EX 50ml</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<div class="option-cn">
									<p class="opt">Natural Skin (01)</p>
									<div class="basket-layer">
										<div class="layer-head">
											<p class="title"><img src="/images/shop/cn/order/layer_title.gif" alt="更改选项" /></p>
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
												<input type="image" src="/images/shop/cn/order/btn_change.gif" alt="변경" /> 
												<a href="#"><img src="/images/shop/cn/order/btn_opt_reset.gif" alt="취소" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
								</div><!-- end option -->
							</td>
							
							<!-- 0909 td 추가 -->
							<td>
								<div class="basket-benefit">
									<p class="benefit">
										积分
										<span class="red-font">￦1,234<span>(20%)</span></span>
									</p>
									<p class="benefit">
										打折
										<span class="red-font">$1.68</span>
										<span class="red-font">(约 ￥10.30)<span>(20%)</span></span>
									</p>
								</div>
							</td>
							<!-- 0909 col width 수정 및 td 추가 -->
							
							
							<td>
								<div class="coupon-down">
									<span class="btn-layer"><a href="#"><img src="/images/shop/cn/order/btn_coupon.gif" alt="下载优惠券" /></a></span>
									<div class="basket-layer-wrap w480p" style="display:none;">
										<div class="layer-head-cn">
											<p class="title"><img src="/images/shop/cn/order/order_sheet_layer_t01.gif" alt="查看及使用优惠券" /></p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="close" /></p>
										</div><!-- end layer-head -->
										<div class="layer-body-cn">
											<div >
												<table summary="상품옵션 재설정 서식"  class="layer-tbl">
													<caption>옵션 설정</caption>
													<colgroup>
														<col width="110px" />
														<col width="*" />
														<col width="110px" />
													</colgroup>
													<thead>
														<tr>
															<th scope="col" ><img src="/images/shop/cn/order/order_sheet_layer_t01_1.gif" alt="优惠券种类" /></th>
															<th scope="col" ><img src="/images/shop/cn/order/order_sheet_layer_t01_1.gif" alt="优惠券种类" /></th>
															<th scope="col" class="last"><img src="/images/shop/cn/order/order_sheet_layer_t01_1.gif" alt="优惠券种类" /></th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>一般优惠券</td>
															<td class="coupon-selection">
																<select class="coupon-select" title="select coupon">
																	<option>색상</option>
																</select>
															</td>
															<td class="last">$20 (约 ￥125.00)</td>
														</tr>
														<tr>
															<td colspan="3" class="last">没有可适用优惠券。</td>
														</tr>
														
													</tbody>
												</table>
											</div><!-- end option -->
											<div class="twin-btn">
												<p class="info-txt">* 7折以下折扣商品限制使用优惠券。</p>
												<div class="btn-r">
													<a href="#"><img src="/images/shop/cn/order/btn_order_i02.gif" alt="下载优惠券" /></a>
												</div>
											</div>
											<div class="btn-set">
												<input type="image" src="/images/shop/cn/order/btn_change.gif" alt="取消" /> 
												<a href="#"><img src="/images/shop/cn/order/btn_opt_reset.gif" alt="变更选项" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
								</div><!-- end coupon-down -->
								<span class="rating">20%优惠券</span>
							</td>
							<td>
								<span class="origin">$168</span>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(约 ￥10,075)</span>
							</td>
							<td>
								<span class="origin2">2</span>
							</td>
							<td>
								<!-- 0912 class="buy-price" 로 변경 -->
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(约 ￥10,075)</span>
							</td>
						</tr>				
						<tr>
							<td colspan="7" class="btn-order-goods">
								<p><a href="#"><img src="/images/shop/cn/order/btn_order_goods.gif" alt="修改订购商品" /></a></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			
			<!-- //0909 col width 수정 및 td 추가 -->
			

			<h3><img src="/images/shop/cn/order/tit_m0202_02.gif" alt="顾客信息" />
				<span><img src="/images/shop/cn/order/ordersheet_sub_title02.gif" alt="订购者信息必须与出境者本人一致。请务必正确填写护照信息。" /></span>
				<div class="sample-con">
					<a href="#"><img src="/images/shop/cn/order/btn_dell_product.gif" alt="취소" /></a>
					<div class="basket-layer-wrap sample" style="display:none;">
						<div class="layer-head-cn">
							<p class="title"><img src="/images/shop/cn/order/sample_title.gif" alt="浏览顾客信息输入样本" /></p>
						</div>
						<div class="layer-body-cn">
							<div class="sample-box">
								<p class="top-coment">若顾客信息与出境者信息不一致，则无法在取货处领取商品，因此所输入的顾客信息必须与护照上的信息一致。</p>
								<p class="txt-box">
									<span>输入的姓名应与护照上的姓名一致，而且不应留有空白。</span>
									<span>填写名字(First name)时，请不要留空。例：First name为 Gil-Dong时，输入为GILDONG。</span>
									<span>护照号码不应留有空白，且用英文大写字母填写。</span>
								</p>
								<p class="sample-img">
									<img src="/images/shop/cn/order/sample_img.gif" alt="passport sample" />
								</p>
							</div>
							<p class="btn-set"><a href="#"><img src="/images/shop/cn/order/btn_close_s.gif" alt="关闭" /></a></p>
						</div>
					</div>
				</div>
			</h3>

			<div class="order-board">
				<table summary="订购者信息必须与出境者本人一致。请务必正确填写护照信息。">
					<caption>顾客信息</caption>
					<colgroup>
						<col width="180px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="en_name2"><img src="/images/shop/cn/order/sheet_tit01_1.gif" alt="英文姓名" /></label></th>
							<td colspan="3" class="name-cn">
								<input type="text" title="Last Name(성)" name="name" id="en_name2"  value="Last name"/>
								<input type="text" title="First Name(이름)" name="name" id="first-name2"  value="First name" />
								<ul class="name-form-rule">
									<li>输入的姓名应与护照上的姓名一致，而且不应留有空白。</li>
									<li>填写名字(First name)时，请不要留空。</li>
									<li>First name为Gil-Dong时，输入为GILDONG。</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="passport_num2"><img src="/images/shop/cn/order/sheet_tit01_2.gif" alt="护照号码" /></label></th>
							<td colspan="3" class="passport">
								<input type="text" title="护照号码"  id="passport_num2"  value="CN123548"/><span class="coment-txt">填写护照号码时不要留空白。</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/sheet_tit01_3.gif" alt="生年月日/性别" /></th>
							<td class="nationality" colspan="3">
								YYYY-MM-DD, 男
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="nationality"><img src="/images/shop/cn/order/sheet_tit01_4.gif" alt="国籍" /></label></th>
							<td colspan="3"  class="nationality">
								<select id="nationality" title="국적을 선택해주세요">
									<option>中国</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="birthday-year"><img src="/images/shop/cn/order/sheet_tit01_5.gif" alt="护照有效期" /></label></th>
							<!-- 0910 class="select-year02" 추가 -->
							<td colspan="3"  class="select-container select-year02">
								<select id="birthday-year" title="태어난 연도를 선택해주세요">
									<option>选择 </option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
								</select><span>年</span>
								<select id="birthday-month" title="태어난 월을 선택해주세요">
									<option>选择 </option>
									<option>12</option>
									<option>12</option>
									<option>10</option>
									<option>09</option>
									<option>08</option>
									<option>10</option>
									<option>09</option>
									<option>08</option>
									<option>10</option>
									<option>09</option>
									<option>08</option>
									<option>10</option>
									<option>09</option>
									<option>08</option>
								</select><span>月</span>
								<select id="birthday-date" title="태어난 날짜를 선택해주세요">
									<option>选择 </option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
									<option>31</option>
								</select><span>日</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/sheet_tit01_6.gif" alt="E-mail" /></th>
							<td colspan="3" class="mail-box">
								<input type="text" title="이메일" /><span>@</span><input type="text" title="이메일" />
								<select id="cu-mail" title="이메일 주소 뒷자리를 선택해주세요">
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
									<option>naver.com</option>
									<option>hanmail.net</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->

			<h3><img src="/images/shop/cn/order/tit_m0202_03.gif" alt="出境信息" />
				<span class="long-sub"><img src="/images/shop/cn/order/ordersheet_sub_title03.gif" alt="请准确输入出国票（机票、船票)里记载的出发地、出国日期。根据出发地、出国日期，可订购的时间相互不同。
如信息不正确，则无法领取商品，望顾客敬请留意。" /></span>
			</h3>
	
			<div class="order-board">
				<table summary="주문서 작성을 위한 고객 정보 입력 게시판">
					<caption>고객 정보 입력</caption>
					<colgroup>
						<col width="177px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="starting_y"><img src="/images/shop/cn/order/sheet_tit02_1.gif" alt="出境日期" /></label></th>
							<td class="departure-date">
								<div>
									<p>
										<input type="text" title="选择"  id="starting_y"/>年
										<input type="text" title="选择" />月
										<input type="text" title="选择" />日
										<a href="#"><img src="//image.ssgdfs.com/images/shop/order/ico_calender.gif" alt="달력" /></a>
									</p>
									<p>
										<select id="daparture-hour" title="출국시간을 선택해주세요">
											<option>选择</option>
										</select><span>시</span>
										<select id="daparture-min" title="출국 몇분을 선택해주세요">
											<option>选择</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
											<option>00</option>
										</select><span>분</span>
									</p>
									
								</div>
								<ul class="cn-help-txt clean">
									<li>只有正确填写出境日期（年/月/日/时/分)，才能付款。</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row"><label for="starting"><img src="/images/shop/cn/order/sheet_tit02_2.gif" alt="出发地点" /></label></th>
							<td class="starting">
								<div>
									<select id="starting" title="출발지를 선택해주세요">
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
										<option>请选择 </option>
									</select>
									<ul class="cn-help-txt clean">
										<li>免税品仅在海外旅游时(搭乘国籍航班)购买，国内旅游（包括济州岛）时不可购买。</li>
										<li>发生不可抗拒的天灾之变或气象恶化等情况时，可能无法领取商品。</li>
										<li>出境机场不一致时，将无法领取商  </li>
									</ul>
									
								</div>
							</td>
						</tr>
						<tr>
							<th><img src="/images/shop/cn/order/sheet_tit02_3.gif" alt="目的地" /></th>
							<td>
								<p class="destination">
									<select id="destination-choice" title="도착지를 선택해주세요" >
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
										<option>请选择经由的地点</option>
									</select> 
								</p>
							</td>
						</tr>
						
						<tr>
							<th scope="row"><label><img src="/images/shop/cn/order/sheet_tit02_4.gif" alt="航班号" /></label></th>
							<td class="destination-choice">
								<div>
									<input type="text" title="편명을 입력해주세요."/>
									<a href="#"  class="btn-g"><img src="/images/shop/cn/order/btn_flight_name.gif" alt="搜索航班" /></a>
									<ul class="cn-help-txt clean">
										<li>若航班号/船名不正确，则无法领取商品，因此要填写正确的航班号或船名。</li>
									</ul>
									
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><label><img src="/images/shop/cn/order/sheet_tit02_5.gif" alt="直达/中转与否 " /></label></th>
							<td class="via-choice">
								<div>
									<div class="radio-hei">
										<p>
											<input type="radio" id="direct" name="direct-via" /><label for="direct">直达</label>
											<input type="radio" id="via" name="direct-via" class="via" /><label for="via">中转</label>
										</p>
										<p class="via-select">
											<select id="via-choice" title="경유지를 선택해주세요">
												<option>请选择经由的地点</option>
											</select>
										</p>
										<span class="impossibility-txt">不可购买液体类及凝胶类。.</span>
									</div>
									<ul class="cn-help-txt clean">
										<li>依据机舱内限制携带的物品的规定，根据到达地点及经由地点的不同，购买液体类及凝胶类产品将会受到限制，因此请正确选择并确认是否能够购买。<a href="#" class="restriction"><img src="/images/shop/cn/order/btn_restriction_info.gif" alt="机舱内禁止携带物品说明" /></a></li>
										<li>对于购买限制购买的液体类和凝胶类商品时，免税店将对此不负责任，敬请留意。</li>
										<li>目的地为美国、澳洲时，不可购买液体类、凝胶类商品。</li>
										<li>搭乘直达美国、澳洲的航班或美国航班（西北航空公司NW、联合航空公司UA）时，可以购买液体类或凝胶类商品，但必须访问取货处以后，在登机口领取商品。</li>
										<li>目的地为美国、澳洲时，不可购买液体类、凝胶类商品。</li>
									</ul>
								</div>
								<!-- 삭제
								<div class="destination-box">
									<p>
										<select id="destination-choice3" title="도착지를 선택해주세요" >
											<option>请选择经由的地点</option>
										</select> 
									</p>
								</div>
								 -->
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			
			
			<div class="terms-box">
			<h3 class="order-title"><img src="/images/shop/cn/order/tit_m0202_04.gif" alt="付款信息" /></h3>
			<div class="total-price">
				<ul>
					<li class="order">
						<p class="tit"><img src="/images/shop/cn/order/dt_total.gif" alt="商品合计金额" /></p>
						<p class="order-price"><span class="dollar">$4,498</span><span>(约 ￥5,054,403)</span><img src="/images/shop/cn/order/minus.gif" alt="minus" /></p>
					</li>
					<li class="discount">
						<p class="tit"><img src="/images/shop/cn/order/dt_dis02.gif" alt="折扣/积分使用金额" /></p>
						<p class="discount-price"><span class="dollar">$467.00</span><span>(约 ￥400,000)</span></p>
						<div class="total-title"><img src="/images/shop/cn/order/total_title01.gif" alt="基本折扣" /><p>$<span>467.0 (约 ￥413,108)</span></p></div>
							<dl class="first">
								<dt><img src="/images/shop/cn/order/discount01.gif" alt="基本折扣" /></dt>
								<dd>
									<ul>
										<li class="coupon-box">
											<span class="dis-txt">网上会员折扣</span>
											<span class="dis-pri">$1 (约 ￥6.38)</span>
										</li>
										<li class="coupon-box">
											<span class="dis-txt">优惠券折扣(个别商品)</span>
											<span class="dis-pri">$1 (约 ￥6.38)</span>
										</li>
										<li><span class="pay-price">$367.0 (约 ￥6.38)</span></li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt><img src="/images/shop/cn/order/discount02.gif" alt="优惠券折扣" /></dt>
								<dd>
									<ul>
										<li class="coupon-box">
											$ <input type="text" title="포인트 조회" /><a href="#"><img src="/images/shop/cn/order/btn_check.gif" alt="查看及适用优惠券" /></a>
											
											<!-- 0909 input type="checkbox" 삭제 <p class="use-coupon"> 클래스 추가  -->
											<p class="use-coupon">可适用优惠券<span class="point">00</span> 张</p>
											
											
											<p class="order-tip">
												<span class="red-font">7折以下折扣商品及部分品牌商品不适用优惠券。</span>
											</p>
										</li>
										<li><span class="pay-price">$367.0 (约 ￥6.38)</span></li>
									</ul>
								</dd>
							</dl>
							
							<div class="total-title"><img src="/images/shop/cn/order/total_title02.gif" alt="优惠券折扣" />
								<span class="use-money">(可使用积分 <span class="font-red">约 ￥110,405</span>)</span><p>$<span>467.0 (约 ￥413,108)</span></p>
							</div>
							
							<dl class="first">
								<dt><img src="/images/shop/cn/order/point01.gif" alt="立即使用积分" /></dt>
								<dd>
									\ <input type="text" title="포인트 조회" />
									<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">全部使用</label><span class="point">(可使用积分 <span class="font-red">\110,405</span>)</span></p>
								</dd>
							</dl>
							<dl>
								<dt><img src="/images/shop/cn/order/point02.gif" alt="拥有积分 " /></dt>
								<dd>
									\ <input type="text" title="포인트 조회" />
									<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">全部使用</label><span class="point">
									
									(拥有积分: \<span class="font-red">10,405</span>)</span></p>
									
									<p class="order-tip">
										<span>最多可使用的积分为，会员折扣后优惠券适用金额的30%。</span>
										<span>积分可在所拥有的积分范围内使用。</span>
									</p>
								</dd>					
							</dl>
							<dl>
								<dt><img src="/images/shop/cn/order/point03.gif" alt="新世界积分" /></dt>
								<dd>
									P <input type="text" title="포인트 조회" /><a href="#"><img src="/images/shop/cn/order/btn_check02.gif" alt="查看" /></a>
									<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">现在使用</label><span class="point">(可使用积分 <span class="font-red">123,456</span>)</span></p>
								</dd>						
							</dl>
						</li>
						<li class="payment">
							<p class="tit"><img src="/images/shop/cn/order/dt_sum02.gif" alt="最终付款金额" /></p>
							<p class="payment-price"><span class="ori">$4,031</span><span>(约 ￥ 44,513,108)</span><img src="/images/shop/cn/order/equal.gif" alt="equal" class="equal" /></p>
							
							
							<!-- 0909 <div class="final-pay-box"> 추가 -->
							<div class="final-pay-box">
								<div class="final-payment">
									<dl>
										<dt>积分</dt>
										<dd>￦1,000</dd>
										<dd>(约 $1)</dd>
									</dl>
								</div>
							</div>
							
							
						</li>
					</ul>
				</div><!-- end total-price -->
			</div><!-- end terms-box  -->
			
			
			<h3 class="etc-info-top"><img src="/images/shop/cn/order/tit_m0202_05.gif" alt="其它信息" /></h3>
			<div class="etc-info">
				<ul class="cn-help-txt clean">
					<li>免税商品因其特性,将无法提供礼物包装服务或购物袋。（部分品牌除外）</li>
					<li>出国信息变更以及其他变更事项请咨询客服中心或在1:1咨询留言。</li>
					<li>附加记录中填写的事项将根据具体情况有可能不被适用，敬请谅解</li>
				</ul>
				<textarea cols="160" rows="5"></textarea>
			</div><!-- end etc-info -->
			<div class="order-btn">
				<a href="#"><img src="/images/shop/cn/order/btn_order_f01.gif" alt="去购物车" /></a>
				<a href="#"><img src="/images/shop/cn/order/btn_order_f02.gif" alt="确认订单" /></a>
			</div><!-- end order-btn -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>