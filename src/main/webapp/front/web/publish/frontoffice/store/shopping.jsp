<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout_store.css" rel="stylesheet" type="text/css" />
<link href="/css/store.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script> 
<!-- selectbox 있을경우 추가 -->
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 
	/* 게시판 검색 */ 
	$("#table-search").selectbox(); 	
	
});  
//]]>
</script> 
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store05.jsp"%>
			<div id="contents">
				<div class="page-sublocation">    
					<a href="#">主页</a><span>&gt;</span><a href="#">使用指南</a><span>&gt;</span><strong>购物智慧</strong>
				</div>  
				<div class="location-title visual05">
					<h3><img src="/images/shop/cn/store/h3_title05.gif" alt="information" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				 
				<h4><img src="/images/shop/cn/store/title_shopping.gif" alt="购物智慧" /></h4> 
				<div class="shopping-info"> 
					<p class="stitle"><img src="/images/shop/cn/store/stitle_shopping01.gif" alt="购物指南" /></p>
					<div class="hbox01">
						<p class="mtitle"><img src="/images/shop/cn/store/stitle_shopping01_1.gif" alt="可利用免税店的顾客" /></p>
						<p class="stitle-txt">免税店为即将出境的韩国人及外国人提供购物服务。访问免税店需持出境者本人护照，并要确定出境日期、飞机航班号。 </p>
						<p class="stitle-txt">免税商品可以从出国前30日开始购买。</p>
					</div> 
					<p class="stitle">商品取货指南</p>
					<p class="stitle-txt">出国当日在各出国地点的取货处出示交换券、本人护照、登机牌以确认购买者本人后便可领取商品。</p>
					<div class="tip-box">
						<div class="tipping-box bg-shopping01">
							<p class="stitle">取货注意事项</p>
							<p class="txt-tipping">请于出境1~2小时前取货。取货时请当场确认商品数量和商品名后签名。</p>
							<p class="txt-tipping">若商品存在异常，请及时告知取货处工作人员。取货完毕及出境后商品出现问题时，免税店不承担任何责任。</p>
							<p class="txt-tipping">免税商品只能在出境地点的取货处领取，入境时不可领取。</p>
						</div>
					</div>
					<div class="tip-box">
						<div class="tipping-box">
							<p class="stitle">韩国人从韩国出境时免税商品购买限额以及入境时免税限额</p>
							<p class="txt-tipping">从韩国出境的韩国国籍人士的免税商品购买限额为$3,000.	<span class="font-red">(其中不包括韩国商品)</span></p>
							<p class="txt-tipping">在免税店购买的商品将免除税金。免税商品购买条为在国外使用及消费或作为他人礼物购买。</p>
							<p class="txt-tipping">但不得不将在免税店购买的商品带回购买国家时，若商品总额超过$400（包括在国外购买的商品）， 则必须向海关报关。<br />
							<span class="font-red">(商品免税限额为包括进口物品、国内物品加在一起总共$400 ，敬请留意。)</span></p>
						</div>
					</div>
					<div class="tip-box">
						<p class="stitle"><img src="/images/shop/cn/store/stitle_shopping02.gif" alt="购物注意事项" /></p>
						<div class="hbox01">
							<p class="mtitle"><img src="/images/shop/cn/store/stitle_shopping02_1.gif" alt="变更出境信息" /></p>
							<p class="stitle-txt">若出境日期、出境机场、航班号、护照号码等有变动，则有可能无法领取商品，因此至少于出境前2日联系新世界免税店。</p>
						</div>
						<p class="stitle">未领取商品的处理</p>
						<p class="stitle-txt">入境时无法领取商品，若要领取，则需要在再次出境时领取或回国后退货。<br />
							在机场免税店未领取的商品将再次运输到新世界免税店保税区保管1个月。经过1个月之后，根据关税法，将商品取消销售。</p>
					</div>
					<div class="tip-box">
						<div class="tipping-box bg-shopping02">
							<p class="stitle">所购免税商品的交换、退货</p>
							<p class="txt-tipping">对于在海外通过国际邮递申请退货的免税品，可通过国际邮递进行退货。</p>
							<p class="txt-tipping">对于游客亲自携带从免税店购买的商品入境申请退货时，<br />必须在出国后最初入境时向海关申报所携带的商品。</p>
							<p class="txt-tipping">(欲退货的商品总额在$400 以下时除外) 退货必须由本人申请才予以受理。</p>
							<p class="txt-tipping">已购买的商品不能交换，如果需要，就必须取消订购之后重新购买所需商品并于出境时在机场取货处取货。<br />(但已领取的商品不可交换）</p>
							<p class="txt-tipping">商品本身存在问题，可以退货。交换商品只限于同样商品有库存时。</p>
							<p class="txt-tipping">若需要交换商品，但同样商品已断货，则只能退货处理。</p>
						</div>
					</div>
					<div class="tip-box">
						<p class="stitle">取消指南</p>
						<div class="hbox01 cancel-box">
							<div>
								<p class="mtitle"><img src="/images/shop/cn/store/stitle_shopping02_2.gif" alt="取货前" /></p>
								<p class="txt">希望取消商品的顾客，需持本人（出境者本人护照为准）</p>
								<p class="txt">护照、交换券亲自访问客服中心。</p>
								<p class="txt">(如果有促销活动时收到的赠品，请一同携带）</p>
							</div>
							<div>
								<p class="mtitle"><img src="/images/shop/cn/store/stitle_shopping02_3.gif" alt="取货后（再次携带入境）" /></p>
								<p class="txt">因顾客单纯的变心而要退货时，不予退货。</p>
								<p class="txt">但若商品本身存在问题或不良，则予以退货。</p>
								<p class="txt">（若无库存，则不能交换商品。）</p>
							</div>
						</div>
						<p class="txt-tipping">取消咨询客服中心 <span> : 051-749-1300~ 1</span></p>
					</div>
				</div><!-- end shopping-info -->
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



