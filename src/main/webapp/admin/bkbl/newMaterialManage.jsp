<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${label.素材管理}</title>

<link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/common.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/custom.css" />

<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/com.js"></script> 
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
<script type="text/javascript" src="/admin/js/template.js"></script>
<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/admin/js/select2.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>
<script type="text/javascript" src="/admin/js/jquery.ui.datepicker-zh-CN.js"></script>

<style type="text/css">
body {
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
	min-width: 700px;
}

.ui-right-content {
	position: relative;
	width:98%;
	margin: auto;
}

.ui-right-content .table-head {
	margin-top: 17px;
	margin-bottom: 30px;
	width: 100%;
	position: relative;
}


.ui-right-content .table-head tr .table-head-text div{
	width:140px;
	font-size: 16px;
	background-color: #ffffff;
}
.ui-right-content .table-head tr .table-head-text img{
	margin-left:15px;
	margin-right:15px;
}
.ui-right-content .table-head tr .table-head-text span {
	position: absolute;
	margin-top: 2px;
}

.ui-gridarea.clearfix {
	position: relative; 
	font-size : 14px;
	width: 100%;
	margin-top: 20px;
	border:1px solid #eeeeee;
}
.ui-gridarea.clearfix table{
	margin-top:30px;
}
.ui-gridarea.clearfix table tr td{
	height:30px;
	text-align: left;
}
.ui-gridarea.clearfix table .topSpan{
	height:30px;
	width:100px;
	vertical-align: top;
}
.ui-gridarea.clearfix table .topSpan span{
	padding:0;
	margin-top:5px;
	display: inline-block;
}
.ui-gridarea.clearfix table  .selectInput{
	width:135px;
}
.ui-gridarea.clearfix table  .selectInput input{
	margin-top:-2px;
	width:13px;
	height:13px;
	margin-left:20px;
	margin-right:10px;
}
.ui-gridarea.clearfix table .grade_tr .select2{
	margin-top:5px;
	width:263px;
	margin-bottom:5px;
}
.ui-gridarea.clearfix table .custInput{
	width:250px;
	margin-top:5px;
	margin-bottom:5px;
}
.ui-gridarea.clearfix table .selectDiv{
	width:60px;
	height:30px;
	border-radius:8px;
	background-color:#ff7e00;
	color:#ffffff; 
	line-height:30px;
	text-align: center;
	cursor: pointer;
	display:inline-block;
	position: absolute;
	top:6px;
	right:-80px;
}
 
.file_type_div .link_div,.cover_page_div{
	height:30px;
	width:100%;
	margin-top:10px;
	display: none;
}
.file_type_div .title_div{
	height:30px;
	width:100%;
	margin-top: 10px;
}
.file_type_div .title_head,.link_head,.cover_page_head{
	width:130px;
	display: inline-block;
	vertical-align: top;
}
.file_type_div .headSpan{
	margin-left:40px;
	display: inline-block;
	margin-top:5px;
}
.file_type_div .title_body,.link_body,.cover_page_body{
	display: inline-block;
}
.file_type_div input{
	width:380px;
}
.file_type_div  .selectDiv{
	position:absolute;
	width:60px;
	height:30px;
	border-radius:8px;
	display:inline-block;
	margin-left:20px;
	background-color:#ff7e00;
	color:#ffffff; 
	line-height:30px;
	text-align: center;
	cursor: pointer;
}
.foot_div{
	margin-top:15px;
}
.foot_div .send_msg_div{
	width:100%;
	height:175px;
}
.foot_div .send_msg_div span{
	display: inline-block;
	margin-left:40px;
	margin-top:5px;
}
.foot_div .send_msg_div div{
	display: inline-block;
	vertical-align: top;
}
.foot_div .send_msg_body {
	position: relative;
}
.foot_div .send_msg_body textarea{
	width:392px;
	height:175px;
	padding:0;
	font-size:14px;
}
.foot_div .send_msg_body div{
	width:370px;
	height:150px;
	position: absolute;
	display: inline-block;
	margin-top:10px;
	margin-left:10px;
	display:none;
}
.foot_div .send_msg_body div .music_display{
	background-image: url('/admin/images/sendMsgAll/music_play.png');
	width:60px;
	height:60px;
	border:1px solid #eeeeee;
	display: inline-block;
	cursor: pointer;
	background-color: #ffffff;
}
.foot_div .send_msg_body div  video{
	width:370px;
	height:150px;
	border:1px solid #eeeeee;
}
.foot_div .send_msg_body div .img_show_img{
	max-height: 150px;
	max-width: 370px;
}
.send_way_div{
	margin-top:20px;
}
.send_way_div div{
	display:inline-block;	
}
.send_way_div .send_way_head {
	width:130px;
	vertical-align: top;
}
.send_way_div .send_way_head span{
	margin-left:40px;
	margin-top:5px;
}
.send_way_div .send_way_body{
	
}
.send_way_div .send_way_body input{
	margin-left:20px;
	width:13px;
	height:13px;
	margin-top:0px;
}
.send_way_div .send_way_body span{
	margin-left:10px;
	display: inline-block;
} 
.submitDiv{
	height:50px;
	width:100%;
	text-align: center;
	line-height: 50px;
	background-color: #eeeeee;
	margin-top:30px;
	margin-bottom:30px;
}
.submit{
	width:103px;
	height:35px;
	display: inline-block;
	margin-top:7.5px;
	cursor: pointer;
}
.submit.img_send{
	background-image: url("/admin/images/sendMsgAll/send.png");
}
.submit.img_send_time{
	background-image: url("/admin/images/sendMsgAll/time_to_send.png");
}
.file_select_div div{
	display: inline-block;
}
.file_select_div{
	margin-top:10px;
	margin-bottom:0px;
	height:30px;
	display:none;
	width:100%;
}
.poupMessage .poupMessageTable {
	height: 30px;
	width: 580px;
	border-radius: 5px;
	text-align: center;
	font-size: 15px;
}
.poupMessage .poupMessageTable .poupTableHead td {
	height: 30px;
	width: 300px;
	background-color: #d1102d;
	border-radius: 5px 5px 0px 0px;
	font-size: 14px;
	color: #ffffff;
	text-align: left;
}

.poupMessage .poupMessageTable .poupTableHead td span {
	margin-left: 30px;
}
.poupMessage {
	position: absolute;
	background-color: #ffffff;
	top: -140px;
	left: -280px;
	border: 1px solid #eeeeee;
	border-radius: 5px;
	width: 580px;
	height: 410px;
	z-index: 0;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0, direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
}
.poupMessage .poupMessageTable .selectTable td{
	text-align: left;
	width:100%;
	font-size:12px;
}
.poupMessage .poupMessageTable .selectTable td input{
	margin-left:30px;
	margin-top:0;
	margin-right:10px;
}
.poupMessage .poupMessageTable .selectTable td span{
	margin-top:15px;
	display: inline-block;
}
.poupMessage .cust_list_table{
	width:100%;
	margin-top:-15px;
}
.select_flag{
	width:10px;
	height:10px;
	border:1px solid #eeeeee;
	position: absolute;
	bottom:0px;
	right:0px;
	background-image: url("/admin/images/sendMsgAll/select.png");
	background-repeat: no-repeat;
	background-position: 1px 2px;
	display:none;
}
.poupMessage .body_div_cust{
	margin-left:30px;
	width:520px;
	height:300px;
	margin-top:10px;
}
.poupMessage .body_div_cust .cust_one_div{
	width:75px;
	height:90px;
	display: inline-block;
	margin-left:10px;
	margin-rgith:7px;
	display:none;
}
.poupMessage .body_div_cust .cust_one_div .cust_img_show{
	width:60px;
	height:60px;
	border:1px solid #eeeeee;
	margin-bottom:5px;
	position: relative;
	cursor: pointer;
	margin-left:5px;
}
.poupMessage .body_div_cust .cust_one_div span{
	width:75px;
	display:block;  
	white-space:nowrap; 
	text-overflow:ellipsis; 
	overflow:hidden;
}
.poupMessage .cust_list_table tfoot .confirm_div{
	width:90px;
	height:30px;
	color:#ffffff;
	text-align: center;
	line-height: 30px;
	font-size:14px;
	display: inline-block;
	background-color:#ff7e00;
	border-radius:8px;
	margin-left:40px;
	margin-top:5px;
	cursor: pointer;
}
.poupMessage .cust_list_table tfoot tr td{
	vertical-align: bottom;
}
.page_span{
	width:12px;
	height:22px;
	background-repeat: no-repeat;
	display: inline-block;
	cursor: pointer;
	margin-bottom:-2px;
}
.poupMessage .cust_list_table tfoot .select2{
	width:100px;
}
.poupMessage .cust_list_table tfoot .total_page_span{
	margin-bottom:5px;
	margin-left:0;
}
.page_span.page_first{
	background-image: url("/admin/images/sendMsgAll/page_first.png");
}
.page_span.page_first_none{
	background-image: url("/admin/images/sendMsgAll/page_firstno.png");
}
.page_span.page_front{
	background-image: url("/admin/images/sendMsgAll/page_front.png");
}
.page_span.page_front_none{
	background-image: url("/admin/images/sendMsgAll/page_headno.png");
}
.page_span.page_next{
	background-image: url("/admin/images/sendMsgAll/page_next.png");
}
.page_span.page_next_none{
	background-image: url("/admin/images/sendMsgAll/page_nextno.png");
}
.page_span.page_end{
	background-image: url("/admin/images/sendMsgAll/page_last.png");
}
.page_span.page_end_none{
	background-image: url("/admin/images/sendMsgAll/page_endno.png");
}
.time_div{
	height:30px;
	margin-top:20px;
	margin-left:160px;
	display:none;
}
.time_div input{
	width:100px;
	margin-bottom:0;
	padding:0;
	height:25px;
	background-image: url("/admin/images/pointMst/calendar.png");
	background-position: 80px 5px;
	background-repeat: no-repeat;
	cursor: pointer;
}
.time_div .select2{
	width:100px;
}
.show-cust-select{
	min-height:30px;
	width:260px;
	border:1px solid #e5e5e5;
	display: inline-block;
	margin-top:5px;
	border-radius:4px;
}
.show-cust-select li{
	float:left;
	border:1px solid #eeeeee;
	height:24px;
	margin-top:2px;
	margin-bottom:2px;
	line-height: 25px;
	border-radius:4px;
	width:80px;
	margin-left:3px;
	position: relative;
}
.show-cust-select li span{
	width:80px;
	display: inline-block;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
.show-cust-select li a{
	 position: absolute;
	cursor: pointer;
	top:-3px;
	right:-3px;
	border:1px solid #eeeeee; 
	height:10px;
	width:10px;
	border-radius:5px;
	font-size:8px;
	color:#333333;
	line-height: 8px;
	text-align: center;
}
.delete-flag.show-delete{
	background-color: #07d;
	color:#ffffff;
}
</style>

<style type="text/css">

.appmsg {
	position: relative;
	overflow: hidden;
	margin-bottom: 20px;
	border: 1px solid #e7e7eb;
	background-color: #fff;
	color: #666;
}

.appmsg_content {
	position: relative;
	padding: 0 14px;
}

.appmsg_info {
	padding-bottom: 10px;
	font-size: 13px;
	line-height: 20px;
}

.multi .appmsg_content {
	padding: 0;
}

.multi .appmsg_info {
	padding-top: 14px;
	padding-right: 14px;
	padding-left: 14px;
}

.appmsg_date {
	font-weight: 400;
	font-style: normal;
}

.cover_appmsg_item {
	position: relative;
	margin: 0 14px 14px;
}

.appmsg_title {
	overflow: hidden;
	padding-top: 10px;
	max-height: 56px;
	word-wrap: break-word;
	font-weight: 400;
	font-style: normal;
	font-size: 16px;
	line-height: 28px;
	word-break: break-all;
}

.multi .appmsg_title {
	padding-top: 0;
	font-size: 14px;
}

.cover_appmsg_item .appmsg_title {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	background: rgba(0,0,0,0.6)!important;
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#99000000',endcolorstr = '#99000000');
}

.appmsg_title a {
	display: block;
	color: #666;
}

.cover_appmsg_item .appmsg_title a {
	padding: 0 8px;
	color: #fff;
}

.appmsg_thumb_wrp {
	overflow: hidden;
	height: 160px;
}

.appmsg_thumb {
	width: 100%;
	border-top: 1px solid #e7e7eb;
}

.appmsg_item {
	position: relative;
	padding: 20px 14px;
}

.appmsg_item .appmsg_thumb {
	float: right;
	margin-left: 14px;
	width: 78px;
	height: 78px;
}

.appmsg_title {
	overflow: hidden;
	padding-top: 10px;
	max-height: 56px;
	word-wrap: break-word;
	font-weight: 400;
	font-style: normal;
	font-size: 16px;
	line-height: 28px;
	word-break: break-all;
}

.appmsg_item .appmsg_title {
	overflow: hidden;
	margin-top: 14px;
	max-height: 48px;
	line-height: 24px;
}

.multi .appmsg_title {
	padding-top: 0;
	font-size: 14px;
}

.appmsg_item:after {
	clear: both;
	display: block;
	height: 0;
	content: "\200B";
}

.appmsg_mask {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1;
	display: none;
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: .6;
	filter: alpha(opacity = 60);
	-moz-opacity: .6;
	-khtml-opacity: .6;
}
.submit-div-transport{
	width:98px;
	height:31px;
	border-radius:31px;
	line-height:31px;
	background-position: 10px 8px;
	background-repeat: no-repeat;
	color:#313131;
	cursor: pointer;
	display: inline-block;
}
.submit-div-transport.submit-transport{
	background-image: url("/admin/images/transport/tick.png");
	border:2px solid #0e9615;
}
.submit-div-transport.revise-transport{
	background-image: url("/admin/images/transport/close.png");
	border:2px solid #d1102d;
}
.submit-div-transport span{
	margin-left:15px;
}
 
</style>

<script type="text/javascript">
$(function(){
	 _.templateSettings = {         
		evaluate : /\{\{([\s\S]+?)\}\}/g,         
		interpolate : /\{\{=([\s\S]+?)\}\}/g,       
		escape : /\{\{-([\s\S]+?)\}\}/g
	};
	 
})
</script>
</head>
<body>
	<!-- ▼ Main container -->
	<div class="container" style="margin-bottom: 20px;">
		<jsp:include page="/admin/inc/menuleft.jsp">
			<jsp:param value="${topMenuType}" name="topMenuType" />
			<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1" />
			<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2" />
		</jsp:include>
		<!-- Start 出售中商品显示。 -->
		<div class="ui-right-content">
			<div style="position: absolute; width: 100%;">
				<table class="table-head">
					<tr>
						<td class="table-head-text">
							<div>
								<img src="/admin/images/orders/order.png" /> 
								<span>${label.素材管理}</span>
							</div>
						</td>
						<td></td>
					</tr>
				</table>
			</div>
			<div style="border-top: 1px solid #eeeeee; width: 100%; margin-top: 30px;margin-bottom: 15px;"></div>
			<div style="width: 100%;height: 550px;">
				<iframe width="100%" height="100%" frameBorder=0 scrolling=yes  src="/admin/weixin/material/newsMaterialWindow.htm?display=none">
				</iframe>
			</div>
	</div>
</body>
</html>