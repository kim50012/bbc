<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
   				 <table class="result-grid-table">
	      				<colgroup>
				      		<col width="100px"  />
	      		 			<col width="22%" />
	      		 			<col width="22%" />
	      		 			<col width="22%" />
	      		 			<col />
			      		</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th class="chk" ><input class="iccheckbox js-check-all" type="checkbox" name="checkall" >&nbsp;&nbsp;<ui:i18n key="全选"/></th>
		      		 		<th><ui:i18n key="配送区域"/></th>
		      		 		<th><ui:i18n key="物流费"/>(<ui:i18n key="元"/>)</th>
		      		 		<th><ui:i18n key="续件运费"/>(<ui:i18n key="元"/>)</th>
		      		 		<th>&nbsp;</th>
		      		 	</tr>
		      		 </thead>
		      	</table>
	      		<div class="grid-fixed">
				      	<table class="result-grid-table fixed">
				      		<colgroup>
					      		<col width="100px"  />
		      		 			<col width="22%" />
		      		 			<col width="22%" />
		      		 			<col width="22%" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	  <c:forEach items="${areaList}" var="item">
					      		 	<tr class="js-area-item">
					      		 		<td class="chk has-input">
					      		 			<input class="iccheckbox js-check-item" type="checkbox" name="check" data-area-id="${item.areaId }" />
					      		 			<input type="hidden" id="toAreaParentId" value="${item.areaParentId }" />
					      		 		</td>
					      		 		<td class="has-input">${item.areaName }</td>
					      		 		<td class="has-input">
					      		 			<input type="text" class="js-trans-fee text-center w9"  id="transFee" >
					      		 		</td>
					      		 		<td class="has-input">
					      		 			<input type="text" class="js-trans-add-fee text-center w9" id="transAddFee" >
					      		 		</td>
					      		 		<td class="has-input">
					      		 		</td>
					      		 	</tr>
				      		 	  </c:forEach>
				      		  
				      		 	 
				      		 </tbody>
				      	</table>
			      	</div>
		      	 <!-- =============================== -->