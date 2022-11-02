<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="红包查询"/></title>

<style type="text/css">

.title {
/*  	text-overflow: -o-ellipsis-lastline; */
/* 	overflow: hidden; */
/* 	text-overflow: ellipsis; */
/* 	display: -webkit-box; */
/* 	-webkit-line-clamp: 1; */
/* 	-webkit-box-orient: vertical; */
/* 	width: 100%; */
/* display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis; */
}
.calendar {width: 100px;}
</style>
<script type="text/javascript">
$(function(){
	$('.result-grid-tool').click(function(){
		var createdDateFrom = $('#createdDateFrom').val();
		var createdDateTo = $('#createdDateTo').val();
		var date1 = new Date(createdDateFrom);
		var date2 = new Date(createdDateTo);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		var nickName = $('#nickName').val();
		var redParkStatus = $('#redParkStatus').val();
		//window.location.href = '/admin/report/createNoteExcel.htm?startDate='+createdDateFrom+'&endDate='+createdDateTo+'&mobile='+mobile+'&sendStatus='+sendStatus;
		if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
			var url = '/admin/report/createpacketExcel.htm';
			var params = {
					startDate : createdDateFrom
					,endDate : createdDateTo
					,nickName : nickName
					,redParkStatus : redParkStatus
			}
			ggFormSubmit(url,params);
			
		}
	});
});

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var createdDateFrom = $('#createdDateFrom').val();
	var createdDateTo = $('#createdDateTo').val();
	var date1 = new Date(createdDateFrom);
	var date2 = new Date(createdDateTo);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	var nickName = $('#nickName').val();
	var redParkStatus = $('#redParkStatus').val();
	var params = {
			startDate : createdDateFrom
			,endDate : createdDateTo
			,nickName : nickName
			,redParkStatus : redParkStatus
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/report/packetQueryListFragment.htm';
	 
	var $this = $('.js-grid-content');	
	$this.showLoading();
	$this.load(url , params ,  function(){ 
	 $this.find('.select2').select2({
		 minimumResultsForSearch:5
		 ,allowClear: true 
	 }); 
	 $('.pic-small').hover(function(){
	     	var $this = $(this);
	     	var offset = $this.offset();
	     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
	      	$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
	     	 $('body').append($div);
	      },function(){
	      	$('.js-show-big-pic').remove();
	      } 
	  );
	 $this.hideLoading();
	});
	 
}
</script>
<body>
	<div class="container">
		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="40%" />
	       		 			<col width="15%" />
	       		 			<col width="30%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="日期"/>：</td>
	       		 			<td class="fcomp">
		       		 			<input type="text" id="createdDateFrom" class="datepicker calendar"  value="${requestScope.createdDateFrom}" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input type="text" id="createdDateTo" class="datepicker calendar" value="${requestScope.createdDateTo}" />
	       		 			</td>
	       		 			<td class="flabel"><ui:i18n key="客户昵称"/>：</td>
	       		 			<td class="fcomp">
		       		 			<input value="${requestScope.nickName }" autocomplete="off" id="nickName" style="width:180px;" type="text"/>
	       		 			</td>
	       		 		</tr>
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="发送状态"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<select id="redParkStatus" class="select2 rightSelect" style="width: 91.3%;" data-placeholder="">
									<option value="" <c:if test="${requestScope.sendStatus==''}">selected="selected"</c:if> ><ui:i18n key="全部"/></option>
									<option value="2" <c:if test="${requestScope.sendStatus == 2}">selected="selected"</c:if> ><ui:i18n key="发送成功"/></option>
									<option value="1" <c:if test="${requestScope.sendStatus == 1}">selected="selected"</c:if> ><ui:i18n key="发送失败"/></option>
								</select>
	       		 			</td>
	       		 			<td class="flabel last"></td>
	       		 			<td class="fcomp last">
							</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		
	       		<div class="butttn-area m2" onclick="javascript:searchData();">
	       		   <span class="button">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	      	
	      	<div class="result-grid pic" style="margin-top: 50px;">
		      	<div class="result-grid-header">
	   				<div class="result-grid-tools js-excel">
	   				   <span class="result-grid-tool">
	      		   	 	 	<img alt="" src="/admin/images/v2-icons/ico_export.png" />
						  	 <span class="tool-name"><ui:i18n key="批量导出"/></span> 
	      		   		</span>
	   				</div>
	   			</div>
	   			<div class="js-grid-content">
		   			<div class="result-data-warp">
			   			<table class="result-grid-table">
			      		 	<colgroup>
		      		 			<col width="100px" />
		       		 			<col width="110px" />
		       		 			<col width="180px" />
		       		 			<col width="110px" />
		       		 			<col width="60px" />
		       		 			<col width="60px" />
		       		 			<!-- <col width="90px" />
		       		 			<col width="90px" /> -->
		       		 			<col width="90px" />
		       		 			<col width="90px" />
		       		 			<col/>
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="客户头像"/></th>
			      		 		<th><ui:i18n key="客户昵称"/></th>
			      		 		<th><ui:i18n key="商户订单号"/></th>
			      		 		<th><ui:i18n key="商户名称"/></th>
			      		 		<th><ui:i18n key="付款金额"/></th>
			      		 		<th><ui:i18n key="发送状态"/></th>
			      		 		<th><ui:i18n key="错误信息"/></th>
			      		 		<th><ui:i18n key="IP地址"/></th>
			      		 		<%-- <th><ui:i18n key="活动名称"/></th>
			      		 		<th><ui:i18n key="备注"/></th> --%>
			      		 		<th><ui:i18n key="创建时间"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			 <c:forEach items="${list}" var="list" varStatus="status">
				           		<tr>
				           			<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.CUST_IMG_URL }">
				      		 		</td>
				           			<td >
				           				<span class="title" title="${list.CUST_NICK }">${list.CUST_NICK }</span>					
				           			</td>
				           			<td>
				           				<span class="title" title="${list.MCH_BILLNO }" style="width:141px;">${list.MCH_BILLNO }</span>
				           			</td>
				           			<td >
				           				<span class="title" title="${list.SEND_NAME }" >${list.SEND_NAME }</span>
				           			</td>
				           			<td >
				           				<%-- <span class="title" >${list.MSG_ID}${list.MSG_ID}</span> --%>
				           				<span class="title" style="width:70px;" title="${list.TOTAL_AMOUNT }">${list.TOTAL_AMOUNT}</span>
				           			</td>
				           			<td >
				           				<span class="title" title="${list.RED_PARK_STATUS_NM }">${list.RED_PARK_STATUS_NM}</span>
				           			</td>
				           			<td >
				           				<span class="title" title="${list.ERR_CODE }">${list.ERR_CODE}</span>	
				           			</td>
				           			<td>
				           				<span class="title" title="${list.CLIENT_IP }">${list.CLIENT_IP}</span>
				           			</td>
				           			<%-- <td>
				           				<span class="title" title="${list.ACT_NAME }">${list.ACT_NAME }</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.REMARK }">${list.REMARK }</span>
				           			</td> --%>
				           			<td>
				           				<span><fmt:formatDate value="${list.CREATE_DT }" pattern="yyyy-MM-dd" /></span>
				           			</td>
				           		</tr>
				           	</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
	   			  <ui:paging page="${page }" />
	   			</div>
   			</div>
	</div>
</body>
</html>