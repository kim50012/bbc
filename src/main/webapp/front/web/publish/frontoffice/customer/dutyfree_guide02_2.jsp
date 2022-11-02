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
								<li class="no02"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno02_on.gif" alt="02 订购" /></a></li>
								<li class="no03"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno03.gif" alt="03 付款" /></a></li>
								<li class="no04"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno04.gif" alt="04 取货" /></a></li>
							</ul>							 
						</div>
						
						<div class="con-guidebox">
							<div class="conox">
								<p class="wimg"><img src="/images/shop/cn/customer/img_dutyfree02_1.gif" alt="01" /></p>
								<p class="winfo"><img src="/images/shop/cn/customer/no_dutyfree01.gif" alt="01" /> 选择您要订购的商品。有选项的商品请把选项也要选好。点击立即购买按钮，将移至填写订单画面。点击购物车按钮，将移至购物车画面。</p> 
							</div>
							
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree02_2.gif" alt="02" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree02.gif" alt="02" /></p>
								<p class="info">网上会员必需信息需要全部输入。<br />
									您将在新世界网上免税店使用的用户名可通过点击“重复确认”<br />
									按钮检查用户名是否重复。<br />
									如果您输入了所有必填项，就请点击申请注册按钮来完成注册。
								</p>
							</div>
							
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree02_3.gif" alt="03" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree03.gif" alt="03" /></p>
								<p class="info">请输入与护照上的信息一致的顾客信息。<br />
									*只有订购者与出境者信息一致，才能在出境时于取货处取货。
								</p>
							</div>
							
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree02_4.gif" alt="04" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree04.gif" alt="04" /></p>
								<p class="info">请输入与票（机票.船票）上的信息相互一致的信息。<br /><br />
									*根据出发地点、目的地，取货处位置各不相同。<br />
									只有输入与票上的信息相互一致的信息，才能在取货处取货。
								</p>
							</div>
							
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree02_5.gif" alt="05" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree05.gif" alt="05" /></p>
								<p class="info">点击“查看及使用优惠券”按钮，选择可以打折的优惠券。<br />
									通过使用可立即使用积分、拥有积分，能够便宜购买商品。<br />
									*折扣优惠券、可立即使用积分、<br />
									拥有积分只限于新世界网上免税店会员购买商品时使用。
								</p>
							</div>
							
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree02_6.gif" alt="06" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree06.gif" alt="06" /></p>
								<p class="info">点击“确认订单”按钮，将移至付款阶段。	</p>
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