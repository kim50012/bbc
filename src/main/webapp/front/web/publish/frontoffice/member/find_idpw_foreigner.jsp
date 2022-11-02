<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/member/h1_fine_id_pw.gif" alt="找回用户名/密码 " /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="join-container">
			<table summary="아이디/비밀번호 찾는 표" class="join-board">
				<caption>아이디/비밀번호 찾는 표</caption>
				<colgroup>
					<col width="118px" />
					<col width="317px" />
				</colgroup>
				<tbody>
					<tr>
						<tr class="find-box">
							<td colspan="2">
								<p><input type="radio" id="id" name="find" /><label for="id">找回用户名</label>
								<input type="radio" id="pw" name="find" /><label for="pw">找回密码</label></p>
							</td>
						</tr>
					</tr>
					<tr>
						<th scope="row"><img src="/images/shop/cn/member/find_name.gif" alt="姓名" /></th>
						<td>
							<span><input type="text"/><input type="text" class="first-name"/></span>
						</td>
					</tr>
					<!-- 비밀번호 찾기 선택 시 노출 -->
					<tr>
						<th scope="row"><img src="/images/shop/cn/member/find_name02.gif" alt="用户名" /></th>
						<td>
							<span class="find-text"><input type="text"/></span>
						</td>
					</tr>
					<!-- /end 비밀번호 찾기 선택 시 노출 -->
					<tr>
						<th scope="row"><img src="/images/shop/cn/member/find_mail.gif" alt="E-MAIL" /></th>
						<td>
							<span class="find-text"><input type="text"/></span>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-set">
				<input type="image" src="/images/shop/cn/member/btn_find_id.gif" alt="找回用户名" />
			</div><!-- end btn-close -->
		</div><!-- end join-container -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>