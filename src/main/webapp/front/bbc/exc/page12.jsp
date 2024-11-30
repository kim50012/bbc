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
<title>출석율관리</title>
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
</style>
</head>

<body>
	<div class="app">

		<div class="content">
			<div class="scroll-wrap" id="appPage2">
				<div class="container" style="padding:0;padding-left: 0.1rem;padding-right: 0.1rem;">

					<div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
						<div class="bottom-model" style="padding-top: 0;">
						<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<input class="imgContent" style="padding-left: 0.1rem;width:45%;padding-right: 0;" type="month" name="datFrdt" id="datFrdt" value="${datFrdt }" />
						</div>             
						<button class="confirmBtn" id="confirmBtn" onclick="getData();">${label.查询}</button>
						</div>
					</div>
 
					<div class="table-wrap">
						<div class="table" id="tableDiv" style="overflow: scroll;height: 87Vh;">
							<div class="title2">
								<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page12&intClbsq=${amsClb.CLB_SQ}">요일별 참석 현황 <span class="mdi mdi-refresh-circle"></span></a></span> <span
									class="font20 fontOrange">기준：${amsClb.TODAY}</span>
							</div>
							<table class="drag-table noWrapTable" id="table1" cellspacing="0" cellpadding="2" border="1">
							</table>
							
							<div class="title2">
								<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page12&intClbsq=${amsClb.CLB_SQ}">연간 누적 참석율 랭킹 <span class="mdi mdi-refresh-circle"></span></a></span> <span
									class="font20 fontOrange">기준：${amsClb.TODAY}</span>
							</div>
							<table class="drag-table noWrapTable" id="table2" cellspacing="0" cellpadding="2" border="1">
							</table>
							
							<div class="title2">
								<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page12&intClbsq=${amsClb.CLB_SQ}">월별 참석율 랭킹 <span class="mdi mdi-refresh-circle"></span></a></span> <span
									class="font20 fontOrange">기준：${amsClb.TODAY}</span>
							</div>
							<table class="drag-table noWrapTable" id="table3" cellspacing="0" cellpadding="2" border="1">
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
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var dateString = year + '-' + month;
		$("#datFrdt").val(dateString);
		getData();
		appWidth();	
	});
	
	function appWidth() {
		$(".app").css("width", $(window).width());
	}

	function getData() {
		var yyyyMM = $("#datFrdt").val();
		var para1 = "SELECT_ATTENTION_GET_BY_TOTAL";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = yyyyMM.substring(0,4);
		var para4 = yyyyMM;
		
		var load = loading();
		load.show();


		var htm1 = ''
				+ '<tr style="color:#333333;height:0.8rem;">'
				+ '	<th>요일</th>'
				+ '	<th>총 참석자 수</th>'
				+ '	<th>요일 수(회))</th>'
				+ '	<th>평균</th>'
				+ '</tr>'
				+ '<tr>'
				+ '	<td class="center" colspan="4">데이터가 없습니다.</td>'
				+ '</tr>'
				;
		$("#table1").html(htm1);	
		para1 = "SELECT_ATTENTION_GET_BY_TOTAL";
		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
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

								var htm = '';
								if (i == 0) {
									htm = ''
										+ '<tr style="color:#333333;height:0.8rem;">'
										+ '	<th>요일</th>'
										+ '	<th>총 참석자 수</th>'
										+ '	<th>요일 수(회))</th>'
										+ '	<th>평균</th>'
										+ '</tr>'
										;
										$("#table1").append(htm);	
								}
								
								j++;
								var k = j;
								var v_weeks = "";
								var v_week_dt = "";
								var tagLine = "";

								htm = ''
									+ '<tr '+tagLine+'>'
									+ '	<td class="center">'+data.list[i].WEEKDAY_NM+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_USER+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_WEEKDAY+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_AVG+'</td>'
									+ '</tr>'						
								;
								$("#table1").append(htm);
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
				
				

				var htm2 = ''
					+ '<tr style="color:#333333;height:0.8rem;">'
					+ '	<th>누적 랭킹</th>'
					+ '	<th>누적참여횟수</th>'
					+ '	<th>이름</th>'
					+ '	<th>1월</th>'
					+ '	<th>2월</th>'
					+ '	<th>3월</th>'
					+ '	<th>4월</th>'
					+ '	<th>5월</th>'
					+ '	<th>6월</th>'
					+ '	<th>7월</th>'
					+ '	<th>8월</th>'
					+ '	<th>9월</th>'
					+ '	<th>10월</th>'
					+ '	<th>11월</th>'
					+ '	<th>12월</th>'
					+ '</tr>'
					+ '<tr>'
					+ '	<td class="center" colspan="15">데이터가 없습니다.</td>'
					+ '</tr>'
					;
			$("#table2").html(htm2);
		para1 = "SELECT_ATTENTION_GET_BY_Y";
		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
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

							$("#table2").html('');
							htm = '';
							$("#table2").append(htm);

							var j = 0;
							var prvMonth = "";
							for (var i = 0; i < data.list.length; i++) {

								var htm = '';
								if (i == 0) {
									htm = ''
										+ '<tr style="color:#333333;height:0.8rem;">'
										+ '	<th>누적 랭킹</th>'
										+ '	<th>누적참여횟수</th>'
										+ '	<th>이름</th>'
										+ '	<th>1월</th>'
										+ '	<th>2월</th>'
										+ '	<th>3월</th>'
										+ '	<th>4월</th>'
										+ '	<th>5월</th>'
										+ '	<th>6월</th>'
										+ '	<th>7월</th>'
										+ '	<th>8월</th>'
										+ '	<th>9월</th>'
										+ '	<th>10월</th>'
										+ '	<th>11월</th>'
										+ '	<th>12월</th>'
										+ '</tr>'
										;
										$("#table2").append(htm);	
								}
								
								j++;
								var k = j;
								var v_weeks = "";
								var v_week_dt = "";
								var tagLine = "";

								htm = ''
									+ '<tr '+tagLine+'>'
									+ '	<td class="center">'+j+'위</td>'
									+ '	<td class="center">'+data.list[i].CNT_TOTAL+'</td>'
									+ '	<td class="center">'+data.list[i].MBR_NM+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_01+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_02+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_03+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_04+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_05+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_06+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_07+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_08+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_09+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_10+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_11+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_12+'</td>'
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
		
	
		var htm3 = ''
			+ '<tr style="color:#333333;height:0.8rem;">'
			+ '	<th>누적 랭킹</th>'
			+ '	<th>누적참여횟수</th>'
			+ '	<th>이름</th>'
			+ '	<th>1일</th>'
			+ '	<th>2일</th>'
			+ '	<th>3일</th>'
			+ '	<th>4일</th>'
			+ '	<th>5일</th>'
			+ '	<th>6일</th>'
			+ '	<th>7일</th>'
			+ '	<th>8일</th>'
			+ '	<th>9일</th>'
			+ '	<th>10일</th>'
			+ '	<th>11일</th>'
			+ '	<th>12일</th>'
			+ '	<th>13일</th>'
			+ '	<th>14일</th>'
			+ '	<th>15일</th>'
			+ '	<th>16일</th>'
			+ '	<th>17일</th>'
			+ '	<th>18일</th>'
			+ '	<th>19일</th>'
			+ '	<th>20일</th>'
			+ '	<th>21일</th>'
			+ '	<th>22일</th>'
			+ '	<th>23일</th>'
			+ '	<th>24일</th>'
			+ '	<th>25일</th>'
			+ '	<th>26일</th>'
			+ '	<th>27일</th>'
			+ '	<th>28일</th>'
			+ '	<th>29일</th>'
			+ '	<th>30일</th>'
			+ '	<th>31일</th>'
			+ '</tr>'
			+ '<tr>'
			+ '	<td class="center" colspan="34">데이터가 없습니다.</td>'
			+ '</tr>'
			;
	$("#table3").html(htm3);	
		para1 = "SELECT_ATTENTION_GET_BY_M";
		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
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

							$("#table3").html('');
							htm = '';
							$("#table3").append(htm);

							var j = 0;
							var prvMonth = "";
							for (var i = 0; i < data.list.length; i++) {

								var htm = '';
								if (i == 0) {
									htm = ''
										+ '<tr style="color:#333333;height:0.8rem;">'
										+ '	<th>누적 랭킹</th>'
										+ '	<th>누적참여횟수</th>'
										+ '	<th>이름</th>'
										+ '	<th>1일</th>'
										+ '	<th>2일</th>'
										+ '	<th>3일</th>'
										+ '	<th>4일</th>'
										+ '	<th>5일</th>'
										+ '	<th>6일</th>'
										+ '	<th>7일</th>'
										+ '	<th>8일</th>'
										+ '	<th>9일</th>'
										+ '	<th>10일</th>'
										+ '	<th>11일</th>'
										+ '	<th>12일</th>'
										+ '	<th>13일</th>'
										+ '	<th>14일</th>'
										+ '	<th>15일</th>'
										+ '	<th>16일</th>'
										+ '	<th>17일</th>'
										+ '	<th>18일</th>'
										+ '	<th>19일</th>'
										+ '	<th>20일</th>'
										+ '	<th>21일</th>'
										+ '	<th>22일</th>'
										+ '	<th>23일</th>'
										+ '	<th>24일</th>'
										+ '	<th>25일</th>'
										+ '	<th>26일</th>'
										+ '	<th>27일</th>'
										+ '	<th>28일</th>'
										+ '	<th>29일</th>'
										+ '	<th>30일</th>'
										+ '	<th>31일</th>'
										+ '</tr>'
										;
										$("#table3").append(htm);	
								}
								
								j++;
								var k = j;
								var v_weeks = "";
								var v_week_dt = "";
								var tagLine = "";

								htm = ''
									+ '<tr '+tagLine+'>'
									+ '	<td class="center">'+j+'위</td>'
									+ '	<td class="center">'+data.list[i].CNT_TOTAL+'</td>'
									+ '	<td class="center">'+data.list[i].MBR_NM+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_01+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_02+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_03+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_04+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_05+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_06+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_07+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_08+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_09+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_10+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_11+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_12+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_13+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_14+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_15+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_16+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_17+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_18+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_19+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_20+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_21+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_22+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_23+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_24+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_25+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_26+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_27+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_28+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_29+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_30+'</td>'
									+ '	<td class="center">'+data.list[i].CNT_31+'</td>'
									+ '</tr>'				
								;
								$("#table3").append(htm);
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
	
	

	function sendResult() {

		messageBox({
			title : '확인',
			message : '저장하시겠습니까?',
			type : 'confirm',
			callback : function() {
				saveData();
			}
		})
	}


	function saveData() {

		var para1 = "FEE_SAVE";
		var para2 = "${para2}";
		var para3 = "9";
		var para4 = $("#txtFeeDt").val();
		
		var load = loading();
		load.show()

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4,
						para5 : para5,
						para6 : para6,
						para7 : para7,
						para8 : para8,
						para9 : para9
					},
					type : "POST",
				    contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						window.location.href="/front/bbc/clb/getPage.htm?pageName=page3&intClbsq=${intClbsq }";	
						load.hide()

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
	
	function tagscheck(arrYyyymm, arrBarRateTT, arrLineRateMM, arrLineRateMW, arrBarCoinTT, arrLineCoinMM, arrLineCoinMW) {

		var yyyyMmRev = arrYyyymm.reverse();
		
        var data = {
			name: ['종합','복식','혼합복식'],
			yyyymm: yyyyMmRev,
			bar1: arrBarRateTT.reverse(),
			line1: arrLineRateMM.reverse(),
			line2: arrLineRateMW.reverse(),
        }

        var data2 = {
			name: ['종합','복식','혼합복식'],
			yyyymm: yyyyMmRev,
			bar1: accumulateArray(arrBarCoinTT.reverse()),
			line1: accumulateArray(arrLineCoinMM.reverse()),
			line2: accumulateArray(arrLineCoinMW.reverse()),
        }

		drew("승율", "chart", data);
		drew("Coin", "chart2", data2);
		
	}
	
    function drew(sTitle, chartID, data) {
        var cw = $("#"+chartID)[0].clientWidth;
        var cHeight = $(window).height();
        var fsizeWeight = 0.013;
        var cHeightWeight = 0.3;
        
        if (cw < 640) {
        	cHeightWeight = 0.4;
        }
        
        var fsize = cHeight * fsizeWeight;
        $("#"+chartID).css('height', cHeight * cHeightWeight + 'px')
        var myChart = echarts.init(document.getElementById(chartID));
        var option = {
				title: {
					text: sTitle,
					top:30,
					textStyle:{
						color:'#555555',
						fontStyle:'normal',
						fontWeight:'bold',
						fontSize:fsize
					}
          		},
				legend: {
					top:0,
					data: data.name,
					itemWidth: 20,
					itemHeight: 12,
					itemGap: 10,
					x: "center",
					y: "top",
            		textStyle:{
						color:'#555555',
						fontStyle:'normal',
						fontWeight:'bold',
						fontSize:fsize
            		}
      			},
          		grid:{
					x:35,
					y:60,
					x2:20,
					y2:30,
					borderWidth:1
          		},
				xAxis: {
					axisLine:{
						lineStyle: {
							color: "#ededed",
							width: 2
              			},
        			},
            		axisLabel :{
						show:true,
						textStyle: { color: '#959595' }
            		},
            		data: data.yyyymm,
          		},
          		yAxis: {
            		axisLine:false,
		            axisLabel :{
						show:true,
						textStyle: { color: '#555555' }
		            },
            		splitNumber: 1,
          		},
          		animationDurationUpdate: 1200,
          		series: [
          			{
						name: '종합',
						type: 'bar',
	            		itemStyle: {
	              			normal: {
	                			label: {  
	                  				show: true,  
									color: "#ccc",
									fontWeight:'bold',
									position: "insideBottom"
	                			},
	                			color: new echarts.graphic.LinearGradient(
	                  				0, 1, 0, 0,
	                  				[
										{offset: 0, color: '#0080c6'},
										{offset: 1, color: '#004d87'}
	                  				]
	                			)
	              			}
	            		},
	            		z: 10,
	            		data: data.bar1
          			},
          			{
						name: '복식',
						type:'line',
						symbol:'circle',
						itemStyle: {
							normal: {
								label: {  
									show: true,  
									color: "#e42e43",
									fontWeight:'bold',
									position: "top"
	                    		},
	                			color: "#e42e43",
								lineStyle: {
									color: "#e42e43"
								}
	              			}
	            		},
	            		z: 100,
	            		data: data.line1
	          		},
	          		{
						name: '혼합복식',
						type:'line',
						symbol:'circle',
						itemStyle: {
							normal: {
								label: {  
									show: true,  
									color: "#ec8921",
									fontWeight:'bold',
									position: "bottom"
								},
			                	color: "#ec8921",
								lineStyle: {
									color: "#ec8921"
								}
			              	}
            			},
			            z: 100,
			            data: data.line2
					}
				]
        };
        myChart.setOption(option);
		$("#scrolltop").click(function(){
			$(".scroll-wrap").animate({scrollTop:"0px"},800)
		})
	}
</script>
</html>
