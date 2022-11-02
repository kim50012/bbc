<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="用户申请管理"/></title>  
<style type="text/css">
 
 .query-from{font-size:12px;}
 .dateSelect input {
	width: 85px;
	background-image: url("/admin/images/myFile/calendar.png");
	background-repeat: no-repeat;
	background-position: 90% 50%;
	cursor: pointer;
}

.dateSelect .connectSpan {
	color: #b1263b;
	font-size: 20px;
}
.td-css{
 	vertical-align: top;
 }
 .limit-span{
 	word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;
 	margin-left:0;
 }
 .count-all-div{
 	border:1px solid #eee;
 	width:100%;
 	height:60px;
 	margin-top:30px;
 	line-height:60px;
 	position: relative;
 }
 .count-all-div div{
 	width:33.33%;
 	float:left;
 	height:60px;
 	line-height:60px;
 	text-align: center;
 	font-size:14px;
 }
  .gray{
 	color:#a2a2a2;
 }
</style> 
 
<script type="text/javascript">
$(function(){
	$('.dateBegin').datepicker(); 
	$('.dateEnd').datepicker(); 
});


//分页操作
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}
function queryPage(){
	var lectId = $('#lectName').find('option:selected').val();
	var statusFlag = $('#statusFlag').find('option:selected').val();
	var startDate = $('.dateBegin').val().trim();
	var endDate = $('.dateEnd').val().trim();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	window.location.href = '/admin/human/apply/applyList.htm?lectId=' + lectId + '&statusFlag=' + statusFlag + '&startDate=' + startDate + '&endDate=' + endDate;
}
//分页的查询
function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var lectId = $('#lectName').find('option:selected').val();
	var statusFlag = $('#statusFlag').find('option:selected').val();
	var startDate = $('.dateBegin').val().trim();
	var endDate = $('.dateEnd').val().trim();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="申请日期选择错误"/>');
		return;
	}
	
	var params = {
			lectId : lectId
			,statusFlag : statusFlag
			,startDate : startDate
			,endDate : endDate
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/human/apply/applyListFragment.htm';
	 
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
function modifyApplyMsg(entryId,statusFlag,lectId,openId,seatNum){
	var msg = '';
	if(statusFlag == 'S'){
		msg += '<ui:i18n key="您确定批准该申请吗"/>？';
	}else{
		msg += '<ui:i18n key="您确定拒绝该申请吗"/>？';
	}
	if(!confirm(msg)){
		return;
	}
	var param = {
					entryId : entryId,
					statusFlag : statusFlag,
					lectId : lectId,
					openId : openId,
					seatNum : seatNum
				};
	$.ajax({
		data : param,
		url : '/admin/human/apply/saveApply.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		success : function(data){
			if(data.map.OUT_ERR_MSG == 'S'){
				alert('<ui:i18n key="操作成功"/>');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
// 				window.location.href = '/admin/human/apply/applyList.htm';
			}else{
				alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			bpoupMsg('error: ' + msg);
		}
	});
}

function createExcel(statusFlag){
	if(confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
		window.location.href = '/admin/human/apply/createExcel.htm?statusFlag='+statusFlag;		
	}
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="140px" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="演讲题目"/>：</td>
       		 			<td class="fcomp">
       		 				<%-- <input type="text" style="width: 215px;margin-left:-20px;margin-right:20px;" id="lectName" value="${requestScope.lectName }" /> --%>
       		 				<select class="select2" style="width:235px;margin-left:-20px;margin-right:20px;" id="lectName">
       		 					<option value=""></option>
       		 					<c:forEach items="${getList }" var="list" varStatus="status">
       		 						<option value="${list.LECT_ID }" <c:if test="${list.LECT_ID == requestScope.lectId}">selected="selected"</c:if>>${list.LECT_NM }</option>
       		 					</c:forEach>
       		 				</select>
       		 				<span style="width:80px;display: inline-block;"><ui:i18n key="申请状态"/>：</span>
       		 				<select class="select2" style="width:220px;text-align:left; "  id="statusFlag">
								<!-- <option value="" >全部</option> -->
								<option value="A" <c:if test="${requestScope.statusFlag eq 'A' }"> selected="selected"</c:if>><ui:i18n key="全部申请"/></option>
								<option value="I" <c:if test="${requestScope.statusFlag eq 'I' }"> selected="selected"</c:if>><ui:i18n key="等待中"/></option>
								<option value="S" <c:if test="${requestScope.statusFlag eq 'S' }"> selected="selected"</c:if>><ui:i18n key="已批准"/></option>
								<option value="F" <c:if test="${requestScope.statusFlag eq 'F' }"> selected="selected"</c:if>><ui:i18n key="已拒绝"/></option>
							</select>
						</td>
					</tr>
					<tr>
       		 			<td class="flabel"><ui:i18n key="申请日期"/>：</td>
       		 			<td class="fcomp dateSelect">
       		 				<input type="text" class="dateBegin datepicker calendar" style="margin-left:-20px;" value="${requestScope.startDate}" /> 
							<span class="connectSpan">~</span> 
							<input type="text" class="dateEnd datepicker calendar" value="${requestScope.endDate }" />
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m2" >
       		   <span class="button" onclick="queryPage();">
       		   	  <span class="button-icon search"></span>
       		   	  <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
      	<div class="count-all-div">
      		<div><ui:i18n key="全部申请数"/>：${requestScope.countAll }(${requestScope.sumAll }<ui:i18n key="人"/>)</div>
			<div><ui:i18n key="预计发送数"/>：${requestScope.countApply }(${requestScope.sumApply }<ui:i18n key="人"/>)</div>
			<div><ui:i18n key="发送完成数"/>：${requestScope.countSuccess }(${requestScope.sumSuccess }<ui:i18n key="人"/>)</div>
      	</div>
      	<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				    <span class="result-grid-tool" onclick="createExcel('A');">
      		   	 	 	<img style="margin-right: 5px;" alt="" src="/admin/images/v2-icons/ico_export.png" /><ui:i18n key="Excel导出"/>（<ui:i18n key="总申请人员"/>） 
      		   		</span>
      		   		<span class="result-grid-tool" style="margin-left:20px;" onclick="createExcel('S');">
      		   	 	 	<img style="margin-right: 5px;" alt="" src="/admin/images/v2-icons/ico_export.png" /><ui:i18n key="Excel导出"/>（<ui:i18n key="发送人员"/>）
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" >
		 			<table class="result-grid-table">
			      		<colgroup>
				      		<col width="90px"  />
				      		<col width="90px"  />
		   		 			<col width="60px" />
		   		 			<col width="90px" />
		   		 			<col width="50px" />
		   		 			<col width="70px" />
		   		 			<col width="120px" />
		   		 			<col width="140px" />
		   		 			<col width="65px" />
		   		 			<col width="65px" />
		   		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="申请日期"/></th>
			      		 		<th><ui:i18n key="头像"/></th>
			      		 		<th >ID</th>
			      		 		<th><ui:i18n key="姓名"/></th>
			      		 		<th><ui:i18n key="年龄"/></th>
			      		 		<th><ui:i18n key="职业"/></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="原因"/></th>
			      		 		<th><ui:i18n key="申请人数"/></th>
			      		 		<th><ui:i18n key="申请状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${list}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td  class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			<fmt:formatDate value="${list.CREATED_DT}" pattern="yyyy-MM-dd" />
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.HEAD_IMG_URL }">
				      		 		</td>
				      		 		<td class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			${list.ENTRY_ID }
				      		 		</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.ENTRY_NM }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.AGE }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.JOB_NM }</td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.LECT_NM }">${list.LECT_NM }</span></td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.APPLY_REASON }">${list.APPLY_REASON }</span></td>
				      		 		<td class="td-css"><div style="height:7px;"></div>${list.SEAT_NUM }</td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
			      		 				<c:if test="${list.STATUS_FLAG == 'I'}">
			      		 					<ui:i18n key="等待中"/>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'F'}">
			      		 					<ui:i18n key="已拒绝"/>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'S'}">
			      		 					<ui:i18n key="已批准"/>
			      		 				</c:if>
				      		 		</td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
				      		 			<c:if test="${list.STATUS_FLAG == 'I'}">
			      		 					<span class="gridbutton red"  onclick="modifyApplyMsg('${list.ENTRY_ID}','S','${list.LECT_ID}','${list.OPEN_ID	 }','${list.SEAT_NUM}');"><ui:i18n key="批准"/></span>
				      		 				<span class="gridbutton red"  onclick="modifyApplyMsg('${list.ENTRY_ID}','F','${list.LECT_ID}','${list.OPEN_ID	 }','${list.SEAT_NUM}');"><ui:i18n key="拒绝"/></span>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'F'}">
			      		 					<span class="gridbutton gray"  ><ui:i18n key="批准"/></span>
				      		 				<span class="gridbutton gray"  ><ui:i18n key="拒绝"/></span>
			      		 				</c:if>
			      		 				<c:if test="${list.STATUS_FLAG == 'S'}">
			      		 					<span class="gridbutton gray" ><ui:i18n key="批准"/></span>
				      		 				<span class="gridbutton gray" ><ui:i18n key="拒绝"/></span>
			      		 				</c:if>
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
	<!-- ▲ container  -->
</body>
</html>