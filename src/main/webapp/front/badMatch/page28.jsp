<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<c:set var="currentLang" value="<%=LabelUtil.getCurrentLanguage()%>" />

<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${label.COMPARISONOFFOODESTIMATES}</title>
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
.table {
    padding-bottom: 0.2rem;
}
.activeTr td {
    border-bottom: 1px solid #e42e43 !important;
}
.activeTr th {
    border-bottom: 1px solid #e42e43 !important;
}
.activeTr td {
    color: #333333 !important;
}
.endSpan {
	background: #000000;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.drag-table td {
	white-space: nowrap;
}
.dupSpan {
	background: #006ecd;
    color: #ffffff;
    padding-left: 0.1rem;
    padding-right: 0.1rem;
    line-height: 0.5rem;
    border-radius: 0.2rem;
}
.endSpanNo {
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
.tabHead .tabSelected:before {
    width: 1rem;
    transition: width 0.3s;
}
.matchHelp {
	width: 0.7rem;
	height: 0.5rem;
	background-size: 0.7rem 0.5rem;
	top: 0.18rem;
}
</style>
<script>
helpHtmlTag = "※ 식자재 가견적 비교를 할 수 있는 화면입니다.";
</script>
</head>

  <body style="margin-top: 0.88rem;padding-bottom: 0.88rem;">

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
<!--             <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page28";'/> -->
          <span>${label.COMPARISONOFFOODESTIMATES}</span>
      	  <a onclick="lanChange(false);" id="langVn" class="matchHelp" style="margin-top: 0.88rem;bottom: 65px;background-image: url(/front/bbc/img/vn.png);">vn</a>
      	  <a onclick="lanChange(true);" id="langKr" class="matchHelp" style="margin-top: 0.88rem;bottom: 65px;background-image: url(/front/bbc/img/kr.png);">kr</a>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
        
          <div class="tabHead pb22">
            <div class="tabSelected" onclick="changeTab(this, 1)">${label.LIVESTOCK}</div>
            <div onclick="changeTab(this, 2)">${label.FISHERIES}</div>
            <div onclick="changeTab(this, 3)" style="border-left: 1px solid #cbcbcb;">${label.AGRICULTURE}</div>
            <div onclick="changeTab(this, 4)">${label.PROCESSING}</div>
          </div>
          
          <div class="scroll-wrap f-col" id="gameTable1" style="padding-bottom:0.4rem;"></div>

          <div class="scroll-wrap f-col" id="gameTable2" style="display:none;padding-bottom:0.4rem;"></div>
          
          <div class="scroll-wrap f-col" id="gameTable3" style="display:none;padding-bottom:0.4rem;"></div>
          
          <div class="scroll-wrap f-col" id="gameTable4" style="display:none;padding-bottom:0.4rem;"></div>

	       	<div>
	      		<div class="blueBtn subBtn f-col font26" onclick="calContract();">${label.VIEWTHERESULTSOFCOMPARISONOFFOODMATERIALESTIMATES}</div>
	      	</div>
	      	
        </div>
	      	
      </div>


    </div>
    
      
  </body>
<script>

	$(function() {
		
		if ("${currentLang}" == "zh-CN") {
			$("#langVn").hide();
			$("#langKr").show();
		}
		else {
			$("#langVn").show();
			$("#langKr").hide();
		}
		
		getDataProd(1);
		
	});
	
	function lanChange(nType) {

		var load = loading();
		load.show()
		
		if (nType) {

			var strNatcd = "ko-KR";

			 $.ajax({
			 	 		data:{
			 	 			strNatcd : strNatcd
			 	 		},
					type : "POST",
					url : "/front/bbc/mbr/myPageLang.htm",
					success : function(data) {
						if(data.ret=="success"){
							location.reload();
						}else{
							load.hide();
							alert(data.ret);
						}
						
					},
					error : function(xhr, status, e) {
						load.hide();
						alert("Error : " + status);
					}
				});	
		} 
		else {

			var strNatcd = "zh-CN";

			 $.ajax({
			 	 		data:{
			 	 			strNatcd : strNatcd
			 	 		},
					type : "POST",
					url : "/front/bbc/mbr/myPageLang.htm",
					success : function(data) {
						if(data.ret=="success"){
							location.reload();
						}else{
							load.hide();
							alert(data.ret);
						}
						
					},
					error : function(xhr, status, e) {
						load.hide();
						alert("Error : " + status);
					}
				});	
		}
		
	}

	
	function changeTab(el, index){
		$(".tabSelected").removeClass("tabSelected")
		$(el).addClass("tabSelected")
		if(index == 1) {
			$("#gameTable1").show();
			$("#gameTable2").hide();
			$("#gameTable3").hide();
			$("#gameTable4").hide();
			getDataProd(1);
		} else if(index == 2) {
			$("#gameTable1").hide();
			$("#gameTable2").show();
			$("#gameTable3").hide();
			$("#gameTable4").hide();
			getDataProd(2);
		} else if(index == 3) {
			$("#gameTable1").hide();
			$("#gameTable2").hide();
			$("#gameTable3").show();
			$("#gameTable4").hide();
			getDataProd(3);
		} else if(index == 4) {
			$("#gameTable1").hide();
			$("#gameTable2").hide();
			$("#gameTable3").hide();
			$("#gameTable4").show();
			getDataProd(4);
		}
	}

	function getDataProd(pType) {

		var load = loading();
		load.show()
	
		if ($("#gameTable"+pType).html() == "") {

			
			 $.ajax({
			 	 		data:{
			 	 			para1 : "SMALL_REVOLUTION"
			 	 			,para2 : "SELECT_PROD"
				 	 		,para3 : pType
				 	 		,para6 : "${currentLang}"
			 	 		},
					type : "POST",
					url : "/front/bbc/badMatch/getData.htm",
					success : function(data) {
						var htm = '';
						var j = 0;
						var tag = "";
						var thisTag = "";
						
						if (data.list.length != 0) {

							if ($("#gameTable"+pType).html() == "") {
								thisTag = "PROD"+pType;
								
								for (var i = 0; i < data.list.length; i++) {

									if (i == 0) {
										htm = ''
											+ '<div class="table">'
											+ '      <table class="drag-table" id="entryListTable" cellspacing="0" cellpadding="2" width="100%" border="1">'
											+ '	<colgroup>'
											+ '		<col width="20%" />'
											+ '		<col width="60%" />'
											+ '		<col width="20%" />'
											+ '	</colgroup>'
											+ '	<tbody id="tbodyList-'+thisTag+'">'
											+ '	</tbody>'
											+ '      </table>'
											+ '</div>'
										;
										$("#gameTable"+pType).append(htm);
									}

									htm = ''
										+ '			<tr>'
										+ '			  <th style="padding: 0.1rem;">'
										+ '				<div class="fontGreen">'
										+ '					<img src="'+data.list[i].IMG_URL+'" style="width: 2rem;">'
										+ '				</div>'
										+ '			  </th>'
										+ '			  <td>'
										+ '				<div class="tab-img mb16 mb10">'
										+ '					<span style="padding-left:0.1rem;">'+data.list[i].PROD_NM+'</span>'
										+ '				</div>'
										+ '				<div class="tab-img mb16 mb10">'
										+ '					<span style="padding-left:0.1rem;">'+data.list[i].PROD_DESC+'</span>'
										+ '				</div>'
										+ '				<div class="tab-img mb16 mb10">'
										+ '					<span style="padding-left:0.1rem;">'+data.list[i].PROD_UNIT+'</span>'
										+ '				</div>'
										+ '			  </td>'
										+ '			  <td style="padding:0.1rem;">'
										+ '				<div class="btn-wrap" style="padding:0;">'
										+ '					<div class="buttons" style="padding:0;">'
										+ '						<div class="blueBtn subBtn f-col font26" id="addBtn'+data.list[i].PROD_ID+'" onclick="msgBox2('+data.list[i].PROD_ID+')">${label.SELECTION}</div>'
										+ '					<input type="checkbox" style="display:none;" name="chkProd" id="chkProd'+data.list[i].PROD_ID+'" value="'+data.list[i].PROD_ID+'">'
										+ '					</div>'
										+ '				</div>'
										+ '			  </td>'
										+ '			</tr>'
										;
										$("#tbodyList-"+thisTag).append(htm);
								}	
							}
							
						} else {
							
						}
						$("#gameTable"+pType).animate({scrollTop: '0px'}, 0);
						load.hide();
						
					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
		}
		else {
			load.hide();
		}
	}	

	
	function joinMatch() {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";
	}

	function msgBox(msg) {
		
		messageBox({
			title : '${label.NOTICE}',
			message : msg,
			type : 'alert',
			callback : function() {}
		});
	}	
	function msgBox2(prodId) {

		if ($("#addBtn"+prodId).html() == "${label.CANCEL}") {
			$("#addBtn"+prodId).removeClass('orangeBtn');
			$("#addBtn"+prodId).addClass('blueBtn');
			$("#addBtn"+prodId).html("${label.SELECTION}");
			$('input:checkbox[id="chkProd'+prodId+'"]').attr("checked", false);
		}
		else {
			$("#addBtn"+prodId).removeClass('blueBtn');
			$("#addBtn"+prodId).addClass('orangeBtn');
			$("#addBtn"+prodId).html("${label.CANCEL}");
			$('input:checkbox[id="chkProd'+prodId+'"]').attr("checked", true);
		}
		
		
// 		setTimeout(function(){ popRemove();callback(); }, 500);
		
// 		messageBox({
// 			title : '${label.NOTICE}',
// 			message : "${label.WASCHOSEN}",
// 			type : 'alert',
// 			callback : function() {}
// 		});
	}	
	
	function calContract() {

		var load = loading();
		load.show()
		
		var strProdId = "0";
		$('input:checkbox[name="chkProd"]').each(function() {
			if(this.checked){
				strProdId = strProdId + "," + this.value;
			}
		});
		
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page29&para5="+strProdId;
	}
    
    function gotoResult() {
    	windows.location = "/front/bbc/badMatch/getPage.htm?pageName=page29"
    }

</script>
</html>
