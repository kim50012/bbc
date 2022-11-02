<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
				      		<col width="35px"  />
				      		<col width="90px"  />
	     		 			<col width="170px" />
	     		 			<col width="100px" />
	     		 			<col width="80px" />
	     		 			<col width="80px" />
	     		 			<col width="100px" />
	     		 			<col width="100px" />
	     		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk" style="width:35px;"><input class="iccheckbox" type="checkbox" name="checkall" id="selectAll"  ></th>
			      		 		<th style="text-align: left;"><span class="select-all-span"><ui:i18n key="全选"/></span></th>
			      		 		<th style="text-align: left;"><span class="goods-name-span"><ui:i18n key="商品名称"/></span></th>
			      		 		<th><ui:i18n key="价格"/></th>
			      		 		<th><ui:i18n key="库存"/></th>
			      		 		<th><ui:i18n key="总销量"/></th>
			      		 		<th><ui:i18n key="发布时间"/></th>
			      		 		<th><ui:i18n key="下架时间"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${page.data}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td class="chk" style="width:35px;"><input class="iccheckbox js-check-item" value="${list.DISPLAY_ID}" name="displayId" type="checkbox" name="check" >
				      		 			<input type="hidden" value="${list.GOODS_ID }" id="goodsId${list.DISPLAY_ID}"/>
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.GOODS_LIST_IMG_URL }">
				      		 		</td>
				      		 		<td class="td-css" style="text-align: left;padding-left:5px;">
				      		 			
				      		 			<span class="goods-name-limit">${list.GOODS_NM}</span>
				      		 		</td>
				      		 		<td class="td-css">￥${list.PRICE_UNIT_SALES}</td>
				      		 		<td class="td-css">${list.STOCK_QTY }</td>
				      		 		<td class="td-css">${list.SALES_QTY }</td>
				      		 		<td class="td-css">${list.LAST_SALES_DT }</td>
				      		 		<td class="td-css">${list.END_DATE }</td>
				      		 		<td  class="td-css">
				      		 			<c:if test="${list.isDisplay==1}">
											<span class="gridbutton red"  onclick="bPoupDivDisplay(${list.DISPLAY_ID});"><ui:i18n key="下架"/></span>
										</c:if>
										<c:if test="${list.isDisplay==0}">
											<span class="gridbutton green"  onclick="bPoupDivDisplayPublish(${list.DISPLAY_ID});"><ui:i18n key="上架"/></span>
										</c:if>
				      		 		</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />