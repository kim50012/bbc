//打开收起关键字
function groupKeyWordShow(id){
	var flagShow = $('#closeGroupImg'+id).data('flagshow');
	if(flagShow == '1'){
		$('#closeGroupImg'+id).attr('src','/wxi/image/seatManage/group_open.png');
		$('#closeGroupImg'+id).data('flagshow','2');
		$('#groupKeyWord'+id).parent().show();
	}else{
		$('#closeGroupImg'+id).attr('src','/wxi/image/seatManage/group_close.png');
		$('#closeGroupImg'+id).data('flagshow','1');
		$('#groupKeyWord'+id).parent().hide();
	}
}
 //选择关键字
 function keyWorldSelect(obj){
	 var className = $(obj).attr('class');
	 if(className == 'key-world-select'){
		 $(obj).addClass('selected');
	 }else{
		 $(obj).removeClass('selected');
	 }
	 var num = $(obj).data('num');
	 var liList = $('#groupKeyWord'+num).find('li');
	 var liSelected =  $('#groupKeyWord'+num).find('.selected');
	 if(liList.length == liSelected.length){
		 $('#selectKeyWordImg'+num).attr('src','/wxi/image/seatManage/seat_selected.png');
		 $('#selectKeyWordImg'+num).data('selectflag','2');
	 }else if(liSelected.length == 0){
		 $('#selectKeyWordImg'+num).attr('src','/wxi/image/seatManage/seat_selected_no.png');
		 $('#selectKeyWordImg'+num).data('selectflag','1');
	 }else{
		 $('#selectKeyWordImg'+num).attr('src','/wxi/image/seatManage/seat_selected_gray.png');
		 $('#selectKeyWordImg'+num).data('selectflag','1');
	 }
 }
//弹出修改，新建关键字组
 function keyWorldManageSelect(groupName,jobType){
	 $('#keyWorldName').val(groupName);
	 $('#workType').val(jobType);
	 $('.modifyKeyWorldGroup').show();
	 if(jobType == 'I'){
		 $('#titleNameTopShow').text('添加新的关键字组');
	 }else{
		 $('#keyWordGroupCode').val(groupName);
		 $('#titleNameTopShow').text('修改关键字组');
	 }
 }
 function saveKeyWordGroup(){
	 var keyWorldName = $('#keyWorldName').val();
	 var jobType =  $('#workType').val();
	 var keyWordGroupCode= $('#keyWordGroupCode').val();
	 if(keyWorldName == ''){
		 showbPoupMsgDiv('请填写关键字组名');
		 return;
	 }
	 var param = {
			 keyWordGroupName : keyWorldName,
			 jobType : jobType,
			 keyWordGroupCode : keyWordGroupCode
	 };
	 $.ajax({
			data:param,
			url : '/wxi/dkf/saveKeyWordGroup.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result.OUT_ERR_MSG == 'S'){
					showbPoupMsgDivRefresh('操作成功');
				}else{
					showbPoupMsgDiv(data.result.OUT_ERR_MSG);
				}
			},
			error : function(a, msg, c) {
				//alert('error: ' + msg);
				showbPoupMsgDiv('操作失败');
			}
		 });
 }
 
 
// 关闭弹出框
 function closeBpoupDiv(){
	 $('#keyWorldName').val('');
	 $('#keyWorldGroupId').val('');
	 $('#workType').val('');
	 $('.modifyKeyWorldGroup').hide();
 }
 //上传图片
 function uploadHeadImage(){
	$('#logo_input').trigger('click');
 }
 
 
 //上传图片
 function logoUpload(file){
	if(checkImage(file)){
		var imgLogoPicture = document.getElementById('logo_input').value;
		var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
		var param = {fileName : logoFileName}
		$.ajaxFileUpload ({
			data : param,
			url :'/wxi/dkf/saveHeadImage.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
			secureuri : false,
			fileElementId : 'logo_input',
			dataType : 'json',
			type : 'post',
			success : function (data){
				if(data.resultLogoImg == 'success'){
					//alert(data.fileUrl+"::"+data.filePath);
					$('.seat-head-img').find('img').attr('src', data.fileUrl);
					$('#filePath').val(data.filePath);
				}else{
					showbPoupMsgDiv('图片上传失败');
				}
			},
			error: function (data, e){
				//alert(e );
				showbPoupMsgDiv('图片上传失败');
			}
		});	
	}
}
 var saveFlag = false;
 //保存坐席信息
 function saveSeat(jobType){
	 if(saveFlag){
		 return;
	 }
	 var filePath = $('#filePath').val();
	 if(filePath == '' && jobType == 'I'){
		 showbPoupMsgDiv('请上传头像');
		 return;
	 }
	 var accountName = $('#accountName').val();
	 if(accountName == ''){
		 showbPoupMsgDiv('请输入登录账号');
		 return;
	 }else if(!accountName.match(/^[a-zA-Z0-9]{1,10}$/)){
		 showbPoupMsgDiv('账号只可填写10位以内的数字字母。');
		 return;
	 }else{
		 accountName += $('#wxAppInfoName').val();
	 }
	 var nickName = $('#nickName').val();
	 if(nickName == ''){
		 showbPoupMsgDiv('请输入昵称');
		 return;
	 }else if(!nickName.match(/^[\u4e00-\u9fa5]{1,6}$|^[A-Za-z0-9]{1,12}$/)){
		 showbPoupMsgDiv('昵称最长6个汉字或12个英文字符。');
		 return;
	 }
	 var passWord = $('#passWord').val();
	 if(passWord == ''){
		 showbPoupMsgDiv('请输入登陆密码');
		 return;
	 }else if(!passWord.match(/^[a-zA-Z0-9\s|\S]{6,16}$/)){
		 showbPoupMsgDiv('请输入6-16位的密码。');
		 return;
	 }
	 var userGroupCode = $('#userGroupCode').find('option:selected').val();
	 if(userGroupCode == ''){
		 showbPoupMsgDiv('请选择坐席组');
		 return;
	 }
	 var keyWordAll = '';
	 var keyWordGroupCodeAll = '';
	 $('.key-world-select.selected').each(function(){
		 keyWordAll += $(this).data('name') + ',';
		 keyWordGroupCodeAll += $(this).data('code') + ',';
	 });
	 keyWordAll = keyWordAll.substring(0, keyWordAll.length-1);
	 keyWordGroupCodeAll = keyWordGroupCodeAll.substring(0, keyWordGroupCodeAll.length-1);
	 var imgUrl = $('.seat-head-img').find('img').attr('src');
	 var param = {
			 filePath : filePath,
			 accountName : accountName,
			 nickName : nickName,
			 passWord : passWord,
			 userGroupCode : userGroupCode,
			 keyWordAll : keyWordAll,
			 keyWordGroupCodeAll : keyWordGroupCodeAll,
			 jobType : jobType,
			 headImgUrl : imgUrl
	 };
	 saveFlag = true;
	 $.ajax({
			data:param,
			url : '/wxi/dkf/saveSeat.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result.OUT_ERR_MSG == 'S'){
					saveFlag = false;
					mainView.router.reloadPreviousPage('/wxi/dkf/seatManage.htm');
					showbPoupMsgDivBack('保存成功');
				}else{
					saveFlag = false;
					showbPoupMsgDiv(data.result.OUT_ERR_MSG);
				}
			},
			error : function(a, msg, c) {
				//alert('error: ' + msg);
				saveFlag = false;
				showbPoupMsgDiv('保存失败');
			}
		 });
 }
 
 
//检查上传文件是否为图片
 function checkImage(file){
 	var picPath = file.value;
 	if(picPath == ''){
 		return false;
 	}
      var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
      if (type != 'jpg') {
    	  showbPoupMsgDiv('请上传正确的图片格式');
          return false;
      }
 	return true;
 }
 

 //保存坐席组操作
 function saveSeatGroup(jobType){
	 var groupName = $('#groupName').val();
	 var keyWordAll = '';
	 var keyWordGroupCodeAll = '';
	 $('.key-world-select.selected').each(function(){
		 keyWordAll += $(this).data('name') + ',';
		 keyWordGroupCodeAll += $(this).data('code') + ',';
	 });
	 if(groupName == ''){
		 showbPoupMsgDiv('坐席组名不能为空');
		 return;
	 }
	 keyWordAll = keyWordAll.substring(0, keyWordAll.length-1);
	 keyWordGroupCodeAll = keyWordGroupCodeAll.substring(0, keyWordGroupCodeAll.length-1);
	 var param = {
			 groupName : groupName,
			 keyWordAll : keyWordAll,
			 keyWordGroupCodeAll : keyWordGroupCodeAll,
			 jobType : jobType
	 };
	 $.ajax({
			data:param,
			url : '/wxi/dkf/saveSeatGroup.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.result.OUT_ERR_MSG == 'S'){
					mainView.router.reloadPreviousPage('/wxi/dkf/seatGroupManage.htm');
					showbPoupMsgDivBack('保存成功');
				}else{
					showbPoupMsgDiv(data.result.OUT_ERR_MSG);
				}
			},
			error : function(a, msg, c) {
				//alert('error: ' + msg);
				showbPoupMsgDiv('保存失败');
			}
		 });
 }
 var paramName = '';
 var paramType = '';
 var paramAccountName = '';
 var paramUserGroupCode = '';
 function deleteSeatGroupName(name,type){
	 paramName = name;
	 paramType = type;
	 showbPoupMsgDivFlag('您确定删除该坐席组吗？');
 }
 
 function deleteSeatManage(name,type){
	 paramName = name;
	 paramType = type;
	 showbPoupMsgDivFlag('您确定删除该坐席吗？');
 }
 function masterSelected(obj,item,accountName,userGroupCode){
	 paramAccountName = accountName;
	 paramUserGroupCode = userGroupCode;
	 var className = $(obj).attr('class');
	 if(userGroupCode == '' || userGroupCode == null){
		 showbPoupMsgDiv('请先选择该坐席所属的分组。');
		 return;
	 }
	 if(className == 'seatManage-selected-div'){
		 showbPoupMsgDivFlag('您确定设置该坐席为Master？');
		 paramType = 'SelectMaster';
	 }else{
		 paramType = 'DeleteMaster';
		 showbPoupMsgDivFlag('您确定删除该坐席的Master权限？');
	 }
 }
 
 function selectKeywordAll(id){
	 var selectflag =  $('#selectKeyWordImg'+id).data('selectflag');
	 var listKey = $('#groupKeyWord'+id).find('li');
	 if(listKey.length == 0){
		 showbPoupMsgDiv("无关键字的关键字组不可选择");
		 return;
	 }
	 if(selectflag == '1'){
		 $('#selectKeyWordImg'+id).attr('src','/wxi/image/seatManage/seat_selected.png');
		 $('#groupKeyWord'+id).find('.key-world-select').addClass('selected');
		 $('#selectKeyWordImg'+id).data('selectflag','2');
	 }else if(selectflag == '2'){
		 $('#selectKeyWordImg'+id).attr('src','/wxi/image/seatManage/seat_selected_no.png');
		 $('#groupKeyWord'+id).find('.key-world-select').removeClass('selected');
		 $('#selectKeyWordImg'+id).data('selectflag','1');
	 }
 }
 
 
//选择坐席组后的操作
 function selectKeyWord(){
	 showbPoupMsgDivFlag('确认使用该坐席组关键字进行设置？');
	 paramType = 'selectKeyWord';
	 
 }
 
 function deleteSubmit(){
	 if(saveFlag){
		 return;
	 }
	 if(paramType == 'GROUP'){
		 var param = {
				 groupName : paramName,
				 keyWordAll : '',
				 keyWordGroupCodeAll : '',
				 jobType : 'U'
		 };
		 saveFlag = true;
		 $.ajax({
				data:param,
				url : '/wxi/dkf/saveSeatGroup.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result.OUT_ERR_MSG == 'S'){
						saveFlag = false;
						showbPoupMsgDivRefresh('删除成功');
					}else{
						saveFlag = false;
						showbPoupMsgDiv(data.result.OUT_ERR_MSG);
					}
				},
				error : function(a, msg, c) {
					//alert('error: ' + msg);
					saveFlag = false;
					showbPoupMsgDiv('删除失败');
				}
			 });
	 }else if(paramType == 'SEAT'){
		 var param = {
				 filePath : '',
				 accountName : paramName,
				 nickName : '',
				 passWord : '',
				 userGroupCode : '',
				 keyWordAll : '',
				 keyWordGroupCodeAll : '',
				 jobType : 'U',
				 headImgUrl : ''
		 };
		 saveFlag = true;
		 $.ajax({
				data:param,
				url : '/wxi/dkf/deleteSeat.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result.OUT_ERR_MSG == 'S'){
						saveFlag = false;
						showbPoupMsgDivRefresh('删除成功');
					}else{
						saveFlag = false;
						showbPoupMsgDiv(data.result.OUT_ERR_MSG);
					}
				},
				error : function(a, msg, c) {
					//alert('error: ' + msg);
					saveFlag = false;
					showbPoupMsgDiv('删除失败');
				}
			 });
	 }else if(paramType == 'SelectMaster'){
		 var param = {
				 filePath : '',
				 accountName : paramAccountName,
				 nickName : '',
				 passWord : '',
				 userGroupCode : paramUserGroupCode,
				 keyWordAll : '',
				 keyWordGroupCodeAll : '',
				 jobType : 'M',
				 headImgUrl : ''
		 };
		 $.ajax({
				data:param,
				url : '/wxi/dkf/selectMasterSeat.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result.OUT_ERR_MSG == 'S'){
						showbPoupMsgDivRefresh('操作成功');
					}else{
						showbPoupMsgDiv(data.result.OUT_ERR_MSG);
					}
				},
				error : function(a, msg, c) {
					//alert('error: ' + msg);
					showbPoupMsgDiv('操作失败');
				}
			 });
	 }else if(paramType == 'DeleteMaster'){
		 var param = {
				 filePath : '',
				 accountName : paramAccountName,
				 nickName : '',
				 passWord : '',
				 userGroupCode : '',
				 keyWordAll : '',
				 keyWordGroupCodeAll : '',
				 jobType : 'M',
				 headImgUrl : ''
		 };
		 $.ajax({
				data:param,
				url : '/wxi/dkf/selectMasterSeat.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result.OUT_ERR_MSG == 'S'){
						showbPoupMsgDivRefresh('操作成功');
					}else{
						showbPoupMsgDiv(data.result.OUT_ERR_MSG);
					}
				},
				error : function(a, msg, c) {
					//alert('error: ' + msg);
					showbPoupMsgDiv('操作失败');
				}
			 });
	 }else if(paramType == 'selectKeyWord'){
		 var userGroupCode = $('#userGroupCode').find('option:selected').val();
		 if(userGroupCode == ''){
			$('.imgSelected').attr('src','/wxi/image/seatManage/seat_selected_no.png');
			$('.imgSelected').data('selectflag','1');
			$('.key-world-select').removeClass('selected');
			$('#beforeUserGroupCode').val(userGroupCode);
			$('#bPoupMsgDivFlag').bPopup().close();
			return; 
		 }
		 $.ajax({
				data:{userGroupCode : userGroupCode},
				url : '/wxi/dkf/getKeyWordListByGroup.htm',  //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					$('.imgSelected').attr('src','/wxi/image/seatManage/seat_selected_no.png');
					$('.imgSelected').data('selectflag','1');
					$('.key-world-select').removeClass('selected');
					if(data.list.length > 0){
						for(var i = 0; i<data.list.length;i++){
							var keyWName = data.list[i].KEYWORD;
							$('.key-world-select').each(function(){
								if($(this).data('name') == keyWName){
									var classNameT = $(this).attr('class');
									if(classNameT == 'key-world-select'){
										$(this).addClass('selected');
										 var num = $(this).data('num');
										 var liList = $('#groupKeyWord'+num).find('li');
										 var liSelected =  $('#groupKeyWord'+num).find('.selected');
										 if(liList.length == liSelected.length){
											 $('#selectKeyWordImg'+num).attr('src','/wxi/image/seatManage/seat_selected.png');
											 $('#selectKeyWordImg'+num).data('selectflag','2');
										 }else if(liSelected.length == 0){
											 $('#selectKeyWordImg'+num).attr('src','/wxi/image/seatManage/seat_selected_no.png');
											 $('#selectKeyWordImg'+num).data('selectflag','1');
										 }else{
											 $('#selectKeyWordImg'+num).attr('src','/wxi/image/seatManage/seat_selected_gray.png');
											 $('#selectKeyWordImg'+num).data('selectflag','1');
										 }
									}
								}
							});
						}
					}
					$('#beforeUserGroupCode').val(userGroupCode);
					$('#bPoupMsgDivFlag').bPopup().close();
				},
				error : function(a, msg, c) {
					var checkValue = $('#beforeUserGroupCode').val();
					var selectN = document.getElementById("userGroupCode");  
					 for(var i=0; i<selectN.options.length; i++){  
					        if(selectN.options[i].innerHTML == checkValue){  
					            selectN.options[i].selected = true;  
					            break;  
					        }  
					    }  
					$('#bPoupMsgDivFlag').bPopup().close();
				}
			 });
	 }
 }
 
 /*----------------- 弹出窗操作 -------------*/
 function showbPoupMsgDiv(msg){
	 $('#bPoupMsgText').text(msg);
	 $('.submit-true').attr('style','display:none;');
	 $('.submit-false').attr('style','display:none;');
	 $('.submit-know').attr('style','display:inline-block;');
	 	showBpopup({
			id : 'bPoupMsgDivFlag',
			width :375,
			top:180,
			left:20
		});	
	}
 function showbPoupMsgDivRefresh(msg){
	 $('#bPoupMsgText').text(msg);
	 $('.submit-true').attr('style','display:none;');
	 $('.submit-false').attr('style','display:none;');
	 $('.submit-know').attr('style','display:inline-block;');
	 $('#refreshFlag').val('R');
	 	showBpopup({
			id : 'bPoupMsgDivFlag',
			width :375,
			top:180,
			left:20
		});	
	}
 function showbPoupMsgDivBack(msg){
	 $('#bPoupMsgText').text(msg);
	 $('.submit-true').attr('style','display:none;');
	 $('.submit-false').attr('style','display:none;');
	 $('.submit-know').attr('style','display:inline-block;');
	 $('#refreshFlag').val('B');
	 $('#refreshFlagUrl').val('url');
	 	showBpopup({
			id : 'bPoupMsgDivFlag',
			width :375,
			top:180,
			left:20
		});	
	}
 //关闭弹出框
 function closeBpoupMsgDiv(){
	 if(paramType == 'selectKeyWord'){
		 var checkValue = $('#beforeUserGroupCode').val();
			var selectN = document.getElementById("userGroupCode");  
			 for(var i=0; i<selectN.options.length; i++){  
			        if(selectN.options[i].innerHTML == checkValue){  
			            selectN.options[i].selected = true;  
			            break;  
			        }  
			    }  
	 }
	 $('#bPoupMsgDivFlag').bPopup().close();
	 var refreshFlag = $('#refreshFlag').val();
	 if(refreshFlag == 'R'){
		 $('#refreshFlag').val('');
		 mainView.router.refreshPage();
		 //mainView.router.refreshPage();
	 }else if(refreshFlag == 'B'){
		 $('#refreshFlag').val('');
		 mainView.router.back();
	 }
	 
 }
 function showbPoupMsgDivFlag(msg){
	 $('.submit-true').attr('style','display:inline-block;');
	 $('.submit-false').attr('style','display:inline-block;');
	 $('.submit-know').attr('style','display:none;');
	 $('#bPoupMsgText').text(msg);
	 	showBpopup({
			id : 'bPoupMsgDivFlag',
			width:375,
			top:180,
			left:20
		});	
	}
 /*----------------- 弹出窗操作 -------------*/
