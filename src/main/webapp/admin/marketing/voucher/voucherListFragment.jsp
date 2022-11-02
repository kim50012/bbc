<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="140px" />
		      		 			<col width="140px" />
		      		 			<col width="80px" />
		      		 			<col width="80px" />
		      		 			<col width="80px" />
		      		 			<col width="80px" />
		      		 			<col width="150px" />
		      		 			<col width="80px" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="优惠券名称"/></th>
			      		 		<th><ui:i18n key="金额"/>（<ui:i18n key="元"/>）</th>
			      		 		<th><ui:i18n key="发行数量"/></th>
			      		 		<th><ui:i18n key="发放客户数"/></th>
			      		 		<th><ui:i18n key="领取客户数"/></th>
			      		 		<th><ui:i18n key="已使用数"/></th>
			      		 		<th><ui:i18n key="有效期限"/></th>
			      		 		<th><ui:i18n key="状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td><span class="COUPON_NM">${list.COUPON_NM }</span></td>
									<td>
										${list.FACE_VALUE}${label.元}
			           					<br>
			           					<span style="color: #a2a2a2;font-size: 12px">${label.最低订单金额}${list.BUY_AMOUNT}${label.元}</span>
			           				</td>
									<td>${list.CIRCULATION_CNT }</td>
									<td>${list.CUST_CNT }</td>
									<td>${list.RECEIVE_CNT }</td>
									<td>${list.USE_CNT }</td>
									<td>${list.VALIDITY_F_DT}~${list.VALIDITY_T_DT}</td>
									<td>${list.STATUS_NM}</td>
									<td>
						           		<c:choose>
				           					<c:when test="${list.STATUS_ID==1}">
				           						<span class="gridbutton red"  onclick="modifyVoucher(${list.COUPON_ID });"><ui:i18n key="编辑"/></span>
				           					</c:when>
				           					<c:otherwise>
				           						<span class="gridbutton gray"><ui:i18n key="编辑"/></span>
				           					</c:otherwise>
				           				</c:choose>
				           				<c:choose>
				           					<c:when test="${list.STATUS_ID==3 or list.STATUS_ID==4 }">
				           						<c:if test="${list.STATUS_ID==3}">
				           							<span class="gridbutton green" onclick="start('${list.COUPON_ID}');"><ui:i18n key="启用"/></span><br>
				           							<span class="gridbutton gray" ><ui:i18n key="发放优惠券"/></span>
				           						</c:if>
				           						<c:if test="${list.STATUS_ID==4}">
				           							<span class="gridbutton gray" ><ui:i18n key="启用"/></span><br>
				           							<span class="gridbutton gray" ><ui:i18n key="发放优惠券"/></span>
				           						</c:if>
				           					</c:when>
				           					<c:otherwise>
				           						<span class="gridbutton red" onclick="stop('${list.COUPON_ID}');"><ui:i18n key="停用"/></span><br>
				           						<span class="gridbutton red" onclick="toCust('${list.COUPON_ID}','${list.CUST_LEVEL}');"><ui:i18n key="发放优惠券"/></span>
				           					</c:otherwise>
				           				</c:choose>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />