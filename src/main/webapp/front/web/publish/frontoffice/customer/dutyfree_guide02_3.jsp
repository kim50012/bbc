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
								<li class="no03"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno03_on.gif" alt="03 付款" /></a></li>
								<li class="no04"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno04.gif" alt="04 取货" /></a></li>
							</ul>							 
						</div>
						
						<div class="con-guidebox">
							<div class="conox">
								<p class="payment-guide"><img src="/images/shop/cn/customer/img_dutyfree03_1.gif" alt="01" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree01.gif" alt="01" /></p>
								<p class="info">请在信用卡、转账 , 银联卡中选择付款方式之后选定“同意购买”，
									再点击付款按钮。<br /><br />
									*如果没有安装付款组件，将会自动安装组件。
								</p>
							</div>
							
							<div class="conox">
								<p class="payment-guide"><img src="/images/shop/cn/customer/img_dutyfree03_2.gif" alt="02" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree02.gif" alt="02" /></p>
								<p class="info">信用卡转账付款: 请同意使用条款之后，点击下一步按钮。</p>
							</div>
							
							<div class="conox">
								<p class="payment-guide"><img src="/images/shop/cn/customer/img_dutyfree03_3.gif" alt="03" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree03.gif" alt="03" /></p>
								<p class="info">银联卡付款: 请在银联卡弹出窗口中选择第二个选项卡，在网银支付画面输入银行卡号以后，点击“到网上银行支付”。
									<!-- 은련카드 관련 결제내용 들어가야 함 -->
								</p>
							</div>
							
							<div class="conox">
								<p class="payment-guide"><img src="/images/shop/cn/customer/img_dutyfree03_4.gif" alt="04" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree04.gif" alt="04" /></p>
								<p class="info">点击订单号码旁边的“打印订单”按钮，<br />
									将订单打印以后，在取货时出示给取货处即可。<br /><br />
									若无法打印订单，则将订单号码记录以后，<br />
									与护照、登机牌一同出示便可领取商品。
								</p>
							</div> 
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