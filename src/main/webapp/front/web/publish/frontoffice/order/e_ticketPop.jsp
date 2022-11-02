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
		<h1><img src="//image.ssgdfs.com/images/shop/order/titl_pop_eticket.gif" alt="e티켓 등록" /></h1>
		<p class="close"><span onclick="self.close();"><img src="//image.ssgdfs.com/images/shop/order/btn_close_pop.gif" alt="닫기" /></span></p>
	</div><!-- end head -->
	<div id="body">
		<div class="e-ticket-container">
			<span class="copy-txt">e-티켓은 e-mail 과 FAX로도 발송 가능합니다.</span>
			<span class="copy-txt">FAX : 0000-0000 , e-mail : OOOO@xxxxx.xxx</span>
			<span class="copy-txt">JPG, GIF, PDF 만 등록 가능합니다.</span>
			<table summary="적용한 가능한 쿠폰(e-티켓) 입력 표" class="join-board">
				<caption>e-티켓 등록</caption>
				<colgroup>
					<col width="97px" />
					<col width="459px" />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><img src="//image.ssgdfs.com/images/shop/order/add_file.gif" alt="첨부파일" /></th>
						<td class="find-file">
							
							<div class="file-wrap">
								<input type="text" id="file_route" class="file-text" readonly="readonly" title="적용가능 쿠폰 찾아보기" />										
								<span class="file-box">
									<input type="file" class="file-add" onchange="javascript:document.getElementById('file_route').value=this.value" title="첨부할 이미지를 선택해주세요" />
								</span> 
							</div>
							<!--<input type="text" title="적용가능 쿠폰 찾아보기" /><input type="file" onchange="javascript:document.getElementById('file_route').value=this.value" title="첨부할 이미지를 선택해주세요" />
							<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_find.gif" alt="찾아보기" /></a>-->
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-set">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_confirm.gif"alt="확인" /></a>
				<a href="#"><img src="//image.ssgdfs.com/images/shop/order/btn_soupon_reset.gif" alt="취소" /></a>
			</div><!-- end btn-set -->
		</div><!-- end e-ticket-container -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>



