<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/mypage_popup.css" rel="stylesheet" type="text/css" />   
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css" ><![endif]-->
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
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
<div id="wrap">
	<div id="head">
		<h1><img src="/images/shop/cn/mypage/popup/h1_airinfo.gif" alt="取货处指南" /></h1>
	</div> 
	<div id="body"> 
		<div class="contents">
			<div class="prbox">  
				<div class="airlist">
					<ul class="airlist-con" id="airlist-con">
						<li><a href="#" class="tit">仁川国际机场西边取货处</a>
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
				 
				<div class="btn_wrap">
					<p class="center"><a href="#"><img src="/images/shop/cn/mypage/popup/btn_close.gif" alt="关闭" /></a>
					<a href="#" class="print"><img src="/images/shop/cn/mypage/popup/btn_print.gif" alt="打印" /></a></p>
				</div>
			  
			</div>			    
		</div> 
	</div><!-- end body -->
</div><!-- end wrap -->
</body>
</html>