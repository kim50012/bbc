<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 
 
<script type="text/javascript">
$(function(){
	search();
	
})

 
function closeDkfPopup(){
	closeBpopupWindow('bpopupDkf');
}

function add(){
	 console.log('===========add=============');
	 
	 showIframeBpopupWindow({
			id : 'bpopupDkf',
			title : '<ui:i18n key="添加客服工号"/>',  
			width : 600,
			height : 400,
			action : '/admin/weixin/dkf/dkfAdd.htm'
		});	  	 
}
function modify(id){
	console.log('modify' + id);
}
function del(id){
	console.log('delete' + id);
}
</script>
<script type="text/javascript">
//分页
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}
//查询
function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	
	var kf_id = $('#kf_id').val().trim();
	var kf_nick = $('#kf_nick').val().trim();
	var kf_account = $('#kf_account').val().trim();
	
	var params = {
			kf_id : kf_id
			,kf_nick : kf_nick
			,kf_account : kf_account
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/weixin/dkf/dkfListFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
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
	      }   
	  );
		 $this.hideLoading();
	 });
	 
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
	<!-- ▼ 查询表单区域  --> 
	       <div class="query-from">
	       		<div class="form-table" >
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="15%" />
	    		 			<col width="18%" />
	    		 			<col width="15%" />
	    		 			<col width="18%" />
	    		 			<col width="15%" />
	    		 			<col/>
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="客服工号"/>：</td>
	    		 			<td class="fcomp">
	    		 				<input type="text" value="" id="kf_id" class="w12" />
	    		 			</td>
	    		 			<td class="flabel"><ui:i18n key="客服昵称"/>：</td>
	    		 			<td class="fcomp">
	    		 				<input type="text" value="" id="kf_nick"  class="w12"  />
	    		 			</td>
	    		 			<td class="flabel"><ui:i18n key="客服账号"/>：</td>
	    		 			<td class="fcomp">
	    		 				<input type="text" value="" id="kf_account"  class="w12"  />
	    		 			</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		 
	       		<!-- -->
	       		<div class="butttn-area m1" >
	       		   <span class="button" onclick="search();">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
			
			<div class="result-grid" style="margin-top: 50px;">
			
				<div class="result-grid-header">
	   				<div class="result-grid-tools">
	   				   <span class="result-grid-tool" onclick="">
	      		   	 	 	<span class="result-grid-tool js-add-dkf" onclick="add();">
				   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="添加客服账号"/>
					   		</span>
	      		   		</span>
	   				</div>
	   			</div>
	   			
	   			<div class="js-grid-content">
	   				
	   			</div>
			</div>
			
	</div>
	<!-- ▲ container  -->
	
	<!-- ▼ bpopup area -->
	<ui:template id="bpopupDkf"/>
	<!-- ▲ bpopup area -->
	
</body>
</html>