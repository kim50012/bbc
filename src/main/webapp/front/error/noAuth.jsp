<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title id="js-meta-title">System Error</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!-- ▲ Common config -->
 <script type="text/javascript">
 	//alert('你很久未操作，系统已经自动退出\n请重新登录');
 	//window.location.href = '/admin';
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
			window.location.href='/front/bbc/mbr/bbcLogin.htm';
		}
	}
 	
 </script>
 </head>

 <body style="background-color: #f5f5f5;">
 
 <!-- container -->
	<div id="container" class="tp2" style="padding-top:0;">
		<section id="contents">
		
		<div class="paymentArea">
			<h3>没有权限.</h3>
			<h2>请重新登录!</h2>
		</div>
		<ul class="paymentInfo">
			<li>
				 系统提醒.
			</li>
			<li>
				Warning No : <span>1004</span>
			</li>
			<li>
				Description : <span>${errorMessageBbc }</span>
			</li>
			<li style="text-align:center;">
				<img src="/front/bbc/img/qr.jpg">
			</li>
			<li style="line-height: 30px;">
				아직 팔로우하지 않은 회원분께서는 위에 QR 코드를 2~3초 꾸욱 QR Code 스캔하여 팔로우 부탁드립니다. 
			</li>
		</ul>	
				
		<div>
			<div class="btnWarp"> 
				<a class="btn1 theme1" onclick="gotoUrl('https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fclb%252FclbOne.htm%253FshopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect');">LOGIN</a>
			</div>
		</div>
		</section>
	</div>	
 
 </body>  	 
</body>
</html>
