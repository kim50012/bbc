<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page import="java.util.Map"%>
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
 --%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>客户购买申请管理</title>
<link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/common.css" />
<link rel="stylesheet" type="text/css" href="/admin/css/custom.css" />

<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/CJL.0.1.js"></script>
<script type="text/javascript" src="/admin/js/ImagePreviewd.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
<script type="text/javascript" src="/admin/js/template.js"></script>
<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/admin/js/select2.min.js"></script>
<script type="text/javascript" src="/admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin/js/jquery.ui.datepicker-zh-CN.js"></script>

<style type="text/css">
body{min-width:1300px;margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 14px;}


.topBorder {width: 100%; height: 94px; margin-top: 30px; border-top: 1px solid #eeeeee; position: relative;}
.ui-orders {position: absolute; top: -10px; left: 0px; z-index: 1; background-color: #ffffff;}
.ui-orders img {margin: -4px 10px 0px 10px;}
.ui-orders span {margin-right: 20px; font-size: 16px;}
.search {position: absolute; top: -12px; right: 100px; z-index: 1; background-color: #ffffff; cursor: pointer;}
.search img {margin: -4px 10px 0px 20px;}
.search span {margin-right: 20px;}
.conditions {width: 100%; height: 145px; border: 1px solid #eeeeee; margin-top: 20px;}

.conditions .condbg {width: 100%; height: 30px; position: relative;}
.conditions .condbg .leftNm {width:10%; height: 30px; float: left; line-height: 30px;margin-top:10px;}
.conditions .condbg .leftNm span {margin-left: 35px; font-size: 12px;}
.conditions .condbg .leftIn { height: 30px; float: left; line-height: 30px; display: inline-block;width:30%;margin-top:10px;}
.conditions .condbg .leftIn input {width: 200px; height: 26px; padding: 0; margin-bottom: 3px; font-size: 12px;}
.conditions .condbg .leftIn .leftSelect {width: 200px; height: 100%; margin: 0px; font-size: 12px;}
.conditions .condbg .rightNm { width:10%;height: 30px; float: left; line-height: 30px; display: inline-block;margin-top:10px;}
.conditions .condbg .rightNm span {width: 50px; height: 100%; font-size: 12px; margin-left:40px;}
.conditions .condbg .rightIn { width:50%;height: 30px; float: left; line-height: 30px; display: inline-block;margin-top:10px;}
.conditions .condbg .rightIn input {width: 243px; height: 26px; padding: 0; margin-bottom: 3px; font-size: 12px;}
.conditions .condbg .rightIn .line {margin-right: 10px; margin-left: 10px; color: #ab011c;}
.conditions .condbg .rightIn .rightSelect {width: 200px; height: 100%; margin: 0px; font-size: 12px;}
.conditions .condbg .rightIn .input2 {width: 200px; height: 26px; padding: 0; margin-bottom: 3px; font-size: 12px;}


.conditions-menu {width: 100%; height: auto; border-top: 1px solid #eeeeee; margin-top: 100px; position: relative;}
.conditions-menu .ui-menu {position: absolute; top: -12px; left: 0px; z-index: 1; background-color: #ffffff;}
.conditions-menu .ui-menu ul {list-style: none;}
.conditions-menu .ui-menu li {display: block; float: left; margin-right: 20px; cursor: pointer;}
.textb {border-bottom: 1px solid #d1102b; color: #d33045;}
.conditions-menu .ui-excel {position: absolute; top: -12px; right: 106px; z-index: 1; background-color: #ffffff; cursor: pointer;}
.conditions-menu .ui-excel img {margin: -4px 20px 0px 26px;}
.conditions-menu .ui-excel span {margin-right: 28px;}

.w100 {width: 100px;}
.calendar { background-image: url("/admin/images/orders/calendar.png"); background-repeat: no-repeat; background-position: 95% 6px;}
.contentPopup {width: 100%; height: 100%; overflow: hidden; position: relative;}

.grid.excel{margin-top:30px;width:auto;}
.theadFirstTd{text-align: left;width:5%;"}
.tbodyFirstTd{text-align: left;"}
.theadFirstTd input{margin-left:15px;width:14px;height:14px;margin-bottom:6px;margin-top:7px;}
.theadFirstTd span{margin-top:4px;position: absolute;}
.tbodyFirstTd input{margin-left:15px;width:13px;height:13px;}
.ui-gridarea.clearfix table tbody tr{height:40px;line-height:40px;text-align: center;}
.ui-gridarea.clearfix table tbody tr td{border-bottom:1px solid #eeeeee;}
.ui-gridarea.clearfix table tfoot img { cursor: pointer; margin-bottom: 6px;}
.ui-gridarea.clearfix table tfoot tr { height: 80px; }
.ui-gridarea .grid .select2 { width: 100px;　margin-left:20px; margin-right: 20px; margin-top: -3px; }
.ui-gridarea.clearfix table tfoot .pageShowNum { display: inline-block;  position: absolute; top: 22px; }
.pay-name-span{word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;}



.msg-div-shop{width:100%;position: relative;overflow-x:scroll;overflow-y:hidden;margin-top:20px;}
.msg-div-shop .msg-div-in div{float:left;height:30px;border-bottom:1px solid #eee; text-align: center;line-height:30px;}
.msg-div-shop .msg-div-in.title-div-head div{background-color:#c5c5c5;text-align: center;line-height:30px;}
.msg-div-shop .msg-div-in.title-div-head div:first-child{border-radius:15px 0 0 15px;}
.msg-div-shop .msg-div-in.title-div-head div:last-child{border-radius:0 15px  15px 0;}
.msg-div-shop .msg-div-in.title-div-head{border-radius:15px;}
.msg-div-in{width:2400px;height:auto;}
.msg-div-in.body div span{display:inline-block;  
	white-space:nowrap; 
	text-overflow:ellipsis; 
	overflow:hidden;}
.btn-icon{
	 display:inline-block; 
	 width: 29px;
	 height: 25px;
	 position: relative; 
	 cursor: pointer;
	 background-repeat: no-repeat;
	 background-position: center;
}

.btn-icon.icon-mail{
	background-image: url("/admin/images/buyApplyManage/btn_mail.png");
	margin-left:8px;
}
.btn-icon.icon-confirm{
	background-image: url("/admin/images/buyApplyManage/btn_confirm.png");
}
.btn-icon.icon-complete{
	background-image: url("/admin/images/buyApplyManage/btn_complete.png");
}
.btn-icon.icon-mail-no{
	background-image: url("/admin/images/buyApplyManage/btn_mail_g.png");
	margin-left:8px;
}
.btn-icon.icon-confirm-no{
	background-image: url("/admin/images/buyApplyManage/btn_confirm_g.png");
}
.btn-icon.icon-complete-no{
	background-image: url("/admin/images/buyApplyManage/btn_complete_g.png");
}
.btn-tip{
 	position:absolute; 
	right:20px; 
	top:-5px; 
	width:40px;
	height: 20px;
	line-height:20px; 
	text-align: center; 
	border-radius: 20px;
	background-color: #3574db;
	color: #fff;
	display: none;
}

</style>

<script type="text/javascript">

	$(function() {
		
		$(".datepicker").datepicker(); 
		
		$(".select2").select2({
			//width:"element"
			//,minimumInputLength:2	
			//,maximumInputLength:10
			minimumResultsForSearch:20,
			//,separator:'^'
			allowClear: true 
			//,closeOnSelect:true  //defalut:true
			//,openOnEnter:true 
		});
		$('.btn-icon').hover(function(){
			$(this).find('.btn-tip').show();
		},function(){
			$(this).find('.btn-tip').hide();
		});
		var emailFlag=true;
		$(".btn-icon.icon-mail").click(function(){
			if(!emailFlag){
				alert("正在发送邮件，请稍后操作");
				return;
			}
			if(!confirm("您确定发送邮件吗？")){
				return;
			}
			emailFlag=false;
			var purOrderNo=$(this).attr("data-id");
			var email1=$(this).attr("data-email1");
			var email2=$(this).attr("data-email2");
			var status1=$(this).attr("data-status1");
			var status2=$(this).attr("data-status2");
			var emailSendDate1;
			if(status1=="1" || status1=="3"){
				email1="";
			}
			var emailSendDate2;
			if(status2=="1" || status2=="3"){
				email2="";
			}
			var param={email1:email1,email2:email2,purOrderNo:purOrderNo};
			$.ajax({
				data : param,
				dataType : "json",
				type : "GET",
				cache : false,
				url : "/admin/buyApplyManage/email.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				success : function(data){
					if(data.OUT_ERR_MSG=="S"){
						alert("操作成功!");
						var pageUnit=$("#wholePage").find("option:selected").val();
						//存储分页的页数
						var pageCurr=$("#whole").find("option:selected").val();
						var beginDate=$("#beginDate").val();
						var endDate=$("#endDate").val();
						var goodsName=$("#goodsName").val();
						var adrMobile=$("#adrMobile").val();
						var purStatus=$("#purStatus").find("option:selected").val();
						var adrReceiptorName=$("#adrReceiptorName").val();
						window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
						/* window.location.href="/admin/buyApplyManage/buyApplyManage.htm"; */
					}else{
						alert("操作失败，请重新操作");
						emailFlag=true;
					}
				},
				error : function(a, msg, c) {
					alert("error: " + msg);
					emailFlag=true;
				}
			});
		});
		$(".btn-icon.icon-confirm").click(function(){
			if(!confirm("您确定担当确认吗？")){
				return;
			}
			var  purOrderNo=$(this).attr("data-id");
			var  purSts=3;
			var emailStatus1=1;
			var emailStatus2=1;
			var tobeConStatus2=1;
			var tobeConStatus1=1;
			var param={emailStatus1:emailStatus1,emailStatus2:emailStatus2,purSts:purSts,purOrderNo:purOrderNo,tobeConStatus2:tobeConStatus2,tobeConStatus1:tobeConStatus1};
			$.ajax({
				data : param,
				dataType : "json",
				type : "GET",
				cache : false,
				url : "/admin/buyApplyManage/buyApplyUpdateJSP.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				success : function(data){
					if(data.OUT_ERR_MSG=="S"){
						alert("操作成功!");
						/* window.location.href="/admin/buyApplyManage/buyApplyManage.htm"; */
						var pageUnit=$("#wholePage").find("option:selected").val();
						//存储分页的页数
						var pageCurr=$("#whole").find("option:selected").val();
						var beginDate=$("#beginDate").val();
						var endDate=$("#endDate").val();
						var goodsName=$("#goodsName").val();
						var adrMobile=$("#adrMobile").val();
						var purStatus=$("#purStatus").find("option:selected").val();
						var adrReceiptorName=$("#adrReceiptorName").val();
						window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
					}else{
						alert("操作失败，请重新操作");					
					}
				},
				error : function(a, msg, c) {
					alert("error: " + msg);
				}
			});
			
		});
		$(".btn-icon.icon-complete").click(function(){
			if(!confirm("您确定完成申请吗？")){
				return;
			}
			var  purOrderNo=$(this).attr("data-id");
			var  purSts=4;
			var param={purSts:purSts,purOrderNo:purOrderNo};
			$.ajax({
				data : param,
				dataType : "json",
				type : "GET",
				cache : false,
				url : "/admin/buyApplyManage/buyApplyUpdateJSP.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				success : function(data){
					if(data.OUT_ERR_MSG=="S"){
						alert("操作成功!");
						var pageUnit=$("#wholePage").find("option:selected").val();
						//存储分页的页数
						var pageCurr=$("#whole").find("option:selected").val();
						var beginDate=$("#beginDate").val();
						var endDate=$("#endDate").val();
						var goodsName=$("#goodsName").val();
						var adrMobile=$("#adrMobile").val();
						var purStatus=$("#purStatus").find("option:selected").val();
						var adrReceiptorName=$("#adrReceiptorName").val();
						window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
						/* window.location.href="/admin/buyApplyManage/buyApplyManage.htm"; */
					}else{
						alert("操作失败，请重新操作");					
					}
				},
				error : function(a, msg, c) {
					alert("error: " + msg);
				}
			});
		});
		
	});
	
	//查询事件
	function search() {
		var beginDate=$("#beginDate").val();
		var endDate=$("#endDate").val();
		var goodsName=$("#goodsName").val();
		var adrMobile=$("#adrMobile").val();
		var purStatus=$("#purStatus").find("option:selected").val();
		var adrReceiptorName=$("#adrReceiptorName").val();
		window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName;
	}
	
	
	//导出excel
	function execl() {
		
		alert('导出excel');
	}
	

	//获取input中名字为orderId且被选中的input的个数
	function getCheckedNum(){
		var count=0;
		var orderIds=document.getElementsByName("orderId");
		for(var i=0;i<orderIds.length;i++){
			if(orderIds[i].checked){
				count++;
			}
		}
		return count;
	}
	//全选按钮的操作
	function checkBox(){
		var ctlBoxEle=document.getElementById("checkAll");
		var orderIds=document.getElementsByName("orderId");
		ctlBoxEle.checked=orderIds.length==getCheckedNum();
	}
	//如果全选按钮，被选中，所有按钮都要被选择。
	function ctlBox_click(){
		var ctlBoxEle = document.getElementById('checkAll');
		var orderIds=document.getElementsByName("orderId");
		for(var i=0;i<orderIds.length;i++){
			orderIds[i].checked = ctlBoxEle.checked;
		}
	}
	//分页操作
	function gets_value(){
		//存储分页的每页条数
		var pageUnit=$("#wholePage").find("option:selected").val();
		//存储分页的页数
		var pageCurr=$("#whole").find("option:selected").val();
		var beginDate=$("#beginDate").val();
		var endDate=$("#endDate").val();
		var goodsName=$("#goodsName").val();
		var adrMobile=$("#adrMobile").val();
		var purStatus=$("#purStatus").find("option:selected").val();
		var adrReceiptorName=$("#adrReceiptorName").val();
		window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
		//window.location.href="/admin/incomeDetail/incomeDetail.htm?
		//window.location.href="/admin/incomeDetail/incomeDetail.htm?pageUnit="+pageUnit+"&pageCurr="+pageCurr+"&createdDateFrom="+createdDateFrom+"&createdDateTo="+createdDateTo+"&isRefund="+isRefund+"&payTypeId="+payTypeId;
	}
	//分页操作
	function gets_page_value(){
		//存储分页的每页条数
		var pageUnit=$("#wholePage").find("option:selected").val();
		//存储分页的页数
		var pageCurr=1;
		var beginDate=$("#beginDate").val();
		var endDate=$("#endDate").val();
		var goodsName=$("#goodsName").val();
		var adrMobile=$("#adrMobile").val();
		var purStatus=$("#purStatus").find("option:selected").val();
		var adrReceiptorName=$("#adrReceiptorName").val();
		window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
		//window.location.href="/admin/incomeDetail/incomeDetail.htm?pageUnit="+pageUnit+"&pageCurr="+pageCurr;
	}
	//页面的上一页，下一页，第一页，最后一页的操作。
	function pageNext(pageCurr){
		//存储分页的页数
		var pageUnit=$("#wholePage").find("option:selected").val();
		var beginDate=$("#beginDate").val();
		var endDate=$("#endDate").val();
		var goodsName=$("#goodsName").val();
		var adrMobile=$("#adrMobile").val();
		var purStatus=$("#purStatus").find("option:selected").val();
		var adrReceiptorName=$("#adrReceiptorName").val();
		window.location.href="/admin/buyApplyManage/buyApplyManage.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
		//window.location.href="/admin/incomeDetail/incomeDetail.htm?pageUnit="+pageUnit+"&pageCurr="+pageCurr;
	}
	//获取table的值
	function gethtml()
	{
		var fTableElement,strcell,rows,cols,style,excelstr;
		fTableElement = document.getElementById("table1");
		excelstr = "";
		for (i = 0; i < fTableElement.rows.length; i++)
		{
			if(i >= 1){
				var inputbox=fTableElement.rows[i].cells[0].children[0];
				if(!inputbox.checked){ 
					continue;
				}
			}
			for (j = 1; j < fTableElement.rows[i].cells.length; j++)
			{
				rows = fTableElement.rows[i].cells[j].rowSpan;
				cols = fTableElement.rows[i].cells[j].colSpan;
				style = fTableElement.rows[i].cells[j].align;
				for(k = 0; k <=fTableElement.rows[i].cells[j].children.length;k++){
					if(typeof(fTableElement.rows[i].cells[j].children[k]) == "undefined"){
						excelstr += fTableElement.rows[i].cells[j].innerText;
					}
				}
				if(j==(fTableElement.rows[i].cells.length-1)){
					excelstr+="";
				}else{
					excelstr+=",";
				}
			}
			excelstr += ";";
		}
		return excelstr;
	}
	//保存表单内容
	function createExcel(){
		/* if(getCheckedNum()==0){
			alert("请选择要导出的信息");
			return;
		} */
		var flag=window.confirm("${label.您确定需要导出数据吗}"+"？");
		if(flag){
			//存储excel表中的内容
			//var excelBody=gethtml();
			var beginDate=$("#beginDate").val();
		var endDate=$("#endDate").val();
		var goodsName=$("#goodsName").val();
		var adrMobile=$("#adrMobile").val();
		var purStatus=$("#purStatus").find("option:selected").val();
		var adrReceiptorName=$("#adrReceiptorName").val();
		window.location.href="/admin/buyApplyManage/createExcel.htm?beginDate="+beginDate+"&endDate="+endDate+"&goodsName="+goodsName+"&adrMobile="+adrMobile+"&purStatus="+purStatus+"&adrReceiptorName="+adrReceiptorName;
			//window.location.href="/admin/incomeDetail/createExcel.htm?createdDateFrom="+createdDateFrom+"&createdDateTo="+createdDateTo+"&isRefund="+isRefund+"&payTypeId="+payTypeId;
			//window.location.href="/admin/incomeDetail/createExcel.htm;
		}
		/* var param={excelBody:excelBody};
		$.ajax({
			data : param,
			dataType : "json",
			type : "GET",
			cache : false,
			url : "/admin/incomeDetail/createExcel.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				if(data.result=='success'){
					alert("导出成功");
				}else if(data.result=="fail"){
					alert("导出失败，请重新操作");
				}
			},
			error : function(a, msg, c) {
				alert("error: " + msg);
			}
		}); */
	}
</script>
</head>

<body>
	<jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType" />
	</jsp:include>
	
	<!-- ▼ Main container -->
	<div class="container">
		<jsp:include page="/admin/inc/menuleft.jsp">
			<jsp:param value="${topMenuType}" name="topMenuType" />
			<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1" />
			<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2" />
		</jsp:include>


		<div class="ui-right-content">

			<div class="topBorder">
				<div class="ui-orders">
					<img src="/admin/images/orders/order.png">
					<span>购买申请管理</span>
				</div>
				<div class="search" onclick="javascript:search();">
					<img src="/admin/images/orders/query.png">
					<span>${label.查询}</span>
				</div>

				<div class="conditions">
					<div class="h18" style="height:10px;"></div>
					<div class="condbg">
						<div class="leftNm">
							<span>商品名称：</span>
						</div>
						<div class="leftIn">
							<input  value="${requestScope.goodsName }" type="text" id="goodsName"  />
						</div>
						<div class="rightNm">
							<span>下单日期：</span>
						</div>
						<div class="rightIn">
							<input  value="${requestScope.beginDate }" type="text" id="beginDate" style="width:100px;" class="w100 datepicker calendar" readonly="readonly" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input value="${requestScope.endDate }" style="width:100px;" type="text" id="endDate" class="w100 datepicker calendar" readonly="readonly" />
						</div>
						<div class="leftNm">
							<span>收货人姓名：</span>
						</div>
						<div class="leftIn">
							<input  value="${requestScope.adrReceiptorName }" type="text" id="adrReceiptorName"  />
						</div>
						<div class="rightNm">
							<span>收货人手机：</span>
						</div>
						<div class="rightIn">
							<input  value="${requestScope.adrMobile }" type="text" id="adrMobile"  />
						</div>
						<div class="leftNm">
							<span>状态：</span>
						</div>
						<div class="leftIn">
							<select id="purStatus" class="select2 leftSelect" data-placeholder="">
								<option value="" <c:if test="${requestScope.purStatus==''}">selected="selected"</c:if> >${label.不限}</option>
								<option value="1" <c:if test="${requestScope.purStatus=='1'}">selected="selected"</c:if>>生成</option>
								<option value="2" <c:if test="${requestScope.purStatus=='2'}">selected="selected"</c:if>>邮件确认</option>
								<option value="3" <c:if test="${requestScope.purStatus=='3'}">selected="selected"</c:if>>担当确认</option>
								<option value="4" <c:if test="${requestScope.purStatus=='4'}">selected="selected"</c:if>>完成</option>
							</select>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="conditions-menu">
				
				<div class="ui-excel" onclick="javascript:createExcel();">
					<img src="/admin/images/orders/export.png">
					<span>${label.批量导出}</span>
				</div>
           	</div>
          	<div class="ui-gridarea clearfix">
	           	<div class="msg-div-shop">
           			<div class="msg-div-in title-div-head">
           				<div style="width:150px;">
	           				<span>商品名称</span>					
	           			</div>
	           			<div style="width:40px;">
	           				<span>数量</span>
	           			</div>
	           			<div style="width:100px;">
	           				<span>收货人姓名</span>
	           			</div>
	           			<div style="width:100px;">
	           				<span>收货人手机号</span>
	           			</div>
	           			<div style="width:100px;">
	           				<span>下单日期</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>邮件发送日期1</span>	
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当确认日期1</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>邮件发送日期2</span>	
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当确认日期2</span>
	           			</div>
	           			<div style="width:100px;">
	           				<span>完成日期1</span>
	           			</div>
	           			<div style="width:100px;">
	           				<span>担当名称1</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当联系方式1</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当邮件1</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>邮件发送状态1</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当确认状态1</span>
	           			</div>
	           			<div style="width:100px;">
	           				<span>担当名称2</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当联系方式2</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当邮件2</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>邮件发送状态2</span>
	           			</div>
	           			<div style="width:120px;">
	           				<span>担当确认状态2</span>
	           			</div>
	           			<div style="width:120px;margin-right:5px;">
	           				<span>操作</span>
	           			</div>
           			</div>
           			<c:forEach items="${list }" var="list"  varStatus="status">
           				<div class="msg-div-in body">
	           				<div style="width:150px;text-align: left;">
		           				<span style="width:135px;padding-left:10px;" title="${list.GOODS_NM }">${list.GOODS_NM }</span>					
		           			</div>
		           			<div style="width:40px;">
		           				<span  style="width:40px;">${list.GOODS_QTY }</span>
		           			</div>
		           			<div style="width:100px;">
		           				<span  style="width:100px;" title="${list.ADR_RECEIPTOR_NM }">${list.ADR_RECEIPTOR_NM }</span>
		           			</div>
		           			<div style="width:100px;">
		           				<span style="width:100px;">${list.ADR_MOBILE }</span>
		           			</div>
		           			<div style="width:100px;">
		           				<span style="width:100px;">${list.STS_ORDER_DT }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.EMAIL_SEND_DT1 }</span>	
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.TOBE_CON_DT1 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.EMAIL_SEND_DT2 }</span>	
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.TOBE_CON_DT2 }</span>
		           			</div>
		           			<div style="width:100px;">
		           				<span style="width:100px;">${list.STS_COM_DT1 }</span>
		           			</div>
		           			<div style="width:100px;">
		           				<span style="width:100px;">${list.TOBE_NM1 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.TOBE_CONTACT1 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;" title="${list.TOBE_EMAIL1 }">${list.TOBE_EMAIL1 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.EMAIL_STATUS1 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.TOBE_CON_STATUS1 }</span>
		           			</div>
		           			<div style="width:100px;">
		           				<span style="width:100px;">${list.TOBE_NM2 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.TOBE_CONTACT2 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;" title="${list.TOBE_EMAIL2 }">${list.TOBE_EMAIL2 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.EMAIL_STATUS2 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<span style="width:120px;">${list.TOBE_CON_STATUS2 }</span>
		           			</div>
		           			<div style="width:120px;">
		           				<c:choose>
		           					<c:when test="${(list.EMAIL_STATUS1==1 or list.EMAIL_STATUS1==3) and (list.EMAIL_STATUS2==1 or list.EMAIL_STATUS2==3)}">
		           						<a class="btn-icon icon-mail-no" target="_blank"  style="margin-top:-2px;">
			           					</a>
		           					</c:when>
		           					<c:otherwise>
		           						<a class="btn-icon icon-mail" target="_blank"  style="margin-top:-2px;" data-id="${list.PUR_ORDER_NO }" data-email1="${list.TOBE_EMAIL1 }" data-email2="${list.TOBE_EMAIL2 }" data-status1="${list.EMAIL_STATUS1 }"  data-status2="${list.EMAIL_STATUS2 }">
			           						<span class="btn-tip" style="display: none;">邮件</span>
			           					</a>	
		           					</c:otherwise>
		           				</c:choose>
		           				
           						<a style="padding-left:2px;"></a>
           						<c:choose>
		           					<c:when test="${list.PUR_STS==1}">
		           						<a class="btn-icon icon-confirm" target="_blank" style="margin-top:-2px;" data-id="${list.PUR_ORDER_NO }">
			           						<span class="btn-tip" style="display: none;">${label.确认}</span>
			           					</a>
		           					</c:when>
		           					<c:otherwise>
		           						<a class="btn-icon icon-confirm-no" target="_blank" style="margin-top:-2px;">
			           					</a>
		           					</c:otherwise>
		           				</c:choose>	
		           				<c:choose>
		           					<c:when test="${list.PUR_STS==4 or list.PUR_STS==1}">
		           						<a class="btn-icon icon-complete-no" target="_blank" style="margin-top:-2px;">
			           					</a>
		           					</c:when>
		           					<c:otherwise>
		           						<a class="btn-icon icon-complete" target="_blank" style="margin-top:-2px;" data-id="${list.PUR_ORDER_NO }">
			           						<span class="btn-tip" style="display: none;">完成</span>
			           					</a>
		           					</c:otherwise>
		           				</c:choose>	
		           			</div>
	           			</div>
           			</c:forEach>
           			
	           	</div>
           		<table class="grid">
	           		<!-- Start Page页面中页数的显示，操作等。 -->
	           		<tfoot>
						<tr>
							<td colspan="8" style="height: 35px;width:100%; position: relative;line-height:35px;">
								<c:choose>
									<c:when test="${requestScope.pageCurr==1}">
										<img src="/admin/images/goodsSell/page_firstno.png"
											style="margin-left: 15%; margin-right: 2.5%;" />
										<img src="/admin/images/goodsSell/page_headno.png" style="margin-right:20px;"/>
									</c:when>
									<c:otherwise>
										<img src="/admin/images/goodsSell/page_first.png"
											onclick="pageNext('1');"
											style="margin-left: 15%; margin-right: 2.5%;" />
										<img src="/admin/images/goodsSell/page_front.png"
											onclick="pageNext(${requestScope.pageCurr-1});" style="margin-right:20px;" />
									</c:otherwise>
								</c:choose> 
								<select class="select2" id="whole" onchange="gets_value();">
									<c:forEach var='i' begin="1" end="${requestScope.pageCount }" varStatus="status">
										<c:if test="${status.index==requestScope.pageCurr }">
											<option value="${status.index}" selected="selected">${status.index}</option>
										</c:if>
										<c:if test="${status.index!=requestScope.pageCurr }">
											<option value="${status.index}">${status.index}</option>
										</c:if>
									</c:forEach>
									<c:if test="${requestScope.pageCount==0 or requestScope.pageCount == null }">
							    		<option  selected="selected">1</option>
							    	</c:if>
								</select> 
								<c:choose>
									<c:when test="${requestScope.pageCurr==requestScope.pageCount or requestScope.pageCount==0}">
										<img src="/admin/images/goodsSell/page_nextno.png" />
										<img src="/admin/images/goodsSell/page_endno.png" style="margin-left: 2.5%;margin-right:20px;" />
									</c:when>
									<c:otherwise>
										<img src="/admin/images/goodsSell/page_next.png"  onclick="pageNext(${requestScope.pageCurr+1});" />
										<img src="/admin/images/goodsSell/page_last.png"  style="margin-left: 2.5%;margin-right:20px;" onclick="pageNext(${requestScope.pageCount});" />
									</c:otherwise>
								</c:choose> 
								<select class="select2" id="wholePage" onchange="gets_page_value();">
									<c:if test="${requestScope.pageUnit==10}">
										<option value="10" selected="selected">10</option>
										<option value="30">30</option>
										<option value="50">50</option>
									</c:if>
									<c:if test="${requestScope.pageUnit==30}">
										<option value="10">10</option>
										<option value="30" selected="selected">30</option>
										<option value="50">50</option>
									</c:if>
									<c:if test="${requestScope.pageUnit==50}">
										<option value="10">10</option>
										<option value="30">30</option>
										<option value="50" selected="selected">50</option>
									</c:if>
								</select>
								<div class="pageShowNum">
									<span>${label.条页}</span> 
								</div>
								<div style="float:right;margin-right:20px;margin-top:2px;">
										<span>${label.每页} ${requestScope.pageUnit }${label.条}，${label.共} ${requestScope.pageUnitCount } <c:if test="${requestScope.pageUnitCount ==null}">0</c:if>${label.条}</span>
								</div>
							</td>
						</tr>
					</tfoot>
					<!-- End Page-->
	           	</table>
			</div>
		</div>
	</div>
	<!-- ▲ Main container -->


	<!-- ▼ Main footer -->
	<footer class="ui-footer">
		<div class="ui-footer-inner clearfix">
			<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
		</div>
	</footer>
	<!-- ▲ Main footer -->
</body>
</html>