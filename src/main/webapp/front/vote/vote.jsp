<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://www.waremec.com/taglib/ui" %>
<% 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0L);
	
	if(request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control","no-cache");
	
	String path = request.getContextPath();
	String basePath = "";
	if(request.getServerPort() == 80){
		
	 basePath = request.getScheme()+"://"+request.getServerName()+ "/";
	}else{
		
	 basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	}
	
	long now = System.currentTimeMillis();
	String strCurrentTime = String.valueOf(now);
	
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>${requestScope.reVoteHeader.VOTE_NM }</title>

<style type="text/css">
.promotion-div {
	width: 92%;
	background-color: #ffffff;
	position: relative;
	text-align: center;
	display: inline-block;
	margin-left: 4%;
}

.promotion-div .title-div-top {
	margin-top: 3px;
	text-align: left;
}

.promotion-div .title-div-top .title-p-vote {
	font-size: 22px;
	color: #313131;
}

.promotion-div .title-div-top .date-p-vote {
	font-size: 16px;
	color: #696969;
	margin-top: 5px;
	margin-bottom: 10px;
}

.promotion-div .title-div-top .desc-p-vote {
	font-size: 16px;
	color: #313131;
	line-height: 20px;
}

html {
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%
}

body {
	line-height: 1.6;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 16px
}

body,h1,h2,h3,h4,h5,p,ul,ol,dl,dd,fieldset,textarea {
	margin: 0
}

fieldset,legend,textarea,input,button {
	padding: 0
}

button,input,select,textarea {
	font-family: inherit;
	font-size: 100%;
	margin: 0;
	*font-family: "Helvetica Neue", Helvetica, Arial, sans-serif
}

ul,ol {
	padding-left: 0;
	list-style-type: none
}

a img,fieldset {
	border: 0
}

a {
	text-decoration: none
}

.btn {
	display: block;
	margin-left: auto;
	margin-right: auto;
	padding-left: 14px;
	padding-right: 14px;
	font-size: 18px;
	text-align: center;
	text-decoration: none;
	overflow: visible;
	height: 42px;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	color: #fff;
	line-height: 2.3333333333333335;
	-webkit-tap-highlight-color: rgba(255, 255, 255, 0)
}

.btn.btn_inline {
	display: inline-block
}

.btn_default {
	background-color: #d1d1d1
}

.btn_default:not (.btn_disabled ):visited {
	color: #fff
}

.btn_default:not (.btn_disabled ):active {
	color: rgba(255, 255, 255, 0.4);
	background-color: #a7a7a7
}

.btn_primary {
	background-color: #04be02
}

.btn_primary:not (.btn_disabled ):visited {
	color: #fff
}

.btn_primary:not (.btn_disabled ):active {
	color: rgba(255, 255, 255, 0.4);
	background-color: #039702
}

.btn_warn {
	background-color: #ef4f4f
}

.btn_warn:not (.btn_disabled ):visited {
	color: #fff
}

.btn_warn:not (.btn_disabled ):active {
	color: rgba(255, 255, 255, 0.4);
	background-color: #c13e3e
}

.btn.btn_mini {
	height: 25px;
	line-height: 1.7857142857142858;
	font-size: 14px
}

button.btn,input.btn {
	width: 100%;
	border: 0;
	outline: 0;
	-webkit-appearance: none
}

button.btn:focus,input.btn:focus {
	outline: 0
}

button.btn_inline,input.btn_inline {
	width: auto
}

.btn_disabled {
	color: rgba(255, 255, 255, 0.6)
}

.btn+.btn {
	margin-top: 10px
}

.btn.btn_inline+.btn.btn_inline {
	margin-top: auto;
	margin-left: 10px
}

.btn_area {
	margin-left: -5px;
	margin-right: -5px;
	font-size: 0
}

.btn_area.btn_area_inline {
	margin-left: auto;
	margin-right: auto;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex
}

.btn_area.btn_area_inline .btn {
	margin-top: auto;
	margin-right: 10px;
	width: 100%;
	-webkit-box-flex: 1;
	-webkit-flex: 1;
	-moz-box-flex: 1;
	-ms-flex: 1;
	box-flex: 1;
	flex: 1;
	display: inline-block \9;
	width: 48% \9;
	margin-left: 1% \9;
	margin-right: 1% \9
}

.btn_area.btn_area_inline .btn:last-child {
	margin-right: 0
}

span.btn button {
	display: block;
	width: 100%;
	height: 100%;
	background-color: transparent;
	border: 0;
	outline: 0;
	color: #fff
}

span.btn button:active {
	color: rgba(255, 255, 255, 0.4)
}

span.btn.btn_loading button,span.btn.btn_disabled button {
	color: #fff
}

.frm_radio {
	position: absolute;
	left: -1599em
}

.frm_radio_label {
	position: relative;
	padding-left: 20px
}

.frm_radio_label:before {
	position: absolute;
	top: 50%;
	left: 0;
	margin-top: -7px;
	content: " ";
	background:
		url("/mmbizwap/zh_CN/htmledition/style/page/page_mp_vote_z22e62a.png")
		0 0 no-repeat;
	width: 15px;
	height: 15px;
	vertical-align: middle;
	display: inline-block
}

.frm_radio:checked+.frm_radio_label:before {
	background:
		url("/mmbizwap/zh_CN/htmledition/style/page/page_mp_vote_z22e62a.png")
		0 -25px no-repeat;
	width: 15px;
	height: 15px;
	vertical-align: middle;
	display: inline-block
}

@media only screen and (-webkit-min-device-pixel-ratio:2) {
	.frm_radio_label:before {
		background: transparent
			url(/mmbizwap/zh_CN/htmledition/common/images/icon/form/_icon15_radio_sprite.2x22e62a.png)
			no-repeat 0 0;
		-webkit-background-size: 15px auto;
		background-size: 15px auto
	}
	.frm_radio:checked+.frm_radio_label:before {
		background: transparent
			url(/mmbizwap/zh_CN/htmledition/common/images/icon/form/_icon15_radio_sprite.2x22e62a.png)
			no-repeat 0 0;
		background-position: 0 -20px;
		-webkit-background-size: 15px auto;
		background-size: 15px auto
	}
}

.checkbox_list {
	overflow: hidden;
	background-color: #fff
}

.checkbox_list .checkbox:before {
	content: " ";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 1px;
	border-top: 1px solid #e1e1df;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(0.5);
	transform: scaleY(0.5);
	top: auto;
	bottom: 0;
	left: 15px
}

.checkbox_list .checkbox:last-child:before {
	border-top: 0 none
}

.checkbox {
	overflow: hidden;
	position: relative;
	line-height: 26px
}

.checkbox .frm_checkbox_label {
	display: block;
	line-height: 36px;
	padding-left: 40px;
	margin-top: -1px;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0)
}

.checkbox .frm_checkbox_label:active {
	background-color: rgba(0, 0, 0, 0.1)
}

.checkbox .frm_checkbox_label:before {
	margin-left: 15px
}

.frm_checkbox {
	position: absolute;
	left: -999em
}

.frm_checkbox_label {
	position: relative;
	padding-left: 20px
}

.frm_checkbox_label:before {
	position: absolute;
	top: 50%;
	left: 0;
	margin-top: -6px;
	content: " ";
	background:
		url("/mmbizwap/zh_CN/htmledition/style/page/page_mp_vote_z22e62a.png")
		0 -50px no-repeat;
	width: 13px;
	height: 13px;
	vertical-align: middle;
	display: inline-block
}

.frm_checkbox:checked+.frm_checkbox_label:before {
	background:
		url("/mmbizwap/zh_CN/htmledition/style/page/page_mp_vote_z22e62a.png")
		0 -73px no-repeat;
	width: 13px;
	height: 13px;
	vertical-align: middle;
	display: inline-block
}

@media only screen and (-webkit-min-device-pixel-ratio:2) {
	.frm_checkbox_label:before {
		background: transparent
			url(/mmbizwap/zh_CN/htmledition/common/images/icon/form/_icon13_checkbox_sprite.2x22e62a.png)
			no-repeat 0 0;
		background-position: 0 -18px;
		-webkit-background-size: 13px auto;
		background-size: 13px auto
	}
	.frm_checkbox:checked+.frm_checkbox_label:before {
		background: transparent
			url(/mmbizwap/zh_CN/htmledition/common/images/icon/form/_icon13_checkbox_sprite.2x22e62a.png)
			no-repeat 0 0;
		-webkit-background-size: 13px auto;
		background-size: 13px auto
	}
}

html {
	font-size: 125%
}

body {
	font-size: 14px;
	background-color: transparent;
	font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB",
		"Microsoft YaHei", "寰蒋闆呴粦", Arial, sans-serif
}

.group:after {
	content: ".";
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden
}

.global_tips {
	color: #b2b2b2
}

.vote_form {
	width:92%;
	margin-left:4%;
	position: relative;
	overflow: hidden
}

.vote_form_inner {
	position: relative;
	margin-top: 14px;
	border: 1px solid #eaeaea;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px
}

.vote_form_inner.has_vote .vote_option_list {
	margin-top: 6px
}

.vote_form_inner.has_vote .vote_option {
	line-height: 22px;
	*zoom: 1;
	padding: 0 15px
}

.vote_form_inner.has_vote .vote_option:after {
	content: "\200B";
	display: block;
	height: 0;
	clear: both
}

.vote_form_inner.has_vote .vote_option:after {
	content: ".";
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden
}

.vote_form_inner.has_vote .vote_option:after {
	content: " ";
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 1px;
	border-bottom: 1px solid #e1e1df;
	-webkit-transform-origin: 0 100%;
	transform-origin: 0 100%;
	-webkit-transform: scaleY(0.5);
	transform: scaleY(0.5)
}

.vote_form_inner.has_vote .vote_option:first-child {
	margin-top: 0
}

.vote_form_inner.has_vote .vote_option:last-child:after {
	display: none;
	width: 0;
	background: 0
}

.vote_form_inner.has_vote .vote_option_title:active {
	background-color: transparent
}

.vote_form_inner.has_vote 
	.vote_result {
	display: block
}

.vote_form_inner.has_vote .vote_option_title {
	padding-bottom: 0
}

.vote_form_inner.has_vote .frm_radio_label,.vote_form_inner.has_vote .frm_checkbox_label
	{
	padding-left: 0;
	padding-right: 0;
	float: none
}

.vote_form_inner.has_vote .frm_radio_label:before,.vote_form_inner.has_vote .frm_checkbox_label:before
	{
	display: none
}

.vote_form_inner.has_vote .frm_checkbox:checked+.frm_checkbox_label:before
	{
	display: none
}

.vote_form_inner.has_vote .frm_radio:checked+.frm_radio_label:before {
	display: none
}

.vote_form_inner.has_vote .vote_result {
	padding-left: 0
}

.vote_form_inner.login_failed .vote_box {
	color: #888
}

.vote_form_inner.login_failed .vote_tool_area .btn {
	background-color: #c3c3c3;
	color: #e2e2e2
}

.vote_form_inner.login_failed .vote_option {
	*zoom: 1
}

.vote_form_inner.login_failed .vote_option_list {
	*list-style-position: outside
}

.vote_form_inner.login_failed .vote_option_title {
	*padding-left: 10px
}

.vote_form_inner.login_failed .vote_option_title:active {
	background-color: transparent
}

.vote_form_inner.expired {
	color: #888
}

.vote_form_inner.expired .frm_radio_label:before {
	background: transparent
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARBAMAAADJQ1rJAAAAMFBMVEUAAADb29vZ2dnZ2dnY2NjZ2dnY2NjZ2dnY2NjZ2dna2trZ2dne3t7q6urY2NjY2Ngai/urAAAAD3RSTlMALX298/Dm1bKUjz0fDL7a4LoDAAAAX0lEQVQI12NgYJAqcV/IAAKcQbIXVSeAWMYHGBh4jEFCBtxtGRuYgYKiB/T////EE8jAsIj7PxBs0GJgKOQAsRrEGRh82UCshCsIFkIWoQNhCsxkvglw25BdgHAVAgAAZ0o3CA2PRJ4AAAAASUVORK5CYII=)
		no-repeat 0 0
}

.vote_form_inner.expired .frm_checkbox_label:before {
	background: transparent
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAARAQMAAAABo9W5AAAABlBMVEUAAADY2NjnFMi2AAAAAXRSTlMAQObYZgAAABtJREFUCNdjAIH6/wwMDowQ7P+TEIapBesDAQAVNw+Jv/lWYQAAAABJRU5ErkJggg==)
		no-repeat 0 0
}

.vote_form_inner.expired .vote_option_title:active {
	background-color: transparent
}

.vote_form_ele {
	position: relative;
	padding: 0
}

.vote_form_ele:after {
	content: " ";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 1px;
	border-top: 1px solid #e1e1df;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(0.5);
	transform: scaleY(0.5);
	top: auto;
	bottom: -1px
}

.vote_form_ele.vote_form_ele_last {
	padding-bottom: 10px
}

.vote_form_ele.vote_form_ele_last:after {
	width: 0;
	background: 0
}

.vote_error_tips {
	position: relative;
	font-size: 16px;
	color: #888;
	text-align: center;
	margin-bottom: 14px;
	padding-bottom: 14px;
	padding-top: 14px
}

.vote_error_tips img {
	vertical-align: middle;
	margin-right: 5px;
	width: 25px
}

.vote_error_tips:before {
	content: " ";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 1px;
	border-top: 1px solid #e1e1df;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(0.5);
	transform: scaleY(0.5);
	top: auto;
	bottom: 0
}

.vote_title {
	margin: 25px 0px 5px 25px;
	font-size: 17px;
	line-height: normal;
	font-weight: normal
}

.vote_desc {
	font-size: 16px;
	padding-top: 4px
}

.frm_radio_label,.frm_checkbox_label {
	padding-left: 36px;
	padding-right: 15px
}

.frm_radio_label:before,.frm_checkbox_label:before {
	left: 14px;
	top: 50%;
	margin-top: -9px
}

.vote_option {
	position: relative;
	line-height: 1.6em;
	font-size: 12px
}

.vote_option:first-child:before {
	display: none
}

.vote_option:last-child .vote_option_title .frm_option_word {
	border-bottom: 0
}

.vote_option:last-child:after {
	background: 0
}

.vote_option:after {
	display: block;
	content: " ";
	height: 1px;
	margin-left: 15px;
	background-color: #eaeaea;
	clear: both
}

.vote_option_title {
	display: block;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	/* padding-top: 15px;
	padding-bottom: 15px; */
	font-size: 16px
}
.vote_option_title .frm_option_word{
	height:auto;
	line-height: 26px;
	padding-top:12px;
	padding-bottom:12px;
	position: relative;
}
.vote_option_title .frm_option_word img{
	height:40px;
	display: inline-block;
	position: absolute;
	margin-top:-6px;
	margin-left:-30px;
}

.vote_option_title:active {
	background-color: #f8f7f5
}

.vote_option_title .frm_option_word {
	display: block;
	overflow: hidden;
	*zoom: 1;
	word-break: break-all;
	word-wrap: break-word
}

.vote_option_title:after {
	display: block;
	content: " ";
	clear: both
}

.has_vote .vote_option_title .frm_option_word {
	border: 0
}

.img_container img {
	width: 100%;
	height: 100%;
	display: block
}

.img_container_btm {
	display: none
}

.img_container_label {
	display: block;
	width: 75px;
	height: 75px;
	float: left;
	margin-top: 1px;
	margin-right: 14px
}

.has_vote .vote_form_ele {
	padding-bottom: 10px
}

.has_vote .img_container {
	margin-top: 3px;
	margin-left: 0
}

.has_vote .frm_checkbox_label {
	margin-bottom: .5em
}

.has_vote .vote_option_title {
	position: relative;
	top: -3px
}

.has_vote .vote_option_title .frm_option_word {
	display: table-cell;
	margin-bottom: 0
}

.has_vote .img_container_label {
	display: table-cell;
	width: 40px;
	height: 40px
}

.has_vote .img_container img {
	width: 40px;
	height: 40px;
	display: block
}

.has_vote .img_container_left {
	display: block;
	float: left;
	margin-right: 1em;
	margin-bottom: 0
}

.has_vote .vote_result {
	position: relative;
	padding-right: 7.5em;
	padding-top: 12px;
	padding-bottom: 15px;
	clear: both
}

.has_vote .vote_percent {
	position: absolute;
	top: 4px;
	right: 0
}

.has_vote .vote_number {
	position: absolute;
	top: 4px;
	right: 3.5em
}

.has_vote .img_container_btm {
	display: none
}

.vote_graph {
	display: block;
	background-color: #dedede
}

.vote_result {
	display: none;
	padding-left: 14px;
	white-space: nowrap;
	color: #888;
	text-align: right
}

.vote_result .vote_result_meta {
	display: block;
	vertical-align: top
}

.vote_result .vote_progress {
	display: block;
	background-color: #dedede;
	height: 5px
}

.vote_result .vote_percent {
	width: 3em;
	margin-left: .5em
}

.vote_result .vote_number {
	width: 4em;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal
}

.vote_tool_area {
	position: relative;
	text-align: center;
	font-size: 17px;
	padding: 11px 0
}

.vote_tool_area:before {
	content: " ";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 1px;
	border-top: 1px solid #e1e1df;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(0.5);
	transform: scaleY(0.5)
}

.vote_tool_area .vote_tips {
	color: #888
}

.vote_tool_area .btn {
	height: 2.1rem;
	line-height: 2.1rem;
	padding-left: 45px;
	padding-right: 45px;
	font-size: 17px;
	background: 0;
	color: #04be02
}

.vote_tool_area .btn:active {
	background: 0;
	color: #04be02
}

.vote_tool_area .btn_disabled {
	filter: alpha(opacity = 100);
	-moz-opacity: 1;
	-khtml-opacity: 1;
	opacity: 1;
	font-size: 17px;
	color: #888
}

.vote_tool_area.vote_tool_area_btn {
	padding: 1px 0
}

.vote_frm_top {
	position: relative;
	text-align: center;
	padding: 20px 0;
	font-size: 17px
}

.vote_frm_top:after {
	content: " ";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 1px;
	border-top: 1px solid #e1e1df;
	-webkit-transform-origin: 0 0;
	transform-origin: 0 0;
	-webkit-transform: scaleY(0.5);
	transform: scaleY(0.5);
	top: auto;
	bottom: -1px
}

.frm_checkbox_label:before {
	background: transparent
		url(/front/skin/vote/square_no.png)
		no-repeat 0 0;
	width: 17px;
	height: 17px;
	vertical-align: middle;
	display: inline-block;
	    border: solid;
}

.frm_checkbox:checked+.frm_checkbox_label:before {
	background: transparent
		url(/front/skin/vote/square_selected.png)
		no-repeat 0 0;
	width: 17px;
	height: 17px;
	vertical-align: middle;
	display: inline-block;
	    border: solid;
}

.frm_radio_label:before {
	background: transparent
		url(/front/skin/vote/circle_no.png)
		no-repeat 0 0;
	width: 17px;
	height: 17px;
	vertical-align: middle;
	display: inline-block;
	    border: solid;
}

.frm_radio:checked+.frm_radio_label:before {
	background: transparent
		url(/front/skin/vote/circle_selected.png)
		no-repeat 0 0;
	width: 17px;
	height: 17px;
	vertical-align: middle;
	display: inline-block
}

@media only screen and (-webkit-min-device-pixel-ratio:2) {
	.frm_checkbox_label:before {
		background: transparent
			url(/front/skin/vote/no_square.png)
			no-repeat 0 0;
		-webkit-background-size: 17px auto;
		background-size: 17px auto;
	    border: solid;
	}
	.frm_checkbox:checked+.frm_checkbox_label:before {
		background: transparent
			url(/front/skin/vote/select_square.png)
			no-repeat 0 0;
		-webkit-background-size: 17px auto;
		background-size: 17px auto;
	    border: solid;
	}
	.frm_radio_label:before {
		background: transparent
			url(/front/skin/vote/no_circle.png)
			no-repeat 0 0;
		-webkit-background-size: 17px auto;
		background-size: 17px auto
	}
	.frm_radio:checked+.frm_radio_label:before {
		background: transparent
			url(/front/skin/vote/selected_circle.png)
			no-repeat 0 0;
		-webkit-background-size: 17px auto;
		background-size: 17px auto
	}
	
}
.bottom-div-msg{height:40px;width:100%;line-height: 40px;position: relative;border-bottom:1px solid #eee;color:#696969;margin-top:5px;}
.bottom-div-msg a{float:right;margin-right:4%;margin-bottom:30px;}



/* START follow layer Popup page */
.followLayerPopup {display:none;z-index:100000; position:absolute; top:0; left:0; right:0; bottom:0; background:rgba(0, 0, 0, 0.8); min-height:568px;}
.followLayerPopup img {position:absolute; width:auto; height:20px;cursor:pointer;right:10px;top:10px;}
.followLayerPopup .title {position:absolute; top:10%; left:50%; margin:0 0 0 -140px; height:50px; width:280px; font-size: 20px;box-sizing:border-box;overflow:hidden;text-align: center;color: #ffffff;}
.followLayerPopup .inner {position:absolute; top:10%; left:50%; margin:50px 0 0 -140px; height:445px; width:280px; box-sizing:border-box; background:#434343;-webkit-border-radius: 20px;  -moz-border-radius: 20px;border-radius: 20px;overflow:hidden;}
.followLayerPopup .cont-Title {color: #ffffff;position:relative;width:100%;height:30px;text-align:center;font-size: 16px;padding:3px;top:5px;}
.followLayerPopup .cont-Title .serchMan {position:absolute; width:auto; height:25px;cursor:pointer;top:2px;right:20px;}
.followLayerPopup .cont-Title2 {color: #ffffff;position:relative;width:100%;height:30px;text-align:center;font-size: 12px;padding:3px;top:5px;}
.followLayerPopup .cont-Title2 .wechatId {font-size:16px; left-padding:15px; width:auto; color: #434343; background: url('/front/skin/main/img/icon/wechatidSearch.png') no-repeat 8px 2px #ffffff; background-size: 16px auto;}
.followLayerPopup .follow {color: #ffffff;position:relative;width:80%;left:10%;height:25px;background:#06be04;-webkit-border-radius: 5px;  -moz-border-radius: 5px;border-radius: 5px;text-align:center;font-size: 16px;padding:2px;padding-top:5px;}
.followLayerPopup .inner .cont-Body .shareList img {position:relative;top:50%; left:20%; width:60%;height:auto;cursor:pointer;}
.followLayerPopup .close {position:absolute; bottom:0; right:0; height:30px; line-height:30px; padding:0 10px; color:#4a433b}
/* END follow layer Popup page */


</style>

<script type="text/javascript" src="/front/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">



	$(function(){
		
		indexErr();
		
		$(".btn.btn_inline.btn_primary.btn_disabled").click(function(){
			var questId="";
			var opId="";
			var num=$("#num_quest").val();
			var voteId=$("#voteId").val();
			for(var i=0;i<num;i++){
				var questOneId=$("#quest_id_"+i).val();
				var flag=true;
				$('input[name="select_'+i+'"]:checked').each(function(){  
					opId=opId+','+$(this).val();//向数组中添加元素  
					questId=questId+','+questOneId;
					flag=false;
				});
				if(flag){
					alert("请完善问题！");
					return false;
				}
			}
			opId=opId.substring(1,opId.index);
			questId=questId.substring(1,questId.index);
			//alert(opId+":"+questId+":"+voteId);
			var params={voteId:voteId,opId:opId,questId:questId};
			$.ajax({
				data : params,
				type : "POST",
				url : "/front/vote/voteSelect.htm",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {

					if (res.ret=="success"){
						
						alert("投票成功"+".");
						location.href = "/front/vote/voteResult.htm?voteId="+voteId+"&typeName=你已投票";
					} else {
						if(res.ret=="F"){
							alert("你已投票，不可再次投票.");
							location.href = "/front/vote/voteResult.htm?voteId="+voteId+"&typeName=你已投票";	
						}else{
							alert("请检查信息,重新投票.");							
						}
					}
				},
				error : function(obj, e, msg) {
					
					alert("网络出现故障.");
				}
			});
		});
	});

	function indexErr() {
		<c:if test="${loginFlag eq 0 }">
			fn_followLayerShow();	
			return;
		</c:if>
	}
</script>

</head>
<body>

	<div class="promotion-div">
		<div class="title-div-top">
			<p class="title-p-vote">${requestScope.reVoteHeader.VOTE_NM }</p>
			<p class="date-p-vote">${requestScope.reVoteHeader.VOTE_DT}</p>
			<p class="desc-p-vote">${requestScope.reVoteHeader.voteDesc}</p>
			<div class="img-show-div">
				<img src="${requestScope.reVoteHeader.imgUrl}" style="width:100%;margin-bottom:0px;">
			</div>
			<input type="hidden" value="${requestScope.reVoteHeader.VOTE_ID}" id="voteId"/>
		</div>
	</div>
	<div id="js_form" action="javascript:return false;" class="vote_box form vote_form " style="margin-bottom:40px;">

		<div class="vote_form_inner">


		<c:forEach items="${requestScope.reVoteQlist}" var="itemQ" varStatus="statusQ">
			<input type="hidden" value="${itemQ.QUEST_ID} " id="quest_id_${statusQ.index }"/>
			<c:if test="${statusQ.last}"><input type="hidden" id="num_quest" value="${statusQ.count}"/></c:if>
			<c:choose>
				<c:when test="${itemQ.RADIO_ONLY eq 'Y'}">
					<div class="vote_form_ele <c:if test="${statusQ.last}">vote_form_ele_last</c:if>">
						<h3 class="vote_title" style="vertical-align: top;"><p style="display:inline-block;width:91%;">${statusQ.index+1}. ${itemQ.QUEST_NM}&nbsp;&nbsp;（单选）</p></h3>
						<ul class="vote_option_list ">
							<c:forEach items="${itemQ.subList}" var="itemO" varStatus="statusO">
								<li class="vote_option" style="line-height: auto;"><!-- min-height: 200px -->
									<input class="frm_radio js_vote" type="radio" id="vote_${statusQ.index}_${statusO.index}"  name="select_${statusQ.index}" value="${itemO.OP_ID}"> 
									<label for="vote_${statusQ.index}_${statusO.index}" onclick="" class="frm_radio_label vote_option_title group" style="line-height: auto;"><!-- min-height: 200px -->
										<span class="frm_option_word" style="margin: 25px 0px 5px 25px;overflow: initial;">${itemO.OP_NM} 
											<c:choose>
												<c:when test="${itemO.IMG_ID eq '00000'}">
													
												</c:when>
												<c:otherwise>
<!-- 														<div style="width:40px;display:inline-block;height:14px;"></div> -->
														<div></div>
														<img src="${itemO.IMG_URL}"  style="max-width: 300px;min-height: 200px;height: auto;width: 14rem;position: initial;padding-left: 0.5rem;"/>
												</c:otherwise>
											</c:choose>
										</span>
									</label>
								</li>
							</c:forEach>
		
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="vote_form_ele <c:if test="${statusQ.last}">vote_form_ele_last</c:if>">
						<h3 class="vote_title" style="vertical-align: top;"><p style="display:inline-block;width:91%;">${statusQ.index+1}. ${itemQ.QUEST_NM}&nbsp;&nbsp;（多选）</p></h3>
		
						<ul class="vote_option_list ">
							<c:forEach items="${itemQ.subList}" var="itemO" varStatus="statusO">
								<li class="vote_option" style="line-height: auto;"><!-- min-height: 200px -->
									<input class="frm_checkbox js_vote" type="checkbox" id="vote_${statusQ.index}_${statusO.index}"  name="select_${statusQ.index}" value="${itemO.OP_ID}"> 
									<label for="vote_${statusQ.index}_${statusO.index}" onclick="" class="frm_checkbox_label vote_option_title group" style="line-height: auto;"><!-- min-height: 200px -->
										<span class="frm_option_word" style="margin: 25px 0px 5px 25px;overflow: initial;">${itemO.OP_NM} 
											<c:choose>
												<c:when test="${itemO.IMG_ID eq '00000'}">
													
												</c:when>
												<c:otherwise>
<!-- 														<div style="width:40px;display:inline-block;height:14px;"></div> -->
														<div></div>
														<img src="${itemO.IMG_URL}"  style="max-width: 300px;min-height: 200px;height: auto;width: 14rem;position: initial;padding-left: 0.5rem;"/>
												</c:otherwise>
											</c:choose>
										</span>
									</label>
								</li>
							</c:forEach>
		
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>





			<div class="vote_tool_area vote_tool_area_btn">
				<button id="js_btn" type="submit"
					class="btn btn_inline btn_primary btn_disabled">투표하기</button>
			</div>



		</div>
		<!-- <div class="bottom-div-msg">
			<a>举报</a>
		</div> -->
	</div>
	
	
	<script>

	if(!window.console){
		window.console = {
			dubug : function(){},
			log : function(){},
			info : function(){},
			warn : function(){},
			error : function(){}	  
		} 
	}
  
	var sPopts = {
		  lines: 10, // The number of lines to draw
		  length: 5, // The length of each line
		  width: 4, // The line thickness
		  radius: 10, // The radius of the inner circle
		  corners: 1, // Corner roundness (0..1)
		  rotate: 30, // The rotation offset
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  color: '#000', // #rgb or #rrggbb or array of colors
		  speed: 1.0, // Rounds per second
		  trail: 80, // Afterglow percentage
		  shadow: true, // Whether to render a shadow
		  hwaccel: true, // Whether to use hardware acceleration
		  className: 'spinner', // The CSS class to assign to the spinner
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  top: '50%', // Top position relative to parent
		  left: '50%' // Left position relative to parent
		};

	// Common functions
	function pad(number, length) {
	    var str = '' + number;
	    while (str.length < length) {str = '0' + str;}
	    return str;
	}
	function formatTime(time, ftype) {
	    var day = parseInt(time / 8640000),
	    	hou = parseInt(time / 360000) - (day * 24),
	    	min = parseInt(time / 6000) - (hou * 60) - (day * 1440),
	        sec = parseInt(time / 100) - (min * 60) - (hou * 3600) - (day * 86400),
	        hundredths = pad(time - (sec * 100) - (min * 6000) - (hou * 360000), 2) - (day * 8640000);
	    	//alert(hou);
	    var str_return;
	    if (ftype == 2) {
	    	str_return = 
		   	     '还剩'+(day > 0 ? day+'天' : "")
		    		+(hou > 0 ? pad(hou, 2) : "00") 
		    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
		    		+ ":" + (sec > 0 ? pad(sec, 2) : "00");
	    }
	    else if (ftype == 3) {
	    	str_return = 
		   	     (hou > 0 ? pad(hou, 2) : "00") 
		    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
		    		+ ":" + (sec > 0 ? pad(sec, 2) : "00");
	    }
	    else if (ftype == 4) {
	    	var resTime = new Object();
	    	resTime.day = (day > 0 ? day : "00");
	    	resTime.hour = (hou > 0 ? pad(hou, 2) : "00");
	    	resTime.min = (min > 0 ? pad(min, 2) : "00");
	    	resTime.sec = (sec > 0 ? pad(sec, 2) : "00");
	    	resTime.hundr = (hundredths > 0 ? pad(hundredths, 2) : "00");
	    	str_return = resTime;
// 	    	str_return = 
// 		   	     "{'day':'" + (day > 0 ? day : "00") + "'"
// 		    		+ ", 'hour':'" + (hou > 0 ? pad(hou, 2) : "00") + "'" 
// 		    		+ ", 'min':'" + (min > 0 ? pad(min, 2) : "00") + "'"
// 		    		+ ", 'sec':'" + (sec > 0 ? pad(sec, 2) : "00") + "'"
// 		    		+ ", 'hundr':'" + (hundredths > 0 ? pad(hundredths, 2) : "00") + "'"
// 		    		+ "}";
	    }
	    else {
	    	str_return = 
	    		'还剩'+(day > 0 ? day+'天' : "")
	    		+(hou > 0 ? pad(hou, 2) : "00") 
	    		+ ":" + (min > 0 ? pad(min, 2) : "00") 
	    		+ ":" + (sec > 0 ? pad(sec, 2) : "00") 
	    		+ "." + (hundredths > 0 ? pad(hundredths, 2) : "00");
	    }
	    return str_return;
	}

	function strToJson(str) {
	  eval("var x = " + str + ";");
// 	  return JSON.stringify(x);
	  return JSON.parse(str);
	}

</script>


<script>

function favorites(flag, shopId, goodsId, displayId, way) {
	var params = {
		shopId: shopId,
		goodsId: goodsId,
		displayId: displayId
	};
	if (way == "list") {
		if ($("#img" + goodsId).attr("src") == "/front/skin/main/img/favorites_01.png") {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/removeFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("取消成功");
					} else {
						alert("取消失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#img" + goodsId).attr("src", "/front/skin/main/img/favorites_02.png");
			$("#span" + goodsId).html("未收藏");
		} else {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/addFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("收藏成功");
					} else {
						alert("收藏失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#img" + goodsId).attr("src", "/front/skin/main/img/favorites_01.png");
			$("#span" + goodsId).html("已收藏");
		}
	} else {
		if ($("#gridimg" + goodsId).attr("src") == "/front/skin/main/img/favorites_01.png") {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/removeFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("取消成功");
					} else {
						alert("取消失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#gridimg" + goodsId).attr("src", "/front/skin/main/img/favorites_02.png");
			$("#gridspan" + goodsId).html("未收藏");
		} else {
			$.ajax({
				data: params,
				dataType: "json",
				type: "POST",
				url: "/front/main/addFavorite.htm",
				success: function(data) {
					if (data.status == "S") {
						alert("收藏成功");
					} else {
						alert("收藏失败");
						return false;
					}
				},
				error: function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			$("#gridimg" + goodsId).attr("src", "/front/skin/main/img/favorites_01.png");
			$("#gridspan" + goodsId).html("已收藏");
		}
	}
}
</script>
<script type="text/javascript">
 
/*  function cartCounter(pageId, goodsId, displayId){
	 counter({
		 pageTp : 4,
		 pageId : pageId || '',
		 goodsId : goodsId || '',
		 displayId : displayId || '',
	 });
 } */
 
function counter(obj){
	$.ajax({
		data: {
			shopId : obj.shopId || '${sessionScope.sessionSkin.shopId}',
			pageTp : obj.pageTp || '',
			pageId : obj.pageId || '',
			goodsId : obj.goodsId || '',
			displayId : obj.displayId || ''
		},
		dataType: "json",
		type: "POST",
		url: "/front/counter/counter.htm",
		success: function(data) {
			 
		},
		error: function(a, msg, c) {
			 
		}
	});
}
	counter({
		 pageTp : 33,				//1.VOTE  2.VOTE_LIST：34  3.VOTE_RESULT：35
		 pageId : '' || '',
		 goodsId : '' || '',
		 displayId : '' || ''
	});
</script>

<script type="text/javascript">

function shareQQZone(){
	  var url = 'http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey'
			 + '?url=' + encodeURIComponent(location.href)
			 + '&title=' + encodeURIComponent(document.title) 
			 + '&pics=' + ''
			 + '&summary=' +  '' ;
	  
	 window.open(url,'_blank');
}


function shareSinaBlog(){
	  var url = 'http://service.weibo.com/share/share.php'
			 + '?url=' + encodeURIComponent(location.href)
			 + '&title=' + encodeURIComponent(document.title) 
			 + '&source=' + 'bookmark'
			 + '&appkey=' +  ''
			 + '&pic=' +  ''
			 + '&ralateUid=' +  '' ;
	   
	 window.open(url,'_blank');
}
function shareQQBlog(){
	  var url = ' http://share.v.t.qq.com/index.php'
			 + '?c=' + 'share'
			 + '&a=' + 'index'
			 + '&url=' + encodeURIComponent(location.href)
			 + '&title=' + encodeURIComponent(document.title) 
			 + '&appkey=' + '' //ce15e084124446b9a612a5c29f82f080 
			 + '&site=' + '' // 'www.jiathis.com'
			 + '&pic='  + '';
	   
	 window.open(url,'_blank');
}


function shareDouban(){
	  var url = 'http://www.douban.com/share/service'
	  		 + '?image='
			 + '&href=' + encodeURIComponent(location.href)
			 + '&name=' + encodeURIComponent(document.title) 
			 + '&text=' + encodeURIComponent(document.title) 
	   		  ;
	 window.open(url,'_blank');
  }

function fn_followLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.followLayerPopup').show();
}


function fn_followLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.followLayerPopup').hide();
}

/* function fn_SnsSareLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.snsShareLayerPopup').show();
}


function fn_SnsSareLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.snsShareLayerPopup').hide();
}


function fn_followLayerHongBaoShow() {
	$('#container').addClass('on layerZindex');
	$('.followLayerPopupHongBao').show();
}


function fn_followLayerHongBaoHide() {
	$('#container').removeClass('on layerZindex');
	$('.followLayerPopupHongBao').hide();
} */

</script>

<!-- mainLayerPop -->
<div class="followLayerPopup" style="display:none;">
	<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="fn_followLayerHide();"/>
	<div class="title">
		您需要加关注后才能投票
	</div>
	<div class="inner">
		<div class="cont-Title" style="height:10px;"></div>
		<div class="cont-Title">
			在微信“通讯录”点击 &nbsp;&nbsp;&nbsp;&nbsp;<img class="serchMan" src="/front/skin/main/img/icon/wechatidSearchMan.png" />
		</div>
		<div class="cont-Title2">
			搜索微信号 :  <span class="wechatId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.sessionSkin.shopWechatId}&nbsp;</span>
		</div>
		<div class="cont-Title">
			<div style="height:5px; width:100%;"></div>
			点击 详细资料 页面底部的
		</div>
		<div class="follow">
			关注
		</div>
		<div class="cont-Title">
			关注我们！
		</div>
		
		<div class="cont-Title">
			<div style="height:1px; background:#6d6d6d; width:80%; margin-left:10%;"></div>
		</div>
		
		<div class="cont-Body">
			<ul class="shareList">
				<img src="${sessionScope.sessionSkin.shopQRImgUrl}"/>
			</ul>
		</div>
		<div class="cont-Title">
			长按二维码可直接关注
		</div>
	</div>
</div>
<!-- //mainLayerPop -->
	
	<!-- mainLayerPop -->
	<%-- <div class="followLayerPopupHongBao" style="display:none;">
<!-- 		<img src="/front/skin/pumeiduo/img/btn_close.png" onclick="fn_followLayerHide();"/> -->
		<div class="title">
			您需要加关注后才能抢红包
		</div>
		<div class="inner">
			<div class="cont-Title" style="height:10px;"></div>
			<div class="cont-Title">
				在微信“通讯录”点击 &nbsp;&nbsp;&nbsp;&nbsp;<img class="serchMan" src="/front/skin/main/img/icon/wechatidSearchMan.png" />
			</div>
			<div class="cont-Title2">
				搜索微信号 :  <span class="wechatId">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.sessionSkin.shopWechatId}&nbsp;</span>
			</div>
			<div class="cont-Title">
				<div style="height:5px; width:100%;"></div>
				点击 详细资料 页面底部的
			</div>
			<div class="follow">
				关注
			</div>
			<div class="cont-Title">
				关注我们！
			</div>
			
			<div class="cont-Title">
				<div style="height:1px; background:#6d6d6d; width:80%; margin-left:10%;"></div>
			</div>
			
			<div class="cont-Body">
				<ul class="shareList">
					<img src="${sessionScope.sessionSkin.shopQRImgUrl}"/>
				</ul>
			</div>
			<div class="cont-Title">
				长按二维码可直接关注
			</div>
		</div>
	</div> --%>
	<!-- //mainLayerPop -->
	
	<!-- mainLayerPop -->
	<!-- <div class="snsShareLayerPopup" style="display:none;">
		<div class="inner">
			<div class="cont-Title">
				<span onclick="fn_SnsSareLayerHide();"><img src="/front/skin/pumeiduo/img/btn_close.png" /></span>
			</div>
			<div class="cont-Body">
				<ul class="shareList">
				
				
					<li><span class="shareIcon"><img onclick="shareSinaBlog();" src="/front/skin/pumeiduo/img/share_sina_blog.png" /></span><span class="shareTxt">分享到新浪微博</span></li>
					<li><span class="shareIcon"><img onclick="shareQQBlog();" src="/front/skin/pumeiduo/img/share_qq_blog.png" /></span><span class="shareTxt">分享到腾讯微博</span></li>
					<li><span class="shareIcon"><img onclick="shareDouban();" src="/front/skin/pumeiduo/img/share_douban.png" /></span><span class="shareTxt">分享到腾讯微博</span></li>
					 <li><span class="shareIcon"><img onclick="shareQQZone();" src="/front/skin/pumeiduo/img/share_qq_zone.png" /></span><span class="shareTxt">分享到QQ空间</span></li>  
					 
				</ul>
			</div>
		</div>
	</div> -->
	<!-- //mainLayerPop -->
	
	
<div id="foo">
	<div id="fo"></div>
</div>
	
	<!-- <a href="#" class="bottom_totop">top</a> -->
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">

$(function(){ 
	  wx.config({
		    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		    appId: '${appInfo.appId }', // 必填，公众号的唯一标识
		    timestamp: ${signInfo.timestamp }, // 必填，生成签名的时间戳
		    nonceStr: '${signInfo.nonceStr }', // 必填，生成签名的随机串
		    signature: '${signInfo.signature }',// 必填，签名，见附录1
		    jsApiList: [//分享接口
					 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
					,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
					//界面操作
					,'closeWindow'				//关闭当前网页窗口接口
				] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
		});  
	  
		wx.ready(function(){
			//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
			wx.onMenuShareTimeline({
			    title: '${requestScope.reVoteHeader.VOTE_NM }, 투표에 참여해주세요.', // 分享标题
			    link: '${shareInfo.link}', // 分享链接
			    imgUrl: '${appInfo.url}${sessionScope.sessionSkin.shopLogoImgUrl}', // 分享图标
			    success: function () { 
				// 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
				// 用户取消分享后执行的回调函数
			    }
			});
			
			//获取“分享给朋友”按钮点击状态及自定义分享内容接口
			wx.onMenuShareAppMessage({
			    title: '${requestScope.reVoteHeader.VOTE_NM }', // 分享标题
			    desc: '투표에 참여해주세요.', // 分享描述
			    link: '${shareInfo.link}', // 分享链接
			    imgUrl: '${appInfo.url}${sessionScope.sessionSkin.shopLogoImgUrl}', // 分享图标
			    success: function () { 
				// 用户确认分享后执行的回调函数
			       // alert('success 11');
			    },
			    cancel: function () { 
				// 用户取消分享后执行的回调函数
				// alert('error 11');
			    }
			});
			
		    // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
		});
		
		
		wx.error(function(res){
		    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。

		});
	  
});
</script>
</body>
</html>