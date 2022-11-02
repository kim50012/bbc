<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
				<!-- =============================== -->
<!--    					<table class="result-grid-table"> -->
<!-- 			      	 	<thead class="result-grid-thead"> -->
<!-- 			      		 	<tr> -->
<!-- 			      		 		<th style="width: 120px">菜单分类</th> -->
<!-- 			      		 		<th style="width: 120px">菜单名称</th> -->
<!-- 			      		 		<th style="width: 120px">菜单等级</th> -->
<!-- 			      		 		<th style="width: 200px">URL</th> -->
<!-- 			      		 		<th style="width: 120px">图标</th> -->
<!-- 			      		 		<th style="width: 120px">状态</th> -->
<!-- 			      		 		<th style="width: 200px">操作</th> -->
<!-- 			      		 	</tr> -->
<!-- 			      		 </thead> -->
<!-- 			      		 <tbody  class="result-grid-tbody" > -->
<%-- 				      		 <c:forEach var="list"  items="${menuList }">  --%>
<!-- 				      		 	<tr> -->
<%-- 				      		 		<td style="width: 120px">${list.MENU_PNM }</td> --%>
<%-- 				      		 		<td style="width: 120px">${list.MENU_NM }</td> --%>
<%-- 				      		 		<td style="width: 120px">${list.MENU_LEVEL }</td> --%>
<%-- 				      		 		<td align="left" style="padding-left: 15px;width: 200px;">${list.MENU_URL }</td> --%>
<!-- 				      		 		<td style="width: 120px"> -->
<%-- 				      		 			<img alt="" src="/admin/images/portal/leftnav_${list.MENU_ICON}.png" style="height: 38px"/> --%>
<!-- 				      		 		</td> -->
<!-- 				      		 		<td style="width: 120px"> -->
<%-- 				      		 			<c:if test="${list.ACTIVE_STS==1 }">启用</c:if> --%>
<%-- 				      		 			<c:if test="${list.ACTIVE_STS==0 }">禁用</c:if> --%>
<!-- 				      		 		</td> -->
<!-- 				      		 		<td style="width: 200px"> -->
<%-- 				      		 			<span class="gridbutton green" onclick="menuDetail('${list.MENU_ID }')">编辑</span> --%>
<%-- 				      		 			<c:if test="${list.ACTIVE_STS==1 }"> --%>
<%-- 				      		 				<span class="gridbutton red" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')">禁用</span> --%>
<%-- 				      		 			</c:if> --%>
<%-- 				      		 			<c:if test="${list.ACTIVE_STS==0 }"> --%>
<%-- 				      		 				<span class="gridbutton green" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')">启用</span> --%>
<%-- 				      		 			</c:if> --%>
<!-- 				      		 		</td> -->
<!-- 				      		 	</tr> -->
<%-- 				      		 </c:forEach> --%>
<!-- 			      		 </tbody> -->
<!-- 		      		</table> -->

					<table class="result-grid-table">
			      	 	<thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th style="width: 120px"><ui:i18n key="一级菜单" /></th>
			      		 		<th style="width: 120px"><ui:i18n key="二级菜单" /></th>
			      		 		<th style="width: 120px"><ui:i18n key="三级菜单" /></th>
			      		 		<th style="width: 200px">URL</th>
			      		 		<th style="width: 120px"><ui:i18n key="图标" /></th>
			      		 		<th style="width: 120px"><ui:i18n key="状态" /></th>
			      		 		<th style="width: 200px"><ui:i18n key="操作" /></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody" >
				      		 <c:forEach var="list"  items="${menuList }"> 
				      		 	<tr>
				      		 		<td style="width: 120px">${list.FIRST_MENU_NM }</td>
				      		 		<td style="width: 120px">${list.SECOND_MENU_NM }</td>
				      		 		<td style="width: 120px"><span class="limit-span" title="${list.THIRD_MENU_NM }">${list.THIRD_MENU_NM }</span></td>
				      		 		<td align="left" style="padding-left: 15px;width: 200px;"><span align="left" class="limit-span" title="${list.MENU_URL }">${list.MENU_URL }</span></td>
				      		 		<td style="width: 120px">
				      		 			<c:if test="${currLanguage eq 'ko-KR'}" >
				      		 				<img alt="" src="/admin/images/portal/leftnav_${list.MENU_ICON}2.png" style="height: 38px"/>
				      		 			</c:if>
				      		 			<c:if test="${currLanguage eq 'zh-CN'}" >
				      		 				<img alt="" src="/admin/images/portal/leftnav_${list.MENU_ICON}.png" style="height: 38px"/>
				      		 			</c:if>
				      		 		</td>
				      		 		<td style="width: 120px">
				      		 			<c:if test="${list.ACTIVE_STS == 1 }"><ui:i18n key="启用" /></c:if>
				      		 			<c:if test="${list.ACTIVE_STS == 0 }"><ui:i18n key="禁用" /></c:if>
				      		 		</td>
				      		 		<td style="width: 200px">
				      		 			<span class="gridbutton red" onclick="menuDetail('${list.MENU_ID }')"><ui:i18n key="编辑" /></span>
				      		 			<c:if test="${list.ACTIVE_STS == 1 }">
				      		 				<span class="gridbutton red" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')"><ui:i18n key="禁用" /></span>
				      		 			</c:if>
				      		 			<c:if test="${list.ACTIVE_STS == 0 }">
				      		 				<span class="gridbutton green" onclick="updateStatus('${list.MENU_ID }','${list.ACTIVE_STS}')"><ui:i18n key="启用" /></span>
				      		 			</c:if>
				      		 		</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
		      		</table>
      			</div>
		      	 <ui:paging page="${page }" /> 
		      	 <!-- =============================== -->