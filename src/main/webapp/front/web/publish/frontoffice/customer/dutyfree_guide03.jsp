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
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><a href="#">购物指南</a><span>&gt;</span><strong>机舱内禁止携带物品说明</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					
					 				 
					<h3><img src="/images/shop/cn/customer/title_limitinfo.gif" alt="机舱内禁止携带物品说明" /></h3>
					 <div class="payment-conbox">
						<p class="stitle-txt">
							为了彻底断绝携带液体引爆物于机舱内，依据(ICAO)的劝告决定，从2007年3月1日00时开始，对从大韩民国内ICAO的机场出发的所有国际航班<br />
							（包括经由或中转）限制携带液体类、凝胶类、喷雾类进入机舱，望顾客在购买时敬请参考。<br />
							- 适用日期 : <span> 自2007年 3月 1日 00时开始</span>
						</p>
						<div class="tip-con">
							<div class="hbox01">
								<p class="stitle"><img src="/images/shop/cn/customer/stitle_limit.gif" alt="机舱内限制携带的物品: 液体类及凝胶类※" /></p>
								<p class="stitle-txt">化妆品、香水、红参浓缩液、饮料、牙膏、发胶、洗发露、睫毛膏、喷雾剂、钢笔、水性笔等</p>
							</div>
							<p class="mtitle"><img src="/images/shop/cn/customer/stitle_limit02.gif" alt="携带免税店购买物品到机内的条件" /></p>
							<p class="limit-txt">经过安检后，在市内免税店或机场免税店领取的液体类、凝胶类、喷雾类如符合如下条件便可随身携带进入机舱内。</p>
							<div class="hbox01">
								<p class="txt-tipping">用免税店共同制作的安全防揭加封透明袋(Tamper-evident bag)包装时， 不计容量和数量均可带入机内。</p>
								<p class="txt-tipping">免税品购物收据在安全防揭加封透明袋内或粘贴在袋上时。</p>
								<p class="txt-tipping">安全防揭加封透明袋必须在到达最终目的地以后打开，若在中途打开或被毁损，则禁止将免税品带入机舱内。（开封时会留有痕迹）</p>
							</div>
							<span class="s-check">* 必须同时满足上述条件。</span>
							<p class="mtitle"><img src="/images/shop/cn/customer/stitle_limit03.gif" alt="经由其它国家出境时" /></p>
							<div class="hbox01">
								<p class="txt-tipping">不可购买液体类和凝胶类。(经由的国家可能会没收或报废) </p>
								<p class="txt-tipping">但可以携带航空旅行中需要服用的少量药品（建议携带处方），并带有幼儿时可以携带幼儿食品。</p>
							</div>
							<p class="mtitle"><img src="/images/shop/cn/customer/stitle_limit04.gif" alt="携带个人物品进入机舱的条件" /></p>
							<div class="hbox01">
								<p class="txt-tipping">内容物容量限度: 每个容器100ml 以下，总量为1升以内。</p>
								<p class="txt-tipping">装入1升规格的加封透明袋(Zipper Lock) 里保管。</p>
								<p class="txt-tipping">加封透明袋的规格为(约 20cm×20cm)，且应封闭。</p>
								<p class="txt-tipping">加封透明袋未封闭时，禁止携带进入机舱。</p>
								<p class="txt-tipping">每位乘客只允许携带1L以下的加封透明袋1个。</p>
								<p class="txt-tipping">加封透明袋由顾客直接准备或在机场内便利店及商店购买。</p>
								<p class="txt-tipping">带有幼儿时，对幼儿所需的食物和液体类、凝胶类类药品，若事先告知安检人员，则可以不受容量限制携带进入机舱。</p>
								<p class="txt-tipping">安检台用X-ray 进行安检。</p>
							</div>
							<p class="mtitle"><img src="/images/shop/cn/customer/stitle_limit05.gif" alt="前往澳洲、美国领土及搭乘美国航班时" /></p>
							<span class="font-red">购买商品后，请访问机场取货处先在交换券签名，之后在登机口领取商品。</span>
							<div class="hbox01">
								<p class="stitle">适用对象</p>
								<div class="object">
									<p class="txt-tipping">前往澳大利亚、美国领土(不仅包括美国本土，而且还包括关岛、塞班岛、火奴鲁鲁、维京群岛等)时(仅限直飞航班)</p>
									<p class="txt-tipping">但乘坐直飞航班前往美国亚特兰大时，不得购买液体物品。</p>
									<p class="txt-tipping">搭乘美国西北航空公司(NW)、美国联合航空公司（UA)的航班前往美国以外的国家（日本等）时（仅限于直达航班）</p>
								</div>
								<p class="stitle">注意事项</p>
								<p class="txt-tipping">请准确输入航班号、出国时间，并在其它信息输入栏里填写目的地。</p>
								<p class="txt-tipping">仅限仁川机场出境游客购买，而金海、济州机场出境游客，符合上述规定时，不得购买(但乘坐NW航班由金海   机场前往日本时不受限制)</p>
								<p class="txt-tipping">经由其它国家时，不可购买液体类、凝胶类商品。（搭乘UA航班前往日本的游客可以购</p>
								<p class="txt-tipping">如在可订购时间以后购买，则不能领取商品。</p>
								<p class="order">- 当天17时以前出境 : <span>截止至前一天20时为止订购</span></p>
								<!-- 삭제?
								<p class="order">- 当天17时以后出境 : <span>截止至当天10时为止订购</span></p>
								<p class="order">- 当天19时以后出境 : <span>截止至当天12时为止订购</span></p>
								<p class="order">- 当天21时以后出国 : <span>截止至当天14时为止订购</span></p>-->
							</div>
							<div class="object-box">
								<p class="txt-tipping">回国时，上述商品应在搭乘飞机前托运。</p>
								<p class="txt-tipping">安检可能需要很长的时间，因此建议出国前3小时到达机场。</p>
								<p class="txt-tipping">更加详细的内容请咨询所利用的航空公司。</p>
								<p class="txt-tipping">利用相应国家的国内航班时，上述商品会根据航空公司的情况而有所变动，因此请顾客事先向航空公司确认能否购买相应商品之后，再进行订购。</p>
							</div> 
						</div>
						<!-- //tip-con -->
					</div>					
					<!-- //payment-conbox --> 
			 
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