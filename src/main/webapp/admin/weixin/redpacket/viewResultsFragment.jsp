<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 



		<div class="result-grid" style="margin-top: 10px">
		  		<div class="js-grid-content" style="height: 50px">
		 			<div class="result-data-warp" style="">
		 				
		 				<table class="result-grid-table">
				      		<colgroup>
		      		 			<col width="25%" />
		      		 			<col width="25%" />
		      		 			<col/>
		      		 			<col width="8%" />
		      		 			<col width="8%" />
		      		 			<col width="13%" />
		      		 			<col width="8%" />
<!-- 		      		 			<col width="6%" /> -->
<!-- 		      		 			<col width="15%" /> -->
			      		 	</colgroup>
				      		 <thead class="result-grid-thead">
				      		 	<tr>
				      		 		<th><ui:i18n key="OPENID"/></th>
				      		 		<th><ui:i18n key="商户订单号"/></th>
				      		 		<th><ui:i18n key="昵称"/></th>
				      		 		<th><ui:i18n key="关注与否"/></th>
				      		 		<th><ui:i18n key="发送结果"/></th>
				      		 		<th><ui:i18n key="发送日期"/></th>
				      		 		<th><ui:i18n key="补发次数"/></th>
<%-- 				      		 		<th><ui:i18n key="补发结果"/></th> --%>
<%-- 				      		 		<th><ui:i18n key="补发日期"/></th> --%>
				      		 	</tr>
				      		 </thead>
			      		</table>
			      		
		 			</div> 
		     	</div>
	     	
		     	<div class="js-grid-content" style="height: 200px;overflow: auto;padding-right: 5px">
		 			<div class="result-data-warp">
		 				<table class="result-grid-table">
				      		<colgroup>
		      		 			<col width="25%" />
		      		 			<col width="25%" />
		      		 			<col/>
		      		 			<col width="8%" />
		      		 			<col width="8%" />
		      		 			<col width="13%" />
		      		 			<col width="8%" />
<!-- 		      		 			<col width="6%" /> -->
<!-- 		      		 			<col width="15%" /> -->
			      		 	</colgroup>
				      		 <tbody  class="result-grid-tbody">	
				      		 	<c:forEach items="${list }" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td onclick="sendHist('${list.RESSIUE_TIME}','${list.RE_OPENID }')" 
					      		 			onmouseover="mouseover('${status.index }','${list.RESSIUE_TIME}')" 
					      		 			onmouseout="mouseout('${status.index }')"
					      		 			id="openId${status.index }">
					      		 			${list.RE_OPENID }
					      		 		</td>
					      		 		<td class="">${list.MCH_BILLNO }</td>
					      		 		<td class="nickName">${list.NICKNAME }</td>
					      		 		<td class="subscribe">${list.SUBSCRIBE }</td>
					      		 		<td class="result">${list.RED_PARK_STATUS }</td>
					      		 		<td class="sendDate">${list.SEND_DT }</td>
					      		 		<td class="">${list.RESSIUE_TIME }</td>
<%-- 					      		 		<td class="bufaResult">${list.REISSUE }</td> --%>
<%-- 					      		 		<td class="bufaSendDate">${list.RESEND_DT }</td> --%>
					      		 	</tr>
				      		 	</c:forEach>
				      		 </tbody>
			      		</table>
		 			</div> 
		     	</div>
	     	</div>
	     	
	     	<hr>
	     	
	     	<!-- ▼标题 -->
			<div class="clearfix" style="margin-top: 10px">
				<div class="title-warp">
					<img alt="" src="/admin/images/redPacket/fasongjieguo.png" style="margin-bottom: 9px">
					<span class="title-name"><ui:i18n key="发送结果"/></span>
				</div>
			</div>
			<!-- ▲标题 -->
			
			<!-- ▼ 查询表单区域  --> 
	       <div class="query-from" style="border-left: 0;border-right: 0;margin: 10px 0">
	       	<div class="form-table" style="width: 100%">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="14%" />
       		 			<col width="11%" />
       		 			<col width="14%" />
       		 			<col width="11%" />
       		 			<col width="12%" />
       		 			<col width="13%" />
       		 			<col width="13%" />
       		 			<col width="12%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="发送成功总数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number" style="color:#3473dd">
       		 					${requestScope.number.SUSSCESS }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="补发成功数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number" style="color:#3473dd">
       		 					${requestScope.number.REISSUE_SUCCESS }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="发送失败总数"/>：</td>
       		 			<td class="fcomp last" >
       		 				<div class="number" style="color:#d1102d">
       		 					${requestScope.number.FAIL }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="名"/>)
       		 				</div>
       		 			</td>
       		 			<td class="flabel last"><ui:i18n key="补发失败数"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number"  style="color:#d1102d">
       		 					${requestScope.number.REISSUE_FAIL }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="ming"/>)
       		 				</div>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="flabel last"><ui:i18n key="实际发送总金额"/>：</td>
       		 			<td class="fcomp last">
       		 				<div class="number"  style="color:#3473dd">
       		 					${requestScope.number.SEND_MONEY }
       		 				</div>
       		 				<div class="danwei">
       		 					(<ui:i18n key="元"/>)
       		 				</div>
       		 			</td>
       		 			<td colspan="6"></td>
       		 		</tr>
       		 	</table>
       		</div>
	      	</div>
		  	<!-- ▲ 查询表单区域  -->
		  	
		  	
		  	<div class="navi-button-area" style="width:100%;margin: 15px 0 10px 0" >
	  			<span class="btn-step js-btn-load" onclick="window.location.href='/admin/wx/redpacket/redPackItem.htm?actId=${requestScope.actId}'"><span><ui:i18n key="确认"/></span></span>
	  			<span class="btn-step js-btn-load" style="margin-left: 20px" onclick="window.location.href='/admin/wx/redpacket/redPackItem.htm?actId=${requestScope.actId}'"><span><ui:i18n key="返回"/></span></span>
	  		</div> 
	  		
	  		<div class="warning">
	  			<div>
	  				<span style="color:#d1102d">*</span> 
	  				<ui:i18n key="目前微信接口未提供实际向客户发送成功与否的结果值，以及“过期未领退款”等特殊情况的反馈值，该页面仅用于显示提交给微信服务器的操作结果。"/>
	  			</div>
	  			<div style="margin-left: 1px">
	  				&nbsp;&nbsp;<ui:i18n key="显示的发送结果与金额可能与实际情况不一致，必要时请前往微信支付商户平台再次确认"/>。
	  			</div>
	  		</div>