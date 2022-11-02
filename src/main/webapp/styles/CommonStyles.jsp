<%@page import="com.common.utilities.AppSettingUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0);

	String cid = UUID.randomUUID().toString();
%>
<title>斗山GPS管理系统</title>
<meta content="text/html; charset=utf-8" http-equiv="content-type" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="expires" content="Wed,26 Feb 1997 08:21:57 GMT" />
<%
	if (AppSettingUtils.IsSurportYaheiFont(request)) {
%>
<link rel="stylesheet" type="text/css" href="/styles/global/Font.Yahei.css" />
<%
	} else {
%>
<link rel="stylesheet" type="text/css" href="/styles/global/Font.Simsun.css" />
<%
	}
%>

<link rel="stylesheet" type="text/css" href="/styles/jquery/jquery.ui.min.css" />
<link rel="stylesheet" type="text/css" href="/styles/jquery/jquery.dropdownlist.core.css" />
<link rel="stylesheet" type="text/css" href="/styles/jquery/jquery.dropdownlist.skin.css" />
<link rel="stylesheet" type="text/css" href="/styles/jquery/jquery.tree.min.css" />
<link rel="stylesheet" type="text/css" href="/styles/kendoui/kendo.common.min.css" />
<link rel="stylesheet" type="text/css" href="/styles/kendoui/kendo.default.min.css" />
<link rel="stylesheet" type="text/css" href="/styles/kendoui/kendo.bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/styles/global/Site.css?cid=<%=cid %>" />
<style type="text/css">

html,body {
	margin: 0 auto;
}
.ui-datepicker {
	width: auto;
}

.ui-datepicker select.ui-datepicker-month,.ui-datepicker select.ui-datepicker-year
	{
	width: auto;
}

.ui-datepicker th {
	padding-bottom: 1px;
	padding-top: 5px;
	padding-left: 1px;
	padding-right: 1px;
}

.ui-datepicker table {
	font-size: 0.7em;
}
.k-textbox, .k-autocomplete, .k-dropdown-wrap, .k-picker-wrap, .k-numeric-wrap {
	padding-top: 0px;
	padding-bottom: 0px;
}

.k-picker-wrap .k-input{
	box-shadow: none;	
}
.k-widget .k-picker-wrap{
	background-image: none;
	background-color: #ffffff;
}
.k-state-hover .k-i-calendar{
	background-position: -32px -176px;
}
.k-state-hover .k-i-clock{
	background-position: -32px -192px;
}
.k-dropdown-wrap{
	background-image: none;
	background-color: #ffffff;
}
.k-widget .k-dropdown-wrap,  span.k-state-active.k-dropdown-wrap{
	background-color: #ffffff;
    border-color: transparent;
    border-color: rgba(0, 0, 0, 0.15) rgba(0, 0, 0, 0.15)
		rgba(0, 0, 0, 0.25);
}
.k-dropdown-wrap .k-state-hover,.k-dropdown-wrap.k-state-focused{
	background-image: none;
	color: #333333;
	background-color: #ffffff;
}
.k-dropdown .k-state-hover .k-input{
	color: #333333;
}
.k-dropdown .k-state-hover .k-i-arrow-s{
	background-position: 0px -32px;
}
.k-dropdown .k-state-hover:hover{
	background-image: none;
	color: #333333;
	background-color: #ffffff;
}
.k-grid{
	border: solid 1px #8db2e3;
}
.k-grid table {
	border-collapse: collapse;
}
.k-grid-content table {
	border-collapse: collapse;
}

.k-grid-content .k-state-selected td {
	color: #fff;
}
.k-grid-content .k-state-selected td a:link {
	color: #fff;
}
.k-grid-content .k-state-selected td a:hover {
	color: #fff;
}
.k-grid-content .k-state-selected td a:visited {
	color: #fff;
}
.k-grid-header th.k-header{
	vertical-align: middle;
}
.k-grid-header .k-header {
	padding-top: 0px;
	padding-bottom: 0px;
	color: #1a5eab;
    background-image: none; 
	background-color: #f5f5f5;
}
.k-grid-header .k-header .k-link{
	margin-top: 0px;
	margin-bottom: 0px;
	padding-top: 3px;
	padding-bottom: 0px;
	color: #1a5eab;
}
.k-grid-filter, .k-header-column-menu{
	padding-top: 3px;
	padding-bottom: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}
.k-pager-wrap .k-icon {
	margin-top: 4px;
}
.k-icon {
	margin-top: 5px;
}
/*
.k-grid-pager{
	background-image: none;
}
.k-pager-wrap .k-link{
	background-image: none;
	background-color: transparent;
	border: none;
}
.k-pager-wrap .k-link:hover{
	background-image: none;
	background-color: transparent;
	border: none;
}

.k-pager-numbers .k-link{
 	border: none; 
	background-image: none;
	background-color: transparent;
	width: 26px;
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
}
.k-pager-numbers .k-link:hover{
	border: none; 
	background-image: none;
	background-color: transparent;
	padding-left: 0px;
	padding-right: 0px;
	text-decoration: underline;
	color: #333333;
}
.k-pager-numbers .k-state-selected{
 	border: none; 
	background-image: none;
	background-color: transparent;
	width: 24px;
	text-align: center;
	padding-left: 0px;
	padding-right: 0px;
	.k-state-selected: none;
	color: #0044cc;
	font-weight: bold;
}
*/

	.k-widget .k-header .k-tabstrip{
		box-shadow: none;
	}
    .k-tabstrip {
        border: 0px solid #efefef;
        background: none;
    }

    .k-tabstrip .k-tabstrip-items {
        padding: 0;
        border: 0px solid #efefef;
        background-color: transparent;
        color: #727f8e;
    }

    .k-tabstrip .k-item {
        width: 49.2%;
        margin: 0 2px 0 0;
        padding: 0 0 4px 0 ;
        text-align: center;
        cursor: pointer;
        background: none;
        background-color: transparent;
        border: 0px solid #efefef;
        border-bottom: 4px solid #b3bbc5;
        font: 14px/2em Arial, "Microsoft Yahei" , "Malgun Gothic";
    }

    .k-tabstrip .k-state-hover {
        color: #727f8e;
        font-weight: bold;
        background: none;
        background-color: transparent;
        border: 0px solid #efefef;
    }
    .k-tabstrip-items .k-state-hover.k-item{
        background: none;
        background-color: transparent;
        border: 0px solid #efefef;
        border-bottom: 4px solid #b3bbc5;
    }

    .k-tabstrip .k-state-active {
    	color: #333333;
        padding: 0;
        border: 0px solid #efefef;
        border-bottom: 8px solid #2b8abe;
    }
    .k-tabstrip-items .k-state-active.k-item{
        background: none;
        background-color: transparent;
        border: 0px solid #efefef;
        border-bottom: 8px solid #2b8abe;
    }
    
    .k-tabstrip-items .k-loading{
        border: 0px solid #efefef;
    }
    
    .k-tabstrip .k-item .k-link {
        padding: 0;
        color: #727f8e;
    }
    .k-tabstrip:focus {
    	-webkit-box-shadow: none;
    	box-shadow: none;
    }
    .k-tooltip {
    	color: #ffffff;
    }
	.k-grid-content td {
		overflow: hidden;
		white-space:nowrap;
		text-overflow: ellipsis;
	}
	.k-grid-content td a {
		overflow: hidden;
		white-space:nowrap;
		text-overflow: ellipsis;
		 
	}
	.k-grid-content .k-hierarchy-cell a {
		display: inline-block;
	}
</style>