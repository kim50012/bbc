<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="图文消息"/></title>  
<style type="text/css">
 .result-grid-table{
 	width:100%;
 	color:#5f5f5f;
 	font-size:12px;
 	margin-top:30px;
 }
 .result-grid-table thead tr td{
 	vertical-align: top;
 }
  .result-grid-table thead tr td a{
  	color:#5f5f5f;
  }
  .result-grid-table thead tr td a img{
  	margin-right:10px;
  	margin-top:-2px;
  	margin-left:15px;
  }
  /* .popover.fade.bottom.in{
  		max-width:400px;
  		width:390px;
  } */
  .popover-content {
	  /* padding: 9px 14px; */
	  padding: 15px 10px 17px 10px;
	}
	.query-div-title{
		display:inline-block;
		font-size:12px;
		vertical-align: top;
	}
	.li-sp{
		display:inline-block;
		margin-right:10px;
	}
	.query-div-title a img {
	  margin-bottom: 2px;
	}
	.imgFile{
		margin-left:15px;
		margin-right:13px;
		width:40px;
		height:37px;
		display:inline-block;
		cursor: pointer;
		background-repeat: no-repeat;
	}
	.imgFile.text.publish{
		background-image: url("/admin/images/sendMsgAll/text.png");
	}
	.imgFile.text.none{
		background-image: url("/admin/images/sendMsgAll/text_none.png");
	}
	.imgFile.image.publish{
		background-image: url("/admin/images/sendMsgAll/image.png");
	}
	.imgFile.image.none{
		background-image: url("/admin/images/sendMsgAll/image_none.png");
	}
	.imgFile.music.publish{
		background-image: url("/admin/images/sendMsgAll/music.png");
	}
	.imgFile.music.none{
		background-image: url("/admin/images/sendMsgAll/music_none.png");
	}
	.imgFile.avi.publish{
		background-image: url("/admin/images/sendMsgAll/avi.png");
	}
	.imgFile.avi.none{
		background-image: url("/admin/images/sendMsgAll/avi_none.png");
	}
	.imgFile.file_text.publish{
		background-image: url("/admin/images/sendMsgAll/file_text.png");
	}
	.imgFile.file_text.none{
		background-image: url("/admin/images/sendMsgAll/file_text_none.png");
	}
	 .file_type_td .imgFile{
		margin-left:15px;
		margin-right:13px;
		width:40px;
		height:37px;
		display:inline-block;
		cursor: pointer;
		background-repeat: no-repeat;
	}
	.imgFile.text.publish{
		background-image: url("/admin/images/sendMsgAll/text.png");
	}
	.imgFile.text.none{
		background-image: url("/admin/images/sendMsgAll/text_none.png");
	}
	.imgFile.image.publish{
		background-image: url("/admin/images/sendMsgAll/image.png");
	}
	.imgFile.image.none{
		background-image: url("/admin/images/sendMsgAll/image_none.png");
	}
	.imgFile.music.publish{
		background-image: url("/admin/images/sendMsgAll/music.png");
	}
	.imgFile.music.none{
		background-image: url("/admin/images/sendMsgAll/music_none.png");
	}
	.imgFile.avi.publish{
		background-image: url("/admin/images/sendMsgAll/avi.png");
	}
	.imgFile.avi.none{
		background-image: url("/admin/images/sendMsgAll/avi_none.png");
	}
	.imgFile.file_text.publish{
		background-image: url("/admin/images/sendMsgAll/file_text.png");
	}
	.imgFile.file_text.none{
		background-image: url("/admin/images/sendMsgAll/file_text_none.png");
	}
	.file_type_div .link_div,.cover_page_div{
		height:30px;
		width:100%;
		margin-top:10px;
		display: none;
	}
	.file_type_div .title_head,.link_head,.cover_page_head{
		width:121px;
		display: inline-block;
		vertical-align: top;
	}
	.file_type_div .headSpan{
		margin-left:20px;
		display: inline-block;
		margin-top:5px;
	}
	.file_type_div .title_div{
		height:30px;
		width:100%;
		margin-top:10px;
	}
	.file_type_div .title_body,.link_body,.cover_page_body{
		display: inline-block;
	}
	.file_type_div input{
		width:620px;
	}
	.file_type_div  .selectDiv{
		position:absolute;
		width:70px;
		height:30px;
		border-radius:2px;
		display:inline-block;
		margin-left:20px;
		background-color:#fb6e52;
		color:#ffffff; 
		line-height:30px;
		text-align: center;
		cursor: pointer;
	}
	.foot_div{
		margin-top:15px;
	}
	.foot_div .send_msg_div{
		width:100%;
		height:175px;
	}
	.foot_div .send_msg_div span{
		display: inline-block;
		margin-left:20px;
		margin-top:5px;
	}
	.foot_div .send_msg_div div{
		display: inline-block;
		vertical-align: top;
	}
	.foot_div .send_msg_body {
		position: relative;
	}
	.foot_div .send_msg_body textarea{
		width:630px;
		height:150px;
		padding:0;
		font-size:14px;
		padding-left:10px;
	}
	.foot_div .send_msg_body div{
		width:370px;
		height:130px;
		position: absolute;
		display: inline-block;
		margin-top:10px;
		margin-left:10px;
		display:none;
	}
	.foot_div .send_msg_body div .music_display{
		background-image: url('/admin/images/sendMsgAll/music_play.png');
		width:60px;
		height:60px;
		border:1px solid #eeeeee;
		display: inline-block;
		cursor: pointer;
		background-color: #ffffff;
	}
	.foot_div .send_msg_body div  video{
		width:370px;
		height:130px;
		border:1px solid #eeeeee;
	}
	.foot_div .send_msg_body div .img_show_img{
		max-height: 130px;
		max-width: 370px;
	}
	.file_select_div div{
		display: inline-block;
	}
	.file_select_div{
		margin-top:10px;
		margin-bottom:0px;
		height:30px;
		display:none;
		width:100%;
	}
	.submit-div{
		width:100%;
		text-align: center;
	}
	#goods-tag-add{margin-left:0;}
	.show-cust-select{
		min-height:30px;
		width:580px;
		border:1px solid #e5e5e5;
		display: inline-block;
		margin-top:20px;
		border-radius:2px;
	}
	.result-grid-thead .selectDiv{
		position:absolute;
		width:70px;
		height:30px;
		border-radius:2px;
		display:inline-block;
		margin-left:20px;
		background-color: #fb6e52;
		color:#ffffff; 
		line-height:30px;
		text-align: center;
		cursor: pointer;
		margin-top:20px;
	}
	.show-cust-select li{
		float:left;
		border:1px solid #eeeeee;
		height:24px;
		margin-top:2px;
		margin-bottom:2px;
		line-height: 25px;
		border-radius:4px;
		width:77px;
		margin-left:3px;
		position: relative;
	}
	.show-cust-select li span{
		width:77px;
		display: inline-block;
		white-space: nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	.show-cust-select li a{
		 position: absolute;
		cursor: pointer;
		top:-3px;
		right:-3px;
		border:1px solid #eeeeee; 
		height:10px;
		width:10px;
		border-radius:5px;
		font-size:8px;
		color:#333333;
		line-height: 8px;
		text-align: center;
	}
	.delete-flag.show-delete{
		background-color: #07d;
		color:#ffffff;
	}
	.must-input{
		color:#d1120d;
	}
</style> 
 
<script type="text/javascript">
//判断标志
var flag_music = true;
var audio = document.createElement('audio');

	$(function(){
		var fileTypeFlag = $('#sendFileType').val();
		if(fileTypeFlag == '图片'){
			$('.imgFile.image').removeClass('none').addClass('publish');
			$('.imgFile.text').removeClass('publish').addClass('none');
			$('#sendMsg').val('').attr('readonly','readonly');
			$('.link_div').attr('style','display:none');
			//$('.title_div').attr('style','display:none');
			$('.cover_page_div').attr('style','display:none');
			$('.file_select_div').attr('style','display:inline-block');
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectImg.htm?fileGroup=2');
			$('.send_file_show').attr('style','display:inline-block;');
			$('#sendFileType').val('2');
		}else if(fileTypeFlag == '素材'){
			$('.imgFile.text').removeClass('publish').addClass('none');
			$('.imgFile.file_text').removeClass('none').addClass('publish');
			$('#sendMsg').attr('readonly',false);
			$('.title_div').attr('style','display:inline-block');
			$('.cover_page_div').attr('style','display:inline-block');
			$('.link_div').attr('style','display:inline-block');
			$('.file_select_div').attr('style','display:none');
			$('#sendFileType').val('5');
		}else if(fileTypeFlag == '音频'){
			$('.imgFile.music').removeClass('none').addClass('publish');
			$('.imgFile.text').removeClass('publish').addClass('none');
			$('#sendMsg').val('').attr('readonly','readonly');
			$('.link_div').attr('style','display:none');
			//$('.title_div').attr('style','display:none');
			$('.cover_page_div').attr('style','display:none');
			$('.file_select_div').attr('style','display:inline-block');
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectMusic.htm?fileGroup=2');
			$('#sendFileType').val('3');
			$('.send_file_show').attr('style','display:inline-block;');
		}else if(fileTypeFlag == '视频'){
			$('.imgFile.avi').removeClass('none').addClass('publish');
			$('.imgFile.text').removeClass('publish').addClass('none');
			$('#sendMsg').val('').attr('readonly','readonly');
			$('.link_div').attr('style','display:none');
			//$('.title_div').attr('style','display:none');
			$('.cover_page_div').attr('style','display:none');
			$('.file_select_div').attr('style','display:inline-block');
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectAvi.htm?fileGroup=2');
			$('#sendFileType').val('4');
			$('.send_file_show').attr('style','display:inline-block;');
		}else{
			$('#sendFileType').val('1');
		}
		
		//选择上传文件的类型
		$('.imgFile').click(function(){
			var $this = $(this);
			$('.imgFile.image').removeClass('publish').addClass('none');
			$('.imgFile.avi').removeClass('publish').addClass('none');
			$('.imgFile.music').removeClass('publish').addClass('none');
			$('.imgFile.text').removeClass('publish').addClass('none');
			$('.imgFile.file_text').removeClass('publish').addClass('none');
			$this.removeClass('none').addClass('publish');
			var item = $this.data('item');
			if(item == 1){
				$('#sendMsg').val('').attr('readonly',false);
				$('.link_div').attr('style','display:none');
				//$('.title_div').attr('style','display:none');
				$('.cover_page_div').attr('style','display:none');
				$('.file_select_div').attr('style','display:none');
				$('.send_file_show').attr('style','display:none;');
				$('.send_file_show').children().remove();
				if(!flag_music){
					audio.pause();
				}
			}else if(item == '2' || item == '3' || item == '4'){
				$('#sendMsg').val('').attr('readonly','readonly');
				$('.link_div').attr('style','display:none');
				//$('.title_div').attr('style','display:none');
				$('.cover_page_div').attr('style','display:none');
				$('.file_select_div').attr('style','display:inline-block');
				if(item == '2'){
					$('#fileSelect').attr('placeholder','<ui:i18n key="请选择所要发送的图片"/>');
					$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectImg.htm?fileGroup=2');
					$('.bpopupTitle.js-title').text('<ui:i18n key="选择图片"/>');
					if(($('#sendFileType').val()) != '2'){
						$('.send_file_show').children().remove();
						$('.send_file_show').attr('style','display:none;');
						$('#fileSelect').val('');
					}
				}else if(item == '3'){
					$('#fileSelect').attr('placeholder','<ui:i18n key="请选择所要发送的音频"/>');
					$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectMusic.htm?fileGroup=2');
					$('.bpopupTitle.js-title').text('<ui:i18n key="选择音频"/>');
					if(($('#sendFileType').val()) != '3'){
						$('.send_file_show').children().remove();
						$('.send_file_show').attr('style','display:none;');
						$('#fileSelect').val('');
					}
					if(!flag_music){
						audio.pause();
					}
				}else if(item == '4'){
					$('#fileSelect').attr('placeholder','<ui:i18n key="请选择所要发送的视频"/>');
					$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectAvi.htm?fileGroup=2');
					$('.bpopupTitle.js-title').text('<ui:i18n key="选择视频"/>');
					if(($('#sendFileType').val()) != '4'){
						$('.send_file_show').children().remove();
						$('.send_file_show').attr('style','display:none;');
						$('#fileSelect').val('');
					}
					if(!flag_music){
						audio.pause();
					}
				}
			}else if(item == '5'){
				$('#sendMsg').val('').attr('readonly',false);
				$('.title_div').attr('style','display:inline-block');
				$('.cover_page_div').attr('style','display:inline-block');
				$('.link_div').attr('style','display:inline-block');
				$('.file_select_div').attr('style','display:none');
				$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectImg.htm?fileGroup=2');
				$('.bpopupTitle.js-title').text('<ui:i18n key="选择图片"/>');
				$('.send_file_show').children().remove();
				$('.send_file_show').attr('style','display:none;');
				if(!flag_music){
					audio.pause();
				}
			}
			$('#sendFileType').val(item);
		});	
		 
		//详细信息框的关闭
		$('.bpopupColseWarp').click(function(){
			closeBpopupWindow('bpoupMessage');
		});
		
	});
	//自动回复信息的保存
	function confirm(){
		var jobType = '';
		var messageId = '${requestScope.map.MESSAGE_ID}';
		jobType = 'U';
		//存储选择的客户等级
		var gradeId = '';
		//存储顾客的ID
		var custSysId = '';
		//判断发送文件，素材类型等标志
		var sendFileType = $('#sendFileType').val();
		//存储发送的文件ID
		var materialFileId = '';//$('#fileId').val();
		//存储封面图片ID
		var coverPageId = '';
		//存储店铺素材连接地址
		var shopGoodsUrl = '';
		//存储发送的内容
		var sendMsgBody = '';
		//存储发送标题
		var msgTitle = $('#titleMsg').val();
		//判断发送文件，素材类型等标志
		var sendFileType  =  $('#sendFileType').val();
		//存储发送的文件ID
		var materialFileId = '';//$('#fileId').val();
		//存储封面图片ID
		var coverPageId = '';
		//存储店铺素材连接地址
		var shopGoodsUrl = '';
		//存储发送的内容
		var sendMsgBody = '';
		//存储发送标题
		var msgTitle = $('#titleMsg').val();
		if(msgTitle == ''){
			alert('<ui:i18n key="请输入标题"/>');
			return;
		}
		if(sendFileType == 1){
			sendMsgBody = $('#sendMsg').val();
			if(sendMsgBody == ''){
				alert('<ui:i18n key="请填写发送内容"/>');
				return;
			}
		}else if(sendFileType == 2 || sendFileType == 3 || sendFileType == 4){
			materialFileId = $('#fileId').val();
			if(materialFileId == ''){
				alert('<ui:i18n key="请选择要发送的文件"/>');
				return;
			}
		}else if(sendFileType == 5){
			coverPageId = $('#coverPageId').val();
			sendMsgBody = $('#sendMsg').val();
			shopGoodsUrl = $('#shopGoodsUrl').val();
			if(shopGoodsUrl == ''){
				alert('<ui:i18n key="请选择或者书写素材地址"/>');
				return;
			}
			if(coverPageId == ''){
				alert('<ui:i18n key="请选择封面"/>');
				return;
			}
			if(sendMsgBody == ''){
				alert('<ui:i18n key="请填写发送内容"/>');
				return;
			}
			
		}
		//存储发送方式 
		var sendType = 1;
		var param = {
				sendFileType : sendFileType,
				materialFileId : materialFileId,
				coverPageId : coverPageId,
				shopGoodsUrl : shopGoodsUrl,
				sendMsgBody : sendMsgBody,
				msgTitle : msgTitle,
				jobType : jobType,
				messageId : messageId,
				gradeId : gradeId,
				custSysId : custSysId,
				sendType : sendType
		};
		$.ajax({
			data : param,
			url : "/admin/msgControl/saveMsgControl.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result == 'success'){
					alert('<ui:i18n key="操作成功"/>');
					window.location.href = '/admin/msgControl/msgControl.htm';
				}else if(data.result == 'fail'){
					alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');
				}
			},
			error : function(a, msg, c) {
				alert("error: " + msg);
			}
		});
		
	}
	//取消返回列表页面
	function cancel(){
		window.location.href = '/admin/msgControl/msgControl.htm';
	}
	
	//音乐播放
	function musicPlay(){
		if(flag_music){	
			audio.src = $('#musicFullUrl').val();
			audio.play();
			flag_music = false;
		}else{
			audio.pause();
			flag_music = true;
		}
	}
	
	//弹出框
	function bpoupAviMusicImgDiv(id){
		//判断发送文件，素材类型等标志
		var sendFileType = $('#sendFileType').val();
		if(sendFileType == '2'){
			$('.bpopupTitle.js-title').text('<ui:i18n key="选择图片"/>');
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectImg.htm?fileGroup=2');
		}else if(sendFileType == '3'){
			$('.bpopupTitle.js-title').text('<ui:i18n key="选择音频"/>');
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectMusic.htm?fileGroup=2');
		}else if(sendFileType == '4'){
			$('.bpopupTitle.js-title').text('<ui:i18n key="选择视频"/>');
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectAvi.htm?fileGroup=2');
		} 
		if(id == '1'){
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectMaterial.htm?fileGroup=2');
			$('.bpopupTitle.js-title').text('<ui:i18n key="选择链接"/>');
		}else if(id == '2'){
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectImg.htm?fileGroup=2');
			$('.bpopupTitle.js-title').text('<ui:i18n key="选择图片"/>');
		}
		var selectFlag = $('.bpopupTitle.js-title').text();
		var height = 500;
		if(selectFlag == '<ui:i18n key="选择图片"/>'){
			height = 540;
		}
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 830,
			height : height,
			action : $('#iframe_avi_music_image').attr('src')
		});
	}
	//关闭弹出框的操作
	function closeDiv(id,name,url){
		$('#fileId').val(id);
		$('#fileSelect').val(name);
		closebpoupMe();
		var type=$('#sendFileType').val();
		if(type == '2'){
			$('.send_file_show').children().remove();
			$('.send_file_show').attr('style','display:inline-block;');
			$('.send_file_show').append("<img class='img_show_img'  alt='' src='"+url+"'/>");
		}else if(type == '3'){
			$('.send_file_show').children().remove();
			$('.send_file_show').attr('style','display:inline-block;').append("<div class='music_display' onclick='musicPlay();'><input type='hidden' value='"+url
									+"' id='musicFullUrl'/></div>");
		}else if(type == '4'){
			$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectAvi.htm?fileGroup=2');
			$('.send_file_show').children().remove();
			$('.send_file_show').attr('style','display:inline-block;').append('<video id="videoShowNow" src="'+url+'"   controls="controls"   ></video>');
		}else if(type == '5'){
			$('#coverPageName').val(name);
			$('#coverPageId').val(id);
		}
	}
	//关闭弹出框的操作
	function closeDivMaterial(url){
		$('#shopGoodsUrl').val(url);
		closebpoupMe();
	}
	//关闭弹出框的操作
	function closebpoupMe(){
		closeBpopupWindow('bpoupMessage');
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<table class="result-grid-table" >
      		 <tbody class="result-grid-tbody">
      		 	 <tr><td style="height:1px;width:20px;"></td><td style="height:1px;width:93px;"></td><td style="height:1px;"></td></tr>
      		 	 <tr>
      		 	 	<td></td>
      		 	 	<td><ui:i18n key="发送类型"/><span class="must-input">*</span>：</td>
      		 	 	<td>
      		 	 		<span data-item='1' class="imgFile text publish"></span>
						<span data-item='2' class="imgFile image none"></span>
						<span data-item='3' class="imgFile music none"></span>
						<span data-item='4' class="imgFile avi none"></span>
						<span data-item='5' class="imgFile file_text none"></span>
						<input type="hidden" id="sendFileType" value="${requestScope.map.SEND_FILE_TYPE }" />
      		 	 	</td>
      		 	 </tr>
      		 </tbody>
		</table>
		 <div style="width:100%;height:5px;"></div>
			<div class="file_type_div">
				<div class="title_div">
					<div class="title_head">
						<span class="headSpan"><ui:i18n key="标题"/><span class="must-input">*</span>：</span>
					</div>
					<div class="title_body">
						<input type="text" value="${requestScope.map.MSG_TITLE }" id="titleMsg" placeholder='<ui:i18n key="请输入标题"/>' />
					</div>
				</div>
				<div class="link_div">
					<div class="link_head">
						<span class="headSpan"><ui:i18n key="链接到"/><span class="must-input">*</span>：</span>
					</div>
					<div class="link_body">
						<input type="text" id="shopGoodsUrl" value="${requestScope.map.SHOP_GOODS_URL }" placeholder='<ui:i18n key="请直接输入或选择所要发送的素材链接"/>'/>
					</div>
					<div class="selectDiv" onclick="bpoupAviMusicImgDiv('1');">
						<span><ui:i18n key="选择"/></span>
					</div>
				</div>
				<div class="cover_page_div">
					<div class="cover_page_head">
						<span class="headSpan"><ui:i18n key="封面"/><span class="must-input">*</span>：</span>
					</div>
					<div class="cover_page_body">
						<input type="text" value="${requestScope.map.COVER_PAGE_NM }" id="coverPageName" placeholder="<ui:i18n key="请选择封面"/>" readonly="readonly"/>
						<input type="hidden" value="${requestScope.map.COVER_PAGE_ID }" id="coverPageId"/>
					</div>
					<div class="selectDiv" onclick="bpoupAviMusicImgDiv('2');">
							<span><ui:i18n key="选择"/></span>
					</div>
				</div>
				<div class="file_select_div">
					<div class="cover_page_head">
					</div>
					<div >
						<input type="text" value="${requestScope.map.FILE_NM }" id="fileSelect" placeholder='<ui:i18n key="请选择所要发送的图片"/>' readonly="readonly"/>
						<input type="hidden" value="${requestScope.map.MATERIAL_FILE_ID }" id="fileId"/>
					</div>
					<div class="selectDiv" onclick="bpoupAviMusicImgDiv('0');">
						<span><ui:i18n key="选择"/></span>
					</div>
				</div>
			</div>
			<div class="foot_div">
				<div class="send_msg_div" >
					<div class="send_msg_head" style="width:121px;">
						<span><ui:i18n key="发送内容"/><span style="margin-left:0;" class="must-input">*</span>：</span>
					</div>
					<div class="send_msg_body">
						<div class="send_file_show">
							<c:if test="${requestScope.map.SEND_FILE_TYPE == '图片'}">
								<img class='img_show_img'  alt='' src='${requestScope.map.FILE_URL}'/>
							</c:if>
							<c:if test="${requestScope.map.SEND_FILE_TYPE == '音频'}">
								<div class='music_display' onclick='musicPlay();'>
									<input type='hidden' value='${requestScope.map.FILE_URL}' id='musicFullUrl'/>
								</div>
							</c:if>
							<c:if test="${requestScope.map.SEND_FILE_TYPE == '视频'}">
								<video id="videoShowNow" src="${requestScope.map.FILE_URL}"   controls="controls"   ></video>
							</c:if>
						</div>
						<textarea wrap="hard" rows="4" cols="50"  id="sendMsg">${requestScope.map.SEND_MSG_BODY }</textarea>
					</div>
				</div>
			</div>
		</div>
		
		<div class="submit-div">
			<div class="buttons-action">
 				<span class="button bg-red js-trans-order-confirm" onclick="confirm();">
					<span class="button-icon conform"></span>
						<ui:i18n key="保存"/>
				</span>
				<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
					<span class="button-icon cancel"></span>
						<ui:i18n key="取消"/>
				</span>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
	
	<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpoupMessage" >
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="详情信息"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_avi_music_image"  style="overflow: hidden;" src=""></iframe>
		 		 </div>
		 	</div>
		</div>
	<!-- ▲ bpopup area -->
	
</body>
</html>