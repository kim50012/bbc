<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>

<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="大韩韩空"/></title>  
<script type="text/javascript" src="/admin/master/file/ZeroClipboard.js"></script>
<style type="text/css">
 .query-from{font-size:12px;}
 .dateSelect input {
	width: 95px;
	background-image: url("/admin/images/myFile/calendar.png");
	background-repeat: no-repeat;
	background-position: 90% 50%;
	cursor: pointer;
}

.dateSelect .connectSpan {
	color: #b1263b;
	font-size: 20px;
}
.PoupDiv{
 	display:none; 
 	width:590px;
 	height:70px;
 	border:1px solid #c5c5c5;
 	position:absolute;
 	background-color: #fff;
 	z-index:30;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
	left: -523px;
    top: -5px;
}
 .PoupDivConnect{
 	width:530px;
 	height:70px;
 	border:1px solid #c5c5c5;
 	position:absolute;
 	background-color: #fff;
 	display:none;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
	left: -500px;
    top: -5px;
 }
.ui-box{
	height:70px;
	line-height:70px;
	text-align: left;
}
.submitDiv{
	display:inline-block;
	width:70px;
	height:30px;
	font-size:14px;
	color:#ffffff;
	line-height:30px;
	text-align: center;
	margin-top:0px;
	border-radius:2px;
	cursor: pointer;
}

.submitDiv.revise{
	background-color: #fb6e52;
	margin-left:5px;
}
.submitDiv.submit{
	background-color: #fb6e52;
	margin-left:15px;
} 
 .ui-box input{
	width:290px;
	margin-top:-2px; 
	margin-left:0px;
}
.dropDown1,.dropDown3,.dropDown2
 {
 	width:0;
 	height:0; 
 	overflow:hidden;
 	border-width:10px; 
 	border-style:dotted dotted solid;  
 	position:absolute
 }
 .PoupDivBody{
 	position: absolute; 
 	width:8px; 
 	height:8px; 
 	left:550px; 
 	top:25px
 }
  .PoupDivConnect  .PoupDivBody{
  	position: absolute; 
 	width:8px; 
 	height:8px; 
 	left:530px; 
 	top:25px
  }
 .dropDown1{
 	border-color: transparent transparent  transparent #c5c5c5 ;
 	top:-0.6px;
 	z-index:0;
 }
 .dropDown3{
 	border-color: transparent transparent  transparent #c5c5c5 ;
 	top:0.5px;
 	z-index:0;
 }
 .dropDown2{
 	border-color: transparent transparent  transparent #ffffff ; 
 	top:0;
 	z-index:1;
 }
 .pic{
	text-align:center;
	position: relative;
}
.pic .musicImageDiv{
	width:86px;
	height:86px;
	border:1px solid #c5c5c5;
	display: inline-block;
	background-image: url("/admin/images/sendMsgAll/play.png");
	background-size:100% 100%;
	cursor: pointer;
}
.pic .videoShow{
	width:86px;
	height:86px;
	border:1px solid #c5c5c5;
	display: inline-block;
	text-align: center;
	line-height: 86px;
	cursor: pointer;
} 
.pic .videoShow video{
	width:86px;
	height:86px;
	position: absolute;
	z-index:1;
	left:26.6%;
	border:0;
} 
.pic .videoShow img{
	z-index:3;
	position: absolute;
	top:37px;
	left:41%;
}
.submitDiv-ma{
	width:98px;
	height:31px;
	border-radius:31px;
	line-height:31px;
	background-position: 10px 8px;
	background-repeat: no-repeat;
	color:#313131;
	cursor: pointer;
}
.submitDiv-ma.submit-ma{
	background-image: url("/admin/images/transport/tick.png");
	border:2px solid #0e9615;
	display: inline-block;
}
.submitDiv-ma.exitPoup{
	background-image: url("/admin/images/transport/close.png");
	border:2px solid #d1102d;
	margin-left:20px;
	display: inline-block;
}
.submitDiv-ma span{
	margin-left:25px;
}
 .poupMessageTable {
	height: 230px;
	width: 440px;
	border-radius: 5px;
	text-align: center;
	font-size: 15px;
}
 .poupMessageTable .publishRule{
	text-align: left;
	height:30px;
}
.poupMessageTable .publishRule span{
	margin-left:30px;
	position: absolute;
	margin-top:-12px;
	color:#a2a2a2;
	font-size:12px;
}
.poupMessageTable td img {
	cursor: pointer;
}

.poupMessageTable .poupTableHead td {
	height: 30px;
	width: 300px;
	background-color: #d1102d;
	border-radius: 5px 5px 0px 0px;
	font-size: 14px;
	color: #ffffff;
	text-align: left;
}

.poupMessageTable .poupTableHead td span {
	margin-left: 20px;
}

.poupMessageTable .tableSpanMessage td {
	text-align: left;
	font-size: 14px;
	height: 30px;
	padding-top: 30px;
}
.poupMessageTable .tableSpanMessage .fileTitle{
	margin-left:30px;
	position: absolute;
	margin-top:5px;
	font-size:12px;
	color:#5f5f5f;
}
.poupMessageTable .submitPublish {
	text-align: left;
	height: 30px;
}

.poupMessageTable .submitPublish div {
	width: 70px;
	height: 30px;
	background-color: #fb6e52;
	color: #ffffff;
	display: inline-block;
	border-radius:2px;
	margin-top:20px;
	padding-bottom:0;
	text-align: center;
	line-height: 30px;
	font-size:12px;
	cursor: pointer;
}

.poupMessageTable .submitPublish .fileName {
	margin-left: 30px;
	width: 300px;
	height: 30px;
	margin-top:1px;
	padding:0;
	margin-right:10px;
}

.poupMessageTable .tableSpanMessage .imgFile{
	margin-left: 10px;
	margin-right: 10px;
	width:29px;
	height:28px;
	display:inline-block;
	cursor: pointer;
}
.imgFile.image.publish{
	background-image: url("/admin/images/myFile/image_publish.png");
}
.imgFile.image.none{
	background-image: url("/admin/images/myFile/image_none.png");
}
.imgFile.music.publish{
	background-image: url("/admin/images/myFile/music_publish.png");
}
.imgFile.music.none{
	background-image: url("/admin/images/myFile/music_none.png");
}
.imgFile.avi.publish{
	background-image: url("/admin/images/myFile/avi_publish.png");
}
.imgFile.avi.none{
	background-image: url("/admin/images/myFile/avi_none.png");
}
.poupMessageTable .tableMessageImg img {
	cursor: pointer;
}
.videoShowBorder{
	width:100%;
 	margin-top:0;
}
.videoShowNowDiv{
 	/* position: absolute; */
 	margin-bottom:15px;
 	margin-top:15px;
 	cursor: pointer;
 }
 .container{
 	background-color: #fff;
 }
</style> 
<script type="text/javascript">

$(function(){
	$('.dateBegin').datepicker(); 
	$('.dateEnd').datepicker(); 
	//copySS(); 
	//选择上传文件的类型
	$('.imgFile').click(function(){
		var $this = $(this);
		$('.imgFile.image').removeClass('publish').addClass('none');
		$('.imgFile.avi').removeClass('publish').addClass('none');
		$('.imgFile.music').removeClass('publish').addClass('none');
		$this.removeClass('none').addClass('publish');
		var item = $this.data('item');
		if(item == '1'){
			$('.publishRule span').text('<ui:i18n key="图片最大支持1MB图片"/>(jpg/gif/png)');
			$('#fileUrlShow').val('');
		}
		if(item == '2'){
			$('.publishRule span').text('<ui:i18n key="音频最大支持2MB的音频"/>(mp3/ogg/wav)');
			$('#fileUrlShow').val('');
		}
		if(item =='3'){
			$('.publishRule span').text('<ui:i18n key="视频最大支持10MB的视频"/>(mp4/ogg/webm)');
			$('#fileUrlShow').val('');
		}
		$('#filePublishType').val(item);
	});	
	
});

//弹出连接框
function bPoupDivDisplay(poupId){
	$('.PoupDiv').hide();
	$('.PoupDivConnect').hide();
	$('#' + poupId).attr('style','display:inline-block;');
}
//关闭弹出框
function cancelAction(cancelId){
	$('#' + cancelId).attr('style','display:none;');
}
//弹出连接框
function bPoupDivDisplayConnect(poupId){
	$('.PoupDiv').hide();
	$('.PoupDivConnect').hide();
	$('#' + poupId).show();
} 
//关闭弹出框
function cancelActionConnect(cancelId){
	$('#' + cancelId).hide();
}
/*  //复制按钮的操作
function copySS(){
	 ZeroClipboard.setMoviePath( '/admin/master/file/ZeroClipboard.swf' ); 
	 $('.submitDiv.submit.copy').each(function(i){	
		    var item = $(this).find('span').data('item');
		  	var clip =  new ZeroClipboard.Client();
		    clip.setText( $('#text'+item).val() );
		    clip.setHandCursor( true );
		    clip.addEventListener('complete', function (client, text) {
		    	var styleId = jQuery('#connectPoupDiv'+item).css('z-index');
		    	var poup = jQuery('#updatePoupDiv'+item).css('display');
		    	if(styleId  == '-10'){
		    		if( poup == 'block'){
		    			updateShopFile(item);
		    		}
		    		return;
		    	}
		    	alert( '<ui:i18n key="复制成功"/>' );
		      	$('#connectPoupDiv' + item).attr('style','z-index:-10;');
		    });
		    clip.glue( 'textDiv' + item);
		   
		}); 
		  
} */

//删除文件
function deleteShopFile(msgId,newsId){
	var flagDelete = window.confirm('<ui:i18n key="您确定删除该消息吗"/>？');
	if(!flagDelete){
		return;
	}
	 var newsId=newsId||'';
	 if(newsId==''){
		 alert('消息ID错误..');
	 }
	 var param = {msgId:msgId,newsId:newsId,upDel:0};
		$.ajax({
			url : "/admin/dhhk/file/updateNewsList.htm",
			type : "POST",
			data : param,
			success : function(res) {
				if (res.success) {
					showPage(1, 10);
				}else{
					alert('找不见该数据..');
				}  
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
		
		closeNewsfeedWindow();
}
//分页操作
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}
//分页的查询
function query(pageNo, pageSize){
	var newType = $('#fileType').find('option:selected').val();
	var fileName = $('#showFileName').val();
	var dateBegin = $('.dateBegin').val();
	var dateEnd = $('.dateEnd').val();
	var date1 = new Date(dateBegin);
	var date2 = new Date(dateEnd);
	if(date1>date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var params = {
			newType : newType
			,fileName : fileName
			,beginDate : dateBegin
			,endDate : dateEnd
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	//window.location.href = '/admin/master/file/fileList.htm?fileType='+fileType+'&fileName='+fileName+'&beginDate='+dateBegin+'&endDate='+dateEnd+'&pageCurr='+pageNo+'&pageUnit='+pageSize;
	var url = '/admin/weixin/material/fileListFragment.htm';
	 
	 var $this = $('.result-grid.pic');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 $this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 }); 
		 $('.pic-small').hover(function(){
		     	var $this = $(this);
		     	var offset = $this.offset();
		     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
		      	$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
		     	 $('body').append($div);
		      },function(){
		      	$('.js-show-big-pic').remove();
		      } 
		  );
		 $this.hideLoading();
	 }); 
}
function createExcle(){
	var newType = $('#fileType').find('option:selected').val()||'';
	var fileName = $('#showFileName').val()||'';
	var dateBegin = $('.dateBegin').val()||'';
	var dateEnd = $('.dateEnd').val()||'';
	var date1 = new Date(dateBegin);
	var date2 = new Date(dateEnd);
	if(newType==''&&fileName==''&&dateBegin==''&&dateEnd==''){
		var execAll= window.confirm('您确定不指定条件导出全部？');
		if(!execAll){
			return;
		}
	}
	if(newType!=''){
		$('#newsType0').val(newType);
	}
	if(fileName!=''){
		$('#newsname0').val(fileName);
	}
	if(dateBegin!=''){
		$('#newsbegin0').val(dateBegin);
	}
	if(dateEnd!=''){
		$('#newsend0').val(dateEnd);
	}
	if(dateBegin!=''&&dateBegin!=''&&date1>date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	$('#form1').submit();
}
//修改文件名字
function updateShopFile(fileId){
	var fileName = $('#fileUpdateName'+fileId).val();
	var param = {
					fileId : fileId
					,fileName : fileName
				};
	$.ajax({
		data : param,
		url : '/admin/master/file/fileRename.htm',  
		success : function(data){
			if(data.result == 'success'){
				alert('<ui:i18n key="保存成功"/>');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
			}else if(data.result == 'fail'){
				alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
}
var audio = document.createElement('audio');
//播放音乐
function musicDisplay(fileId){
	if(audio.paused){
		$('#musicPlayId').val(fileId);
		audio.src=$('#muiscPlay'+fileId).val();
		audio.play();
	}else{
		audio.pause();
		if(fileId != $('#musicPlayId').val()){
			audio.src = $('#muiscPlay'+fileId).val();
			$('#musicPlayId').val(fileId);
			audio.play();
			return;
		}
	}
}
//打开新建文件弹出框
function createMaterial(){
	$('.imgFile').removeClass('publish').addClass('none');
	$('.imgFile.image').removeClass('none').addClass('publish');
	$('.publishRule span').text('<ui:i18n key="图片最大支持1MB图片"/>(jpg/gif/png)');
	$('#fileUrlShow').val('');
	showIframeBpopupWindow({
		id : 'bpoupMessage',
		width : 440,
		height : 270
	});
}
//关闭弹出框
function cancel(){
	closeBpopupWindow('bpoupMessage');
}
//打开选择文件筐
function selectedFile(){
	$('#fileEntity').trigger('click');
}
//选择图片，音乐，视频
function fileShowUrl(file){
	var picPath = file.value;
	var logoFileName = picPath.substring(picPath.lastIndexOf('\\') + 1, picPath.length);
	var fileType = $('#filePublishType').val();
    var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
    if(fileType == '1' && type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png'){
    	 alert('<ui:i18n key="图片格式不正确"/>');
    	 $('#fileUrlShow').val('');
    	 return;
    }else if(fileType == '2' && type != 'mp3' && type != 'ogg' && type != 'wav'){
    	 alert('<ui:i18n key="音频格式不正确"/>');
    	 $('#fileUrlShow').val('');
    	 return;
    }else  if(fileType == '3' && type != 'mp4' && type != 'ogg' && type != 'webm'){
    	 alert('<ui:i18n key="视频格式不正确"/>');
    	 $('#fileUrlShow').val('');
    	 return;
    }
    var fileSize = file.files[0].size;
    if(fileType == '1' && fileSize > (5*1024*1024)){
  		alert('<ui:i18n key="图片太大"/>');
   	 	$('#fileUrlShow').val('');
  		return;
  	}
  	if(fileType == '2' && fileSize > (50*1024*1024)){
  		alert('<ui:i18n key="音频太大"/>');
   		$('#fileUrlShow').val('');
  		return;
  	}
  	if(fileType == '3' && fileSize > (50*1024*1024)){
  		alert('<ui:i18n key="视频太大"/>');
   	 	$('#fileUrlShow').val('');
  		return;
  	}
  	$('#fileUrlShow').val(logoFileName);
}
//上传文件
function confirmMaterial(){
	var logoFileName = $('#fileUrlShow').val();
	var fileType = $('#filePublishType').val();
	var param = { 
			logoFileName : logoFileName
			,fileType : fileType
			,fileGroup : 1
	};
	if(logoFileName == ''){
		alert('<ui:i18n key="上传文件不可为空"/>');
		return;
		
	}
	$('.container').showLoading(); 
	//return;
	$.ajaxFileUpload({
		data : param,
		url :'/admin/master/file/uploadFile.htm',   
		secureuri :false,
		fileElementId :'fileEntity',
		dataType : 'json',
		type : 'post',
		success : function (data){
			$('.container').hideLoading();  
			if(data.fileId != ''){
		        alert(data.resultLogoImg);
		        query(1, 10);
		        cancel();
			}else{
				alert(data.resultLogoImg);
			}
			$('#fileUrlShow').val('');
		},
		error: function (data, e){
			alert(e );
			$('#fileUrlShow').val('');
			$('.container').hideLoading();
		}
	});	
}

//播放视屏
function showVideo(listUrl){
	var video = document.getElementById('videoShowNow');
	$('#videoShowNow').attr('src',listUrl);
	showIframeBpopupWindow({
		id : 'bpoupMessageAvi',
		width : 512,
		height : 350
	});
	if(video.paused){
		video.play();
	}
}
//视频的暂停
 function pauseVideoShow(){
	var video = document.getElementById('videoShowNow');
	if(video.paused){
		video.play();
	}else{
		video.pause();	
	}
}
//关闭视频
 function closeVideoShow(){
	 $('#videoShowNow').attr('src','');
	 closeBpopupWindow('bpoupMessageAvi');
}
 function copyUrl2(fileId){
	 	var Url2 = document.getElementById('text'+fileId);
	 	Url2.select(); // 选择对象
 		document.execCommand('Copy'); // 执行浏览器复制命令
 		alert( '<ui:i18n key="复制成功"/>' );
 		$('#connectPoupDiv'+ fileId).hide();
 }
 
 
 function showNewsaterialWindow(){
	 showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择素材"/>', // 标题 option
			width : 650, 
			height : 462, 
			action : '/admin/weixin/material/newsMaterialWindow.htm?dahannews=1&conformMethod=chooseNewsfeed&clsoeMethod=closeNewsfeedWindow' 
		});	 	
}
//关闭窗口	
 function closeNewsfeedWindow(){
 	closeBpopupWindow('bpopupPicture');
 }	
 function chooseNewsfeed(msgId,newsId){
	 var newsId=newsId||'';
	 if(newsId==''){
		 alert('消息ID错误..');
	 }
		$.ajax({
			url : "/admin/dhhk/file/updateNewsList.htm",
			type : "POST",
			data : {
				msgId : msgId,newsId:newsId
			},
			success : function(res) {
				if (res.success) {
					showPage(1, 10);
				}else{
					alert('数据有误..');
				}  
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
		
		closeNewsfeedWindow();
	}
</script>
 <ui:template id="bpopupPicture"/>	
</head>
<body>
<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="140px" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="消息类型"/>：</td>
       		 			<td class="fcomp">
       		 				<select class="select2" style="width:255px;text-align:left;margin-left:-20px;margin-right:20px; " data-placeholder="请选择" id="fileType">
								<option value=""><ui:i18n key="不限"/></option>
								<!-- <option value="" >全部</option> -->
									<c:forEach items="${list }" var="list" varStatus="status">
										<option value="${list.CD_ID }">${list.CD_VAL}</option>
									</c:forEach>
							</select>
							<span style="width:80px;display: inline-block;"><ui:i18n key="消息标题"/>：</span> 
							<input type="text" style="width: 200px;" id="showFileName" value="${requestScope.fileName }" />
						</td>
					</tr>
					<tr>
       		 			<td class="flabel"><ui:i18n key="创建时间"/>：</td>
       		 			<td class="fcomp dateSelect">
       		 				<input type="text" style="margin-left: -20px;" class="dateBegin datepicker calendar" value="${requestScope.beginDate}" /> 
							<span class="connectSpan">~</span> 
							<input type="text" class="dateEnd datepicker calendar" value="${requestScope.endDate }" />
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
	 
       		<!-- -->
       		<div class="butttn-area m2" >
       		   <span class="button" onclick="showPage(1, 10);">
       		   	  <span class="button-icon search"></span>
       		   	  <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
      	
      	<div class="result-grid" style="margin-top:50px;">
	      	<div class="result-grid-header">
				<div class="result-grid-tools">
					<span class="result-grid-tool" onclick="showNewsaterialWindow();">
	   		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
	   		   	 	 	<input type="hidden" value="" id="musicPlayId" />
	   		   		</span>
	   		   		<span class="result-grid-tool" onclick="createExcle();">
	   		   	 	 	<img alt="" src="/admin/images/v2-icons/ico_export.png" /><ui:i18n key="数据导出"/>
	   		   	 	 	<input type="hidden" value="" id="musicPlayId" />
	   		   		</span>
				</div>
			</div>
	      	<div class="result-grid pic">
	      		<div class="result-data-warp" style="">
			      	<table class="result-grid-table">
			      		 <colgroup>
				      		  <col width="10%"  />
		     		 			<col width="10%" />
		     		 			<col width="15%" />
							  <col width="10%"  />
		     		 			<col width="10%" />
		     		 			<col width="10%" />
								<col width="10%" />
		     		 			<col/>
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="消息ID"/></th>
			      		 		<th><ui:i18n key="类型"/></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="日期"/></th>
			      		 		<th><ui:i18n key="阅读量"/></th>
			      			<th><ui:i18n key="喜欢人数"/></th>
			      		 		<th><ui:i18n key="分享人数"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
		      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
			      		 	<c:choose>
			    				<c:when test="${item.ITEM_CNT eq 1 }">
			           			<tr>
			           				<td >
			           					<div ></div>
			           					<span>${item.NEWS_ID }</span>
			           				</td>
			        				<td>
			           					<div ></div>
			           					<span>	
			           					<c:forEach items="${list }" var="list" varStatus="status">
											<c:if test="${list.CD_ID  eq item.NEWS_TYPE}">${list.CD_VAL}</c:if>
										</c:forEach>
			           					</span>
			           				</td>
			           				<td>
			           					<div ></div>
			           					<span>${item.MTITLE}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span><fmt:formatDate value="${item.CREATED_DT}" pattern="y-M-d"/></span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.READ_CNT}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span>${item.LIKE_CNT}</span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.SHARE_CNT}</span>
			           				</td>
			           				<td style="position: relative;">
			      		 				<span class="gridbutton red" onclick="deleteShopFile(${item.MSG_ID },${item.NEWS_ID });"><ui:i18n key="删除"/></span>
		           						<div class="PoupDivConnect" id="connectPoupDiv${item.FILE_ID }">
									        <div class="PoupDivBody">
									            <div class="dropDown1"></div>
									            <div class="dropDown2"></div>
									            <div class="dropDown3"></div>
									        </div>
									        <div class="ui-box">
									        		<input style="margin-left:25px;"  type="text" id="text${item.FILE_ID }" readonly="readonly" value="<%=basePath %>${fn:substring(item.FULL_URL, 1, fn:length(item.FULL_URL)) }"/>
									        		<div class="submitDiv submit copy"  id="textDiv${item.FILE_ID }" onclick="copyUrl2(${item.FILE_ID })" >
									        			<span data-item="${item.FILE_ID }" ><ui:i18n key="复制"/></span>
									        		</div>
											  		<%-- <input style="margin-left:30px;" type="text" readonly="readonly"  value="${item.FULL_URL }" id="fileUpdateUrl${item.FILE_ID }"/>
											  		<div class="submitDivsubmitcopy"  id="toClip${item.FILE_ID }" >
											  			<span data-item="${item.FILE_ID }">复制</span>
											  		</div> --%>
											  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${item.FILE_ID }');">
											  			<span><ui:i18n key="取消"/></span>
											  		</div>
											</div>
								    	</div> 
		           						
									</td>
			           			</tr>
		           				</c:when>
			    				<c:otherwise>
			    					<tr>
			           					<td >
			           					<div ></div>
			           					<span>${item.NEWS_ID }</span>
			           				</td>
			        				<td>
			           					<div ></div>
			           					<span>	
			           					<c:forEach items="${list }" var="list" varStatus="status">
											<c:if test="${list.CD_ID  eq item.NEWS_TYPE}">${list.CD_VAL}</c:if>
										</c:forEach>
			           					</span>
			           				</td>
			           				<td>
			           					<div ></div>
			           					<span>${item.MTITLE}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span><fmt:formatDate value="${item.CREATED_DT}" pattern="y-M-d"/></span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.READ_CNT}</span>
			           				</td>
			           					<td>
			           					<div></div>
			           					<span>${item.LIKE_CNT}</span>
			           				</td>
			           				<td>
			           					<div></div>
			           					<span>${item.SHARE_CNT}</span>
			           				</td>
			           				<td style="position: relative;">
			      		 				<span class="gridbutton red" onclick="deleteShopFile(${item.MSG_ID },${item.NEWS_ID });"><ui:i18n key="删除"/></span>
		           						<div class="PoupDivConnect" id="connectPoupDiv${item.FILE_ID }">
									        <div class="PoupDivBody">
									            <div class="dropDown1"></div>
									            <div class="dropDown2"></div>
									            <div class="dropDown3"></div>
									        </div>
									        <div class="ui-box">
									        		<input style="margin-left:25px;"  type="text" id="text${item.FILE_ID }" readonly="readonly" value="<%=basePath %>${fn:substring(item.FULL_URL, 1, fn:length(item.FULL_URL)) }"/>
									        		<div class="submitDiv submit copy"  id="textDiv${item.FILE_ID }" onclick="copyUrl2(${item.FILE_ID })" >
									        			<span data-item="${item.FILE_ID }" ><ui:i18n key="复制"/></span>
									        		</div>
											  		<%-- <input style="margin-left:30px;" type="text" readonly="readonly"  value="${item.FULL_URL }" id="fileUpdateUrl${item.FILE_ID }"/>
											  		<div class="submitDivsubmitcopy"  id="toClip${item.FILE_ID }" >
											  			<span data-item="${item.FILE_ID }">复制</span>
											  		</div> --%>
											  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${item.FILE_ID }');">
											  			<span><ui:i18n key="取消"/></span>
											  		</div>
											</div>
								    	</div> 
		           						
									</td>
			           			</tr>
			           		   <c:forEach items="${item.sublist}" var="subItem" varStatus="subStatus">
							        <c:if test="${item.NEWS_ID ne subItem.NEWS_ID}">
				    					<tr>
				           					<td >
				           					<div ></div>
				           					<span>${subItem.NEWS_ID }</span>
				           				</td>
				        				<td>
				           					<div ></div>
				           					<span>	
				           					<c:forEach items="${list }" var="list" varStatus="status">
												<c:if test="${list.CD_ID  eq subItem.NEWS_TYPE}">${list.CD_VAL}</c:if>
											</c:forEach>
				           					</span>
				           				</td>
				           				<td>
				           					<div ></div>
				           					<span>${subItem.MTITLE}</span>
				           				</td>
				           					<td>
				           					<div></div>
				           					<span><fmt:formatDate value="${subItem.CREATED_DT}" pattern="y-M-d"/></span>
				           				</td>
				           				<td>
				           					<div></div>
				           					<span>${subItem.READ_CNT}</span>
				           				</td>
				           					<td>
				           					<div></div>
				           					<span>${subItem.LIKE_CNT}</span>
				           				</td>
				           				<td>
				           					<div></div>
				           					<span>${subItem.SHARE_CNT}</span>
				           				</td>
				           				<td style="position: relative;">
				      		 				<span class="gridbutton red" onclick="deleteShopFile(${subItem.MSG_ID },${subItem.NEWS_ID });"><ui:i18n key="删除"/></span>
			           						<div class="PoupDivConnect" id="connectPoupDiv${subItem.FILE_ID }">
										        <div class="PoupDivBody">
										            <div class="dropDown1"></div>
										            <div class="dropDown2"></div>
										            <div class="dropDown3"></div>
										        </div>
										        <div class="ui-box">
										        		<input style="margin-left:25px;"  type="text" id="text${subItem.FILE_ID }" readonly="readonly" value="<%=basePath %>${fn:substring(subItem.FULL_URL, 1, fn:length(subItem.FULL_URL)) }"/>
										        		<div class="submitDiv submit copy"  id="textDiv${subItem.FILE_ID }" onclick="copyUrl2(${subItem.FILE_ID })" >
										        			<span data-item="${subItem.FILE_ID }" ><ui:i18n key="复制"/></span>
										        		</div>
												  		<%-- <input style="margin-left:30px;" type="text" readonly="readonly"  value="${item.FULL_URL }" id="fileUpdateUrl${item.FILE_ID }"/>
												  		<div class="submitDivsubmitcopy"  id="toClip${item.FILE_ID }" >
												  			<span data-item="${item.FILE_ID }">复制</span>
												  		</div> --%>
												  		<div class="submitDiv revise" onclick="cancelActionConnect('connectPoupDiv${subItem.FILE_ID }');">
												  			<span><ui:i18n key="取消"/></span>
												  		</div>
												</div>
									    	</div> 
			           						
										</td>
				           			</tr>							        
									</c:if>
							     </c:forEach>
			    				</c:otherwise>
			    			</c:choose>	
		           			</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
			      <ui:paging page="${page }" /> 
		      </div>
		  </div>
		  
		  <!-- START 弹出框，上传文件 -->
		  	<!-- Start提示信息弹出框 -->
			<div class="bpopup2" id="bpoupMessage" >
			 	<div class="bpopupWarp">
			 		 <div class="bpopupHeaderWarp">
						<h3 class="bpopupTitle js-title"><ui:i18n key="上传新文件"/></h3>
						<div class="bpopupColseWarp">
							<img class="b-close" src="/admin/images/goodsSell/close.png" />
						</div>
					</div>
			 		 <div class="bpopupContentWarp"> 
			 		 	<table class="poupMessageTable">
							<tr class="tableSpanMessage">
								<td>
									<span class="fileTitle"><ui:i18n key="上传类型"/>：</span> 
									<span data-item='1' class="imgFile image publish" style="margin-left:120px;"></span>
									<span data-item='2' class="imgFile music none"></span>
									<span data-item='3' class="imgFile avi none"></span>
									<input type="hidden" id="filePublishType" value="1" />
								</td>
							</tr>
							<tr>
								<td class="submitPublish">
									<input type="file" name="fileEntity" id="fileEntity" style="display: none;" onchange="fileShowUrl(this);" />
									<input readonly="readonly" type="text" value="" id="fileUrlShow" class="fileName" />
									<div onclick="selectedFile()">
										<span><ui:i18n key="选择"/></span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="publishRule">
									<span><ui:i18n key="图片最大支持5MB图片"/>(jpg/gif/png)</span>
								</td>
							</tr>
							<tr class="tableMessageImg">
								<td>
									<div class="buttons-action" style="margin-bottom:10px;">
						 				<span class="button bg-red js-trans-order-confirm" onclick="confirmMaterial();">
											<span class="button-icon conform"></span>
												<ui:i18n key="保存"/>
										</span>
										<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
											<span class="button-icon cancel"></span>
												<ui:i18n key="取消"/>
										</span>
									</div>
								</td> 
							</tr>
						</table>
			 		 </div>
			 	</div>
			</div>
			
			<!-- Start提示信息弹出框 -->
			<div class="bpopup2" id="bpoupMessageAvi" >
			 	<div class="bpopupWarp">
			 		 <div class="bpopupHeaderWarp">
						<h3 class="bpopupTitle js-title"><ui:i18n key="视频播放"/></h3>
						<div class="bpopupColseWarp">
							<img class="b-close" src="/admin/images/goodsSell/close.png" />
						</div>
					</div>
					<table class="poupMessageTable">
						<tr >
							<td>
							 	<div class="videoShowBorder">
								 	<video id="videoShowNow" src="" controls="controls" autoplay="autoplay"  width="512" height="270"  class="videoShowNowDiv" onclick="pauseVideoShow();">
										<%-- <source src="/uploads/150/2015_01_24/shopFile2015_01_24_10_39_297443.mp4" type="video/mp4">
										<source src="/uploads/150/2015_01_24/shopFile2015_01_24_10_39_297443.mp4" type="video/ogg">
										<source src="/uploads/150/2015_01_24/shopFile2015_01_24_10_39_297443.mp4" type="video/webm"> --%>
									</video>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		  <form action="/admin/weixin/material/doExcel.htm" id="form1" method="post">
		  <input  id="newsType0" name ="newType" type="hidden"/> <input  id="newsname0" name ="fileName" type="hidden"/>
		   <input  id="newsbegin0" name ="beginDate" type="hidden"/> <input  id="newsend0" name ="endDate" type="hidden"/>
		  </form>
		  <!-- END 弹出框，上传文件 -->
	</div>
	<!-- ▲ container  -->
</body>
</html>