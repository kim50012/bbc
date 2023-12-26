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
<title>${label.排名查询}</title>
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
<c:if test="${amsClb.CLB_SQ == 11}">
.drag-table td {
    position: relative;
    background: #ffffff;
    border: none;
    border-bottom: 1px solid #ededed;
    font-size: 0.24rem;
    line-height: 0.24rem;
    padding: 0.1rem 0.1rem;
    box-sizing: border-box;
    color: #333333;
}
</c:if>
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
				
					<c:if test="${amsClb.CLB_SQ == 11}">
					<div class="model-gray" style="margin-top: 0.1rem;background: #fff;">
						<div class="bottom-model" style="padding-top: 0;">
							<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<span>
								<select style="width:50%;" id="selClb">
									<option value="">ALL</option>
									<option value="1">BBC</option>
									<option value="2">WJBC</option>
									<option value="3">BSC</option>
									<option value="4">BWC</option>
									<option value="6">HBC</option>
									<option value="8">SBBC</option>
								</select>
								<input type="text" id="txtMbrnm" style="width:50%;">
							</span>
							</div>              
							<button class="confirmBtn" id="confirmBtn" onclick="getData('${amsClb.TODAY}');">조회</button>
						</div>
					</div>
					</c:if>
					
					<div class="title2">
						<span class="font24 bold">A ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableA" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">B ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableB" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">C ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableC" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">D ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableD" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">E ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableE" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11}">
									<th style="width: 34%;">클럽</th>
									</c:if>
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
	});


	function getData(dt) {

		var para1 = "USER_LEVEL_LIST";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "";
		var para4 = "";

		<c:if test="${amsClb.CLB_SQ == 11}">
		para3 = $("#selClb").val();
		para4 = $("#txtMbrnm").val();
		</c:if>

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

						htm = ''
						+ '<tr>'
						+ '	<th>No</th>'
						+ '	<th>사진</th>'
						+ '	<th>이름</th>'
						+ '	<th>레벨</th>'
						<c:if test="${amsClb.CLB_SQ == 11}">
						+ '	<th style="width: 34%;">레벨</th>'
						</c:if>
						+ '</tr>'
						;
						$("#tableA").html(htm);
						$("#tableB").html(htm);
						$("#tableC").html(htm);
						$("#tableD").html(htm);
						$("#tableE").html(htm);
						
						if (data.list.length != 0) {

							var j = 0;
							var gdOld = "";
							
							for (var i = 0; i < data.list.length; i++) {
								
								if (gdOld != data.list[i].BMT_GD) {
									j = 0;
								}

								j++;
								
								var htm = '';
								if (i == 0) {

									htm = ''
									+ '<tr>'
									+ '	<th>No</th>'
									+ '	<th>사진</th>'
									+ '	<th>이름</th>'
									+ '	<th>레벨</th>'
									+ '</tr>'
									;
									// $("#table"+data.list[i].BMT_GD).append(htm);
								}
								var sTag = "padding-left: 0.5rem;";
								<c:if test="${amsClb.CLB_SQ == 11}">
								sTag = "";
								</c:if>
								htm = ''
									+ '<tr>'
									+ '	<td class="center">'+(j)+'</td>'
									+ '	<td class="center"><img src="'+data.list[i].MBR_MAI_IMG_PTH+'" style="width: 1rem;'+sTag+'"/></td>'
									+ '	<td class="center" style="text-decoration: underline;" onclick="goUserPage('+data.list[i].MBR_SQ+')">'
									<c:if test="${amsClb.CLB_SQ == 11}">
									+ '<img src="../image/'+data.list[i].IMG+'.png" style="height:0.28rem;display: initial;"> '
									</c:if>
									+ data.list[i].CLB_NIK_NM
									+ '</td>'
									+ '	<td class="center">'+data.list[i].BMT_GD+'${label.组}</td>'
									<c:if test="${amsClb.CLB_SQ == 11}">
									+ '	<td>'+data.list[i].CLB_NM+'</td>'
									</c:if>
									+ '</tr>'					
									;
									$("#table"+data.list[i].BMT_GD).append(htm);
								gdOld = data.list[i].BMT_GD;
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
	
	function goUserPage(a) {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page24&para3=&para5="+a;
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
