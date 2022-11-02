<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${userDefinePageData.get(0).PAGE_NM }</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
.image{
	width: 14px;
/* 	padding-top: 2px; */
}
</style>
<script type="text/javascript"> 

//-- Common Page usage Counting
counter({
	 pageTp : 78,				
	 pageId : '${pageId}' || '',
	 goodsId : '' || '',
	 displayId : '' || ''
});

$(function(){
	if(${result.IS_LIKE}==1){
		$('.image').attr('src','/front/webzine/image/icon_zan_blue.png');
	}else{
		$('.image').attr('src','/front/webzine/image/icon_zan.png');
	}
});

function like(){
	var pageId = ${pageId};
	var param={
		pageId : pageId
	};
 	$.ajax({
		data : param,
	   	dataType : "json",
	   	type : "GET",
	   	cache : false,
	   	url : "/marketing/webzine/like.htm", 
	   	contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
	   	success : function(data){
	   		if(data.IS_LIKE == 1){
	   			$('.image').attr('src','/front/webzine/image/icon_zan_blue.png');
	   		}else{
	   			$('.image').attr('src','/front/webzine/image/icon_zan.png');
	   		}
	   		$('.js-linked-count').html(data.LIKE_CNT);
	   	}
 	});
	
}

</script>
</head>
<body>

	<div id="container" class="top">
	    <section id="contents">
			<c:forEach var="item" items="${userDefinePageData }" varStatus="status">  
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
	<c:if test="${sessionSkin.shopId==26}" >
		&nbsp;&nbsp;
		阅读<span class="detail-read-num-span">${result.READ_CNT}</span>
		&nbsp;&nbsp;
		<img alt="" src=""  class="image" onclick="like()">
		<span class="js-linked-count" >${result.LIKE_CNT}</span>
		<br/><br/>
	</c:if>

	<a href="#" class="bottom_totop">top</a>
	
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
	$(function(){
		if("${pageId}" == "10657"  || ${pageId} == 10657){
			wx.config({
			    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
			    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
			    timestamp: '${signInfo.timestamp }', // 必填，生成签名的时间戳
			    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
			    signature: '${signInfo.signature }',// 必填，签名，见附录1
			    jsApiList: [//分享接口
			       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
			        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
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
		  		    title: '吃,住,玩,购,新年大礼包让您愿望成“金”!', // 分享标题
		  		    link: '${shareInfo.link}', // 分享链接
		  		    imgUrl: '${basePath}/front/webzine/image/fenxiang_icon.png', // 分享图标
		  		    success: function () { 
		  		        // 用户确认分享后执行的回调函数
		  		    },
		  		    cancel: function () { 
		  		        // 用户取消分享后执行的回调函数
		  		    } 
		  		});
		  		
		  		//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		  		wx.onMenuShareAppMessage({
		  		    title: '韩华格乐丽雅免税店', // 分享标题
		  		    desc: '吃,住,玩,购,新年大礼包让您愿望成“金”!', // 分享描述
		  		    link: '${shareInfo.link}', // 分享链接
		  		    imgUrl: '${basePath}/front/webzine/image/fenxiang_icon.png', // 分享图标
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
		}
		  
	});
	</script>
	
</body>
</html>
