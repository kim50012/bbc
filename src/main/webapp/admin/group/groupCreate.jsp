<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="公司创建 "/></title>
<style type="text/css">
	.ftable td{
		height: 40px;
	}
	.tdlable{
		text-align: right;
		padding-right: 10px;
	}
	.input{
		border-radius:4px;margin-bottom:0px;width: 98%;
	}
	.label-required{
	 	background: url("/admin/images/v2-icons/icon-req.png")  no-repeat center ;
		display: inline-block;
		width: 12px;
		height: 12px;	
	}
	.span-red {
		color: red;
		font-size:12px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//公司名称
		$("input[name='g_corp_nm']").blur(function() {
			var groupNm = $("input[name='g_corp_nm']").val();
			$("input[name='g_corp_nm']").css('font-style','normal');
			if (groupNm == '') {
				$('#groupName').text('<ui:i18n key="公司名称不能为空"/>！<ui:i18n key="请重新输入"/>！');
			} else {
				$('#groupName').text('');
			}
		});
		//联系人名称
		$("input[name='contact_nm']").blur(function() {
			var groupNm = $("input[name='contact_nm']").val();
			$("input[name='contact_nm']").css('font-style','normal');
			if (groupNm == '') {
				$('#contactName').text('<ui:i18n key="联系人名称不能为空"/>！<ui:i18n key="请重新输入"/>！');
			} else {
				$('#contactName').text('');
			}
		});
		
		//联系人手机号
		$("input[name='contact_mobile_no']").blur(function() {
			var phone = $("input[name='contact_mobile_no']").val();
			$("input[name='contact_mobile_no']").css('font-style','normal');
			if (phone == '') {
				$('#phone').text('<ui:i18n key="联系人手机号不能为空"/>！<ui:i18n key="请重新输入"/>！');
			} else {
				if (!$("input[name='contact_mobile_no']").val().match(/^1[358][0-9]{9}$/)) {
					$('#phone').text('<ui:i18n key="手机号码格式不正确"/>！<ui:i18n key="请重新输入"/>！');
				} else {
					$('#phone').text('');
				}
			}
		});
		$('.js-cancel').click(function(){
			window.location.href='/admin/portal/home.htm?userId='+userId;
		});
		$('.js-confirm').click(function(){
			//公司名称
			var groupNm = $("input[name='g_corp_nm']").val();
			//联系人名称
			var name = $("input[name='contact_nm']").val();
			//联系人手机号
			var phone = $("input[name='contact_mobile_no']").val();
			//联系人邮箱
			var email = $("input[name='contact_email']").val();
			//联系人qq
			var qq = $("input[name='contact_qq']").val();
			var userId=$('#userId').val();
			
			if(groupNm == ''){
				alert('<ui:i18n key="公司名称不能为空"/>!');
				return;
			}
			if(name == ''){
				alert('<ui:i18n key="联系人姓名不能为空"/>!');
				return;
			}
			if(phone == ''){
				alert('<ui:i18n key="联系人手机号不能为空"/>!');
				return;
			}
		 
			var spanMsg=document.getElementsByName('errorMsg');
			for(var i = 0;i<spanMsg.length;i++){
				if(! spanMsg[i].innerHTML==''){
			   		alert(spanMsg[i].innerHTML);
			   		return;
				}
			}  
	 
			$.ajax({
					url : '/admin/group/save.htm',
					data : {
						g_corp_nm : groupNm,
						contact_nm : name,
						contact_mobile_no : phone,
						contact_email : email,
						contact_qq : qq,
						admin_user_id : userId,
						created_user_id : userId 
					},
					success : function(data){
						if (data.success){
							alert('<ui:i18n key="添加成功"/>.');
							window.location.href='/admin/portal/home.htm?userId='+userId;
						}else{
							alert(data.err_msg);
						}
				},
				error : function(a, msg, c){
					alert('error: ' + msg);
				}
			});
		});
	});
</script>
</head>
<body>
	<input type="hidden" value="${user.userId}" id="userId"/>
	<!-- ▼ header  --> 
   	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
	<!-- ▼  container-->
	<div class="contents clearfix">
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 40px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/groupCreate/main_company.png">
				<span class="title-name"><ui:i18n key="创建新公司"/></span>
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
        <div class="query-from" style="border:0; border-top:1px solid #e5e5e5;">
       		<div class="form-table"  style="width: 100%;">
       		 	<table class="ftable" border="1" style="margin-top: 40px;">
       		 		<colgroup>
       		 			<col width="35%" />
       		 			<col width="30%" />
       		 			<col width="35%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="tdlable"><ui:i18n key="公司名称"/><a class="label-required"></a>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" value="" name="g_corp_nm" class="input"
								placeholder="${label.请填写公司名称}" /> 
       		 			</td>
       		 			<td class="flabel">
       		 				<span id="groupName" class="span-red" name="errorMsg"></span>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="tdlable"><ui:i18n key="公司联系人姓名"/><a class="label-required"></a>：</td>
       		 			<td class="fcomp">
       		 				<input  type="text" value="" name="contact_nm" class="input"
									placeholder="${label.请填写联系人姓名}" /> 
       		 			<td class="flabel">
       		 				<span id="contactName" class="span-red" name="errorMsg"></span>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="tdlable"><ui:i18n key="联系人手机号"/><a class="label-required"></a>：</td>
       		 			<td class="fcomp">
       		 				<input  type="text" value="" name="contact_mobile_no" class="input"
									placeholder="${label.请填写联系人手机号}" /> 
       		 			<td class="flabel">
       		 				<span id="phone" class="span-red" name="errorMsg"></span>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="tdlable"><ui:i18n key="联系人邮箱"/>：</td>
       		 			<td class="fcomp">
       		 				<input  type="text" value="" name="contact_email" class="input"
									placeholder="${label.请填写联系人邮箱}" /> 
       		 			<td class="flabel">
       		 				<span id="email" class="span-red" name="errorMsg"></span>
       		 			</td>
       		 		</tr>
       		 		<tr>
       		 			<td class="tdlable"><ui:i18n key="联系人QQ"/>：</td>
       		 			<td class="fcomp">
       		 				<input  type="text" value="" name="contact_qq" class="input"
									placeholder="${label.请填写联系人QQ}" /> 
       		 			<td class="flabel">
       		 				<span id="qq" class="span-red" name="errorMsg"></span>
       		 			</td>
       		 		</tr>
       		 	</table>
       		 	<div class="control-warp text-center">
	  			 	<div class="popup-form-actions">
		  			 	 <div class="buttons-action">
			  				<span class="button bg-red js-confirm">
								<span class="button-icon conform"></span>
								<span class="button-name"><ui:i18n key="保存"/></span>
							</span>
							<span class="button bg-red  js-cancel" style="margin-left:70px;" onclick="">
								<span class="button-icon cancel"></span>
								<span class="button-name"><ui:i18n key="取消"/></span>
							</span>
		  				</div>
	  				</div>
	  			</div>
	  			
        </div>
        <!-- ▲ 查询表单区域  -->
	</div>
	<!-- ▲  container-->
</body>
</html>