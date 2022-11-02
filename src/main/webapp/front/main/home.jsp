<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${sessionScope.sessionSkin.shopName}</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
<c:if test="${sessionScope.sessionSkin.skinTypeShop eq 5 }">
.search-list .page-container>li {border-radius: 0px;}
</c:if>
</style>
<script type="text/javascript">
function doSearch(title,flag){
	if(flag=='class'){
		location.href='/front/main/list.htm?shopGradeClassId='+title;
	}else if(flag=='brand'){
		location.href='/front/main/list.htm?brandId='+title;
	}else{
		location.href='/front/main/list.htm';
	}
}

function doSearch2(){
	location.href='/front/main/reserveSalesList.htm?goodsName='+$.trim($("#title").val());	
}

function doSearch3(){
	location.href='/front/main/list.htm?goodsName='+$.trim($("#title").val());	
}
</script>
<style>
/* body .headerMainHome {margin:0px; padding:0px; background: rgba(221,79,69,0.7)!important; border: 0px;} */
/* body .headerMainHome .searchPmd {position:relative; height:50px; width: 100%;} */
/* body .headerMainHome .searchPmd .title {position:absolute; width:100%; padding: 10px 15px 30px 15px;} */
/* body .headerMainHome .searchPmd .title input[type=text] {width:90%; height: 30px; -webkit-border-radius: 8px;  -moz-border-radius: 8px;border-radius: 8px;background: rgba(255,255,255,0.6)!important;} */
/* body .headerMainHome .searchPmd .btnSearch {position:absolute; width: 30px; height: 30px; top: 10px; right:15px; background:url('/front/skin/demo/img/common/btn_searchr.png') no-repeat; background-size: 100% 100%; opacity:0.8;} */
</style>
</head>
<body class="bodyColorSkin6">
<header class="headerMain">
	<div class="searchPmd">
		<div class="title">
			<input id="title" type="text" value="${label.备注姓名}"/>	
		</div>
		<div class="btnSearch" onClick="doSearch3();"></div>
	</div>
</header>

	<div id="container" style="margin-top: 0px;padding-top: 0px;">

		<section class="visualBnr">
			<div class="sliderList" data-slider="1">
				<ul>
					<c:forEach var="bannerList" items="${bannerList}" varStatus="status">  
						${bannerList.TAG }
					 </c:forEach>
				</ul>
			</div>
			<div class="sliderpage"></div>
		</section>

	    <section id="contents">
			<c:forEach var="item" items="${temp01 }" varStatus="status">  
				<c:if test="${item.HEADER_FLG eq 'Y' }">
					${item.HEADER_TAG}
				</c:if>
				
					${item.BODY_TAG }    
				
				<c:if test="${item.FOOTER_FLG eq 'Y'}">
					${item.FOOTER_TAG}
				</c:if>			
			</c:forEach>			
		</section>
		
	</div>
	<!-- container end-->
	
	<!-- Quick link -->
	<nav class="headerQuickLink">
		<div class="shop_class">
			<div class="inner">
				<h2>商品分类</h2>
				<ul>
					<c:forEach  var="item" items="${classList }" varStatus="status">
						<li onclick="doSearch('${item.SGC_ID }','class')">${item.SGC_NM }</li>
					</c:forEach>
				</ul>
				<h2>品牌</h2>
				<ul>
					<c:forEach  var="item" items="${brandList }" varStatus="status">
						<li onclick="doSearch('${item.BRAND_ID }','brand')">${item.BRAND_NM }</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div style="height: 150px;"></div >
	</nav>
	<br />
	<br />
	<br />
	<br />
	
 <%@ include file="/front/skin/common_bottom.jsp"%> 

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">


//-- Common Page usage Counting
counter({
	 pageTp : 1,				//SHOP_MAIN
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

$(function(){ 
	
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: ${signInfo.timestamp }, // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
		       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareQQ'			//获取“分享到QQ”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareWeibo'			//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
		        		//界面操作
		        		,'closeWindow'				//关闭当前网页窗口接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		
	  		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareTimeline({
	  		    /* title: '分享标题Test', // 分享标题
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标 */
	  		    title: '${sessionScope.sessionSkin.shopName}', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${appInfo.url}${sessionScope.sessionSkin.shopLogoImgUrl}', // 分享图标
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    }
	  		});
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		/* wx.onMenuShareAppMessage({
	  		    title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标
	  		    type: 'link', // 分享类型,music、video或link，不填默认为link
	  		    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		        alert('success');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	 alert('error');
	  		    }
	  		}); */
	  		
	  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareAppMessage({
	  		    title: '${sessionScope.sessionSkin.shopName}', // 分享标题
	  		    desc: '${sessionScope.sessionSkin.shopName}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${appInfo.url}${sessionScope.sessionSkin.shopLogoImgUrl}', // 分享图标
	  		    /* title: '媒体发布会邀请函', // 分享标题
	  		    desc: '薄艺硬屏/薄艺（Art Slim）电视媒体发布会 2015.4.15 北京', // 分享描述
	  		    link: '${appInfo.url}/front/brand/lgdisplay150330/invitation.html', // 分享链接
	  		    imgUrl: '${appInfo.url}/front/brand/lgdisplay150330/pic300.jpg', // 分享图标 */
	  		    //type: 'music', // 分享类型,music、video或link，不填默认为link
	  		    //dataUrl: '${appInfo.url}/uploads/test/1342944231423576861128.mp3', // 如果type是music或video，则要提供数据链接，默认为空
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		       // alert('success 11');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	// alert('error 11');
	  		    }
	  		});
	  		
	  		
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
});
</script>

	<!-- //container -->
<!-- 	<div class="bottom_fixed length2"> -->
<!-- 		<a href="/front/customer/myPage.htm"> -->
<!-- 			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image"> -->
<!-- 			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image"> -->
<!-- 		</a> -->
<!-- 		<a href="/front/customer/myPage.htm"> -->
<!-- 			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image"> -->
<!-- 		</a> -->
<!-- 	</div> -->
<!-- 	<a href="#" class="bottom_totop">top</a> -->
	
</body>
</html>
