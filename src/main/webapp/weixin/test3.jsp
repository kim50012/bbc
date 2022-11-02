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
  
  //判断当前客户端版本是否支持指定JS接口
  function checkJsApi(){
		wx.checkJsApi({
		    jsApiList: [
						//图像接口
						 'chooseImage'				//拍照或从手机相册中选图接口
						,'previewImage'				//预览图片接口
						,'uploadImage'				//上传图片接口
						,'downloadImage'			//下载图片接口
						//界面操作
						,'closeWindow'				//关闭当前网页窗口接口
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
  	
  
  $(function(){
	  
	  wx.config({
		    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: ${signInfo.timestamp }, // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [ //图像接口
		        		 'chooseImage'				//拍照或从手机相册中选图接口
		        		,'previewImage'				//预览图片接口
		        		,'uploadImage'				//上传图片接口
		        		,'downloadImage'			//下载图片接口
		        		//界面操作
		        		,'closeWindow'				//关闭当前网页窗口接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
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
 		 
 		<li class="level1">基础接口
 			<ul>
 				<li><a href="javascript:void(0);" onclick="checkJsApi();">否支持指定JS接口</a></li>
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