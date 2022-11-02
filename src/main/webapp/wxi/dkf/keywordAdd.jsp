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
				 		<span><a href="#" class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
 	 		<div class="seat-add-list-div">
  				<div class="seat-add-head-img">
  					<div class="tabs_title">
			 			<a href="#tab_dkf"  class="tab-link active">多客服</a> &nbsp;&nbsp;
			 			<a href="#tab_ars"  class="tab-link">ARS管理</a> 
			 		</div>
	 		 		<div class="tabs">
 					    <div id="tab_dkf" class="tab active">
 							<table class="keyword-add-msg">
	 							<tbody>
	 								<tr>
	 									<td style="padding-top:20px;position: relative;">
											<select class="keyword-group-select" id="keywordGroup_dkf">
												<option value="${groupName }"> ${groupName }</option>
<!-- 												<option value="">请选择分组</option> -->
<%-- 												<c:forEach items="${keywordGroupList }" var="keywordGroupList" varStatus="status"> --%>
<%-- 													<option value="${groupName }"> ${groupName }</option> --%>
<%-- 												</c:forEach> --%>
											</select>
										</td>
									</tr>
									<tr>
 										<td style="padding-top:20px;"><input type="text" id="keyword_dkf" placeholder="请输入多客服关键字" style="width:100%;"/></td>
									</tr>
 	 							</tbody>
							</table>
 					    </div>
					    <!-- Tab 2 -->
					    <div id="tab_ars" class="tab">
					     	<table class="keyword-add-msg">
	 							<tbody>
	 								<tr>
	 									<td style="padding-top:20px;position: relative;">
											<select class="keyword-group-select" id="keywordGroup_ars">
												<option value="${groupName }"> ${groupName }</option>
<!-- 												<option value="">请选择分组</option> -->
<%-- 												<c:forEach items="${keywordGroupList }" var="keywordGroupList" varStatus="status"> --%>
<%-- 													<option value="${groupName }"> ${groupName }</option> --%>
<%-- 												</c:forEach> --%>
 											</select>
										</td>
									</tr>
									<tr>
 										<td style="padding-top:20px;"><input type="text" id="keyword_ars" placeholder="请输入自动应答关键字" style="width:100%;"/></td>
									</tr>
									<tr>
	 									<td style="padding-top:20px;padding-bottom: 20px;">
											<select class="keyword-group-select" id="arsType" onchange="msg_select(this.value)">
												<option value="">请选择消息类型</option>
												<option value="1">文字</option>
												<option value="2">图片</option>
												<option value="3">图文消息</option>
											</select>
										</td>
									</tr>
	 							</tbody>
							</table>
							<table id="1" class="keyword-add-msg_tuwen msg_display" data-id="1" style="background-color:F7F7F7;">
								<tbody>
 									<tr>
	 									<td style="width:7%"></td>
										<td style="padding-top:20px;padding-bottom: 20px;">
											<textarea id="arsTitle_text" style="height: 60px;width: 100%;border-radius: 5px;"></textarea>
										</td>
										<td style="width:7%"></td>
									</tr>
  	 							</tbody>
							</table>
							<table id="2" class="keyword-add-msg_tuwen msg_display" data-id="2" style="background-color:F7F7F7;">
								<tbody>
 									<tr>
	 									<td style="width:7%"></td>
 										<td style="padding-top:20px;padding-bottom: 20px;">
											<input type="file" id="logo_input" name="logo_input" onchange="uploadImagesMsg(this)" style="display:none"/> 
											<input type="hidden" id="arsImage" value=""/>
 											<div type="button" class="file_button" id="image_thu">
												<div onclick="logo_input.click()" class="file_select">选择</div>
												<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>  
											</div>
 										</td>
										<td style="width:7%"></td>
									</tr>
  	 							</tbody>
							</table>
							<table id="3" class="keyword-add-msg_tuwen msg_display" data-id="3" style="background-color:F7F7F7;">
								<tbody>
	 								<tr>
	 									<td style="width:7%"></td>
 										<td style="padding-top:20px;padding-bottom: 20px;">标题:</td>
										<td style="padding-top:20px;">
											<input type="text" value="" data-id="10000" id="arsTitle_newsPic" name="arsTitle_newsPic"/>
										</td>
										<td style="width:7%"></td>
									</tr>
									<tr>
	 									<td style="width:7%"></td>
 										<td style="padding-top:20px;vertical-align: top;">图片:</td>
										<td style="padding-top:20px;" >
											<input type="file" id="newsPicId" name="newsPicId" onchange="uploadNewsPic(this)" style="display:none"/>
											<input type="hidden" id="arsImage_10000" value="" data-id="10000" name="arsImage"/>
 											<input type="hidden" id="basePath" value="${basePath}"/>
 											<div type="button" class="file_button" id="image_thu_10000">
												<div onclick="imageSelect('10000')" class="file_select">选择</div>
												<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>  
											</div>
 										</td>
										<td style="width:7%"></td>
									</tr>
  									<tr>
	 									<td style="width:7%"></td>
 										<td style="padding-top:20px;vertical-align: top;">描述:</td>
										<td style="padding-top:20px;">
											<textarea id="arsContent10000" name="arsContent" data-id="10000" style="height: 60px;width: 100%;border-radius: 5px;"></textarea>
										</td>
										<td style="width:7%"></td>
									</tr>
									<tr>
	 									<td style="width:7%;padding-bottom: 20px;"></td>
 										<td style="padding-top:20px;padding-bottom: 20px;">URL:</td>
										<td style="padding-top:20px;padding-bottom: 20px;">
											<input type="text" value="" name="arsUrl" data-id="10000" id="arsUrl"/>
										</td>
										<td style="width:7%;padding-bottom: 20px;"></td>
									</tr>
									<tr>
										<td colspan="2"></td>
 	 									<td style="text-align: right;padding-bottom: 20px;">
 	 										<span style="padding-right: 20px;cursor: pointer;" onclick="tuwen_add()">
 	 											<img alt="" src="/wxi/image/dkfManager/icon_add.png">
 	 										</span>
 	 										<span style="cursor: pointer;" onclick="tuwen_remove()">
 	 											<img alt="" src="/wxi/image/dkfManager/icon_delete.png">
 	 										</span>
 	 									</td>
 	 									<td style="width:7%;"></td>
 	 									 
 	 								</tr>
 	 							</tbody>
 								<tbody id="tuwen_add_div">
								
 								</tbody>
   							</table>
					    </div>
	     			</div>
				</div>
 			</div>
 			<div class="keyword-add-submit" onclick="keyword_add_alert()">
 				<div>保存</div>
 			</div>
 		</div>
	</div>
</div>
</body>
</html>