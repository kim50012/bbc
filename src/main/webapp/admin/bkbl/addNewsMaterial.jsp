<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor.css" /> 
<title><ui:i18n key="素材管理"/>::<ui:i18n key="添加多图文素材"/></title> 

</head>
<body>
	<%-- <jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType" />
	</jsp:include> --%>
	<!-- ▼ Main container -->
	<div class="container">
		<!-- ▼ Left Menu  -->
		<%-- <jsp:include page="/admin/inc/menuleft.jsp">
			<jsp:param value="${topMenuType}" name="topMenuType" />
			<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1" />
			<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2" />
		</jsp:include> --%>
		<!-- ▲ Left Menu  -->
		
   <style type="text/css" scoped="scoped">
   body{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
   h4 {
	display: block;
	font-weight: bold;
	-webkit-margin-before: 1.33em;
	-webkit-margin-after: 1.33em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

.main_bd {
	position: relative;
	overflow: hidden;
	padding-top: 5px;
	padding-bottom: 5px;
	min-height:350px;
}

.media_preview_area {
	float: left;
	display: table-cell;
	overflow: hidden;
	margin-right: 13px;
	margin-bottom: 20px;
	width: 300px;
	border: 1px solid #e7e7eb;
	background-color: #fff;
	color: #666;
	vertical-align: top;
	word-wrap: break-word;
	word-break: break-all;
}

.appmsg {
	min-height: 180px;
}

.appmsg_content {
	position: relative;
	border-bottom-width: 1px;
}

.appmsg_content .appmsg_item {
	position: relative;
	padding: 20px 14px;
	border-top: 1px solid #e7e7eb;
}

.appmsg_item:after {
	clear: both;
	display: block;
	height: 0;
	content: "\200B";
}

.appmsg_item .cover_appmsg_item {
	position: relative;
}

.appmsg_item .cover_appmsg_item .appmsg_title {
	position: absolute;
	bottom: 0;
	left: 1px;
	margin: 0;
	width: 270px;
	background: rgba(0,0,0,0.6)!important;
	pdding: 0;
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#99000000',endcolorstr = '#99000000');
}

.cover_appmsg_item .appmsg_title a {
	padding: 0 8px;
	color: #fff;
}

.appmsg_thumb.default {
	display: block;
	background-color: #ececec;
	color: #c0c0c0;
	text-align: center;
	font-weight: 400;
	font-style: normal;
	font-size: 16px;
	line-height: 160px;
}

.appmsg_thumb_wrp {
	overflow: hidden;
	height: 160px;
}

.appmsg_item .appmsg_title {
	overflow: hidden;
	margin-top: 14px;
	max-height: 48px;
	line-height: 24px;
}

.appmsg_item .appmsg_thumb_wrp .appmsg_thumb.default {
	width: 290px;
	height: 160px;
	font-size: 16px;
	line-height: 160px;
}

.appmsg_item .appmsg_thumb.default {
	font-size: 14px;
	line-height: 78px;
}

.editing .appmsg_thumb.default {
	display: block;
}

.editing .appmsg_thumb {
	display: none;
}

.appmsg_item .appmsg_thumb {
	float: right;
	margin-left: 14px;
	width: 78px;
	height: 78px;
}

.appmsg_item .appmsg_title {
	overflow: hidden;
	margin-top: 14px;
	max-height: 48px;
	line-height: 24px;
}

.appmsg_title a {
	display: block;
	color: #666;
}

.appmsg_item .appmsg_edit_mask {
	line-height: 118px;
}

.appmsg_edit_mask {
	position: absolute;
	top: 0;
	left: 0;
	display: none;
	width: 100%;
	height: 100%;
	background: rgba(229,229,229,0.85)!important;
	text-align: center;
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#d9e5e5e5',endcolorstr = '#d9e5e5e5');
}

.create_access_primary {
  display: block;
  margin-right: 15px;
  margin-bottom: 20px;
  margin-left: 5px;
  border: 2px dotted #d9dadc;
  text-align: center;
  font-size: 15px;
  line-height: 60px;
}

.create_access_primary:hover {
	border-color: #b3b3b3;
}

.media_edit_area {
	float: left;
	  /* display: table-cell; */
	width: 560px;
	vertical-align: top;
}

.media_edit_area:after {
	clear: both;
	display: block;
	visibility: hidden;
	height: 0!important;
	content: " . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ";
	line-height: 0;
}

.app-sidebar {
	position: relative;
	padding-left: 12px;
}

.app-sidebar .inner {
	padding: 12px 10px;
	min-height: 350px;
	min-height: 28px;
	border: 1px solid #e7e7e7;
	border-radius: 5px;
	background: #ffffff;
}
.app-design .app-sidebar {
  position: relative;
  float: left;
  width: 530px;
  margin-left: 30px;
  padding-bottom: 20px;
  font-size: 14px;
}
.app-design .app-preview {
  position: relative;
  float: left;
  width: 350px;
  left: 140px;
  border: 1px solid #e5e5e5;
  background-color: #000;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  background: #fff;
  border-radius: 47px;
  padding-bottom: 20px;
}
.sliderImg {
  width: 300px;
  height: 147px;
  overflow: hidden;
  position: relative;
  margin: 0px auto 18px;
  z-index: 3;
}
/* .app-sidebar .arrow,.app-sidebar .arrow:after {
	position: absolute;
	top: 19px;
	left: 2px;
	width: 0px;
	height: 0px;
	border-color: transparent #d1d1d1 transparent transparent;
	border-style: solid;
	border-width: 8px 10px 8px 0;
} */
.app-design .app-sidebar .arrow, .app-design .app-sidebar .arrow:after {
  left: 2px;
}
.app-sidebar .arrow:after {
	top: -8px;
	left: 1px;
	content: "";
	border-right-color: #fff;
}

.hiddenInputFile,.hiddenListInputFile {
	display: none;
}

.img-preview img,.list-img-preview img {
	vertical-align: bottom;
	width: 100px;
	height: 100px;
}

.selectFormAlbum {
	display: inline-block;
	margin-left: 10px;
	width: 130px;
	height: 30px;
	border: 1px solid #e7e7e7;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.btnArea {
	position: relative;
	text-align: center;
}

.btnArea .btn {
	display: inline-block;
	padding-right: 20px;
	padding-left: 20px;
	height: 30px;
	min-width: 50px;
	border: 2px solid #0e9715;
	border-radius: 20px;
	line-height: 30px;
	cursor: pointer;
}

.btnArea .btn +  .btn {
	margin-left: 20px;
	 
}
  </style>
  
  <!-- ▼ bpopup area -->
		<style scoped="scoped">
		  .userlist{
		   padding: 20px 20px;
		  }
		  
		  .userlist li{
		  float:left; width:150px;
		  height: 140px;
		  position: relative;
		  margin-bottom: 10px; 
		  text-align: center;
		  display: block;
		  }
		  .userlist li .headimgurl{
		    width:110px;height: 110px;
		  }
		  .userlist li .nickname{
		     line-height: 30px;height: 30px;
		  }
		  
		  
		  .useritem.selected  .user_mask {
				line-height: 140px;
				display : block;
			}
			
		  .useritem.selected  .user_mask .maskicon {
				display: inline-block;
				width: 50px;
				height: 50px;
				background: url("/admin/images/weixin/base_z231ecc.png") 2px -1907px no-repeat;
				vertical-align: middle;
			}
			
			.user_mask {
				position: absolute;
				top: 0;
				left: 0;
				display: none;
				width: 100%;
				height: 100%;
				  background: rgba(229,229,229,0.85)!important; 
				text-align: center;
				  filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#d9e5e5e5',endcolorstr = '#d9e5e5e5');  
			}
			
			.bpopup.bpoupCustSelect{width:950px;}
			.news-feed-control{
				cursor: pointer;
				float:right;
			}
			
			.button.bg-red{
				margin-top:30px;
				margin-left:30px;
			}
			input[type="text"]{
				margin-bottom:10px;
			}
			.img-show-able{
				width:100px;
				height:100px;
				position: relative;
				text-align: center;
				  background-image: url("/admin/images/rouletteActivity/icon_img.png");
				  background-position: 38px 33px;
				  background-repeat: no-repeat;
				  background-color: #f7f7f7;
				  cursor: pointer;
				  display: inline-block;
				  border:1px solid #eee;
			}
			.add-img-text{
				width:100%;
				text-align: center;
				display: inline-block;
				margin-top:65px;
				color:#5f5f5f;
				font-size:12px;
				margin-left:0;
			}
			.img-show-able.img-selected{
				background-image: none;
				background-color: #fff;
			}
			.img-show-able .delete-img.back-back{
				width: 100%;
				height:100%;
				position: absolute;
				background-color: #000;
  				opacity: 0.4;
				top:0;
				left:0;
				cursor: pointer;
				display:none;
			}
			.img-show-able .delete-img.back-img{
				width: 100%;
				height:100%;
				position: absolute;
				top:0;
				left:0;
				cursor: pointer;
				background-image: url("/admin/images/webzine/icon_del.png");
				background-repeat: no-repeat;
				background-position: center center;
				display:none;
			}
			.title-span{
				width:25%;
				margin-left:0;
				font-size:12px;
			}
			.icon18_common.edit_gray.js_edit{
				color:#fff;
				font-size:16px;
			}
			.icon18_common.del_gray.js_del{
				color:#fff;
				font-size:16px;
				margin-left:20px;
			}
			.appmsg_edit_mask{
				  background: rgba(0,0,0,0.4)!important;
			}
		 </style>
  
  <script type="text/javascript">
var editor = '';
 
function initPreview(){
	$('.js_appmsg_item').unbind('hover').hover(function() {
		$(this).find('.appmsg_edit_mask').show();
	},function() {
		$(this).find('.appmsg_edit_mask').hide();
	});
		   
	$('.js_del').unbind('click').click(function(){
		var id = $(this).data('id');
		$(this).closest('.js_appmsg_item').remove();
		$('.app-sidebar').hide();
	});
	
	$('.appmsg_edit_mask .js_edit').unbind('click').click(bindShowSidebar);
}



function bindShowSidebar(){ 
   	var $this = $(this).closest('.appmsg_item');
   	var id  = $this.data('id');
   	var $target = $('#js_appmsg_editor');
   	$target.data('id',id);
   	var top = $this.position().top;  
	$('.app-sidebar').css("margin-top", 70 + 'px').show();
	$('.app-sidebar').show();
	
	$('#newsType').select2('val', ($this.data('newsType') || ''));
	$target.find('#title').val($this.data('title') || '');
	$target.find('#author').val($this.data('author') || '');
	$target.find('#contentSourceUrl').val($this.data('contentSourceUrl') || '');
	$target.find('#digest').val($this.data('digest') || '');
	editor.setContent($this.data('content') || ''); 
	var imgUrl = $this.data('imgUrl') || '';
	var fileId = $this.data('fileId') || '';
	$('#js-preview-img').attr('src',imgUrl).data('id',fileId);
	if(imgUrl != ''){
		$('#coverPageImg').addClass('img-selected');
		$('#coverPageImg').find('.add-img-text').hide();
	}else{
		$('#coverPageImg').removeClass('img-selected');
		$('#coverPageImg').find('.add-img-text').show();
		$('#js-preview-img').hide();
	}

	var listImgUrl = $this.data('listImgUrl') || '';
	var listImgId = $this.data('listImgId') || '';
	
	$('#js-list-preview-img').attr('src',listImgUrl).data('id',listImgId);
	if(listImgUrl != ''){
		$('#listLeftImg').addClass('img-selected');
		$('#listLeftImg').find('.add-img-text').hide();
	}else{
		$('#listLeftImg').removeClass('img-selected');
		$('#listLeftImg').find('.add-img-text').show();
		$('#js-list-preview-img').hide();
	}
	
	var isChecked = $this.data('showCoverPic') || false;
	 
	if(isChecked){
		$('#show_cover_pic').iCheck('check');
	}else{
		$('#show_cover_pic').iCheck('uncheck');
	}
	
	if($this.data('coverType') == 'big'){
		$('.jsCoverImgTig').text('（<ui:i18n key="图片推荐尺寸"/>'+'：900<ui:i18n key="像素"/>'+' * 500<ui:i18n key="像素"/>'+'）');
	}else{
		$('.jsCoverImgTig').text('（<ui:i18n key="图片推荐尺寸"/>'+'：200<ui:i18n key="像素"/>'+'* 200<ui:i18n key="像素"/>'+'）');
	}
}

$(function(){
	
	initPreview();
	reloadMethod("");
	

	$('#js_add_appmsg').click(function(){
		var appmsgSize = $('.appmsg_item').size();
		if(appmsgSize > 8){
			alert('<ui:i18n key="你最多只可以加入8条图文消息"/>');
			return false;
		}
		   
		var paramObj = {
			id : _.random(1000000000, 9999999999)
		};
		var tpl = template('tpl_appmsg_item',paramObj);
		$('#js_appmsg_preview').append(tpl);
		initPreview();
	});
	  
	$('.js-delete-img').click(function(){
		$('#js-preview-img').attr('src','').data('id','').hide();
		$('#coverPageImg').removeClass('img-selected');
		$('#coverPageImg').find('.add-img-text').show();
		$('.js-delete-img').hide();
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		$target.data('imgUrl', '');
		$target.data('fileId', '');
		$target.find('.js_appmsg_thumb').attr('src','').hide();
	 	$target.find('.appmsg_thumb.default').show();
	 	event=event||window.event;    
	    event.stopPropagation();
	});
		
	
	$('.js-list-delete-img').click(function(){
		$('#js-list-preview-img').attr('src','').data('id','').hide();
		$('#listLeftImg').removeClass('img-selected');
		$('#listLeftImg').find('.add-img-text').show();
		$('.js-list-delete-img').hide();
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		$target.data('listImgUrl', '');
		$target.data('listImgId', '');
		event=event||window.event;    
	    event.stopPropagation();
	});
		
		
	$("#fileupload").fileupload({
		url:"/admin/upload",//文件上传地址，当然也可以直接写在input的data-url属性内
		formData:{fileGroup :  2},//如果需要额外添加参数可以在这里添加
		//maxFileSize : 1000,
		// maxNumberOfFiles:1,
		maxNumberOfFiles:1,
		acceptFileTypes:  /(\.|\/)(gif|jpe?g|png)$/i,
		done:function(e,res){
			//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
			//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
			//返回的数据在res.result中，假设我们服务器返回了一个json对象
			var $this = $(this).closest('.img-preview');
			
			var id = $('#js_appmsg_editor').data('id');
			var $target = $('#appmsgItem' + id);
			
			$.each(res.result, function (index, file) {
				if(file.success){
					$this.find('img').attr('src',file.fileUrl);
					$this.find('img').data('id',file.fileId);
					$this.find('.img-show-able').show();
			 
				 	$target.data('imgUrl' , file.fileUrl);
				 	$target.data('fileId' , file.fileId);
				 	
				 	$target.find('.js_appmsg_thumb').attr('src',file.fileUrl).show();
				 	$target.find('.appmsg_thumb.default').hide();
					// modal fade hide in
				}else{
					alert(file.message);
					$target.find('.js_appmsg_thumb').attr('src','').hide();
				 	$target.find('.appmsg_thumb.default').show();
				}
			});
		}
	});
	 
	$('.js-new-file-upload').click(function(){
		$('#files').click();
	});
	$('#coverPageImg').click(function(){
		$('#pictureType').val(1);
		 showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=2&max=1' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																			// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																			// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																			// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
			});	 	
	});
	
	///////////
	$("#listImgFileupload").fileupload({
		url:"/admin/upload",//文件上传地址，当然也可以直接写在input的data-url属性内
		formData:{fileGroup :  2},//如果需要额外添加参数可以在这里添加
		//maxFileSize : 1000,
		// maxNumberOfFiles:1,
		maxNumberOfFiles:1,
		acceptFileTypes:  /(\.|\/)(gif|jpe?g|png)$/i,
		done:function(e,res){
			//done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
			//注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
			//返回的数据在res.result中，假设我们服务器返回了一个json对象
			var $this = $(this).closest('.list-img-preview');
			
			var id = $('#js_appmsg_editor').data('id');
			var $target = $('#appmsgItem' + id);
			
			$.each(res.result, function (index, file) {
				if(file.success){
					$this.find('img').attr('src',file.fileUrl);
					$this.find('img').data('id',file.fileId);
					$this.find('.list-img-show-able').show();
			 
				 	$target.data('listImgUrl' , file.fileUrl);
				 	$target.data('listImgId' , file.fileId);
				 	
				 	//$target.find('.js_appmsg_thumb').attr('src',file.fileUrl).show();
				 	//$target.find('.appmsg_thumb.default').hide();
					// modal fade hide in
				}else{
					alert(file.message);
					//$target.find('.js_appmsg_thumb').attr('src','').hide();
				 	//$target.find('.appmsg_thumb.default').show();
				}
			});
		}
	});
	 
	$('.js-list-new-file-upload').click(function(){
		$('#listFiles').click();
	});
	$('#listLeftImg').click(function(){
		//admin/sendMsgAll/selectImg.jsp	
		$('#pictureType').val(2); 
		showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=2&max=1' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																			// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																			// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																			// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
			});	 		
	});
	
	///////////
		
		
	editor = UE.getEditor('js-editor', {
		autoHeight: false, 
		 toolbars: [[
	                    'undo', 'redo', '|',
	                     'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
	                     'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
	                     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	                     'directionalityltr', 'directionalityrtl', 'indent', '|',
	                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
	                     'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
	                     'simpleupload', 'insertvideo',  'emotion', 'music', 'map',  'template', 'background', '|',
	                     'horizontal', 'date', 'time', 'spechars',  '|',
	                     'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
	                     'searchreplace', 'help', 'source','image2'
	                 ]],
       	// initialFrameWidth :480,
		initialFrameHeight :300,
		elementPathEnabled : false
	});
	
	editor.ready(function() {
    	//editor.setContent($('.app-field.editing').find('.js-richtext').html()); 
       	editor.addListener("selectionchange",function(type,event){
       		var id = $('#js_appmsg_editor').data('id');
    		var $target = $('#appmsgItem' + id);
    		$target.data('content' , editor.getContent());
       		//$('#result').html(editor.getContent());
       		//$('.app-field.editing').find('.js-richtext').html(editor.getContent()  );
		});
	});
	
	$('.js-edit-area').unbind('keyup').keyup(function(){
		var $this =  $(this);
		var val = $this.val();
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
	 	var itemId = $this.attr('id');
	 	
	 	$target.data(itemId , val);
	 	if(itemId == 'title'){
	 		$target.find('.appmsg_title a').text(val);
	 	} 
		
	});
	
/* 	$('#show_cover_pic').click(function(){
		var checked = $(this).is(':checked');
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		//alert(id + ',' + checked);
		$target.data('showCoverPic' , checked);
		
	}); */
	$('#show_cover_pic').on('ifChecked', function(event){
		var checked = true;
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		//alert(id + ',' + checked);
		$target.data('showCoverPic' , checked);
	 });
	 $('#show_cover_pic').on('ifUnchecked', function(event){
		 var checked = false;
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		//alert(id + ',' + checked);
		$target.data('showCoverPic' , checked);
	 });
	$('#newsType').click(function(){
		var val = $(this).val();
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		$target.data('newsType' , val);
	});
	
	
	$('#saveMaterial').click(function(){ 
		
		var pp = [];
		
		var isValid = true;
		
		$('.js_appmsg_item').each(function(){
		 
			var $this = $(this);
	 
			var id = $this.data('id') || '';
			var newsType = $this.data('newsType') || '';
			var title = $this.data('title') || ''; //是 图文消息的标题 
			var author = $this.data('author') || '';//否 author
			var contentSourceUrl = $this.data('contentSourceUrl') || '';//否 在图文消息页面点击“阅读原文”后的页面
			var digest = $this.data('digest') || '';//否  图文消息的描述
			var imgUrl = $this.data('imgUrl') || ''; //是 图文消息缩略图的media_id，可以在基础支持-上传多媒体文件接口中获得
			var fileId = $this.data('fileId') || ''; //是 图文消息缩略图的media_id，可以在基础支持-上传多媒体文件接口中获得
			var listImgId = $this.data('listImgId') || '';
			var showCoverPic = $this.data('showCoverPic') || false;//否 是否显示封面，1为显示，0为不显示
			
			if (showCoverPic){
				showCoverPic = 1;
			}else{
				showCoverPic = 0;
			}
			var content = $this.data('content') || ''; //是 图文消息页面的内容，支持HTML标签
			
			
			$('.appmsg_edit_mask .js_edit').unbind('click').click(bindShowSidebar);
			if(newsType == ''){
				showSlider(id);
				alert('<ui:i18n key="请选择图文消息类型"/>!');
				isValid =false;
				return false;
			}
			
			if(title == '' ){
				showSlider(id);
				alert('<ui:i18n key="请输入标题"/>!');
				isValid =false;
				return false;
			}
			
			if(imgUrl == '' ){
				showSlider(id);
				alert('<ui:i18n key="请选择缩略图"/>!');
				isValid =false;
				return false;
			}
			if(content == '' ){
				showSlider(id);
				alert('<ui:i18n key="请输入内容"/>!');
				isValid =false;
				return false;
			}
			
			var item = {
				id : id, 		
				newsType : newsType, 		
				title : title, 		
				author : author, 		
				contentSourceUrl : contentSourceUrl,	
				digest : digest, 		
				fileId : fileId, 		
				showCoverPic : showCoverPic, 		
				content : content ,		
				listImgId : listImgId 		
			};
			
			pp.push(item);
			
		});
		
		if(!isValid){
			return ;
		}
		
		$('body').showLoading({'vPos':'200px'   });
		$.ajax({
			url : "/admin/weixin/material/addNews.htm",
			type : "POST",
			data : {
				jsonStr : JSON.stringify(pp)
			},
			success : function(data) {
				$('body').hideLoading();
				if (data.success) {
					alert('<ui:i18n key="保存成功"/>');
					window.top.closeTab();
				} else {
					alert('<ui:i18n key="保存失败"/>!' + data.msg );
				}
			},
			error : function(xhr, status, e) {
				$('body').hideLoading();
				alert("error: " + status);
			}
		});
	});
	
	$(".news-feed-control").click(function(){
		$('#iframe_avi_music_image').attr('src','/admin/weixin/material/newsFeedControl.htm');
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 650,
			height : 450,
			action : $('#iframe_avi_music_image').attr('src')
		});
	});
	
});
//弹出窗口
function choosePicture(obj){
	 console.log('-------parent');
	 //这里写自己的逻辑
	 /* for(var i = 0;i < obj.length ; i++){
		 var imgUrl = obj[i].fileUrl;
			
					
	 } */
	 var imgUrl = obj[0].fileUrl;
	 var fileId = obj[0].fileId;
	 var pictureType = $('#pictureType').val();
	 if(pictureType == '1' || pictureType == '1'){
		 var $this = $('.img-preview');
			var id = $('#js_appmsg_editor').data('id');
			var $target = $('#appmsgItem' + id);
		 $('#js-preview-img').attr('src',imgUrl).data('id',fileId).show();
		 $('#coverPageImg').addClass('img-selected');
		$('#coverPageImg').find('.add-img-text').hide();
		$target.data('imgUrl' ,imgUrl);
	 	$target.data('fileId' , fileId);
	 	
	 	$target.find('.js_appmsg_thumb').attr('src',imgUrl).show();
	 	$target.find('.appmsg_thumb.default').hide();
	 }else{
		 $('#js-list-preview-img').attr('src',imgUrl).data('id',fileId).show();
		 $('#listLeftImg').addClass('img-selected');
		$('#listLeftImg').find('.add-img-text').hide();
		var $this = $('.list-img-preview');
		var id = $('#js_appmsg_editor').data('id');
		var $target = $('#appmsgItem' + id);
		

	 	$target.data('listImgUrl' ,imgUrl);
	 	$target.data('listImgId' , fileId);
	 }
	 closePictureWindow();
}	 
function selectImgFromAlbum(fileId,imgUrl){
	
	var $this = $('.img-preview');
	var id = $('#js_appmsg_editor').data('id');
	var $target = $('#appmsgItem' + id);
	
	$this.find('img').attr('src',imgUrl);
	$this.find('img').data('id',fileId);
	$this.find('.img-show-able').show();

 	$target.data('imgUrl' ,imgUrl);
 	$target.data('fileId' , fileId);
 	
 	$target.find('.js_appmsg_thumb').attr('src',imgUrl).show();
 	$target.find('.appmsg_thumb.default').hide();
	
	
	
}

function selectListImgFromAlbum(fileId,imgUrl){
 
	var $this = $('.list-img-preview');
	var id = $('#js_appmsg_editor').data('id');
	var $target = $('#appmsgItem' + id);
	
	$this.find('img').attr('src',imgUrl);
	$this.find('img').data('id',fileId);
	$this.find('.list-img-show-able').show();

 	$target.data('listImgUrl' ,imgUrl);
 	$target.data('listImgId' , fileId);
	
}

function closeWindow(){
	$('#bpoupAlbum').bPopup().close();
}

function showSlider(id){
	$('.appmsg_edit_mask .js_edit').each(function(){
		if($(this).data('id') == id){
			$(this).trigger('click');
			return false; 
		}
	});
}	

//弹出框关闭时候，更新数据
function reloadMethod(bgName){
	$.ajax({
		url : "/admin/weixin/material/getNewsFeedList.htm",
		type : "POST",
		success : function(data) {
			var list=data.list;
			if (list.length>0) {
				var newsType = $('#newsType').find('option:selected').val();
				$('#newsType').children().remove();
				var htm="<option value=''></option>";
				for(var i=0;i<list.length;i++){
					if(bgName==list[i].CD_VAL && bgName!=""){
						newsType=list[i].CD_ID;
					}
					htm+="<option value='"+list[i].CD_ID+"'>"+list[i].CD_VAL+"</option>";
				}
				$('#newsType').append(htm);
				$("#newsType").select2("val",newsType);
			} else {
				window.location.reload();
			}
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
}
//关闭窗口	
function closePictureWindow(){
 	closeBpopupWindow('bpopupPicture');
}
function closeWindow(){
	closeBpopupWindow('bpopupPicture');
}
  </script>
  <input type="hidden" value="" id="pictureType"/>
		<%--  --%>
		<!-- ▼ detali content  -->
		<div class="ui-right-content app-design clearfix" >
		 		<%-- <div style=""><ui:i18n key="标题部分"/></div> --%>
			 	<div class="main_bd"  >
					<div class="app-preview" style="left:2%;width:320px;">
			    		<div class="app-header"></div>
			   			 <div class="app-entry" style="height:460px;width:300px;">
			        		<div class="app-config">
			            		<div id="app-field-header" class="app-field-addImg" style="cursor: default;">
			                		<!-- <h1><span></span></h1> -->
					                <!-- <div class="goods-details-block" style="height:310px;background-image: url('');">
					                    <h4 style="margin-top:100px;">Banner展示区</h4>
					                    <p style="margin-top:30px;">最多可选1张图片</p>
					                </div> -->
					                <div class="sliderImg" style="height:450px;overflow-y: scroll;">
													<div  class="media_preview_area"  >
														 <div class="appmsg multi editing">
															<div id="js_appmsg_preview" class="appmsg_content">
																<div id="appmsgItem1" data-fileid data-id="1" data-cover-type="big" class="js_appmsg_item appmsg_item">
																	<div class="cover_appmsg_item">
																		<h4 class="appmsg_title">
																			<a href="javascript:void(0);" onclick="return false;" target="_blank"></a>
																		</h4>
																	 	<div class="appmsg_thumb_wrp">
																	 	   <img class="js_appmsg_thumb appmsg_thumb" style="height:160px ; width:290px;"  src="">
									               						 	<i class="appmsg_thumb default"><ui:i18n key="封面图片"/></i>
																	 	</div>
																	 	<div class="appmsg_edit_mask" style="z-index: 3">
															                <a onclick="return false;" class="icon18_common edit_gray js_edit" data-id="1" href="javascript:;"><ui:i18n key="编辑"/></a>
															            </div>
																	</div>
																</div>
															 	<div id="appmsgItem2" data-fileid data-id="2"  data-cover-type="small"  class="js_appmsg_item appmsg_item">
															 		 <img class="js_appmsg_thumb appmsg_thumb" src="">
																    <i class="appmsg_thumb default"><ui:i18n key="缩略图"/></i>
																    <h4 class="appmsg_title"><a onclick="return false;" href="javascript:void(0);" target="_blank"><ui:i18n key="标题"/></a></h4>
																    <div class="appmsg_edit_mask">
																        <a class="icon18_common edit_gray js_edit" data-id="2" onclick="return false;" href="javascript:void(0);"><ui:i18n key="编辑"/></a>
																         <a class="icon18_common del_gray js_del" data-id="2" onclick="return false;" href="javascript:void(0);"><ui:i18n key="删除"/></a>
																    </div>
																</div>
															 	 
															</div>
														 
															 <a onclick="return false;" class="create_access_primary appmsg_add" id="js_add_appmsg" href="javascript:void(0);">
															 	<ui:i18n key="添加"/>
															 </a>  
															 
																				 
											</div>
											 
										</div>
										
									</div>
			            		</div>
			            		
			        		</div>
			        		<div class="app-fields js-fields-region">
			        			<div class="app-fields ui-sortable">
			        			<!-- edding area -->
			        			 
			        			<!-- edding area -->
									 
			        			</div>
			        		</div>
			    		</div>
			    		<div class="app-footer"></div>
				</div>
					 <div class="media_edit_area">
							 	<div id="js_appmsg_editor" data-id="1">
							 		<div class="app-sidebar" style="margin-top: -10000px;">
										<div class="inner">
											<div  style="width:100%; padding-bottom: 10px;height:32px;line-height:32px;">
												<span class="title-span"><ui:i18n key="图文消息类型"/><span style="color:#d1102d;">*</span>：</span>
												<select class="select2" id="newsType" data-placeholder="<ui:i18n key="请选择"/>" style="width:300px;font-size:12px;" >
													<option value=""></option>
													<option value="1"><ui:i18n key="最新资讯"/></option>
													<option value="2"><ui:i18n key="精彩促销"/></option>
												</select>
												<div class="news-feed-control">
													<img src="/admin/images/icon/list.png" />
												</div>
											</div>
											<div  style="width:100%; padding-bottom: 10px;height:32px;line-height: 32px;">
												<span class="title-span"><ui:i18n key="标题"/><span style="color:#d1102d;">*</span>：</span>
												<input type="text" id="title" class="js-edit-area" maxlength="64" style="width:280px;" />
											</div>
											<div  style="width:100%; padding-bottom: 10px;height:32px;line-height: 32px;">
												<span class="title-span"><ui:i18n key="作者"/><%-- （<ui:i18n key="选填"/>） --%>：</span>
												<input type="text" id="author" class="js-edit-area" maxlength="20"  style="width:280px;"  />
											</div>
											<div  style="width:100%;">
												 <%--  <span class="selectFormAlbum js-new-file-upload"><ui:i18n key="上传"/></span>  
												  <span class="selectFormAlbum js-select-form-album"><ui:i18n key="从图片库选择"/></span> --%>
												  <span class="title-span" style="margin-top:15px;"><ui:i18n key="封面"/><span style="color:#d1102d;">*</span>：</span>  
													<div class="img-preview" style="padding-top:10px;">
														<!--  <form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
													        <input class="hiddenInputFile" data-id="1" id="files" type="file" name="files[]" accept="image/png,image/jpeg"   >  
													     </form> -->
														 <div   class="img-show-able" id="coverPageImg">
														 	<img src="" id="js-preview-img"/>
														 	<span class="add-img-text" ><ui:i18n key="添加图片"/></span>
														 	<div class="delete-img back-back js-delete-img"></div>
														 	<div class="delete-img back-img js-delete-img"></div>
														 </div>
														 <span class="jsCoverImgTig" style="color:#d1102d;"></span>
													</div>
											</div>
											<%-- <div  style="width:100%;">
												<span class=""><ui:i18n key="列表左侧图片"/></span>  
											</div> --%>
											<div  style="width:100%;">
												  <%-- <span class="selectFormAlbum js-list-new-file-upload"><ui:i18n key="上传"/></span>  
												  <span class="selectFormAlbum js-list-select-form-album"><ui:i18n key="从图片库选择"/></span> --%>
												  <span class="title-span" style="margin-top:15px;"><ui:i18n key="列表左侧图片"/>：</span>  
													<div class="list-img-preview" style="padding-top:10px;">
														 <form  id="listImgFileupload" action="" method="POST" enctype="multipart/form-data">
													        <input class="hiddenListInputFile" data-id="1" id="listFiles" type="file" name="files[]" accept="image/png,image/jpeg"   >  
													     </form>
														 <div   class="img-show-able"  id="listLeftImg">
														 	<span class="add-img-text" ><ui:i18n key="添加图片"/></span>
														 	<img src="" id="js-list-preview-img"/>
														 	<div class="delete-img back-back js-list-delete-img"></div>
														 	<div class="delete-img back-img js-list-delete-img"></div>
														 </div>
													</div>
											</div>
											<div  style="width:100%; vertical-align: middle;margin-top:10px;margin-bottom:20px;font-size:12px;">
												 <input type="checkbox" class="iccheckbox" id="show_cover_pic" value="1" /><ui:i18n key="封面图片显示在正文中"/>
											</div>
											<div  style="width:100%;font-size:12px;">
												<ui:i18n key="正文"/>
											</div>
											<div  style="width:100%;">
												<div id="containerWarp">
											 		<div id="js-editor" class="js-editor edui-default" style=""></div>
												</div>
											</div>
											<div  style="width:100%; padding-bottom: 10px;margin-top:10px;height:32px;line-height: 32px;">
												<span class="title-span"><ui:i18n key="原文链接"/><%-- （<ui:i18n key="选填"/>） --%>：</span>
												<input type="text" id="contentSourceUrl" name="contentSourceUrl" class="js-edit-area"   style="width:280px;"  />
											</div>
											<div  style="width:100%; padding-bottom: 10px;height:32px;line-height: 32px;">
												<span class="title-span"><ui:i18n key="摘要"/><%-- （<ui:i18n key="选填"/>） --%>：</span>
												<input type="text" id="digest" class="js-edit-area" style="width:280px;"  />
											</div>
 										</div>
										<div class="arrow"></div>
									</div>	
							 	</div>
							 </div>
							 <!-- ▲ media_edit_area -->
					 
				</div>
				<!--  ▲ main_bd -->
				<div class="btnArea" >
					<span id="saveMaterial" class="button bg-red" style=""><ui:i18n key="保存"/></span>
				</div>
		</div>
		
	</div>
	<!-- ▲ Main container -->
	
		<ui:template id="bpopupPicture"/>
		 <!-- ▼ bpopup area -->
				<div class="bpopup2" id="bpoupMessage" >
				 	<div class="bpopupWarp">
				 		 <div class="bpopupHeaderWarp">
							<h3 class="bpopupTitle js-title"><ui:i18n key="图文类型管理"/></h3>
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
	<!-- ▼ Main footer -->
	<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
	<!-- ▲  Main footer -->
<script id="tpl_appmsg_item"  type="javascript/html">
	<div  id="appmsgItem{{id}}" data-fileid data-id="{{id}}" data-cover-type="small"  class="js_appmsg_item appmsg_item">
							 		 <img class="js_appmsg_thumb appmsg_thumb" src="">
								    <i class="appmsg_thumb default"><ui:i18n key="缩略图"/></i>
								    <h4 class="appmsg_title"><a onclick="return false;" href="javascript:void(0);" target="_blank"><ui:i18n key="标题"/></a></h4>
								    <div class="appmsg_edit_mask">
								        <a class="icon18_common edit_gray js_edit" data-id="{{id}}" onclick="return false;" href="javascript:void(0);"><ui:i18n key="编辑"/></a>
								        <a class="icon18_common del_gray js_del"  data-id="{{id}}" onclick="return false;" href="javascript:void(0);"><ui:i18n key="删除"/></a>
								    </div>
								</div>

	</script>	
	
	<script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>
 	<script type="text/javascript" src="/admin/js/ueditor/dialogs/image2/image.js"></script> 
</body>
</html>