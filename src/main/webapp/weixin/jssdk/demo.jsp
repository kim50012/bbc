<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
  
  <title>微信JS-SDK Demo</title>
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
  <script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  
  <script type="text/javascript">
  function closeWindow(){
	  wx.closeWindow();
  }
  /*************************************************/
  /****************  图像接口  **********************/
  /*************************************************/
  // 图片接口
  //拍照、本地选图
  var images = {
    localId: [],
    serverId: []
  };
  
  //拍照或从手机相册中选图接口
  	function chooseImage(){
	  	wx.chooseImage({
	    	success: function (res) {
	    		images.localId = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	    		alert('已选择 ' + res.localIds.length + ' 张图片');
	    		
	    		for(var i = 0 ; i < res.localIds.length; i++){
	    			log('image localIds[' + i + ']:' + res.localIds[i]);
	    		}
	    		
	    		
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
	   if (images.localId.length == 0) {
	      alert('请先选择图片');
	      return;
	    }  
		
	   var i = 0, length = images.localId.length; 
	   images.serverId = [];
	   
	   function upload() {
	      wx.uploadImage({
	        localId: images.localId[i],
	        success: function (res) {
	          i++;
	          alert('已上传：' + i + '/' + length);
	          images.serverId.push(res.serverId);
	          
	          log('image serverId:' + res.serverId);
	          
	          if (i < length) {
	            upload();
	          }
	        },
	        fail: function (res) {
	          alert(JSON.stringify(res));
	        }
	      });
	    }
	   
	   upload();
	}
    
   
  //语音接口
  var voice = {
    localId: '',
    serverId: ''
  };
  
  	//开始录音接口
  	function startRecord(){
  		wx.startRecord({
  	      cancel: function () {
  	        alert('用户拒绝授权录音');
  	      }
  	    });
    }
  	
  	//停止录音接口
  	function stopRecord(){
  		wx.stopRecord({
  		    success: function (res) {
  		    	 voice.localId = res.localId;
  		    	 
  		    	log('voice localId:' + res.localId);
  		    },
  	      	fail: function (res) {
  	        	alert(JSON.stringify(res));
  	      	}
  		});
    }
  	//播放语音接口
  	function playVoice(){
  		if (voice.localId == '') {
  	      alert('没有录音文件');
  	      return;
  	    }
  	    wx.playVoice({
  	      localId: voice.localId
  	    });
    }
  	
  	//暂停播放接口
  	function pauseVoice(){
  		if (voice.localId != '') {
  			wx.pauseVoice({
  		      localId: voice.localId
  		    });
   	    }
    }
  	
  	// 停止播放音频
  	function stopVoice(){
  		if (voice.localId != '') {
  			wx.stopVoice({
  		      localId: voice.localId
  		    });
   	    }
    }
   	
   
  	function uploadVoice(){
  		if (voice.localId == '') {
  			alert('没有录音文件');
  	      return;
  	    }
  		
  		 
 		wx.uploadVoice({
 			localId: voice.localId, // 需要上传的音频的本地ID，由stopRecord接口获得
 		    isShowProgressTips: 1, // 默认为1，显示进度提示
 		  	success: function (res) {
 		  		alert('上传语音成功，serverId 为' + res.serverId);
 		  	 	voice.serverId = res.serverId; // 返回图片的服务器端ID
 		  	 	
 		  	   log('voice serverId:' + res.serverId);
	  		      /* $.ajax({
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
	   			}); */
 		    }
 		});
  		  
    }
  
  	function log(msg){
		$('#result').append(msg +'<br>');
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
		    debug: false, 							// 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', 			// 必填，公众号的唯一标识
		    timestamp: '${signInfo.timestamp }', 	// 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', 		// 必填，生成签名的随机串
		    signature: '${signInfo.signature }',	// 必填，签名，见附录1
		    jsApiList: [
                //音频接口
        		'startRecord'				//开始录音接口
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
        		//界面操作
        		,'hideOptionMenu'			//隐藏右上角菜单接口
        		,'showOptionMenu'			//显示右上角菜单接口
        		,'hideMenuItems'			//批量隐藏功能按钮接口
        		,'showMenuItems'			//批量显示功能按钮接口
        		,'hideAllNonBaseMenuItem'	//隐藏所有非基础按钮接口
        		,'showAllNonBaseMenuItem' 	//显示所有功能按钮接口
        		,'closeWindow'				//关闭当前网页窗口接口
		    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
	  		//监听录音自动停止接口
	  		wx.onVoiceRecordEnd({
	  		    // 录音时间超过一分钟没有停止的时候会执行 complete 回调
	  		    complete: function (res) {
	  		       voice.localId = res.localId;
	  		       alert('录音时间已超过一分钟');
	  		    }
	  		});
	  		
	  		//监听录音播放停止
	  		wx.onVoicePlayEnd({
	  			complete: function (res) {
	  		      alert('录音（' + res.localId + '）播放结束');
	  		    }
	  		});
	  		
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
  });
  
  </script>
 </head>
 <body>
 	<ul style="margin-top: 10px;margin-left: 5px;">
 		<li class="level1">图像接口
 			<ul> 	
 				<li><a href="javascript:void(0);" onclick="chooseImage();">拍照或从手机相册中选图接口</a></li>
 				<li><a href="javascript:void(0);" onclick="uploadImage();">上传图片接口</a></li>
 			</ul>
 		</li>
 		<li class="level1">音频接口
 			<ul> 		
 				<li><a href="javascript:void(0);" onclick="startRecord();">开始录音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="stopRecord();">停止录音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="playVoice();">播放语音接口</a></li>
 				<li><a href="javascript:void(0);" onclick="pauseVoice();">暂停播放接口</a></li>
 				<li><a href="javascript:void(0);" onclick="stopVoice();">停止播放接口</a></li>
 				<li><a href="javascript:void(0);" onclick="uploadVoice();">上传语音接口</a></li>
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
 		 
 		 <%--  <li class="level1">配置信息
 			<ul> 		
 				 <li>url = ${signInfo.url }</li>
 				<li>jsapi_ticket = ${signInfo.jsapi_ticket }</li>
 				<li>nonceStr = ${signInfo.nonceStr }</li>
 				<li>timestamp = ${signInfo.timestamp }</li>
 				<li>signature = ${signInfo.signature }</li>
 				<li>appid = ${appInfo.appId }</li>   
 			</ul>
 		</li>   --%>
 	  
 		 
 	</ul>
	 
	 <div id="result">
	 
	 </div>

 </body> 
</html>