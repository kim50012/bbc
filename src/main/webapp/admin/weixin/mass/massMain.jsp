<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/popup/newsfeed.css" />  
<link />
<title><ui:i18n key="群发功能"/></title>
  <style type="text/css">
.cust-name{position:relative;float:left;margin-bottom:10px;margin-left:10px;padding:5px 10px;border:1px solid #e5e5e5;}
.cust-name .cust-name-del{position:absolute;top:-7px;right:-7px;display:inline-block;display:none;width:14px;height:14px;border-radius:14px;background-color:#e3e3e3;color:#000;text-align:center;line-height:14px;cursor:pointer;}
.cust-name:hover .cust-name-del{display:inline-block;}
</style>
<script type="text/javascript">
//保存要发送的信息
function send(){  
	
	var msgId = $('#msgId').val() || ''
	,sendType = $('#sendType').val()
	,gradeId = '' //客户等级
	,custSysIds = [];
	
	if(msgId == ''){
		alert('<ui:i18n key="请选择素材"/>');
		return false;
	}
	
	
	if(sendType == 2){
		gradeId = $('#custGrade').select2('val');
		if(gradeId == ''){
			alert('<ui:i18n key="请选择客户等级"/>');
			return false;
		}
	}else if(sendType == 3){
		$('.js-cust-name').each(function(){
			custSysIds.push($(this).data('custSysId'));
		});
		if(custSysIds.length == 0){
			alert('<ui:i18n key="请选择要发送的顾客"/>');
			return false;
		}
	}
	
/* 	console.log({
				'msgId' : msgId,
				'sendType': sendType,
				'gradeId' : gradeId,
				'custIds' : custIds.join(',')  
	}); */
	
	//alert('msgId==' + msgId);
 
	$.ajax({
		url : '/admin/weixin/mass/send.htm',
		data : {
			'msgId' : msgId,
			'sendType': sendType,
			'gradeId' : gradeId,
			'custSysIds' : custSysIds.join(',')  
		},
		success : function(res) {
			if (res.success) {
			   alert('<ui:i18n key="发送成功"/>.');
			}else{
				alert('<ui:i18n key="发送失败"/>\n' + res.err_msg);
			}  
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
	
}

function showNewsaterialWindow(){
	 showIframeBpopupWindow({
			id : 'bpopupPicture',
			title : '<ui:i18n key="选择素材"/>', // 标题 option
			width : 650, 
			height : 462, 
			action : '/admin/weixin/material/newsMaterialWindow.htm?conformMethod=chooseNewsfeed&clsoeMethod=closeNewsfeedWindow' 
		});	 		
}
 
//关闭窗口	
function closeNewsfeedWindow(){
	closeBpopupWindow('bpopupPicture');
}	

function chooseNewsfeed(msgId){
	$.ajax({
		url : "/admin/weixin/material/getNewsMaterialById.htm",
		type : "GET",
		data : {
			msgId : msgId
		},
		success : function(res) {
			if (res.success) {
				$('#msgId').val(res.data[0].MSG_ID);
		  	 	var tpl = _.template($("#tpl-appmsg-preview").html());
				$("#js-appmsg-preview").html(tpl(res));
			}  
		},
		error : function(xhr, status, e) {
			alert("error: " + status);
		}
	});
	
	closeNewsfeedWindow();
	
}

function showCustPopup(){
	 showIframeBpopupWindow({
			id : 'bpopupCust',
			title : '<ui:i18n key="选择客户"/>', // 标题 option
			width : 650, 
			height : 462, 
			action : '/admin/weixin/mass/custPopup.htm?conformMethod=chooseCust&clsoeMethod=closeCustWindow' 
		});	 		
}

//关闭窗口	
function closeCustWindow(){
	closeBpopupWindow('bpopupCust');
}	

function chooseCust(custes){
	var list = custes || [];
	for(var i = 0; i < list.length ; i++){
		var item = list[i];
		var $cust = $('<div class="js-cust-name cust-name" data-cust-sys-id="' + item.custSysId + '">' + item.custNickNm + '<div class="cust-name-del" onclick="custItemDel(' + item.custSysId + ');">&times;</div></div>')
		$('.js-cust-list').append($cust);
	}
	closeCustWindow();
}

function custItemDel(custSysId){
	$('.js-cust-name').each(function(){
		if($(this).data('custSysId') == custSysId){
			$(this).remove();
			return false;
		}
	});
}

function deletePreview(){
	$("#js-appmsg-preview").html('');
	$('#msgId').val('');
}


$(function(){
	 $('.js-send-type').on('ifChecked', function(event){
		 var sendType = $(this).val();
		 $('#sendType').val(sendType);
		 if(sendType == 1){
			 $('.js-send-type2-warp').hide();
			 $('.js-send-type3-warp').hide();
			 $('#custGrade').select2('val','');
		 }else if(sendType == 2){
			 $('.js-send-type2-warp').show();
			 $('.js-send-type3-warp').hide();
			 $('#custGrade').attr('disabled',false);
		 }else if(sendType == 3){
			 $('.js-send-type2-warp').hide();
			 $('.js-send-type3-warp').show();
			 $('#custGrade').select2('val','');
		 }
		 
	 });
});
</script>
</head>
<body>
 
	<!-- ▼ Main container -->
	<div class="container" >
		<input type="hidden" id="msgId" />
		<input type="hidden" id="sendType"  value="${sendType }"/>
	
		<!-- ▲ 查询表单区域  -->
	      	<div class="form-warp clearfix" >
	  			 <div class="control-warp"  >
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="发送给"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<input class="icradio js-send-type" type="radio" name="sendType" value="1" <c:if test="${sendType eq 1 }"> checked="checked" </c:if> >&nbsp;&nbsp; <ui:i18n key="所有人"/>
     		 			 &nbsp;&nbsp;&nbsp;
     		 			 <input class="icradio js-send-type" type="radio" name="sendType" value="2" <c:if test="${sendType eq 2 }"> checked="checked" </c:if> >&nbsp; <ui:i18n key="客户等级"/>
     		 			 &nbsp;&nbsp;&nbsp;
     		 			 <input class="icradio js-send-type" type="radio" name="sendType" value="3" <c:if test="${sendType eq 3 }"> checked="checked" </c:if> >&nbsp;<ui:i18n key="筛选"/>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp js-send-type2-warp" style="display: none;">
	  			 	 <div class="form-label"  >
	  			 		<ui:i18n key="客户等级"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 <div class="form-control">
	  			 	 	<select  class="select2 sw30" id="custGrade" disabled="disabled" data-placeholder="<ui:i18n key="请选择需要发送的客户等级"/>" >
							<option value=""></option>
							<c:forEach items="${gradeList}" var="item" varStatus="status">
								<option value="${item.GRADE_ID}">${item.GRADE_NM}</option>								
							</c:forEach>
						</select>
	  			 	 </div>
	  			 </div>
	  			 <div class="control-warp  js-send-type3-warp"  <c:if test="${sendType ne 3 }"> style="display: none;" </c:if> >
	  			 	 <div class="form-label"  style="vertical-align: top;" >
	  			 		<ui:i18n key="发送对象"/><a class="label-required"></a> : 
	  			 	 </div>
	  			 	 
	  			 	
	  			 	 
	  			 	 <div class="form-control clearfix">
	  			 	 		<div style="display: inline-block; width: 500px; float: left; padding: 10px 10px 0 0;border: 1px solid #e3e3e3;">
	  			 	 		 	<div class="js-cust-list" class="clearfix" style="min-height: 80px; ">
	  			 	 		 		
	  			 	 		 		<!--  <div class="cust-name">
	  			 	 		 		 	CC
	  			 	 		 		 	<div class="cust-name-del">&times;</div>
	  			 	 		 		  </div> -->
	  			 	 				<c:forEach items="${targetList}" var="item" varStatus="status">
									  	<div class="js-cust-name cust-name" data-cust-sys-id="${item.custSysId }">${item.custNickName }
			  			 	 		 		<div class="cust-name-del" onclick="custItemDel(${item.custSysId });">&times;</div>
			  			 	 		 	</div>					
									</c:forEach>
	  			 	 		 	</div>
	  			 	 		</div>
	  			 	 	
	  			 	 	
							<span class="button bg-orange  js-btn-choose" style="float: left; margin-left: 10px;" onclick="showCustPopup();">
			             		<span class="button-name">
			                    	<ui:i18n key="选择" />
			                 	</span>
			              	</span>
	  			 	 </div>
	  			 </div>
	  			 
	  			 <div class="js-message-area" style="border: 1px solid #eeeeee;min-height: 250px;margin-top:30px; position: relative; width: 634px;">
					<div class="message-type" style="position: relative; padding: 8px; border-bottom: 1px solid #eeeeee; ">
					 	<img onclick="showNewsaterialWindow();" style="width:30px;cursor: pointer;"   src="/admin/images/sendMsgAll/file_text.png">
					</div>
					<div id="js-appmsg-preview"  class="message-detail" style="position: relative; padding: 8px;    "> 
						<div  style="position: relative; width:250px; display: inline-block;  "> 
						</div>
					</div>
				</div>
				
			 <div class="control-warp" style="padding-left: 300px;margin-top: 20px;" >
			 	<div class="buttons-action">
	 				<span class="button bg-red" onclick="send();">
						<!-- <span class="button-icon conform"></span> -->
						<ui:i18n key="发送"/>
					</span>
				</div>
		 	</div>
	  			 
	  		</div>
	</div>		
		 
		<!-- ▲ Main container -->
	
<ui:template id="bpopupPicture"/>		
<ui:template id="bpopupCust"/>		
<script id="tpl-appmsg-preview" type="text/template"> 
{{
	var msgId = data[0].MSG_ID;
}}

<div  style="position: relative; width:300px; display: inline-block;  "> 
  	<div id="appmsg{{=msgId}}">
{{  
	if(data.length == 1){
}}	
		<div class="appmsg" data-id="{{=msgId}}" data-fileid="{{=msgId}}">
			<div class="appmsg_content">
				<h4 class="appmsg_title">
					<a href="javascript:void(0);" target="_blank">
						{{=data[0].MTITLE}}
					</a>
				</h4>
				<div class="appmsg_info">
					<em class="appmsg_date"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="M月d日"/></em>
				</div>
				<div class="appmsg_thumb_wrp">
					<img src="{{=data[0].FILE_URL}}" alt="" class="appmsg_thumb">
				</div>
				<p class="appmsg_desc">{{=data[0].MDIGEST}}</p>
			</div>
		</div>
{{
	}else{
}}	
		<div class="appmsg multi" data-id="{{=msgId}}" data-fileid="{{=msgId}}">
			<div class="appmsg_content">
				<div class="appmsg_info">
					<em class="appmsg_date"><fmt:formatDate value="<%=new java.util.Date() %>" pattern="M月d日"/></em>
				</div>
{{
		for(var i = 0; i < data.length  ; i++){   
			if(i == 0){
}}
				<div class="cover_appmsg_item">
					<h4 class="appmsg_title"><a href="javascript:void(0);" target="_blank">{{=data[i].MTITLE}}</a></h4>
					<div class="appmsg_thumb_wrp">
						<img src="{{=data[i].FILE_URL}}" alt="" class="appmsg_thumb">
					</div>
				</div>
{{
			}else{
}}
				<div class="appmsg_item">
					<img src="{{=data[i].FILE_URL}}" alt="" class="appmsg_thumb">
					<h4 class="appmsg_title">
						<a href="javascript:void(0);" target="_blank">
							{{=data[i].MTITLE}}
						</a>
					</h4>
				</div>
{{
			}
		
		}
}}
			</div>
		</div>
{{
	} 
}}
	</div>
</div>
<div style="display: inline-block; bottom: 30px;position: absolute;left: 320px;cursor:pointer;" onclick="deletePreview();"><ui:i18n key="删除"/></div>
</script>
</body>
</html>