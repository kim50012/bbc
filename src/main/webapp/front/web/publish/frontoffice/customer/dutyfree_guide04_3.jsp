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
								<li><a href="#">允许弹出窗口</a></li>
								<li><a href="#">更改Internet选项</a></li> 
								<li class="selected"><a href="#">手动安装付款程序</a></li> 
							</ul>
						</div>
					</div>
					
					<div class="Internet-conbox">
						<div class="conbox01"> 
							<p class="stitle"><img src="/images/shop/cn/customer/stitle_Internet04_1.gif" alt="手动安装付款程序" /></p>							 
							<p class="stitle-txt">
								<span>如果您使用的计算机在安装电子付款程序过程中有问题，就请点击“电子付款服务安装向导”按钮之后，按照提示安装 </span>
								<span>ActiveX程序便可轻松解决问题。</span>
							</p>
							<p class="stitle"><img src="/images/shop/cn/customer/stitle_Internet04_2.gif" alt="安装电子付款服务安装向导" /></p>							 
							<p class="stitle-txt">
								<span>点击下面的电子付款服务安装向导按钮以后，在Explorer下方的任务栏显示的程序运行提问窗口中点击“运行”。	</span>
								<span>选择“运行”，电子付款服务安装向导将被运行，由此电子付款服务程序将被自动安装。</span>
							</p>
							<div class="btn_wrap">
								<p class="center"><img src="/images/shop/cn/customer/btn_service.gif" alt="电子付款服务安装向导" /></p>
							</div>
							
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet04_1.gif" alt="!" /></p>
							<p class="stit-tip"><img src="/images/shop/cn/customer/stitle_Internet04_3.gif" alt="参考事项" /></p>
							<p class="titpping-box">
								<span class="tipping">使用安装向导功能，可以在用户的计算机上轻松安装电子付款程序。</span>
								<span class="tipping">即使使用安装向导，也不会泄露用户计算机上的任何信息。</span>
							</p>
						</div>
						
						<div class="center-no">
							<p class="title"><img src="/images/shop/cn/customer/stitle_Internet04_4.gif" alt="&quot;运行安装向导之后仍有问题?&quot;" /></p>
							<p class="txt">
								<span class="no"><img src="/images/shop/cn/customer/customer_center.gif" alt="1577-0161" /></span>
								<span class="txt-box">我们认为该情况应该需要付款服务公司LG Telecom专业咨询员的帮助。</span>
								<span class="txt-box">拨打1544-7772，您可以受到LG Telecom公司咨询员的远程服务。</span>
								<span class="txt-box">远程服务提供时间为平日09:00~18:00。</span>
							</p>
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