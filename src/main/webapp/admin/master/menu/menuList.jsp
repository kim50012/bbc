<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="菜单管理"/></title>  
<style type="text/css">

/* .w21{ */
/* 		width: 280px; */
/* 	} */


.upload-goods-img-div{width:90px;height:80px;border:1px solid #eee;text-align: center;background-image: url("/admin/images/portal/leftnav_lack.png");background-repeat: no-repeat;}
.upload-goods-img-div span{margin-top:45px;display:inline-block;font-size:12px;color:#313131;}
.image-tip{
	color: red;font-size:12px;margin-top: 0px;
}
.limit-span{
 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;
 	margin-left:0;
 	text-align: center;
 	width:100%;
 }
</style>
<script type="text/javascript">

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var thirdMenuId = $('#thirdMenuId').select2('val');
 	var secondMenuId = $('#secondMenuId').select2('val');
 	var firstMenuId = $('#firstMenuId').select2('val');
 	var menuStatus = $('#menuStatus').select2('val');
 	var parentMenuId;
 	if(thirdMenuId != ''){
 		parentMenuId = thirdMenuId;
 	}else if(secondMenuId != ''){
 		parentMenuId = secondMenuId;
 	}else if(firstMenuId != ''){
 		parentMenuId = firstMenuId;
 	}
 	$('#firstMenuId').val(firstMenuId);
	var params = {
			parentMenuId : parentMenuId
			,menuNm : $.trim($('#menuNm').val())
			,menuStatus : menuStatus
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/master/menu/menuListFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 $this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 }); 
		 $this.hideLoading();
	 });
	 
}


$(function(){
	if('${currLanguage }' == 'ko-KR'){
		$('#preview').attr('style','background-image:url("/admin/images/portal/leftnav_lack2.png")');
	}else{
		$('#preview').attr('style','background-image:url("/admin/images/portal/leftnav_lack.png")');
	}
	
	$(".js-add-page").click(function(){
		 showBpopup({
			id : 'createPagePopup',
			width : 450 
		});	  	 
	});
	
	$('#firstMenuId').change(function(e){ 
		var val = $(this).val();
		 
		var $combo = $('#secondMenuId');
		$combo.select2('val','').html('<option value=""><ui:i18n key="请选择"/></option>');
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
	   	 		data:{parentMenuId:val},
	   	 		async: false,
				url : '/admin/master/menu/getChildMenuList.htm',
				success : function(data) {
					 var list = data.list;
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value = "' + list[i].MENU_ID + '">' + list[i].MENU_NM + '</option>');
					 	 }
					 		$combo.select2('val','${requestScope.secondMenuId}'); 
					 	
					 }else{
						 
					 } 
				},
				error : function(xhr, status, e) {
					alert('error: ' + status);
				}
			});
		}
		
	});
	
	$('#secondMenuId').change(function(e){ 
		var val = $(this).val();
		var $combo = $('#thirdMenuId');
		$combo.select2('val','').html('<option value=""><ui:i18n key="请选择"/></option>');
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
	   	 		data:{parentMenuId:val},
	   	 		async: false,
				type : 'POST',
				url : '/admin/master/menu/getChildMenuList.htm',
				success : function(data) {
					 var list = data.list;
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].MENU_ID + '">' + list[i].MENU_NM + '</option>');
					 	 }
					 		$combo.select2('val','${requestScope.thirdMenuId}'); 
						 	
					 }else{
						 
					 } 
				},
				error : function(xhr, status, e) {
					alert('error: ' + status);
				}
			});
		}
		
	});
	
	$('#firstLevelMenu').change(function(e){ 
		var val = $(this).val();
		if(val == ''){
			var prevDiv = document.getElementById('preview');
			prevDiv.innerHTML = '';
			if('${currLanguage }' == 'ko-KR'){
				$('#preview').attr('style','background-image:url("/admin/images/portal/leftnav_lack2.png")');
			}else{
				$('#preview').attr('style','background-image:url("/admin/images/portal/leftnav_lack.png")');
			}
			
			$('#menuIcon').val('');
		}
		var $combo = $('#secondLevelMenu');
		$combo.select2('val','').html('<option value=""><ui:i18n key="请选择"/></option>');
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
	   	 		data:{parentMenuId:val},
	   	 		async: false,
				url : '/admin/master/menu/getChildMenuList.htm',
				success : function(data) {
					 var list = data.list;
					 if(list[0].MENU_ICON != null&&list[0].MENU_ICON != ''){
						var icon = '';
						if('${currLanguage }' == 'ko-KR'){
							icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'2.png';
						}else{
							icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'.png';
						}
					 	
						document.getElementById('preview').innerHTML = '<img src="' + icon+ '" />';
						$('#menuIcon').val(list[0].MENU_ICON);
						$('#menuIcon').attr('disabled','disabled');
						$('#logo_input').attr('disabled','disabled');
					 }else{
						$('#menuIcon').attr('disabled','disabled');
						$('#logo_input').attr('disabled','disabled');
					}
					
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].MENU_ID + '">' + list[i].MENU_NM + '</option>');
					 	 }
						 	
					 }else{
						 
					 } 
				},
				error : function(xhr, status, e) {
					alert('error: ' + status);
				}
			});
		}
		
	});
	
	
	$('#secondLevelMenu').change(function(e){ 
		var val = $(this).val();
// 		if(val == ''){
// 			var prevDiv = document.getElementById('preview');
// 			prevDiv.innerHTML = '';
// 			$('#preview').attr('style','background-image:url("/admin/images/portal/leftnav_lack.png")');
// 			$('#menuIcon').val('');
// 		}
		var $combo = $('#thirdLevelMenu');
		$combo.select2('val','').html('<option value=""><ui:i18n key="请选择"/></option>');
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
	   	 		data:{parentMenuId:val},
	   	 		async: false,
				url : '/admin/master/menu/getChildMenuList.htm',
				success : function(data) {
					 var list = data.list;
					 if(list[0].MENU_ICON != null&&list[0].MENU_ICON != ''){
						var icon = '';
						if('${currLanguage }' == 'ko-KR'){
							icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'2.png';
						}else{
							icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'.png';
						}
					 	
						document.getElementById('preview').innerHTML = '<img src="' + icon+ '" />';
						$('#menuIcon').val(list[0].MENU_ICON);
						$('#menuIcon').attr('disabled','disabled');
						$('#logo_input').attr('disabled','disabled');
					 }else{
						$('#menuIcon').attr('disabled','disabled');
						$('#logo_input').attr('disabled','disabled');
					}
					
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].MENU_ID + '">' + list[i].MENU_NM + '</option>');
					 	 }
						 	
					 }else{
						 
					 } 
				},
				error : function(xhr, status, e) {
					alert('error: ' + status);
				}
			});
		}
		
	});
	
	$('#firstLevelMenuUpd').change(function(e){ 
		
		var val = $(this).val();
		if($("#firstLevelMenuUpdOld").val()!=val){
	 		$('#firstLevelMenuNameUpd').attr('disabled', true);
	 		$('#firstLevelMenuNameUpd').css("background-color","#f4f4f4");
		}else{
			$('#firstLevelMenuNameUpd').attr('disabled', false);
	 		$('#firstLevelMenuNameUpd').css("background-color","#fff");
		}
		if(val == ''){
			var prevDiv = document.getElementById('previewUpd');
			prevDiv.innerHTML = '';
			if('${currLanguage }' == 'ko-KR'){
				$('#previewUpd').attr('style','background-image:url("/admin/images/portal/leftnav_lack2.png")');
			}else{
				$('#previewUpd').attr('style','background-image:url("/admin/images/portal/leftnav_lack.png")');
			}
			$('#previewUpd').attr('style','background-image:url("/admin/images/portal/leftnav_lack.png")');
			$('#menuIconUpd').val('');
		}
		var $combo = $('#secondLevelMenuUpd');
		$combo.select2('val','').html('<option value=""><ui:i18n key="请选择"/></option>');
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
	   	 		data:{parentMenuId:val},
	   	 		async: false,
				url : '/admin/master/menu/getChildMenuList.htm',
				success : function(data) {
					 var list = data.list;
					 if(list[0].MENU_ICON != null&&list[0].MENU_ICON != ''){
					 	var icon = ''
					 	if('${currLanguage }' == 'ko-KR'){
					 		icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'2.png';
					 	}else{
					 		icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'.png';
					 	}
						document.getElementById('previewUpd').innerHTML = '<img src="' + icon+ '" />';
						$('#menuIconUpd').val(list[0].MENU_ICON);
						$('#menuIconUpd').attr('disabled','disabled');
					 }else{
						$('#menuIconUpd').attr('disabled','disabled');
					}
					if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].MENU_ID + '">' + list[i].MENU_NM + '</option>');
					 	 }
					}else{
						 
					} 
				},
				error : function(xhr, status, e) {
					alert('error: ' + status);
				}
			});
		}
		
		controlStatus();
	});
	
	
	$('#secondLevelMenuUpd').change(function(e){ 
		var val = $(this).val();
		if($("#secondLevelMenuUpdOld").val()!=val){
	 		$('#secondLevelMenuNameUpd').attr('disabled', true);
	 		$('#secondLevelMenuNameUpd').css("background-color","#f4f4f4");
		}else{
			$('#secondLevelMenuNameUpd').attr('disabled', false);
	 		$('#secondLevelMenuNameUpd').css("background-color","#fff");
		}
		var $combo = $('#thirdLevelMenuUpd');
		$combo.select2('val','').html('<option value=""><ui:i18n key="请选择"/></option>');
		if(val == ''){
// 			$combo.prop('disabled', true).trigger('change');
		}else{
// 			$combo.prop('disabled', false);
			$.ajax({
	   	 		data:{parentMenuId:val},
	   	 		async: false,
				url : '/admin/master/menu/getChildMenuList.htm',
				success : function(data) {
					 var list = data.list;
					 if(list[0].MENU_ICON != null&&list[0].MENU_ICON != ''){
					 	var icon = '';
					 	if('${currLanguage }' == 'ko-KR'){
					 		icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'2.png';
					 	}else{
					 		icon = '/admin/images/portal/leftnav_'+list[0].MENU_ICON+'.png'
					 	}
						document.getElementById('previewUpd').innerHTML = '<img src="' + icon+ '" />';
						$('#menuIconUpd').val(list[0].MENU_ICON);
						$('#menuIconUpd').attr('disabled','disabled');
					 }else{
						$('#menuIconUpd').attr('disabled','disabled');
					 }
					
					if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].MENU_ID + '">' + list[i].MENU_NM + '</option>');
					 	 }
						 	
					}else{
						 
					} 
				},error : function(xhr, status, e) {
					alert('error: ' + status);
				}
			});
		}	
		controlStatus();
	});
	
	if('${requestScope.firstMenuId}' != ''){
		$('#firstMenuId').select2('val','${requestScope.firstMenuId}');
		$('#firstMenuId').change();
	}
	
	if('${requestScope.secondMenuId}' != ''){
		$('#secondMenuId').change();
	}
});

function controlStatus(){
	if($("#menuLevel").val()==1){
		$('#secondLevelMenuNameUpd').attr("readonly","readonly");
		$('#secondLevelMenuNameUpd').css("background-color","#f4f4f4");
		$('#thirdLevelMenuUpd').prop('disabled', true);
		$('#thirdLevelMenuNameUpd').attr("readonly","readonly");
		$('#thirdLevelMenuNameUpd').css("background-color","#f4f4f4");
	}else if($("#menuLevel").val()==2){
		$('#secondLevelMenuNameUpd').removeAttr("readonly");
		$('#secondLevelMenuNameUpd').css("background-color","#fff");
		$('#thirdLevelMenuNameUpd').attr("readonly","readonly");
		$('#thirdLevelMenuNameUpd').css("background-color","#f4f4f4");
		$('#thirdLevelMenuUpd').prop('disabled', true);
	}
}

function search(){
 	var thirdMenuId = $('#thirdMenuId').val();
 	var secondMenuId = $('#secondMenuId').val();
 	var firstMenuId = $('#firstMenuId').val();
 	if(thirdMenuId != ''){
 		$('#parentMenuId').val(thirdMenuId);
 	}else if(secondMenuId != ''){
 		$('#parentMenuId').val(secondMenuId);
 	}else if(firstMenuId != ''){
 		$('#parentMenuId').val(firstMenuId);
 	}
 	$('#firstMenuId').val(firstMenuId);
//  	$('#menuNm').val($('#menuNm').val());
 	$('#searchForm').submit();
}
function updateStatus(menuId,status){
	var flg = 0;
	if(status == 1){
		if(confirm('<ui:i18n key="您确定要禁用该菜单么"/>？')){
			flg = 1;
		}else return false;
	}
	if(status == 0){
		if(confirm('<ui:i18n key="您确定要启用该菜单么"/>？')){
			flg = 1;
		}else return false;
	}
	if(flg == 1){
		var params = {
				menuId : menuId,
				status : status == 1?0:1
			};

			$.ajax({
				data : params,
				cache : false,
				url : '/admin/master/menu/updateStatus.htm',
				success : function(data){
					if (data.result == 'S'){
						alert('<ui:i18n key="保存成功"/>。');
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('.js-grid-content #pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
						$('.b-close').click();
// 						location.reload();
					} else {
						alert('<ui:i18n key="请重新点击"/>.');
					}
				},
				error : function(a, msg, c){
					
					alert('error: ' + msg);
				}
			});
		
	}
}

function menuDetail(menuId){
	var params = {
			menuId : menuId
		};
	
	$.ajax({
		data : params,
		async : false,
		url : '/admin/master/menu/menuDetail.htm',
		success : function(data){
			showBpopup({
				id : 'modifyPagePopup',
				width : 450 
			});	  	 
			$("#menuLevel").val(data.MENU_LEVEL);
			$("#menuId").val(data.MENU_ID);
			if(data.MENU_LEVEL == 3){
				$("#firstLevelMenuUpdOld").val(data.MENU_P_PID);
				$("#secondLevelMenuUpdOld").val(data.MENU_PID);
				$("#thirdLevelMenuUpdOld").val(data.MENU_ID);
				$('#firstLevelMenuUpd').select2('val',data.MENU_P_PID);
				$('#firstLevelMenuUpd').change();
				$('#secondLevelMenuUpd').select2('val',data.MENU_PID);
				$('#secondLevelMenuUpd').change();
				$('#thirdLevelMenuUpd').select2('val',data.MENU_ID);
				
			}
			if(data.MENU_LEVEL == 2){
				$("#firstLevelMenuUpdOld").val(data.MENU_PID);
				$("#secondLevelMenuUpdOld").val(data.MENU_ID);
				$('#firstLevelMenuUpd').select2('val',data.MENU_PID);
				$('#firstLevelMenuUpd').change();
				$('#secondLevelMenuUpd').select2('val',data.MENU_ID);
				$('#thirdLevelMenuNameUpd').attr("readonly","readonly");
				$('#thirdLevelMenuNameUpd').css("background-color","#f4f4f4");
				$('#thirdLevelMenuNameUpd').val('');
				$('#thirdLevelMenuUpd').select2('val','');
				$('#thirdLevelMenuUpd').prop('disabled', true);
			}
			if(data.MENU_LEVEL == 1){
// 				$('#menuUrlUpd').attr('disabled','disabled');
// 				$('#firstLevelMenuUpd').prop('disabled', true);
				$('#firstLevelMenuUpd').select2('val',data.MENU_ID);
				$("#firstLevelMenuUpdOld").val(data.MENU_ID);
				$('#secondLevelMenuUpd').prop('disabled', true);
				$('#secondLevelMenuNameUpd').attr("readonly","readonly");
				$('#secondLevelMenuNameUpd').css("background-color","#f4f4f4");
				$('#thirdLevelMenuUpd').prop('disabled', true);
				$('#thirdLevelMenuNameUpd').attr("readonly","readonly");
				$('#thirdLevelMenuNameUpd').css("background-color","#f4f4f4");
				$('#thirdLevelMenuUpd').select2('val','');
				$('#secondLevelMenuUpd').select2('val','');
				
			}
			$('#menuNameUpd').val(data.MENU_NM);
			$('#menuUrlUpd').val(data.MENU_URL);
// 			$('#menuLevelUpd').val(data.MENU_LEVEL);
			$('#menuIconUpd').val(data.MENU_ICON);
// 			var icon = '/admin/images/portal/leftnav_'+data.MENU_ICON+'.png';
			var icon = '';
		 	if('${currLanguage }' == 'ko-KR'){
		 		icon = '/admin/images/portal/leftnav_'+data.MENU_ICON+'2.png';
		 	}else{
		 		icon = '/admin/images/portal/leftnav_'+data.MENU_ICON+'.png'
		 	}
			document.getElementById('previewUpd').innerHTML = '<img src="' + icon+ '" />';
// 			$('#menuIcon').attr('disabled','disabled');
// 			$('#logo_input').attr('disabled','disabled');
			
// 			bPoupDivDisplay();
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
}


function bPoupDivDisplay(){
	
	$('.poupMessageDisplay').bPopup({
		modalClose: false,//弹出框深色区域，关闭的响应
		modalColor: '#aeaeae',
		opacity: 0.3,
		fadeSpeed: 'slow',
		onOpen:function(){
			if($('#menuId').val() == ''){
				$('#menuIcon').attr('disabled','disabled');
				$('#logo_input').attr('disabled','disabled');
				$('#popupTitle').html('<ui:i18n key="新建菜单"/>');
			}else{
				$('#popupTitle').html('<ui:i18n key="菜单修改"/>');
			}
		}
	});
	
}
function clearOption(){
	$('#firstLevelMenu').select2('val', '');
	$('#firstLevelMenuName').val('');
	$('#secondLevelMenu').select2('val', '');
	$('#secondLevelMenuName').val('');
	$('#thirdLevelMenu').select2('val', '');
	$('#thirdLevelMenuName').val('');
	$('#menuUrl').val('');
}
function closePopup(){
	$('#secondLevelMenuUpd option').remove();
	$('#thirdLevelMenuUpd option').remove();
	$('#secondLevelMenuUpd').removeAttr('disabled');
	$('#thirdLevelMenuUpd').removeAttr('disabled');
	$('#thirdLevelMenuNameUpd').removeAttr('readonly');
	$('#thirdLevelMenuNameUpd').removeAttr('readonly');
	$('#secondLevelMenuNameUpd').css("background-color","#fff");
	$('#thirdLevelMenuNameUpd').css("background-color","#fff");
// 	$('#firstLevelMenuUpd option').remove();
// 	$('#firstLevelMenuUdp').prop('disabled', false);
// 	$('#secondLevelMenuUdp').prop('disabled', false);
// 	$('#thirdLevelMenuUdp').prop('disabled', false);
	$('#firstLevelMenuUdp').select2('val', '');
	$('#secondLevelMenuUdp').select2('val', '');
	$('#thirdLevelMenuUdp').select2('val', '');
	$('#thirdLevelMenuNameUpd').val('');
	$('#thirdLevelMenuNameUpd').val('');
	$('#secondLevelMenuUpdOld').val(0);
	$('#thirdLevelMenuUpdOld').val(0);
// 	$('#menuId').val('');
// 	$('#menuLevel').val('');
// 	$('#menuIcon').val('');
// 	var prevDiv = document.getElementById('preview');
// 	prevDiv.innerHTML = '';
// 	$('#preview').attr('style','background-image:url("/admin/images/portal/leftnav_lack.png")');
// 	$('#trMenuIcon').removeAttr('style');
// 	$('#menuIcon').removeAttr('disabled');
// 	$('#menuUrl').removeAttr('disabled');
// 	$('#logo_input').removeAttr('disabled');
}


function save(){
	var firstLevelMenu = $('#firstLevelMenu').select2('val');
	var firstLevelMenuName = $('#firstLevelMenuName').val();
	var secondLevelMenu = $('#secondLevelMenu').select2('val');
	var secondLevelMenuName = $('#secondLevelMenuName').val();
	var thirdLevelMenu = $('#thirdLevelMenu').select2('val');
	var thirdLevelMenuName = $('#thirdLevelMenuName').val();
	var menuIcon = 'lack';
	if($('#menuIcon').val() != ''){
		menuIcon = $('#menuIcon').val();
	}
	if(firstLevelMenu == '' && firstLevelMenuName ==''){
		alert('<ui:i18n key="请选择或填写第一级分类"/>');
		return false;
	}
	var params = {
		firstLevelMenu : firstLevelMenu
		,firstLevelMenuName : firstLevelMenuName
		,secondLevelMenu : secondLevelMenu
		,secondLevelMenuName : secondLevelMenuName
		,thirdLevelMenu : thirdLevelMenu
		,thirdLevelMenuName : thirdLevelMenuName
		,menuUrl : $('#menuUrl').val()
		,menuIcon : menuIcon
// 		,menuLevel : menuLevel
	};
	$.ajax({
		data : params,
		url : '/admin/master/menu/saveMenu.htm',
		success : function(data){
			if(data.result == 'S'){
				alert('<ui:i18n key="保存成功"/>');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('.js-grid-content #pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
// 				window.location.reload();
			}else{
				alert('<ui:i18n key="'+data.result+'"/>');
			}
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
}

function modify(){
	var firstLevelMenuNameUpd="";
	var firstLevelMenuUpdOld = $('#firstLevelMenuUpdOld').val();
	var firstLevelMenuUpd = $('#firstLevelMenuUpd').select2('val');
	if(firstLevelMenuUpdOld == firstLevelMenuUpd){
		if($('#firstLevelMenuNameUpd').val()!=''){
			firstLevelMenuNameUpd = $('#firstLevelMenuNameUpd').val();
		}else{
			firstLevelMenuNameUpd = $('#firstLevelMenuUpd').find('option:selected').text();
		}
	}else{
		firstLevelMenuNameUpd = $('#firstLevelMenuUpd').find('option:selected').text();
	}
	if($("#menuLevel").val()==1){
		if(firstLevelMenuNameUpd==""){
			alert('<ui:i18n key="请选择或填写第一级分类"/>');
			return false;
		}
	}
	var secondLevelMenuNameUpd="";
	var secondLevelMenuUpdOld = $('#secondLevelMenuUpdOld').val();
	var secondLevelMenuUpd = $('#secondLevelMenuUpd').select2('val');
	if(secondLevelMenuUpd == secondLevelMenuUpdOld ){
		if($('#secondLevelMenuNameUpd').val()!=''){
			secondLevelMenuNameUpd = $('#secondLevelMenuNameUpd').val();
		}else{
			if($('#secondLevelMenuUpd').find('option:selected').text() != ''){
				secondLevelMenuNameUpd = $('#secondLevelMenuUpd').find('option:selected').text();
			}
		}
	}else{
		if($('#secondLevelMenuUpd').find('option:selected').text() != ''){
			secondLevelMenuNameUpd = $('#secondLevelMenuUpd').find('option:selected').text();
		}
	}
	if($("#menuLevel").val()==2){
		if(firstLevelMenuNameUpd==""){
			alert('<ui:i18n key="请选择或填写第一级分类"/>');
			return false;
		}
		if(secondLevelMenuNameUpd==""){
			alert('<ui:i18n key="请选择或填写第二级分类"/>');
			return false;
		}
	}
	var thirdLevelMenuNameUpd="";
	var thirdLevelMenuUpdOld = $('#thirdLevelMenuUpdOld').val();
	var thirdLevelMenuUpd = $('#thirdLevelMenuUpd').select2('val');
	if(thirdLevelMenuUpd == thirdLevelMenuUpdOld){
		if($('#thirdLevelMenuNameUpd').val()!=''){
			thirdLevelMenuNameUpd = $('#thirdLevelMenuNameUpd').val();
		}else{
				thirdLevelMenuNameUpd = $('#thirdLevelMenuUpd').find('option:selected').text();
		}
	}else{
			thirdLevelMenuNameUpd = $('#thirdLevelMenuUpd').find('option:selected').text();
	}
	if($("#menuLevel").val()==3){
		if(firstLevelMenuNameUpd==""){
			alert('<ui:i18n key="请选择或填写第一级分类"/>');
			return false;
		}
		if(secondLevelMenuNameUpd==""){
			alert('<ui:i18n key="请选择或填写第二级分类"/>');
			return false;
		}
		if(thirdLevelMenuNameUpd==""){
			alert('<ui:i18n key="请选择或填写第三级分类"/>');
			return false;
		}
	}
	
	var menuIcon = 'lack';
	if($('#menuIcon').val() != ''){
		menuIcon = $('#menuIcon').val();
	}
	var params = {
			firstLevelMenu : firstLevelMenuUpdOld
			,firstLevelMenuName : ''
			,firstLevelMenuNew : firstLevelMenuUpd
			,firstLevelMenuNameNew : firstLevelMenuNameUpd
			,secondLevelMenu : secondLevelMenuUpdOld
			,secondLevelMenuName : ''
			,secondLevelMenuNew : secondLevelMenuUpd
			,secondLevelMenuNameNew : secondLevelMenuNameUpd
			,thirdLevelMenu : thirdLevelMenuUpdOld
			,thirdLevelMenuName : ''
			,thirdLevelMenuNew : thirdLevelMenuUpd
			,thirdLevelMenuNameNew : thirdLevelMenuNameUpd
			,menuUrl : $('#menuUrlUpd').val()
			,menuId : $("#menuId").val()
			,menuLevel : $("#menuLevel").val()
		};
		$.ajax({
			data : params,
			url : '/admin/master/menu/modify.htm',
			success : function(data){
				if(data.result == 'S'){
					alert('<ui:i18n key="保存成功"/>');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('.js-grid-content #pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
					$('.b-close').click();
// 					window.location.reload();
				}else{
					alert('<ui:i18n key="'+data.result+'"/>');
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
}

// function save(){
// 	if($.trim($("#menuName").val())==""){
// 		alert('<ui:i18n key="请输入菜单名称"/>');
// 		return false;
// 	}
// 	var menuLevel = 1;
// 	var parentMenuId = 0;
// 	if($('#secondLevelMenu').val() != ''){
// 		parentMenuId = $('#secondLevelMenu').val();
// 		menuLevel = 3;
// 	}
// 	if($('#secondLevelMenu').val() == ''&&$('#firstLevelMenu').val() != ''){
// 		parentMenuId = $('#firstLevelMenu').val();
// 		menuLevel = 2;
// 	}
// 	var menuIcon = 'lack';
// 	if($('#menuIcon').val() != ''){
// 		menuIcon = $('#menuIcon').val();
// 	}
// 	var params = {
// 			menuId : $('#menuId').val()
// 			,parentMenuId : parentMenuId
// 			,menuName : $('#menuName').val()
// 			,menuUrl : $('#menuUrl').val()
// 			,menuIcon : menuIcon
// 			,menuLevel : menuLevel
// 		};
	
// 	$.ajax({
// 		data : params,
// 		dataType : 'json',
// 		type : 'POST',
// 		cache : false,
// 		url : '/admin/master/menu/updateMenu.htm',
// 		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
// 		success : function(data){
// 			if(data.result = 'S'){
// 				alert('<ui:i18n key="保存成功"/>');
// 				location.reload();
// 			}
// 		},
// 		error : function(a, msg, c){
// 			alert('error: ' + msg);
// 		}
// 	});
// }

</script> 
</head>
<body>
	<form id="searchForm" action="/admin/master/menu/menuList.htm" method="post">
		<input type="hidden"  name="pageCurr" id="pageCurr" value="" />
		<input type="hidden"  name="pageUnit" id="pageUnit" value="" />
		<input type="hidden"  name="parentMenuId" id="parentMenuId" value="" />
	<!-- ▼ header  --> 
   	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
	<!-- ▲  container-->
	<div class="contents clearfix">
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 40px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/pageManage/icon_code.png">
				<span class="title-name"><ui:i18n key="菜单管理"/></span>
			</div>
			<div class="action-tools">
				<span class="action-tool">
	   		   		<img class="action-tool-icon refresh" alt="" src="/admin/images/groupCreate/toback.png" onclick="ggChangeShop();" />
			  		<span class="action-name" onclick="ggChangeShop();" ><ui:i18n key="返回店铺目录"/></span>
	   		   	</span>
			</div>
		</div>
		<!-- ▲标题 -->

		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable" border="1">
	       		 		<colgroup>
	       		 			<col width="11%" />
	       		 			<col width="40%" />
	       		 			<col width="10%" />
	       		 			<col width="15%" />
	       		 			<col width="9%" />
	       		 			<col width="15%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="菜单分类"/>：</td>
	       		 			<td class="fcomp">
	       		 				<select class="select2" style="width: 48%" id="firstMenuId" name="firstMenuId">
	       		 					<option value=""><ui:i18n key="请选择"/></option>
	       		 					<c:forEach var="list"  items="${parentMenuList }" > 
									      <option value="${list.MENU_ID }">${list.MENU_NM }</option>
									</c:forEach> 
	       		 				</select>
	       		 				&nbsp;
	       		 				<select class="select2" style="width: 48%" id="secondMenuId" name="secondMenuId">
	       		 					<option value=""><ui:i18n key="请选择"/></option>
	       		 				</select>
	       		 			</td>
	       		 			<td class="flabel" style="display: none;">
	       		 				<select class="select2" style="width: 100%;" id="thirdMenuId" name="thirdMenuId">
	       		 					<option value=""><ui:i18n key="请选择"/></option>
	       		 				</select>
	       		 			</td>
	       		 			<td class="flabel">
	       		 				<ui:i18n key="菜单名称"/>：
	       		 			</td>
	       		 			<td class="fcomp">
	       		 				<input type="text" name="menuNm" id="menuNm" value="${menuNm }"/>
	       		 			</td>
	       		 			<td class="flabel"><ui:i18n key="状态"/>：</td>
	       		 			<td class="fcomp">
	       		 				<select class="select2" style="width: 150px;" id="menuStatus" name="menuStatus">
	       		 					<option value=""><ui:i18n key="请选择"/></option>
	       		 					<option value="1"><ui:i18n key="启用"/></option>
	       		 					<option value="0"><ui:i18n key="禁用"/></option>
	       		 				</select>
	       		 			</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<div class="butttn-area m1" onclick="searchData();">
	       		   <span class="button">
	       		   	<span class="button-icon search"></span>
	       		   	<ui:i18n key="查询" />
	       		   </span>
	       		</div>
	      	</div>
		<!-- ▲ 查询表单区域  -->   
		<!-- ▼ 普通表格  --> 
	      <div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header" >
   				<div class="result-grid-tools">
      		   		<span class="result-grid-tool js-add-page">
     		   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="新建"/>
     		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
<!-- 		      		<table class="result-grid-table"> -->
<!-- 			      	 	<thead class="result-grid-thead"> -->
<!-- 			      		 	<tr> -->
<%-- 			      		 		<th style="width: 120px"><ui:i18n key="菜单分类" /></th> --%>
<%-- 			      		 		<th style="width: 120px"><ui:i18n key="菜单名称" /></th> --%>
<%-- 			      		 		<th style="width: 120px"><ui:i18n key="菜单等级" /></th> --%>
<!-- 			      		 		<th style="width: 200px">URL</th> -->
<%-- 			      		 		<th style="width: 120px"><ui:i18n key="图标" /></th> --%>
<%-- 			      		 		<th style="width: 120px"><ui:i18n key="状态" /></th> --%>
<%-- 			      		 		<th style="width: 200px"><ui:i18n key="操作" /></th> --%>
<!-- 			      		 	</tr> -->
<!-- 			      		 </thead> -->
<!-- 			      		 <tbody  class="result-grid-tbody" > -->
<%-- 				      		 <c:forEach var="list"  items="${menuList }">  --%>
<!-- 				      		 	<tr> -->
<%-- 				      		 		<td style="width: 120px">${list.MENU_PNM }</td> --%>
<%-- 				      		 		<td style="width: 120px">${list.MENU_NM }</td> --%>
<%-- 				      		 		<td style="width: 120px">${list.MENU_LEVEL }</td> --%>
<%-- 				      		 		<td align="left" style="padding-left: 15px;width: 200px;">${list.MENU_URL }</td> --%>
<!-- 				      		 		<td style="width: 120px"> -->
<%-- 				      		 			<img alt="" src="/admin/images/portal/leftnav_${list.MENU_ICON}.png" style="height: 38px"/> --%>
<!-- 				      		 		</td> -->
<!-- 				      		 		<td style="width: 120px"> -->
<%-- 				      		 			<c:if test="${list.ACTIVE_STS == 1 }"><ui:i18n key="启用" /></c:if> --%>
<%-- 				      		 			<c:if test="${list.ACTIVE_STS == 0 }"><ui:i18n key="禁用" /></c:if> --%>
<!-- 				      		 		</td> -->
<!-- 				      		 		<td style="width: 200px"> -->
<%-- 				      		 			<span class="gridbutton red" onclick="menuDetail('${list.MENU_ID }')"><ui:i18n key="编辑" /></span> --%>
<%-- 				      		 			<c:if test="${list.ACTIVE_STS == 1 }"> --%>
<%-- 				      		 				<span class="gridbutton red" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')"><ui:i18n key="禁用" /></span> --%>
<%-- 				      		 			</c:if> --%>
<%-- 				      		 			<c:if test="${list.ACTIVE_STS == 0 }"> --%>
<%-- 				      		 				<span class="gridbutton green" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')"><ui:i18n key="启用" /></span> --%>
<%-- 				      		 			</c:if> --%>
<!-- 				      		 		</td> -->
<!-- 				      		 	</tr> -->
<%-- 				      		 </c:forEach> --%>
<!-- 			      		 </tbody> -->
<!-- 		      		</table> -->
					<table class="result-grid-table">
			      	 	<thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th style="width: 120px"><ui:i18n key="一级菜单" /></th>
			      		 		<th style="width: 120px"><ui:i18n key="二级菜单" /></th>
			      		 		<th style="width: 120px"><ui:i18n key="三级菜单" /></th>
			      		 		<th style="width: 200px">URL</th>
			      		 		<th style="width: 120px"><ui:i18n key="图标" /></th>
			      		 		<th style="width: 120px"><ui:i18n key="状态" /></th>
			      		 		<th style="width: 200px"><ui:i18n key="操作" /></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody" >
				      		 <c:forEach var="list"  items="${menuList }"> 
				      		 	<tr>
				      		 		<td style="width: 120px">${list.FIRST_MENU_NM }</td>
				      		 		<td style="width: 120px">${list.SECOND_MENU_NM }</td>
				      		 		<td style="width: 120px"><span class="limit-span" title="${list.THIRD_MENU_NM }">${list.THIRD_MENU_NM }</span></td>
				      		 		<td align="left" style="padding-left: 15px;width: 200px;"><span align="left" class="limit-span" title="${list.MENU_URL }">${list.MENU_URL }</span></td>
				      		 		<td style="width: 120px">
				      		 			<c:if test="${currLanguage eq 'ko-KR'}" >
				      		 				<img alt="" src="/admin/images/portal/leftnav_${list.MENU_ICON}2.png" style="height: 38px"/>
				      		 			</c:if>
				      		 			<c:if test="${currLanguage eq 'zh-CN'}" >
				      		 				<img alt="" src="/admin/images/portal/leftnav_${list.MENU_ICON}.png" style="height: 38px"/>
				      		 			</c:if>
				      		 		</td>
				      		 		<td style="width: 120px">
				      		 			<c:if test="${list.ACTIVE_STS == 1 }"><ui:i18n key="启用" /></c:if>
				      		 			<c:if test="${list.ACTIVE_STS == 0 }"><ui:i18n key="禁用" /></c:if>
				      		 		</td>
				      		 		<td style="width: 200px">
				      		 			<span class="gridbutton red" onclick="menuDetail('${list.MENU_ID }')"><ui:i18n key="编辑" /></span>
				      		 			<c:if test="${list.ACTIVE_STS == 1 }">
				      		 				<span class="gridbutton red" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')"><ui:i18n key="禁用" /></span>
				      		 			</c:if>
				      		 			<c:if test="${list.ACTIVE_STS == 0 }">
				      		 				<span class="gridbutton green" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')"><ui:i18n key="启用" /></span>
				      		 			</c:if>
				      		 		</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
		      		</table>
      			</div>
      			<ui:paging page="${page }" />
      		</div>
<!-- 	      	<div class="page-navigation-warp" > -->
<!-- 	      		<div class="page-navigation" > -->
<!-- 		         	<a class="page-navi"> -->
<%-- 			         	<c:choose> --%>
<%-- 			         		<c:when test="${page.fisrtPage }"> --%>
<!-- 			         			<span class="page-icon js-page-first page-first-disabled"></span> -->
<%-- 			         		</c:when> --%>
<%-- 			         		<c:otherwise> --%>
<%-- 			         			<span class="page-icon js-page-first page-first" onclick="showPage(1 , ${page.pageSize });"></span> --%>
<%-- 			         		</c:otherwise> --%>
<%-- 			         	</c:choose> --%>
<!-- 		         	</a> -->
<!-- 		         	<a class="page-navi"> -->
<%-- 		         		<c:choose> --%>
<%-- 		         		<c:when test="${page.hasPreviousPage }"> --%>
<%-- 		         			<span class="page-icon js-page-preview page-preview" onclick="showPage(${page.pageNo - 1 } , ${page.pageSize });"></span> --%>
<%-- 		         		</c:when> --%>
<%-- 		         		<c:otherwise> --%>
<!-- 		         			<span class="page-icon js-page-preview page-preview-disabled"></span> -->
<%-- 		         		</c:otherwise> --%>
<%-- 		         	</c:choose> --%>
		         		
<!-- 		         	</a> -->
<%-- 		         	<select id="currentPage" onchange="showPage(this.value,${page.pageSize });" class="page-select select2 js-current-page"> --%>
<%-- 		         	   <c:forEach var="idx" begin="1" end="${page.totalPageCount }"  >  --%>
<%-- 						      <option value="${idx }" <c:if test="${page.pageNo eq idx }">selected="selected"</c:if> >${idx }</option> --%>
<%-- 						</c:forEach>  --%>
<!-- 		         	</select> -->
<!-- 		         	<a class="page-navi"> -->
<%-- 		         		<c:choose> --%>
<%-- 		         		<c:when test="${page.hasNextPage }"> --%>
<%-- 		         			<span class="page-icon js-page-next page-next" onclick="showPage(${page.pageNo + 1 } , ${page.pageSize });"></span> --%>
<%-- 		         		</c:when> --%>
<%-- 		         		<c:otherwise> --%>
<!-- 		         			<span class="page-icon js-page-next page-next-disabled"></span> -->
<%-- 		         		</c:otherwise> --%>
<%-- 		         	</c:choose> --%>
		         	
		         		
<!-- 		         	</a> -->
<!-- 		         	<a class="page-navi"> -->
<%-- 		         		<c:choose> --%>
<%-- 		         		<c:when test="${page.lastPage }"> --%>
<!-- 		         			<span class="page-icon js-page-last page-last-disabled"></span> -->
<%-- 		         		</c:when> --%>
<%-- 		         		<c:otherwise> --%>
<%-- 		         			<span class="page-icon js-page-last page-last" onclick="showPage( ${page.totalPageCount },${page.pageSize });"></span> --%>
<%-- 		         		</c:otherwise> --%>
<%-- 		         	</c:choose>  --%>
<!-- 		         	</a> -->
<!-- 		         	  <select id="pageUnit1" class="page-select select2 js-page-unit" > -->
<%-- 		         			<c:if test="${requestScope.pageUnit == 10}"> --%>
<!-- 								<option value="10" selected="selected">10</option> -->
<!-- 								<option value="20">20</option> -->
<!-- 								<option value="30">30</option> -->
<!-- 								<option value="50">50</option> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${requestScope.pageUnit == 20}"> --%>
<!-- 								<option value="10">10</option> -->
<!-- 								<option value="20" selected="selected">20</option> -->
<!-- 								<option value="30">30</option> -->
<!-- 								<option value="50">50</option> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${requestScope.pageUnit == 30}"> --%>
<!-- 								<option value="10">10</option> -->
<!-- 								<option value="20">20</option> -->
<!-- 								<option value="30" selected="selected">30</option> -->
<!-- 								<option value="50">50</option> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${requestScope.pageUnit == 50}"> --%>
<!-- 								<option value="10">10</option> -->
<!-- 								<option value="20">20</option> -->
<!-- 								<option value="30">30</option> -->
<!-- 								<option value="50" selected="selected">50</option> -->
<%-- 							</c:if> --%>
<!-- 			         	</select>  -->
<!-- 			         	<span> 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> -->
			         	 
			         	
<!-- 			    		<div  class="js-totalSum  paging-total-summary" style=" "> -->
<%-- 			    			 ${label.每页}${page.pageSize }${label.条}, ${label.共}${page.totalCount }${label.条} --%>
<!-- 			    		</div> -->
<!-- 			    	</div> -->
		    	
<!-- 		    	</div> -->
	      </div>
		<!-- ▲ 普通表格  -->    
			
	</div>
	<!-- ▼container -->
	</form>
	<!-- Start弹出框 -->
<!-- 		<div class="poupMessageDisplay" style="display:none;"> -->
<!-- 			<input  type="hidden" id="menuId"   /> -->
<!-- 			<input  type="hidden" id="menuLevel"   /> -->
<!-- 			<div class="poupMessage" style="top:-190px;"> -->
<!-- 				<table class="poupMessageTable"> -->
<!-- 					<tr class="poupTableHead"> -->
<!-- 						<td colspan="2"> -->
<!-- 							<span id="popupTitle"></span> -->
<!-- 							<div style="float:right;"> -->
<!-- 								<img class="exitPoup"  src="/admin/images/goodsSell/close.png" onclick="javascript:closePopup();"/> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr><td colspan="2" style="height: 25px;"></td></tr> -->
<!-- 					<tr> -->
<%-- 						<td class="tdTitle"><ui:i18n key="菜单分类"/>：</td> --%>
<!-- 						<td class="tdContent"> -->
<!-- 							<select class="select2" style="width: 45%;" id="firstLevelMenu" name="firstLevelMenu"> -->
<%--        		 					<option value=""><ui:i18n key="请选择"/></option> --%>
<%--        		 					<c:forEach var="list"  items="${parentMenuList }" >  --%>
<%-- 								      <option value="${list.MENU_ID }">${list.MENU_NM }</option> --%>
<%-- 								</c:forEach>  --%>
<!--        		 				</select> -->
<!--        		 				<select class="select2" style="width: 45%;" id="secondLevelMenu" name="secondLevelMenu"> -->
<%--        		 					<option value=""><ui:i18n key="请选择"/></option> --%>
<!--        		 				</select> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td class="tdTitle"><ui:i18n key="菜单名称" /><font style="color: red; margin-left: 5px;">*</font>：</td> --%>
<!-- 						<td class="tdContent"> -->
<!-- 							<input  value="" type="text" id="menuName"   style="width: 250px;"/> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td class="tdTitle">URL：</td> -->
<!-- 						<td class="tdContent"> -->
<!-- 							<input  value="" type="text" id="menuUrl"   style="width: 250px;"/> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr id="trMenuIcon"> -->
<%-- 						<td class="tdTitle"><ui:i18n key="图标" />*</font>：</td> --%>
<!-- 						<td class="tdContent"> -->
<!-- 							<input type="file" id="logo_input" name="logo_input" style="position: absolute; width: 90px; height: 80px; z-index: 12; filter: alpha(opacity:0); opacity: 0; cursor: pointer;" onchange="javascript:logoUpload(this);" /> -->
<!-- 							<div id="preview" class="upload-goods-img-div"> -->
<!-- 							</div> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td class="tdTitle"><ui:i18n key="图标名称" />：</td> --%>
<!-- 						<td class="tdContent"> -->
<!-- 							<input  value="" type="text" id="menuIcon"  style="width: 250px;"/> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td colspan="2" style="padding-top: 10px;text-align: center;"> -->
<!-- 							<img onclick="javascript:save();" src="/admin/images/goodsClass/save.png" style="cursor: pointer;"> -->
<!-- 							<img onclick="javascript:closePopup();" src="/admin/images/goodsClass/abolish.png" style="cursor: pointer;margin-left: 30px;"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 		</div> -->
	<!-- End 弹出框-->
	
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="createPagePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="新建"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" onclick="javascript:clearOption();"/>
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="一级菜单"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<select class="select2" style="width: 130px;" id="firstLevelMenu" name="firstLevelMenu">
			       		 					<option value=""><ui:i18n key="请选择"/></option>
			       		 					<c:forEach var="list"  items="${parentMenuList }" > 
											      <option value="${list.MENU_ID }">${list.MENU_NM }</option>
											</c:forEach> 
			       		 				</select>
			       		 				&nbsp;
			       		 				<input type="text" id="firstLevelMenuName" placeholder="<ui:i18n key="请输入一级菜单名"/>" style="width: 100px">
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="二级菜单"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<select class="select2" style="width: 130px;" id="secondLevelMenu" name="secondLevelMenu">
			       		 					<option value=""><ui:i18n key="请选择"/></option>
			       		 				</select>
			       		 				&nbsp;
			       		 				<input type="text" id="secondLevelMenuName" placeholder="<ui:i18n key="请输入二级菜单名"/>" style="width: 100px">
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="三级菜单"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<select class="select2" style="width: 130px;" id="thirdLevelMenu" name="thirdLevelMenu">
			       		 					<option value=""><ui:i18n key="请选择"/></option>
			       		 				</select>
			       		 				&nbsp;
			       		 				<input type="text" id="thirdLevelMenuName" placeholder="<ui:i18n key="请输入三级菜单名"/>" style="width: 100px">
					  			 	 </div>
					  			 </div>
					  			  <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="页面链接"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input  value="" type="text" id="menuUrl" style="width: 240px" placeholder="<ui:i18n key="请输入页面链接"/>" />
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label"  style="width: 80px">
					  			 		<ui:i18n key="图标"/></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
<!-- 					  			 	 	<input type="file" id="logo_input" name="logo_input" style="position: absolute; width: 90px; height: 80px; z-index: 12; filter: alpha(opacity:0); opacity: 0; cursor: pointer;"  /> -->
					  			 	 	<div id="preview" class="upload-goods-img-div">
										</div>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label"  style="width: 80px">
					  			 		<ui:i18n key="图标"/><ui:i18n key="名称"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input  value="lack" type="text" id="menuIcon" style="width: 240px;" disabled="disabled" >
					  			 	 </div>
					  			 </div>
					  			 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="save();">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="javascript:clearOption();">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	
	
		<div class="bpopup2" id="modifyPagePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="修改"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" onclick="javascript:closePopup();"/>
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="一级菜单"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<select class="select2" style="width: 130px;" id="firstLevelMenuUpd" name="firstLevelMenuUpd">
			       		 					<c:forEach var="list"  items="${parentMenuList }" > 
											      <option value="${list.MENU_ID }">${list.MENU_NM }</option>
											</c:forEach> 
			       		 				</select>
			       		 				&nbsp;
			       		 				<input type="text" id="firstLevelMenuNameUpd" placeholder="" style="width: 100px">
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="二级菜单"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<select class="select2" style="width: 130px;" id="secondLevelMenuUpd" name="secondLevelMenuUpd">
			       		 				</select>
			       		 				&nbsp;
			       		 				<input type="text" id="secondLevelMenuNameUpd" placeholder="" style="width: 100px">
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="三级菜单"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<select class="select2" style="width: 130px;" id="thirdLevelMenuUpd" name="thirdLevelMenuUpd">
			       		 				</select>
			       		 				&nbsp;
			       		 				<input type="text" id="thirdLevelMenuNameUpd" placeholder="" style="width: 100px">
					  			 	 </div>
					  			 </div>
					  			  <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="页面链接"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input  value="" type="text" id="menuUrlUpd" style="width: 240px" />
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label"  style="width: 80px">
					  			 		<ui:i18n key="图标"/></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
<!-- 					  			 	 	<input type="file" id="logo_input" name="logo_input" style="position: absolute; width: 90px; height: 80px; z-index: 12; filter: alpha(opacity:0); opacity: 0; cursor: pointer;"  /> -->
					  			 	 	<div id="previewUpd" class="upload-goods-img-div">
										</div>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label"  style="width: 80px">
					  			 		<ui:i18n key="图标"/><ui:i18n key="名称"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input  value="lack" type="text" id="menuIconUpd" style="width: 240px;" disabled="disabled"/>
					  			 	 </div>
					  			 </div>
					  			 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="modify();">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="closePopup()">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
					  	<input type="hidden" id="firstLevelMenuUpdOld">
					  	<input type="hidden" id="secondLevelMenuUpdOld">
					  	<input type="hidden" id="thirdLevelMenuUpdOld">
					  	<input type="hidden" id="menuLevel">
					  	<input  type="hidden" id="menuId"   />
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->

	
</body>
</html>