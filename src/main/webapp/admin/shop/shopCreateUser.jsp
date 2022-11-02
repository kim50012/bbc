<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="创建新店铺"/></title> 
<style type="text/css">
.shop-set table{
	width:100%;
	position: relative;
	color:#5f5f5f;
}
.shop-set .input-name{
	width:35%;
	position: relative;
	text-align: right;
}
.shop-set table tr td{
	height:50px;
	line-height:50px;
	vertical-align: middle;
}
.label-required {
	color:#d1102d;
	font-size:16px;
}
.select2{
	width:442px;
}
.img-show-before{
	border:1px solid #eee;
	width:100px;
	height:100px;
	display: inline-block;
	cursor: pointer;
}
.img-show-before img{
	width:100%;
	height:100%;
}
.js-add-goods.add-goods{
	display: inline-block;
  width: 100%;
  height: 100%;
  text-align: center;
  background: url("/admin/images/rouletteActivity/icon_img.png");
  background-position: 38px 33px;
  background-repeat: no-repeat;
  background-color: #f7f7f7;
  display: inline-block;
    line-height: normal;
}
.add-img-text{
width:100%;
text-align: center;
display: inline-block;
margin-top:60px;
color:#5f5f5f;
font-size:12px;
margin-left:0;
}
.img-width-span{
  color: red;
  float: none;
  margin-left: 10px;
  display: inline-block;
  vertical-align: bottom;
  line-height: normal;
  padding-bottom: 10px;
}
.shop-set tr td input{
	width:420px;
}

.shop-set tr td textarea{
	width:420px;
	height:90px;
}
.td_submit{
	width:100%;
	text-align: center;
	margin-bottom:30px;
}
</style>
<script type="text/javascript">
$(function(){

	$('.img-show-before').click(function(){
		$('#logo_input').trigger('click');
	});
	$('#shopName').blur(function(){
		var shopName = $('#shopName').val();
		if(shopName == '') {
			$('#shopNameMsg').text('<ui:i18n key="店铺名称不能为空"/>');
			$('#shopNameMsg').attr('style','color:red;');
		}
		else{
			$('#shopNameMsg').text('');
		}
	});
	//检验联系人姓名
	$('#contactName').blur(function(){
		var contactName = $('#contactName').val();
		if(contactName == '') {
			$('#contactNameMsg').text('<ui:i18n key="联系人姓名不能为空"/>');
			$('#contactNameMsg').attr('style','color:red;');
		}
		else{
			$('#contactNameMsg').text('');
		}
	});
	//检验联系人手机号
	$('#contactMobileNo').blur(function(){
		var contactMobileNo = $('#contactMobileNo').val();
		if(contactMobileNo == '') {
			$('#contactMobileNoMsg').text('<ui:i18n key="联系人手机号不能为空"/>');
			$('#contactMobileNoMsg').attr('style','color:red;');
		}
		else{
			if(contactMobileNo.match(/^\d{11}$/)){
				$('#contactMobileNoMsg').text('');
			}
			else{
				$('#contactMobileNoMsg').text('<ui:i18n key="手机号格式错误"/>');
				$('#contactMobileNoMsg').attr('style','color:red;');
			}
		}
	});
	//检验联系人Email
	$('#contactEmail').blur(function(){
		var contactEmail = $('#contactEmail').val();
		if(contactEmail == '') {
			$('#contactEmailMsg').text('<ui:i18n key="联系人邮箱不能为空"/>');
			$('#contactEmailMsg').attr('style','color:red;');
		}
		else{
			if(!contactEmail.match(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/)){
				$('#contactEmailMsg').text('<ui:i18n key="邮箱格式不正确"/>');
				$('#contactEmailMsg').attr('style','color:red;');
			}
			else{
				$('#contactEmailMsg').text('');
			}
		}
	});
	//检验联系人QQ
	$('#contactQQ').blur(function(){
		var contactQq = $('#contactQQ').val();
		if(contactQq == '') {
			$('#contactQQMsg').text('');
			/* $('#contactQQMsg').attr('style','color:red;');  */
		}
		else{
			if(!contactQq.match(/^[1-9][0-9]{5,9}$/)){
				$('#contactQQMsg').text('<ui:i18n key="联系人QQ格式不正确"/>');
				$('#contactQQMsg').attr('style','color:red;');
			}
			else{
				$('#contactQQMsg').text('');
			}
		}
	});
	//检验店铺简介信息
	$('#descIntroduction').blur(function(){
		var descIntroduction = $('#descIntroduction').val();
		if(descIntroduction == '') {
			$('#descIntroductionMsg').text('<ui:i18n key="店铺简介信息不能为空"/>');
			$('#descIntroductionMsg').attr('style','color:red;');
		}
		else{
			$('#descIntroductionMsg').text('');
		}
	});
});
//店铺logo的上传预览
function logoUpload(file){
	var prevDiv = document.getElementById('preview');
	if(checkImage(file)){
		 if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
		 	prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="' + evt.target.result + '" />';
			}; 
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
		}
	}else{
		prevDiv.innerHTML = '<a href="javascript:selectedImg();" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>';	
	}
}

//检查上传文件是否为图片
function checkImage(file){
	var picPath = file.value;
	if(picPath == ''){
		return false;
	}
     var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
     if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
         alert('<ui:i18n key="请上传正确的图片格式"/>');
         return false;
     }
	return true;
}
//新建店铺的信息存储方法
function saveShop() {
	//获取店铺名称
    var shopName = $('#shopName').val();
	if(shopName == ''){
		alert('<ui:i18n key="店铺名称不能为空"/>')
		return;
	}
	//获取店铺分类ID
	var shopClassId = $('#shopClassId').find('option:selected').val(); 
	 if(shopClassId == ''){
        	alert('<ui:i18n key="请选择店铺分类"/>');
        	return;
        }
    //获取主营产品ID
    var mainGoods = $('#goodsClassId').find('option:selected').val();
    if(mainGoods == ''){
    	alert('<ui:i18n key="请选择主营产品"/>');
    	return;
    }
    //获取店铺logo
    var imgLogoPicture = document.getElementById('logo_input').value;
    if(imgLogoPicture == ''){
    	alert('<ui:i18n key="请选择店铺LOGO图片"/>');
    	return;
    }else{
    	 var type = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('.') + 1, imgLogoPicture.length).toLowerCase();
    	 if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
             alert('<ui:i18n key="请上传正确的图片格式"/>');
             return;
         } 
    }
    //获取店铺简介
    var descIntroduction = $('#descIntroduction').val();
	if(descIntroduction == ''){
		alert('<ui:i18n key="店铺简介信息不能为空"/>');
		return;
	}
	/* var userId = document.getElementById('userIdNum').innerHTML; */
	//获取所有name属性为errorMsg的span中的文档信息
	var spanMsg = document.getElementsByName('errorMsg');
	for(var i = 0;i < spanMsg.length;i++){
		if(! spanMsg[i].innerHTML == ''){
	   			 alert(spanMsg[i].innerHTML);
	   			 return;
		}
	}
	//获取照片的文件名
    var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
	var param = {
			shopName : shopName
			//,userId : userId
 			,logoFileName : logoFileName
 			,mainGoods	:	mainGoods
 			//,groupCorpName	:	groupCorpName
 			//,groupCorpId	:	groupCorpId
 			/* ,corpLicenseNo	:	corpLicenseNo
 			,legalPersonName	:	legalPersonName
 			,legalPersonIdCard	:	legalPersonIdCard */
 			//,contactName	:	contactName
 			//,contactMobileNo	:	contactMobileNo
 			//,contactEmail	:	contactEmail
 			//,contactQQ	:	contactQQ
 			//,addressProvinceId	:	addressProvinceId
 			//,addressCityId	:	addressCityId
 			//,addressDistrictId	:	addressDistrictId
 			//,addressDetail	:	addressDetail
 			,descIntroduction	:	descIntroduction
 			,shopClassId : shopClassId		
	};
	$.ajaxFileUpload ({
		data : param,
		url :'/admin/shop/saveShopUser.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
		secureuri : false,
		fileElementId : 'logo_input',
		dataType : 'json',
		type : 'post',
		success : function (data){
			if(data.result == 'SUCCESS'){
				$('#shopId').val(data.shopId);
		        window.confirm('<ui:i18n key="保存成功"/>');
		        
		        window.location.href = '/admin/portal/home.htm?shopId='+data.shopId;
			}else if (data.result == 'FAIL'){
				alert('<ui:i18n key="请检查信息"/>,<ui:i18n key="重新点击添加"/>.');					
			}
		},
		error: function (data, e){
			alert(e );
		}
	});	
}
function selectCheck(){
	var shopClassId = $('#shopClassId').find('option:selected').val();
	if(shopClassId == ''){
		$('#shopClassIdMsg').text('<ui:i18n key="请选择店铺分类"/>');
		$('#shopClassIdMsg').attr('style','color:red;');
	}
	else{
		$('#shopClassIdMsg').text('');
	}
	
}
function selectCheck1(){
	var shopClassId = $('#goodsClassId').find('option:selected').val();
	if(shopClassId == ''){
		$('#goodsClassIdMsg').text('<ui:i18n key="请选择主营产品"/>');
		$('#goodsClassIdMsg').attr('style','color:red;');
	}
	else{
		$('#goodsClassIdMsg').text('');
	}	
	
}
function selectCheck2(){
	var shopClassId = $('#groupCorpName').find('option:selected').val();
	if(shopClassId == ''){
		$('#groupCorpNameMsg').text('<ui:i18n key="请选择公司名称"/>');
		$('#groupCorpNameMsg').attr('style','color:red;');
	}
	else{
		$('#groupCorpNameMsg').text('');
	}	
}
</script>
</head>
<body>
<!-- ▼ header  --> 
  	<%@ include file="/admin/inc/banner_top.jsp"%> 
<!-- ▲ header  -->
<!-- ▼ container  --> 
<div class="contents clearfix">
	<!-- ▼标题 -->
	<div class="clearfix" style="margin-top: 40px;border-bottom:1px solid #eee;">
		<div class="title-warp">
			<img alt="" src="/admin/images/shopCreate/ico_shop.png">
			<span class="title-name"><ui:i18n key="创建新店铺"/></span>
		</div>
		<div class="action-tools">
			<span class="action-tool" onclick="ggChangeShop();">
   		   		<img class="action-tool-icon refresh" alt="" src="/admin/images/groupCreate/toback.png" />
		  		<span class="action-name"  style="font-size:12px;" ><ui:i18n key="返回店铺目录"/></span>
   		   	</span>
		</div>
	</div>
	<div class="shop-set">
		<table>
			<!-- 输入店铺名称 -->
			<tr>
				<td class="input-name" style="padding-top: 30px;" >
					<p><ui:i18n key="店铺名称"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px; padding-top: 30px;">
					<input  type="text" name="shopName" id="shopName"  placeholder="<ui:i18n key="请输入店铺名称"/>" />
					<!-- 显示检测信息 -->
					<span id="shopNameMsg" name="errorMsg" ></span>
				</td>
			</tr>
			<!-- 选择店铺分类 -->
			<tr>
				<td class="input-name">
					<p><ui:i18n key="店铺分类"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px; position: relative;">
					<select  id="shopClassId" class="select2" data-placeholder="<ui:i18n key="请选择店铺分类"/>" onchange="selectCheck();">
						<option value=""> </option>
						<c:forEach items="${adminShopClassList}" var="listShopClass" varStatus="">
							<option value="${listShopClass.shopClassId}">${listShopClass.shopClassName}</option>
						</c:forEach>
					<select/>
					<!-- 显示检测信息 -->
					<span id="shopClassIdMsg" name="errorMsg"></span>
				</td>
			</tr>
			<!-- 选择主营产品 -->
			<tr>
				<td class="input-name">
					<p><ui:i18n key="主营产品"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px;position: relative;">
					<select  id="goodsClassId" class="select2" data-placeholder="<ui:i18n key="请选择主营产品"/>" onchange="selectCheck1();">
						<option value=""></option>
						<c:forEach items="${adminGoodsClassList}" var="listGoodsClass" varStatus="">
							<option value="${listGoodsClass.goodsClassId}">${listGoodsClass.goodsClassName}</option>
						</c:forEach>
					<select/>
					<!-- 显示检测信息 -->
					<span id="goodsClassIdMsg" name="errorMsg"></span>
				</td>
			</tr>
			<%--
			<!-- 选择公司 -->
			<tr>
				<td class="input-name">
					<p><ui:i18n key="公司名称"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px;">
				<div>
					<select  id="groupCorpName" class="select2" <c:if test="${requestScope.groupCorpId != '' }">disabled="disabled"</c:if>  data-placeholder="<ui:i18n key="请选择公司名称"/>" onchange="selectCheck2();">
						<option value=""> </option>
						<c:forEach items="${groupCorpList}" var="list" varStatus="">
							<option value="${list.groupCorpId}" <c:if test="${list.groupCorpId==requestScope.groupCorpId}">selected="selected"</c:if>>${list.groupCorpName}</option>
						</c:forEach>
					<select/>
					<!-- 显示检测信息 -->
					<span id="groupCorpNameMsg" name="errorMsg"></span>
				</td>
			</tr>
			<tr>
				<td class="input-name">
					<p><ui:i18n key="联系人姓名"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px;">
					<input type="text" id="contactName" placeholder="<ui:i18n key="请填写联系人姓名"/>"/>
					<!-- 显示检测信息 -->
					<span id="contactNameMsg" name="errorMsg"></span>
				</td>
			</tr>
			<!-- 输入联系人手机号 -->
			<tr>
				<td class="input-name">
					<p><ui:i18n key="联系人手机号"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px;">
					<input type="text" id="contactMobileNo"  placeholder="<ui:i18n key="请填写联系人手机号"/>"  />
					<!-- 显示检测信息 -->
					<span id="contactMobileNoMsg" name="errorMsg"></span>
				</td>
			</tr>
			<!-- 输入联系人邮箱 -->
			<tr>
				<td class="input-name">
					<p><ui:i18n key="联系人邮箱"/><a class="label-required">*</a>：</p>
				</td>
				<td style="padding-left: 20px;">
					<input type="text" id="contactEmail"   placeholder="<ui:i18n key="请填写联系人邮箱"/>"/>
					<!-- 显示检测信息 -->
					<span  id="contactEmailMsg" name="errorMsg"></span>
				</td>
			</tr>
			<!-- 输入联系人QQ -->
			<tr>
				<td class="input-name">
					<p><ui:i18n key="联系人QQ"/> ：</p>
				</td>
				<td style="padding-left: 20px;">
					<input type="text" id="contactQQ" value="" placeholder="<ui:i18n key="请输入QQ号"/>"/>
					<!-- 显示检测信息 -->
					<span id="contactQQMsg" name="errorMsg"></span>
				</td>
			</tr>
			--%>
			<tr>
				<td class="input-name" style="height:68px;vertical-align: top;">
					<ui:i18n key="店铺LOGO"/><a class="label-required">*</a>：
				</td>
				<td style="padding-left: 20px;padding-top:10px;padding-bottom:20px;height:100px;">
					<input type="file"  id="logo_input" style="display: none;" name="logo_input" onchange="javascript:logoUpload(this);" />
					<div class="img-show-before" id="preview">
						<a href="javascript:selectedImg();" class="js-add-goods add-goods"><span class="add-img-text" ><ui:i18n key="添加图片"/></span></a>					
					</div>
					<span class="img-width-span" ><ui:i18n key="图片推荐尺寸"/>:(60px * 60px)</span>
					<span id="logoUploadImgMsg" name="errorMsg"></span>
				</td>
			</tr>
			<!-- 输入店铺简介信息 -->
			<tr>
				<td class="input-name" style="padding-bottom: 35px;vertical-align: top;">
				<ui:i18n key="店铺简介"/><a class="label-required">*</a>：
				</td>
				<td style="padding-left: 20px;padding-bottom: 35px;" >
				<textarea rows="4" cols="50" placeholder="<ui:i18n key="请输入店铺简介"/>" id="descIntroduction"></textarea>
					<!-- 显示检测信息 -->
					<span id="descIntroductionMsg" name="errorMsg"></span>
				</td>
			</tr>
		</table>
		<!-- 店铺信息保存按钮 -->
		<div class="td_submit">
			<span class="button bg-red js-trans-order-confirm"  onclick="saveShop();">
				<span class="button-icon conform"></span>
				<ui:i18n key="保存"/>
			</span>
			<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="ggChangeShop();">
				<span class="button-icon cancel"></span>
					<ui:i18n key="取消"/>
			</span>
		</div>
	</div>
	
  </div>


<!-- ▲ bpopup area -->
<!-- end修改  -->
</body>
</html>


