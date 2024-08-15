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
<title>월별현황</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
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
				<div class="container">
				
					<div class="title2">
						<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}">월별 현황</a></span> <span
							class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>


					<div class="content" id="chartArea1" style="padding: 20px;">
						<div class="chart" id="chart"></div>
					</div>
					
					<div class="content" id="chartArea2" style="padding: 20px;">
						<div class="chart2" id="chart2"></div>
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

		tableDiv
		
		var para1 = "SELECT_BBC_GET_BY_MONTHLY";
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
											+ '<tr>'
											+ '	<th>월</th>'
											+ '	<th>BBC순위</th>'
											+ '	<th>승율순위</th>'
											+ '	<th>이름</th>'
											+ '	<th>승/패</th>'
											+ '	<th><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=${para3}&para4=WIN_RATE&para5=${para5}">승율</a></th>'
											+ '	<th><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=${para3}&para4=BBC&para5=${para5}">BBC</a></th>'
											+ '	<th>월</th>'
											+ '	<th>남여복<br>BBC순위</th>'
											+ '	<th>남여복<br>승율순위</th>'
											+ '	<th>이름</th>'
											+ '	<th>남여복<br>승/패</th>'
											+ '	<th><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=${para3}&para4=MMW_WIN_RATE&para5=${para5}">남여복<br>승율</a></th>'
											+ '	<th><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=${para3}&para4=MMW_BBC&para5=${para5}">남여복<br>BBC</a></th>'
											+ '	<th>월</th>'
											+ '	<th>혼복<br>BBC순위</th>'
											+ '	<th>혼복<br>승율순위</th>'
											+ '	<th>이름</th>'
											+ '	<th>혼복<br>승/패</th>'
											+ '	<th><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=${para3}&para4=MW_WIN_RATE&para5=${para5}">혼복<br>승율</a></th>'
											+ '	<th><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=${para3}&para4=MW_BBC&para5=${para5}">혼복<br>BBC</a></th>'
											+ '</tr>'
											;
											$("#table1").append(htm);	
									}
								}
								
								j++;
								var k = j;
								
								htm = ''
								+ '<tr>'
								+ '	<td class="center" style="text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=&para5='+data.list[i].YYYYMM+'">'+data.list[i].YYYYMM+'</a></td>'
								+ '	<td class="center" style="font-weight: bold;">'+data.list[i].RANK_BBC+'</td>'
								+ '	<td class="center" style="font-weight: bold;color: blue;">'+data.list[i].RANK_RATE+'</td>'
								+ '	<td class="center" style="text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3='+data.list[i].MBR_SQ+'&para5='+data.list[i].YYYYMM+'">'+data.list[i].CLB_NIK_NM+'</a></td>'
								+ '	<td class="center">'+data.list[i].WIN+'/'+data.list[i].LOSE+'</td>'
								+ '	<td class="center">'+data.list[i].WIN_RATE+'%</td>'
								+ '	<td class="center">'+data.list[i].RANK_TREND_TAG+'</td>'
								+ '	<td class="center" style="background-color: #fffed4;text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=&para5='+data.list[i].YYYYMM+'">'+data.list[i].YYYYMM+'</a></td>'
								+ '	<td class="center" style="background-color: #fffed4;font-weight: bold;">'+data.list[i].RANK_BBC_MMW+'</td>'
								+ '	<td class="center" style="background-color: #fffed4;font-weight: bold;color: blue;">'+data.list[i].RANK_RATE_MMW+'</td>'
								+ '	<td class="center" style="background-color: #fffed4;text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3='+data.list[i].MBR_SQ+'&para5='+data.list[i].YYYYMM+'">'+data.list[i].CLB_NIK_NM+'</a></td>'
								+ '	<td class="center" style="background-color: #fffed4;">'+data.list[i].MMW_WIN+'/'+data.list[i].MMW_LOSE+'</td>'
								+ '	<td class="center" style="background-color: #fffed4;">'+data.list[i].MMW_WIN_RATE+'%</td>'
								+ '	<td class="center" style="background-color: #fffed4;">'+data.list[i].MMW_RANK_TREND_TAG+'</td>'
								+ '	<td class="center" style="text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3=&para5='+data.list[i].YYYYMM+'">'+data.list[i].YYYYMM+'</a></td>'
								+ '	<td class="center" style="font-weight: bold;">'+data.list[i].RANK_BBC_MW+'</td>'
								+ '	<td class="center" style="font-weight: bold;color: blue;">'+data.list[i].RANK_RATE_MW+'</td>'
								+ '	<td class="center" style="text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page7&intClbsq=${amsClb.CLB_SQ}&para3='+data.list[i].MBR_SQ+'&para5='+data.list[i].YYYYMM+'">'+data.list[i].CLB_NIK_NM+'</a></td>'
								+ '	<td class="center">'+data.list[i].MW_WIN+'/'+data.list[i].MW_LOSE+'</td>'
								+ '	<td class="center">'+data.list[i].MW_WIN_RATE+'%</td>'
								+ '	<td class="center">'+data.list[i].MW_RANK_TREND_TAG+'</td>'
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
	
	function tagscheck(arrYyyymm, arrBarRateTT, arrLineRateMM, arrLineRateMW, arrBarCoinTT, arrLineCoinMM, arrLineCoinMW) {

        var data = {
			name: ['종합','복식','혼합복식'],
			yyyymm: arrYyyymm.reverse(),
			bar1: arrBarRateTT.reverse(),
			line1: arrLineRateMM.reverse(),
			line2: arrLineRateMW.reverse(),
        }

        var data2 = {
			name: ['종합','복식','혼합복식'],
			yyyymm: arrYyyymm.reverse(),
			bar1: arrBarCoinTT.reverse(),
			line1: arrLineCoinMM.reverse(),
			line2: arrLineCoinMW.reverse(),
        }

		drew("승율", "chart", data);
		drew("Coin", "chart2", data2);
		
	}
	
    function drew(sTitle, chartID, data) {
        var cw = $("#"+chartID)[0].clientWidth;
        var cHeight = $(window).height();
        var fsize = cHeight * 0.013;
        $("#"+chartID).css('height', cHeight * 0.2 + 'px')
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
					x2:0,
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
