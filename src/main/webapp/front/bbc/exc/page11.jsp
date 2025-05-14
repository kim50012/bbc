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
<title>월간/주간 MVP 횟수</title>
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
</style>
</head>

<body>
	<div class="app">

		<div class="content">
			<div class="scroll-wrap" id="appPage2">
				<div class="container" style="padding:0;padding-left: 0.3rem;">
				
		            <div class="tab-header">
		              <div onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page10&intClbsq=${amsClb.CLB_SQ}';"><p>MVP 전체 현황</p></div>
		              <div onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page11&intClbsq=${amsClb.CLB_SQ}';" class="active"><p>MVP 월간/주간 횟수</p></div>
		            </div>
		            
					<div class="content" style="height:5px;">
					</div>
					

					<div class="table-wrap">
						<div class="table" id="tableDiv" style="overflow: scroll;height: 87Vh;">
							<div class="title2">
								<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page11&intClbsq=${amsClb.CLB_SQ}">월간 MVP 현황 <span class="mdi mdi-refresh-circle"></span></a></span> <span
									class="font20 fontOrange">기준：${amsClb.TODAY}</span>
							</div>
							<table class="drag-table noWrapTable" id="table1" cellspacing="0" cellpadding="2" border="1" style="height:300px;">
							</table>
							
							<div class="title2">
								<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page11&intClbsq=${amsClb.CLB_SQ}">주간 MVP 현황 <span class="mdi mdi-refresh-circle"></span></a></span> <span
									class="font20 fontOrange">기준：${amsClb.TODAY}</span>
							</div>
							<table class="drag-table noWrapTable" id="table2" cellspacing="0" cellpadding="2" border="1" style="height:300px;">
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
		getData();
		getData2();
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
	}

	function getData() {
		var para1 = "SELECT_MVP_GET_BY_M_CNT";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "${para3}";
		var para4 = "${para4}";
		var para5 = "${para5}";

		var load = loading();
		load.show();

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4,
						para5 : para5
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

				        var arrYyyymm = [];
						var arrBarRateTT = [];
						var arrLineRateMM = [];
						var arrLineRateMW = [];

						var arrBarCoinTT = [];
						var arrLineCoinMM = [];
						var arrLineCoinMW = [];
						
						if (data.list.length != 0) {

							$("#table1").html('');
							htm = '';
							$("#table1").append(htm);

							var j = 0;
							var prvMonth = "";
							for (var i = 0; i < data.list.length; i++) {

								if (data.list[i].YYYYMM != "Total") {
									arrYyyymm.push(data.list[i].YYYYMM);

									arrBarRateTT.push(data.list[i].WIN_RATE);
									arrLineRateMM.push(data.list[i].MMW_WIN_RATE);
									arrLineRateMW.push(data.list[i].MW_WIN_RATE);

									arrBarCoinTT.push(data.list[i].BBC);
									arrLineCoinMM.push(data.list[i].MMW_BBC);
									arrLineCoinMW.push(data.list[i].MW_BBC);
									
								}
								
								var htm = '';
								if (prvMonth != data.list[i].YYYYMM) {
									j = 0;

									if ("" == "${para3}" || i == 0) {
										htm = ''
											+ '<tr style="height:0.7rem;">'
											+ '	<th>순위</th>'
											+ '	<th>이름</th>'
											+ '	<th>월간 MVP 1위</th>'
											+ '	<th>월간 MVP 2위</th>'
											+ '	<th>Total MVP</th>'
											+ '	<th>최근 MVP</th>'
											+ '</tr>'
											;
											$("#table1").append(htm);	
									}
								}
								
								j++;
								var k = j;
								var v_weeks = "";
								var v_week_dt = "";
								var tagLine = "";

								if (j <= 2) {
									tagLine = 'class="activeTr2"';
								}
								
								htm = ''
								+ '<tr '+tagLine+'>'
								+ '	<td class="center" style="font-weight: bold;">'+j+'</td>'
								+ '	<td class="center" style="font-weight: bold;'+data.list[i].MVP_TAG+'">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '	<td class="center" style="font-weight: bold;color: blue;">'+data.list[i].M_MVP_1+' 회</td>'
								+ '	<td class="center">'+data.list[i].M_MVP_2+' 회</td>'
								+ '	<td class="center">'+data.list[i].M_MVP_TOTAL+' 회</td>'
								+ '	<td class="center">'+data.list[i].WEEKS+'</td>'
								+ '</tr>'					
								;
								$("#table1").append(htm);
								prvMonth = data.list[i].YYYYMM;
							}
						} else {

						}
						
						if ("" != "${para3}") {
							$("#chartArea1").show();
							$("#chartArea2").show();
							tagscheck(arrYyyymm, arrBarRateTT, arrLineRateMM, arrLineRateMW, arrBarCoinTT, arrLineCoinMM, arrLineCoinMW);	
						}
						else {
							$("#chartArea1").hide();
							$("#chartArea2").hide();
						}
						
						load.hide();

					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
	

	function getData2() {
		var para1 = "SELECT_MVP_GET_BY_W_CNT";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "${para3}";
		var para4 = "${para4}";
		var para5 = "${para5}";

		var load = loading();
		load.show();

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4,
						para5 : para5
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						if (data.list.length != 0) {

							$("#table2").html('');
							htm = '';
							$("#table2").append(htm);

							var j = 0;
							var prvMonth = "";
							
							if ("" == "${para3}" || i == 0) {
								htm = ''
									+ '<tr style="height:0.7rem;">'
									+ '	<th>순위</th>'
									+ '	<th>이름</th>'
									+ '	<th>주간 MVP 1위</th>'
									+ '	<th>주간 MVP 2위</th>'
									+ '	<th>Total MVP</th>'
									+ '	<th>최근 MVP</th>'
									+ '</tr>'
									;
									$("#table2").append(htm);	
							}
							
							for (var i = 0; i < data.list.length; i++) {

								var htm = '';
								j++;
								var k = j;
								var v_weeks = "";
								var v_week_dt = "";
								var tagLine = "";

								if (data.list[i].BBC_RANK == 1) {
									v_weeks = data.list[i].WEEKS;
									v_week_dt = data.list[i].WEEK_DT;
								}

								if (j <= 2) {
									tagLine = 'class="activeTr2"';
								}
								
								htm = ''
								+ '<tr '+tagLine+'>'
								+ '	<td class="center" style="font-weight: bold;">'+j+'</td>'
								+ '	<td class="center" style="font-weight: bold;'+data.list[i].MVP_TAG+'">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '	<td class="center" style="font-weight: bold;color: blue;">'+data.list[i].W_MVP_1+' 회</td>'
								+ '	<td class="center">'+data.list[i].W_MVP_2+' 회</td>'
								+ '	<td class="center">'+data.list[i].W_MVP_TOTAL+' 회</td>'
								+ '	<td class="center">'+data.list[i].WEEKS+'</td>'
								+ '</tr>'					
								;
								$("#table2").append(htm);
								prvMonth = data.list[i].YYYYMM;
							}
						} else {

						}
						
						load.hide();

					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
	function accumulateArray(arr) {
	    let accumulatedValue = 0;
	    return arr.map(value => accumulatedValue += roundNumber(value, 0));
	}
	
	function roundNumber(value, decimals) {
	    const factor = Math.pow(10, decimals);
	    return Math.round(value * factor) / factor;
	}
	
</script>
</html>
