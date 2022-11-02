<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/popup/popup-v2.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/popup/newsfeed.css" />  
 
<script type="text/javascript">
$(function(){
	search();
})
 
</script>
<script type="text/javascript">
function showPage(pageNo, pageSize){
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
	
	var url = '/admin/weixin/material/newsMaterialWindowFragment.htm';
	 var $this = $('.js-contents');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		
		 $this.hideLoading();
		 
		 
		 $('.appmsg').click(function(){
			 var $this = $(this); 
				$('.appmsg').not($this).removeClass('selected');
				if($this.hasClass('selected')){
					$this.removeClass('selected');
				}else{
					$this.addClass('selected');
				}
			});
			
		
			$('.js-conform').click(function(){
				if(!!window.parent){
					var conformMethod = eval('window.parent.${conformMethod}');
					//console.log('conformMethod==');
					//console.log(conformMethod);
					if(!!conformMethod){
						var msgId  = $('.appmsg.selected').data('id') || '';
						if(msgId != ''){
							var dahannews='${dahannews}';
							if(dahannews=='1'&&dahannews!=''){
								var newId  = $('.appmsg.selected').data('newid') || '';
								conformMethod(msgId,newId);
								return;
							}
								conformMethod(msgId);
						}else{
							alert('${label.没有选中的素材}'+'!');
						}
					}
				}
			});
			
			$('.js-cancel').click(function(){
				//console.log('-------55555-------');
				if(!!window.parent){
					var clsoeMethod = eval('window.parent.${clsoeMethod}');
					//console.log(clsoeMethod);
					if(!!clsoeMethod){
						clsoeMethod(1111111111);
					}
				}
			});
		 
	 });
	 
}
</script>
 <script type="text/javascript">
function newsfeedCreate(){
	parent.parent.ggShowTab({
		'url' : '/admin/weixin/material/addNewsMaterial.htm',
		'name' : '<ui:i18n key="添加图文素材"/>',
		'icon' : 'wechat' 
	});  
}

function newsfeedModify(msgId){
	parent.parent.ggShowTab({
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
<body >
	<!-- ▼ container  --> 
	<div class="popup-container"> 
		<form id="searchForm" action="/admin/weixin/material/showImageWindow.htm">
			<input type="hidden"  name="conformMethod" id="conformMethod" value="${conformMethod }" />
			<input type="hidden"  name="clsoeMethod" id="clsoeMethod" value="${clsoeMethod }" />
		</form>
		<div class="popup-top-area clearfix">
			<div class="popup-toolbar">
				 <div class="popup-tool js-upload-picture" onclick="newsfeedCreate();">
				 	<img alt="" src="/admin/images/v2-icons/icon-plus.png"/>
				   <span class="tool-name"><ui:i18n key="新建图文消息"/></span>
				 </div>
				 <div class="popup-tool" onclick="search();">
				 	<img alt="" src="/admin/images/v2-icons/icon_refresh.png" />
				 	<span  class="tool-name"><ui:i18n key="刷新"/></span>
				 </div>
			</div>		 
		
			<div class="popup-search-warp">
				<input type="text" placeholder="<ui:i18n key="标题"/>"  class="popup-search-input w18" id="title" value="${requestScope.fileName}"/>
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="search();"/>
			</div>
		</div>	
		
		<div class="js-contents">
	  	</div>
	</div>	
	<!-- ▲ container  -->
	
</body>
</html>