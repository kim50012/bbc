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
<title>예선 대진표</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
<style>
.tabHead .tabSelected:before {
    width: 1rem;
    transition: width 0.3s;
}
.selected {
  color:#e42e43;
  border-color: #e42e43;
}
.tabPointer2 {
  padding: 0.3rem 0.24rem 0.16rem;
  position: absolute;
  top: 0;
  left: 0;
  background: #ffffff;  
  display: flex; 
  flex-flow: row wrap;
  justify-content: space-between;
}
.tabPointer2 a {
  display: block;
  outline: none;
  text-decoration: none;
}
.tab-img img:first-of-type {
	height: 0.23rem;
    border: 0;
    padding-left: 0.1rem;
    margin: 0;
    vertical-align: initial;
}
.tabPointer2 {
	justify-content: left;
}
.tabPointer2 a:first-of-type {
	margin-right: 0.2rem;
}
.tabPointer2 a:last-of-type {
	margin-left: 0.2rem;
}
</style>
<script>
helpHtmlTag = "※ 예선 대진표 페이지 입니다.<br><br>각 급수, 종목을 클릭하면 해당 조가 보여지고, 조를 클릭하면 대진표를 조회 할 수 있습니다.<br><br>각 조별 코트 담당자는 이 화면에서 경기 기록을 입력,수정 할 수 있습니다.<br><br>하단에는 각 조별 경기 결과도 보실 수 있습니다.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>예선 대진표 조회</span>
      	  <a onclick="gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
        </div>
      </header>
      <div class="content">
        <div class="container scroll-wrap-noRefresh f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray" style="margin-bottom: 0.3rem;">
			<div class="top-model" style="padding-bottom: 0;border: none;">
              <div class="f-row scroll-title" style="position: relative;">
                <p class="font24 bold fontColor5" id="mchNm">대회명</p>
                <i class="fourDPlex icon-jia" id="tableUpSub" style="position: absolute;right: 0rem;"></i>
              </div>
              <div class="f-row-x-s mt12">
                <div class="f-row">
                  <p class="fullname" id="place">장소</p>
                </div>
                <p class="font20" id="mchDt">일자</p>
              </div>
            </div>

			<%@ include file="/front/bbc/badMatch/headMenu.jsp"%>       
          </div>
          
          
          <div class="tabHead" style="min-height: 1rem;">
<!--             <div id="tabS" onclick="changeTab(this,'S')">자강조</div> -->
            <div id="tabA" onclick="changeTab(this, 'A')">A조</div>
            <div id="tabB" onclick="changeTab(this, 'B')" style="border-left: 1px solid #cbcbcb;">B조</div>
            <div id="tabC" onclick="changeTab(this, 'C')" style="border-left: 1px solid #cbcbcb;">C조</div>
            <div id="tabD" onclick="changeTab(this, 'D')" style="border-left: 1px solid #cbcbcb;">D조</div>
            <div id="tabE" onclick="changeTab(this, 'E')">초심자</div>
          </div>
          
          
          <!-- areaS ------------------->
          <!-- areaS ------------------->
          <!-- areaS ------------------->
          <div id="areaS" class="f-col" style="padding-top: 0;display:none;">
          
			<div class="tabPointer2" id="gameType" style="position: initial;padding-top:0;justify-content: left;">
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="SMM" onclick='getGroup("S", "MM", this);'>남복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="SWW" onclick='getGroup("S", "WW", this);'>여복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="SMW" onclick='getGroup("S", "MW", this);'>혼복</a>
			</div>  
			
			<div class="tabPointer" id="areaSgroup" style="position: initial;justify-content: flex-start;padding-top:0;">
            	
			</div>          
          	
            <div class="table">
	      	  <div class="title2">
	              <span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>대진표</span><span class="font20 fontOrange">승패기준 : 좌측팀</span>
	          </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaSlist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          <!-- areaA ------------------->
          <!-- areaA ------------------->
          <!-- areaA ------------------->
          <div id="areaA" class="f-col" style="padding-top: 0;">
          
			<div class="tabPointer2" id="gameType" style="position: initial;padding-top:0;">
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="AMM" onclick='getGroup("A", "MM", this);'>남복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="AWW" onclick='getGroup("A", "WW", this);'>여복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="AMW" onclick='getGroup("A", "MW", this);'>혼복</a>
			</div>  
			
			<div class="tabPointer" id="areaAgroup" style="position: initial;justify-content: flex-start;padding-top:0;">

			</div>          
          	
            <div class="table">
	      	  <div class="title2">
	              <span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>대진표</span><span class="font20 fontOrange">승패기준 : 좌측팀</span>
	          </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaAlist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          <!-- areaB ------------------->
          <!-- areaB ------------------->
          <!-- areaB ------------------->
          <div id="areaB" class="f-col" style="padding-top: 0;display:none;">
          
			<div class="tabPointer2" id="gameType" style="position: initial;padding-top:0;">
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="BMM" onclick='getGroup("B", "MM", this);'>남복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="BWW" onclick='getGroup("B", "WW", this);'>여복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="BMW" onclick='getGroup("B", "MW", this);'>혼복</a>
			</div>  
			
			<div class="tabPointer" id="areaBgroup" style="position: initial;justify-content: flex-start;padding-top:0;">

			</div>          
          	
            <div class="table">
	      	  <div class="title2">
	              <span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>대진표</span><span class="font20 fontOrange">승패기준 : 좌측팀</span>
	          </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaBlist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          <!-- areaC ------------------->
          <!-- areaC ------------------->
          <!-- areaC ------------------->
          <div id="areaC" class="f-col" style="padding-top: 0;display:none;">
          
			<div class="tabPointer2" id="gameType" style="position: initial;padding-top:0;">
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="CMM" onclick='getGroup("C", "MM", this);'>남복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="CWW" onclick='getGroup("C", "WW", this);'>여복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="CMW" onclick='getGroup("C", "MW", this);'>혼복</a>
			</div>  
			
			<div class="tabPointer" id="areaCgroup" style="position: initial;justify-content: flex-start;padding-top:0;">

			</div>          
          	
            <div class="table">
	      	  <div class="title2">
	              <span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>대진표</span><span class="font20 fontOrange">승패기준 : 좌측팀</span>
	          </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaClist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          <!-- areaD ------------------->
          <!-- areaD ------------------->
          <!-- areaD ------------------->
          <div id="areaD" class="f-col" style="padding-top: 0;display:none;">
          
			<div class="tabPointer2" id="gameType" style="position: initial;padding-top:0;">
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="DMM" onclick='getGroup("D", "MM", this);'>남복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="DWW" onclick='getGroup("D", "WW", this);'>여복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="DMW" onclick='getGroup("D", "MW", this);'>혼복</a>
			</div>  
			
			<div class="tabPointer" id="areaDgroup" style="position: initial;justify-content: flex-start;padding-top:0;">

			</div>          
          	
            <div class="table">
	      	  <div class="title2">
	              <span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>대진표</span><span class="font20 fontOrange">승패기준 : 좌측팀</span>
	          </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaDlist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          <!-- areaE ------------------->
          <!-- areaE ------------------->
          <!-- areaE ------------------->
          <div id="areaE" class="f-col" style="padding-top: 0;display:none;">
          
			<div class="tabPointer2" id="gameType" style="position: initial;padding-top:0;">
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="EMM" onclick='getGroup("E", "MM", this);'>남복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="EWW" onclick='getGroup("E", "WW", this);'>여복</a>
            	<a class="tabList font20 mb10" href="#jump1" style="width: 1.5rem;" id="EMW" onclick='getGroup("E", "MW", this);'>혼복</a>
			</div>  
			
			<div class="tabPointer" id="areaEgroup" style="position: initial;justify-content: flex-start;padding-top:0;">

			</div>          
          	
            <div class="table">
	      	  <div class="title2">
	              <span class="font24 bold"><i class="fourDPlex icon-sanjiao"></i>대진표</span><span class="font20 fontOrange">승패기준 : 좌측팀</span>
	          </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaElist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          <!-- areaT ------------------->
          <!-- areaT ------------------->
          <!-- areaT ------------------->
          <div id="areaT" class="f-col" style="padding-top: 0;">
          
            <div class="table">
              <div class="title3 pt12">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span class="font24 bold">조별 경기 결과</span>
                </div>
              </div>
              <table class="drag-table alignCenterTable">
                <tbody id="areaTlist">

                </tbody>
              </table>
            </div>
          </div>
          
          
          
         
        </div>
      </div>

    </div>
    

	<div class="radio-pop" id="userSelectPop" style="display:none;">
		<input type="hidden" id="selectUserObjNm" />
		<input type="hidden" id="round" />
		<div class="radio-wrap" style="padding:0;width:6.5rem;">
			
			<div class="radio-content">

				<div class="container mt10">
		      		<div class="title2">
		              <span class="font24 bold">경기 결과</span><span class="font20 fontOrange">스코어입력</span>
		          	</div>
		            <div class="scroll-wrap" style="padding-bottom:0.5rem;min-height:5rem;height:5rem;">
		         		<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="userResultTbody">
		                <tr>
			                <th class="noWrapCell" id="teamA">팀A</th>
			                <th class="noWrapCell" id="teamB">팀B</th>
		                </tr>
		                <tr>
		                	<td>
                    			<div class="input-wrap inContent" style="height: 1rem;">
							          <input type="hidden" id="mchReqA" value="" />
							          <input type="tel" id="scoreA" value="" style="font-size: 0.7rem;text-align: center;"/>
							          <div style="font-size: 0.5rem;">점수입력</div>
							        </div>
							</td>
		                	<td>
                    			<div class="input-wrap inContent" style="height: 1rem;">
							          <input type="hidden" id="mchReqB" value="" />
							          <input type="tel" id="scoreB" value="" style="font-size: 0.7rem;text-align: center;"/>
							          <div style="font-size: 0.5rem;">점수입력</div>
							        </div>
							</td>
		                </tr>
						<!-- START Data Loop -->
						
		         		</tbody>
		         		</table>
		         		<br>
		         		<br>
		         		<br>
		        	</div>
          		</div>

			</div>
			<div class="btn-wrap">
          	  <div class="buttons">
                <div class="blueBtn subBtn f-col font26" onclick="$('#userSelectPop').hide();">취소</div>
                <div class="orangeBtn subBtn f-col font26" onclick="saveGameResult($('#mchReqA').val(), $('#mchReqB').val(), $('#scoreA').val(), $('#scoreB').val(), $('#round').val());">경기결과저장</div>
              </div>
            </div>
		</div>
	</div>    
        
    
      
  </body>
<script>

	$(function() {
		getData("2", "${para3}");
	});
	
	var gameArr = [];
	var searchlvl = "";
	var searchgType = "";
	var searchgroup = "";
	
	function getData(para2, para3) {
	
		var load = loading();
		load.show() 	
		
		var rltFlag = getGameArr();
		
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SELECT"
		 	 			,para2 : para2
		 	 			,para3 : para3
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					$("#mchNm").html(data.list[0].MCH_NM);
					$("#place").html(data.list[0].PLACE);
					$("#mchDt").html(data.list[0].MCH_DT);
					wechatShareMsg = data.list[0].MCH_NM;
					
					if (data.list[0].SMM == 0) $("#SMM").hide();
					if (data.list[0].SWW == 0) $("#SWW").hide();
					if (data.list[0].SMW == 0) $("#SMW").hide();
					if (data.list[0].AMM == 0) $("#AMM").hide();
					if (data.list[0].AWW == 0) $("#AWW").hide();
					if (data.list[0].AMW == 0) $("#AMW").hide();
					if (data.list[0].BMM == 0) $("#BMM").hide();
					if (data.list[0].BWW == 0) $("#BWW").hide();
					if (data.list[0].BMW == 0) $("#BMW").hide();
					if (data.list[0].CMM == 0) $("#CMM").hide();
					if (data.list[0].CWW == 0) $("#CWW").hide();
					if (data.list[0].CMW == 0) $("#CMW").hide();
					if (data.list[0].DMM == 0) $("#DMM").hide();
					if (data.list[0].DWW == 0) $("#DWW").hide();
					if (data.list[0].DMW == 0) $("#DMW").hide();
					if (data.list[0].EMM == 0) $("#EMM").hide();
					if (data.list[0].EWW == 0) $("#EWW").hide();
					if (data.list[0].EMW == 0) $("#EMW").hide();

					areaHideShow("E", data.list[0].EMM, data.list[0].EWW, data.list[0].EMW);
					areaHideShow("D", data.list[0].DMM, data.list[0].DWW, data.list[0].DMW);
					areaHideShow("C", data.list[0].CMM, data.list[0].CWW, data.list[0].CMW);
					areaHideShow("B", data.list[0].BMM, data.list[0].BWW, data.list[0].BMW);
					areaHideShow("A", data.list[0].AMM, data.list[0].AWW, data.list[0].AMW);
					areaHideShow("S", data.list[0].SMM, data.list[0].SWW, data.list[0].SMW);
					
					load.hide();
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}

	function areaHideShow(a,b,c,d){

		if (!(b == 0 && c == 0 && d == 0)) {
			$("#areaS").hide();
			$("#areaA").hide();
			$("#areaB").hide();
			$("#areaC").hide();
			$("#areaD").hide();
			$("#areaE").hide();
			$(".tabSelected").removeClass("tabSelected");
			$(".selected").removeClass("selected");
			$("#tab"+a).addClass("tabSelected");
			$("#area"+a).show();
		}
	}
	
	function getGameArr() {
		$.ajax({
 	 		data:{
 	 			para1 : "BADMATCH_SELECT_MATCH_GAME_RST"
 	 			,para2 : "${para3}"
 	 		},
			type : "POST",
			url : "/front/bbc/badMatch/getData.htm",
			success : function(dataArr) {
				gameArr = dataArr.list;
			},
			error : function(xhr, status, e) {}
		});
		return true;
	}

	function joinMatch() {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";
	}
	
	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {
				console.log("ok");
			}
		});
	}	

    //tabSelected
    function changeTab(el, tag) {
      $(".tabSelected").removeClass("tabSelected");
      $(".selected").removeClass("selected");
      $(el).addClass("tabSelected");
      $("#areaS").hide();
      $("#areaA").hide();
      $("#areaB").hide();
      $("#areaC").hide();
      $("#areaD").hide();
      $("#areaE").hide();
      $("#areaT").hide();

      $("#area"+tag).show();
      $("#area"+tag+"group").html("");
      $("#area"+tag+"list").html("");

      $("#areaTlist").html("");
      $("#areaT").show();
    }

    function getGroup(lvl, gType, obj) {
    	$(".selected").removeClass("selected");
    	$(obj).addClass("selected");

		var load = loading();
		load.show()
	
		$("#area"+lvl+"group").html("");
		$("#area"+lvl+"list").html("");
	    $("#areaTlist").html("");
		
		$.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_GET_GAME_GROUP"
		 	 			,para2 : "${para3}"
		 	 			,para3 : lvl
		 	 			,para4 : gType
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {
							
							var tag = "";
							if (data.list[i].GROUP_PLR_CNT == 999999999999) {   // if (data.list[i].GROUP_PLR_CNT == 3) {   //

								tag = "";
								if (data.list[i].TARGET_GAME_CNT == data.list[i].GAME_RST_CNT) {
									tag = '<img src="/front/bbc/img/tick.png"/>';
								}
								
								htm = ''
									+ '<a class="tabList tab-img font20 mb10" href="#jump1" style="width: 2rem;margin-right: 0.2rem;" onclick="getConfrontationTable(\''+lvl+'\', \''+gType+'\', '+data.list[i].GAME_GROUP+',1);">'+data.list[i].GAME_GROUP+'조 1라운드'+tag+'</a>'  
								;
									
								$("#area"+lvl+"group").append(htm);
								
								tag = "";
								if (data.list[i].TARGET_GAME_CNT == data.list[i].GAME_RST_CNT2) {
									tag = '<img src="/front/bbc/img/tick.png"/>';
								}
								
								htm = ''
									+ '<a class="tabList tab-img font20 mb10" href="#jump1" style="width: 2rem;margin-right: 0.2rem;" onclick="getConfrontationTable(\''+lvl+'\', \''+gType+'\', '+data.list[i].GAME_GROUP+',2);">'+data.list[i].GAME_GROUP+'조 2라운드'+tag+'</a>'  
								;
									
								$("#area"+lvl+"group").append(htm);
								
							} 
							else {

								tag = "";
								if (data.list[i].TARGET_GAME_CNT == data.list[i].GAME_RST_CNT) {
									tag = '<img src="/front/bbc/img/tick.png"/>';
								}
								
								htm = ''
									+ '<a class="tabList tab-img font20 mb10" href="#jump1" style="width: 1rem;margin-right: 0.2rem;" onclick="getConfrontationTable(\''+lvl+'\', \''+gType+'\', '+data.list[i].GAME_GROUP+',0);">'+data.list[i].GAME_GROUP+'조'+tag+'</a>'  
								;
									
								$("#area"+lvl+"group").append(htm);
								
							}

						}
					} else {
						
					}
					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});    	
    	
    }

    function getConfrontationTable(lvl, gType, group, round) {

		var load = loading();
		load.show()

		searchlvl = lvl;
		searchgType = gType;
		searchgroup = group;

		$("#area"+lvl+"list").html("");
	    $("#areaTlist").html("");

		$.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_GET_CONFRONTATION_TABLE"
		 	 			,para2 : "${para3}"
		 	 			,para3 : lvl
		 	 			,para4 : gType
		 	 			,para5 : group
		 	 			,para6 : round
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					
					if (data.list.length != 0) {

						var horArr = data.list;
						var vertical = data.list;

						htm = ''
							+ '<tr>'
							+ '  <th style="min-width: 1.3rem;">\\</th>'
						;
						// $("#area"+lvl+"list").append(htm);

						for (var i = 0; i < horArr.length; i++) {
							htm = htm
								+ '<th>'+horArr[i].MBR_NM_A+'<br>'+horArr[i].MBR_NM_B+'</th>'  
							;
						}

						htm = htm
							+ '</tr>'
						;
						$("#area"+lvl+"list").append(htm);
						
						for (var i = 0; i < horArr.length; i++) {
							
							htm = ''
								+ '<tr>'
								+ '  <td>'+horArr[i].MBR_NM_A+'<br>'+horArr[i].MBR_NM_B+'</td>'  
							;
							for (var j = 0; j < vertical.length; j++) {
								if (i == j) {
									htm = htm
										+ '<td style="background: #eaeaea;"></td>'
									;
								}
								else {
									if (gameArr.length != 0) {
										var tagWin = "결과<br>입력";
										var tagScore = "'0','0'";
										
										for (var k = 0; k < gameArr.length; k++) {

											if (round == 2) {
												if ((horArr[i].MCH_REQ == gameArr[k].MCH_REQ_A) && (vertical[j].MCH_REQ == gameArr[k].MCH_REQ_B) && gameArr[k].FINAL_YN == "N2") {
													if (gameArr[k].WIN == 1) {
														tagWin = '<span class="tab-img" style="color:#e42e43;display: initial;vertical-align: initial;height: 0.23rem;">'+gameArr[k].WIN_NM+'<img src="/front/bbc/img/pencil.png"/></span><br>('+gameArr[k].SCORE_A+':'+gameArr[k].SCORE_B+')';	
													}
													else {
														tagWin = '<span class="tab-img" style="color:#006ecd;display: initial;vertical-align: initial;height: 0.23rem;">'+gameArr[k].WIN_NM+'<img src="/front/bbc/img/pencil.png"/></span><br>('+gameArr[k].SCORE_A+':'+gameArr[k].SCORE_B+')';	
													}
													tagScore = gameArr[k].SCORE_A+', '+gameArr[k].SCORE_B;
													
												}
											}
											else {
												if ((horArr[i].MCH_REQ == gameArr[k].MCH_REQ_A) && (vertical[j].MCH_REQ == gameArr[k].MCH_REQ_B) && gameArr[k].FINAL_YN == "N") {
													if (gameArr[k].WIN == 1) {
														tagWin = '<span class="tab-img" style="color:#e42e43;display: initial;vertical-align: initial;height: 0.23rem;">'+gameArr[k].WIN_NM+'<img src="/front/bbc/img/pencil.png"/></span><br>('+gameArr[k].SCORE_A+':'+gameArr[k].SCORE_B+')';	
													}
													else {
														tagWin = '<span class="tab-img" style="color:#006ecd;display: initial;vertical-align: initial;height: 0.23rem;">'+gameArr[k].WIN_NM+'<img src="/front/bbc/img/pencil.png"/></span><br>('+gameArr[k].SCORE_A+':'+gameArr[k].SCORE_B+')';	
													}
													tagScore = gameArr[k].SCORE_A+', '+gameArr[k].SCORE_B;
													
												}
											}
										}
										
										htm = htm
											+ '<td id="'+horArr[i].MCH_REQ+'-'+vertical[j].MCH_REQ+'" onclick="gameResult('+horArr[i].MCH_REQ+', '+vertical[j].MCH_REQ+', '+tagScore+', '+round+');">'+tagWin+'</td>'
										;
									}
									else {
										htm = htm
											+ '<td id="'+horArr[i].MCH_REQ+'-'+vertical[j].MCH_REQ+'" onclick="gameResult('+horArr[i].MCH_REQ+', '+vertical[j].MCH_REQ+', '+tagScore+', '+round+');">결과<br>입력</td>'
										;
									}
								}
							}

							htm = htm
								+ '</tr>'
							;
							$("#area"+lvl+"list").append(htm);
							
						}						

						if (round == 2) {
							horArr = sortResults(horArr, "SCORE2", false);
							horArr = sortResults(horArr, "WIN2", false);
						}
						else {
							horArr = sortResults(horArr, "SCORE", false);
							horArr = sortResults(horArr, "WIN", false);
						}
						
						var htmT = "";
						htmT = 
							+ '<tr>'
							+ '  <th>신청번호</th>'
							+ '  <th>선수</th>'
							+ '  <th>승</th>'
							+ '  <th>패</th>'
							+ '  <th>득실</th>'
							+ '</tr>'
							$("#areaTlist").append(htmT);
							
						for (var i = 0; i < horArr.length; i++) {

							if (round == 2) {
								htmT = ''
									+ '<tr>'
									+ '<td>'+horArr[i].MCH_REQ+'</td>' 
									+ '<td>'+horArr[i].MBR_NM_A+', '+horArr[i].MBR_NM_B+'</td>'  
									+ '<td>'+horArr[i].WIN2+'</td>' 
									+ '<td>'+horArr[i].LOSE2+'</td>' 
									+ '<td>'+horArr[i].SCORE2+'</td>' 
									+ '</tr>'
									;
							}
							else {
								htmT = ''
									+ '<tr>'
									+ '<td>'+horArr[i].MCH_REQ+'</td>' 
									+ '<td>'+horArr[i].MBR_NM_A+', '+horArr[i].MBR_NM_B+'</td>'  
									+ '<td>'+horArr[i].WIN+'</td>' 
									+ '<td>'+horArr[i].LOSE+'</td>' 
									+ '<td>'+horArr[i].SCORE+'</td>' 
									+ '</tr>'
									;
							}
							
							$("#areaTlist").append(htmT);
						}

						
						
					} else {
						
					}

					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});    	
    	
    }    
    
    function sortResults(jsonArr, prop, asc) {
    	jsonArr.sort(function(a, b) {
            if (asc) {
                return (a[prop] > b[prop]) ? 1 : ((a[prop] < b[prop]) ? -1 : 0);
            } else {
                return (b[prop] > a[prop]) ? 1 : ((b[prop] < a[prop]) ? -1 : 0);
            }
        });
        return jsonArr;
    }
    
    function gameResult(a, b, c, d, e) {

    	var load = loading();
    	load.show()

    	 $.ajax({
    	 	 		data:{
    	 	 			para1 : "BADMATCH_SELECT_TEAM_NAME"
    	 	 			,para2 : a
    	 	 			,para3 : b
    	 	 		},
    			type : "POST",
    			url : "/front/bbc/badMatch/getData.htm",
    			success : function(data) {

					if (data.list.length != 0) {
						for (var i = 0; i < data.list.length; i++) {
							$("#team"+data.list[i].TAG).html(data.list[i].CLB_NM+"<br><br>"+data.list[i].MBR_NM_A+", "+data.list[i].MBR_NM_B);
							$("#mchReq"+data.list[i].TAG).val(data.list[i].MCH_REQ);
						}
					} else {
						
					}
					load.hide();	
    			},
    			error : function(xhr, status, e) {
    				load.hide()
    				alert("Error : " + status);
    			}
    		});
    	
    	$("#mchReqA").val(a);
    	$("#mchReqB").val(b);
    	$("#scoreA").val(c);
    	$("#scoreB").val(d);
    	if (c == "0") {
    		$("#scoreA").val("");
    	}
    	if (d == "0") {
    		$("#scoreB").val("");
    	}
    	$("#round").val(e);
    	$("#userSelectPop").show();
    }
    

    function saveGameResult(para4, para5, para6, para7, round) {

    	var load = loading();
    	var finalYn = "N";
    	load.show();
    	
		if (para6 == "" || para7 == "") {
			msgBox("점수를 입력하세요.");
    		load.hide();
			return;
		}

    	if (!("${userInfo.AUTH}" == "A" || "${userInfo.AUTH}" == "B" || "${userInfo.AUTH}" == "C" || "${userInfo.AUTH}" == "D")) {
    		msgBox("권한이 없습니다.");
    		load.hide();
			return;
    	}

    	if (round == 2) {
    		finalYn = "N2";
    	}
    	
    	 $.ajax({
    	 	 		data:{
    	 	 			para1 : "BADMATCH_INSERT_GAME_RESULT"
    	 	 			,para2 : "${para3}"
    	 	 			,para3 : finalYn
    	 	 			,para4 : para4
    	 	 			,para5 : para5
    	 	 			,para6 : para6
    	 	 			,para7 : para7
    	 	 			,para8 : "${loginMbrSq}"
    	 	 		},
    			type : "POST",
    			url : "/front/bbc/badMatch/getData.htm",
    			success : function(data) {
    				
    				if (data.list[0].RSLT == "END_MATCH") {

        				messageBox({
        					title : '알림',
        					message : '예선전이 종료 되었습니다.',
        					type : 'alert',
        					callback : function() {
        						load.hide();
        						$("#userSelectPop").hide();
        					}
        				});
        				return;
    				}
    				
    				var rltFlag = getGameArr();
    				
    				var scoreA = parseInt(para6);
    				var scoreB = parseInt(para7);
    				var vicName = "";
    				
    				if (scoreA > scoreB) {
    					vicName = data.list[0].NAMEA + ", " + data.list[0].NAMEB + " 승";
    				}
    				else {
    					vicName = data.list[0].NAMEC + ", " + data.list[0].NAMED + " 승";
    				}

    		    	if (!systemTest) {

       		    	 $.ajax({
       		    	 	 		data:{
       		    	 	 			para1 : data.list[0].OPENIDA
       		    	 	 			,para2 : data.list[0].OPENIDB
       		    	 	 			,para3 : data.list[0].OPENIDC
       		    	 	 			,para4 : data.list[0].OPENIDD
       		    	 	 			,para5 : $("#mchNm").html() + " - 예선\n" + data.list[0].B_LVL_NM + " / " + data.list[0].GAME_TYPE_NM + " / " + data.list[0].GAME_GROUP_NM + " 경기결과 " +  para6 + " : " + para7
       		    	 	 			,para6 : data.list[0].NAMEA
       		    	 	 			,para7 : data.list[0].NAMEB
       		    	 	 			,para8 : data.list[0].NAMEC
       		    	 	 			,para9 : data.list[0].NAMED
       		    	 	 			,para10 : vicName
       		    	 	 			,para11 : "승패에 문제가 있는 경우 대회 관리자에게 문의 하세요."
       		    	 	 			,para12 : "/front/bbc/badMatch/getPage.htm?pageName=page15&para3=${para3}"
       		    	 	 		},
       		    			type : "POST",
       		    			url : "/front/bbc/badMatch/sendMsg.htm",
       		    			success : function(data) {
       		    			},
       		    			error : function(xhr, status, e) {
       		    			}
       		    		});
       				
    		    	}

    				messageBox({
    					title : '알림',
    					message : '저장되었습니다.',
    					type : 'alert',
    					callback : function() {
    						getConfrontationTable(searchlvl, searchgType, searchgroup, round);
    						$("#userSelectPop").hide();
    					}
    				});
    				
//     				alert("저장되었습니다.");
//     				$("#userSelectPop").hide();
    				
					load.hide();	
    			},
    			error : function(xhr, status, e) {
    				load.hide();
    				alert("Error : " + status);
    			}
    		});
    	
    }
</script>
<script>
try {
	wechatShareMsg = "${userInfo.MCH_NM}";
} catch (e) {
  console.log('error');
}	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
