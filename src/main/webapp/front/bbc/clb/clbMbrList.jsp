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
    <title>${label.会员管理}</title>
    <%@ include file="/front/bbc/inc/css.jsp"%>
    <%@ include file="/front/bbc/inc/js.jsp"%>
    <link rel="stylesheet" type="text/css" href="../css/font.css" />
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <link rel="stylesheet" type="text/css" href="../css/button.css" />
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
.centerA {
    text-align: center !important;
    background: #0080c6 !important;
    color: #ffffff !important;
}
.centerB {
    text-align: center !important;
    background: #ffffff !important;
}
.centerC {
    text-align: center !important;
    background: #f8971d !important;
}
.subBtn {
    padding: 0.2rem 0.1rem;
}
.table {
    -webkit-overflow-scrolling: touch;
    width: 100%;
    overflow-x: auto;
}
.table-wrap {
    margin: 0.1rem;
    background: #fff;
    border-radius: 0.1rem;
    padding: 0.1rem;
}
.drag-table {
    font-size: 0.24rem;
}
.drag-table th {
    padding: 0.1rem 0.05rem;
    white-space: nowrap;
    font-size: 0.22rem;
}
.drag-table td {
    padding: 0.1rem 0.05rem;
    font-size: 0.22rem;
}
.drag-table td.center img {
    width: 0.5rem !important;
    height: 0.5rem !important;
    object-fit: cover;
    border-radius: 50%;
}
/* 각 탭별 테이블 최적화 */
#tab1 .drag-table th:nth-child(1),
#tab2 .drag-table th:nth-child(1),
#tab3 .drag-table th:nth-child(1) { width: 8%; }

#tab1 .drag-table th:nth-child(2),
#tab2 .drag-table th:nth-child(3),
#tab3 .drag-table th:nth-child(2) { width: 22%; }

#tab2 .drag-table th:nth-child(2) { width: 12%; }

#tab1 .drag-table th:nth-child(3),
#tab2 .drag-table th:nth-child(4),
#tab3 .drag-table th:nth-child(3) { width: 10%; } /* 아이디 컬럼 너비 축소 */

#tab1 .drag-table th:nth-child(4),
#tab2 .drag-table th:nth-child(5),
#tab3 .drag-table th:nth-child(4) { width: 18%; }

#tab1 .drag-table th:nth-child(5),
#tab2 .drag-table th:nth-child(6),
#tab3 .drag-table th:nth-child(5) { width: 22%; }

#tab1 .drag-table th:nth-child(6),
#tab2 .drag-table th:nth-child(7),
#tab3 .drag-table th:nth-child(6) { width: 18%; }

/* 아이디 컬럼 줄바꿈 설정 */
#tab2 .drag-table td:nth-child(4) {
    word-break: break-all;
    white-space: normal;
    min-width: 60px;
}

/* 생일 목록 테이블 최적화 */
#tab4 .drag-table th:nth-child(1) { width: 10%; }
#tab4 .drag-table th:nth-child(2) { width: 25%; }
#tab4 .drag-table th:nth-child(3) { width: 20%; }
#tab4 .drag-table th:nth-child(4) { width: 25%; }
#tab4 .drag-table th:nth-child(5) { width: 20%; }

@media screen and (max-width: 768px) {
    .drag-table {
        font-size: 0.20rem;
    }
    .drag-table th,
    .drag-table td {
        padding: 0.08rem 0.03rem;
        font-size: 0.20rem;
    }
    .drag-table td.center img {
        width: 0.4rem !important;
        height: 0.4rem !important;
    }
    .table-wrap {
        margin: 0.05rem;
        padding: 0.05rem;
    }
}
</style>
</head>
<body>
    <div class="app">
        <div class="content">
            <div class="scroll-wrap" id="app">
                <div class="container">
                    <div class="tab-header">
                        <div onclick="tab(this, 1)" class="active"><p>${label.加入申请}</p></div>
                        <div onclick="tab(this, 2)"><p>${label.会员}</p></div>
                        <div onclick="tab(this, 3)"><p>${label.退出会员}</p></div>
                        <c:if test="${amsClb.CLB_SQ != 11}">
                        <div onclick="tab(this, 4)"><p>${label.会员}생일</p></div>
                        </c:if>
                    </div>

                    <!-- 가입신청 영역 -->
                    <div class="scroll-wrap f-col pb22" id="tab1">
                        <div class="table-wrap">
                            <div class="table">
                                <table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" width="100%" border="1">
                                    <tr>
                                        <th>${label.排序}</th>
                                        <th>${label.姓名}</th>
                                        <th>아이디</th>
                                        <th>${label.状态}</th>
                                        <th>${label.加入日}</th>
                                        <th>${label.确认}</th>
                                    </tr>
                                    <c:forEach var="atrClbJinReq" items="${atrClbJinReq}" varStatus="status">
                                        <tr>
                                            <td class="center">${status.count}</td>
                                            <td class="center">${atrClbJinReq.CLB_NIK_NM}</td>
                                            <td class="center">${atrClbJinReq.MBR_ID}</td>
                                            <td class="center">${atrClbJinReq.CLB_JIN_REQ_ST_NM}</td>
                                            <td class="center">${atrClbJinReq.REQ_DT}</td>
                                            <td class="center" onclick="fn_ClbMbrOpen('${atrClbJinReq.CLB_JIN_REQ_SQ}', '${atrClbJinReq.JIN_REQ_MBR_SQ}');">${label.确认}</td>
                                        </tr>
                                        
                                        <input type="hidden" id="CLB_NIK_NM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.CLB_NIK_NM}">
                                        <input type="hidden" id="MBR_NM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.MBR_NM}">
                                        <input type="hidden" id="AGE_YY${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.AGE_YY}">
                                        <input type="hidden" id="GND_DV${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.GND_DV}">
                                        <input type="hidden" id="BMT_GD${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.BMT_GD}">
                                        <textarea style="display:none" id="JIN_GRT_TXT${atrClbJinReq.CLB_JIN_REQ_SQ}" placeholder="请输入内容" readonly="true">${atrClbJinReq.JIN_GRT_TXT}</textarea>
                                        <input type="hidden" id="MBR_MAI_IMG_FNM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.MBR_MAI_IMG_FNM}">
                                        <input type="hidden" id="CLB_NM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.CLB_NM}">
                                        <input type="hidden" id="OPENID${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.OPENID}">
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- 회원 목록 영역 -->
                    <div class="scroll-wrap f-col pb22" id="tab2" style="display:none;">
                        <div class="table-wrap">
                            <div class="table">
                                <table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" width="100%" border="1">
                                    <tr>
                                        <th>${label.排序}</th>
                                        <th>${label.图片}</th>
                                        <th>${label.姓名}</th>
                                        <th>아이디</th>
                                        <th>${label.会员等级}</th>
                                        <th>${label.加入日}</th>
                                        <th>${label.修改}</th>
                                    </tr>
                                    <c:forEach var="amsClbMbr" items="${amsClbMbr}" varStatus="status">
                                        <tr>
                                            <td class="center">${status.count}</td>
                                            <td class="center"><img src="${amsClbMbr.MBR_MAI_IMG_PTH}" style="width: 0.6rem;height: auto;"></td>
                                            <td class="center">${amsClbMbr.CLB_NIK_NM}</td>
                                            <td class="center">${amsClbMbr.MBR_ID}</td>
                                            <td class="center">${amsClbMbr.CLB_GD_NM}</td>
                                            <td class="center">${amsClbMbr.CLB_JIN_DT}</td>
                                            <td class="center" onclick="window.location='/front/bbc/clb/clbMbrInfo.htm?intClbsq=${amsClbMbr.CLB_SQ}&intMbrsq=${amsClbMbr.MBR_SQ}';">${label.修改}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- 탈퇴 회원 영역 -->
                    <div class="scroll-wrap f-col pb22" id="tab3" style="display:none;">
                        <div class="table-wrap">
                            <div class="table">
                                <table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" width="100%" border="1">
                                    <tr>
                                        <th>${label.排序}</th>
                                        <th>${label.姓名}</th>
                                        <th>아이디</th>
                                        <th>${label.会员等级}</th>
                                        <th>${label.退出日}</th>
                                        <th>Rank</th>
                                    </tr>
                                    <c:forEach var="amsClbMbrExi" items="${amsClbMbrExi}" varStatus="status">
                                        <tr>
                                            <td class="center">${status.count}</td>
                                            <td class="center">${amsClbMbrExi.CLB_NIK_NM}</td>
                                            <td class="center">${amsClbMbrExi.MBR_ID}</td>
                                            <td class="center" onclick="window.location='/front/bbc/clb/clbMbrInfo.htm?intClbsq=${amsClbMbrExi.CLB_SQ}&intMbrsq=${amsClbMbrExi.MBR_SQ}';">${amsClbMbrExi.CLB_GD_NM}</td>
                                            <td class="center">${amsClbMbrExi.CLB_JIN_DT}</td>
                                            <td class="center">${amsClbMbrExi.CLB_RANK}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- 생일 목록 영역 -->
                    <div class="scroll-wrap f-col pb22" id="tab4" style="display:none;">
                        <div class="table-wrap">
                            <div class="table">
                                <table class="drag-table alignRightTable" cellspacing="0" cellpadding="2" width="100%" border="1">
                                    <tr>
                                        <th>월</th>
                                        <th>${label.姓名}</th>
                                        <th>${label.会员等级}</th>
                                        <th>올해생일</th>
                                        <th>생일</th>
                                    </tr>
                                    <c:forEach var="amsClbMbrBth" items="${amsClbMbrBth}" varStatus="status">
                                        <c:if test="${amsClbMbrBth.RANKING == 1 and status.count > 1}">
                                            <tr style="background: #f8f8f8;">
                                                <td colspan="5" class="center">${amsClbMbrBth.THIS_YEAR_MONTH}월</td>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td class="center">${amsClbMbrBth.THIS_YEAR_MONTH}</td>
                                            <td class="center">${amsClbMbrBth.CLB_NIK_NM}</td>
                                            <td class="center">${amsClbMbrBth.CLB_GD_NM}</td>
                                            <td class="center">${amsClbMbrBth.THIS_YEAR_BTH_DT}</td>
                                            <td class="center">${amsClbMbrBth.BTH_DT}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 가입신청 상세 팝업 -->
    <div class="pop-up-wrap" style="display:none;">
        <div class="pop-up-content">
            <div class="inp-wrap">
                <p>${label.图片}：</p>
                <img src="" id="strMBR_MAI_IMG_FNM" style="width:1rem;height:1rem;"/>
            </div>
            <div class="inp-wrap">
                <p>${label.简称}：</p>
                <input class="textboxcontent" type="text" id="strNiknm" value=""  readonly="true"/>
            </div>
            <c:if test="${amsClb.CLB_SQ == 11}">
            <div class="inp-wrap">
                <p>클럽：</p>
                <input class="textboxcontent" type="text" id="clb_nm" value=""  readonly="true"/>
                <input class="textboxcontent" type="hidden" id="strOpenid" value=""  readonly="true"/>
            </div>
            </c:if>
            <div class="inp-wrap">
                <p>${label.姓名}：</p>
                <input class="textboxcontent" type="text" id="strClbniknm" value=""  readonly="true"/>
            </div>
            <div class="inp-wrap">
                <p>${label.年龄}：</p>
                    <select class="textboxcontent" id="strAgeyy" style="width:100%;color:#666;padding-right: 0;flex: 1;" readonly="true">
                        <option value="10">19${label.岁}${label.以下}</option>
                        <option value="20">20~29${label.岁}</option>
                        <option value="30">30~39${label.岁}</option>
                        <option value="40">40~49${label.岁}</option>
                        <option value="50">50${label.岁}${label.以上}</option>
                    </select>
            </div>
            <div class="inp-wrap">
                <p>${label.性别}：</p>
                    <select class="textboxcontent" id="strGnddv" style="width:100%;color:#666;padding-right: 0;flex: 1;" readonly="true">
                        <option value="MALE">${label.男}</option>
                        <option value="FEMA">${label.女}</option>
                    </select>
            </div>
            <div class="inp-wrap">
                <p>${label.小组}：</p>
                    <select class="textboxcontent" id="strBmtgd" style="width:100%;color:#666;padding-right: 0;flex: 1;background: white;">
                        <option value="A">A${label.组}</option>
                        <option value="B">B${label.组}</option>
                        <option value="C">C${label.组}</option>
                        <option value="D">D${label.组}</option>
                        <option value="E">${label.新手}</option>
                    </select>
            </div>
            <div class="inp-wrap">
                <p>${label.内容}：</p>
                <textarea class="textboxcontent" id="strJingrttxt" placeholder="请输入内容" readonly="true"></textarea>
            </div>
            <div class="buttons">
                <span class="cancel" id="cancelSpanReq" onclick="$('.pop-up-wrap').hide();">${label.取消}</span>
                <span class="cancel" id="spnClbMbrReject" onclick="fn_ClbMbrReject();">${label.拒绝}</span>
                <span id="spnClbMbrSave2" onclick="fn_ClbMbrSave2();">${label.批准}</span>
            </div>
        </div>
    </div>			
			
	<script type="text/javascript">
	function tab(el, index) {
	    $(".tab-header div").removeClass("active");
	    $(el).addClass("active");
	    $("#tab1, #tab2, #tab3, #tab4").hide();
	    $("#tab" + index).show();
	}

	$(function() {
	    var htm = '<header class="app-header" style="position: relative;">'
	            + '<div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div>'
	            + '<div class="font24 bold"><a href="/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }">${amsClb.CLB_NM} [${amsClb.CLB_MBR_CNT}명]</a></div>'
// 	            + '<div class="number-information">'
// 	            + '<div class="number-name">${amsClb.MBR_NM}</div>'
// 	            + '<div class="number-level">${amsClb.CLB_GD_NM}</div>'
// 	            + '</div>'
	            + '</header>';
	    $("#app").prepend(htm);
	    
	    $(".tab-header div").eq(0).addClass("active");
	    $("#tab1").show();
	    
	    // ...existing code...
	});

 		function fn_ClbMbrOpen(intClbjinreqsq, intJinreqmbrsq) {
 			vintClbjinreqsq = intClbjinreqsq;
 			vintJinreqmbrsq = intJinreqmbrsq;
 			
			$("#strNiknm").val($("#MBR_NM"+intClbjinreqsq).val());
			$("#strClbniknm").val($("#CLB_NIK_NM"+intClbjinreqsq).val());
			$("#strAgeyy").val($("#AGE_YY"+intClbjinreqsq).val());
			$("#strGnddv").val($("#GND_DV"+intClbjinreqsq).val());
			$("#strBmtgd").val($("#BMT_GD"+intClbjinreqsq).val());
			$("#strJingrttxt").val($("#JIN_GRT_TXT"+intClbjinreqsq).val());
			$("#strMBR_MAI_IMG_FNM").attr("src", $("#MBR_MAI_IMG_FNM"+intClbjinreqsq).val());
			$("#strOpenid").val($("#OPENID"+intClbjinreqsq).val());

			<c:if test="${amsClb.CLB_SQ == 11}">
			$("#clb_nm").val($("#CLB_NM"+intClbjinreqsq).val());
			</c:if>
			
 			$(".pop-up-wrap").show();
		}

 		function fn_ClbMbrSave2() {
 			fn_ClbMbrSave(vintClbjinreqsq, vintJinreqmbrsq, "A");
 			$("#spnClbMbrSave2").hide();
		}

 		function fn_ClbMbrReject() {
 			fn_ClbMbrSave(vintClbjinreqsq, vintJinreqmbrsq, "R");
 			$("#spnClbMbrReject").hide();
		}

 		function fn_ClbMbrSave(intClbjinreqsq, intJinreqmbrsq, strJobtype) {
 			
 			
 			var intClbsq= "${intClbsq}";	  // [클럽가입신청] 클럽시퀀스
 			var strBmtgd = $("#strBmtgd").val();
 			var strNiknm = $("#strNiknm").val();
 			var strOpenid = $("#strOpenid").val();
 			
 			if (strBmtgd == "") {
				alert("급수를 선택하세요.");
 				return;
 			}
 			
 			loadingShow();
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intClbsq : intClbsq
 			 	 			,intClbjinreqsq : intClbjinreqsq
 			 	 			,intJinreqmbrsq : intJinreqmbrsq
 			 	 			,strJobtype : strJobtype
 			 	 			,strBmtgd : strBmtgd
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/clb/clbMbrSave.htm",
 					success : function(data) {
 						var now = new Date();
 						sendMsgCommonFunc(
 								"first", "회원 가입 승인 통지"
 								, "keyword1", strNiknm
 								, "keyword2", "회원 가입이 승인 되었습니다."
 								, "keyword3", now
 								, "remark", "메시지를 클릭하여 시스템 확인하세요."
 								, null, null
 								, null, null
 								, "ZS6ABGZpdFwNwgvNVXD-YuF3fS8ByNtUufhFSWsbNaU"
 								, strOpenid
 								, "/front/bbc/clb/clbDetMy.htm?intClbsq="+intClbsq
 						); 						
 						
 						if(data.ret=="success"){
 		     				alert("${label.保存成功了}");
 							window.location.reload(true);
 						}else{
 							loadingHide();
 							$("#spnClbMbrSave2").show();
 							alert(data.ret);
 						}
 						
 					},
 					error : function(xhr, status, e) {
 						loadingHide();
						$("#spnClbMbrSave2").show();
 						alert("Error : " + status);
 					}
 				});
 		}						
		

 	    function sendMsgCommonFunc(para1, para11, para2, para12, para3, para13, para4, para14, para5, para15, para6, para16, para7, para17, para8, para9, para10) {

 			$.ajax({
 	 	 		data:{
 	 	 			para1 : para1
 	 	 			,para11 : para11
 	 	 			,para2 : para2
 	 	 			,para12 : para12
 	 	 			,para3 : para3
 	 	 			,para13 : para13
 	 	 			,para4 : para4
 	 	 			,para14 : para14
 	 	 			,para5 : para5
 	 	 			,para15 : para15
 	 	 			,para8 : para8		// templateId
 	 	 			,para9 : para9	// openid
 	 	 			,para10 : para10	// linkUrl
 	 	 		},
 				type : "POST",
 				url : "/front/bbc/badMatch/sendMsgByMap.htm",
 				success : function(data) {},
 				error : function(xhr, status, e) {}
				});
 	    } 		
 		
	</script>
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		<%@ include file="/front/bbc/inc/loading.jsp"%>
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
		 
	</body>
</html>