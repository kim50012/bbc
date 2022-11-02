<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="优惠券管理"/></title>  
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor.css" /> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor-v2.css" />  
 
<script type="text/javascript" src="/admin/js/goods/goods-editor.js"></script> 
<link rel="stylesheet" type="text/css" href="/admin/css/test.css" />
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script> 
<style type="text/css">
	body{
		font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	}
	input button{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
	input{width: 220px}
	.topBorder {
		width: 100%; 
		height: 25px; 
		margin-top: 10px; 
		margin-bottom:25px;
		border-top: 1px solid #eeeeee; 
		position: relative;
	}
	.ui-title {
		position: absolute;  
		height: 24px; 
		top: -10px; 
		left: 0px; 
		z-index: 1; 
		background-color: #ffffff;
	}
	.ui-title img {
		margin: -4px 20px 0px 15px;
	}
	.ui-title span {
		font-size: 16px;
		margin-right: 20px
	}
	.select-img-div{
		width:700px;
		position: absolute;
		top:20px;
		left:150px;
		background-color: #ffffff;
		border-radius:6px 6px 6px 6px;
		display: none;
		z-index:200;
	}
	.div-img-warp{
		width:550px;
		margin-right:0;
	}
	.div-img-warp div{float:left}
	 .title-select-img-div{
		height:30px;
		background-color: #d1102d;
		line-height: 30px;
		border-radius:6px 6px 0 0;
		position: relative;
	}
	 .title-upload {
		color: #fff;
		font-size: 14px;
		text-decoration: underline;
		cursor: pointer;
	}
	.modal-title{
		color:#fff;
		font-size:18px;
		padding-left:20px;
	}
	.title-select-img-div div{
		background-image: url("/admin/images/goodsSell/close.png");
		background-position: center;
		background-repeat: no-repeat;
		float: right;
		width:30px;
		height:30px;
		display: inline-block;
		cursor: pointer;
		margin-right:10px;
	}
	.select-img-div .img-select-tbody tr td{
		border-top:1px solid #eeeeee;
		height:65px;
		vertical-align: middle;
	}
	.select-img-div .img-select-tbody .border-no{
		border:0;
	}
	.select-img-div tfoot tr td{
		border-top:1px solid #eeeeee;
		height:40px;
		vertical-align: middle;
		border-radius:0 0 6px 6px;
	}
	.select-img-div .img-select-tbody tr td img{
		width:60px;
		height:60px;
	}
	.selected-span{
		margin-left:0;
		width:45px;
		height:24px;
		background-color: #eee;
		text-align: center;
		vertical-align: middle;
		line-height:24px;
		border-radius:4px;
		cursor: pointer;
		border:1px solid #d5d5d5;
	}
	.selected-span.selected-revise{
		color: #ffffff;
		background-color: #3275dd;
	}
	.page_span{
		width:12px;
		height:22px;
		background-repeat: no-repeat;
		display: inline-block;
		cursor: pointer;
		margin-bottom:-2px;
	}
	.page_span.page_first{
		margin-left:120px;
		background-image: url("/admin/images/sendMsgAll/page_first.png");
	}
	.page_span.page_first_none{
		margin-left:120px;
		background-image: url("/admin/images/sendMsgAll/page_firstno.png");
	}
	.page_span.page_front{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_front.png");
	}
	.page_span.page_front_none{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_headno.png");
	}
	.page_span.page_next{
		background-image: url("/admin/images/sendMsgAll/page_next.png");
	}
	.page_span.page_next_none{
		background-image: url("/admin/images/sendMsgAll/page_nextno.png");
	}
	.page_span.page_end{
		margin-right:80px;
		background-image: url("/admin/images/sendMsgAll/page_last.png");
	}
	.page_span.page_end_none{
		margin-right:80px;
		background-image: url("/admin/images/sendMsgAll/page_endno.png");
	}
	.submit-image-div,.submit-url-div{
		display: inline-block;
		width:76px;
		heihgt:24px;
		background-color: #ff834d;
		line-height: 24px;
		text-align: center;
		color: #ffffff;
		margin-left:20px;
		border-radius:6px;
		cursor: pointer;
	}
	.select-img-div tfoot span{
		margin-left:0;
		float: none;
	}
	.select-img-div  .select2{
		width:100px;
		margin-right:0;
		margin-left:20px;
	}
	.select-img-div thead tr td{
		font-size:14px;
		height:30px;
	}
	.page-span-div{
		display: inline-block;
		position: relative;
		height:30px;
		text-align: center;
		line-height: 30px;
		vertical-align: middle;
		float: none;
		margin-top:15px;
	}
	.page-span-div span{
		margin-right:20px;
	}
	.fullbg_div { 
		background-color:#000000; 
		left:0;
		opacity:0.4;
		position:absolute; 
		top:0; 
		z-index:100;
		filter:alpha(opacity=40);
		-moz-opacity:0.4; 
		-khtml-opacity:0.4; 
	}
	.close-modal-small {
		position:absolute;
		top: -8px;
		right: -6px;
		width: 16px;
		height: 16px;
		line-height: 16px;
		border-radius: 8px;
		font-size:14px;
		display:inline-block;
		text-align: center;
		display:none;
		cursor: pointer;
	}
	.close-modal-small.show-delete{
		background-color: #07d;
		color:#ffffff;
	}
	.replace-img-div{
		height:20px;
		width:100%;
		position: absolute;
		display: inline-block;
		margin-top:400px;
		text-align: center;
		line-height: 20px;
		vertical-align: middle;
	}
	.replace-img-div span{
		width:10px;
		height:10px;
		border-radius:5px;
		display: inline-block;
		background-color: #eeeeee;
		opacity:0.4;
		float:none;
		margin-left:5px; 
		border:1px solid #333333;
	}
	.top_head_div{
		width:100%;
		background-color:  #d1102d;
		color:#ffffff;
		height:50px;
		font-size:18px;
		vertical-align: middle;
		line-height: 50px;
	}
	.top_head_div span{
		margin-left:30px;
	}
	.select-goods-url-div{
		display:none; 
		width:615px;
		position: absolute;
		top:100px;
		left:18%;
		background-color: #ffffff;
		border-radius:6px 6px 6px 6px;
		z-index:300;
	}
	.url-query-div{
		height:33px;
		margin-top:20px;
		line-height:33px;
		vertical-align: middle;
		font-size:14px;
	}
	.url-query-div span{
		margin-left:20px;
	}
	.url-query-div .select2{
		width:165px;
		margin-left:20px;
	} 
	.url-query-div input{
		width:150px;
		margin-left:20px;
		height:24px;
	}
	.submit-query-span{
		float:right;
		width:45px;
		height:24px;
		border:1px solid #d5d5d5;
		background-color: #eeeeee;
		cursor: pointer;
		line-height: 24px;
		text-align: center;
		margin-top:4px;
		margin-right:25px;
		border-radius:4px;
	}
	.select-goods-url-div table thead tr td{
		height:30px;
		font-size:14px;
	}
	.select-goods-url-div table tbody tr td{
		font-size:12px;
		height:35px;
		line-height: 35px;
		vertical-align: middle;
		border-top:1px solid #eeeeee;
	}
	.select-goods-url-div table tbody tr td span{
		margin-left:6px;
	}
	.select-goods-url-div table tbody tr .border-no{
		border:0;
	}
	.select-goods-url-div  tfoot span{
		margin-left:0;
		float: none;
	}
	.select-goods-url-div  tfoot  td{
		border-top:1px solid #eeeeee;
	}
	.select-goods-url-div .foot-page-select .select2{
		width:100px;
		margin-right:0;
		margin-left:20px;
	}
	.page_span_url{
		width:12px;
		height:22px;
		background-repeat: no-repeat;
		display: inline-block;
		cursor: pointer;
		margin-bottom:-2px;
	}
	.page_span_url.page_first{
		margin-left:50px;
		background-image: url("/admin/images/sendMsgAll/page_first.png");
	}
	.page_span_url.page_first_none{
		margin-left:50px;
		background-image: url("/admin/images/sendMsgAll/page_firstno.png");
	}
	.page_span_url.page_front{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_front.png");
	}
	.page_span_url.page_front_none{
		margin-right:0;
		background-image: url("/admin/images/sendMsgAll/page_headno.png");
	}
	.page_span_url.page_next{
		background-image: url("/admin/images/sendMsgAll/page_next.png");
	}
	.page_span_url.page_next_none{
		background-image: url("/admin/images/sendMsgAll/page_nextno.png");
	}
	.page_span_url.page_end{
		margin-right:70px;
		background-image: url("/admin/images/sendMsgAll/page_last.png");
	}
	.page_span_url.page_end_none{
		margin-right:70px;
		background-image: url("/admin/images/sendMsgAll/page_endno.png");
	}
	.selected-span-url{
		margin-left:0;
		width:45px;
		height:24px;
		background-color: #eee;
		text-align: center;
		vertical-align: middle;
		line-height:24px;
		border-radius:4px;
		cursor: pointer;
		border:1px solid #d5d5d5;
	}
	.selected-span-url.selected-revise{
		color: #ffffff;
		background-color: #3275dd;
	}
	.contant{
		width: 90%;
	}
	.contant td{
		height: 50px;
	}
	.select2{
		width: 234px;
	}
	.startDate{
		width:100px;
		background-image: url(/admin/images/cust/calendar.png) ;
		background-repeat: no-repeat;
		background-position:95% 7px;
		font-size: 12px;
		cursor: pointer;
	}
	.endDate{
		width:100px;
		background-image: url(/admin/images/cust/calendar.png) ;
		background-repeat: no-repeat;
		background-position:95% 7px;
		font-size: 12px;
		cursor: pointer;
	}
	.phoneImg{
		width: 100%;
		height: 380px;
		background-size:100% 380px;
	}
	#backImg img{
		width: 100px;
		height: 100px;
	}
	.p-couponNm{
		position:absolute;
		top:170px;
		font-size: 25px;
		width:275px;
		height:30px;
		margin-left:22px;
		line-height:30px;
		color: #92351e;
		text-align: center;
	}
	.p-faceValue{
		position:absolute;
		top:230px;
		left:30px;
		font-size: 35px;
		width:150px;
		color: #92351e;
		text-align: right;
	}
	.p-buyAmount{
		position:absolute;
		top:350px;
		font-size: 14px;
		width:92%;
		color: #92351e;
		text-align: center;
	}
	.lamitDate{
		position:absolute;
		top:400px;
		font-size: 14px;
		width:92%;
		color: #92351e;
		text-align: center;
	}
	.text{
		position:absolute;
		top:230px;
		left:190px;
		width:92%;
	}
	.text .text1{
		color:#f5e41b;
		font-size: 40px;
	}
	.text .text2{
		color:#92351e;
		font-size: 25px;
		margin-top: 10px;
		display: inline-block;
	}
	.bitian{
		margin-left:5px;
		color: #d1120d;
	}
.img-publish-div{
	width:98px;
	height:98px;
	border:1px solid #d2d2d2;
	background: url("/admin/images/rouletteActivity/icon_img.png");
	background-position: 38px 33px;
	background-repeat:no-repeat;
	background-color:#f7f7f7;
	cursor: pointer;
	margin-top:0px;
	float: left;
}
.img-publish-div span{
	width:100%;
	text-align: center;
	display: inline-block;
	margin-top:60px;
	color:#5f5f5f;
	font-size:12px;
}
.img-publish-div img{
	width:98px;
	height:98px;
}
.app-design .app-preview .app-entry {
	border-bottom:1px solid #e7e7e7;
}
</style>

<script type="text/javascript">
//判断已经有几张图片了
var indexNow = -1;
var objUrlSelect;
var flagOne = true;
$(function() {
	$('#custLevel').select2('val','${requestScope.list.CUST_LEVEL}');
	$('#startDate').datepicker();
	$('#endDate').datepicker();
	$(window).scroll(function () {
		$('.js-field-area').animate({top: _.max([$('#step-content-region').offset().top -$(document).scrollTop(),60])  },100); 
	});
	
	$('.btn-step-confirm').click(function(){
	
		if($(this).data('item') == '1'){
			var fileId = $('#fileId').val();
			if(fileId == ''){
				alert('<ui:i18n key="请选择背景图片"/>.');
				return;
			}
			var couponNm = $('#couponNm').val();
			if(couponNm == ''){
				alert('<ui:i18n key="请输入优惠券名称"/>.');
				return;
			}
			var faceValue = $('#faceValue').val();
			if(faceValue == ''){
				alert('<ui:i18n key="请输入优惠券金额"/>.');
				return;
			}
			if(isNaN(faceValue)){
				alert('<ui:i18n key="优惠券金额必须为数字"/>.');
				return;
			}
			var circulationCnt = $('#circulationCnt').val();
			if(circulationCnt == ''){
				alert('<ui:i18n key="请输入发行数量"/>.');
				return;
			}
			if(isNaN(circulationCnt)){
				alert('<ui:i18n key="发行数量必须为数字"/>.');
				return;
			}
			var startDate = $('#startDate').val();
			if(startDate == ''){
				alert('<ui:i18n key="请输入有效期限起始时间"/>.');
				return;
			}
			var endDate = $('#endDate').val();
			if(endDate == ''){
				alert('<ui:i18n key="请输入有效期限结束时间"/>.');
				return;
			}
			if(startDate>endDate){
				alert('<ui:i18n key="有效期限格式错误"/>.');
				return;
			}
			var custLevel = $('#custLevel').val();
			if(custLevel == ''){
				alert('<ui:i18n key="请选择用户等级"/>.');
				return;
			}
			var buyAmount = $('#buyAmount').val();
			if(buyAmount == ''){
				alert('<ui:i18n key="请选择购买金额"/>.');
				return;
			}
			if(isNaN(buyAmount)){
				alert('<ui:i18n key="购买金额必须为数字"/>.');
				return;
			}
			var couponId = $('#couponId').val();
			var param = {
						flieId : fileId,
						couponNm : couponNm,
						couponId : couponId,
						faceValue : faceValue,
						circulationCnt : circulationCnt,
						startDate : startDate,
						endDate : endDate,
						custLevel : custLevel,
						buyAmount : buyAmount
					};
			$.ajax({
				data : param,
				url : '/admin/voucher/update.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						alert('<ui:i18n key="保存成功"/>');	
						window.location.href = '/admin/voucher/voucher.htm';
					}else{
						alert('<ui:i18n key="保存失败"/>，<ui:i18n key="请重新操作"/>');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			 });
		}else{
			window.location.href = '/admin/voucher/voucher.htm';
		}
	});
	$('#couponNm').blur(function(){
		var couponNm = $('#couponNm').val();
		$('.p-couponNm').text(couponNm);
	});
	
	$('#faceValue').blur(function(){
		var faceValue = $('#faceValue').val();
		if(isNaN(faceValue)){
			alert('<ui:i18n key="优惠券金额必须为数字"/>.');
			return;
		}
		$('.p-faceValue').text(faceValue+'<ui:i18n key="元"/>');
		$('#moveMoney').text(faceValue);
	});
	
	$('#circulationCnt').blur(function(){
		var circulationCnt = $('#circulationCnt').val();
		if(isNaN(circulationCnt)){
			alert('<ui:i18n key="发行数量必须为数字"/>.');
			return;
		}
	});
	$('#buyAmount').blur(function(){
		var buyAmount = $('#buyAmount').val();
		if(isNaN(buyAmount)){
			alert('<ui:i18n key="购买金额必须为数字"/>.');
			return;
		}
		$('#allMoney').text(buyAmount);

	});
	
	$('#startDate').change(function(){
		var startDate = $('#startDate').val();
		$('#p-startDate').text(startDate);
	});
	$('#endDate').change(function(){
		var endDate = $('#endDate').val();
		$('#p-endDate').text(endDate);
	}); 
	//弹出框
	$('#preview').click(function(){
			height = 540;
		$('#iframe_avi_music_image').attr('src','/admin/sendMsgAll/selectImg.htm?fileGroup=1');
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 830,
			height : height,
			action : $('#iframe_avi_music_image').attr('src')
		});
	});
	
}); 

//关闭弹出框的操作
function closeDiv(id,name,url){
	$('#preview').children().remove();
	$('#preview').append("<img class='img_show_img'  alt='' src='" + url + "'/>");
	$('#fileId').val(id);
	$('.phoneImg').css('background-image','url(' + url + ')');
	$('.phoneImg').css('background-size','100% 380px');
	closebpoupMe();
}
function closebpoupMe(){
	closeBpopupWindow('bpoupMessage');
}


</script>
</head>
<body>
	       <div class="container" style="width:100%;">
			    <form  id="fileupload-test" action="" method="POST" enctype="multipart/form-data">
					<input id="files-test" type="file" name="files[]" multiple style="display: none;" >  
				</form>
				<div class="goods-step-area" style="width:100%;margin-top:0;padding-top:0;">
			  		 <div class="goods-content-step js-goods-content-step-3" style="width:100%;margin-top:0;">
			  		 <!-- <div class="step-sp clearfix" style="width:100%;"></div> -->
			  		 		<!-- - -->
			  		 		<div class="app-init-container">
			               		<div id="app-region" class="app__content" style="width: 100%;margin-right: 0px;">
			                       	<div class="goods-edit-area" >
										<!-- --- -->
										<div id="step-content-region">
											<div class="app-design clearfix" >
												<div class="app-preview" style="margin-left: -5%;left:60px;border-radius:47px;">
										    		<div class="app-header"></div>
										   			<div class="app-entry" style="height:370px;background-color: #ffffff">
														<div class="phoneImg" style="background-image:url('${requestScope.list.FILE_ID_B_URL}');"></div>
														<div class="p-couponNm">${requestScope.list.COUPON_NM }</div>
														<div class="p-faceValue">${requestScope.list.FACE_VALUE}<ui:i18n key="元"/></div>
														<div class="text"><span class="text1"><ui:i18n key="优惠券"/></span><br><span class="text2">COUPON</span></div> 
														<div class="p-buyAmount">
															<span><ui:i18n key="订单满"/></span>
															<span style="font-size:16px" id="allMoney">${requestScope.list.BUY_AMOUNT}</span>
															<span style="font-size:16px"><ui:i18n key="元"/></span>
															<span><ui:i18n key="减"/></span>
															<span style="font-size:16px" id="moveMoney">${requestScope.list.FACE_VALUE}</span>
															<span style="font-size:16px"><ui:i18n key="元"/></span>
															<span>（<ui:i18n key="含物流费"/>）</span>
														</div>
														<div class="lamitDate">
															<span><ui:i18n key="有效期限"/>：</span>
															<span id="p-startDate">${requestScope.list.VALIDITY_F_DT}</span>
															<span>~</span>
															<span id="p-endDate">${requestScope.list.VALIDITY_T_DT}</span>
														</div>
													</div>
										    		<div class="app-footer"></div>
 												</div>
												<div class="app-sidebar" style="width: 530px;margin-top: 20px;margin-left:80px;font-size:12px;color:#5f5f5f;"><div class="arrow"></div>
													<div class="app-sidebar-inner js-sidebar-region">
														<div>
															<form class="form-horizontal" novalidate="">
																<div class="control-group" id="appendChildGroup" style="width: 480px;margin-left: 5%;margin-top:10px;">										
																	<div class="div-img-warp" style="height: 120px">
																		<div style="margin-bottom: 20px;margin-right: 5%"><ui:i18n key="选择背景"/><span class="bitian">*</span>：</div>
																		<div class="div-img img"  style="border: 0;width: 100px;height: 100px;" >
																	 		<div class="img-publish-div" id="preview">
																				<img src='${requestScope.list.FILE_ID_B_URL}'/>
																			</div>
																		</div>
																		<div style="margin-bottom: 20px;margin-right: 5%;margin-left: 20%"><ui:i18n key="示例"/>：</div>
																		<div id="backImg" style="width: 100px;height: 100px;">
																			<img alt="" src="/admin/images/voucher/img_example.png">
																		</div>
																		<input type="hidden" value="${requestScope.list.FILE_ID_B}" id="fileId"/>
																	</div>	
																	<span style="position:absolute; color: #d1102d;font-size: 12px;margin-top:-17px;margin-left:100px;display: inline-block;text-align: center;"><ui:i18n key="图片推荐尺寸"/>：640px&nbsp;*&nbsp;457px</span>	
																	<div style="margin-top: 10px;font-size:14px;  line-height: 25px;font-weight:bold;border-bottom:1px solid #eee;"><ui:i18n key="基本信息"/></div>	
																	<table class="contant">
																		<tr>
																			<td style="width: 100px"><ui:i18n key="优惠券名称"/><span class="bitian">*</span>：</td>
																			<td colspan="2" style="width: 300px">
																				<input type="text" id="couponNm" style="width:210px;" value="${requestScope.list.COUPON_NM}"  maxlength="10" placeholder='<ui:i18n key="最多可输入10个字"/>'/>
																			</td>
																		</tr>
																		<tr>
																			<td style="width: 100px"><ui:i18n key="优惠券金额"/><span class="bitian">*</span>：</td>
																			<td style="width:100px">
																				<input type="text" id="faceValue" style="width:130px;" value="${requestScope.list.FACE_VALUE}" maxlength="3" placeholder='<ui:i18n key="最多可输入三位数"/>'/>
																				<input type="hidden" id="couponId" value="${requestScope.list.COUPON_ID}"/>
																			</td>
																			<td style="width: 200px">&nbsp;&nbsp;<ui:i18n key="元"/></td>
																		</tr>
																		<tr>
																			<td style="width: 100px"><ui:i18n key="发行数量"/><span class="bitian">*</span>：</td>
																			<td style="width: 100px"><input type="text" id="circulationCnt" value="${requestScope.list.CIRCULATION_CNT}"  style="width:130px;"  maxlength="5" placeholder='<ui:i18n key="最多可输入五位数"/>'/></td>
																			<td style="width: 200px">&nbsp;&nbsp;<ui:i18n key="张"/></td>
																		</tr>
																	</table>	
																	<div style="margin-top: 30px;font-weight:bold;font-size:14px;  line-height: 25px;border-bottom:1px solid #eee;"><ui:i18n key="优惠券使用限制"/></div>	
																	<table class="contant">
																		<tr>
																			<td style="width: 100px"><ui:i18n key="有效期限"/><span class="bitian">*</span>：</td>
																			<td style="width: 300px" colspan="2">
																				<input type="text" class="startDate" value="${requestScope.list.VALIDITY_F_DT}" style="width: 115px" id="startDate"  placeholder='<ui:i18n key="请选择起始日期"/>'/>
																				<span  class="bitian">~</span>
																				<input type="text" class="endDate" value="${requestScope.list.VALIDITY_T_DT}" style="width: 115px" id="endDate" placeholder='<ui:i18n key="请选择结束日期"/>'/>
																			</td>
																		</tr>
																		<tr>
																			<td style="width: 100px"><ui:i18n key="客户等级"/><span class="bitian">*</span>：</td>
																			<td style="width:100px">
																				<select class="select2"  style="width:150px;" data-placeholder="<ui:i18n key="请选择等级"/>" id="custLevel">
																					<option value=""></option>
																					<c:forEach items="${grade}" var="grade">
													       								<option value="${grade.gradeId }">${grade.gradeName }</option>
													       							</c:forEach>
																				</select>
																			</td>
																			<td style="width: 200px">&nbsp;&nbsp;<ui:i18n key="以上"/></td>
																		</tr>
																		<tr>
																			<td style="width: 100px"><ui:i18n key="购买金额"/><span class="bitian">*</span>：</td>
																			<td style="width: 100px"><input type="text" value="${requestScope.list.BUY_AMOUNT}"  style="width:130px;" id="buyAmount"  maxlength="5" placeholder="<ui:i18n key="最多可输入五位数"/>"/></td>
																			<td style="width: 200px">&nbsp;&nbsp;<ui:i18n key="元"/><ui:i18n key="以上"/></td>
																		</tr>
																	</table>			
																</div>
															</form>
														</div>
													</div>
													<div style="width:100%;text-align: center;margin-top:30px;">
								             			<span class="button bg-red js-trans-order-confirm btn-step-confirm"   data-item="1">
															<span class="button-icon conform"></span>
																<ui:i18n key="保存"/>
														</span>
														<span class="button bg-red  js-trans-order-cancel btn-step-confirm" style="margin-left:30px;" data-item="2">
															<span class="button-icon cancel"></span>
																<ui:i18n key="取消"/>
														</span>
								             		</div>
												</div>
												
											</div>
										</div>
										<!-- --- -->
										
									</div>
			             		</div>
			                </div>    
			  		</div><!--js-goods-content-step-3 -->
			  		 
			  	</div>	
				<!-- end22 -->
				<!-- ▼ bpopup area -->
					<div class="bpopup2" id="bpoupMessage" >
					 	<div class="bpopupWarp">
					 		 <div class="bpopupHeaderWarp">
								<h3 class="bpopupTitle js-title"><ui:i18n key="选择图片"/></h3>
								<div class="bpopupColseWarp">
									<img class="b-close" src="/admin/images/goodsSell/close.png" />
								</div>
							</div>
					 		 <div class="bpopupContentWarp"> 
					 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_avi_music_image"  style="overflow: hidden;" src=""></iframe>
					 		 </div>
					 	</div>
					</div>
				<!-- ▲ bpopup area -->
			</div> 
</body>
</html>