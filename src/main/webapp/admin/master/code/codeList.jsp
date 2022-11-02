<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="系统代码管理"/></title>  
<style type="text/css">
	.limit-span{
 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;
 	margin-left:0;
 	text-align: center;
 	width:100%;
 }
</style>
<script type="text/javascript">
$(function(){
	$('.js-add-page').click(function(){
		$('#tbNm_cr').attr('readonly', false);
 		$('#tbNm_cr').css("background-color","#fff");
 		$('#fdNm_cr').attr('readonly', false);
 		$('#fdNm_cr').css("background-color","#fff");
 		$('#cdVal_cr').attr('readonly', false);
 		$('#cdVal_cr').css("background-color","#fff");
		 showBpopup({
			id : 'createCodePopup',
			width : 450 
		});	  	 
	});
});
function showUpdatePoupe(cdId,tbNm,fdNm,cdVal,cdDesc){
	if(tbNm!=''){
		$('#tbNm_cr').val(tbNm);
		$('#tbNm_cr').attr("readonly","readonly");
		$('#tbNm_cr').css("background-color","#f4f4f4");
	}else{
		$('#tbNm_cr').attr('readonly', false);
 		$('#tbNm_cr').css("background-color","#fff");
	}
	if(fdNm!=''){
		$('#fdNm_cr').val(tbNm);
		$('#fdNm_cr').attr("readonly","readonly");
		$('#fdNm_cr').css("background-color","#f4f4f4");
	}else{
		$('#fdNm_cr').attr('readonly', false);
 		$('#fdNm_cr').css("background-color","#fff");
	}
	if(cdVal!=''){
		$('#cdVal_cr').val(tbNm);
		$('#cdVal_cr').attr("readonly","readonly");
		$('#cdVal_cr').css("background-color","#f4f4f4");
	}else{
		$('#cdVal_cr').attr('readonly', false);
 		$('#cdVal_cr').css("background-color","#fff");
	}
	$('#tbNm_cr').val(tbNm);
	$('#fdNm_cr').val(fdNm);
	$('#cdVal_cr').val(cdVal);
	$('#desc_cr').val(cdDesc);
	$('#cdId').val(cdId);
	 showBpopup({
		id : 'createCodePopup',
		width : 450 
	});	  
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
 	if(${requestScope.user.userAuth != 'A' }){
		alert('<ui:i18n key="您没有操作权限"/>.');
		return;
	}
 	
	var fdNm= $('#allFdNm').val(); 
	var cdDesc= $('#cdDesc').val();
	var status = $('#status').val();
	var params = {
			fdNm : fdNm
			,cdDesc : cdDesc
			,status : status
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/master/code/codeListFragment.htm';
	 
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

function save(){
	var jobType='';
	var tbNm=$('#tbNm_cr').val();
	var fdNm=$('#fdNm_cr').val();
	var cdVal=$('#cdVal_cr').val();
	var cdDesc=$('#desc_cr').val();
	var cdId=$('#cdId').val();
	if(cdId!=''){
		jobType='U';
	}else{
		jobType='I';
	}
	if(tbNm==''){
		alert('<ui:i18n key="表名不能为空"/>');
		return;
	}
	if(fdNm==''){
		alert('<ui:i18n key="字段名不能为空"/>');
		return;
	}
	if(cdVal==''){
		alert('<ui:i18n key="字段值不能为空"/>');
		return;
	}
	var param={
			cdId:cdId,
			tbNm:tbNm,
			fdNm:fdNm,
			cdVal:cdVal,
			cdDesc:cdDesc,
			jobType:jobType
			};
	$.ajax({
		data:param,
		url : '/admin/master/code/save.htm', 
		success : function(data){
			if(data.result=='success'){
				alert('<ui:i18n key="保存成功"/>');	
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
			}else{
				alert('<ui:i18n key="保存失败"/>,<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	 });
}

//启用和停用
function startOrstop(cdId,isDelete,tbNm,fdNm){
	if(isDelete==0){
		var conf=window.confirm('<ui:i18n key="确定要停用本条信息吗"/>？');
		var isDelete=1;
	}else{
		var conf=window.confirm('<ui:i18n key="确定要启用本条信息吗"/>？');
		var isDelete=0;
	}
    if(conf == false) {
        return ;
        }
    else {
    var jobType='D';
	var params={
			tbNm:tbNm
			,fdNm:fdNm
			,isDelete:isDelete
			,jobType:jobType
			,cdId:cdId
			};
	$.ajax({
		data:params,
		url : '/admin/master/code/delete.htm',
		success : function(data){
			if(data.result=='success'){
				if(isDelete==1){
					alert('<ui:i18n key="停用成功"/>.');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
					$('.b-close').click();
				}
				if(isDelete==0){
					alert('<ui:i18n key="启用成功"/>.');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
					$('.b-close').click();
				}
			}else{
				if(isDelete==0){
					alert('<ui:i18n key="停用失败"/>.');
				}
				if(isDelete==1){
					alert('<ui:i18n key="启用失败"/>.');
				}
			}
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
    }
}

function clearInput(){
	$('#tbNm_cr').val('');
	$('#fdNm_cr').val('');
	$('#cdVal_cr').val('');
	$('#desc_cr').val('');
}
</script>
</head>
<body>
	<!-- ▼ header  --> 
   	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
	<!-- ▲  container-->
	<div class="contents clearfix">
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 40px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/pageManage/icon_code.png">
				<span class="title-name"><ui:i18n key="系统代码管理"/></span>
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
       		 			<col width="10%" />
       		 			<col width="25%" />
       		 			<col width="10%" />
       		 			<col width="25%" />
       		 			<col width="10%" />
       		 			<col width="20%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="字段名"/>：</td>
       		 			<td class="fcomp">
       		 				<select class="select2"  data-placeholder="<ui:i18n key='请选择'/>" id="allFdNm" style="width:225px; ">
								<option value=""></option>
								<c:forEach items="${allFdNm }" var="allFdNm">
									<option value="${allFdNm.FD_NM }">${allFdNm.FD_NM }</option>
								</c:forEach>				
							</select>
       		 			</td>
       		 			<td class="flabel">
       		 				<ui:i18n key="字段描述"/>：
       		 			</td>
       		 			<td class="fcomp">
       		 				<input type="text" value="${requestScope.cdDesc }" id="cdDesc"/>
       		 			</td>
       		 			<td class="flabel">
       		 				<ui:i18n key="状态"/>：
       		 			</td>
       		 			<td class="fcomp">
       		 				<select class="select2"  data-placeholder="<ui:i18n key='请选择'/>" id="status" style="width:160px; ">
								<option value=""><ui:i18n key="请选择" /></option>
								<option value="0"><ui:i18n key="启用" /></option>
								<option value="1"><ui:i18n key="禁用" /></option>
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
				<div class="result-grid-header">
					<div class="result-grid-tools">
					   		<span class="result-grid-tool js-add-page">
				   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="新建"/>
					   		</span>
					</div>
				</div>
				<div class="js-grid-content">
					<div class="result-data-warp" style="">
						<table class="result-grid-table">
				    	 	<thead class="result-grid-thead">
				    		 	<tr>
				    		 	<th style="width: 150px"><ui:i18n key="表名" /></th>
				 		 		<th style="width: 140px"><ui:i18n key="字段名" /></th>
				 		 		<th style="width: 120px">CD_ID</th>
				 		 		<th style="width: 200px"><ui:i18n key="字段值" /></th>
				 		 		<th style="width: 170px"><ui:i18n key="字段描述" /></th>
				 		 		<th style="width: 120px"><ui:i18n key="状态" /></th>
				 		 		<th style="width: 100px"><ui:i18n key="操作" /></th>
				 		 	</tr>
				 		 	</thead>
				 		 	<tbody  class="result-grid-tbody" >
				  			 <c:choose>
								<c:when test="${requestScope.user.userAuth eq 'A' }">
									<c:forEach items="${list }" var="list">
							   		 	<tr>
							   		 		<td style="width: 150px"><span class="limit-span" title="${list.TB_NM }">${list.TB_NM }</span></td>
							   		 		<td style="width: 140px"><span class="limit-span" title="${list.FD_NM }">${list.FD_NM }</span></td>
							   		 		<td style="width: 120px">${list.CD_ID }</td>
							   		 		<td  style="width: 200px"><span class="limit-span" title="${list.CD_VAL }">${list.CD_VAL }</span></td>
							   		 		<td style="width: 170px">
							   		 			<span class="limit-span" title="${list.CD_DESC }">${list.CD_DESC }</span>
							   		 		</td>
							   		 		<td style="width: 120px">
							   		 			<c:if test="${list.IS_DELETE == 0 }"><ui:i18n key="启用" /></c:if>
							   		 			<c:if test="${list.IS_DELETE == 1 }"><ui:i18n key="禁用" /></c:if>
							   		 		</td>
							   		 		<td style="width: 100px">
							   		 			<span class="gridbutton red" onclick="javascript:showUpdatePoupe('${list.CD_ID}','${list.TB_NM}','${list.FD_NM }','${list.CD_VAL }','${list.CD_DESC }')"><ui:i18n key="编辑" /></span>
							   		 			<c:if test="${list.IS_DELETE == 0 }">
							   		 				<span class="gridbutton red" onclick="startOrstop('${list.CD_ID}','${list.IS_DELETE}','${list.TB_NM}','${list.FD_NM }');"><ui:i18n key="禁用" /></span>
							   		 			</c:if>
							   		 			<c:if test="${list.IS_DELETE == 1 }">
							   		 				<span class="gridbutton green" onclick="startOrstop('${list.CD_ID}','${list.IS_DELETE}','${list.TB_NM}','${list.FD_NM }');"><ui:i18n key="启用" /></span>
							   		 			</c:if>
							   		 		</td>
							   		 	</tr>
				   					 </c:forEach>
				   				</c:when>
				   				<c:otherwise>
									<tr>
										<td colspan="4"><ui:i18n key="您没有操作权限"/></td>
									</tr>
								</c:otherwise>
				   			</c:choose>
				 		 </tbody>
						</table>
					</div>
					<ui:paging page="${page }" />
				</div>
			</div>
		<!-- ▲ 普通表格  -->  
	</div>
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="createCodePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-add-page"><ui:i18n key="新建"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" onclick="clearInput()"/>
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="表名"/><a class="label-required"></a>: 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text" id="tbNm_cr" value="" placeholder="<ui:i18n key="请输入表名"/>"/>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="字段名"/><a class="label-required"></a>: 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  id="fdNm_cr" placeholder="<ui:i18n key="请输入字段名"/>"/>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="字段值"/><a class="label-required"></a>: 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  id="cdVal_cr" placeholder="<ui:i18n key="请输入字段值"/>"/>
					  			 	 </div>
					  			 </div>
					  			  <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px">
					  			 		<ui:i18n key="字段描述"/> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  id="desc_cr" placeholder="<ui:i18n key="请输入字段描述"/>"/>
					  			 	 	<input type="hidden" id="cdId" value="" />
					  			 	 </div>
					  			 </div>
					  			 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="save()">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="clearInput()">
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
	<!-- ▲ bpopup area -->
</body>
</html>


