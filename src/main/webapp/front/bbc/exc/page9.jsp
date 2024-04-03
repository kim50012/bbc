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

<title>점수판 가로세로 자동변환</title>
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
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
<body onkeydown="inputKey(event)">
	<div class="app news14_app" id="appPointInput">
		<div class="content">
			<div style="height:100%;">
				<div class="container">
					<div class="model-wrap" style="height: 0.1rem;color: black;font-size: 0.2rem;padding: 0;padding-top: 0.1rem;">
						<div class="subBtn f-col font26 blueBtn" id="gameNo" style="padding: 0.13rem;margin: 0;">GAME NO : ${intMtcsetcnt}</div>
					</div>
					<div class="model-wrap">
						<div class="left-model" id="backA">
							<p class="font336 bold fontBlack" id="pointA">0</p>
						</div>
			          	<div class="btn-wrap" style="padding-top: 0.7rem;">
			          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;display: initial;">
			                <div class="subBtn f-col font26" style="margin-bottom:0.1rem;padding:0rem;" onclick="changeCt();">
			                	<span class="mdi mdi-arrow-left-bold-box" style="font-size: 0.5rem;" onclick="window.location='/front/bbc/exc/getPage.htm?pageName=page8&intClbsq=${amsClb.CLB_SQ}'"></span>
			                </div>
			                <div class="subBtn f-col font26" style="margin-bottom:0.1rem;padding:0rem;margin-top: 0.7rem;" onclick="init();">
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

		var para1 = "AMS_GAME_SELECT_ONE";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "${intMtcsetcnt}";
		
		var scoreA = $("#pointA").html();
		var scoreB = $("#pointB").html();

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
					for (var i = 0; i < data.list.length; i++) {
						$("#pointA").html(data.list[i].A_TEM_SCR);
						$("#pointB").html(data.list[i].B_TEM_SCR);
						$("#backA").css('background-color','#f4f5f8');
						$("#backB").css('background-color','#f4f5f8');
						
						if (scoreA != data.list[i].A_TEM_SCR) {
							$("#backA").css('background-color','#efff00');
						}
						if (scoreB != data.list[i].B_TEM_SCR) {
							$("#backB").css('background-color','#efff00');
						}
						
						var gameStatus = data.list[i].GAME_ST;
						$("#gameNo").removeClass('blueBtn');
						$("#gameNo").removeClass('orangeBtn');
						if (gameStatus == "END") {
							$("#gameNo").addClass('orangeBtn');
							endCount++;
							if (endCount > 10) {
								createGame();
							}
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


	function createGame() {

		var para1 = "AMS_GAME_CREATE";
		var para2 = "${amsClb.CLB_SQ}";

		var load = loading();
		load.show()

		$.ajax({
			data : {
				para1 : para1,
				para2 : para2
			},
			type : "POST",
			url : "/front/bbc/clb/getData.htm",
			success : function(data) {

				if (data.list.length != 0) {
					for (var i = 0; i < data.list.length; i++) {
						window.location = '/front/bbc/exc/getPage.htm?pageName=page9&intClbsq=${amsClb.CLB_SQ}&intMtcsetcnt='+data.list[i].GAME_SQ;
					}
				}
				load.hide()

			},
			error : function(xhr, status, e) {
				load.hide()
				alert("Error : " + status);
			}
		});
	}		
	
	function inputKey(key) {
	    if (key.keyCode == 37) {
	    	addPointA(-1);
	    }
	    if (key.keyCode == 38) {
	    	addPointA(1);
	    }
	    if (key.keyCode == 39) {
	    	addPointB(1);
	    }
	    if (key.keyCode == 40) {
	    	addPointB(-1);
	    }
	}	

	$(window).bind('orientationchange resize', function(event){
		window.location.reload();
	});

	$("#pointA").html(Number(getCookie("inputScoreA")));
	$("#pointB").html(Number(getCookie("inputScoreB")));

	function gotoPg(a) {
		window.location.href="gamePointInput2.html";
	}
	
	function init() {
		$("#pointA").html(0);
		$("#pointB").html(0);
		setCookie("A", 0);
		setCookie("B", 0);
	}
	function addPointA(a){
		var point = $("#pointA").html();
		var rlt = Number(point)+Number(a);
		if (rlt < 0) {
			rlt = 0;
		}
		$("#pointA").html(rlt);
		setCookie("A", rlt);
	}
	function addPointB(a){
		var point = $("#pointB").html();
		var rlt = Number(point)+Number(a);
		if (rlt < 0) {
			rlt = 0;
		}
		$("#pointB").html(rlt);
		setCookie("B", rlt);
	}
	function changeCt() {
		var pointA = $("#pointA").html();
		var pointB = $("#pointB").html();
		$("#pointA").html(pointB);
		$("#pointB").html(pointA);
		setCookie("A", pointB);
		setCookie("B", pointA);
	}
	function setCookie(a, b) {
		var date = new Date();
		date.setDate(date.getDate() + 1);
		
		var willCookie = "";
		willCookie += "inputScore"+a+"="+b+";";
		willCookie += "expires=" + date.toUTCString();
		document.cookie = willCookie;	
	}
	function gameEnd() {
		window.location.href='/front/bbc/clb/gameReg.htm?intClbsq=9&intAtemscr='+$("#pointA").html()+"&intBtemscr="+$("#pointB").html();
	}
	function getCookie(name) {

        // 변수를 선언한다.
        var cookies = document.cookie.split(";");

        // 쿠키를 추출한다.
        for(var i in cookies) {
            if(cookies[i].search(name) != -1) {
            	return decodeURIComponent(cookies[i].replace(name + "=", ""));
            }
        }
        return 0;
    }
	
</script>	
</html>
