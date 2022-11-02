<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
  <%@ include file="/admin/template/uiIncV2NoMenu.jsp"%> 
<title><ui:i18n key="韩之盟后台管理"/></title>
 <style type="text/css">
 /*  div{
    box-sizing: border-box ;  content-box border-box padding-box  
  } */

div {
	position: relative;
	margin: 0;
	padding: 0;
}
/************************ 内容区域样式  ************************/

.contents {
	margin-right: auto;
	margin-left: auto;
	width: 1200px;
 /*   border: 1px solid red;    */
}

/************************ 最上端新建公司-店铺  ************************/

.action-warp {
	position: relative;
	right: 60px;
	float: right;
}

.action-warp .action {
	position: relative;
	display: inline-block;
	height: 50px;
	line-height: 50px;
}

.action-warp .action + .action {
	margin-left: 30px;
}

.action-warp .action .action-icon {
	margin-right: 10px;
	vertical-align: middle;
}

.action-warp .action .action-name {
	display: inline-block;
	box-sizing: border-box;
	height: 24px;
	font-size: 14px;
	line-height: 24px;
	cursor: pointer;
}



/************************ ************************/
.item-warp {
 
}

.item-warp + .item-warp {
	margin-top: 25px;
}

.company-warp {
	float: left;
	display: inline-block;
	width: 380px;
}

.company-warp + .company-warp {
	margin-left: 26px;
}


.company-haeder {
	clear: both;
}

.company-haeder .company-header-title-warp {
	float: left;
	padding-bottom: 5px;
}

.company-haeder .company-header-icon {
	margin-right: 10px;
	margin-left: 10px;
	vertical-align: text-bottom;
}

.company-haeder .company-header-name {
	font-size: 14px;
}

.company-haeder .company-header-action-warp {
	position: absolute;
	right: 4px;
	bottom: 5px;
	float: right;
}

.company-haeder .company-action {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.company-haeder .company-action-icon {
	margin-right: 5px;
	vertical-align: text-bottom;
}

.company-haeder .company-action-name {
	cursor: pointer;
}

.company-haeder .company-action + .company-action {
	margin-left: 10px;
}

.company-warp .company {
	box-sizing: border-box;
	padding: 30px 0 30px 55px;
	border: 1px solid #e5e5e5;
}

.company-warp .company .shop-warp {
	position: relative;
	width: 268px;
	border: 1px solid #e5e5e5;
	border-radius: 8px;
	cursor: pointer;
}
.company-warp .company .shop-warp:hover {
	/* border: 1px solid #fa6f52; */
	background-color: #f7f7f7;
}

.company-warp .company .shop-warp.gray:hover {
	/* border: 1px solid #e1e1e1; */
	background-color: #f7f7f7;
}


.company-warp .shop-warp + .shop-warp {
	margin-top: 10px;
}

.company-warp .shop-warp .shop-borer-left {
	float: left;
	width: 8px;
	height: 80px;
	border-bottom-left-radius: 7px;
	border-top-left-radius: 7px;
}

 .shop-borer-left.orange {
	background-color: #fa6f52;
}
 .shop-borer-left.gray {
	background-color: #e1e1e1;
}

.company-warp .shop-warp .shop-img-logo {
	float: left;
	margin-top: 15px;
	margin-left: 10px;
	width: 50px;
	height: 50px;
	border: 1px solid #e5e5e5;
	border-radius: 25px;
	background-size : 100% 100%;
}

.company-warp .shop-warp .shop-name-warp {
	float: left;
	margin-top: 27px;
	margin-left: 15px;
	height: 26px;
	color: #5f5f5f;
	line-height: 26px;
}

.company-warp .shop-name-warp:hover {
	color: #333333;
}

.company-warp .shop-edit-icon {
	position: absolute;
	right: 7px;
	bottom: 7px;
	width: 14px;
	height: 14px;
	background: url('/admin/images/v2-icons/icon-edit-gray.png') no-repeat center center;
	display: none;
}

.company-warp .shop-wx-icon{
	position: absolute;
	right: 31px;
	bottom: 7px;
	width: 14px;
	height: 14px;
	background: url('/admin/images/groupCorp/wechat.png') no-repeat center center;
	display: none;
}

.company-warp .shop-delete-icon {
	position: absolute;
	right: 55px;
	bottom: 7px;
	width: 11px;
	height: 14px;
	background: url('/admin/images/v2-icons/icon-delete-gray.png') no-repeat center center;
	display: none;
}

.company-warp .company .shop-warp:hover .shop-edit-icon,
.company-warp .company .shop-warp:hover .shop-wx-icon,
.company-warp .company .shop-warp:hover .shop-delete-icon{
	display: inline-block;
}

.company-warp .shop-edit-icon:hover {
	background: url('/admin/images/v2-icons/icon-edit-blue.png') no-repeat center center;
}

.company-warp .shop-wx-icon:hover {
	background: url('/admin/images/groupCorp/wechat_hover.png') no-repeat center center;
}

.company-warp .shop-delete-icon:hover {
	background: url('/admin/images/v2-icons/icon-delete-blue.png') no-repeat center center;
}
/* 
.submit-div-transport{
	width:98px;
	height:31px;
	border-radius:31px;
	line-height:31px;
	background-position: 10px 8px;
	background-repeat: no-repeat;
	color:#313131;
	cursor: pointer;
	display: inline-block;
}
 */

/* .submit-div-transport.submit-transport{
	background-image: url('/admin/images/transport/tick.png');
	border:2px solid #0e9615;
}
.submit-div-transport.revise-transport{
	background-image: url('/admin/images/transport/close.png');
	border:2px solid #d1102d;
	margin-left:20px;
} */
/* .submit-div-transport span{
	margin-left:10px;
} */
 .poupMessageTable {height:auto;width:510px;border-radius:5px;text-align: center;font-size:15px;margin-top:20px;}
.poupMessageTable .tableSpanMessage td{padding-top:10px;font-size:14px;height:20px;vertical-align: middle;text-align: right;width:150px;}

.poupMessageTable .tableSpanMessage td:last-child{text-align: left;width:250px;}
.poupMessageTable .tableSpanMessage td input{font-size:14px;width:260px;margin-top:0px; margin-left:20px;margin-bottom:0px;}
.poupMessageTable .tableSpanMessage td .select2{width:280px;margin-left:20px;height:30px;}
.poupMessageTable .tableMessageImg img{cursor: pointer;}
.poupMessageTable td img{cursor: pointer;}
.poupMessage{position: absolute;background-color: #ffffff;border:1px solid #eeeeee; border-radius:5px;width:600px;height:auto;z-index: 2000;filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);-moz-box-shadow: 2px 2px 10px #e0e0e0;-webkit-box-shadow: 2px 2px 10px #e0e0e0;box-shadow: 0px 0px 10px #e0e0e0;top:50px;left:50px;}
.fullbg_div { background-color:#b2b2b2; left:0; opacity:0.6; position:absolute; top:0; z-index:3; filter:alpha(opacity=60); -moz-opacity:0.6; -khtml-opacity:0.6; }
.wechat-edit{cursor: pointer;}
.must_write{color:#d1102d;}
          	    
 </style>
 
 <script type="text/javascript">
 
 $(function(){
	 
	 $('.js-add-company').click(function(){
		 location.href = '/admin/group/groupCreate.htm';
	 });
	 
	 $('.js-modify-company').click(function(){
		 var corpId = $(this).data('corpId');
		 location.href = '/admin/group/groupUpdate.htm?g_corp_id=' + corpId;
	 });
	 
	 $('.js-add-shop').click(function(){
		 location.href = '/admin/shop/shopCreate.htm' ;
	 });
	 
	 $('.js-add-shop-user').click(function(){
		 location.href = '/admin/shop/shopCreateUser.htm' ;
	 });
	 
	 $('.js-create-shop').click(function(){
		 var corpId = $(this).data('corpId');
		 location.href = '/admin/shop/shopCreate.htm?groupCorpId=' + corpId;	
	 });
	 
	 $('.js-edit-shop').click(function(event){
		 var shopId = $(this).data('shopId');
		 location.href = '/admin/shop/shopUpdate.htm?shopId=' + shopId;	
		 event.stopPropagation();  
			
	 });
	 
	 $('.js-wx-shop').click(function(event){
		var shopId = $(this).data('shopId');
		var shopName = $(this).data('shopName');
		$.ajax({
			url : '/admin/portal/weiXinAppInfoSelect.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			type : 'POST',
			data : {shopId : shopId},
			success : function(data){
				if(data.result == 'success'){
					//poupDiv();
					var map = data.map;
					$('#shopIdUpdate').val(shopId);
					$('#sysId').val(map.sysId);
					$('#shopNameUpdate').val(shopName);
					$('#originalAppId').val(map.originalAppId);
					$('#appId').val(map.appId);
					$('#appSecret').val(map.appSecret);
					$('#appUrl').val(map.url);
					$('#token').val(map.token);
					$('#encordingAesKey').val(map.encordingAesKey);
					//alert(map.accountType);
					$('#accountType').select2('val' , map.accountType);
					$('#transferCustomerService').select2('val' , map.transferCustomerService);
					$('.submit-div-transport.submit-transport').attr('data-item' , 'U');
					poupDiv();
				}else if(data.result == 'success1'){
					$('#shopIdUpdate').val(shopId);
					$('#sysId').val(data.account.sysId);
					$('#shopNameUpdate').val(shopName);
					$('#token').val(data.account.token);
					$('#encordingAesKey').val(data.account.encordingAesKey);
					$('#originalAppId').val('');
					$('#appId').val('');
					$('#appSecret').val('');
					$('#appUrl').val('');
					$('#accountType').select2('val' , '');
					$('#transferCustomerService').select2('val' , '');
					$('.submit-div-transport.submit-transport').attr('data-item' , 'I');
					poupDiv()
				}else if(data.result == 'fail'){
					alert('<ui:i18n key="操作失败"/>,<ui:i18n key="请重新操作"/>');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
		
		event.stopPropagation();  
			
	 });
	 
	 $('.submit-div-transport.submit-transport').click(function(){
			var jobType = $(this).attr('data-item');
			var shopId = $('#shopIdUpdate').val();
			var sysId = $('#sysId').val();
			var shopName = $('#shopNameUpdate').val();
			var originalAppId = $('#originalAppId').val();
			var appId = $('#appId').val();
			var appSecret = $('#appSecret').val();
			var appUrl = $('#appUrl').val();
			var token = $('#token').val();
			var encordingAesKey = $('#encordingAesKey').val();
			//alert(map.accountType);
			var accountType = $('#accountType').find('option:selected').val();
			var transferCustomerService = $('#transferCustomerService').find('option:selected').val();
			if(originalAppId == ''){
				alert('<ui:i18n key="请填写ORIGINAL_APP_ID"/>.');
				return;
			}else if(!originalAppId.match(/^[\d\w\(\)]*$/g)){
				alert('<ui:i18n key="ORIGINAL_APP_ID格式错误"/>.');
				return;
			}
			if(appId == ''){
				alert('<ui:i18n key="请填写APP_ID"/>.');
				return;
			}else if(!appId.match(/^[\d\w\(\)]*$/g)){
				alert('<ui:i18n key="APP_ID格式错误"/>.');
				return;
			}
			if(appSecret == ''){
				alert('<ui:i18n key="请填写APP_SECRET"/>.');
				return;
			}else if(!appSecret.match(/^[\d\w\(\)]*$/g)){
				alert('<ui:i18n key="APP_SECRET格式错误"/>.');
				return;
			}
			if(appUrl == ''){
				alert('<ui:i18n key="请填写URL"/>.');
				return;
			}
			if(accountType == ''){
				alert('<ui:i18n key="请选择公众号类型"/>.');
				return;
			}
			if(transferCustomerService == ''){
				alert('<ui:i18n key="请选择是否使用多客服"/>.');
				return;
			}
			var param={	
				jobType : jobType
				,shopId : shopId
				,sysId : sysId
				,shopName : shopName
				,originalAppId : originalAppId
				,appId : appId
				,appSecret : appSecret
				,appUrl : appUrl
				,token : token
				,encordingAesKey : encordingAesKey
				,accountType : accountType
				,transferCustomerService : transferCustomerService
			};
			$.ajax({
				data : param,
				type : 'POST',
				url : '/admin/portal/weiXinAppInfoSave.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						alert('<ui:i18n key="操作成功"/>.');
						cancel();
					}else if(data.result == 'fail'){
						alert('<ui:i18n key="操作失败"/>,<ui:i18n key="请重新操作"/>.');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		});
	 
	 $('.js-delete-shop').click(function(event){
		// function shopDel(id){
			
		 if(window.confirm('<ui:i18n key="您确定要删除该店铺吗"/>？')){
				 var shopId = $(this).data('shopId');
				//存储参数。
				$.ajax({
					data : {shopId : shopId},
					type : 'POST',
					url : '/admin/shop/deleteShop.htm',	//调用AdminShopCreateAction类中的deleteShop()方法删除店铺。
					success : function(data){
						if(data.ret == 'success'){
							alert(data.result);
							window.location.href = '/admin/portal/home.htm';  //跳到groupCorp.jsp页面。
						}
						else if(data.ret == 'fail'){
							alert('<ui:i18n key="验证失败请重新验证"/>.');
						}
						
					},
					error : function(a, msg, c) {
						alert('error: ' + msg);
					}
				});
			}
		 
		 event.stopPropagation();  
	 });
	 
	 $('.js-shop-warp').click(function(){
		var shopId = $(this).data('shopId');
		var auth = $(this).data('auth');
		console.log(' js-shop-warp shopId=' + shopId + ', auth=' + auth);
		 
		if(auth != 2){
			//alert('<ui:i18n key="认证以后可以使用系统"/>.');
			if (confirm('<ui:i18n key="认证以后可以使用系统"/>')) {
				
				var param={shopId : shopId};
				$.ajax({
					data : param,
					type : 'POST',
					url : '/wxthirdparty/getAuthorization.htm',
					success : function(data){
						alert('<ui:i18n key="即将前往微信的页面进行公众号授权登录"/>.');
						top.location.href = "https://mp.weixin.qq.com/cgi-bin/componentloginpage?component_appid="+data.appId+"&pre_auth_code="+data.pre_auth_code+"&redirect_uri=http://localhost/admin/portal/home.htm";
					},
					error : function(a, msg, c) {
						alert('error: ' + msg);
					}
				});
			}
			
			return;
		}
		 
		$.ajax({
			data : {shopId : shopId},
			dataType : 'json',
			url : '/admin/group/chkAuth.htm',
			success : function(data){
				if(data.result == 'success'){
					window.location.href = '/admin/portal/main.htm';
				}else if(data.result == 'fail'){
					 alert('<ui:i18n key="请确认店铺认证与否"/>.');
				}
			},
		});
		 
		 
	 });
	 
 });
 
	<%--
	if (${user.user_shop_cnt} == 1) {

		var shopId = '${user.user_shop_id}';
		
		 $.ajax({
		 		data : {shopId : shopId},
		 		type : 'POST',
		 		url : '/admin/group/chkAuth.htm',
		 		success : function(data){
					if(data.result == 'success'){
						window.location.href = '/admin/portal/main.htm';
					}else if(data.result == 'fail'){
						alert('<ui:i18n key="请确认店铺认证与否"/>.');
					}
		 		},
			 });
	}
	--%>
	//关闭灰色 jQuery 遮罩 
	function closeBg() { 
	$('#fullbg,.poupMessageDisplay').hide(); 
	} 
	function poupDiv(){
		
		/* var scrollHeight = $(document).scrollTop() + 10; 
		var left = ($(window).width() - 600) / 2;
		$('.poupMessageDisplay').attr('style','left:' + left + 'px;top:30px;position:absolute;');
		$('.poupMessageDisplay').show();
		var bh = document.body.scrollHeight;
		var bw = document.body.scrollWidth;
			$('#fullbg').css({ 
				height:bh, 
				width:bw, 
				display:'block' 
			});  */
		showIframeBpopupWindow({
			id : 'bpoupMessage',
			width : 510,
			height : 470
		});
	}
	//关闭弹出框
	function cancel(){
		closeBpopupWindow('bpoupMessage');
	}
 </script>
 
</head>
<body >
<!-- ▼    --> 
<!-- ▲    -->

	<!-- ▼ header  --> 
    	<%@ include file="/admin/inc/banner_top.jsp"%> 
	<!-- ▲ header  -->
      
    <!-- ▼ contents  --> 
    <div class="contents clearfix"> 
    	<div class="clearfix" style="min-height:30px;">
	          <div class="action-warp clearfix">
	          	
	          	<c:if test="${user.compId eq 0 and user.shopId eq 0}">
	          
	          	  <div class="action">
	          	  	 <img class="action-icon  js-add-company" src="/admin/images/v2-icons/icon-company.png">
	          	  	 <span class="action-name  js-add-company"><ui:i18n key="创建新公司"/></span>
	          	  </div>
	          	 <div class="action">
	          	  	 <img class="action-icon js-add-shop" src="/admin/images/v2-icons/icon-shop.png">
	          	  	 <span class="action-name js-add-shop"><ui:i18n key="创建新店铺"/></span>
	          	  </div>
	          	  
	          	</c:if> 
          	  
	          </div>
         </div>
         
		<c:if test="${not empty grouplist }">
        	<!-- ▼ item warp  --> 
          	<div class="item-warp clearfix">
    	</c:if>
    	
    	<c:forEach items="${grouplist}" var="item" varStatus="status">
    	
    		 <!-- 0000000 -->
    		 <div class="company-warp clearfix">
          	 	<div class="company-haeder clearfix">
          	 		<div class="company-header-title-warp">
          	 	 		<img class="company-header-icon" alt="" src="/admin/images/v2-icons/icon-company-big.png">
          	 	 		<span class="company-header-name">${item.g_corp_nm }</span>
          	 	 	</div>
			         <!-- 只有超级权限compId==0&& shopId==0 才能操作-->
					<c:if test="${user.compId eq 0 and user.shopId eq 0 }">
	          	 	 	<div class="company-header-action-warp">
	          	 	 		<div class="company-action">
				          	  	 <img class="company-action-icon js-create-shop" src="/admin/images/v2-icons/icon-shop-small.png" data-corp-id="${item.g_corp_id }">
				          	  	 <span class="company-action-name js-create-shop"  data-corp-id="${item.g_corp_id }"><ui:i18n key="创建店铺"/></span>
				          	  </div>
				          	  <div class="company-action">
				          	  	 <img class="company-action-icon js-modify-company"  src="/admin/images/v2-icons/icon-edit-blue.png" data-corp-id="${item.g_corp_id }">
				          	  	 <span class="company-action-name js-modify-company" data-corp-id="${item.g_corp_id }"><ui:i18n key="修改"/></span>
				          	  </div>
	          	 	 	</div>
					</c:if>
          	 	 	
          	 	</div>
          	 
	          	 <div class="company">
	          	 	<c:forEach items="${item.subList}" var="shop" varStatus="shopStatus">
		          	 	 <c:set var="leftColorClass" value="gray"></c:set>
		          	 	<c:set var="shopEditAble" value="false"></c:set>
		          	 	<c:set var="shopDeleteAble" value="false"></c:set>
		          	 	
		          	 	<c:if test="${shop.statusId ne 2}">
		          	 		<c:choose>
			          	 		<c:when test="${shop.authIsSuccess eq 0}"><%-- 0：未认证 --%>
			          	 			<c:if test="${user.shopId eq 0}">
			          	 				<c:set var="shopEditAble" value="true"></c:set>
			          	 			</c:if>
			          	 			<c:if test="${user.shopId eq 0 and user.compId eq 0}">
			          	 				<c:set var="shopDeleteAble" value="true"></c:set>
			          	 			</c:if>
			          	 		</c:when>
			          	 		<c:when test="${shop.authIsSuccess eq 1}"><%-- 1：待认证 --%>
			          	 			<c:if test="${user.shopId eq 0}">
			          	 				<c:set var="shopEditAble" value="true"></c:set>
			          	 			</c:if>
			          	 			<c:if test="${user.shopId eq 0 and user.compId eq 0}">
			          	 				<c:set var="shopDeleteAble" value="true"></c:set>
			          	 			</c:if>
			          	 		</c:when>
			          	 		<c:when test="${shop.authIsSuccess eq 2}"><%-- 2：认证 --%>
			          	 			<c:set var="leftColorClass" value="orange"></c:set>
			          	 			
			          	 			<c:if test="${user.shopId eq 0}">
			          	 				<c:set var="shopEditAble" value="true"></c:set>
			          	 			</c:if>
			          	 		</c:when>
			          	 		<c:otherwise></c:otherwise>
		          	 		</c:choose>
		          	 		
		          	 		<div class="js-shop-warp shop-warp clearfix ${leftColorClass }" data-shop-id="${shop.shopId}" data-auth="${shop.authIsSuccess }">
				          	 	<div class="shop-borer-left ${leftColorClass }"></div>
				          	 	<div class="shop-img-logo" style="background-image: url('${shop.imgLogoPicture}');"></div>
				          	 	<div class="shop-name-warp">
				          	 		<ui:i18n key="店铺名"/> <%-- ${shop.authIsSuccess}|${shop.statusId} --%>：<span class="shop-name">${shop.shopName}</span>
				          	 	</div>
				          	 	
				          	 	<c:if test="${shopEditAble }">
					          	 	<div class="shop-edit-icon js-edit-shop" data-shop-id="${shop.shopId}"></div>
				          	 	</c:if>
				          	 	<c:if test="${user.userAuth eq 'A' and !shopDeleteAble}">
									<div class="shop-wx-icon js-wx-shop" data-shop-id="${shop.shopId}" data-shop-name="${shop.shopName }"></div>										
								</c:if>
				          	 	<c:if test="${shopDeleteAble }">
					          	 	<div class="shop-delete-icon js-delete-shop" data-shop-id="${shop.shopId}"></div>
				          	 	</c:if>
				          	 </div>
		          	 	</c:if>
		          	 	
	          	 	
	          	 	</c:forEach>
	          	 </div>
          	 </div>
    	 
    		<c:if test="${status.count % 3 == 0}">
    			</div>
          		<!-- ▲ item warp  --> 
    			<!-- ▼ item warp  --> 
          		<div class="item-warp clearfix">
    		</c:if>
    	
    	</c:forEach>
    	
		<c:if test="${user.userAuth == null}">
			<div class="company-warp clearfix">
				<div class="company-haeder clearfix">
					<div class="company-header-title-warp">
						<img class="company-header-icon" alt="" src="/admin/images/v2-icons/icon-company-big.png" style="opacity:0;">
					</div>
				</div>
				<div class="company" style="border-radius: 8px;">
					<div class="shop-warp clearfix" onclick="window.location='/admin/shop/shopCreateUser.htm';" style="border:0px;">
						<div style="height:80px; width:100%;text-align:center;vertical-align: middle;line-height: 80px;">
							<div class="action">
								<img class="action-icon" src="/admin/images/v2-icons/icon-shop.png">
								<span class="action-name"><ui:i18n key="创建新店铺"/></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if> 	
       	
    	<c:if test="${not empty grouplist }">
       		</div>
          	<!-- ▲ item warp  -->   
    	</c:if>
        
	</div>
	<!-- ▲ contents  -->   
	<!-- ▼ Main footer -->
       <!-- Start提示信息弹出框 -->
		<div class="bpopup2" id="bpoupMessage" >
			 	<div class="bpopupWarp">
			 		 <div class="bpopupHeaderWarp">
						<h3 class="bpopupTitle js-title"><ui:i18n key="修改店铺公众信息"/></h3>
						<div class="bpopupColseWarp">
							<img class="b-close" src="/admin/images/goodsSell/close.png" />
						</div>
					</div>
				<table class="poupMessageTable">
					<tr class="tableSpanMessage">
						<td style="width:160px;">
							<ui:i18n key="店铺ID"/><span class="must_write">*</span>：
						</td>
						<td style="width:350px;">
							<input type="text" value="" id="shopIdUpdate" disabled="disabled" style="background-color: #eee;"/>
						</td>
					</tr>
					<!-- <tr class="tableSpanMessage">
						<td>
							SYS_ID<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="sysId" readonly="readonly"/>
						</td>
					</tr> -->
					<tr class="tableSpanMessage">
						<td>
							<ui:i18n key="店铺名称"/><span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="shopNameUpdate" readonly="readonly" style="background-color: #eee;"/>
						</td>
					</tr>
					<tr class="tableSpanMessage">
						<td>
							ORIGINAL_APP_ID<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="originalAppId"/>
						</td>
					</tr>
					<tr class="tableSpanMessage">
						<td>
							<!-- 应用ID -->APP_ID<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="appId"/>
						</td>
					</tr>
					<tr class="tableSpanMessage">
						<td>
							<!-- 应用密钥 -->APP_SECRET<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="appSecret"/>
						</td>
					</tr>
					<tr class="tableSpanMessage">
						<td>
							<!-- 地址 -->URL<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="appUrl"/>
							<input type="hidden" value="" id="sysId" readonly="readonly"/>
							<input type="hidden" value="" id="token" readonly="readonly"/>
							<input type="hidden" value="" id="encordingAesKey" readonly="readonly"/>
						</td>
					</tr>
					<!-- <tr class="tableSpanMessage">
						<td>
							TOKEN<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="token" readonly="readonly"/>
						</td>
					</tr>
					<tr class="tableSpanMessage">
						<td>
							ENCORDING_AES_KEY<span class="must_write">*</span>：
						</td>
						<td>
							<input type="text" value="" id="encordingAesKey" readonly="readonly"/>
						</td>
					</tr> -->
					<tr class="tableSpanMessage">
						<td>
							<ui:i18n key="公众号类型"/><span class="must_write">*</span>：
						</td>
						<td>
							<select id="accountType" class="select2">
								<option value=""></option>
								<option value="1"><ui:i18n key="服务号"/></option>
								<option value="2"><ui:i18n key="订阅号"/></option>
							</select>
						</td>
					</tr>
					<tr class="tableSpanMessage">
						<td>
							<ui:i18n key=""/><ui:i18n key="多客服"/><span class="must_write">*</span>：
						</td>
						<td>
							<select id="transferCustomerService" class="select2">
								<option value=""></option>
								<option value="0"><ui:i18n key="不使用"/></option>
								<option value="1"><ui:i18n key="使用"/></option>
							</select>
						</td>
					</tr>
					<tr class="tableMessageImg">
						<td style="padding-bottom:30px;padding-top:30px;" colspan="2">
							<!-- <img alt="" src="/admin/images/goodsSell/btn_confirm.png" onclick="displayDownGoods();"/>
							<img alt="" class="exitPoup" src="/admin/images/goodsSell/abolish.png" style="margin-left:15px;"/>-->
							<%-- <div class="submit-div-transport submit-transport" data-item="I">
           						<span><ui:i18n key="保存"/></span>
           					</div>
							<div class="submit-div-transport revise-transport exitPoup" >
           						<span><ui:i18n key="取消"/></span>
           					</div> --%>
           					<span class="button bg-red js-trans-order-confirm submit-div-transport submit-transport" >
								<span class="button-icon conform"></span>
									<ui:i18n key="确认"/>
							</span>
							<span class="button bg-red  js-trans-order-cancel" style="margin-left:100px;" onclick="cancel();">
								<span class="button-icon cancel"></span>
									<ui:i18n key="取消"/>
							</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- End -->
		<!-- 覆盖层div -->
		<div id="fullbg" class="fullbg_div">
		</div>
</body>
</html>