<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的购物优惠</a><span>&gt;</span><strong>我的优惠券</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->  
					 
					<h3><img src="/images/shop/cn/mypage/title_discountcoupon.gif" alt="我的优惠券" /></h3>  
 
					<div class="con-tab">	 
						<div class="tab-atype">
							<ul class="tab-menu"> 
								<li class="selected"><a href="#">可用优惠券(10)</a></li> 
								<li><a href="#">已过期优惠券(122)</a></li>
								<li><a href="#">新世界优惠券</a></li>
							</ul>
						</div>
						<p class="btn"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_coupondown.gif" alt="下载优惠券" /></a></p>
					</div>
					 
					<div class="table-listhtype discount-coupon">
						<div class="list">
							<table summary="보유한 할인쿠폰 내역">
								<caption>할인쿠폰 보유 내역</caption>
								<colgroup>  
									<col width="100px" /> 
									<col width="75px" />  
									<col width="180px" /> 
									<col width="90px" />
									<col width="85px" /> 
									<col width="85px" /> 
									<col width="165px" />    
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">优惠券号码</th> 
										<th scope="row">优惠券类别</th> 
										<th scope="row">优惠券名</th> 
										<th scope="row">折扣率(金额)</th>
										<th scope="row">优惠券发放日</th> 
										<th scope="row">优惠券有效期</th> 
										<th scope="row">使用条件</th>        
									</tr>
								</thead>  
								<tbody>
									<tr> 
										<td><span class="coupon-id">X200021</span></td> 
										<td><span class="divide">购物车优惠券</span></td> 
										<td class="couponname"><span>현금쿠폰</span></td>  
										<td class="useinfo"><span>$10,000</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>    
										<td class="using"><span>购买$300 以上</span><span>可重复使用</span></td>
									</tr> 
									<tr> 
										<td><span class="coupon-id">X200021</span></td> 
										<td><span class="divide">商品优惠券</span></td> 
										<td class="couponname"><span>비오는날 주는 쿠폰</span></td>
										<td class="useinfo"><span>5%</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>    
										<td class="using"><span>适用（不适用）品牌</span></td>
									</tr> 
									<tr> 
										<td><span class="coupon-id">X200021</span></td> 
										<td><span class="divide">购物车优惠券</span></td> 
										<td class="couponname"><span>더블쿠폰</span></td>
										<td class="useinfo"><span>$20,000</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>    
										<td class="using"><span>购买$300 以上</span><span>可重复使用</span></td>
									</tr> 
									<tr> 
										<td><span class="coupon-id">X200021</span></td> 
										<td><span class="divide">商品优惠券</span></td> 
										<td class="couponname"><span>생일쿠폰</span></td> 
										<td class="useinfo"><span>$1,091,270</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>    
										<td class="using"><span>购买$300 以上</span><span>可重复使用</span></td>
									</tr> 
									<tr> 
										<td><span class="coupon-id">X2000291</span></td> 
										<td><span class="divide">商品优惠券</span></td> 
										<td class="couponname"><span>1데이쿠폰</span></td>
										<td class="useinfo"><span>5%</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>    
										<td class="using"><span>适用（不适用）品牌</span></td>
									</tr> 
									<tr>
										<td colspan="7">您没有可用的优惠券。</td>
									</tr>
								</tbody>  
							</table>
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
					  
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_couponuse_info.gif" alt="优惠券使用指南" /></p>
					<div class="tipping-box">  
						<ul>
							<li>每张优惠券的有效期不同。</li>
							<li>取消订购时，已使用的优惠券不予退还。</li> 
							<li>优惠券不适用于7折以下折扣商品及部分品牌。</li> 
							<li>详情咨询客服中心(1577-0161)。</li> 
						</ul> 
					</div>	 
				  
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