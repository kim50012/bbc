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
		<h1><img src="/images/shop/cn/mypage/popup/titl_pop_eticket.gif" alt="注册电子机票" /></h1> 
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox"> 
				<div class="e-ticket-container">
					<span class="copy-txt">如出境日期距离订购日有30日以上，则需要注册电子机（船）票。</span> 
					<span class="copy-txt">电子机（船）票注册也可通过E-mail和传真发送。</span> 
					<span class="copy-txt">FAX : 051-749-1266 , e-mail : cs_dfs@chosunhotel.co.kr</span>
					<table summary="적용한 가능한 쿠폰(e-티켓) 입력 표" class="join-board">
						<caption>e-티켓 등록</caption>
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
					<p class="infoadd">文件名只能使用英文和数字，且只能上传, JPG(JPEG), GIF, PDF格式的文件。 </p>
					
					<div class="btn-set">
						<a href="#"><img src="/images/shop/cn/mypage/popup/btn_soupon_reset.gif" alt="取消" /></a>
						<a href="#"><img src="/images/shop/cn/mypage/popup/btn_confirm.gif"alt="注册" /></a>
					</div><!-- end btn-set -->
				</div><!-- end e-ticket-container -->
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>



