<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
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
</style>  
<script>
	$(function() {
		var htm = '<header class="app-header"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		$("#appPage1").prepend(htm)
		$(".app-header").click(function() {
			window.location.href='/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
		});
	});
</script>
<style>
.subBtn {
    padding: 0.2rem 0.1rem;
}
</style>
<fmt:parseNumber value="${amsClb.THISMONTH.substring(0,4)}" var="intYear" />
</head>

<body>
	<div class="app riskManagement">
		<!--内容区域-->
		<div class="content pt10 refresh-wrap" id="appPage1">
			<!--分类标题-->
			<div class="button-title plr24">
				<div class="fontBlack font24 bold">회비관리</div>
				<div>
					<div class="btn-white" url='4DX_CI_120.html' onclick="copyNotice()">공지복사하기</div>
					<div class="select-wrap ml10">
						<div class="select" onclick="selectGo(this)">
							<span>전체</span><i class="sanjiao"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-wrap f-col" style="padding-bottom: 0;">
				<div class="tab-con">
					<div class="tabs">
					
					
						<!--这里的news是标识下面的tab-new是否显示，默认不显示-->
						<div class="tab" id="tab${intYear-1}-12" onclick="getData('${intYear-1}-12')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear-1}-12</h4>
						</div>
						<div class="tab" id="tab${intYear}-01" onclick="getData('${intYear}-01')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-01</h4>
						</div>
						<div class="tab" id="tab${intYear}-02" onclick="getData('${intYear}-02')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-02</h4>
						</div>
						<div class="tab" id="tab${intYear}-03" onclick="getData('${intYear}-03')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-03</h4>
						</div>
						<div class="tab" id="tab${intYear}-04" onclick="getData('${intYear}-04')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-04</h4>
						</div>
						<div class="tab" id="tab${intYear}-05" onclick="getData('${intYear}-05')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-05</h4>
						</div>
						<div class="tab" id="tab${intYear}-06" onclick="getData('${intYear}-06')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-06</h4>
						</div>
						<div class="tab" id="tab${intYear}-07" onclick="getData('${intYear}-07')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-07</h4>
						</div>
						<div class="tab" id="tab${intYear}-08" onclick="getData('${intYear}-08')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-08</h4>
						</div>
						<div class="tab" id="tab${intYear}-09" onclick="getData('${intYear}-09')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-09</h4>
						</div>
						<div class="tab" id="tab${intYear}-10" onclick="getData('${intYear}-10')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-10</h4>
						</div>
						<div class="tab" id="tab${intYear}-11" onclick="getData('${intYear}-11')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-11</h4>
						</div>
						<div class="tab" id="tab${intYear}-12" onclick="getData('${intYear}-12')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear}-12</h4>
						</div>
						<div class="tab" id="tab${intYear+1}-01" onclick="getData('${intYear+1}-01')">
							<i class="tab-new"></i>
							<h4 class="tab-title">${intYear+1}-01</h4>
						</div>
						
					</div>
					<div class="con-wrap">
						<!--这里的已解决和未解决的在li的class有区别，以解决的添加class：resolved-->
						<div class="scroll-wrap">
							<ul id="mbrList" style="padding-bottom: 3rem;">
								<!--
								<li>
									<div class="title">
										<div class="riskTitle">
											<div>
												<span>김동일 </span> <span> (미납) </span>
											</div>
											<span class="font20">2019-12-19</span>
										</div>
									</div>
									<div class="gray-model">
							          	<div class="btn-wrap" style="padding: 0;">
							          		<div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
												<div class="blueBtn subBtn f-col font26" onclick="setFeeAbnormal(1);">정회원유지</div>
							            		<div class="orangeBtn subBtn f-col font26" onclick="setFeeNormal(1);">회비납부</div>
							            	</div>
							            </div>									
									</div>
								</li>
								<li class="resolved">
									<div class="title">
										<div class="riskTitle">
											<div>
												<span>박민영 </span> <span>(완료)</span>
											</div>
											<span>2019-12-19</span>
										</div>
									</div>
									<div class="gray-model">
										(RMB 300) 회비
							          	<div class="btn-wrap" style="padding: 0.1rem 0 0 0;">
							          		<div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
							            		<div class="delBtn noclick subBtn f-col font26" onclick="setFeeCancel(1);">납부취소</div>
							            	</div>
							            </div>
									</div>
								</li>
								-->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--底部导航栏-->
	</div>
	<input type="hidden" id="thisMonth" value="${amsClb.THISMONTH}" />
	<input type="hidden" id="thisMonth2" value="${amsClb.THISMONTH.substring(0,4)}" />
	<input type="hidden" id="thisMonth3" value="${intYear-1}" />
	<input type="hidden" id="thisMonth4" value="${intYear+1}" />
	<input type="hidden" id="feeStatus" value="TOTAL" />
	<textarea id="notice"></textarea>
</body>
<script type="text/javascript">



function setFeeNormal(id, nick) {

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

	if (confirm(nick+'님 회비 납부를 완료하시겠습니까?')) {
		setFeeAbnormalAction(id, nick, "A1");
	}
	
	return;
	
	messageBox({
	    title: '확인',
	    message: nick+'님 회비 납부를 완료하시겠습니까?',
	    type: 'confirm',
	    callback: function() {
	    	setFeeAbnormalAction(id, nick, "A1");
	    }
	})
}	

function setFeeNormal6(id, nick) {

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

	if (confirm(nick+'님 6개월 회비 납부를 완료하시겠습니까?')) {
		setFeeAbnormalAction(id, nick, "A4");
	}
	
	return;
	
	messageBox({
	    title: '확인',
	    message: nick+'님 6개월 회비 납부를 완료하시겠습니까?',
	    type: 'confirm',
	    callback: function() {
	    	setFeeAbnormalAction(id, nick, "A4");
	    }
	})
}	

function setFeeAbnormal(id, nick) {

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
	
	if (confirm(nick+'님 정회원유지 회비 납부를 완료하시겠습니까?')) {
		setFeeAbnormalAction(id, nick, "A2");
	}
	
	return;
	
	messageBox({
	    title: '확인',
	    message: nick+'님 정회원유지 회비 납부를 완료하시겠습니까?',
	    type: 'confirm',
	    callback: function() {
	    	setFeeAbnormalAction(id, nick, "A2");
	    }
	})
}	


function setFeeCancel(id, nick) {

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

	if (confirm(nick+'님 회비 납부 내역을 삭제하시겠습니까?')) {
		setFeeAbnormalAction(id, nick, "B1");
	}
	
	return;
	
	messageBox({
	    title: '확인',
	    message: nick+'님 회비 납부 내역을 삭제하시겠습니까?',
	    type: 'confirm',
	    callback: function() {
	    	setFeeAbnormalAction(id, nick, "B1");
	    }
	})
}	




function setFeeAbnormalAction(id, nick, sts) {

	var para1 = "MBR_FEE_SAVE_A2";
	var para2 = "9";
	var para3 = $("#thisMonth").val();
	var para4 = sts;
	var para5 = id;

	var load = loading();
	load.show()
	
	 $.ajax({
	 	 		data:{
	 	 			para1 : para1
	 	 			,para2 : para2
	 	 			,para3 : para3
	 	 			,para4 : para4
	 	 			,para5 : para5
	 	 		},
			type : "POST",
			url : "/front/bbc/clb/getData.htm",
			success : function(data) {
 				load.hide()
 				getData($("#thisMonth").val());
			},
			error : function(xhr, status, e) {
 				load.hide()
				alert("Error : " + status);
			}
		});
}	
	


function copyNotice() {
	$('#notice').select(); //복사할 텍스트를 선택
	document.execCommand("copy"); //클립보드 복사 실행
	alert('복사되었습니다!\n채팅방에 붙여넣기로 공지하세요~');
	// $('#copy_text_input').html("");
}

function selectGo(el){
	var $_that = $(el).find('span')
  	radioPop({
    	val: '2', // 默认第一项，可以不用传参数
    	callback: function(name, value) {
      		$_that.html(name)
      		if(value == 'TOTAL') {
      			$("#feeStatus").val('TOTAL');
      			getData($("#thisMonth").val());
      		} else if(value == 'B') {
      			$("#feeStatus").val('B');
      			getData($("#thisMonth").val());
      		} else if(value == 'A') {
      			$("#feeStatus").val('A');
      			getData($("#thisMonth").val());
      		} else if(value == 'A1') {
      			$("#feeStatus").val('A1');
      			getData($("#thisMonth").val());
      		} else if(value == 'A2') {
      			$("#feeStatus").val('A2');
      			getData($("#thisMonth").val());
      		} else if(value == 'A3') {
      			$("#feeStatus").val('A3');
      			getData($("#thisMonth").val());
      		}
    	},
    	option: [{
        	name: '전체',
        	value: 'TOTAL'
      	},
      	{
        	name: '미납자',
        	value: 'B'
      	},
      	{
        	name: '납부목록(전체납부자)',
        	value: 'A'
      	},
      	{
        	name: '6개월회비',
        	value: 'A3'
      	},
      	{
        	name: '월회비',
        	value: 'A1'
      	},
      	{
        	name: '정회원유지',
        	value: 'A2'
      	}
    	]
  	})
}
$(function() {
  scroll()
  $(".tab").click(function() {
    $(".tab.active").removeClass('active news')
    $(this).addClass('active news')
    var top = $(this)[0].offsetTop;
    var swh = $(this).parents('.tabs')[0].offsetHeight;
    var st = $(".tabs")[0].scrollTop;
    $(".tabs").animate({scrollTop: top - swh / 2 + "px"},300)
  })
  $("#tab${amsClb.THISMONTH}").addClass('active news')
  getData('${amsClb.THISMONTH}');
  
})

function getData(yyyymm) {

	var para1 = "MBR_FEE_USER_LIST";
	var para2 = "9";
	var para3 = yyyymm;
	var para4 = $("#feeStatus").val();

	$("#thisMonth").val(yyyymm);
	
	var load = loading();
	load.show()
	
	 $.ajax({
	 	 		data:{
	 	 			para1 : para1
	 	 			,para2 : para2
	 	 			,para3 : para3
	 	 			,para4 : para4
	 	 		},
			type : "POST",
			url : "/front/bbc/clb/getData.htm",
			success : function(data) {

    			if(data.list.length!=0){
    				
    				$("#mbrList").html('');
    				
    				$("#notice").val('');
    				var notice = '※ ' + yyyymm + '월 회비 납부 현황';
    				notice = notice + '\r\n\r\n' + '현재 납부 현황 아래 참고하시고 누락되신 분 계시면 알려 주세요..' + '\r\n';
    				notice = notice + '\r\n\r\n' + '● 납부자' + '\r\n';
    				
    				
    				var noticeNofee = '\r\n\r\n' + '● 미납자' + '\r\n';
    				
    				var j = 0;
    				var k = 0;
    				
    				for(var i=0;i<data.list.length;i++){
						var htm=''; 
    					if (data.list[i].STATUS_FEE == 'A1' || data.list[i].STATUS_FEE == 'A2' || data.list[i].STATUS_FEE == 'A3') {
    						j++;
        					htm=''
        						+		'<li class="resolved">'
        						+		'	<div class="title">'
        						+		'		<div class="riskTitle">'
        						+		'			<div>'
        						+		'				<span>'+j+'.'+data.list[i].CLB_NIK_NM+' </span> <span>('+data.list[i].STATUS_FEE_NM+') 운동횟수: '+data.list[i].EXC_CNT+'</span>'
        						+		'			</div>'
        						+		'			<span>'+data.list[i].FEE_DT+'</span>'
        						+		'		</div>'
        						+		'	</div>'
        						+		'	<div class="gray-model">'
        						+		'		'+data.list[i].MMO
        						+		'         	<div class="btn-wrap" style="padding: 0.1rem 0 0 0;">'
        						+		'         		<div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">'
        						+		'           		<div class="delBtn noclick subBtn f-col font26" onclick="setFeeCancel('+data.list[i].MBR_SQ+', \''+data.list[i].CLB_NIK_NM+'\');">납부취소</div>'
        						+		'           	</div>'
        						+		'           </div>'
        						+		'	</div>'
        						+		'</li>'
        						;
            					notice = notice + j + '.' + data.list[i].CLB_NIK_NM + '(' + data.list[i].STATUS_FEE_NM + '), ';
        					
    					}
    					else {
    						k++;
        					htm=''
        						+		'<li>'
        						+		'	<div class="title">'
        						+		'		<div class="riskTitle">'
        						+		'			<div>'
        						+		'				<span>'+k+'.'+data.list[i].CLB_NIK_NM+' </span> <span> ('+data.list[i].STATUS_FEE_NM+') 운동횟수: '+data.list[i].EXC_CNT+'</span>'
        						+		'			</div>'
        						+		'			<span class="font20">'+data.list[i].TODAY+'</span>'
        						+		'		</div>'
        						+		'	</div>'
        						+		'	<div class="gray-model">'
        						+		'         	<div class="btn-wrap" style="padding: 0;">'
        						+		'         		<div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">'
        						+		'           		<div class="orangeBtn subBtn f-col font26" onclick="setFeeNormal6('+data.list[i].MBR_SQ+', \''+data.list[i].CLB_NIK_NM+'\');">6개월납부</div>'
        						+		'					<div class="blueBtn subBtn f-col font26" onclick="setFeeAbnormal('+data.list[i].MBR_SQ+', \''+data.list[i].CLB_NIK_NM+'\');">정회원유지</div>'
        						+		'           		<div class="blueBtn subBtn f-col font26" onclick="setFeeNormal('+data.list[i].MBR_SQ+', \''+data.list[i].CLB_NIK_NM+'\');">회비납부</div>'
        						+		'           	</div>'
        						+		'           </div>'							
        						+		'	</div>'
        						+		'</li>'
        						;
        						noticeNofee = noticeNofee + k + '.' + data.list[i].CLB_NIK_NM + ', ';
    					}
    					
    					$("#mbrList").append(htm);

    				}
    				$("#notice").val(notice + noticeNofee);
					$("#mbrList").append("<li><br><br><br><br></li>");
    			}
    			else {
    				$("#mbrList").html('');
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
