<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
				<div class="total-price basket-box">
				<ul>
					<li class="total-product">
						<dl class="head-cell">
							<dt><img src="/images/shop/cn/order/dt_total.gif" alt="商品合计金额" /></dt>
							<dd>
								<span>$ 4,498</span>
								<span class="ch-jp">(约 ￥1,4580.80)</span>
								<img src="//image.ssgdfs.com/images/shop/order/minus.gif" alt="-" class="minus" />
							</dd>
						</dl>
						<dl class="pattern">
							<dt>全部商品种类</dt>
							<dd>2种</dd>
							<dt>全部商品数量</dt>
							<dd>4个</dd>
						</dl>
					</li>
					<li class="discount-price">
						<dl class="head-cell">
							<dt><img src="/images/shop/cn/order/dt_dis.gif" alt="网上会员价" /></dt>
							<dd>
								<span>$ 467</span>
								<span class="ch-jp">(约 ￥1499.80)</span>
								<img src="//image.ssgdfs.com/images/shop/order/equal.gif" alt="=" class="equal" />
							</dd>
						</dl>
						<dl class="pattern">
							<dt>网上会员折扣</dt>
							<dd>$ 33.60</dd>
							<dt>促销折扣</dt>
							<dd>$ 433</dd>
						</dl>
					</li>
					<li class="total-sum">
						<dl class="head-cell">
							<dt><img src="/images/shop/cn/order/dt_sum.gif" alt="预付总金额" /></dt>
							<dd>
								<span class="discount">$ 4,031 </span>
								<span class="ch-jp">(约 ￥1499.80)</span>
							</dd>
						</dl>
						<dl class="pattern pattern-type01">
							<dt>积分</dt>
							<dd>￦1.68 (约 $1.2)</dd>
						</dl>
					</li>
				</ul>
				<p class="total-order">
					* 实际付款金额将根据订单内顾客可使用的优惠券、积分等有所不同。
				</p>
			</div><!-- end total-price -->
			<div class="order-btn">
				<a href="#"><img src="/images/shop/cn/order/btn_order.gif" alt="继续购物" /></a>
				<a href="#"><img src="/images/shop/cn/order/btn_go_on.gif" alt="填写订单" /></a>
			</div><!-- end order-btn -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>


		