<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="关注回复"/></title>  
 <style>
 .file-type-li{
 	float:left;
 	position: relative;
 }
 
 .file-type{
 	width:40px;
	height:37px;
	display:inline-block;
	cursor: pointer;
	background-repeat: no-repeat;
 }
 
  .file-type-li + .file-type-li{
  	margin-left:25px; 
  }
 
 .file-type-text{
	background-image: url("/admin/images/sendMsgAll/text_none.png");
}
 .file-type-text.selected,.file-type-text:hover{
	background-image: url("/admin/images/sendMsgAll/text.png");
}
 .file-type-image{
	background-image: url("/admin/images/sendMsgAll/image_none.png");
}
 .file-type-image.selected,.file-type-image:hover{
	background-image: url("/admin/images/sendMsgAll/image.png");
}
 .file-type-music{
	background-image: url("/admin/images/sendMsgAll/music_none.png");
}
 .file-type-music.selected,.file-type-music:hover{
	background-image: url("/admin/images/sendMsgAll/music.png");
}
 .file-type-vedio{
	background-image: url("/admin/images/sendMsgAll/avi_none.png");
}
 .file-type-vedio.selected, .file-type-vedio:hover{
	background-image: url("/admin/images/sendMsgAll/avi.png");
}
 .file-type-newsfeed{
	background-image: url("/admin/images/sendMsgAll/file_text_none.png");
}

 .file-type-newsfeed.selected, .file-type-newsfeed:hover{ 
	background-image: url("/admin/images/sendMsgAll/file_text.png");
}
</style>
	
<script type="text/javascript">
 
	function saveKeyword(){
		
		var keyWord = '关注'; //关键字
		var sendFileType = ''; //发送类型 （1：文本 2：IMG  3：Music 4：Movie 5：图文）
		var msgTitle = ''; //标题
		var materialFileId = ''; //发送的文件ID （2,3,4）
		var coverPageId = '';// 图文封面图片ID (5)
		var shopGoodsUrl = ''; //图文连接地址 (5)
		var sendMsgBody = '';  // 文本内容(1) 或图文摘要(5)
		
		var fileType = $('.js-file-type.selected').data('fileType');
		
		sendFileType = fileType;
		
		if(fileType == 1){
			msgTitle = $('.js-text-title-msg').val().trim();
			sendMsgBody = $('.js-send-text-contents').val().trim(); //600
			
			if(msgTitle == ''){
				alert('<ui:i18n key="请输入标题"/>');
				return false;
			}
			if(sendMsgBody == ''){
				alert('<ui:i18n key="请填写发送内容"/>');
				return false;
			}
			if(sendMsgBody.length > 600){
				alert('<ui:i18n key="发送内容不能大于{0}字" params1="600" />');
				return false;
			}
			
		}else if(fileType == 2){
			msgTitle = $('.js-image-title-msg').val().trim();
			materialFileId = $('.js-file-type-content-img').data('fileId') || '';
			
			if(msgTitle == ''){
				alert('<ui:i18n key="请输入标题"/>');
				return false;
			}
			
			if(materialFileId == ''){
				alert('<ui:i18n key="请选择要发送的图片文件"/>');
				return false;
			}
			
		}else if(fileType == 3){
			msgTitle = $('.js-music-title-msg').val().trim();
			materialFileId = $('.js-file-type-content-music').data('fileId') || '';
			
			if(msgTitle == ''){
				alert('<ui:i18n key="请输入标题"/>');
				return false;
			}
			
			if(materialFileId == ''){
				alert('<ui:i18n key="请选择要发送的语音文件"/>');
				return false;
			}
		}else if(fileType == 4){
			msgTitle = $('.js-video-title-msg').val().trim();
			materialFileId = $('.js-file-type-content-video').data('fileId') || '';
			
			if(msgTitle == ''){
				alert('<ui:i18n key="请输入标题"/>');
				return false;
			}
			
			if(materialFileId == ''){
				alert('<ui:i18n key="请选择要发送的视频文件"/>');
				return false;
			}
		}else if(fileType == 5){
			msgTitle = $('.js-newsfeed-title-msg').val().trim();
			coverPageId = $('.js-file-type-content-newsfeed').data('fileId') || '';
			sendMsgBody = $('.js-newsfeed-desc').val().trim(); ///120
			shopGoodsUrl = $('.js-newsfeed-link').val().trim();
			
			if(msgTitle == ''){
				alert('<ui:i18n key="请输入标题"/>');
				return false;
			}
			
			if(coverPageId == ''){
				alert('<ui:i18n key="请选择封面图片"/>');
				return false;
			}
			
			if(sendMsgBody == ''){
				alert('<ui:i18n key="请填写摘要内容"/>');
				return false;
			}
			if(sendMsgBody.length > 120){
				alert('<ui:i18n key="摘要内容不能大于{0}字" params1="120" />');
				return false;
			}
			
		}
		
		console.log('keyWord=' + keyWord);
		console.log('sendFileType=' + sendFileType);
		console.log('msgTitle=' + msgTitle);
		console.log('materialFileId=' + materialFileId);
		console.log('coverPageId=' + coverPageId);
		console.log('shopGoodsUrl=' + shopGoodsUrl);
		console.log('sendMsgBody=' + sendMsgBody);
		 
		$.ajax({
			url: '/admin/weixin/reply/saveKeyword.htm',
			type: 'POST',
			data: {
				 messageId : $('#messageId').val()
				,keyWord : keyWord
				,sendFileType : sendFileType
				,msgTitle : msgTitle
				,materialFileId : materialFileId
				,coverPageId : coverPageId
				,shopGoodsUrl : shopGoodsUrl
				,sendMsgBody : sendMsgBody
			},
			success: function(res){ 
				if(res.success) {
					alert('<ui:i18n key="保存成功"/>.');
				} else {
					alert('<ui:i18n key="保存失败"/>\n'  +　res.err_msg);
				}
			},
			error: function(a, msg, c){
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
		
	}
	
	//取消返回列表页面
	function cancel(){
		window.location.href="/admin/weixin/reply/auto.htm";
	}
	 
	$(function(){
		$('.js-file-type').click(function(){
			$('.js-file-type').removeClass('selected');
			$(this).addClass('selected');
			
			var fileType = $(this).data('fileType');
			
			$('.js-file-type-content').each(function(){
				
				if($(this).data('fileType') == fileType) {
					$(this).show();
				}else{
					$(this).hide();
				}
			});
		});
	});
	/////////////////////////////
	
</script>
<%-- 选择图片  --%>
<script type="text/javascript">	
function showPicturePopup(){
	 showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择图片"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=2&max=1&clsoeMethod=closePictureWindow' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
		});	 		
}

//弹出窗口
function choosePicture(obj){
	 console.log('-------parent');
	 //obj为返回的数组 格式 
	 console.log(obj);
	 //这里写自己的逻辑
	 
	 obj = obj || [];
	 if(obj.length > 0){
		 var img  = obj[0];
		 
		 $('.js-file-type-content-img').data('fileId', img.fileId);
		 $('.js-previewd-img').attr('src', img.fileUrl).show();
		 $('.js-previewd-img-name').val(img.fileNm);
	 }
	 closePictureWindow();
	}
//关闭窗口	
function closePictureWindow(){
 	closeBpopupWindow('bpopupPicture');
}	
</script>
<%-- 选择音频  --%>
<script type="text/javascript">
function showMusicPopup(){
	 showIframeBpopupWindow({
			id : 'bpopupMusic',
			title : '<ui:i18n key="选择音频"/>', // 标题 option
			width : 640, 
			height : 462, 
			action : '/admin/master/file/music.htm?fileGroup=2&max=1&conformMethod=chooseMusic&clsoeMethod=closeMusicWindow'  //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
		});	 		
}

//弹出窗口
function chooseMusic(music){
	 console.log('-------parent');
	 //obj为返回的数组 格式 
	 console.log(music);
	 //这里写自己的逻辑
		 
	 $('.js-file-type-content-music').data('fileId', music.fileId);
	 $('.js-previewd-music').show();
	$('.js-previewd-music-name').val(music.fileNm);
 
	 closeMusicWindow();
	}
//关闭窗口	
function closeMusicWindow(){
 	closeBpopupWindow('bpopupMusic');
}
</script>
<%-- 选择视频  --%>
<script type="text/javascript">
function showVideoPopup(){
	 showIframeBpopupWindow({
			id : 'bpopupVideo',
			title : '<ui:i18n key="选择视频"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/video.htm?fileGroup=2&max=1&conformMethod=chooseVideo&clsoeMethod=closeVideoWindow'  //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
		});	 		
}

//弹出窗口
function chooseVideo(obj){
	 console.log('-------chooseVideo');
	 //obj为返回的数组 格式 
	 console.log(obj);
	 //这里写自己的逻辑
	 
	 obj = obj || [];
	 if(obj.length > 0){
		 var item  = obj[0];
		 
		 $('.js-file-type-content-video').data('fileId', item.fileId);
		 $('.js-previewd-video-name').val(item.fileNm);
		 $('.js-previewd-video').html( $('<video src="' + item.fileUrl + '"  width="245" height="145" style="margin-top:0;" controls autobuffer></video>'));
		 
	 }
 
	 closeVideoWindow();
	}
//关闭窗口	
function closeVideoWindow(){
 	closeBpopupWindow('bpopupVideo');
}
</script>
<%-- 选择图文消息图片  --%>
<script type="text/javascript">
function showNewsfeedImagePopup(){
	 showIframeBpopupWindow({
			id : 'bpopupNewsfeedPic',
			title : '<ui:i18n key="选择图片"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/picture.htm?fileGroup=2&max=1&conformMethod=chooseNewsfeedPic&clsoeMethod=closeNewsfeedPicWindow'  
					//参数 fileGroup 必选 1：商品   2：素材    3：Blog
					// max 可选择的图片张数 可选  （不填写时可以选择任意张）
					// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
					// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
	});	 	
	  	
}

//弹出窗口
function chooseNewsfeedPic(obj){
	
	
	console.log('-------chooseNewsfeedPic');
	 //obj为返回的数组 格式 
	 console.log(obj);
	 //这里写自己的逻辑
	 
	 obj = obj || [];
	 if(obj.length > 0){
		 var img  = obj[0];
		 $('.js-file-type-content-newsfeed').data('fileId', img.fileId);
		 $('.js-previewd-newsfeed-img').attr('src', img.fileUrl).show();
	 }
 
	 closeNewsfeedPicWindow();
	}
//关闭窗口	
function closeNewsfeedPicWindow(){
 	closeBpopupWindow('bpopupNewsfeedPic');
}
</script>
<%-- 选择图文消息链接  --%>
<script type="text/javascript">
function showNewsfeedLinkPopup(){
	 showIframeBpopupWindow({
			id : 'bpopupLink',
			title : '<ui:i18n key="选择链接"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/link.htm?conformMethod=chooseLink&clsoeMethod=closeLinkWindow'  
					// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
					// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
	});	 	
}

//弹出窗口
function chooseLink(link){
	console.log('-------chooseLink');
	 //obj为返回的数组 格式 
	 console.log(link);
	 $('.js-newsfeed-link').val(link.url);
 
	 closeLinkWindow();
	}
//关闭窗口	
function closeLinkWindow(){
 	closeBpopupWindow('bpopupLink');
}	
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		
		<c:choose>
			<c:when test="${not empty replyList }">
				<c:set value="${replyList[0] }" var="reply" />
			</c:when>
			<c:otherwise>
				<c:set value="${initMap }" var="reply" />
			</c:otherwise>
		</c:choose>
		
		<form action="">
			<input type="hidden" id="messageId" value="${messageId }" />
		</form>
		
		<div class="form-warp clearfix" >
			<div class="control-warp"  >
				<div class="form-label"  >
		 			<ui:i18n key="发送类型"/><a class="label-required"></a> : 
		 	 	</div>
				<div class="form-control">
					 <div class="clearfix">
					 	<ul>
					 		<li class="file-type-li"><span data-file-type="1" class="js-file-type file-type file-type-text  	<c:if test="${reply.SEND_FILE_TYPE eq 1 }"> selected </c:if>"></span></li>
					 		<li class="file-type-li"><span data-file-type="2" class="js-file-type file-type file-type-image 	<c:if test="${reply.SEND_FILE_TYPE eq 2 }"> selected </c:if>"></span></li>
					 		<li class="file-type-li"><span data-file-type="3" class="js-file-type file-type file-type-music 	<c:if test="${reply.SEND_FILE_TYPE eq 3 }"> selected </c:if>"></span></li>
					 		<li class="file-type-li"><span data-file-type="4" class="js-file-type file-type file-type-vedio 	<c:if test="${reply.SEND_FILE_TYPE eq 4 }"> selected </c:if>"></span></li>
					 		<li class="file-type-li"><span data-file-type="5" class="js-file-type file-type file-type-newsfeed 	<c:if test="${reply.SEND_FILE_TYPE eq 5 }"> selected </c:if>"></span></li>
					 	</ul>
					 </div>
		 	 	</div>
		 	</div>
		 	
 	<c:choose>
	 	<c:when test="${reply.SEND_FILE_TYPE eq 1 }">
 			<div class="js-file-type-content js-file-type-content-text" data-file-type="1" >
	 	</c:when>
 		<c:otherwise>
 			<div class="js-file-type-content js-file-type-content-text" data-file-type="1" style="display: none;" >
 		</c:otherwise>
 	</c:choose> 
		 		<div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" placeholder='<ui:i18n key="请输入标题"/>' class="w51 js-text-title-msg" 
	  			 	 		value="${reply.SEND_FILE_TYPE eq 1 ? reply.MSG_TITLE : ""}"  />
	  			 	 </div>
	  			 </div>
			 	<div class="control-warp"  >
	  			 	 <div class="form-label valign-top"  >
	  			 		<ui:i18n key="发送内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<textarea cols="100" class="w51 js-send-text-contents"   placeholder="<ui:i18n key="请输入要发送的内容"/>" style="height:100px; text-align: left;resize: none;" >${reply.SEND_FILE_TYPE eq 1 ? reply.SEND_MSG_BODY : ""}</textarea>	 
	  			 	 </div>
	  			 </div>
		 	</div>
	<c:choose>
	 	<c:when test="${reply.SEND_FILE_TYPE eq 2 }">
 			<div class="js-file-type-content js-file-type-content-img" data-file-type="2"  data-file-id="${reply.MATERIAL_FILE_ID }">
	 	</c:when>
 		<c:otherwise>
 			<div class="js-file-type-content js-file-type-content-img" data-file-type="2" style="display: none;">
 		</c:otherwise>
 	</c:choose>	 	
		 		<div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" placeholder='<ui:i18n key="请输入标题"/>' class="w51 js-image-title-msg"  
	  			 	 		value="${reply.SEND_FILE_TYPE eq 2 ? reply.MSG_TITLE : ""}"  />
	  			 	 </div>
	  			 </div>
			 	<div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  placeholder='<ui:i18n key="请选择所要发送的图片"/>' class="w51 js-previewd-img-name"  
	  			 	 		style="float: left;" readonly="readonly" value="${reply.SEND_FILE_TYPE eq 2 ? reply.FILE_NM : ""}" />
	  			 	 	<div style="float: left; margin-left: 10px;">
		  			 	 	<span class="button bg-orange js-choose-image" onclick="showPicturePopup();">
								<span class="button-name"><ui:i18n key="选择"/></span>	
							</span>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
			 	<div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 	 	<ui:i18n key="发送内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	 <div  class="w51"  style="height: 130px;background-color: #fcfcfc;  padding: 10px 10px;
   								 border: 1px solid #cccccc; ">
	  			 	 	 	<c:choose>
							 	<c:when test="${reply.SEND_FILE_TYPE eq 2 }">
			  			 	 	 	<img class="js-previewd-img" style="max-height: 130px;" alt="" src="${reply.FILE_URL }">  
							 	</c:when>
						 		<c:otherwise>
			  			 	 	 	<img class="js-previewd-img" style="max-height: 130px; display: none;" alt="" src="">  
						 		</c:otherwise>
						 	</c:choose>	 	
	  			 	 	   
	  			 	 	 </div>
	  			 	 </div>
	  			 </div>
		 	</div>
	<c:choose>
	 	<c:when test="${reply.SEND_FILE_TYPE eq 3 }">
 			<div class="js-file-type-content js-file-type-content-music" data-file-type="3"  data-file-id="${reply.MATERIAL_FILE_ID }">
	 	</c:when>
 		<c:otherwise>
 			<div class="js-file-type-content js-file-type-content-music" data-file-type="3"  style="display: none;">
 		</c:otherwise>
 	</c:choose>		 	
		 		<div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" placeholder='<ui:i18n key="请输入标题"/>' class="w51 js-music-title-msg"  
	  			 	 		value="${reply.SEND_FILE_TYPE eq 3 ? reply.MSG_TITLE : ""}"  />
	  			 	 </div>
	  			 </div>
			 	<div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  placeholder='<ui:i18n key="请选择所要发送的音频"/>' class="w51 js-previewd-music-name"  
	  			 	 		style="float: left;" readonly="readonly"  value="${reply.SEND_FILE_TYPE eq 3 ? reply.FILE_NM : ""}" /> 
	  			 	 	<div style="float: left; margin-left: 10px;">
		  			 	 	<span class="button bg-orange js-choose-image" onclick="showMusicPopup();">
								<span class="button-name"><ui:i18n key="选择"/></span>	
							</span>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 	 	<ui:i18n key="发送内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	 <div  class="w51"  style="height: 100px;background-color: #fcfcfc;  padding: 10px 10px;
   								 border: 1px solid #cccccc; ">
   							<c:choose>
							 	<c:when test="${reply.SEND_FILE_TYPE eq 3 }">
			  			 	 	 	<img class="js-previewd-music" data-file-url=${reply.FILE_URL }" style="height: 80px;  border: 1px solid #eeeeee; 
  									background-color: #ffffff; cursor: pointer;" alt="" src="/admin/images/sendMsgAll/music_play.png">  
							 	</c:when>
						 		<c:otherwise>
			  			 	 	 	<img class="js-previewd-music" style="height: 80px; display: none; border: 1px solid #eeeeee; 
  									background-color: #ffffff; cursor: pointer;" alt="" src="/admin/images/sendMsgAll/music_play.png">  
						 		</c:otherwise>
						 	</c:choose>	 		 
	  			 	 	   
	  			 	 	 </div>
	  			 	 </div>
	  			 </div>
	  			 
		 	</div>
		 	
	<c:choose>
	 	<c:when test="${reply.SEND_FILE_TYPE eq 4 }">
 			<div class="js-file-type-content js-file-type-content-video" data-file-type="4"  data-file-id="${reply.MATERIAL_FILE_ID }">
	 	</c:when>
 		<c:otherwise>
 			<div class="js-file-type-content js-file-type-content-video" data-file-type="4"  style="display: none;">
 		</c:otherwise>
 	</c:choose>			 	
		 		<div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" placeholder='<ui:i18n key="请输入标题"/>' class="w51 js-video-title-msg" 
	  			 	 		value="${reply.SEND_FILE_TYPE eq 4 ? reply.MSG_TITLE : ""}"  />
	  			 	 </div>
	  			 </div>
			 	<div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  placeholder='<ui:i18n key="请选择所要发送的视频"/>' class="w51 js-previewd-video-name"  
	  			 	 		style="float: left;" readonly="readonly"   value="${reply.SEND_FILE_TYPE eq 4 ? reply.FILE_NM : ""}" />
	  			 	 	<div style="float: left; margin-left: 10px;">
		  			 	 	<span class="button bg-orange js-choose-image" onclick="showVideoPopup();">
								<span class="button-name"><ui:i18n key="选择"/></span>	
							</span>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 	 	<ui:i18n key="发送内容"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	 <div  class="w51 js-previewd-video"  style="height: 145px;background-color: #fcfcfc;  padding: 0 10px 10px 10px;border: 1px solid #cccccc; ">
	  			 	 	 	
	  			 	 	 	<c:if test="${reply.SEND_FILE_TYPE eq 4 }">
		  			 	 	 	<video src="${reply.FILE_URL}"  width="245" height="145" style="margin-top:0;" controls autobuffer></video>
						 	</c:if>
	  			 	 	 </div>
	  			 	 </div>
	  			 </div>
		 	</div>
	<c:choose>
	 	<c:when test="${reply.SEND_FILE_TYPE eq 5 }">
 			<div class="js-file-type-content js-file-type-content-newsfeed" data-file-type="5" data-file-id="${reply.COVER_PAGE_ID }">
	 	</c:when>
 		<c:otherwise>
 			<div class="js-file-type-content js-file-type-content-newsfeed" data-file-type="5"  style="display: none;">
 		</c:otherwise>
 	</c:choose>		 	
		 		<div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="标题"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text" placeholder='<ui:i18n key="请输入图文消息标题"/>' class="w51 js-newsfeed-title-msg"
	  			 	 		value="${reply.SEND_FILE_TYPE eq 5 ? reply.MSG_TITLE : ""}"  />
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 		<ui:i18n key="封面"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	 <div  class="w51"  style="float: left;height: 100px;background-color: #fcfcfc;  padding: 10px 10px;
   								 border: 1px solid #cccccc; display: inline-block;">
   								<c:choose>
							 	<c:when test="${reply.SEND_FILE_TYPE eq 5 }">
			  			 	 	 	<img class="js-previewd-newsfeed-img" style="max-height: 100px;" alt="" src="${reply.COVER_PAGE_URL }">  
							 	</c:when>
						 		<c:otherwise>
			  			 	 	 	<img class="js-previewd-newsfeed-img" style="max-height: 100px; display: none;" alt="" src="">  
						 		</c:otherwise>
						 	</c:choose>	  
   								 
	  			 	 	 </div>
	  			 	 	 <div style="float: left; margin-left: 10px;">
		  			 	 	<span class="button bg-orange js-choose-image" onclick="showNewsfeedImagePopup();">
								<span class="button-name"><ui:i18n key="选择"/></span>	
							</span>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label valign-top"  >
	  			 		<ui:i18n key="摘要"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<textarea cols="100" class="w51 js-newsfeed-desc"   placeholder="<ui:i18n key="请输入图文消息摘要"/>" style="height:100px; text-align: left;resize: none;" >${reply.SEND_FILE_TYPE eq 5 ? reply.SEND_MSG_BODY : ""}</textarea>	 
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label valign-top" style="margin-top: 5px;" >
	  			 		<ui:i18n key="原文链接"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input type="text"  placeholder='<ui:i18n key="请直接输入或选择所要发送的图文消息跳转链接"/>' class="w51 js-newsfeed-link"  style="float: left;"
	  			 	 		value="${reply.SEND_FILE_TYPE eq 5 ? reply.SHOP_GOODS_URL : ""}" />
	  			 	 	<div style="float: left; margin-left: 10px;">
		  			 	 	<span class="button bg-orange js-choose-image" onclick="showNewsfeedLinkPopup();">
								<span class="button-name"><ui:i18n key="选择"/></span>	
							</span>
	  			 	 	</div>
	  			 	 </div>
	  			 </div>
		 	</div>
		 	
			 <div class="control-warp" style="padding-left: 250px;margin-top: 20px;" >
			 	<div class="buttons-action">
	 				<span class="button bg-red " onclick="saveKeyword();">
						<span class="button-icon conform"></span>
							<ui:i18n key="保存"/>
					</span>
					<span class="button bg-red  " style="margin-left:30px;" onclick="window.top.closeTab();">
						<span class="button-icon cancel"></span>
							<ui:i18n key="关闭"/>
					</span>
				</div>
		 	</div>
		 	
		</div>
	</div>
	<!-- ▲ container  -->
	
 	<!-- ▼ bpopup area -->
	<ui:template id="bpopupPicture"/>
	
	<ui:template id="bpopupMusic"/>
	
	<ui:template id="bpopupVideo"/>
	
	<ui:template id="bpopupNewsfeedPic"/>
	
	<ui:template id="bpopupLink"/>
	<!-- ▲ bpopup area -->
	
 
	
	 
</body>
</html>