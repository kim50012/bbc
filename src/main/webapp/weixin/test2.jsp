<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
  
  <title>JSSDK测试</title>
  
  <script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  
  <script type="text/javascript">
/*   function getUrl(){
	  var protocol = location.protocol,
	  port = location.port,
	  hostname = location.hostname,
	  pathname = location.pathname;
	  return protocol + '//' + port + hostname + pathname;
  } */
  
  //判断当前客户端版本是否支持指定JS接口
  function checkJsApi(){
		wx.checkJsApi({
		    jsApiList: [
		                	//分享接口
						 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
						,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
						,'onMenuShareQQ'			//获取“分享到QQ”按钮点击状态及自定义分享内容接口
						,'onMenuShareWeibo'			//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
						//音频接口
						,'startRecord'				//开始录音接口
						,'stopRecord'				//停止录音接口
						,'onVoiceRecordEnd'			//监听录音自动停止接口
						,'playVoice'				//播放语音接口
						,'pauseVoice'				//暂停播放接口
						,'stopVoice'				//停止播放接口
						,'onVoicePlayEnd'			//监听语音播放完毕接口
						,'uploadVoice'				//上传语音接口
						,'downloadVoice'			//下载语音接口
						//图像接口
						,'chooseImage'				//拍照或从手机相册中选图接口
						,'previewImage'				//预览图片接口
						,'uploadImage'				//上传图片接口
						,'downloadImage'			//下载图片接口
						//智能接口
						,'translateVoice'			//识别音频并返回识别结果接口
						//设备信息
						,'getNetworkType'			//获取网络状态接口
						//地理位置
						,'openLocation'				//使用微信内置地图查看位置接口
						,'getLocation'				//获取地理位置接口
						//界面操作
						,'hideOptionMenu'			//隐藏右上角菜单接口
						,'showOptionMenu'			//显示右上角菜单接口
						,'hideMenuItems'			//批量隐藏功能按钮接口
						,'showMenuItems'			//批量显示功能按钮接口
						,'hideAllNonBaseMenuItem'	//隐藏所有非基础按钮接口
						,'showAllNonBaseMenuItem' 	//显示所有功能按钮接口
						,'closeWindow'				//关闭当前网页窗口接口
						//微信扫一扫
						,'scanQRCode'				//调起微信扫一扫接口
						//微信支付
						,'chooseWXPay'				//发起一个微信支付请求
						//微信小店
						,'openProductSpecificView'	//跳转微信商品页接口
						//微信卡券
						,'addCard'					//批量添加卡券接口
						,'chooseCard'				//调起适用于门店的卡券列表并获取用户选择列表
						,'openCard'					//查看微信卡包中的卡券接口
		                ], // 需要检测的JS接口列表，所有JS接口列表见附录2,
		    success: function(res) {
		    }
		        // 以键值对的形式返回，可用的api值true，不可用为false
		        // 如：{"checkResult":{"chooseImage":true},"errMsg":"checkJsApi:ok"}
	   });
	}
  
  function closeWindow(){
	  wx.closeWindow();
  }
  
  
  /*************************************************/
  /****************  图像接口  **********************/
  /*************************************************/
  
  var gLocalIds = '';
  var voiceLocalId = '';
  var voiceServerId = '';
  
  //拍照或从手机相册中选图接口
  	function chooseImage(){
	  	wx.chooseImage({
	    	success: function (res) {
	        	var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	        	gLocalIds = localIds;
	        	for(var i = 0; i < localIds.length; i++){
	        		$('<img>').attr('src', localIds[i])
	        		.css({
	        			'width':'30%',
	        			'height':'auto'
	        		}).appendTo($(document.body));
	        	}
	        	//$(document.body).append(gLocalIds + '<br>');
	        	
	    	}
	    	,fail: function(res){
	    		//alert('fail');
	    	}
	    	,complete: function(res){
	    		//alert('complete');
	    	}
	    	,cancel: function(res){
	    		//alert('cancel');
	    	} 
	    	
		});
	}
  
  function scanQRCode(){
	  
	  wx.scanQRCode({
		    needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
		    scanType: ["qrCode","barCode"], // 可以指定扫二维码还是一维码，默认二者都有
		    success: function (res) {
		    var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
		    alert(result);
		}
		});
  }
  
  	function uploadImage(){
  		if(gLocalIds == ''){
  			return;
  		}  
  		
  		for(var i = 0 ; i < gLocalIds.length ; i++){
  			alert('gLocalIds[i]==' + gLocalIds[i]);
	  		wx.uploadImage({
	  		    localId: gLocalIds[i],    // 需要上传的图片的本地ID，由chooseImage接口获得
	  		    isShowProgressTips: 1, // 默认为1，显示进度提示
	  		    success: function (res) {
	  		        var serverId = res.serverId; // 返回图片的服务器端ID
		  		      $.ajax({
		         	 	data:{
		         	 		key: '${appInfo.sysId }',
		         	 		mediaId: serverId
		         	 	},
		  				type : "POST",
		  				url : "/wx/downloadMedia.htm",
		  				success : function(res) {
		  					 if(res.success){
		  						$(document.body).append('下载下来的图片<br>');
			  					$('<img>').attr('src', res.fileUrl)
				        		.css({
				        			'width':'30%',
				        			'height':'auto'
				        		}).appendTo($(document.body));
		  					 }
		  					 
		  				},
		  				error : function(xhr, status, e) {
		  					alert("error: " + status);
		  				}
		   			});
	  		    }
	  		});
  		}
	}
  	
  	
  	//开始录音接口
  	function startRecord(){
  	  
  		wx.startRecord();
    }
  	
  	//停止录音接口
  	function stopRecord(){
  		wx.stopRecord({
  		    success: function (res) {
  		    	voiceLocalId = res.localId;
  		    }
  		});
    }
  	//播放语音接口
  	function playVoice(){
  		if(voiceLocalId != ''){
	  		wx.playVoice({
	  		    localId: voiceLocalId // 需要播放的音频的本地ID，由stopRecord接口获得
	  		});
  			
  		}else{
  			alert('没有录音文件');
  			
  		}
    }
  	//暂停播放接口
  	function pauseVoice(){
  		if(voiceLocalId != ''){
	  		wx.pauseVoice({
	  		    localId: voiceLocalId // 需要播放的音频的本地ID，由stopRecord接口获得
	  		});
  			
  		}else{
  			alert('没有录音文件');
  			
  		}
    }
  	function stopVoice(){
  		if(voiceLocalId != ''){
	  		wx.stopVoice({
	  		    localId: voiceLocalId // 需要播放的音频的本地ID，由stopRecord接口获得
	  		});
  			
  		}else{
  			alert('没有录音文件');
  			
  		}
    }
   	
   
  	function uploadVoice(){
  		if(voiceLocalId != ''){
	  		wx.uploadVoice({
	  		    localId: voiceLocalId, // 需要上传的音频的本地ID，由stopRecord接口获得
	  		    isShowProgressTips: 1, // 默认为1，显示进度提示
	  		  	success: function (res) {
	  		  		alert('上传微信服务器成功!');
	  		        var serverId = res.serverId; // 返回图片的服务器端ID
		  		      $.ajax({
		         	 	data:{
		         	 		key: '${appInfo.sysId }',
		         	 		mediaId: serverId
		         	 	},
		  				type : "POST",
		  				url : "/wx/downloadMedia.htm",
		  				success : function(res) {
		  					 if(res.success){
		  						alert('上传第三方服务器成功');
		  						 //$(document.body).append('下载的录音文件<br>' +res.fileUrl　);
		  					 }
		  				},
		  				error : function(xhr, status, e) {
		  					alert("error: " + status);
		  				}
		   			});
	  		    }
	  		});
  		}else{
  			alert('没有录音文件');
  			
  		}
    }
  	
  	function getNetworkType(){
  		wx.getNetworkType({
  		    success: function (res) {
  		        var networkType = res.networkType; // 返回网络类型2g，3g，4g，wifi
  		    }
  		});
    }
  	function openLocation(){
  	  
  		wx.openLocation({
  		    latitude: 0, // 纬度，浮点数，范围为90 ~ -90
  		    longitude: 0, // 经度，浮点数，范围为180 ~ -180。
  		    name: '', // 位置名
  		    address: '', // 地址详情说明
  		    scale: 1, // 地图缩放级别,整形值,范围从1~28。默认为最大
  		    infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
  		});
    }
  	function getLocation(){
  	  
  		wx.getLocation({
  		    success: function (res) {
  		        latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
  		        longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
  		        speed = res.speed; // 速度，以米/每秒计
  		        accuracy = res.accuracy; // 位置精度
  		        
	  		     wx.openLocation({
	  	  		    latitude: latitude, // 纬度，浮点数，范围为90 ~ -90
	  	  		    longitude: longitude, // 经度，浮点数，范围为180 ~ -180。
	  	  		    name: '望京', // 位置名
	  	  		    address: '北京市朝阳区望京合生麒麟社', // 地址详情说明
	  	  		    scale: 13, // 地图缩放级别,整形值,范围从1~28。默认为最大
	  	  		    infoUrl: 'http://www.baidu.com' // 在查看位置界面底部显示的超链接,可点击跳转
	  	  		});
  		        
  		    }
  		});
    }
 
  	
  	function hideMenuItems(){
  		wx.hideMenuItems({
  		    menuList: [
				/**** 传播类 *****/         
				'menuItem:share:appMessage'  	/* 发送给朋友 */
				,'menuItem:share:timeline' 		/* 分享到朋友圈 */
				,'menuItem:share:qq' 			/* 分享到QQ */
				,'menuItem:share:weiboApp' 		/* 分享到Weibo */
				,'menuItem:favorite' 			/* 收藏 */
				,'menuItem:share:facebook' 		/* 分享到FB */
				/**** 保护类 *****/      
				,'menuItem:jsDebug' 			/* 调试 */
				,'menuItem:editTag' 			/* 编辑标签 */
				,'menuItem:delete' 				/* 删除 */
				,'menuItem:copyUrl' 			/* 复制链接 */
				,'menuItem:originPage' 			/* 原网页 */
				,'menuItem:readMode' 			/* 阅读模式 */
				,'menuItem:openWithQQBrowser' 	/* 在QQ浏览器中打开 */
				,'menuItem:openWithSafari' 		/* 在Safari中打开 */
				,'menuItem:share:email' 		/* 邮件 */
				,'menuItem:share:brand'     	/* 一些特殊公众号 */   
  		   ] // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
  		});
  	}
  	
  	function showMenuItems(){
  		wx.showMenuItems({
  		    menuList: [
  		         /**** 基本类 *****/      
 				'menuItem:exposeArticle' 		/* 举报  */
  	 			,'menuItem:setFont' 			/* 调整字体 */
				,'menuItem:dayMode' 			/* 日间模式 */
  	 			,'menuItem:nightMode' 			/* 夜间模式 */
  	 			,'menuItem:refresh' 			/* 刷新 */
  	 			,'menuItem:profile' 			/* 查看公众号（已添加） */
  	 			,'menuItem:addContact'  		/* 查看公众号（未添加） */
  	 			/**** 传播类 *****/   
				,'menuItem:share:appMessage'  	/* 发送给朋友 */
				,'menuItem:share:timeline' 		/* 分享到朋友圈 */
				,'menuItem:share:qq' 			/* 分享到QQ */
				,'menuItem:share:weiboApp' 		/* 分享到Weibo */
				,'menuItem:favorite' 			/* 收藏 */
				,'menuItem:share:facebook' 		/* 分享到FB */
				/**** 保护类 *****/      
				,'menuItem:jsDebug' 			/* 调试 */
				,'menuItem:editTag' 			/* 编辑标签 */
				,'menuItem:delete' 				/* 删除 */
				,'menuItem:copyUrl' 			/* 复制链接 */
				,'menuItem:originPage' 			/* 原网页 */
				,'menuItem:readMode' 			/* 阅读模式 */
				,'menuItem:openWithQQBrowser' 	/* 在QQ浏览器中打开 */
				,'menuItem:openWithSafari' 		/* 在Safari中打开 */
				,'menuItem:share:email' 		/* 邮件 */
				,'menuItem:share:brand'     	/* 一些特殊公众号 */   
  		    ] //   要显示的菜单项，所有menu项见附录3
  		});
  	}
  	function hideAllNonBaseMenuItem(){
  		wx.hideAllNonBaseMenuItem();
  		// “基本类”按钮详见附录3
  	}
  	function showAllNonBaseMenuItem(){
  		wx.showAllNonBaseMenuItem();
  		// “基本类”按钮详见附录3
  	}
  	
  
  $(function(){
	  
	  wx.config({
		    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: ${signInfo.timestamp }, // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
		       		 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareQQ'			//获取“分享到QQ”按钮点击状态及自定义分享内容接口
		        		,'onMenuShareWeibo'			//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
		        		//音频接口
		        		,'startRecord'				//开始录音接口
		        		,'stopRecord'				//停止录音接口
		        		,'onVoiceRecordEnd'			//监听录音自动停止接口
		        		,'playVoice'				//播放语音接口
		        		,'pauseVoice'				//暂停播放接口
		        		,'stopVoice'				//停止播放接口
		        		,'onVoicePlayEnd'			//监听语音播放完毕接口
		        		,'uploadVoice'				//上传语音接口
		        		,'downloadVoice'			//下载语音接口
		        		//图像接口
		        		,'chooseImage'				//拍照或从手机相册中选图接口
		        		,'previewImage'				//预览图片接口
		        		,'uploadImage'				//上传图片接口
		        		,'downloadImage'			//下载图片接口
		        		//智能接口
		        		,'translateVoice'			//识别音频并返回识别结果接口
		        		//设备信息
		        		,'getNetworkType'			//获取网络状态接口
		        		//地理位置
		        		,'openLocation'				//使用微信内置地图查看位置接口
		        		,'getLocation'				//获取地理位置接口
		        		//界面操作
		        		,'hideOptionMenu'			//隐藏右上角菜单接口
		        		,'showOptionMenu'			//显示右上角菜单接口
		        		,'hideMenuItems'			//批量隐藏功能按钮接口
		        		,'showMenuItems'			//批量显示功能按钮接口
		        		,'hideAllNonBaseMenuItem'	//隐藏所有非基础按钮接口
		        		,'showAllNonBaseMenuItem' 	//显示所有功能按钮接口
		        		,'closeWindow'				//关闭当前网页窗口接口
		        		//微信扫一扫
		        		,'scanQRCode'				//调起微信扫一扫接口
		        		//微信支付
		        		,'chooseWXPay'				//发起一个微信支付请求
		        		//微信小店
		        		,'openProductSpecificView'	//跳转微信商品页接口
		        		//微信卡券
		        		,'addCard'					//批量添加卡券接口
		        		,'chooseCard'				//调起适用于门店的卡券列表并获取用户选择列表
		        		,'openCard'					//查看微信卡包中的卡券接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		//监听录音自动停止接口
	  		wx.onVoiceRecordEnd({
	  		    // 录音时间超过一分钟没有停止的时候会执行 complete 回调
	  		    complete: function (res) {
	  		    	voiceLocalId = res.localId; 
	  		        alert('录音完成');
	  		    }
	  		});
	  		
	  		//监听语音播放完毕接口
	  		wx.onVoicePlayEnd({
	  		    success: function (res) {
	  		    	voiceLocalId = res.localId; // 返回音频的本地ID
	  		    }
	  		});
	  		
	  		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareTimeline({
	  		    title: '分享标题Test', // 分享标题
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标
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
	  		    title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标
	  		    type: 'music', // 分享类型,music、video或link，不填默认为link
	  		    dataUrl: '${appInfo.url}/uploads/test/1342944231423576861128.mp3', // 如果type是music或video，则要提供数据链接，默认为空
	  		    success: function () { 
	  		        // 用户确认分享后执行的回调函数
	  		        alert('success 11');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	 alert('error 11');
	  		    }
	  		});
	  		
	  		//获取“分享到QQ”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareQQ({
	  			title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标
	  		    success: function () { 
	  		       // 用户确认分享后执行的回调函数
	  		    	 alert('success 2');
	  		    },
	  		    cancel: function () { 
	  		       // 用户取消分享后执行的回调函数
	  		    	alert('error 2');
	  		    }
	  		});
	  		
	  		//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
	  		wx.onMenuShareWeibo({
	  			title: '分享标题', // 分享标题
	  		    desc: '分享描述', // 分享描述
	  		    link: '${appInfo.url}/wx/fenxiangresult.htm', // 分享链接
	  		    imgUrl: '${appInfo.url}/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png', // 分享图标
	  		    success: function () { 
	  		       // 用户确认分享后执行的回调函数
	  		    	 alert('success 4');
	  		    },
	  		    cancel: function () { 
	  		        // 用户取消分享后执行的回调函数
	  		    	alert('error 4');
	  		    }
	  		});
	  		
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
  })
  </script>
  <style type="text/css">
  	* {
  		padding: 0; margin: 0;
  	}
  	
  	.level1{
  		padding-top : 5px;
  		padding-bottom : 5px;
  		margin-top: 5px;
  	}
  	.level1 li{
  		padding-top : 3px;
  		padding-bottom : 3px;
  		padding-left:10px;
  	}
 
	
	a {
	  color: #0088cc;
	  text-decoration: none;
	}
	a:hover,
	a:focus {
	  color: #0088cc;
	   text-decoration: none;
	}
	
	a:VISITED{
	 color: #0088cc;
	}
	a.undev {
	  color: #999;
	  text-decoration: none;
	  cursor: crosshair;
	}
	a.undev:hover,
	a.undev:focus {
	  color: #999;
	   text-decoration: none;
	}
	
	a.undev:VISITED {
	 color: #999;
}
	
  </style>
 </head>
 <body>
 	<ul style="margin-top: 10px;margin-left: 5px;">
 		<!-- <li>接收普通消息
 			<ul>
 				<li><a href="/wx/text.htm">1 文本消息</a></li>
 				<li><a href="/wx/image.htm">2 图片消息</a></li>
				<li><a href="/wx/voice.htm">3 语音消息</a></li>
				<li><a href="/wx/video.htm">4 视频消息</a></li>
				<li><a href="/wx/location.htm">5 地理位置消息</a></li>
				<li><a href="/wx/link.htm">6 链接消息</a></li>
 			</ul>
 		</li>
 		<li>接收事件推送
 			<ul>
 				<li><a href="/wx/subscribe.htm">用户关注事件</a></li>
 				<li><a href="/wx/unsubscribe.htm">用户取消关注事件</a></li>
 				<li><a href="/wx/uploadLocation.htm">上报地理位置事件</a></li>
 			</ul>
 		</li> -->
 		<li class="level1">基础接口
 			<ul>
 				<li><a href="javascript:void(0);" onclick="checkJsApi();">否支持指定JS接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">分享接口
 			<ul> 		
 				<li><a href="javascript:void(0);" onclick="alert('无法调用，是个监听接口');">获取“分享到朋友圈”按钮点击状态及自定义分享内容接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('无法调用，是个监听接口');">获取“分享给朋友”按钮点击状态及自定义分享内容接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('无法调用，是个监听接口');">获取“分享到QQ”按钮点击状态及自定义分享内容接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('无法调用，是个监听接口');">获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">图像接口
 			<ul> 	
 				<li><a href="javascript:void(0);" onclick="chooseImage();">拍照或从手机相册中选图接口</a></li>
 				<li><a href="javascript:void(0);" class="undev" onclick="alert('none');">预览图片接口</a></li>
 				<li><a href="javascript:void(0);" onclick="uploadImage();">上传图片接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('与上传图片接口合并开发');">下载图片接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">音频接口
 			<ul> 		
 				<li><a href="javascript:void(0);" onclick="startRecord();">开始录音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="stopRecord();">停止录音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('无法调用，是个监听接口');">监听录音自动停止接口</a></li>
 				<li><a href="javascript:void(0);" onclick="playVoice();">播放语音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="pauseVoice();">暂停播放接口</a></li>
 				<li><a href="javascript:void(0);" onclick="stopVoice();">停止播放接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('无法调用，是个监听接口');">监听语音播放完毕接口</a></li>
 				<li><a href="javascript:void(0);" onclick="uploadVoice();">上传语音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="alert('与上传语音接口合并开发');">下载语音接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">智能接口
 			<ul>
 				<li><a href="javascript:void(0);" class="undev" onclick="alert('none');">识别音频并返回识别结果接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">设备信息
 			<ul>
 				<li><a href="javascript:void(0);" onclick="getNetworkType();">获取网络状态接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">地理位置
 			<ul>
 				<li><a href="javascript:void(0);" onclick="openLocation();">使用微信内置地图查看位置接口</a></li>
 				<li><a href="javascript:void(0);" onclick="getLocation();">获取地理位置接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">界面操作
 			<ul> 		
 				<li><a href="javascript:void(0);" onclick="wx.hideOptionMenu();">隐藏右上角菜单接口</a></li>
 				<li><a href="javascript:void(0);" onclick="wx.showOptionMenu();">显示右上角菜单接口</a></li>
 				<li><a href="javascript:void(0);" onclick="closeWindow();">关闭</a></li>
 				<li><a href="javascript:void(0);" onclick="hideMenuItems();">批量隐藏功能按钮接口</a></li>
 				<li><a href="javascript:void(0);" onclick="showMenuItems();">批量显示功能按钮接口</a></li>
 				<li><a href="javascript:void(0);" onclick="hideAllNonBaseMenuItem();">隐藏所有非基础按钮接口</a></li>
 				<li><a href="javascript:void(0);" onclick="showAllNonBaseMenuItem();">显示所有功能按钮接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">微信扫一扫
 			<ul> 		
 				<li><a href="javascript:void(0);" onclick="scanQRCode();">调起微信扫一扫接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">微信小店
 			<ul> 
 				<li><a href="javascript:void(0);" class="undev" onclick="alert('none');">跳转微信商品页接口</a></li>		
 			</ul>
 		</li>
 		<li class="level1">微信卡券
 			<ul> 	
 				<li><a href="javascript:void(0);" class="undev" onclick="alert('none');">调起适用于门店的卡券列表并获取用户选择列表</a></li>	
 				<li><a href="javascript:void(0);" class="undev" onclick="alert('none');">批量添加卡券接口</a></li>	
 				<li><a href="javascript:void(0);" class="undev" onclick="alert('none');">查看微信卡包中的卡券接口</a></li>	
 			</ul>
 		</li>
 		<li class="level1">微信支付
 			<ul> 		
 			  <li><a href="javascript:void(0);" class="undev" onclick="alert('none');">发起一个微信支付请求</a></li>
 			</ul>
 		</li>
 		<%-- <li class="level1">配置信息
 			<ul> 		
 				 <li>url = ${signInfo.url }</li>
 				<li>jsapi_ticket = ${signInfo.jsapi_ticket }</li>
 				<li>nonceStr = ${signInfo.nonceStr }</li>
 				<li>timestamp = ${signInfo.timestamp }</li>
 				<li>signature = ${signInfo.signature }</li>
 				<li>appid = ${appInfo.appId }</li>   
 			</ul>
 		</li> --%>
 		 
 	</ul>
	 
	 <div id="result">
	 
	 </div>
	 <%--
	 [	//分享接口
		 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
		,'onMenuShareQQ'			//获取“分享到QQ”按钮点击状态及自定义分享内容接口
		,'onMenuShareWeibo'			//获取“分享到腾讯微博”按钮点击状态及自定义分享内容接口
		//音频接口
		,'startRecord'				//开始录音接口
		,'stopRecord'				//停止录音接口
		,'onVoiceRecordEnd'			//监听录音自动停止接口
		,'playVoice'				//播放语音接口
		,'pauseVoice'				//暂停播放接口
		,'stopVoice'				//停止播放接口
		,'onVoicePlayEnd'			//监听语音播放完毕接口
		,'uploadVoice'				//上传语音接口
		,'downloadVoice'			//下载语音接口
		//图像接口
		,'chooseImage'				//拍照或从手机相册中选图接口
		,'previewImage'				//预览图片接口
		,'uploadImage'				//上传图片接口
		,'downloadImage'			//下载图片接口
		//智能接口
		,'translateVoice'			//识别音频并返回识别结果接口
		//设备信息
		,'getNetworkType'			//获取网络状态接口
		//地理位置
		,'openLocation'				//使用微信内置地图查看位置接口
		,'getLocation'				//获取地理位置接口
		//界面操作
		,'hideOptionMenu'			//隐藏右上角菜单接口
		,'showOptionMenu'			//显示右上角菜单接口
		,'hideMenuItems'			//批量隐藏功能按钮接口
		,'showMenuItems'			//批量显示功能按钮接口
		,'hideAllNonBaseMenuItem'	//隐藏所有非基础按钮接口
		,'showAllNonBaseMenuItem' 	//显示所有功能按钮接口
		,'closeWindow'				//关闭当前网页窗口接口
		//微信扫一扫
		,'scanQRCode'				//调起微信扫一扫接口
		//微信支付
		,'chooseWXPay'				//发起一个微信支付请求
		//微信小店
		,'openProductSpecificView'	//跳转微信商品页接口
		//微信卡券
		,'addCard'					//批量添加卡券接口
		,'chooseCard'				//调起适用于门店的卡券列表并获取用户选择列表
		,'openCard'					//查看微信卡包中的卡券接口
		

]
	  --%>
 </body> 
</html>