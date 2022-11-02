<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>



		<div class="result-grid-header" style="margin-right: 10px">
 			<div class="result-grid-tools">
 				<span class="result-grid-tool" onclick="exportExcelCust();">
    		   	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
    		   	</span>
 			</div>
		</div>
 		<div class="js-grid-content" style="width: 94%;margin-left: 3%;height: 50px">
 			<div class="result-data-warp" style="height: 50px">
 				<table class="result-grid-table">
		      		<colgroup>
	      		 			<col width="10%" />
	      		 			<col width="12%" />
	      		 			<col width="9%" />
	      		 			<col width="9%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="10%" />
	      		 			<col width="10%" />
	      		 	</colgroup>
	      		 	<thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th><ui:i18n key="粉丝"/></th>
		      		 		<th></th>
		      		 		<th><ui:i18n key="等级"/></th>
		      		 		<th><ui:i18n key="积分"/></th>
		      		 		<th><ui:i18n key="关注时间"/></th>
		      		 		<th><ui:i18n key="最后对话"/></th>
		      		 		<th><ui:i18n key="最后购买"/></th>
		      		 		<th><ui:i18n key="购买次数"/></th>
		      		 		<th><ui:i18n key="购买均价"/></th>
		      		 	</tr>
	      			</thead>
	      		</table>
	      	</div>
	      	
	      </div>	
	     <div class="js-grid-content sex" style="width: 92%;margin-left: 4%;height: 250px;overflow: auto;padding-right: 5px">
 			<div class="result-data-warp">
	      		<table class="result-grid-table">
	      			<colgroup>
	      		 			<col width="10%" />
	      		 			<col width="12%" />
	      		 			<col width="9%" />
	      		 			<col width="9%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="10%" />
	      		 			<col width="10%" />
	      		 	</colgroup>
	      		 	
	      		 	<tbody  class="result-grid-tbody">
	      		 	<c:forEach items="${list}" var="list">
		      		 	<tr>
		      		 		<td class="pic" style="padding-left: 0;padding-right: 0;text-align: left">
		          				<img alt="" src="${list.WX_IF_HEADIMGURL }" style="width:60px;height:60px;border:1px solid #eeeeee;vertical-align: top;cursor: pointer;">	
          					</td>
          					<td style="text-align: left">
          						<span style="width:80px;white-space:nowrap; text-overflow:ellipsis;overflow: hidden; display:inline-block;" id="CUST_NICK_NM">${list.CUST_NICK_NM }</span>
          					</td>
		        			<td>
		        				${list.GRADE_NM }
		        			</td>
		          			<td>
		          				${list.CUST_POINT }
		          			</td>
		          			<td style="padding-left: 10px">
		          				<c:choose>
		          					<c:when test="${list.SUBSCRIBE_TIME == null}">
		          						无
		          					</c:when>
		          					<c:otherwise>
		          						${list.SUBSCRIBE_TIME}
		          					</c:otherwise>
		           				</c:choose>
		          			</td>
		          			<td style="padding-left: 10px">
		          				<c:choose>
		          					<c:when test="${list.RECEIVE_DT == null}">
		          						无
		          					</c:when>
		          					<c:otherwise>
		          						${list.RECEIVE_DT }
		          					</c:otherwise>
		           				</c:choose>
		          			</td>
		          			<td style="padding-left: 15px">
		          				<c:choose>
		          					<c:when test="${list.LAST_PUR_DT == null}">
		          						无
		          					</c:when>
		          					<c:otherwise>
		          						${list.LAST_PUR_DT }
		          					</c:otherwise>
		           				</c:choose>
		          			</td>
		          			<td style="padding-left: 20px">
		          				${list.PUR_TIMES }
		          			</td>
		          			<td style="padding-left: 20px">
		          				${list.GOODS_PRICE_AVG }
		          			</td> 
		      		 	</tr>
	      		 	</c:forEach>
	      			</tbody>
	      		</table>
 			</div>
    	</div> 
    	<ui:paging page="${page }" />