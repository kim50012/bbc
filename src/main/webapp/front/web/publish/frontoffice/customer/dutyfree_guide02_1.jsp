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
								<li class="no01"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno01_on.gif" alt="01 注册新世界网上免税店会员" /></a></li>
								<li class="no02"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno02.gif" alt="02 订购" /></a></li>
								<li class="no03"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno03.gif" alt="03 付款" /></a></li>
								<li class="no04"><a href="#"><img src="/images/shop/cn/customer/img_shoppingno04.gif" alt="04 取货" /></a></li>
							</ul>							 
						</div>
						
						<div class="con-guidebox">
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree01_1.gif" alt="01" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree01.gif" alt="01" /></p>
								<p class="info">请仔细阅读使用条款与隐私政策以后，选择“同意”。<br />
									输入姓名与E-mail 之后，请点击“重复确认”按钮。<br />
									选择新世界网上免税店注册与否之后，<br />
									将移至会员注册申请书页面。
								</p>
							</div> 
							<div class="conox">
								<p><img src="/images/shop/cn/customer/img_dutyfree01_2.gif" alt="02" /></p>
								<p><img src="/images/shop/cn/customer/no_dutyfree02.gif" alt="02" /></p>
								<p class="info">网上会员必需信息需要全部输入。<br />
									您将在新世界网上免税店使用的用户名可通过点击“重复确认”<br />
									按钮检查用户名是否重复。<br /><br />
									如果您输入了所有必填项，就请点击申请注册按钮来完成注册。
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