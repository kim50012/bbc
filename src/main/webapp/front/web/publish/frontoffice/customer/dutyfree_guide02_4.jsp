<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE 고객센터</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/customer.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_customer.js"></script>
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
			<div class="customer">				 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_customer.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  				
					<div class="page-sublocation">   
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><a href="#">购物指南</a><span>&gt;</span><strong>购物步骤</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					 				 
					<h3><img src="/images/shop/cn/customer/title_guide.gif" alt="购物步骤" /></h3>				 
					 
					<div class="shoppingno-conbox">
						<div class="infobox">
							<ul>
								<li class="no01"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno01.gif" alt="01 注册新世界网上免税店会员" /></a></li>
								<li class="no02"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno02.gif" alt="02 订购" /></a></li>
								<li class="no03"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno03.gif" alt="03 付款" /></a></li>
								<li class="no04"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno04_on.gif" alt="04 取货" /></a></li>
							</ul>							 
						</div>
					
						<div class="con-box">     
							<p><img src="/images/shop/cn/customer/img_shoppingno04_01.gif" alt="01到达新世界免税店取货处 02出示订单与护照 03确认护照信息是否一致后领取商品并签署姓名 04取货成功" /></p> 
							<div class="tipping-box">
								<p class="txt-tipping">出境当天办完出境手续之后，于登机前在新世界网上免税店取货处取货。</p> 
								<p class="txt-tipping">取货时必须出示出境者本人的护照、登机牌、订单（订购号码）。</p> 
								<p class="txt-tipping">若无法打印订单，则在纸张记录订购号码与护照、登机牌一同出示便可领取商品。</p> 
								<p class="txt-tipping">领取商品之后，如商品存在问题，请立即告知新世界网上免税店取货处的职员。对于出境之后的商品，新世界网上免税店不负任何责任。</p> 	
								<p class="txt-tipping">若订单上输入的英文姓名、生年月日等出境信息有误，则无法领取商品，因此<span>订购商品时请准确输入信息（与护照一致的信息）。</span></p>  
							</div>   
						</div> 
												
						<h3><img src="/images/shop/cn/store/title_airinfo.gif" alt="取货处指南" /></h3> 				
						<div class="airlist">
							<ul class="airlist-con" id="airlist-con">
								<li><p class="title"><img src="/images/shop/cn/store/stitle_incheon_west.gif" alt="仁川国际机场西边取货处" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_west.gif" alt="仁川国际机场西边取货处" /></div> 
										<div class="map-info">
											<p class="title">仁川国际机场西边取货处</p>
											<p class="txt"><span>位置</span>: 通过3号出境审查台，乘咨询台前方的扶梯上楼后，</p>
											<p class="txt02">位于韩亚航空贵宾休息室前面。</p>
											<p class="tel"><span>联系方式</span>: 032-743-2709</p>
										</div>   
									</div>
								</li>
								<li><p class="title"><img src="/images/shop/cn/store/stitle_incheon_east.gif" alt="仁川国际机场东边取货处" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_east.gif" alt="仁川国际机场东边取货处" /></div>
										<div class="map-info">
											<p class="title">仁川国际机场东边取货处</p>
											<p class="txt"><span>位置</span>: 位于航站楼2号出国审查台楼上（4楼），</p>
											<p class="txt02">大韩航空贵宾休息室对面</p>
											<p class="tel"><span>联系方式</span>: 032-743-2674</p>
										</div> 
									</div>
								</li> 
								<li><p class="title"><img src="/images/shop/cn/store/stitle_incheon_boarding.gif" alt="仁川国际机场登机楼" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_boarding.gif" alt="仁川国际机场登机楼" /></div>
										<div class="map-info">
											<p class="title">仁川国际机场登机楼</p>
											<p class="txt"><span>位置</span>: 从机场快轨下车后乘扶梯上楼，</p>
											<p class="txt02">位于121号登机口前面。</p>
											<p class="tel"><span>联系方式</span>: 032-743-2757</p>
										</div>  
									</div>
								</li> 
								<li><p class="title"><img src="/images/shop/cn/store/stitle_gimpo.gif" alt="金浦国际机场" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_gimpo.gif" alt="金浦国际机场" /></div>
										<div class="map-info">
											<p class="title">金浦国际机场</p>
											<p class="txt"><span>位置</span>: 通过机场3楼出国审查台后，</p>
											<p class="txt02">位于36号登机口前面。</p> 
											<p class="tel"><span>联系方式</span>: 02-2666-5285</p>
										</div> 
									</div>
								</li>
								<li><p class="title"><img src="/images/shop/cn/store/stitle_daegu.gif" alt="大邱国际机场" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_daegu.gif" alt="大邱国际机场" /></div>
										<div class="map-info map-tow">
											<p class="title">大邱国际机场</p>
											<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于左侧。</p> 
											<p class="tel"><span>联系方式</span>: 053-981-8277</p>
										</div> 
									</div>
								</li>
								<li><p class="title"><img src="/images/shop/cn/store/stitle_gimhae.gif" alt="金海国际机场" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_gimhae.gif" alt="金海国际机场" /></div>
										<div class="map-info map-tow">
											<p class="title">金海国际机场</p>
											<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于右侧。</p>
											<p class="tel"><span>联系方式</span>: 051-971-5901</p>
										</div> 
									</div>
								</li>
								<li><p class="title"><img src="/images/shop/cn/store/stitle_busan.gif" alt="釜山港" /></p>
									<div class="conbox">
										<div class="map"><img src="/images/shop/cn/product/detail/img_busan.gif" alt="釜山港" /></div>
										<div class="map-info map-tow">
											<p class="title">釜山港</p>
											<p class="txt"><span>位置</span>: 通过码头2楼出国审查台后，位于右侧。</p> 
											<p class="tel"><span>联系方式</span>: 051-465-0181</p>
										</div> 
									</div>
								</li>
							</ul>
						</div>					  
					</div> 
					  
				</div><!-- //contents -->  
			</div><!-- //customer -->	 
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>