<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title> 
<link href="/css/mypage_popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript">
jQuery(function($){
		$("div.layor-l").hide();
		$("div a").mouseover(function(){
			$(this).next().show();
			//$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
		});

		$("div a").mouseleave(function(){
			$(this).next().hide();
			//$(this).find("img").attr("src" ,$(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
			return false;
	});
});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/mypage/popup/h1_orderstate.gif" alt="订购状态说明" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox">
				<div class="orderstate-box">
					<div class="stateinfo01">
						<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo01_off.gif" alt="接受订购" /></a>
						<div class="layor-l">
							<div class="layor-r">
								<div class="layor-c">
									<div class="layor-box">
										已完成商品订购/付款。
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="stateinfo-box">
						<ul class="standby">
							<li class="stateinfo02">
								<span><img src="/images/shop/cn/mypage/popup/ico_next.gif" alt="next" /></span>
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo02_off.gif" alt="等待订购" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												接受订购后等待注册电子机票。已注册电子机票的顾客正在等待管理员的认可。
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<ul>
							<li class="stateinfo03">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo03_off.gif" alt="正在处理订购" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												正在准备订购的商品。
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="stateinfo04">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo04_off.gif" alt="等待运送" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												商品准备完毕，正在运往取货处。 
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="stateinfo05 on">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo05_off.gif" alt="正在运送" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												商品已被发送，正在运往取货处。
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="stateinfo06">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo06_off.gif" alt="运送完毕" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												商品已经运送到取货处。 
											</div>
										</div>
									</div>
								</div>	
							</li>
							<li class="stateinfo07">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo07_off.gif" alt="取货成功" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												顾客已领取到所购商品。 
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<ul>
							<li class="stateinfo08">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo08_off.gif" alt="接受取消" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												取消订购已被接受。
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="stateinfo09">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo09_off.gif" alt="正在处理取消" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												正在取消订单。
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="stateinfo10">
								<a href="#"><img src="/images/shop/cn/mypage/popup/order_stateinfo10_off.gif" alt="取消完毕" /></a>
								<div class="layor-l">
									<div class="layor-r">
										<div class="layor-c">
											<div class="layor-box">
												已完成对订购内容的取消及退款。 
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="btn_wrap">
						<p class="center"><a href="#"><img src="/images/shop/cn/mypage/popup/btn_close.gif" alt="关闭" /></a></p>
					</div>
				</div><!-- end orderchange-pop -->
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>