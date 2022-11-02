<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiInc.jsp"%> 
<title>Bill Result</title>  
  
 
 </head>
 <body style="background-color: #f5f5f5;"> 
			
			isError = ${isError }<br>
			<hr/>
			<c:choose>
				<c:when test="${isError }">
				return_code = ${err.return_code }<br>
			return_msg = ${err.return_msg }<br>
				</c:when>
				<c:otherwise> 
				 <div style="display:block;width:90%;overflow:scroll; margin-left: auto; margin-right: auto;">
				 <table width="4000px" style="border-color: #fff;"   border="1" cellspacing="0" cellpadding="0">
				 	<thead>
				 		<c:forEach items="${orderBill.header}" var="item" varStatus="status">
							<th style="text-align: left;border: 1px solid;">${item }</th>
						</c:forEach>
				 	</thead>
				 	<tbody>
				 		<c:forEach items="${orderBill.data}" var="item" varStatus="status">
							<tr>
								<c:forEach items="${item}" var="subitem" varStatus="status">
									<td style="border: 1px solid;">${fn:substring(subitem, 1,fn:length(subitem))}</td>
								</c:forEach>
							</tr>
						</c:forEach>
				 	</tbody>
				 	</table>
				 	</div>
				 
		<%-- 	<c:forEach items="${requestScope.resultList}" var="item" varStatus="status">
			${item }<br>
			</c:forEach> --%>
				</c:otherwise>
			</c:choose>
			
		 
			
 </body> 
</html>