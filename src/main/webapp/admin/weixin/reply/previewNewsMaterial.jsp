<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor.css" /> 
<title></title>
<style>
	.media_preview_area {
	float: left;
	display: table-cell;
	overflow: hidden;
	margin-right: 13px;
	margin-bottom: 20px;
	width: 250px;
	border: 1px solid #e7e7eb;
	background-color: #fff;
	color: #666;
	vertical-align: top;
	word-wrap: break-word;
	word-break: break-all;
	margin-left:10px;
}

.appmsg {
	min-height: 180px;
}

.appmsg_content {
	position: relative;
	border-bottom-width: 1px;
}

.appmsg_content .appmsg_item {
	position: relative;
	padding: 20px 14px;
	border-top: 1px solid #e7e7eb;
}

.appmsg_item:after {
	clear: both;
	display: block;
	height: 0;
	content: "\200B";
}

.appmsg_item .cover_appmsg_item {
	position: relative;
}

.appmsg_item .cover_appmsg_item .appmsg_title {
	position: absolute;
	bottom: 0;
	left: 1px;
	margin: 0;
	width: 220px;
	background: rgba(0,0,0,0.6)!important;
	pdding: 0;
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#99000000',endcolorstr = '#99000000');
}

.cover_appmsg_item .appmsg_title a {
	padding: 0 8px;
	color: #fff;
}

.appmsg_thumb.default {
	display: block;
	background-color: #ececec;
	color: #c0c0c0;
	text-align: center;
	font-weight: 400;
	font-style: normal;
	font-size: 16px;
	line-height: 160px;
}

.appmsg_thumb_wrp {
	overflow: hidden;
	height: 160px;
}

.appmsg_item .appmsg_title {
	overflow: hidden;
	margin-top: 14px;
	max-height: 48px;
	line-height: 24px;
}

.appmsg_item .appmsg_thumb_wrp .appmsg_thumb.default {
	width: 240px;
	height: 160px;
	font-size: 16px;
	line-height: 160px;
}

.appmsg_item .appmsg_thumb.default {
	font-size: 14px;
	line-height: 78px;
}

.editing .appmsg_thumb.default {
	display: block;
}

.editing .appmsg_thumb {
	display: none;
}

.appmsg_item .appmsg_thumb {
	float: right;
	margin-left: 14px;
	width: 78px;
	height: 78px;
}

.appmsg_item .appmsg_title {
	overflow: hidden;
	margin-top: 14px;
	max-height: 48px;
	line-height: 24px;
}

.appmsg_title a {
	display: block;
	color: #666;
}

.appmsg_item .appmsg_edit_mask {
	line-height: 118px;
}

.appmsg_edit_mask {
	position: absolute;
	top: 0;
	left: 0;
	display: none;
	width: 100%;
	height: 100%;
	background: rgba(229,229,229,0.85)!important;
	text-align: center;
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#d9e5e5e5',endcolorstr = '#d9e5e5e5');
}

.create_access_primary {
	display: block;
	margin-right: 10px;
	margin-bottom: 20px;
	margin-left: 10px;
	border: 2px dotted #d9dadc;
	text-align: center;
	font-size: 15px;
	line-height: 60px;
}

.create_access_primary:hover {
	border-color: #b3b3b3;
}

.media_edit_area {
	float: left;
	  /* display: table-cell; */
	width: 560px;
	vertical-align: top;
}

.media_edit_area:after {
	clear: both;
	display: block;
	visibility: hidden;
	height: 0!important;
	content: " . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ";
	line-height: 0;
}

.app-sidebar {
	position: relative;
	padding-left: 12px;
}

.app-sidebar .inner {
	padding: 12px 10px;
	min-height: 350px;
	min-height: 28px;
	border: 1px solid #e7e7e7;
	border-radius: 5px;
	background: #ffffff;
}
.app-design .app-sidebar {
  position: relative;
  float: left;
  width: 530px;
  margin-left: 30px;
  padding-bottom: 20px;
  font-size: 14px;
}
.app-design .app-preview {
  position: relative;
  float: left;
  width: 350px;
  left: 140px;
  border: 1px solid #e5e5e5;
  background-color: #000;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  background: #fff;
  border-radius: 47px;
  padding-bottom: 20px;
}
.sliderImg {
  width: 300px;
  height: 147px;
  overflow: hidden;
  position: relative;
  margin: 0px auto 18px;
  z-index: 3;
}
/* .app-sidebar .arrow,.app-sidebar .arrow:after {
	position: absolute;
	top: 19px;
	left: 2px;
	width: 0px;
	height: 0px;
	border-color: transparent #d1d1d1 transparent transparent;
	border-style: solid;
	border-width: 8px 10px 8px 0;
} */
.app-design .app-sidebar .arrow, .app-design .app-sidebar .arrow:after {
  left: 2px;
}
.app-sidebar .arrow:after {
	top: -8px;
	left: 1px;
	content: "";
	border-right-color: #fff;
}

.hiddenInputFile,.hiddenListInputFile {
	display: none;
}

.img-preview img,.list-img-preview img {
	vertical-align: bottom;
	width: 100px;
	height: 100px;
}

.selectFormAlbum {
	display: inline-block;
	margin-left: 10px;
	width: 130px;
	height: 30px;
	border: 1px solid #e7e7e7;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.btnArea {
	position: relative;
	text-align: center;
}

.btnArea .btn {
	display: inline-block;
	padding-right: 20px;
	padding-left: 20px;
	height: 30px;
	min-width: 50px;
	border: 2px solid #0e9715;
	border-radius: 20px;
	line-height: 30px;
	cursor: pointer;
}

.btnArea .btn +  .btn {
	margin-left: 20px;
	 
}
</style>
</head>
<body>
	<div  class="media_preview_area"  >
		 <div class="appmsg multi editing">
			<div id="js_appmsg_preview" class="appmsg_content">
				<c:forEach items="${requestScope.newsList}" var="item" varStatus="status">
					<c:choose>
						<c:when test="${status.index eq 0}">
							<div class="js_appmsg_item appmsg_item">
								<div class="cover_appmsg_item">
									<h4 class="appmsg_title">
										<a href="javascript:void(0);" onclick="return false;" target="_blank">${item.MTITLE }</a>
									</h4>
								 	<div class="appmsg_thumb_wrp">
								 	   <img class="js_appmsg_thumb appmsg_thumb" style="height:160px ; width:290px; display: block;"  src="${item.FILE_URL }">
			            						 	<i class="appmsg_thumb default" style="display: none;"><ui:i18n key="封面图片"/></i>
								 	</div>
								 	<div class="appmsg_edit_mask" style="z-index: 3">
						                <a onclick="return false;" class="icon18_common edit_gray js_edit" data-id="${status.index}" href="javascript:;"><ui:i18n key="编辑"/></a>
						            </div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="js_appmsg_item appmsg_item">
						 		 <img class="js_appmsg_thumb appmsg_thumb"  style="display: block;" src="${item.FILE_URL }">
							    <i class="appmsg_thumb default" style="display: none;"><ui:i18n key="缩略图"/></i>
							    <h4 class="appmsg_title"><a onclick="return false;" href="javascript:void(0);" target="_blank">${item.MTITLE }</a></h4>
							    <div class="appmsg_edit_mask">
							        <a class="icon18_common edit_gray js_edit" data-id="${status.index}" onclick="return false;" href="javascript:void(0);"><ui:i18n key="编辑"/></a>
							       <%--   <a class="icon18_common del_gray js_del" data-id="${status.index}" onclick="return false;" href="javascript:void(0);">删除</a> --%>
							    </div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>