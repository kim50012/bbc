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
<title>선수조회</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/headerMatch.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
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
.headerTitle {
	width: 4.2rem;
	overflow: initial;
	padding-left: 0.2rem;
	font-size: 0.3rem;
	line-height: 1;
	font-weight: bold;
}
.drag-table td {
	padding-right: 0;
    padding-left: 0;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/systemLogo2.jpg"></image><p class="headerTitle">선수조회</p></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		$("#app").prepend(htm);

		if ("${userInfo.B_LVL}" == "N") {
			messageBox({
				title : '알림',
				message : '회원 가입이 필요합니다.',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
		}

		if ("${userInfo.B_LVL}" == "") {
			messageBox({
				title : '알림',
				message : '아래 QR 코드를 꾸욱 눌러 스캔후 가입하세요.<br><br><img src="/uploads/68/2020/08/26/68_material_2020_08_26_14_39_48_16996.jpg" style="width: 4.5rem;"/>',
				type : 'alert',
				callback : function() {
					window.location.href='/front/bbc/badMatch/getPage.htm?pageName=page4';
				}
			})
		}
		
	});
	
	wechatShareMsg = "배드민턴 대회관리 시스템 BAUNet에 가입된 선수 조회";
</script>
</head>

<body>
    <div class="app pop-page">

      <div class="content" id="app">
        
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
        
          <div class="model-gray">
            <div class="bottom-model" style="padding-top: 0;">
				<div class="input-wrap" style="width: 50%;margin-right: 0.2rem;">
                    <button class="select-btn" id="selectA-1" style="width:100%;" onclick="selectArea(this);"><span>지역을 선택하세요.</span></button>
                    <input type="hidden" id="area"/>
				</div>
				<div class="input-wrap" style="width: 50%;margin-right: 0rem;">
                    <button class="select-btn" id="selectA-2" style="width:100%;" onclick="selectClub(this);"><span>클럽을 선택하세요.</span></button>
                    <input type="hidden" id="clb"/>
				</div>
            </div>
            <div class="bottom-model" style="padding-top: 10px;">
				<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
					<input class="imgContent" type="text" name="userNm" id="userNm" placeholder="이름을 입력 후 조회하세요." style="background-color: #ffffff;">
				</div>
              	<button class="confirmBtn" id="confirmBtn" style="width:30%" onclick="searchUser($('#userNm').val());">조회</button>
            </div>
          </div>
          
          <div class="scroll-wrap f-col" style="padding-bottom: 2rem;">


      		<div class="title2">
              <span class="font24 bold">선수 목록</span><span class="font20 fontOrange">총 : <span class="font20 fontOrange" id="userTotalCnt">0</span>명</span>
          	</div>
            <div class="scroll-wrap">
         		<table class="drag-table alignRightTable" id="userResult" cellspacing="0" cellpadding="2" border="1">
                <tbody id="userResultTbody">
                <tr>
                  <th class="noWrapCell">클럽</th>
                  <th class="noWrapCell">이릅</th>
                  <th class="noWrapCell">급수</th>
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
      </div>

    </div>  


      
  </body>
<script>
	
	function msgBox(msg) {
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	

	function selectArea(el) {
	  var $_that = $(el).find('span');
	  var defaultVal = $("#area").val();
	  if (defaultVal == "") {
		  defaultVal = "1";
	  }
	  radioPop({
	    val: defaultVal,
	    callback: function(name, value) {
	      $_that.html(name);
	      $("#area").val(value);
	    },
	    option: areaJson
	  });
	}

	function selectClub(el) {
	  var $_that = $(el).find('span');
	  var defaultVal = $("#clb").val();
	  radioPop({
	    val: defaultVal,
	    callback: function(name, value) {
	      $_that.html(name);
	      $("#clb").val(value);
	    },
	    option: clbJson
	  });
	}

	function searchUser(para2) {
	
		var load = loading();
		load.show()
	
		var para4 = $("#area").val();
		var para5 = $("#clb").val();
		
		 $.ajax({
		 	 		data:{
		 	 			para1 : "BADMATCH_SEARCH_USER_ALL2"
		 	 			,para2 : para2
		 	 			,para3 : "${para3}"
			 	 		,para4 : para4
				 	 	,para5 : para5
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {
					var htm = '';
					var cnt = 0;
					$("#userResultTbody").html("");

					htm = ''
						+ '<tr>'
						+ '<th class="noWrapCell">도시</th>'
						+ '<th class="noWrapCell">클럽</th>'
						+ '<th class="noWrapCell">이릅</th>'
						+ '<th class="noWrapCell">급수</th>'
						+ '</tr>';

					$("#userResultTbody").append(htm);
					
					if (data.list.length != 0) {

						for (var i = 0; i < data.list.length; i++) {
							
							cnt++;
							htm = ''
								+ '<tr>'  
								+ '	<td class="noWrapCell center">'+data.list[i].CITY+'</td>'
								+ '	<td class="noWrapCell center">'+data.list[i].CLB_NM+'</td>'
								+ '	<td class="noWrapCell center"><a onclick="goUserPage('+data.list[i].MBR_SQ+');">'+data.list[i].MBR_NM+'('+data.list[i].SEX+')</a></td>'
								+ '	<td class="noWrapCell center">'+data.list[i].LVL_NM+'</td>'
								+ '</tr>'
							;
							$("#userResultTbody").append(htm);

						}
						
						$("#userTotalCnt").html(cnt);
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

	function goUserPage(a) {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page24&para3=&para5="+a;
	}
	
</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
