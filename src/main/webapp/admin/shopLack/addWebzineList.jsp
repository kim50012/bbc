<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="创建微杂志页面 "/></title>  
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" /> 
<jsp:include page="/admin/js/goods/goods-editor.jsp" />
<link rel="stylesheet" type="text/css" href="/admin/css/test.css" />
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script> 
<style type="text/css">
	body{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
	input,button{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
	.app-design .app-preview .app-config .app-field-addImg {
		cursor: pointer;
		background-color: transparent;
	}
	
	.app-design .app-preview .app-config .app-field-addImg:hover {
		background-color: transparent;
	}
	
	.app-design .app-preview .app-config .app-field-addImg h1 {
		padding: 18px 60px 0 60px;
		height: 46px;
		line-height: 46px;
		font-size: 16px;
		color: #fff;
		font-weight: bold;
		text-align: center;
		background: url("/admin/images/widget/titlebar.png") no-repeat;
	}
	
	.app-design .app-preview .app-config .app-field-addImg h1 span {
		display: inline-block;
		height: 46px;
		width: 200px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
	}
	.select-img-div{
		width:700px;
		position: absolute;
		top:20px;
		left:150px;
		background-color: #ffffff;
		border-radius:6px 6px 6px 6px;
		display: none;
		z-index:200;
	}
	 .title-select-img-div{
		height:30px;
		background-color: #d1102d;
		line-height: 30px;
		border-radius:6px 6px 0 0;
		position: relative;
	}
	 .title-upload {
		color: #fff;
		font-size: 14px;
		text-decoration: underline;
		cursor: pointer;
	}
	.modal-title{
		color:#fff;
		font-size:18px;
		padding-left:20px;
	}
	.title-select-img-div div{
		background-image: url("/admin/images/goodsSell/close.png");
		background-position: center;
		background-repeat: no-repeat;
		float: right;
		width:30px;
		height:30px;
		display: inline-block;
		cursor: pointer;
		margin-right:10px;
	}
	.select-img-div .img-select-tbody tr td{
		border-top:1px solid #eeeeee;
		height:65px;
		vertical-align: middle;
	}
	.select-img-div .img-select-tbody .border-no{
		border:0;
	}
	.select-img-div tfoot tr td{
		border-top:1px solid #eeeeee;
		height:40px;
		vertical-align: middle;
		border-radius:0 0 6px 6px;
	}
	.select-img-div .img-select-tbody tr td img{
		width:60px;
		height:60px;
	}
	.selected-span{
		margin-left:0;
		width:45px;
		height:24px;
		background-color: #eee;
		text-align: center;
		vertical-align: middle;
		line-height:24px;
		border-radius:4px;
		cursor: pointer;
		border:1px solid #d5d5d5;
	}
	.selected-span.selected-revise{
		color: #ffffff;
		background-color: #3275dd;
	}
	.page_span{
		width:12px;
		height:22px;
		background-repeat: no-repeat;
		display: inline-block;
		cursor: pointer;
		margin-bottom:-2px;
	}
	.page_span.page_first{
		margin-left:120px;
		background-image: url("/admin/images/sendMsgAll/page_first.png");
	}
	.page_span.page_first_none{
		margin-left:120px;
		background-image: url("/admin/images/sendMsgAll/page_firstno.png");
	}
	.page_span.page_front{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_front.png");
	}
	.page_span.page_front_none{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_headno.png");
	}
	.page_span.page_next{
		background-image: url("/admin/images/sendMsgAll/page_next.png");
	}
	.page_span.page_next_none{
		background-image: url("/admin/images/sendMsgAll/page_nextno.png");
	}
	.page_span.page_end{
		margin-right:80px;
		background-image: url("/admin/images/sendMsgAll/page_last.png");
	}
	.page_span.page_end_none{
		margin-right:80px;
		background-image: url("/admin/images/sendMsgAll/page_endno.png");
	}
	.submit-image-div,.submit-url-div{
		display: inline-block;
		width:76px;
		heihgt:24px;
		background-color: #ff834d;
		line-height: 24px;
		text-align: center;
		color: #ffffff;
		margin-left:20px;
		border-radius:6px;
		cursor: pointer;
	}
	.select-img-div tfoot span{
		margin-left:0;
		float: none;
	}
	.select-img-div  .select2{
		width:100px;
		margin-right:0;
		margin-left:20px;
	}
	.select-img-div thead tr td{
		font-size:14px;
		height:30px;
	}
	.page-span-div{
		display: inline-block;
		position: relative;
		height:30px;
		text-align: center;
		line-height: 30px;
		vertical-align: middle;
		float: none;
		margin-top:15px;
	}
	.page-span-div span{
		margin-right:20px;
	}
	.fullbg_div { 
		background-color:#000000; 
		left:0;
		opacity:0.4;
		position:absolute; 
		top:0; 
		z-index:100;
		filter:alpha(opacity=40);
		-moz-opacity:0.4; 
		-khtml-opacity:0.4; 
	}
	.close-modal-small {
		position:absolute;
		top: 0;
		right: 0;
		width: 98px;
		height: 98px;
		background-color:#000;
		opacity:0.4;
		display:none;
		cursor: pointer;
	}
	.delete-img-close{
		position: absolute;
		top:38px;
		left:40.5px;
		display:none;
		z-index:200;
		cursor: pointer;
	}
	.close-modal-small.show-delete{
		background-color: #07d;
		color:#ffffff;
	}
	.sliderImg ul {
		width:100%;
		height:100%;
		display:none;
		
	}
	.sliderImg ul:first-child{
		display:inline-block;
	}
	.sliderImg ul li{
		width:100%;
		height:100%;
		background-color: #eeeeee;
	}
	.sliderImg ul li img{
		width:100%;
		height:100%;
	}
	.replace-img-div{
		height:20px;
		width:100%;
		position: absolute;
		display: inline-block;
		margin-top:400px;
		text-align: center;
		line-height: 20px;
		vertical-align: middle;
	}
	.replace-img-div span{
		width:10px;
		height:10px;
		border-radius:5px;
		display: inline-block;
		background-color: #eeeeee;
		opacity:0.4;
		float:none;
		margin-left:5px; 
		border:1px solid #333333;
	}
	.page-name-input-div{
		margin-top:10px;
		margin-bottom:20px;
		margin-left:20px;
	}
	.page-name-input-div span{
		color: #d1102d;
	}
	.page-name-input-div input{
		margin-left:10px;
	}
	.top_head_div{
		width:100%;
		background-color:  #d1102d;
		color:#ffffff;
		height:50px;
		font-size:18px;
		vertical-align: middle;
		line-height: 50px;
	}
	.top_head_div span{
		margin-left:30px;
	}
	.select-goods-url-div{
		display:none; 
		width:615px;
		position: absolute;
		top:100px;
		left:18%;
		background-color: #ffffff;
		border-radius:6px 6px 6px 6px;
		z-index:300;
	}
	.url-query-div{
		height:33px;
		margin-top:20px;
		line-height:33px;
		vertical-align: middle;
		font-size:14px;
	}
	.url-query-div span{
		margin-left:20px;
	}
	.url-query-div .select2{
		width:165px;
		margin-left:20px;
	} 
	.url-query-div input{
		width:150px;
		margin-left:20px;
		height:24px;
	}
	.submit-query-span{
		float:right;
		width:45px;
		height:24px;
		border:1px solid #d5d5d5;
		background-color: #eeeeee;
		cursor: pointer;
		line-height: 24px;
		text-align: center;
		margin-top:4px;
		margin-right:25px;
		border-radius:4px;
	}
	.select-goods-url-div table thead tr td{
		height:30px;
		font-size:14px;
	}
	.select-goods-url-div table tbody tr td{
		font-size:12px;
		height:35px;
		line-height: 35px;
		vertical-align: middle;
		border-top:1px solid #eeeeee;
	}
	.select-goods-url-div table tbody tr td span{
		margin-left:6px;
	}
	.select-goods-url-div table tbody tr .border-no{
		border:0;
	}
	.select-goods-url-div  tfoot span{
		margin-left:0;
		float: none;
	}
	.select-goods-url-div  tfoot  td{
		border-top:1px solid #eeeeee;
	}
	.select-goods-url-div .foot-page-select .select2{
		width:100px;
		margin-right:0;
		margin-left:20px;
	}
	.page_span_url{
		width:12px;
		height:22px;
		background-repeat: no-repeat;
		display: inline-block;
		cursor: pointer;
		margin-bottom:-2px;
	}
	.page_span_url.page_first{
		margin-left:50px;
		background-image: url("/admin/images/sendMsgAll/page_first.png");
	}
	.page_span_url.page_first_none{
		margin-left:50px;
		background-image: url("/admin/images/sendMsgAll/page_firstno.png");
	}
	.page_span_url.page_front{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_front.png");
	}
	.page_span_url.page_front_none{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_headno.png");
	}
	.page_span_url.page_next{
		background-image: url("/admin/images/sendMsgAll/page_next.png");
	}
	.page_span_url.page_next_none{
		background-image: url("/admin/images/sendMsgAll/page_nextno.png");
	}
	.page_span_url.page_end{
		margin-right:70px;
		background-image: url("/admin/images/sendMsgAll/page_last.png");
	}
	.page_span_url.page_end_none{
		margin-right:70px;
		background-image: url("/admin/images/sendMsgAll/page_endno.png");
	}
	.selected-span-url{
		margin-left:0;
		width:45px;
		height:24px;
		background-color: #eee;
		text-align: center;
		vertical-align: middle;
		line-height:24px;
		border-radius:4px;
		cursor: pointer;
		border:1px solid #d5d5d5;
	}
	.selected-span-url.selected-revise{
		color: #ffffff;
		background-color: #3275dd;
	}
	.topBorder {width: 100%; height: 25px; margin-top: 30px; border-top: 1px solid #eeeeee; position: relative;}
	.ui-title {position: absolute; width: auto; height: 24px; top: -10px; left: 0px; z-index: 1; background-color: #ffffff;padding-right:20px;}
	.ui-title img {margin: -4px 20px 0px 15px;}
	.ui-title span {font-size: 16px;}
	
	
	.div-img-warp .div-img-link {
	  float: left;
	  position: relative;
	  height: 60px;
	  line-height: 30px;
	  margin-left: 20px;
	  margin-top: 15px;
	}
	.div-img-warp {
	  height: 100px;
	  width: 520px;
	}
	.js-img-area{
		padding-top:10px;
	}
	.div-img-warp .div-img {
	  float: left;
	  position: relative;
	  width: 98px;
	  height: 98px;
	  border: 1px solid #ddd;
	}
	.app-design .app-sidebar {
	  position: relative;
	  float: left;
	  width: 540px;
	  padding-bottom: 20px;
	  font-size: 12px;
	}
	label, input, button, select, textarea {
		font-size:12px;
	}
.module-goods-list li, .app-image-list li {
  float: left;
  margin: 0 10px 10px 0;
  display: block;
  width: 100px;
  height: 100px;
  border: 1px solid #ddd;
  background-color: #fff;
  position: relative;
}
.js-add-goods.add-goods{
  display: inline-block;
  width: 100%;
  height: 100%;
  text-align: center;
  background: url("/admin/images/rouletteActivity/icon_img.png");
  background-position: 38px 33px;
  background-repeat: no-repeat;
  background-color: #f7f7f7;
  cursor: pointer;
  display: inline-block;
  line-height: normal;
}
.add-img-text{
	width:100%;
	text-align: center;
	display: inline-block;
	margin-top:60px;
	color:#5f5f5f;
	font-size:12px;
	margin-left:0;
}
.img-width-span{
  color: red;
  position: absolute;
  left: 110px;
  top: 80px;
  width: 220px;
  color: red;
}
.btn-step {
	display: inline-block;
  	height: 30px;
	line-height: 30px;
	border-radius: 2px;
	cursor: pointer;
	background-color: #d1102d;
	text-align: center;
	width: 90px;
	color: #fff;
	font-size: 12px;
	background-repeat: no-repeat;
	background-position: 70px 9px;
	border: 0; 
  	padding-left: 0;
  	padding-right:0;
}
.navi-button-area {
	margin: 0 auto;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	height: 34px;
	padding: 8px 0;
	background-color: #fff;
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
.btn-span{
	width:60px;
	background-color: #fb6e52;
	padding:0;
	height:30px;
	display: inline-block;
	float:none;
	margin-left:0;
	border-radius:2px;
	color:#fff;
	font-size:12px;
	text-align: center;
	line-height:30px;
	cursor: pointer;
}
.div-img-warp .div-img a img{
		width:100%;
		height:100%;
	}
	.goods-details-block p {
    margin: 0;
    font-size: 14px;
    line-height: 24px;
}
.goods-details-block h4 {
    margin: 0;
    font-size: 16px;
    line-height: 24px;
}
.goods-details-block {
    padding: 50px 0 0;
    background: #fff;
    text-align: center;
    color: #666;
    background-image: url("/admin/images/widget/top-banner.png");
    height: 140px;
}
</style>

<script type="text/javascript">
//判断已经有几张图片了
var indexNow = -1;
var objUrlSelect;
var flagOne = true;
$(function() {
	$(window).scroll(function () {
		$('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
	});
	
	//点击input file的文件选择
	$('.js-file-upload-test').click(function(){
		 $('#files-test').click();
	});

	$('.btn-step').click(function(){
		if($(this).find('span').text() == '<ui:i18n key="保存"/>'){
			var imgUrlAll = '';
			var goodsUrlAll = '';
			var imgflag = true;
			var goodsflag = true;
			var pageName = $('#pageName').val();
			if(pageName == ''){
				alert('<ui:i18n key="请填写微杂志页面名"/>');
				return;
			}
			$('.div-img-warp').each(function(){
				var imgUrl = $(this).find('.div-img').find('img').attr('src');
				imgflag = false;
				imgUrlAll += imgUrl+',';
				var goodsUrl = $(this).find('.div-img-link').find('input').val();
				if(goodsUrl == ''){
					goodsflag = false;
				}else{
					goodsUrlAll += goodsUrl+',';
				}
			});
			if(imgflag){
				alert('<ui:i18n key="请添加图片"/>');
				return;
			}
			if(!goodsflag){
				alert('<ui:i18n key="请为图片添加链接"/>');
				return;
			}
			imgUrlAll = imgUrlAll.substr(0,(imgUrlAll.length-1));
			goodsUrlAll = goodsUrlAll.substr(0,(goodsUrlAll.length-1));
			var param = {imgUrlAll:imgUrlAll,goodsUrlAll:goodsUrlAll,pageName:pageName};
			$.ajax({
				data:param,
				url : '/admin/shopLack/saveWebzine.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						alert('<ui:i18n key="保存成功"/>');
						window.location.href = '/admin/shopLack/webzineList.htm';
					}else{
						alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			 });
		}else{
			window.history.back();
		}
	});
}); 

//弹出选择图片的div
function selectedImg(){
	showPopup();
} 
//弹出选择链接的div
function selectedUrl(){
		$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectMaterial.htm?fileGroup=2');
		$('.bpopupTitle.js-title').text('<ui:i18n key="选择链接"/>');
		var height = 500;
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 830,
			height : height,
			action : $('#iframe_avi_music_image').attr('src')
		});
}
function closeDivMaterial(url){
	objUrlSelect.parent().find('input').val(url);
	closeBpopupWindow('bpoupMessage');
}
function closebpoupMe(){
	closeBpopupWindow('bpoupMessage');
}
function showPopup(){
	 var indexLimit = 6 - (indexNow+1);
		if(indexLimit == 0){
			alert('<ui:i18n key="已选择六张图片"/>，<ui:i18n key="不可再选择图片"/>');
			return;
		}
		 showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=1&max='+indexLimit //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																			// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																			// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																			// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
			});	 	
}

//弹出窗口
function choosePicture(obj){
	 console.log('-------parent');
	 //这里写自己的逻辑
	 for(var i = 0;i < obj.length ; i++){
		 var imgUrl = obj[i].fileUrl;
			var htm =  '<ul class="js-img-area">'+
							'<li class="sort">'+
								'<div class="div-img-warp">'+
									'<div class="div-img">'+
										 '<a href="javascript:void(0);">'+
											'<img src="'+imgUrl+'" alt="<ui:i18n key="商品图"/>">'+
										 '</a>'+
										 '<div class="close-modal-small" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"/>'+
									'</div>'+
									'<div class="div-img-link">'+
										'URL：<br><input type="text" class="js-link" style="width:230px;" value="" readonly="readonly">'+
										'<span class="btn-span js-url-input" style="margin-left:5px;margin-right:5px;"><ui:i18n key="手输"/></span>'+
										'<span class="btn-span js-url-select"><ui:i18n key="选择"/></span>'+
									'</div>'+
								'</div>'+
							'</li>'+
						'</ul>' ;
			$('#appendChildGroup').append(htm);
			$('.goods-details-block').attr('style','display:none;');
			htm = '<ul> <li> <img src="'+imgUrl+'"/> </li> </ul>';
			$('.sliderImg').show();
			$('.replace-img-div').before(htm);
			indexNow += 1;
			htm = '<span data-id="'+indexNow+'"></span>';
			$('.replace-img-div').append(htm); 
	 }
	 
		
		$('.replace-img-div').find('span').mouseover(function(){
			$('.span-show-now').attr('style','opacity:0.4;').removeClass('span-show-now');
			$(this).addClass('span-show-now').attr('style','opacity:1.0;');
			var index = $(this).attr('data-id');
			$('.sliderImg').find('ul').attr('style','display:none');
			$($('.sliderImg').children()[index]).attr('style','display:inline-block');
		});
		$('.div-img').mouseover(function(){
			$($(this).find('.close-modal-small')).show();
			$($(this).find('.delete-img-close')).show();
		});
		$('.div-img').mouseout(function(){
			$($(this).find('.close-modal-small')).hide();
			$($(this).find('.delete-img-close')).hide();
		});
		$('.close-modal-small,.delete-img-close').click(function(){
			var idNum = $(this).closest('.js-img-area').index();
			if(idNum < 0){
				return;
			}
			var dex = $('.span-show-now').data('id');
			indexNow -= 1;
			if(dex == idNum && indexNow > -1){
				if(dex > 0){
					$($('.sliderImg').children()[dex-1]).attr('style','display:inline-block');
					$('.span-show-now').removeClass('span-show-now').attr('style','opacity:0.4;');;
					$($('.replace-img-div').children()[dex-1]).addClass('span-show-now').attr('style','opacity:1;');
				}else if(indexNow > -1){
					$($('.sliderImg').children()[1]).attr('style','display:inline-block');
				}
				
			}
			$(this).closest('.js-img-area').remove();
			$('.sliderImg').children()[idNum].remove();
			$('.replace-img-div').children('span:last-child').remove();
			if(indexNow == -1){
				$('.goods-details-block').attr('style',"height:450px;background-image: url('');");
				$('.sliderImg').hide();
			}
			
		}); 
		$('.js-url-input').click(function(){
			$(this).parent().find('input').removeAttr('readonly');
			$(this).parent().find('.js-link').val('');
		});
		$('.js-url-select').click(function(){
			$(this).parent().find('input').attr('readonly','true');
			objUrlSelect = $(this);
			selectedUrl();
		});
	 closeWindow();
	}
//关闭窗口	
function closeWindow(){
	 closeBpopupWindow('bpopupPicture');
	}

</script>
</head>
<body>
	<!-- ▼ Main container --> 
		<!-- Start 弹出框覆盖层 -->
		<div id="fullbg" class="fullbg_div">
		</div>
		<!-- End 弹出框覆盖层 -->
        <div class="container" style="width:100%;">
        	<%-- <div class="top_head_div">
        		<span><ui:i18n key="创建微杂志页面"/></span>
        	</div> --%>
		    <form  id="fileupload-test" action="" method="POST" enctype="multipart/form-data">
				<input id="files-test" type="file" name="files[]" multiple style="display: none;" >  
			</form>
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content" style="width:100%;margin-right:0px;padding-right:0px;margin-top:20px;">
				<div class="goods-step-area" style="width:100%;margin-top:0;padding-top:0;">
			  		 <div class="goods-content-step js-goods-content-step-3" style="width:100%;margin-top:0;">
			  		 <!-- <div class="step-sp clearfix" style="width:100%;"></div> -->
			  		 		<!-- - -->
			  		 		<div class="app-init-container">
			               		<div id="app-region" class="app__content"  >
			                       	<div class="goods-edit-area" >
										<!-- --- -->
										<div id="step-content-region">
											<div class="app-design clearfix">
												<div class="app-preview" style="left:2%;width:320px;">
										    		<div class="app-header"></div>
										   			 <div class="app-entry" style="height:500px;width:300px;">
										        		<div class="app-config">
										            		<div id="app-field-header" class="app-field-addImg" style="cursor: default;" >
										                		<!-- <h1><span></span></h1> -->
												                <div class="goods-details-block" style="height:450px;background-image: url('');width:300px;">
												                    <h4 style="margin-top:150px;"><ui:i18n key="Banner展示区"/></h4>
												                    <p style="margin-top:30px;"><ui:i18n key="固定样式"/> ,<ui:i18n key="最多可选6个图片"/></p>
												                </div>
												                <div class="sliderImg" style="height:490px;display: none;">
																	<!--  <ul style="display:inline-block;">
																		<li>
																			<img src="/uploads/8/2015/02/11/8_shop_2015_02_03_16_23_15_83795.png"/>
																		</li>
																	</ul> -->
																	<!-- <ul>
																		<li>
																			<img src="/uploads/8/2015/02/03/8_shop_2015_02_03_16_23_15_83795.png"/>
																		</li>
																	</ul>
																	<ul>
																		<li>
																			<img src="/uploads/logo/2015_01_19/logo_2015_01_19_15_57_054041.JPG"/>
																		</li>
																	</ul>
																	<ul>
																		<li>
																			<img src="/uploads/150/2015/01/29/150_shop_2015_01_29_10_53_00_60402.jpg"/>
																		</li>
																	</ul>
																	<ul>
																		<li>
																			<img src="/uploads/150/2015/01/29/150_shop_2015_01_29_09_13_38_38196.jpg"/>
																		</li>
																	</ul>
																	<ul>
																		<li>
																			<img src="/uploads/150/2015/01/29/150_shop_2015_01_29_09_12_45_11895.jpg"/>
																		</li>
																	</ul>  -->
																	
																	<div class="replace-img-div">
																		<!-- <span data-id="0"></span>
																		<span data-id="1"></span>
																		<span data-id="2"></span>
																		<span data-id='3'></span>
																		<span data-id='4'></span>
																		<span data-id='5'></span> -->
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
												<div class="app-sidebar" style="margin-top: 105px;margin-left: 45px"><div class="arrow"></div>
													<div class="app-sidebar-inner js-sidebar-region">
														<div>
															<form class="form-horizontal" novalidate="">
																<div class="page-name-input-div">
																	<ui:i18n key="微杂志页面"/><ui:i18n key="名称"/><span>*</span>：
																	<input type="text" id="pageName" value=""/>
																</div>
																<div class="control-group" style="margin-left:22px;">
																	<label class="control-label" style="width:120px;text-align:left;"><ui:i18n key="选择图片"/><span style="color:#d1102d;">*</span>：</label>
																	<div class="controls">
																		<ul class="module-goods-list clearfix" name="goods"> 
																			<li id="li-goods-add">
																				<a href="javascript:selectedImg();" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																				<span class="img-width-span" ><ui:i18n key="图片推荐尺寸"/>:(640px * 1008px)</span>
																			</li>
																		</ul>
																	</div>
																</div>
																
																<div class="control-group" style="margin-left:10px;" id="appendChildGroup">
																<%-- <c:forEach begin="1" end="3">
																	<ul class="js-img-area">
																		<li class="sort" data-goods-id="9824420540"> 
																			<div class="div-img-warp">
																				<div class="div-img">
																					 <a href="javascript:void(0);">
																						<img src="/uploads/8/2015/02/09/8_shop_2015_02_09_09_04_44_39829.jpg" alt="商品图">
																					 </a>
																					 <span class="close-modal-small" >×</span>
																				</div>
																				<div class="div-img-link">
																					URL：<br><input type="text" class="js-link" style="width:240px;">
																					<button class="btn js-url-input" id="pointerInsertUrl" type="button">手输</button>
																					<button class="btn js-url-select" id="selectUrlList" type="button">选择</button>
																				</div>
																			</div>
																		</li>
																	</ul>
																	</c:forEach> --%>
																</div>
																 
															</form>
														</div>
													</div>
													<div class="navi-button-area" style="width:100%;margin-top:50px;">
											  			<!-- <span class="btn-step js-preview-setp2" ><span>上一步</span></span> -->
											  			<span class="btn-step js-btn-load" ><span><ui:i18n key="保存"/></span></span>
											  			<!-- <span class="btn-step js-btn-unload" ><span>下架</span></span> -->
											  			<span class="btn-step js-btn-preview"  style="margin-left:20px;"><span><ui:i18n key="取消"/></span></span>
											  		</div>
												</div>
											</div>
										</div>
										<!-- --- -->
										
									</div>
			             		</div>
			                </div>    
			  		 		<!-- - -->
			  		</div><!--js-goods-content-step-3 -->
			  		 
			  	</div>	
				<!-- end22 -->
			
			</div> 
            <!-- ▲ detali content -->
        </div>

		<!-- Start 商品链接选择 -->
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
	    <!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpopupPicture">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
		 		 </div>
		 	</div>
		</div>
		<!-- ▲ bpopup area -->
		<!-- END 商品链接选择 -->
		

	 <jsp:include page="/admin/template/customEditorTemplate.jsp" />
</body>
</html>