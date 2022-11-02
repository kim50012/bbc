<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="收支明细"/></title>
<script type="text/javascript">

$(function(){
	$('.js-excel').click(function(){
		var flag = window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？');
		if(flag){
			//存储excel表中的内容
			var createdDateFrom = $('#createdDateFrom').val();
			var createdDateTo = $('#createdDateTo').val();
			var isRefund = $('#isRefund').val();
			var payTypeId = $('#payTypeId').val();
			var date1 = new Date(createdDateFrom);
			var date2 = new Date(createdDateTo);
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			var url = '/admin/income/createExcel.htm';
			var params = {
					createdDateFrom : createdDateFrom
					,createdDateTo : createdDateTo
					,isRefund : isRefund
					,payTypeId : payTypeId
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
	var isRefund = $('#isRefund').val();
	var payTypeId = $('#payTypeId').val();
	var params = {
			createdDateFrom : createdDateFrom
			,createdDateTo : createdDateTo
			,isRefund : isRefund
			,payTypeId : payTypeId
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/income/detailListFragment.htm';
	 
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
		       		 			<input  value="${requestScope.createdDateFrom }" type="text" id="createdDateFrom" style="width: 100px"  class="w100 datepicker calendar" readonly="readonly" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input value="${requestScope.createdDateTo }"  type="text" id="createdDateTo" style="width: 100px" class="w100 datepicker calendar" readonly="readonly" />
	       		 			</td>
	       		 			<td class="flabel"><ui:i18n key="收支类型"/>：</td>
	       		 			<td class="fcomp">
		       		 			<select id="isRefund" class="select2" data-placeholder="" style="width: 90%;">
									<option value="" <c:if test="${requestScope.isRefund==''}">selected="selected"</c:if> >${label.不限}</option>
									<option value="0" <c:if test="${requestScope.isRefund=='0'}">selected="selected"</c:if>>${label.订单入账}</option>
									<option value="1" <c:if test="${requestScope.isRefund=='1'}">selected="selected"</c:if>>${label.退款}</option>
								</select>
	       		 			</td>
	       		 		</tr>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="支付渠道"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<select id="payTypeId" class="select2 rightSelect" data-placeholder="" style="width: 91%;">
									<option value="" <c:if test="${requestScope.payTypeId==''}">selected="selected"</c:if> >${label.不限}</option>
									<c:forEach items="${listPayType}" var="list1" varStatus="status">
										<option value="${list1.PAY_TYPE_ID}" <c:if test="${list1.PAY_TYPE_ID==requestScope.payTypeId}">selected="selected"</c:if> >${list1.PAY_NAME }</option>
									</c:forEach>
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
		      		 			<col width="14%" />
		      		 			<col width="8%" />
		      		 			<col width="18%" />
		      		 			<col width="7%" />
		      		 			<col width="10%" />
		      		 			<col width="7%" />
		      		 			<col width="9%" />
		      		 			<col width="16%" />
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="时间"/></th>
			      		 		<th><ui:i18n key="类型"/></th>
			      		 		<th><ui:i18n key="收入流水号"/></th>
			      		 		<th><ui:i18n key="收入"/>(<ui:i18n key="元"/>)</th>
			      		 		<th><ui:i18n key="退款金额"/>(<ui:i18n key="元"/>)</th>
			      		 		<th><ui:i18n key="余额"/>(<ui:i18n key="元"/>)</th>
			      		 		<th><ui:i18n key="支付渠道"/></th>
			      		 		<th><ui:i18n key="单号"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			 <c:forEach items="${list}" var="list" varStatus="status">
				           		<tr>
				           			<td >
				           				<span>${list.CREATED_DT }</span>					
				           			</td>
				           			<td>
				           				<span>${list.ORDER_AMT_NM }</span>
				           			</td>
				           			<td >
				           				<span>${list.PAY_PG_KEY }</span>
				           			</td>
				           			<td >
				           				<span>￥<fmt:formatNumber type="number" value="${list.PAY_AMT }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
				           			</td>
				           			<td >
				           				<span>￥<fmt:formatNumber type="number" value="${list.RE_PAY_AMT }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
				           			</td>
				           			<td >
				           				<span>￥<fmt:formatNumber type="number" value="${list.PRICE_TT_AFTER_NEGO }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>	
				           			</td>
				           			<td>
				           				<span class="pay-name-span" title="${list.PAY_NAME }">${list.PAY_NAME } </span>
				           			</td>
				           			<td>
				           				<span>${list.ORDER_OUT_ID }</span>
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