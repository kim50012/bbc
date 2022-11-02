<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="国际化管理"/></title>  
<script type="text/javascript">
$(function(){
	searchData();
	
	$('.js-add-page').click(function(){
		 showBpopup({
			id : 'createPopup',
			width : 400 
		});	  	 
	});
});

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
 	if(${requestScope.user.userAuth != 'A' }){
		alert('<ui:i18n key="您没有操作权限"/>.');
		return;
	}
 	var statusId= $('#statusId').val(); 
	var text= $('#text').val();
	if(statusId == '' && text != ''){
		alert('<ui:i18n key="请选择查询类型"/>.');
		return;
	}
	var params={};
	params.pageCurr = pageNo;
	params.pageUnit = pageSize;
	params.text = text;
	params.statusId = statusId;
	//根据id查询
	if(statusId == '1'){
		params.labelId = text;
	}else if(statusId == '2'){
		params.label_nm_cn = text;
	}else if(statusId == '3'){
		params.label_nm_ko = text;
	}
	
	var url = '/admin/master/i18n/i18nListFragment.htm';
	 
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

function save(){
	//中文
	var create_cn=$('#create_cn').val();
	//韩文
	var create_ko=$('#create_ko').val();
	if(create_cn==''){
		alert('<ui:i18n key="请输入中文"/>.');
		return;
	}
	if(create_ko==''){
		alert('<ui:i18n key="请输入韩文"/>.');
		return;
	}
	var param={
			label_nm_cn:create_cn,
			label_nm_ko:create_ko
			};
	$.ajax({
		data:param,
		url : '/admin/master/i18n/save.htm',
		success : function(data){
			if(data.result=='success'){
				alert('<ui:i18n key="保存成功"/>');	
// 				window.location.reload();
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('.#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
			}else{
				alert('<ui:i18n key="保存失败"/>,<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	 });
}

function showUpdatePoupe(labelId,label_nm_cn,label_nm_ko){
	$('#update_cn').val(label_nm_cn);
	$('#update_ko').val(label_nm_ko);
	$('#update_id').val(labelId);
	showBpopup({
		id : 'updatePopup',
		width : 400 
	});	  	 
}
function update(){
	//id
	var update_id=$('#update_id').val();
	//中文
	var update_cn=$('#update_cn').val();
	//韩文
	var update_ko=$('#update_ko').val();

	if(update_cn==''){
		alert('<ui:i18n key="请输入中文"/>.');
		return;
	}
	if(update_ko==''){
		alert('<ui:i18n key="请输入韩文"/>.');
		return;
	}
	var param={
			labelId:update_id,
			label_nm_cn:update_cn,
			label_nm_ko:update_ko
			};
	$.ajax({
		data:param,
		url : '/admin/master/i18n/update.htm', 
		success : function(data){
			if(data.result=='success'){
				alert('<ui:i18n key="修改成功"/>');
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				$('.b-close').click();
// 				window.location.reload();
			}else{
				alert('<ui:i18n key="修改失败"/>,<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	 });
}
function closePopup(){
	$('#create_cn').val('');
	$('#create_ko').val('');
}
</script>
</head>
<body>
	<!-- ▼ header  --> 
   	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
	<!-- ▼  container-->
	<div class="contents clearfix">
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 40px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/icon2/manage.png">
				<span class="title-name"><ui:i18n key="国际化管理"/></span>
			</div>
			<div class="action-tools">
				<span class="action-tool">
	   		   		<img class="action-tool-icon refresh" alt="" src="/admin/images/groupCreate/toback.png" onclick="ggChangeShop();" />
			  		<span class="action-name" onclick="ggChangeShop();" ><ui:i18n key="返回店铺目录"/></span>
	   		   	</span>
			</div>
		</div>
		<!-- ▲标题 -->
		<!-- ▼ 查询表单区域  --> 
        <div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable" border="1">
       		 		<colgroup>
       		 			<col width="10%" />
       		 			<col width="25%" />
       		 			<col width="10%" />
       		 			<col width="25%" />
       		 			<col width="10%" />
       		 			<col width="20%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="类型"/>：</td>
       		 			<td class="fcomp">
							<select class="select2" data-placeholder="<ui:i18n key='请选择查询类型'/>" id="statusId" style="width: 225px;">
								<option value=""></option>
								<option value="1"><ui:i18n key="ID"/></option>
								<option value="2"><ui:i18n key="中文"/></option>
								<option value="3"><ui:i18n key="韩文"/></option>
							</select>
       		 			</td>
       		 			<td class="flabel">
       		 				<ui:i18n key="内容"/>：
       		 			</td>
       		 			<td class="fcomp">
       		 				<input type="text" value="" id="text" placeholder="<ui:i18n key='请输入查询内容'/>"/>
       		 			</td>
       		 			<td class="flabel"></td>
       		 			<td class="fcomp">
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
       		 
       		<div class="butttn-area m1" onclick="searchData();">
       		   <span class="button">
       		   	<span class="button-icon search"></span>
       		   	<ui:i18n key="查询" />
       		   </span>
       		</div>
      	</div>
		<!-- ▲ 查询表单区域  -->  
		<!-- ▼ 普通表格  --> 
			<div class="result-grid" style="margin-top: 50px;">
				<div class="result-grid-header">
					<div class="result-grid-tools">
					   		<span class="result-grid-tool js-add-page">
				   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="新建"/>
					   		</span>
					</div>
				</div>
				<div class="js-grid-content">
				</div>
			</div>
		<!-- ▲ 普通表格  -->   
	</div>
	<!-- ▲  container-->
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="createPopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-add-page"><ui:i18n key="新建"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" onclick="closePopup()"/>
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 60px;text-align: center;">
					  			 		<ui:i18n key="中文"/><a class="label-required"></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text" id="create_cn" value="" placeholder="<ui:i18n key='请输入中文'/>"/>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 60px;text-align: center;">
					  			 		<ui:i18n key="韩文"/><a class="label-required"></a> : 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  id="create_ko"  placeholder="<ui:i18n key='请输入韩文'/>"  />
					  			 	 </div>
					  			 </div>
					  			 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="save()">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="closePopup()">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<div class="bpopup2" id="updatePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-add-page"><ui:i18n key="新建"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <form action="">
	 		 	    		<div class="form-warp clearfix" >
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 60px;text-align: center;">
					  			 		<ui:i18n key="中文"/><a class="label-required"></a>: 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text" id="update_cn" value="" placeholder="<ui:i18n key='请输入中文'/>"/>
					  			 	 </div>
					  			 </div>
					  			 <div class="control-warp"  >
					  			 	 <div class="form-label" style="width: 60px;text-align: center;">
					  			 		<ui:i18n key="韩文"/><a class="label-required"></a>: 
					  			 	 </div>
					  			 	 <div class="form-control">
					  			 	 	<input type="text"  id="update_ko"  placeholder="<ui:i18n key='请输入韩文'/>"  />
					  			 	 	<input type="hidden"  id="update_id" />
					  			 	 </div>
					  			 </div>
					  			 
					  			 <div class="control-warp text-center">
					  			 	<div class="popup-form-actions">
						  			 	 <div class="buttons-action">
							  				<span class="button bg-red js-confirm"  onclick="update()">
												<span class="button-icon conform"></span>
												<span class="button-name"><ui:i18n key="保存"/></span>
											</span>
											<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="">
												<span class="button-icon cancel"></span>
												<span class="button-name"><ui:i18n key="取消"/></span>
											</span>
						  				</div>
					  				</div>
					  			 </div>
					  		</div>	 
	 		 	    </form>
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->
</body>
</html>


