<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
  				<div class="result-data-warp">
  					<table class="result-grid-table">
		      		<colgroup>
	      		 			<col width="30px"  />
		      				<col width="120px"  />
	      		 			<col width="20%" />
	      		 			<col width="40%" />
	      		 			<col />
	      		 	</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th></th>
		      		 		<th></th>
		      		 		<th class="text-left"><ui:i18n key="商品名称"/></th>
		      		 		<th><ui:i18n key="标准分类"/>-<ui:i18n key="第1级"/> > <ui:i18n key="第2级"/> > <ui:i18n key="第3级"/></th>
		      		 		<th><ui:i18n key="登记商品时间"/></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody">
		      		 <c:forEach items="${page.data}" var="item">
		      		 	<tr>
			      		 	<td class="">
			      		 		<input class="iccheckbox js-goods-item" type="checkbox" name="check" 
  		 							data-goods-id="${item.GOODS_ID }" 
  		 							data-gc-id="${item.GC_ID_LV2 }"  
  		 							data-gc-nm="${item.GC_NM_LV1 } > ${item.GC_NM_LV2 } > ${item.GC_NM_LV3 }" />
			      		 	</td>
		      		 		<td class="pic">
		      		 			<img class="pic-small" alt="${item.GOODS_NM }" src="${item.GOODS_LIST_IMG_URL }">
		      		 		</td>
		      		 		<td class="text-left">${item.GOODS_NM }</td>
		      		 		<td>${item.GC_NM_LV1 } > ${item.GC_NM_LV2 } > ${item.GC_NM_LV3 }</td>
		      		 		<td>${item.CREATED_DT }</td>
      		 			</tr>
		      		 </c:forEach>
		      		 </tbody>
		      	</table>
  				</div>
	      	
	      	 	<ui:paging page="${page }" />
