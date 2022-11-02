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
					<div id="contents">  
					<div class="page-sublocation">  
						<a href="#">主页</a><span>&gt;</span><a href="#">我的购物优惠</a><span>&gt;</span><strong>我的优惠券</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->  
					 
					<h3><img src="/images/shop/cn/mypage/title_discountcoupon.gif" alt="我的优惠券" /></h3>  
 
					<div class="con-tab">	 
						<div class="tab-atype">
							<ul class="tab-menu"> 
								<li><a href="#">可用优惠券(10)</a></li> 
								<li><a href="#">已过期优惠券(122)</a></li>
								<li class="selected"><a href="#">新世界优惠券</a></li>
							</ul>
						</div>
						<p class="btn"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_info_detail.gif" alt="使用指南" /></a></p>
					</div>
			  		
					<div class="table-listhtype discount-coupon">
						<p class="info">可以查看顾客的新世界优惠券。</p>
					 
						<div class="regi-box"> 
							<p>请输入您的新世界优惠券号码（折扣券/积分）之后，点击“注册优惠券”按钮。</p> 
							<div>
								<p class="tit"><img src="/images/shop/cn/mypage/registration_coupon_no.gif" alt="COUPON NO" /></p>
								<p class="regi-txt">
									<input type="text" title="쿠폰 번호를 입력해주세요." />
									<a href="#"><img src="/images/shop/cn/mypage/btn_registration.gif" alt="注册优惠券" /></a>
								</p>
							</div>
						</div>
					</div>
					
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_have_list.gif" alt="积分拥有现状" /></p>
					<div class="table-listhtype discount-coupon">
						<div class="list">
							<table summary="쿠폰 보유내역">
								<caption>쿠폰 보유내역</caption>
								<colgroup>  
									<col width="120px" /> 
									<col width="140px" /> 
									<col width="120px" /> 
									<col width="120px" /> 
									<col width="120px" /> 
									<col width="160px" />   
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">优惠券号码</th> 
										<th scope="row">种类</th> 
										<th scope="row">金额</th> 
										<th scope="row">优惠券注册日期</th>
										<th scope="row">优惠券有效期</th>
										<th scope="row">状态</th>
									</tr>
								</thead>
								<tbody>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>折扣券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td class="order-no">使用(2013.05.02)<span>(订单号码:<a href="#">6941940363931</a>)</span></td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>积分优惠券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>折扣券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>积分优惠券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td>  
										<td class="couponname"><span>折扣券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>积分优惠券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>积分优惠券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>折扣券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>积分优惠券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td>-</td>
									</tr>
									<tr> 
										<td><span class="coupon-no">5111380107945</span></td> 
										<td class="couponname"><span>折扣券</span></td> 
										<td><p class="price"><span>￦10,000</span></p></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td class="order-no">使用(2013.05.02)<span>(订单号码:<a href="#">6941940363931</a>)</span></td>
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