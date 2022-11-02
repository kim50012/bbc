<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="9%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="32%" />
		      		 			<col width="20%" />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th>ID</th>
			      		 		<th><ui:i18n key="关键字"/></th>
			      		 		<th><ui:i18n key="信息区分"/></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="生成日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.MESSAGE_ID }</td>
									<td ><span>${list.KEYWORD}</span></td>
									<td>${list.SEND_FILE_TYPE_NM}</td>
									<td>
										<%-- <span class="text-ellipsis" title="<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq 1  or list.SEND_FILE_TYPE eq 5}">
												 ${list.SEND_MSG_BODY } 
											</c:when>
											<c:otherwise>
												${list.FILE_NM }
											</c:otherwise>
										</c:choose>">
										<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq 1  or list.SEND_FILE_TYPE eq 5}">
												 ${list.SEND_MSG_BODY } 
											</c:when>
											<c:otherwise>
												${list.FILE_NM }
											</c:otherwise>
										</c:choose>
										</span> --%>
										<span class="text-ellipsis" title="${list.MSG_TITLE}">${list.MSG_TITLE}</span>
									</td>
									<td ><ui:date value="${list.CREATED_DT}" pattern="date" /> </td>
									<td>
										<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq 6}">
												<span class="gridbutton gray" ><ui:i18n key="编辑"/></span>
												<span class="gridbutton red" onclick="previewNewsMaterial(${list.MESSAGE_ID });"><ui:i18n key="预览"/></span>
											</c:when>
											<c:otherwise>
												<span class="gridbutton red"  onclick="modifyMessage(${list.MESSAGE_ID });"><ui:i18n key="编辑"/></span>
												<span class="gridbutton red" onclick="showMsgNow(${list.MESSAGE_ID });"><ui:i18n key="预览"/></span>
											</c:otherwise>
										</c:choose>
			      		 				<span class="gridbutton red" onclick="deleteMessage(${list.MESSAGE_ID });"><ui:i18n key="删除"/></span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" /> 
		      	 <!-- =============================== -->