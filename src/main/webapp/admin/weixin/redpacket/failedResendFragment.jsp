<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
			<table class="result-grid-table" style="width: 95%;">
      		 	<colgroup>
			      		<col width="40px"  />
      		 			<col width="250px" />
      		 			<col width="130px" />
      		 			<col />
		      		</colgroup>
	      		 <thead class="result-grid-thead">
	      		 	<tr>
	      		 		<th class="chk"><input class="iccheckbox" type="checkbox" name="checkall" id="checkall">&nbsp;&nbsp;全选</th>
	      		 		<th><ui:i18n key="OPENID"/></th>
	      		 		<th><ui:i18n key="昵称"/></th>
	      		 		<th><ui:i18n key="错误信息"/></th>
	      		 	</tr>
	      		 </thead>
	      		 <tbody  class="result-grid-tbody">
		      		 <c:forEach items="${requestScope.list}" var="item" varStatus="status">
		      		 	<tr>
		      		 		<td class="chk">
		      		 			<input class="iccheckbox js-check-item" type="checkbox" name="subcheck"  
		      		 				   <c:if test="${item.JOB_STATUS ==1}">checked="checked"</c:if> 
		      		 				   data-seq-id="${item.SEQID }"  data-open-id="${item.RE_OPENID }"/>
		      		 		</td>
		      		 		<td>${item.RE_OPENID }</td>
		      		 		<td>${item.NICKNAME }</td>
		      		 		<td>${item.ERROR_CODE }</td>
		      		 	</tr>
		      		 </c:forEach>
	      		 </tbody>
	      	</table>