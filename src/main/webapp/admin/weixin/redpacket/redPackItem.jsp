<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="红包履历"/></title>

<style type="text/css">

.butttn-area {
    float: right;
    margin-left: 10px;
    padding-right: 20px;
    width: 130px;
    border-left: 1px solid #eeeeee;
    vertical-align: middle;
    text-align: right;
    margin-top: 10px;
}

.calendar {width: 100px;}
 .limit-span{
 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;
 	margin-left:0;
 	width:90%;
 	text-align: left;
 	padding-left:10%;
 }
</style>
<script type="text/javascript">
$(function(){
	$('#createdDateTo').val('${endDate}');
	$('#createdDateFrom').val('${startDate}');
});



function downloadExcel(actId){
 	if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
		var url = 'admin/wx/redpacket/createRedPackListExcelByActId.htm';
		var params = {
				actId : actId
		}
		ggFormSubmit(url,params);
	}
 
}

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
   	var sendStatus = $('#sendStatus').val();
	var params = {
			startDate : createdDateFrom
			,endDate : createdDateTo
			,sendStatus : sendStatus
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/wx/redpacket/redPackItemFragment.htm';
	 
	var $this = $('.js-grid-content');	
	$this.showLoading();
	$this.load(url , params ,  function(){ 
	 $this.find('.select2').select2({
		 minimumResultsForSearch:5
		 ,allowClear: true 
	 }); 
	 $this.hideLoading();
	});
	 
}

function openBPoupDiv(type,param1,param2,param3){
	
	var src = '';
	var poupName = '';
	if(type == 'ADDRED'){
		src = '/admin/wx/redpacket/importPacketObject.htm?actId='+param1;
		poupName = '<ui:i18n key="新建红包"/>';
	}else if(type == 'UPDATERED'){
		src = '/admin/wx/redpacket/importPacketObject.htm?actId='+param1;
		poupName = '<ui:i18n key="修改红包"/>';
		
	}else if(type == 'resend'){
		src = '/admin/wx/redpacket/failedResend.htm?shopId='+param1+'&redpacketId='+param2+'&sendStatus='+param3;
		poupName = '<ui:i18n key="失败重发"/>';
	}
	$('.bpopupTitle.js-title').text(poupName);
	$('#iframe_import_Object').attr('src',src);
	showIframeBpopupWindow({
		id : 'bpoupMessage',
		width : 700,
		height :540,
		action : $('#iframe_import_Object').attr('src')
	}); 
}
function closePoupDivImport(){
	$('#bpoupMessage').bPopup().close();
}
function closePoupDivImportReload(){
	$('#bpoupMessage').bPopup().close();
	searchData();
}
function showLoad(){
	var $this = $('#bpoupMessage');
	$this.showLoading();
}
function closeLoad(){
	var $this = $('#bpoupMessage');
	$this.hideLoading();
}

function closeResendWindow(){
	closeBpopupWindow('bpoupMessage');
	var pageCurr = Number($('#currentPage').find('option:selected').val());
	var pageUnit = Number($('#pageUnit').find('option:selected').val());
	query(pageCurr,pageUnit);
}

function toSend(shopId,actId){
	$('#iframe').attr('src','/admin/wx/redpacket/send.htm?shopId='+shopId+'&actId='+actId);    
	showBpopup({
		id : 'bpoupImgDiv',
		width : 700
	});

}
function closeSend(){
	$('#ifrPage').attr('src','');
	$('#bpoupImgDiv').bPopup().close(); 
}
function toRedPackItem(){
	window.location.href='/admin/wx/redpacket/redPackItem.htm';
}
function toViewResults(actId){
	window.location.href='/admin/wx/redpacket/viewResults.htm?actId='+actId;
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
	       		 			<td class="flabel"><ui:i18n key="创建日期"/>：</td>
	       		 			<td class="fcomp">
		       		 			<input type="text" id="createdDateFrom" class="datepicker calendar"  value="" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input type="text" id="createdDateTo" class="datepicker calendar" value="" />
	       		 			</td>
 	       		 			<td class="flabel last" ><ui:i18n key="红包状态"/>：</td>
	       		 			<td class="fcomp last">
	       		 				<select id="sendStatus" class="select2 rightSelect" style="width: 91.3%;" data-placeholder="">
	       		 					<option value="" <c:if test=""></c:if> ><ui:i18n key="全部"/></option>
									<option value="0" ><ui:i18n key="待发送"/></option>
									<option value="3" <c:if test=""></c:if> ><ui:i18n key="发送中"/></option>
									<option value="1" <c:if test=""></c:if> ><ui:i18n key="部分成功"/></option>
									<option value="2" <c:if test=""></c:if> ><ui:i18n key="完成"/></option>
								</select>
	       		 			</td>
  	       		 		</tr>
	       		 	</table>
	       		</div>
	       		
	       		<div class="butttn-area" onclick="javascript:searchData();">
	       		   <span class="button">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	      	
	      	<div class="result-grid" style="margin-top: 50px;">
		      	<div class="result-grid-header">
	   				<div class="result-grid-tools js-excel">
	   				   <span class="result-grid-tool"   onclick="openBPoupDiv('ADDRED','','','')">
	      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" />
						  	 <span class="tool-name"><ui:i18n key="新建"/></span> 
	      		   		</span>
	   				</div>
	   			</div>
	   			<div class="js-grid-content">
		   			<div class="result-data-warp">
			   			<table class="result-grid-table">
			      		 	<colgroup>
		      		 			<col width="12%" />
								<col width="20%" />
								<col width="15%" />
								<col width="8%" />
								<col width="9%" />
								<col width="7%" />
								<col width="20%" />
				      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="红包名称"/></th>
			      		 		<th><ui:i18n key="红包详情"/></th>
			      		 		<th><ui:i18n key="活动期间"/></th>
			      		 		<th><ui:i18n key="红包金额"/></th>
			      		 		<th><ui:i18n key="创建日期"/></th>
			      		 		<th><ui:i18n key="状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
 			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			 <c:forEach items="${list}" var="list" varStatus="status">
				           		<tr>
				           			<td >
				           				<span class="limit-span" title="${list.ACT_NAME }">${list.ACT_NAME }</span>					
				           			</td>
				           			<td>
				           				<span class="limit-span" title="${list.REMARK }">${list.REMARK }</span>
				           			</td>
				           			<td >
				           				<span >${list.ACT_DT_BEGIN }~${list.ACT_DT_END }</span>
				           			</td>
				           			<td >
				           				<span  style="width:140px;">${list.TOTAL_AMOUNT}</span>
				           			</td>
				           			<td >
				           				<span>${list.CREATE_DT}</span>
				           			</td>
				           			<c:choose>
				      					<c:when test="${list.RED_PARK_STATUS eq 0 }">
				      						<td>
				      							<ui:i18n key="待发送"/>
				      						</td>
				      					</c:when>
				      					<c:when test="${list.RED_PARK_STATUS eq 1 }">
				      						<td>
				      							<ui:i18n key="部分成功"/>
				      						</td>
				      					</c:when>
				      					<c:when test="${list.RED_PARK_STATUS eq 2 }">
				      						<td>
				      							<ui:i18n key="完成"/>
				      						</td>
				      					</c:when>
				      					<c:when test="${list.RED_PARK_STATUS eq 3 }">
				      						<td>
				      							<ui:i18n key="发送中"/>
				      						</td>
				      					</c:when>
				      				</c:choose>
				      				<td style="text-align: left;cursor: pointer;">
					      				<a><span class="gridbutton red" style="display:block;text-align:center;width:55px;float: left;" 
					      						onclick="downloadExcel(${list.ACT_ID})">Excel</span></a>
 					      				<c:choose>
					      					<c:when test="${list.RED_PARK_STATUS eq 0 }">
					      						<a>
					      							<span class="gridbutton red"  style="display:block;text-align:center;width:65px;float: left;"
					      									onclick="openBPoupDiv('UPDATERED','${list.ACT_ID}','','')">
					      								<ui:i18n key="修改"/>
					      							</span>
					      						</a>
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="toSend('${list.SHOP_ID}','${list.ACT_ID}')">
					      								<ui:i18n key="发送"/>
					      							</span>
					      						</a>	
 					      					</c:when>
					      					<c:when test="${list.RED_PARK_STATUS eq 1 }">
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="toViewResults('${list.ACT_ID }')">
					      								<ui:i18n key="查看结果"/>
					      							</span>
					      						</a>
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="openBPoupDiv('resend','','${list.ACT_ID }','${list.RED_PARK_STATUS}')">
					      								<ui:i18n key="失败重发"/>
					      							</span>
					      						</a>	
					      					</c:when>
					      					<c:when test="${list.RED_PARK_STATUS eq 2 }">
					      						<a>
					      							<span class="gridbutton red" style="display:block;text-align:center;width:65px;float: left;"
					      									 onclick="toViewResults('${list.ACT_ID }')">
					      								<ui:i18n key="查看结果"/>
					      							</span>
					      						</a>
					      					</c:when>
 					      				</c:choose>
 					      			</td>
 				           		</tr>
				           	</c:forEach>
			      		 </tbody>
			      	</table>
			      </div>
	   			  <ui:paging page="${page }" />
	   			</div>
   			</div>
   			  <!-- ▼ bpopup area -->
				<div class="bpopup2" id="bpoupMessage" >
				 	<div class="bpopupWarp">
				 		 <div class="bpopupHeaderWarp">
							<h3 class="bpopupTitle js-title"><ui:i18n key="新建红包"/></h3>
							<div class="bpopupColseWarp">
								<img class="b-close" src="/admin/images/goodsSell/close.png" />
							</div>
						</div>
				 		 <div class="bpopupContentWarp"> 
				 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_import_Object"  style="overflow: hidden;" src="/admin/wx/redpacket/importPacketObject.htm"></iframe>
				 		 </div>
				 	</div>
				</div>
			<!-- ▲ bpopup area -->
			
			<!-- ▼弹出发送弹出框 -->
			<div class="bpopup2" id="bpoupImgDiv">
				<div class="bpopupWarp">
					<div class="bpopupHeaderWarp">
						<h3 class="bpopupTitle js-title"><ui:i18n key="确认及发送"/></h3>
						<div class="bpopupColseWarp">
							<img class="b-close" src="/admin/images/goodsSell/close.png" />
						</div>
					</div>
					<div class="bpopupContentWarp"> 
						<iframe class="js-content-iframe" style="margin-bottom: -4px" id="iframe" width="700" height="230" frameBorder=0 scrolling=yes  src="/admin/wx/redpacket/send.htm"></iframe>
					</div>
				</div>
			</div>
			<!-- ▲ 弹出发送弹出框 -->
	</div>
</body>
</html>