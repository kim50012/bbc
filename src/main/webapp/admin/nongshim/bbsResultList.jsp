<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="BBS活动管理"/></title>  
 
<script type="text/javascript">
	$(function(){
		//条件查询数据
		$('.query-interface').click(function(){
			query(1,10);
		});
		//导出Excel数据
		$('.js-export-excel').click(function(){
			//***************
			//y验证各个查询条件是否符合条件
			//***************
			
			
			if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
				var startDt = $("#startDt").val();
				var endDt = $("#endDt").val();
				var date1 = new Date(startDt);
				var date2 = new Date(endDt);
				if(date1 > date2){
					alert('<ui:i18n key="查询时间选择错误"/>！');
					return;
				}
				var url = '/admin/nongshim/resultDown.htm';
				var params = {
						startDt : $("#startDt").val()
						,endDt : $("#endDt").val()
				}
				ggFormSubmit(url,params);
				
			}
		});
	});
	//分页操作
	function showPage(pageNo, pageSize){
		query(pageNo, pageSize);
	}
	//分页的查询
	function query(pageNo, pageSize){
		
		console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var startDt = $("#startDt").val();
		var endDt = $("#endDt").val();
		var date1 = new Date(startDt);
		var date2 = new Date(endDt);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		var params = {
				startDt : startDt
				,endDt : endDt
				,pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/nongshim/bbsResultListFragment.htm';
		 
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
	
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="14%" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="时间"/>：</td>
       		 			<td class="fcomp">
       		 				<input  value="${requestScope.startDt }" type="text" id="startDt" style="width:100px;" class="w100 datepicker calendar"/>
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input value="${requestScope.endDt }" style="width:100px;" type="text" id="endDt" class="w100 datepicker calendar" />
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button query-interface">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
		<div class="result-grid" style="margin-top: 50px;">
			<div class="result-grid-header">
   				<div class="result-grid-tools js-export-excel">
   					<img alt="" src="/admin/images/imgTextSituation/icon_excel.png" />
   				   <span class="result-grid-tool">
					  	<ui:i18n key="导出Excel"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="17%" />
		      		 			<col width="16%" />
		      		 			<col width="15%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="姓名"/></th>
			      		 		<th><ui:i18n key="生日"/></th>
			      		 		<th><ui:i18n key="手机号码"/></th>
			      		 		<th><ui:i18n key="地区地址"/></th>
			      		 		<th><ui:i18n key="Email"/></th>
			      		 		<th><ui:i18n key="申请日期"/></th>
			      		 		<th><ui:i18n key="原因"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="items" varStatus="status">
								<tr>
									<td>
				           				${items.CUST_NM}
				           			</td>
				           			<td>
				           				${items.BIRTHDAY}
				           			</td>
				           			<td>
				           				${items.MOBILE_NO}
				           			</td>
				           			<td>
										<span>${items.ADRESS}</span>
				           			</td>
				           			<td>
										<span>${items.EMAIL}</span>
				           			</td>
				           			<td>
				           				${items.CREATE_DT}
				           			</td>
				           			<td  style="text-align: left;">
										<span>${items.REASON}</span>
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