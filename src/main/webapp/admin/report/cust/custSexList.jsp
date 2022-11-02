<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%>  
<style type="text/css">
 
 /****for test ****/
 .container {
  box-sizing: border-box;
   width: 850px;  
   height:420px;
   margin-left: auto;
   margin-right: auto;
 /*   background-color: #fff; */
  }
 /****for test ****/
 .bodyDiv{
	width:850px;
	height:420px;
	position: relative;
}
</style> 

<script type="text/javascript">

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
//保存表单内容(性别)
function exportExcelCust(_this){
	if(window.confirm("<ui:i18n key='您确定要导出Excel吗'/>"+"？")){
		var startDate = '${startDate}';
		var endDate = '${endDate}';
		var wx_if_sex_id = '${wx_if_sex_id}';
		var jobType = '${jobType}';
		var params = {
				startDate : startDate
				,endDate : endDate
				,wx_if_sex_id : wx_if_sex_id
				,jobType : jobType
		} 
		var url = '/admin/report/cust/createExcelCustSex.htm';
		
		ggDoDownload(url,params);
	}
} 
//分页
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var startDate = '${startDate}';
	var endDate = '${endDate}';
	var wx_if_sex_id = '${wx_if_sex_id}';
	var jobType = '${jobType}';
	var params = {
			startDate : startDate
			,endDate : endDate
			,wx_if_sex_id : wx_if_sex_id
			,jobType : jobType
			,pageCurr : pageNo
			,pageUnit : pageSize
	} 
	var url = '/admin/report/cust/custSexListFragment.htm';
	 
	 var content = $('.result-grid.pic');
	 content.showLoading();
	 content.load(url , params ,  function(){ 
		 content.find('.select2').select2({
			 minimumResultsForSearch : 5
			 ,allowClear : true 
		 });	
		content.hideLoading();
	 });
}
</script> 
</head>
<body>
	<!-- ▼ Main container --> 
<div class="container">
	<div class="result-grid pic" style="margin-top: 50px;height:370px">
		<div class="result-grid-header" style="margin-right: 10px">
 			<div class="result-grid-tools">
 				<span class="result-grid-tool" onclick="exportExcelCust();">
    		   	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
    		   	</span>
 			</div>
		</div>
 		<div class="js-grid-content" style="width: 94%;margin-left: 3%;height: 50px">
 			<div class="result-data-warp" style="height: 50px">
 				<table class="result-grid-table">
		      		<colgroup>
	      		 			<col width="10%" />
	      		 			<col width="12%" />
	      		 			<col width="9%" />
	      		 			<col width="9%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="10%" />
	      		 			<col width="10%" />
	      		 	</colgroup>
	      		 	<thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th><ui:i18n key="粉丝"/></th>
		      		 		<th></th>
		      		 		<th><ui:i18n key="等级"/></th>
		      		 		<th><ui:i18n key="积分"/></th>
		      		 		<th><ui:i18n key="关注时间"/></th>
		      		 		<th><ui:i18n key="最后对话"/></th>
		      		 		<th><ui:i18n key="最后购买"/></th>
		      		 		<th><ui:i18n key="购买次数"/></th>
		      		 		<th><ui:i18n key="购买均价"/></th>
		      		 	</tr>
	      			</thead>
	      		</table>
	      	</div>
	      	
	      </div>	
	     <div class="js-grid-content sex" style="width: 92%;margin-left: 4%;height: 250px;overflow: auto;padding-right: 5px">
 			<div class="result-data-warp">
	      		<table class="result-grid-table">
	      			<colgroup>
	      		 			<col width="10%" />
	      		 			<col width="12%" />
	      		 			<col width="9%" />
	      		 			<col width="9%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="13%" />
	      		 			<col width="10%" />
	      		 			<col width="10%" />
	      		 	</colgroup>
	      		 	
	      		 	<tbody  class="result-grid-tbody">
	      		 	<c:forEach items="${list}" var="list">
		      		 	<tr>
		      		 		<td class="pic" style="padding-left: 0;padding-right: 0;text-align: left">
		          				<img alt="" src="${list.WX_IF_HEADIMGURL }" style="width:60px;height:60px;border:1px solid #eeeeee;vertical-align: top;cursor: pointer;">	
          					</td>
          					<td style="text-align: left">
          						<span style="width:80px;white-space:nowrap; text-overflow:ellipsis;overflow: hidden; display:inline-block;" id="CUST_NICK_NM">${list.CUST_NICK_NM }</span>
          					</td>
		        			<td>
		        				${list.GRADE_NM }
		        			</td>
		          			<td>
		          				${list.CUST_POINT }
		          			</td>
		          			<td style="padding-left: 10px">
		          				<c:choose>
		          					<c:when test="${list.SUBSCRIBE_TIME == null}">
		          						无
		          					</c:when>
		          					<c:otherwise>
		          						${list.SUBSCRIBE_TIME}
		          					</c:otherwise>
		           				</c:choose>
		          			</td>
		          			<td style="padding-left: 10px">
		          				<c:choose>
		          					<c:when test="${list.RECEIVE_DT == null}">
		          						无
		          					</c:when>
		          					<c:otherwise>
		          						${list.RECEIVE_DT }
		          					</c:otherwise>
		           				</c:choose>
		          			</td>
		          			<td style="padding-left: 15px">
		          				<c:choose>
		          					<c:when test="${list.LAST_PUR_DT == null}">
		          						无
		          					</c:when>
		          					<c:otherwise>
		          						${list.LAST_PUR_DT }
		          					</c:otherwise>
		           				</c:choose>
		          			</td>
		          			<td style="padding-left: 20px">
		          				${list.PUR_TIMES }
		          			</td>
		          			<td style="padding-left: 20px">
		          				${list.GOODS_PRICE_AVG }
		          			</td> 
		      		 	</tr>
	      		 	</c:forEach>
	      			</tbody>
	      		</table>
 			</div>
 			
    	</div> 
    	
    	<ui:paging page="${page }" />
	</div>
</div>
<!--end等级列表 -->	
</body>
</html>