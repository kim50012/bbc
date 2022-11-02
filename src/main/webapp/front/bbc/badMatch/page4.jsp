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
<title>회원 가입</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%>
<script>
wechatShareMsg = "배드민턴 대회관리 시스템 BAUNet에 회원 가입하세요.";
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>회원 가입</span>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
        
          <div class="scroll-wrap f-col">
          
            <div class="contentList2 pb16" id="jump1">
              <div class="title1">
                <div>
                  <i class="fourDPlex icon-sanjiao"></i>
                  <span>기본 정보</span>
                </div>
              </div>
              <div class="table">
                <table class="table-col2 open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">

                  <colgroup>
                  	<col width="30%"/>
                  	<col width="70%"/>
                  </colgroup>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">위챗 닉네임</th>
                    <td class="left" id="levelNm">${userInfo.WX_NICK}</td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">소속 클럽</th>
					<td class="inputTd">
                        <div>
                          <button class="select-btn" id="selectA-1" onclick="selectClub(this)"><span>클럽을 선택하세요.</span></button>
                          <input type="hidden" id="clb"/>
                        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">성명<br>(실명, 성포함)</th>
                    <td class="left">
                    	<div class="input-wrap inContent">
							          <input type="text" id="mbrNm" value="" />
							          <div>성명을 입력하세요.(예 : 홍길동)</div>
							        </div>
                  	</td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">성별</th>
                    <td class="left">
						<div class="such mr20">
                        	<label class="radio">
  	                        <input class="" type="radio" name="sex" value="M">
  	                        <span class="Rdefine">남</span>
                          </label>
                        </div>
						<div class="trans mr20">
                        	<label class="radio">
  	                        <input class="" type="radio" name="sex" value="W">
  	                        <span class="Rdefine">여</span>
                          </label>
                        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">출생년도</th>
                    <td class="left">
                        <div>
				         	<select id="birthYear" class="select-btn">
				         		<option value="">출생년도를 선택하세요.</option>
				         	   	<c:forEach var="idx" begin="1950" end="2010"  > 
									<option value="${idx}">${idx}</option>
								</c:forEach> 
				         	</select>
                        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">나이</th>
                    <td class="left">
                        <div>
                          <button class="select-btn" id="selectAge" onclick="selectAge(this)"><span>나이를 선택하세요.</span></button>
                          <input type="hidden" id="age"/>
                        </div>
                    </td>
                  </tr>
                  <tr class="getInput intd">
                    <th class="right noHang2 fontGrey Rword">배드민턴 급수</th>
                    <td class="left">
                        <div>
                          <button class="select-btn" id="selectLvl" onclick="selectLvl(this)"><span>배드민턴 급수를 선택하세요.</span></button>
                          <input type="hidden" id="bLvl"/>
                        </div>
                    </td>
                  </tr>
                  <tr class="getTextarea intd">
                    <th class="right noHang2 fontGrey Rword">소개</th>
                    <td class="left"><textarea class="inContent" id="dsc" rows="30" cols="30" placeholder="간단 소개  부탁드립니다."></textarea></td>
                  </tr>
                </table>
              </div>
            </div>

            <div class="tab-con-wrap" style="min-height: 0;">
              <div class="btn-area">
                <button class="fourD-blue-btn" onclick="joinUser()">가입하기</button>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>
    
      
  </body>
<script>

	function joinUser() {
		
		var para2 = "${loginMbrSq}";
		var para3 = $('#mbrNm').val();
		var para4 = $('#bLvl').val();
		var para5 = $('#age').val();
		var para6 = $(':radio[name="sex"]:checked').val();
		var para7 = $('#dsc').val();
		var para8 = $('#clb').val();
		var para9 = $('#birthYear').val();

		if (para8 == "") {
			msgBox("소속 클럽을 선택하세요.");
			return;
		}
		if (para3 == "") {
			msgBox("성명을 입력하세요.");
			return;
		}
		if (para6 == "") {
			msgBox("성별을 선택하세요.");
			return;
		}
		if (para4 == "") {
			msgBox("배드민턴 급수를 선택하세요.");
			return;
		}
		if (para9 == "") {
			msgBox("출생년도를 선택하세요.");
			return;
		}
		if (para5 == "") {
			msgBox("나이를 선택하세요.");
			return;
		}
		
		var load = loading();
		load.show()

		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_CREATE_USER"
		 	 			,para2 : para2
		 	 			,para3 : para3
		 	 			,para4 : para4
		 	 			,para5 : para5
		 	 			,para6 : para6
		 	 			,para7 : para7
		 	 			,para8 : para8
		 	 			,para9 : para9
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var openid = data.list[0].OPENID;
					sendMsgCommonFunc(
							"first", "신규 회원 가입 통지"
							, "keyword1", data.list[0].MBR_NM + "(" + para2 +")"
							, "keyword2", "대회관리 시스템"
							, "keyword3", data.list[0].DT
							, "remark", "대회관리 시스템 신규회원 가입이 되었습니다."
							, null, null
							, null, null
							, "ZS6ABGZpdFwNwgvNVXD-YuF3fS8ByNtUufhFSWsbNaU"
							, "orfEm0_ytIhHG9DajyYhD500MCtk"
							, "/front/bbc/badMatch/getPage.htm?pageName=page9"
					);
					window.location.href="/front/bbc/badMatch/getPage.htm?pageName=home";
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
	  })
	}	
	
	function selectAge(el) {
	  var $_that = $(el).find('span');
	  var defaultVal = $("#age").val();
	  if (defaultVal == "") {
		  defaultVal = "20";
	  }
	  radioPop({
	    val: defaultVal, // 默认第一项，可以不用传参数
	    callback: function(name, value) {
	      $_that.html(name);
	      $("#age").val(value);
	    },
	    option: ageJson
	  });
	}	
	
	function selectLvl(el) {
	  var $_that = $(el).find('span');
	  var defaultVal = $("#bLvl").val();
	  if (defaultVal == "") {
		  defaultVal = "A";
	  }
	  radioPop({
	    val: defaultVal, // 默认第一项，可以不用传参数
	    callback: function(name, value) {
	      $_that.html(name);
	      $("#bLvl").val(value);
	    },
	    option: lvlJson
	  });
	}	

	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
