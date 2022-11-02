<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<style>
<!--


/************************ header样式  ************************/
.header {
	background-color: #636363;
}

.header-contents{
 	width:1200px;
		/*width:1290px; */
	margin-left: auto;
	margin-right: auto; 
	/* background-color: red; */
	 height: 50px;
	 position: relative;
  }
  
  .header-contents .header-left{
  	float: left;
 /*  	background-color: green; */
  	height: 50px;
  	line-height: 50px;
  }
  .header-contents .header-right{
    /* background-color: blue;   */
  	position:absolute;
	float:right;
	top:  0px;
	right: 50px;
	margin: 0; 
	line-height: 50px;
	text-align: right;
	width: 200px;
  }
 
.header-right .first-menu{
	float: right;
	position: relative;
	padding-right: 12px; 
	padding-left: 12px; 
	border-top: 2px solid #626262; 
	border-bottom: 2px solid #626262; 
	height: 46px;
	line-height: 46px;
}
 

.header-right .first-menu:HOVER{
	background-color: #999999;
	border-top: 2px solid #d1102d; 
	border-bottom: 2px solid #999999; 
}
.header-right .first-menu img{
	
	cursor: pointer;
}
 
.header-right .first-menu .submenu { 
	position: absolute;
	top: 48px;
	right: 0; 
	display: none;
	/* padding-top: 10px;
	*/
	padding-bottom: 4px; 
	padding-top: 4px; 
	background-color: #999999; 
	z-index: 20;
}
.header-right .first-menu .submenu .second-menu {
	display: block;
	width : 140px;
	height: 26px;
	margin-top: 5px;
	margin-bottom: 5px;
	line-height:26px;
	font-size: 12px;
/* 	font-weight:bold; */
	color: white;
	text-align: center;
}
.header-right .first-menu .submenu .second-menu:hover {
	background-color:  #626262;
}
  
 
 .header-user-info{
    float: right;
	position: relative;
	height: 50px;
	line-height: 50px;
	display: inline-block;
	/* background-color: green; */
	right: 250px;
	padding-left: 10px;
	padding-right: 10px;
	
 } 
 
 .header-user-info .header-user-img-warp{
 	display: inline-block; height: 37px; width: 37px;  
 	position: relative;
 	cursor: pointer;
 }
 
.header-user-info .header-user-img-warp .header-user-img{
	height: 37px; width: 37px; border-radius: 37px; 
	
}
.header-user-info .header-user-img-warp .header-user-img-modal{
	height: 37px; width: 37px; border-radius: 37px; 
	position: absolute;left: 0 ; top: 8px;
	display: none;
}
.header-user-info .header-user-img-warp .header-user-img-modal{
	height: 37px; width: 37px; border-radius: 37px; 
	position: absolute;left: 0 ; top: 8px;
	display: none;
}

 .header-user-info .header-user-img-warp:hover .header-user-img-modal{
 	display: block;  
 }
 

 
.header-user-info .wellcome-msg{
	color: #fff;
	margin-left: 10px;
	height: 22px;
  	line-height: 22px; 
  	display: inline-block;
  	vertical-align: middle; 
	
}
  
  .platform-logo{
  	width: 55px; height: 22px;
  	vertical-align: middle;
  	margin-left: 13px;
  	margin-right: 15px;
  	cursor: pointer;
  }
  
  .platform-name{
  	font-size: 18px;
  	color: #fff; 
  	height: 22px;
  	line-height: 22px; 
  	display: inline-block;
  	vertical-align: middle; 
  	margin-left: 5px;
  	margin-right: 5px; 
  }

-->
</style>

 <div class="header">
          <div class="header-contents">
            	<div class="header-left">
<!--             		<img class="platform-logo" alt="" src="/admin/images/portal/hzm_logo.png"> -->
            		<span class="platform-name"><ui:i18n key="韩之盟后台管理"/></span>
            	</div>
            	<div class="header-right">
			 <ul class=" ">
				<li class="first-menu">
					<img onclick="ggGoExit();"  class="" alt="" src="/admin/images/portal/btn_exit.png">
					<%-- <div  class="submenu">
				   		<a class="second-menu" href="/admin/login/logout.htm" target="_self">${label.退出}</a>
				   </div> --%>
				</li> 
				<li class="first-menu">
					<img alt="" src="/admin/images/portal/btn_setting.png">
					<div  class="submenu"  >
					
					 <c:if test="${not empty sessionScope.backShopIdSession }">
				   		<a class="second-menu" href="javascript:void(0);" onclick="ggChangeShop();" target="_self"><ui:i18n key="店铺切换"/></a>
				   		<a class="second-menu" href="javascript:alert('<ui:i18n key="开发中"/>...');void(0);" target="_self"><ui:i18n key="公司详细信息"/></a>
				   		<a class="second-menu" href="javascript:alert('<ui:i18n key="开发中"/>...');void(0);" target="_self"><ui:i18n key="店铺详细信息"/></a>
					 </c:if>
					
				   		
				   		<a class="second-menu" href="/admin/master/user/userList.htm" target="_self"><ui:i18n key="用户管理"/></a>
				   		<a class="second-menu" href="/admin/master/i18n/i18nList.htm" target="_self"><ui:i18n key="国际化管理"/></a>
				   		<c:if test="${backUserSession.userId eq 'admin'}">
					   		<a class="second-menu" href="/admin/master/code/codeList.htm" target="_self"><ui:i18n key="系统代码管理"/></a>
					   		<a class="second-menu" href="/admin/master/menu/menuList.htm" target="_self"><ui:i18n key="菜单管理"/></a>
					   		<a class="second-menu" href="/admin/master/menu/auth.htm" target="_self"><ui:i18n key="菜单权限管理"/></a>
					   		<a class="second-menu" href="/admin/master/page/pageList.htm" target="_self"><ui:i18n key="浏览量数据管理"/></a>
					   		<a class="second-menu" href="/wx/share/index.htm" target="blank">Share</a>
					   		<a class="second-menu" href="/wx/qrcode/index.htm" target="blank">QR Code</a>
						   	<a class="second-menu" href="/label/reloadLabel.htm" target="blank">Label</a>
				   		</c:if>
				   		
				   		
				   </div>
				</li> 
				<c:if test="${not empty sessionScope.backShopIdSession }">
					<li class="first-menu">
					  <img onclick="ggShowNotice();" alt="" src="/admin/images/portal/btn_message.png">
					</li>
				</c:if>
			</ul>
		</div> 
		<div class="header-user-info">
		   <div class="header-user-img-warp" href="javascript:void(0);" onclick="ggSettingUserInfo();">
		    	<img class="header-user-img" alt="" src="${sessionScope.backUserSession.imgUrl }"> 
		    	<img class="header-user-img-modal" src="/admin/images/portal/shade_head.png"> 
		   </div>
		   
		   <span class="wellcome-msg"><ui:i18n key="管理员"/>${sessionScope.backUserSession.userRealNm },&nbsp;<ui:i18n key="欢迎你"/>!</span>
		</div>
		
          </div>
</div>

 <script type="text/javascript">
 $(function(){
    $('.first-menu').hover(function(){
		 $(this).find('div').show();
		 $(this).attr('background-color', '#990017');
	} ,function(){
	 	$(this).find('div').hide();
	});     
 });
 
 function ggShowNotice(){
	 var url='/admin/cust/msg/msgList.htm';
	 ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="消息管理"/>',
			'icon' : 'shopoperation' 
		});  
 }
 function ggGoExit(){
	 window.top.location.href = '/admin/login/logout.htm';
 }
 function ggChangeShop(){
	 window.top.location.href = '/admin/portal/home.htm';
 }
 function ggSettingUserInfo(){
	 window.top.location.href = '/admin/master/user/userModify.htm';
 }
 </script>