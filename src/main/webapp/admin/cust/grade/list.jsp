<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="等级管理 "/></title>  
<script type="text/javascript">
//弹出隐藏层
function ShowDivUpdate(gradeIdValue,shopIdValue,isUseValue){
	//等级值
	var gradeId = gradeIdValue;
	var shopId = shopIdValue;
	var isUse = isUseValue;
	//alert(createdDt);
	//等级删除时内容标记为只读
	if(isUse == 0){
		$('#select-update').attr('disabled','disabled');
		$('#gradeNameUpdate').attr('readonly','readonly');
		$('#baseQtyUpdate').attr('readonly','readonly');
		$('#basePriceUpdate').attr('readonly','readonly');
		$('#evCycle-update').attr('disabled','disabled');
		$('#extended-update').attr('disabled','disabled');
		$('#buyPoint-update').attr('disabled','disabled');
		$('#sellForCash-update').attr('readonly','readonly');
	}
	//取消只读
	if(isUse == 1){
		$('#select-update').attr('disabled','disabled');
		$('#gradeNameUpdate').removeAttr('readonly');
		$('#baseQtyUpdate').removeAttr('readonly');
		$('#basePriceUpdate').removeAttr('readonly');
		$('#evCycle-update').removeAttr('disabled');
		$('#extended-update').removeAttr('disabled');
		$('#buyPoint-update').removeAttr('disabled');
		$('#sellForCash-update').removeAttr('readonly');
	} 
	var params = {
		gradeId : gradeId,
		shopId : shopId,
		isUse : isUse
	 };
	$.ajax({
		data : params,
		url : '/admin/cust/grade/gradeSelById.htm',
		success : function(data){
			if (data.result == 'success'){
				//input传值
				$('#select-update').select2('val',data.adminGrade.gradeId);
				$('#shopIdUpdate').val(data.adminGrade.shopId);
				$('#gradeNameUpdate').val(data.adminGrade.gradeName);
				$('#gradeNm').val(data.adminGrade.gradeName);
				$('#baseQtyUpdate').val(data.adminGrade.baseQty);
				$('#basePriceUpdate').val(data.adminGrade.basePrice);
				$('#isUseUpdate').val(data.adminGrade.isUse);
				$('#evCycle-update').select2('val',data.adminGrade.evCycle);
				$('#extended-update').select2('val',data.adminGrade.extended);
				$('#buyPoint-update').select2('val',data.adminGrade.buyPoint);
				$('#sellForCash-update').val(data.adminGrade.sellForCash);
				
			} else if (data.result  ==  'fail'){
				alert('<ui:i18n key="请检查信息重新点击更新"/>.');
			}
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
	showBpopup({
		id : 'updatePopup',
		width : 520
	});	
};
//弹出隐藏层
function ShowDivCreate(){
	$('#createPopup input').val('');
	$('#createPopup .select2').select2('val','');
	showBpopup({
		id : 'createPopup',
		width : 520
	});	
};

//新建保存
function save() {
	//等级名称
	var gradeName = $('#gradeNameCreate').val();
	if(gradeName == ''){
		alert('<ui:i18n key="请输入等级名称"/>.');
		return;
	}
	var name = ''; 
	var flag = true;
	$('.gradeName').each(function(){  
		name = $(this).text();//向数组中添加元素  
		if(gradeName == name){
			flag = false;
		}
	});
	if(!flag){
		alert('<ui:i18n key="等级名称已存在"/>！');
		return;
	}
	
	//等级值
	var gradeId = $('#select-create') .val();//选中的值
	if(gradeId == ''){
		alert('<ui:i18n key="等级不能为空"/>.');
		return;
	}
	var grades = ''; 
	var flag = true;
	$('.gradeId').each(function(){  
		grades = $(this).text();//向数组中添加元素  
		if(gradeId == grades){
			flag = false;
		}
	});
	if(!flag){
		alert('<ui:i18n key="此条等级已经存在"/>！');
		return;
	}
	var length = $('.result-grid-tbody').find('tr').length;
	if(length == 0){
			
			//累计购买笔数
			var baseQty = $('#baseQtyCreate').val();
			//累计交易金额
			var basePrice = $('#basePriceCreate').val();
			//评价周期
			var evCycle = $('#evCycle-create').val();
			//有效期限
			var extended = $('#extended-create').val();
			//购买积分
			var buyPoint = $('#buyPoint-create').val();
			//积分值
			var sellForCash = $('#sellForCash-create').val();
			
			
			if(baseQty == ''||basePrice == ''){
				alert('<ui:i18n key="请输入累计成功交易笔数"/>.');
				return;
			}
			if(basePrice == ''){
				alert('<ui:i18n key="请输入累计购买金额"/>.');
				return;
			}
			if(evCycle == ''){
				alert('<ui:i18n key="请选择评价周期"/>.');
				return;
			}
			if(extended == ''){
				alert('<ui:i18n key="请选择有效期限"/>.');
				return;
			}
			/* if(buyPoint == ''){
				alert('<ui:i18n key="请选择积分比率"/>.');
				return;
			} */
			/* if(sellForCash == ''){
				alert('<ui:i18n key="请输入积分值"/>.');
				return;
			} */
			if(isNaN(baseQty) || isNaN(basePrice)){
				alert('<ui:i18n key="购买笔数和交易金额必须为数字"/>！');
				return;
			}
			if(isNaN(sellForCash)){
				alert('<ui:i18n key="积分值必须为数字"/>！');
				return;
			}
			//alert(evCycle+'-'+extended+'-'+buyPoint);
			var params = {
				gradeId : gradeId,
				gradeName : gradeName,
				baseQty : baseQty,
				basePrice : basePrice,
				evCycle : evCycle,
				extended : extended,
				buyPoint : buyPoint,
				sellForCash : sellForCash
			};
			$.ajax({
		 		data : params,
		 		url : '/admin/cust/grade/gradeSave.htm',
		 		success : function(res){
		 			if (res.success){
		 				alert('<ui:i18n key="添加成功"/>.');
		 				window.location.reload();
		 			} else {
		 				alert('<ui:i18n key="请检查信息重新点击添加"/>.\n' + res.err_msg);
		 			}
		 		},
		 		error : function(a, msg, c){
		 			alert('error: ' + msg);
		 		}
			});
	}else{
		var params = {gradeId : gradeId,};
		$.ajax({
	 		data : params,
	 		url : '/admin/cust/grade/gradeSelByMaxId.htm',
	 		success : function(data){
	 			if (data.result == 'success'){
	 					 				
	 				//累计购买笔数
	 				var baseQty = $('#baseQtyCreate').val();
	 				//累计交易金额
	 				var basePrice = $('#basePriceCreate').val();
	 				//评价周期
	 				var evCycle = $('#evCycle-create').val();
	 				//有效期限
	 				var extended = $('#extended-create').val();
	 				//购买积分
	 				var buyPoint = $('#buyPoint-create').val();
	 				//积分值
	 				var sellForCash = $('#sellForCash-create').val();
	 				
	 				if(baseQty == ''){
	 					alert('<ui:i18n key="请输入累计成功交易笔数"/>.');
	 					return;
	 				}
	 				if(basePrice == ''){
	 					alert('<ui:i18n key="请输入累计购买金额"/>.');
	 					return;
	 				}
	 				if(evCycle == ''){
	 					alert('<ui:i18n key="请选择评价周期"/>.');
	 					return;
	 				}
	 				if(extended == ''){
	 					alert('<ui:i18n key="请选择有效期限"/>.');
	 					return;
	 				}
	 				/* if(buyPoint == ''){
	 					alert('<ui:i18n key="请选择积分比率"/>.');
	 					return;
	 				} */
	 				/* if(sellForCash == ''){
	 					alert('<ui:i18n key="请输入积分值"/>.');
	 					return;
	 				} */
	 				if(isNaN(baseQty) || isNaN(basePrice)){
	 					alert('<ui:i18n key="购买笔数和交易金额必须为数字"/>！');
	 					return;
	 				}
	 				if(isNaN(sellForCash)){
						alert('<ui:i18n key="积分值必须为数字"/>！');
						return;
					}
	 				//alert(evCycle+'-'+extended+'-'+buyPoint);
	 				if(data.adminGrade1 != null){
	 					var baseQtyMax = data.adminGrade1.baseQty;
	 	 				var basePriceMax = data.adminGrade1.basePrice;
	 	 				if(parseInt(baseQty) <= parseInt(baseQtyMax)){
	 	 					alert('<ui:i18n key="购买笔数必须大于下一级别"/>！');
	 	 					return;
	 	 				}
	 	 				if(parseInt(basePrice) <= parseInt(basePriceMax)){
	 	 					alert('<ui:i18n key="交易金额必须大于下一级别"/>！');
	 	 					return;
	 	 				}
	 				}
	 				if(data.adminGrade2 != null){
	 					var baseQtyMin = data.adminGrade2.baseQty;
	 	 				var basePriceMin = data.adminGrade2.basePrice;
	 	 				if(parseInt(baseQty) >= parseInt(baseQtyMin)){
	 	 					alert('<ui:i18n key="购买笔数必须小于上一级别"/>！');
	 	 					return;
	 	 				}
	 	 				if(parseInt(basePrice) >= parseInt(basePriceMin)){
	 	 					alert('<ui:i18n key="交易金额必须小于上一级别"/>！');
	 	 					return;
	 	 				}
	 				}
	 				var params = {
	 					gradeId : gradeId,
	 					gradeName : gradeName,
	 					baseQty : baseQty,
	 					basePrice : basePrice,
	 					evCycle : evCycle,
	 					extended : extended,
	 					buyPoint : buyPoint,
	 					sellForCash : sellForCash
	 				};
	 				$.ajax({
	 			 		data : params,
	 			 		url : '/admin/cust/grade/gradeSave.htm',
	 			 		success : function(res){
	 			 			if (res.success){
	 			 				alert('<ui:i18n key="添加成功"/>.');
	 			 				window.location.reload();
	 			 			} else {
	 			 				alert('<ui:i18n key="请检查信息重新点击添加"/>.\n' + res.err_msg);
	 			 			}
	 			 		},
	 			 		error : function(a, msg, c){
	 			 			alert('error: ' + msg);
	 			 		}
	 				});
	 			} else {
	 				alert('<ui:i18n key="请检查信息重新点击添加"/>.');
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
		});
	}
}
//开启等级状态
function start(gradeIdValue,shopIdValue,gradeNameValue,baseQtyValue,basePriceValue) {
	//店铺Id
 	var shopId = shopIdValue;
	//等级值
	var gradeId = gradeIdValue;
	//等级名称
	var gradeName = gradeNameValue;
	//累计购买笔数
	var baseQty = baseQtyValue;
	//累计交易金额
	var basePrice = basePriceValue;
	//当前状态

	var isUse = 1;
	var conf = window.confirm('<ui:i18n key="确定要启用本条等级吗"/>？');
    if(conf == false) {
        return ;
        }
    else {
	var params = {
		shopId : shopId,
		gradeId : gradeId,
		gradeName : gradeName,
		baseQty : baseQty,
		basePrice : basePrice,
		isUse : isUse,
	 };
	 $.ajax({
	 		data : params,
	 		url : '/admin/cust/grade/gradeUpdate.htm',
	 		success : function(res){
	 			if (res.success){	
	 				alert('<ui:i18n key="启用成功"/>');
	 				window.location.reload();
	 			} else {
	 				alert('<ui:i18n key="请检查信息重新点击启用按钮"/>.\n' + res.err_msg);
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
	 	});
     }
}
//修改数据
 function update() {
 	//店铺Id
 	var shopId = $('#shopIdUpdate').val();
	//等级值
	var gradeId = $('#select-update') .val();

	var params = {gradeId : gradeId,};
	$.ajax({
 		data : params,
 		url : '/admin/cust/grade/gradeSelByMaxId.htm',
 		success : function(data){
 			if (data.result == 'success'){
 				//等级名称
 				var gradeName = $('#gradeNameUpdate').val();
 				if(gradeName == ''){
 					alert('<ui:i18n key="请输入等级名称"/>.');
 					return;
 				}
 				var name = ''; 
 				var flag = true;
 				var gradeNm = $('#gradeNm').val();
 				$('.gradeName').each(function(){
 					name = $(this).text();//向数组中添加元素  
					if(name != gradeNm){
						if(gradeName == name){
	 						flag = false;
	 					}
 					}
 				});
 				if(!flag){
 					alert('<ui:i18n key="等级名称已存在"/>！');
 					return;
 				}
				//累计购买笔数
				var baseQty = $('#baseQtyUpdate').val();
				//累计交易金额
				var basePrice = $('#basePriceUpdate').val();
				//评价周期
 				var evCycle = $('#evCycle-update').val();
 				//有效期限
 				var extended = $('#extended-update').val();
 				//购买积分
 				var buyPoint = $('#buyPoint-update').val();
 				//积分值
 				var sellForCash = $('#sellForCash-update').val();
 				//是否启用
 				var isUse= $('#isUseUpdate').val();
 				if(baseQty == ''){
 					alert('<ui:i18n key="请输入累计成功交易笔数"/>.');
 					return;
 				}
 				if(basePrice == ''){
 					alert('<ui:i18n key="请输入累计购买金额"/>.');
 					return;
 				}
 				if(evCycle == ''){
 					alert('<ui:i18n key="请选择评价周期"/>.');
 					return;
 				}
 				if(extended == ''){
 					alert('<ui:i18n key="请选择有效期限"/>.');
 					return;
 				}
 				/* if(buyPoint == ''){
 					alert('<ui:i18n key="请选择积分比率"/>.');
 					return;
 				} */
 				/* if(sellForCash == ''){
 					alert('<ui:i18n key="请输入积分值"/>.');
 					return;
 				} */
				if(isNaN(baseQty) || isNaN(basePrice)){
					alert('<ui:i18n key="购买笔数和交易金额必须为数字"/>！');
					return;
				}
				if(isNaN(sellForCash)){
					alert('<ui:i18n key="积分值必须为数字"/>！');
					return;
				}
				if(data.adminGrade1 != null){
 					var baseQtyMax = data.adminGrade1.baseQty;
 	 				var basePriceMax = data.adminGrade1.basePrice;
 	 				if(parseInt(baseQty) <= parseInt(baseQtyMax)){
 	 					alert('<ui:i18n key="购买笔数必须大于下一级别"/>！');
 	 					return;
 	 				}
 	 				if(parseInt(basePrice) <= parseInt(basePriceMax)){
 	 					alert('<ui:i18n key="交易金额必须大于下一级别"/>！');
 	 					return;
 	 				}
 				}
 				if(data.adminGrade2 != null){
 					var baseQtyMin = data.adminGrade2.baseQty;
 	 				var basePriceMin = data.adminGrade2.basePrice;
 	 				if(parseInt(baseQty) >= parseInt(baseQtyMin)){
 	 					alert('<ui:i18n key="购买笔数必须小于上一级别"/>！');
 	 					return;
 	 				}
 	 				if(parseInt(basePrice) >= parseInt(basePriceMin)){
 	 					alert('<ui:i18n key="交易金额必须小于上一级别"/>！');
 	 					return;
 	 				}
 				}
				var params = {
					shopId : shopId,
					gradeId : gradeId,
					gradeName : gradeName,
					baseQty : baseQty,
					basePrice : basePrice,
					isUse : isUse,
					evCycle : evCycle,
 					extended : extended,
 					buyPoint : buyPoint,
 					sellForCash : sellForCash
				 };
				 $.ajax({
			 		data : params,
			 		url : '/admin/cust/grade/gradeUpdate.htm',
			 		success : function(res){
			 			if (res.success){	
			 				alert('<ui:i18n key="更新成功"/>');
			 				window.location.reload();
			 			} else {
			 				alert('<ui:i18n key="请检查信息重新点击更新"/>.\n' + res.err_msg);
			 			}
			 		},
			 		error : function(a, msg, c){
			 			alert('error: ' + msg);
			 		}
			 	});
 			} else {
 				alert('<ui:i18n key="请检查信息重新点击更新"/>.');
 			}
 		},
 		error : function(a, msg, c){
 			alert('error: ' + msg);
 		}
	});
}
//删除数据
function deleteGrade(gradeIdValue,shopIdValue,gradeNameValue,baseQtyValue,basePriceValue,isUseValue) {
	var isUse = isUseValue;
		//alert(isUse);
		if(isUse == 0){
		alert('<ui:i18n key="当前状态已经是停用状态"/>.');
		return;
	}	
	var conf = window.confirm('<ui:i18n key="确定要停用本条等级吗"/>？');
      	if(conf == false) {
            return ;
        } 
      else {           
		//店铺Id
		var shopId = shopIdValue;
		//等级值
		var gradeId = gradeIdValue;
		//等级名称
		var gradeName = gradeNameValue;
		//累计购买笔数
		var baseQty = baseQtyValue;
		//累计交易金额
		var basePrice = basePriceValue;

		var params = {
			shopId : shopId,
			gradeId : gradeId,
			gradeName : gradeName,
			baseQty : baseQty,
			basePrice : basePrice,
		 };
	    $.ajax({
	 		data : params,
	 		url : '/admin/cust/grade/gradeDelete.htm',
	 		success : function(res){
	 			if (res.success){
	 				alert('<ui:i18n key="停用成功"/>');
	 				window.location.reload();
	 			} else {
	 				alert('<ui:i18n key="请检查信息重新点击停用"/>.\n' + res.err_msg);
	 			}
	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
	 	});
      }
}

</script>
</head>
<body>
	<!-- ▼ Main container --> 
    <div class="container">
		<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="ShowDivCreate();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col width="20%" />
		      		 			<col width="20%" />
		      		 			<col width="10%" />
		      		 			<col width="20%" />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="等级"/></th>
			      		 		<th><ui:i18n key="等级名"/></th>
			      		 		<th><ui:i18n key="累计成功交易"/>（<ui:i18n key="笔"/>）</th>
			      		 		<th><ui:i18n key="累计购买金额"/>（<ui:i18n key="元"/>）</th>
			      		 		<th><ui:i18n key="当前状态"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 <c:forEach items="${gradelist}" var="grade">
			      		 	<tr>
			      		 		<td class="gradeId">${grade.gradeId}</td>
			      		 		<td class="gradeName">${grade.gradeName}</td>
			      		 		<td>${grade.baseQty}</td>
			      		 		<td>${grade.basePrice}</td>
			      		 		<c:if test="${grade.isUse==0}">
		           					<td style="text-align:center;"><ui:i18n key="停用"/></td>
		           				</c:if>
		           				<c:if test="${grade.isUse==1}">
		           					<td style="text-align:center;"><ui:i18n key="启用"/></td>
		           				</c:if>
			      		 		<td>
			      		 			<span class="gridbutton red"  onclick="ShowDivUpdate('${grade.gradeId}','${grade.shopId}' ,'${grade.isUse}');"><ui:i18n key="编辑"/></span>
			      		 			<c:if test="${grade.isUse==0}">									
										<span class="gridbutton green"  onclick="start('${grade.gradeId}','${grade.shopId}','${grade.gradeName}','${grade.baseQty}','${grade.basePrice}');"><ui:i18n key="启用"/></span>
									</c:if>
									<c:if test="${grade.isUse==1}">
										<span class="gridbutton red"  onclick="deleteGrade('${grade.gradeId}','${grade.shopId}','${grade.gradeName}','${grade.baseQty}','${grade.basePrice}','${grade.isUse}');"><ui:i18n key="停用"/></span>
									</c:if>	
			      		 		</td>
			      		 	</tr>
			      		 </c:forEach>
			      		 </tbody>
			      		 <tfoot>
				      		 <tr style="height: 30px">	
				      		 	<td colspan="3">		     
									<span style="color: #d1102d"><ui:i18n key="自动升级条件"/>：</span><span><ui:i18n key="消费笔数达到累计成功交易笔数或消费金额达到累计购买金额"/></span>	
	          					</td>
	          					<td colspan="3" align="right">
	          						<span><ui:i18n key="共"/><font color="#d1102d">${requestScope.size}</font><ui:i18n key="条"/></span>
	          					</td>
	          				 </tr>
			      		 </tfoot>
			      	</table>
   				</div> 
	     	</div>
     	</div>
	</div>
        	
       	<!-- ▼ bpopup area -->
		<div class="bpopup2" id="createPopup">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="新建"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<!--  方式1 -->
		 		 	<!-- <iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
		 		 	 -->
		 		 	 <!--  方式2 -->
		 		 	 <div class="bpopupInner js-bpopup-inner"> 
		 		 	    <form action="">
		 		 	    		<div class="form-warp clearfix" >
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label"  style="width: 80px;font-size: 12px;padding-left: 0">
						  			 		<ui:i18n key="等级名称"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text" id="gradeNameCreate" autocomplete="off"  placeholder="<ui:i18n key="请输入等级名称"/>" style="width: 130px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 80px;text-align: center;">
						  			 	 	<ui:i18n key="等级值"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="select-create" class="select2" data-placeholder="<ui:i18n key="请选择等级"/>" style="width: 110px">
				       							<option value=""></option>
				       							<option value="1">1</option>
				       							<option value="2">2</option>
				       							<option value="3">3</option>
				       							<option value="4">4</option>
				       							<option value="5">5</option>
				       							<option value="6">6</option>
				       							<option value="7">7</option>
				       							<option value="8">8</option>
				       							<option value="9">9</option>
				       							<option value="10">10</option>
				       						</select>
						  			 	 </div>
						  			 </div>
						  			
						  			 <div class="control-warp">
						  			 	 <div class="form-label"  style="width: 90px;font-weight: bold;margin-top: 15px;padding-left: 0">
						  			 		<ui:i18n key="升级条件"/><a class="label-required"></a>：
						  			 	 </div>
						  			 	 <div class="form-label"  style="width: 110px;padding-left: 0">
						  			 		<ui:i18n key="累计成功交易"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="baseQtyCreate" autocomplete="off" placeholder="<ui:i18n key="请输入累计成功交易笔数"/>" style="width: 158px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label"  style="width: 20px">
						  			 		<ui:i18n key="笔"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;text-align:center;padding-left: 0" >
						  			 		<ui:i18n key="且"/>
						  			 	 </div>
						  			 	  <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="累计购买金额"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="basePriceCreate" autocomplete="off" placeholder="<ui:i18n key="请输入累计购买金额"/>" style="width: 158px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label"  style="width: 20px">
						  			 		<ui:i18n key="元"/>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;font-weight: bold;margin-top: 15px;padding-left: 0" >
						  			 		<ui:i18n key="等级变更"/><a class="label-required"></a>：
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="评价周期"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="evCycle-create" class="select2" data-placeholder="<ui:i18n key="请选择评价周期"/>" style="width: 180px">
					       						<option value=""></option>
				       							<option value="0"><ui:i18n key="无"/></option>
				       							<option value="1">1<ui:i18n key="个月"/></option>
				       							<option value="2">2<ui:i18n key="个月"/></option>
				       							<option value="3">3<ui:i18n key="个月"/></option>
				       							<option value="4">4<ui:i18n key="个月"/></option>
				       							<option value="5">5<ui:i18n key="个月"/></option>
				       							<option value="6">6<ui:i18n key="个月"/></option>
				       							<option value="7">7<ui:i18n key="个月"/></option>
				       							<option value="8">8<ui:i18n key="个月"/></option>
				       							<option value="9">9<ui:i18n key="个月"/></option>
				       							<option value="10">10<ui:i18n key="个月"/></option>
				       							<option value="11">11<ui:i18n key="个月"/></option>
				       							<option value="12">12<ui:i18n key="个月"/></option>
				       							<option value="13">13<ui:i18n key="个月"/></option>
				       							<option value="14">14<ui:i18n key="个月"/></option>
				       							<option value="15">15<ui:i18n key="个月"/></option>
				       							<option value="16">16<ui:i18n key="个月"/></option>
				       							<option value="17">17<ui:i18n key="个月"/></option>
				       							<option value="18">18<ui:i18n key="个月"/></option>
				       							<option value="19">19<ui:i18n key="个月"/></option>
				       							<option value="20">20<ui:i18n key="个月"/></option>
				       							<option value="21">21<ui:i18n key="个月"/></option>
				       							<option value="22">22<ui:i18n key="个月"/></option>
				       							<option value="23">23<ui:i18n key="个月"/></option>
				       							<option value="24">24<ui:i18n key="个月"/></option>
				       						</select>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;text-align:center;padding-left: 0" >
						  			 		<ui:i18n key="且"/>
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="有效期限"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="extended-create" class="select2" data-placeholder="<ui:i18n key="请选择有效期限"/>" style="width: 180px">
					       						<option value=""></option>
				       							<option value="0"><ui:i18n key="无"/></option>
				       							<option value="1">1<ui:i18n key="个月"/></option>
				       							<option value="2">2<ui:i18n key="个月"/></option>
				       							<option value="3">3<ui:i18n key="个月"/></option>
				       							<option value="4">4<ui:i18n key="个月"/></option>
				       							<option value="5">5<ui:i18n key="个月"/></option>
				       							<option value="6">6<ui:i18n key="个月"/></option>
				       							<option value="7">7<ui:i18n key="个月"/></option>
				       							<option value="8">8<ui:i18n key="个月"/></option>
				       							<option value="9">9<ui:i18n key="个月"/></option>
				       							<option value="10">10<ui:i18n key="个月"/></option>
				       							<option value="11">11<ui:i18n key="个月"/></option>
				       							<option value="12">12<ui:i18n key="个月"/></option>
				       							<option value="13">13<ui:i18n key="个月"/></option>
				       							<option value="14">14<ui:i18n key="个月"/></option>
				       							<option value="15">15<ui:i18n key="个月"/></option>
				       							<option value="16">16<ui:i18n key="个月"/></option>
				       							<option value="17">17<ui:i18n key="个月"/></option>
				       							<option value="18">18<ui:i18n key="个月"/></option>
				       							<option value="19">19<ui:i18n key="个月"/></option>
				       							<option value="20">20<ui:i18n key="个月"/></option>
				       							<option value="21">21<ui:i18n key="个月"/></option>
				       							<option value="22">22<ui:i18n key="个月"/></option>
				       							<option value="23">23<ui:i18n key="个月"/></option>
				       							<option value="24">24<ui:i18n key="个月"/></option>
				       						</select>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;font-weight: bold;margin-top: 15px;padding-left: 0" >
						  			 		<ui:i18n key="获取积分"/>：
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="积分比率"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="buyPoint-create" class="select2" data-placeholder="<ui:i18n key="请选择积分比率"/>" style="width: 180px">
					       						<option value=""></option>
				       							<option value="0"><ui:i18n key="无"/></option>
				       							<option value="10">10%</option>
				       							<option value="20">20%</option>
				       							<option value="30">30%</option>
				       							<option value="40">40%</option>
				       							<option value="50">50%</option>
				       							<option value="60">60%</option>
				       							<option value="70">70%</option>
				       							<option value="80">80%</option>
				       							<option value="90">90%</option>
				       							<option value="100">100%</option>
				       						</select>
						  			 	 </div>
						  			 </div> 
						  			 <div class="control-warp" style="margin: 0;padding: 0;" >
						  			 	 <div class="form-label" style="width: 90px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-control" style="color:graytext;padding-left: 0">
						  			 	 	<ui:i18n key="消费后获得购买金额所选百分比的积分"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="抵换现金1元"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="sellForCash-create" autocomplete="off" placeholder="<ui:i18n key="请输入积分值"/>" style="width: 158px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 20px" >
						  			 		<ui:i18n key="积分值"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp" style="margin: 0;padding: 0" >
						  			 	 <div class="form-label" style="width: 90px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-control" style="color:graytext;padding-left: 0">
						  			 	 	<ui:i18n key="输入的积分值可抵现金1元"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp text-center" style="height: 30px">
						  			 	<div class="popup-form-actions" style="margin-top: 10px">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm"  onclick="save();">
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
       <!-- end用户等级管理新建-->
       
       
       <!-- start用户等级管理修改 --> 
        	
		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="updatePopup">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="修改"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
				<input type="hidden" name="shopId" id="shopIdUpdate" value="" >
	     		<input type="hidden" name="isUse" id="isUseUpdate" value="">
	     		<input type="hidden" name="gradeNm" id="gradeNm" value="">
		 		 <div class="bpopupContentWarp"> 
		 		 	<!--  方式1 -->
		 		 	<!-- <iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
		 		 	 -->
		 		 	 <!--  方式2 -->
		 		 	 <div class="bpopupInner js-bpopup-inner"> 
		 		 	    <form action="">
		 		 	    		<div class="form-warp clearfix" >
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label"  style="width: 80px;font-size: 12px;padding-left: 0">
						  			 		<ui:i18n key="等级名称"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text" id="gradeNameUpdate" autocomplete="off" placeholder="<ui:i18n key="请输入等级名称"/>" style="width: 130px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 80px;text-align: center;">
						  			 	 	<ui:i18n key="等级值"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="select-update" class="select2" data-placeholder="<ui:i18n key="请选择等级"/>" style="width: 110px">
				       							<option value=""></option>
				       							<option value="1">1</option>
				       							<option value="2">2</option>
				       							<option value="3">3</option>
				       							<option value="4">4</option>
				       							<option value="5">5</option>
				       							<option value="6">6</option>
				       							<option value="7">7</option>
				       							<option value="8">8</option>
				       							<option value="9">9</option>
				       							<option value="10">10</option>
				       						</select>
						  			 	 </div>
						  			 </div>
						  			
						  			 <div class="control-warp">
						  			 	 <div class="form-label"  style="width: 90px;font-weight: bold;margin-top: 15px;padding-left: 0">
						  			 		<ui:i18n key="升级条件"/><a class="label-required"></a>：
						  			 	 </div>
						  			 	 <div class="form-label"  style="width: 110px;padding-left: 0">
						  			 		<ui:i18n key="累计成功交易"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="baseQtyUpdate" autocomplete="off" placeholder="<ui:i18n key="请输入累计成功交易笔数"/>" style="width: 158px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label"  style="width: 20px">
						  			 		<ui:i18n key="笔"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;text-align:center;padding-left: 0" >
						  			 		<ui:i18n key="且"/>
						  			 	 </div>
						  			 	  <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="累计购买金额"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="basePriceUpdate" autocomplete="off" placeholder="<ui:i18n key="请输入累计购买金额"/>" style="width: 158px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label"  style="width: 20px">
						  			 		<ui:i18n key="元"/>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;font-weight: bold;margin-top: 15px;padding-left: 0" >
						  			 		<ui:i18n key="等级变更"/><a class="label-required"></a>：
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="评价周期"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="evCycle-update" class="select2" data-placeholder="<ui:i18n key="请选择评价周期"/>" style="width: 180px">
					       						<option value=""></option>
				       							<option value="0"><ui:i18n key="无"/></option>
				       							<option value="1">1<ui:i18n key="个月"/></option>
				       							<option value="2">2<ui:i18n key="个月"/></option>
				       							<option value="3">3<ui:i18n key="个月"/></option>
				       							<option value="4">4<ui:i18n key="个月"/></option>
				       							<option value="5">5<ui:i18n key="个月"/></option>
				       							<option value="6">6<ui:i18n key="个月"/></option>
				       							<option value="7">7<ui:i18n key="个月"/></option>
				       							<option value="8">8<ui:i18n key="个月"/></option>
				       							<option value="9">9<ui:i18n key="个月"/></option>
				       							<option value="10">10<ui:i18n key="个月"/></option>
				       							<option value="11">11<ui:i18n key="个月"/></option>
				       							<option value="12">12<ui:i18n key="个月"/></option>
				       							<option value="13">13<ui:i18n key="个月"/></option>
				       							<option value="14">14<ui:i18n key="个月"/></option>
				       							<option value="15">15<ui:i18n key="个月"/></option>
				       							<option value="16">16<ui:i18n key="个月"/></option>
				       							<option value="17">17<ui:i18n key="个月"/></option>
				       							<option value="18">18<ui:i18n key="个月"/></option>
				       							<option value="19">19<ui:i18n key="个月"/></option>
				       							<option value="20">20<ui:i18n key="个月"/></option>
				       							<option value="21">21<ui:i18n key="个月"/></option>
				       							<option value="22">22<ui:i18n key="个月"/></option>
				       							<option value="23">23<ui:i18n key="个月"/></option>
				       							<option value="24">24<ui:i18n key="个月"/></option>
				       						</select>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;text-align:center;padding-left: 0" >
						  			 		<ui:i18n key="且"/>
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="有效期限"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="extended-update" class="select2" data-placeholder="<ui:i18n key="请选择有效期限"/>" style="width: 180px">
					       						<option value=""></option>
				       							<option value="0"><ui:i18n key="无"/></option>
				       							<option value="1">1<ui:i18n key="个月"/></option>
				       							<option value="2">2<ui:i18n key="个月"/></option>
				       							<option value="3">3<ui:i18n key="个月"/></option>
				       							<option value="4">4<ui:i18n key="个月"/></option>
				       							<option value="5">5<ui:i18n key="个月"/></option>
				       							<option value="6">6<ui:i18n key="个月"/></option>
				       							<option value="7">7<ui:i18n key="个月"/></option>
				       							<option value="8">8<ui:i18n key="个月"/></option>
				       							<option value="9">9<ui:i18n key="个月"/></option>
				       							<option value="10">10<ui:i18n key="个月"/></option>
				       							<option value="11">11<ui:i18n key="个月"/></option>
				       							<option value="12">12<ui:i18n key="个月"/></option>
				       							<option value="13">13<ui:i18n key="个月"/></option>
				       							<option value="14">14<ui:i18n key="个月"/></option>
				       							<option value="15">15<ui:i18n key="个月"/></option>
				       							<option value="16">16<ui:i18n key="个月"/></option>
				       							<option value="17">17<ui:i18n key="个月"/></option>
				       							<option value="18">18<ui:i18n key="个月"/></option>
				       							<option value="19">19<ui:i18n key="个月"/></option>
				       							<option value="20">20<ui:i18n key="个月"/></option>
				       							<option value="21">21<ui:i18n key="个月"/></option>
				       							<option value="22">22<ui:i18n key="个月"/></option>
				       							<option value="23">23<ui:i18n key="个月"/></option>
				       							<option value="24">24<ui:i18n key="个月"/></option>
				       						</select>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;font-weight: bold;margin-top: 15px;padding-left: 0" >
						  			 		<ui:i18n key="获取积分"/>：
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="积分比率"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<select id="buyPoint-update" class="select2" data-placeholder="<ui:i18n key="请选择积分比率"/>" style="width: 180px">
					       						<option value=""></option>
				       							<option value="0"><ui:i18n key="无"/></option>
				       							<option value="10">10%</option>
				       							<option value="20">20%</option>
				       							<option value="30">30%</option>
				       							<option value="40">40%</option>
				       							<option value="50">50%</option>
				       							<option value="60">60%</option>
				       							<option value="70">70%</option>
				       							<option value="80">80%</option>
				       							<option value="90">90%</option>
				       							<option value="100">100%</option>
				       						</select>
						  			 	 </div>
						  			 </div> 
						  			 <div class="control-warp" style="margin: 0;padding: 0;" >
						  			 	 <div class="form-label" style="width: 90px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-control" style="color:graytext;padding-left: 0">
						  			 	 	<ui:i18n key="消费后获得购买金额所选百分比的积分"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 90px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		<ui:i18n key="抵换现金1元"/>
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="sellForCash-update" autocomplete="off" placeholder="<ui:i18n key="请输入积分值"/>" style="width: 158px;font-size: 12px">
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 20px" >
						  			 		<ui:i18n key="积分值"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp" style="margin: 0;padding: 0" >
						  			 	 <div class="form-label" style="width: 90px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-label" style="width: 110px;padding-left: 0" >
						  			 		
						  			 	 </div>
						  			 	 <div class="form-control" style="color:graytext;padding-left: 0">
						  			 	 	<ui:i18n key="输入的积分值可抵现金1元"/>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp text-center" style="height: 30px">
						  			 	<div class="popup-form-actions" style="margin-top: 10px">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm"  onclick="update();">
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
		<!-- end用户等级管理修改 -->
	<!-- ▲ Main container -->
	
	
	<!-- ▼ Main footer -->
	<!-- ▲  Main footer -->
</body>
</html>