<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/ing.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div id="contents">
			
			
			
				<div class="ing-box">
					<p class="title"><img src="/images/shop/cn/ing/title_payment.gif" alt="正在进行付款" /></p>
					<p class="ing-bar"><img src="/images/shop/cn/ing/ing.gif" alt="正在进行付款" /></p>
					<p class="txt"><img src="/images/shop/cn/ing/payment_txt.gif" alt="若刷新本页面或关闭窗口，付款将被中断， 请稍等。" /></p>
					<p class="btn-txt">
						<span>如果付款失败，请从购物车阶段开始重新操作。
							<a href="#"><img src="/images/shop/cn/ing/btn_basket.gif" alt="购物车" /></a>
						</span>
						<span>将订单打印之后，在出境当天取货时出示给商品取货处，便可迅速领取商品。<br/>
						订单可在 我的页面  &gt; 订购明细中打印。
							<a href="#"><img src="/images/shop/cn/ing/btn_mypage.gif" alt="我的页面" /></a>
						</span>
					</p>
				</div>
				
				
			</div><!-- end contents -->
			<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
</div><!-- end wrapper -->
</body>
</html>



