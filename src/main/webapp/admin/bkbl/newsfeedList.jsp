<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <link rel="stylesheet" type="text/css" href="/admin/css/popup/newsfeed.css" />  
 
 <style type="text/css">
.page-toolbar{position:relative;float:left;display:inline-block;}
.page-tool{display:inline-block;height:30px;vertical-align:middle;font-size:12px;}
.page-tool img{vertical-align:text-bottom;cursor:pointer;}
.page-tool .tool-name{display:inline-block;margin-left:5px;line-height:30px;cursor:pointer;}

.page-search-warp{position:relative;float:right;}
.page-search-warp .page-search-input{padding-right:30px!important;}
.page-search-warp img{position:absolute;top:7px;right:10px;cursor:pointer;}
 
.popup-content-item-warp{position:relative;overflow-y:auto;height:400px; }
 </style>
			   
<script type="text/javascript">
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
 
	var title = $('#title').val();
	
	var params = {
			 title : title
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	
	var url = '/admin/weixin/material/newsfeedListFragment.htm';
	 var $this = $('.js-contents');	
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

<script type="text/javascript">
$(function(){
	search();
})
</script>
<script type="text/javascript">
function newsfeedCreate(){
	parent.ggShowTab({
		'url' : '/admin/weixin/material/addNewsMaterial.htm',
		'name' : '<ui:i18n key="添加图文素材"/>',
		'icon' : 'wechat' 
	});  
}

function newsfeedModify(msgId){
	parent.ggShowTab({
		'url' : '/admin/weixin/material/modifyNewsMaterial.htm?msgId=' + msgId,
		'name' : '<ui:i18n key="修改图文素材"/>',
		'icon' : 'wechat' 
	});  
}
function newsfeedDel(msgId){
	alert('del :' + msgId);
}
</script>
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div  class=" page-top-area clearfix" style="border: 1px solid #e5e5e5; padding: 10px 20px;">
			<div class="page-toolbar">
				 <div class="page-tool" style="">
				 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" onclick="newsfeedCreate();" />
				   	<span class="tool-name" onclick="newsfeedCreate();" ><ui:i18n key="新建图文消息"/></span>
				 </div>
				 
			</div>		
			<div class="page-search-warp">
				<input type="text" placeholder="<ui:i18n key="标题"/>"  class="page-search-input w18" id="title" value=""/>
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="search();"/>
			</div>
		</div>
		
		
		<div class="js-contents" style="margin-top: 20px;">
			
		</div>
		
	</div>
	<!-- ▲ container  -->
</body>
</html>