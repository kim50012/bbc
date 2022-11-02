<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 

   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
				      		<col width="70px"  />
				      		<col width="90px"  />
				      		<col width="160px"  />
	     		 			<col width="270px" />
	     		 			<col width="180px" />
	     		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="排序编号"/></th>
			      		 		<th></th>
			      		 		<th><ui:i18n key="商品名称"/></th>
			      		 		<th><ui:i18n key="标准分类"/>-<ui:i18n key="第一级"/>><ui:i18n key="第二级"/>><ui:i18n key="第三级"/></th>
			      		 		<th><ui:i18n key="店铺个性分类"/>-<ui:i18n key="第一级"/>><ui:i18n key="第二级"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${goodsList}" var="list"  varStatus="status"> 
				      		 	<c:if test="${list.IS_MAIN==1 }">
					      		 	<tr>
					      		 		<td>
					      		 			<table class="index-set-table">
				           						<tr>
				           							<td rowspan="2" style="width:30%;text-align: right;border:0;">
				           								<%-- <c:if test="${requestScope.first!=list.SORT_NO }">
				           									<img class="index-first-img" src="/admin/images/goodsDisplay/list_top.png" data-displayId="${list.DISPLAY_ID }"/>
				           								</c:if>
				           								<c:if test="${list.SORT_NO==requestScope.first }"> --%>
				           									<img style="margin-right:5px;"  src="/admin/images/goodsDisplay/list_top2.png"/>
				           								<%-- </c:if> --%>
				           							</td>
				           							<td style="width:10%;border:0;vertical-align: bottom;">
				           								<%-- <c:if test="${requestScope.first!=list.SORT_NO }">
				           									<img  class="index-before-img" src="/admin/images/goodsClass/main_redup.png" data-displayId="${list.DISPLAY_ID }"/>
				           								</c:if> 
				           								<c:if test="${list.SORT_NO==requestScope.first }">--%>
				           									<img style="margin-top:10px;"  src="/admin/images/goodsClass/main_up.png"/>
				           								<%-- </c:if> --%>
				           							</td>
				           							<td rowspan="2" style="width:60%;text-align: left;border:0;">
				           								<span class="index-num-span">${list.SORT_NO }</span>
				           							</td>
				           						</tr>
				           						<tr>
				           							<td style="border:0;vertical-align: top;">
				           								<%-- <c:if test="${requestScope.last!=(list.SORT_NO) }">
				           									<img  class="index-next-img" src="/admin/images/goodsClass/main_reddown.png" data-displayId="${list.DISPLAY_ID }"/>
				           								</c:if>
				           								<c:if test="${requestScope.last==(list.SORT_NO) }"> --%>
				           									<img style="margin-top:-10px;"  src="/admin/images/goodsClass/main_down.png"/>
				           								<%-- </c:if> --%>
				           							</td>
				           						</tr>
				           					</table>
					      		 		</td>
					      		 		<td class="pic">
					      		 			<img class="pic-small" alt="" src="${list.GOODS_LIST_IMG_URL }">
					      		 		</td>
					      		 		<td class="td-css"  style="text-align: left;vertical-align: top;padding-left:5px;"><div style="height:7px;"></div>
					      		 			<span class="goods-name-limit">${list.GOODS_NM}</span>
					      		 			<input type="hidden" value="${list.GOODS_ID }" id="goodsId${list.DISPLAY_ID}"/>
					      		 		</td>
					      		 		<td class="td-css"><div style="height:7px;"></div>${list.GOODS_CLASS_NM }</td>
					      		 		<td class="td-css"><div style="height:7px;"></div>${list.SHOP_GOODS_CLASS_NM }</td>
					      		 		<td  class="td-css"><div style="height:7px;"></div>
					      		 			<span class="gridbutton red"  onclick="modifyGoods(${list.DISPLAY_ID });"><ui:i18n key="编辑"/></span>
					      		 			<span class="gridbutton red"  onclick="displayCopy('${list.DISPLAY_ID }');"><ui:i18n key="复制"/></span>
											<span class="gridbutton red"  onclick="bPoupDivDisplay(${list.DISPLAY_ID});"><ui:i18n key="下架"/></span>
											<br><span class="gridbutton gray"  onclick="updateMainGoods(1);"><ui:i18n key="主页展示"/></span>
					      		 		</td>
					      		 	</tr>
					      		 </c:if>
				      		 </c:forEach>
			      		 	<c:forEach items="${goodsList}" var="list"  varStatus="status"> 
				      		 	<c:if test="${list.IS_MAIN==0 }">
					      		 	<tr>
					      		 		<td>
					      		 			<table class="index-set-table">
				           						<tr>
				           							<td rowspan="2" style="width:30%;text-align: right;border:0;">
				           								<c:if test="${requestScope.first!=list.SORT_NO }">
				           									<img class="index-first-img" src="/admin/images/goodsDisplay/list_top.png" data-displayId="${list.DISPLAY_ID }"/>
				           								</c:if>
				           								<c:if test="${list.SORT_NO==requestScope.first }">
				           									<img style="margin-right:5px;"  src="/admin/images/goodsDisplay/list_top2.png"/>
				           								</c:if>
				           							</td>
				           							<td style="width:10%;border:0;vertical-align: bottom;">
				           								<c:if test="${requestScope.first!=list.SORT_NO }">
				           									<img  class="index-before-img" src="/admin/images/goodsClass/main_redup.png" data-displayId="${list.DISPLAY_ID }"/>
				           								</c:if>
				           								<c:if test="${list.SORT_NO==requestScope.first }">
				           									<img style="margin-top:10px;"  src="/admin/images/goodsClass/main_up.png"/>
				           								</c:if>
				           							</td>
				           							<td rowspan="2" style="width:60%;text-align: left;border:0;">
				           								<span class="index-num-span">${list.SORT_NO }</span>
				           							</td>
				           						</tr>
				           						<tr>
				           							<td style="border:0;vertical-align: top;">
				           								<c:if test="${requestScope.last!=(list.SORT_NO) }">
				           									<img  class="index-next-img" src="/admin/images/goodsClass/main_reddown.png" data-displayId="${list.DISPLAY_ID }"/>
				           								</c:if>
				           								<c:if test="${requestScope.last==(list.SORT_NO) }">
				           									<img style="margin-top:-10px;"  src="/admin/images/goodsClass/main_down.png"/>
				           								</c:if>
				           							</td>
				           						</tr>
				           					</table>
					      		 		</td>
					      		 		<td class="pic">
					      		 			<img class="pic-small" alt="" src="${list.GOODS_LIST_IMG_URL }">
					      		 		</td>
					      		 		<td class="td-css"  style="text-align: left;vertical-align: top;padding-left:5px;"><div style="height:7px;"></div>
					      		 			<span class="goods-name-limit">${list.GOODS_NM}</span>
					      		 			<input type="hidden" value="${list.GOODS_ID }" id="goodsId${list.DISPLAY_ID}"/>
					      		 		</td>
					      		 		<td class="td-css"><div style="height:7px;"></div>${list.GOODS_CLASS_NM }</td>
					      		 		<td class="td-css"><div style="height:7px;"></div>${list.SHOP_GOODS_CLASS_NM }</td>
					      		 		<td  class="td-css"><div style="height:7px;"></div>
					      		 			<span class="gridbutton red"  onclick="modifyGoods(${list.DISPLAY_ID });"><ui:i18n key="编辑"/></span>
					      		 			<span class="gridbutton red"  onclick="displayCopy('${list.DISPLAY_ID }');"><ui:i18n key="复制"/></span>
											<span class="gridbutton red"  onclick="bPoupDivDisplay(${list.DISPLAY_ID});"><ui:i18n key="下架"/></span>
											<br><span class="gridbutton red"  onclick="updateMainGoods(0,${list.GOODS_ID},${list.DISPLAY_ID });"><ui:i18n key="主页展示"/></span>
					      		 		</td>
					      		 	</tr>
					      		 </c:if>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />
	     	