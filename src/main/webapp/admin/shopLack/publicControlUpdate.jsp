<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="创建商品名称"/>::<ui:i18n key="公告页面"/></title>  
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" /> 
<jsp:include page="/admin/js/goods/goods-editor.jsp" />
<link rel="stylesheet" type="text/css" href="/admin/css/test.css" />
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script> 
<style type="text/css">
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
	body {margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 14px;}
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
		background-color:#ffffff;
		position: relative;
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
		padding-left:18px;
	}
	.must-input-span{
		color: #d1102d;
		float:none;
		margin-left:0;
	}
	.page-name-input-div input{
		margin-left:10px;
	}


	.imgPosition.up{
		position:absolute;
		top:0px;
		left:0px;
		height:150px;
		width:100%; 
	}
	.imgPosition.down{
		position:absolute;
		bottom:0px;
		left:0px;
		height:150px;
		width:100%; 
	}
	.modify-down{
		width:100%;
		text-align:left;
		display:none;
	}
	.modify-down span{
		margin-left:17px;
	}
	.submit-modify{
		text-align:center;
		width:60px;
		height:30px;
		color:#ffffff;
		background-color: #ff834d;
		border-radius:2px;
		margin-left:20px;
		display:inline-block;
		line-height: 30px;
		cursor: pointer;
	}
	.submit-modify.up{
		background-color: #ff834d;
	}
	.submit-modify.up-no{
		background-color: #eeeeee;
	}
	.submit-modify.down{
		background-color: #ff834d;
	}
	.submit-modify.down-no{
		background-color: #eeeeee;
	}
	
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
.div-img-warp .div-img a img{
		width:100%;
		height:100%;
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
.app-design .app-sidebar .app-sidebar-inner {
  padding: 12px 10px;
  min-height: 28px;
  background: #ffffff;
  border-radius: 5px;
  border: 1px solid #e7e7e7;
  padding-bottom: 30px;
}
.iradio_square-firebrick{
	margin-left:20px;
	margin-right:5px;
}
</style>

<script type="text/javascript">
//判断已经有几张图片了
var indexNow = -1;
var objUrlSelect;
var flagOne = true;
$(function() {
	indexNow += Number($(".replace-img-div").children().length);
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
	$(".modify-down").show();
	$('.close-modal-small,.delete-img-close').click(function(){
		var idNum = $(this).closest('.js-img-area').index();
		if(idNum<0){
			return;
		}
		$(this).closest('.js-img-area').remove();
		$('.sliderImg').children()[idNum].remove();
		$('.replace-img-div').children('span:last-child').remove();
		indexNow -= 1;
		if(indexNow == -1){
			$('.goods-details-block').attr('style',"height:450px;background-image: url('');");
			$('.sliderImg').hide();
			$(".modify-down").hide();
		}
	}); 
	$('.js-url-input').click(function(){
		$(this).parent().find('input').removeAttr('readonly');
		$('.js-link').val('');
	});
	$('.js-url-select').click(function(){
		$(this).parent().find('input').attr('readonly','true');
		objUrlSelect = $(this);
		selectedUrl();
	});
	
	$(window).scroll(function () {
		$('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
	});
	$('.btn-step').click(function(){
		if($(this).find('span').text() == '<ui:i18n key="保存"/>'){
			var imgUrlAll = '';
			var goodsUrlAll = '';
			var imgflag = true;
			var goodsflag = true;
			var pageName = $('#pageName').val();
			var pageId=$("#pageId").val();
			var itemId=$("#itemId").val();
			if(pageName == ''){
				alert('<ui:i18n key="请输入公告页面名称"/>');
				return;
			}
			var positionType = $('input[name="position"]:checked').val();
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
			var param = {
							positionType : positionType
							,imgUrlAll : imgUrlAll
							,goodsUrlAll : goodsUrlAll
							,pageName : pageName
							,pageId : pageId
							,itemId : itemId
						};
			$.ajax({
				data:param,
				url : '/admin/shopLack/updateSaveWebzine.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						alert('<ui:i18n key="保存成功"/>');
						window.location.href = '/admin/shopLack/publicControlSet.htm';
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
	$('.icradio').on('ifChecked', function(event){
		var flagDown = $(this).val();
		if(flagDown == 'BOTTOM'){
			$('.imgPosition.up').removeClass('up').addClass('down');
		}else if(flagDown == 'TOP'){
			$('.imgPosition.down').removeClass('down').addClass('up');
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
	 var indexLimit = 1 - (indexNow+1);
		if(indexLimit == 0){
			alert('<ui:i18n key="已选择图片"/>，<ui:i18n key="不可再选择图片"/>');
			return false;
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
										'URL：<br><input type="text" class="js-link" style="width:240px;" value="" readonly="readonly">'+
										'<span class="btn-span js-url-input" style="margin-left:5px;margin-right:5px;"><ui:i18n key="手输"/></span>'+
										'<span class="btn-span js-url-select"><ui:i18n key="选择"/></span>'+
									'</div>'+
								'</div>'+
							'</li>'+
						'</ul>' ;
			$('#appendChildGroup').append(htm);
			$('.goods-details-block').attr('style','display:none;');
			htm='<ul> <li> <img class="imgPosition up" src="'+imgUrl+'"/> </li> </ul>';
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
		$(".modify-down").show();
		$('.close-modal-small,.delete-img-close').click(function(){
			var idNum = $(this).closest('.js-img-area').index();
			if(idNum<0){
				return;
			}
			$(this).closest('.js-img-area').remove();
			$('.sliderImg').children()[idNum].remove();
			$('.replace-img-div').children('span:last-child').remove();
			indexNow -= 1;
			if(indexNow == -1){
				$('.goods-details-block').attr('style',"height:450px;background-image: url('');");
				$('.sliderImg').hide();
				$(".modify-down").hide();
			}
		}); 
		$('.js-url-input').click(function(){
			$(this).parent().find('input').removeAttr('readonly');
			$('.js-link').val('');
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
										   			 <div class="app-entry" style="height:360px;width:300px;">
										        		<div class="app-config">
										            		<div id="app-field-header" class="app-field-addImg" style="cursor: default;" >
										                		<!-- <h1><span></span></h1> -->
												                <div class="goods-details-block" style="height:310px;background-image: url('');display:none;">
												                    <h4 style="margin-top:100px;"><ui:i18n key="Banner展示区"/></h4>
												                    <p style="margin-top:30px;"><ui:i18n key="最多可选1张图片"/></p>
												                </div>
												                <div class="sliderImg" style="height:350px;">
																	<c:forEach items="${requestScope.pageDtls}" varStatus="stauts" var="pageDtls" >
																		<ul style="display:inline-block;">
																			<li>
																				<img class="imgPosition<c:if test="${pageDtls.VAL03 eq 'BOTTOM'}"> down</c:if><c:if test="${pageDtls.VAL03 eq 'TOP'}"> up</c:if>" src="${pageDtls.VAL01}"/>
																			</li>
																		</ul>
																	</c:forEach>
																	
																	<div class="replace-img-div">
																		<!-- <span data-id="0"></span>
																		<span data-id="1"></span>
																		<span data-id="2"></span>
																		<span data-id='3'></span>
																		<span data-id='4'></span>
																		<span data-id='5'></span> -->
																		<c:forEach items="${requestScope.pageDtls}" varStatus="stauts" var="pageDtls" >
																			<span data-id='${stauts.index}'></span>
																		</c:forEach>
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
																	<ui:i18n key="公告页面名称"/><span class="must-input-span">*</span>：
																	<input type="text" id="pageName" value="${requestScope.pageHeaderAndItem.PAGE_NM}"/>
																	<input value="${requestScope.pageHeaderAndItem.PAGE_ID }" type="hidden" id="pageId"/>
																 	<input value="${requestScope.pageHeaderAndItem.ITEM_ID }" type="hidden" id="itemId"/>
																</div>
																<div class="control-group">
																	<label class="control-label" style="width: 100px;text-align: left;padding-left:20px;"><ui:i18n key="选择图片"/><span class="must-input-span">*</span>：</label>
																	<div class="controls">
																		<ul class="module-goods-list clearfix" name="goods"> 
																			<li id="li-goods-add">
																				<a href="javascript:selectedImg();" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																				<span class="img-width-span" ><ui:i18n key="图片推荐尺寸"/>:(<ui:i18n key="宽度"/>640px)</span>
																			</li>
																		</ul>
																	</div>
																</div>
																
																<div class="control-group" id="appendChildGroup">
																	<c:forEach items="${requestScope.pageDtls}" var="pageDt" varStatus="status">
																		<ul class="js-img-area">
																			<li class="sort" data-goods-id="9824420540"> 
																				<div class="div-img-warp">
																					<div class="div-img">
																						 <a href="javascript:void(0);">
																							<img src="${pageDt.VAL01}" alt="<ui:i18n key="商品图"/>">
																						 </a>
																						 <div class="close-modal-small" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"/>
																					</div>
																					<div class="div-img-link">
																						URL：<br><input type="text" class="js-link" style="width:240px;" readonly="readonly" value="${pageDt.VAL02 }">
																						<span class="btn-span js-url-input" style="margin-left:5px;margin-right:5px;"><ui:i18n key="手输"/></span>
																						<span class="btn-span js-url-select"><ui:i18n key="选择"/></span>
																					</div>
																				</div>
																			</li>
																		</ul>
																	</c:forEach>
																</div>
																<div class="modify-down">
																	<span><ui:i18n key="图片显示位置"/>：</span>
																	<c:forEach items="${requestScope.pageDtls}" varStatus="stauts" var="pageDtls" >
																		<%-- <c:if test="${pageDtls.VAL03 eq 'TOP'}">
																			<div class="submit-modify up-no" data-position='TOP'><ui:i18n key="向上"/></div>
																		</c:if>
																		<c:if test="${! (pageDtls.VAL03 eq 'TOP')}">
																			<div class="submit-modify up" data-position='TOP'><ui:i18n key="向上"/></div>
																		</c:if>
																		<c:if test="${pageDtls.VAL03 eq 'BOTTOM'}">
																			<div class="submit-modify down-no" data-position='BOTTOM'><ui:i18n key="向下"/></div>
																		</c:if>
																		<c:if test="${!(pageDtls.VAL03 eq 'BOTTOM')}">
																			<div class="submit-modify down" data-position='BOTTOM'><ui:i18n key="向下"/></div>
																		</c:if> --%>
																		<input type="radio" class="icradio" <c:if test="${pageDtls.VAL03 eq 'TOP'}">checked="checked"</c:if> name="position" value="TOP"/><ui:i18n key="向上"/>
																		<input type="radio" class="icradio" <c:if test="${pageDtls.VAL03 eq 'BOTTOM'}">checked="checked"</c:if>  name="position" value="BOTTOM"/><ui:i18n key="向下"/>
																	</c:forEach>
																</div>
															</form>
														</div>
													</div>
													<div class="navi-button-area" style="width:100%;margin-top:20px;">
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
            
        </div>

		<!-- ▲ Main container -->
		<!-- END 商品链接选择 -->
<script type="text/javascript">
$(function(){
	
});
  
</script>
	 <jsp:include page="/admin/template/customEditorTemplate.jsp" />
</body>
</html>