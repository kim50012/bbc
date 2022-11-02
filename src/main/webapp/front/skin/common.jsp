<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<% 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0L);
	
	if(request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control","no-cache");
	
	String path = request.getContextPath();
	String basePath = "";
	if(request.getServerPort() == 80){
		
	 basePath = request.getScheme()+"://"+request.getServerName()+ "/";
	}else{
		
	 basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
	
	String strCurrentTime = String.valueOf(System.currentTimeMillis());
	
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi" />
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/common.css" />
<link rel="stylesheet" type="text/css" href="/front/js/page/kkpager.css" />
<%-- <link rel="stylesheet" type="text/css" href="/front/css/skin.htm?time=<%=strCurrentTime %>" /> --%>
<%-- <link rel="stylesheet" type="text/css" href="/front/css/skin${sessionScope.sessionSkin.skinTypeShop}.htm?time=<%=strCurrentTime %>" />  --%>
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/skin.css?time=<%=strCurrentTime %>" />
<link rel="stylesheet" type="text/css" href="/front/skin/demo/css/skin${sessionScope.sessionSkin.skinTypeShop}.css?time=<%=strCurrentTime %>" />     
 
<style type="text/css">
	#foo {width: 100%; height: 100%; position: fixed; top: 0; left: 0; z-index: 999000; width: 100%; height: 100%;}
	#fo {position: fixed; top: 50%; left: 50%; z-index:999999; display: '';}
</style>

<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/front/js/headroom.js"></script>
<script type="text/javascript" src="/front/js/jQuery.headroom.js"></script>
<script type="text/javascript" src="/front/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="/front/js/jquery.touchSlider.js"></script>
<script type="text/javascript" src="/front/js/common.js"></script>
<script type="text/javascript" src="<c:url value="/front/js/underscore-min.js" />"></script>
<script type="text/javascript" src="<c:url value="/admin/js/template.js" />"></script>
<script type="text/javascript" src="/front/js/page/kkpager.min.js"></script>
<script type="text/javascript" src="/front/js/raty/jquery.raty.js"></script>
<!-- <script type="text/javascript" src="/front/js/spin.js"></script> -->
<script type="text/javascript" src="/front/js/spin.min.js"></script>
<script type="text/javascript" src="/front/js/bottom-menu.js"></script>
<script type="text/javascript" src="/front/js/jquery.timer.js"></script>
<script type="text/javascript" src="/front/js/koreanair-Navigation.js"></script>
<script type="text/javascript" src="/front/js/jquery.bpopup.min.js"></script>
<script>

	if(!window.console){
		window.console = {
			dubug : function(){},
			log : function(){},
			info : function(){},
			warn : function(){},
			error : function(){}	  
		} 
	}
  
	var sPopts = {
		  lines: 10, // The number of lines to draw
		  length: 5, // The length of each line
		  width: 4, // The line thickness
		  radius: 10, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 30, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#000', // #rgb or #rrggbb or array of colors
		  speed: 1.0, // Rounds per second
		  trail: 80, // Afterglow percentage
		  shadow: true, // Whether to render a shadow
		  hwaccel: true, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  top: '50%', // Top position relative to parent
		  left: '50%' // Left position relative to parent
		};

	// Common functions
	function pad(number, length) {
	    var str = '' + number;
	    while (str.length < length) {str = '0' + str;}
	    return str;
	}
	function formatTime(time, ftype) {
	    var day = parseInt(time / 8640000),
	    	hou = parseInt(time / 360000) - (day * 24),
	    	min = parseInt(time / 6000) - (hou * 60) - (day * 1440),
	        sec = parseInt(time / 100) - (min * 60) - (hou * 3600) - (day * 86400),
	        hundredths = pad(time - (sec * 100) - (min * 6000) - (hou * 360000), 2) - (day * 8640000);
	    	//alert(hou);
	    var str_return;
	    if (ftype == 2) {
	    	str_return = 
		   	     '还剩'+(day > 0 ? day+'天' : "")
		    		+(hou > 0 ? pad(hou, 2) : "00") 
		    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
		    		+ ":" + (sec > 0 ? pad(sec, 2) : "00");
	    }
	    else if (ftype == 3) {
	    	str_return = 
		   	     (hou > 0 ? pad(hou, 2) : "00") 
		    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
		    		+ ":" + (sec > 0 ? pad(sec, 2) : "00");
	    }
	    else if (ftype == 4) {
	    	var resTime = new Object();
	    	resTime.day = (day > 0 ? day : "00");
	    	resTime.hour = (hou > 0 ? pad(hou, 2) : "00");
	    	resTime.min = (min > 0 ? pad(min, 2) : "00");
	    	resTime.sec = (sec > 0 ? pad(sec, 2) : "00");
	    	resTime.hundr = (hundredths > 0 ? pad(hundredths, 2) : "00");
	    	str_return = resTime;
// 	    	str_return = 
// 		   	     "{'day':'" + (day > 0 ? day : "00") + "'"
// 		    		+ ", 'hour':'" + (hou > 0 ? pad(hou, 2) : "00") + "'" 
// 		    		+ ", 'min':'" + (min > 0 ? pad(min, 2) : "00") + "'"
// 		    		+ ", 'sec':'" + (sec > 0 ? pad(sec, 2) : "00") + "'"
// 		    		+ ", 'hundr':'" + (hundredths > 0 ? pad(hundredths, 2) : "00") + "'"
// 		    		+ "}";
	    }
	    else {
	    	str_return = 
	    		'还剩'+(day > 0 ? day+'天' : "")
	    		+(hou > 0 ? pad(hou, 2) : "00") 
	    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
	    		+ ":" + (sec > 0 ? pad(sec, 2) : "00") 
	    		+ "." + (hundredths > 0 ? pad(hundredths, 2) : "00");
	    }
	    return str_return;
	}

	function strToJson(str) {
	  eval("var x = " + str + ";");
// 	  return JSON.stringify(x);
	  return JSON.parse(str);
	}
</script>


<script>
function favorites(flag, shopId, goodsId, displayId, way) {
	var params = {
		shopId: shopId,
		goodsId: goodsId,
		displayId: displayId
	};
	if (way == "list") {
		if ($("#img" + goodsId).attr("src") == "/front/skin/main/img/favorites_01.png") {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/removeFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("取消成功");
					} else {
						alert("取消失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#img" + goodsId).attr("src", "/front/skin/main/img/favorites_02.png");
			$("#span" + goodsId).html("未收藏");
		} else {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/addFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("收藏成功");
					} else {
						alert("收藏失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#img" + goodsId).attr("src", "/front/skin/main/img/favorites_01.png");
			$("#span" + goodsId).html("已收藏");
		}
	} else {
		if ($("#gridimg" + goodsId).attr("src") == "/front/skin/main/img/favorites_01.png") {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/removeFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("取消成功");
					} else {
						alert("取消失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#gridimg" + goodsId).attr("src", "/front/skin/main/img/favorites_02.png");
			$("#gridspan" + goodsId).html("未收藏");
		} else {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/addFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("收藏成功");
					} else {
						alert("收藏失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#gridimg" + goodsId).attr("src", "/front/skin/main/img/favorites_01.png");
			$("#gridspan" + goodsId).html("已收藏");
		}
	}
}
</script>
<script type="text/javascript">
 
 function cartCounter(pageId, goodsId, displayId){
	 counter({
		 pageTp : 4,
		 pageId : pageId || '',
		 goodsId : goodsId || '',
		 displayId : displayId || '',
	 });
 }
 
function counter(obj){
	$.ajax({
		data: {
			shopId : obj.shopId || '${sessionScope.sessionSkin.shopId}',
			pageTp : obj.pageTp || '',
			pageId : obj.pageId || '',
			goodsId : obj.goodsId || '',
			displayId : obj.displayId || ''
		},
		dataType: "json",
		type: "POST",
		url: "/front/counter/counter.htm",
		success: function(data) {
			 
		},
		error: function(a, msg, c) {
			 
		}
	});
}
</script>

<script type="text/javascript">

function shareQQZone(){
	  var url = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey'
			 + '?url=' + encodeURIComponent(location.href)
			 + '&title=' + encodeURIComponent(document.title) 
			 + '&pics=' + ''
			 + '&summary=' +  '' ;
	  
	 window.open(url,'_blank');
}


function shareSinaBlog(){
	  var url = 'http://service.weibo.com/share/share.php'
			 + '?url=' + encodeURIComponent(location.href)
			 + '&title=' + encodeURIComponent(document.title) 
			 + '&source=' + 'bookmark'
			 + '&appkey=' +  ''
			 + '&pic=' +  ''
			 + '&ralateUid=' +  '' ;
	   
	 window.open(url,'_blank');
}
function shareQQBlog(){
	  var url = ' http://share.v.t.qq.com/index.php'
			 + '?c=' + 'share'
			 + '&a=' + 'index'
			 + '&url=' + encodeURIComponent(location.href)
			 + '&title=' + encodeURIComponent(document.title) 
			 + '&appkey=' + '' //ce15e084124446b9a612a5c29f82f080 
			 + '&site=' + '' // 'www.jiathis.com'
			 + '&pic='  + '';
	   
	 window.open(url,'_blank');
}


function shareDouban(){
	  var url = 'http://www.douban.com/share/service'
	  		 + '?image='
			 + '&href=' + encodeURIComponent(location.href)
			 + '&name=' + encodeURIComponent(document.title) 
			 + '&text=' + encodeURIComponent(document.title) 
	   		  ;
	 window.open(url,'_blank');
  }

function fn_followLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.followLayerPopup').show();
}


function fn_followLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.followLayerPopup').hide();
}

function fn_SnsSareLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.snsShareLayerPopup').show();
}


function fn_SnsSareLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.snsShareLayerPopup').hide();
}


function fn_followLayerHongBaoShow() {
	$('#container').addClass('on layerZindex');
	$('.followLayerPopupHongBao').show();
}


function fn_followLayerHongBaoHide() {
	$('#container').removeClass('on layerZindex');
	$('.followLayerPopupHongBao').hide();
}




</script>

	<!-- mainLayerPop -->
	<div class="followLayerPopup" style="display:none;">
		<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="fn_followLayerHide();"/>
		<div class="title">
			<c:choose>
				<c:when test="${sessionScope.sessionSkin.shopId == 24}">
					欢迎关注 &nbsp;<span style="color:#ff7170;">韩国现代Hmall</span>
				</c:when>
				<c:when test="${sessionScope.sessionSkin.shopId == 26}">
					欢迎关注 &nbsp;韩华格乐丽雅免税店
				</c:when>
				<c:otherwise>
					您需要加关注后才能购买
				</c:otherwise>
			</c:choose>
		</div>
		<div class="inner">
			<div class="cont-Title" style="height:10px;"></div>
			<div class="cont-Title">
				在微信“通讯录”点击 &nbsp;&nbsp;&nbsp;&nbsp;<img class="serchMan" src="/front/skin/main/img/icon/wechatidSearchMan.png" />
			</div>
			<div class="cont-Title2">
				搜索微信号 :  <span class="wechatId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.sessionSkin.shopWechatId}&nbsp;</span>
			</div>
			<div class="cont-Title">
				<div style="height:5px; width:100%;"></div>
				点击 详细资料 页面底部的
			</div>
			<div class="follow">
				关注
			</div>
			<div class="cont-Title">
				关注我们！
			</div>
			
			<div class="cont-Title">
				<div style="height:1px; background:#6d6d6d; width:80%; margin-left:10%;"></div>
			</div>
			
			<div class="cont-Body">
				<ul class="shareList">
					<img src="${sessionScope.sessionSkin.shopQRImgUrl}"/>
				</ul>
			</div>
			<div class="cont-Title">
				长按二维码可直接关注
			</div>
		</div>
	</div>
	<!-- //mainLayerPop -->
	
	<!-- mainLayerPop -->
	<div class="followLayerPopupHongBao" style="display:none;">
<!-- 		<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="fn_followLayerHide();"/> -->
		<div class="title">
			您需要加关注后才能抢红包
		</div>
		<div class="inner">
			<div class="cont-Title" style="height:10px;"></div>
			<div class="cont-Title">
				在微信“通讯录”点击 &nbsp;&nbsp;&nbsp;&nbsp;<img class="serchMan" src="/front/skin/main/img/icon/wechatidSearchMan.png" />
			</div>
			<div class="cont-Title2">
				搜索微信号 :  <span class="wechatId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.sessionSkin.shopWechatId}&nbsp;</span>
			</div>
			<div class="cont-Title">
				<div style="height:5px; width:100%;"></div>
				点击 详细资料 页面底部的
			</div>
			<div class="follow">
				关注
			</div>
			<div class="cont-Title">
				关注我们！
			</div>
			
			<div class="cont-Title">
				<div style="height:1px; background:#6d6d6d; width:80%; margin-left:10%;"></div>
			</div>
			
			<div class="cont-Body">
				<ul class="shareList">
					<img src="${sessionScope.sessionSkin.shopQRImgUrl}"/>
				</ul>
			</div>
			<div class="cont-Title">
				长按二维码可直接关注
			</div>
		</div>
	</div>
	<!-- //mainLayerPop -->
	
	<!-- mainLayerPop -->
	<div class="snsShareLayerPopup" style="display:none;">
		<div class="inner">
			<div class="cont-Title">
				<span onclick="fn_SnsSareLayerHide();"><img src="/front/skin/pumeiduo/img/btn_close.png" /></span>
			</div>
			<div class="cont-Body">
				<ul class="shareList">
				
				
					<li><span class="shareIcon"><img onclick="shareSinaBlog();" src="/front/skin/pumeiduo/img/share_sina_blog.png" /></span><span class="shareTxt">分享到新浪微博</span></li>
					<li><span class="shareIcon"><img onclick="shareQQBlog();" src="/front/skin/pumeiduo/img/share_qq_blog.png" /></span><span class="shareTxt">分享到腾讯微博</span></li>
					<li><span class="shareIcon"><img onclick="shareDouban();" src="/front/skin/pumeiduo/img/share_douban.png" /></span><span class="shareTxt">分享到腾讯微博</span></li>
					 <li><span class="shareIcon"><img onclick="shareQQZone();" src="/front/skin/pumeiduo/img/share_qq_zone.png" /></span><span class="shareTxt">分享到QQ空间</span></li>  
					 
				</ul>
			</div>
		</div>
	</div>
	<!-- //mainLayerPop -->
	
	
<div id="foo">
	<div id="fo"></div>
</div>
<script>
	var target = document.getElementById('fo');
	spinner = new Spinner(sPopts).spin(target);

	window.onload = function(){
		$('#foo').fadeOut(200);
	}
	
	jQuery( document ).ready(function() {
		$('#foo').fadeOut(200);
	});
</script>

