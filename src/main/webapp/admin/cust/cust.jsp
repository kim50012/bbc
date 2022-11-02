<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<title><ui:i18n key="客户筛选"/></title>  

<style type="text/css">
 .custNickNm{
	cursor: pointer;
	display: inline-block;
	white-space:nowrap; 
	text-overflow:ellipsis;
	overflow: hidden;
	width: 80px;
}
.conditions{
	position: absolute;
	font-size:12px;
	top:90%;
	right:50px;
	background-color: #ffffff;
	cursor: pointer;
}
.qunfa{
	position: absolute;
	font-size:12px;
	top:-25px;
	right:35px;
	background-color: #ffffff;
	font-weight: bolder;
}
.qunfa span{
	cursor: pointer;
}
</style>

<script type="text/javascript">
//页面加载时运行的代码

$(function() {
	//筛选基准赋值
	$('#subscribe').select2('val','${requestScope.subscribe}');
	
	//全选
	$('#checkall').on('ifChecked', function(event){
		$('input[type=checkbox]').iCheck('check');
		$('input[type=checkbox][nam=subcheck]').attr('checked','checked');
	});
	//反选
	$('#checkall').on('ifUnchecked', function(event){
		$('input[type=checkbox]').iCheck('uncheck');
		$('input[type=checkbox][name=subcheck]').removeAttr('checked');
	});
	
	$('.iCheck-helper').each(function(){
		$(this).click(function(){
			if($(this).prev().val() == 0){
				$(this).parents('.fcomp.last').find('.select2').select2('val','');
				$(this).parents('.fcomp.last').find('.select2').attr('disabled','disabled');
				$(this).parents('.fcomp.last').find('input[type=text]').val('');
				$(this).parents('.fcomp.last').find('input[type=text]').attr('disabled','disabled');
			}else{
				$(this).parents('.fcomp.last').find('.select2').removeAttr('disabled');
				$(this).parents('.fcomp.last').find('input[type=text]').removeAttr('disabled');
			} 
		}); 
	});

	$('#nickName').keypress(function(event){
		if(event.keyCode == 13){
			selCondition();			
		}
	});

	var dateStart = '${requestScope.dateStart }';
	var dateEnd = '${requestScope.dateEnd }';
	if(dateStart != '' || dateEnd != ''){	
		$('input[name=date]:eq(1)').iCheck('check');
		$('.form-table.two').show();
		$('.conditions').css('top','97%');
		$('.conditions span').text('<ui:i18n key="基本筛选条件"/>');
		$('.showImg').attr('src','/admin/images/cust/up.png');
	}	
	

});

//弹出设等级框
function ShowDivSelGrade(custSysId,shopId,gradeId,wxId,purTimes,priceSum){
	$('#custSysId').val(custSysId);
	$('#shopId').val(shopId);
	$('#wxId').val(wxId);
	$('#purTimes').val(purTimes);
	$('#priceSum').val(priceSum);
	$('#selectGrade').select2('val',gradeId);
	showBpopup({
		id : 'setGrade',
		width : 510 
	});
};

//打开群设等级框
function ShowDivSelGrades(){
	var subscribe = '';
	var flag = true;
	$('input[name=subcheck]:checked').each(function(){  
		if($(this).parents('.chk').find('#SUBSCRIBE').val() == 0){
			flag = false;
		}
	});
	if(!flag){
		alert('<ui:i18n key="不能对跑路粉丝进行操作"/>.');
		return;
	}
	
	var subcheck = '';  
	$('input[name=subcheck]:checked').each(function(){  
		subcheck = subcheck + ',' + $(this).val();//向数组中添加元素  
	});
	if(subcheck == ''){
		alert('<ui:i18n key="请选择用户"/>！ ');
		return;
	}
	showBpopup({
		id : 'setGrades',
		width : 510 
	});
}
//给一个用户设等级
function gradeSave(){
	var shopId = $('#shopId').val();
	var custSysId = $('#custSysId').val();
	var wxId = $('#wxId').val();
	var gradeName = $('#selectGrade').find('option:selected').text();
	var purTimes = $('#purTimes').val();
	var priceSum = $('#priceSum').val();
	var gradeId = $('#selectGrade').val();
	var statusId = $('input[name=tongzhi-grade]:checked').val();
	if(gradeId == ''){
		alert('<ui:i18n key="等级不能为空"/>！');
		return;
	}
	if(isNaN(gradeId)){
		alert('<ui:i18n key="输入的等级值必须是数字"/>！');
		return;
	}
	var params = {
			cust_sys_id : custSysId,
			shopId : shopId,
			gradeId : gradeId,
			statusId : statusId,
			wxId : wxId,
			gradeName : gradeName,
			purTimes : purTimes,
			priceSum : priceSum
		};
	$.ajax({
		data : params,
		url : '/admin/cust/gradeSave.htm',
		success : function(res){
			if (res.success){
				alert('<ui:i18n key="保存成功"/>');
				$('#setGrade').bPopup().close(); 
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
				//window.location.reload();	
			} else {
				alert(res.err_msg);
			}
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
}
//给一组用户设等级
function gradesSave(){
	//用户id
	var subcheck = '';  
	$('input[name=subcheck]:checked').each(function(){  
		subcheck = subcheck + ',' + $(this).val();//向数组中添加元素  
	});
	//给等级值
	var gradeId = $('#selectGrades').val();
	if(gradeId == ''){
		alert('<ui:i18n key="等级不能为空"/>！');
		return;
	}
	if(isNaN(gradeId)){
		alert('<ui:i18n key="输入的等级值必须是数字"/>！');
		return;
	}
	//微信Id
	var wxId = '';
	$('input[name=subcheck]:checked').each(function(){  
		wxId = wxId + ',' + $(this).parents('.chk').find('#WX_IF_OPENID_P').val();//向数组中添加元素  
	});
	//等级名称
	var gradeName = $('#selectGrades').find('option:selected').text();
	//购买次数
	var purTimes = '';
	$('input[name=subcheck]:checked').each(function(){  
		purTimes = purTimes + ',' + $(this).parents('.chk').find('#PUR_TIMES').val();//向数组中添加元素  
	});
	//购买总金额
	var priceSum = '';
	$('input[name=subcheck]:checked').each(function(){  
		priceSum = priceSum + ',' + $(this).parents('.chk').find('#PRICE_SUM').val();//向数组中添加元素  
	});
	var statusId = $('input[name=tongzhi-grades]:checked').val();

	var params = {
			cust_sys_id : subcheck,
			gradeId : gradeId,
			wxId : wxId,
			statusId : statusId,
			gradeName : gradeName,
			purTimes : purTimes,
			priceSum : priceSum
			};
	$.ajax({
 		data : params,
 		url : '/admin/cust/gradesSave.htm',
 		success : function(res){
 			if (res.success){
 				alert('<ui:i18n key="保存成功"/>');
 				$('#setGrades').bPopup().close(); 
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
 				//window.location.reload();
 			} else {
 				alert(res.err_msg);
 			}
 		},
 		error : function(a, msg, c){
 			alert('error: ' + msg);
 		}
 	});
}
//弹出给积分框
function ShowDivSelPoint(custSysId,shopId,point,wxId){
	$('#custSysId').val(custSysId);
	$('#shopId').val(shopId);
	$('#pointValue').val(point);
	$('#newpointValue').val(point);
	$('#wxId').val(wxId);
	
	showBpopup({
		id : 'setPoint',
		width : 510 
	});
};
//给一个用户设积分
function pointSave(){
	var shopId = $('#shopId').val();
	var custSysId = $('#custSysId').val();
	var wxId = $('#wxId').val();
	var givecustPoint = $('#pointValue').val();
	var newcustPoint = $('#newpointValue').val();
	var sumcustPoint = parseInt(givecustPoint) + parseInt(newcustPoint);
	var statusId = $('input[name=tongzhi-point]:checked').val();
	if(givecustPoint == ''){
		alert('<ui:i18n key="积分不能为空"/>！');
		return;
	}
	if(isNaN(givecustPoint)){
		alert('<ui:i18n key="输入的积分值必须是数字"/>！');
		return;
	}
	var params = {
		cust_sys_id : custSysId,
		shopId : shopId,
		custPoint : sumcustPoint,
		givecustPoint : givecustPoint,
		wxId : wxId,
		statusId : statusId
	};
	$.ajax({
 		data : params,
 		url : '/admin/cust/pointSave.htm',
 		success : function(res){
 			if (res.success){
 				alert('<ui:i18n key="保存成功"/>');
 				$('#setPoint').bPopup().close(); 
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
 				//window.location.reload();	
 			} else {
 				alert(res.err_msg);
 			}
 		},
 		error : function(a, msg, c){
 			alert('error: ' + msg);
 		}
 	});
}
//打开群设积分框
function ShowDivSelPoints(){
	var subscribe = '';
	var flag = true;
	$('input[name=subcheck]:checked').each(function(){  
		if($(this).parents('.chk').find('#SUBSCRIBE').val() == 0){
			flag = false;
		}
	});
	if(!flag){
		alert('<ui:i18n key="不能对跑路粉丝进行操作"/>.');
		return;
	}
	var subcheck = '';  
	$('input[name=subcheck]:checked').each(function(){  
		subcheck = subcheck + ',' + $(this).val();//向数组中添加元素  
	});
	if(subcheck == ''){
		alert('<ui:i18n key="请选择用户"/>！ ');
		return;
	}
	showBpopup({
		id : 'setPoints',
		width : 510 
	}); 
}
//给一组用户给积分
function pointsSave(){
	var subcheck = '';  
	$('input[name=subcheck]:checked').each(function(){  
		subcheck = subcheck + ',' + $(this).val();//向数组中添加元素  
	});
	var givecustPoint = $('#pointsValue').val();
	if(givecustPoint == ''){
		alert('<ui:i18n key="积分不能为空"/>！');
		return;
	}
	if(isNaN(givecustPoint)){
		alert('<ui:i18n key="输入的积分值必须是数字"/>！');
		return;
	}
	var custPoint = '';  
	$('input[name=subcheck]:checked').each(function(){  
		var oldPoint = $(this).parents('.chk').find('#custPoint').val();//向数组中添加元素  
		var newPoint = parseInt(oldPoint)+parseInt(givecustPoint);
		custPoint = custPoint + ',' + newPoint;
	});
	var wxId = '';
	$('input[name=subcheck]:checked').each(function(){  
		wxId = wxId + ',' + $(this).parents('.chk').find('#WX_IF_OPENID_P').val();//向数组中添加元素  
	});
	var statusId = $('input[name=tongzhi-points]:checked').val();

	var params = {
			cust_sys_id : subcheck,
			custPoint : custPoint,
			wxId : wxId,
			givecustPoint : givecustPoint,
			statusId : statusId
			};
	$.ajax({
 		data : params,
 		url : '/admin/cust/pointsSave.htm',
 		success : function(res){
 			if (res.success){
 				alert('<ui:i18n key="保存成功"/>');
 				$('#setPoints').bPopup().close(); 
				var pageCurr = Number($('#currentPage').find('option:selected').val());
				var pageUnit = Number($('#pageUnit').find('option:selected').val());
				showPage(pageCurr,pageUnit);
 				//window.location.reload();	
 			} else {
 				alert(res.err_msg);
 			}
 		},
 		error : function(a, msg, c){
 			alert('error: ' + msg);
 		}
 	});
}

function openChatWindow(custSysId){
	
	$('#ifrPage').attr('src','/admin/cust/chatWindow.htm?cust_sys_id=' + custSysId);
	showBpopup({
		id : 'chatPopup',
		width : 700 
	});
}
function closeChatWindow(){
	$('#ifrPage').attr('src','');
	$('#chatPopup').bPopup().close(); 
}
function toggle(){
	if($('.form-table.two').is(':hidden') == false){
		$('.form-table.two').hide();
		$('.conditions').css('top','90%');
		$('.conditions span').text('<ui:i18n key="更多筛选条件"/>');
		$('.showImg').attr('src','/admin/images/cust/btn_detail.png');
	}else{
		$('.form-table.two').show();
		$('.conditions').css('top','97%');
		$('.conditions span').text('<ui:i18n key="基本筛选条件"/>');
		$('.showImg').attr('src','/admin/images/cust/up.png');
	}
}

function qunfa(){ 
	
	var subscribe = '';
	var flag = true;
	$('input[name=subcheck]:checked').each(function(){  
		if($(this).parents('.chk').find('#SUBSCRIBE').val() == 0){
			flag = false;
		}
	});
	if(!flag){
		alert('<ui:i18n key="不能对跑路粉丝进行操作"/>.');
		return;
	}
	
	var count = $('input[name=subcheck]:checked').length;
	if(count == 0){
		parent.ggShowTab({
			'url' : '/admin/weixin/mass/massMain.htm',
			'name' : '<ui:i18n key="群发功能"/>',
			'icon' : 'mass' 
		});  
	}else{
		var subscribe = '';
		var flag = true;
		$('input[name=subcheck]:checked').each(function(){  
			if($(this).parents('.chk').find('#SUBSCRIBE').val() == 0){
				flag = false;
			}
		});
		if(!flag){
			alert('<ui:i18n key="不能对跑路粉丝进行操作"/>.');
			return;
		}
		
		var custNickNameArray = []
		,custSysIdArray = []
		,custNickNames = ''
		,custSysIds = '';
		
		$('input[name=subcheck]:checked').each(function(){  
			custSysIdArray.push($(this).val());
			custNickNameArray.push($(this).parents('.chk').nextAll().find('#CUST_NICK_NM').text());
		});
		
		custSysIds = custSysIdArray.join(',');
		custNickNames = custNickNameArray.join(',');
		
		 console.log('custSysIds==' + custSysIds);
		 console.log('custNickNames==' + custNickNames);
		
		 parent.ggShowTab({
				'url' : '/admin/weixin/mass/massMain.htm?custNickNames='+custNickNames+'&custSysIds='+custSysIds,
				'name' : '<ui:i18n key="群发功能"/>',
				'icon' : 'mass' 
			}); 
	}
}
//分页
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}
//查询
function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	//筛选基准
	var subscribe = $('#subscribe').val();
	//昵称
	var nickName = $('#nickName').val();
	
	//区域
	var areaSel = $('#areaSel option:selected').text();
	var area1 = $('input[name=area1]:checked').val();
	if(area1 == 1){
		if(areaSel == ""){
			alert('<ui:i18n key="请选择筛选区域"/>');
			return;
		}
	}
	
	//性别
	var sex = $('input[name=sex]:checked').val();
	
	//客户等级
	var gradeSel = $('#gradeSel').val();
	var gradeValue = $('input[name=gradeValue]:checked').val();
	if(gradeValue == 1){
		if(gradeSel == ""){
			alert('<ui:i18n key="请选择等级"/>');
			return;
		}
	}
	
	//客户积分起始
	var pointStart = $('#pointStart').val();
	//客户积分结束
	var pointEnd = $('#pointEnd').val();
	
	var point = $('input[name=point]:checked').val();
	if(point == 1){
		if(pointStart == "" || pointEnd==""){
			alert('<ui:i18n key="客户积分不能为空"/>');
			return;
		}else{
			if(parseInt(pointStart) > parseInt(pointEnd)){
				alert('<ui:i18n key="客户积分查询错误"/>');
				return;
			}
		}
	}
	
	
	//购买次数起始
	var startNum = $('#startNum').val();
	//购买次数结束
	var endNum = $('#endNum').val();
	
	var buyNum = $('input[name=buyNum]:checked').val();
	if(buyNum == 1){
		if(startNum == "" || endNum==""){
			alert('<ui:i18n key="购买次数不能为空"/>');
			return;
		}else{
			if(parseInt(startNum) > parseInt(endNum)){
				alert('<ui:i18n key="购买次数查询错误"/>');
				return;
			}
		}
	}

	
	//关注时间起始
	var dateStart = $('#dateStart').val();
	//关注时间结束
	var dateEnd = $('#dateEnd').val();
	
	var date = $('input[name=date]:checked').val();
	if(date == 1){
		if(dateStart == "" || dateEnd == ""){
			alert('<ui:i18n key="关注时间不能为空"/>');
			return;
		}else{
			var date1 = new Date(dateStart);
			var date2 = new Date(dateEnd);
			if(date1 > date2){
				alert('<ui:i18n key="关注时间查询错误"/>！');
				return;
			}
		}
	}
	
	
	//商品均价起始
	var startGoodsAvg = $('#startGoodsAvg').val();
	//商品均价结束
	var endGoodsAvg = $('#endGoodsAvg').val();

	var goodsPriceAvg = $('input[name=goodsPriceAvg]:checked').val();
	if(goodsPriceAvg == 1){
		if(startGoodsAvg == "" || endGoodsAvg == ""){
			alert('<ui:i18n key="商品均价不能为空"/>');
			return;
		}else{
			if(parseInt(startGoodsAvg) > parseInt(endGoodsAvg)){
				alert('<ui:i18n key="商品均价查询错误"/>');
				return;
			}
		}
	}
	
	
	//最近消费起始时间
	var startConsumeDate = $('#startConsumeDate').val();
	//最近消费结束时间
	var endConsumeDate = $('#endConsumeDate').val();
	
	var recentlyConsume = $('input[name=recentlyConsume]:checked').val();
	if(recentlyConsume == 1){
		if(startConsumeDate == "" || endConsumeDate == ""){
			alert('<ui:i18n key="最近消费时间不能为空"/>');
			return;
		}else{
			var date1 = new Date(startConsumeDate);
			var date2 = new Date(endConsumeDate);
			if(date1 > date2){
				alert('<ui:i18n key="最近消费时间查询错误"/>！');
				return;
			}
		}
	}
	

	var params = {
			subscribe : subscribe
			,nickName : nickName
			,areaSel : areaSel
			,sex : sex
			,gradeSel : gradeSel
			,pointStart : pointStart
			,pointEnd : pointEnd
			,startNum : startNum
			,endNum : endNum
			,dateStart : dateStart
			,dateEnd : dateEnd
			,startGoodsAvg : startGoodsAvg
			,endGoodsAvg : endGoodsAvg
			,startConsumeDate : startConsumeDate
			,endConsumeDate : endConsumeDate
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/cust/custFragment.htm';
	 
	 var $this = $('.result-grid.pic');	
	 $this.showLoading();
	 $this.load(url , params , function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		//全选
		$('#checkall').on('ifChecked', function(event){
			$('input[type=checkbox]').iCheck('check');
			$('input[type=checkbox][nam=subcheck]').attr('checked','checked');
		});
		//反选
		$('#checkall').on('ifUnchecked', function(event){
			$('input[type=checkbox]').iCheck('uncheck');
			$('input[type=checkbox][name=subcheck]').removeAttr('checked');
		});
		$('.icradio,.iccheckbox').iCheck({
	 	    checkboxClass : 'icheckbox_square-firebrick',
	 	    radioClass : 'iradio_square-firebrick',
	 	    increaseArea : '0%' // optional
	 	  });
		$('.iCheck-helper').each(function(){
			$(this).click(function(){
				if($(this).prev().val() == 0){
					$(this).parents('.fcomp.last').find('.select2').select2('val','');
					$(this).parents('.fcomp.last').find('.select2').attr('disabled','disabled');
					$(this).parents('.fcomp.last').find('input[type=text]').val('');
					$(this).parents('.fcomp.last').find('input[type=text]').attr('disabled','disabled');
				}else{
					$(this).parents('.fcomp.last').find('.select2').removeAttr('disabled');
					$(this).parents('.fcomp.last').find('input[type=text]').removeAttr('disabled');
				} 
			}); 
		});
		$('.pic-small').hover(function(){
	     	var $this = $(this);
	     	var offset = $this.offset();
	     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 74,  'top':offset.top  });
	      	$div.append($('<img class="pic-big" />').attr('src',$this.attr('src')));
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
 
	<!-- ▼ Main container --> 
    <div class="container">			
			<!-- ▼ 查询表单区域  --> 
	       <div class="query-from" style="position: relative;"> 
	       		<div class="form-table">
	       		 	<table class="ftable">
	       		 		<colgroup>
	       		 			<col width="13.5%" />
	       		 			<col width="41%" />
	       		 			<col width="12.2%" />
	       		 			<col width="33.3%" />
	       		 		</colgroup>
	       		 		
	       		 		<tr>
	       		 			<td class="flabel last" ><ui:i18n key="筛选基准"/>：</td>
	       		 			<td class="fcomp last">
			  			 	 	<select class="select2" id="subscribe" name="subscribe" style="width: 220px">
									<option value=""><ui:i18n key="新增粉丝"/></option>
									<option value="0"><ui:i18n key="跑路粉丝"/></option>
									<option value="1"><ui:i18n key="现有粉丝"/></option>
								</select>
	       		 			</td>
	       		 			<td class="flabel last"><ui:i18n key="昵称"/>：</td>
	       		 			<td class="fcomp last" style="padding-left:10px ">
	       		 				<input type="text" id="nickName" name="nickName"  placeholder="<ui:i18n key="微信昵称不使用可不输入"/>" autocomplete="off" style="width: 210px;font-size: 12px"/>
	       		 			</td>
	       		 		</tr>
	       		 	</table>
	       		</div>
	       		<div class="form-table two" style="width: 100%;display: none">
	       		 	<table class="ftable" style="width: 100%">
	       		 		<colgroup>
	       		 			<col width="11%" />
	       		 			<col width="32.3%" />
	       		 			<col width="11%" />
	       		 			<col width="43.7%" />
	       		 		</colgroup>
	       		 		
	       		 		<tr>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="区域"/>：</div></td>
	       		 			<td class="fcomp last">
	       		 				<input type="radio" value="0" name="area1" class="icradio" checked="checked"/>
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" name="area1" class="icradio" style="margin-left: 20px;"/>
	       		 				&nbsp;&nbsp;
	       		 				
								<select style="width:160px;"  class="select2" id="areaSel" name="areaSel" disabled="disabled" data-placeholder="<ui:i18n key="请选择筛选区域"/>" >
									<option value=""></option>
									<c:forEach items="${adminMap}" var="map">
										<option value="${map.areaId}">${map.areaName}</option>
									</c:forEach>
								</select>
	       		 			</td>
	       		 			<td class="flabel last"><ui:i18n key="性别"/>：</td>
	       		 			<td class="fcomp last"> 
	       		 				<input type="radio" value=""  name="sex" class="icradio" checked="checked"/>
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" name="sex" class="icradio" />
	       		 		 		&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="男"/></span>
	       		 				
								<input type="radio" value="2" name="sex" class="icradio" />
								&nbsp;&nbsp;<sapn><ui:i18n key="女"/></sapn>
	       		 			</td>
	       		 		</tr>
	       		 		
	       		 		<tr>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="客户等级"/>：</div></td>
	       		 			<td class="fcomp last">
	       		 				<input type="radio" value="0" id="gradeValue" name="gradeValue" class="icradio" checked="checked"/>
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" id="gradeValue" name="gradeValue" class="icradio" />
	       		 				&nbsp;&nbsp;
	       		 				
								<select style="width:160px;" class="select2" id="gradeSel" name="gradeSel" disabled="disabled" data-placeholder="<ui:i18n key="请选择等级"/>" >
									<option value=""></option>
									<c:forEach items="${grade}" var="grade">
	       								<option value="${grade.gradeId }">${grade.gradeName }</option>
	       							</c:forEach>
								</select>
	       		 			</td>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="客户积分"/>：</div></td>
	       		 			<td class="fcomp last"> 
	       		 				<input type="radio" value="0" name="point" class="icradio" checked="checked"/>
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" name="point" class="icradio" />
								&nbsp;&nbsp;
								
								<input type="text" id="pointStart" name="pointStart" disabled="disabled" autocomplete="off" style="width:55px;font-size: 12px;" />
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input type="text" id="pointEnd" name="pointEnd" disabled="disabled" autocomplete="off" style="width:55px;font-size: 12px;"/>
	       		 			</td>
	       		 		</tr>
	       		 		
	       		 		<tr>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="购买次数"/>：</div></td>
	       		 			<td class="fcomp last">
	       		 				<input type="radio" value="0" name="buyNum" class="icradio" checked="checked"/>
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" name="buyNum" class="icradio"/>
								&nbsp;&nbsp;
								
								<input type="text" id="startNum" name="startNum" disabled="disabled" autocomplete="off" style="width:49px;font-size: 12px;"/>
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input type="text" id="endNum" name="endNum" disabled="disabled" autocomplete="off" style="width:49px;font-size: 12px;"/>
	       		 			</td>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="关注时间"/>：</div></td>
	       		 			<td class="fcomp last"> 
	       		 				<c:if test="${empty(requestScope.dateStart)  and empty(requestScope.dateEnd) }">
	       		 					<input type="radio" value="0" name="date" class="icradio" checked="checked"/>			
		       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
		       		 				
		       		 				<input type="radio" value="1" name="date" class="icradio" />
									&nbsp;&nbsp;
	       		 				</c:if>
	       		 				<c:if test="${!empty(requestScope.dateStart)  or !empty(requestScope.dateEnd) }">
	       		 					<input type="radio" value="0" name="date" class="icradio" />			
		       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
		       		 				
		       		 				<input type="radio" value="1" name="date" class="icradio" checked="checked" />
									&nbsp;&nbsp;
	       		 				</c:if>
								
								<input type="text" id="dateStart" value="${requestScope.dateStart }" name="dateStart" <c:if test="${requestScope.dateStart == '' }">disabled="disabled"</c:if>  autocomplete="off" class="w9 datepicker"/>
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
			  			 	 	<input type="text" id="dateEnd" value="${requestScope.dateEnd }" name="dateEnd" <c:if test="${requestScope.dateStart == '' }">disabled="disabled"</c:if> autocomplete="off" class="w9 datepicker"/> 			  			 	 
	       		 			</td>
	       		 		</tr>
	       		 		
	       		 		<tr>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="商品均价"/>：</div></td>
	       		 			<td class="fcomp last">
	       		 				<input type="radio" value="0" name="goodsPriceAvg" class="icradio" checked="checked"/>
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" name="goodsPriceAvg" class="icradio"/>
								&nbsp;&nbsp;
								
								<input type="text" disabled="disabled" id="startGoodsAvg" name="startGoodsAvg" autocomplete="off" style="width:49px;font-size: 12px;"/>
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
								<input type="text" disabled="disabled" id="endGoodsAvg" name="endGoodsAvg" autocomplete="off" style="width:49px;font-size: 12px;"/>
	       		 			</td>
	       		 			<td class="flabel last"><div style="margin-top: -4px"><ui:i18n key="最近消费"/>：</div></td>
	       		 			<td class="fcomp last"> 
	       		 				<input type="radio" value="0" name="recentlyConsume" class="icradio" checked="checked"/>			
	       		 				&nbsp;&nbsp;<span style="margin-right: 20px;display: inline-block;"><ui:i18n key="不限"/></span>
	       		 				
	       		 				<input type="radio" value="1" name="recentlyConsume" class="icradio" />
								&nbsp;&nbsp;
								
								<input type="text" id="startConsumeDate" name="startConsumeDate" disabled="disabled" autocomplete="off" class="w9 datepicker"/>
								<span class="line"><img src="/admin/images/orders/wave line.png"></span>
			  			 	 	<input type="text" id="endConsumeDate" name="endConsumeDate" disabled="disabled" autocomplete="off" class="w9 datepicker"/>
	       		 			</td>
	       		 		</tr>
	       		 		
	       		 	</table>
	       		</div>
	       		<!-- -->
	       		<div class="butttn-area m1" style="position: absolute;top: 10px;right: -10px;padding-right: 40px">
	       		   <span class="button" onclick="search();">
	       		   	  <span class="button-icon search"></span>
	       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
	       		   </span>
	       		</div>
	       		<div class="conditions" onclick="toggle();">
					<img alt="" src="/admin/images/cust/btn_detail.png" style="margin:-3px 20px 0px 10px;" class="showImg"><span style="margin-right:20px"><ui:i18n key="更多筛选条件"/></span>
				</div>
	      	</div>
	  		<!-- ▲ 查询表单区域  -->
			
           	
			<div class="result-grid pic" style="margin-top: 50px;position: relative;">
			<div class="qunfa">
				<span onclick="qunfa();"><img alt="" src="/admin/images/cust/icon_message.png" style="margin:-3px 10px 0px 0px;"><span style="margin-right:20px;"><ui:i18n key="群发信息"/></span></span>
				<span onclick="ShowDivSelGrades();"><img alt="" src="/admin/images/cust/grade_01.png" style="margin:-3px 10px 0px 0px;"><span style="margin-right:20px;"><ui:i18n key="设等级"/></span></span>
				<span onclick="ShowDivSelPoints();"><img alt="" src="/admin/images/cust/integral_01.png" style="margin:-3px 10px 0px 0px;"><span style="margin-right:20px;"><ui:i18n key="给积分"/></span></span>
			</div>
	      	<table class="result-grid-table">
	      		<colgroup>
		      		<col width="60px" />
		      		<col width="70px" />
		      		<col width="80px" />
    		 		<col width="70px" />
    		 		<col width="50px" />
    		 		<col width="80px" />
    		 		<col width="80px" />
    		 		<col width="80px" />
    		 		<col width="70px" />
    		 		<col width="80px" />
    		 		<col width="160px" />
	      		</colgroup>
	      		 <thead class="result-grid-thead">
	      		 	<tr>
	      		 		<th class="chk"><input class="iccheckbox" type="checkbox" name="checkall" id="checkall">&nbsp;&nbsp;<ui:i18n key="全部选择"/></th>
	      		 		<th><ui:i18n key="粉丝"/></th>
	      		 		<th></th>
	      		 		<th><ui:i18n key="等级"/></th>
	      		 		<th><ui:i18n key="积分"/></th>
	      		 		<th><ui:i18n key="关注时间"/></th>
	      		 		<th><ui:i18n key="最后对话时间"/></th>
	      		 		<th><ui:i18n key="最后购买时间"/></th>
	      		 		<th><ui:i18n key="购买次数"/></th>
	      		 		<th><ui:i18n key="购买均价"/></th>
	      		 		<th><ui:i18n key="操作"/></th>
	      		 	</tr>
	      		 </thead>
	      		 <tbody  class="result-grid-tbody">
	      		 <c:forEach items="${custSel}" var="cust">
	      		 	<tr>
	      		 		<td class="chk">
	      		 			<input type="checkbox" id="subcheck" class="iccheckbox" name="subcheck" value="${cust.CUST_SYS_ID }"/>
	      		 			<input type="hidden" value="${cust.CUST_SYS_ID }"/>
           					<input type="hidden" value="${cust.SHOP_ID}"/>
           					<input type="hidden" value="${cust.GRADE_ID}"/>
           					<input type="hidden" value="${cust.CUST_POINT}" id="custPoint"/>
           					<input type="hidden" value="${cust.WX_IF_OPENID_P}" id="WX_IF_OPENID_P"/>	
           					<input type="hidden" value="${cust.GRADE_NM}" id="GRADE_NM"/>    
           					<input type="hidden" value="${cust.PUR_TIMES}" id="PUR_TIMES"/>
           					<input type="hidden" value="${cust.PRICE_SUM}" id="PRICE_SUM"/> 
           					<input type="hidden" value="${cust.SUBSCRIBE}" id="SUBSCRIBE"/>
	      		 		</td>
	      		 		<td class="pic" style="padding-left: 0;padding-right: 0;text-align: left">
	      		 			<c:choose>
								<c:when test="${cust.SUBSCRIBE eq 0 }">
									<img alt="" src="${cust.WX_IF_HEADIMGURL }" class="pic-small" style="width: 66px;height: 66px">
		      		 			</c:when>
		      		 			<c:otherwise>
		      		 				<img alt="" src="${cust.WX_IF_HEADIMGURL }" class="pic-small" onclick="openChatWindow('${cust.CUST_SYS_ID}');" style="width: 66px;height: 66px">
								</c:otherwise>
							</c:choose>
	      		 		</td>
	      		 		<td style="text-align: left;">
	      		 			<span class="custNickNm" id="CUST_NICK_NM" title="${cust.CUST_NICK_NM }" onclick="openChatWindow('${cust.CUST_SYS_ID}');">${cust.CUST_NICK_NM }</span>
	      		 		</td>
	      		 		<td>${cust.GRADE_NM }</td>
	      		 		<td>${cust.CUST_POINT }</td>
	      		 		<td>
	      		 			<c:choose>
           						<c:when test="${cust.SUBSCRIBE_TIME == null}">
           							无
           						</c:when>
           						<c:otherwise>
           							${cust.SUBSCRIBE_TIME}
           						</c:otherwise>
	           				</c:choose>
	      		 		</td>
	      		 		<td>
	      		 			<c:choose>
           						<c:when test="${cust.RECEIVE_DT == null}">
           							无
           						</c:when>
           						<c:otherwise>
           							${cust.RECEIVE_DT }
           						</c:otherwise>
           					</c:choose>
	      		 		</td>
	      		 		<td>
	      		 			<c:choose>
           						<c:when test="${cust.LAST_PUR_DT == null}">
           							无
           						</c:when>
           						<c:otherwise>
           							${cust.LAST_PUR_DT }
           						</c:otherwise>
           					</c:choose>
	      		 		</td>
	      		 		<td>${cust.PUR_TIMES }</td>
	      		 		<td>${cust.GOODS_PRICE_AVG }</td>
	      		 		<c:choose>
							<c:when test="${cust.SUBSCRIBE eq 0 }">
	      		 				<td style="pointer-events:none;opacity:0.2;">
	      		 					<span class="gridbutton red" onclick="ShowDivSelGrade('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.GRADE_ID}','${cust.WX_IF_OPENID_P }','${cust.PUR_TIMES }','${cust.PRICE_SUM }');"><ui:i18n key="设等级"/></span>								
									<span class="gridbutton red" onclick="ShowDivSelPoint('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.CUST_POINT }','${cust.WX_IF_OPENID_P }');""><ui:i18n key="给积分"/></span>
									<span class="gridbutton red" onclick="openChatWindow('${cust.CUST_SYS_ID}')"><ui:i18n key="聊天记录"/></span>
	      		 				</td>
	      		 			</c:when>
	      		 			<c:otherwise>
								<td>
	      		 					<span class="gridbutton red" onclick="ShowDivSelGrade('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.GRADE_ID}','${cust.WX_IF_OPENID_P }','${cust.PUR_TIMES }','${cust.PRICE_SUM }');"><ui:i18n key="设等级"/></span>								
									<span class="gridbutton red" onclick="ShowDivSelPoint('${cust.CUST_SYS_ID}','${cust.SHOP_ID}','${cust.CUST_POINT }','${cust.WX_IF_OPENID_P }');""><ui:i18n key="给积分"/></span>
									<span class="gridbutton red" onclick="openChatWindow('${cust.CUST_SYS_ID}')"><ui:i18n key="聊天记录"/></span>
	      		 				</td>		
							</c:otherwise>
						</c:choose>		
	      		 	</tr>
	      		 </c:forEach>
	      		 </tbody>
	      	</table>
	      	
	      	<ui:paging page="${page }" />
	      	
	      </div>
  
       		
<!-- ▼ 设等级 -->
<div class="bpopup2" id="setGrade">
 	<div class="bpopupWarp">
 		 <div class="bpopupHeaderWarp">
			<h3 class="bpopupTitle js-title"><ui:i18n key="设等级"/></h3>
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
				  			 	 <div class="form-label" style="text-align: center;width: 50px">
				  			 		<ui:i18n key="等级"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="selectGrade" class="select2" data-placeholder="<ui:i18n key="请选择等级"/>" style="width:180px">
		       							<option value=""></option>
		       							<c:forEach items="${grade}" var="grade">
		       								<option value="${grade.gradeId}">${grade.gradeName }</option>
		       							</c:forEach>
	       							</select>
	       							<input type="hidden" value="" id="custSysId"/>
		       						<input type="hidden" value="" id="shopId"/>
		       						<input type="hidden" value="" id="wxId"/>
		       						<input type="hidden" value="" id="purTimes"/>
		       						<input type="hidden" value="" id="priceSum"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 50px">
				  			 		<ui:i18n key="通知"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="0" name="tongzhi-grade" class="icradio" checked="checked" />
				  			 	 	&nbsp;&nbsp;<ui:i18n key="给粉丝发送获得了等级的通知"/>
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="1" name="tongzhi-grade" class="icradio"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="不发送"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 50px">
				  			 		
				  			 	 </div>
				  			 	 <div class="form-control" style="color: #a2a2a2">
				  			 	 	(<ui:i18n key="通知发送时段"/>8:00~22:00)
				  			 	 </div>				  			 	 
				  			 </div>	
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="gradeSave();">
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
<!-- ▲ 设等级 -->


<!-- ▼ 群设等级 -->
<div class="bpopup2" id="setGrades">
 	<div class="bpopupWarp">
 		 <div class="bpopupHeaderWarp">
			<h3 class="bpopupTitle js-title"><ui:i18n key="设等级"/></h3>
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
				  			 	 <div class="form-label" style="text-align: center;width: 50px">
				  			 		<ui:i18n key="等级"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<select id="selectGrades" class="select2" data-placeholder="<ui:i18n key="请选择等级"/>" style="width:180px">
		       							<option value=""></option>
		       							<c:forEach items="${grade}" var="grade">
		       								<option value="${grade.gradeId }">${grade.gradeName }</option>
		       							</c:forEach>
	       							</select>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 50px">
				  			 		<ui:i18n key="通知"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="0" name="tongzhi-grades" class="icradio" checked="checked"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="给粉丝发送获得了等级的通知"/>
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="1" name="tongzhi-grades" class="icradio"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="不发送"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 50px">
				  			 		
				  			 	 </div>
				  			 	 <div class="form-control" style="color: #a2a2a2">
				  			 	 	(<ui:i18n key="通知发送时段"/>8:00~22:00)
				  			 	 </div>				  			 	 
				  			 </div>	
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="gradesSave();">
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
<!-- ▲ 群设等级 -->
       
<!-- ▼ 给积分 -->
<div class="bpopup2" id="setPoint">
 	<div class="bpopupWarp">
 		 <div class="bpopupHeaderWarp">
			<h3 class="bpopupTitle js-title"><ui:i18n key="给积分"/></h3>
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
				  			 	 <div class="form-label" style="text-align: center;width: 60px">
				  			 		<ui:i18n key="积分"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" name="pointInput" id="pointValue" value="" placeholder="<ui:i18n key="请输入要给的积分量"/>"/>
			       					<input type="hidden" value="" id="newpointValue"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 60px">
				  			 		<ui:i18n key="通知"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="0" name="tongzhi-point" class="icradio" checked="checked"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="给粉丝发送获得了等级的通知"/>
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="1" name="tongzhi-point" class="icradio"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="不发送"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 60px">
				  			 		
				  			 	 </div>
				  			 	 <div class="form-control" style="color: #a2a2a2">
				  			 	 	(<ui:i18n key="通知发送时段"/>8:00~22:00)
				  			 	 </div>				  			 	 
				  			 </div>	
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="pointSave();">
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
<!-- ▲ 给积分 -->
        
<!-- ▼ 群设积分 -->
<div class="bpopup2" id="setPoints">
 	<div class="bpopupWarp">
 		 <div class="bpopupHeaderWarp">
			<h3 class="bpopupTitle js-title"><ui:i18n key="给积分"/></h3>
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
				  			 	 <div class="form-label" style="text-align: center;width: 60px">
				  			 		<ui:i18n key="积分"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="text" name="pointInput" id="pointsValue" value="" placeholder="<ui:i18n key="请输入要给的积分量"/>"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 60px">
				  			 		<ui:i18n key="通知"/>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="0" name="tongzhi-points" class="icradio" checked="checked"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="给粉丝发送获得了等级的通知"/>
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="radio" value="1" name="tongzhi-points" class="icradio"/>
				  			 	 	&nbsp;&nbsp;<ui:i18n key="不发送"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: center;width: 60px">
				  			 		
				  			 	 </div>
				  			 	 <div class="form-control" style="color: #a2a2a2">
				  			 	 	(<ui:i18n key="通知发送时段"/>8:00~22:00)
				  			 	 </div>				  			 	 
				  			 </div>	
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="pointsSave();">
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
<!-- end群设积分 -->


	    <style scoped="scoped">
			.divPopup {width: 700px; height: 490px; margin: 0 auto 0; overflow: hidden; display: none;border-radius: 10px 10px 0px 0px;}
			.divPopup .divPopup-header {width: 100%; height: 40px; background-color: #636363; border-radius: 10px 10px 0px 0px;}
			.divPopup .divPopup-header .divPopup-header-text {width: 80%; height: 40px; line-height: 40px; float: left; font-size: 16px;}
			.divPopup .divPopup-header .divPopup-header-text span {margin-left: 30px; color: #ffffff; font-size: 14px;}
			.divPopup .divPopup-header .divPopup-header-close {width: 20%; height: 40px; line-height: 40px; text-align: right; float: left;}
			.divPopup .divPopup-header .divPopup-header-close img {width: 14px; height: 14px; margin-right: 20px; cursor: pointer;}
			
			.divPopup .divPopup-container {width: 460px; height: 255px; position: relative;}
			.divPopup .divPopup-container .ifrPopup {width:100%; height: 100%; left: 0; top: 0; border-radius: 0px 0px 10px 10px;}
		</style>
       
       <!-- ▼ Popup -->
			<div class="chatPopup divPopup" id="chatPopup">
				<iframe id="ifrPage" class="ifrPopup" style="width: 700px; height: 490px; " frameborder="0" allowTransparency="true" scrolling="no" vspace="0" hspace="0"></iframe>
			</div>
			<!-- ▲ Popup -->

	<!-- ▲ Main container -->
	
	</div>
	<!-- ▼ Main footer -->
	 
	<!-- ▲  Main footer -->
</body>
</html>