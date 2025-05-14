<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>미니게임 결과</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/echarts.js" type="text/javascript" charset="utf-8"></script>
<style>
.app {
	padding-top: 0;
}
.app-header {
	position: relative;
}
.app-header .logo img {
	width: 0.60rem;
}
.drag-table td img{
    display: inline;
    padding-right: 7px;
    height: 12px;
}
.drag-table th {
	padding: 5px 5px 5px 5px;
}
.activeTr td:first-of-type {
    border-left: 0px solid #e42e43 !important;
}
.activeTr td:last-of-type {
    border-right: 0px solid #e42e43 !important;
}
.activeTr2 td:first-of-type {
    border-left: 0px solid #03A9F4 !important;
}
.activeTr2 td {
    border-top: 1px solid #03A9F4 !important;
}
.activeTr2 td {
    background: #f4f7f9 !important;
    color: #006ecd !important;
}
.activeTr2 td {
    border-bottom: 1px solid #03A9F4 !important;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		$("#appPage2").prepend(htm)
		$(".app-header")
				.click(
						function() {
							window.location.href = '/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
						});
	});
</script>
<style>
.subBtn {
	padding: 0.2rem 0.1rem;
}
.table {
    -webkit-overflow-scrolling:touch
}
.container{
	background: initial;
}
.drag-table th {
    padding: 15px;
}
</style>
</head>

<body>
	<div class="app">

		<div class="content">
			<div class="scroll-wrap" id="appPage2">
				<div class="container" style="padding:0;padding-left: 0.1rem;padding-right: 0.1rem;">

					<div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0rem;">
						<div class="bottom-model" style="padding-top: 0;">
						<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<input class="imgContent" style="padding-left: 0.1rem;width:45%;padding-right: 0;" type="date" name="datFrdt" id="datFrdt" value="${amsClb.TODAY }" />
						</div>             
						<button class="confirmBtn" id="confirmBtn" onclick="getData();">${label.查询}</button>
						</div>
					</div>
 
					<div class="table-wrap">
						<div class="table" id="tableDiv" style="overflow: scroll;height: 87Vh;">
							<div class="title2">
								<span class="font24 bold"><a href="/front/bbc/clb/getPage.htm?pageName=page20&intClbsq=${amsClb.CLB_SQ}"><span id="spanYear1"></span> 대회 경기 결과 <span class="mdi mdi-refresh-circle"></span></a></span> <span
									class="font20 fontOrange">기준：<span id="spanYear12" class="font20 fontOrange">${amsClb.TODAY }</span></span>
							</div>
							<table class="drag-table noWrapTable" id="table1" cellspacing="0" cellpadding="2" border="1">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>

</body>
<script type="text/javascript">
	$(function() {
// 		var today = new Date();
// 		var year = today.getFullYear();
// 		var month = ('0' + (today.getMonth() + 1)).slice(-2);
// 		var dateString = year + '-' + month;
// 		$("#datFrdt").val(dateString);
		getData();
		appWidth();	
	});
	
	function appWidth() {
		var windowWidth;
		var currentWidth = $(window).width();

		if (currentWidth > 1024) {
		  windowWidth = 1024;
		} else {
		  windowWidth = currentWidth;
		}	
		$(".app").css("width", windowWidth);
		$("html").css("font-size", "100px");
	}

	function getData() {
		var para1 = "MINI_GAME";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = $("#datFrdt").val();

		var load = loading();
		load.show()

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						if (data.list.length != 0) {

							$("#table1").html('');
							
							for (var i = 0; i < data.list.length; i++) {

								var htm = '';
								if (i == 0) {

									htm = ''
									+ '<tr>'
									+ '	<th>No</th>'
									+ '	<th>'+data.list[i].A_TEAM_NM+'</th>'
									+ '	<th>코인</th>'
									+ '	<th>점수</th>'
									+ '	<th>A조 승패</th>'
									+ '	<th>B조 승패</th>'
									+ '	<th>점수</th>'
									+ '	<th>코인</th>'
									+ '	<th>'+data.list[i].B_TEAM_NM+'</th>'
									+ '</tr>'
									;
									$("#table1").append(htm);
								}
								

								if (data.list[i].A_TEAM_NM == 'TOTAL') {
									htm = ''
									+ '<tr class="activeTr">'
									+ '	<td class="center">'+(i+1)+'</td>'
									+ '	<td class="center">'+data.list[i].ANAME+'</td>'
									+ '	<td class="center">'+data.list[i].BBCA+'</td>'
									+ '	<td class="center">'+data.list[i].ASCR+'</td>'
									+ '	<td class="center">'+data.list[i].VTC_A+'</td>'
									+ '	<td class="center">'+data.list[i].VTC_B+'</td>'
									+ '	<td class="center">'+data.list[i].BSCR+'</td>'
									+ '	<td class="center">'+data.list[i].BBCB+'</td>'
									+ '	<td class="center">'+data.list[i].DNAME+'</td>'
									+ '</tr>'					
									;
									$("#table1").append(htm);
								}
								else {
									htm = ''
										+ '<tr>'
										+ '	<td class="center">'+(i+1)+'</td>'
										+ '	<td class="center">'+data.list[i].ANAME+'<br>'+data.list[i].BNAME+'</td>'
										+ '	<td class="center">'+data.list[i].BBCA+'</td>'
										+ '	<td class="center">'+data.list[i].ASCR+'</td>'
										+ '	<td class="center">'+data.list[i].VTC_A+'</td>'
										+ '	<td class="center">'+data.list[i].VTC_B+'</td>'
										+ '	<td class="center">'+data.list[i].BSCR+'</td>'
										+ '	<td class="center">'+data.list[i].BBCB+'</td>'
										+ '	<td class="center">'+data.list[i].CNAME+'<br>'+data.list[i].DNAME+'</td>'
										+ '</tr>'					
										;
										$("#table1").append(htm);
								}
								

							}
						} else {
							//$("#mbrList").html('');
						}
						load.hide();
						setTimeout(function () {
						  getData()
						}, 5000);
					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}

</script>
</html>
