<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<!doctype html>
<head>
<title><ui:i18n key=""/></title>
</head>
<body>
<div class="pages">
	<div data-page="seatManage" class="page">
		<div class="page-content" style="background-color:#fff; "> 
			<!-- <div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class=""></i><span>Back</span></a></div>
			</div>  -->
			<div class="label-header" style="position: fixed;width:100%;z-index:100;padding-bottom:10px;">
				<div class="header-warp clearfix" style="background-image: url(/wxi/image/seatManage/icon_group_top.png);">
					<img alt="" src="/wxi/image/seatManage/icon_group2.png" class="top-seat-img" >
				 	<div class="header-left">
				 		<div class="tab-title icon-tools"><c:if test="${groupName eq '' || empty groupName }">添加新的坐席组</c:if><c:if test="${!(groupName eq '' || empty groupName )}">修改坐席组</c:if></div>
				 		<div class="tab-title-right-bg"></div>
				 	</div>
				 	<div class="header-right">
				 		<span><a href="#" class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
	 		<div class="seat-add-list-div">
				<div class="seat-add-head-img">
					<table class="seat-add-msg">
						<tbody>
							<tr>
								<td style="width:7%;"></td>
								<td style="width:15%;">坐席组名：</td>
								<td><input type="text" placeholder="请输入" id="groupName"  value="${groupName}" <c:if test="${!(groupName eq '' || empty groupName )}">readonly="readonly"</c:if>/></td>
							</tr>
							<!-- <tr>
								<td style="padding-top:20px;"></td>
								<td style="padding-top:20px;">关键字：</td>
								<td style="padding-top:20px;position: relative;">
								</td>
							</tr> -->
						</tbody>
					</table>
				</div>
				<div class="key-world-all-div">
					<div style="width:100%;height:16px;background-image: url('/wxi/image/seatManage/xuanzeguanjianzi.png');background-position: 0 1px;background-size:100% 14px;font-size:14px;text-align: center;color:#333;margin-top:20px;line-height:16px;">
						选择关键字
					</div>
					<c:forEach items="${groupList }" var="list" varStatus="status">
						<div class="agent-item" <c:if test="${(status.index+1) == fn:length(groupList)}">style="border:0;"</c:if>>
							<div class="agent-title-bar clearfix" style="background-color: #f7f7f7;border:0;">
								<span class="group-title-icon">
									<c:choose>
										<c:when test="${list.KEY_WORD_NUM == 0 or list.SELECT_FLAG == 0 }">
											<img id="selectKeyWordImg${status.index}" class="imgSelected" style="cursor: pointer;" alt="" src="/wxi/image/seatManage/seat_selected_no.png" data-selectflag = '1' onclick="selectKeywordAll(${status.index});">
										</c:when>
										<c:when test="${list.KEY_WORD_NUM != 0 and list.KEY_WORD_NUM == list.SELECT_FLAG}" >
											<img id="selectKeyWordImg${status.index}" class="imgSelected" style="cursor: pointer;" alt="" src="/wxi/image/seatManage/seat_selected.png" data-selectflag = '2' onclick="selectKeywordAll(${status.index});">
										</c:when>
										<c:when test="${list.KEY_WORD_NUM != 0 and list.KEY_WORD_NUM > list.SELECT_FLAG and list.SELECT_FLAG > 0}">
											<img id="selectKeyWordImg${status.index}"  class="imgSelected" style="cursor: pointer;" alt="" src="/wxi/image/seatManage/seat_selected_gray.png" data-selectflag = '1' onclick="selectKeywordAll(${status.index});">
										</c:when>
									</c:choose>
								</span>
							 	<span class="agent-title"  style="color:#6d6d6d;">${list.KEYWORD_GROUP_NAME }</span>
							 	<img src="/wxi/image/seatManage/group_close.png" style="cursor: pointer;position: absolute;right:3%;top:12px;" id="closeGroupImg${status.index }" onclick="groupKeyWordShow(${status.index })" data-flagshow = '1'/>
			 				</div>
			 				<div class="keywork-warp" style="display:none;">
			 					<ul class="clearfix" id="groupKeyWord${status.index}" <c:if test="${list.KEY_WORD_NUM == 0 }">style="margin:0;"</c:if>>
			 		 		 		<c:forEach items="${keywordList }" var="keywordList" varStatus="status2">
				 		 		 		<%-- <c:if test="${accountName eq '' || empty accountName }">
					 						<c:choose>
							 					<c:when test="${list.groupCode eq keywordList.groupCode}">
							 						<li class="key-world-select" onclick="keyWorldSelect(this)"  data-code="${keywordList.groupCode}" data-name="${keywordList.keyword }"><span>${keywordList.keyword }</span></li>
									 			</c:when>
			 			 		 		 	</c:choose>
					 					</c:if>
					 					<c:if test="${!(accountName eq '' || empty accountName )}"> --%>
					 						<c:choose>
							 					<c:when test="${list.KEYWORD_GROUP_CODE eq keywordList.KEYWORDGROUP_CODE}">
							 						<li class="key-world-select<c:if test="${keywordList.SELECTED_FLAG == 1}"> selected</c:if>" onclick="keyWorldSelect(this)"  data-code="${keywordList.KEYWORDGROUP_CODE}" data-name="${keywordList.KEYWORD }" data-num="${status.index}"><span>${keywordList.KEYWORD }</span></li>
									 			</c:when>
			 			 		 		 	</c:choose>
					 					<%-- </c:if> --%>
					 				</c:forEach>
			 					</ul>
							</div>
			 			</div>
		 			</c:forEach>
				</div>
				<%-- <div class="key-world-all-div" <c:if test="${fn:length(groupList) <= 0}">style="border:0;"</c:if>>
		 			<c:forEach items="${groupList }" var="list" varStatus="status">
						<div class="agent-item" <c:if test="${(status.index+1) == fn:length(groupList)}">style="border:0;"</c:if>>
							<div class="agent-title-bar clearfix" style="background-color: #f7f7f7;border:0;">
								<span class="group-title-icon">
									<img alt="" src="/wxi/image/dkfManager/group-title.png">
								</span>
							 	<span class="agent-title"  style="color:#6d6d6d;">${list.groupName }</span>
			 				</div>
			 				<div class="keywork-warp">
			 					<ul class="clearfix">
			 		 		 		<c:forEach items="${keywordList }" var="keywordList" varStatus="status">
					 					<c:if test="${groupName eq '' || empty groupName }">
					 						<c:choose>
							 					<c:when test="${list.groupCode eq keywordList.groupCode}">
							 						<li class="key-world-select" onclick="keyWorldSelect(this)"  data-code="${keywordList.groupCode}" data-name="${keywordList.keyword }"><span>${keywordList.keyword }</span></li>
									 			</c:when>
			 			 		 		 	</c:choose>
					 					</c:if>
					 					<c:if test="${!(groupName eq '' || empty groupName )}">
					 						<c:choose>
							 					<c:when test="${list.groupCode eq keywordList.KEYWORDGROUP_CODE}">
							 						<li class="key-world-select<c:if test="${keywordList.SELECTED_FLAG == 1}"> selected</c:if>" onclick="keyWorldSelect(this)"  data-code="${keywordList.KEYWORDGROUP_CODE}" data-name="${keywordList.KEYWORD }"><span>${keywordList.KEYWORD }</span></li>
									 			</c:when>
			 			 		 		 	</c:choose>
					 					</c:if>
								 	</c:forEach>
			 					</ul>
							</div>
			 			</div>
		 			</c:forEach>
				</div> --%>
 			</div>
 			<div class="seat-add-submit" <c:if test="${groupName eq '' || empty groupName }">onclick="saveSeatGroup('I');"</c:if><c:if test="${!(groupName eq '' || empty groupName )}">onclick="saveSeatGroup('M');"</c:if>>
 				<div>保存</div>
 			</div>
 		</div>
	</div>
</div>

</body>
</html>