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
					<img alt="" src="/wxi/image/dkfManager/icon_plus_white.png" class="top-seat-img" >
				 	<div class="header-left">
				 		<div class="tab-title icon-tools">添加关键字</div>
				 		<div class="tab-title-right-bg"></div>
				 	</div>
				 	<div class="header-right">
				 		<span onclick="showBpopup_RemoveKeywordUpdate()"><img alt="" src="/wxi/image/dkfManager/delete.png">&nbsp;&nbsp;<span>删除</span></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#" class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
 	 		<div class="seat-add-list-div">
  				<div class="seat-add-head-img">
  					<div class="tabs_title">
			 			<!-- <a href="#tab_dkf"  class="tab-link active">多客服</a> &nbsp;&nbsp; -->
			 			<a href="#tab_ars"  class="tab-link">ARS管理</a> 
			 		</div>
	 		 		<div class="tabs">
 					    <div id="tab_dkf" class="tab">
 							<table class="keyword-add-msg">
	 							<tbody>
	 								<tr>
	 									<td style="padding-top:20px;position: relative;">
											<select class="keyword-group-select" id="keywordGroup_dkf">
												<option value="">请选择分组</option>
												<c:forEach items="${keywordGroupList }" var="keywordGroupList" varStatus="status">
													<option value="${keywordGroupList.groupCode }">${keywordGroupList.groupName }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
 										<td style="padding-top:20px;"><input type="text" id="keyword_dkf" placeholder="请输入多客服关键字"  style="width:100%;"/></td>
									</tr>
 	 							</tbody>
							</table>
 					    </div>
					    <!-- Tab 2 -->
					    <div id="tab_ars" class="tab active">
					     	<table class="keyword-add-msg">
	 							<tbody>
	 								<tr>
	 									<td style="padding-top:20px;position: relative;">
											<select class="keyword-group-select" id="keywordGroup_ars">
												<option value="">请选择分组</option>
												<c:forEach items="${keywordGroupList }" var="keywordGroupList" varStatus="status">
													<option value="${keywordGroupList.groupCode }" <c:if test="${keywordGroupList.groupCode eq keywordGroupCode}">selected="selected"</c:if>>${keywordGroupList.groupName }</option>
												</c:forEach>
 											</select>
										</td>
									</tr>
									<tr>
 										<td style="padding-top:20px;">
 											<input type="text" id="keyword_ars" value="${keyword }" placeholder="请输入自动应答关键字"  style="width:100%;"/>
 											<input type = "hidden" value ="${keyword }"  id = "keyWordBefore"/>
 										</td>
									</tr>
									<tr>
	 									<td style="padding-top:20px;padding-bottom: 20px;">
											<select class="keyword-group-select" id="arsType" onchange="msg_update_select(this.value)">
												<option value="">请选择消息类型</option>
												<option value="1" <c:if test="${arsType == '1' or arsType == 1 }"> selected = "selected"</c:if>>文字</option>
												<option value="2" <c:if test="${arsType == '2' or arsType == 2 }"> selected = "selected"</c:if>>图片</option>
												<option value="3" <c:if test="${arsType == '3' or arsType == 3 }"> selected = "selected"</c:if>>图文消息</option>
											</select>
										</td>
									</tr>
	 							</tbody>
							</table>
							<table id="1" class="keyword-add-msg_tuwen<c:if test="${arsType != '1' or arsType != 1 }"> msg_display</c:if>" data-id="1" style="background-color:F7F7F7;">
								<tbody>
 									<tr>
	 									<td style="width:7%"></td>
										<td style="padding-top:20px;padding-bottom: 20px;">
											<textarea id="arsTitle_text" style="height: 60px;width: 100%;border-radius: 5px;">${list.get(0).ARS_TITLE }</textarea>
										</td>
										<td style="width:7%"></td>
									</tr>
  	 							</tbody>
							</table>
							<table id="2" class="keyword-add-msg_tuwen<c:if test="${arsType != '2' or arsType != 2 }"> msg_display</c:if>" data-id="2" style="background-color:F7F7F7;">
								<tbody>
 									<tr>
	 									<td style="width:7%"></td>
 										<td style="padding-top:20px;padding-bottom: 20px;">
											<input type="file" id="logo_input" name="logo_input" onchange="uploadImagesMsg(this)" style="display:none"/> 
											<input type="hidden" id="arsImage" value="${list.get(0).ARS_IMAGE }"/>
 											<div type="button" class="file_button" id="image_thu">
												<!-- <div onclick="logo_input.click()" class="file_select">选择</div>
												<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div> -->
												<img onclick="logo_input.click()" style="width:50%;cursor:pointer;height:100%" alt="" src="${list.get(0).ARS_IMAGE }">  
											</div>
 										</td>
										<td style="width:7%">
										</td>
									</tr>
  	 							</tbody>
							</table>
							<input type="file" id="newsPicId" name="newsPicId" onchange="uploadNewsPic(this)" style="display:none"/>
							<input type="hidden" id="basePath" value="${basePath}"/>
							<input type="hidden" id="newsFeedNum" value="${list.size()}"/>
							<table id="3" class="keyword-add-msg_tuwen<c:if test="${arsType != '3' or arsType != 3 }"> msg_display</c:if>" data-id="3" style="background-color:F7F7F7;" >
								<c:forEach items="${list }" var="list" varStatus="status">
									<tbody id="newsFeed${status.index }">
		 								<tr>
		 									<td style="width:7%"></td>
	 										<td style="padding-top:20px;padding-bottom: 20px;width:31px;">标题:</td>
											<td style="padding-top:20px;">
												<input type="text" value="${list.ARS_TITLE }" data-id="10000" id="arsTitle_newsPic" name="arsTitle_newsPic"/>
											</td>
											<td style="width:7%"></td>
										</tr>
										<tr>
		 									<td style="width:7%"></td>
	 										<td style="padding-top:20px;vertical-align: top;width:31px;">图片:</td>
											<td style="padding-top:20px;" >
												<input type="hidden" id="arsImage_${status.index }" value="${list.ARS_IMAGE }" data-id="10000" name="arsImage"/>
	 											<div type="button" class="file_button" id="image_thu_${status.index }">
													<%-- <div onclick="imageSelect('${status.index }')" class="file_select">选择</div>
													<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>   --%>
													<img onclick="imageSelect(${status.index })" style="cursor:pointer;width:50%;height:100%" alt="" src="${list.ARS_IMAGE }">
												</div>
	 										</td>
											<td style="width:7%"></td>
										</tr>
	  									<tr>
		 									<td style="width:7%"></td>
	 										<td style="padding-top:20px;vertical-align: top;width:31px;">描述:</td>
											<td style="padding-top:20px;">
												<textarea id="arsContent10000" name="arsContent" data-id="10000" style="height: 60px;width: 100%;border-radius: 5px;">${list.ARS_CONTENT }</textarea>
											</td>
											<td style="width:7%"></td>
										</tr>
										<tr>
		 									<td style="width:7%;padding-bottom: 20px;"></td>
	 										<td style="padding-top:20px;padding-bottom: 20px;width:31px;">URL:</td>
											<td style="padding-top:20px;padding-bottom: 20px;">
												<input type="text" value="${list.ARS_URL }" name="arsUrl" data-id="10000" id="arsUrl"/>
											</td>
											<td style="width:7%;padding-bottom: 20px;"></td>
										</tr>
										<tr>
											<td colspan="2"></td>
	 	 									<td style="text-align: right;padding-bottom: 20px;">
	 	 										<span style="padding-right: 20px;cursor: pointer;" onclick="newsFeedAdd()">
	 	 											<img alt="" src="/wxi/image/dkfManager/icon_add.png">
	 	 										</span>
	 	 										<span style="cursor: pointer;" onclick="newsFeedDelete(${status.index })">
	 	 											<img alt="" src="/wxi/image/dkfManager/icon_delete.png">
	 	 										</span>
	 	 									</td>
	 	 									<td style="width:7%;"></td>
	 	 									 
	 	 								</tr>
 	 								</tbody>
									
								</c:forEach>
 								
   							</table>
					    </div>
	     			</div>
				</div>
 			</div>
 			<div class="keyword-add-submit" onclick="keyword_update_alert()">
 				<div>保存</div>
 			</div>
 		</div>
	</div>
</div>
</body>
</html>