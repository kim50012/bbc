<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/order/h1_passport_num.gif" alt="确认护照号码" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="order">
			<ul class="notice-text pass-notice">
				<li>您注册的护照号码与填写订单时输入的护照号码不同。</li>
				<li>若订单的护照信息与出境时护照信息不一致，则无法领取商品。</li>
				<li>
					点击付款按钮，输入在订单上的变更护照号码将自动更新到会员信息。
				</li>
			</ul>
			<div class="passport">
				<table summary="여권정보를 공지하는 표">
					<caption>여권 정보</caption>
					<colgroup>
						<col width="101px" />
						<col width="168px" />
						<col width="165px" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col" class="first-child">区分</th>
							<th scope="col">已有</th>
							<th scope="col">更改</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">护照号码</th>
							<td>M1234567</td>
							<td><span>M2143257</span></td>
						</tr>
						<tr>
							<th scope="row">护照有效期</th>
							<td>2013.05.14</td>
							<td><span>2013.00.00</span></td>
						</tr>
					</tbody>
				</table>
				<p>您用变更后的护照信息付款吗？<br/>
				(会员信息中的护照信息将会一同变更。）</p>
			</div><!-- end passport -->
			<div class="btn-set">
			<!-- 버튼 두 개 위치 변경 -->
				<a href="#"><img src="/images/shop/cn/order/btn_close02_cn.gif" alt=" 取消" /></a>
				<input type="image" src="/images/shop/cn/order/btn_buy_cn.gif" alt="注册" />
			</div><!-- end btn-close -->
		</div><!-- end order -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>