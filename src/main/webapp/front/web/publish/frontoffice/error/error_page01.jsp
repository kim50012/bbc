<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/error.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script> 
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
		 
			<div class="error-box">
				<div class="error">
					<p><img src="/images/shop/cn/error/error_01.gif" alt="很抱歉给您的使用带来不便。" /></p>
					<p class="txt">很抱歉给您的使用带来不便。</p>
			
					<p class="txt">您要访问的页面因遇到意外错误而无法正常连接。很抱歉给您的使用带来了不便。
									如果同样的错误反复出现，请咨询[客服中心]，，我们会尽快帮您解决问题。谢谢。
					</p>
				</div>
				<p class="btn">
					<img src="/images/shop/cn/error/btn_customer.gif" alt="客服中心业务时间 09:30-18:30 1577-0161" />
					<a href="#"><img src="/images/shop/cn/error/btn_customer02.gif" alt="网上咨询 1:1 咨询" /></a>
				</p>
			</div>
			 
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>