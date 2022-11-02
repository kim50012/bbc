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
<title>대회 참가 신청</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>대회 참가 신청</span>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="model-gray">
			<div class="top-model" style="padding-bottom: 0;border: none;">
              <div class="f-row scroll-title">
                <p class="font24 bold fontColor5" id="mchNm">대회명</p>
              </div>
              <div class="f-row-x-s mt12">
                <div class="f-row">
                  <p class="fullname" id="place">장소</p>
                </div>
                <p class="font20" id="mchDt">일자</p>
              </div>
            </div>
          </div>
          
          
          
          <div class="scroll-wrap f-col">
          
            <div class="contentList2 pb16" id="jump1">
              <div class="title1">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span>대회 정보</span>
                </div>
              </div>
              <div class="table">
                <table class="table-col2 open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                  <colgroup>
                  	<col width="20%"/>
                  	<col width="80%"/>
                  </colgroup>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">급수</th>
                    <td class="left" id="levelNm"></td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">종목</th>
                    <td class="left">
						<div class="such mr20">
                        	<label class="radio">
  	                        <input class="" type="radio" name="gameType" value="MM">
  	                        <span class="Rdefine">남복</span>
                          </label>
                        </div>
						<div class="trans mr20">
                        	<label class="radio">
  	                        <input class="" type="radio" name="gameType" value="WW">
  	                        <span class="Rdefine">여복</span>
                          </label>
                        </div>
                        <c:if test="${para4 ne 'E'}">
						<div class="trans">
                        	<label class="radio">
  	                        <input class="" type="radio" name="gameType" value="MW">
  	                        <span class="Rdefine">혼복</span>
                          </label>
                        </div>
                        </c:if>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">소속 클럽</th>
					<td class="inputTd">
                        <div>
                          <button class="select-btn" id="selectA-1" onclick="selectClub(this);"><span>클럽을 선택하세요.</span></button>
                          <input type="hidden" id="clb"/>
                        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">참가자 1</th>
                    <td class="left">
                          <button class="select-btn" id="userSelectA" onclick="selectUser('userA')"><span id="userAnm">참가자를 선택하세요.</span></button>
                          <input type="hidden" id="userA"/>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">참가자 2</th>
                    <td class="left">
                          <button class="select-btn" id="userSelectA" onclick="selectUser('userB')"><span id="userBnm">참가자를 선택하세요.</span></button>
                          <input type="hidden" id="userB"/>
                    </td>
                  </tr>
                  <tr class="getTextarea intd">
                    <th class="right noHang2 fontGrey Rword">소개</th>
                    <td class="left"><textarea class="inContent" id="dsc" rows="30" cols="30" placeholder="간단 소개  부탁드립니다.">화이팅~</textarea></td>
                  </tr>
                </table>
              </div>
            </div>

          
          
            <div class="tab-con-wrap" style="min-height: 0;">
              <div class="btn-area">
                <button class="fourD-blue-btn" onclick="joinMatch()">대회 참가하기</button>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>
    
    
	<div class="radio-pop" id="userSelectPop" style="display:none;">
		<input type="hidden" id="selectUserObjNm" />
		<div class="radio-wrap" style="padding:0;width:6.5rem;margin-top: 2rem;">
			  <div class="model-gray" style="margin-top: 0.1rem;background: #fff;margin: 0.2rem;">
	          
	            <div class="bottom-model" style="padding-top: 0;">
					<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
						<input class="imgContent" type="text" name="userNm" id="userNm" placeholder="이름을 입력 후 조회하세요.">
					</div>
	              	<button class="confirmBtn" id="confirmBtn" onclick="searchUser($('#userNm').val());">조회</button>
	            </div>
	          </div>		
			<div class="radio-content">

				<div class="container mt10">
		      		<div class="title2">
		              <span class="font24 bold">선수 검색</span><span class="font20 fontOrange">이름으로 검색하세요.(최대10명조회)</span>
		          	</div>
		            <div class="scroll-wrap" style="padding-bottom:0.5rem;min-height:5rem;height:5rem;">
		         		<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
		                <tbody id="userResultTbody">
		                <tr>
		                  <th class="noWrapCell">클럽</th>
		                  <th class="noWrapCell">이릅</th>
		                  <th class="noWrapCell">급수</th>
		                  <th class="noWrapCell">선택</th>
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
			<div class="radio-button" style="padding: 0.5rem;">
				<div onclick="$('#userSelectPop').hide();">확인</div>
			</div>
		</div>
	</div>    
    
      
  </body>
<script>

	$(function() {
		getData("2", "${para3}");
	});
	
	function getData(para2, para3) {
	
		var load = loading();
		load.show()
	
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

					if ("${para4}" == "S") {
						$("#levelNm").html("자강조");
					}
					else if ("${para4}" == "E") {
						$("#levelNm").html("초심자");
					}
					else {
						$("#levelNm").html("${para4}조");
					}
					
					load.hide()
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}

	function joinMatch() {
		
		var para3 = "${para3}";
		var para4 = "${para4}";
		var para5 = $(':radio[name="gameType"]:checked').val();
		var para6 = $('#clb').val();
		var para7 = $('#userA').val();
		var para8 = $('#userB').val();
		var para9 = $('#dsc').val();
		var para10 = "${loginMbrSq}";
		var gameTypeNm = "";
		
		if (para5 == "undefined" || para5 == "" || para5 == null) {
			msgBox("종목을 선택하세요.");
			return;
		}

		if (para6 == "") {
			msgBox("소속 클럽을 선택하세요.");
			return;
		}
		if (para7 == "") {
			msgBox("참가자1을 입력하세요.");
			return;
		}
		if (para8 == "") {
			msgBox("참가자2를 입력하세요.");
			return;
		}
		if (para8 == para7) {
			msgBox("참가자가 중복되었습니다.");
			return;
		}
		if (para9 == "") {
			msgBox("간단 소개를 입력하세요.");
			return;
		}

		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_JOIN_MATCH_USER"
			 	 		,para2 : ""
		 	 			,para3 : para3
		 	 			,para4 : para4
		 	 			,para5 : para5
		 	 			,para6 : para6
		 	 			,para7 : para7
		 	 			,para8 : para8
		 	 			,para9 : para9
		 	 			,para10 : para10
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					load.hide()
					if (data.list[0].RSLT == "SUCCESS") {
						messageBox({
							title : '알림',
							message : "신청되었습니다.<br>신청번호 : ["+data.list[0].MCH_REQ+"]",
							type : 'alert',
							callback : function() {

								if (para5 == "MM") gameTypeNm = "남복";
								if (para5 == "WW") gameTypeNm = "여복";
								if (para5 == "MW") gameTypeNm = "혼복";
								sendMsgCommonFunc(
										"first", "대회 참가 공지"
										, "keyword1", data.list[0].MBR_NM_A+","+data.list[0].MBR_NM_B
										, "keyword2", $("#mchNm").html() + " - " + gameTypeNm + "/" + $("#levelNm").html()
										, "keyword3", data.list[0].DT
										, "remark", "대회 신청번호 : ["+data.list[0].MCH_REQ+"]\n\n" + para9
										, null, null
										, null, null
										, "ZS6ABGZpdFwNwgvNVXD-YuF3fS8ByNtUufhFSWsbNaU"
										, data.list[0].OPENID_A
										, "/front/bbc/badMatch/getPage.htm?pageName=page15&para3="+para3
								);	
								sendMsgCommonFunc(
										"first", "대회 참가 공지"
										, "keyword1", data.list[0].MBR_NM_B+","+data.list[0].MBR_NM_A
										, "keyword2", $("#mchNm").html() + " - " + gameTypeNm + "/" + $("#levelNm").html()
										, "keyword3", data.list[0].DT
										, "remark", "대회 신청번호 : ["+data.list[0].MCH_REQ+"]\n\n" + para9
										, null, null
										, null, null
										, "ZS6ABGZpdFwNwgvNVXD-YuF3fS8ByNtUufhFSWsbNaU"
										, data.list[0].OPENID_B
										, "/front/bbc/badMatch/getPage.htm?pageName=page15&para3="+para3
								);								
								window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";
							}
						});
					}
					else if (data.list[0].RSLT == "DUPLICATE") {
						messageBox({
							title : '알림',
							message : "이미 참가한 중복 신청자가 있습니다.",
							type : 'alert',
							callback : function() {}
						});
					}
					else {
						messageBox({
							title : '알림',
							message : "시스템 오류가 발생하였습니다.<br>관리자에게 문의 하세요.",
							type : 'alert',
							callback : function() {}
						});
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
	}
	
	function msgBox(msg) {
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	

	function selectClub(el) {
	  var $_that = $(el).find('span');
	  var defaultVal = $("#clb").val();
	  if (defaultVal == "") {
		  defaultVal = "1";
	  }
	  radioPop({
	    val: defaultVal, // 默认第一项，可以不用传参数
	    callback: function(name, value) {
	      $_that.html(name);
	      $("#clb").val(value);
	    },
	    option: clbJson
	  });
	}	

	function selectUser(obj) {
		
		$("#userNm").val("");
		$("#userResultTbody").html("");

		htm = ''
			+ '<tr>'
			+ '<th class="noWrapCell">클럽</th>'
			+ '<th class="noWrapCell">이릅</th>'
			+ '<th class="noWrapCell">급수</th>'
			+ '<th class="noWrapCell">선택</th>'
			+ '</tr>';

		$("#userResultTbody").append(htm);		
		
		$("#userSelectPop").show();
		$("#selectUserObjNm").val(obj);
	}
	function pickUser(id, name) {
		var obj = $("#selectUserObjNm").val();
		$("#"+obj).val(id);
		$("#"+obj+"nm").html(name);
		$("#userSelectPop").hide();
	}
	

	function searchUser(para2) {
	
		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SEARCH_USER"
		 	 			,para2 : para2
		 	 			,para3 : "${para3}"
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					
					$("#userResultTbody").html("");

					htm = ''
						+ '<tr>'
						+ '<th class="noWrapCell">클럽</th>'
						+ '<th class="noWrapCell">이릅</th>'
						+ '<th class="noWrapCell">급수</th>'
						+ '<th class="noWrapCell">참가</th>'
						+ '<th class="noWrapCell">선택</th>'
						+ '</tr>';

					$("#userResultTbody").append(htm);
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {
							
							var btnTag = '	<td class="noWrapCell center"><button class="confirmBtn" id="confirmBtn" onclick="pickUser(\''+data.list[i].MBR_SQ+'\', \''+data.list[i].MBR_NM+'\');">선택</button></td>';
							
							if (data.list[i].ENTRY_CNT == "2종목") {
								btnTag = '	<td class="noWrapCell center">-</td>';
							}
							
							htm = ''
								+ '<tr>'  
								+ '	<td class="noWrapCell center" style="max-width: 1.2rem;" onclick="msgBox(\''+data.list[i].CLB_NM+'\');">'+data.list[i].CLB_NM+'</td>'
								+ '	<td class="noWrapCell center" style="max-width: 1.2rem;">'+data.list[i].MBR_NM+'</td>'
								+ '	<td class="noWrapCell center">'+data.list[i].LVL_NM+'</td>'
								+ '	<td class="noWrapCell center">'+data.list[i].ENTRY_CNT+'</td>'
								+ btnTag
								+ '</tr>'
							;
							$("#userResultTbody").append(htm);

						}
					} else {
						
						htm = '';
						$("#userResultTbody").append(htm);
					}
					load.hide();					
					
				},
				error : function(xhr, status, e) {
					load.hide()
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
