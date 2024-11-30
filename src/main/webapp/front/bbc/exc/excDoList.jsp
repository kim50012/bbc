<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>${label.参加活动}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js5.jsp"%> 
		<style>
		.blink {
		    -webkit-animation: blink 1s linear infinite;
		} 
		@-webkit-keyframes blink {
		    0% { color: red; }
		    33% { color: white; }
		    66% { color: blue; }
		    100% { color: white; }
		/*    from { background-color: red;}
		    to {background-color: green;}  */
		}
		.number {
			width: 0.5rem;
		}
		.beyond:after {
			content: "";
		}
		.beyond {
			padding-right: 0;
		}
		</style>	
		<script src="../js/footer.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="wrap">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">参加活动</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				<div class="module">
					<div class="list68 flex">
						<p class="flex1 title-icon">${label.活动列表}</p>
						<button class="add-btn" onclick="window.location='excReg.htm';"></button>
					</div>
				</div>
				<div class="module">
					<div class="list68 flex">
						<p class="flex1 switch-btn switch-btn1 active"><span>${label.我的俱乐部活动}</span></p>
						<p><div class="parting-line"></div></p>
						<p class="flex1 switch-btn switch-btn2"><span>${label.全部}</span></p>
					</div>
				</div>
				<div class="switcharea-all"  id="all" style="margin-top: 0;">
					<!-- START Data Loop -->
					<c:forEach var="amsExcList" items="${amsExcList}" varStatus="status">  
								<p></p>
								
						<div class="modules" style="border: 1px solid #d2d2d2;<c:if test="${status.count == 1}">margin-top: 2px;</c:if>">
						
							<div class="list78 flex" style="border-bottom: 1px solid #2196F3;">
								<p class="club-logo">
									<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
								</p>
								<p class="flex1 row1 word-title">${amsExcList.HME_CLB_NM}</p>
								<p class="row1">
									<div class="sub-content-title" style="margin:0;">
										<span>${amsExcList.EXC_TP_NM}</span>
										<c:if test="${(amsExcList.CLB_GD == 'A') || amsClb.amsExcList == 'B' || amsExcList.REG_MBR_SQ == loginMbrSq}">
											<span onclick="delExcGame('${amsExcList.EXC_SQ}');" style="border:1px solid #c0c0c0; background:#c0c0c0;">${label.删除 }</span>
										</c:if>								
									</div>						
								</p>
							</div>
							<div class="sub-content" onclick="window.location='excJin.htm?intExcsq=${amsExcList.EXC_SQ}';">
								<div class="list flex row1">
									<span class="text-outline">${label.日期}：</span>
									<p><span style="font-weight:bold;">${amsExcList.EXC_DATE}</span>
									<span style="font-weight:bold;<c:if test="${amsExcList.WEEKNAME.contains('Saturday')}">color:blue;</c:if><c:if test="${amsExcList.WEEKNAME.contains('Sunday')}">color:red;</c:if>">${amsExcList.WEEKNAME }</span></p>
								</div>
								<div class="list flex row1"><span class="text-outline">${label.时间}：</span><p><span style="font-weight:bold;">${amsExcList.EXC_FR_TIME}~${amsExcList.EXC_TO_TIME}</span></p></div>
								<div class="list flex row1"><span class="text-outline">${label.场地}：</span><p style="font-weight:bold;">${amsExcList.EXC_TIT}</p>&nbsp;<span class="blink">※</span></div>
								<div class="list flex row1" style="display:none;"><span class="text-outline">${label.创建}：</span><p>${amsExcList.CLB_NIK_NM}</p></div>
								<c:if test="${amsExcList.EXC_TP != '1003' && amsExcList.ATD_CNT > 0}">
									<div class="list flex row1"><span class="text-outline">${label.参与人员}：</span><p><span class="number red">${amsExcList.JIN_EXC_CNT}</span> / ${amsExcList.ATD_CNT}<c:if test="${amsExcList.EXC_TP != '1003'}">&nbsp;(${label.等待中} : ${amsExcList.WAIT_CNT})</c:if></p></div>
								</c:if>
								<div class="list flex row1">
									<span class="nowrap text-outline">${label.活动介绍}：</span>
									<p class="flex1" style="white-space: initial;max-height: 0.6rem;">${amsExcList.EXC_DCT}&nbsp;
										<span class="nowrap open" onclick="window.location='excJin.htm?intExcsq=${amsExcList.EXC_SQ}';">${label.展开} >></span>
									</p>
								</div>
								<div class="top-dashed flex">
									<p class="flex1 beyond">
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_1 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_1}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_2 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_2}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_3 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_3}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_4 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_4}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_5 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_5}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_6 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_6}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_7 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_7}"/></c:if>
									</p>
									<p style="padding-top: 0.15rem; font-size: 0.22rem; color: #555555; min-height: 0.6rem;" onclick="window.location='excJin.htm?intExcsq=${amsExcList.EXC_SQ}';">
										<span class="number red">${amsExcList.JIN_EXC_CNT}</span><c:if test="${amsExcList.EXC_TP != '1003'}">(${amsExcList.WAIT_CNT})</c:if>${label.人参与}
									</p>
								</div>
							</div>
						</div>
		
					 </c:forEach>
					<!-- END Data Loop -->
				</div>
				<div class="switcharea-mine" id="mine" style="display:none;margin-top: 0;">
					<!-- START Data Loop -->
					<c:forEach var="amsExcList" items="${amsExcList2}" varStatus="status">  
								<p></p>
								
						<div class="modules" style="border: 1px solid #d2d2d2;<c:if test="${status.count == 1}">margin-top: 2px;</c:if>">
						
							<div class="list78 flex" style="border-bottom: 1px solid #2196F3;" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsExcList.HME_CLB_SQ}';">
								<p class="club-logo">
									<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
								</p>
								<p class="flex1 row1 word-title" style="text-decoration: underline;">${amsExcList.HME_CLB_NM}</p>
								<p class="row1">
									<div class="sub-content-title" style="margin:0;">
										<span>${amsExcList.EXC_TP_NM}</span>				
									</div>						
								</p>
							</div>
							<div class="sub-content">
								<div class="list flex row1">
									<span class="text-outline">${label.日期}：</span>
									<p><span style="font-weight:bold;">${amsExcList.EXC_DATE}</span>
									<span style="font-weight:bold;<c:if test="${amsExcList.WEEKNAME.contains('Saturday')}">color:blue;</c:if><c:if test="${amsExcList.WEEKNAME.contains('Sunday')}">color:red;</c:if>">${amsExcList.WEEKNAME }</span></p>
								</div>
								<div class="list flex row1"><span class="text-outline">${label.时间}：</span><p><span style="font-weight:bold;">${amsExcList.EXC_FR_TIME}~${amsExcList.EXC_TO_TIME}</span></p></div>
								<div class="list flex row1"><span class="text-outline">${label.场地}：</span><p style="font-weight:bold;">${amsExcList.EXC_TIT}</p>&nbsp;<span class="blink">※</span></div>
								<div class="list flex row1" style="display:none;"><span class="text-outline">${label.创建}：</span><p>${amsExcList.CLB_NIK_NM}</p></div>
								<c:if test="${amsExcList.EXC_TP != '1003' && amsExcList.ATD_CNT > 0}">
									<div class="list flex row1"><span class="text-outline">${label.参与人员}：</span><p><span class="number red">${amsExcList.JIN_EXC_CNT}</span> / ${amsExcList.ATD_CNT}<c:if test="${amsExcList.EXC_TP != '1003'}">&nbsp;(${label.等待中} : ${amsExcList.WAIT_CNT})</c:if></p></div>
								</c:if>
								<div class="list flex row1">
									<span class="nowrap text-outline">${label.活动介绍}：</span>
									<p class="flex1" style="white-space: initial;max-height: 0.6rem;">${amsExcList.EXC_DCT}</p>
								</div>
								<div class="top-dashed flex">
									<p class="flex1 beyond">
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_1 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_1}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_2 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_2}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_3 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_3}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_4 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_4}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_5 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_5}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_6 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_6}"/></c:if>
										<c:if test="${amsExcList.MBR_MAI_IMG_PTH_7 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_7}"/></c:if>
									</p>
									<p style="padding-top: 0.15rem; font-size: 0.22rem; color: #555555; min-height: 0.6rem;">
										<span class="number red">${amsExcList.JIN_EXC_CNT}</span><c:if test="${amsExcList.EXC_TP != '1003'}">(${amsExcList.WAIT_CNT})</c:if>${label.人参与}
									</p>
								</div>
								<c:if test="${amsExcList.CLB_JIN_ST == 'EXI'}">
								<div class="top-dashed flex">
									<button class="btn-submit" onclick="fn_OpenReg('${amsExcList.HME_CLB_NM}', '${amsExcList.HME_CLB_SQ}');" style="max-height: 0.5rem;margin: 0.1rem;font-size: 0.25rem;">
										${label.俱乐部}${label.加入申请}
									</button>
								</div>
								</c:if>
							</div>
						</div>
		
					 </c:forEach>
					<!-- END Data Loop -->
				</div>

<br>
<br>
<br>

			</div>
			
			

<!-- 点击按钮的弹窗-->
		<div class="pop-up-wrap" id="reqAddClb" style="display:none;">
			<div class="pop-up-content" style="top: 6rem;">
				<div class="inp-wrap">
					<p>${label.俱乐部}：</p>
					<input class="textboxcontent" type="text" id="strClbNmOne" value=""  readonly/>
					<input type="hidden" id="strClbSqOne" value=""  readonly/>
				</div>
				<div class="inp-wrap">
					<p>${label.姓名}：</p>
					<input class="textboxcontent" type="text" id="strClbniknm" value="" />
				</div>
				<div class="inp-wrap">
					<p>${label.年龄}：</p>
						<select class="textboxcontent" id="strAgeyy" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="10">19${label.岁}${label.以下}</option>
							<option value="20">20~29${label.岁}</option>
							<option value="30">30~39${label.岁}</option>
							<option value="40">40~49${label.岁}</option>
							<option value="50">50${label.岁}${label.以上}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.性别}：</p>
						<select class="textboxcontent" id="strGnddv" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="MALE">${label.男}</option>
							<option value="FEMA">${label.女}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.小组}：</p>
						<select class="textboxcontent" id="strBmtgd" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="A">A${label.组}</option>
							<option value="B">B${label.组}</option>
							<option value="C">C${label.组}</option>
							<option value="D">D${label.组}</option>
							<option value="E">${label.新手}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.球历}：</p>
						<select class="textboxcontent" id="strYear" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="1">1${label.年}</option>
							<option value="2">2${label.年}</option>
							<option value="3">3${label.年}</option>
							<option value="4">4${label.年}</option>
							<option value="5">5${label.年}${label.以上}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.内容}：</p>
					<textarea class="textboxcontent" id="strJingrttxt" placeholder="请输入内容"></textarea>
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span id="spanClbJinReg" onclick="fn_ClbJinReg();">${label.加入申请}</span>
				</div>
			</div>
		</div>			
			
			
		<script type="text/javascript">

		$(document).ready(function(){
			$(".switch-btn").on("click",function(){
					$(".switch-btn").removeClass("active");
					$(this).addClass("active");
					if($(this).attr("class").indexOf("switch-btn1") >= 0){
						$(".switcharea-all").show();
						$(".switcharea-mine").hide();
						/*显示所有俱乐部的内容*/
					}
					else if($(this).attr("class").indexOf("switch-btn2") >= 0){
						$(".switcharea-mine").show();
						$(".switcharea-all").hide();/*显示我的俱乐部的内容*/
					}
			});
			$(".cancel").click(function(){
				$("#reqAddClb").hide();
			});
		});
 		function delExcGame(intExcsq) {
 			
     		if (!confirm("${label.确认删除活动吗}?")) {
 				return;
 			}
 			
 			var intExcsq = intExcsq;
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intExcsq : intExcsq
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/exc/excDel.htm",
 					success : function(data) {

 						if(data.ret=="success"){
 							window.location.href="/front/bbc/exc/excDoList.htm";
 						}else{
 							alertBbc(data.ret);
 						}
 						
 					},
 					error : function(xhr, status, e) {
 						alert("Error : " + status);
 					}
 				});
 		}
		function fn_OpenReg(a, b) {
			$('#strClbNmOne').val(a);
			$('#strClbSqOne').val(b);
			$('html, body').animate({scrollTop:0}, 1);
			$("#reqAddClb").show();
		}
 		function fn_ClbJinReg() {
 			
 			var intClbsq= $('#strClbSqOne').val();	  // [클럽가입신청] 클럽시퀀스 strClbSqOne
 			var strClbniknm= $('#strClbniknm').val();	  // [클럽가입신청] 클럼내닉네임
 			var strAgeyy= $('#strAgeyy').val();	  // [클럽가입신청] 연령(10대,20대...)
 			var strGnddv= $('#strGnddv').val();	  // [클럽가입신청] 성별구분
 			var strBmtgd= $('#strBmtgd').val();	  // [클럽가입신청] 배드민턴 조(A,B,C,D)     	
 			var strJingrttxt= $('#strJingrttxt').val();	  // [클럽가입신청] 가입인사말		
 			var strYear = $("#strYear").val();

 			if (strClbniknm =="") {
     			alert("${label.请输入}${label.简称}.");	
     			return;
 			}
 			if (strAgeyy =="" || strAgeyy =="${label.请选择}") {
     			alert("${label.请输入}${label.年龄}.");	
     			return;
 			}
 			if (strGnddv =="" || strGnddv =="${label.请选择}") {
     			alert("${label.请输入}${label.性别}.");	
     			return;
 			}
 			if (strBmtgd =="" || strBmtgd =="${label.请选择}") {
     			alert("${label.请输入}${label.小组}.");	
     			return;
 			}
 			if (strJingrttxt =="") {
     			alert("${label.请输入}${label.内容}.");	
     			return;
 			}
 			if (strYear == "") {
 				alert("${label.请选择}${label.球历}");
 				return;
 			}

			$("#spanClbJinReg").hide();
				
 			 $.ajax({
 			 	 		data:{
 			 	 			intClbsq : intClbsq
 			 	 			,strClbniknm : strClbniknm
 			 	 			,strJingrttxt : strJingrttxt
 			 	 			,strAgeyy : strAgeyy
 			 	 			,strGnddv : strGnddv
 			 	 			,strBmtgd : strBmtgd
 			 	 			,strYwday : strYear
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/clb/clbJinSave.htm",
 					success : function(data) {

 						if(data.ret=="success"){
 		     				alert("${label.保存成功了}");
 							window.location.reload(true);
 						}else{
 							alert(data.ret);
 							$("#spanClbJinReg").show();
 						}
 						
 					},
 					error : function(xhr, status, e) {
							$("#spanClbJinReg").show();
 						alert("Error : " + status);
 					}
 				});
 		}	

	</script>
			
	
		</div>
		

			<!-- START bottom menu -->
			<c:set var="menuTag" value="1" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
					
		
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		
		<c:set var="helpTag" value="65" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="정규운동 및 번개운동을 생성하고 조회하는 화면 입니다.<br><br>클럽 회원 모두 운동을 생성할 수 있고 생성된 운동을 클릭하여 운동 참석 댓글 작성을 할 수 있습니다.<br><br>※ 정규운동의 경우 클럽 메인 화면에서 자동 생성 설정 가능 합니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是可以查看及创造定期和非定期运动，所有的会员可以创造运动也可以发帖在已被创造的运动。" />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 
	</body>
	
</html>
