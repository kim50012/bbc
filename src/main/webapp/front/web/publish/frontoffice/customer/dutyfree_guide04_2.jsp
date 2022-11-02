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
								<li class="selected"><a href="#">更改Internet选项</a></li> 
								<li><a href="#">手动安装付款程序</a></li> 
							</ul>
						</div>
					</div>
					
					<div class="Internet-conbox">
						<div class="conbox01">
							<p class="stitle"><img src="/images/shop/cn/customer/stitle_Internet03_1.gif" alt="更改Internet选项" /></p>														 
							<p class="stitle-txt">
								<span>根据网页浏览器的安全选项，可能会出现付款程序无法正常运行的情况。</span>
								<span>为了使用付款服务，下面介绍删除Cookie、设置选项等方法。</span>
							</p>
							<p class="r-txt-tit">1. 确认Internet选项的方法：选择Explorer &gt; 工具 &gt; Internet选项。</p>
							<p class="stitle-txt">
								<span class="top-ti">选择常规标签</span>
								<span class="stxt">点击“删除Cookie（I）”、“删除文件（F）”，以删除Internet临时文件。</span>
							</p>
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_1.gif" alt="화면설명" /></p>							
							<p class="stitle-txt">
								<span>点击“设置（S）”按钮，在出现的设置窗口选定“每次访问网页时”以后，点击“确定”按钮。</span>
							</p>
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_2.gif" alt="화면설명" /></p>
							<p class="stitle-txt">
								<span class="top-ti">设置安全选项卡</span>
								<span class="stxt">如果Internet选项被设定为自定义级别，请点击默认级别按钮将设置更改为普通。 </span>
							</p>
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_3.gif" alt="화면설명" /></p>
							<p class="stitle-txt">
								<span>在受限站点设置页面中点击“站点”按钮时，请确认窗口中有无新世界网上免税店相关的网站，如果有，请将该网站从目录中删除。</span>
							</p>							
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_4.gif" alt="화면설명" /></p>
							<p class="stitle-txt">
								<span class="top-ti">设置隐私选项卡</span>
								<span class="stxt">点击隐私设置页面中央的“高级”按钮后，在出现的窗口中如下设置。</span>
								<span class="stxt">选定“替代自动cookie处理（O）”；在第一方Cookie中选定“接受”；在第三方Cookie中选定“接受”；再选定“总是允许会话Cookie（W）”。</span>
							</p>		
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_5.gif" alt="화면설명" /></p>
							<p class="stitle-txt">
								<span class="top-ti">设置高级选项卡 </span>
								<span class="stxt">点击“高级“标签，在出现的画面中点击“还原高级设置”按钮，将设定内容应用以后点击“应用”按钮以保存信息。</span>
							</p>
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_6.gif" alt="화면설명" /></p>
							<p class="r-txt-tit">2. 确认Internet explore 7.0 用户设定</p>
							<p class="titpping-box">
								<span class="tipping">选择Explore &gt; 工具 &gt; Internet 选项。<br />
								选择安全标签 > 该区域的安全级别显示为“自定义级别”时> 点击自定义级别（C）</span>
							</p>
							<p class="stitle-txt">
								<span class="stxt">如果[其他] >[跨域浏览子框架]为禁用，则在付款时有可能出现问题。<br />
								请必须将其更改为“启用”。</span>
							</p>
							<p class="stitle-txt">
								<span class="stxt">* 如果安全级别显示为普通(点击默认级别) ，则无需更改设定。 </span>
							</p>
							<p class="img-con"><img src="/images/shop/cn/customer/img_Internet03_7.gif" alt="화면설명" /></p>
						</div>
						<!-- 삭제?!
						<div class="center-no">
							<p class="title"><img src="/images/shop/cn/customer/stitle_Internet04_4.gif" alt="&quot;运行安装向导之后仍有问题?&quot;" /></p>
							<p class="txt">
								<span class="no"><img src="/images/shop/cn/customer/customer_center.gif" alt="1577-0161" /></span>
								<span class="txt-box">我们认为该情况应该需要付款服务公司LG Telecom专业咨询员的帮助。</span>
								<span class="txt-box">拨打1544-7772，您可以受到LG Telecom公司咨询员的远程服务。</span>
								<span class="txt-box">远程服务提供时间为平日09:00~18:00。</span>
							</p>
						</div> 		-->	
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