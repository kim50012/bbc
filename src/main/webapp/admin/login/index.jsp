<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0L);

	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title id="js-meta-title">登录</title>

 
<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script>
	// global variables

	// require common config

	function checkLogin() {
		var account = $('#account').val() || '';
		var password = $('#password').val() || '';

		if (account == '') {
			alert('请输入账号！');
			return false;
		}
		if (password == '') {
			alert('请输入密码！');
			return false;
		}

		$('#loginform').submit();
	}
</script>
<!-- ▲ Common config -->
<body>

	<!-- ▼ Main container -->
	<div class="container">
		<div class="content" role="main">
			<div class="app">
				<div class="app-init-container">
					<div>
						<div class="container">
							<div class="header">
								<!--
						<div class="header-side"><a href="http://koudaitong.com/v2/account" target="_blank" class="js-route-transfer">免费注册，零元开店</a></div>
						<a href="http://youzan.com/" class="js-route">
							<div class="header-logo"></div>
						</a>
						<div class="header-title">登录</div>

						-->
							</div>
							<div class="main main-login clearfix">
								<form id="loginform" class="form-horizontal" method="POST"
									action="/admin/login/loginCheck.htm">
									<fieldset>
										<div class="control-group">
											<label class="control-label">手机号码：</label>
											<div class="controls">
												<input tabindex="1" type="text" placeholder="请输入手机号码"
													name="account" id="account" value="">
											</div>
										</div>
										<div class="control-group">
											<label class="control-label">登录密码：</label>
											<div class="controls">
												<input tabindex="2" type="password" placeholder="请输入密码"
													name="password" id="password" value="">
											</div>
										</div>
										<!--
								<div class="control-group">
									<div class="controls">
										<label class="auto-login">
											<input type="checkbox" name="auto_login" tabindex="-1" checked="">
											三天内自动登录
										</label>
										<a class="lost-pw"  href="javascript:void(0)"  tabindex="-1">忘记密码?</a>
									</div>
								</div>
								-->
										<div class="control-group">
											<div class="controls">
												<button tabindex="5" onClick="return checkLogin();"
													; class="btn btn-large btn-primary login-btn"
													data-loading-text="正在登录...">登录</button>
											</div>
										</div>
									</fieldset>
								</form>


							</div>

						</div>
					</div>
				</div>
				<div class="notify-bar js-notify animated hinge hide"></div>
			</div>
		</div>
	</div>
	<!-- ▲ Main container -->


</body>
</html>
