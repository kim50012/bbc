<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="短信查询"/></title>

<style type="text/css">

.title {
	  	text-overflow: -o-ellipsis-lastline;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
		width: 100%;
		}
.calendar {width: 100px;}
</style>
<script type="text/javascript">
$(function(){
	$('.result-grid-tool').click(function(){
		var createdDateFrom = $('#createdDateFrom').val();
		var createdDateTo = $('#createdDateTo').val();
		var date1 = new Date(createdDateFrom);
		var date2 = new Date(createdDateTo);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		var mobile = $('#mobile').val();
		
		if(mobile != ''){
			//if(!mobile.match(/^[1][358][0-9]{9}$/)){
			if(!mobile.match(/^\d{1,11}$/)){
				alert('<ui:i18n key="只能填写11位以内0-9的数字"/>！');
				return;
			}
		}
		
		var sendStatus = $('#sendStatus').val();
		//window.location.href = '/admin/report/createNoteExcel.htm?startDate='+createdDateFrom+'&endDate='+createdDateTo+'&mobile='+mobile+'&sendStatus='+sendStatus;
		if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
			var url = '/admin/report/createNoteExcel.htm';
			var params = {
					startDate : createdDateFrom
					,endDate : createdDateTo
					,mobile : mobile
					,sendStatus : sendStatus
			}
			ggFormSubmit(url,params);
			
		}
	});
});

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var createdDateFrom = $('#createdDateFrom').val();
	var createdDateTo = $('#createdDateTo').val();
	var date1 = new Date(createdDateFrom);
	var date2 = new Date(createdDateTo);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	var mobile = $('#mobile').val();
	
	if(mobile != ''){
		//if(!mobile.match(/^[1][358][0-9]{9}$/)){
		if(!mobile.match(/^\d{1,11}$/)){
			alert('<ui:i18n key="只能填写11位以内0-9的数字"/>！');
			return;
		}
	}
	
	var sendStatus = $('#sendStatus').val();
	var params = {
			startDate : createdDateFrom
			,endDate : createdDateTo
			,mobile : mobile
			,sendStatus : sendStatus
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/report/noteQueryListFragment.htm';
	 
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
</script>
<body>
	<div class="container">
		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="40%" />
	       		 			<col width="15%" />
	       		 			<col width="30%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="日期"/>：</td>
	       		 			<td class="fcomp">
		       		 			<input type="text" id="createdDateFrom" class="datepicker calendar"  value="${requestScope.createdDateFrom}" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input type="text" id="createdDateTo" class="datepicker calendar" value="${requestScope.createdDateTo}" />
	       		 			</td>
	       		 			<td class="flabel"><ui:i18n key="手机号码"/>：</td>
	       		 			<td class="fcomp">
		       		 			<input value="${requestScope.mobile }" autocomplete="off" id="mobile" style="width:180px;" type="text"/>
	       		 			</td>
	       		 		</tr>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="发送状态"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<select id="sendStatus" class="select2 rightSelect" style="width: 91.3%;" data-placeholder="">
									<option value="" <c:if test="${requestScope.sendStatus==''}">selected="selected"</c:if> ><ui:i18n key="不限"/></option>
									<option value="1" <c:if test="${requestScope.sendStatus == 1}">selected="selected"</c:if> ><ui:i18n key="成功"/></option>
									<option value="2" <c:if test="${requestScope.sendStatus == 2}">selected="selected"</c:if> ><ui:i18n key="失败"/></option>
								</select>
	       		 			</td>
	       		 			<td class="flabel last"></td>
	       		 			<td class="fcomp last">
							</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		
	       		<div class="butttn-area m2" onclick="javascript:searchData();">
	       		   <span class="button">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	      	
	      	<div class="result-grid" style="margin-top: 50px;">
		      	<div class="result-grid-header">
	   				<div class="result-grid-tools js-excel">
	   				   <span class="result-grid-tool">
	      		   	 	 	<img alt="" src="/admin/images/v2-icons/ico_export.png" />
						  	 <span class="tool-name"><ui:i18n key="批量导出"/></span> 
	      		   		</span>
	   				</div>
	   			</div>
	   			<div class="js-grid-content">
		   			<div class="result-data-warp">
			   			<table class="result-grid-table">
			      		 	<colgroup>
		      		 			<col width="10%" />
		       		 			<col width="24%" />
		       		 			<col width="8%" />
		       		 			<col width="15%" />
		       		 			<col width="15%" />
		       		 			<col width="10%" />
		       		 			<col width="8%" />
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="手机号码"/></th>
			      		 		<th><ui:i18n key="发送内容"/></th>
			      		 		<th><ui:i18n key="发送状态"/></th>
			      		 		<th><ui:i18n key="发送编号"/></th>
			      		 		<th><ui:i18n key="异常信息"/></th>
			      		 		<th><ui:i18n key="发送时间"/></th>
			      		 		<th><ui:i18n key="发送ID"/></th>
			      		 		<th><ui:i18n key="创建时间"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			 <c:forEach items="${list}" var="list" varStatus="status">
				           		<tr>
				           			<td >
				           				<span>${list.MOBILE }</span>					
				           			</td>
				           			<td>
				           				<span class="title" title="${list.CONTENT }">${list.CONTENT }</span>
				           			</td>
				           			<td >
				           				<span >${list.SEND_STATUS }</span>
				           			</td>
				           			<td >
				           				<%-- <span class="title" >${list.MSG_ID}${list.MSG_ID}</span> --%>
				           				<span  style="width:140px;" title="${list.MSG_ID}">${list.MSG_ID}</span>
				           			</td>
				           			<td >
				           				<span  class="title" title="${list.ERR_MSG }">${list.ERR_MSG}</span>
				           			</td>
				           			<td >
				           				${list.SEND_DT}	
				           			</td>
				           			<td>
				           				${list.SEND_ID}
				           			</td>
				           			<td>
				           				<span>${list.CREATE_DT }</span>
				           			</td>
				           		</tr>
				           	</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
	   			  <ui:paging page="${page }" />
	   			</div>
   			</div>
	</div>
</body>
</html>