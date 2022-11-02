<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%>
<title><ui:i18n key="设置 "/></title>

<style type="text/css">
.groupBorder{
	width:100%; 
	border-top: 1px solid #eeeeee;  
	position: relative;
}
#fileEntity{
	display: none;
}
.modifyImg{
	position: absolute;
	top: 20px;
	left:488px;
}
.headImg{
	width:80px; 
	height:80px; 
	margin:0 auto; 
	-webkit-border-radius:40px; 
	-moz-border-radius:40px; 
	-o-border-radius:40px; 
	border-radius:40px;
	background-image: url('${user.imgUrl}');
	background-repeat: no-repeat;
	background-size : 100% 100%;
	position: absolute;
	left: 555px;
	top: -50px;
	border: 1px solid #eeeeee
}
.midifyMiMa{
	position: absolute;
	top: 20px;
	left:658px;
}
.groupDiv{
	width: 100%;
	margin-top: 86px
}
.groupDiv table td{
	height: 50px;
	line-height:50px;
	font-size: 12px;
	padding-left: 10px;
	padding-right: 10px;
	color:#7b7b7b
}
.groupDiv input[type=text]{
	width: 440px;
	height: 30px;
	padding-top:0;
	padding-bottom: 0;
	color:#7b7b7b 
}

.sex{
	margin-left: 10px;
	margin-right: 30px;
}

.singNm{
	width: 440px;
	height: 80px;
	color:#7b7b7b;
	margin-top: 5px
}
.errorMsg{
	font-size: 12px;
	color: #d1102d
}

</style>

<script type="text/javascript">
$('document').ready(function() {
	//公司名称
	$('.userNickNm').blur(function() {
		var userNickNm = $('.userNickNm').val().trim();
		if (userNickNm == '') {
			$('#userNickNm').text('<ui:i18n key="用户昵称不能为空"/>.');
		} else {
			$('#userNickNm').text('');
		}
	});
	//qq名称
	$('.qqId').blur(function() {
		var qq = $('.qqId').val();
		if (qq == '') {
			$('#qqId').text('<ui:i18n key="QQ名称不能为空"/>.');
		} else {
			if (!$('.qqId').val().match(/^[1-9][0-9]{4,14}$/)) {
				$('#qqId').text('<ui:i18n key="QQ格式不对"/>.');
			} else {
				$('#qqId').text('');
			}
		}
	});
	//个性签名
	$('.singNm').blur(function() {
		var singNm = $('.singNm').val().trim();
		if (singNm == '') {
			$('.singNm').val('');
			$('#singNm').text('<ui:i18n key="个性签名不能为空"/>.');
		} else {
			$('#singNm').text('');
		}
	});
	$('#newPwd').blur(function(){
		var pwd = $(this).val().trim();
		if(pwd==''){
			alert('<ui:i18n key="密码不可为空"/>');
		}else{
			if(pwd.match(/^[0-9a-zA-Z]{6,}$/)){
				
			}else{
				alert('<ui:i18n key="密码只能为六位以上数字与字母的组合"/>');
			}
		}
	});
	$('#oldPwd').blur(function(){
		var oldPwd = $(this).val().trim();
		$.ajax({
			data : {
				 userId : '${backUserSession.userId}'
				,oldPwd : oldPwd
			},
			url : '/admin/master/user/checkOldPwd.htm',
			success : function(res){
				if (res.success){
					
				} else{
					alert(res.err_msg);
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
	});
});
//弹出隐藏层
function showPasswordModifyPopup(){
	$('#oldPwd').val('');
	$('#newPwd').val('');
	$('#re_newPwd').val('');
	showBpopup({
		id : 'popup',
		width : 450 
	});
}

//修改密码
function pwdUpdate(){
	var oldPwd = $('#oldPwd').val().trim();
	var newPwd = $('#newPwd').val().trim();
	var re_newPwd = $('#re_newPwd').val().trim();
	var flagCheck = true;
	if(oldPwd == ''){
		alert('<ui:i18n key="原密码不能为空"/>.');
		return false;
	}else{
		$.ajax({
			data : {
				 userId : '${backUserSession.userId}'
				,oldPwd : oldPwd
			},
			url : '/admin/master/user/checkOldPwd.htm',
			success : function(res){
				if (res.success){
					if(newPwd == ''){
						alert('<ui:i18n key="新密码不能为空"/>.');
						return false;
					}else if(!newPwd.match(/^[0-9a-zA-Z]{6,}$/)){
						alert('<ui:i18n key="密码只能为六位以上数字与字母的组合"/>');
						return false;
					}
					if(re_newPwd == ''){
						alert('<ui:i18n key="重复新密码不能为空"/>.');
						return false;
					}
					
					if(oldPwd == newPwd){
						alert('<ui:i18n key="原密码和新密码不能相同"/>.');
						return false;
					}
					
					if(newPwd != re_newPwd){
						alert('<ui:i18n key="两次输入的新密码不匹配"/>.');
						return false;
					}

					$.ajax({
						data : {
							userId : '${backUserSession.userId}'
							,oldPwd : oldPwd
							,pwd : newPwd
						},
						url : '/admin/master/user/updatePassword.htm',
						success : function(res){
							if (res.success){
								alert('<ui:i18n key="修改成功"/>.');
								window.location.reload();
							} else{
								alert(res.err_msg);
							}
						},
						error : function(a, msg, c){
							alert('error: ' + msg);
						}
					});
				} else{
					alert(res.err_msg);
					return false;
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
	}
	
	
}


//判断有没有调用logoUpload（）方法的标志
var num = 0;
//更新
function update(){
	
	var userNickNm = $('.userNickNm').val().trim();
	var qqId = $('.qqId').val().trim();
	var sex = $('input[type=radio][name=sex]:checked').val();
	var singNm = $('.singNm').val().trim();
	
	if (userNickNm == '') {
		alert('<ui:i18n key="用户昵称不能为空"/>.');
		return false;
	}
	
	if (!$('.qqId').val().match(/^[1-9][0-9]{4,14}$/)) {
		alert('<ui:i18n key="QQ格式不对"/>.');
		return false;
	}
	
	if (singNm == '') {
		alert('<ui:i18n key="个性签名不能为空"/>.');
		return false;
	}

	if(singNm.length > 300){
		alert('<ui:i18n key="个性签名字数不能超过300字"/>.');
		return false;
	}
 
	var imgNm = '';
	
	if(num == 0){
		$.ajax({
			data : {
				userNickNm : userNickNm,
				qqId : qqId,
				sex : sex,
				singNm : singNm,
			},
			url : '/admin/master/user/updateUser.htm',
			success : function(res){
				if (res.success){
					alert('<ui:i18n key="保存成功"/>.');
					window.location.reload();
				} else{
					alert(res.err_msg);
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
	}
	if(num == 1){
		var imgUrl = $('#fileEntity').val();
		imgNm = imgUrl.substring(imgUrl.lastIndexOf('\\') + 1, imgUrl.length);
		
		$.ajaxFileUpload({
			data : {
				userNickNm : userNickNm,
				qqId : qqId,
				sex : sex,
				singNm : singNm,
				logoFileName : imgNm
			},
			url : '/admin/master/user/updateUserWithHeadIcon.htm',
			secureuri :false,
			fileElementId :'fileEntity',
			dataType : 'json',
			type:'post',
			success : function(res){
				if (res.success){
					alert('<ui:i18n key="保存成功"/>.');
					window.location.reload();
				} else{
					alert(res.err_msg);
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
	}
}
//关闭弹出层
function closeDiv() {
	$('#popup').bPopup().close();
};
//检查上传文件是否为图片
function checkImage(file){
	var picPath = file.value;
        var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
        if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
            alert('<ui:i18n key="请上传正确的图片格式"/>.');
            return false;
        }
        var fileSize = file.files[0].size;
        if(fileSize > (5*1024*1024)){
      		alert('<ui:i18n key="图片太大"/>.');
      		return;
      	}
	return true;
}
//店铺logo的上传预览
function logoUpload(file){
	num = 1;
	if(checkImage(file)){
		 var prevDiv = document.getElementById('preview');
		 if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
		 	//prevDiv.innerHTML = '<img id='imgInput' alt='logo' src='' + evt.target.result + '' />';
		 	$('#preview').css('background-image','url('+evt.target.result+')');
			}; 
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			//prevDiv.innerHTML = '<div class='img' style='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\''></div>';
		}
	}
}

</script>
</head>
<body>
	
	<!-- ▼ header  --> 
  	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
	
	<div class="contents clearfix">
		
		<!-- ▼标题 -->
		<div class="clearfix" style="margin-top: 40px;">
			<div class="title-warp">
				<img alt="" src="/admin/images/setUp/ico_setup.png">
				<span class="title-name"><ui:i18n key="个人账号设置"/></span>
			</div>
			<div class="action-tools">
				<span class="action-tool">
	   		   		<img class="action-tool-icon refresh" alt="" src="/admin/images/groupCreate/toback.png" onclick="ggChangeShop();" />
			  		<span class="action-name"  style="font-size: 12px" onclick="ggChangeShop();" ><ui:i18n key="返回店铺目录"/></span>
	   		   	</span>
			</div>
		</div>
		<!-- ▲标题 -->
		
		
		
		<!-- end菜单栏 -->	
		<div class="groupBorder">
		
			<div class="modifyImg">
				<a href="javascript:document.getElementById( 'fileEntity').click();"><ui:i18n key="修改头像"/></a>
				<input type="file"  id="fileEntity" name="fileEntity" onchange="javascript:logoUpload(this);"/>
			</div>
			<div class="headImg" id="preview">
				<%-- <img alt="" src="${user.imgUrl}" style="width: 81px; height: 81px;" id="logoUploadImg"> --%>
				<input type="hidden" value="${user.imgUrl}" id="url"/>
			</div>
			<div class="midifyMiMa">
				<a href="javascript:showPasswordModifyPopup();"><ui:i18n key="修改密码"/></a>
			</div>

			<!-- start公司信息 -->
			<div class="groupDiv">
				<table width="100%">
					<tr>
						<td style="width: 408px;text-align: right;">
							<ui:i18n key="昵称"/><span style="color: #d1102d">*</span>：
						</td>
						<td style="width: 792px;text-align: left">
							<input type="text" value="${user.userNickNm }" name="userNickNm" class="userNickNm" placeholder="<ui:i18n key="请填写用户昵称"/>" /> 
							<span id="userNickNm" class="errorMsg"></span>
						</td>
					</tr>
					<tr>
						<td style="width: 408px;text-align: right;">
							QQ<span style="color: #d1102d">*</span>：
						</td>
						<td style="width: 792px;text-align: left">
							<input type="text" value="${user.qqId }" name="qqId" class="qqId" placeholder="<ui:i18n key="请填写联系人QQ"/>" /> 
							<span id="qqId" class="errorMsg"></span>
						</td>
					</tr>
					<tr>
						<td style="width: 408px;text-align: right;">
							<ui:i18n key="性别"/><span style="color: #d1102d">*</span>：
						</td>
						<td style="width: 792px;text-align: left">
							<input type="radio" value="1" name="sex" class="icradio" <c:if test="${user.sex eq 1}">checked</c:if>/><span class="sex"><ui:i18n key="男"/></span> 
							<input type="radio" value="2" name="sex" class="icradio" <c:if test="${user.sex eq 2}">checked</c:if>/><span class="sex"><ui:i18n key="女"/></span> 
							<input type="radio" value="3" name="sex" class="icradio" <c:if test="${user.sex eq 3}">checked</c:if>/><span class="sex"><ui:i18n key="保密"/></span>
							<span id="sex" class="errorMsg"></span>
						</td>
					</tr>
					<tr>
						<td style="width: 408px;text-align: right;vertical-align: top">
							<ui:i18n key="个性签名"/><span style="color: #d1102d">*</span>：
						</td>
						<td style="width: 792px;text-align: left">
							<textarea rows="10" cols="30" maxlength="300" placeholder="<ui:i18n key="最多输入300字"/>" class="singNm">${user.singNm}</textarea>
							<span id="singNm" class="errorMsg"></span>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="text-center" style="margin-top: 50px">
				<div class="buttons-action">
	  				<span class="button bg-red " onclick="update();" style="margin-right: 50px">
						<span class="button-icon conform"></span>
						<ui:i18n key="保存"/>
					</span>
					<span class="button bg-red  " onclick="history.back();" style="margin-left: 50px">
						<span class="button-icon cancel"></span>
						<ui:i18n key="取消"/>
					</span>
	 			</div>
			</div>

		</div>
	</div>
		
	<!-- ▼ bpopup area -->
	<div class="bpopup2" id="popup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="修改密码"/></h3>
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
				  			 	 <div class="form-label" style="text-align: left;width: 110px" >
				  			 		<ui:i18n key="请输入原密码"/><a class="label-required"></a>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="password" value="" id="oldPwd" class="w21"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: left;width: 110px" >
				  			 		<ui:i18n key="请输入新密码"/><a class="label-required"></a>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="password" value="" id="newPwd" class="w21"/>
				  			 	 </div>
				  			 </div>
				  			 <div class="control-warp"  >
				  			 	 <div class="form-label" style="text-align: left;width: 110px" >
				  			 		<ui:i18n key="重复新密码"/><a class="label-required"></a>： 
				  			 	 </div>
				  			 	 <div class="form-control">
				  			 	 	<input type="password" value="" id="re_newPwd" class="w21"/>
				  			 	 </div>
				  			 </div>
				  			 
				  			 <div class="control-warp text-center">
				  			 	<div class="popup-form-actions">
					  			 	 <div class="buttons-action">
						  				<span class="button bg-red js-confirm"  onclick="pwdUpdate();">
											<span class="button-icon conform"></span>
											<span class="button-name"><ui:i18n key="保存"/></span>
										</span>
										<span class="button bg-red  js-cancel b-close" style="margin-left:70px;">
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
</body>
</html>