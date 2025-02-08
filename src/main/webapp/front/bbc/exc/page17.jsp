<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>현황판</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/jquery.touchSwipe.js"></script>
<style type="text/css">
	.app {
		padding-top: 0rem;
		width: 100%;
	}
	.app > .content {
    	padding-bottom: 0rem;
	}
	.container {
		height: 100%;
	}
	.left-model, .right-model {
		height: 100%;
	}
	.title2 {
		height: 10%;
		padding: 0rem;
		display: initial;
	}
	.model-wrap {
		height: 3.3rem;
    	padding-top: 0.3rem;
	}
	.font336 {
		font-size: 2.36rem;
	}
	.font26 {
		line-height: 0;
    	font-size: 0.18rem;
	}
	.btn-wrap {
    	padding-bottom: 0.1rem;
    	padding-top: 0.1rem;
	}
	.subBtn {
    	padding: 0.16rem 0.1rem;
    }
	body {
		width: 100%;
	}
</style>
</head>
<body id="body">
	<div class="app news14_app" id="appPointInput">
		<div class="content">
			<div style="height:100%;">
				<div class="container">
					<div class="model-wrap" style="height: 0.1rem;color: black;font-size: 0.2rem;padding: 0;padding-top: 0.1rem;">
						<div class="subBtn f-col font26 blueBtn" id="gameNo" style="padding: 0.13rem;margin: 0;"></div>
					</div>
					<div class="model-wrap">
						<div class="left-model" id="backA">
							<p class="font336 bold fontBlack" id="pointA">0</p>
						</div>
			          	<div class="btn-wrap" style="padding-top: 0.7rem;">
			          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;">
			                <div class="subBtn f-col font26" style="margin-bottom:0.1rem;padding:0rem;">
			                	<span class="mdi mdi-arrow-left-bold-box" style="font-size: 0.5rem;" onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page8&intClbsq=${amsClb.CLB_SQ}'"></span>
			                </div>
			                
			                <div class="subBtn f-col font26" style="margin-bottom:0.1rem;padding:0rem;margin-top: 0.2rem;">
			                	<span class="mdi mdi-swap-horizontal-bold" style="font-size: 0.5rem;" onclick="changeCt();"></span>
			                </div>

			                <div class="subBtn f-col font26" style="margin-bottom:0.1rem;padding:0rem;margin-top: 0.2rem;">
			                	<span class="mdi mdi-refresh-circle" style="font-size: 0.5rem;" onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page9&intClbsq=${amsClb.CLB_SQ}&intMtcsetcnt=${intMtcsetcnt}'"></span>
							</div>
			              </div>
			            </div>
						<div class="left-model" id="backB">
							<p class="font336 bold fontBlack" id="pointB">0</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	var endCount = 0;

	$(function() {
		setInterval(function(){
			getData();
		}, 2000);
	});

	function getData() {

		var para1 = "SELECT_MINI_GAME_LIST_BY_COURT_ONE";
		var para2 = "${intClbsq}";
		var para3 = "${para2}";
		var para4 = "${para1}";
		
		var scoreA = $("#pointA").html();
		var scoreB = $("#pointB").html();

		$.ajax({
			data : {
				para1 : para1,
				para2 : para2,
				para3 : para3,
				para4 : para4
			},
			type : "POST",
			url : "/front/bbc/badMatch/getData.htm",
			success : function(data) {
				if (data.list.length != 0) {
					for (var i = 0; i < data.list.length; i++) {
						$("#pointA").html(data.list[i].A_TEM_SCR);
						$("#pointB").html(data.list[i].B_TEM_SCR);
						$("#backA").css('background-color','#f4f5f8');
						$("#backB").css('background-color','#f4f5f8');
						
						$("#gameNo").html(data.list[i].COURT+" 코트 "+data.list[i].GAME_SEQ+" 경기 : "+data.list[i].P_NM_A1+","+data.list[i].P_NM_A2+" vs "+data.list[i].P_NM_B1+","+data.list[i].P_NM_B2);
						
						if (scoreA != data.list[i].A_TEM_SCR) {
							$("#backA").css('background-color','#efff00');
						}
						if (scoreB != data.list[i].B_TEM_SCR) {
							$("#backB").css('background-color','#efff00');
						}
						
						var gameStatus = data.list[i].GAME_RESULT;
						$("#gameNo").removeClass('blueBtn');
						$("#gameNo").removeClass('orangeBtn');
						if (gameStatus == "END") {
							$("#gameNo").addClass('orangeBtn');
						}
						if (gameStatus == "ING") {
							$("#gameNo").addClass('blueBtn');
						}
					}
				}
			},
			error : function(xhr, status, e) {
				load.hide()
				alert("Error : " + status);
			}
		});
		
	}

	$(window).bind('orientationchange resize', function(event){
		window.location.reload();
	});

	function gotoPg(a) {
		window.location.href="gamePointInput2.html";
	}

	function gameEnd() {
		window.location.href='/front/bbc/clb/gameReg.htm?intClbsq=9&intAtemscr='+$("#pointA").html()+"&intBtemscr="+$("#pointB").html();
	}

	function changeCt() {
		var pointA = $("#pointA").html();
		var pointB = $("#pointB").html();
		$("#pointA").html(pointB);
		$("#pointB").html(pointA);
	}
</script>	
</html>
