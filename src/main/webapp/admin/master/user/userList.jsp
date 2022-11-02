<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="用户管理"/></title> 
<style type="text/css">
	.tableSpanMessage td:first-child{
		padding-left:50px;
		width:100px;
		text-align: left;
	}
	.tableSpanMessage td{
		padding-top:20px;
	}
	.tableSpanMessage td input{
		width:200px;
	}
	.tableSpanMessage td span{
		color:#d1102d;
	}
	.tableMessageImg td{
		text-align: center;
		padding-top:30px;
	}
	.poupMessageTable{
		width:100%;
		margin-top:10px;
	}
	.shop-manager-body-div .shop-manager-delete-div{width:300px;height:auto;float:left;text-align: center;}
	.shop-manager-body-div .shop-manager-select-div{width:300px;height:auto;float:left;text-align: center;}
	.shop-manager-body-div .shop-manager-delete-div .shop-delete{width:300px;height:350px;border:1px solid #d5d5d5;border-top:1px solid #d1102d;}
	.shop-manager-body-div .shop-manager-select-div .shop-selete{width:300px;height:350px;border:1px solid #d5d5d5;border-top:1px solid #d1102d;}
	.top-div-select{width:100%;text-align: left;vertical-align: bottom;margin-left:3%;font-size:14px;height:15px;margin-top:30px;margin-bottom:8px;color:#333333;}
	.body-select-div{width:295px;height:340px;overflow-y:scroll;}
	.body-select-div table{width:275px;}
	.body-select-div table tr td{height:85px;border-bottom:1px solid #c5c5c5;}
	.body-select-div table tr td input{width:13px;height:13px;} 
	.body-select-div table tr td .logo-image-div{height:64px;width:64px;border:1px solid #eeeeee;border-radius:32px;margin-left:7px;background-position: 0 0;background-repeat: no-repeat;background-size:64px 64px; }
	.shop-name{width:140px;display:inline-block; margin-left:5px;white-space:nowrap; text-overflow:ellipsis; overflow:hidden;}
	.search-div{height:70px;border: 1px solid #eeeeee;vertical-align: middle;line-height:70px;font-size:14px;}
	.search-div span{margin-left:20px;}
	.search-div input{width:200px;margin-top:7px;margin-left:20px;}
	.select-shop-submit{
		float:left;
		width:100px;
		text-align: center;
		margin-top:160px;
	}
	.select-shop-submit img{
		margin-bottom:15px;
	}
	.selected-shop.active{
		display:inline-block;
	}
	.selected-shop.no{
		display:none;
		cursor: pointer;
	}
	.select-tr.select-it{
		background-color: #f7f7f7;
	}
	.delete-tr.delete-it{
		background-color: #f7f7f7;
	}
</style>
<script type="text/javascript">
$(function(){
	search();
	
	$('.js-add-page').click(function(){
		 $('#createPagePopup input').val('');
		 showBpopup({
			id : 'createPagePopup',
			width : 450 
		});	  	 
	});
	
	//修改密码
	$('.js-moidfy-pass').click(function(){
		var userId = $('#userId').val();
		var pwd = $('#newPwd').val().trim();
		var pwdTwo = $('#newPwdTwo').val().trim();
		
		if(pwd==''){
			alert('<ui:i18n key="请填写密码"/>');
			return false;
		}else if(!pwd.match(/^[0-9a-zA-Z]{6,}$/)){
			alert('<ui:i18n key="密码只能为六位以上数字与字母的组合"/>');
			return false;
		}
		if(pwdTwo==''){
			alert('<ui:i18n key="请填写密码确认信息"/>');
			return false;
		}
		
		if(pwd != pwdTwo){
			alert('<ui:i18n key="密码不统一"/>，<ui:i18n key="请重新填写"/>');
			$('#newPwdTwo').val('');
			return false;
		}
		 
		$.ajax({
			data : {
				userId : userId
				,pwd : pwd
			},
			url : '/admin/master/user/updatePasswordByAdmin.htm', 
			success : function(res){
				if(res.success){
					alert('<ui:i18n key="修改密码成功"/>');
					cancel();
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				}else{
					alert('<ui:i18n key="操作失败"/>，<ui:i18n key="请重新操作"/>。');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	});
	
	
	$('#newPwd').blur(function(){
		var pwd = $(this).val();
		if(pwd==''){
			alert('<ui:i18n key="密码不可为空"/>');
		}else{
			if(pwd.match(/^[0-9a-zA-Z]{6,}$/)){
				
			}else{
				alert('<ui:i18n key="密码只能为六位以上数字与字母的组合"/>');
			}
		}
	});
	
	$('#newPwdTwo').blur(function(){
		var pwdSubmit = $(this).val();
		var pwd = $('#newPwd').val();
		if(pwdSubmit==''){
			alert('<ui:i18n key="确认密码不可为空"/>');
		}else{
			if(pwd==pwdSubmit){
			}else{
				alert('<ui:i18n key="密码不一致"/>，<ui:i18n key="请重新输入"/>');
			}
		}
	});
	
	$('.selected-shop').click(function(){
		var item = $(this).data('item');
		if(item == '1'){
			var shopIdString = '';
			$('.select-tr').each(function(){
				shopIdString = shopIdString+','+$(this).data('shopid');
			});
			if(shopIdString==''){
				alert('<ui:i18n key="请先选择店铺"/>');
				return;
			}
			shopIdString = shopIdString.substr(1,shopIdString.length);
			var jobType = 'I';
			var userId = $('#userId').val();
			var param = {
						userId : userId
						,shopIdString : shopIdString
						,jobType : jobType
					};
			changeUserShopAuth(param);
		}else if(item == '2'){
			var shopIdString = '';
			$('.select-tr.select-it').each(function(){
				shopIdString=shopIdString+','+$(this).data('shopid');
			});
			if(shopIdString==''){
				alert('<ui:i18n key="请先选择店铺"/>');
				return;
			}
			shopIdString = shopIdString.substr(1,shopIdString.length);
			var jobType = 'I';
			var userId = $('#userId').val();
			var param = {
						userId : userId
						,shopIdString : shopIdString
						,jobType : jobType
					};
			changeUserShopAuth(param);
		}else if(item == '3'){
			var shopIdString = '';
			$('.delete-tr.delete-it').each(function(){
				shopIdString = shopIdString+','+$(this).data('shopid');
			});
			if(shopIdString==''){
				alert('<ui:i18n key="请先选择店铺"/>');
				return;
			}
			shopIdString = shopIdString.substr(1,shopIdString.length);
			var jobType = '';
			var userId = $('#userId').val();
			var param = {
						userId : userId
						,shopIdString : shopIdString
						,jobType : jobType
					};
			changeUserShopAuth(param);
		}else if(item == '4'){
			var shopIdString = '';
			$('.delete-tr').each(function(){
				shopIdString=shopIdString+','+$(this).data('shopid');
			});
			if(shopIdString==''){
				alert('<ui:i18n key="请先选择店铺"/>');
				return;
			}
			shopIdString = shopIdString.substr(1,shopIdString.length);
			var jobType = '';
			var userId = $('#userId').val();
			var param = {
						userId : userId
						,shopIdString : shopIdString
						,jobType : jobType
					};
			changeUserShopAuth(param);
		} 
	});
	
});
</script>
<script type="text/javascript">
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
}

function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var userRealNameSearch = $('#userRealNameSearch').val();
	var userIdSearch = $('#userIdSearch').val(); 
	var params = {
			userRealNameSearch : userRealNameSearch
			,userIdSearch : userIdSearch
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/master/user/userListFragment.htm';
	var $this = $('.result-grid.pic');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 $this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 }); 
		 $('.pic-small').hover(function(){
		     	var $this = $(this);
		     	var offset = $this.offset();
		     	var $div = $('<div class="js-show-big-pic show-big-pic"></div>').css({ 'left': offset.left + 94,  'top':offset.top  });
		      	$div.append($('<img  class="pic-big" />').attr('src',$this.attr('src')));
		     	 $('body').append($div);
		      },function(){
		      	$('.js-show-big-pic').remove();
		      } 
		  );
		 
		//修改密码
			$('.js-change-pass').click(function(){
				var userId = $(this).data('userId');
				$('#userId').val(userId);
				$('#newPwd').val('');
				$('#newPwdTwo').val('');
				showIframeBpopupWindow({
					id : 'bpoupMessage',
					width : 450,
					height : 300
				});
			});
			//设置权限
			$('.js-set-auth').click(function(){
				var userId = $(this).data('userId');
				$('#userId').val(userId);
				addShopData();
				showIframeBpopupWindow({
					id : 'bpoupMessageUser',
					width : 810,
					height : 500
				});
			});
			
			//用户认证
			$('.js-user-authorize').click(function(){
				var userId = $(this).data('userId');
				if(window.confirm('<ui:i18n key="您确定认证该用户吗"/>？')){
					$.ajax({
						data : { 
							userId : userId
							,activeSts : 1
						},
						url : '/admin/master/user/modifyUserStatus.htm',  
						success : function(res){
							if(res.success){
								alert('<ui:i18n key="认证成功"/>');
								var pageCurr = Number($('#currentPage').find('option:selected').val());
								var pageUnit = Number($('#pageUnit').find('option:selected').val());
								showPage(pageCurr,pageUnit);
							}else{
								alert('<ui:i18n key="认证失败"/>，<ui:i18n key="请重新操作"/>。');
							}
						},
						error : function(a, msg, c) {
							alert('error: ' + msg);
						}
					});
				}
			});
			//用户停用
			$('.js-user-lock').click(function(){
				var userId = $(this).data('userId');
				if(window.confirm('<ui:i18n key="您确定停用该用户吗"/>？')){
					$.ajax({
						data : { 
							userId : userId
							,activeSts : 2
						},
						url : '/admin/master/user/modifyUserStatus.htm',  
						success : function(res){
							if(res.success){
								alert('<ui:i18n key="停用成功"/>');
								var pageCurr = Number($('#currentPage').find('option:selected').val());
								var pageUnit = Number($('#pageUnit').find('option:selected').val());
								showPage(pageCurr,pageUnit);
							}else{
								alert('<ui:i18n key="停用失败"/>，<ui:i18n key="请重新操作"/>。');
							}
						},
						error : function(a, msg, c) {
							alert('error: ' + msg);
						}
					});
				}
			});
			//用户启用
			$('.js-user-unlock').click(function(){
				var userId = $(this).data('userId');
				if(window.confirm('<ui:i18n key="您确定启用该用户吗"/>？')){
					$.ajax({
						data : { 
							userId : userId
							,activeSts : 1
						},
						url : '/admin/master/user/modifyUserStatus.htm',  
						success : function(res){
							if(res.success){
								alert('<ui:i18n key="启用成功"/>');
								var pageCurr = Number($('#currentPage').find('option:selected').val());
								var pageUnit = Number($('#pageUnit').find('option:selected').val());
								showPage(pageCurr,pageUnit);
							}else{
								alert('<ui:i18n key="启用失败"/>，<ui:i18n key="请重新操作"/>。');
							}
						},
						error : function(a, msg, c) {
							alert('error: ' + msg);
						}
					});
				}
			});
		 
		 $this.hideLoading();
	 });
	 
}

</script>
<script type="text/javascript">

function addShopData(){
	$('.delete-tr').removeClass('delete-it');
	$('.select-tr').removeClass('select-it');
	$('.selected-shop.rightno').hide();
	$('.selected-shop.right').show();
	$('.selected-shop.leftno').hide();
	$('.selected-shop.left').show();
	var userId=$('#userId').val();
	var param={userId:userId};
	$.ajax({
		data : param,
		url : "/admin/master/user/getUserShopAuthList.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		success : function(data){
			$('#selectTable').children().remove();
			$('#deleteTable').children().remove();
			if(data.list2.length == 0 && data.list1.length == 0){
				alert('<ui:i18n key="没有数据"/>。');
			}else{
				//list1 有权限的店铺
				var list1=data.list1;
				//list12无权限的店铺
				var list2=data.list2;
				for(var i=0;i<list1.length;i++){
					var html=' <tr class="delete-tr" data-shopid="'+list1[i].SHOP_ID+'"> <td style="width:30px;">'+
					'</td> <td style="width:80px;"> <div class="logo-image-div" style="background-image:url(\''+list1[i].FULL_URL+'\')">'+ 
					'</div> </td> <td style="text-align: left;"> <span title="" class="shop-name">'+list1[i].SHOP_NM+'</span>'+
					'</td> </tr>';
					$("#deleteTable").append(html);
				}
				for(var i=0;i<list2.length;i++){
					var html=' <tr class="select-tr" data-shopid="'+list2[i].SHOP_ID+'"> <td style="width:30px;">'+
					'</td> <td style="width:80px;"> <div class="logo-image-div" style="background-image:url(\''+list2[i].FULL_URL+'\')">'+ 
					'</div> </td> <td style="text-align: left;"> <span title="" class="shop-name">'+list2[i].SHOP_NM+'</span>'+
					'</td> </tr>';
					$("#selectTable").append(html);
				}
				if(list2.length != 0 || typeof(list2.length) == 'undefined'){
					$('.selected-shop.allrightno').show();
					$('.selected-shop.allright').hide();
				}else{
					$('.selected-shop.allrightno').hide();
					$('.selected-shop.allright').show();
				}
				if(list1.length != 0 || typeof(list1.length) == 'undefined'){
					$('.selected-shop.allleftno').show();
					$('.selected-shop.allleft').hide();
				}else{
					$('.selected-shop.allleftno').hide();
					$('.selected-shop.allleft').show();
				}
				$('.delete-tr').click(function(){
					var className = $(this).attr('class');
					if(className == 'delete-tr'){
						$(this).addClass('delete-it');
					}else{
						$(this).removeClass('delete-it');
					}
					var num = 0;
					$('.delete-tr.delete-it').each(function(){
						num++;
					});
					if(num > 0){
						$('.selected-shop.leftno').show();
						$('.selected-shop.left').hide();
					}else{
						$('.selected-shop.leftno').hide();
						$('.selected-shop.left').show();
					}
				});
				$('.select-tr').click(function(){
					var className = $(this).attr('class');
					if(className == 'select-tr'){
						$(this).addClass('select-it');
					}else{
						$(this).removeClass('select-it');
					}
					var num = 0;
					$('.select-tr.select-it').each(function(){
						num++;
					});
					if(num > 0){
						$('.selected-shop.rightno').show();
						$('.selected-shop.right').hide();
					}else{
						$('.selected-shop.rightno').hide();
						$('.selected-shop.right').show();
					}
				});
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
}
function changeUserShopAuth(param){
	$.ajax({
		data : param,
		url : '/admin/master/user/changeUserShopAuth.htm', 
		success : function(data){
			if(data.result.OUT_ERR_STATUS == 'S'){
				alert('<ui:i18n key="操作成功"/>');
				addShopData();
			}else if(typeof(data.result.OUT_ERR_MSG) == 'undefined'){
				alert('<ui:i18n key="操作失败"/>,<ui:i18n key="请重新操作"/>.');
			}else{
				alert(data.result.OUT_ERR_MSG);
			}
		},
		error : function(a, msg, c) {
			alert("error: " + msg);
		}
	});
}
//关闭弹出框
function cancel(){
	closeBpopupWindow('bpoupMessage');
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
	<div class="clearfix" style="margin-top: 40px;">
		<div class="title-warp">
			<img alt="" src="/admin/images/userManage/iocn_user.png">
			<span class="title-name"><ui:i18n key="用户管理"/></span>
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
       <div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
    		 			<col width="8%" />
    		 			<col width="27%" />
    		 			<col width="10%" />
    		 			<col/>
    		 		</colgroup>
    		 		<tr>
    		 			<td class="flabel"><ui:i18n key="姓名"/>：</td>
    		 			<td class="fcomp"><input type="text" value="${requestScope.userRealNameSearch }" id="userRealNameSearch" /></td>
    		 			<td class="flabel"><ui:i18n key="系统账号"/>：</td>
    		 			<td class="fcomp">
    		 				<input type="text" value="${requestScope.userIdSearch }" id="userIdSearch" />
    		 			</td>
    		 		</tr>
       		 	</table>
       		</div>
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button" onclick="search();">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/> 
       		   </span>
       		</div>
      	</div>
  		<!-- ▲ 查询表单区域  -->
		<div class="result-grid" style="margin-top:30px;">
	      	<div class="result-grid pic">
		      </div>
		  </div>
  
  	 <!-- START 弹出框，上传文件 -->
		  	<!-- Start提示信息弹出框 -->
			<div class="bpopup2" id="bpoupMessage" >
			 	<div class="bpopupWarp">
			 		 <div class="bpopupHeaderWarp">
						<h3 class="bpopupTitle js-title"><ui:i18n key="修改密码"/></h3>
						<div class="bpopupColseWarp">
							<img class="b-close" src="/admin/images/goodsSell/close.png" />
						</div>
					</div>
			 		 <div class="bpopupContentWarp"> 
			 		 	<table class="poupMessageTable">
							<tr class="tableSpanMessage">
								<td>
									<ui:i18n key="系统账号"/>：
								</td>
								<td>
									<input type="text" readonly="readonly" id="userId" value=""/>
								</td>
							</tr>
							<tr class="tableSpanMessage">
								<td>
									<ui:i18n key="输入新密码"/><span>*</span>：
								</td>
								<td>
									<input type="password"  id="newPwd"/>
								</td>
							</tr>
							<tr class="tableSpanMessage">
								<td>
									<ui:i18n key="确认新密码"/><span>*</span>：
								</td>
								<td>
									<input type="password"  id="newPwdTwo" />
								</td>
							</tr>
							<tr class="tableMessageImg">
								<td colspan="2">
									<div class="buttons-action" style="margin-bottom:10px;">
						 				<span class="button bg-red js-moidfy-pass confirm-img" >
											<span class="button-icon conform"></span>
												<ui:i18n key="保存"/>
										</span>
										<span class="button bg-red  js-trans-order-cancel" style="margin-left:30px;" onclick="cancel();">
											<span class="button-icon cancel"></span>
												<ui:i18n key="取消"/>
										</span>
									</div>
								</td> 
							</tr>
						</table>
			 		 </div>
			 	</div>
			</div>
  
  			<div class="bpopup2" id="bpoupMessageUser">
			 	<div class="bpopupWarp">
			 		 <div class="bpopupHeaderWarp">
						<h3 class="bpopupTitle js-title"><ui:i18n key="权限设置"/></h3>
						<div class="bpopupColseWarp">
							<img class="b-close" src="/admin/images/goodsSell/close.png" />
						</div>
					</div>
			 		<div class="bpopupContentWarp" style="width:700px;margin-left:55px;"> 
		 				<div class="shop-manager-body-div">
							<div  class="shop-manager-select-div">
								<div class="top-div-select">
									<ui:i18n key="可添加的店铺"/>
								</div>
								<div class="shop-selete">
									<div class="body-select-div">
										<table id="selectTable">
										</table>
									</div>
								</div>
							</div>
							<div class="select-shop-submit">
								<img class="selected-shop allrightno no" data-item='1' src="/admin/images/userManage/btn_allright_active.png"/>
								<img class="selected-shop allright active" src="/admin/images/userManage/btn_allright.png"/>
								<img class="selected-shop right active" src="/admin/images/userManage/btn_right.png"/>
								<img class="selected-shop rightno no" data-item='2' src="/admin/images/userManage/btn_right_active.png"/>
								<img class="selected-shop leftno no" data-item='3' src="/admin/images/userManage/btn_left_active.png"/>
								<img class="selected-shop left active" src="/admin/images/userManage/btn_left.png"/>
								<img class="selected-shop allleft active" src="/admin/images/userManage/btn_allleft.png"/>
								<img class="selected-shop allleftno no" data-item='4' src="/admin/images/userManage/btn_allleft_active.png"/>
							</div>
							<div  class="shop-manager-delete-div">
								<div class="top-div-select">
									<ui:i18n key="有权限的店铺"/>
								</div>
								<div class="shop-delete">
									<div class="body-select-div">
										<table id="deleteTable">
										</table>
									</div>
								</div>	
							</div>
			 		</div>
			 	</div>
			</div>
</div>
<!-- ▲ bpopup area -->
<!-- end修改  -->
</body>
</html>


