<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" /> 
<title>SHINSEGAE 마이페이지</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/member.css" rel="stylesheet" type="text/css" />
<link href="/css/order.css" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_mypage.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
			<div class="mypage"> 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_mypage.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  
					<div class="page-sublocation">  
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的信息</a><span>&gt;</span><strong>更改密码</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
			  
					<div class="memberinfo-container">
						<h3 class="pw-tit"><img src="/images/shop/cn/mypage/title_password.gif" alt="更改密码" /><span><img src="/images/shop/cn/mypage/title_password_sub02.gif" alt="为了保护个人信息，请定期更改密码，并注意密码被他人泄露。" /></span></h3>
						
						<div class="accreditation-box">
							<div class="order-board">
								<table summary="해당사항이 있는 고객님만 부가 정보를 입력하는 표">
									<caption>해당사항이 있는 고객의 부가 정보 입력</caption>
									<colgroup>
										<col width="150px" />
										<col width="630px" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><span><label for="now-pw">原有密码</label></span></th>
											<td><input type="text" id="now-pw"/>  
											</td>
										</tr>
										<tr>
											<th scope="row"><span><label for="new-pw">新密码</label></span></th>
											<td><input type="password" id="new-pw"/>
												<p class="txtinfo"><span class="txt01">* 只能使用5~15字的英文和数字组合。</span></p> 
											</td>
										</tr>
										<tr>
											<th scope="row"><span><label for="new-pw-ok">确认新密码</label></span></th>
											<td><input type="password" id="new-pw-ok"/>
												<p class="txtinfo"><span class="txt01">* 请再次输入密码。</span></p> 
											</td>
										</tr>
									</tbody>
								</table>
							</div><!-- end order-board -->
						</div>
						<!-- //accreditation-box -->
						<div class="btn-set">
							<a href="#"><img src="/images/shop/cn/mypage/btn_cancel_la.gif" alt="取消" /></a>
							<input type="image" src="/images/shop/cn/mypage/btn_change_pw.gif" alt="更改密码" /> 
						</div>	
					</div>
					<!-- end memberinfo-container --> 
				
					
				</div><!-- //contents -->  
			</div><!-- //mypage -->	 
			
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>