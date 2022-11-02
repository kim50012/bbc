<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0L);

	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />
 <!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>无标题文档</title>  
 <link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/common.css" />  
	<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
 
 
<style type="text/css">
	.page-content, .app__content {
		width: 850px; min-height: 420px; zoom: 1;
	}
	.page-content:after, .app__content:after {
		content: ""; display: table; clear: both;
	}
	
	.ui-nav-tab {
		border-bottom: 1px solid #ddd;
		margin-bottom: 15px;
		font-size: 14px;
		font-weight: bold;
		zoom: 1;
	}
	
	.ui-nav-tab:after {
		content: "";
		display: table;
		clear: both;
	}
	
	.ui-nav-tab>li {
		width: 33.33%;
	}
	.ui-nav-tab>li {
		position: relative;
		display: block;
		float: left;
		text-align: center;
		margin-bottom: -1px;
	}
	
	.ui-nav-tab>li>a {
		position: relative;
		display: block;
		padding: 9px 15px;
		margin-right: -1px;
		line-height: 1.42857;
		border: 1px solid #ddd;
		background-color: #f8f8f8;
		color: #333;
	}
	.app-design .app-preview {
		position: relative;
		float: left;
		width: 350px;
		border: 1px solid #e5e5e5;
		border-bottom-width: 0;
		-webkit-box-sizing: border-box;
		-moz-box-sizing: border-box;
		box-sizing: border-box;
		background: #fff;
		border-radius: 18px 18px 0 0;
	}
	
	.app-design .app-preview .app-header {
		height: 70px;
		background: url("/admin/images/widget/iphone_head.png") no-repeat center center;
	}
	.app-design .app-preview .app-entry {
		width: 320px;
		margin: 0 auto;
		padding-bottom: 11px;
		min-height: 200px;
		border: 1px solid #c5c5c5;
		background: #f9f9f9;
	}
	
	.app-design .app-preview .app-config .app-field {
		cursor: pointer;
		background-color: transparent;
	}
	.app-design .app-preview .app-field {
		position: relative;
		cursor: move;
		-webkit-user-select: none;
	}
	
	.goods-details-block {
		padding: 30px 0;
		background: #e5e5e5;
		text-align: center;
		color: #666;
	}
	
	.goods-details-block h4 {
		margin: 0;
		font-size: 16px;
		line-height: 24px;
	}
	
	.goods-details-block p {
		margin: 0;
		font-size: 14px;
		line-height: 24px;
	}
	
	.app-design .app-preview .app-config .app-field.editing {
background-color: transparent;
}
.app-design .app-preview .app-config .app-field {
cursor: pointer;
background-color: transparent;
}
.app-design .app-preview .app-field {
position: relative;
cursor: move;
-webkit-user-select: none;
}

.app-design .app-preview .app-field .control-group {
margin: 0;
width: 100%;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
min-height: 30px;
}
.control-group {
margin-bottom: 10px;
}

.goods-details-block {
padding: 30px 0;
background: #e5e5e5;
text-align: center;
color: #666;
}

.goods-details-block h4 {
margin: 0;
font-size: 16px;
line-height: 24px;
}

.goods-details-block p {
margin: 0;
font-size: 14px;
line-height: 24px;
}

.app-design .app-preview .app-field.editing .actions {
display: inline-block;
}
.app-design .app-preview .actions {
position: absolute;
display: none;
left: 0;
bottom: 0;
height: 100%;
width: 320px;
border: 2px dashed rgba(255, 0, 0, 0.5);
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
z-index: 2;
}

.app-design .app-preview .actions .actions-wrap {
position: absolute;
bottom: 0;
right: 0;
}

.app-design .app-preview .actions span {
display: inline-block;
background-color: rgba(0, 0, 0, 0.3);
color: #fff;
padding: 0 5px;
margin-left: 1px;
font-size: 12px;
}

.app-design .app-preview .app-add-field {
position: relative;
left: -1px;
top: -1px;
border: 1px solid #ddd;
}
.app-design .app-add-field {
position: relative;
padding: 0 14px 4px 14px;
background: #f8f8f8;
width: 350px;
margin: 0 auto;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
}

.app-design .app-add-field h4 {
text-align: center;
font-size: 14px;
line-height: 40px;
font-weight: bold;
}
.app-design .app-add-field ul {
color: #333;
font-size: 12px;
margin-left: -5px;
zoom: 1;
}

.app-design .app-add-field ul:after {
content: "";
display: table;
clear: both;
}

.app-design .app-add-field li {
float: left;
display: table;
margin: 0 0 10px 5px;
background: #fff;
}

.app-design .app-add-field li a {
display: table-cell;
width: 60px;
height: 40px;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
border: 1px solid #d1d1d1;
line-height: 14px;
text-align: center;
vertical-align: middle;
cursor: pointer;
}

.app-design .app-actions {
position: fixed;
bottom: 0;
width: 850px;
padding-top: 20px;
clear: both;
text-align: center;
z-index: 2;
}

.goods-edit-area .app-actions .form-actions {
padding: 10px;
border-top: none;
background-color: #ffc;
margin: 0;
}
.app-design .app-actions .form-actions {
padding: 10px;
background-color: rgba(255, 254, 220, 0.8);
margin: 0;
}
.form-actions {
padding: 19px 20px 20px;
margin-top: 20px;
margin-bottom: 20px;
background-color: #f5f5f5;
border-top: 1px solid #e5e5e5;
}
.text-center {
text-align: center;
}

.form-actions:before, .form-actions:after {
display: table;
line-height: 0;
content: "";
}
.form-actions:after {
clear: both;
}

.form-actions .btn {
margin-right: 6px;
}
.btn:first-child {
}
button.btn, input[type="submit"].btn {
}
.btn {
font-size: 12px;
}
.btn {
display: inline-block;
padding: 4px 12px;
margin-bottom: 0;
font-size: 14px;
line-height: 20px;
color: #333333;
text-align: center;
vertical-align: middle;
cursor: pointer;
background-color: #f8f8f8;
border: 1px solid #ddd;
-webkit-border-radius: 2px;
-moz-border-radius: 2px;
border-radius: 2px;
}
input, button, select, textarea {
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
label, input, button, select, textarea {
font-size: 14px;
font-weight: normal;
line-height: 20px;
}
label, select, button, input[type="button"], input[type="reset"], input[type="submit"], input[type="radio"], input[type="checkbox"] {
cursor: pointer;
}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
cursor: pointer;
-webkit-appearance: button;
}
button, input {
line-height: normal;
}
button, input, select, textarea {
margin: 0;
font-size: 100%;
vertical-align: middle;
}
input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
padding: 1px 6px;
}
input[type="button" i], input[type="submit" i], input[type="reset" i], input[type="file" i]::-webkit-file-upload-button, button {
align-items: flex-start;
text-align: center;
cursor: default;
color: buttontext;
padding: 2px 6px 3px;
border: 2px outset buttonface;
border-image-source: initial;
border-image-slice: initial;
border-image-width: initial;
border-image-outset: initial;
border-image-repeat: initial;
background-color: buttonface;
box-sizing: border-box;
}
input, textarea, keygen, select, button {
margin: 0em;
font: -webkit-small-control;
color: initial;
letter-spacing: normal;
word-spacing: normal;
text-transform: none;
text-indent: 0px;
text-shadow: none;
display: inline-block;
text-align: start;
}
input, textarea, keygen, select, button, meter, progress {
-webkit-writing-mode: horizontal-tb;
}
button {
-webkit-appearance: button;
}
.text-center {
text-align: center;
}

button.btn, input[type="submit"].btn {
}
.form-actions .btn {
margin-right: 6px;
}
input[type="file"], input[type="image"], input[type="submit"], input[type="reset"], input[type="button"], input[type="radio"], input[type="checkbox"] {
width: auto;
}
label, select, button, input[type="button"], input[type="reset"], input[type="submit"], input[type="radio"], input[type="checkbox"] {
cursor: pointer;
}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
cursor: pointer;
-webkit-appearance: button;
}
.btn {
font-size: 12px;
}
.btn-primary {
color: #ffffff;
background-color: #0077dd;
border-color: #006cc9;
}
.btn {
display: inline-block;
padding: 4px 12px;
margin-bottom: 0;
font-size: 14px;
line-height: 20px;
color: #333333;
text-align: center;
vertical-align: middle;
cursor: pointer;
background-color: #f8f8f8;
border: 1px solid #ddd;
-webkit-border-radius: 2px;
-moz-border-radius: 2px;
border-radius: 2px;
}
input, textarea {
font-size: 12px;
font-family: Helvetica,STHeiti,"Microsoft YaHei",Verdana,Arial,Tahoma,sans-serif;
}
input, textarea, .uneditable-input {
margin-left: 0;
}
input, textarea, .uneditable-input {
width: 206px;
}
input, button, select, textarea {
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}
label, input, button, select, textarea {
font-size: 14px;
font-weight: normal;
line-height: 20px;
}
button, input {
line-height: normal;
}
button, input, select, textarea {
margin: 0;
font-size: 100%;
vertical-align: middle;
}

input, textarea, keygen, select, button, meter, progress {
-webkit-writing-mode: horizontal-tb;
}


.app-design .app-preview .app-fields .app-field:last-child {
border-bottom: none;
}
.app-design .app-preview .app-fields .app-field {
position: relative;
}
.app-design .app-preview .app-field {
position: relative;
cursor: move;
-webkit-user-select: none;
}

.custom-nav, .custom-link {
list-style: none;
margin: 0;
padding: 0;
}
.custom-nav, .custom-link {
list-style: none;
margin: 0;
padding: 0;
}
.app-design .app-preview .app-fields .app-field:last-child .component-border {
border-bottom: 0 none;
}
.app-design .app-preview .app-fields .component-border {
display: none;
position: absolute;
top: 0;
left: 0;
height: 100%;
width: 100%;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
border-bottom: 1px dashed #CCC;
}

.custom-nav li:first-child, .custom-link li:first-child {
background: url("/admin/images/wap/bottom_line.png") left top no-repeat;
background-size: 100% 1px;
background-position: left bottom;
}
.custom-nav li, .custom-link li {
height: 44px;
background: url("/v2/image/wap/bottom_line.png") left top no-repeat;
background-size: 100% 1px;
background-position: left bottom;
margin: 0 10px;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
}

.custom-nav a, .custom-link a {
display: block;
height: 100%;
color: #333;
line-height: 44px;
font-size: 14px;
font-weight: 700;
}

.custom-nav-title {
overflow: hidden;
display: inline-block;
width: 227px;
white-space: nowrap;
text-overflow: ellipsis;
}

.custom-nav a, .custom-link a {
display: block;
height: 100%;
color: #333;
line-height: 44px;
font-size: 14px;
font-weight: 700;
}

.custom-nav .right-arrow, .custom-link .right-arrow {
padding-right: 0;
}
.right-arrow {
padding-right: 15px;
background: url("/admin/images/wap/arrow.png") no-repeat scroll 0 0;
width: 15px;
height: 15px;
margin-top: 15px;
}
.pull-right {
float: right;
}
</style>
<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

function ShowMenu(obj,n){
	 var Nav = obj.parentNode;  
	 var BName = Nav.getElementsByTagName("ol");  
	 for(var i=0; i<BName.length; i++){
		 if(i!=n){
			 //BName[i].className = "no";
		 }
	 }
	 if($(BName[n]).hasClass('no')){
		$(BName[n]).removeClass('no');
	 }else{
		$(BName[n]).addClass('no');
	 }

	 if($(obj).hasClass('selected')){
		$(obj).removeClass('selected');
		$(obj).find('.menu-icon').removeClass('icon-minus').addClass('icon-plus');
	 }else{
	    $(obj).addClass('selected')
		$(obj).find('.menu-icon').removeClass('icon-plus').addClass('icon-minus');
	 }
}
</script>
</head>
<body>
	<jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType"/> 
	</jsp:include>
	<!-- ▼ Main container --> 
        <div class="container">
        	<!-- ▼ Left Menu  --> 
        	<jsp:include page="/admin/inc/menuleft.jsp">
				<jsp:param value="${topMenuType}" name="topMenuType"/> 
				<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1"/> 
				<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2"/> 
			</jsp:include>
		    <!-- ▲ Left Menu  -->
		    
		    
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content">
				<div class="app-init-container">
               		<div id="app-region" class="app__content" >
                       	<div class="goods-edit-area">
                       		<ul class="ui-nav-tab">
							    <li data-next-step="1" class="js-switch-step js-step-1"><a href="javascript:;">1.选择商品品类</a></li>
							    <li data-next-step="2" class="js-switch-step js-step-2"><a href="javascript:;">2.编辑基本信息</a></li>
							    <li data-next-step="3" class="js-switch-step js-step-3 active"><a href="javascript:;">3.编辑商品详情</a></li>
							</ul>
							<!-- --- -->
							<div id="step-content-region">
								<div class="app-design clearfix">
									<div class="app-preview">
							    		<div class="app-header"></div>
							   			 <div class="app-entry">
							        		<div class="app-config ">
							            		<div class="app-field" style="cursor: default;">
							                		<h1><span></span></h1>
									                <div class="goods-details-block">
									                    <h4>基本信息区</h4>
									                    <p>固定样式，显示商品主图、价格等信息</p>
									                </div>
							            		</div>
							            		<div class="js-config-region">
							            			<div class="app-field clearfix editing">
							            				<div class="control-group">
													        <div class="goods-details-block" style="background: #fff;">
													            <h4>商品详情区</h4>
													            <p>点击进行编辑</p>
													        </div>
														</div>
														<div class="actions">
														    <div class="actions-wrap">
														        <span class="action edit">编辑</span>
														    </div>
														</div>
													</div>
													
													<!-- -->
													<div class="app-field clearfix editing"><div class="control-group">
    
    <ul class="custom-nav clearfix">
            <li>
        <a class="clearfix" href="javascript: void(0);" target="_blank">
            <span class="custom-nav-title">点此编辑第1条『关联链接』</span>
                            <i class="pull-right right-arrow"></i>
                    </a>
    </li>
            <li>
        <a class="clearfix" href="javascript: void(0);" target="_blank">
            <span class="custom-nav-title">点此编辑第2条『关联链接』</span>
                            <i class="pull-right right-arrow"></i>
                    </a>
    </li>
            <li>
        <a class="clearfix" href="javascript: void(0);" target="_blank">
            <span class="custom-nav-title">点此编辑第n条『关联链接』</span>
                            <i class="pull-right right-arrow"></i>
                    </a>
    </li>
    </ul>
    
    <ul class="custom-link clearfix"></ul>
    <div class="component-border"></div>
</div>
<div class="actions">
    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>
</div>
<div class="sort">
    <i class="sort-handler"></i>
</div>
</div>
											<!--		 -->	
													
												</div>
							        		</div>
							        		<div class="app-fields js-fields-region">
							        			<div class="app-fields ui-sortable">
							        			</div>
							        		</div>
							    		</div>
							    		<div class="js-add-region">
							    			<div>
							    				<div class="app-add-field">
							    					<h4>添加内容</h4>
												    <ul>
												        <li><a class="js-new-field" data-field-type="rich_text">富文本</a></li>
												        <li><a class="js-new-field" data-field-type="goods">商品</a></li>
												        <li><a class="js-new-field" data-field-type="goods_list">商品<br>列表</a></li>
												        <li><a class="js-new-field" data-field-type="image_ad">图片<br>广告</a> </li>
												        <li><a class="js-new-field" data-field-type="cube2">魔方</a></li>
												        <li><a class="js-new-field" data-field-type="title">标题</a></li>
												        <li><a class="js-new-field" data-field-type="text_nav">文本<br>导航</a></li>
												        <li><a class="js-new-field" data-field-type="nav">图片<br>导航</a></li>
												        <li><a class="js-new-field" data-field-type="link">关联<br>链接</a></li>
												        <li><a class="js-new-field" data-field-type="search">商品<br>搜索</a></li>
												        <li><a class="js-new-field" data-field-type="showcase">橱窗</a></li>
												        <li><a class="js-new-field" data-field-type="line">辅助线</a></li>
												        <li><a class="js-new-field" data-field-type="white">辅助<br>空白</a></li>
												        <li><a class="js-new-field" data-field-type="component">自定义<br>模块</a></li>
												    </ul>
												</div>
											</div>
										</div>
									</div>
									
									<div class="app-actions" style="bottom: 0px;">
									    <div class="form-actions text-center">
									        <button class="btn js-switch-step" data-next-step="2">上一步</button>
									        <input class="btn btn-primary js-btn-load" type="submit" value="上架" data-loading-text="上架...">
									        <input class="btn js-btn-unload" type="submit" value="下架" data-loading-text="下架...">
									        <input class="btn js-btn-preview" type="submit" value="预览" data-loading-text="预览效果...">
									    </div>
									</div>
								</div>
							</div>
							<!-- --- -->
							
						</div>
             		</div>
                </div>                
			</div> 
            <!-- ▲ detali content -->
        </div>

		<!-- ▲ Main container -->
		  <!-- ▼ Main footer -->
        <footer class="ui-footer"> 
			<div class="ui-footer-inner clearfix">
			底部（footer） 
			</div>
		</footer>
		<!-- ▲  Main footer -->

</body>
</html>