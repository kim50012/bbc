<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="摇奖活动"/></title>  
<style type="text/css">
  .must-input{
		color:#d1120d;
	}
 .phone-show-div{
	position: relative;
	float: left;
	width: 340px;
	border: 1px solid #e5e5e5;
	background-color: #f7f7f7;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	background: #fff;
	border-radius: 47px;
	padding-bottom: 20px;
}
.phone-top-div{
	height:80px;
	background: url("/admin/images/widget/iphone_head.png") no-repeat center center;
 }
 .phone-body-div{
	width: 310px;
	margin: 0 auto;
	padding-bottom: 11px;
	min-height: 530px;
	border: 1px solid #c5c5c5;
	background: #f7f7f7;
	position: relative;
	border-radius:6px;
 }
 .phone-foot-div{
 	height: 75px;
  	background: url("/admin/images/widget/iphone_bottom_button.png") no-repeat center center;
 }
.app-sidebar {
	position: relative;
	float: left;
	max-width: 560px;
	margin-left: 15px;
	padding-bottom: 20px;
	font-size: 14px;
	height:50px;
	width:560px;
}
.app-sidebar .arrow,.app-sidebar .arrow:after {
	width: 0px;
	height: 0px;
	border-style: solid;
	border-width: 8px 10px 8px 0;
	border-color: transparent #d1d1d1 transparent transparent;
	position: absolute;
	left: -10px;
	top: 19px;
}

.app-sidebar .arrow:after {
	content: "";
	border-right-color: #fff;
	left: 1px;
	top: -8px;
}
.app-sidebar .app-sidebar-inner {
	min-height: 28px;
	background: #ffffff;
	border-radius: 5px;
	border: 1px solid #e7e7e7;
}
.game-title-table{
	width:100%;
	position: relative;
	font-size:12px;
	margin-top:10px;
}
.game-title-table tr .text-title-td{
	color:#5f5f5f;
	font-size:12px;
	width:85px;
	padding-right:15px;
	text-align: right;
	padding-left:10px;
}
.game-title-table tr .img-title-td{
	height:80px;
	color:#5f5f5f;
	font-size:12px;
	width:85px;
	padding-right:15px;
	text-align: right;
	vertical-align: top;
	padding-top:15px;
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
	margin-top:10px;
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
.game-input-td input{
	width:300px;
	margin-bottom:10px;
	margin-top:10px;
}
.game-time-input-td{
	font-size:12px;
	color:#5f5f5f;
}
.game-time-input-td input{
	width:85px;
	margin-bottom:2px;
	background-image: url("/admin/images/myFile/calendar.png");
	background-repeat: no-repeat;
	background-position: 90% 50%;
	cursor: pointer;
}
.game-time-input-td .connect-flag{
	color:#d1102d;
	font-size:18px;
}
.result-img-show{
	position:absolute;
	width:149px;
	height:194px;
	top:10px;
	left:160px;
}
.game-part-table{
	width:100%;
	position: relative;
	font-size:12px;
	margin-bottom:30px;
	color:#5f5f5f;
}
.game-part-table tr td{
	height:40px;
}
.msg-input{
	width:130px;
}
.point-input{
	width:40px;	
}
.send-limit{
	width:40px;
}
.foot-div-submit{
  text-align: center;
  margin-top: 20px;
  margin-bottom: 20px;
  height: 34px;
}
.roulette-back{
	width:100%;
	height:100%;
	z-index: 3;
	position: relative;
}
.roulette-back img{
	height:530px;
}
.roulette-bp{
	position: absolute;
	z-index: 4;
	text-align: center;
	top:25%;
}
.roulette-point{
	width:100%;
	position: absolute;
	z-index: 6;
	top:42.4%;
	left:110px;
	background-position:10px center;
	background-repeat: no-repeat;
	background-size:18%; 
}
</style> 
 
<script type="text/javascript">
$(function(){
	var startDate = '${requestScope.list[0].GAME_START_DT}';
	var endDate = '${requestScope.list[0].GAME_END_DT}';
	var startHour = startDate.substring(11,13);
	var startMinute = startDate.substring(14,16);
	var endHour = endDate.substring(11,13);
	var endMinute = endDate.substring(14,16);
	$('#gameBeginHour').select2('val',startHour);
	$('#gameBeginMinute').select2('val',startMinute);
	$('#gameEndHour').select2('val',endHour);
	$('#gameEndMinute').select2('val',endMinute);
	
	$('#gameBeginDate').datepicker(); 
	$('#gameEndDate').datepicker(); 
	//控制输入框
	$('.iccheckbox').on('ifChecked', function(event){
		var item = $(this).data('item');
		var itemId = $(this).val();
		if(itemId == '1'){
			$('.point-input.send-point' + item).attr('disabled',false);
			$('.point-input.send-hongBao' + item).val('').attr('disabled',true);
		}else if(itemId == '2'){
			$('.point-input.send-point' + item).val('').attr('disabled',true);
			$('.point-input.send-hongBao' + item).attr('disabled',false);
		}
	});
	$('.point-input').change(function(){
		var className = $(this).attr('class');
		var idNo = className.substring((className.length-1),className.length);
		if($(this).val() == '0'){
			$('.send-limit.cnt' + idNo).attr('disabled',true).val('');
		}else{
			$('.send-limit.cnt' + idNo).attr('disabled',false);
		}
	});
	$('#preview').click(function(){
		$('#bgImgFile').trigger('click');
	});
	$('#previewRoulette').click(function(){
		$('#rouletteImdFile').trigger('click');
	});
	
	//保存活动信息
	$('.js-trans-order-confirm').click(function(){
         var imgLogoPicture =  document.getElementById('bgImgFile').value;
        var imgLogoPicture1 =  document.getElementById('rouletteImdFile').value;
		var gameName = $('#gameTitle').val();
		if(gameName == ''){
			alert('<ui:i18n key="请输入活动名称"/>');
			return;
		}
		var gameStartDate = $('#gameBeginDate').val();
		if(gameStartDate == ''){
			alert('<ui:i18n key="请选择活动开始时间"/>');
			return;
		}
		var gameBeginHour = $('#gameBeginHour').find('option:selected').val();
		if(gameBeginHour == ''){
			alert('<ui:i18n key="请选择活动开始时间"/>');
			return;
		}
		var gameBeginMinute = $('#gameBeginMinute').find('option:selected').val();
		if(gameBeginMinute == ''){
			alert('<ui:i18n key="请选择活动开始时间"/>');
			return;
		}
		gameStartDate += ' ' + gameBeginHour + ':' + gameBeginMinute + ':' + '00';
		var gameEndDate = $('#gameEndDate').val();
		var gameEndHour = $('#gameEndHour').find('option:selected').val();
		var gameEndMinute = $('#gameEndMinute').find('option:selected').val();
		if(gameEndDate == ''){
			alert('<ui:i18n key="请选择活动结束时间"/>');
			return;
		}
		if(gameEndHour == ''){
			alert('<ui:i18n key="请选择活动开始时间"/>');
			return;
		}
		if(gameEndMinute == ''){
			alert('<ui:i18n key="请选择活动开始时间"/>');
			return;
		}
		gameEndDate += ' ' + gameEndHour + ':' + gameEndMinute + ':' + '00';
		var date1 = new Date(gameStartDate);
		var date2 = new Date(gameEndDate);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		var bgImgUrl='';
		var fileName1 = $('#preview').find('img').attr('data-filename');
		if(typeof(fileName1) != 'undefined'){
			bgImgUrl += $('#preview').find('img').attr('src');
		}else{
			fileName1 = '';
			if(imgLogoPicture == ''){
	        	alert('<ui:i18n key="请选择背景图片"/>');
	        	return;
	        }else{
	        	 var type = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('.') + 1, imgLogoPicture.length).toLowerCase();
	        	 if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
	                 alert('<ui:i18n key="背景图片格式不正确"/>');
	                 return;
	             } 
	        }
			fileName1 += imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
		}
		var fileName2 = $('#previewRoulette').find('img').attr('data-filename');
		var rouletteImgUrl = '';
		if(typeof(fileName2) == 'undefined'){
			fileName2='';
			if(imgLogoPicture1 == ''){
	        	alert('<ui:i18n key="请选择表盘图片"/>');
	        	return;
	        }else{
	        	var type = imgLogoPicture1.substring(imgLogoPicture1.lastIndexOf('.') + 1, imgLogoPicture1.length).toLowerCase();
	        	 if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
	                 alert('<ui:i18n key="表盘图片格式不正确"/>');
	                 return;
	             } 
	        }
			fileName2 += imgLogoPicture1.substring(imgLogoPicture1.lastIndexOf('\\') + 1, imgLogoPicture1.length);
		}else{ 
			rouletteImgUrl += $('#previewRoulette').find('img').attr('src');
		}
		var custChanceNum = $('#custChanceNum').val();
		if(custChanceNum == ''){
			alert('<ui:i18n key="请填写摇奖次数"/>');
			return false;
		}else if(!custChanceNum.match(/^\d+$/)){
			alert('<ui:i18n key="摇奖次数只能填写数字"/>');
			return false;
		}
		var itemIdStr = '';
		var msgStr = '';
		var winTypeStr = '';
		var winPointStr = '';
		var winVoucherStr = '';
		var winHongBaoStr = '';
		var gameLimitCntStr = '';
		var gameLimitCnt = 0;
		
		for(var i = 1;i <= 8;i++){
			itemIdStr += i + ',';
			winVoucherStr += 0 + ',';
			if($('.msg-input.msg' + i).val() == ''){
				alert('<ui:i18n key="请填写第"/>' + i + '<ui:i18n key="区的中奖提示信息"/>');
				return;
			}
			msgStr += $('.msg-input.msg' + i).val() + ',';
			var typeSelected=document.getElementsByName('send-money' + i);
			var pointNum = '';
			var hongBaoNum = '';
			if(typeSelected[0].checked){
				pointNum = $('.point-input.send-point' + i).val();
				if(pointNum == ''){
					alert('<ui:i18n key="请填写第"/>' + i + '<ui:i18n key="区的赠送积分数量"/>');
					return false;
				}else if(!pointNum.match(/^\d+$/)){
					alert('<ui:i18n key="第"/>' + i + '<ui:i18n key="区的赠送积分数量只能填写数字"/>');
					return false;
				}
				winPointStr += pointNum + ',';
				winHongBaoStr += 0 + ',';
				if(pointNum != '0'){
					winTypeStr += 1 + ',';
				}
			}else if(typeSelected[1].checked){
				hongBaoNum = $('.point-input.send-hongBao' + i).val();						
				if(hongBaoNum == ''){
					alert('<ui:i18n key="请填写第"/>' + i + '<ui:i18n key="区的赠送红包数量"/>');
					return false;
				}else if(!hongBaoNum.match(/^\d+$/)){
					alert('<ui:i18n key="第"/>' + i + '<ui:i18n key="区的赠送红包数量只能填写数字"/>');
					return false;
				}
				winPointStr += 0 + ',';
				winHongBaoStr += hongBaoNum + ',';
				if(hongBaoNum != '0'){
					winTypeStr += 2 + ',';
				}
			}else{
				alert('<ui:i18n key="请选择第"/>' + i + '<ui:i18n key="区的奖励方式"/>');
				return;
			}
			if(hongBaoNum == '0' || pointNum == '0'){
				gameLimitCnt += 0;
				gameLimitCntStr += 0 + ',';
				winTypeStr += 0 + ',';
			}else{
				if($('.send-limit.cnt' + i).val() == ''){
					alert('<ui:i18n key="请填写第"/>' + i + '<ui:i18n key="区的限中奖次数"/>');
					return;
				}else if(!($('.send-limit.cnt' + i).val()).match(/^\d+$/)){
					alert('<ui:i18n key="请填写第"/>' + i + '<ui:i18n key="区的限中奖次数只能填写数字"/>');
					return;
				}
				gameLimitCnt  += Number($('.send-limit.cnt' + i).val());
				gameLimitCntStr += $('.send-limit.cnt' + i).val() + ',';
			}
		}
		itemIdStr = itemIdStr.substring(0,itemIdStr.length - 1);
		winPointStr = winPointStr.substring(0,winPointStr.length - 1);
		winVoucherStr = winVoucherStr.substring(0,winVoucherStr.length - 1);
		winHongBaoStr = winHongBaoStr.substring(0,winHongBaoStr.length - 1);
		gameLimitCntStr = gameLimitCntStr.substring(0,gameLimitCntStr.length - 1);
		msgStr = msgStr.substring(0,msgStr.length - 1);
		winTypeStr = winTypeStr.substring(0,winTypeStr.length - 1);
		/* alert(itemIdStr+';'+winPointStr+';'+msgStr+';'+winVoucherStr+';'+winHongBaoStr+';'+gameLimitCntStr+';'+winTypeStr);
		return; */
		var param = {
						fileName1 : fileName1
					};
	/* 	///////////////////////////////////
		
		return; */
		$.ajaxFileUpload ({
			data : param,
			url :'/admin/rouletteActivity/saveRouletteActivityImg.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
			secureuri : false,
			fileElementId :'bgImgFile',
			dataType : 'json',
			type:'post',
			success : function (data){
				if(data.fileUrl != ''){
					if(data.fileUrl != '1'){
						bgImgUrl = data.fileUrl;
					}
					var gameId=$("#gameId").val();
					var param2 = {
							bgImgUrl : bgImgUrl,
							itemIdStr : itemIdStr,
							winPointStr : winPointStr,
							msgStr : msgStr,
							winVoucherStr : winVoucherStr,
							winHongBaoStr : winHongBaoStr,
							gameLimitCntStr : gameLimitCntStr,
							winTypeStr : winTypeStr,
							gameName : gameName,
							gameStartDate : gameStartDate,
							gameEndDate : gameEndDate,
							fileName1 : fileName1,
							fileName2 : fileName2,
							gameLimitCnt : gameLimitCnt,
							jobType : 'U',
							isDelete : 0,
							isUse : 1,
							rouletteImgUrl : rouletteImgUrl,
							gameId : gameId,
							custChanceNum : custChanceNum
						};
					$.ajaxFileUpload ({
						data : param2,
						url : '/admin/rouletteActivity/saveUpdateRouletteActivity.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
						secureuri : false,
						fileElementId : 'rouletteImdFile',
						dataType : 'json',
						type :'post',
						success : function (data){
							if(data.ret == 'success'){
								alert('<ui:i18n key="保存成功"/>');
								window.location.href='/admin/rouletteActivity/rouletteActivity.htm';
							}else if (data.ret == 'fail'){
								alert('<ui:i18n key="请检查信息"/>,<ui:i18n key="重新点击添加"/>.');
							}
						},
						error: function (data, e){
							alert(e );
						}
					});	
				}else{
					alert('<ui:i18n key="请检查信息"/>,<ui:i18n key="重新点击添加"/>.');
				}
			},
			error: function (data, e){
				alert(e );
			}
		});	
	});
	
	
});

//转盘的上传预览
function logoUpload(file){
	if(checkImage(file)){
		$('.phone-body-div').find('.roulette-bp').remove();
		$('.phone-body-div').find('.roulette-point').remove(); 
		 var prevDiv = document.getElementById('previewRoulette');
		 var htm = '';
		 if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
			 	prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="' + evt.target.result + '" />';
			 	htm = '<div class="roulette-bp"><img alt="" src="' + evt.target.result + '" width="90%" id="image">'
				+'</div><div class="roulette-point" >'+
				'<img alt="" src="/admin/images/rouletteActivity/DOOSAN_zhizhen_jinricishu.png" width="30%" style="cursor:pointer;" id="n_id"></div>'; 
			 	$('.phone-body-div').append(htm);
			}
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
		    htm = '<div class="roulette-bp"><img alt="" src="' + file.value + '" width="90%" id="image">'
			+'</div><div class="roulette-point">'+
			'<img alt="" src="/admin/images/rouletteActivity/DOOSAN_zhizhen_jinricishu.png" width="35.6%" style="cursor:pointer;" id="n_id"></div>';
		    $('.phone-body-div').append(htm);	
		}
	}else{
		var prevDiv = document.getElementById('previewRoulette');
		prevDiv.innerHTML = '<span><ui:i18n key="添加图片"/></span>';
		$('.phone-body-div').find('.roulette-bp').remove();
		$('.phone-body-div').find('.roulette-point').remove(); 
	}
}

//背景的上传预览
function logoBgUpload(file){
	$('.phone-body-div').find('.roulette-back').remove();
	if(checkImage(file)){
		var htm = '';
		var prevDiv = document.getElementById('preview');
		if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
		 	prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="' + evt.target.result + '" />';
		 	htm += '<div class="roulette-back"> <img alt="" src="' + evt.target.result + '" width="100%"></div>';
		 	$('.phone-body-div').append(htm);
			}; 
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
			htm += '<div class="roulette-back"> <img alt="" src="' + file.value + '" width="100%"></div>';
			$('.phone-body-div').append(htm);
		}
	}else{
		var prevDiv = document.getElementById('preview');
		prevDiv.innerHTML ='<span><ui:i18n key="添加图片"/></span>';
		$('.phone-body-div').find('.roulette-back').remove();
	}
}
//检查上传文件是否为图片
function checkImage(file){
	if(file.value == ''){
		return false;
	}
	var picPath = file.value;
    var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
    if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
        alert('<ui:i18n key="请上传正确的图片格式"/>');
        return false;
    }
	return true;
}
function cancel(){
	window.location.href = '/admin/rouletteActivity/rouletteActivity.htm';
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="phone-show-div" style="width:320px;">
			<div class="phone-top-div" onclick="window.location.reload();"></div>
			<div class="phone-body-div" style="width:300px;">
				<div class="roulette-bp">
					<img alt="" src="${requestScope.list[0].ROULETTE_IMG_URL}" width="90%" id="image">
				</div>
				<div class="roulette-back">
					<img alt="" src="${requestScope.list[0].BG_IMG_URL}" width="100%">
				</div>
				<div class="roulette-point">
					<img  alt="" src="/admin/images/rouletteActivity/DOOSAN_zhizhen_jinricishu.png" width="30%" style="cursor:pointer;" id="n_id">
				</div>
			</div>
			<div class="phone-foot-div"></div>
		</div>
		<div class="app-sidebar" style="margin-top: 75px;">
			<div class="arrow"></div>
			<div class="app-sidebar-inner js-sidebar-region">
				<table class="game-title-table">
						<tr>
							<td class="text-title-td"><ui:i18n key="活动标题"/><span class="must-input">*</span>：</td>
							<td colspan="2" class="game-input-td">
								<input type="text" value="${requestScope.list[0].GAME_NM }" id="gameTitle" style="font-size:12px;"/>
								<input type="hidden" value="${requestScope.list[0].GAME_ID}" id="gameId"/>
							</td>
						</tr>
						<tr>
							<td class="text-title-td" ><ui:i18n key="开始时间"/><span class="must-input">*</span>：</td>
							<td colspan="2" class="game-time-input-td">
								<input type="text" value="${requestScope.list[0].GAME_START_DT.substring(0,10)}" style="font-size:12px;margin-right:0px;" id="gameBeginDate"/>
								<select class="select2" style="width:75px;margin-right:0px;margin-right:2px;margin-left:10px;" id="gameBeginHour">
									<option value=""></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<c:forEach begin="10" end="23" varStatus="status">
										<option value="${status.index }">${status.index }</option>
									</c:forEach>
								</select>
								<ui:i18n key="时"/>
								<select class="select2" style="width:75px;margin-right:2px;margin-left:10px;" id="gameBeginMinute">
									<option value=""></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<c:forEach begin="10" end="59" varStatus="status">
										<option value="${status.index }">${status.index }</option>
									</c:forEach>
								</select>
								<ui:i18n key="分"/>
								<!-- <span class="connect-flag">~</span>
								<input type="text" value="" style="font-size:12px;" id="gameEndDate"/> -->
							</td>
						</tr>
						<tr style="height:10px;">
							<td></td><td></td><td></td>
						</tr>
						<tr>
							<td class="text-title-td" ><ui:i18n key="结束时间"/><span class="must-input">*</span>：</td>
							<td colspan="2" class="game-time-input-td">
								<input type="text" value="${requestScope.list[0].GAME_END_DT.substring(0,10)}" style="font-size:12px;margin-right:0px;" id="gameEndDate"/>
								<select class="select2" style="width:75px;margin-right:2px;margin-left:10px;" id="gameEndHour">
									<option value=""></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<c:forEach begin="10" end="23" varStatus="status">
										<option value="${status.index }">${status.index }</option>
									</c:forEach>
								</select>
								<ui:i18n key="时"/>
								<select class="select2" style="width:75px;margin-right:2px;margin-left:10px;"  id="gameEndMinute">
									<option value=""></option>
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<c:forEach begin="10" end="59" varStatus="status">
										<option value="${status.index }">${status.index }</option>
									</c:forEach>
								</select>
								<ui:i18n key="分"/>
								<!-- <span class="connect-flag">~</span>
								<input type="text" value="" style="font-size:12px;" id="gameEndDate"/> -->
							</td>
						</tr>
						<tr>
							<td class="img-title-td"><ui:i18n key="背景图片"/><span class="must-input">*</span>：</td>
							<td style="position: relative;width:100px;">
								<div class="img-publish-div" id="preview">
									<img src="${requestScope.list[0].BG_IMG_URL}" data-fileName="${requestScope.list[0].BG_IMG_FILE }"/>
								</div>
								<input type="file" style="display:none;" class="file-upload-input"  id="bgImgFile" name="bgImgFile" onchange="javascript:logoBgUpload(this);" />
							</td>
							<td  style="position: relative;vertical-align: top;padding-left:10px;">
								<div style="height:10px;"></div>
								<ui:i18n key="示例"/>：
								<img style="margin-left:13px;" src="/admin/images/rouletteActivity/bg.png"/>
								<img class="result-img-show" src="/admin/images/rouletteActivity/activity.png"/>
							</td>
						</tr>
						<tr>
							<td class="img-title-td"><ui:i18n key="表盘图片"/><span class="must-input">*</span>：</td>
							<td style="position: relative;">
								<div class="img-publish-div" id="previewRoulette">
									<img src="${requestScope.list[0].ROULETTE_IMG_URL}" data-fileName="${requestScope.list[0].ROULETTE_IMG_FILE }"/>
								</div>
								<input type="file" style="display:none;" class="file-upload-input"  id="rouletteImdFile" name="rouletteImdFile" onchange="javascript:logoUpload(this);" />
							</td>
							<td style="vertical-align: top;padding-left:10px;">
								<div style="height:10px;"></div>
								<ui:i18n key="示例"/>：
								<img style="margin-left:10px;" src="/admin/images/rouletteActivity/prize.png"/>
							</td>
						</tr>
						<tr style="height:10px;">
							<td ></td>
							<td style="font-size:14px;text-align: center;position: relative;" colspan="2">
								<span style="display:inline-block;width:130px;right:40px;font-size:12px;color:#5f5f5f;position: absolute;top:-10px;"><ui:i18n key="最终效果"/></span>
							</td>
						</tr>
						<tr style="height:40px;">
							<td class="img-title-td" style="height:40px;padding-top:5px;">
								<ui:i18n key="摇奖次数"/><span class="must-input">*</span>：
							</td>
							<td  colspan="2" style="font-size:12px;color:#a2a2a2;">
								<input type="text" value="${requestScope.list[0].CUST_CHANCE_NUM }" id="custChanceNum" style="width:80px;margin-right:10px;"/>
								<ui:i18n key="提示每个人可以摇奖的次数不限制请填0"/>；
							</td>
						</tr>
						<tr style="height:40px;">
							<td class="img-title-td" style="height:40px;padding-top:5px;<c:if test="${currLanguage eq 'ko-KR'}" >padding-right:13px;</c:if>">
								<ui:i18n key="设定奖项"/><span class="must-input">*</span>：
							</td>
							<td  colspan="2" style="font-size:12px;color:#a2a2a2;">
								<img src="/admin/images/rouletteActivity/setprize.png" alt=""/>
							</td>
						</tr>
					</table>
					<table class="game-part-table">
						<tr >
							<td style="padding-top:10px;text-align:right;width:100px;"><ui:i18n key="扇形序号"/><span style="display:inline-block;width:20px;"></span></td>
							<td style="padding-top:10px;width:150px;text-align: center;"><ui:i18n key="中奖提示信息"/></td>
							<td style="padding-top:10px;width:94px;text-align: right;"><ui:i18n key="积分"/> (<ui:i18n key="分"/>)<span style="width:10px;display: inline-block;"></span></td>
							<td style="padding-top:10px;width:94px;text-align: right;"><ui:i18n key="红包"/> (<ui:i18n key="元"/>)<span style="width:10px;display: inline-block;"></span></td>
							<td style="padding-top:10px;text-align: center;"><ui:i18n key="限中奖次数"/>(<ui:i18n key="次"/>)</td>
						</tr>
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr>
								<td style="text-align: center;">${list.ITEM_ID }</td>
								<td><input style="font-size:12px;" type="text" value="${list.MSG }" class="msg-input msg${list.ITEM_ID }"/></td>
								<td style="text-align: right;">
									<c:if test="${list.WIN_TYPE!=1 and  list.WIN_TYPE!=0 }">
										<input type="radio" value="1" name="send-money${list.ITEM_ID }" class="iccheckbox" data-item="${list.ITEM_ID }"/> 
										<input style="font-size:12px;"  disabled="disabled" type="text" value="" class="point-input send-point${list.ITEM_ID }"/>
									</c:if>
									<c:if test="${list.WIN_TYPE==1 }">
										<input type="radio" value="1" name="send-money${list.ITEM_ID }" checked="checked" class="iccheckbox" data-item="${list.ITEM_ID }"/> 
										<input style="font-size:12px;" type="text" value="${list.WIN_POINT }" class="point-input send-point${list.ITEM_ID }"/>
									</c:if>
									<c:if test="${list.WIN_TYPE==0 }">
										<input type="radio" value="1" name="send-money${list.ITEM_ID }" checked="checked" class="iccheckbox" data-item="${list.ITEM_ID }"/> 
										<input style="font-size:12px;"  type="text" value="0" class="point-input send-point${list.ITEM_ID }"/>
									</c:if>
								</td>
								<td style="text-align: right;">
									<c:if test="${list.WIN_TYPE!=2  }">
										<input type="radio" value="2" name="send-money${list.ITEM_ID }" class="iccheckbox" data-item="${list.ITEM_ID }"/> 
										<input style="font-size:12px;" disabled="disabled" type="text" value="" class="point-input send-hongBao${list.ITEM_ID }"/>
									</c:if>
									<c:if test="${list.WIN_TYPE==2}">
										<input type="radio" value="2" name="send-money${list.ITEM_ID }" checked="checked" class="iccheckbox" data-item="${list.ITEM_ID }"/> 
										<input style="font-size:12px;"  type="text" value="${list.WIN_HONGBAO }" class="point-input send-hongBao${list.ITEM_ID }"/>
									</c:if>
								</td>
								<td  style="text-align: center;">
									<c:if test="${list.WIN_TYPE==0}">
										<input style="font-size:12px;"  type="text" value="" disabled="disabled" class="send-limit cnt${list.ITEM_ID }"/>
									</c:if>
									<c:if test="${list.WIN_TYPE!=0}">
										<input style="font-size:12px;"  type="text" value="${list.GAME_LIMIT_CNT_EVERY }" class="send-limit cnt${list.ITEM_ID }"/>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
			</div>
			<div class="foot-div-submit">
				<div class="buttons-action">
	 				<span class="button bg-red js-trans-order-confirm" >
						<span class="button-icon conform"></span>
							<ui:i18n key="保存"/>
					</span>
					<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
						<span class="button-icon cancel"></span>
							<ui:i18n key="取消"/>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>