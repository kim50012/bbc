<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="投票调查"/></title>  
<script type="text/javascript">
	$(function(){
		$('#txtVoteNm').val('${requestScope.voteNm}');
		$('#selectVoteType').select2('val', '${requestScope.voteType}');
		
		$('.search-vote').click(function(){
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
		var voteNm = $('#txtVoteNm').val();
		var voteType = $('#selectVoteType').val();
		var params = {
				voteNm : voteNm
				,voteType : voteType
				,pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/vote/voteListFragment.htm';
		 
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
	function popProblems(voteId) {

		var voteNm = encodeURI($.trim($('#txtVoteNm').val()));
		var voteType = $('#selectVoteType').val();
		var voteUrl = '';
		
		if (voteId == '') {
			voteUrl = '/admin/vote/voteProblems.htm';
		} else {
			voteUrl = '/admin/vote/voteProblems.htm?voteId='+voteId+'&voteNm='+voteNm+'&voteType='+voteType;
		}
		location.href = voteUrl;
	}
	
	//投票删除
	function voteDelete(id) {
		
		if (id == '') {
			
			alert('<ui:i18n key="请重新加载页面"/>.');
			return;
		}
		if(confirm('<ui:i18n key="您确定要删除吗"/>？')) {
			
			$.ajax({
				data : {voteId : id, jobType : 1},
				url : '/admin/vote/voteDelete.htm',
				success : function(res) {

					if (res.success){
						
						alert('<ui:i18n key="操作成功"/>.');
						location.href = '/admin/vote/voteList.htm';
					} else {
						
						alert('<ui:i18n key="请检查信息"/>,'+res.err_msg+'.');
					}
				},
				error : function(obj, e, msg) {
					
					alert('<ui:i18n key="网络出现故障"/>.');
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
       		 			<col width="15%" />
       		 			<col width="35%" />
       		 			<col width="12%" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="投票名称"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" style="width:200px;" id="txtVoteNm" value="" />
						</td>
						<td class="flabel"><ui:i18n key="状态"/>：</td>
       		 			<td class="fcomp">
       		 				<select id="selectVoteType" style="width:220px;" class="select2" data-placeholder='<ui:i18n key="全部"/>'>
								<option value=""></option>
								<option value="I"><ui:i18n key="进行中"/></option>
								<option value="E"><ui:i18n key="结束"/></option>
							</select>
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button search-vote">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
		<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="popProblems('')">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="50%" />
		      		 			<col width="17%" />
		      		 			<col width="17%" />
		      		 			<col />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="投票名称"/></th>
			      		 		<th><ui:i18n key="投票人数"/></th>
			      		 		<th><ui:i18n key="状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${requestScope.reList}" var="items" varStatus="status">
								<tr>
									<td style="text-align: left;padding-left:30px;">${items.VOTE_NM}</td>
									<td>${items.VOTE_NUMBER}</td>
									<td>${items.VOTE_TYPE}</td>
									<td>
						           		<span class="gridbutton red"  onclick="javascript:popProblems('${items.VOTE_ID}');"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red" onclick="voteDelete('${items.VOTE_ID}');"><ui:i18n key="删除"/></span>
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