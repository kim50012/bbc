<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/colorInc.jsp"%>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="店铺导航 "/></title>  
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi"> -->
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" />  
<link rel="stylesheet" type="text/css" href="/admin/css/test.css" />
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>
<style type="text/css">
	body{
		font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	}

.caidan {width: 92%; height: 50px; margin-left: 3.7%; margin-top: -51px; background-color: #000000; border-right: 1px solid #C0C0C0; border-left: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0;}	
.caidan ul li {float: left; text-align: center;}
.caidan ul li a {vertical-align: bottom; position: relative; padding-bottom: 0; padding-top: 30px; display: block; height: 50px; font-size: 12px; color: #898888;}
.caidan ul li a:after {content: ''; position: absolute; top: 5px; left: 0; height: 25px; width: 100%;}

	.nav{
		height: 50px;
		width: 20%;
		margin-top: 7px;
		text-align: center;
	}
	.nav img{
		width: 25px;
		height: 25px;
	}
	
.ui-shopNavigationBg {float: left; margin-left: 160px; margin-top: 20px; width: 598px; height: 150px; border: 1px solid #eeeeee; border-radius: 5px; font-size: 14px}
.ui-shopNavigationBg .ui-shopNavigation {width: 96%; height: 100%; margin-left: 2%;}
.ui-shopNavigation .ui-explain {width: 100%; height: 30px; line-height: 30px; margin-top: 10px;}
.ui-shopNavigation .ui-explain .ui-ex {float: left; width: 35%; height: 30px; line-height: 30px;}
.ui-shopNavigation .ui-explain .ui-sel {float: right; width: 35%; height: 30px; line-height: 30px; display: inline-block; text-align: right;}
.ui-shopNavigation .ui-explain .ui-sel label {display: inline-block; height: 30px; line-height: 30px;}
.ui-shopNavigation .ui-explain .ui-sel input[type="radio"] {margin-top: 10px; margin-right: 5px;}
.ui-shopNavigation .ui-backgroundColor {width: 100%; height: 40px; overflow-y: auto; word-wrap: break-word; word-break: normal; border: 1px solid #eeeeee; border-radius: 5px; margin-top: 10px;}
.ui-shopNavigation .ui-backgroundColor .ui-colorDiv {float: left; width: 28px; height: 28px; border: 1px solid #e5e5e5; margin-top: 5px; margin-left: 10px; cursor: pointer;}
.ui-shopNavigation .ui-addColorBg {width: 100%; height: 40px; line-height: 40px; margin-top: 10px;}
.ui-shopNavigation .ui-addColorBg .ui-addColorExplain {float: left; width: 17%; height: 40px; line-height: 40px;}
.ui-shopNavigation .ui-addColorBg .ui-addColor {float: left; width: 30%; height: 40px; line-height: 40px;}
.ui-shopNavigation .ui-addColorBg .ui-addColor div {cursor: pointer;}

.ui-shopNavigationBgNew { width: 100%; height: 150px;font-size: 12px;}
.ui-shopNavigationBgNew .ui-shopNavigationNew {float: left; width: 30%; height: 100%; margin-left: 2%;}
.ui-shopNavigationNew .ui-backBg {width: 100%; height: 60px; height: 60px; margin-top: 23px;}
.ui-shopNavigationNew .ui-backBg .ui-backBgW {float: left; width: 70px; height: 60px; line-height: 60px;}
.ui-shopNavigationNew .ui-backBg .ui-backChoseBg {float: left; width: 48px; height: 48px; border: 1px solid #eeeeee; border-radius: 2px; margin-top: 5px; margin-left: 15px;}
.ui-shopNavigationNew .ui-backBg .ui-backChoseBg .ui-backChose {width: 38px; height: 38px; background-color: #00ff00; margin-left: 4px; margin-top: 4px;border:1px solid #333;}
.ui-shopNavigationNew .ui-backBg .ui-backChoseW {float: left; height: 60px; line-height: 60px; margin-left: 15px; cursor: pointer;}

.ui-shopNavigationBgNew .ui-addColorBgNew {
  float: left;
  width: 20%;
  height: 120px;
  line-height: 120px;
  margin-top: 3px;
  margin-left: -30px;
  opacity: 0;
  z-index: -30;
}
#colorSelector div {
  position: absolute;
  top: 3px;
  left: 3px;
  width: 1px;
  height: 1px;
  background: url(/admin/images/colorPicker/select.png) center;
}
#colorSelector {
  position: relative;
  width: 1px;
  height: 1px;
  background: url(/admin/images/colorPicker/select.png);
}
 
.div-img-warp .div-img-link {
  float: left;
  position: relative;
  height: 80px;
  line-height: 40px;
  margin-left: 30px;
  margin-top: 10px;
  width:380px;
}
	.div-img-warp {
	  height: 100px;
	  width: 570px;
	}
	.js-img-area{
		padding-top:10px;
	}
	.div-img-warp .div-img {
	  float: left;
	  position: relative;
	  width: 100px;
	  height: 100px;
	  border:none;
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
.div-img li {
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
.right-top {
  width: 550px;
  height: 280px;
  border: 1px solid #eeeeee;
  float: left;
  border-radius: 5px;
  margin-top: 20px;
  font-size: 12px;
  margin-left: 160px;
  padding-left:20px;
}
.icheckbox_square-firebrick, .iradio_square-firebrick {
  display: inline-block;
  vertical-align: middle;
  vertical-align: middle;
  margin: 0;
  padding: 0;
  width: 14px;
  height: 14px;
  border: none;
  cursor: pointer;
  margin-left: 20px;
  margin-right: 10px;
}	
.btn-select {
	display: inline-block;
  	height: 30px;
	line-height: 30px;
	border-radius: 2px;
	cursor: pointer;
	background-color: #fb6e52;
	text-align: center;
	width: 60px;
	color: #fff;
	font-size: 12px;
	border: 0; 
  	padding-left: 0;
  	padding-right:0;
  	margin-left:5px;
}
.close-modal-small {
		position:absolute;
		top: 0;
		right: 0;
		width: 100px;
		height: 100px;
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
.div-img ul li img:first-child{
	width:100%;
	height:100%;
}
.colorpicker .colorpicker_field input {
  margin-left: 0;
  width: auto;
  height: 16px;
  background-color: transparent;
  border: 1px solid transparent;
  color: #898989;
  font-size: 12px;
  margin-top: -5px;
  padding:0;
}
.colorpicker .colorpicker_hex input {
  margin-left: 0;
  width: 60px;
  height: 16px;
  background-color: transparent;
  border: 1px solid transparent;
  color: #898989;
  font-size: 12px;
  margin-top: -5px;
   padding:0;
}
</style>

<script type="text/javascript">
//判断已经有几张图片了
var indexNow = -1;
var objUrlSelect;
var flagOne = true;
$(function() {
	
	var num = '${requestScope.list[0].PAGE_NUM}';
	var backColor = '${requestScope.list[0].BACK_COLOR}';
	var wordColor = '${requestScope.list[0].WORD_COLOR}';
 
	if (backColor != '' && wordColor != '') {
		
		$('.caidan').css('background-color','#' + backColor);
		$('.caidan').attr('data-id', backColor);
		$('.caidan ul li a').css('color','#' + wordColor);
		$('.caidan ul li a').attr('data-id', wordColor);
		$('#backC').css('background-color','#' + backColor);
		$('#wordC').css('background-color','#' + wordColor);
		
		$('.div-img').css('background-color','#' + backColor);
	}
	
	$('#colorSelector').hide();
	
	for(var i = 1;i <= 5;i++){
		if(num.indexOf(i) > -1 ){
		    $('input[type=checkbox][value=' + i + ']').attr('checked',true);
		} 
	}		
		
	$(window).scroll(function () {
		$('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
	});
	
	$('.js-url-input').click(function(){
		$(this).parent().find('.url').removeAttr('readonly');
		$(this).prev().val('');
	});
	$('.js-url-select').click(function(){
		$(this).parent().find('.url').attr('readonly','true');
		objUrlSelect = $(this);
		selectedUrl();
	});
	$('.btn-step').click(function(){
		if($(this).find('span').text() == '<ui:i18n key="保存"/>'){
			var imgUrlAll = '';
			var urlAll = '';
			var nameAll = '';
			var num = '';
			var backColor  =  $('.caidan').attr('data-id');
			var wordColor = $('.caidan ul li a').attr('data-id');
			
			$('input[type=checkbox]:checked').each(function(){
				num = num + $(this).val();
			});
			if(num == ''){
				alert('<ui:i18n key="请选择导航应用页面"/>');
				return;
			}
			$('.div-img-warp').each(function(){
				var imgUrl = $(this).find('.div-img').find('img').attr('src');
				if(typeof(imgUrl) != 'undefined'){
					imgUrlAll += imgUrl + ',';
				}
				var url = $(this).find('.div-img-link').find('.url').val();
				if(url != ''){
					urlAll += url + ',';
				}
				var name = $(this).find('.div-img-link').find('.js-link').val();
				if(name != ''){
					nameAll += name + ',';
				}
			});
			var countNow = 0;
			$('.div-img-warp').each(function(){
				if($(this).find('.url').val() == '' && $(this).find('.js-link').val() == '' && typeof($(this).find('.div-img').find('img').attr('src'))=='undefined'){
					countNow++;
				}
			});
			var numNow = 5-countNow;
			imgUrlAll = imgUrlAll.substr(0,(imgUrlAll.length-1));
			urlAll = urlAll.substr(0,(urlAll.length-1));
			nameAll = nameAll.substr(0,(nameAll.length-1));
			if (imgUrlAll.split(',').length < numNow) {
				alert('<ui:i18n key="请选择图片"/>.');
				return;
			}
			if (nameAll.split(',').length < numNow) {
				alert('<ui:i18n key="请输入名称"/>.');
				return;
			}
			if (urlAll.split(',').length < numNow) {
				alert('<ui:i18n key="请选择链接"/>.');
				return;
			} 
			var param = {
							imgUrl : imgUrlAll
							,url : urlAll
							,name : nameAll
							,pageNum : num
							,backColor : backColor
							, wordColor : wordColor
						};
			$.ajax({
				data:param,
				url : '/admin/shopLack/saveShopNavigation.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						alert('<ui:i18n key="保存成功"/>');	
						window.location.href = '/admin/shopLack/shopNavigation.htm';
					}else{
						alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			 });
		}else{
			window.location.href='/admin/shopLack/shopNavigation.htm';
		}
	});
	$('.iccheckbox').iCheck({
 	    checkboxClass: 'icheckbox_square-firebrick',
 	    radioClass: 'iradio_square-firebrick',
 	    increaseArea: '0%' // optional
 	  });
}); 
function over(num){
	if(typeof($('.img' + num).find('img').attr('src'))!='undefined'){
		$('.img' + num).find('.close-modal-small').show();
		$('.img' + num).find('.delete-img-close').show();
	}
}
function out(num){
	$('.img' + num).find('.close-modal-small').hide();
	$('.img' + num).find('.delete-img-close').hide();
}
function del(num){
	var htm = '<ul class="module-goods-list clearfix ui-sortable" name="goods">'+
				'<li id="li-goods-add">'+
					'<a href="javascript:selectedImg('+num+');" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>'+
				'</li>'+
			'</ul>'+
			'<span class="close-modal-small">×</span>';
	$('.img' + num).html(htm);
	$('.cont' + num).find('img').attr('src','http://www.xcwljy.cn/images/pixel.gif');
}
function navNm(num){
	var name = $('.name' + num).val();
	$('.text' + num).text(name);
}
//导航颜色变更
function changeColor(obj) {

	var selColor = $('input[name="selColor"]:checked').val();
	var colorId = $(obj).data('id');
	
	if (selColor == 'B') {
		
		$('.caidan').css('background-color','#' + colorId);
		$('.caidan').attr('data-id', colorId);
	} else {
		
		$('.caidan ul li a').css('color','#' + colorId);
		$('.caidan ul li a').attr('data-id', colorId);
	}
}

//选择控制
function chooseChange(id) {
	
	$('#colorSelector').show();
	$('#colorSelector').trigger('click');
	if (id == 'choose1') {
		$('#choose1').css('color','#a1e7df');
		$('#choose1').attr('data-id', '1');
		$('#choose2').css('color','#000000');
		$('#choose2').attr('data-id', '0');
		$('#backC').parent().attr('style','border:1px solid #d1102d;');
		$('#wordC').parent().attr('style','');
	} else {
		$('#choose2').css('color','#a1e7df');
		$('#choose2').attr('data-id', '1');
		$('#choose1').css('color','#000000');
		$('#choose1').attr('data-id', '0');
		$('#backC').parent().attr('style','');
		$('#wordC').parent().attr('style','border:1px solid #d1102d;');
	}
}
var count;
function selectedImg(num){
	count = num;
	showPopup();
}
function showPopup(){
		 showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key='选择图片'/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=1&max=1' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																			// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																			// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																			// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
			});	 	
}
function choosePicture(obj){
	 console.log('-------parent');
	 //这里写自己的逻辑
	  var imgUrl = obj[0].fileUrl;
	  var htm = '<ul> <li> <img src="' + imgUrl + '" onclick="selectedImg(' + count + ')"  style="cursor: pointer;"/> <div class="close-modal-small" onclick="del(' + count + ')" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"  onclick="del(' + count + ')" /> </li> </ul>';
		$('.img' + count).html('');
		$('.img' + count).append(htm);
		$('.cont' + count).find('img').attr('src',imgUrl);
		
	 closeWindow();
}
//关闭窗口	
function closeWindow(){
	 closeBpopupWindow('bpopupPicture');
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
	objUrlSelect.parent().find('.url').val(url);
	closeBpopupWindow('bpoupMessage');
}
function closebpoupMe(){
	closeBpopupWindow('bpoupMessage');
}
</script>
</head>
<body>
            <!-- ▼ detali content  --> 
            <div class="contents" style="width:100%;margin-top:20px;">
				<div class="goods-step-area" style="width:100%;margin-top:0;padding-top:0;">
			  		 <div class="goods-content-step js-goods-content-step-3" style="width:100%;margin-top:0;">
			  		 <!-- <div class="step-sp clearfix" style="width:100%;"></div> -->
			  		 		<!-- - -->
			  		 		<div class="app-init-container">
			               		<div id="app-region" class="app__content" style="width: 100%;margin-right: 0px;">
			                       	<div class="goods-edit-area" >
										<!-- --- -->
										<div id="step-content-region">
											<div class="app-design clearfix">
												<div class="app-preview" style="margin-left: -13%;width: 300px">
										    		<div class="app-header"></div>
										   			<div class="app-entry" style="width:272px; height:480px;background-color: #ffffff"></div>
										   			<div class="caidan" data-id="000000">
														<ul>
														<c:set value="${100 / list.size()}" var="listsize"></c:set>
														<c:forEach var="item" items="${list}" varStatus="status"  > 
															<li style="width: ${listsize}%">
																<a id="menu_${item.NAVIGATION_ID}" data-id="898888">${item.NAME}</a>
			 													<style scoped="scoped" type="text/css">#menu_${item.NAVIGATION_ID}:after{background:url('${item.IMG_URL}') no-repeat; background-size: 25px auto; background-position: center;}</style>
															</li>
														</c:forEach>     
														</ul>								   				
										   			</div>
										    		<div class="app-footer"></div>
 												</div>
 												
 												<div class="right-top">
 													<div style="width: 96%;height: 60px;margin-left: 2%">
 														<div style="width: 100%;height: 30px;line-height: 20px;margin-top: 25px"><ui:i18n key="将导航应用到以下页面"/>：</div>
 														<div style="width: 100%;height: 30px;line-height: 20px;margin-left:-30px;padding-left:10px;">
 															<input type="checkbox" class="iccheckbox" value="1"/><ui:i18n key="首页"/>
 															<input type="checkbox" class="iccheckbox"  value="2"/><ui:i18n key="微信店铺"/>
 															<input type="checkbox" class="iccheckbox"  value="3"/><ui:i18n key="商品列表"/>
 															<input type="checkbox" class="iccheckbox"  value="4"/><ui:i18n key="商品分类"/>
 															<input type="checkbox" class="iccheckbox"  value="5"/><ui:i18n key="全部订单"/>
 														</div>
 													</div>
 													<div class="ui-shopNavigationBgNew">
	 													<div class="ui-shopNavigationNew">
	 														<div class="ui-backBg">
	 															<div class="ui-backBgW"><ui:i18n key="导航背景色"/></div>
	 															<div class="ui-backChoseBg">
	 																<div class="ui-backChose" id="backC" onclick="chooseChange('choose1');"></div>
	 															</div>
	 															 <div class="ui-backChoseW" id="choose1" data-id="0" ></div>
	 														</div>
	 														<div class="ui-backBg">
	 															<div class="ui-backBgW"><ui:i18n key="文字颜色"/></div>
	 															<div class="ui-backChoseBg">
	 																<div class="ui-backChose" id="wordC" data-id="0" onclick="chooseChange('choose2');"></div>
	 															</div>
	 															<div class="ui-backChoseW" id="choose2" data-id="0" ></div>
	 														</div>
	 													</div>
														<div class="ui-addColorBgNew">
															<div id="colorSelector">
																<div style="background-color: #ffffff"></div>
															</div>
														</div>
	 												</div>
 												</div>
 												
 												
 												
												<div class="app-sidebar" style="width: 570px;margin-top: 20px;float: left;margin-left:160px;"><div class="arrow"></div>
													<div class="app-sidebar-inner js-sidebar-region">
														<div>
															<form class="form-horizontal" novalidate="">
																<div class="control-group" id="appendChildGroup" style="width: 570px;margin-left:20px;">										
																	<div class="div-img-warp" style="height: 150px">
																		<div style="margin-bottom: 10px;font-size:14px;"><ui:i18n key="第一菜单"/></div>
																		<div class="div-img img1" onmouseover="over(1);" onmouseout="out(1);"  >
																			<c:choose>
																			 	<c:when test="${requestScope.list[0].IMG_URL != null}">
																			 		<ul>
																			 			<li>
																			 				<img src="${requestScope.list[0].IMG_URL}"  onclick="selectedImg(1);" style="cursor: pointer;"/>
																			 				 <div class="close-modal-small" onclick="del(1)" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"  onclick="del(1)" />
																			 			</li> 
																			 		</ul>
																			 	</c:when>
																			 	<c:otherwise>
																			 		<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
																						<li id="li-goods-add">
																							<a href="javascript:selectedImg(1);" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																						</li>
																					</ul>
																			 	</c:otherwise>
																			 </c:choose>
																		</div>
																		<div class="div-img-link">
																			<span style="display: inline-block;width:70px;text-align: left;"><ui:i18n key="菜单名称"/>：</span><input type="text" class="js-link name1" onblur="navNm(1);" style="width:288px;" value="${requestScope.list[0].NAME }"><br>
																			<span style="display: inline-block;width:70px;text-align: left;">URL：</span><input type="text" class="url" style="width:150px;" value="${requestScope.list[0].URL }" readonly="readonly">
																			<span class="btn-select js-url-input" id="pointerInsertUrl" ><ui:i18n key="手输"/></span>
																			<span class="btn-select js-url-select" id="selectUrlList" ><ui:i18n key="选择"/></span>
																		</div>
																	</div>
																	<div class="div-img-warp" style="height: 150px">
																		<div style="margin-bottom: 10px;font-size:14px;"><ui:i18n key="第二菜单"/></div>
																		<div class="div-img img2" onmouseover="over(2);" onmouseout="out(2);"  >
																			<c:choose>
																			 	<c:when test="${requestScope.list[1].IMG_URL != null}">
																			 		<ul>
																			 			<li>
																			 				<img src="${requestScope.list[1].IMG_URL}"  onclick="selectedImg(2);" style="cursor: pointer;"/>
																			 				 <div class="close-modal-small" onclick="del(2)" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"  onclick="del(2)" />
																			 			</li> 
																			 		</ul>
																			 	</c:when>
																			 	<c:otherwise>
																			 		<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
																						<li id="li-goods-add">
																							<a href="javascript:selectedImg(2);" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																						</li>
																					</ul>
																			 	</c:otherwise>
																			 </c:choose>
																		</div>
																		<div class="div-img-link">
																			<span style="display: inline-block;width:70px;text-align: left;"><ui:i18n key="菜单名称"/>：</span><input type="text" class="js-link name2" onblur="navNm(2);" style="width:288px;" value="${requestScope.list[1].NAME }"><br>
																			<span style="display: inline-block;width:70px;text-align: left;">URL：</span><input type="text" class="url" style="width:150px;" value="${requestScope.list[1].URL }" readonly="readonly">
																			<span class="btn-select js-url-input" id="pointerInsertUrl" ><ui:i18n key="手输"/></span>
																			<span class="btn-select js-url-select" id="selectUrlList" ><ui:i18n key="选择"/></span>
																		</div>
																	</div>
																	<div class="div-img-warp" style="height: 150px">
																		<div style="margin-bottom: 10px;font-size:14px;"><ui:i18n key="第三菜单"/></div>
																		<div class="div-img img3" onmouseover="over(3);" onmouseout="out(3);"  >
																			<c:choose>
																			 	<c:when test="${requestScope.list[2].IMG_URL != null}">
																			 		<ul>
																			 			<li>
																			 				<img src="${requestScope.list[2].IMG_URL}"  onclick="selectedImg(3);" style="cursor: pointer;"/>
																			 				 <div class="close-modal-small" onclick="del(3)" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"  onclick="del(3)" />
																			 			</li> 
																			 		</ul>
																			 	</c:when>
																			 	<c:otherwise>
																			 		<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
																						<li id="li-goods-add">
																							<a href="javascript:selectedImg(3);" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																						</li>
																					</ul>
																			 	</c:otherwise>
																			 </c:choose>
																		</div>
																		<div class="div-img-link">
																			<span style="display: inline-block;width:70px;text-align: left;"><ui:i18n key="菜单名称"/>：</span><input type="text" class="js-link name3" onblur="navNm(3);" style="width:288px;" value="${requestScope.list[2].NAME }"><br>
																			<span style="display: inline-block;width:70px;text-align: left;">URL：</span><input type="text" class="url" style="width:150px;" value="${requestScope.list[2].URL }" readonly="readonly">
																			<span class="btn-select js-url-input" id="pointerInsertUrl" ><ui:i18n key="手输"/></span>
																			<span class="btn-select js-url-select" id="selectUrlList" ><ui:i18n key="选择"/></span>
																		</div>
																	</div>
																	<div class="div-img-warp" style="height: 150px">
																		<div style="margin-bottom: 10px;font-size:14px;"><ui:i18n key="第四菜单"/></div>
																		<div class="div-img img4" onmouseover="over(4);" onmouseout="out(4);"  >
																			<c:choose>
																			 	<c:when test="${requestScope.list[3].IMG_URL != null}">
																			 		<ul>
																			 			<li>
																			 				<img src="${requestScope.list[3].IMG_URL}"  onclick="selectedImg(4);" style="cursor: pointer;"/>
																			 				 <div class="close-modal-small" onclick="del(4)" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"  onclick="del(4)" />
																			 			</li> 
																			 		</ul>
																			 	</c:when>
																			 	<c:otherwise>
																			 		<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
																						<li id="li-goods-add">
																							<a href="javascript:selectedImg(4);" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																						</li>
																					</ul>
																			 	</c:otherwise>
																			 </c:choose>
																		</div>
																		<div class="div-img-link">
																			<span style="display: inline-block;width:70px;text-align: left;"><ui:i18n key="菜单名称"/>：</span><input type="text" class="js-link name4" onblur="navNm(4);" style="width:288px;" value="${requestScope.list[3].NAME }"><br>
																			<span style="display: inline-block;width:70px;text-align: left;">URL：</span><input type="text" class="url" style="width:150px;" value="${requestScope.list[3].URL }" readonly="readonly">
																			<span class="btn-select js-url-input" id="pointerInsertUrl" ><ui:i18n key="手输"/></span>
																			<span class="btn-select js-url-select" id="selectUrlList" ><ui:i18n key="选择"/></span>
																		</div>
																	</div>
																	<div class="div-img-warp" style="height: 150px">
																		<div style="margin-bottom: 10px;font-size:14px;"><ui:i18n key="第五菜单"/></div>
																		<div class="div-img img5" onmouseover="over(5);" onmouseout="out(5);"  >
																			<c:choose>
																			 	<c:when test="${requestScope.list[4].IMG_URL != null}">
																			 		<ul>
																			 			<li>
																			 				<img src="${requestScope.list[4].IMG_URL}"  onclick="selectedImg(5);" style="cursor: pointer;"/>
																			 				 <div class="close-modal-small" onclick="del(5)" ></div><img class="delete-img-close" src="/admin/images/webzine/icon_del.png"  onclick="del(5)" />
																			 			</li> 
																			 		</ul>
																			 	</c:when>
																			 	<c:otherwise>
																			 		<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
																						<li id="li-goods-add">
																							<a href="javascript:selectedImg(5);" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>
																						</li>
																					</ul>
																			 	</c:otherwise>
																			 </c:choose>
																		</div>
																		<div class="div-img-link">
																			<span style="display: inline-block;width:70px;text-align: left;"><ui:i18n key="菜单名称"/>：</span><input type="text" class="js-link name5" onblur="navNm(5);" style="width:288px;" value="${requestScope.list[4].NAME }"><br>
																			<span style="display: inline-block;width:70px;text-align: left;">URL：</span><input type="text" class="url" style="width:150px;" value="${requestScope.list[4].URL }" readonly="readonly">
																			<span class="btn-select js-url-input" id="pointerInsertUrl" ><ui:i18n key="手输"/></span>
																			<span class="btn-select js-url-select" id="selectUrlList" ><ui:i18n key="选择"/></span>
																		</div>
																	</div>
																</div>
															</form>
														</div>
													</div>
													<div class="navi-button-area" style="width:100%;margin-top:30px;">
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