<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div id="contents">
				<div class="page-sublocation join-location">
					<a href="#">主页</a><span>&gt;</span><a href="#">会员</a><span>&gt;</span><a href="#">注册会员</a><span>&gt;</span><strong>同意条款及本人认证</strong>
				</div>
				<div class="join-welcomebox">
					<div class="stepbox">
						<p class="step01"><img src="/images/shop/cn/member/step01.gif" alt="step01 选择韩国人/外国人" /></p>
						<p class="step02"><img src="/images/shop/cn/member/step02_on.gif" alt="step02 同意条款及确认注册与否" /></p>
						<p class="step03"><img src="/images/shop/cn/member/step03.gif" alt="step03 填写会员注册申请书" /></p>
						<p class="step04 last-child"><img src="/images/shop/cn/member/step04.gif" alt="step04 注册完毕" /></p>
					</div>
					<div class="overlap-box">
						<p class="over-tit"><img src="/images/shop/cn/member/overlap_tit.gif" alt="。已存在注册信息" /></p>
						<p class="over-id">注册用户名 : <span class="">Bigp***</span></p>
						<p class="over-login"><input type="image" src="/images/shop/cn/member/btn_overlap01.gif" alt="登陆" /><a href="#"><img src="/images/shop/cn/member/btn_overlap02.gif" alt="返回首页" /></a></p>
					</div>
					<div class="customer-box">
						<p class="customer-center"><img src="/images/shop/cn/member/cumstomer_tel.gif" alt="客服热线 : 1577- 0161" /></p>
						<p class="customer-txt01">如果您忘了密码请点击 <a href="#">“查找密码”</a>，我们会为您查找密码。</p>
					</div>
				</div><!-- end join-welcomebox -->
			</div><!-- end contents -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>