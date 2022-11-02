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
				<div class="header-warp clearfix" style="background-image: url(/wxi/image/seatManage/seat_title_bg.png);">
					<img alt="" src="/wxi/image/seatManage/seat_add1.png" class="top-seat-img" >
				 	<div class="header-left">
				 		<div class="tab-title icon-tools"><c:if test="${accountName eq '' || empty accountName }">添加客服工号</c:if><c:if test="${!(accountName eq '' || empty accountName )}">修改客服工号</c:if></div>
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
						<thead>
							<tr>
								<td style="width:7%;"></td>
								<td style="width:15%;vertical-align: top;">头像：</td>
								<td style="vertical-align: bottom;position: relative;">
									<div class="seat-head-img">
										<c:choose>
											<c:when test="${!empty map.HEAD}">
												<img src="${map.HEAD }" />
											</c:when>
											<c:otherwise>
												<img src="/wxi/image/seatManage/seat_add2.png" />
											</c:otherwise>
										</c:choose>
									</div>
									<input type="hidden" value="" id="filePath"/>
									<div class="upload-add-div"><a class='upload-head' onclick="uploadHeadImage()"><u>上传头像</u></a><span class="head-img-msg">（jpg格式，建议640*640）</span></div>
									<input type="file"  id="logo_input" style="display: none;" name="logo_input" onchange="javascript:logoUpload(this);" />
									
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="padding-top:20px;"></td>
								<td style="padding-top:20px;">工号：</td>
								<td style="padding-top:20px;"><input type="text" placeholder="请输入登录账号" id="accountName" <c:if test="${!(accountName eq '' || empty accountName )}">readonly="readonly"</c:if>  value="${map.ACCOUNT }" style="width:170px;margin-right:8px;"/>${str}
									<input type="hidden" value="${str }" id="wxAppInfoName"/>
								</td>
							</tr>
							<tr>
								<td style="padding-top:10px;"></td>
								<td style="padding-top:10px;"></td>
								<td style="padding-top:10px;color:#a9a9a9;font-style:italic;">工号不能重复，一旦输入不能修改，由字母、数字组成</td>
							</tr>
							<tr>
								<td style="padding-top:20px;"></td>
								<td style="padding-top:20px;">昵称：</td>
								<td style="padding-top:20px;"><input type="text" id="nickName" value="${map.NICKNAME }" /></td>
							</tr>
							<tr>
								<td style="padding-top:10px;"></td>
								<td style="padding-top:10px;">密码：</td>
								<td style="padding-top:10px;"><input type="password" id="passWord"  value="${map.PASSWORD }" /></td><%-- ${map.PASSWORD } --%>
							</tr>
							<tr>
								<td style="padding-top:10px;"></td>
								<td style="padding-top:10px;"></td>
								<td style="padding-top:10px;color:#a9a9a9;font-style:italic;">请输入6-16位的密码</td>
							</tr>
							<tr>
								<td style="padding-top:20px;"></td>
								<td style="padding-top:20px;">坐席组：</td>
								<td style="padding-top:20px;position: relative;">
									<select class="seat-group-select" id="userGroupCode" onchange="selectKeyWord();">
										<option value=""></option>
										<c:forEach items="${list }" var="list" varStatus="status">
											<option value="${list.GROUP_NAME }" <c:if test="${list.GROUP_NAME eq map.USERGROUP_CODE }">selected="selected"</c:if>>${list.GROUP_NAME }</option>
										</c:forEach>
									</select>
									<input type="hidden" value="${map.USERGROUP_CODE}" id="beforeUserGroupCode"/>
									<!-- <img src="/wxi/image/seatManage/seat_add3.png" class="select-click-img" onclick="selectClickImg()"/> -->
								</td>
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
					<!-- <img src="/wxi/image/seatManage/xuanzeguanjianzi.png" style="margin-top:20px;margin-bottom:0px;"/> -->
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
							 					<c:when test="${list.groupCode eq keywordLis
							 					
							 					
							 					
							 					
							 					
							 					
							 					
							 					 t.groupCode}">
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
 			</div>
 			<div class="seat-add-submit" <c:if test="${accountName eq '' || empty accountName }">onclick="saveSeat('I');"</c:if><c:if test="${!(accountName eq '' || empty accountName )}">onclick="saveSeat('Y');"</c:if>>
 				<div>保存</div>
 			</div>
 		</div>
	</div>
</div>

</body>
</html>