<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>


			<div class="qunfa">
				<span onclick="qunfa();"><img alt="" src="/admin/images/cust/icon_message.png" style="margin:-3px 10px 0px 0px;"><span style="margin-right:20px;"><ui:i18n key="群发信息"/></span></span>
				<span onclick="ShowDivSelGrades();"><img alt="" src="/admin/images/cust/grade_01.png" style="margin:-3px 10px 0px 0px;"><span style="margin-right:20px;"><ui:i18n key="设等级"/></span></span>
				<span onclick="ShowDivSelPoints();"><img alt="" src="/admin/images/cust/integral_01.png" style="margin:-3px 10px 0px 0px;"><span style="margin-right:20px;"><ui:i18n key="给积分"/></span></span>
			</div>
	      	<table class="result-grid-table">
	      		<colgroup>
		      		<col width="60px" />
		      		<col width="70px" />
		      		<col width="80px" />
    		 		<col width="70px" />
    		 		<col width="50px" />
    		 		<col width="80px" />
    		 		<col width="80px" />
    		 		<col width="80px" />
    		 		<col width="70px" />
    		 		<col width="80px" />
    		 		<col width="160px" />
	      		</colgroup>
	      		 <thead class="result-grid-thead">
	      		 	<tr>
	      		 		<th class="chk"><input class="iccheckbox" type="checkbox" name="checkall" id="checkall">&nbsp;&nbsp;<ui:i18n key="全部选择"/></th>
	      		 		<th><ui:i18n key="粉丝"/></th>
	      		 		<th></th>
	      		 		<th><ui:i18n key="等级"/></th>
	      		 		<th><ui:i18n key="积分"/></th>
	      		 		<th><ui:i18n key="关注时间"/></th>
	      		 		<th><ui:i18n key="最后对话时间"/></th>
	      		 		<th><ui:i18n key="最后购买时间"/></th>
	      		 		<th><ui:i18n key="购买次数"/></th>
	      		 		<th><ui:i18n key="购买均价"/></th>
	      		 		<th><ui:i18n key="操作"/></th>
	      		 	</tr>
	      		 </thead>
	      		 <tbody  class="result-grid-tbody">
	      		 <c:forEach items="${custSel}" var="cust">
	      		 	<tr>
	      		 		<td class="chk">
	      		 			<input type="checkbox" id="subcheck" class="iccheckbox" name="subcheck" value="${cust.CUST_SYS_ID }"/>
	      		 			<input type="hidden" value="${cust.CUST_SYS_ID }"/>
           					<input type="hidden" value="${cust.SHOP_ID}"/>
           					<input type="hidden" value="${cust.GRADE_ID}"/>
           					<input type="hidden" value="${cust.CUST_POINT}" id="custPoint"/>
           					<input type="hidden" value="${cust.WX_IF_OPENID_P}" id="WX_IF_OPENID_P"/>	
           					<input type="hidden" value="${cust.GRADE_NM}" id="GRADE_NM"/>    
           					<input type="hidden" value="${cust.PUR_TIMES}" id="PUR_TIMES"/>
           					<input type="hidden" value="${cust.PRICE_SUM}" id="PRICE_SUM"/> 
           					<input type="hidden" value="${cust.SUBSCRIBE}" id="SUBSCRIBE"/>
	      		 		</td>
	      		 		<td class="pic" style="padding-left: 0;padding-right: 0;text-align: left">
	      		 			<c:choose>
								<c:when test="${cust.SUBSCRIBE eq 0 }">
									<img alt="" src="${cust.WX_IF_HEADIMGURL }" class="pic-small" style="width: 66px;height: 66px">
		      		 			</c:when>
		      		 			<c:otherwise>
		      		 				<img alt="" src="${cust.WX_IF_HEADIMGURL }" class="pic-small" onclick="openChatWindow('${cust.CUST_SYS_ID}');" style="width: 66px;height: 66px">
								</c:otherwise>
							</c:choose>	
	      		 		</td>
	      		 		<td style="text-align: left;">
	      		 			<span class="custNickNm" id="CUST_NICK_NM" title="${cust.CUST_NICK_NM }" onclick="openChatWindow('${cust.CUST_SYS_ID}');">${cust.CUST_NICK_NM }</span>
	      		 		</td>
	      		 		<td>${cust.GRADE_NM }</td>
	      		 		<td>${cust.CUST_POINT }</td>
	      		 		<td>
	      		 			<c:choose>
           						<c:when test="${cust.SUBSCRIBE_TIME == null}">
           							无
           						</c:when>
           						<c:otherwise>
           							${cust.SUBSCRIBE_TIME}
           						</c:otherwise>
	           				</c:choose>
	      		 		</td>
	      		 		<td>
	      		 			<c:choose>
           						<c:when test="${cust.RECEIVE_DT == null}">
           							无
           						</c:when>
           						<c:otherwise>
           							${cust.RECEIVE_DT }
           						</c:otherwise>
           					</c:choose>
	      		 		</td>
	      		 		<td>
	      		 			<c:choose>
           						<c:when test="${cust.LAST_PUR_DT == null}">
           							无
           						</c:when>
           						<c:otherwise>
           							${cust.LAST_PUR_DT }
           						</c:otherwise>
           					</c:choose>
	      		 		</td>
	      		 		<td>${cust.PUR_TIMES }</td>
	      		 		<td>${cust.GOODS_PRICE_AVG }</td>
	      		 		<c:choose>
							<c:when test="${cust.SUBSCRIBE eq 0 }">
	      		 				<td style="pointer-events:none;opacity:0.2;">
	      		 					<span class="gridbutton red" onclick="ShowDivSelGrade('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.GRADE_ID}','${cust.WX_IF_OPENID_P }','${cust.PUR_TIMES }','${cust.PRICE_SUM }');"><ui:i18n key="设等级"/></span>								
									<span class="gridbutton red" onclick="ShowDivSelPoint('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.CUST_POINT }','${cust.WX_IF_OPENID_P }');""><ui:i18n key="给积分"/></span>
									<span class="gridbutton red" onclick="openChatWindow('${cust.CUST_SYS_ID}')"><ui:i18n key="聊天记录"/></span>
	      		 				</td>
	      		 			</c:when>
	      		 			<c:otherwise>
								<td>
	      		 					<span class="gridbutton red" onclick="ShowDivSelGrade('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.GRADE_ID}','${cust.WX_IF_OPENID_P }','${cust.PUR_TIMES }','${cust.PRICE_SUM }');"><ui:i18n key="设等级"/></span>								
									<span class="gridbutton red" onclick="ShowDivSelPoint('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.CUST_POINT }','${cust.WX_IF_OPENID_P }');""><ui:i18n key="给积分"/></span>
									<span class="gridbutton red" onclick="openChatWindow('${cust.CUST_SYS_ID}')"><ui:i18n key="聊天记录"/></span>
	      		 				</td>		
							</c:otherwise>
						</c:choose>		
	      		 	</tr>
	      		 </c:forEach>
	      		 </tbody>
	      	</table>
	      	
	      	<ui:paging page="${page }" />