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
			$("#place").selectbox();
			$("#hour").selectbox();
			$("#minute").selectbox();
			
});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/common/popup/h1_ordertime.gif" alt="查询可订购时间" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="order-timepop">
			<p class="txt-tipping">请输入您的出境地点/日期/时间。</p>
			<table summary="请输入您的出境地点/日期/时间。">
				<caption>请输入您的出境地点/日期/时间。</caption>
				<colgroup>
					<col width="80px" />
					<col width="354px" />
				</colgroup>
				<tbody>
					<tr>
						<th><span><img src="/images/shop/cn/common/popup/time_txt01.gif" alt="出境地点" /></span></th>
						<td class="place">
							<p>
								<select id="place">
									<option>出境地点</option>
									<option>인천국제공항</option>
									<option>김포국제공항</option>
								</select>
							</p>
						</td>
					</tr>
					<tr>
						<th><span><img src="/images/shop/cn/common/popup/time_txt02.gif" alt="出境日期" /></span></th>
						<td><p><input type="text" /><a href="#"><img src="//image.ssgdfs.com/images/shop/common/datepicker.gif" alt="달력" /></a></p></td>
					</tr>
					<tr>
						<th><span><img src="/images/shop/cn/popup/time_txt03.gif" alt="出境时间" /></span></th>
						<td class="time">
							<p>
								<select id="hour">
									<option>24时</option>
									<option>23时</option>
									<option>22时</option>
									<option>21时</option>
									<option>20时</option>
									<option>19时</option>
									<option>18时</option>
									<option>17时</option>
								</select>
							</p>
							<p>
								<select id="minute">
									<option>00分</option>
									<option>59分</option>
									<option>58分</option>
									<option>57分</option>
									<option>56分</option>
									<option>55分</option>
									<option>54分</option>
									<option>53分</option>
									<option>52分</option>
									<option>51分</option>
								</select>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="btn">
				<a href="#"><img src="/images/shop/cn/common/popup/btn_cancel.gif" alt="取消" /></a> 
				<a href="#"><img src="/images/shop/cn/common/popup/btn_check.gif" alt="查询" /></a> 
			</p>
		</div><!-- end order-timepop -->
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>