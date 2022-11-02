<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="咨询问题管理"/></title>
<style type="text/css">
.text1{
	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	width: 200px;
}

</style>

<script type="text/javascript">

//分页
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}
//查询
function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);

	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var date1 = (new Date(startDate)).getTime();
	var date2 = (new Date(endDate)).getTime();
	if(date1 > date2){
		alert('<ui:i18n key="查询时间错误"/>！');
		return;
	}
	var lectId=$('#title').val();

	var params = {
			lectId : lectId
			,startDt : startDate
			,endDt : endDate
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/human/question/questionListFragment.htm';
	 
	 var $this = $('.result-grid.pic');	
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
function ggDoDownload(action, params){
	
	console.log('action=' + action);
	console.log('params=');
	console.log(params);
	
	// 创建Form  
    var form = $('<form></form>');  
 	// 设置属性  
    form.attr('action', action);  
    form.attr('method', 'POST');  
    
    for(var key in params){
        form.append($('<input type="text" name="' + key + '" value="' + params[key] + '" />'));  
   	}
	console.log(form.html());
    form.appendTo(document.body).submit().remove();
	
}
function exportExcel(){
	if(window.confirm('<ui:i18n key="您确定要导出Excel吗"/>?')){
		var lectId=$('#title').val();
		var startDate = $('#startDate').val().trim();
		var endDate = $('#endDate').val().trim();
		
		var params = {
				lectId : lectId
				,startDt : startDate
				,endDt : endDate
		}
		
		var url = ' /admin/human/question/createExcel.htm';
		
		ggDoDownload(url,params);
	}
}

</script>
</head>

<body>
	<!-- ▼ Main container -->
	<div class="container">
	
		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="30%" />
	       		 			<col width="15%" />
	       		 			<col width="40%" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="演讲题目"/>：</td>
	    		 			<td class="fcomp">
	     		 				<select class="select2" id="title" style="width: 220px">				
									<option value=""></option>		
									<c:forEach items="${list1 }" var="list1">
	     		 					<option value="${list1.LECT_ID }"> ${list1.LECT_NM }</option>
	     		 					</c:forEach>				
								</select>
	    		 			</td>
	    		 			<td class="flabel"><ui:i18n key="咨询日期"/>：</td>
	    		 			<td class="fcomp">
		     		 			<input  value="${requestScope.startDt }" type="text" id="startDate" style="width:100px;" class="w100 datepicker calendar" autocomplete="off" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input value="${requestScope.endDt}" style="width:100px;" type="text" id="endDate" class="w100 datepicker calendar" autocomplete="off"/>
	    		 			</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<!-- -->
	       		<div class="butttn-area m1" >
	       		   <span class="button" onclick="search();">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
	  		
			<div class="result-grid pic" style="margin-top: 50px;">
			
				<div class="result-grid-header">
	   				<div class="result-grid-tools">
	   				   <span class="result-grid-tool" onclick="exportExcel();">
	      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
	      		   		</span>
	   				</div>
	   			</div>
				
				<table class="result-grid-table">
					 <colgroup>
							<col width="120px" />
							<col width="100px" />
							<col width="100px" />
							<col width="100px" />
							<col width="190px" />
							<col width="100px" />
							<col width="200px" />
					</colgroup>
					 <thead class="result-grid-thead">
					 	<tr>
					 		<th><ui:i18n key="头像"/></th>
					 		<th><ui:i18n key="ID"/></th>
					 		<th><ui:i18n key="姓名"/></th>
					 		<th><ui:i18n key="年龄"/></th>
					 		<th><ui:i18n key="演讲题目"/></th>
					 		<th><ui:i18n key="咨询日期"/></th>
					 		<th><ui:i18n key="咨询内容"/></th>
					 	</tr>
					 </thead>
					 <tbody  class="result-grid-tbody">
					 <c:forEach items="${list }" var="list" varStatus="status"> 
					 	<tr>
					 		<td class="pic">
					 			<img alt="" src="${list.WX_IF_HEADIMGURL}" class="pic-small" onclick="openChatWindow('${list.CUST_SYS_ID}');">
					 		</td>
					 		<td>${list.CUST_NICK_NM}</td>
					 		<td>${list.ENTRY_NM}</td>
					 		<td>${list.AGE}</td>
					 		<td>${list.LECT_NM}</td>
					 		<td>${list.CREATE_DT}</td>
					 		<td class="text1" title="${list.REPLY_DESC}">${list.REPLY_DESC}</td>
					 	</tr>
					 </c:forEach>
					 </tbody>
				</table>
				
				<ui:paging page="${page }" />
			</div>
		<!-- end详细数据 --> 
	</div>
	<!-- ▲ Main container -->
	

</body>
</html>