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

<script type="text/javascript" src="/js/jqueryScroll/jcarousellite_1.0.1.min.js"></script> 
<script type="text/javascript">
jQuery(function($){
 
		// product
		$(".product-list").jCarouselLite({
			btnNext: ".product-box .view-con .next",
			btnPrev: ".product-box .view-con .prev",
			speed: 1000,
			scroll: 5,
			visible:5,
		});  
		
		// recommend
		$(".recommend-list").jCarouselLite({
			btnNext: ".recommend-box .view-con .next",
			btnPrev: ".recommend-box .view-con .prev",
			speed: 1000,
			scroll: 5,
			visible:5,
		});
	 
});
</script>
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
						<a href="#">主页</a><span>&gt;</span><strong>我的页面</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
								 
					<div class="mypage-main">	
					  
							  
						<h3><img src="/images/shop/cn/mypage/title_main03.gif" alt="最近订购记录" /><span><img src="/images/shop/cn/mypage/explain_main02.gif" alt="显示最近6个月的订购记录。" /></span>
							<a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_orderlist_allview.gif" alt="查看全部订购记录" /></a> 
						</h3>	
						
						<div class="statebox">
							<ul class="list">
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo01.gif" alt="等待订购" /></span>
									<span><a href="#">1</a></span></li>
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo02.gif" alt="接受订购" /></span>
									<span><a href="#">5</a></span></li>
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo03.gif" alt="正在处理订单" /></span>
									<span><a href="#">1</a></span></li>
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo04.gif" alt="等待运送" /></span>
									<span><a href="#">2</a></span></li>
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo05.gif" alt="正在运送" /></span>
									<span><a href="#">1</a></span></li>
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo06.gif" alt="运送完毕" /></span>
									<span><a href="#">3</a></span></li>
								<li><span class="title"><img src="/images/shop/cn/mypage/order_stateinfo07.gif" alt="取货成功" /></span>
									<span><a href="#">0</a></span></li>
							</ul>
							<ul class="info">
								<li><span>接受取消</span><a href="#">1</a></li>
								<li><span>正在处理取消</span><a href="#">1</a></li>
								<li><span>取消完毕</span><a href="#">0</a></li>
							</ul>
						</div> 
						<div class="table-listhtype">  
							<div class="list list-product">
								<table summary="주문 내역 리스트">
									<caption>주문 내역 리스트</caption>
									<colgroup>   
										<col width="88px" /> 
										<col width="96px" /> 
										<col width="287px" />  
										<col width="123px" /> 
										<col width="85px" />  
										<col width="101px" />   
									</colgroup>
									<thead>
										<tr> 
											<th scope="row">订购日</th> 
											<th scope="row">订单号码</th> 
											<th scope="row">商品名</th> 
											<th scope="row">付款金额</th>  
											<th scope="row">礼品</th>  
											<th scope="row">订购状态</th>  
										</tr>
									</thead>
									<tbody> 
										<tr class="selected"> 
											<td><span class="fta">2012.08.29</span></td>
											<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
											<td class="orderproduct"><span>TISSOT WATCH</span></td> 
											<td>
												<p class="price"> 
													<span class="us-currency">$395</span>
													<span class="nation-currency">(约￥54,970)</span>
												</p>
											</td>
											<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
											<td class="state"><span class="check">等待订购</span>
											<a href="#"><img src="/images/shop/cn/mypage/btn_eticket_en.gif" alt="注册电子机票" /></span></td>
										</tr>   
										<tr> 
											<td><span class="fta">2012.08.29</span></td>
											<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
											<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
											<td>
												<p class="price"> 
													<span class="us-currency">$663.2</span>
													<span class="nation-currency">(\1,091,270)</span>
												</p>
											</td>
											<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
											<td class="state"><span class="check">等待订购</span></td>
										</tr>  
										<tr> 
											<td><span class="fta">2012.08.29</span></td>
											<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
											<td class="orderproduct"><span>TISSOT WATCH</span></td>
											<td>
												<p class="price"> 
													<span class="us-currency">$395</span>
													<span class="nation-currency">(约￥54,970)</span>
												</p>
											</td>
											<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
											<td class="state"><span class="check">等待订购</span></td>
										</tr>   
										<tr> 
											<td><span class="fta">2012.08.29</span></td>
											<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
											<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
											<td>
												<p class="price"> 
													<span class="us-currency">$395</span>
													<span class="nation-currency">(约￥54,970)</span>
												</p>
											</td>
											<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
											<td class="state"><span class="check">等待订购</span></td>
										</tr>   
										<tr> 
											<td><span class="fta">2012.08.29</span></td>
											<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
											<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td> 
											<td>
												<p class="price"> 
													<span class="us-currency">$395</span>
													<span class="nation-currency">(约￥54,970)</span>
												</p>
											</td>
											<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
											<td class="state"><span class="check">等待订购</span></td>
										</tr>  
										<tr>
											<td colspan="6">最近6个月没有订购的商品。</td>
										</tr>
									</tbody>
								</table>
							</div> 	 
						</div>
						 
						<h3><img src="/images/shop/cn/mypage/title_main05.gif" alt="关注商品" /></h3>		 
						<div class="con-tab">	 
							<div class="tab-atype">
								<ul class="tab-menu"> 
									<li class="selected"><a href="#">关注商品 (5)</a></li> 
									<li><a href="#">购物车 (3)</a></li>
								</ul>
							</div>
							<p class="btn"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_wishlist_go.gif" alt="立即去关注商品" /></a></p> <!--
							<p class="btn"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_basket_go.gif" alt="立即去购物车" /></a></p> -->
						</div>
						<div class="robox">
							<div class="product-box"> 
								<div class="view-con">
									<span class="prev"><img src="/images/shop/cn/mypage/btn_prev.gif" alt="이전" /></span>
									<span class="next"><img src="/images/shop/cn/mypage/btn_next.gif" alt="다음" /></span>
								</div>  
								<div class="product-list">
									<ul>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-1.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[KIEHL`S]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-2.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[KIEHL`S]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-3.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[설화수]</a></p>  
											<p class="product"><a href="#">윤조에센스 90ML</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-4.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[KIEHL`S]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-5.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[SK-II]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
									</ul>
								</div> 
								<!-- 내용이 없을경우 
								<div class="product-nolist">
									<p>您的关注商品中没有商品。</p>
									<p>您的购物车没有商品。</p>
								</div>  -->
								<!-- //내용이 없을경우 -->
							</div>							
						</div>
						
						<!-- 화면보기용 -->
						<h3><img src="/images/shop/cn/mypage/title_main05.gif" alt="关注商品" /></h3>		 
						<div class="con-tab">	 
							<div class="tab-atype">
								<ul class="tab-menu"> 
									<li><a href="#">关注商品 (5)</a></li> 
									<li class="selected"><a href="#">购物车 (3)</a></li>
								</ul>
							</div><!--
							<p class="btn"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_wishlist_go.gif" alt="立即去关注商品" /></a></p> -->
							<p class="btn"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_basket_go.gif" alt="立即去购物车" /></a></p> 
						</div>
						<div class="robox">
							<div class="product-box">  
								<!-- 내용이 없을경우 -->
								<div class="product-nolist">
									<p>您的关注商品中没有商品。</p>
									<!--<p>您的购物车没有商品。</p>-->
								</div> 
								<!-- //내용이 없을경우 -->
							</div>							
						</div>
						<!-- //화면보기용 -->
						 
						<h3><strong class="tit">为○○○顾客推荐的商品</strong><span><img src="/images/shop/cn/mypage/explain_main06.gif" alt="为设置喜欢的分类的顾客推荐合适的商品。" /></span><a href="#" class="link">设置喜欢的分类 &gt;</a></h3> 
						<div class="robox">
							<div class="recommend-box"> 
								<div class="view-con">
									<span class="prev"><img src="/images/shop/cn/mypage/btn_prev.gif" alt="이전" /></span>
									<span class="next"><img src="/images/shop/cn/mypage/btn_next.gif" alt="다음" /></span>
								</div> 
								<div class="recommend-list">
									<ul>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-1.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[KIEHL`S]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-2.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[KIEHL`S]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-3.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[설화수]</a></p>  
											<p class="product"><a href="#">윤조에센스 90ML</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-4.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[KIEHL`S]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
										<li>
											<p class="photo"><a href="#"><img src="/images/shop/cn/mypage/130x130-5.gif" alt="상품명" /></a></p>
											<p class="brand"><a href="#">[SK-II]</a></p>  
											<p class="product"><a href="#">ULTRA FACIAL</a></p> 
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(约￥54,970)</span>
											</p> 
										</li>
									</ul>
								</div>
							</div>
						</div>
						  
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