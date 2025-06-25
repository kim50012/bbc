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
<title>회비관리</title>
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
.centerA {
    text-align: center !important;
    background: #0080c6 !important;
}
.centerB {
    text-align: center !important;
    background: #ffffff !important;
}
.centerC {
    text-align: center !important;
    background: #f8971d !important;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		$("#app").prepend(htm)
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
		
			<div class="scroll-wrap" id="app">
				<div class="container">

		            <div class="tab-header">
		              <div onclick="tab(this, 1)"><p>정회원목록</p></div>
		              <div onclick="tab(this, 2)"><p>회비납부현황</p></div>
		            </div>
		            
		            <div class="scroll-wrap f-col pb22" id="tab1" style="padding-bottom: 4rem;">
						<div class="title2">
							<span class="font24 bold">회원관리</span> <span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
						</div>
	
						<div class="table-wrap">
							<div class="table">
								<table class="drag-table alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
									<tr>
										<th>No</th>
										<th>이름</th>
										<th>회원유형</th>
										<th>휴대폰</th>
										<th>최근납부</th>
										<th>삭제</th>
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
		            
		            <div class="scroll-wrap f-col pb22" id="tab2" style="padding-bottom: 4rem;">
						<div class="model-gray">
				            <div class="bottom-model" style="padding-top: 0;">
								<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
						         	<select id="birthYear" class="select-btn" style="width: 100%;">
						         		<option value="">년도를 선택하세요.</option>
						         	   	<c:forEach var="idx" begin="2020" end="2030"  > 
											<option value="${idx}">${idx}</option>
										</c:forEach> 
						         	</select>
								</div>
				              	<button class="confirmBtn" id="confirmBtn" onclick="getData2($('#birthYear').val());">조회</button>
				            </div>
				        </div>						
	
						<div class="title2">
							<span class="font24 bold">월별납부현황</span> <span class="font20 fontOrange" onclick="window.location='/front/bbc/clb/getPage.htm?pageName=page1&intClbsq=${amsClb.CLB_SQ}';">등록수정하기</span>
						</div>
						
						<div class="table-wrap">
							<div class="table">
								<table class="drag-table noWrapTable" id="table2" cellspacing="0" cellpadding="2" width="100%" border="1">
									<tr>
										<th>이름</th>
										<th>회원유형</th>
										<th>1월</th>
										<th>2월</th>
										<th>3월</th>
										<th>4월</th>
										<th>5월</th>
										<th>6월</th>
										<th>7월</th>
										<th>8월</th>
										<th>9월</th>
										<th>10월</th>
										<th>11월</th>
										<th>12월</th>
									</tr>
								</table>
							</div>
						</div>
		            </div>
		            
		            
				</div>
			</div>
		</div>


	</div>

</body>
<script type="text/javascript">

	function tab(el, index) {
	  $(".active").removeClass('active');
	  $(el).addClass('active');
	  if(index == 1) {
	      $("#tab1").show();
	      $("#tab2").hide();
		  	$("#tab3").hide();
			getData();
	  } else if(index == 2) {
	      $("#tab1").hide();
	      $("#tab2").show();
		  	$("#tab3").hide();
			getData2();
		  getData(1);
	  } else if(index == 3) {
	  }
	}
	$(function() {
	  $(".tab-header p").eq(0).click()
	})
	

	$(function() {
		getData();
	});


	function sendFee() {

		if ("${amsClb.CLB_GD}" != "A") {

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


	function getData() {

		var para1 = "MBR_USER_LIST";
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

							$("#table1").html('');

							htm = ''
							+ '<tr>'
							+ '	<th>No</th>'
							+ '	<th>이름</th>'
							+ '	<th>회원유형</th>'
							+ '	<th>휴대폰</th>'
							+ '	<th>최근납부</th>'
							+ '	<th>삭제</th>'
							+ '</tr>'
							;
							$("#table1").append(htm);
							
							for (var i = 0; i < data.list.length; i++) {
								var htm = '';
								htm = ''
								+ '<tr>'
								+ '	<td class="center">'+(i+1)+'</td>'
								+ '	<td class="center">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '	<td class="center">'+data.list[i].MMO+'</td>'
								+ '	<td class="center">'+phoneHtml(data.list[i].MOBILE)+'</td>'
								+ '	<td class="center">'+data.list[i].FEEMM+'</td>'
								+ '	<td class="center" onclick="deleteFee('+data.list[i].MBR_SQ+');">삭제</td>'
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
	
	

	function getData2(para3) {

		var para1 = "SELECT_AMS_CLB_MBR_FEE_HIST_MONTHLY";
		var para2 = "${amsClb.CLB_SQ}";

		var load = loading();
		load.show()

		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3
					},
					type : "POST",
					url : "/front/bbc/badMatch/getData.htm",
					success : function(data) {

						if (data.list.length != 0) {

							$("#table2").html('');

							htm = ''
							+ '<tr>'
							+ '	<th>이름</th>'
							+ '	<th>회원유형</th>'
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
							
							for (var i = 0; i < data.list.length; i++) {
								var htm = '';
								htm = ''
								+ '<tr>'
// 								+ '	<td class="center">'+(i+1)+'</td>'
								+ '	<td class="center">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '	<td class="center">'+data.list[i].CLB_GD_NM+'</td>'
								+ '	<td class="center'+data.list[i].TG01+'">'+data.list[i].MM01+'</td>'
								+ '	<td class="center'+data.list[i].TG02+'">'+data.list[i].MM02+'</td>'
								+ '	<td class="center'+data.list[i].TG03+'">'+data.list[i].MM03+'</td>'
								+ '	<td class="center'+data.list[i].TG04+'">'+data.list[i].MM04+'</td>'
								+ '	<td class="center'+data.list[i].TG05+'">'+data.list[i].MM05+'</td>'
								+ '	<td class="center'+data.list[i].TG06+'">'+data.list[i].MM06+'</td>'
								+ '	<td class="center'+data.list[i].TG07+'">'+data.list[i].MM07+'</td>'
								+ '	<td class="center'+data.list[i].TG08+'">'+data.list[i].MM08+'</td>'
								+ '	<td class="center'+data.list[i].TG09+'">'+data.list[i].MM09+'</td>'
								+ '	<td class="center'+data.list[i].TG10+'">'+data.list[i].MM10+'</td>'
								+ '	<td class="center'+data.list[i].TG11+'">'+data.list[i].MM11+'</td>'
								+ '	<td class="center'+data.list[i].TG12+'">'+data.list[i].MM12+'</td>'
								+ '</tr>'					
								;
								$("#table2").append(htm);

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

		if ("${amsClb.CLB_GD}" != "A") {

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
