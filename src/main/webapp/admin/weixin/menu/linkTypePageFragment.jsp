<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
	 		 	    
				      	<div class="result-data-warp" style="">
				      		<div class="result-data-warp" style="">
				      			 <c:choose>
				  			 	 	<c:when test="${ serachLinkType gt 90}">
				  			 	 		<table class="result-grid-table">
							      		 	<colgroup>
										      		<col width="30px"  />
							      		 			<col width="350px" />
							      		 			<col width="350px" />
							      		 			<col />
									      		</colgroup>
								      		 <thead class="result-grid-thead">
								      		 	<tr>
								      		 		<th class="chk"></th>
								      		 		<th class="text-left"><ui:i18n key="标题"/></th>
								      		 		<th></th>
								      		 		<th></th>
								      		 	</tr>
								      		 </thead>
								      	</table>
								      	<div class="grid-fixed">
									      	<table class="result-grid-table fixed">
									      		<colgroup>
										      		<col width="30px"  />
							      		 			<col width="350px" />
							      		 			<col width="350px" />
							      		 			<col />
									      		</colgroup>
									      		 <tbody  class="result-grid-tbody">
									      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
									      		 	
									      		 	<tr>
									      		 		<td class="chk">
<!-- 									      		 			<input class="iccheckbox js-check-item" type="checkbox" name="check"  -->
<%-- 									      		 				data-page-id="${item.PAGE_ID }"  --%>
<%-- 									      		 				data-page-nm="${item.PAGE_NM }"  --%>
<%-- 									      		 				data-page-type="${serachLinkType }"  --%>
<%-- 									      		 				data-url="${item.URL }"  /> --%>
															<input class="icradio js-check-item" type="radio" name="check" 
							      		 						data-page-id="${item.PAGE_ID }" 
									      		 				data-page-nm="${item.PAGE_NM }" 
									      		 				data-page-type="${serachLinkType }" 
									      		 				data-url="${item.URL }"  >
									      		 		</td>
									      		 		<td class="text-left" >${item.PAGE_NM }</td>
									      		 		<td class="text-left" ><%-- ${item.URL } --%></td>
									      		 		<td>
									      		 		</td>
									      		 	</tr>
									      		 	</c:forEach>
									      		 
									      		 </tbody>
									      	</table>
								      	</div> 
				  			 	 	</c:when>
				  			 	 	<c:otherwise>
				  			 	 		<table class="result-grid-table">
							      		 	<colgroup>
										      		<col width="30px"  />
							      		 			<col width="150px" />
							      		 			<col width="550px" />
							      		 			<col />
									      		</colgroup>
								      		 <thead class="result-grid-thead">
								      		 	<tr>
								      		 		<th class="chk"><!-- <input class="iccheckbox" type="checkbox" name="checkall" >&nbsp;&nbsp;全选 --></th>
								      		 		<th><ui:i18n key="标题"/></th>
								      		 		<th><ui:i18n key="链接"/></th>
								      		 		<th><%-- <ui:i18n key="操作"/> --%></th>
								      		 	</tr>
								      		 </thead>
								      	</table>
								      	<div class="grid-fixed">
									      	<table class="result-grid-table fixed">
									      		<colgroup>
										      		<col width="30px"  />
							      		 			<col width="150px" />
						      		 				<col width="550px" />
							      		 			<col />
									      		</colgroup>
									      		 <tbody  class="result-grid-tbody">
									      		 	<c:forEach items="${requestScope.list}" var="item" varStatus="status">
									      		 	
									      		 	<tr>
									      		 		<td class="chk">
<!-- 									      		 			<input class="iccheckbox js-check-item" type="checkbox" name="check"  -->
<%-- 									      		 				data-page-id="${item.PAGE_ID }"  --%>
<%-- 									      		 				data-page-nm="${item.PAGE_NM }"  --%>
<%-- 									      		 				data-page-type="${serachLinkType }"  --%>
<%-- 									      		 				data-url="${item.URL }"  /> --%>
								      		 				<input class="icradio js-check-item" type="radio" name="check" 
							      		 						data-page-id="${item.PAGE_ID }" 
									      		 				data-page-nm="${item.PAGE_NM }" 
									      		 				data-page-type="${serachLinkType }" 
							      		 						data-url="${item.URL }"  >
									      		 		</td>
									      		 		<td>${item.PAGE_NM }</td>
									      		 		<td class="text-left" >${item.URL }</td>
									      		 		<td>
									      		 		</td>
									      		 	</tr>
									      		 	</c:forEach>
									      		 
									      		 </tbody>
									      	</table>
								      	</div>
				  			 	 	</c:otherwise>
				  			 	 </c:choose>
				      		
				      			
						      	
						      	
						      	<!-- dddd -->
						      	
				      		</div>
				      	
				      	</div>
				      	
	      			<ui:paging page="${page }"  position="right" showSize="false" method="showLinkPage" btn1text="确认"  btn2text="取消"  /> 
	      		 
	      			 