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
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 
	 
	 
}); 
//]]>
</script> 
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
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><a href="#">会员指南</a><span>&gt;</span><strong>积分介绍</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					
					<h3><img src="/images/shop/cn/customer/title_savedmoney.gif" alt="积分介绍" /></h3>
					
					<div class="member-conbox">
						<div class="vbox vbox02">
							<dl>
								<dt><img src="/images/shop/cn/customer/stitle_savedmoney01.gif" alt="积分?" /></dt>
								<dd><img src="/images/shop/cn/customer/stitle_savedmoney01_txt.gif" alt="在新世界免税店购买商品时可以当现金使用，但不能兑换现金。" /></dd>
							</dl>
						</div>
						<ul class="savebox">
							<li><a href="#"><img src="/images/shop/cn/customer/stitle_savedmoney01_1.gif" alt="01 购买商品时累积 在新世界免税店购买商品时，按会员等级和品牌累积积分。" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/customer/stitle_savedmoney01_2.gif" alt="02 网上活动累积 参与新世界免税店的积分赠送活动，可以累积积分。" /></a></li>
							<li><a href="#"><img src="/images/shop/cn/customer/stitle_savedmoney01_3.gif" alt="03 购买商品时使用 累积积分可在购买商品时当现金使用。" /></a></li>
						</ul>
					 
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_savedmoney02.gif" alt="累积资格" /></p> 
						<div class="tipping-box">
							<p class="txt-tipping">积分是为新世界免税店会员制定的积分制度。 </p> 	  
						</div>
						 
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_savedmoney02_2.gif" alt="累积方法" /></p> 
						<div class="tipping-box">
							<p class="txt-tipping">积分可通过在新世界免税店购物，注册会员、参与活动等方式累积。</p> 							 	 
						</div>
						 
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_savedmoney03.gif" alt="累积时间 / 消失时间" /></p> 
						<div class="tipping-box">
							<p class="txt-tipping">根据具体活动存在差异。按购买商品发放的积分根据保税运送细则，于保税运送完毕后累积。</p> 							
							<p class="txt-tipping">新注册会员积分: 新注册会员积分只发放一次，在相应活动页面点击“下载积分”便可发放</p> 							
							<p class="txt-tipping">积分有效期为从发放日起2年。 (其它活动积分要根据相应内容确定累计时间。)</p> 	 
						</div>
						 
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_savedmoney04.gif" alt="积分使用" /></p>  
						<div class="tipping-box">
							<p class="txt-tipping">会员可在填写订单时使用拥有积分。 </p> 							
							<p class="txt-tipping">最多可使用的积分为适用会员折扣及优惠券之后总金额的30%。</p> 	 
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