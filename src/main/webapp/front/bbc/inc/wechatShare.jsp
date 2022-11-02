<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
		$(function(){ 
			  wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
				    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
				    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
				    signature: "${signInfo.signature }",// 必填，签名，见附录1
				    jsApiList: [//分享接口
				       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});  
			  
			  	wx.ready(function(){
			  		
			  		wx.onMenuShareTimeline({
			  		    title: pageTitle, // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: pageTitle, // 分享标题
			  		    desc: shareWeDesc, // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		
			  	});
			  
		});
	</script>	