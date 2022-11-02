<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="促销管理"/></title>
<script type="text/javascript" src="/admin/js/popup_layer.js"></script>
<style type="text/css">
	.gray{color: #a2a2a2;}
	.proTitleImg {float: left;}
	.proTitleText {float: left; width: 120px; height: 60px; line-height: 60px; margin-left: 8px; word-wrap: break-word; word-break: normal;text-align: left;}
	.limit-title {width:120px; word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;}
</style>
<script type="text/javascript">

function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	
	//console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var proTitle =  $.trim($('#txtProTitle').val());
	var proStartDt = $('#startDate').val();
	var proEndDt = $('#endDate').val();
	var proType = $('#selectProType').val();
	var date1 = new Date(proStartDt);
	var date2 = new Date(proEndDt);
	
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	var params = {
			proTitle : proTitle
			,proStartDt : proStartDt
			,proEndDt : proEndDt
			,proType : proType
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/promotion/promotionListFragment.htm';
	var $this = $('.js-grid-content');	
	
	$this.showLoading();
	$this.load(url, params, function(){ 
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

$(function(){
	
	$('#txtProTitle').val('${requestScope.proTitle}');
	$('#startDate').val('${requestScope.proStartDt}');
	$('#endDate').val('${requestScope.proEndDt}');
	$('#startDateMess').val('${requestScope.proStartDt}');
	$('#endDateMess').val('${requestScope.proEndDt}');
	$('#startDateWin').val('${requestScope.proStartDt}');
	$('#endDateWin').val('${requestScope.proEndDt}');
	$("#selectProType").select2("val", '${requestScope.proType}');
	
});

function popMessShow(proId) {
	
	var $th2 = $('.js-bpopup-inner', $('#createMessagePopup'));
	
	$th2.load('/admin/promotion/promotionMessList.htm' , {proId : proId , proStartDt : $('#startDate').val() , proEndDt : $('#endDate').val()} ,  function(){
		$('.select2', $th2).select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });	
		$('.datepicker', $th2).datepicker(); 
		$('.js-search-link-button', $th2).click(function(){
			var proStartDt = $('#startDateMess', $th2).val();
			var proEndDt = $('#endDateMess', $th2).val();
			var winType = $('#selectPopMessType', $th2).select2('val');
			var proId = $('#proId', $th2).val();
			queryMessPage(1, 10, proId, proStartDt, proEndDt, winType);
				
		});
			
		showBpopup({
 			id : 'createMessagePopup',
 			width : 810,
 			top:20 
 		});
	});
}
function showMessPage(pageNo, pageSize){
	
	var $this = $('.js-bpopup-inner', $('#createMessagePopup'));
	var proStartDt = $('#startDateMess', $this).val();
	var proEndDt = $('#endDateMess', $this).val();
	var winType = $('#selectPopMessType', $this).select2('val');
	var proId = $('#proId', $this).val();
	queryMessPage(pageNo,pageSize, proId, proStartDt, proEndDt, winType );
}

function queryMessPage(pageNo, pageSize, proId, proStartDt, proEndDt, winType ){
	
	var date1 = new Date(proStartDt);
	var date2 = new Date(proEndDt);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	var params = {
			proId : proId
			,proStartDt : proStartDt
			,proEndDt : proEndDt
			,winType : winType
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/promotion/promotionMessListFragment.htm';
	 
	var $this = $('.js-link-page-grid');	
	$this.showLoading();
	$this.load(url , params ,  function(){ 
		 
		$('.select2',$this).select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
			
		$('.js-cancel' , $this).click(function(){
			closeBpopupWindow('chooseLinkPopup');
		});
			
			
	 	$this.hideLoading();
	});
}

//主页面-中奖信息页面-弹出
function popWinShow(proId) {
	var $th2 = $('.js-bpopup-inner', $('#createWinPagePopup'));
	$th2.load('/admin/promotion/promotionWinList.htm' , {proId : proId , proStartDt : $('#startDate').val() , proEndDt : $('#endDate').val()} ,  function(){
		$('.select2', $th2).select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });	
		$('.icradio,.iccheckbox', $th2).iCheck({
		 	    checkboxClass: 'icheckbox_square-firebrick',
		 	    radioClass: 'iradio_square-firebrick',
		 	    increaseArea: '0%' // optional
		 	  });
		$('.datepicker', $th2).datepicker(); 
		
		//查询按钮
		$('.js-search-link-button', $th2).click(function(){
			var proStartDt = $('#startDateWin', $th2).val();
			var proEndDt = $('#endDateWin', $th2).val();
			var winType = $('#selectPopWinType', $th2).select2('val');
			var proId = $('#proId', $th2).val();
			queryWinPage(1, 10, proId, proStartDt, proEndDt, winType);
				
		});
		
		//全选反选
		$('.js-check-all', $th2).on('ifChecked', function(event){
			 $('.js-check-item').iCheck('check');
		});
		$('.js-check-all', $th2).on('ifUnchecked', function(event){
			 $('.js-check-item').iCheck('uncheck');
		});
		
		//关闭
		$('.js-cancel' ,$th2).click(function(){
			closeBpopupWindow('createWinPagePopup');
		});
		
		//保存为中奖者
		$('.js-save' , $th2).click(function(){
				var cnt = 0;
				
				$('.js-check-item',$th2).each(function(){
				   if($(this).is(':checked')){
					 cnt++;
				   }
			 	}); 
				
				if(cnt == 0){
					alert('<ui:i18n key="没有选中对象"/>');
					return false;
				}
				
				if(confirm('<ui:i18n key="您确定要保存吗"/>?')) {
				
					var mesIds = proId = '';
					$('.js-check-item',$th2).each(function(){
	  				   if($(this).is(':checked')){
	  				   	  proId = $(this).data('proId');
	  					  mesIds = mesIds + $(this).data('mesId')+",";
	  				   }
	  			 	}); 
					
					var params = {
							mesIds : mesIds,
							proId : proId
						};
						$.ajax({
							data : params,
							url : "/admin/promotion/winSave.htm",
							success : function(data) {
								if (data.result == 'SUCCESS') {
									
									alert('<ui:i18n key="保存成功"/>');
									showWinPage(1, 10);
								} else {
									
									alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击保存"/>');
								}
							},
							error : function(obj, e, msg) {
								
								alert('<ui:i18n key="网络出现故障"/>');
							}
						});
				}
				
		});
		
		//发布中奖者
		$('.js-publish' , $th2).click(function(){
			var cnt = 0;
			
			$('.js-check-item',$th2).each(function(){
			   if($(this).is(':checked')){
				 cnt++;
			   }
		 	}); 
			
			if(cnt == 0){
				alert('<ui:i18n key="没有选中对象"/>');
				return false;
			}
			
			var  proId = $('#proId' , $th2).val();
			if(confirm('<ui:i18n key="您确定要发布中奖信息吗"/>?')) {

				var params = {
						proId : proId
					};
					$.ajax({
						data : params,
						url : "/admin/promotion/publishSave.htm",
						success : function(data) {
							if (data.result == 'SUCCESS') {
								
								alert('<ui:i18n key="保存成功"/>');
								showWinPage(1, 10);
							} else {
								
								alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击保存"/>');
							}
						},
						error : function(obj, e, msg) {
							
							alert('<ui:i18n key="网络出现故障"/>');
						}
					});
			}else{
				return false;
			}
			
		});
		
		//导出Excel数据
		$('.js-excel', $th2).click(function(){
			if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
				var winStartDt =  $('#startDateWin', $th2).val();
				var winEndDt = $('#endDateWin', $th2).val();
				var date1 = new Date(winStartDt);
				var date2 = new Date(winEndDt);
				if(date1 > date2){
					alert('<ui:i18n key="查询时间选择错误"/>！');
					return;
				}
				var url = '/admin/promotion/exportExcel.htm';
				var params = {
						winStartDt : winStartDt
						,winEndDt : winEndDt
						,winType : $('#selectPopWinType', $th2).select2('val')
						,proId : $('#proId', $th2).val()
				}
				ggFormSubmit(url,params);
				
			}
		});
		
		showBpopup({
 			id : 'createWinPagePopup',
 			width : 810,
 			top:0 
 		});
	});
}
function showWinPage(pageNo, pageSize){
	var $this = $('.js-bpopup-inner', $('#createWinPagePopup'));
	var proStartDt = $('#startDateWin', $this).val();
	var proEndDt = $('#endDateWin', $this).val();
	var winType = $('#selectPopWinType', $this).select2('val');
	var proId = $('#proId', $this).val();
	queryWinPage(pageNo,pageSize, proId, proStartDt, proEndDt, winType );
}
function queryWinPage(pageNo, pageSize, proId, proStartDt, proEndDt, winType ){
	var date1 = new Date(proStartDt);
	var date2 = new Date(proEndDt);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	var params = {
			proId : proId
			,proStartDt : proStartDt
			,proEndDt : proEndDt
			,winType : winType
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/promotion/promotionWinListFragment.htm';
	 
	 var $this = $('.js-link-page-grid');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 
		 
		 $('.select2', $this).select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });	
		$('.icradio,.iccheckbox', $this).iCheck({
		 	    checkboxClass: 'icheckbox_square-firebrick',
		 	    radioClass: 'iradio_square-firebrick',
		 	    increaseArea: '0%' // optional
		 	  });
		$('.datepicker', $this).datepicker(); 
		
		//查询按钮
		$('.js-search-link-button', $this).click(function(){
			var proStartDt = $('#startDateWin', $this).val();
			var proEndDt = $('#endDateWin', $this).val();
			var winType = $('#selectPopWinType', $this).select2('val');
			var proId = $('#proId', $this).val();
			queryWinPage(1, 10, proId, proStartDt, proEndDt, winType);
				
		});
		
		//全选反选
		$('.js-check-all', $this).on('ifChecked', function(event){
			 $('.js-check-item').iCheck('check');
		});
		$('.js-check-all', $this).on('ifUnchecked', function(event){
			 $('.js-check-item').iCheck('uncheck');
		});
		
		//关闭
		$('.js-cancel' ,$this).click(function(){
			closeBpopupWindow('createWinPagePopup');
		});
		
		//保存为中奖者
		$('.js-save' , $this).click(function(){
				var cnt = 0;
				
				$('.js-check-item',$this).each(function(){
				   if($(this).is(':checked')){
					 cnt++;
				   }
			 	}); 
				
				if(cnt == 0){
					alert('<ui:i18n key="没有选中对象"/>');
					return false;
				}
				
				if(confirm('<ui:i18n key="您确定要保存吗"/>?')) {
				
					var mesIds = proId = '';
					$('.js-check-item',$this).each(function(){
	  				   if($(this).is(':checked')){
	  				   	  proId = $(this).data('proId');
	  					  mesIds = mesIds + $(this).data('mesId')+",";
	  				   }
	  			 	}); 
					
					var params = {
							mesIds : mesIds,
							proId : proId
						};
						$.ajax({
							data : params,
							url : "/admin/promotion/winSave.htm",
							success : function(data) {
								if (data.result == 'SUCCESS') {
									
									alert('<ui:i18n key="保存成功"/>');
									showWinPage(1, 10);
								} else {
									
									alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击保存"/>');
								}
							},
							error : function(obj, e, msg) {
								
								alert('<ui:i18n key="网络出现故障"/>');
							}
						});
				}
				
		});
		
		//发布中奖者
		$('.js-publish' , $this).click(function(){
			var cnt = 0;
			
			$('.js-check-item',$th2).each(function(){
			   if($(this).is(':checked')){
				 cnt++;
			   }
		 	}); 
			
			if(cnt == 0){
				alert('<ui:i18n key="没有选中对象"/>');
				return false;
			}
			
			var  proId = $('#proId' , $this).val();
			if(confirm('<ui:i18n key="您确定要发布中奖信息吗"/>?')) {

				var params = {
						proId : proId
					};
					$.ajax({
						data : params,
						url : "/admin/promotion/publishSave.htm",
						success : function(data) {
							if (data.result == 'SUCCESS') {
								
								alert('<ui:i18n key="保存成功"/>');
								showWinPage(1, 10);
							} else {
								
								alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击保存"/>');
							}
						},
						error : function(obj, e, msg) {
							
							alert('<ui:i18n key="网络出现故障"/>');
						}
					});
			}else{
				return false;
			}
			
		});
		
		$('.js-excel', $this).click(function(){
			
			if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
				var winStartDt =  $('#startDateWin', $this).val();
				var winEndDt = $('#endDateWin', $this).val();
				var date1 = new Date(winStartDt);
				var date2 = new Date(winEndDt);
				if(date1 > date2){
					alert('<ui:i18n key="查询时间选择错误"/>！');
					return;
				}
				var url = '/admin/promotion/exportExcel.htm';
				var params = {
						winStartDt : winStartDt
						,winEndDt : winEndDt
						,winType : $('#selectPopWinType', $this).select2('val')
						,proId : $('#proId', $this).val()
				}
				ggFormSubmit(url,params);
				
			}
		});
		
		 $this.hideLoading();
	 });
	
}


//主页面-新建或修改
function popPublish(proId) {
	
	var proTitle = encodeURI($.trim($('#txtProTitle').val()));
	var proStartDt = $('#startDate').val();
	var proEndDt = $('#endDate').val();
	var proType = $('#selectProType').val();
	var date1 = new Date(proStartDt);
	var date2 = new Date(proEndDt);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	location.href = "/admin/promotion/promotionPublish.htm?proId="+proId+"&proTitle="+proTitle+"&proStartDt="+proStartDt+"&proEndDt="+proEndDt+"&proType="+proType;
}
//主页面-运行停止操作
function runOpton(proId, optionId) {
	var msg = '';
	if(optionId == 'I'){
		msg = '<ui:i18n key="您确定启用该促销活动吗"/>?';
	}else{
		msg = '<ui:i18n key="您确定停用该促销活动吗"/>?';
	}
	if(!confirm(msg)){
		return;
	}
	if (proId == '' || optionId == '') {
		
		alert('<ui:i18n key="请重新加载"/>.');
		return;
	}

	$.ajax({
		data : {proId : proId, optionId : optionId},
		url : '/admin/promotion/ajaxRunOpton.htm',
		success : function(data) {
			
			if (data.result == 'SUCCESS') {
				
				alert('<ui:i18n key="保存成功"/>.');
				location.reload();
			} else {
				
				alert('<ui:i18n key="请检查信息"/>,'+'<ui:i18n key="重新点击"/>.');
			}
		},
		error : function(obj, e, msg) {
			
			alert('<ui:i18n key="网络出现故障"/>.');
		}
	});
}


</script>
</head>
<body>
	<div class="container">
	
	<!-- ▼ 查询条件 --> 
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
   		 			<td class="flabel"><ui:i18n key="活动名称"/>：</td>
   		 			<td class="fcomp">
    		 			<input type="text" id="txtProTitle" value="" />
   		 			</td>
   		 			<td class="flabel"><ui:i18n key="筛选日期"/>：</td>
   		 			<td class="fcomp">
						<input  value="${requestScope.startDt }" type="text" id="startDate" style="width:100px;" class="w100 datepicker calendar" readonly="readonly"/>
						<span class="line"><img src="/admin/images/orders/wave line.png"></span>
						<input value="${requestScope.endDt}" style="width:100px;" type="text" id="endDate" class="w100 datepicker calendar"  readonly="readonly"/>
   		 			</td>
   		 		</tr>
   		 		<tr>
   		 			<td class="flabel last" ><ui:i18n key="状态"/>：</td>
   		 			<td class="fcomp last">
   		 				<select id="selectProType" class="select2 rightSelect" data-placeholder="" style="width: 100%">
							<option value=""><ui:i18n key="不限"/></option>
							<option value="I"><ui:i18n key="进行中"/></option>
							<option value="E"><ui:i18n key="结束"/></option>
						</select>
   		 			</td>
   		 			<td class="flabel last"></td>
   		 			<td class="fcomp last"></td>
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
	<!-- ▲ 查询条件 -->
	
	<!-- ▼ 普通表格  --> 
	<div class="result-grid pic" style="margin-top: 50px;">
		<div class="result-grid-header" >
			<div class="result-grid-tools">
				<span class="result-grid-tool" onclick="popPublish('')">
					<img alt="" src="/admin/images/goods/plus.png" />
					<ui:i18n key="新建"/>
				</span>
			</div>
		</div>
		<div class="js-grid-content">
			<div class="result-data-warp">
				<table class="result-grid-table">
					<colgroup>
						<col width="32%"  />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 			<col width="10%" />
    		 			<col width="28%" />
    		 			<col/>
					</colgroup>
		      	 	<thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th><ui:i18n key="活动名称" /></th>
		      		 		<th><ui:i18n key="开始日期" /></th>
		      		 		<th><ui:i18n key="结束日期" /></th>
		      		 		<th><ui:i18n key="状态" /></th>
		      		 		<th><ui:i18n key="中奖信息" /></th>
		      		 		<th><ui:i18n key="操作" /></th>
		      		 	</tr>
					</thead>
					<tbody class="result-grid-tbody" >
						<c:forEach items="${requestScope.reProList}" var="items" varStatus="status">
							<tr>
								<td class="pic">
									<div class="proTitleImg">
										<img class="pic-small" src="${items.PRO_PIC_URL}">
									</div>
									<div class="proTitleText">
										<span title="${items.PRO_TITLE}" class="limit-title">${items.PRO_TITLE}</span>
									</div>
								</td>
								<td>
									${items.PRO_START_DT_PC}
								</td>
								<td>
									${items.PRO_END_DT_PC}
								</td>
								<td>
									${items.PRO_TYPE_NM}
								</td>
								<td>
									${items.PRO_WIN_TYPE_NM}
								</td>
								<td>
									<span class="gridbutton red" onclick="javascript:popPublish('${items.PRO_ID}');"><ui:i18n key="编辑" /></span>
									<c:choose>
										<c:when test="${items.PRO_TYPE eq 'E'}" >
											<span class="gridbutton green" onclick="javascript:runOpton('${items.PRO_ID}','I');"><ui:i18n key="启用" /></span>
										</c:when>
										<c:otherwise>
											<span class="gridbutton red" onclick="javascript:runOpton('${items.PRO_ID}','E');"><ui:i18n key="停用" /></span>
										</c:otherwise>
									</c:choose>
									<span class="gridbutton red" onclick="javascript:popMessShow('${items.PRO_ID}');"><ui:i18n key="留言" /></span>
									<c:choose>
										<c:when test="${items.PRO_WIN_TYPE eq 'Y'}">
											<span class="gridbutton gray"><ui:i18n key="中奖" />1</span>
										</c:when>
										<c:otherwise>
											<span class="gridbutton red" onclick="javascript:popWinShow('${items.PRO_ID}');"><ui:i18n key="中奖" />1</span>
										</c:otherwise>
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
	<!-- ▲ 普通表格 -->
	</div>	
	
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="createMessagePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="促销留言管理"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!--  -->
	 		 	    
	 		 	    
	 		 	    <!--  -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	
	<div class="bpopup2" id="createWinPagePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="发布中奖信息"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!--  -->
	 		 	    
	 		 	    
	 		 	    <!--  -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->
	
	
</html>