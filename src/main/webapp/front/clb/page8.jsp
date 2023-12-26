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
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>협찬</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script>var intClbSq = "${amsClb.CLB_SQ}";</script>
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/headerBBC.js" type="text/javascript" charset="utf-8"></script>
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
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		$("#app").prepend(htm)
		$(".logo")
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
.title1 .bold {
    font-size: 0.33rem;
}
</style>
</head>

<body>
<div class="app top5App">
	<div class="content">
		<div class="scroll-wrap refresh-wrap" id="app">
			<div class="container">
			

		          <div class="scroll-wrap scroll-wrap_fieldReport">

		            <div class="contentList2 pb16" id="jump1" style="padding-bottom:1rem;">
		              <div class="title1">
		                <div>
		                  <i class="fourDPlex icon-sanjiao"></i>
		                  <span>회비 내역 입력</span>
		                </div>
		              </div>
		              <div class="table">
		                <table class="table-col2 open" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
		
		                  <colgroup>
		                  	<col width="40%"/>
		                  	<col width="60%"/>
		                  </colgroup>
		                  <tr class="getWord">
		                    <th class="right noHang2 fontGrey Rword">수입</th>
		                    <td class="left">회비 수입 내역</td>
		                  </tr>
		                  
		                  <tr class="getInput intd">
		                    <th class="right noHang2 fontGrey Rword">일자</th>
		                    <td class="left">
		                    	<div class="input-wrap">
									<input type="date" class="imgContent" id="txtFeeDt" value="${amsClb.TODAY }" />
								</div>
		                    </td>
		                  </tr>
		                  <tr class="getWord">
		                    <th class="right noHang2 fontGrey Rword">대분류</th>
		                    <td class="left">
		                    	협찬
								<input type="hidden" name="txtLevel1" id="txtFeeType" value="A" />
								<input type="hidden" name="txtLevel1" id="txtLevel1" value="협찬" />
		                    </td>
		                  </tr>
		                  
		                  <tr class="getWord">
		                    <th class="right noHang2 fontGrey Rword">소분류</th>
		                    <td class="left">
		                        <div class="such mr20">
		                        	<label class="radio">
		  	                        <input class="" type="radio" name="txtLevel2" value="협찬"  checked="checked"/>
		  	                        <span class="Rdefine">협찬</span>
		                          </label>
		                        </div>
		                    </td>
		                  </tr>
		                  
		                  <tr class="getInput intd">
		                    <th class="right noHang2 fontGrey Rword">금액</th>
		                    <td class="left">
		                    	<div class="input-wrap inContent">
									          <input type="number" id="txtAmt" value="" />
									          <div>금액입력</div>
									        </div>
		                    </td>
		                  </tr>

		                  <tr class="getTextarea intd">
		                    <th class="right noHang2 fontGrey Rword">내역</th>
		                    <td class="left"><textarea class="inContent" id="txtDsc" rows="30" cols="30" placeholder="내역"></textarea></td>
		                  </tr>
		                  
		                </table>
		              </div>
            		  
						<div class="btn-wrap" style="padding-top: 0.3rem;padding-bottom: 0;">
							<div class="buttons" style="padding-top: 0;padding-bottom: 0;padding-left: 0.12rem;padding-right: 0.12rem;">
								<div class="blueBtn subBtn f-col font26" onclick="goFee();">회비관리</div>
								<div class="delBtn subBtn f-col font26" onclick="deleteFee('${para2}');" id="delBtn">삭제</div>
								<div class="orangeBtn subBtn f-col font26" onclick="sendFee();">저장</div>
							</div>
						</div>
            		   
		            </div>	
		            
		            		
		          </div>
            

			</div>
			
			
			
		</div>
	</div>
</div>
</body>
<script type="text/javascript">



$(function() {
	if ("" == "${para2}") {
		$("#delBtn").hide();
	}
	else {
		getData("${para2}");
	}
});

function goFee() {
	window.location.href="/front/bbc/clb/getPage.htm?pageName=page3&intClbsq=${intClbsq }";	
}

function deleteFee(ID) {

	if ("${loginMbrSq}" != "20" && "${loginMbrSq}" != "24" && "${loginMbrSq}" != "866") {

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
		message : '삭제하시겠습니까?',
		type : 'confirm',
		callback : function() {
			deleteData(ID);
		}
	})
}


function deleteData(ID) {

	var para1 = "FEE_DELETE";
	var para2 = ID;
	
	var load = loading();
	load.show()

	$.ajax({
				data : {
					para1 : para1,
					para2 : para2
				},
				type : "POST",
			    contentType : "application/x-www-form-urlencoded;charset=utf-8",
				url : "/front/bbc/clb/getData.htm",
				success : function(data) {

					window.location.href="/front/bbc/clb/getPage.htm?pageName=page3&intClbsq=${intClbsq }";	
					load.hide()

				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
}




function sendFee() {

	if ("${loginMbrSq}" != "20" && "${loginMbrSq}" != "24" && "${loginMbrSq}" != "866") {

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
		message : '저장하시겠습니까?',
		type : 'confirm',
		callback : function() {
			saveData();
		}
	})
}


function saveData() {

	var para1 = "FEE_SAVE";
	var para2 = "${para2}";
	var para3 = "9";
	var para4 = $("#txtFeeDt").val();
	var para5 = "A";
	var para6 = $("#txtLevel1").val();
	var para7 = $(':radio[name="txtLevel2"]:checked').val();
	var para8 = $("#txtAmt").val();
	var para9 = $("#txtDsc").val();
	
	var load = loading();
	load.show()

	$.ajax({
				data : {
					para1 : para1,
					para2 : para2,
					para3 : para3,
					para4 : para4,
					para5 : para5,
					para6 : para6,
					para7 : para7,
					para8 : para8,
					para9 : para9
				},
				type : "POST",
			    contentType : "application/x-www-form-urlencoded;charset=utf-8",
				url : "/front/bbc/clb/getData.htm",
				success : function(data) {

					window.location.href="/front/bbc/clb/getPage.htm?pageName=page3&intClbsq=${intClbsq }";	
					load.hide()

				},
				error : function(xhr, status, e) {
					load.hide()
					alert("Error : " + status);
				}
			});
}



	function getData(ID) {

		var para1 = "FEE_GET_ONE";
		var para2 = ID;

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2
					},
					type : "POST",
				    contentType : "application/x-www-form-urlencoded;charset=utf-8", 
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						console.log(data);
						if (data.list.length != 0) {

							for (var i = 0; i < data.list.length; i++) {

								$("#txtFeeDt").val(data.list[i].FEE_DT);
								$("#txtLevel1").val(data.list[i].LEVEL1);
								$('input:radio[name=txtLevel2]:input[value="'+data.list[i].LEVEL2+'"]').attr("checked", true);
								$("#txtAmt").val(data.list[i].AMT);
								$("#txtDsc").val(data.list[i].DSC);
								
							}
						} else {

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
			return '<a href="tel:'+a+'">전화걸기</a>';
		}
		
		return b
	}
	
</script>
</html>
