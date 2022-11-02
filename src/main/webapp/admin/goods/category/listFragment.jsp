<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 

  				<div class="result-data-warp">
  					<table class="result-grid-table">
		      		 <colgroup>
			      		<col width="90px"  />
      		 			<col width="100px" />
      		 			<col width="180px" />
      		 			<col width="1px" />
      		 			<col width="20px" />
      		 			<col width="20px" />
      		 			<col width="10px" />
      		 			<col width="200px" />
      		 			<col width="100px" />
      		 			<col width="189px" />
		      		</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th colspan="3"><ui:i18n key="一级菜单"/></th>
		      		 		<th  colspan="5"><ui:i18n key="二级菜单"/></th>
		      		 		<th><ui:i18n key="区分"/></th>
		      		 		<th><ui:i18n key="操作"/></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody">
			      		 <c:forEach items="${requestScope.oneList}" var="itemsOne" varStatus="status">
				      		<tr>
			      		 		<td colspan="10">
			      		 			<table>
				      		 			<colgroup>
								      		<col width="90px"  />
					      		 			<col width="100px" />
					      		 			<col width="180px" />
					      		 			<col width="1px" />
					      		 			<col width="20px" />
					      		 			<col width="20px" />
					      		 			<col width="10px" />
					      		 			<col width="200px" />
					      		 			<col width="100px" />
					      		 			<col width="189px" />
							      		</colgroup>
			      		 				<tr>
			      		 					<td>
						      		 			<div class="arrow-warp">
							      		 			<c:choose>
						      		 					<c:when test="${status.first}">
						      		 						<div class="arrow-up gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-up"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','','UP');"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 				<c:choose>
						      		 					<c:when test="${status.last}">
						      		 						<div class="arrow-down gray"></div>
						      		 					</c:when>
						      		 					<c:otherwise>
						      		 						<div class="arrow-down"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','','DOWN');"></div>
						      		 					</c:otherwise>
						      		 				</c:choose>
						      		 			</div>
					      		 			</div>
						      		 		</td>
						      		 		<td>${itemsOne.shopGoodsOneNm}</td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="grid-line" </c:if>></td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="level-two-first" </c:if>></td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="grid-line" </c:if>></td>
						      		 		<td <c:if test="${fn:length(itemsOne.subList) > 0}"> class="grid-line" </c:if>></td>
						      		 		<td></td>
						      		 		<td></td>
						      		 		<td>${itemsOne.shopGoodsTypeNm}</td>
						      		 		<td>
						      		 			<c:choose>
													<c:when test="${itemsOne.display eq 'ReStop'}" >
						      		 					<span class="gridbutton red" onclick="javascript:popupPage('${itemsOne.shopGoodsOneId}','','${itemsOne.shopGoodsType}','modify');"><ui:i18n key="编辑"/></span>
						      		 				</c:when>
						      		 				<c:otherwise>
						      		 					<span class="gridbutton red" onclick="alert('<ui:i18n key="无法编辑停用的分类"/>');"><ui:i18n key="编辑"/></span>
						      		 				</c:otherwise>
						      		 			</c:choose>
						      		 			<span class="gridbutton red" onclick="javascript:gcDelete('${itemsOne.shopGoodsOneId}','');"><ui:i18n key="删除"/></span>
						      		 			<c:choose>
													<c:when test="${itemsOne.display eq 'ReStop'}">
														<span class="gridbutton red" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','','restop');">
															<ui:i18n key="停用"/>
														</span>
													</c:when>
													<c:when test="${itemsOne.display eq 'Stop'}">
														<span class="gridbutton red"></span>
													</c:when>
													<c:otherwise>
														<span class="gridbutton green" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','','start');">
															<ui:i18n key="启用"/>
														</span>
													</c:otherwise>
												</c:choose>
						      		 		</td>
			      		 				</tr>
			      		 				<c:forEach items="${itemsOne.subList}" var="itemsTwo" varStatus="status">
				      		 				<c:choose>
				      		 					<c:when test="${status.index!=(itemsOne.listLength-1)}">
						      		 				<tr>
						      		 					<td></td>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td class="level-two-normal"></td>
									      		 		<td class="grid-line"></td>
									      		 		<td>
									      		 			<div class="arrow-warp">
																<c:choose>
									      		 					<c:when test="${status.index==0}">
									      		 						<div class="arrow-up gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-up"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId }','UP');"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 				<c:choose>
									      		 					<c:when test="${status.index==(itemsOne.listLength-1)}">
									      		 						<div class="arrow-down gray"></div>
									      		 					</c:when>
									      		 					<c:otherwise>
									      		 						<div class="arrow-down"  onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId }','DOWN');"></div>
									      		 					</c:otherwise>
									      		 				</c:choose>
									      		 			</div>
									      		 		</td>
									      		 		<td></td>
									      		 		<td class="text-left">${itemsTwo.shopGoodsTwoNm}</td>
									      		 		<td>${itemsTwo.shopGoodsTypeNm}</td>
									      		 		<td>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:popupPage('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','${itemsTwo.shopGoodsType}','modify');"><ui:i18n key="编辑"/></span>
																</c:when>
																<c:when test="${itemsOne.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton red" onclick="alert('<ui:i18n key="无法编辑停用的分类"/>');"><ui:i18n key="编辑"/></span>
																</c:otherwise>
															</c:choose>
															<span class="gridbutton red" onclick="javascript:gcDelete('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}');"><ui:i18n key="删除"/></span>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','restop');"><ui:i18n key="停用"/></span>
																</c:when>
																<c:when test="${itemsTwo.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton green"  onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','start');"><ui:i18n key="启用"/></span>
																</c:otherwise>
															</c:choose>
									      		 		</td>
						      		 				</tr>
						      		 			</c:when>
						      		 			<c:otherwise>
						      		 				<tr class="level-one-last">
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td></td>
									      		 		<td class="level-two-last"></td>
									      		 		<td class="grid-line"></td>
									      		 		<td>
									      		 			<div class="arrow-warp">
									      		 				<div class="arrow-up" onclick="javascript:menuSort('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','UP');"></div>
									      		 				<div class="arrow-down gray"></div>
									      		 			</div>
									      		 		</td>
									      		 		<td></td>
									      		 		<td class="text-left">${itemsTwo.shopGoodsTwoNm}</td>
									      		 		<td>${itemsTwo.shopGoodsTypeNm}</td>
									      		 		<td>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:popupPage('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','${itemsTwo.shopGoodsType}','modify');"><ui:i18n key="编辑"/></span>
																</c:when>
																<c:when test="${itemsOne.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton red" onclick="alert('<ui:i18n key="无法编辑停用的分类"/>');"><ui:i18n key="编辑"/></span>
																</c:otherwise>
															</c:choose>
															<span class="gridbutton red" onclick="javascript:gcDelete('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}');"><ui:i18n key="删除"/></span>
									      		 			<c:choose>
																<c:when test="${itemsTwo.display eq 'ReStop'}">
																	<span class="gridbutton red" onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','restop');"><ui:i18n key="停用"/></span>
																</c:when>
																<c:when test="${itemsTwo.display eq 'Stop'}">
																	<span class="gridbutton red"></span>
																</c:when>
																<c:otherwise>
																	<span class="gridbutton green"  onclick="javascript:dataEdit('${itemsOne.shopGoodsOneId}','${itemsTwo.shopGoodsTwoId}','start');"><ui:i18n key="启用"/></span>
																</c:otherwise>
															</c:choose>
									      		 		</td>
									      		 	</tr>
						      		 			</c:otherwise>
						      		 		</c:choose>
			      		 				</c:forEach>
			      		 			</table>
			      		 		</td>
			      		 	</tr>
			      		 </c:forEach>
		      		 </tbody>
		      	</table>
  				</div>
  				<ui:paging page="${page }" />
