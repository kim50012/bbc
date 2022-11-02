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
		<h1><img src="/images/shop/cn/mypage/popup/h1_eticket_check.gif" alt="查看电子机（船）票" /></h1> 
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox">
				<div class="e-ticket-container">
					<p class="infotitle">如出境日期距离订购日有30日以上，则需要注册电子机（船）票。</p>
					<span class="copy-txt">注册日期 : YYYY.MM.DD TT:MM</span>
					<span class="copy-txt">注册途径 : 网络</span>
					<p class="btn-ticket"><a href="#"><img src="/images/shop/cn/mypage/popup/btn_ticket_down.gif" alt="下载电子机（船）票" /></a></p>
					<p class="et-info"><strong>变更电子机（船）票</strong></p>
					<table summary="적용한 가능한 쿠폰(e-티켓) 조회" class="join-board">
						<caption>e-티켓 조회</caption>
						<colgroup>
							<col width="*" /> 
						</colgroup>
						<tbody>
							<tr> 
								<td class="find-file"> 
									<div class="file-wrap">
										<input type="text" id="file_route" class="file-text" readonly="readonly" title="적용가능 쿠폰 찾아보기" />										
										<span class="file-box">
											<input type="file" class="file-add" onchange="javascript:document.getElementById('file_route').value=this.value" title="浏览…" />
										</span> 
									</div> 
								</td>
							</tr>
						</tbody>
					</table>
					<p class="infoadd">文件名只能使用英文和数字，且只能上传, JPG(JPEG), GIF, PDF格式。</p>
					
					<div class="btn-set">
						<a href="#"><img src="/images/shop/cn/mypage/popup/btn_soupon_reset.gif" alt="取消" /></a>
						<a href="#"><img src="/images/shop/cn/mypage/popup/btn_change.gif"alt="变更" /></a> 
					</div><!-- end btn-set -->
				</div><!-- end e-ticket-container -->
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>



