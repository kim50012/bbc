<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="20%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="摇奖活动标题"/></th>
			      		 		<th><ui:i18n key="允许中奖人数"/></th>
			      		 		<th><ui:i18n key="当前已中奖人数"/></th>
			      		 		<th><ui:i18n key="赠送总积分"/></th>
			      		 		<th><ui:i18n key="红包总金额"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.GAME_NM }</td>
									<td>${list.GAME_LIMIT_CNT }</td>
									<td>${list.WIN_CNT }</td>
									<td>${list.POINT_TOTAL }</td>
									<td>${list.HONGBAO_TOTAL }</td>
									<td>
						           		<span class="gridbutton red"  onclick="modifyRoulette(${list.GAME_ID });"><ui:i18n key="编辑"/></span>
										<c:if test="${list.IS_USE==1}">
											<span class="gridbutton red" onclick="stopRoulette(${list.GAME_ID });"><ui:i18n key="停用"/></span>
					           			</c:if>
					           			<c:if test="${list.IS_USE==0}">
					           				<span class="gridbutton green" onclick="useRoulette(${list.GAME_ID });"><ui:i18n key="启用"/></span>
					           			</c:if>
										<span class="gridbutton red" onclick="deleteRoulette(${list.GAME_ID });"><ui:i18n key="删除"/></span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" /> 
		      	 <!-- =============================== -->