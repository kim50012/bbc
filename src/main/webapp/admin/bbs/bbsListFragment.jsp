<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 

  				<div class="result-data-warp">
  					<table class="result-grid-table">
		      	 	<thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th style="width:8%;">BBS ID</th>
		      		 		<th style="width:8%;">BBS<ui:i18n key="原文" />ID</th>
		      		 		<th style="width:10%;">BBS<ui:i18n key="类型" /></th>
		      		 		<th style="width:13%;">BBS<ui:i18n key="题目" /></th>
		      		 		<th style="width:25%;">BBS<ui:i18n key="内容" /></th>
		      		 		<th style="width:10%;"><ui:i18n key="提交人" /></th>
		      		 		<th style="width:10%;"><ui:i18n key="提交日期" /></th>
		      		 		<th style="width:8%;">BBS<ui:i18n key="状态" /></th>
		      		 		<th style="width:8%;"><ui:i18n key="操作" /></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody" >
			      		<c:forEach items="${list }" var="list">
			           		<tr style="border-bottom: 1px solid #d6d6d6">
			           			<td style="text-align: center">
			           				${list.BBS_ID } 
			           			</td>
			           			<td style="text-align: center">
			           				${list.BBS_PARENT_ID }
			           			</td>
			           			<td style="text-align: center">
			           				${list.CD_DESC }
			           			</td>
			           			<td style="text-align: center;padding-left: 10px;padding-right: 10px">
			           				<span class="title" title="${list.TITLE }">${list.TITLE }</span>
			           			</td>
			           			<td style="text-align: center;padding-left: 10px;padding-right: 10px">
			           				<span class="body" title="${list.BODY }">${list.BODY }</span>
			           			</td>
			           			<td style="text-align: center;padding-left: 10px;padding-right: 10px">
			           				${list.WX_IF_NICK_NM }
			           			</td>
			           			<td style="text-align: center">
			           				${list.CREATE_DT }
			           			</td>
				           			<c:choose>
				           				<c:when test="${list.BBS_STS eq 2}">
				           					<td style="text-align: center">
				           						<ui:i18n key="生成"/>
				           					</td>
				           				</c:when>
				           				<c:when test="${list.BBS_STS eq 3}">
				           					<td style="text-align: center">
				           						<ui:i18n key="已屏蔽"/>
				           					</td>
				           				</c:when>
				           				<%-- <c:otherwise>
				           					<td style="text-align: center">
				           						已确认
				           					</td>
				           				</c:otherwise> --%>
				           			</c:choose>
			           			<td style="text-align: center">
			           				<c:choose>
			           					<c:when test="${list.BBS_STS eq 2}">
			           						<span class="gridbutton red" onclick="javascript:jujue('${list.BBS_ID }',3);"><ui:i18n key="屏蔽" /></span>
			           					</c:when>	
			           					<c:otherwise>
			           						<span class="gridbutton green" onclick="javascript:huanyuan('${list.BBS_ID }',2);"><ui:i18n key="还原" /></span>
			           					</c:otherwise>
			           				</c:choose>
<%-- 			           				<span class="gridbutton red" onclick="javascript:void();"><ui:i18n key="详情" /></span> --%>
			           			</td>
			           		</tr>
		           		</c:forEach>
		      		 </tbody>
	      		</table>
  				</div>
  				<ui:paging page="${page }" />
