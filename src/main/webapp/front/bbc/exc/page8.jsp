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
<title>오늘의 게임 목록</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
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
	padding: 15px 0px 15px 0px;
}
.subBtn {
	padding: 0.2rem 0.1rem;
}
.table {
    -webkit-overflow-scrolling:touch
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
</head>

<body>
	<div class="app">

		<div class="content">
		
			<div class="scroll-wrap" id="appPage2">
			
				<div class="container">
				
		          	<div class="btn-wrap" style="padding-top: 10px;">
		          	  <div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
		                <div class="blueBtn subBtn f-col font26" onclick="getData();">조회</div>
		                <div class="orangeBtn subBtn f-col font26" onclick="createGame();">경기생성</div>
		              </div>
		            </div>
		            
					<div class="title2" style="border-top:solid 1px #01cfb9; border-bottom:solid 1px #01cfb9">
						<span class="font24 bold"><a href="/front/bbc/exc/getPage.htm?pageName=page8&intClbsq=${amsClb.CLB_SQ}">게임 목록</a></span> <span
							class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table" id="tableDiv">
							<table class="drag-table" id="table1" cellspacing="0" cellpadding="2" border="1">
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
	});

	function getData() {

		var para1 = "AMS_GAME_SELECT_LIST";
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

					$("#table1").html('');

					var htm = '';
					htm = ''
						+ '<tr>'
						+ '	<th>게임번호</th>'
						+ '	<th>상태</th>'
						+ '	<th>A팀</th>'
						+ '	<th>B팀</th>'
						+ '	<th>점수판</th>'
						+ '	<th>입력</th>'
						+ '</tr>'
						;
						$("#table1").append(htm);	
						
					for (var i = 0; i < data.list.length; i++) {
						
						htm = ''
						+ '<tr>'
						+ '	<td class="center">'+data.list[i].GAME_SQ+'</td>'
						+ '	<td class="center">'+data.list[i].GAME_ST_NM+'</td>'
						+ '	<td class="center">'+data.list[i].A_TEM_SCR+'</td>'
						+ '	<td class="center">'+data.list[i].B_TEM_SCR+'</td>'
						+ '	<td class="center" style="text-decoration: underline;"><a href="/front/bbc/exc/getPage.htm?pageName=page9&intClbsq=${amsClb.CLB_SQ}&intMtcsetcnt='+data.list[i].GAME_SQ+'"><span class="mdi mdi-youtube-tv" style="font-size: 0.5rem;"></span></a></td>'
						+ '	<td class="center" style="text-decoration: underline;"><a href="/front/bbc/clb/gameRegWithScoreBoard.htm?intClbsq=${amsClb.CLB_SQ}&intMtcsetcnt='+data.list[i].GAME_SQ+'"><span class="mdi mdi-pencil-plus" style="font-size: 0.5rem;"></span></a></td>'
						+ '</tr>'					
						;
						$("#table1").append(htm);
						prvMonth = data.list[i].YYYYMM;
					}
				} else {

				}
				load.hide()

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
						window.location = '/front/bbc/clb/gameRegWithScoreBoard.htm?intClbsq=${amsClb.CLB_SQ}&intMtcsetcnt='+data.list[i].GAME_SQ;
					}
				} else {

				}
				load.hide()

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
	
	
</script>
</html>
