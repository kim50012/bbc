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
<script type="text/javascript">
jQuery(function($){
	$(".coupon-progress").hide();
	$("#coupon01").show();
	$(".tab-menu ul li a").click(function(){
		$(".coupon-progress").hide();
		$(".tab-menu ul li").removeClass("selected");
		$(this).parent().addClass("selected");
		$($(this).attr("href")).show();
		return false;
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/order/h1_shin_point.gif" alt="查看新世界积分" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="order">
			<p class="notice-text">请输入欲查看积分的卡号及密码。</p>
			<div class="point">
				<form action="#">
					<table summary="모인트 조회 카드번화 비밀번호 일력">
						<caption>포인트조회 서식</caption>
						<colgroup>
							<col width="81px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">卡号</th>
								<td>
									<input type="password" title="첫번째자리 입력" /> -
									<input type="password" title="두번째자리 입력" /> -
									<input type="password" title="세번째자리 입력"/> -
									<input type="password" title="네번째자리 입력" />
								</td>
							</tr>
							<tr>
								<th scope="row">输入密码</th>
								<td>
									<input type="text" id="pass" />
							
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div><!-- end point -->
			<div class="notice-section">
				<ul>
					<li>新世界积分仅在会员购买时累积及使用。</li>
					<li>新世界积分从1P开始可以使用。</li>
					<li>若丢失积分密码，可通过访问网页  www.shinsegae.com
							后，在我的新世界     我的新世界积分     注册/更改
							积分卡使用密码菜单中进行修改。
					</li>
				</ul>
			</div><!-- end point-notice -->
			<div class="btn-close">
				<a href="#" onclick="self.close();"><img src="/images/shop/cn/order/btn_close_cn.gif" alt="关闭" /></a>
				<a href="#"><img src="/images/shop/cn/order/btn_order_b02.gif" alt="查看新世界积分" /></a>
			</div><!-- end btn-close -->
		</div><!-- end order -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>



