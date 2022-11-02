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
<title>클럽 회원 휴가 관리</title>
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
			

		          <div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
		            <div class="bottom-model" style="padding-top: 0;">
						<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<input class="imgContent" type="date" name="datFrdt" id="datFrdt" value="${amsClb.TODAY}" />
							<div></div>
						</div>              
		              
		              	<button class="confirmBtn" id="confirmBtn" onclick="getData($('#datFrdt').val());">${label.查询}</button>
		            </div>
		          </div>
		          
		          

		          <div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0.2rem;display:none;" id="inputDiv">
		            <div class="bottom-model" style="padding-top: 0;">
						<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<select id="mbrSq">
							</select>
							<div></div>
						</div>  
		            </div>
		            <div class="bottom-model" style="padding-top: 0.2rem;;">
						<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<input class="imgContent" type="date" id="frDt" value="${amsClb.TODAY}" />
							<div></div>
						</div>  
		            </div>
		            <div class="bottom-model" style="padding-top: 0.2rem;">
						<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<input class="imgContent" type="date" id="toDt" value="${amsClb.TODAY}" />
							<div></div>
						</div>
		            </div>
		            <div class="bottom-model" style="padding-top: 0.2rem;">
		              	<button class="confirmBtn" id="confirmBtn" onclick="saveData();">${label.保存}</button>
		            </div>
		          </div>
          			
			
				<div class="container">
				
					<div class="title2">
						<span class="font24 bold">휴가 관리 목록</span> <span
							class="font20 fontOrange" onclick="$('#inputDiv').toggle();">신규등록</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>이름</th>
									<th>시작</th>
									<th>종료</th>
									<th>기능</th>
								</tr>
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
		getDataMbrSq();
	});

	function getDataMbrSq() {

		var para1 = "AMS_CLB_MBR_SELECT";
		var para2 = "${amsClb.CLB_SQ}";

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						if (data.list.length != 0) {

							$("#mbrSq").html('');

							for (var i = 0; i < data.list.length; i++) {
								var htm = '';

								htm = ''
									+ '	<option value="'+data.list[i].MBR_SQ+'">'+data.list[i].CLB_NIK_NM+'</option>'				
									;
									$("#mbrSq").append(htm);

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


	function saveData() {

		var para1 = "AMS_CLB_MBR_HDAY_INSERT";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = $('#mbrSq').val();
		var para4 = $('#frDt').val();
		var para5 = $('#toDt').val();
		var para6 = "";

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4,
						para5 : para5,
						para6 : para6
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						getData('');
						load.hide()
					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
	function getData(para3) {

		var para1 = "AMS_CLB_MBR_HDAY_SELECT";
		var para2 = "${amsClb.CLB_SQ}";

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

							htm = ''
							+ '<tr>'
							+ '	<th>No</th>'
							+ '	<th>이름</th>'
							+ '	<th>시작</th>'
							+ '	<th>종료</th>'
							+ '	<th>기능</th>'
							+ '</tr>'
							;
							$("#table1").append(htm);
							
							for (var i = 0; i < data.list.length; i++) {
								var htm = '';

								htm = ''
									+ '<tr>'
									+ '	<td class="center">'+(i+1)+'</td>'
									+ '	<td class="center">'+data.list[i].CLB_NIK_NM+'</td>'
									+ '	<td class="center">'+data.list[i].FRDT+'</td>'
									+ '	<td class="center">'+data.list[i].TODT+'</td>'
									+ '	<td class="center"><span onclick="deleteHday('+data.list[i].H_SQ+');">삭제</span></td>'
									+ '</tr>'					
									;
									$("#table1").append(htm);

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

	function deleteHday(para3) {

		messageBox({
			title : '확인',
			message : '삭제하시겠습니까?',
			type : 'confirm',
			callback : function() {
				deleteHdayAct(para3);
			}
		})
	}	

	function deleteHdayAct(para3) {

		var para1 = "AMS_CLB_MBR_HDAY_UPDATE";
		var para2 = "${amsClb.CLB_SQ}";
		var para4 = "0";

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						getData($('#datFrdt').val());
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
