<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="积分管理 "/></title>  

<script type="text/javascript">
	//控制弹出新建积分规则
	function popupgoodsClass(){
		$('#createPopup input[type=text]').val('');
		$('#createPopup input[type=radio][name=pointType]').iCheck('uncheck'); 
		showBpopup({
			id : 'createPopup',
			width : 510
		});	
	}
	//控制弹出修改积分规则，并将其数据传入其中
	function updateDiv(pointIdValue){
		$('#baseQTYUpdate').val('');
		$('#basePriceUpdate').val('');
		//存储积分ID值
		var pointId = pointIdValue;
		var param = {pointId : pointId};
		$.ajax({
			data : param,
			url : '/admin/cust/point/selectPoint.htm',   //调用AdminPointAction中的selectPoint方法获取值。
			success : function(data){
				if(data.result == 'success'){
					$('#pointIdValue').val(data.adminPoint.pointId);
					$('#shopIdValue').val(data.adminPoint.shopId);
					$('#pointNameUpdate').val(data.adminPoint.pointName);
					$('#pointShareNameUpdate').val(data.adminPoint.pointShareName);
					$('#pointNumUpdate').val(data.adminPoint.pointNum);
					 $('[name = pointTypeUpdate]').each(function(){
						 $(this).attr('checked',false);
					 });
					 $('[name = pointTypeUpdate]').each(function(){			
						 if($(this).val() == data.adminPoint.pointType){
							 $(this).iCheck('check');
							 $(this).click();
						 }
					 });
					 $('[name = noticeFlagUpdate]').each(function(){
						 $(this).attr('checked',false);
					 });
					
					 $('[name = noticeFlagUpdate]').each(function(){
						 if($(this).val() == data.adminPoint.noticeFlag){
							 $(this).iCheck('check');
							 $(this).click();
						 }
					 });
				 	if(data.adminPoint.pointType == '2' ){
						$('#baseQTYUpdate').val(data.adminPoint.baseQTY);
					}else if(data.adminPoint.pointType == '3' ){
						$('#basePriceUpdate').val(data.adminPoint.basePrice);
					} 	
				 	showBpopup({
						id : 'updatePopup',
						width : 510
					});	
				}else if(data.result == 'fail'){
					alert('<ui:i18n key="查询数据出现错误请重新操作"/>.');
				}
				
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
		
	}
	//存储积分规则
	function savePoint(){
		//[积分] 积分名称(XX活动积分 等)	POINT_NM
		var pointName = $('#pointName').val();
		if(pointName == ''){
			alert('<ui:i18n key="请填写积分名称"/>');
			return;
		}
		//[积分] 提示内容(给客户显示名)	POINT_SHARE_NM
		var pointShareName = $('#pointShareName').val();
		if(pointShareName == ''){
			alert('<ui:i18n key="请填写提示内容"/>');
			return;
		}
		//[积分] 积分	POINT
		var pointNum = $('#pointNum').val();
		if(pointNum == ''){
			alert('<ui:i18n key="请填写奖励分值"/>');
			return;
		}else{
			if(!pointNum.match(/^[0-9]*$/)){
				alert('<ui:i18n key="奖励分值格式错误"/>');
				return;
			}
		}
		//[积分] 1关注 2每成交易(笔) 3每购买金额(元)...	POINT_TYPE
		var pointType = $('input[type=radio][name=pointType]:checked').val();
		if(typeof(pointType) == 'undefined'){
			alert('<ui:i18n key="请选择奖励条件"/>');
			return;
		}
		//[积分] 每成交易(笔)	BASE_QTY
		var baseQTY = '';
		if(pointType == 2){
			 baseQTY = $('#baseQTY').val();
			 if(baseQTY == ''){
				 alert('<ui:i18n key="请输入交易笔数"/>');
				 return;
			 }else if(!baseQTY.match(/^[0-9]*$/)){
					alert('<ui:i18n key="交易笔数格式错误"/>');
					return;
			}
		}
		//[积分] 每购买金额(元)	BASE_PRICE
		var basePrice = '';
		if(pointType == 3){
			basePrice = $('#basePrice').val();
			if(basePrice == ''){
				alert('<ui:i18n key="请填写购买金额"/>');
				return;
			}else if(!basePrice.match(/^[0-9]*$/)){
				
				alert('<ui:i18n key="购买金额格式错误"/>');
				return;
			}
		}
		//[积分] 1通知 0不发送	NOTICE_FLAG
		var noticeFlag = 0;/* $('input[name = "noticeFlag"]:checked').val();
		if(typeof(noticeFlag) == 'undefined'){
			alert('请选择是否发送通知');
			return;
		} */
		//[积分]	创建积分规则的用户的ID	CREATED_ID
		var params = {
				 pointName : pointName
				,pointShareName : pointShareName
				,pointNum : pointNum
				,pointType : pointType
				,baseQTY : baseQTY
				,basePrice : basePrice
				,noticeFlag : noticeFlag
		};
		$.ajax({
			data : params,
			url : '/admin/cust/point/savePoint.htm',   ////调用AdminPointAction中savePoint方法，存储积分规则
			success : function(data){
				if(data.pointId == ''){
					alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>.');
				}else{
					if(data.pointId == '0'){
						 alert('<ui:i18n key="已有奖励条件"/>，<ui:i18n key="保存失败"/>.');
					}else{
						alert('<ui:i18n key="保存成功"/>.');
						//调用AdminPointAction中point方法，回到页面列表。
						window.location.reload();
					}
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	}
	//修改积分规则。
	function updatePoint(){
		//[积分] 积分名称(XX活动积分 等)	POINT_NM
		var pointName = $('#pointNameUpdate').val();
		if(pointName == ''){
			alert('<ui:i18n key="请填写积分名称"/>');
			return;
		}
		//[积分] 提示内容(给客户显示名)	POINT_SHARE_NM
		var pointShareName = $('#pointShareNameUpdate').val();
		if(pointShareName == ''){
			alert('<ui:i18n key="请填写提示内容"/>');
			return;
		}
		//[积分] 积分	POINT
		var pointNum = $('#pointNumUpdate').val();
		if(pointNum == ''){
			alert('<ui:i18n key="请填写奖励分值"/>');
			return;
		}else{
			if(!pointNum.match(/^[0-9]*$/)){
				alert('<ui:i18n key="奖励分值格式错误"/>');
				return;
			}
		}
		//[积分] 1关注 2每成交易(笔) 3每购买金额(元)...	POINT_TYPE
		var pointType = $('input[name = "pointTypeUpdate"]:checked').val();
		if(typeof(pointType) == 'undefined'){
			alert('<ui:i18n key="请选择奖励条件"/>');
			return;
		}
		//[积分] 每成交易(笔)	BASE_QTY
		var baseQTY = '';
		if(pointType == 2){
			 baseQTY = $('#baseQTYUpdate').val();
			 if(baseQTY == ''){
				 alert('<ui:i18n key="请输入交易笔数"/>');
				 return;
			 }else if(!baseQTY.match(/^[0-9]*$/)){
				 alert('<ui:i18n key="交易笔数格式错误"/>');
				 return;
			 }
		}
		//[积分] 每购买金额(元)	BASE_PRICE
		var basePrice = '';
		if(pointType == 3){
			basePrice = $('#basePriceUpdate').val();
			if(basePrice == ''){
				alert('<ui:i18n key="请填写购买金额"/>');
				return;
			}else if(!basePrice.match(/^[0-9]*$/)){
				alert('<ui:i18n key="购买金额格式错误"/>');
				return;
			}
		}
		//[积分] 1通知 0不发送	NOTICE_FLAG
		var noticeFlag = 0;/* $('input[name = "noticeFlagUpdate"]:checked').val();
		if(typeof(noticeFlag) == 'undefined'){
			alert('请选择是否发送通知');
			return;
		} */
		//[积分] 存储积分的Id号码
		var pointId = $('#pointIdValue').val();
		var params = {
				 pointId : pointId
				,pointName : pointName
				,pointShareName : pointShareName
				,pointNum : pointNum
				,pointType : pointType
				,baseQTY : baseQTY
				,basePrice : basePrice
				,noticeFlag : noticeFlag
		};
		$.ajax({
			data : params,
			url : '/admin/cust/point/updatePoint.htm',   //调用AdminPointAction中updatePoint方法修改积分规则。
			success : function(data){	
				if(data.result == 'fail'){
					alert('<ui:i18n key="修改失败"/>，<ui:i18n key="请重新操作"/>.');
				}else if(data.result == 'success'){
					alert('<ui:i18n key="修改成功"/>.');
					//调用AdminPointAction中point方法，回到页面列表
					window.location.reload();	
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	}
	function deletePoint(pointIdValue){
		var pointId = pointIdValue;
		var flag = window.confirm('<ui:i18n key="您确定要删除该积分规则吗"/>？');
		if(flag == true){
			var param = {pointId:pointId};
			$.ajax({
				data:param,
				url : '/admin/cust/point/deletePoint.htm',   ////调用AdminPointAction中deletepoint方法，删除积分规则。
				success : function(data){	
					if(data.result == 'fail'){
						alert('<ui:i18n key="删除失败"/>，<ui:i18n key="请重新操作"/>.');
					}else if(data.result == 'success'){
						alert('<ui:i18n key="删除成功"/>.');
						//调用AdminPointAction中point方法，回到页面列表
						window.location.reload();	
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		}else{
			return;
		}	
	}
	//奖励条件的选中。其他样式的改变。
	$('document').ready(function(){
		$('#pointType1').click(function(){
			$('#baseQTY').val('');
			$('#basePrice').val('');
			$('#baseQTY').attr('readonly','readonly');
			$('#basePrice').attr('readonly','readonly');
		});
		$('#pointType2').click(function(){
			$('#basePrice').val('');
			$('#basePrice').attr('readonly','readonly');
			$('#baseQTY').removeAttr('readonly');
		});
		$('#pointType3').click(function(){
			$('#baseQTY').val('');
			$('#baseQTY').attr('readonly','readonly');
			$('#basePrice').removeAttr('readonly');
		});
		$('#pointTypeUpdate1').click(function(){
			$('#baseQTYUpdate').val('');
			$('#basePriceUpdate').val('');
			$('#baseQTYUpdate').attr('readonly','readonly');
			$('#basePriceUpdate').attr('readonly','readonly');
		});
		$('#pointTypeUpdate2').click(function(){
			$('#basePriceUpdate').val('');
			$('#basePriceUpdate').attr('readonly','readonly');
			$('#baseQTYUpdate').removeAttr('readonly');
		});
		$('#pointTypeUpdate3').click(function(){
			$('#baseQTYUpdate').val('');
			$('#baseQTYUpdate').attr('readonly','readonly');
			$('#basePriceUpdate').removeAttr('readonly');
		});
	});
	
	$(function(){
// 		$('#pointTypeUpdate1').on('ifChecked',function(event){
// 			$('#baseQTYUpdate').val('');
// 			$('#basePriceUpdate').val('');
// 			$('#baseQTYUpdate').attr('readonly','readonly');
// 			$('#basePriceUpdate').attr('readonly','readonly');
// 		});
// 		$('#pointTypeUpdate2').on('ifChecked',function(event){
// 			$('#basePriceUpdate').val('');
// 			$('#basePriceUpdate').attr('readonly','readonly');
// 			$('#baseQTYUpdate').removeAttr('readonly');
// 		});
// 		$('#pointTypeUpdate3').on('ifChecked',function(event){
// 			$('#baseQTYUpdate').val('');
// 			$('#baseQTYUpdate').attr('readonly','readonly');
// 			$('#basePriceUpdate').removeAttr('readonly');
// 		});
	});
</script>
</head>
<body>
 
	<!-- ▼ Main container --> 
    <div class="container">
    	<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="popupgoodsClass();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="10%" />
		      		 			<col width="20%" />
		      		 			<col width="15%" />
		      		 			<col width="15%" />
		      		 			<col width="20%" />
		      		 			<col width="20%" />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th><ui:i18n key="序号"/></th>
			      		 		<th><ui:i18n key="积分名称"/></th>
			      		 		<th><ui:i18n key="奖励积分"/></th>
			      		 		<th><ui:i18n key="受益人数"/></th>
			      		 		<th><ui:i18n key="自动给积分的条件"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      		 <c:forEach items="${adminPointList}" var="pointList" varStatus="status">
			      		 	<tr>
			      		 		<td>${pointList.number }</td>
		           				<td>${pointList.pointName }</td>
		           				<td>${pointList.pointNum }</td>
		           				<td>${pointList.sumGiveQTY }</td>
		           				<td>
		           					<c:if test="${pointList.pointType=='1'}">
		           						<span><ui:i18n key="关注微信"/></span>
		           					</c:if>
		           					<c:if test="${pointList.pointType=='2'}">
		           						<span><ui:i18n key="每成功交易"/>${pointList.baseQTY}<ui:i18n key="笔"/></span>
		           					</c:if>
		           					<c:if test="${pointList.pointType=='3'}">
		           						<span><ui:i18n key="每购买金额"/>${pointList.basePrice}<ui:i18n key="元"/></span>
		           					</c:if>
		           				</td>
		           				<td>
		           					<span class="gridbutton red"  onclick="javascript:updateDiv(${pointList.pointId});"><ui:i18n key="编辑"/></span>
		           					<span class="gridbutton red"  onclick="javascript:deletePoint(${pointList.pointId});"/><ui:i18n key="删除"/></span>
		           					<input type="hidden" id="pointIdValue" value=""/>
		           				</td>
			      		 	</tr>
			      		 </c:forEach>
			      		 </tbody>
			      		 <tfoot>
				      		 <tr style="height: 30px">	
	          					<td colspan="6" align="right">
	          						<span><ui:i18n key="共"/><font color="#d1102d">${requestScope.count}</font><ui:i18n key="条"/></span>
	          					</td>
	          				 </tr>
			      		 </tfoot>
			      	</table>
   				</div> 
	     	</div>
     	</div>
	</div>
	<!-- ▲ Main container -->
	
	 
	<!--▼ 新建积分规则弹窗 --> 
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
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0">
						  			 		<ui:i18n key="积分名称"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="pointName" style="width:90px;font-size:12px"/>
						  			 	 </div>
						  			 	  <div class="form-label" style="width: 100px;text-align: center;">
						  			 		<ui:i18n key="奖励分值"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="pointNum"  style="width:90px;font-size: 12px"/>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		<ui:i18n key="提示内容"/><a class="label-required"></a>：
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="pointShareName"  style="width: 320px;font-size: 12px"/>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp" style="height: 32px;line-height: 32px" >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		<ui:i18n key="奖励条件"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="1" class="icradio" name="pointType" id="pointType1" />
						  			 	 	<span style="margin-left: 10px"><ui:i18n key="关注微信"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp" style="display: none" >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="2" class="icradio" name="pointType" id="pointType2" />
				        					<span style="margin-left:10px;">每成功交易</span>
				        					<input type="text" value="" id="baseQTY" style="width:70px;font-size: 12px;margin-left: 10px;margin-right: 15px" />
				        					<span><ui:i18n key="笔"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="3" class="icradio" name="pointType" id="pointType3"/>
        									<span style="margin-left:10px;"><ui:i18n key="每购买金额"/></span>
        									<input type="text" value="" id="basePrice"  style="width:70px;font-size: 12px;margin-left: 10px;margin-right: 15px"/>
        									<span><ui:i18n key="元"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp" style="display: none" >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		 <ui:i18n key="通知"/>：
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="1" class="icradio" name="noticeFlag" />
				        					<span style="margin-left:10px;"><ui:i18n key="给粉丝发送获得了积分的通知"/></span>
				        					<input type="radio" value="0" class="icradio" name="noticeFlag" />
				        					<span style="margin-left:10px;"><ui:i18n key="不发送"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp text-center">
						  			 	<div class="popup-form-actions">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm"  onclick="savePoint();">
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
	<!--▲ 新建积分规则弹窗 --> 
	
		
		
	<!-- ▼ 修改积分规则弹窗 -->
		<div class="bpopup2" id="updatePopup">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="修改"/></h3>
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
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0">
						  			 		<ui:i18n key="积分名称"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="pointNameUpdate" style="width:90px;font-size:12px"/>
						  			 	 </div>
						  			 	  <div class="form-label" style="width: 100px;text-align: center;">
						  			 		<ui:i18n key="奖励分值"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="pointNumUpdate"  style="width:90px;font-size: 12px"/>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		<ui:i18n key="提示内容"/><a class="label-required"></a>：
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0">
						  			 	 	<input type="text" id="pointShareNameUpdate"  style="width: 320px;font-size: 12px"/>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp" style="height: 32px;line-height: 32px" >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		<ui:i18n key="奖励条件"/><a class="label-required"></a>： 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="1" class="icradio" name="pointTypeUpdate" id="pointTypeUpdate1" />
						  			 	 	<span style="margin-left: 10px"><ui:i18n key="关注微信"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp" style="display: none" >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="2" class="icradio" name="pointTypeUpdate" id="pointTypeUpdate2" />
				        					<span style="margin-left:10px;">每成功交易</span>
				        					<input type="text" value="" id="baseQTYUpdate" style="width:70px;font-size: 12px;margin-left: 10px;margin-right: 15px" />
				        					<span><ui:i18n key="笔"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		 
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="3" class="icradio" name="pointTypeUpdate" id="pointTypeUpdate3" />
        									<span style="margin-left:10px;"><ui:i18n key="每购买金额"/></span>
        									<input type="text" value="" id="basePriceUpdate"  style="width:70px;font-size: 12px;margin-left: 10px;margin-right: 15px"/>
        									<span><ui:i18n key="元"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp" style="display: none" >
						  			 	 <div class="form-label" style="width: 100px;padding-left: 0" >
						  			 		 <ui:i18n key="通知"/>：
						  			 	 </div>
						  			 	 <div class="form-control" style="padding-left: 0" >
						  			 	 	<input type="radio" value="1" class="icradio" name="noticeFlagUpdate" />
				        					<span style="margin-left:10px;"><ui:i18n key="给粉丝发送获得了积分的通知"/></span>
				        					<input type="radio" value="0" class="icradio" name="noticeFlagUpdate" />
				        					<span style="margin-left:10px;"><ui:i18n key="不发送"/></span>
						  			 	 </div>
						  			 </div>
						  			 
						  			 <div class="control-warp text-center">
						  			 	<div class="popup-form-actions">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm"  onclick="updatePoint();">
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
	<!-- ▲ 修改积分规则弹窗 -->
 	<!-- ▼ Main footer -->

	<!-- ▲  Main footer -->
</body>
</html>