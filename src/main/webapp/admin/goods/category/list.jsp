<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="商品分类"/></title>
<script type="text/javascript">
$(function(){
	var searchType = '${requestScope.searchType}';
	var items = $('input[name="isType"]');
	
	$.each(items, function(i, n){
		
		if($(this).val() == searchType){
			
			$(this).attr('checked','checked');
		}
	});
});

function popupPage(oneId,twoId,shopGoodsType,pageType){
	if(pageType == 'create'){
		var $th2 = $('.js-bpopup-inner', $('#createGoodsClass'));
		$th2.load('/admin/goods/category/listNewPopup.htm' , {} ,  function(){
			$('.select2', $th2).select2({
				 minimumResultsForSearch:5
				 ,allowClear: true 
			 });	
			
			$('.js-save',$th2).click(function(){
				var oneSelectId = $('#oneSelect', $th2).val();
				var oneSelectNm = '';
				var twoSelectId = $('#twoSelect', $th2).val();
				var twoSelectNm = '';
				var typeSelectId = $('#typeSelect', $th2).val();
				
				if (oneSelectId == '') {
					
					oneSelectNm = $.trim($('#oneText', $th2).val());
				} else {
					
					oneSelectNm = $('#oneSelect', $th2).find('option:selected').text();
				}
				if (twoSelectId == '') {
					
					twoSelectNm = $.trim($('#twoText', $th2).val());
				} else {
					
					twoSelectNm = $('#twoSelect', $th2).find('option:selected').text();
				}

				if (oneSelectNm == '') {
					
					alert('<ui:i18n key="请选择或填写第一级分类"/>.');
					return;
				}
				
				if (typeSelectId == '') {
					
					alert('<ui:i18n key="请选择区分"/>');
					return;
				}

				var params = {
					shopGoodsOneId : oneSelectId,
					shopGoodsOneNm : $.trim(oneSelectNm),
					shopGoodsTwoId : twoSelectId,
					shopGoodsTwoNm : $.trim(twoSelectNm),
					shopGoodsType : typeSelectId
				};
				if (params.shopGoodsTwoNm == '') {
					
					if (oneSelectId == '') {
						
						$.ajax({
							data : params,
							url : '/admin/goods/category/oneSelectCheck.htm',
							success : function(data){
								
								var items = data.oneSelectCheck;
								var recount = items.length;
								
								if (recount > 0) {
									
									alert('<ui:i18n key="一级分类已存在"/>');
									return;
								} else {
									
									$.ajax({
										data : params,
										url : '/admin/goods/category/save.htm',
										success : function(data){
											
											if (data.result == 'SUCCESS') {
												
												alert('<ui:i18n key="添加成功"/>.');
												var pageCurr = Number($('#currentPage').find('option:selected').val());
												var pageUnit = Number($('#pageUnit').find('option:selected').val());
												showPage(pageCurr,pageUnit);
												$('.b-close').click();
											} else {
												
												alert('<ui:i18n key="请重新打开该页面添加"/>.');
											}
										},
										error : function(a, msg, c){
											
											alert('error: ' + msg);
										}
									});
								}
							},
							error : function(a, msg, c) {
								
								alert('error: ' + msg);
							}
						});
						
					} else {
						
						alert('<ui:i18n key="一级分类已存在"/>.');
						return;
					}
					
				} else {
					if (oneSelectId == '') {
						var param={
								shopGoodsOneId : oneSelectId,
								shopGoodsOneNm : $.trim(oneSelectNm),
								shopGoodsTwoId : 0,
								shopGoodsTwoNm : $.trim(twoSelectNm),
								shopGoodsType : typeSelectId	
							};
						$.ajax({
							data : param,
							url : '/admin/goods/category/oneSelectModifyCheck2.htm',
							success : function(data){
								
								var items = data.oneSelectModifyCheck2;
								var recount = items.length;
								
								if (recount > 0) {
									
									alert('<ui:i18n key="二级分类已存在"/>');
									return;
								} else {
			
									$.ajax({
										data : params,
										url : '/admin/goods/category/save.htm',
										success : function(data){
											
											if (data.result == 'SUCCESS') {
												
												alert('<ui:i18n key="添加成功"/>.');
												var pageCurr = Number($('#currentPage').find('option:selected').val());
												var pageUnit = Number($('#pageUnit').find('option:selected').val());
												showPage(pageCurr,pageUnit);
												$('.b-close').click();
											} else {
												
												alert('<ui:i18n key="请检查信息"/>,'+'<ui:i18n key="重新点击添加"/>.');
											}
										},
										error : function(a, msg, c){
											
											alert('error: ' + msg);
										}
									});
								}
							},
							error : function(a, msg, c){
								
								alert('error: ' + msg);
							}
						});
					} else {
						var flag = 0;
// 						if (oneSelectId == '') {
							var param={
									shopGoodsOneId : oneSelectId,
									shopGoodsOneNm : $.trim(oneSelectNm),
									shopGoodsTwoId : 0,
									shopGoodsTwoNm : $.trim(twoSelectNm),
									shopGoodsType : typeSelectId	
								};
							$.ajax({
								data : param,
								url : '/admin/goods/category/oneSelectModifyCheck2.htm',
								async : false,
								success : function(data){
									
									var items = data.oneSelectModifyCheck2;
									var recount = items.length;
									
									if (recount > 0) {
										flag = 1;
										alert('<ui:i18n key="二级分类已存在"/>');
										return;
									} 
								},
								error : function(a, msg, c){
									
									alert('error: ' + msg);
								}
							});
// 						}
						if(flag == 0){
							$.ajax({
								data : params,
								url : '/admin/goods/category/save.htm',
								async : false,
								success : function(data){
									
									if (data.result == 'SUCCESS') {
										
										alert('<ui:i18n key="添加成功"/>.');
										var pageCurr = Number($('#currentPage').find('option:selected').val());
										var pageUnit = Number($('#pageUnit').find('option:selected').val());
										showPage(pageCurr,pageUnit);
										$('.b-close').click();
									} else {
										
										alert('<ui:i18n key="请检查信息"/>,'+'<ui:i18n key="重新点击添加"/>.');
									}
								},
								error : function(a, msg, c){
									
									alert('error: ' + msg);
								}
							});
						}
						
					}
				}
			});
			
			//关闭
			$('.js-cancel' ,$th2).click(function(){
				closeBpopupWindow('createGoodsClass');
			});
			
			$('#twoSelect' ,$th2).attr('disabled','disabled');
			
			$('#oneSelect' ,$th2).change(function(e){ 
				var val = $(this).val();
				var $combo = $('#twoSelect' ,$th2);
					$combo.select2('val','');
				 	$combo.html('<option value="" ></option>');//清空select内容  
				 	
				if (val == '') {
					$combo.prop('disabled', true);
					$('#oneText' ,$th2).val('');
					$('#oneText' ,$th2).removeAttr('readonly');
					$('#oneText' ,$th2).removeAttr('style');
					$('#twoText' ,$th2).removeAttr('readonly');
				} else {
					
					$('#oneText' ,$th2).val('');
					$('#oneText' ,$th2).attr('readonly','readonly');
					$('#oneText' ,$th2).css('background-color','#f4f4f4');
					$combo.prop('disabled', false);
					
					$.ajax({
		       	 		data:{shopGoodsOneId: val},
		       	 		url : '/admin/goods/category/twoSelectList.htm',
						success : function(data) {
							
							 var list = data.twoSelectList;
							
							 if (!!list.length) {
								 
							 	 for(var i = 0 ; i < list.length ; i++){
							 	 	$combo.append('<option value="' + list[i].shopGoodsTwoId + '">' + list[i].shopGoodsTwoNm + '</option>');
							 	 }
							 	 
								$combo.select2('open'); 
							 } else {
								 
							 } 
						},
						error : function(xhr, status, e) {
							
							alert('error: ' + status);
						}
		 			});
				}
			});
			
			$('#twoSelect' ,$th2).change(function(e){
				var twoSelectId = $('#twoSelect').val();			
				if (twoSelectId == '') {			
					$('#twoText').val('');
					$('#twoText').removeAttr('readonly');
					$('#twoText').removeAttr('style');
				} else {				
					$('#twoText').val('');
					$('#twoText').attr('readonly','readonly');
					$('#twoText').css('background-color','#f4f4f4');
				}
			});
			
			showBpopup({
	 			id : 'createGoodsClass',
	 			width : 550,
	 			top:20 
	 		});
		});
	} else{
		var oneIdOld = '';
		var twoIdOld = '';
		
		var $th2 = $('.js-bpopup-inner', $('#modifyGoodsClass'));
		$th2.load('/admin/goods/category/listModifyPopup.htm' , {shopGoodsOneId : oneId ,shopGoodsTwoId : twoId ,shopGoodsType : shopGoodsType} ,  function(){
			if(twoId == ''){
				$('#twoSelect').children().remove();
				$('#twoSelect').append('<option value=""></option>');
			}else{
				$('#oneText').attr('disabled','disabled');
			}
			$('#oneSelect').attr('disabled','disabled');
			$('.select2', $th2).select2({
				 minimumResultsForSearch:5
				 ,allowClear: true 
			 });	
			$('.js-save',$th2).click(function(){
				oneIdOld = $('#oneIdOld' ,$th2).val();
				twoIdOld = $('#twoIdOld' ,$th2).val();
				var oneSelectId = $('#oneSelect',$th2).val();
				var oneText = $.trim($('#oneText',$th2).val());
				var oneSelectNm = '';
				var twoSelectId = $('#twoSelect',$th2).val();
				var twoText = $.trim($('#twoText',$th2).val());
				var twoSelectNm = '';
				var typeSelectId = $('#typeSelect',$th2).val();
				var operation = 'edit';
				
				if (oneText != '') {
					
					oneSelectNm = $('#oneText',$th2).val();
				} else {
					
					oneSelectNm = $('#oneSelect',$th2).find('option:selected').text();
				}
				
				if (twoText != '') {
					
					twoSelectNm = $('#twoText',$th2).val();
				} else {
					
					//twoSelectNm = $('#twoSelect',$th2).find('option:selected').text();
				}
				
				
				if(twoId == ''){
					if(twoSelectNm == ''){
						if (oneSelectNm == '') {
							
							alert('<ui:i18n key="请填写第一级分类"/>.');
							return;
						}
					}
				}else{
					if (twoSelectNm == '') {
						
						alert('<ui:i18n key="请填写第二级分类"/>.');
						return;
					}
				}
				if (typeSelectId == '') {
					
					alert('<ui:i18n key="请选择区分"/>.');
					return;
				}
				
				var params = {
					shopGoodsOneOldId : oneIdOld,
					shopGoodsTwoOldId : twoIdOld,
					shopGoodsOneId : oneSelectId,
					shopGoodsOneNm : $.trim(oneSelectNm),
					shopGoodsTwoId : twoSelectId,
					shopGoodsTwoNm : $.trim(twoSelectNm),
					shopGoodsType : typeSelectId,
					operation : operation
				};
				if(twoId == ''){
					if(params.shopGoodsTwoNm != ''){
						var param = {
								shopGoodsOneOldId : oneIdOld,
								shopGoodsTwoOldId : twoIdOld,
								shopGoodsOneId : oneSelectId,
								shopGoodsOneNm : $.trim(oneSelectNm),
								shopGoodsTwoId : 0,
								shopGoodsTwoNm : $.trim(twoSelectNm),
								shopGoodsType : typeSelectId,
								operation : operation
							};
						$.ajax({
							data : param,
							url : '/admin/goods/category/oneSelectModifyCheck2.htm',
							success : function(data){
								
								var items = data.oneSelectModifyCheck2;
								var recount = items.length;
								
								if (recount > 0) {
									
									alert('<ui:i18n key="二级分类已存在"/>');
									return;
								}
							},
							error : function(a, msg, c){
								
								alert('error: ' + msg);
							}
						});
					}
					$.ajax({
						data : params,
						url : '/admin/goods/category/oneSelectModifyCheck.htm',
						success : function(data){
							
							var items = data.oneSelectModifyCheck;
							var recount = items.length;
							
							if(recount > 0){
								
								alert('<ui:i18n key="一级分类已存在"/>.');
								return;
							} else {

								$.ajax({
									data : params,
									url : '/admin/goods/category/modify.htm',
									success : function(data){
										
										if (data.result == 'SUCCESS'){
											if(params.shopGoodsTwoNm == ''){
											 alert('<ui:i18n key="保存成功"/>.');
											 var pageCurr = Number($('#currentPage').find('option:selected').val());
											 var pageUnit = Number($('#pageUnit').find('option:selected').val());
											 showPage(pageCurr,pageUnit);
											 $('.b-close').click();
											}
										} else {
											
											alert('<ui:i18n key="请重新打开该页面添加"/>.');
											return false;
										}
									},
									error : function(a, msg, c){
										
										alert('error: ' + msg);
									}
								});
							}
						},
						error : function(a, msg, c){
							
							alert('error: ' + msg);
						}
					});
					if(params.shopGoodsTwoNm != ''){
						var param = {
								shopGoodsOneOldId : oneIdOld,
								shopGoodsTwoOldId : twoIdOld,
								shopGoodsOneId : oneSelectId,
								shopGoodsOneNm : $.trim(oneSelectNm),
								shopGoodsTwoId : 0,
								shopGoodsTwoNm : $.trim(twoSelectNm),
								shopGoodsType : typeSelectId,
								operation : operation
							};
						$.ajax({
							data : param,
							url : '/admin/goods/category/oneSelectModifyCheck2.htm',
							success : function(data){
								
								var items = data.oneSelectModifyCheck2;
								var recount = items.length;
								
								if (recount > 0) {
									
									//alert('<ui:i18n key="二级分类已存在"/>');
									return;
								} else { 
			
									$.ajax({
										data : params,
										url : '/admin/goods/category/save.htm',
										success : function(data){
											
											if (data.result == 'SUCCESS') {
												
												alert('<ui:i18n key="添加成功"/>.');
												var pageCurr = Number($('#currentPage').find('option:selected').val());
												var pageUnit = Number($('#pageUnit').find('option:selected').val());
												showPage(pageCurr,pageUnit);
												$('.b-close').click();
											} else {
												
												alert('<ui:i18n key="请检查信息"/>,'+'<ui:i18n key="重新点击添加"/>.');
											}
										},
										error : function(a, msg, c){
											
											alert('error: ' + msg);
										}
									});
								}
							},
							error : function(a, msg, c){
								
								alert('error: ' + msg);
							}
						});
					}
					
				} else {

					$.ajax({
						data : params,
						url : '/admin/goods/category/oneSelectModifyCheck2.htm',
						success : function(data){
							
							var items = data.oneSelectModifyCheck2;
							var recount = items.length;

							if(recount > 0){
								
								alert('<ui:i18n key="二级分类已存在"/>.');
								return;
							} else {

								$.ajax({
									data : params,
									url : '/admin/goods/category/modify.htm',
									success : function(data){
										
										if (data.result == 'SUCCESS'){
											
											alert('<ui:i18n key="保存成功"/>.');
											var pageCurr = Number($('#currentPage').find('option:selected').val());
											var pageUnit = Number($('#pageUnit').find('option:selected').val());
											showPage(pageCurr,pageUnit);
											$('.b-close').click();
										} else if (data.result == 'FAIL'){
											
											alert('<ui:i18n key="请检查信息"/>,'+'<ui:i18n key="重新点击编辑"/>.');
										}
									},
									error : function(a, msg, c){
										
										alert('error: ' + msg);
									}
								});
							}
						},
						error : function(a, msg, c){
							
							alert('error: ' + msg);
						}
					});
				}
			});
			
			//关闭
			$('.js-cancel' ,$th2).click(function(){
				closeBpopupWindow('modifyGoodsClass');
			});
			
			$('#twoSelect' ,$th2).attr('disabled','disabled');
			
			$('#oneSelect' ,$th2).change(function(e){ 
				var oneSelectId = $('#oneSelect' ,$th2).val();
				oneIdOld = $('#oneIdOld' ,$th2).val();
				if (oneSelectId == oneIdOld) {
					
					$('#oneText',$th2).val('');
					$('#oneText',$th2).removeAttr('readonly');
					$('#oneText',$th2).removeAttr('style');
				} else {
					
					$('#oneText',$th2).val('');
					$('#oneText',$th2).attr('readonly','readonly');
					$('#oneText',$th2).css('background-color','#f4f4f4');
				}
			});
			
			$('#twoSelect' ,$th2).change(function(e){
				var twoSelectId = $('#twoSelect',$th2).val();
				twoIdOld = $('#twoIdOld',$th2).val();
				if (twoSelectId == twoIdOld) {
					
					$('#twoText',$th2).val('');
					$('#twoText',$th2).removeAttr('readonly');
					$('#twoText',$th2).removeAttr('style');
				} else {
					
					$('#twoText',$th2).val('');
					$('#twoText',$th2).attr('readonly','readonly');
					$('#twoText',$th2).css('background-color','#f4f4f4');
				}
			});
			
			showBpopup({
	 			id : 'modifyGoodsClass',
	 			width : 550,
	 			top:20 
	 		});
		});
	}

}
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var searchType = $('input[name="isType"]:checked').val();
	var params = {
			searchType : searchType
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/goods/category/listFragment.htm';
	 
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
//后台箭头排序
function menuSort(oneId, twoId, option){
	
	if (oneId == '') {
		
		alert('<ui:i18n key="请重新打开此页面"/>.');
		return;
	}
	$.ajax({
		data : {shopGoodsOneId : oneId, shopGoodsTwoId : twoId, option : option},
		url : '/admin/goods/category/ajaxMenuSort.htm',
		success : function(data) {
			
			if (data.result == 'SUCCESS') {
				
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
			} else {
			}
		},
		error : function(obj, e, msg) {
			
			alert('<ui:i18n key="网络出现故障"/>.');
		}
	});
}
//状态编辑
function dataEdit(oneId, twoId, edit){
	var msg = '';
	if(edit == 'start'){
		msg = '<ui:i18n key="您确定启用该分类吗"/>?';
	}else{
		msg = '<ui:i18n key="您确定停用该分类吗"/>?';
	}
	if(!confirm(msg)){
		return;
	}
	var operation = 'pic';
	
	if(oneId == '' || edit =='') {
		
		alert('<ui:i18n key="请重新点击按钮"/>');
		return;
	}

	var params = {
		shopGoodsOneId : oneId,
		shopGoodsTwoId : twoId,
		operation : operation,
		edit : edit
	};

	$.ajax({
		data : params,
		url : '/admin/goods/category/modify.htm',
		success : function(data){
			
			if (data.result == 'SUCCESS'){
				
				alert('<ui:i18n key="保存成功"/>.');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
			} else {
				
				alert('<ui:i18n key="请重新打开该页面编辑"/>.');
			}
		},
		error : function(a, msg, c){
			
			alert('error: ' + msg);
		}
	});
}
//删除
function gcDelete(oneId, twoId){
	
	if (oneId == '') {
		
		alert('<ui:i18n key="请重新打开此页面"/>.');
		return;
	}
	if (confirm('<ui:i18n key="您确定需要删除吗"/>?')) {
		
		$.ajax({
			data : {shopGoodsOneId : oneId, shopGoodsTwoId : twoId},
			url : '/admin/goods/category/ajaxGcDelete.htm',
			success : function(data) {
				
				if (data.result == 'SUCCESS') {
					
					alert('<ui:i18n key="删除成功"/>.');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				} else {
					
					alert('<ui:i18n key="请重新加载页面"/>.');
				}
			},
			error : function(obj, e, msg) {
				
				alert('<ui:i18n key="网络出现故障"/>.');
			}
		});
	}
}
</script>
</head>
<body>
<div class="container">
	<!-- ▼ 查询表单区域  --> 
    <div class="query-from">
    		<div class="form-table" >
    		 	<table class="ftable">
    		 		<colgroup>
    		 			<col width="15%" />
    		 			<col width="65%" />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 		</colgroup>
    		 		<tr>
    		 			<td class="flabel"><ui:i18n key="商品类型"/>：</td>
    		 			<td class="fcomp">
	     		 			<input class="icradio" type="radio" value="A" name="isType" checked="checked">&nbsp;&nbsp;<ui:i18n key="显示全部分类"/>
       		 				&nbsp;&nbsp;&nbsp;
       		 				<input class="icradio" type="radio" value="O" name="isType">&nbsp;&nbsp;<ui:i18n key="只显示一级分类"/>
    		 			</td>
    		 			<td class="flabel"></td>
    		 			<td class="fcomp">
    		 			</td>
    		 		</tr>
    		 	</table>
    		</div>
    		
    		<div class="butttn-area m1" onclick="javascript:searchData();">
    		   <span class="button">
    		   	  <span class="button-icon search"></span>
    		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
    		   </span>
    		</div>
   	</div>
	<!-- ▲ 查询表单区域  -->
	<!-- ▼ 查询结果区域  --> 
	<div class="result-grid sortable" style="margin-top: 50px;">
      	<div class="result-grid-header">
  				<div class="result-grid-tools">
  				   	<span class="result-grid-tool" onclick="javascript:popupPage('','','','create');">
     		   	 	 	<img alt="" src="/admin/images/goods/plus.png"/>
				  	 	<span class="tool-name"><ui:i18n key="新建"/></span> 
     		   		</span>
  				</div>
  			</div>
  			<div class="js-grid-content">
   			<div class="result-data-warp">
   				<table class="result-grid-table">
		      		 <colgroup>
			      		<col width="90px"  />
      		 			<col width="100px" />
      		 			<col width="180px" />
      		 			<col width="1px" />
      		 			<col width="20px" />
      		 			<col width="20px" />
      		 			<col width="10px" />
      		 			<col width="200px" />
      		 			<col width="100px" />
      		 			<col width="189px" />
		      		</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th colspan="3"><ui:i18n key="一级菜单"/></th>
		      		 		<th  colspan="5"><ui:i18n key="二级菜单"/></th>
		      		 		<th><ui:i18n key="区分"/></th>
		      		 		<th><ui:i18n key="操作"/></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody">
			      		 <c:forEach items="${requestScope.oneList}" var="itemsOne" varStatus="status">
				      		<tr>
			      		 		<td colspan="10">
			      		 			<table>
				      		 			<colgroup>
								      		<col width="90px"  />
					      		 			<col width="100px" />
					      		 			<col width="180px" />
					      		 			<col width="1px" />
					      		 			<col width="20px" />
					      		 			<col width="20px" />
					      		 			<col width="10px" />
					      		 			<col width="200px" />
					      		 			<col width="100px" />
					      		 			<col width="189px" />
							      		</colgroup>
			      		 				<tr>
			      		 					<td>
						      		 			<div class="arrow-warp">
							      		 			<c:choose>
						      		 					<c:when test="${status.first}">
						      		 						<div class="arrow-up gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-up"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','','UP');"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 				<c:choose>
						      		 					<c:when test="${status.last}">
						      		 						<div class="arrow-down gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-down"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','','DOWN');"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 			</div>
					      		 			</div>
						      		 		</td>
						      		 		<td>${itemsOne.shopGoodsOneNm}</td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="grid-line" </c:if>></td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="level-two-first" </c:if>></td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="grid-line" </c:if>></td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="grid-line" </c:if>></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td>${itemsOne.shopGoodsTypeNm}</td>
						      		 		<td>
						      		 			<c:choose>
													<c:when test="${itemsOne.display eq 'ReStop'}" >
						      		 					<span class="gridbutton red" onclick="javascript:popupPage('${itemsOne.shopGoodsOneId}','','${itemsOne.shopGoodsType}','modify');"><ui:i18n key="编辑"/></span>
						      		 				</c:when>
						      		 				<c:otherwise>
						      		 					<span class="gridbutton red" onclick="alert('<ui:i18n key="无法编辑停用的分类"/>');"><ui:i18n key="编辑"/></span>
						      		 				</c:otherwise>
						      		 			</c:choose>
						      		 			<span class="gridbutton red" onclick="javascript:gcDelete('${itemsOne.shopGoodsOneId}','');"><ui:i18n key="删除"/></span>
						      		 			<c:choose>
													<c:when test="${itemsOne.display eq 'ReStop'}">
														<span class="gridbutton red" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','','restop');">
															<ui:i18n key="停用"/>
														</span>
													</c:when>
													<c:when test="${itemsOne.display eq 'Stop'}">
														<span class="gridbutton red"></span>
													</c:when>
													<c:otherwise>
														<span class="gridbutton green" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','','start');">
															<ui:i18n key="启用"/>
														</span>
													</c:otherwise>
												</c:choose>
						      		 		</td>
			      		 				</tr>
			      		 				<c:forEach items="${itemsOne.subList}" var="itemsTwo" varStatus="status">
				      		 				<c:choose>
				      		 					<c:when test="${status.index!=(itemsOne.listLength-1)}">
						      		 				<tr>
						      		 					<td></td>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td class="level-two-normal"></td>
									      		 		<td class="grid-line"></td>
									      		 		<td>
									      		 			<div class="arrow-warp">
																<c:choose>
									      		 					<c:when test="${status.index==0}">
									      		 						<div class="arrow-up gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-up"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','UP');"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 				<c:choose>
									      		 					<c:when test="${status.index==(itemsOne.listLength-1)}">
									      		 						<div class="arrow-down gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-down"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','DOWN');"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 			</div>
									      		 		</td>
									      		 		<td></td>
									      		 		<td class="text-left">${itemsTwo.shopGoodsTwoNm}</td>
									      		 		<td>${itemsTwo.shopGoodsTypeNm}</td>
									      		 		<td>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:popupPage('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','${itemsTwo.shopGoodsType}','modify');"><ui:i18n key="编辑"/></span>
																</c:when>
																<c:when test="${itemsOne.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton red" onclick="alert('<ui:i18n key="无法编辑停用的分类"/>');"><ui:i18n key="编辑"/></span>
																</c:otherwise>
															</c:choose>
															<span class="gridbutton red" onclick="javascript:gcDelete('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}');"><ui:i18n key="删除"/></span>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','restop');"><ui:i18n key="停用"/></span>
																</c:when>
																<c:when test="${itemsTwo.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton green"  onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','start');"><ui:i18n key="启用"/></span>
																</c:otherwise>
															</c:choose>
									      		 		</td>
						      		 				</tr>
						      		 			</c:when>
						      		 			<c:otherwise>
						      		 				<tr class="level-one-last">
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td class="level-two-last"></td>
									      		 		<td class="grid-line"></td>
									      		 		<td>
									      		 			<div class="arrow-warp">
									      		 				<div class="arrow-up" onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','UP');"></div>
									      		 				<div class="arrow-down gray"></div>
									      		 			</div>
									      		 		</td>
									      		 		<td></td>
									      		 		<td class="text-left">${itemsTwo.shopGoodsTwoNm}</td>
									      		 		<td>${itemsTwo.shopGoodsTypeNm}</td>
									      		 		<td>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:popupPage('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','${itemsTwo.shopGoodsType}','modify');"><ui:i18n key="编辑"/></span>
																</c:when>
																<c:when test="${itemsOne.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton red" onclick="alert('<ui:i18n key="无法编辑停用的分类"/>');"><ui:i18n key="编辑"/></span>
																</c:otherwise>
															</c:choose>
															<span class="gridbutton red" onclick="javascript:gcDelete('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}');"><ui:i18n key="删除"/></span>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','restop');"><ui:i18n key="停用"/></span>
																</c:when>
																<c:when test="${itemsTwo.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton green"  onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','start');"><ui:i18n key="启用"/></span>
																</c:otherwise>
															</c:choose>
									      		 		</td>
									      		 	</tr>
						      		 			</c:otherwise>
						      		 		</c:choose>
			      		 				</c:forEach>
			      		 			</table>
			      		 		</td>
			      		 	</tr>
			      		 </c:forEach>
		      		 </tbody>
		      	</table>
   			</div>
   			<ui:paging page="${page }" />
   		</div>
   	</div>
	<!-- ▲ 查询结果区域  -->
</div>
<!-- ▼ bpopup area -->
<div class="bpopup2" id="createGoodsClass">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="商品分类"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!--  -->
	 		 	    
	 		 	    
	 		 	    <!--  -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	
	<div class="bpopup2" id="modifyGoodsClass">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="商品分类"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!--  -->
	 		 	    
	 		 	    
	 		 	    <!--  -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
<!-- ▲ bpopup area -->
</body>
</html>