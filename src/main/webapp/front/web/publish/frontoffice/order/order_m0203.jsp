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
						<li><p><img src="/images/shop/cn/order/step03_on.gif"  alt="step03 付款" /></p></li>
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
			
			<h3><img src="/images/shop/cn/order/tit_m0203_01.gif" alt="订购商品" /></h3>
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
								<span class="nation-currency">(约 ￥1)</span>
							</td>
							<td>
								<span class="buy-price">￦ 1,000</span>
								<span class="nation-currency">(约 ￥1)</span>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			
			<div class="freebie">
			
				<h3><img src="/images/shop/cn/order/tit_m0203_02.gif" alt="选择赠品" /></h3>

				<div class="occasion">
					<ul class="ceremony-listing">
						<li>
							<div class="ceremony">
								<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/detail/150X150.gif" alt="사은행사 상품명" /></p>
								<div class="ceremony-info">
									<p class="title">伊丽莎白雅顿/ELIZABETH ARDEN</p>
										<p class="condition">雅顿 CLX黄金导航面部胶囊
										<span class="ceremony-item">30capsX3 / 42ml (再生&保湿&弹性)</span></p>
										<p class="ceremony-term">2013.07~2013.09.10</p>
								</div><!-- end ceremony-info -->
							</div><!-- end ceremony -->
							<div class="list-ceremony">
								<ul>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />科颜氏/KIEHL S</p>
											<p class="freebie">
												ULTRA FACIALULTRA FACIAL
												ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />科颜氏/KIEHL S</p>
											<p class="freebie">
												ULTRA FACIALULTRA FACIAL ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />科颜氏/KIEHL S</p>
											<p class="freebie">
												ULTRA FACIALULTRA FACIAL ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />科颜氏/KIEHL S</p>
											<p class="freebie">
												ULTRA FACIALULTRA FACIAL ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
								</ul>
							</div><!-- end list-ceremony -->
						</li>
					</ul>
				</div>
			</div><!-- end freebie -->
			<div class="terms-box">

				<h3><img src="/images/shop/cn/order/tit_m0203_06.gif" alt="付款信息" /></h3>
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
											<span class="dis-txt">现金优惠券</span>
											<span class="dis-pri">$1 (约 ￥6.38)</span>
										</li>
										<li class="coupon-box">
											<span class="dis-txt">双重优惠券</span>
											<span class="dis-pri">$1 (约 ￥6.38)</span>
										</li>
										<li><span class="pay-price">$367.0 (约 ￥6.38)</span></li>
									</ul>
								</dd>
							</dl>
							<div class="total-title"><img src="/images/shop/cn/order/total_title02.gif" alt="优惠券折扣" /><p>$<span>467.0 (约 ￥413,108)</span></p></div>
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
			</div><!-- end terms-box -->
				
			<h3><img src="/images/shop/cn/order/tit_m0203_03.gif" alt="顾客信息" /></h3>
				
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
							<th scope="row"><img src="/images/shop/cn/order/payment_t01_1.gif" alt="英文姓名" /></th>
							<td>
								HONG GIL DONG
							</td>
							<th scope="row" class="bor-left" ><img src="/images/shop/cn/order/payment_t01_2.gif" alt="国籍" /></th>
							<td>
								CHINA
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/payment_t01_3.gif" alt="护照号码" /></th>
							<td>
								CN123456
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/payment_t01_4.gif" alt="护照有效期" /></th>
							<td>
								2020.03.05
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/payment_t01_5.gif" alt="生年月日/性别" /></th>
							<td>
								YYYY.MM.DD / 男
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/payment_t01_6.gif" alt="E-mail" /></th>
							<td>
								mail@mail.net
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/payment_t01_7.gif" alt="其它信息" /></th>
							<td colspan="3">기타정보 고고</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->	
			
			
			<h3><img src="/images/shop/cn/order/tit_m0203_04.gif" alt="出国信息" /></h3>

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
							<th><img src="/images/shop/cn/order/payment_t02_1.gif" alt="出国日期" /></th>
							<td colspan="3">2013年 3月 3日 11时 30分</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/payment_t02_2.gif" alt="出发地点" /></th>
							<td>
								仁川国际机场
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/payment_t02_3.gif" alt="目的地" /></th>
							<td>
								关岛
							</td>
						</tr>
						<tr>
							<th scope="row"><img src="/images/shop/cn/order/payment_t02_4.gif" alt="航班号" /></th>
							<td>
								KE0007
							</td>
							<th scope="row"  class="bor-left"><img src="/images/shop/cn/order/payment_t02_5.gif" alt="直达、中转与否" /></th>
							<td>
								直达
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="tit-pay"><img src="/images/shop/cn/order/payment_t02_6.gif" alt="取货处介绍" /></span></th>
							<td colspan="3">
								<!-- 인천국제공항분리운영안내 버튼 -->
								<p class="tbl-in-txt-cn">从2011年11月1日开始，仁川国际机场免税品取货处根据出国的航班号，分开运营航站楼取货处和登机楼取货处。您输入的<br />
								○○○○○号需在○○○提货处领取商品，取货时敬请留意。</p>
								<p class="tbl-in-txt-btn"><a href="#"  class="btn-g"><img src="/images/shop/cn/order/btn_order_i06.gif" alt="搜索航班" /></a></p>
								<p class="tbl-in-txt-check"><input type="checkbox" /><label>确认出国（航班号）信息以及取货处介绍</label></p>
								
								
								<!-- 출국정보수정하기 버튼 -->
								<p class="tbl-in-txt-cn">从2011年11月1日开始，仁川国际机场免税品取货处根据出国的航班号，分开运营航站楼取货处和登机楼取货处。您输入的<br />
								○○○○○航班号位注册在仁川机场航运日程表里，因此无法提供正确的取货处信息。请重新确认您所利用的航班号以后，再次进行订购。</p>
								<p class="tbl-in-txt-btn"><a href="#"  class="btn-g"><img src="/images/shop/cn/order/btn_order_i09.gif" alt="搜索航班" /></a></p>
								<p class="tbl-in-txt-check"><input type="checkbox" /><label>确认出国（航班号）信息以及取货处介绍（请确认正确的航班号。）</label></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end order-board -->
		
			<h3><img src="/images/shop/cn/order/tit_m0203_06.gif" alt="付款信息" /></h3>
		
			

			<div class="order-board">
				<table summary="出发地点 出国日期  航班号/直达、中转与否  目的地" >
					<caption>付款信息</caption>
					<colgroup>
						<col width="180px" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">
								<span class="tit-pay"><img src="/images/shop/cn/order/tit_m0203_07_1.gif" alt="选择付款方式" /></span>	
							</th>
							
							
							
							<!-- 1001 text수정 -->
							<td>
								<p class="cn-radio-group"><input type="radio"  id="crd01"/><label for="crd01">信用卡</label> <input type="radio"  id="crd02" /><label for="crd02">银联卡</label></p>
								<ul class="cn-info2-txt ">
									<li>点击“付款” 按钮，系统将为安全保密付款信息而自动安装Plug In。<a href="#"><img src="/images/shop/cn/order/btn_order_i03.gif" alt="手动安装" /></a></li>
									<li>若Plug In未自动安装，请手动安装LGUPLUS Plug In。</li>
								</ul>
							</td>
						</tr>
						<!-- 1001 현금영수증안내 부분 추가 -->
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/cn/order/tit_m0203_07_1sub.gif" alt="现金收款凭证申请" /></th>
							<td>
								<div class="promotion-box1">
									<strong>现金收款凭证指南</strong>
									<span class="txt-tipping">
										根据信息通信网利用促进及信息保护相关法律（以下称信息通信网法）的改订，从2012年8月18日开始限制使用身份证号码。
									</span>
								</div>
								<div class="promotion-box">
									<strong>实时转账指南</strong>
									<span class="txt-tipping">使用实时转账，可在网上实时确认转账、余额查询、交易明细等。</span>
									<span class="txt-tipping">将顾客信息加密处理后，连接到ksne安全系统和银行安全系统，使之安全处理。</span>
									<span class="txt-tipping">以SC银行实时转账付款的订单，不可在周末进行取消。</span>
									<span class="txt-tipping">支付30万韩元以上以及国民银行、外换银行、金融电信清算机构付款时，不可使用手机认证。</span>
								</div>
							</td>
						</tr>
						<!-- //1001 현금영수증안내 부분 추가 -->
						
						<!-- 1001 은련카드 부분 추가 -->
						<tr>
							<th scope="row"><img src="//image.ssgdfs.com/images/shop/cn/order/tit_m0203_07_1sub2.gif" alt="银联卡" /></th>
							<td>
								<div class="promotion-box">
									<span class="txt-tipping">如果随意关闭弹出窗口，就有可能无法正常进行付款.</span>
									<span class="txt-tipping">若付款信息输入有误或账号余额不足，付款有可能会失败。</span>
									<span class="txt-tipping">从付款之后直到接受订购，可能需要3个小时左右。<span class="red-font">（请至少在可订购截止时间3小时前订购）</span></span>
									<span class="txt-tipping">若3小时后仍没有卡付款承认应答，则订购就被取消。</span>
								</div>
							</td>
						</tr>
						<!-- //1001 은련카드 부분 추가 -->
					</tbody>
				</table>
			</div><!-- end order-board -->
			
			<div class="agreement-box">
				<dl>
					<dt>
						<div class="tit-check"><img src="/images/shop/cn/order/tit_m0203_07_2.gif" alt="同意购买" /></div>
					</dt>
					<dd>
						<span class="cn-q-txt">
						<img src="/images/shop/cn/order/tit_m0203_07_2sub.gif" alt="是否已经确认了要购买的商品名、商品价格、内容及种类，并同意购买？" /></span>
						<span><input type="checkbox"  class="padd" id="padd"/> <label for="padd">  我同意 (电子商务交易法 第8条第2项)</label></span>
						
					</dd>
				</dl>
			</div>
			
			
			<div class="order-btn">
				<a href="#"><img src="/images/shop/cn/order/btn_order_f03.gif" alt="付款" /></a>
				<a href="#"><img src="/images/shop/cn/order/btn_order_f04.gif" alt="取消" /></a>
			</div><!-- end order-btn -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>