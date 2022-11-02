<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
  		<div class="popup-content-warp">
			<div class="popup-content-item-warp"  style="height: 280px;">
				  <div class="result-grid">
				      	<div class="js-grid-content">
				      		<table class="result-grid-table">
				      		 	<colgroup>
							      		<col width="80px"  />
				      		 			<col width="100px" />
				      		 			<col width="140px" />
				      		 			<col />
						      		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th class="chk"></th>
					      		 		<th><ui:i18n key="链接类型"/></th>
					      		 		<th><ui:i18n key="标题"/></th>
					      		 		<th><ui:i18n key="链接地址"/></th>
					      		 	</tr>
					      		 </thead>
					      	</table>
				      		<div class="grid-fixed" style="height: 229px;">
						      	<table class="result-grid-table fixed">
						      		<colgroup>
							      		<col width="80px"  />
				      		 			<col width="100px" />
				      		 			<col width="140px" />
				      		 			<col />
						      		</colgroup>
						      		 <tbody  class="result-grid-tbody">
						      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
						      		 		<tr>
							      		 		<td class="chk" style="text-align: center;">
							      		 			<input class="icradio js-link-item" type="radio" name="check" value="" 
							      		 				data-page-id="${item.PAGE_ID }" 
									      		 				data-page-nm="${item.PAGE_NM }" 
									      		 				data-page-type="${serachLinkType }" 
									      		 				data-url="${item.URL }"  >
							      		 		</td>
							      		 		<td>
													<span class="text-ellipsis">${item.PAGE_TYPE_NM }</span>
												</td>
							      		 		<td>
													<span class="text-ellipsis">${item.PAGE_NM }</span>
												</td>
							      		 		<td>${item.URL }</td>
							      		 	</tr>
						      		 	</c:forEach>
						      		 </tbody>
						      	</table>
					      	</div>
				      	
				      	</div>
			      </div>
			</div>
		</div>	 
		<div style="padding-left: 30px;"> 
			<ui:paging page="${page }" showSize="false" position="right" btn1text="确认" btn2text="取消" />
		</div> 