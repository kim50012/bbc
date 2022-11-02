<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title id="js-meta-title">Time out</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ page import="com.waremec.framework.utilities.*"%>

<!-- ▲ Common config -->
 <script type="text/javascript">
	function isWechat() {
		var ua = navigator.userAgent.toLowerCase();
		var isWeixin = ua.indexOf('micromessenger') != -1;
		if (isWeixin) {
			return true;
		}else{
			return false;      
		}
	}
	
	function gotoUrl(url) {
		if (isWechat()) {
			window.location.href=url;
		}
		else {
			window.location.href='/front/bbc/mbr/bbcLogin.htm?strPtourl=${goUrl}';
		}
	}
 	
 </script>
 </head>

 <body style="background-color: #f5f5f5;">
 
 <!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		
		<div class="paymentArea">
			<h3>TIME OUT ERROR</h3>
			<h2>재 로그인 하세요<br>[请重新登录]</h2>
		</div>
		<ul class="paymentInfo">
			<li>
				 SYSTEM ERROR
			</li>
			<li>
				Warning No : <span>1001</span>
			</li>
			<li style="line-height: 30px;height: 100px;">
				Description : <span>로그인 시간이 초과 되었습니다.<br>다시 로그인 해주세요.<br>[您的登录已超时, 请点登录.]</span>
			</li>
		</ul>	
		
		<div>
			<div class="btnWarp">
				<a class="btn1 theme1" onclick="gotoUrl('https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3D${goUrl}&response_type=code&scope=snsapi_base&state=n#wechat_redirect');">로그인 [登录]</a>
			</div>
		</div>
		</section>
	</div>	
 
 </body>  	 
</body>
</html>
