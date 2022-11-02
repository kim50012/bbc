<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <title><ui:i18n key="运费标准管理"/></title>
 
<script type="text/javascript">


function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	window.scrollTo(0,0);
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	
	var params = {
			transSheetName : $('#transSheetName').val()
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/shop/transport/sheetListFragment.htm';
	 
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


function createSheet(){
	/* parent.ggShowTab({
		'url' : '/admin/shop/transport/createSheet.htm',
		'name' : '<ui:i18n key="新建运费模板"/>',
		'icon' : 'shopoperation' 
	}); */  
	window.location.href='/admin/shop/transport/createSheet.htm';
}

function modifySheet(sheetId,fromAreaId){
	/* parent.ggShowTab({
		'url' : '/admin/shop/transport/modifySheet.htm?transSheetId=' + sheetId + '&fromAreaId=' + fromAreaId,
		'name' : '<ui:i18n key="编辑运费模板"/>',
		'icon' : 'shopoperation' 
	});  */ 
	window.location.href='/admin/shop/transport/modifySheet.htm?transSheetId=' + sheetId + '&fromAreaId=' + fromAreaId;
}

function deleteSheet(sheetId){
	if(confirm('<ui:i18n key="确定要删除该运费模板吗"/>?')){
		$.ajax({
	 		url : "/admin/shop/transport/deleteSheet.htm",
	 		data : {
	 			transSheetId : sheetId
	 		},
	 		success : function(res){
	 			if (res.success){
	 				alert('<ui:i18n key="删除成功"/>.');
	 				var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
	 			}else{
	 				alert('<ui:i18n key="删除失败"/>.\n' + res.err_msg);
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('<ui:i18n key="网络出现故障"/>.');
	 		}
	 	});
	}
}

</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="85%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="模板名称"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<%-- <select id="transSheetId" class="select2 w42" style="" data-placeholder="<ui:i18n key="请选择"/>" >
	       		 				 	<option value=""></option>
						            <c:forEach items="${requestScope.sheetComboList}" var="item" varStatus="status">
										<option value="${item.comboKey}">${item.comboValue}</option>
									</c:forEach>
								</select> --%>
								<input type="text" id="transSheetName" class="w36" />
	       		 			</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<!-- -->
	       		<div class="butttn-area m1" >
	       		   <span class="button" onclick="searchData();">
	       		   	  <span class="button-icon search"></span>
	       		   	 <ui:i18n key="查询"/> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	
	
	
	  <!--  -->
	  <div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="createSheet();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="20%" />
		      		 			<col width="10%" />
		      		 			<col width="35%" />
		      		 			<col width="15%" />
		      		 			<col width="20%" />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="运费模板"/></th>
			      		 		<th><ui:i18n key="指定区域"/></th>
			      		 		<th><ui:i18n key="配送区域"/></th>
			      		 		<th><ui:i18n key="创建日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 <c:forEach items="${sheetList}" var="item">
			      		 	<tr>
			      		 		<td>${item.TRANS_SHEET_NM }</td>
			      		 		<td>
									<c:if test="${item.AREA eq 0}">
			           					<ui:i18n key="省"/>
			           				</c:if>
			           				<c:if test="${item.AREA eq 1}">
			           					<ui:i18n key="市"/> 
			           				</c:if>
								</td>
			      		 		<td> 
			      		 			<c:choose>
			      		 				<c:when test="${item.TO_AREA_CNT eq 31}">
			      		 					<span title="<ui:i18n key="全部省份"/>"><ui:i18n key="全部省份"/></span>
			      		 				</c:when>
			      		 				<c:otherwise>
			      		 					<span title="${item.TO_AREA_NM}"><ui:ellipsis length="30" value="${item.TO_AREA_NM}" /></span> 
			      		 				</c:otherwise>
			      		 			</c:choose>	
			      		 		</td>
			      		 		<td> <ui:date value="${item.CREATED_DT}" pattern="date" /> </td>
			      		 		<td>
			      		 			<span class="gridbutton red"  onclick="modifySheet(${item.TRANS_SHEET_ID },${item.FROM_AREA_ID });"><ui:i18n key="编辑"/></span>
			      		 			<span class="gridbutton red" onclick="deleteSheet(${item.TRANS_SHEET_ID });"><ui:i18n key="删除"/></span>
			      		 		</td>
			      		 	</tr>
			      		 </c:forEach>
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />
	     	</div>
	      </div>
	  <!--  -->
	</div>
	<!-- ▲ container  -->
</body>
</html>