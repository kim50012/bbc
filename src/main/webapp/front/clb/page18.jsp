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
<title>미니게임결과</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
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
</style>
</head>

<body>
	<div class="app">


		<div class="content">
			<div class="scroll-wrap refresh-wrap" id="appPage2">
				<div class="container" style="padding-top:0.1rem;">
				
          <div class="model-gray" style="padding-top: 0.2rem;background: #fff;margin: 0.2rem;">
          

            <div class="bottom-model" style="padding-top: 0;">
				<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
					<input class="imgContent" type="date" name="datFrdt" id="datFrdt" value="${amsClb.TODAY}" />
					<div></div>
				</div>              
              
              	<button class="confirmBtn" id="confirmBtn" onclick="getData($('#datFrdt').val());">${label.查询}</button>
            </div>
          </div>
          				
				
					<div class="title2">
						<span class="font24 bold">회원관리</span> <span
							class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>팀</th>
									<th>코인</th>
									<th>점수</th>
									<th>점수</th>
									<th>코인</th>
									<th>팀</th>
								</tr>
								<!--
								<tr>
									<td class="center">합계</td>
									<td>9,828</td>
									<td>10,327</td>
									<td>11,998</td>
								</tr>
								-->
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
		getData("${amsClb.TODAY}");
	});


	function sendFee() {

		if ("${loginMbrSq}" != "20") {

			messageBox({
				title : '확인',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {
				}
			})
			return;
		}
		
		messageBox({
			title : '확인',
			message : '전체회원에게 회원납부 공지를 하시겠습니까?',
			type : 'confirm',
			callback : function() {
				sendFeeAction();
			}
		})
	}

	function sendFeeAction() {

		var load = loading();
		load.show()

		$.ajax({
			data : {},
			type : "POST",
			url : "/front/bbc/clb/sendFee.htm",
			success : function(data) {
				load.hide()
				alert("정상적으로 공지 발송이 되었습니다.");
			},
			error : function(xhr, status, e) {
				load.hide()
				alert("Error : " + status);
			}
		});
	}


	function getData(dt) {

		var para1 = "MINI_GAME";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = dt;

		var load = loading();
		load.show()

		$
				.ajax({
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
									+ '	<th>점수</th>'
									+ '	<th>코인</th>'
									+ '	<th>'+data.list[i].B_TEAM_NM+'</th>'
									+ '</tr>'
									;
									$("#table1").append(htm);
								}
								

								if (data.list[i].A_TEAM_NM == 'TOTAL') {
									htm = ''
									+ '<tr>'
									+ '	<td class="center">'+(i+1)+'</td>'
									+ '	<td class="center">'+data.list[i].ANAME+'</td>'
									+ '	<td class="center">'+data.list[i].BBCA+'</td>'
									+ '	<td class="center">'+data.list[i].ASCR+'</td>'
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
						load.hide()

					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
	function phoneHtml(a) {
		
		if (a == "") {
			return "";
		}
		else {
			return '<a href="tel:'+a+'">전화</a>';
		}
		
		return b
	}


	function deleteFee(a) {

		if ("${loginMbrSq}" != "20") {

			messageBox({
				title : '확인',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {
				}
			})
			return;
		}
		
		messageBox({
			title : '확인',
			message : '정회원에서 삭제하시겠습니까?',
			type : 'confirm',
			callback : function() {
				deleteMbrFee(a);
			}
		})
	}


	function deleteMbrFee(a) {

		var para1 = "MBR_FEE_USER_UPDATE";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = a;
		var para4 = "D";

		var load = loading();
		load.show();
		
		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
					},
					type : "POST",
				    contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						load.hide();
						getData();
					},
					error : function(xhr, status, e) {
						load.hide();
					}
				});
	}     
	
</script>
</html>
