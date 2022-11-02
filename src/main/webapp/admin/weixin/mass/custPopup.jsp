<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
  <link rel="stylesheet" type="text/css" href="/admin/css/popup/popup-v2.css" />
<script type="text/javascript">

 //console.log('conformMethod=${conformMethod}');
 //console.log('clsoeMethod=${clsoeMethod}');

 $(function(){
	search();
	 $('.js-reload').click(function(){
		 search();
	 });
 })
</script>

<script type="text/javascript">
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function search(){
	query(1, 60); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
 
	var conformMethod = $('#conformMethod').val();
	var clsoeMethod = $('#clsoeMethod').val();
	var custName = $('#custName').val();
	
	var params = {
			custName : custName
			,conformMethod : conformMethod
			,clsoeMethod : clsoeMethod
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/weixin/mass/custPopupFragment.htm';
	 var $this = $('.js-contents');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
 
		$('.js-cust-item').click(function(){
			var $this = $(this); 
			if($this.hasClass('selected')){
				$this.removeClass('selected');
			}else{
				$this.addClass('selected');
			}
		}); 
		
		$('.js-conform').click(function(){
			console.log('---------------');
			
			if(!!window.parent){
				var conformMethod = eval('window.parent.${conformMethod}');
				//console.log(conformMethod);
				if(!!conformMethod){
					 
					
					var custes = [];
					$('.js-cust-item.selected').each(function(){
						custes.push({
							custSysId : $(this).data('custSysId')
							,custNickNm : $(this).data('custNickNm')
							,openid : $(this).data('openid')
						});
					});
					//console.log('custs=');
					conformMethod(custes);
				}
			}
		}); 
		$('.js-cancel').click(function(){
			console.log('-------55555-------');
			if(!!window.parent){
				var clsoeMethod = eval('window.parent.${clsoeMethod}');
				console.log(clsoeMethod);
				if(!!clsoeMethod){
					clsoeMethod(1111111111);
				}
			}
		}); 
		
		 $this.hideLoading();
	 });
	 
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="popup-container"> 
		<form id="searchForm" action="">
			<input type="hidden"  name="pageCurr" id="pageCurr" value="" />
			<input type="hidden"  name="conformMethod" id="conformMethod" value="${conformMethod }" />
			<input type="hidden"  name="clsoeMethod" id="clsoeMethod" value="${clsoeMethod }" />
		</form>
	 
		<div class="popup-top-area clearfix">
			<div class="popup-toolbar">
				 <%-- <div class="popup-tool js-upload-picture" style="">
				 	<img alt="" src="/admin/images/v2-icons/icon_upload.png" />
				   <span class="tool-name"><ui:i18n key="上传本地图片"/></span>
				 </div> --%>
				 <div class="popup-tool js-reload">
				 	<img alt="" src="/admin/images/v2-icons/icon_refresh.png" />
				 	<span  class="tool-name"><ui:i18n key="刷新"/></span>
				 </div>
			</div>		 
		
			<div class="popup-search-warp">
				<input type="text"  class="popup-search-input w18" id="custName" />
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="search();"/>
			</div>
			
		</div>	
		
		<div class="js-contents">
	  	</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>