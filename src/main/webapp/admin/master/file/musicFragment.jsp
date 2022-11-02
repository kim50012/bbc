<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 
  		<div class="popup-content-warp">
			<div class="popup-content-item-warp">
				  <div class="result-grid">
				      	<div class="js-grid-content">
				      		<table class="result-grid-table">
				      		 	<colgroup>
							      		<col width="80px"  />
				      		 			<col width="60%" />
				      		 			<col />
						      		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th class="chk"></th>
					      		 		<th><ui:i18n key="标题"/></th>
					      		 		<th><ui:i18n key="创建时间"/></th>
					      		 	</tr>
					      		 </thead>
					      	</table>
				      		<div class="grid-fixed" style="height: 229px;">
						      	<table class="result-grid-table fixed">
						      		<colgroup>
							      		<col width="80px"  />
				      		 			<col width="60%" />
				      		 			<col />
						      		</colgroup>
						      		 <tbody  class="result-grid-tbody">
						      		 	<c:forEach items="${page.data}" var="item" varStatus="status">
						      		 		<tr>
							      		 		<td class="chk" style="text-align: center;">
							      		 			<input class="icradio js-music-item" type="radio" name="check" value="" 
							      		 				data-file-id="${item.FILE_ID }" 
							      		 				data-file-nm="${item.FILE_NM }" 
							      		 				data-file-url="${item.FULL_URL }" >
							      		 		</td>
							      		 		<td>
													<span class="text-ellipsis">${item.FILE_NM }</span>
												</td>
							      		 		<td>${item.CREATED_DT }</td>
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