<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				      		<div class="result-data-warp" style="">
						      	<table class="result-grid-table">
					      		 	<colgroup>
								      		<col width="80px"  />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col />
							      	</colgroup>
						      		<thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th> <input class="iccheckbox js-check-all" type="checkbox" name="checkall" >&nbsp;&nbsp;全选</th>
						      		 		<th><ui:i18n key="客户"/>ID</th>
						      		 		<th><ui:i18n key="客户名称"/></th>
						      		 		<th><ui:i18n key="留言时间"/></th>
						      		 		<th><ui:i18n key="留言内容"/></th>
						      		 	</tr>
						      		</thead>
						      	</table>
						      	<div class="grid-fixed">
							      	<table class="result-grid-table fixed">
							      		<colgroup>
								      		<col width="80px"  />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col />
							      		</colgroup>
							      		 <tbody  class="result-grid-tbody">
							      			<c:forEach items="${requestScope.reProWinList}" var="item" varStatus="status">
								      		 	<tr>
								      		 		<td><input class="iccheckbox js-check-item" type="checkbox" name="check" /></td>
								      		 		<td>${item.MES_ID }</td>
								      		 		<td>${item.MES_NM }</td>
								      		 		<td>${item.MES_DT_PC }</td>
								      		 		<td style="text-align: left;padding-left:10px; ">${item.MES_CONTENT }</td>
								      		 	</tr>
							      		 	</c:forEach>
							      		</tbody>
							      	</table>
							    </div>
								<ui:paging page="${page }"   method="showWinPage"/>
				      		</div>