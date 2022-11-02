<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
				<div class="order-step">
					<div class="step">
						<ul class="progress">
							<li class="first-child"><p><img src="/images/shop/cn/order/step01_on.gif" alt="step01 购物车" /></p></li>
							<li><p><img src="/images/shop/cn/order/step02_off.gif" alt="填写订单" /></p></li>
							<li><p><img src="/images/shop/cn/order/step03_off.gif" alt="付款" /></p></li>
							<li><p><img src="/images/shop/cn/order/step04_off.gif" alt="订购完成" /></p></li>
						</ul>
						<ul class="step-notice">
							<li>加入购物车的商品被保存3日。(购买的商品自动从购物车删除。) </li>
							<li>商品数量可通过点击更改按钮更改。</li>
							<li>加入购物车的商品在库存不足时显示为“不可订购”。</li>
							<li>加入购物车的商品价格和折扣率有可能变动。</li>
						</ul>
					</div><!-- end step -->
					<div class="user-info">
						<p>
							<span><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honour VIP" /></span>
							<span class="user">홍길동님</span>  您好!
						</p>
						<dl>
							<dt>折扣优惠券</dt>
							<dd>7<span>张</span></dd>
							<dt>积分 </dt>
							<dd>￦12,000</dd>
							<dt>出境日期 </dt>
							<dd>YYYY.MM.DD</dd>
						</dl>
					</div><!-- end user-info -->
			</div><!-- end order-step -->
			<!-- step 01 -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="/images/shop/cn/order/step01_off.gif" alt="step01 购物车" /></p></li>
						<li><p><img src="/images/shop/cn/order/step02_on.gif" alt="填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_off.gif" alt="付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_off.gif" alt="订购完成" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>请再次确认您所购买的商品以及数量是否正确。</li>
						<li>若需要修改，则点击目录下方的‘前一页’按钮返回购物车画面。</li>
						<li>订购者信息必须与出境者本人一致。 请务必正确填写护照信息。</li>
						<li class="notice">如出境者信息不一致，将无法在免税品取货处领取商品，因此要准确输入所有信息。</li>
					</ul>
				</div><!-- end step -->
				<div class="user-info">
					<p>
						<span><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honour VIP" /></span>
						<span class="user">홍길동님</span> 您好!
					</p>
					<dl>
						<dt>折扣优惠券</dt>
						<dd>7<span>张</span></dd>
						<dt>积分 </dt>
						<dd>￦12,000</dd>
						<dt>出境日期 </dt>
						<dd>YYYY.MM.DD</dd>
					</dl>
				</div><!-- end user-info -->
			</div><!-- end order-step -->
			<!-- step 02 -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="/images/shop/cn/order/step01_off.gif" alt="step01 购物车" /></p></li>
						<li><p><img src="/images/shop/cn/order/step02_off.gif" alt="填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_on.gif" alt="付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_off.gif" alt="订购完成" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>请再次确认您所购买的商品以及数量是否正确。</li>
						<li>若需要修改，则点击目录下方的‘前一页’按钮返回购物车画面。</li>
						<li>订购者信息必须与出境者本人一致。 请务必正确填写护照信息。</li>
						<li class="notice">如出境者信息不一致，将无法在免税品取货处领取商品，因此要准确输入所有信息。</li>
					</ul>
				</div><!-- end step -->
				<div class="user-info">
					<p>
						<span><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honour VIP" /></span>
						<span class="user">홍길동님</span>  您好!
					</p>
					<dl>
						<dt>折扣优惠券</dt>
						<dd>7<span>张</span></dd>
						<dt>积分 </dt>
						<dd>￦12,000</dd>
						<dt>出境日期 </dt>
						<dd>YYYY.MM.DD</dd>
					</dl>
				</div><!-- end user-info -->
			</div><!-- end order-step -->
			<!-- order-step -->
			<div class="order-step">
				<div class="step">
					<ul class="progress">
						<li class="first-child"><p><img src="/images/shop/cn/order/step01_off.gif" alt="step01 购物车" /></p></li>
						<li><p><img src="/images/shop/cn/order/step02_off.gif" alt="填写订单" /></p></li>
						<li><p><img src="/images/shop/cn/order/step03_off.gif" alt="付款" /></p></li>
						<li><p><img src="/images/shop/cn/order/step04_on.gif" alt="订购完成" /></p></li>
					</ul>
					<ul class="step-notice">
						<li>请再次确认您所购买的商品以及数量是否正确。</li>
						<li>若需要修改，则点击目录下方的‘前一页’按钮返回购物车画面。</li>
						<li>订购者信息必须与出境者本人一致。 请务必正确填写护照信息。</li>
						<li class="notice">如出境者信息不一致，将无法在免税品取货处领取商品，因此要准确输入所有信息。</li>
					</ul>
				</div><!-- end step -->
				<div class="user-info">
					<p>
						<span><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honour VIP" /></span>
						<span class="user">홍길동님</span>  您好!
					</p>
					<dl>
						<dt>折扣优惠券</dt>
						<dd>7<span>张</span></dd>
						<dt>积分 </dt>
						<dd>￦12,000</dd>
						<dt>出境日期 </dt>
						<dd>YYYY.MM.DD</dd>
					</dl>
				</div><!-- end user-info -->
			</div><!-- end order-step -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



