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
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><a href="#">购物指南</a><span>&gt;</span><strong>解决网上购物问题</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					
					<div class="h3-tab">					 
						<h3><img src="/images/shop/cn/customer/title_Internet.gif" alt="解决网上购物问题" /></h3>						
						<div class="tab-atype">
							<ul class="tab-menu tab-text">
								<li class="selected"><a href="#">允许弹出窗口</a></li>
								<li><a href="#">更改Internet选项</a></li> 
								<li><a href="#">手动安装付款程序</a></li> 
							</ul>
						</div>
					</div>
					
					<div class="Internet-conbox">
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_Internet02.gif" alt="允许弹出窗口" /></p> 
						<p class="stitle-txt">
							<span>在Windows XP或Google门户网站提供的工具栏中被设定为“阻止弹出窗口”时，可能会遇到付款窗口无法正常显示的情况。</span><br />
							<span>为了能使付款窗口正常弹出，下面给您说明允许弹出窗口的方法。</span>
						</p>						
						<div class="conbox01">
							<p class="txt-tit">1. 在Explorer> 工具> 弹出窗口阻止程序 > 选择“总是允许来自此站点的弹出窗口”。</p>
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet02_1.gif" alt="화면설명" /></p>
							<p class="txt-tit">2. 在要允许的网站地址（W）栏里输入“http://www.ssgdfs.com”后，点击右边的“添加”按钮。<br />
    							确认您输入的地址被添加到允许的站点（S）目录以后，点击“关闭”按钮。</p>						
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet02_2.gif" alt="화면설명" /></p>
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