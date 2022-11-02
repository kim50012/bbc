<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/base.css" rel="stylesheet" type="text/css" />
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/use_info.css" rel="stylesheet" type="text/css" />
<link href="/css/detail.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
jQuery(function($){

	$(".airlist-con a").click(function(event){  
		event.preventDefault();
	}); 
 
	var newTab = function() {
		var args = arguments[0];
		var _this = this;
		this.id = args.id;
		this.tab = args.tab;
		this.random = (args.random) ? args.random : false;
		this.idx = (this.random) ? Math.floor(Math.random()*this.tab.length) : 0;
		this.evt = (args.evt!='') ? args.evt : 'click';
		this.show = function() {
			var idx = $(this).parent().index();
			$(_this.id).children('.on').removeClass('on');
			_this.tab.eq(idx).parent().addClass('on');
		};
		this.evtBind = function() {
			if(this.evt == 'mouseover') _this.tab.mouseover(_this.show).focus(_this.show);
			else _this.tab.click(_this.show);
		}
		this.tab.eq(this.idx).parent().addClass('on');
		this.evtBind();
	}; 
	var tab1 = new newTab ({
		id : '#airlist-con',
		tab : $('#airlist-con').find('.tit'),
		random : false,
		evt : 'click'
	}); 

});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-submainlocation">  
				<p class="title"><img src="/images/shop/cn/common/title_use_info.gif" alt="利用指南" /></p>
				<a href="#">主页 </a><span>&gt;</span><strong>利用指南</strong>
			</div>
			<div class="use-container">
				<div class="useinfo-box members">
					<div class="useinfo-txt">
						<p><img src="/images/shop/cn/etc/members_title.gif" alt="members join 注册新世界免税店会员" /></p>
						<p class="txt"><img src="/images/shop/cn/etc/members_txt.gif" alt="注册新世界免税店会员，可享受打折券、积分等多种优惠。" /></p>
						<a href="#"><img src="/images/shop/cn/etc/members_link.gif" alt="立即注册会员" /></a>
					</div>
					<div class="useinfo-step">
						<p><img src="/images/shop/cn/etc/members_info.gif" alt="01.点击“注册会员”按钮，向注册会员页面移动。 /02.同意使用条款、个人信息处理方针之后，输入姓名和护照号码，
	再点击“重复确认”按钮已确认注册是否成功。 /03.请填写所有必填项。 /04.会员注册完毕。输入您的用户名和密码登陆，即可享受新世界 免税店提供的所有服务。" /></p>
					</div>
				</div>
				
				
				<div class="useinfo-box shopping">
					<div class="useinfo-txt">
						<p><img src="/images/shop/cn/etc/shopping_title.gif" alt="shopping 购买商品" /></p>
						<p class="txt"><img src="/images/shop/cn/etc/shopping_txt.gif" alt="新世界免税店分类提供多种多样的商品" /></p>
						<a href="#"><img src="/images/shop/cn/etc/shopping_link.gif" alt="立即去看企划展" /></a>
					</div>
					<div class="useinfo-step">
						<p><img src="/images/shop/cn/etc/shopping_info.gif" alt="01.分类推荐各种礼物。 /02.多种多样的商品促销活动 /03.分类介绍商品，便于顾客查找所需的商品。 /04.按品牌分类商品" /></p>
					</div>
				</div>
				
					
				<div class="useinfo-box order">
					<div class="useinfo-txt">
						<p><img src="/images/shop/cn/etc/order_title.gif" alt="how to order 填写订单以及付款" /></p>
						<p class="txt"><img src="/images/shop/cn/etc/order_txt.gif" alt="请使用优惠券、积分等，便宜购买商品" /></p>
					</div>
					<div class="useinfo-step">
						<p><img src="/images/shop/cn/etc/order_info.gif" alt="01.需要选择尺寸、颜色、数量时，应选择所有选项。请点击“立即购买”按钮。 /02.若订购者信.息、出境信息与实际信息不一致，则无法领取
商品，请务必输入正确信息。选择优惠券、积分等各种优惠之后，点击“付款”按钮。 /03.请选择付款方式之后，点击“付款”按钮。 /04.已完成订购。点击“打印订单”按钮，便可打印订单。若无法打印订单，则在纸张记录订购号码 到取货处出示即可。" /></p>
					</div>
				</div>
				
				
				
				<div class="useinfo-box item">
					<div class="useinfo-txt">
						<p><img src="/images/shop/cn/etc/item_title.gif" alt="how to order 填写订单以及付款" /></p>
						<p class="txt"><img src="/images/shop/cn/etc/item_txt.gif" alt="请使用优惠券、积分等，便宜购买商品" /></p>
					</div>
					<div class="useinfo-step">
						<p><img src="/images/shop/cn/etc/item_info.gif" alt="01.需要选择尺寸、颜色、数量时，应选择所有选项。请点击“立即购买”按钮。 /02.若订购者信.息、出境信息与实际信息不一致，则无法领取
商品，请务必输入正确信息。选择优惠券、积分等各种优惠之后，点击“付款”按钮。 /03.请选择付款方式之后，点击“付款”按钮。 /04.已完成订购。点击“打印订单”按钮，便可打印订单。若无法打印订单，则在纸张记录订购号码 到取货处出示即可。" /></p>
					</div>
				</div>
				
				
				<div class="about-info">
					<img src="/images/shop/cn/etc/about_txt.gif" alt="新世界免税店" />
					<p>attention -免税店是指免除商品的税金后销售的卖场，其特点是价格便宜。
						为方便顾客购买商品，主要在机场候机厅或顾客易于访问的市内
						区域营业。新世界网上免税店为会员提供优惠券、积分等多种优惠，
						顾客可以便宜购买各种商品。
					</p>
					<p>about shinsegae - 新世界免税店是朝鲜酒店的联营公司，坐落于釜山海云台乐园酒店的新馆。
						新世界免税店以韩国南部最大规模的世界级免税店而闻名，
						是釜山引以为豪的旅游名所。
					</p>
				</div>
								
				
				
				
				
				<div class="product-review">
					<p class="title"><img src="/images/shop/cn/etc/picup_title.gif" alt="引渡场介绍" /></p>
					<div class="airlist">
						<ul class="airlist-con" id="airlist-con">
							<li class="on"><a href="#" class="tit">仁川国际机场西边取货处</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_west.gif" alt="仁川国际机场西边取货处" /></div> 
									<div class="map-info">
										<p class="title">仁川国际机场西边取货处</p>
										<p class="txt"><span>位置</span>: 通过3号出境审查台，乘咨询台前方的扶梯上楼后，</p>
										<p class="txt02">位于韩亚航空贵宾休息室前面。</p>
										<p class="tel"><span>联系方式</span>: 032-743-2709</p>
									</div>   
								</div>
							</li>
							<li><a href="#" class="tit">仁川国际机场东边取货处</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_east.gif" alt="仁川国际机场东边取货处" /></div>
									<div class="map-info">
										<p class="title">仁川国际机场东边取货处</p>
										<p class="txt"><span>位置</span>: 位于航站楼2号出国审查台楼上（4楼），</p>
										<p class="txt02">大韩航空贵宾休息室对面</p>
										<p class="tel"><span>联系方式</span>: 032-743-2674</p>
									</div> 
								</div>
							</li> 
							<li><a href="#" class="tit">仁川国际机场登机楼</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_incheon_boarding.gif" alt="仁川国际机场登机楼" /></div>
									<div class="map-info">
										<p class="title">仁川国际机场登机楼</p>
										<p class="txt"><span>位置</span>: 从机场快轨下车后乘扶梯上楼，</p>
										<p class="txt02">位于121号登机口前面。</p>
										<p class="tel"><span>联系方式</span>: 032-743-2757</p>
									</div>  
								</div>
							</li>
							<li><a href="#" class="tit">金浦国际机场</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_gimpo.gif" alt="金浦国际机场" /></div>
									<div class="map-info">
										<p class="title">金浦国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场3楼出国审查台后，</p>
										<p class="txt02">位于36号登机口前面。</p> 
										<p class="tel"><span>联系方式</span>: 02-2666-5285</p>
									</div> 
								</div>
							</li>
							<li><a href="#" class="tit">大邱国际机场</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_daegu.gif" alt="大邱国际机场" /></div>
									<div class="map-info map-tow">
										<p class="title">大邱国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于左侧。</p> 
										<p class="tel"><span>联系方式</span>: 053-981-8277</p>
									</div> 
								</div>
							</li>
							<li><a href="#" class="tit">金海国际机场</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_gimhae.gif" alt="金海国际机场" /></div>
									<div class="map-info map-tow">
										<p class="title">金海国际机场</p>
										<p class="txt"><span>位置</span>: 通过机场2楼出国审查台后，位于右侧。</p>
										<p class="tel"><span>联系方式</span>: 051-971-5901</p>
									</div> 
								</div>
							</li>
							<li><a href="#" class="tit">釜山港</a>
								<div class="conbox">
									<div class="map"><img src="/images/shop/cn/product/detail/img_busan.gif" alt="釜山港" /></div>
									<div class="map-info map-tow">
										<p class="title">釜山港</p>
										<p class="txt"><span>位置</span>: 通过码头2楼出国审查台后，位于右侧。</p> 
										<p class="tel"><span>联系方式</span>: 051-465-0181</p>
									</div> 
								</div>
							</li> 
						</ul>
					</div>
				</div><!-- end product-review -->
			</div><!-- end use-container -->
		
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>
