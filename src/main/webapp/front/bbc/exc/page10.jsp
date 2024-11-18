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
<title>MVP</title>
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
		              <div onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page10&intClbsq=${amsClb.CLB_SQ}';" class="active"><p>MVP 전체 현황</p></div>
		              <div onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page11&intClbsq=${amsClb.CLB_SQ}';"><p>MVP 월간/주간 횟수</p></div>
		            </div>
		            
					<div class="content" style="height:5px;">
					</div>

					<div class="table-wrap">
						<div class="table" id="tableDiv" style="overflow: scroll;height: 87Vh;">
							<table class="drag-table noWrapTable" id="table1" cellspacing="0" cellpadding="2" border="1" style="height:300px;">
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
		appWidth();	
	});
	
	function appWidth() {
		$(".app").css("width", $(window).width());
	}

	function getData() {
		var para1 = "SELECT_MVP_GET_BY_W_M";
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

								var htm = '';
								if (data.list[i].BBC_RANK == 1 && data.list[i].DATA_TYPE == "M") {
									htm = ''
										+ '<tr style="color:#333333;">'
										+ '	<th>주차/월</th>'
										+ '	<th>일자</th>'
										+ '	<th>이름</th>'
										+ '	<th>순위</th>'
										+ '	<th>MVP</th>'
										+ '	<th>승/패</th>'
										+ '	<th>승률</th>'
										+ '	<th>BBC</th>'
										+ '	<th>약자<BR>대상</th>'
										+ '	<th>동급<BR>대상</th>'
										+ '	<th>강자<BR>대상</th>'
										+ '	<th>MVP SCORE</th>'
										+ '</tr>'
										;
										$("#table1").append(htm);	
								}
								
								j++;
								var k = j;
								var v_weeks = "";
								var v_week_dt = "";
								var tagLine = "";

								if (data.list[i].BBC_RANK == 1) {
									v_weeks = data.list[i].WEEKS;
									v_week_dt = data.list[i].WEEK_DT;
								}

								if (data.list[i].BBC_RANK == 1 && data.list[i].DATA_TYPE == "M") {
									tagLine = 'class="activeTr"';
								}
								if (data.list[i].BBC_RANK == 1 && data.list[i].DATA_TYPE == "W") {
									tagLine = 'class="activeTr2"';
								}
								
								htm = ''
								+ '<tr '+tagLine+'>'
								+ '	<td class="center" style="font-weight: bold;">'+v_weeks+'</td>'
								+ '	<td class="center" style="font-weight: bold;">'+v_week_dt+'</td>'
								+ '	<td class="center" style="font-weight: bold;'+data.list[i].MVP_TAG+'">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '	<td class="center" style="font-weight: bold;">'+data.list[i].BBC_RANK+'</td>'
								+ '	<td class="center" style="font-weight: bold;'+data.list[i].MVP_TAG+'">'+data.list[i].MVP+'</td>'
								+ '	<td class="center">'+data.list[i].WIN+'/'+data.list[i].LOSE+'</td>'
								+ '	<td class="center">'+data.list[i].WIN_RATE+'%</td>'
								+ '	<td class="center">'+data.list[i].BBC+'</td>'
								+ '	<td class="center">'+data.list[i].BBC_MINUS+'</td>'
								+ '	<td class="center">'+data.list[i].BBC_EQUAL+'</td>'
								+ '	<td class="center">'+data.list[i].BBC_PLUS+'</td>'
								+ '	<td class="center" style="font-weight: bold;'+data.list[i].MVP_TAG+'">'+data.list[i].BBC_TOTAL+'</td>'
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
