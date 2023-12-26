<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>Event${label.创建}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="wrap no-footer">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">Event注册</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				<div class="modules">
					<div class="sub-content">
						<div class="list90 bottom-dashed flex">
							<p class="left-part">A${label.队名称}</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="strHmenm" value="" placeholder="${label.请输入A队名称}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">B${label.队名称}</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="strAwynm" value="" placeholder="${label.请输入B队名称}"/>
							</div>
						</div>
						<div class="list90 flex">
							<p class="left-part">Event${label.内容}</p>
							<div class="flex1">
								<input class="right" type="text" name="" id="strEvtcte" value="" placeholder="${label.请输入内容}"/>
							</div>
						</div>
					</div>
				</div>
				<div class="modules">
					<div class="sub-content">
						<div class="file flex">
							<p class="left-part">${label.图片}</p>
							<div class="flex1 right"  onclick="chooseImage();">
								<span>${label.请上传}</span>
								<img class="file-img" id="file-img" src="../img/file.png"/>
								<input type="hidden" id="strPtourl" value=""/>
							</div>
							
						</div>
					</div>
				</div>
				<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit">${label.提交}</button>
				</div>
			</div>
		</div>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
			
	</body>

	<script type="text/javascript">
		$(document).ready(function(){

		 	$(".list90 input[type='radio']").change(function(){
				if ($(":radio[name='strClbgd']").is(':checked')) {
					$(".radio-box").removeClass("checked");
					$(this).parents(".radio-box").addClass("checked");
				}
			});
		 		
			$(".btn-submit").click(function(){
				
	 			var intClbsq= "${intClbsq}";
	 			var strPtourl= $('#strPtourl').val();
	 			var strEvtcte= $('#strEvtcte').val();
	 			var strHmenm= $('#strHmenm').val();
	 			var strAwynm= $('#strAwynm').val();

	 			if (strHmenm == "") {
	 				alert("${label.请输入A队名称}");
	 				return;
	 			}
	 			if (strAwynm == "") {
	 				alert("${label.请输入B队名称}");
	 				return;
	 			}
	 			if (strEvtcte == "") {
	 				alert("${label.请输入内容}");
	 				return;
	 			}
				
				$(".pop-up-wrap").show();
				

	 			loadingShow();
	 			
	 			 $.ajax({
	 			 	 		data:{
	 			 	 			intClbsq : intClbsq
	 			 	 			,strPtourl : strPtourl
	 			 	 			,strEvtcte : strEvtcte
	 			 	 			,strHmenm : strHmenm
	 			 	 			,strAwynm : strAwynm
	 			 	 		},
	 					type : "POST",
	 					url : "/front/bbc/clb/clbEventSave.htm",
	 					success : function(data) {

		     				alert("${label.保存成功了}");
		    				window.location = "/front/bbc/clb/clbEventList.htm?intClbsq="+intClbsq;
			     			
	 					},
	 					error : function(xhr, status, e) {
	 						loadingHide();
	 						alert("Error : " + status);
	 					}
	 				});				
				
			});
			
      });



			
	</script>
	
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

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
    		if(res.localIds.length > 1){
    			alert('您选择了多张图片，将只上传前1张图片!');
    		}
    	}
    	,fail: function(res){
    	}
    	,complete: function(res){
    		uploadImage();
    	}
    	,cancel: function(res){
    	} 
	});
}

//上传接口
function uploadImage(){
	
   if (images.localId.length == 0) {
      //alert('请先选择图片');
      return;
    }  
	
   var i = 0, length = images.localId.length; 
   images.serverId = [];
   
   if(length > 1) {
	   	alert('只上传前1张照片');
	}

	try {
		   images.localId = _.first(images.localId, length);
	}
	catch (e) {
		//alert(e.message);
	}

   
	function upload() {

		var imgId = images.localId.shift();
		
		if(!!imgId){
			wx.uploadImage({
	        	localId: imgId,
	        	success: function (res) {
	        		
	        		loadingShow();
	        		
	 		      	$.ajax({
	 		    		async: false,  
		        	 	data:{
		        	 		shopId: '${appInfo.shopId }',
		        	 		mediaId: res.serverId,
		        	 		fileType: 1,   //1:图片  2：语音
		        	 		date : new Date()
		        	 	},
		 				type : "POST",
		 				url : "/wx/media/download.htm",
		 				timeout : 15000,
		 				success : function(res) {
		 					
		 					loadingHide();
	 					 	if(res.success){
	 							/***************************************************/
	 						 	/********上传之后会返回fileId 后续操作继续***********/
	 						 	/***************************************************/
	 							var fileId = res.data.fileId;
	 							var fullUrl = res.data.fullUrl;
	 							//alert(fullUrl);
		 						$('#strPtourl').val(fullUrl);
		 						$('#file-img').attr('src',fullUrl);
	 							
		 					}//end if
	 					},
		 				error : function(xhr, status, e) {
		 					loadingHide();
		 					alert("error: " + status);
		 				}
	  				});
	 		      	
	        	},
		        fail: function (res) {
		        	loadingHide();
					alert(JSON.stringify(res));
		        }
	      	});
		}
    }
   
   	upload();
}

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
		        		//界面操作
		        		,'closeWindow'				//关闭当前网页窗口接口
		        		,'chooseImage'				//拍照或从手机相册中选图接口
		        		,'uploadImage'				//上传图片接口
		                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
	  	wx.ready(function(){
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
	  	
	  	
	  	wx.error(function(res){
	  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

	  	});
	  
});
</script>	
</html>