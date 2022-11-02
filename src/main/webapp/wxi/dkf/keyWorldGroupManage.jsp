<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<!doctype html>
<head>
<title><ui:i18n key=""/></title>
</head>
<body>
<div class="pages">
	<div data-page="keyWordList" class="page">
		<div class="page-content"> 
			<!-- <div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class=""></i><span>Back</span></a></div>
			</div>  -->
			<div class="label-header" style="position: fixed;width:100%;z-index:100;padding-bottom:10px;">
				<div class="header-warp clearfix" style="background-image: url(/wxi/image/seatManage/seat_title_bg.png);">
					<img alt="" src="/wxi/image/seatManage/icon_zizuguanli.png" class="top-seat-img" >
				 	<div class="header-left">
				 		<div class="tab-title icon-tools">关键字组管理</div>
				 		<div class="tab-title-right-bg"></div>
				 	</div>
				 	<div class="header-right">
				 		<span><a href="#" class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
	 		<div class="agent-item" style="border:0;background-color: #fff;margin-top:52px;padding-top:20px;border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;">
 				<div class="keywork-warp">
 					<ul class="clearfix">
 						<li class="keyword-add" style="border: 1px solid #009900"  onclick="keyWorldManageSelect('','I')"><span class="" data-id=""></span></li>
		 				<c:forEach items="${list }" var="list" varStatus="status">
							<li class="key-world-manage-select" onclick="keyWorldManageSelect('${list.KEYWORD_GROUP_NAME}','U')"><span>${list.KEYWORD_GROUP_NAME}</span></li>		 					
		 				</c:forEach>
			 		</ul>
 				</div>
 			</div>
 		</div>
 		
 		<!-- poup弹出框 -->
 		<div class="modifyKeyWorldGroup">
 			<div class="modify-key-show-div">
 				<div><p id="titleNameTopShow" style="margin:0;">添加新的关键字组</p>
 					<img  src="/wxi/image/seatManage/close_img.png" onclick="closeBpoupDiv()"/>
 				</div>
 				<input type="text" id="keyWorldName" placeholder="请输入"/><br>
 				<span onclick="saveKeyWordGroup();">保存</span>
 				<input type="hidden" value="" id="workType"/>
 				<input type="hidden" value="" id="keyWordGroupCode"/>
 			</div>
 		</div>
 		<!-- poup弹出框 -->
	</div>
</div>
</body>
</html>