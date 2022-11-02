<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>

<style type="text/css">

.p-container {position: absolute; left: 0; top: 0; width: 100%; height: 100%; background-color: #fff;}

.p-ui-Select {width: 100%; height: 30px; margin-top: 20px;}
.p-ui-Select:first-of-type {margin-top: 30px;}
.p-ui-Select .p-ui-selectT {float: left; width: 30%; height: 30px; line-height: 30px; text-align: right;}
.p-ui-Select .p-ui-selectT span {margin-right: 10px;}
.p-ui-Select .p-ui-selectS {float: left; width: 70%; height: 30px; line-height: 30px;}
.p-ui-Select .p-ui-selectS select {margin-top: -4px;}

.placebtn {width: 220px; height: 30px; margin: 30px auto;}
.placebtn .btn-save {float: left; width: 90px; height: 30px; line-height: 30px; text-align: center; background-color: #d1102d; color: #fff; cursor: pointer;}
.placebtn .btn-cancel {float: right; width: 90px; height: 30px; line-height: 30px; text-align: center; background-color: #d1102d; color: #fff; cursor: pointer;}
.placebtn .button-icon.conform, .placebtn .button-icon.cancel {margin-bottom: -2px;}

.select2-results {max-height: 90px;}
.w300 {width: 300px;}
</style>

<script type="text/javascript">

 	$(document).ready(function () {
		
		$('#twoSelect').attr("disabled","disabled");
		$('#goodsSelect').attr("disabled","disabled");
		
		$("#oneSelect").change(function(e) { 

			var goodsOneId = $(this).val();
			var $combo = $('#twoSelect');
				$combo.select2('val','');
			 	$combo.html('<option value="" ></option>');//清空select内容
			 	
			if(goodsOneId == '') {
				
				$combo.prop("disabled", true).trigger("change");
			} else {
				
				$combo.prop("disabled", false);
				$.ajax({
					data:{goodsClassId: goodsOneId},
					type : "POST",
					url : "/admin/goods/ajaxSelectTwoClassList.htm",
					success : function(data) {
						
						var list = data.selectList;
						if (!!list.length) {
							 
							for(var i = 0 ; i < list.length ; i++) {
								
								$combo.append('<option value="' + list[i].goodsClassId + '">' + list[i].goodsClassNm + '</option>');
							}
							$combo.select2('open'); 
						}
					},
					error : function(xhr, status, e) {
						alert("error: " + status);
					}
	 			});
			}
		});

		$("#twoSelect").change(function(e) { 

			var goodsTwoId = $(this).val();
			var $combo = $('#goodsSelect');
				$combo.select2('val','');
			 	$combo.html('<option value="" ></option>');//清空select内容
			 	
			if (goodsTwoId == '') {
				
				$combo.prop("disabled", true).trigger("change");
			} else {
				
				$combo.prop("disabled", false);
				$.ajax({
	       	 		data:{goodsClassTwoId: goodsTwoId},
					type : "POST",
					url : "/admin/goods/ajaxSelectGoodsList.htm",
					success : function(data) {
						
						 var list = data.selectList;
						 if (!!list.length) {
							 
						 	for(var i = 0 ; i < list.length ; i++) {
						 		 
						 		$combo.append('<option value="' + list[i].goodsId + '">' + list[i].goodsNm + '</option>');
							}
							$combo.select2('open'); 
						 }
					},
					error : function(xhr, status, e) {
						alert("error: " + status);
					}
	 			});
			}
		});
	});
	
	//保存事件
	function save() {
		
		var twoSelectId = $('#twoSelect').val();
		var goodsSelectId = $('#goodsSelect').val();
		
		if (twoSelectId == "") {
			
			alert('<ui:i18n key="请选择第2级标准分类"/>.');
			return;
		}
		parent.goodsSpecBind(twoSelectId,goodsSelectId);
	}
	
	//取消
	function divClose() {

		parent.attributeClose();
	}
</script>
</head>
<body>
	<div class="p-container">
		<div class="p-ui-Select">
			<div class="p-ui-selectT">
				<span><ui:i18n key="第1级标准分类"/>：</span>
			</div>
			<div class="p-ui-selectS">
				<select id="oneSelect" data-placeholder="<ui:i18n key="请选择第1级标准分类"/>" class="select2 w300">
					<option value=""></option>
						<c:forEach items="${requestScope.oneSelectList}" var="items" varStatus="status">
							<option value="${items.goodsClassId}">${items.goodsClassNm}</option>
						</c:forEach>
				</select>
			</div>
		</div>
		<div class="p-ui-Select">
			<div class="p-ui-selectT">
				<span><ui:i18n key="第2级标准分类"/>：</span>
			</div>
			<div class="p-ui-selectS">
				<select id="twoSelect" data-placeholder="<ui:i18n key="请选择第2级标准分类"/>" class="select2 w300">
					<option value=""></option>
				</select>
			</div>
		</div>
		<div class="p-ui-Select">
			<div class="p-ui-selectT">
				<span><ui:i18n key="商品名称"/>：</span>
			</div>
			<div class="p-ui-selectS">
				<select id="goodsSelect" data-placeholder="<ui:i18n key="请选择商品"/>" class="select2 w300">
					<option value=""></option>
				</select>
			</div>
		</div>
		<div class="placebtn">
  			<div class="btn-save" onclick="save()">
				<span class="button-icon conform"></span>
				<span><ui:i18n key="保存"/></span>
  			</div>
  			<div class="btn-cancel" onclick="divClose()">
				<span class="button-icon cancel"></span>
				<span><ui:i18n key="取消"/></span>
  			</div>
		</div>	
	</div>
</body>
</html>