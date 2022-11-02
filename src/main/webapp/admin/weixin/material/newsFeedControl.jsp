<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title>  
<style type="text/css">
 .result-grid-table{
 	font-size:12px;
 	color:#5f5f5f;
 }
 .gray{
 	color:#a2a2a2;
 }
 .update-name input{
 	width:200px;
 	margin-top:-4px;
 }
 .result-grid .result-grid-table .result-grid-tbody td {
 	padding:0;
 	height:40px;
 	vertical-align: middle;
 	line-height: 40px;
 }
 .container{
 	width:100%;
 }
</style> 
 
<script type="text/javascript">
$(function(){

	$('.right-title-div').click(function(){
		var text = $('.btn-icon-delete').text();
		if(text == '<ui:i18n key="删除"/>'){
			return;
		}
		var htm = '<tr>'+
						'<td></td>'+
						'<td class="update-name"><input type="text" value="" id="bgName" onblur="saveClassify(this.value)"/></td>'+
						'<td>'+
							'<span class="gridbutton red btn-icon-delete"><ui:i18n key="删除"/></span>'+
						'</td>'+
					'</tr>';
		$('#resultGridBody').prepend(htm);
		$('.btn-icon-delete').click(function(){
			$('#resultGridBody').find('tr')[0].remove();
		});
	});
	$('.btn-icon-cancel').click(function(){
		var item = $(this).data('item');
		var cdid = $(this).data('cdid');
		var bgName = $(this).data('bgname');
		$('.update-name' + cdid).html('<span title="'+bgName+'">'+bgName+'</span>');
		$(this).parent().find('.btn-icon').show();
		$(this).parent().find('.btn-icon-cancel').hide();
	});
	$('.btn-icon').click(function(){
		var item = $(this).data('item');
		var cdid = $(this).data('cdid');
		if(item == '1'){
			var bgName = $(this).data('bgname');
			$('.update-name' + cdid).html('<input type="text" value="'+ bgName +'" id="bgName'+cdid+'" onblur="updateClassify(this.value,'+cdid+',\''+bgName+'\')"/>');
			$('#bgName' + cdid).focus();
			$(this).parent().find('.btn-icon').hide();
			$(this).parent().find('.btn-icon-cancel').show();
		}else if(item=="3"){
			if(confirm('<ui:i18n key="您确定停用该图文类型吗"/>？')){
				$.ajax({
					data : {
						isDelete : 1,
						jobType:'D',
						cdId:cdid
					},
					type : 'POST',
					url : '/admin/weixin/material/saveNewsFeedControl.htm',
					success : function(data) {
						if (data.OUT_ERR_MSG=='S') {
							alert('<ui:i18n key="操作成功"/>');
							parent.window.reloadMethod('');
							window.location.href='/admin/weixin/material/newsFeedControl.htm';
						} else {
							alert(data.OUT_ERR_MSG);
						}
					},
					error : function(xhr, status, e) {
						alert('error: ' + status);
					}
				});
			}
		}else if(item=='2'){
			if(confirm('<ui:i18n key="您确定启用该图文类型吗"/>？')){
				$.ajax({
					data : {
						isDelete : 0,
						jobType:'D',
						cdId:cdid
					},
					type : 'POST',
					url : '/admin/weixin/material/saveNewsFeedControl.htm',
					success : function(data) {
						if (data.OUT_ERR_MSG=='S') {
							alert('<ui:i18n key="操作成功"/>');
							parent.window.reloadMethod(''); 
							window.location.href='/admin/weixin/material/newsFeedControl.htm';
						} else {
							alert(data.OUT_ERR_MSG);
						}
					},
					error : function(xhr, status, e) {
						alert('error: ' + status);
					}
				});
			}
		}
		
	});
	
	
	
});
function updateClassify(value,cdid,bgName){
	if(value != bgName){
		$.ajax({
			data : {
				cdVal : value,
				jobType:'U',
				cdId : cdid
			},
			type : 'POST',
			url : '/admin/weixin/material/saveNewsFeedControl.htm',
			success : function(data) {
				if (data.OUT_ERR_MSG=='S') {
					alert('<ui:i18n key="操作成功"/>');
					parent.window.reloadMethod(bgName); 
					window.location.href='/admin/weixin/material/newsFeedControl.htm';
				} else {
					alert(data.OUT_ERR_MSG);
				}
			},
			error : function(xhr, status, e) {
				alert('error: ' + status);
			}
		});
	}
	$('.update-name'+cdid).html('<span title="' + value + '">' + value + '</span>');
	$('.update-name'+cdid).next().find('.btn-icon').show();
	$('.update-name'+cdid).next().find('.btn-icon-cancel').hide();
}
function saveClassify(bgName){
	if(bgName == ''){
		return;
	}
	$.ajax({
		data : {
			cdVal : bgName
			,isDelete : 0
			,jobType : 'I'
		},
		type : 'POST',
		url : '/admin/weixin/material/saveNewsFeedControl.htm',
		success : function(data) {
			if (data.OUT_ERR_MSG=='S') {
				alert('<ui:i18n key="添加成功"/>');
				parent.window.reloadMethod(bgName); 
				window.location.href='/admin/weixin/material/newsFeedControl.htm';
			} else {
				alert(data.OUT_ERR_MSG);
			}
		},
		error : function(xhr, status, e) {
			alert('error: ' + status);
		}
	});
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="result-grid" style="margin-top: 50px;height: 351px">
	      	<div class="result-grid-header" style="margin-right: 10px">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool right-title-div" >
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content" style="width: 94%;margin-left: 3%;height: 50px">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="21%" />
		      		 			<col width="50%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="图文类型代码"/></th>
			      		 		<th><ui:i18n key="图文类型名称"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      	</table>
				</div>
			</div>
			<div class="js-grid-content fixed" style="width: 94%;margin-left: 3%;height: 301px;overflow: auto;">
 				<div class="result-data-warp">
 					<table class="result-grid-table">
			      		<colgroup>
	      		 			<col width="21%" />
	      		 			<col width="50%" />
	      		 			<col/>
	      		 		</colgroup>
			      		 <tbody  class="result-grid-tbody" id="resultGridBody" >
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<c:if test="${list.CD_ID !=1 and list.CD_ID !=2}">
									<tr>
										<td>${list.CD_ID }</td>
										<td class="update-name update-name${list.CD_ID }" ><span title="${list.CD_VAL }">${list.CD_VAL }</span></td>
										<td>
							           		<span class="gridbutton red btn-icon"  data-item="1" data-cdid="${list.CD_ID }" data-bgname="${list.CD_VAL }"><ui:i18n key="编辑"/></span>
					           				<c:if test="${list.IS_DELETE=='1'}">
												<span class="gridbutton green btn-icon"  data-item="2" data-cdid="${list.CD_ID }"><ui:i18n key="启用"/></span>
											</c:if>
											<c:if test="${list.IS_DELETE=='0'}">
												<span class="gridbutton red btn-icon"  data-item="3" data-cdid="${list.CD_ID }"><ui:i18n key="停用"/></span>
											</c:if>	
											<span class="gridbutton red btn-icon-cancel"  style="display:none;" data-cdid="${list.CD_ID }" data-bgname="${list.CD_VAL }"><ui:i18n key="取消"/></span>
										</td>
									</tr>
								</c:if>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
	     	</div>
	      </div>
	</div>
	<!-- ▲ container  -->
</body>
</html>