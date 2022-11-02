<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
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
						<li class="first-child"><p><img src="/images/shop/cn/order/step01_on.gif" alt="step01 购物车" /></p></li>
						<li><p><img src="/images/shop/cn/order/step02_off.gif" alt="填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_off.gif" alt="付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_off.gif" alt="订购完成" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>加入购物车的商品被保存3日。(购买的商品自动从购物车删除。) </li>
						<li>商品数量可通过点击更改按钮更改。</li>
						<li>加入购物车的商品在库存不足时显示为“不可订购”。</li>
						<li>加入购物车的商品价格和折扣率有可能变动。</li>
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
							<th scope="col" colspan="2" class="frst-chiild"><input type="checkbox" title="all-check" /></th>
							<th scope="col" class="info">商品名</th>
							<th scope="col">优惠</th>
							<th scope="col">销售金额</th>
							<th scope="col">数量</th>
							<th scope="col">购买金额</th>
							<th scope="col">订购/删除</th>
						</tr>
					</thead>
 					<tbody>
						<tr>
							<td class="first-child"><input type="checkbox" title="해당상품 선택" /></td>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p> 
								<p class="product"><a href="#">光感精华素 EX 50ml</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
								<div class="option">
									<p class="opt">Natural Skin (01)<span class="btn-layer"><img src="/images/shop/cn/order/btn_option.gif" alt="更改选项" /></span></p>
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
								<span class="origin">$168</span>
								<span class="nation-currency">$168</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
							<td>
								<div class="number">
									<div class="num">
										<input type="text" title="数量" />
										<p class="btn-num">
											<span class="up"><img src="/images/shop/cn/order/btn_up.gif" alt="plus" /></span>
											<span class="down"><img src="/images/shop/cn/order/btn_down.gif" alt="minus" /></span>
										</p>
									</div>
								</div><!-- end number -->
								<p class="update"><a href="#"><img src="/images/shop/cn/order/btn_num.gif" alt="更改数量" /></a></p>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
							<td>
								<ul>
									<li><a href="#"><img src="/images/shop/cn/order/btn_buy.gif" alt="立即购买" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_wish.gif" alt="关注商品" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_dell.gif" alt="删除" /></a></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="first-child"><input type="checkbox" title="해당상품 선택" /></td>
							<td class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/order/temp_order_pro.gif" alt="" /></a></td>
							<td class="info">
								<p class="icon">
									<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
									<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
									<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
									<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
									<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
								</p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 시작 -->
								<p class="brand"><a href="#">兰蔻/LANCOME</a></p> 
								<p class="product"><a href="#">光感精华素 EX 50ml</a></p>
								<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
								<!-- [D] 0811 브랜드 관련 <p>~</p> 변경 끝 -->
								<div class="option">
									<p class="opt">Natural Skin (01)<span class="btn-layer"><img src="/images/shop/cn/order/btn_option.gif" alt="更改选项" /></span></p>
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
												<input type="image" src="//image.ssgdfs.com/images/shop/order/btn_change.gif" alt="변경" /> 
												<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_soupon_reset.gif" alt="취소" /></a>
											</div><!-- end btn-set -->
										</div><!-- end layer-body -->
									</div><!-- end basket-layer -->
								</div><!-- end option -->
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
										<p>优惠券下载完毕</p>
									</dd>
								</dl>
							</td>
							<td>
								<span class="origin">$168</span>
								<span class="nation-currency">$168</span>
								<span class="currency">(约 ￥10,075)</span>
							</td>
							<td>
								<div class="number">
									<div class="num">
										<input type="text" title="数量" />
										<p class="btn-num">
											<span class="up"><img src="/images/shop/cn/order/btn_up.gif" alt="plus" /></span>
											<span class="down"><img src="/images/shop/cn/order/btn_down.gif" alt="minus" /></span>
										</p>
									</div>
								</div><!-- end number -->
								<p class="update"><a href="#"><img src="/images/shop/cn/order/btn_num.gif" alt="更改数量" /></a></p>
							</td>
							<td>
								<span class="buy-price">$268.80</span>
								<span class="nation-currency">(300,052원)</span>
							</td>
							<td>
								<ul>
									<li><a href="#"><img src="/images/shop/cn/order/btn_buy.gif" alt="立即购买" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_wish.gif" alt="关注商品" /></a></li>
									<li><a href="#"><img src="/images/shop/cn/order/btn_dell.gif" alt="删除" /></a></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div><!-- end basket -->
			<div class="btn-set">
				<a href="#"><img src="/images/shop/cn/order/btn_in_wish.gif" alt="선택상품 위시리스트 담기" /></a>
				<a href="#"><img src="/images/shop/cn/order/btn_dell_product.gif" alt="선택상품 삭제" /></a>
			</div><!-- end btn-set -->
			<div class="total-price basket-box">
				<ul>
					<li class="total-product">
						<dl class="head-cell">
							<dt><img src="/images/shop/cn/order/dt_total.gif" alt="商品合计金额" /></dt>
							<dd>
								<span>$ 4,498</span>
								<span class="ch-jp">(约 ￥1,4580.80)</span>
								<img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="-" class="minus" />
							</dd>
						</dl>
						<dl class="pattern">
							<dt>全部商品种类</dt>
							<dd>2种</dd>
							<dt>全部商品数量</dt>
							<dd>4个</dd>
						</dl>
					</li>
					<li class="discount-price">
						<dl class="head-cell">
							<dt><img src="/images/shop/cn/order/dt_dis.gif" alt="网上会员价" /></dt>
							<dd>
								<span>$ 467</span>
								<span class="ch-jp">(约 ￥1499.80)</span>
								<img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="=" class="equal" />
							</dd>
						</dl>
						<dl class="pattern">
							<dt>网上会员折扣</dt>
							<dd>$ 33.60</dd>
							<dt>促销折扣</dt>
							<dd>$ 433</dd>
						</dl>
					</li>
					<li class="total-sum">
						<dl class="head-cell">
							<dt><img src="/images/shop/cn/order/dt_sum.gif" alt="预付总金额" /></dt>
							<dd>
								<span class="discount">$ 4,031 </span>
								<span class="ch-jp">(约 ￥1499.80)</span>
							</dd>
						</dl>
						<dl class="pattern pattern-type01">
							<dt>积分</dt>
							<dd>￦1.68 (约 $1.2)</dd>
						</dl>
					</li>
				</ul>
				<p class="total-order">
					* 实际付款金额将根据订单内顾客可使用的优惠券、积分等有所不同。
				</p>
			</div><!-- end total-price -->
			<h3 class="order-title"><img src="/images/shop/cn/order/h3_payment_info.gif" alt="付款信息" /></h3>
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
						<dl>
							<dt><img src="/images/shop/cn/order/discount02.gif" alt="优惠券折扣" /></dt>
							<dd>
								<ul>
									<li class="coupon-box">
										$ <input type="text" title="포인트 조회" /><a href="#"><img src="/images/shop/cn/order/btn_check.gif" alt="查看及适用优惠券" /></a>
										<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">全部使用</label><span class="point">(可使用积分 <span class="font-red">\110,405</span>)</span></p>
										<p class="order-tip">
											<span class="red-font">7折以下折扣商品及部分品牌商品不适用优惠券。</span>
										</p>
									</li>
									<li><span class="pay-price">$367.0 (约 ￥6.38)</span></li>
								</ul>
							</dd>
						</dl>
						<div class="total-title"><img src="/images/shop/cn/order/total_title02.gif" alt="优惠券折扣" /><p>$<span>467.0 (￦413,108)</span></p></div>
						<dl class="first">
							<dt><img src="/images/shop/cn/order/point01.gif" alt="立即使用积分" /></dt>
							<dd>
								\ <input type="text" title="포인트 조회" /><a href="#"><img src="/images/shop/cn/order/btn_check02.gif" alt="查看" /></a>
								<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">全部使用</label><span class="point">(可使用积分 <span class="font-red">\110,405</span>)</span></p>
							</dd>
						</dl>
						<dl>
							<dt><img src="/images/shop/cn/order/point02.gif" alt="拥有积分 " /></dt>
							<dd>
								\ <input type="text" title="포인트 조회" /><a href="#"><img src="/images/shop/cn/order/btn_check02.gif" alt="查看" /></a>
								<p><input type="checkbox" id="now-use" name="now-use" /><label for="now-use">全部使用</label><span class="point">(可使用积分 <span class="font-red">\110,405</span>拥有积分: \<span class="font-red">10,405</span>)</span></p>
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
						<p class="payment-price"><span class="ori">$4,031</span><span>(约 44,513,108)</span><img src="/images/shop/cn/order/equal.gif" alt="equal" class="equal" /></p>
					</li>
				</ul>
				<p class="total-order">
					<a href="#" class="btn-join"><img src="/images/shop/cn/order/btn_join.gif" alt="회원가입" /></a><img src="/images/shop/cn/order/joingo_txt.gif" alt="신세계인터넷면세점 회원으로 가입하시면 더 많은 혜택을 받으실 수 있습니다." />
				</p>
			</div><!-- end total-price -->
			<div class="order-btn">
				<a href="#"><img src="/images/shop/cn/order/btn_order.gif" alt="继续购物" /></a>
				<a href="#"><img src="/images/shop/cn/order/btn_go_on.gif" alt="填写订单" /></a>
			</div><!-- end order-btn -->
			<div class="freebie">
				<h3 class="num">现在购买购物车的商品时可收到的赠品</h3>
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
				</div><!-- end freebie -->
			</div>
			<div class="freebie">
				<h3 class="num"><span>购买$○○○(约 ￥125.00)</span> 以上时可收到的赠品</h3>
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
												ULTRA FACIALULTRA FACIAL
												ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												ULTRA FACIALULTRA FACIAL
												ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
									<li>
										<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/product/detail/70X70.gif" alt="" /></a></p>
										<div class="info">
											<p class="product-name"><input type="radio" name="freebie" />키엘 아이크림</p>
											<p class="freebie">
												ULTRA FACIALULTRA FACIAL
												ULTRA FACIAL
											</p>
										</div><!-- end info -->
									</li>
								</ul>
							</div><!-- end list-ceremony -->
						</li>
					</ul>
				</div><!-- end freebie -->
			</div>
			<h3>○○○顾客，这种商品如何？</h3>
			<div class="relation-list">
				<div class="view-con">
					<span class="prev"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_prev.gif" alt="이전" /></span>
					<span class="next"><img src="//image.ssgdfs.com/images/shop/product/detail/btn_rel_next.gif" alt="다음" /></span>
				</div><!-- end view-con -->
				<div class="list">
					<ul>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">伊丽/ELIZABETH</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
						<li>
							<p class="photo"><img src="//image.ssgdfs.com/images/shop/order/100X100.gif" alt="" /></p>
							<p class="brand">[캘빈클라인]</p>
							<p class="product-name">CK ONE 200ml</p>
							<p class="price">
									<span class="origin">$88</span>
									<span class="us-currency">$88</span>
									<span class="nation-currency">(约 ￥125.00)</span>
							</p>
						</li>
					</ul>
				</div><!-- end list-->
			</div><!-- end relation-list -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>