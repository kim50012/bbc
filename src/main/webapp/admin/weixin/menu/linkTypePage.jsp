<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
		<form action="">
	    		<div class="form-warp clearfix" >
  			 <div class="control-warp"  >
  			 	 <div class="form-label" style="width: 80px;">
  			 		<ui:i18n key="标题"/>: 
  			 	 </div>
  			 	 <div class="form-control">
  			 	 	<input type="text"  class="js-search-title w15" placeholder=""  >
  			 	 	
  			 	 </div>
  			 	 
  			 	 
  			 	 <div class="form-label" style="width: 80px;">
  			 	 <c:choose>
  			 	 	<c:when test="${ serachLinkType gt 90}">
  			 	 		<ui:i18n key="消息类型"/>: 
  			 	 	</c:when>
  			 	 	<c:otherwise>
  			 	 		<ui:i18n key="链接类型"/>: 
  			 	 	</c:otherwise>
  			 	 </c:choose>
  			 	 </div>
  			 	 <div class="form-control">
  			 	 	<select class="js-search-link-type select2 sw15" data-placeholder="<ui:i18n key="请选择"/>...">
  		 					<c:forEach items="${linkTypeCombo }" var="item">
  		 						<option value="${item.comboKey }" <c:if test="${item.comboKey eq serachLinkType}"> selected="selected" </c:if>>${item.comboValue }</option>
  		 					</c:forEach>	
  		 				</select>
  			 	 </div>
  			 	  <span class="button bg-red  js-search-link-button" style="float: right;">
					<span class="button-icon search"></span>
					<span class="button-name"><ui:i18n key="查询"/></span>
				</span> 
  			 </div> 
  		</div>
	    </form>
	    
	 <div class="result-grid">
     	<div class="js-link-page-grid">
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
			      		 		<th class="chk"><!-- <input class="iccheckbox" type="checkbox" name="checkall" >&nbsp;&nbsp;全选 --></th>
			      		 		<th class="text-left"><ui:i18n key="标题"/></th>
			      		 		<th><%-- <ui:i18n key="链接"/> --%></th>
			      		 		<th><%-- <ui:i18n key="操作"/> --%></th>
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
				      		 	<c:forEach items="${requestScope.list}" var="item" varStatus="status">
				      		 	
				      		 	<tr>
				      		 		<td class="chk">
<!-- 				      		 			<input class="iccheckbox js-check-item" type="checkbox" name="check"  -->
<%-- 				      		 				data-page-id="${item.PAGE_ID }"  --%>
<%-- 				      		 				data-page-nm="${item.PAGE_NM }"  --%>
<%-- 				      		 				data-page-type="${serachLinkType }"  --%>
<%-- 				      		 				data-url="${item.URL }"  /> --%>
				      		 			<input class="icradio js-check-item" type="radio" name="check" 
					      		 						data-page-id="${item.PAGE_ID }" 
							      		 				data-page-nm="${item.PAGE_NM }" 
							      		 				data-page-type="${serachLinkType }" 
							      		 				data-url="${item.URL }"  >
				      		 		</td>
				      		 		<td class="text-left">${item.PAGE_NM }</td>
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
<!-- 				      		 			<input class="iccheckbox js-check-item" type="checkbox" name="check"  -->
<%-- 				      		 				data-page-id="${item.PAGE_ID }"  --%>
<%-- 				      		 				data-page-nm="${item.PAGE_NM }"  --%>
<%-- 				      		 				data-page-type="${serachLinkType }"  --%>
<%-- 				      		 				data-url="${item.URL }"  /> --%>
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
     		
     		<ui:paging page="${page }" position="right" showSize="false" method="showLinkPage" btn1text="确认"  btn2text="取消" /> 
     	
     	</div>
     	
  	</div>