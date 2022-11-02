<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="用户评论管理"/></title>  
<style type="text/css">
 .query-from{font-size:12px;}
 .fcomp input {
	width: 100px;
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
 	text-align: center;
 	width:100%;
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
//分页的查询
function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var lectName = $('#lectName').find('option:selected').val();
	var startDate = $('.dateBegin').val().trim();
	var endDate = $('.dateEnd').val().trim();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="申请日期选择错误"/>');
		return;
	}
	
	var params = {
			startDate : startDate
			,endDate : endDate
			,pageCurr : pageNo
			,pageUnit : pageSize
			,lectId  : lectName
	}
	var url = '/admin/human/reply/replyListFragment.htm';
	 
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


function createExcel(){
	var lectName = $('#lectName').find('option:selected').val();
	var startDate = $('.dateBegin').val().trim();
	var endDate = $('.dateEnd').val().trim();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="申请日期选择错误"/>');
		return;
	}
	if(confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
		window.location.href = '/admin/human/reply/createExcel.htm?lectId=' + lectName + '&startDate=' + startDate + '&endDate=' + endDate;		
	}
}
function deleteReplyMsg(lectReplyId,lectId){
	if(!confirm('<ui:i18n key="您确定删除该评论吗"/>？')){
		return;
	}
	var param = {
					lectReplyId : lectReplyId,
					lectId : lectId
				};
	$.ajax({
		data:param,
		url : '/admin/human/reply/deleteReplyMsg.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		success : function(data){
			if(data.map.OUT_ERR_MSG == 'S'){
				alert('<ui:i18n key="删除成功"/>');
// 				window.location.href = '/admin/human/reply/replyList.htm';
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
			}else{
				alert('<ui:i18n key="停用失败"/>，<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	 });
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
       		 				<select class="select2" style="width:200px;margin-left:-20px;margin-right:20px;" id="lectName">
       		 					<option value=""></option>
       		 					<c:forEach items="${getList }" var="list" varStatus="status">
       		 						<option value="${list.LECT_ID }" <c:if test="${list.LECT_ID == requestScope.lectId}">selected="selected"</c:if>>${list.LECT_NM }</option>
       		 					</c:forEach>
       		 				</select>
       		 				<span style="width:80px;display: inline-block;"><ui:i18n key="申请日期"/>：</span>
       		 				<input type="text" class="dateBegin datepicker calendar" value="${requestScope.beginDate}" /> 
							<span class="connectSpan">~</span> 
							<input type="text" class="dateEnd datepicker calendar" value="${requestScope.endDate }" />
						</td>
					</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button" onclick="showPage(1, 10);">
       		   	  <span class="button-icon search"></span>
       		   	  <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
      	<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				    <span class="result-grid-tool" onclick="createExcel();">
      		   	 	 	<img style="margin-right: 5px;" alt="" src="/admin/images/v2-icons/ico_export.png" /><ui:i18n key="Excel导出"/> 
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" >
		 			<table class="result-grid-table">
			      		<colgroup>
				      		<col width="13%"  />
				      		<col width="15%"  />
		   		 			<col width="13%" />
		   		 			<col width="20%" />
		   		 			<col width="30%" />
		   		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="申请日期"/></th>
			      		 		<th><ui:i18n key="头像"/></th>
			      		 		<th >ID</th>
			      		 		<th><ui:i18n key="演讲标题"/></th>
			      		 		<th><ui:i18n key="评论内容"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 	<c:forEach items="${replylist}" var="list"  varStatus="status"> 
				      		 	<tr>
				      		 		<td  class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			<fmt:formatDate value="${list.CREATE_DT}" pattern="yyyy-MM-dd" />
				      		 		</td>
				      		 		<td class="pic">
				      		 			<img class="pic-small" alt="" src="${list.LECT_REPLY_HEAD }">
				      		 		</td>
				      		 		<td class="td-css">
				      		 			<div style="height:7px;"></div>
				      		 			${list.LECT_REPLY_NM }
				      		 		</td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.LECT_NM }">${list.LECT_NM }</span></td>
				      		 		<td class="td-css"><div style="height:7px;"></div><span class="limit-span" title="${list.REPLY_DESC }">${list.REPLY_DESC }</span></td>
				      		 		<td  class="td-css"><div style="height:7px;"></div>
			      		 				<span class="gridbutton red"  onclick="deleteReplyMsg('${list.LECT_REPLY_ID}','${list.LECT_ID}')"><ui:i18n key="删除"/></span>
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