<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>

<style type="text/css">

.bannerImg, .lecturerImg  {width: 100px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-color: #f7f7f7; background-image: url("/admin/images/goods/imgUp.png"); background-repeat: no-repeat; background-position: 40px 30px; cursor: pointer;}
.bannerImg span, .lecturerImg span, .lectPicImg span {display: inline-block; font-size: 12px; color: #313131; margin-top: 60px;}
.bannerImgShow, .lecturerImgShow  {display: none; width: 100px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-repeat: no-repeat; background-position: 0px 0px; cursor: pointer; background-size: contain;}
.lectPicImgShow {width: 650px; word-break: break-all; word-wrap: break-word;}
.lectPicImgShow .lectPic {float: left; margin-top: 5px;}
.lectPicImgShow .lectPic img {float: left; width: 102px; height: 102px; margin-left: 5px;}
.lectPicImgShow .lectPicImg {float: left; width: 100px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-color: #f7f7f7; background-image: url("/admin/images/goods/imgUp.png"); background-repeat: no-repeat; background-position: 40px 30px; cursor: pointer; margin-top: 5px; margin-left: 5px;}
.imgClose {position: relative; width: 102px; height: 102px; background-color: #000; opacity: 0.6; cursor: pointer; background-image: url("/admin/images/webzine/icon_del.png"); background-repeat: no-repeat; background-position: 40px 38px; display: none; z-index: 200; margin-left: 5px;}
.lectMovBg {width: 150px; height: 100px;}
.lectMov {float: left; width: 100px; height: 100px; background-color: blue;}
.lectMovAdd {float: left; width: 50px; height: 100px; vertical-align: bottom;}
.selectCss {width: 70px; height: 28px; margin-left: 5px; margin-bottom: 3px;}

#js-editor-lectDesc {width: 700px; height: 500px;}
#js-editor-lecturerDesc {width: 700px; height: 500px;}

.btn-save {width: 90px; height: 30px; line-height: 30px; text-align: center; background-color: #d1102d; color: #fff; cursor: pointer; margin: 50px auto;}
.btn-save .button-icon.conform {margin-bottom: -2px;}

.sponsorImg  {width: 100px; height: 50px; border: 1px solid #e5e5e5; text-align: center; background-color: #f7f7f7; background-image: url("/admin/images/goods/imgUp.png"); background-repeat: no-repeat; background-position: 40px 10px; cursor: pointer;}
.sponsorImg span {display: inline-block; font-size: 12px; color: #313131; margin-top: 30px;}
.sponsorImgShow  {display: none; width: 100px; height: 50px; border: 1px solid #e5e5e5; text-align: center; background-repeat: no-repeat; background-position: 0px 0px; cursor: pointer; background-size: contain;}

.lectDescImg  {width: 200px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-color: #f7f7f7; background-image: url("/admin/images/goods/imgUp.png"); background-repeat: no-repeat; background-position: 90px 30px; cursor: pointer;}
.lectDescImg span {display: inline-block; font-size: 12px; color: #313131; margin-top: 50px;}
.lectDescImgShow  {display: none; width: 200px; height: 100px; border: 1px solid #e5e5e5; text-align: center; background-repeat: no-repeat; background-position: 0px 0px; cursor: pointer; background-size: contain;}

</style>

<script type="text/javascript">

	var LectId = '';//演讲ID
	var Editor_lectDesc = '';//演讲介绍
	var Editor_lecturerDesc = '';//主讲人介绍
	var LectPicId = '';//照片区分
	var OptionId = '';
	
	$(document).ready(function() { 

		var lectDesc = "";
		var lecturerDesc = "";
		LectId = '${requestScope.getRe.LECT_ID}';
		optionId = '${requestScope.optionId}';
		OptionId = optionId;

		$('.editCss').hide();
		$('.videoCss').hide();
		
		if (LectId != "") {
			
			if (optionId == "E") {
				$('.editCss').show();
			}
			
			var bannerId = "${requestScope.getRe.BANNER_ID}";
			var lecturerId = "${requestScope.getRe.LECTURER_PICID}";
			var lectMovId = "${requestScope.getRe.LECT_MOV_ID}";
			var lectMovNm = "${requestScope.getRe.LECT_MOV_NM}";
			var lectMovUrl = "${requestScope.getRe.LECT_MOV_URL}";	
			var lectTm = "${requestScope.getRe.LECT_TM}";	
			var sponsorId = '${requestScope.getRe.SPONSOR_ID}';
			var sponsorUrl = '${requestScope.getRe.SPONSOR_URL}';
			var lectDescPictureId = '${requestScope.getRe.LECT_DESC_PIC_ID}';
			var lectDescPictureUrl = '${requestScope.getRe.LECT_DESC_PIC_URL}';
			var lectTm1 = "";
			var lectTm2 = "";
		
			lectTm1 = lectTm.substring(0,2);
			lectTm2 = lectTm.substring(3);
			$('#lectTm1').select2('val', lectTm1);
			$('#lectTm2').select2('val', lectTm2);
			
			lectDesc = '${requestScope.getRe.LECT_DESC}';
			lecturerDesc = '${requestScope.getRe.LECTURER_DESC}';
			 
			$('input[name="lectNm"]').val('${requestScope.getRe.LECT_NM}'); 
			$('input[name="lectDt"]').val('${requestScope.getRe.LECT_DT}');
			$('input[name="lecturerNm"]').val('${requestScope.getRe.LECTURER_NM}');
			
			if (sponsorId != "") {
				$('.sponsorImg').hide();
				$('.sponsorImgShow').show();
				$('input[name="sponsorId"]').val(sponsorId);
				$('.sponsorImgShow').css("background-image","url(\"${requestScope.getRe.SPONSOR_URL}\")");
			} 
			
			if (lectDescPictureId != "") {
				$('.lectDescImg').hide();
				$('.lectDescImgShow').show();
				$('input[name="lectDescImgId"]').val(lectDescPictureId);
				$('.lectDescImgShow').css("background-image","url(\"${requestScope.getRe.LECT_DESC_PIC_URL}\")");
			} 
			if (bannerId != "") {
				$('.bannerImg').hide();
				$('.bannerImgShow').show();
				$('input[name="bannerId"]').val(bannerId);
				$('.bannerImgShow').css("background-image","url(\"${requestScope.getRe.BANNER_URL}\")");
			} 
			if (lecturerId != "") {
				$('.lecturerImg').hide();
				$('.lecturerImgShow').show();
				$('input[name="lecturerId"]').val(lecturerId);
				$('.lecturerImgShow').css("background-image","url(\"${requestScope.getRe.LECTURER_PIC_URL}\")");
			}
			if (lectMovId != '' && optionId == 'E') {
				$('.js-previewd-video-name').val(lectMovNm);
				$('input[name="lectMovId"]').val(lectMovId);
				$('.js-previewd-video').html($('<video src="' + lectMovUrl + '" width="245" height="145" style="margin-top:0;" controls autobuffer></video>'));
				$('.videoCss').show();
			}
		}
		
		if (!!Editor_lectDesc) {
			
			Editor_lectDesc.destroy();
			$('#js-editor-lectDesc').remove();
			$('#containerWarp-lectDesc').html('');
		}
		if (!!Editor_lecturerDesc) {
			
			Editor_lecturerDesc.destroy();
			$('#js-editor-lecturerDesc').remove();
			$('#containerWarp-lecturerDesc').html('');
		}
		Editor_lectDesc = UE.getEditor('js-editor-lectDesc', {
			autoHeight: false
			, toolbars: [[
	 	                    'undo', 'redo', '|',
	 	                     'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 
	 	                     'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
	 	                     'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
	 	                     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	 	                     'directionalityltr', 'directionalityrtl', 'indent', '|',
	 	                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 
	 	                     'touppercase', 'tolowercase', '|',
	 	                     'link', 'unlink', 'anchor', '|', 
	 	                     'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
	 	                     'simpleupload', 'insertvideo',  'emotion', 'music', 'map',  'template', 'background', '|',
	 	                     'horizontal', 'date', 'time', 'spechars',  '|',
	 	                     'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
	 	                     'searchreplace', 'help'
	 	                 ]]
			//, initialFrameWidth : 480
			, initialFrameHeight : 500
			, elementPathEnabled : false
			, autoHeightEnabled : false //纵向滚动条
		});
		Editor_lecturerDesc = UE.getEditor('js-editor-lecturerDesc', {
			autoHeight: false
			, toolbars: [[
	 	                    'undo', 'redo', '|',
	 	                     'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 
	 	                     'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
	 	                     'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
	 	                     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	 	                     'directionalityltr', 'directionalityrtl', 'indent', '|',
	 	                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 
	 	                     'touppercase', 'tolowercase', '|',
	 	                     'link', 'unlink', 'anchor', '|', 
	 	                     'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
	 	                     'simpleupload', 'insertvideo',  'emotion', 'music', 'map',  'template', 'background', '|',
	 	                     'horizontal', 'date', 'time', 'spechars',  '|',
	 	                     'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
	 	                     'searchreplace', 'help'
	 	                 ]]
			//, initialFrameWidth : 480
			, initialFrameHeight : 500
			, elementPathEnabled : false
			, autoHeightEnabled : false //纵向滚动条
		});
		Editor_lectDesc.ready(function() {
			
 			if (lectDesc != "") {
 				
				Editor_lectDesc.setContent(lectDesc); 
			}
		});
		Editor_lecturerDesc.ready(function() {
			
	 		if (lecturerDesc != "") {
	 			
				Editor_lecturerDesc.setContent(lecturerDesc); 
			}
		});
	});
	
	/* 删除照片 */
	function over(id,count) {
		
		if(typeof($('.imgD_' + id + '_' + count).find('img').attr('src'))!='undefined'){
			$('.imgD_' + id + '_' + count).find('.imgClose').show();
		}
	}
	function out(id,count) {
		
		$('.imgD_' + id + '_' + count).find('.imgClose').hide();
	}
	function del(id,count) {
		
		var lectPicIds = "";
		
		$('.imgD_' + id + '_' + count).remove();
	}
	
	/* 保存 */
	function save() {

		var lectNm = $('input[name="lectNm"]').val();
		var lectDt = $('input[name="lectDt"]').val();
		var lectTm = "";
		var lectTm1 = $('#lectTm1').find('option:selected').val();
		var lectTm2 = $('#lectTm2').find('option:selected').val();
		var lectAddr = $('#lectAddr').html();
		var lecturerNm = $('input[name="lecturerNm"]').val();
		var bannerId = $('input[name="bannerId"]').val();
		var lecturerId = $('input[name="lecturerId"]').val();
		var lectPicIds = "";
		var lectMovId = $('input[name="lectMovId"]').val();
		var lecturerDesc = Editor_lecturerDesc.getContent();
		var lectDesc = Editor_lectDesc.getContent();
		var sponsorId = $('input[name="sponsorId"]').val();
		var lectDescPictureId = $('input[name="lectDescImgId"]').val();

		if(lecturerNm == ''){
			
			alert('<ui:i18n key="请输入主讲人姓名"/>');
			return;
		}
		
		if(lectNm == ''){
			
			alert('<ui:i18n key="请输入演讲题目"/>');
			return;
		}
		
		if(lectDt == ''){
			
			alert('<ui:i18n key="请选择演讲日期"/>');
			return;
		}
		
		if(lectTm1 == '' || lectTm2 == ''){
			
			alert('<ui:i18n key="请输入演讲具体时间"/>');
			return;
		}
		
		if(lectAddr == ''){
			
			alert('<ui:i18n key="请输入演讲地点"/>');
			return;
		}
		
		if(bannerId == ''){
			
			alert('<ui:i18n key="请添加Banner Pic"/>');
			return;
		}
		
		if(lecturerId == ''){
			
			alert('<ui:i18n key="请添加主讲人头像"/>');
			return;
		}
		
		$('.lectPic img').each(function(idx) {
			
			lectPicIds += $(this).data('id') + ","; 
		});

		if (lectPicIds.length > 5) {
			
			lectPicIds = lectPicIds.substring(0,lectPicIds.length-1);
		}
		
/* 		if (OptionId == 'E') {
			
			if(lectPicIds == ''){
				
				alert('<ui:i18n key="请添加现场图片"/>');
				return;
			}
			
			if(lectMovId == ''){
				
				alert('<ui:i18n key="请添加演讲视频"/>');
				return;
			}
		} */
		if(sponsorId == ''){
			
			alert('<ui:i18n key="请添加赞助商Logo"/>');
			return;
		}
		
		if(lectDesc == ''){
			
			alert('<ui:i18n key="请输入演讲介绍"/>');
			return;
		}
		
		if(lecturerDesc == ''){
			
			alert('<ui:i18n key="请输入主讲人介绍"/>');
			return;
		}
		
		
		lectTm = lectTm1 + ":" + lectTm2;
		
		var params = {
				lectId : LectId,
				lectNm : lectNm,
				lectDt : lectDt,
				lectTm : lectTm,
				lectAddr : lectAddr,
				lecturerNm : lecturerNm,
				bannerId : bannerId,
				lecturerId : lecturerId,
				lectPicId : lectPicIds,
				lectMovId : lectMovId,
				lectDesc : lectDesc,
				lecturerDesc : lecturerDesc,
				sponsorId : sponsorId,
				lectDescPictureId : lectDescPictureId
		};
		$.ajax({
			data : params,
			dataType : "json",
			type : "POST",
			cache : false,
			url : "/admin/human/save.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(res){
				
				if (res.success) {

					alert('<ui:i18n key="保存成功"/>.');
					window.top.closeTab();
				} else {

					alert('<ui:i18n key="保存异常"/>\n' + res.err_msg + '.');
				}
			},
			error : function(a, msg, c) {
				
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
</script>

<!-- 照片 -->
<script type="text/javascript">

	function showPopup(id) {
		
		LectPicId = id;
		var lectPicCount = 0;//现场照片已传数量
		var imgCount = 10;//现场照片最多上传数量
		
		if (LectPicId == "lectPicId") {
			
			$('.lectPic img').each(function(idx) { 
				lectPicCount += 1;
			});
			
			if (Number(lectPicCount) > 0) {
				
				imgCount = Number(10) - Number(lectPicCount);
			}
			
			if (Number(imgCount) == 0) {
				
				alert('<ui:i18n key="只能选择10张图片"/>');
				return;
			}
			
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=1&max='+imgCount
			});
		} else {
			
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=1&max=1'
			});
		}	 		
	}

	function choosePicture(obj) {
		
		//console.log('-------parent');
		obj = obj || [];
		if (obj.length > 0) {
			//obj为返回的数组 格式 
			/*  
			[{
				  "fileId" : ...
				  ,"fileNm" : ...
				  ,"fileUrl" : ...
			  },
			  {
				  "fileId" : ...
				  ,"fileNm" : ...
				  ,"fileUrl" : ...
			  }]
			*/
			/* 
			console.log(obj[obj.length-1].fileId);
			console.log(obj[obj.length-1].fileNm);
			console.log(obj[obj.length-1].fileUrl); 
			*/
			
			//这里写自己的逻辑
			if (LectPicId == "bannerId") {

				$('.bannerImg').hide();
				$('.bannerImgShow').show();
				$('.bannerImgShow').css("background-image","url("+obj[obj.length-1].fileUrl+")");
				$('input[name="bannerId"]').val(obj[obj.length-1].fileId);
				
			}else if(LectPicId == 'sponsorId'){
				$('.sponsorImg').hide();
				$('.sponsorImgShow').show();
				$('.sponsorImgShow').css("background-image","url("+obj[obj.length-1].fileUrl+")");
				$('input[name="sponsorId"]').val(obj[obj.length-1].fileId);
			}else if(LectPicId == 'lectDescImgId'){
				$('.lectDescImg').hide();
				$('.lectDescImgShow').show();
				$('.lectDescImgShow').css("background-image","url("+obj[obj.length-1].fileUrl+")");
				$('input[name="lectDescImgId"]').val(obj[obj.length-1].fileId);
			}else if (LectPicId == "lecturerId") {
				
				$('.lecturerImg').hide();
				$('.lecturerImgShow').show();
				$('.lecturerImgShow').css("background-image","url("+obj[obj.length-1].fileUrl+")");
				$('input[name="lecturerId"]').val(obj[obj.length-1].fileId);
				
			} else if (LectPicId == "lectPicId") {
				
				var imgMax = 0;
				$('.lectPic').each(function(idx) { 
					imgMax = $(this).data('id'); 
				});
				if (imgMax == 0) {
					imgMax = imgMax-1;
				} else {
					imgMax = imgMax+1;
				}
				for(var i=0; i<obj.length; i++) {
					
					var list = '<div class="lectPic imgD_'+obj[i].fileId+'_'+(imgMax+i)+'" data-id="'+(imgMax+i)+'" onmouseover="over(\''+obj[i].fileId+'\',\''+(imgMax+i)+'\');" onmouseout="out(\''+obj[i].fileId+'\',\''+(imgMax+i)+'\');">'+
							      '<img src="'+obj[i].fileUrl+'" data-id="'+obj[i].fileId+'">'+
								  '<div class="imgClose" onclick="del(\''+obj[i].fileId+'\',\''+(imgMax+i)+'\')"></div>'+
							   '</div>';
					$('.lectPicImgShow .lectPicImg').before(list);
				}
			} else {
				
				//vido
			}
		} else {
			
			if (LectPicId == "bannerId") {
				
				$('.bannerImg').show();
				$('.bannerImgShow').hide();
				$('input[name="bannerId"]').val('');
				
			} else if (LectPicId == "lecturerId") {
				
				$('.lecturerImg').show();
				$('.lecturerImgShow').hide();
				$('input[name="lecturerId"]').val('');
				
			} else if (LectPicId == "lectPicId") {
				
				//$('.lectPicImg').show();
				//$('.lectPicImgShow').hide();
				
			} else {
				
				//vido
			}
		}
		closeWindow();
	}

	function closeWindow() {
		 
		closeBpopupWindow('bpopupPicture');
	}
</script>

<!-- 视频 -->
<script type="text/javascript">

function showVideoPopup(){
	
	showIframeBpopupWindow({
		id : 'bpopupVideo',
		title : '<ui:i18n key="选择视频"/>', // 标题 option
		width : 840, 
		height : 462, 
		action : '/admin/master/file/video.htm?fileGroup=1&max=1&conformMethod=chooseVideo&clsoeMethod=closeVideoWindow'  
		//参数 fileGroup 必选 1：商品   2：素材    3：Blog
		// max 可选择的图片张数 可选  （不填写时可以选择任意张）
		// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
		// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
	});	 		
}

//弹出窗口
function chooseVideo(obj) {
	
	//console.log('-------chooseVideo'); //obj为返回的数组 格式 
	//console.log(obj);
	//这里写自己的逻辑
	 
	obj = obj || [];
	
	if (obj.length > 0) {
		
		var item  = obj[0];
		 
		$('input[name="lectMovId"]').val(item.fileId);
		$('.js-previewd-video-name').val(item.fileNm);
		$('.js-previewd-video').html($('<video src="' + item.fileUrl + '" width="245" height="145" style="margin-top:0;" controls autobuffer></video>'));
		$('.videoCss').show();
	}
	closeVideoWindow();
}
//关闭窗口	
function closeVideoWindow() {
	
	closeBpopupWindow('bpopupVideo');
}
</script>
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<!-- ======================container start=========================== -->
		<div class="form-warp clearfix">
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="主讲人姓名"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<input type="text" name="lecturerNm" placeholder="<ui:i18n key="请输入主讲人姓名"/>" style="width: 250px;" />
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="演讲题目"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<input type="text" name="lectNm" placeholder="<ui:i18n key="请输入演讲题目"/>" style="width: 500px;" />
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="演讲日期"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<input type="text" name="lectDt" placeholder="<ui:i18n key="请选择演讲日期"/>" class="datepicker calendar date1" value="" style="width: 172px;" />
					<select id="lectTm1" class="select2 selectCss" data-placeholder='<ui:i18n key="时"/>'>
						<option value=""></option>
						<option value="00">00</option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
					</select>
					<select id="lectTm2" class="select2 selectCss" data-placeholder='<ui:i18n key="分"/>'>
						<option value=""></option>
						<option value="00">00</option>
						<option value="05">05</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="25">25</option>
						<option value="30">30</option>
						<option value="35">35</option>
						<option value="40">40</option>
						<option value="45">45</option>
						<option value="50">50</option>
						<option value="55">55</option>
					</select>
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label">
					<ui:i18n key="演讲地点"/> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<span id="lectAddr">LG双子座大厦5层</span>
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="Bnner Pic"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div class="bannerImg" onclick="showPopup('bannerId')">
						<span><ui:i18n key="添加图片"/></span>
					</div>
					<div class="bannerImgShow" onclick="showPopup('bannerId')">
						<input type="hidden" name="bannerId" value="" />
					</div>
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="主讲人头像"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div class="lecturerImg" onclick="showPopup('lecturerId')">
						<span><ui:i18n key="添加图片"/></span>
					</div>
					<div class="lecturerImgShow" onclick="showPopup('lecturerId')">
						<input type="hidden" name="lecturerId" value="" />
					</div>
				</div>
			</div>
			<div class="control-warp editCss">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="现场图片"/> :
				</div>
				<div class="form-control">
					<div class="lectPicImgShow">
						<c:forEach items="${requestScope.getPicList}" var="items" varStatus="status">
							<div class="lectPic imgD_${items.LECT_PIC_ID}_${status.index}" data-id="${status.index}" onmouseover="over('${items.LECT_PIC_ID}','${status.index}');" onmouseout="out('${items.LECT_PIC_ID}','${status.index}');">
								<img src="${items.FILE_URL}" data-id="${items.LECT_PIC_ID}">
								<div class="imgClose" onclick="del('${items.LECT_PIC_ID}','${status.index}')"></div>
							</div>
						</c:forEach>
						<div class="lectPicImg" onclick="showPopup('lectPicId')">
							<span><ui:i18n key="添加图片"/></span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="control-warp">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="赞助商Logo"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div class="sponsorImg" onclick="showPopup('sponsorId')">
						<span><ui:i18n key="添加图片"/></span>
					</div>
					<div class="sponsorImgShow" onclick="showPopup('sponsorId')">
						<input type="hidden" name="sponsorId" value="" />
					</div>
				</div>
			</div>
			
			<div class="control-warp">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="演讲介绍插图"/> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div class="lectDescImg" onclick="showPopup('lectDescImgId')">
						<span><ui:i18n key="添加图片"/></span>
					</div>
					<div class="lectDescImgShow" onclick="showPopup('lectDescImgId')">
						<input type="hidden" name="lectDescImgId" value="" />
					</div>
				</div>
			</div>
			
			<div class="control-warp editCss">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="演讲视频"/> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
  			 	 	<input type="text" placeholder='<ui:i18n key="请选择视频"/>' class="js-previewd-video-name" readonly="readonly" value="" style="float: left; width: 250px;"/>
  			 	 	<div style="float: left; margin-left: 10px;">
	  			 	 	<span class="button bg-orange js-choose-image" onclick="showVideoPopup();">
							<span class="button-name"><ui:i18n key="选择"/></span>
							<input type="hidden" name="lectMovId" value="" />
						</span>
  			 	 	</div>
				</div>
			</div>
			<div class="control-warp videoCss">
				<div class="form-label">
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div class="js-previewd-video" style="height: 145px; min-width: 250px; line-height: 145px; background-color: #fcfcfc; padding: 10px 10px 10px 10px; border: 1px solid #cccccc;">
					</div>
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="演讲介绍"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div id="containerWarp-lectDesc">
						<div id="js-editor-lectDesc"></div>
					</div>
				</div>
			</div>
			<div class="control-warp">
				<div class="form-label valign-top" style="margin-top: 5px;">
					<ui:i18n key="主讲人介绍"/><a class="label-required"></a> :
				</div>
				<div class="form-control" style="margin-left: 5px;">
					<div id="containerWarp-lecturerDesc">
						<div id="js-editor-lecturerDesc"></div>
					</div>
				</div>
			</div>
			
		</div>
		<div class="btn-save" onclick="save()">
			<span class="button-icon conform"></span>
			<span><ui:i18n key="保存"/></span>
		</div>
		<!-- ======================container end=========================== -->
	</div>
	<!-- ▲ container  -->
	
	<!-- ▼ bpopup area -->
	<ui:template id="bpopupPicture"/>
	<ui:template id="bpopupVideo"/>
	<!-- ▲ bpopup area -->
</body>
</html>