<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="我的收入"/></title>  

<style type="text/css">
 
	.gray{color: #a2a2a2;}
	.ind-line {width: 100%; height: 130px; position: relative; }
	.ind-line .ind-one {float: left; width: 280px; height: 100px; margin-top: 10px; margin-left: 120px; position: relative;}
	.ind-line .indTwo {float: left; width: 280px; height: 100px; margin-top: 10px; margin-left: 50px; position: relative;}
	.left-img {float: left; width: 7px; height: 98px; background-color: #ff6d00; border-radius: 10px 0px 0px 10px; border: 1px solid #d2d2d2;}
	.ind-text {float: left; width: 269px; height: 98px; border-radius: 0px 10px 10px 0px; border-top: 1px solid #d2d2d2; border-right: 1px solid #d2d2d2; border-bottom: 1px solid #d2d2d2; position: relative;}
	.big-cnt {width: 150px; height: 98px; float: left; text-align: center;}
	.big-cnt .month {width: 100%; height: auto; font-size: 14px; padding-top: 15px;text-align: left;padding-left: 15px;}
	.big-cnt .cnt {width: 100%; height: auto; font-size: 32px; margin-top: 15px;}
	.cnt-line {width: 1px; height: 80px; background-color: #a2a2a2; float: left; margin-top: 9px;}
	.small-cnt {width: 118px; height: 98px; float: left; font-size: 12px; text-align: center;}
	.small-cnt .compare {width: 100%; height: 14px; margin-top: 30px; position: relative;}
	.small-cnt .compare .l1 {float: left; width: 30px; height: 14px; margin-left: 10px;}
	.small-cnt .compare .l2 {float: left; width: 55px; height: 14px; margin-left: 5px; text-align: left;}
	.small-cnt .compare .l3 {float: left; width: 6px; height: 14px; background-image: url("/admin/images/icon2/up.png");background-repeat: no-repeat; margin-top: 0px;}
	.small-cnt .compare .l4 {float: left; width: 6px; height: 14px; background-image: url("/admin/images/icon2/down.png");background-repeat: no-repeat; margin-top: 0px;}
	.small-cnt .fmonth {width: 100%; height: 14px; margin-top: 15px; position: relative;}
	.small-cnt .fmonth .l1 {float: left; width: 30px; height: 14px; margin-left: 10px;}
	.small-cnt .fmonth .l2 {float: left; width: 50px; height: 14px; margin-left: 5px; text-align: left;}


	.icon-tip{margin-top: -2px; width: 18px;height: 18px;cursor: pointer;margin-left: 5px;}
	.icon-tip2{margin-top: -2px; width: 18px;height: 18px;cursor: pointer;margin-left: 9px;}
	.upload-goods-img-div{width:80px;height:80px;border:1px solid #eee;text-align: center;background-image: url("/admin/images/shopCreate/main_Upload.png");background-repeat: no-repeat;background-position: 20px 15px;}
	.upload-goods-img-div span{margin-top:45px;display:inline-block;font-size:12px;color:#313131;}
	.image-tip{
		color: #d0112d;font-size:12px;margin-top: -20px;margin-left: 90px;
	}
	.btn-icon {display: inline-block; width: 29px; height: 25px; position: relative; cursor: pointer; background-repeat: no-repeat; background-position: center;}
	.btn-tip {display: none;}
	
</style> 

<script type="text/javascript">
$(function(){
	$('.datepicker').datepicker(); 
	$('.js-add-page').click(function(){
		$('.js-title').html('<ui:i18n key="创建"/><ui:i18n key="支付方式"/>');
		 showBpopup({
			id : 'createPagePopup',
			width : 450 
		});	  	 
	});
	$('.btn-icon').hover(function() {
		if($(this).html() == '<ui:i18n key="启用中"/>'){
			$(this).html('<ui:i18n key="停用"/>');
			$(this).removeClass('red');
			$(this).addClass('green');
		}
	 	if($(this).html() == '<ui:i18n key="未启用"/>'){
			$(this).html('<ui:i18n key="启用"/>');
			$(this).removeClass('gray');
			$(this).addClass('green');
		}
		
	}, function() {
		if($(this).html() == '<ui:i18n key="停用"/>'){
			$(this).html('<ui:i18n key="启用中"/>');
			$(this).removeClass('green');
			$(this).addClass('red');
		}
		if($(this).html() == '<ui:i18n key="启用"/>'){
			$(this).html('<ui:i18n key="未启用"/>');
	 		$(this).removeClass('green');
	 		$(this).addClass('gray');
		}
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
	console.log('pageNo = ' + pageNo + ',pageSize = ' + pageSize);
	var payTypeId = $('#payTypeId').select2('val'); 
	var isUse = $('#isUse').select2('val'); 
	var params = {
			payTypeId : payTypeId
			,isUse : isUse
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/income/incomeListFragment.htm';
	 
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
function incomeDetail() {
	
	location.href = '/admin/income/detailList.htm';
}

function option(opType,shopId,payTypeId) {
	
	if (opType == '' || shopId == '' || payTypeId == '') {
		alert('<ui:i18n key="请重新打开页面"/>');
		return;
	}

	if(opType == 'N'){
		if(confirm('<ui:i18n key="您确定要启用该类型吗"/>?')){
			
		}else{
			return;
		}
	}else{
		if(confirm('<ui:i18n key="您确定要禁用该类型吗"/>?')){
			
		}else{
			return;
		}
	}
	var params = {
			opType : opType,
			shopId : shopId,
			payTypeId : payTypeId
		};

		$.ajax({
			data : params,
			url : '/admin/income/modifyIncome.htm',
			success : function(data){
				
				if (data.result == 'SUCCESS'){
					
					alert('<ui:i18n key="修改成功"/>.');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				} else {
					alert('<ui:i18n key="请重新点击"/>.');
				}
			},
			error : function(a, msg, c){
				
				alert('error: ' + msg);
			}
		});
	
}


function doDelete(shopId,payTypeId){
	if(confirm('<ui:i18n key="您确定要删除该类型吗"/>?')){
		
		var params = {
				shopId : shopId,
				payTypeId : payTypeId
			};
	
			$.ajax({
				data : params,
				url : '/admin/income/deleteIncome.htm',
				success : function(data){
					
					if (data.result == 'SUCCESS'){
						
						alert('<ui:i18n key="删除成功"/>.');
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
					} else {
						alert('<ui:i18n key="请重新点击"/>.');
					}
				},
				error : function(a, msg, c){
					
					alert('error: ' + msg);
				}
			});
	}else{
		return false;
	}
}
function cancel(){
	$('#payName').val('');
	$('#payPreDate').val('');
	$('#payPreInfo').val('');
	$('#payPreInfo2').val('');
	var prevDiv = document.getElementById('preview');
	prevDiv.innerHTML = '';
	$('#preview').attr('style','background-image:url("/admin/images/shopCreate/main_Upload.png")');
	$('#preview').append('<span><ui:i18n key="上传本地图片"/></span>');
	$('#payRreDesc').val('');
	$('#jobTypeHidden').val('');
	$('#payTypeIdHidden').val('');
	$('#isUseHidden').val('');
}

var rowCount=1;
function trAdd(){
	rowCount+=1;
	if(rowCount>2){
		return;
	}
	var html='<div class="control-warp">'+
				'<div class="form-label" style="width: 100px"></div>'+
				'<div class="form-control" style="margin-left:4px;">'+
					'<input type="text" style="width: 215px;" id="payPreInfo2" maxlength="90">'+
					'<img class="icon-tip2" onclick="javascript:trRomove(this);" src="/admin/images/icon/icon-minus2.png">'+
				'</div>'+
			 '</div>';
	$('#divPrdDesc').after(html);
	
}

function trRomove(obj){
	
	$(obj).parent().parent().remove();
	rowCount = 1;
}

//商品照片上传预览
function logoUpload(file){
	
	var prevDiv = document.getElementById('preview');
	 
	if(checkImage(file)){
		
		 if (file.files && file.files[0]){
			 
			var reader = new FileReader();
			
			reader.onload = function(evt){
		 		prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
			}; 
			$('#preview').attr('style','background-image:url("")');
			$('#preview').find('span').remove();
		 	reader.readAsDataURL(file.files[0]);
		} else {
			
			prevDiv.innerHTML = '<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
			$('#preview').attr('style','background-image:url("")');
			$('#preview').find('span').remove();
		}
	} else {			

 		prevDiv.innerHTML = '';
 		$('#preview').attr('style','background-image:url("/admin/images/shopCreate/main_Upload.png")');
		$('#preview').append('<span><ui:i18n key="上传本地图片"/></span>');
	}
	
}

//检查上传文件是否为图片
function checkImage(file){
	
	var picPath = file.value;
	var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
	
	if (picPath == '') {
		
	    return false;
	} else {
		
		if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
			
		    alert('<ui:i18n key="请上传正确的图片格式"/>');
		    return false;
		} else {

			return true;
		}
	}
}


function save(){
	var payName = $('#payName').val();
	var payPreDate = $('#payPreDate').val();
	var payPreInfo = $('#payPreInfo').val();
	var payPreInfo2 = $('#payPreInfo2').val();
	var payRreDesc = $('#payRreDesc').val();
	var imgLogoPicture = $('#logo_input').val();
	var jobType = $('#jobTypeHidden').val();
	var payTypeId = $('#payTypeIdHidden').val();
	var isUse = $('#isUseHidden').val();
	if(jobType == '') jobType = 'I';
	
	if(payName == ''){
		alert('<ui:i18n key="请输入支付类型"/>');
		return;
	}
	
	if(payPreDate == ''){
		alert('<ui:i18n key="请选择使用时间"/>');
		return;
	}
	if(jobType == 'I'){
// 		preview
		if(imgLogoPicture == ''){
			
			alert('<ui:i18n key="请上传商品照片"/>');
			return;
		}
	}
	
	
	if(payRreDesc == ''){
		alert('<ui:i18n key="请输入支付类型内容"/>');
		return;
	}
	
	//获取照片的文件名
    var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
    if(payPreInfo != ''&&payPreInfo2 != ''&&payPreInfo2 != undefined){
    	payPreInfo = payPreInfo+'###'+payPreInfo2;
	}else if(payPreInfo == ''&&payPreInfo2 != ''&&payPreInfo2 != undefined){
		payPreInfo = payPreInfo2;
	}
    
	var params = {
			payName : payName,
			payPreDate : payPreDate,
			payPreInfo : payPreInfo,
			payRreDesc : payRreDesc,
			logoFileName : logoFileName,
			jobType		 : jobType,
			payTypeId	 : payTypeId,
			isUse	     : isUse
		};
	
	$.ajaxFileUpload({
		data : params,
		url : '/admin/income/addIncome.htm',
		secureuri : false,
		fileElementId :'logo_input',
		dataType : 'json',
		type : 'POST',
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data){
			if (data.result == 'S'){
				alert('<ui:i18n key="保存成功"/>.');
				window.location.reload();
			} else {
				if(jobType == 'I'){
					alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击添加"/>.');
				}else{
					alert('<ui:i18n key="请检查信息"/>'+','+'<ui:i18n key="重新点击修改}"/>.');
				}
			}
			
		},
		error : function(a, msg, c){
			alert('error: ' + msg+a+c);
		}
	});
}

function paymentDetail(shopId,payTypeId,isUse){
	var params = {
			shopId : shopId,
			payTypeId : payTypeId
		};
	
	$.ajax({
		data : params,
		cache : false,
		url : '/admin/income/incomeDetail.htm',
		success : function(data){
			if(data != null){
				$('#payName').val(data.PAY_NAME);
				$('#payPreDate').val(data.PAY_PRE_DT);
				var payPreInfo = data.PAY_PRE_INFO;
				if(payPreInfo.split('###').length>1){
					trAdd();
				}
				$('#payPreInfo').val(payPreInfo.split('###')[0]);
				$('#payPreInfo2').val(payPreInfo.split('###')[1]);
				document.getElementById('preview').innerHTML = '<img src="' + data.LOGO_URL + '" />';
				$('#payRreDesc').val( data.PAY_PRE_DESC);
				$('#jobTypeHidden').val('U');
				$('#payTypeIdHidden').val(data.PAY_TYPE_ID);
				if(isUse == 'Y'){
					$('#isUseHidden').val(1);
				}else if(isUse == 'N'){
					$('#isUseHidden').val(0);
				}
				
				$('.js-title').html('<ui:i18n key="修改"/><ui:i18n key="支付方式"/>');
				$('.js-add-page').click();			}
		},
		error : function(a, msg, c){
			
			alert('error: ' + msg);
		}
	});
}

</script>

</head>

<body>
	<div class="container">
		<!-- ▼标题 -->
		<div class="clearfix">
			<div class="action-tools" style="margin-top: -9px;">
				<span class="action-tool">
	   		   		<img class="action-tool-icon refresh" alt="" src="/admin/images/icon2/list.png" onclick="javascript:incomeDetail();" />
			  		<span class="action-name" onclick="javascript:incomeDetail();" ><ui:i18n key="收支明细"/></span>
	   		   	</span>
			</div>
		</div>
		<!-- ▲标题 -->
		<!-- ▼数据显示-->
		<div class="ind-line">
			<div class="ind-one">
				<div class="left-img"></div>
				<div class="ind-text">
					<div class="big-cnt">
						<div class="month"><ui:i18n key="本月"/></div>
						<div class="cnt"><c:out value="${requestScope.myIncome.THE_MONTH}"></c:out></div>
					</div>
					<div class="cnt-line"></div>
					<div class="small-cnt">
						<div class="compare">
							<div class="l1"><ui:i18n key="对比"/></div>
							<div class="l2"><c:out value="${requestScope.myIncome.MONTH_PER}"></c:out></div>
							<c:if test="${requestScope.myIncome.MONTH_UP_YN eq 'Y'}">
								<div class="l3"></div>
							</c:if>
							<c:if test="${requestScope.myIncome.MONTH_UP_YN ne 'Y'}">
								<div class="l4"></div>
							</c:if>
						</div>
						<div class="fmonth">
							<div class="l1"><ui:i18n key="上月"/></div>
							<div class="l2"><c:out value="${requestScope.myIncome.LAST_MONTH}"></c:out></div>
						</div>
					</div>
				</div>
			</div>
			<div class="indTwo">
				<div class="left-img"></div>
				<div class="ind-text">
					<div class="big-cnt">
						<div class="month"><ui:i18n key="本周"/></div>
						<div class="cnt"><c:out value="${requestScope.myIncome.THE_WEEK}"></c:out></div>
					</div>
					<div class="cnt-line"></div>
					<div class="small-cnt">
						<div class="compare">
							<div class="l1"><ui:i18n key="对比"/></div>
							<div class="l2"><c:out value="${requestScope.myIncome.WEEK_PER}"></c:out></div>
							<c:if test="${requestScope.myIncome.WEEK_UP_YN eq 'Y'}">
								<div class="l3"></div>
							</c:if>
							<c:if test="${requestScope.myIncome.WEEK_UP_YN ne 'Y'}">
								<div class="l4"></div>
							</c:if>
						</div>
						<div class="fmonth">
							<div class="l1"><ui:i18n key="上周"/></div>
							<div class="l2"><c:out value="${requestScope.myIncome.LAST_WEEK}"></c:out></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ▲数据显示-->
		<!-- ▼ 查询表单区域  --> 
	       <div class="query-from" style="margin-top: 10px;">
	       		<div class="form-table" >
	       		 	<table class="ftable" border="1">
	       		 		<colgroup>
	       		 			<col width="15%" />
	       		 			<col width="35" />
	       		 			<col width="15%" />
	       		 			<col width="35" />
	       		 		</colgroup>
	       		 		<tr>
	       		 			<td class="flabel"><ui:i18n key="支付方式"/>：</td>
	       		 			<td class="fcomp">
		       		 			<select id="payTypeId" class="select2" data-placeholder="" style="width: 90%">
									<option value="" <c:if test="${requestScope.payTypeId==''}">selected="selected"</c:if> >${label.不限}</option>
									<c:forEach items="${payTypeList}" var="list" varStatus="status" >
										<option value="${list.PAY_TYPE_ID}" <c:if test="${list.PAY_TYPE_ID==requestScope.payTypeId}">selected="selected"</c:if> >${list.PAY_NAME }</option>
									</c:forEach>
								</select>
	       		 			</td>
	       		 			<td class="flabel">
	       		 				<ui:i18n key="状态"/>：
	       		 			</td>
	       		 			<td class="fcomp">
		       		 			<select id="isUse" class="select2" data-placeholder="" style="width: 90%">
									<option value="" <c:if test="${requestScope.isUse==''}">selected="selected"</c:if>>${label.全部 }</option>
									<option value="1" <c:if test="${'1'==requestScope.isUse}">selected="selected"</c:if>>${label.启用}</option>
									<option value="0" <c:if test="${'0'==requestScope.isUse}">selected="selected"</c:if>>${label.停用}</option>
								</select>
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
	      	<div class="result-grid-header" >
   				<div class="result-grid-tools">
      		   		<span class="result-grid-tool js-add-page">
     		   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="新建"/>
     		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp">
   					<table class="result-grid-table">
			      	 	<thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th style="width:10%;"><ui:i18n key="支付类型" />Logo</th>
			      		 		<th style="width:35%;"><ui:i18n key="内容" /></th>
			      		 		<th style="width:15%;"><ui:i18n key="使用时间" /></th>
			      		 		<th style="width:25%;"><ui:i18n key="手续费说明" /></th>
			      		 		<th style="width:15%;"><ui:i18n key="操作" /></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody" >
				      		<c:forEach items="${page.data}" var="items" varStatus="status">
							<tr>
								<td style="width:10%;">
									<img src="${items.LOGO_URL}" width="80px" height="80px" style="padding: 5px;" />
								</td>
								<td style="width:35%;text-align: center;">
									${items.PAY_PRE_DESC}
								</td>
								<td style="width:15%;">
									${items.PAY_PRE_DT}
								</td>
								<td style="width:25%;">
<%-- 									${items.PAY_PRE_INFO} --%>
									${fn:replace(items.PAY_PRE_INFO, '###', '<br/>')}
								</td>
								<td style="width:15%;">
									<div class="qyong">
										<span class="gridbutton red" onclick="javascript:paymentDetail('${items.SHOP_ID}','${items.PAY_TYPE_ID}','${items.IS_USE}');"><ui:i18n key="编辑" /></span>
										<span class="gridbutton red" onclick="javascript:doDelete('${items.SHOP_ID}','${items.PAY_TYPE_ID}');"><ui:i18n key="删除" /></span>
										<c:if test="${items.IS_USE eq 'Y'}">
											<span style="width: 38px;" class="gridbutton red btn-icon" onclick="javascript:option('Y','${items.SHOP_ID}','${items.PAY_TYPE_ID}');"><ui:i18n key="启用中" /></span>
										</c:if>
										<c:if test="${items.IS_USE eq 'N'}">
											<span style="width: 38px;" class="gridbutton gray btn-icon" onclick="javascript:option('N','${items.SHOP_ID}','${items.PAY_TYPE_ID}');"><ui:i18n key="未启用" /></span>
										</c:if>
					        		</div>
								</td>
							</tr>
			        	</c:forEach>
			      		 </tbody>
		      		</table>
   				</div>
   				<ui:paging page="${page }" />
   			</div>
   		</div> 
   		<!-- ▲ 普通表格 --> 
   		
		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="createPagePopup">
			<input type="hidden" id="jobTypeHidden" value="">
			<input type="hidden" id="payTypeIdHidden" value="">
			<input type="hidden" id="isUseHidden" value="">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="创建"/><ui:i18n key="支付方式"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png"  onclick="cancel()"/>
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	 <!--  方式2 -->
		 		 	 <div class="bpopupInner js-bpopup-inner"> 
		 		 	    <form action="">
		 		 	    		<div class="form-warp clearfix" >
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px">
						  			 		<ui:i18n key="支付类型"/><a class="label-required"></a> : 
						  			 	 </div>
						  			 	 <div class="form-control">
					  			 	 		<input type="text" style="width: 240px;" name="" id="payName"  >
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px">
						  			 		<ui:i18n key="使用时间"/><a class="label-required"></a> : 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input  value="" type="text" id="payPreDate"  class="datepicker calendar" readonly="readonly" style="width: 240px;" />
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  id="divPrdDesc">
						  			 	 <div class="form-label" style="width: 100px">
						  			 		<ui:i18n key="手续费说明"/></a>: 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="text" style="width: 215px;" id="payPreInfo" maxlength="90">
											<img class="icon-tip" onclick="javascript:trAdd();" src="/admin/images/icon/icon-plus2.png">
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label" style="width: 100px;vertical-align: top;">
						  			 		<ui:i18n key="支付类型"/>Logo<a class="label-required"></a>: 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<input type="file" id="logo_input" name="logo_input" style="position: absolute; width: 80px; height: 120px; z-index: 12; filter: alpha(opacity:0); opacity: 0; cursor: pointer;" onchange="javascript:logoUpload(this);" />
											<div id="preview" class="upload-goods-img-div">
												<span>${label.上传本地图片}</span>
											</div>
											<div class="image-tip">${label.图片推荐尺寸}：80px * 80px</div>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp"  >
						  			 	 <div class="form-label"  style="width: 100px;vertical-align: top;">
						  			 		<ui:i18n key="支付类型"/><ui:i18n key="内容"/><a class="label-required"></a>: 
						  			 	 </div>
						  			 	 <div class="form-control">
						  			 	 	<textarea rows="" cols="" id="payRreDesc" style="height: 80px;width: 240px;" maxlength="200"></textarea>
						  			 	 </div>
						  			 </div>
						  			 <div class="control-warp text-center">
						  			 	<div class="popup-form-actions">
							  			 	 <div class="buttons-action">
								  				<span class="button bg-red js-confirm"  onclick="save();">
													<span class="button-icon conform"></span>
													<span class="button-name"><ui:i18n key="保存"/></span>
												</span>
												<span class="button bg-red  js-cancel b-close" style="margin-left:70px;" onclick="cancel()">
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
	</div>
</body>
</html>