<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title> 
<link href="/css/mypage_popup.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript">
$(function($){
	
	$('.dollar-change').jScrollPane({showArrows: true});
	$('.exchange-box').jScrollPane({showArrows: true});
});

</script>
</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/mypage/popup/h1_savem_list.gif" alt="$查看积分" /></h1>
	</div><!-- end head -->
	<div id="body">
		<div class="contents">
			<div class="prbox_scroll">
				<div class="savelist-checkbox">
					<div class="layer-money">
						<p class="txt-box"> 
							<span class="txt-tipping"><span>홍길동</span> 顾客可兑换的 $积分是 <span class="font-red">$30</span>。</span>  
							<span class="txt-tipping">按现在汇率(2013.05.31 现在汇率 是$1 = \1,131) <span class="font-red">\33,930</span> 兑换积分。</span>
							<a href="#"><img src="/images/shop/cn/mypage/btn_savemoney_change.gif" alt="兑换积分" /></a>
						</p>
						<div class="notice-section">
							<p class="first-child">总$积分 : <span>$53,429</span></p>
							<p>兑换的$积分 : <span>$9</span></p>
							<p>过期的$积分 : <span>$300</span></p>
						</div>
						<p class="s-title"><img src="/images/shop/cn/mypage/popup/stitle_savem_list01.gif" alt="可兑换$积分" /></p>
						<div class="exchange-box">
							<table summary="可兑换$积分" class="save-present">
								<caption>可兑换$积分</caption>
								<colgroup>
									<col width="150px" />
									<col width="160px" />
									<col width="90px" />
									<col width="120px" />
									<col width="90px" />
								</colgroup>
								<thead>
									<tr>
										<th>积分名称</th>
										<th>总$积分</th>
										<th>兑换的$积分</th>
										<th>剩余$积分</th>
										<th>有效期</th>
									</tr>
								</thead>
								<tbody> 
									<tr>
										<td class="useinfo"><span>以前的积分1</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr>
										<td class="useinfo"><span>以前的积分2</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr>
										<td class="useinfo"><span>以前的积分3</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr>
										<td class="useinfo"><span>以前的积分4</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr>
										<td class="useinfo"><span>以前的积分5</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr>
										<td class="useinfo"><span>以前的积分4</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr>
										<td class="useinfo"><span>以前的积分5</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td class="useinfo"><span>$5</span></td>
										<td class="fta"><span>2013.10.01</span></td>
									</tr>
									<tr> 
										<td colspan="5">没有可兑换的$积分。</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="total-box">
							<table summary="可兑换$积分 合计" class="save-present">
								<caption>可兑换$积分 合计</caption>
								<colgroup>
									<col width="146px" />
									<col width="156px" />
									<col width="86px" />
									<col width="116px" />
									<col width="107px" />
								</colgroup>
								<tbody>									
									<tr class="total-use">
										<td class="useinfo"><span>合计</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$15</span></td>
										<td class="useinfo"><span>$10</span></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="save-present02">
							<p class="s-title"><img src="/images/shop/cn/mypage/popup/stitle_savem_list02.gif" alt="$积分内容" /></p> 
							<div class="dollar-change">
								<table summary="$积分内容">
									<caption>$积分内容</caption>
									<colgroup>
										<col width="70px" />
										<col width="125px" />
										<col width="90px" />
										<col width="80px" />
										<col width="70px" />
										<col width="85px" />
										<col width="110px" />
									</colgroup>
									<thead>
										<tr>
											<th>序号</th>
											<th>日期</th>
											<th>$积分</th>
											<th>兑换金额</th>
											<th>兑换时汇率</th>
											<th>积分(\)</th>
											<th>有效期</th>
										</tr>
									</thead>
									<tbody> 
										<tr>
											<td class="fta"><span>10</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td></td>
											<td>$10</td>
											<td>\1,123.4</td>
											<td>\11,300</td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>9</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td></td>
											<td>$10</td>
											<td>\1,123.4</td>
											<td>\11,300</td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>8</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td></td>
											<td>$10</td>
											<td>\1,123.4</td>
											<td>\11,300</td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>7</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$15</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>6</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$10</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>7</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$15</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>6</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$10</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>8</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td></td>
											<td>$10</td>
											<td>\1,123.4</td>
											<td>\11,300</td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>7</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$15</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>6</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$10</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>7</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$15</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr>
											<td class="fta"><span>6</span></td>
											<td class="fta"><span>2013.10.01<span>17:24:38</span></span></td>
											<td>$10</td>
											<td></td>
											<td></td>
											<td></td>
											<td class="fta"><span>2013.12.21</span></td>
										</tr>
										<tr> 
											<td colspan="7">没有积分内容。</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="pager">
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음으로" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
							<a href="#">10</a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막으로" /></a>
						</div>
					</div>
					<div class="btn_wrap">
						<p class="center"><a href="#"><img src="/images/shop/cn/mypage/popup/btn_close.gif" alt="关闭" /></a></p>
					</div>	
				</div>
			</div><!-- //prbox -->
		</div>
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>