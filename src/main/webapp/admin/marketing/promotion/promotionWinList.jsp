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
					  			 	 	<input type="text" id="startDateWin" value="${proStartDt }" class="datepicker calendar date1" style="width: 100px;"/>
										<span class="line"><img src="/admin/images/orders/wave line.png"></span>
										<input type="text" id="endDateWin" value="${proEndDt }" class="datepicker calendar date2" style="width: 100px;"/>
					  			 	 </div>
					  			 	 
					  			 	 
					  			 	 <div class="form-label" style="width: 80px;">
					  			 	 	<ui:i18n key="是否中奖"/>:
					  			 	 </div>
					  			 	 <div class="form-control" >
										<select id="selectPopWinType" class="select2 sOption" data-placeholder="" style="width: 100%;">
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
	 		 	    <div class="result-grid" style="margin-top: 50px;">
				      	<div class="result-grid-header" >
			   				<div class="result-grid-tools js-excel">
			      		   		<span class="result-grid-tool">
			     		   	 	 	<img alt="" src="/admin/images/v2-icons/icon_excel.png" /><ui:i18n key="批量导出"/>
			     		   		</span>
			   				</div>
			   			</div>
		   			</div>
	 		 	    <div class="result-grid">
				      	<div class="js-link-page-grid">
				      		<div class="result-data-warp" >
						      	<table class="result-grid-table">
					      		 	<colgroup>
								      		<col width="80px"  />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col />
							      	</colgroup>
						      		<thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th> <input class="iccheckbox js-check-all" type="checkbox" name="checkall" >&nbsp;&nbsp;全选</th>
						      		 		<th><ui:i18n key="客户"/>ID</th>
						      		 		<th><ui:i18n key="客户名称"/></th>
						      		 		<th><ui:i18n key="留言时间"/></th>
						      		 		<th><ui:i18n key="留言内容"/></th>
						      		 	</tr>
						      		</thead>
						      	</table>
						      	<div class="grid-fixed">
							      	<table class="result-grid-table fixed">
							      		<colgroup>
								      		<col width="80px"  />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col width="100px" />
					      		 			<col />
							      		</colgroup>
							      		 <tbody  class="result-grid-tbody">
							      			<c:forEach items="${requestScope.reProWinList}" var="item" varStatus="status">
								      		 	<tr>
								      		 		<td>
									      		 		<input class="iccheckbox js-check-item" type="checkbox" name="check" 
									      		 	 			data-pro-id="${item.PRO_ID }"
									      		 	 			data-mes-id="${item.MES_ID }"	/>
								      		 		</td>
								      		 		<td>${item.MES_ID }</td>
								      		 		<td>${item.MES_NM }</td>
								      		 		<td>${item.MES_DT_PC }</td>
								      		 		<td style="text-align: left;padding-left:10px; ">${item.MES_CONTENT }</td>
								      		 	</tr>
							      		 	</c:forEach>
							      		</tbody>
							      	</table>
							    </div>
								<ui:paging page="${page }"   method="showWinPage"/>
				      		</div>
				      		
				      	</div>
				      	<div style="text-align: center;">
							 <span class="button bg-red  js-save">
								<span class="button-icon conform"></span>
								<span class="button-name"><ui:i18n key="保存为中奖者"/></span>
							 </span> 
							 <span class="button bg-red  js-publish"  style="margin-left: 20px;">
								<span class="button-icon horn"></span>
								<span class="button-name"><ui:i18n key="发布中奖信息"/></span>
							 </span> 
							 <span class="button bg-red  js-cancel"  style="margin-left: 20px;">
								<span class="button-icon cancel"></span>
								<span class="button-name"><ui:i18n key="取消"/></span>
							 </span> 
						</div>
	      			</div>