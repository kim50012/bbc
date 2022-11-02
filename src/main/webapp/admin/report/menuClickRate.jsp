<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 

<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="点击率查询"/></title>

<style type="text/css">

	.title {
		width: 100%;
		overflow: hidden;
		display: -webkit-box;
	  	text-overflow: -o-ellipsis-lastline;
		text-overflow: ellipsis;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
	}
	.calendar {
		width: 100px;
	}
</style>

<script type="text/javascript">

	$(function(){
	
		//Excel
		$('.result-grid-tool').click(function(){
			
			var createdDateFrom = $('#createdDateFrom').val();
			var createdDateTo = $('#createdDateTo').val();
			var date1 = new Date(createdDateFrom);
			var date2 = new Date(createdDateTo);
			
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			//window.location.href = '/admin/report/createNoteExcel.htm?startDate='+createdDateFrom+'&endDate='+createdDateTo+'&mobile='+mobile+'&sendStatus='+sendStatus;
			if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
				var url = '/admin/report/menuClickRateExcel.htm';
				var params = {
					startDate : createdDateFrom
					,endDate : createdDateTo
				}
				ggFormSubmit(url,params);
			}
		});
	});

	/****************
	//	分頁
	*****************/
	function showPage(pageNo, pageSize) {
		window.scrollTo(0,0);
		query(pageNo, pageSize);
	}
	
	function searchData() {
		
		query(1, 10); 
	}

	function query(pageNo, pageSize) {
		
		//console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var createdDateFrom = $('#createdDateFrom').val();
		var createdDateTo = $('#createdDateTo').val();
		var date1 = new Date(createdDateFrom);
		var date2 = new Date(createdDateTo);
		
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		var params = {
			startDate : createdDateFrom
			,endDate : createdDateTo
			,pageCurr : pageNo
			,pageUnit : pageSize
		}
		var url = '/admin/report/menuClickRateListFragment.htm';
		 
		var $this = $('.js-grid-content');	
		$this.showLoading();
		$this.load(url , params , function(){ 
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
			});
			$this.hideLoading();
		});
	}
	/****************
	//	分頁
	*****************/
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
       		 			<td class="fcomp" colspan="3">
	       		 			<input type="text" id="createdDateFrom" class="w10 calendar datepicker"  value="${requestScope.startDate}" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input type="text" id="createdDateTo" class="w10 calendar datepicker" value="${requestScope.endDate}" />
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
       		<div class="butttn-area m1" onclick="searchData()">
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
							<col width="60px" />
	       		 			<col width="80px" />
	       		 			<col width="80px" />
	       		 			<col width="80px" />
	       		 			<col width="60px" />
	       		 			<col width="40px" />
	       		 			<col width="40px" />
	       		 			<col width="40px" />
	       		 			<col width="40px" />
	       		 			<col width="100px" />
						</colgroup>
						<thead class="result-grid-thead">
							<tr>
			      		 		<th><ui:i18n key="店铺ID"/></th>
			      		 		<th><ui:i18n key="分析统计ID"/></th>
			      		 		<th><ui:i18n key="生成日期"/></th>
			      		 		<th><ui:i18n key="年月日"/></th>
			      		 		<th><ui:i18n key="年月"/></th>
			      		 		<th><ui:i18n key="年"/></th>
			      		 		<th><ui:i18n key="月"/></th>
			      		 		<th><ui:i18n key="天"/></th>
			      		 		<th><ui:i18n key="小时"/></th>
			      		 		<th><ui:i18n key="OPENID"/></th>
			      		 	</tr>
						</thead>
						<tbody class="result-grid-tbody">
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>
				           				<span class="title" title="${list.SHOP_ID}">${list.SHOP_ID}</span>
				      		 		</td>
				           			<td>
				           				<span class="title" title="${list.AM_ID}">${list.AM_ID}</span>					
				           			</td>
				           			<td>
				           				<span><fmt:formatDate value="${list.AM_DT}" pattern="yyyy-MM-dd" /></span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.AM_YMD}">${list.AM_YMD}</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.AM_YM}">${list.AM_YM}</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.AM_YY}">${list.AM_YY}</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.AM_MM}">${list.AM_MM}</span>	
				           			</td>
				           			<td>
				           				<span class="title" title="${list.AM_DD}">${list.AM_DD}</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.AM_HOUR}">${list.AM_HOUR}</span>
				           			</td>
				           			<td>
				           				<span class="title" title="${list.OPENID}">${list.OPENID}</span>
				           			</td>
				           		</tr>
				           	</c:forEach>
						</tbody>
		      		</table>
				</div>
				<ui:paging page="${page}" />
   			</div>
  		</div>
	</div>
</body>
</html>