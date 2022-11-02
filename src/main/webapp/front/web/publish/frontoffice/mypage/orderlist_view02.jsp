<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_mypage.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
			<div class="mypage"> 
				<div class="sidebar">
					<div class="side-menu">
						<h2><img src="//image.ssgdfs.com/images/shop/cn/common/sub/h2_mypage.gif" alt="我的页面 My Page" /></h2> 
						<div class="side-menubox">
							<ul>
								<li><a href="#" class="selected">非会员订购</a></li>  
							</ul>
						</div>
					</div> 				
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>	
				</div> 
				
				<div id="contents">  
					<div class="page-sublocation">  
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><strong>非会员订购</strong>  
					</div>
			 
					<div class="visual-title">  
						<p>MY PAGE 请在新世界网上免税店尽享购物之快乐！我们将为顾客的购物方便尽最大的努力。</p>
					</div>
					 			
					<h3 class="no-member"><img src="/images/shop/cn/mypage/title_orderlist_no.gif" alt="非会员订购" /></h3>	
					
					
					<div class="stitle-conbox">  
						<div class="table-listwtype">	 
							<div class="list stitle-table">
								<table summary="기본정보 테이블">
									<caption>기본정보 테이블</caption>
									<colgroup>  
										<col width="120px" />   
										<col width="175px" />  
										<col width="95px" />   
										<col width="120px" />  
										<col width="180px" />  
										<col width="90px" />   
									</colgroup> 
									<tbody> 
										<tr> 
											<th scope="col"><span>订单号码</span></th>
											<td><span class="ordernumber">6809314133505</span></td> 
											<td class="right"><a href="#"><img src="/images/shop/cn/mypage/btn_orderlist_print.gif" alt="打印订单" /></a></td> 
											<th scope="col"><span>订购日期</span></th>
											<td colspan="2"><span>2013.05.01 15:19:34</span></td>
										</tr>    
										<tr> 
											<th scope="col"><span>订购状态</span><a href="#"><img src="/images/shop/cn/mypage/btn_order_stateinfo.gif" alt="订购状态" /></a></th>
											<td colspan="2"><span>订购完成</span></td> 
											<th scope="col"><span>商品取货处</span></th>
											<td><span>仁川国际机场西边取货处</span></td>
											<td class="right"><a href="#"><img src="/images/shop/cn/mypage/btn_airinfo.gif" alt="取货处指南" /></a></td> 
										</tr>  
									</tbody>  
								</table> 
							</div> 				
						</div>
					
						<p class="ctitle">- 订购者信息<a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_orderinfo_minfo.gif" alt="订购信息变更指南" /></a></p>
						<div class="table-listwtype">	 
							<div class="list stitle-table">
								<table summary="주문자 정보 테이블">
									<caption>주문자 정보 테이블</caption>
									<colgroup>  
										<col width="120px" /> 
										<col width="270px" /> 
										<col width="120px" />  
										<col width="270px" />   
									</colgroup> 
									<tbody>  
										<tr> 
											<th scope="col"><span>订购者(ID)</span></th>
											<td><span>姓名 (fgk234)</span></td> 
											<th scope="col"><span>生年月日(性别)</span></th>
											<td><span>YYYY.MM.DD (女)</span></td>
										</tr>  
										<tr> 
											<th scope="col"><span>电话</span></th>
											<td><span>010-2566-4547</span></td> 
											<th scope="col"><span>手机</span></th>
											<td><span>051-534-6619</span></td>
										</tr> 
										<tr> 
											<th scope="col"><span>E-mail</span></th>
											<td colspan="3"><span>Bingplan@ssgdfs.com</span></td>  
										</tr>  
										<tr> 
											<th scope="col"><span>其它信息</span></th>
											<td colspan="3"><span>빨간색 주문했는데요, 없으면 미리 꼭 알려주세요~</span></td>  
										</tr>     
									</tbody>  
								</table> 
							</div> 				
						</div>
						
						<p class="ctitle">- 护照信息</p>
						<div class="table-listwtype">	 
							<div class="list stitle-table">
								<table summary="여권 정보 테이블">
									<caption>여권 정보 테이블</caption>
									<colgroup>  
										<col width="120px" /> 
										<col width="270px" /> 
										<col width="120px" />  
										<col width="270px" />   
									</colgroup> 
									<tbody>  
										<tr> 
											<th scope="col"><span>国籍</span></th>
											<td><span>中国</span></td> 
											<th scope="col"><span>英文姓名</span></th>
											<td><span>HONG GLIDONG</span></td>
										</tr>   
										<tr> 
											<th scope="col"><span>护照号码</span></th>
											<td><span>M53486322</span></td> 
											<th scope="col"><span>护照有效期</span></th>
											<td><span>YYYY.MM.DD</span></td>
										</tr> 
									</tbody>  
								</table> 
							</div> 				
						</div>
						 
						<p class="ctitle">- 出境信息</p>
						<div class="table-listwtype">	 
							<div class="list stitle-table">
								<table summary="출국정보 테이블">
									<caption>출국정보 테이블</caption>
									<colgroup>  
										<col width="120px" /> 
										<col width="270px" /> 
										<col width="120px" />  
										<col width="270px" />   
									</colgroup> 
									<tbody>  
										<tr> 
											<th scope="col"><span>出境日期</span></th>
											<td colspan="3"><span>2013.05.01 15:19:34</span></td>
										</tr> 
										<tr> 
											<th scope="col"><span>出发地点</span></th>
											<td><span>仁川国际机场</span></td> 
											<th scope="col"><span>目的地</span></th>
											<td><span>美国/关岛/塞班</span></td>  
										</tr>      
										<tr> 
											<th scope="col"><span>航班号</span></th>
											<td><span>KOBEE</span></td> 
											<th scope="col"><span>直达,中转与否</span></th>
											<td><span>中转</span></td>
										</tr> 
										<!-- E-티켓 미 등록의 경우 -->
										<tr> 
											<th scope="col"><span>电子机票</span></th>
											<td class="eticket-h" colspan="3"><span><a href="#"><img src="/images/shop/cn/mypage/btn_eticket_enlo.gif" alt="注册电子机（船）票" /></a>才能完成订购。</span>
												<p>到YYYY.MM.DD TT:MM为止未注册电子机（船）票，订购将被自动取消。</p>
											</td>  
										</tr>  
										<!-- E-티켓을 등록 한 경우 --> 
										<tr> 
											<th scope="col"><span>电子机票</span></th>
											<td class="eticket-h" colspan="3"><span><a href="#"><img src="/images/shop/cn/mypage/btn_eticket_enview.gif" alt="查看电子机（船）票" /></a>电子机票注册日 : 2013.05.01 15:25, 注册途径 : 网上注册</span>
												<p>* 若想更改电子机（船）票，请点击‘查看电子机（船）票’按钮。 </p>
											</td>  
										</tr>  
									</tbody>  
								</table> 
							</div> 	
						</div>  
					</div>
 
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_orderlist02.gif" alt="订购商品" /></p>
					<div class="table-listhtype">	 
						<div class="list info-product">
							<table summary="주문가능 상품 테이블">
                    			<caption>주문가능 상품 테이블</caption>
								<colgroup>  
									<col width="119px" /> 
									<col width="444px" /> 
									<col width="61px" />  
									<col width="155px" />   
								</colgroup>
								<thead>
									<tr>  
										<th scope="row" colspan="2">商品名</th> 
										<th scope="row">数量</th>  
										<th scope="row">购买金额</th>   
									</tr>
								</thead>
								<tbody>   
									<tr>  
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
												<p class="option">검정/여성용/기타</p>
											</div>
										</td> 
										<td><span class="quantity">1</span></td>    
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约 ￥1,091,270)</span>
											</p>
										</td> 
									</tr>   
									<tr>  
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM HEUER</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
												<p class="option">검정/여성용/기타</p>
											</div>
										</td> 
										<td><span class="quantity">1</span></td>    
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约 ￥1,091,270)</span>
											</p>
										</td> 
									</tr>    
									<tr> 
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info">  
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
												<!-- <p class="option">검정/여성용/기타</p> -->
											</div>
										</td> 
										<td><span class="quantity">1</span></td>  
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约 ￥1,091,270)</span>
											</p>
										</td> 
									</tr>   
								</tbody>  
							</table> 
						</div> 				
					</div>
					  
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_orderlist02_1.gif" alt="赠品" />
					<div class="list-ceremony">
						<ul>
							<li> 
								<p class="photo"><img src="/images/shop/cn/mypage/temp_freebie_pro.gif" alt="" /></p>
								<div class="info">
									<p class="product-name">[사은품명]</p>
									<p class="freebie">사은품설명</p>
								</div> 
							</li> 
							<li>
								<p class="photo"><img src="/images/shop/cn/mypage/temp_freebie_pro.gif" alt="" /></p>
								<div class="info">
									<p class="product-name">[키엘 아이크림]</p>
									<p class="freebie">스킨 50ml / 화이트 프로그램 마스크 1매 증정</p>
								</div> 
							</li>
							<li>
								<p class="photo"><img src="/images/shop/cn/mypage/temp_freebie_pro.gif" alt="" /></p>
								<div class="info">
									<p class="product-name">[키엘 아이크림]</p>
									<p class="freebie">화이트 프로그램 마스크 1매 증정</p>
								</div> 
							</li>
							<li>
								<p class="photo"><img src="/images/shop/cn/mypage/temp_freebie_pro.gif" alt="" /></p>
								<div class="info">
									<p class="product-name">[키엘 아이크림]</p>
									<p class="freebie">스킨 50ml / 화이트 프로그램 마스크 1매 증정</p>
								</div>
							</li>
							<li>
								<p class="photo"><img src="/images/shop/cn/mypage/temp_freebie_pro.gif" alt="" /></p>
								<div class="info">
									<p class="product-name">[키엘 아이크림]</p>
									<p class="freebie">화이트 프로그램 마스크 1매 증정</p>
								</div> 
							</li> 
						</ul>
					</div>
 
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_orderlist03.gif" alt="付款信息" /></p>  
					<div class="total-pricebox">
						<div class="total-price">
							<ul>
								<li class="order">
									<p class="tit"><img src="/images/shop/cn/order/dt_total.gif" alt="商品合计金额" /></p>
									<p class="order-price"><span class="dollar">$4,498</span><span>(约￥5,054,403)</span><img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="minus" /></p>
								</li>
								<li class="discount">
									<p class="tit"><img src="/images/shop/cn/order/dt_dis02.gif" alt="折扣/积分使用金额" /></p>
									<p class="discount-price"><span class="dollar">$4,498</span><span>(约￥5,054,403)</span></p> 
									<div class="discount-box">
										<div class="total-title"><img src="/images/shop/cn/order/total_title01.gif" alt="折扣金额" /><p>$<span>467.0 (￦413,108)</span></p></div>
										<dl class="first">
											<dt><img src="/images/shop/cn/order/discount01.gif" alt="基本折扣" /></dt>
											<dd>
												<ul>
													<li class="coupon-box">
														<span class="dis-txt">网上会员折扣</span>
														<span class="dis-pri">$4.40 (约 ￥6,450)</span>
													</li>
													<li class="coupon-box">
														<span class="dis-txt">促销优惠</span>
														<span class="dis-pri">$4.40 (约 ￥6,450)</span>
													</li>
													<li class="coupon-box">
														<span class="dis-txt">打折券(个别商品)</span>
														<span class="dis-pri">$4.40 (约 ￥6,450)</span>
													</li>
												</ul> 
											</dd>
										</dl>
										<dl>
											<dt><img src="/images/shop/cn/order/discount02.gif" alt="优惠券折扣" /></dt>
											<dd>
												<ul>
													<li class="coupon-box">
														<span class="dis-txt">现金优惠券</span>
														<span class="dis-pri">$4.40 (约￥6,450)</span>
													</li>
													<li class="coupon-box">
														<span class="dis-txt">双重优惠券</span>
														<span class="dis-pri">$4.40 (约￥6,450)</span>
													</li>
												</ul> 
											</dd>
										</dl>
									</div> 
									<div class="savecon-box">
										<div class="total-title"><img src="/images/shop/cn/order/total_title02.gif" alt="积分使用金额" /><p>$<span>467.0 (￦413,108)</span></p></div>
										<dl class="first">
											<dt><img src="/images/shop/cn/order/point01.gif" alt="立即使用积分" /></dt>
											<dd><span class="pay-price02">$367.0 (￦413,108)</span></dd> 
										</dl>
										<dl>
											<dt><img src="/images/shop/cn/order/point02.gif" alt="拥有积分" /></dt>
											<dd><span class="pay-price02">$367.0 (￦413,108)</span></dd> 
										</dl>
										<dl>
											<dt><img src="/images/shop/cn/order/point03.gif" alt="新世界积分" /></dt>
											<dd><span class="pay-price02">P 123,456</span></dd> 
										</dl>
									</div> 
								</li>
								<li class="payment">
									<p class="tit"><img src="/images/shop/cn/order/dt_sum02.gif" alt="最终付款金额" /></p>
									<p class="payment-price"><span class="ori">$4,031</span><span>(约40,513,108)</span><img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="equal" class="equal" /></p>
									<div class="final-pay-box">  
										<div class="final-payment">
											<dl>
												<dt><img src="/images/shop/cn/mypage/product_save_money.gif" alt="积分" /></dt>
												<dd>￦1,832</dd>
											</dl>
										</div>
									</div>
								</li>
							</ul>
							<p class="total-order">
								<strong>홍길동</strong> 顾客已用 信用卡一次性付款完毕。
								<a href="#"><img src="/images/shop/cn/order/btn_join.gif" alt="打印收据" /></a>
							</p>
						</div>
					</div>					
					<p class="total-priceinfo">点击“打印收据”按钮便可发放销售发票。</p>
					 	 
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_orderlist04.gif" alt="订购取消明细" /></p>
					<div class="table-listhtype">	 
						<div class="list info-product">
							<table summary="취소 내역 테이블">
                    			<caption>취소 내역 테이블</caption>
								<colgroup>  
									<col width="119px" /> 
									<col width="462px" /> 
									<col width="61px" />  
									<col width="138px" />    
								</colgroup>
								<thead>
									<tr>  
										<th scope="row" colspan="2">商品名</th> 
										<th scope="row">数量</th>  
										<th scope="row">取消金额</th>  
									</tr>
								</thead>
								<tbody>   
									<tr>  
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
												<p class="option">검정/여성용/기타</p>
											</div>
										</td> 
										<td><span class="quantity">1</span></td>    
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约 ￥1,091,270)</span>
											</p>
										</td> 
									</tr>   
									<tr>  
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM HEUER</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p>
												<p class="option">검정/여성용/기타</p>
											</div>
										</td> 
										<td><span class="quantity">1</span></td>    
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约 ￥1,091,270)</span>
											</p>
										</td> 
									</tr>  
								</tbody>  
							</table> 
						</div> 				
					</div>
					 
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_orderlist05.gif" alt="付款取消信息" /></p>
					<div class="table-listwtype">	 
						<div class="list stitle-cancel">
							<table summary="취소 정보 테이블">
								<caption>취소 정보 테이블</caption>
								<colgroup>  
									<col width="120px" /> 
									<col width="270px" /> 
									<col width="120px" />  
									<col width="270px" />   
								</colgroup> 
								<tbody>  
									<tr> 
										<th scope="col"><span>取消申请日</span></th>
										<td><span>YYYY.MM.DD</span></td> 
										<th scope="col"><span>处理现状/处理日</span></th>
										<td><span>取消完成 / YYYY.MM.DD</span></td>
									</tr> 
									<tr> 
										<th scope="col"><span>取消金额</span></th>
										<td colspan="3"><span class="f-red">$149 (约 ￥125.00)</span></td>  
									</tr>  
									<tr> 
										<th scope="col"><span>退款明细</span></th>
										<td colspan="3" class="final-s"><p>$9.3 (\10,406)</p></td>  
									</tr>    
								</tbody>  
							</table> 
							<div class="btn_wrap">
								<p class="right"><a href="#"><img src="/images/shop/cn/mypage/btn_ordercancel.gif" alt="取消订购" /></a></p>
							</div>	
						</div> 									
					</div>		  
										
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_orderlist06.gif" alt="안내 및 주의사항" /></p>
					<div class="tipping-box"> 
						<ul>
							<li>若订购信息（订购者信息、出境信息）有误，则出境时无法在机场领取商品，请务必填写正确的信息。<a href="#"><img src="/images/shop/cn/mypage/btn_orderinfo_minfo.gif" alt="订购信息变更指南" /></a></li>
							<li>取消订购可在网上通过“订购明细”栏申请取消。<a href="#"><img src="/images/shop/cn/mypage/btn_ordercancel_info02.gif" alt="订购取消指南" /></a></li>
							<li>原则上应由订购者本人来领取商品，并在领取货时需要出示订单，因此必须打印订单。若无法打印订单，则在纸上记录订购号码、<br />
								商品、数量出示给取货处。（例：订购号码6370396143649，兰蔻化妆水2瓶、迪奥唇膏1个）</li>
							<li>领取商品时，请当场确认商品。若有异常，请及时告知取货处工作人员。（对于顾客出境后丢失商品，免税店概不负责。）</li>
							<li>借记卡退款时，将退款打入账户额外需要1~3天的时间。</li> 
						</ul> 
					</div>
					  			
				</div><!-- //contents -->  
			</div><!-- //mypage -->	 
			
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>