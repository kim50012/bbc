 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="17%" />
		      		 			<col width="16%" />
		      		 			<col width="15%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="姓名"/></th>
			      		 		<th><ui:i18n key="生日"/></th>
			      		 		<th><ui:i18n key="手机号码"/></th>
			      		 		<th><ui:i18n key="地区地址"/></th>
			      		 		<th><ui:i18n key="Email"/></th>
			      		 		<th><ui:i18n key="申请日期"/></th>
			      		 		<th><ui:i18n key="原因"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="items" varStatus="status">
								<tr>
									<td>
				           				${items.CUST_NM}
				           			</td>
				           			<td>
				           				${items.BIRTHDAY}
				           			</td>
				           			<td>
				           				${items.MOBILE_NO}
				           			</td>
				           			<td>
										<span>${items.ADRESS}</span>
				           			</td>
				           			<td>
										<span>${items.EMAIL}</span>
				           			</td>
				           			<td>
				           				${items.CREATE_DT}
				           			</td>
				           			<td style="text-align: left;">
										<span>${items.REASON}</span>
				           			</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />