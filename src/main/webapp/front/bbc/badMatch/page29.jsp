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
.table {
    -webkit-overflow-scrolling:touch
}
.drag-table td {
    padding: 0.24rem 0.1rem;
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
            <img src="../image/back.png" class="mr24" onclick='gotoMain();'/>
          <span>${label.QUOTECOMPARISONRESULT}</span>
      	  <a onclick="lanChange(false);" id="langVn" class="matchHelp" style="margin-top: 0.88rem;bottom: 65px;background-image: url(/front/bbc/img/vn.png);">vn</a>
      	  <a onclick="lanChange(true);" id="langKr" class="matchHelp" style="margin-top: 0.88rem;bottom: 65px;background-image: url(/front/bbc/img/kr.png);">kr</a>
        </div>
      </header>
      <div class="content">
        <div class="container f-column" style="padding-top: 0.32rem; height: 100%;">
        
          <div class="scroll-wrap f-col" id="gameTable1" style="padding-bottom:0.4rem;">
			
			<div class="table-wrap">
				<div class="table">
					<table class="drag-table noWrapTable" cellspacing="0" cellpadding="2" width="100%" border="1">
						<tr>
							<th colspan="1">${label.ITEM}</th>
							<th colspan="2" style="border-left: solid 1px #c0c0c0;">A${label.SUPPLIER}</th>
							<th colspan="2" style="border-left: solid 1px #c0c0c0;">B${label.SUPPLIER}</th>
							<th colspan="2" style="border-left: solid 1px #c0c0c0;">C${label.SUPPLIER}</th>
						</tr>
						<tr>
<!-- 							<th>${label.PICTURE}</th> -->
							<th>${label.ITEMNAME}</th>
<!-- 							<th>${label.UNIT}</th> -->
							<th style="border-left: solid 1px #c0c0c0;">${label.UNIT}</th>
							<th>${label.UNITPRICE}</th>
							<th style="border-left: solid 1px #c0c0c0;">${label.UNIT}</th>
							<th>${label.UNITPRICE}</th>
							<th style="border-left: solid 1px #c0c0c0;">${label.UNIT}</th>
							<th>${label.UNITPRICE}</th>
						</tr>
						<tbody id="dataList">
						</tbody>
						<tr>
							<td style="border-top:solid 1px #c0c0c0;">견적요청</td>
							<td colspan="2" style="padding: 0.1rem;border-top:solid 1px #c0c0c0;text-align: center;border-left: solid 1px #c0c0c0;"><div id="aContract" class="blueBtn subBtn f-col font26" style="padding: 0.2rem 0.1rem;margin: 0;" onclick="msgBox('견적 요청 되었습니다.', 'aContract')">견적요청하기</div></td>
							<td colspan="2" style="padding: 0.1rem;border-top:solid 1px #c0c0c0;text-align: center;border-left: solid 1px #c0c0c0;"><div id="bContract" class="blueBtn subBtn f-col font26" style="padding: 0.2rem 0.1rem;margin: 0;" onclick="msgBox('견적 요청 되었습니다.', 'bContract')">견적요청하기</div></td>
							<td colspan="2" style="padding: 0.1rem;border-top:solid 1px #c0c0c0;text-align: center;border-left: solid 1px #c0c0c0;"><div id="cContract" class="blueBtn subBtn f-col font26" style="padding: 0.2rem 0.1rem;margin: 0;" onclick="msgBox('견적 요청 되었습니다.', 'cContract')">견적요청하기</div></td>
						</tr>
					</table>
				</div>
			</div>
			
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
		
		getDataProd("${para5}");
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
	
	function getDataProd(sProdid) {

		var load = loading();
		load.show()
	
		 $.ajax({
		 	 		data:{
		 	 			para1 : "SMALL_REVOLUTION"
		 	 			,para2 : "SELECT_DEMO_CONTRACT"
			 	 		,para5 : sProdid
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

// 						$("#dataList").html("");

						for (var i = 0; i < data.list.length; i++) {

							var a_unit = "";
							var a_amt = "";
							var b_unit = "";
							var b_amt = "";
							var c_unit = "";
							var c_amt = "";
							var a_tag = 'background-color: #e0e0e0;';
							var b_tag = 'background-color: #e0e0e0;';
							var c_tag = 'background-color: #e0e0e0;';
							var t_tag = '';

							if (data.list[i].SUP_A_AMT != null) {
								a_unit = data.list[i].SUP_A_UNIT;
								a_amt = data.list[i].SUP_A_AMT;
								a_tag = "";
							}
							if (data.list[i].SUP_B_AMT != null) {
								b_unit = data.list[i].SUP_B_UNIT;
								b_amt = data.list[i].SUP_B_AMT;
								b_tag = "";
							}
							if (data.list[i].SUP_C_AMT != null) {
								c_unit = data.list[i].SUP_C_UNIT;
								c_amt = data.list[i].SUP_C_AMT;
								c_tag = "";
							}

							if (data.list[i].PROD_NM == '합계' || data.list[i].PROD_NM == 'Total') {
								t_tag = 'background-color: #ff980033;font-weight: bold;';
							}
							
							htm = ''
								+ '<tr>'
// 								+ '	<td><img src="'+data.list[i].IMG_URL+'" style="width: 1.7rem;"></td>'
								+ '	<td style="'+t_tag+'">'+data.list[i].PROD_NM+'</td>'
// 								+ '	<td style="text-align: center;">'+data.list[i].PROD_UNIT+'</td>'
								+ '	<td style="text-align: center;border-left: solid 1px #c0c0c0;'+a_tag+t_tag+'">'+a_unit+'</td>'
								+ '	<td style="text-align: right;'+a_tag+t_tag+'">'+a_amt+'</td>'
								+ '	<td style="text-align: center;border-left: solid 1px #c0c0c0;'+b_tag+t_tag+'">'+b_unit+'</td>'
								+ '	<td style="text-align: right;'+b_tag+t_tag+'">'+b_amt+'</td>'
								+ '	<td style="text-align: center;border-left: solid 1px #c0c0c0;'+c_tag+t_tag+'">'+c_unit+'</td>'
								+ '	<td style="text-align: right;'+c_tag+t_tag+'">'+c_amt+'</td>'
								+ '</tr>'
								;
								$("#dataList").append(htm);
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

	function gotoMain() {
		var load = loading();
		load.show()
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page28";
	}
	
	function msgBox(msg, hId) {
		
		messageBox({
			title : '${label.NOTICE}',
			message : msg,
			type : 'alert',
			callback : function() {
				$("#"+hId).hide();
			}
		});
	}
	
	function calContract() {
		var strProdId = "0";
		$('input:checkbox[name="chkProd"]').each(function() {
			if(this.checked){
				strProdId = strProdId + "," + this.value;
			}
		});
		
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page29&para3="+strProdId;
	}

    
    function gotoResult() {
    	windows.location = "/front/bbc/badMatch/getPage.htm?pageName=page29"
    }

</script>
</html>
