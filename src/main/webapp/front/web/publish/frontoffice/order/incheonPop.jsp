<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
jQuery(function($){

	/* [D] 0812 삭제 $('.incheon-box').jScrollPane({showArrows: true}); */
		
});
</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/order/h1_incheon_info.gif" alt="关于分开运营仁川机场取货处的说明" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox_scroll">
	
				<div class="order incheon-box">
					<ul class="notice-text">
						<li>请确认航空公司与取货处之后，在指定取货处领取商品。</li>
					</ul>
					<div class="incheon">
						<table summary="여권정보를 공지하는 표" class="terminal-board">
							<caption>여권 정보</caption>
							<colgroup>
								<col width="120px" />
								<col width="170px" />
								<col width="180px" />
								<col width="175px" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="first-child">取货处位置</th>
									<th scope="col">A.东边航站楼
										<p>航站楼2号出国审查台楼上 (4楼大韩航空贵宾休息室对面)</p>
									</th>
									<th scope="col">B.西边航站楼
										<p>4楼 韩亚航空贵宾休息室旁边</p>
									</th>
									<th scope="col">登机楼
										<p>登机楼 121号登机口旁边</p>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="first-child">航空公司</td>
									<td>大韩航空</td>
									<td>韩亚航空以及国内航空<p>（韩国真航空及济州航空等）</p></td>
									<td>外国国籍航空</td>
								</tr>
								<tr>
									<td class="first-child">合作运航(共享航班)</td>
									<td>例) HA6001 → KE航班</td>
									<td>例) NH709 → OZ航班</td>
									<td>例) KE5951 → 搭乘EK航班</td>
								</tr>
							</tbody>
						</table>
						<table summary="인도장 안내">
							<caption>인도장 안내</caption>
							<colgroup>
								<col width="119px" />
								<col width="520px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">登机楼取货处</th>
									<td><p><img src="${imageServer}/images/shop/cn/order/img_incheon01.gif" alt="셔틀 트레인으로 이동 후 에스컬레이터를 타고 올라가 우측 121번 GATE앞에 위치" /></p></td>
								</tr>
								<tr>
									<th scope="row">航站楼取货处</th>
									<td><p><img src="${imageServer}/images/shop/cn/order/img_incheon02.gif" alt="A.동편인도장: 2번 출국 심사대를 통과 에스컬레이터 탑승 후 4층 대한항공 퍼스트라운지 맞은편 위치/B. 동편 인도장: 3번 출국 심사대를 통과 4층 아시아나 라운지 옆에 위치" /></p></td>
								</tr>
							</tbody>
						</table>
					</div><!-- end leave -->
					<h3><img src="/images/shop/cn/order/h2_incheon.gif" alt="前往取货处之前的注意事项" /></h3>
					<div class="notice-section">
						<ul class="notice">
							<li>购买液体类商品时，请先前往取货处确认购买内容后领取商品。若不访问取货处，则有可能无法领取商品。</li>
							<li>只有正确输入航班号，才能领取商品。</li>
							<li>前往美国、澳洲等国家的游客必须先前往取货处确认购买内容。</li>
							<li>到达登机楼以后，无法返回到航站楼，敬请留意。</li>
						</ul>
					</div><!-- end notice-section -->
					<div class="btn-close">
						<span onclick="self.close();"><img src="${imageServer}/images/shop/cn/order/btn_close02_cn.gif" alt="关闭" /></span>
					</div><!-- end btn-close -->
				</div><!-- end order -->
				
		
			</div>
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>