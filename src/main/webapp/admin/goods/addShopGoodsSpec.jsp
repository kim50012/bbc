<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0L);

	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />
 <!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商品登记::添加商品规格</title>  
  <link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />  
 <link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />  
 <link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/common.css" />  
  <link rel="stylesheet" type="text/css" href="/admin/css/custom.css" />  
  
	<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
	<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
	<script type="text/javascript" src="/admin/js/template.js"></script>
	<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/admin/js/jquery.ui.datepicker-zh-CN.js"></script>
	<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="/admin/js/select2.min.js"></script>
	<script type="text/javascript" src="/admin/js/select2_locale_zh-CN.js"></script>
 	<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
 
 
 
<script type="text/javascript">
$(function(){
	
	$(".select2").select2({
		 minimumResultsForSearch:5
		 ,allowClear: true 
	}); 
	
	
	$("#goods-class-level1").change(function(e){ 
		if($(this).val() == ''){
			$('#goods-class-level1-text').attr("disabled", false);
		}else{
		    $('#goods-class-level1-text').attr("disabled", true).val('');
		}
		$('.del-tag').each(function(){
			$(this).trigger('click');
		});
		
	});
	  
	  
	$('.del-tag').click(function(){
	    $(this).parent().parent().next().remove(); 
	    $(this).parent().parent().remove();
	});

	 $('#goods-tag-add').popover({
		placement : 'bottom',
		html : true,
		content:  '<div style="">'
				+ 	'<input type="text" id="goods-tag-input" placeholder="请输入商品名称..." style="margin-top:5px;" class="w21">'
				+ 	'<span class="btn js-btn-confirm">确定</span>'
				+ 	'<span class="btn js-btn-cancel">取消</span>'
				+ '</div>'
	});
 
 	var popoverObj = $('#goods-tag-add').data('popover');
	popoverObj.tip().on('click', '.js-btn-confirm', function(evt){
		var tag = $('#goods-tag-input').val() || '';
		var item 	= '<li>'
			 		+ 	'<span class="tag-split">'
			 		+ 		tag
			 		+	'</span>'
			 		+ 	'<a href="javascript:void(0);"><img class="del-tag" alt="" src="/admin/images/icon/icon-close.png"></a>'
			 		+ '</li>'
			 		+ '<li class="li-sp"><img alt="" src="/admin/images/icon/icon-sp.png"></li>';
	 		
	 		$('#goods-tag-add').parent().before(item);
	 		$('#goods-tag-add').popover('hide');
	 		
	 		$('.del-tag').unbind('click');
	 		$('.del-tag').click(function(){
	 	        $(this).parent().parent().next().remove(); 
	 	        $(this).parent().parent().remove();
	 		});
		
	 })
	popoverObj.tip().on('click', '.js-btn-cancel', function(evt){
		 $('#goods-tag-add').popover('hide');
	 })
	 
	 $('#addShopClass').click(function(){
		 
		 var goodslevel1 = $('#goods-class-level1').val();	
		 var goodslevel1text = $('#goods-class-level1-text').val();	
		 var goodslevel2text = '';
		 if(goodslevel1 == '' && goodslevel1text==''){
			 alert('一级分类不能为空');
			 return false;
			 
		 }
		 if($('.tag-split').size() == 0 ){
			 alert('二级分类不能为空');
			 return false;
		 }
		 
		 var temparr = [];
		 $('.tag-split').each(function(){
			 temparr.push($(this).val());
		 });
		 
		 goodslevel2text = _.uniq(temparr).join(',');
		 
		 $.ajax({
   	 		data:{
   	 			gcId: $('#gcId').val(),
   	 			goodslevel1: goodslevel1,
   	 			goodslevel1text : goodslevel1text,
   	 			goodslevel2text : goodslevel2text
   	 		},
			type : "POST",
			url : "/admin/goods/saveShopGoodsSpec.htm",
			success : function(data) {
				alet('添加成功');
				window.parent.$('#modal_test').modal('hide');
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
		 
	 });
});
</script>

<style type="text/css">

.modal-popup-body {
 min-width: 500px;
}
.modal-popup {
  width : 100%;  
}

.modal-popup .form-horizontal .control-label {
	width: 80px;
}

.modal-popup .form-horizontal .controls {
margin-left: 100px;
}


 .goods-tag li{
	height: 30px; 
	line-height:30px; 
	float:left;
}
.goods-tag li.li-sp{
	margin-left: 8px;
	margin-right: 8px;
}
 .goods-tag .del-tag{
	padding-left: 5px;
}

 .goods-tag  .popover{
	max-width : 500px;
 }
 
 
 .select2-results {
	max-height: 70px;
}
</style>
 
</head>
<body class="modal-popup-body" style="overflow-x:hidden;overflow-y: auto;">
	 <form action="">
	 	<input type="hidden" id="gcId" name="gcId" value="${gcId }">
	 </form>
	<!-- ▼ Main container --> 
        <div class="  modal-popup" >
        	 <form class="form-horizontal" novalidate="">
				<div class="control-group">
        			<label class="control-label">一级分类：</label>
        			<div class="controls">
            			<select id="goods-class-level1" data-placeholder="请选择" class="select2 sw39"   >
				            <option value=""></option>
				            <c:forEach items="${requestScope.bigSpecCombo}" var="items" varStatus="status">
								<option value="${items.SPEC_ID}">${items.SPEC_NM}</option>
							</c:forEach>
			         	 </select>
        			</div>
    			</div>
    			<div class="control-group">
        			<label class="control-label"></label>
        			<div class="controls">
			         	 <input type="text" id="goods-class-level1-text" placeholder="请输入一级分类..." class="w39">
        			</div>
    			</div>
    			<div class="control-group">
        			<label class="control-label">二级分类：</label>
        			<div class="controls">
            			<input type="hidden" id="goods-class-level2-text"  >
            			<div class="clearfix" style="width: 100%;position: relative; ">
	            			<ul class="goods-tag">
		  			 	 	 	<li><img id="goods-tag-add" class="ic-plus2" src="/admin/images/icon/icon-plus2.png"  >二级分类添加</li>
		  			 	 	 </ul>
            			</div>
        			</div>
    			</div>
    			<div style="position: absolute; bottom: 10px;margin-right: auto;margin-left: auto; text-align: center; width: 90%;">
    				<img id="addShopClass" src="/admin/images/goodsClass/save.png">
    			</div>
			</form>
        </div>

		<!-- ▲ Main container -->
 
</body>
</html>