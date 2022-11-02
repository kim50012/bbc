<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/mypage_popup.css" rel="stylesheet" type="text/css" />  
<link href="/css/mypage.css" rel="stylesheet" type="text/css" /> 

<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
jQuery(function($){ 

	/* $('.prbox_scroll').jScrollPane({showArrows: true}); */
 	
	$('.send-mail').hide(); 
	$(".btn_wrap a.btn02").click(function(){
    	$('.send-mail').toggle();
    });
    $(".send-mail a.close").click(function(){
    	$('.send-mail').hide(); 
    }); 
	
});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/mypage/popup/h1_orderlist.gif" alt="订单" /></h1>
	</div> 
	<div id="body"> 
		<div class="contents">
			<div class="prbox_scroll"> 
			 	<!-- orderlist-conbox -->
				<div class="orderlist-conbox">
					
					<p class="stitle"><img src="/images/shop/cn/mypage/popup/title_orderlist02.gif" alt="订购信息" /></p>
					<div class="table-listwtype">	 
						<div class="list">
							<table summary="订购信息">
								<caption>订购信息</caption>
								<colgroup>  
									<col width="120px" /> 
									<col width="232px" /> 
									<col width="120px" />  
									<col width="232px" />  
								</colgroup> 
								<tbody>  
									<tr> 
										<th scope="col"><span>订单号码</span></th>
										<td><span class="ordernumber">6809314133505</span></td> 
										<th scope="col"><span>订购日期</span></th>
										<td><span>YYYY.MM.DD TT:MM:SS</span></td> 
									</tr>   
									<tr> 
										<th scope="col"><span>订单打印日期</span></th>
										<td><span>YYYY.MM.DD TT:MM</span></td> 
										<th scope="col"><span>护照号码</span></th>
										<td><span>M77730155</span></td>
									</tr>    
									<tr> 
										<th scope="col"><span>订购者</span></th>
										<td><span>姓名</span></td> 
										<th scope="col"><span>性别</span></th>
										<td><span>女</span></td>
									</tr>   
									<tr> 
										<th scope="col"><span>付款方式</span></th>
										<td colspan="3"><span>씨티 VISA (할부 3개월)</span></td>  
									</tr>   
									<tr> 
										<th scope="col"><span>出发地点</span></th>
										<td><span>仁川国际机场</span></td> 
										<th scope="col"><span>航班号</span></th>
										<td><span>KOBEE</span></td>
									</tr>    
									<tr> 
										<th scope="col"><span>出境日期</span></th>
										<td colspan="3"><span>2013年 3月 3日 11时 30分</span></td>  
									</tr>  
								</tbody>  
							</table> 
						</div> 				
					</div>
				    
					<p class="stitle"><img src="/images/shop/cn/mypage/popup/title_orderlist03.gif" alt="订购商品" /></p>
					<div class="table-listhtype">	 
						<div class="list info-product">
							<table summary="주문 상품 테이블">
								<caption>주문 상품 테이블</caption>
								<colgroup>   
									<col width="508px" />  
									<col width="116px" /> 
									<col width="61px" />    
								</colgroup>
								<thead>
									<tr>  
										<th scope="row">商品名</th> 
										<th scope="row">购买金额</th>  
										<th scope="row">数量</th>     
									</tr>
								</thead>
								<tbody>   
									<tr>   
										<td class="info info-noline"> 
											<div class="product-info"> 
												<p class="brand">[KIEHL`S]</p>
												<p class="product-num">(<span>REF. NO :</span> PEANU-MD.F/97)</p> 
												<p class="product">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</p>
												<p class="option"><span>검정/여성용/기타</span><span class="tel">(상품문의 : 051-749-1369)</span></p>
											</div>
										</td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(\1,091,270)</span>
											</p>
										</td> 
										<td><span class="quantity">1</span></td>    
									</tr>    
									<tr>   
										<td class="info info-noline">
											<div class="product-info"> 
												<p class="brand">[KIEHL`S]</p>
												<p class="product-num">(<span>REF. NO :</span> PEANU-MD.F/97)</p> 
												<p class="product">ULTRA FACIAL CREAM 125MLTAG </p>
												<p class="option"><span>검정/여성용/기타</span></p>
											</div>
										</td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(\1,091,270)</span>
											</p>
										</td> 
										<td><span class="quantity">1</span></td>    
									</tr>   
								</tbody>  
							</table> 
						</div> 
						
						<div class="total-pricebox">
							<div class="total-price">
								<table summary="订购商品">
									<caption>订购商品</caption>
									<colgroup>  
										<col width="175px" /> 
										<col width="265px" />  
										<col width="265px" />  
									</colgroup> 
									<tbody>   
										<tr>  
											<th class="tit"><img src="/images/shop/cn/mypage/head_cell_tit01.gif" alt="商品合计金额" /></th>
											<td colspan="2">
												<p class="order-price"><span class="dollar">$4,498</span><span>(约￥5,054,403)</span></p>
											</td>   
										</tr>  
										<tr>  
											<th class="tit" rowspan="2"><img src="/images/shop/cn/mypage/head_cell_tit02.gif" alt="折扣/积分使用金额" /></th>
											<td colspan="2">
												<p class="order-price"><span class="dollar">$4,498</span><span>(约￥5,054,403)</span></p>
											</td>   
										</tr> 
										<tr>   
											<td>
												<div class="discount-box"> 
													<dl>
														<dt><img src="/images/shop/cn/mypage/total_title01.gif" alt="折扣金额" /><p>$<span>467.0 (￦413,108)</span></p></dt>
														<dd>
															<ul> 
																<li class="coupon-box">
																	<span class="dis-txt">- 促销优惠</span>
																	<span class="dis-pri">$4.40 (约￥6,450)</span>
																</li>
																<li class="coupon-box">
																	<span class="dis-txt">- 打折券(个别商品)</span>
																	<span class="dis-pri">$1 (约 ￥6.38)</span>
																</li>
															</ul> 
														</dd>
													</dl> 
												</div>
											</td>      
											<td> 
												<div class="savecon-box"> 
													<dl>
														<dt><img src="/images/shop/cn/mypage/total_title02.gif" alt="积分使用金额" /><p>$<span>467.0 (￦413,108)</span></p></dt>
														<dd> 
															<ul>
																<li class="coupon-box">
																	<span class="dis-txt">- 立即使用积分</span>
																	<span class="dis-pri">$4.40 (约￥6,450)</span>
																</li>
																<li class="coupon-box">
																	<span class="dis-txt">- 拥有积分</span>
																	<span class="dis-pri">$4.40 (约￥6,450)</span>
																</li>
																<li class="coupon-box">
																	<span class="dis-txt">- 新世界积分</span>
																	<span class="dis-pri">$4.40 (约￥6,450)</span>
																</li>
															</ul> 
														</dd>
													</dl> 
												</div> 
											</td>  
										</tr>   
										<tr>  
											<th class="tit"><img src="/images/shop/cn/mypage/head_cell_tit03.gif" alt="最终付款金额" /></th>
											<td colspan="2">
												<p class="payment-price"><span class="ori">$4,031</span> <span>(约￥40,513,108)</span> 
												<span class="sum"><img src="/images/shop/cn/mypage/product_save_money.gif" alt="积分" /> <span>￦1,000(约 $1)</span></span></p>
											</td>      
										</tr> 
									</tbody>
								</table>  
							</div>
						</div> 			
					</div>
						 				
					<div class="conbox-info">
						<div class="col-left">
							<p class="stitle"><img src="/images/shop/cn/mypage/popup/title_orderlist04.gif" alt="商品领取步骤" /></p> 
							<div class="tipping-box">   
								<ul class="info">
									<li><img src="/images/shop/cn/mypage/popup/con_orderlist04_1.gif" alt="01. 到达新世界免税店取货处" /></li>
									<li><img src="/images/shop/cn/mypage/popup/con_orderlist04_2.gif" alt="02. 出示订单和护照" /></li>
									<li><img src="/images/shop/cn/mypage/popup/con_orderlist04_3.gif" alt="03. 确认护照信息是否一致以后，领取商品 并签署姓名" /></li>
									<li><img src="/images/shop/cn/mypage/popup/con_orderlist04_4.gif" alt="04. 取货完毕" /></li>
								</ul> 
								<ul>
									<li>应由订购者本人领取商品，且必须打印订单。若无<br />
									法打印订单，则在纸张记录订购号码，与护照、登机<br />
									牌一同出示便可领取商品。</li>								
									<li>旧护照号码或护照号码、出国信息不一致，将无法领<br />
									取商品。请确认以后，至少于出国前三日联系客服中<br />
									心(1577-0161）进行修改方可领取商品。</li>								
									<li>若想变更出国信息以及护照信息，请截止到出国前三<br />
									日为止联系客服中心。 (1577-0161)</li>								
									<li>取货后请确认商品数量与商品名。若有异常，请立即<br />
									告知取货处的职员。<br />
									<span>对于出境后丢失的商品，概不负责。</span></li>
								</ul>   
							</div> 
						</div> 
						<div class="col-right">						
							<p class="stitle"><img src="/images/shop/cn/mypage/popup/title_orderlist05.gif" alt="取货处介绍" /></p> 
							<div class="airlist">  
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_west.gif" alt="仁川国际机场西边取货处" /></div> 
									<div class="map-info">
										<p class="title">仁川国际机场西边取货处</p>
										<p class="txt"><span>位置</span>: 通过3号出境审查台，乘咨询台前方的扶梯上楼后，</p>
										<p class="txt02">位于韩亚航空贵宾休息室前面。</p>
										<p class="tel"><span>联系方式</span>: 032-743-2709</p>
									</div>   
								</div> <!--
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_east.gif" alt="仁川国际机场东边取货处" /></div>
									<div class="map-info">
										<p class="title">仁川国际机场东边取货处</p>
										<p class="txt"><span>位置</span>: 位于航站楼2号出国审查台楼上（4楼），</p>
										<p class="txt02">大韩航空贵宾休息室对面</p>
										<p class="tel"><span>联系方式</span>: 032-743-2674</p>
									</div> 
								</div> 
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_boarding.gif" alt="仁川国际机场登机楼" /></div>
									<div class="map-info">
										<p class="title">仁川国际机场登机楼</p>
										<p class="txt"><span>位置</span>: 从机场快轨下车后乘扶梯上楼，</p>
										<p class="txt02">位于121号登机口前面。</p>
										<p class="tel"><span>联系方式</span>: 032-743-2757</p>
									</div>  
								</div> 
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_gimpo.gif" alt="金浦国际机场" /></div>
									<div class="map-info">
										<p class="title">金浦国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场3楼出国审查台后，</p>
										<p class="txt02">位于36号登机口前面。</p> 
										<p class="tel"><span>联系方式</span>: 02-2666-5285</p>
									</div> 
								</div> 
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_daegu.gif" alt="大邱国际机场" /></div>
									<div class="map-info map-tow">
										<p class="title">大邱国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于左侧。</p> 
										<p class="tel"><span>联系方式</span>: 053-981-8277</p>
									</div> 
								</div> 
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_gimhae.gif" alt="金海国际机场" /></div>
									<div class="map-info map-tow">
										<p class="title">金海国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于右侧。</p>
										<p class="tel"><span>联系方式</span>: 051-971-5901</p>
									</div> 
								</div> 
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_busan.gif" alt="釜山港" /></div>
									<div class="map-info map-tow">
										<p class="title">釜山港</p>
										<p class="txt"><span>位置</span>: 通过码头2楼出国审查台后，位于右侧。</p> 
										<p class="tel"><span>联系方式</span>: 051-465-0181</p>
									</div> 
								</div> -->							 
							</div> 		
						</div>
					</div>
				 
					<div class="btn_wrap"> 
						<p class="center"><a href="#"><img src="/images/shop/cn/mypage/popup/btn_close.gif" alt="关闭" /></a>
						<a href="#" class="print"><img src="/images/shop/cn/mypage/popup/btn_print.gif" alt="打印"></a></p>  
					</div>						
				</div>
				<!-- //orderlist-conbox -->					
			</div>			    
		</div> 	
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>