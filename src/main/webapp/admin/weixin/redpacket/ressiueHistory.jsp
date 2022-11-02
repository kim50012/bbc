<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title> 
</head>
<body>
	<div class="container">
		<div class="query-from" style="border:0;">
       		<div class="form-table" >
       		 	<table class="ftable" style="width: 90%;">
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="OPENID"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="" value="${list[0].RE_OPENID}" 
       		 					readonly="readonly" class="text-width" />
						</td>
       		 			<td class="flabel"><ui:i18n key="昵称"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="" value="${list[0].NICKNAME}" 
       		 					readonly="readonly" class="text-width"/>
						</td>
       		 		</tr>
       		 	</table>
       		</div>
      	</div>
      	<div class="result-grid" >
	     	<div class="js-link-page-grid">
	     		<div class="result-data-warp" >
	     			<table class="result-grid-table" style="width: 600px;margin-left: 30px;">
		      		 	 <colgroup>
				      		<col width="35%"/>
	      		 			<col width="15%"/>
	      		 			<col width="15%"/>
	      		 			<col width="20%"/>
	      		 			<col width="15%"/>
				      	 </colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="商户订单号"/></th>
			      		 		<th><ui:i18n key="关注与否"/></th>
			      		 		<th><ui:i18n key="发送结果"/></th>
			      		 		<th><ui:i18n key="发送日期"/></th>
			      		 		<th><ui:i18n key="错误信息"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
				      		 <c:forEach items="${requestScope.list}" var="item" varStatus="status">
				      		 	<tr>
				      		 		<td>${item.MCH_BILLNO }</td>
				      		 		<td>${item.SUBSCRIBE }</td>
				      		 		<td>${item.RED_PARK_STATUS }</td>
				      		 		<td>${item.SEND_DT }</td>
				      		 		<td>${item.ERR_CODE }</td>
				      		 	</tr>
				      		 </c:forEach>
			      		 </tbody>
			      	</table>
	     		</div>
	     	</div>
     	</div>
     	
	</div>
	
	<!-- ▲ container  -->
	
</body>
</html>