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
<title>운동참석예상</title>
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
              <!-- 这里如果是没有权限的加class->noclick -->
<!--               <div class="select-btn" id="eap">결재</div> -->

				<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
					<input class="imgContent" type="date" name="datFrdt" id="datFrdt" value="${para3 }" />
					<div></div>
				</div>              
              
              	<button class="confirmBtn" id="confirmBtn" onclick="getData($('#datFrdt').val());">${label.查询}</button>
            </div>
          </div>
          			
			
				<div class="container">
				
					<div class="title2">
						<span class="font24 bold">추가 참석 회원 (예측)</span> <span
							class="font20 fontOrange">기준：최근 한달</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>이름</th>
									<th>참여가능 총횟수</th>
									<th>최근참여횟수</th>
									<th>참석확율</th>
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
		getData("${para3 }");
	});

	function getData(para3) {

		var para1 = "MBR_JIN_RATE";
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
							+ '	<th>참여가능 총횟수</th>'
							+ '	<th>참여횟수</th>'
							+ '	<th>참석확율</th>'
							+ '</tr>'
							;
							$("#table1").append(htm);
							
							for (var i = 0; i < data.list.length; i++) {
								var htm = '';
								
								if (data.list[i].CLB_NIK_NM == "TOTAL") {
									htm = ''
										+ '<tr>'
										+ '	<td class="center">'+(i+1)+'</td>'
										+ '	<td class="center">'+data.list[i].CLB_NIK_NM+'</td>'
										+ '	<td class="center" colspan="3">약 '+data.list[i].MBR_CNT+' 명 (현:'+data.list[i].RATE+'명, 추가:'+data.list[i].CNT+'명 예상)</td>'
										+ '</tr>'					
										;
										$("#table1").append(htm);
								}
								else {
									htm = ''
										+ '<tr>'
										+ '	<td class="center">'+(i+1)+'</td>'
										+ '	<td class="center">'+data.list[i].CLB_NIK_NM+'</td>'
										+ '	<td class="center">'+data.list[i].CNT+'</td>'
										+ '	<td class="center">'+data.list[i].MBR_CNT+'</td>'
										+ '	<td class="center">'+data.list[i].RATE+' %</td>'
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
	
	

	
</script>
</html>
