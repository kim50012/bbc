<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
	<div class="result-data-warp">
		<table class="result-grid-table">
			<colgroup>
 		 		<col width="12%" />
				<col width="20%" />
				<col width="15%" />
				<col width="8%" />
				<col width="9%" />
				<col width="7%" />
				<col width="20%" />
      		</colgroup>
		 	<thead class="result-grid-thead">
			 	<tr>
			 		<th><ui:i18n key="红包名称"/></th>
			 		<th><ui:i18n key="红包详情"/></th>
			 		<th><ui:i18n key="活动期间"/></th>
			 		<th><ui:i18n key="红包金额"/></th>
			 		<th><ui:i18n key="创建日期"/></th>
			 		<th><ui:i18n key="状态"/></th>
			 		<th><ui:i18n key="操作"/></th>
	 		 	</tr>
		 	</thead>
		 	<tbody  class="result-grid-tbody">
			 <c:forEach items="${list}" var="list" varStatus="status">
	      		<tr>
	      			<td >
           				<span class="limit-span" title="${list.ACT_NAME }">${list.ACT_NAME }</span>					
           			</td>
           			<td>
           				<span class="limit-span" title="${list.REMARK }">${list.REMARK }</span>
           			</td>
	      			<td >
	      				<span >${list.ACT_DT_BEGIN }~${list.ACT_DT_END }</span>
	      			</td>
	      			<td >
	      				<span  style="width:140px;">${list.TOTAL_AMOUNT}</span>
	      			</td>
	      			<td >
	      				<span>${list.CREATE_DT}</span>
	      			</td>
	      			
      				<c:choose>
      					<c:when test="${list.RED_PARK_STATUS eq 0 }">
      						<td>
      							<ui:i18n key="待发送"/>
      						</td>
      					</c:when>
      					<c:when test="${list.RED_PARK_STATUS eq 1 }">
      						<td>
      							<ui:i18n key="部分成功"/>
      						</td>
      					</c:when>
      					<c:when test="${list.RED_PARK_STATUS eq 2 }">
      						<td>
      							<ui:i18n key="完成"/>
      						</td>
      					</c:when>
      					<c:when test="${list.RED_PARK_STATUS eq 3 }">
      						<td>
      							<ui:i18n key="发送中"/>
      						</td>
      					</c:when>
      				</c:choose>
 	      			<td style="text-align: left;cursor: pointer;">
					      				<a><span class="gridbutton red" style="display:block;text-align:center;width:55px;float: left;" 
					      						onclick="downloadExcel(${list.ACT_ID})">Excel</span></a>
 					      				<c:choose>
					      					<c:when test="${list.RED_PARK_STATUS eq 0 }">
					      						<a>
					      							<span class="gridbutton red"  style="display:block;text-align:center;width:65px;float: left;"
					      									onclick="openBPoupDiv('UPDATERED','${list.ACT_ID}','','')">
					      								<ui:i18n key="修改"/>
					      							</span>
					      						</a>
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="toSend('${list.SHOP_ID}','${list.ACT_ID}')">
					      								<ui:i18n key="发送"/>
					      							</span>
					      						</a>	
 					      					</c:when>
					      					<c:when test="${list.RED_PARK_STATUS eq 1 }">
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="toViewResults('${list.ACT_ID }')">
					      								<ui:i18n key="查看结果"/>
					      							</span>
					      						</a>
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="openBPoupDiv('resend','','${list.ACT_ID }','${list.RED_PARK_STATUS}')">
					      								<ui:i18n key="失败重发"/>
					      							</span>
					      						</a>	
					      					</c:when>
					      					<c:when test="${list.RED_PARK_STATUS eq 2 }">
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="toViewResults('${list.ACT_ID }')">
					      								<ui:i18n key="查看结果"/>
					      							</span>
					      						</a>
					      					</c:when>
 					      				</c:choose>
 					      			</td>
	       		</tr>
      		</c:forEach>
		 </tbody>
	</table>
	</div>
	<ui:paging page="${page }" />
