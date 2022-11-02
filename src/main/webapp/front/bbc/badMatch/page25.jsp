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
<title>회원정보 엑셀다운로드</title>
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
.drag-table {
    width: 100%;
    border-left: none;
    border-right: none;
    border-top: 2px solid #006ecd;
    border-bottom: 1px solid #CCCCCC;
    z-index: 300;
}
.drag-table td {
	padding: 0.2rem 0.2rem;
}
.tab-img img:first-of-type {
	height: 0.23rem;
    border: 0;
    padding-left: 0.03rem;
    margin: 0;
    vertical-align: initial;
}
.tab-img {
	display: table-cell;
}
.title2 {
	padding-top: 0;
}
.table {
	padding-bottom: 0.4rem;
}
.endSpan {
	background: #000000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.endSpanIng {
	background: #999999;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="/front/bbc/img/systemLogo2.jpg"></image><p class="headerTitle">배드민턴 대회 관리</p></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
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
	
	helpHtmlTag = "※ 회원정보를 엑셀로 다운로드 받습니다..";
	
</script>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
          <img src="../image/back.png" class="mr24" onclick='window.history.back();'/>
          <span>회원정보 엑셀다운로드</span>
      	  <a onclick="gotoHelp();" class="matchHelp" style="bottom: 65px;">help</a>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
          <div class="scroll-wrap f-col">
          
          	<!--- areaS ------------>
          	<div id="areaS">
		    	<div class="title">
			    	<span class="font24 bold" id="userNm"></span><span class="font24 bold">회원정보</span>
		       	</div>
		        <div class="table">
		        	<table class="drag-table alignRightTable" id="table" cellspacing="0" cellpadding="2" border="1">
						<caption>회원정보</caption>
						<thead>
		                <tr>
							<th class="noWrapCell">No</th>
							<th class="noWrapCell">ID</th>
							<th class="noWrapCell">클럽</th>
							<th class="noWrapCell">이름</th>
							<th class="noWrapCell">성별</th>
							<th class="noWrapCell">급수</th>
							<th class="noWrapCell">상태</th>
		                </tr>
						</thead>
		                <tbody id="areaSlist">
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
		       	</div>
          	</div>
          
          
        </div>
	        <c:if test="${userInfo.AUTH == 'A'}">
	       	<div>
	      		<div class="blueBtn subBtn f-col font26" id="resetMatch" onclick="fnExcelReport('table','회원정보');">엑셀다운로드</div>
	      	</div>
	      	</c:if>
      </div>

    </div>
    
      
  </body>
<script>

	$(function() {
		getData();
	});

	function getData() {

		var load = loading();
		load.show()
	
		var a = getDataMyinfoA();

		if (a) {
			load.hide();
		}
		else {
			messageBox({
				title : '알림',
				message : '관리자에게 문의 하세요.',
				type : 'alert',
				callback : function() {
					load.hide();
				}
			});
		}
	}


	function getDataMyinfoA() {

		 $.ajax({
		 	 		data:{
		 	 			para1 : "EXCEL_DOWNLOAD_BKBA"
	 	 				,para2 : ""
	 	 				,para3 : ""
	 	 				,para4 : ""
	 	 				,para5 : ""
		 	 		},
				type : "POST",
				url : "/front/bbc/badMatch/getData.htm",
				success : function(data) {

					if (data.list.length != 0) {

						var strTitle = "";
						
						for (var i = 0; i < data.list.length; i++) {

							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].NUM+'</td>'
								+ '				<td class="center">'+data.list[i].MBR_SQ+'</td>'
								+ '				<td class="center">'+data.list[i].CLB_NM+'</td>'
								+ '				<td class="center">'+data.list[i].CLB_NIK_NM+'</td>'
								+ '				<td class="center">'+data.list[i].SEX+'</td>'
								+ '				<td class="center">'+data.list[i].BMT_GD+'</td>'
								+ '				<td class="center">'+data.list[i].STS+'</td>'
								+ '			</tr>'
								;
								$("#areaSlist").append(htm);
								
						}
						
					}
				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
		return true;
	}


	function goUserPage(a,b) {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page15&para3="+a+"&para5="+b;
	}
	function msgBox(msg) {
		
		messageBox({
			title : '알림',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	
	

	function fnExcelReport(id, title) {
		var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		tab_text = tab_text
				+ '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		tab_text = tab_text
				+ '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
		tab_text = tab_text
				+ '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		tab_text = tab_text
				+ '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		tab_text = tab_text + "<table border='1px'>";
		var exportTable = $('#' + id).clone();
		exportTable.find('input').each(function(index, elem) {
			$(elem).remove();
		});
		tab_text = tab_text + exportTable.html();
		tab_text = tab_text + '</table></body></html>';
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		var fileName = title + '.xls';
		//Explorer 환경에서 다운로드
		if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			if (window.navigator.msSaveBlob) {
				var blob = new Blob([ tab_text ], {
					type : "application/csv;charset=utf-8;"
				});
				navigator.msSaveBlob(blob, fileName);
			}
		} else {
			var blob2 = new Blob([ tab_text ], {
				type : "application/csv;charset=utf-8;"
			});
			var filename = fileName;
			var elem = window.document.createElement('a');
			elem.href = window.URL.createObjectURL(blob2);
			elem.download = filename;
			document.body.appendChild(elem);
			elem.click();
			document.body.removeChild(elem);
		}
	}


</script>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
