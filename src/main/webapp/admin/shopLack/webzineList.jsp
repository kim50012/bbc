<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="微杂志页面"/></title>  
<style type="text/css">
 .poupDiv{
 	position:absolute;
 	width:300px;
 	height:620px;
 	border-radius:47px;
 	background-color: #fff; 
 	box-shadow:0 0 10px #fff;
 	display:none;
 }
  .poupDiv .poup-top-title{
  	width:100%;
  	height:70px;
 	text-align: center;
  }
   .poupDiv .poup-foot{
  	width:100%;
  	height:63px;
 	text-align: center;
 	vertical-align: bottom;
 	padding-top:7px;
  }
 
.poup-body-div{
	width:274px;
	height:480px;
	border-radius:7px;
	margin-left:13px;
	background-image: url("/admin/images/webzine/iphone_head.png");
	background-position: 0 0;
	background-repeat: no-repeat;
	border:1px solid #eee; 
} 
.poup-body-div .body-title{
	width:200px;
	margin-left:39px;
	height:16px;
	color:#fff;
	text-align: center;
	margin-top:0px;
	font-size:9px;
} 
.poup-body-div .body-msg-div{
	width:100%;
	position: relative;
	height:435px;
}
.shop-img img{
 	width:40px;
 	height:40px;
 	border:1px solid #eeeeee;
 	margin-top:20px;
 }
  .div-show-msg{
 	width:200px;
 	min-height:70px;
 	border:1px solid #c5c5c5;
 	position:absolute;
 	background-color: #fff;
 	z-index:30;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
	left:50px;
	top:10px;
}
.dropDown1,.dropDown3,.dropDown2
 {
 	width:0;
 	height:0; 
 	overflow:hidden;
 	border-width:10px; 
 	border-style:dotted dotted solid;  
 	position:absolute
 }
 .PoupDivBody{
 	position: absolute; 
 	width:8px; 
 	height:8px; 
 	left:-20px; 
 	top:15px
 }
	 .close-div-img{
	 	position: absolute;
	 	margin-left:300px;
	 	cursor: pointer;
	 }

</style> 
 
<script type="text/javascript">
	$(function(){
		$('.search-WebZine').click(function(){
			query(1,10);
		});
		//关闭预览弹出框
		$('.close-div-img').click(function(){
			closeBpopupWindow('showNowBefore');
		});
	});
	//分页操作
	function showPage(pageNo, pageSize){
		window.scrollTo(0,0);
		query(pageNo, pageSize);
	}
	//分页的查询
	function query(pageNo, pageSize){
		
		console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var goodsNm = $('#searchGoodsNm').val();
		var params = {
				goodsNm : goodsNm
				,pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/shopLack/webzineListFragment.htm';
		 
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
	function addWebZineActivity(){
		window.location.href = '/admin/shopLack/addWebzineList.htm';
	}
	//修改摇奖活动
	function modifyWebZine(pageId){
		window.location.href = '/admin/shopLack/updateWebzineList.htm?pageId=' + pageId ;
	}
	function deleteWebZine(pageId){
		if(confirm('<ui:i18n key="您确定要删除吗"/>?')) {
		 	$.ajax({
	  	 		data:{
	  	 			pageId : pageId
	  	 		},
				url : '/admin/shopLack/deleteDynamicPage.htm',
				success : function(data) {
					alert('<ui:i18n key="删除成功"/>.');
// 					window.location.href = '/admin/shopLack/webzineList.htm';
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
							
				},
				error : function(xhr, status, e) {
					alert('<ui:i18n key="保存失败"/>.\n' + 'error: ' + status);
				}
			});
		}
	}
	function previewWebZine(url,pageId){
		$('#iframe_avi_music_image').attr('src','/marketing/webzine/webzinePreview.htm?pageId='+pageId);
		showIframeBpopupWindow({
			id : 'showNowBefore',
			width : 300,
			height : 620,
			action : $('#iframe_avi_music_image').attr('src')
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
       		 			<col width="17%" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="微杂志名称"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" style="width:280px;"  id="searchGoodsNm"  value="${requestScope.goodsNm }"/>
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button search-WebZine">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
		<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="addWebZineActivity();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="15%" />
		      		 			<col width="45%" />
		      		 			<col width="15%" />
		      		 			<col/>
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="页面ID"/></th>
			      		 		<th><ui:i18n key="微杂志名称"/></th>
			      		 		<th><ui:i18n key="生成日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.PAGE_ID}</td>
									<td class="js-grid-gc-nm">${list.PAGE_NM}</td>
									<td class="js-grid-gexing-nm">${list.CREATED_DT} </td>
									<td class="js-grid-gexing-nm">
										<span class="gridbutton red"  onclick="modifyWebZine(${list.PAGE_ID });"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red"  onclick="previewWebZine('${list.URL}',${list.PAGE_ID });"><ui:i18n key="预览"/></span>
										<span class="gridbutton red" onclick="deleteWebZine(${list.PAGE_ID });"><ui:i18n key="删除"/></span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />
	     	</div>
	      </div>
	      
	      <div class="poupDiv" id="showNowBefore">
	      	<img src="/admin/images/sendMsgAll/btn_close.png" class="close-div-img"/>
	      		<div class="poup-top-title">
	      			<img src="/admin/images/sendMsgAll/iphone_1.png"/>
	      		</div>
	      		<div class="poup-body-div">
	      			<div class="body-title">
	      			</div>
	      			<div class="body-msg-div">
	      				<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_avi_music_image"  style="overflow: hidden;" src=""></iframe>
					</div>
	      		</div>
	      		<div class="poup-foot">
	      			<img src="/admin/images/sendMsgAll/iphone_home.png"/>
	      		</div>
	      </div>
	      
	</div>
	<!-- ▲ container  -->
</body>
</html>