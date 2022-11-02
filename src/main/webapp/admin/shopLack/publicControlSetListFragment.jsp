<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
	<table class="result-grid-table">
      		<colgroup>
     		 			<col width="11%" />
     		 			<col width="11%" />
     		 			<col width="45%" />
     		 			<col width="11%" />
     		 			<col/>
     		 		</colgroup>
      		 <thead class="result-grid-thead">
      		 	<tr>
      		 		<th><ui:i18n key="排序"/></th>
      		 		<th><ui:i18n key="页面ID"/></th>
      		 		<th><ui:i18n key="公告页面名称"/></th>
      		 		<th><ui:i18n key="生成日期"/></th>
      		 		<th><ui:i18n key="操作"/></th>
      		 	</tr>
      		 </thead>
      		 <tbody  class="result-grid-tbody">
      			<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td>
							<table class="index-set-table">
           						<tr>
           							<td rowspan="2" style="width:40%;text-align: right;border:0;">
           								<c:if test="${requestScope.first!=list.SORT_NO }">
           									<img class="index-first-img" src="/admin/images/goodsDisplay/list_top.png" data-pageId="${list.PAGE_ID }"/>
           								</c:if>
           								<c:if test="${list.SORT_NO==requestScope.first }">
           									<img style="margin-right:5px;"  src="/admin/images/goodsDisplay/list_top2.png"/>
           								</c:if>
           							</td>
           							<td style="border:0;vertical-align: bottom;text-align: left;">
           								<c:if test="${requestScope.first!=list.SORT_NO }">
           									<img  class="index-before-img" src="/admin/images/goodsClass/main_redup.png" data-pageId="${list.PAGE_ID }"/>
           								</c:if>
           								<c:if test="${list.SORT_NO==requestScope.first }">
           									<img style="margin-top:10px;"  src="/admin/images/goodsClass/main_up.png"/>
           								</c:if>
           							</td>
           							<%-- <td rowspan="2" style="width:60%;text-align: left;border:0;">
           								<span class="index-num-span">${list.SORT_NO }</span>
           							</td> --%>
           						</tr>
           						<tr>
           							<td style="border:0;vertical-align: top;text-align: left;">
           								<c:if test="${requestScope.last!=(list.SORT_NO) }">
           									<img  class="index-next-img" src="/admin/images/goodsClass/main_reddown.png" data-pageId="${list.PAGE_ID }"/>
           								</c:if>
           								<c:if test="${requestScope.last==(list.SORT_NO) }">
           									<img style="margin-top:-10px;"  src="/admin/images/goodsClass/main_down.png"/>
           								</c:if>
           							</td>
           						</tr>
           					</table>
						</td>
						<td>${list.PAGE_ID}</td>
						<td class="js-grid-gc-nm">${list.PAGE_NM}</td>
						<td class="js-grid-gexing-nm">${list.CREATED_DT} </td>
						<td class="js-grid-gexing-nm">
							<span class="gridbutton red"  onclick="modifyPublic(${list.PAGE_ID });"><ui:i18n key="编辑"/></span>
							<span class="gridbutton red"  onclick="previewPublic('${list.URL_PC}',${list.PAGE_ID });"><ui:i18n key="预览"/></span>
							<span class="gridbutton red" onclick="deletePublic(${list.PAGE_ID });"><ui:i18n key="删除"/></span>
						</td>
					</tr>
				</c:forEach> 
      		 </tbody>
      	</table>
	</div>
		      	
		      	 <ui:paging page="${page }" />