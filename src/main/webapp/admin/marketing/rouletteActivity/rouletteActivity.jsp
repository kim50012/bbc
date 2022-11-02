<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="摇奖活动"/></title>  
 
<script type="text/javascript">
	$(function(){
		$('.search-roulette').click(function(){
			query(1,10);
		});
	});
	//分页操作
	function showPage(pageNo, pageSize){
		query(pageNo, pageSize);
	}
	//分页的查询
	function query(pageNo, pageSize){
		
		console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var gameName = $('#gameName').val();
		var params = {
				gameName : gameName
				,pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/rouletteActivity/rouletteListFragment.htm';
		 
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
	//信息的创建
	function addRouletteActivity(){
		window.location.href = '/admin/rouletteActivity/addRouletteActivity.htm';
	}
	//修改摇奖活动
	function modifyRoulette(gameId){
		window.location.href = '/admin/rouletteActivity/updateRouletteActivity.htm?gameId='+gameId;
	}
	//停用摇奖活动
	function stopRoulette(gameId){
		if(confirm('<ui:i18n key="您确定停用该活动吗"/>？')){
 			var param = {
 							gameId : gameId
 							,jobType : 'S'
 							,isUse : 0
 						};
 			$.ajax({
				data:param,
				url :'/admin/rouletteActivity/saveUpdateRouletteActivity.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
				secureuri :false,
				dataType : 'json',
				type:'get',
				success : function (data){
					if(data.ret == 'success'){
						alert('<ui:i18n key="停用成功"/>');
						window.location.href = '/admin/rouletteActivity/rouletteActivity.htm';
					}else if (data.ret == 'fail'){
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>.');
					}
				},
				error: function (data, e){
					alert(e );
				}
			});	
 		}
	}
	//启用摇奖活动
	function useRoulette(gameId){
 		if(confirm('<ui:i18n key="您确定启用该活动吗"/>？')){
 			var param = {gameId:gameId,jobType:'S',isUse:1};
 			$.ajax({
				data:param,
				url :'/admin/rouletteActivity/saveUpdateRouletteActivity.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
				secureuri :false,
				dataType : 'json',
				type:'get',
				success : function (data){
					if(data.ret == 'success'){
						alert('<ui:i18n key="启用成功"/>');
						window.location.href = '/admin/rouletteActivity/rouletteActivity.htm';
					}else if (data.ret == 'fail'){
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>.');
					}
				},
				error: function (data, e){
					alert(e );
				}
			});	
 		}
	}
	//删除摇奖活动
	function deleteRoulette(gameId){
 		if(confirm('<ui:i18n key="您确定删除该活动吗"/>？')){
 			var param = {
 							gameId : gameId
 							,jobType : 'D'
 							,isDelete : 1
 						};
 			$.ajax({
				data:param,
				url :'/admin/rouletteActivity/saveUpdateRouletteActivity.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
				secureuri :false,
				dataType : 'json',
				type:'get',
				success : function (data){
					if(data.ret == 'success'){
						alert('<ui:i18n key="删除成功"/>');
						window.location.href = '/admin/rouletteActivity/rouletteActivity.htm';
					}else if (data.ret == 'fail'){
						alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>.');
					}
				},
				error: function (data, e){
					alert(e );
				}
			});	
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
       		 			<col width="17%" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="摇奖活动标题"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" style="width:280px;" id="gameName" value="${requestScope.gameName }" />
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button search-roulette">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
		<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="addRouletteActivity();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="20%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="摇奖活动标题"/></th>
			      		 		<th><ui:i18n key="允许中奖人数"/></th>
			      		 		<th><ui:i18n key="当前已中奖人数"/></th>
			      		 		<th><ui:i18n key="赠送总积分"/></th>
			      		 		<th><ui:i18n key="红包总金额"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.GAME_NM }</td>
									<td>${list.GAME_LIMIT_CNT }</td>
									<td>${list.WIN_CNT }</td>
									<td>${list.POINT_TOTAL }</td>
									<td>${list.HONGBAO_TOTAL }</td>
									<td>
						           		<span class="gridbutton red"  onclick="modifyRoulette(${list.GAME_ID });"><ui:i18n key="编辑"/></span>
										<c:if test="${list.IS_USE==1}">
											<span class="gridbutton red" onclick="stopRoulette(${list.GAME_ID });"><ui:i18n key="停用"/></span>
					           			</c:if>
					           			<c:if test="${list.IS_USE==0}">
					           				<span class="gridbutton green" onclick="useRoulette(${list.GAME_ID });"><ui:i18n key="启用"/></span>
					           			</c:if>
										<span class="gridbutton red" onclick="deleteRoulette(${list.GAME_ID });"><ui:i18n key="删除"/></span>
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