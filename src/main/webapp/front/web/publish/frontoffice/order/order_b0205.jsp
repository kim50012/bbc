<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE &gt; 购物车

</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/order_cn.css" rel="stylesheet" type="text/css" />

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
			$("#destination-choice2").selectbox();
			
			
			
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
						<li><p><img src="/images/shop/cn/order/step02_off.gif"  alt="step02 填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_off.gif"  alt="step03 付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_on.gif"  alt="step04 订购完成" /></p></li>
					</ul>
					<ul class="step-notice-cn">
						<li>请再次确认您所购买的商品以及数量是否正确。</li>
						<li>若需要修改，则点击目录下方的‘前一页’按钮返回购物车画面。</li>
						<li>订购者信息必须与出境者本人一致。 请务必正确填写护照信息。</li>
						<li><span>如出境者信息不一致，将无法在免税品取货处领取商品，因此要准确输入所有信息。</span></li>
					</ul>
				</div><!-- end step -->
				<div class="user-info benefit-con">
					<p class="tit">
						登陆<span>以后可以查看各种优惠。</span>
					</p>
					<p class="benefit"><img src="/images/shop/cn/order/member_benefit.gif" alt="会员优惠" /></p>
					<p class="benefit-list">
						<img src="/images/shop/cn/order/img_savemoney.gif" alt="新注册赠送积分" class="first-child" />
						<img src="/images/shop/cn/order/img_unrestricted.gif" alt="无限制折扣机会" />
						<img src="/images/shop/cn/order/img_giftcard.gif" alt="新世界商品券" />
					</p>
				</div><!-- end benefit-con -->
			</div><!-- end order-step -->
			
			<div class="order-num">
				
				<div>
					<span class="order-txt"><img src="/images/shop/cn/order/title_finish.gif" alt="已成功完成了订购。" />
					
					</span><a href="#"><img src="/images/shop/cn/order/btn_order_b01.gif" alt="打印订单" /></a>
				</div>
				<div class="order-num-box">
					<span class="order-num-tit"><img src="/images/shop/cn/order/title_finish_sub.gif" alt="订单号码" /></span>
					<span class="order-num-view">14785132384</span>
				</div>
			</div>
			
		<div class="order-finish">
			<div class="cn-order-finish-wrap">		
				<div class="cn-order-finish-l ">
					
					<h3><img src="/images/shop/cn/order/title_finish_1.gif" alt="订购商品" /></h3>
					
					<div class="cn-order-finish-l-bx">
						<p class="order-step-img"><img src="/images/shop/cn/order/order_step_cn.gif" alt="01. 到达新世界免税店取货处 02. 出示订单和护照 03. 确认护照信息是否一致以后,  领取商品并签署姓名 04. 取货完毕" /></p>
						<div class="in-box">
							<ul>
								<li>应由订购者本人领取商品，且必须打印订单。若无法打印订单，则在纸张记录订购号码，与护照、登机牌一同出示便可领取商品。</li>
								<li>旧护照号码或护照号码、出国信息不一致，将无法领取商品。请确认以后，至少于出国前三日联系客服中心(1577-0161）进行修改方可领取商品。</li>
								<li>若想变更出国信息以及护照信息，请截止到出国前三日为止联系客服中心。 (1577-0161)</li>
								<li>取货后请确认商品数量与商品名。若有异常，请立即告知取货处的职员。<span class="cn-txt-red02">对于出境后丢失的商品，概不负责。</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- 주문정보 -->
			<h3><img src="/images/shop/cn/order/title_finish_4.gif" alt="订购信息" /></h3>
			<div class="order-board">
				<table summary="订购者信息必须与出境者本人一致。请务必正确填写护照信息。">
					<caption>订购信息</caption>
					<colgroup>
						<col width="180px" />
						<col width="290px" />
						<col width="180px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish04_1.gif" alt="订单号码" /></th>
							<td>
								<p class="print-txt">0000000000000
								<a href="#"><img src="/images/shop/cn/order/btn_print.gif" alt="打印订单" /></a></p>
							</td>
							<th scope="row" class="bor-left" ><img src="/images/shop/cn/order/finish04_2.gif" alt="订购日期" /></th>
							<td>
								YYYY.MM.DD TT:MM:SS
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish04_3.gif" alt="订购状态" /></th>
							<td>
								订购完成
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/finish04_4.gif" alt="商品取货处" /></th>
							<td>
								<p class="trans-btn">取货处指南<a href="#"><img src="/images/shop/cn/order/btn_trans_info.gif" alt="取货处指南" /></a></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			
			<!-- 고객정보 -->
			<h3><img src="/images/shop/cn/order/title_finish_6.gif" alt="顾客信息" /></h3>
			<div class="order-board">
				<table summary="订购者信息必须与出境者本人一致。请务必正确填写护照信息。">
					<caption>顾客信息</caption>
					<colgroup>
						<col width="180px" />
						<col width="290px" />
						<col width="180px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish06_1.gif" alt="姓名" /></th>
							<td>
								HONG GIL DONG
							</td>
							<th scope="row" class="bor-left"><img src="/images/shop/cn/order/finish06_2.gif" alt="生年月日/性别" /></th>
							<td>
								YYYY.MM.DD / 男
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish06_3.gif" alt="电话" /></th>
							<td>
								010-0000-0000
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/finish06_4.gif" alt="手机" /></th>
							<td>
								02-000-0000
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish06_5.gif" alt="国籍" /></th>
							<td colspan="3">
								mail@mail.net
							</td>
						</tr>
						<tr>
							<th scope="row" ><img src="/images/shop/cn/order/finish06_6.gif" alt="其它信息" /></th>
							<td colspan="3">
								기타정보 샬라샬라 출력
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->

			
			<!-- 여권정보 -->
			<h3><img src="/images/shop/cn/order/title_finish_8.gif" alt="护照信息" /></h3>
			<div class="order-board">
				<table summary="订购者信息必须与出境者本人一致。请务必正确填写护照信息。">
					<caption>顾客信息</caption>
					<colgroup>
						<col width="180px" />
						<col width="290px" />
						<col width="180px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish08_1.gif" alt="国籍" /></th>
							<td>
								CHINA
							</td>
							<th scope="row" class="bor-left"><img src="/images/shop/cn/order/finish08_2.gif" alt="英文姓名" /></th>
							<td>
								HONG GIL DONG
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish08_3.gif" alt="护照号码" /></th>
							<td>
								DJK0151565015
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/finish08_4.gif" alt="护照有效期" /></th>
							<td>
								2018.05.02
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->


			<!-- 출국정보 -->
			<h3><img src="/images/shop/cn/order/title_finish_7.gif" alt="出国信息" /></h3>
			<div class="order-board">
				<table summary="出发地点 出国日期  航班号/直达、中转与否  目的地">
					<caption>出国信息</caption>
					<colgroup>
						<col width="180px" />
						<col width="290px" />
						<col width="180px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>

							<th scope="row"><img src="/images/shop/cn/order/finish07_1.gif" alt="出国日期" /></th>
							<td colspan="3">
								2013年 3月 3日 11时 30分
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish07_2.gif" alt="出发地点" /></th>
							<td>
								仁川国际机场
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/finish07_3.gif" alt="目的地" /></th>
							<td>
								关岛
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish07_4.gif" alt="航班号" /></th>
							<td>
								KE0007
							</td>
							<th scope="row" class="bor-left"><img src="/images/shop/cn/order/finish07_5.gif" alt="直达、中转与否" /></th>
							<td>
								直达
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/finish07_6.gif" alt="电子机票" /></th>
							<td colspan="3">
								<div class="po-box">
									<p class="tbl-in-txt2-cn">必须注册电子机票，</p>
									<p class="tbl-in-txt2-cn">才能完成订购。<span class="cn-txt-red02">到YYYY.MM.DD TT:MM</span>为止未注册电子机票，订购将被自动取消。</p>
									<p class="r-btn-cn"><a href="#"><img src="/images/shop/cn/order/btn_order_i04.gif" alt="注册电子机票" /></a></p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
			
			<h3><img src="/images/shop/cn/order/title_finish_3.gif" alt="订购商品" /></h3>
			<div class="basket">
				<table summary="장바구니에 담긴 상품정보 설명 표">
					<caption>장바구니 정보</caption>
					<colgroup>
						<col width="110px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						
					</colgroup>
					<thead>
						<tr>
							<th scope="col" colspan="2"  class="center">商品名</th>
							<th scope="col">数量</th>
							<th scope="col">购买金额</th>
							<th scope="col">积分</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
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
									<p class="opt">Natural Skin (01)<!--  span class="btn-layer"><img src="/images/shop/cn/order/btn_option.gif" alt="更改选项" /></span  --></p>
									<div class="basket-layer">
										<div class="layer-head">
											<p class="title"><img src="/images/shop/cn/order/layer_title.gif" alt="更改选项" /></p>
											<p class="layer-close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="닫기" /></p>
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
							
							<td>
								<span class="origin2">2</span>
							</td>
							<td>
								<span class="buy-price">￦ 1,000</span>
								<span class="nation-currency">(约 $1)</span>
							</td>
							<td>
								<span class="buy-price">￦ 1,000</span>
								<span class="nation-currency">(约 $1)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->

			<h3><img src="/images/shop/cn/order/title_finish_5.gif" alt="赠品" /></h3>
			<div class="order-img-list-wrap">
				<ul>
					<li>
					<dl class="order-img-list-cn">
						<dt class="tit"><a href="#"><strong>키엘 아이크림</strong></a></dt>
						<dd class="photo"><a href="#"><img src="/images/shop/cn/order/thum60.gif"  alt="" /></a></dd>
						<dd><a href="#">스킨 50ml / 화이트 프로그램 마스크 1매 증정</a>
						</dd>
					</dl>
					</li>
					<li>
					<dl class="order-img-list-cn">
						<dt class="tit"><a href="#"><strong>키엘 아이크림</strong></a></dt>
						<dd class="photo"><a href="#"><img src="/images/shop/cn/order/thum60.gif"  alt="" /></a></dd>
						<dd><a href="#">스킨 50ml / 화이트 프로그램 마스크 1매 증정</a>
						</dd>
					</dl>
					</li>
					<li>
					<dl class="order-img-list-cn">
						<dt class="tit"><a href="#"><strong>키엘 아이크림</strong></a></dt>
						<dd class="photo"><a href="#"><img src="/images/shop/cn/order/thum60.gif"  alt="" /></a></dd>
						<dd><a href="#">스킨 50ml / 화이트 프로그램 마스크 1매 증정</a>
						</dd>
					</dl>
					</li>
					<li>
					<dl class="order-img-list-cn">
						<dt class="tit"><a href="#"><strong>키엘 아이크림</strong></a></dt>
						<dd class="photo"><a href="#"><img src="/images/shop/cn/order/thum60.gif"  alt="" /></a></dd>
						<dd><a href="#">스킨 50ml / 화이트 프로그램 마스크 1매 증정</a>
						</dd>
					</dl>
					</li>
					<li>
					<dl class="order-img-list-cn">
						<dt class="tit"><a href="#"><strong>키엘 아이크림</strong></a></dt>
						<dd class="photo"><a href="#"><img src="/images/shop/cn/order/thum60.gif"  alt="" /></a></dd>
						<dd><a href="#">스킨 50ml / 화이트 프로그램 마스크 1매 증정</a>
						</dd>
					</dl>
					</li>
					<li>
					<dl class="order-img-list-cn">
						<dt class="tit"><a href="#"><strong>키엘 아이크림</strong></a></dt>
						<dd class="photo"><a href="#"><img src="/images/shop/cn/order/thum60.gif"  alt="" /></a></dd>
						<dd><a href="#">스킨 50ml / 화이트 프로그램 마스크 1매 증정</a>
						</dd>
					</dl>
					</li>
				</ul>
			</div>
			<div class="terms-box">
				<h3><img src="/images/shop/cn/order/title_finish_9.gif" alt="付款信息" /></h3>
			
				<div class="total-price">
					<ul>
						<li class="order">
							<p class="tit"><img src="/images/shop/cn/order/dt_total.gif" alt="商品合计金额" /></p>
							<p class="order-price"><span class="dollar">$4,498</span><span>(￦5,054,403)</span><img src="/images/shop/cn/order/minus.gif" alt="minus" /></p>
						</li>
						<li class="discount">
							<p class="tit"><img src="/images/shop/cn/order/dt_dis02.gif" alt="折扣/积分使用金额" /></p>
							<p class="discount-price"><span class="dollar">$467.00</span><span>(￦400,000)</span></p>
							<div class="total-title"><img src="/images/shop/cn/order/total_title01.gif" alt="基本折扣" /><p>$<span>467.0 (￦413,108)</span></p></div>
							<dl class="first">
								<dt><img src="/images/shop/cn/order/discount01.gif" alt="基本折扣" /></dt>
								<dd>
									<ul>
										<li class="coupon-box">
											<span class="dis-txt">网上会员折扣</span>
											<span class="dis-pri">$1 (约 ￥6.38)</span>
										</li>
										<li class="coupon-box">
											<span class="dis-txt">促销折扣</span>
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
							<div class="total-title"><img src="/images/shop/cn/order/total_title02.gif" alt="优惠券折扣" /><p>$<span>467.0 (￦413,108)</span></p></div>
							<dl class="first">
								<dt><img src="/images/shop/cn/order/point01.gif" alt="立即使用积分" /></dt>
								<dd class="point-rate">
									$3 (约 ￥21.10)
								</dd>
							</dl>
							<dl>
								<dt><img src="/images/shop/cn/order/point02.gif" alt="拥有积分 " /></dt>
								<dd class="point-rate">
									$3 (约 ￥21.10)
								</dd>					
							</dl>
							<dl>
								<dt><img src="/images/shop/cn/order/point03.gif" alt="新世界积分" /></dt>
								<dd class="point-rate">
									$3 (约 ￥21.10)
								</dd>						
							</dl>
						</li>
						<li class="payment">
							<p class="tit"><img src="/images/shop/cn/order/dt_sum02.gif" alt="最终付款金额" /></p>
							<p class="payment-price"><span class="ori">$4,031</span><span>(约 44,513,108)</span><img src="/images/shop/cn/order/equal.gif" alt="equal" class="equal" /></p>
						</li>
					</ul>
					<!-- ○○○ 님은 신용카드를 이용하여 일시불로 결제하셨습니다. 
						<span>顾客已用信用卡一次性付款完毕。</span>
					-->
					<!-- ○○○ 님은 신용카드를 이용하여 할부(3개월)로 결제하셨습니다. 
						<span>顾客已用信用卡分期付款（3个月）。</span>
					-->
					<!-- ○○○ 님은 신용카드(은련카드)를 이용하여 일시불로 결제하셨습니다. 
						<span>顾客已用信用卡（银联卡）一次性付款完毕。</span>
					-->
					<!-- ○○○ 님은 신용카드(은련카드)를 이용하여 할부(3개월)로 결제하셨습니다. 
						<span>顾客已用信用卡（银联卡）分期付款（3个月）。</span>
					-->
					<p class="total-bottom-txt"><span>顾客已用信用卡一次性付款完毕。</span><a href="#"><img src="/images/shop/cn/order/btn_join.gif" alt="打印收据" /></a></p>
				</div><!-- end total-price -->
			</div><!-- end terms-box -->
			<!-- 0926 버튼 추가 -->
			<div class="order-btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/cn/order/btn_order.gif" alt="继续购物" /></a>
			</div><!-- end order-btn -->
			<!-- //0926 버튼 추가 -->
		</div><!-- end order-finish -->
	
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>