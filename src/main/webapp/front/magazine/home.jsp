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

function doSearch(){
	location.href='/front/main/list.htm?goodsName='+$.trim($("#title").val());	
}

//-- Common Page usage Counting
counter({
	 pageTp : 1,				//SHOP_MAIN
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});
</script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

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
	  		    title: '${shareInfo.title}', // 分享标题
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
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
	  		    title: '${shareInfo.title}', // 分享标题
	  		    desc: '${shareInfo.desc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
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
	  		
	  		//获取“分享到QQ”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareQQ({
	  			/* title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标 */
	  		    title: '${shareInfo.title}', // 分享标题
	  		    desc: '${shareInfo.desc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		       // 用户确认分享后执行的回调函数
	  		    	// alert('success 2');
	  		    },
	  		    cancel: function () { 
	  		       // 用户取消分享后执行的回调函数
	  		    	//alert('error 2');
	  		    }
	  		});
	  		
	  		//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareWeibo({
	  			/* title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标 */
	  		   title: '${shareInfo.title}', // 分享标题
	  		    desc: '${shareInfo.desc}', // 分享描述
	  		    link: '${shareInfo.link}', // 分享链接
	  		    imgUrl: '${shareInfo.imgUrl}', // 分享图标
	  		    success: function () { 
	  		       // 用户确认分享后执行的回调函数
	  		    	// alert('success 4');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	//alert('error 4');
	  		    }
	  		});
	  		
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
});
</script>
<style>
.frontHomeBanner ul li {padding-left:12.5px; padding-right:12.5px;}
.visualBnr .sliderpage {bottom: 5px;}
.sliderpage .btnPage {width:8px; height:8px; border-radius: 4px;}
.sliderpage .btnPage.on {border: 1px solid #131313;background: #131313;}
.sliderpage .btnPage {border: 1px solid #b9b9b9;background: #ffffff;}
</style>
</head>
<body class="bodyColorSkin5">
<!-- <header class="headerMain"> -->
<!-- 	<div class="searchPmd"> -->
<!-- 		<div class="title"> -->
<!-- 			<input id="title" type="text"/>	 -->
<!-- 		</div> -->
<!-- 		<div class="btnSearch" onClick="doSearch();"></div> -->
<!-- 	</div> -->
<!-- </header> -->


	<div id="container" style="margin-top: 0px;padding-top:0px;">
	

		<section class="visualBnr">
			<div class="sliderList" data-slider="1">
				<ul>
					<c:forEach var="bannerList" items="${bannerList}" varStatus="status">  
						${bannerList.TAG_ADD_TITLE_MGZ }
					 </c:forEach>
				</ul>
			</div>
			<div class="sliderpage" style="display:none;"></div>
<!-- 			<div style="width:100%; height:20px;"></div> -->
		</section>
	
	    <section id="contents">
	
			<div class="magazine-home-container">
				<div class="magazine-home-randList">
					<ul>
						<c:forEach items="${magazineRandomList }" var="list" varStatus="status">
						<li>
							<div class="magazine-home-randItem">
								<div onclick="window.location.href='/front/magazine/magazineDetail.htm?shopId=${list.SHOP_ID}&magazineId=${list.BLOG_ID}';">
									<img src="${list.BLOG_FILE_URL}"/>
								</div>
								<div class="title" >
									&nbsp;${list.BLOG_TITLE }
								</div >
							</div>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<div class="magazine-home-container">
				<div class="magazine-home-randList">
				
				</div>
			</div>
			
			<div class="magazine-home-imgOne">
				<img src="/front/skin/demo/img/magazine/movie.png" />
			</div>	
		</section>
		
	</div>
	<!-- container end-->
	
	<br />
	<br />
	<br />
	<br />
	
	 
<%@ include file="/front/skin/common_navigation.jsp"%>

</body>
</html>
