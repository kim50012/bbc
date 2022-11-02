<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <style type="text/css">
 	.span-limit{
 		word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;
 		margin-left:0px;
 		text-align: center;
 		width:98%;
 	}
 </style>
<script type="text/javascript">
$(function(){
	 
	$('.js-show-more').click(function(){
		var item = $(this).data('item');
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		var url = '';
		var name = '';
		
		if(item == '1'){
			url = '/admin/report/custStatus.htm';
			name  = '<ui:i18n key="客户现状统计"/>';
		}else if(item == '2'){
			url = '/admin/report/shop/list.htm';
			name = '<ui:i18n key="微店铺概况"/>';
		}else if(item == '3'){
			url = '/admin/report/goods/goodsSummary.htm';
			name = '<ui:i18n key="商品统计"/>' ;
		}else if(item == '4'){
			url = '/admin/report/order/summary.htm';
			name = '<ui:i18n key="订单概况统计"/>';
		}
		
		url += '?startDate=' + startDate + '&endDate=' + endDate;
		
		parent.ggShowTab({
			url : url ,
			name : name,
			icon : 'data' 
		}); 
	});
	 
});

function query(){
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val(); 
	window.location.href='/admin/report/dataSummary.htm?startDate=' + startDate + '&endDate=' + endDate;
}
</script>

</head>
<body>
	 
	<div class="container">
	
		 <!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="50%" />
	       		 			<col width="" />
	       		 			<col width="" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="日期"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<input type="text" id="startDate" class="w9 datepicker calendar" value="${requestScope.startDate }" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
			  			 	 	<input type="text" id="endDate" class="w9 datepicker calendar" value="${requestScope.endDate }" />
	       		 			</td>
	       		 			<td class="flabel last"></td>
	       		 			<td class="fcomp last"> </td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<!-- -->
	       		<div class="butttn-area m1" >
	       		   <span class="button" onclick="query();">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	
	
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 20px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/v2-icons/icon-person.png">
				<span class="title-name"><ui:i18n key="粉丝增减"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		 
		<div class="clearfix">
			<div class="report-warp">
				 <div class="clearfix">
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_ADD_CUST_NEW gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_ADD_CUST_NEW }</div>
				  	 		<div class="content-type-name"><ui:i18n key="新增粉丝"/></div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_CUST_RUN gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_CUST_RUN }</div>
				  	 		<div class="content-type-name"><ui:i18n key="跑路粉丝"/></div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_ADD_CUST_TRUE gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_ADD_CUST_TRUE }</div>
				  	 		<div class="content-type-name"><ui:i18n key="净增粉丝"/></div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_CUST gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_CUST }</div>
				  	 		<div class="content-type-name"><ui:i18n key="现有总粉丝"/></div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item more js-show-more" data-item="1">
				  	 	<div class="">
				  	 		<div class="content-more"><ui:i18n key="查询更多"/><span class="red"> >></span></div>
				  	 	</div>
				  	 </div>
				  	 
				 </div>
			</div>
		</div>
		
		
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 20px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/v2-icons/icon-grap.png">
				<span class="title-name"><ui:i18n key="店铺流量"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		<div class="clearfix">
			<div class="report-warp">
				 <div class="clearfix" <%-- style="background-color: red;" --%>>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_PV gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_PV }</div>
				  	 		<div class="content-type-name"><ui:i18n key="总点击量"/>(PV)</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_UV gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_UV }</div>
				  	 		<div class="content-type-name"><ui:i18n key="访客数"/>(UV)</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_GOODS_LOOK1 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_GOODS_LOOK1 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.GOODS_NAME1}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.GOODS_NAME1 }">${summary.GOODS_NAME1 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking red">No.1</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_GOODS_LOOK2 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_GOODS_LOOK2 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.GOODS_NAME2}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.GOODS_NAME2 }">${summary.GOODS_NAME2 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking red">No.2</div>
				  	 	</div>
				  	 </div>
				  	   
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_GOODS_LOOK3 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_GOODS_LOOK3 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.GOODS_NAME3}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.GOODS_NAME3 }">${summary.GOODS_NAME3 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking red">No.3</div>
				  	 	</div>
				  	 </div>
				  	   
				  	 <div class="report-item more js-show-more" data-item="2">
				  	 	<div class="">
				  	 		<div class="content-more"><ui:i18n key="查询更多"/><span class="red"> >></span></div>
				  	 	</div>
				  	 </div>
				  	 
				 </div>
			</div>
		</div>
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 20px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/v2-icons/icon-book.png">
				<span class="title-name"><ui:i18n key="畅销商品"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		<div class="clearfix">
			<div class="report-warp">
				 <div class="clearfix" <%-- style="background-color: red;" --%>>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_SALE_GOODS1 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_SALE_GOODS1 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.TOTAL_SALE_GOODSNM1}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.TOTAL_SALE_GOODSNM1 }">${summary.TOTAL_SALE_GOODSNM1 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking dark-green">No.1</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_SALE_GOODS2 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_SALE_GOODS2 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.TOTAL_SALE_GOODSNM2}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.TOTAL_SALE_GOODSNM2 }">${summary.TOTAL_SALE_GOODSNM2 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking dark-green">No.2</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_SALE_GOODS3 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_SALE_GOODS3 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.TOTAL_SALE_GOODSNM3}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.TOTAL_SALE_GOODSNM3 }">${summary.TOTAL_SALE_GOODSNM3 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking dark-green">No.3</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_SALE_GOODS4 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_SALE_GOODS4 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.TOTAL_SALE_GOODSNM4}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.TOTAL_SALE_GOODSNM4 }">${summary.TOTAL_SALE_GOODSNM4 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking dark-green">No.4</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_SALE_GOODS5 gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_SALE_GOODS5 }</div>
				  	 		<div class="content-type-name">
				  	 			<c:choose>
					  	 			<c:when test="${not empty summary.TOTAL_SALE_GOODSNM5}">
						  	 			<div class="content-type-name"><span class="span-limit" title="${summary.TOTAL_SALE_GOODSNM5 }">${summary.TOTAL_SALE_GOODSNM5 }</span></div>
						  	 		</c:when>
						  	 		<c:otherwise>
						  	 			<div class="content-type-name"><ui:i18n key="暂无"/></div>
						  	 		</c:otherwise>
					  	 		</c:choose>
				  	 		</div>
				  	 		<div class="content-type-ranking dark-green">No.5</div>
				  	 	</div>
				  	 </div>
				  	 
				  	 
				  	  <div class="report-item more js-show-more" data-item="3">
				  	 	<div class="">
				  	 		<div class="content-more"><ui:i18n key="查询更多"/><span class="red"> >></span></div>
				  	 	</div>
				  	 </div>
				  	 
				 </div>
			</div>
		</div>
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 20px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/v2-icons/icon-noot.png">
				<span class="title-name"><ui:i18n key="订单概况"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		<div class="clearfix">
			<div class="report-warp">
				 <div class="clearfix" <%-- style="background-color: red;" --%>>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_ORDER_PAYNO gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_ORDER_PAYNO }</div>
				  	 		<div class="content-type-name">
						  		<div class="content-type-name"><ui:i18n key="待付款"/></div>
				  	 		</div>
				  	 		<div class="content-type-ranking red"><ui:i18n key="总合计"/></div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_SEND_WAIT gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_SEND_WAIT }</div>
				  	 		<div class="content-type-name">
						  		<div class="content-type-name"><ui:i18n key="待发货"/></div>
				  	 		</div>
				  	 		<div class="content-type-ranking red"><ui:i18n key="总合计"/></div>
				  	 	</div>
				  	 </div>
				  	 
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_ORDER gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_ORDER }</div>
				  	 		<div class="content-type-name">
						  		<div class="content-type-name"><ui:i18n key="下单数"/></div>
				  	 		</div>
				  	 	</div>
				  	 </div>
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_ORDER_PAY gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_ORDER_PAY }</div>
				  	 		<div class="content-type-name">
						  		<div class="content-type-name"><ui:i18n key="付款数"/></div>
				  	 		</div>
				  	 	</div>
				  	 </div>
				  	 <div class="report-item">
				  	 	<c:choose>
				  	 		<c:when test="${summary.TOTAL_ORDER_SEND gt 0}">
				  	 			<div class="report-type-color bg-red"></div>
				  	 		</c:when>
				  	 		<c:otherwise>
				  	 			<div class="report-type-color bg-gray"></div>
				  	 		</c:otherwise>
				  	 	</c:choose>
				  	 	<div class="report-type-content">
				  	 		<div class="content-type-num">${summary.TOTAL_ORDER_SEND }</div>
				  	 		<div class="content-type-name">
						  		<div class="content-type-name"><ui:i18n key="发货数"/></div>
				  	 		</div>
				  	 	</div>
				  	 </div>
				  	 
				  	  <div class="report-item more js-show-more" data-item="4">
				  	 	<div class="">
				  	 		<div class="content-more"><ui:i18n key="查询更多"/><span class="red"> >></span></div>
				  	 	</div>
				  	 </div>
				  	 
				 </div>
			</div>
		</div>
	 
	</div>
	<!-- ▲ Main container -->
 
	 
</body>
</html>