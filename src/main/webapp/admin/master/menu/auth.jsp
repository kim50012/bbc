<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="店铺菜单权限设置"/></title> 

<link rel="stylesheet" href="/admin/js/jstree/themes/default/style.css" />
<script src="/admin/js/jstree/jstree.min.js"></script>
<script type="text/javascript">
var tree = '';
$(function(){
	$('#corpId').change(function(e){ 
		var val = $(this).val();
		var $combo = $('#shopId');
		$combo.select2('val','');
		 $combo.html('<option value="" ></option>');//清空select内容  
		if(val == ''){
			$combo.prop('disabled', true).trigger('change');
		}else{
			$combo.prop('disabled', false);
			$.ajax({
       	 		data:{corpId : val},
				url : '/admin/master/menu/getShopListByCompanyCombo.htm',
				success : function(res) {
					 var list = res.list;
					
					 if(!!list.length){
					 	 for(var i = 0 ; i < list.length ; i++){
					 	 	$combo.append('<option value="' + list[i].comboKey + '">' + list[i].comboValue + '</option>');
					 	 }
					 	 
						$combo.select2('open'); 
					 }else{
						 
					 } 
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
 			});
		}
		
	  });
	
	
	$('#shopId').change(function(e){ 
		if(tree != ''){
			$('#treeContainer').jstree().destroy(true);
			$('#treeContainer').html('');
		}
		
		var val = $(this).val();
		
		$('.js-menu-tree-warp').showLoading(); 
		
		$.ajax({
   	 		data:{shopId : val},
			url : '/admin/master/menu/getShopMenuAuthTree.htm',
			success : function(data) {
				$('.js-menu-tree-warp').hideLoading(); 
				console.log('data');
				console.log(data);
				
			  tree =  $('#treeContainer').jstree({
				  'core' : {
				      'data' : data
				      ,'strings' : {
				            'Loading' : 'Please wait ...'
				        }
				    },
				  plugins : [ "themes", "json_data", "checkbox", "ui" ] 
			  });
			  
			  $('#treeContainer').bind('loaded.jstree', function (e, data) {
				  console.log('loaded...');
				  console.log($.jstree.version);
				  console.log($.jstree.defaults);
				  $('#treeContainer').jstree().open_all();
			  });
			},
			error : function(xhr, status, e) {
				$('.js-menu-tree-warp').hideLoading(); 
				alert("error: " + status);
			}
		});
		
	});
	
	$('#shopId').trigger('change');
});

</script>
<script type="text/javascript">
$(function() {
	  $('.js-save-auth').click(function(){
		  
		if($('#shopId').val() == ''){
			 ggAlertInfo('<ui:i18n key="请选择店铺"/>');
			return false;
		}  
		  
		  
		var nodeList = $('#treeContainer').jstree().get_selected(true);
		
		var menuIds = [];
		if(nodeList != null && nodeList.length > 0){
			for(var i = 0; i < nodeList.length; i++){
				menuIds.push(nodeList[i].data.menuId);
			}
		}
		
		console.log(menuIds);
		
		$.ajax({
		 		data:{menuIds : menuIds.join(','),shopId : $('#shopId').val()},
			url : '/admin/master/menu/saveShopMenuAuth.htm',
			success : function(res) {
				 ggAlertSuccess('<ui:i18n key="设置成功"/>');
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
			});
		
	  });
	  $('.js-check-all').click(function(){
		$('#treeContainer').jstree().select_all(true);
		
	  });
	  $('.js-uncheck-all').click(function(){
		$('#treeContainer').jstree().deselect_all(true);
	  });
	  $('.js-open-all').click(function(){
		$('#treeContainer').jstree().open_all();
	  });
	  
	  
	  $('.js-close-all').click(function(){
		$('#treeContainer').jstree().close_all();
	  });
	  
	 
	  $('.js-show_stripes').click(function(){
		$('#treeContainer').jstree().show_stripes();
	  });
	  $('.js-hide_stripes').click(function(){
		$('#treeContainer').jstree().hide_stripes();
	  });
	  $('.js-show_dots').click(function(){
		$('#treeContainer').jstree().show_dots();
	  });
	  $('.js-hide_dots').click(function(){
		$('#treeContainer').jstree().hide_dots();
	  });
	  $('.js-show_icons').click(function(){
		$('#treeContainer').jstree().show_icons();
	  });
	  $('.js-hide_icons').click(function(){
		$('#treeContainer').jstree().hide_icons();
	  });
	  
	   
	});

</script>

 <style type="text/css">
.menu-tree-warp{overflow:auto;margin-top:10px;padding:20px;height:300px;border:1px solid #e3e3e3;}
.tree-opt{float:left;display:inline-block;margin-right:10px;padding:5px 10px;border:1px solid #e3e3e3;border-radius:2px;cursor:pointer;}
.tree-opt:hover{background-color:#e3e3e3;}
 </style>
</head>
<body>

<!-- ▼ header  --> 
  	<%@ include file="/admin/inc/banner_top.jsp"%> 
<!-- ▲ header  -->
	<!-- ▼ container  --> 
	<div class="contents clearfix">
	
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 40px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/pageManage/icon_code.png">
				<span class="title-name"><ui:i18n key="店铺菜单权限设置"/></span>
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
       		<div class="form-table" style="width:100%;">
       		 	<table class="ftable">
       		 		<colgroup>
    		 			<col width="10%" />
    		 			<col width="20%" />
    		 			<col width="10%" />
    		 			<col width="20%" />
    		 			<col  />
    		 		</colgroup>
    		 		<tr>
    		 			<td class="flabel last"><ui:i18n key="公司"/>：</td>
    		 			<td class="fcomp last">
    		 				<select class="select2" style="width:100%"  data-placeholder="<ui:i18n key="请选择"/>" id="corpId">
    		 					<option value=""></option>
    		 					<c:forEach items="${companyCombo }" var="item">
    		 					<option value="${item.comboKey }"><ui:i18n key="${item.comboValue }"/></option>
    		 					</c:forEach>	 					
    		 				</select>
    		 			</td>
    		 			<td class="flabel last"><ui:i18n key="店铺"/>：</td>
    		 			<td class="fcomp last">
    		 				<select class="select2" style="width:100%"  data-placeholder="<ui:i18n key="请选择"/>" id="shopId">
    		 					<option value=""></option>
    		 				</select>
    		 			</td>
    		 			<td ></td>
    		 		</tr>
       		 	</table>
       		</div>
      	</div>
  		<!-- ▲ 查询表单区域  -->
	
	
		
		<div class="clearfix" style="margin-top: 10px;">
			<span class="tree-opt js-check-all"><ui:i18n key="全选"/></span>
			<span class="tree-opt js-uncheck-all"><ui:i18n key="全部取消"/></span>
			<span class="tree-opt js-open-all"><ui:i18n key="全部展开"/></span>
			<span class="tree-opt js-close-all"><ui:i18n key="全部关闭"/></span>
			<!-- 
			<span class="tree-opt js-show_stripes">show stripes</span>
			<span class="tree-opt js-hide_stripes">hide stripes</span>
			<span class="tree-opt js-show_dots">show dots</span>
			<span class="tree-opt js-hide_dots">hide dots</span>
			<span class="tree-opt js-show_icons">show icons</span>
			<span class="tree-opt js-hide_icons">hide icons</span> 
			-->
		</div>
		
		<div class="menu-tree-warp js-menu-tree-warp">
			<div id="treeContainer">
			   
			</div>
		</div>
		 
		<div class="text-center" style="margin-top: 10px;" >
		 	<div class="buttons-action">
 				<span class="button bg-red js-save-auth">
					<!-- <span class="button-icon conform"></span> -->
					<ui:i18n key="保存"/>
				</span>
			</div>
	 	</div>
	</div>
	
	<!-- ▲ container  -->
</body>
</html>