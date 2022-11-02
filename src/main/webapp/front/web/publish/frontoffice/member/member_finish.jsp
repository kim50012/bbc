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
					<!-- [D] 엔터, 스페이스바 등 여백없이 붙여주세요 -->
					<a href="#">主页</a><span>&gt;</span><a href="#">会员</a><span>&gt;</span><a href="#">注册会员</a><span>&gt;</span><strong>注册完毕</strong>
				</div>
				<div class="join-welcomebox">
					<div class="stepbox">
						<p class="step01"><img src="/images/shop/cn/member/step01.gif" alt="step01 选择韩国人/外国人" /></p>
						<p class="step02"><img src="/images/shop/cn/member/step02.gif" alt="step02 同意条款及确认注册与否" /></p>
						<p class="step03"><img src="/images/shop/cn/member/step03.gif" alt="step03 填写会员注册申请书" /></p>
						<p class="step04 last-child"><img src="/images/shop/cn/member/step04_on.gif" alt="step04 注册完毕" /></p>
					</div>
					<div class="finish-box">
						<!-- 0828 아래 alt값 수정 -->
						<p><img src="/images/shop/cn/member/finish_tit.gif" alt="恭喜您!您已成为新世界网上免税店会员。" /></p>
						<p class="finish-txt"><img src="/images/shop/cn/member/finish_txt.gif" alt="我们将努力为您提供更加优质的服务，望您的生活充满感动与幸福。
祝您购物愉快" /></p>
						<p class="finish-login"><input type="image" src="/images/shop/cn/member/btn_overlap01.gif" alt="登陆" /><a href="#"><img src="/images/shop/cn/member/btn_overlap02.gif" alt="返回首页" /></a></p>
					</div>
					<div class="join-banner-box">
						<p class="banner1"><img src="/images/shop/cn/member/banne_main_special01.gif" alt="赶快注册会员，领取积分吧!现在注册会员，立即赠送积分! 为活动期间注册会员的所有顾客，赠送5,000韩元积分。" /></p>
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