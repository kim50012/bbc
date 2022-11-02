<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/main_popup.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
jQuery(function($){
	
			/*** select box ***/
			$("#day").selectbox();
			
});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="//image.ssgdfs.com/images/shop/common/popup/h1_limitcheck.gif" alt="구매한도조회" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="order-timepop">
			<p class="day">
				<span>출국일</span>
				<select id="day">
					<option>2013-05-31</option>
					<option>2013-05-30</option>
				</select>
			</p>
			<table summary="구매한도 조회 테이블">
				<caption>구매한도 조회 테이블</caption>
				<colgroup>
					<col width="100px" />
					<col width="334px" />
				</colgroup>
				<tbody>
					<tr>
						<th><span><img src="//image.ssgdfs.com/images/shop/common/popup/limitcheck_txt01.gif" alt="총 구매한도" /></span></th>
						<td><p>$3,000.000</p></td>
					</tr>
					<tr>
						<th><span><img src="//image.ssgdfs.com/images/shop/common/popup/limitcheck_txt02.gif" alt="기 구매금액" /></span></th>
						<td><p>구매하신 내역이 없습니다.</p></td>
					</tr>
					<tr>
						<th><span><img src="//image.ssgdfs.com/images/shop/common/popup/limitcheck_txt03.gif" alt="구매가능금액" /></span></th>
						<td><p class="possible-p">$3,000.000</p></td>
					</tr>
				</tbody>
			</table>
			<p class="btn">
				<a href="#"><img src="//image.ssgdfs.com/images/shop/common/popup/btn_close.gif" alt="닫기" /></a> 
			</p>
			<!-- 0810 ul class="check-tip" 추가 -->
			<ul class="check-tip">
				<li>입국 시 구매한도는 $400입니다.</li>
				<li>내국인의 경우 개인당 총 구매 한도는 $3,000입니다. <span>(크루즈 여행객일 경우 구매한도는 $400입니다.)</span></li>
				<li>조회된 구매금액은 국내 브랜드를 제외한 금액입니다.<span>(국내 브랜드 상품은 면세한도가 적용되지 않습니다.)</span></li>
				<li>타 면세점 구매금액은 포함되지 않습니다.</li>
			</ul>
		</div><!-- end order-timepop -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>