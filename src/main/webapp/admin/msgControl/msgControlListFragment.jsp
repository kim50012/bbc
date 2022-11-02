<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="32%" />
		      		 			<col width="22%" />
		      		 			<col />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th>ID</th>
			      		 		<th><ui:i18n key="信息区分"/></th>
			      		 		<th><ui:i18n key="信息"/></th>
			      		 		<th><ui:i18n key="生成日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.MESSAGE_ID }</td>
									<td>${list.SEND_FILE_TYPE}</td>
									<td>
										<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq '文本'  or list.SEND_FILE_TYPE eq '素材'}">
												<span class="text-ellipsis">${list.SEND_MSG_BODY }</span>
											</c:when>
											<c:otherwise>
												<span class="text-ellipsis">${list.FILE_NM }</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td ><ui:date value="${list.CREATED_DT}" pattern="date" /> </td>
									<td>
										<span class="gridbutton red"  onclick="modifyMsg(${list.MESSAGE_ID });"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red" onclick="showMsgNow(${list.MESSAGE_ID });"><ui:i18n key="预览"/></span>
										<span class="gridbutton red" onclick="sendMsg(${list.MESSAGE_ID });"><ui:i18n key="发送"/></span>
			      		 				<span class="gridbutton red" onclick="deleteMsg(${list.MESSAGE_ID });"><ui:i18n key="删除"/></span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	 <ui:paging page="${page }" /> 
		      	 <!-- =============================== -->