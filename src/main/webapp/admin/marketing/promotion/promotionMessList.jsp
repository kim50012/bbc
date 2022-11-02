<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
 						<form action="">
 							<input type="hidden" value="${proId }" id="proId">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 80px;">
					  			 		<ui:i18n key="留言时间"/>: 
					  			 	 </div>
					  			 	 <div class="form-control" style="width: 280px;">
					  			 	 	<input type="text" id="startDateMess" value="${proStartDt }" class="datepicker calendar date1" style="width: 100px;"/>
										<span class="line"><img src="/admin/images/orders/wave line.png"></span>
										<input type="text" id="endDateMess" value="${proEndDt }" class="datepicker calendar date2" style="width: 100px;"/>
					  			 	 </div>
					  			 	 
					  			 	 
					  			 	 <div class="form-label" style="width: 80px;">
					  			 	 	<ui:i18n key="是否中奖"/>:
					  			 	 </div>
					  			 	 <div class="form-control" >
										<select id="selectPopMessType" class="select2 sOption" data-placeholder="" style="width: 100%;">
											<option value=""><ui:i18n key="不限"/></option>
											<option value="Y"><ui:i18n key="中奖"/></option>
											<option value="N"><ui:i18n key="未中奖"/></option>
										</select>
					  			 	 </div>
					  			 	 <span class="button bg-red  js-search-link-button" style="float: right;">
										<span class="button-icon search"></span>
										<span class="button-name"><ui:i18n key="查询"/></span>
									 </span> 
					  			 </div> 
					  		</div>
	 		 	    </form>
	 		 	    
	 		 	    <div class="result-grid" style="margin-top: 20px;">
				      	<div class="js-link-page-grid">
				      		<div class="result-data-warp" style="">
						      	
						      	<table class="result-grid-table">
					      		 	<colgroup>
								      		<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="36%"/>
							      		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th><ui:i18n key="客户"/>ID</th>
						      		 		<th><ui:i18n key="客户名称"/></th>
						      		 		<th><ui:i18n key="是否中奖"/></th>
						      		 		<th><ui:i18n key="留言时间"/></th>
						      		 		<th><ui:i18n key="留言内容"/></th>
						      		 	</tr>
						      		 </thead>
						      	</table>
						      	<div class="grid-fixed">
							      	<table class="result-grid-table fixed">
							      		<colgroup>
								      		<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="16%"/>
					      		 			<col width="36%"/>
							      		</colgroup>
							      		<tbody  class="result-grid-tbody">
							      			<c:forEach items="${requestScope.reProMessList}" var="item" varStatus="status">
								      		 	<tr>
								      		 		<td>${item.MES_ID }</td>
								      		 		<td>${item.MES_NM }</td>
								      		 		<td>${item.WIN_TYPE_NM }</td>
								      		 		<td>${item.MES_DT_PC }</td>
								      		 		<td style="text-align: left;padding-left:10px; ">${item.MES_CONTENT }</td>
								      		 	</tr>
							      		 	</c:forEach>
							      		</tbody>
							      	</table>
							    </div>
								<ui:paging page="${page }"   method="showMessPage"/>
				      		</div>
				      	</div>
	      			</div>