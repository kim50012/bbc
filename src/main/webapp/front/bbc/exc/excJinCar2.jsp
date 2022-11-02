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
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<style>
		.blink {
		    -webkit-animation: blink 2.5s linear infinite;
		} 
		@-webkit-keyframes blink {
		    0% { color: red; }
		    33% { color: yellow; }
		    66% { color: blue; }
		    100% { color: green; }
		/*    from { background-color: red;}
		    to {background-color: green;}  */
		}
		</style>		
	</head>
	<%@ include file="/front/bbc/inc/tags.jsp"%>
	<body style="background:#fff;">
		<div class="wrap no-footer" style="background:#fff;">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">北京羽毛球俱乐部</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
			
				<!-- START Data Loop -->
				<c:set var="hmeClbsq" value="${amsExcList.HME_CLB_SQ}"/>
			
				<div class="module">
					<div class="list110 flex" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsExcList.HME_CLB_SQ}';">
						<p class="club-logo">
							<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="flex1 row1 word-title">${amsExcList.HME_CLB_NM}</p>
						<!--
						<div class="flex1 row1">
							<p class="lh20 word-title">${amsExcList.HME_CLB_NM}</p>
							<p class="small-green" >
								<span class="star"></span>
								<span class="star"></span>
								<span class="star"></span>
								<span class="star"></span>
								<span class="star0"></span>
								星级排名
							</p>
						</div>
						-->
<!-- 						<p class="row1"><span class="number">777</span>km</p> -->
						<p class="row1">
							<div class="sub-content-title" style="margin:0;">
								<span>${amsExcList.EXC_TP_NM}</span>
							</div>						
						</p>
					</div>
					<div class="sub-content">
<!-- 						<div class="sub-content-title"> -->
<%-- 							<span>${amsExcList.EXC_TP_NM}</span> --%>
<!-- 						</div> -->

						<div class="flex Participant-title" style="position:absolute;right:0.25rem;">
							<p class="flex1">&nbsp;</p>
						</div>
						<div class="list flex row1" style="padding-top:0.2rem;"><span class="text-outline">${label.场地}：</span><p>${amsExcList.EXC_TIT}</p></div>
						<div class="list flex row1"><span class="text-outline">${label.时间}：</span><p>${amsExcList.EXC_DATE}  ${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}</p></div>
						<c:if test="${amsExcList.EXC_TP == '1002'}">
							<div class="list flex row1"><span class="text-outline">${label.参与人员}：</span><p>${amsExcList.ATD_CNT}</p></div>
						</c:if>
						<!--
						<div class="list flex row1 le">
							<span class="nowrap text-outline">${label.活动介绍}：</span>
							<p class="flex1">
								&nbsp;
							</p>
						</div>
						<div class="list flex row1 le" style="padding:0.2rem;line-height:0.4rem">
							<pre style="white-space: pre-wrap;">${amsExcList.EXC_DCT}</pre>
						</div>
						-->
						<div class="list flex row1 le">
							<span class="nowrap text-outline">${label.活动介绍}：</span>
							<p class="flex1">
								&nbsp;
							</p>
						</div>
						<div class="list flex row1 le" style="padding:0.2rem;line-height:0.4rem">
							<pre style="white-space: pre-wrap;">차량 탑승 페이지 입니다.
운동 신청은 하단 "운동참여" 메뉴 
혹은 우측 하단 "홈" 버튼을 이용하여 

운동 신청 화면으로 이동 후 운동신청 부탁드립니다.</pre>
						</div>
						<div class="flex Participant-title">
								<p class="flex1 title-icon" style="color:blue;">차량 탑승 현황</p>
								<button id="btn" class="btn-join" style="background: #0093ff;">${label.一起去} (배차등록)</button>
						</div>
					</div>
				</div>
				
				<!-- END Data Loop -->
				
				
				<c:set var="excJintpTag" value="" />
				
				<c:if test="${hmeClbsq == 2300}">
					<c:set var="excJintpTag" value="display:none;" />
				</c:if>
				
				
				<div class="modules" style="border-bottom:none;">
					<div class="sub-content" id="subContentDiv">
					
						<!-- START Data Loop -->
						<c:forEach var="amsJinList" items="${amsJinList}" varStatus="status">  
						
							<c:if test="${amsJinList.CAR_YN == 'Y'}">
								<div class="list78 noborder top-dashed flex hang" data-instri="${amsJinList.CAR_MBR_SQ}" style="padding:0;border-top: 2px solid #DDDDDD;">
									<p class="member-head-wrap"><img class="member-head" src="/front/bbc/img/em/car.png"/></p>
									<p class="member-head-wrap <c:if test="${amsJinList.MBR_SQ == loginMbrSq}"> del</c:if>"><img class="member-head" src="${amsJinList.MBR_MAI_IMG_PTH}"/></p>
									<p class="flex1" style="max-width:75px;font-weight: bold;"><span class="${amsJinList.GND_DV_TAG}"></span>${amsJinList.MBR_NM}</p>
									<p class="flex1">탑승인원 : ${amsJinList.EXC_JIN_TP} 명</p>
									<p class="flex1 right" style='padding-right:0;'>
									
										<c:if test="${amsJinList.EXC_JIN_TP > amsJinList.CNT}">
										<button onclick="popupCar(${amsJinList.CAR_MBR_SQ});" class='btn-join' style='background: #01cfb9;'>탑승신청</button>
										</c:if>
										<c:if test="${amsJinList.EXC_JIN_TP <= amsJinList.CNT}">
										<button class='btn-join' style='background: #C0C0C0;'>탑승마감</button>
										</c:if>
									</p>
								</div>
								<div class="list78 noborder flex hang" style="padding:0;">
									<p class="flex1" style="max-width:30px;">&nbsp;</p>
									<p class="flex1" onclick="alert($(this).html());">${amsJinList.EXC_JIN_CMT}</p>
								</div>
							</c:if>
							<c:if test="${amsJinList.CAR_YN == 'N'}">
								<div class="list78 noborder top-dashed flex hang" data-instri="${amsJinList.CAR_MBR_SQ}" style="margin-left:20px; padding:0;">
									<p class="member-head-wrap"><img class="member-head" style="width: 0.3rem;height: 0.3rem;margin: 0.25rem 0.1rem 0 0;" src="/front/bbc/img/em/chair.png"/></p>
									<p class="member-head-wrap <c:if test="${amsJinList.MBR_SQ == loginMbrSq}"> del</c:if>"><img class="member-head" src="${amsJinList.MBR_MAI_IMG_PTH}"/></p>
									<p class="flex1" style="max-width:75px;"><span class="${amsJinList.GND_DV_TAG}"></span>${amsJinList.MBR_NM}</p>
									<p class="flex1" onclick="alert($(this).html());">${amsJinList.EXC_JIN_CMT}</p>
								</div>
							</c:if>
							
						 </c:forEach>
						<!-- END Data Loop -->
						
					</div>
				</div>
				
			</div>
			
			
		</div>
		
		
		<div>
			<br/><br/><br/><br/>
		</div>
		
		<div class="pop-up-wrap" id="joinExc" style="display: none;">
			<div class="pop-up-content" style="padding-top:0.1rem;top:48%;">
			
				
				<div class="inp-wrap" style="padding-top:0.1rem;border-bottom: 1px dashed #d2d2d2;${excJintpTag }">
					탑승 가능 인원
				</div>
				<div class="inp-wrap">
					<div class="radio-box" style="padding-top:0.25rem;">
						<label for="r1-0" class="float1"><input  type="radio" name="activityType1" id="r1-0" value="0"/>0명</label>
					</div>
					&nbsp;
					<div class="radio-box" style="padding-top:0.25rem;">
						<label for="r1-1" class="float1"><input  type="radio" name="activityType1" id="r1-1" value="1"/>1명</label>
					</div>
					&nbsp;
					<div class="radio-box" style="padding-top:0.25rem;">
						<label for="r1-2" class="float1"><input  type="radio" name="activityType1" id="r1-2" value="2" />2명</label>
					</div>
					&nbsp;
					<div class="radio-box" style="padding-top:0.25rem;">
						<label for="r1-3" class="float1"><input  type="radio" name="activityType1" id="r1-3" value="3" />3명</label>
					</div>
					&nbsp;
					<div class="radio-box checked" style="padding-top:0.25rem;">
						<label for="r1-4" class="float1"><input  type="radio" name="activityType1" id="r1-4" value="4" checked/>4명</label>
					</div>
				</div>
				<div class="inp-wrap">
					<div class="radio-box" style="padding-top:0.25rem;">
						<label for="r1-5" class="float1"><input  type="radio" name="activityType1" id="r1-5" value="5" />5명</label>
					</div>
					&nbsp;
					<div class="radio-box " style="padding-top:0.25rem;">
						<label for="r1-6" class="float1"><input  type="radio" name="activityType1" id="r1-6" value="6" />6명</label>
					</div>
					&nbsp;
					<div class="radio-box " style="padding-top:0.25rem;">
						<label for="r1-7" class="float1"><input  type="radio" name="activityType1" id="r1-7" value="7" />7명</label>
					</div>
					&nbsp;
					<div class="radio-box " style="padding-top:0.25rem;">
						<label for="r1-8" class="float1"><input  type="radio" name="activityType1" id="r1-8" value="8" />8명</label>
					</div>
					&nbsp;
					<div class="radio-box " style="padding-top:0.25rem;">
						<label for="r1-8" class="float1"><input  type="radio" name="activityType1" id="r1-9" value="9" />9명</label>
					</div>
				</div>
				<br>
				<div class="inp-wrap" style="border-bottom: 1px dashed #d2d2d2;">
					출발 장소 및 시간
				</div>
				<div class="inp-wrap">
					<textarea id="strExcjincmt" style="height: 1rem;" placeholder="출발장소 및 시간"></textarea>
				</div>
				
				<div class="buttons">
					<span>&nbsp;</span>
					<span class="cancel">${label.取消}</span>
					<span onclick="fn_ExcJinReg();">차량운행</span>
				</div>
			</div>
		</div>
		
		<div class="pop-up-wrap" id="joinExc2" style="display: none;">
			<div class="pop-up-content" style="padding-top:0.1rem;top:48%;">
			
				
				<div class="inp-wrap" style="border-bottom: 1px dashed #d2d2d2;">
					탑승 신청하기
				</div>
				<div class="inp-wrap">
					<textarea id="strExcjincmt2" style="height: 1rem;" placeholder="감사합니다">감사합니다</textarea>
				</div>
				<input type="hidden" id="intCarmbrsq" value="" />
				<div class="buttons">
					<span>&nbsp;</span>
					<span class="cancel">${label.取消}</span>
					<span onclick="fn_ExcJinReg2();">탑승하기</span>
				</div>
			</div>
		</div>
		
		<div class="pop-up-wrap-del" style="display: none;">
			<div class="pop-up-content">
				<div class="inp-wrap-del">
					${label.确认不再参加这次活动了吗}？
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span class="sure" onclick="fn_ExcJinDel();">${label.确认}</span>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").click(function(){
				$('html, body').animate({scrollTop:0}, 1);
				$("#joinExc").show();
			});
			$(".cancel").click(function(){
				$("#joinExc").hide();
				$("#joinExc2").hide();
			});
			$("#delEsc").click(function(){
				window.location = '/front/bbc/exc/excView.htm?intExcsq=${intExcsq}';
			});

			$(".pop-up-wrap input[type='radio']").change(function(){
				if ($(":radio[name='activityType1']").is(':checked')) {
					$(".radio-box").removeClass("checked");
			        $(this).parents(".radio-box").addClass("checked");
				}
			});
		});
		
		$(document).ready(function(){
			$(".del").on("click",function(){
				console.log($(this));
				var el=$(this).parents(".hang");
				console.log(el.attr("data-instri"));
				$("#intCarmbrsq").val(el.attr("data-instri"));
				$('html, body').animate({scrollTop:0}, 1);
				$(".pop-up-wrap-del").show();
			});
			$(".cancel").on("click",function(){
				$(".pop-up-wrap-del").hide();
			});
// 			function del(date){
// 				$(".sure").on("click",function(){
// 					date.remove()
// 					$(".pop-up-wrap-del").hide();
// 				});
// 			}

		});

		function popupCar(intCarmbrsq) {
			$('html, body').animate({scrollTop:0}, 1);
			$("#intCarmbrsq").val(intCarmbrsq);
			$("#joinExc2").show();
		}

 		function fn_ExcJinReg() {

 			var intExcjintp = $(':radio[name="activityType1"]:checked').val();
 			var intExcjindly = $(':checkbox[name="intExcjindly"]:checked').val();
 			
 			var intExcsq = "${intExcsq}";
 			var strExcjincmt = $('#strExcjincmt').val();
 			var strJobtype = "I";
 			var strCaryn = 'Y'
 			
 			var intCarmbrsq = "${loginMbrSq}";

 			if (intExcjindly == "1") {
 				strExcjincmt = "${label.迟到}," + strExcjincmt;
 			} 
 			else {
 				intExcjindly = "0";
 			}
 			
 			if (strExcjincmt =="") {
     			alert("${label.请输入您的备注信息}.");	
     			return;
 			}
 			
 			loadingShow();
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intExcsq : intExcsq
 			 	 			,strExcjincmt : strExcjincmt
 			 	 			,strJobtype : strJobtype
 			 	 			,intExcjintp : intExcjintp
 			 	 			,intExcjindly : intExcjindly
 			 	 			,intCarmbrsq : intCarmbrsq
 			 	 			,strCaryn : strCaryn
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/exc/excJinCarRegSave.htm",
 					success : function(data) {
						
 		    			if(data.mapResult.length!=0){

 		    				if (data.mapResult[0].MSG_OUT != 'S') {
 		    					alert(data.mapResult[0].MSG_OUT);
 	     		    			loadingHide();
 		    					return;
 		    				}
 		    				
 		    				$("#subContentDiv").html('');
 		    				
 		    				for(var i=0;i<data.mapResult.length;i++){
 		    				
 		    					var delCss = "";
 		    					
 		    					if (data.mapResult[i].MBR_SQ == "${loginMbrSq}") {
 		    						delCss = " del";
 		    					}
 		    					
 		    					var htm=''
 		    					
 		    					if (data.mapResult[i].CAR_MBR_SQ == data.mapResult[i].MBR_SQ) {
     		    					htm=''
         		    					+	'<div class="list78 noborder top-dashed flex hang" data-instri="'+data.mapResult[i].CAR_MBR_SQ+'" style="padding:0;border-top: 2px solid #DDDDDD;">'
    		    						+		'<p class="member-head-wrap"><img class="member-head" src="/front/bbc/img/em/car.png"/></p>'
    		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
    		    						+		'<p class="flex1" style="max-width:75px;font-weight: bold;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
    		    						+		'<p class="flex1">탑승인원 : '+data.mapResult[i].EXC_JIN_TP+' 명</p>'
    		    						// +		'<p class="flex1 right" style="padding-right:0;"><button onclick="popupCar('+data.mapResult[i].CAR_MBR_SQ+');" class="btn-join" style="background: #01cfb9;">탑승신청</button></p>'
    		    						+	'</div>'
    		    						+	'<div class="list78 noborder flex hang" style="padding:0;">'
    		    						+		'<p class="flex1" style="max-width:30px;">&nbsp;</p>'
    		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
    		    						+	'</div>'     		    					
         		    		    		;
 		    					}
 		    					else {
     		    					htm=''
         		    					+	'<div class="list78 noborder top-dashed flex hang" data-instri="'+data.mapResult[i].CAR_MBR_SQ+'" style="margin-left:20px; padding:0;">'
    		    						+		'<p class="member-head-wrap"><img class="member-head" style="width: 0.3rem;height: 0.3rem;margin: 0.25rem 0.1rem 0 0;" src="/front/bbc/img/em/chair.png"/></p>'
    		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
    		    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
    		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
    		    						+	'</div>'     		    					
         		    		    		;
 		    					}
 		    					
 		    					$("#subContentDiv").append(htm);

 		    					$(".del").on("click",function(){
 		    						console.log($(this))
 		    						var el=$(this).parents(".hang")
 		    						$(".pop-up-wrap-del").show();
 		    					});
 		    				}
 		    			}     						
 		    			loadingHide();
 		    			alert('${label.保存成功}');
 		    			$(".pop-up-wrap").hide();
 		    			
 					},
 					error : function(xhr, status, e) {
 						loadingHide();
 						alert("Error : " + status);
 					}
 				});
 		}
 		


 		function fn_ExcJinReg2() {

 			var intExcjintp = $(':radio[name="activityType1"]:checked').val();
 			var intExcjindly = $(':checkbox[name="intExcjindly"]:checked').val();
 			
 			var intExcsq = "${intExcsq}";
 			var strExcjincmt = $('#strExcjincmt2').val();
 			var strJobtype = "I";
 			var strCaryn = 'N'
 			
 			var intCarmbrsq = $("#intCarmbrsq").val();

 			if (intExcjindly == "1") {
 				strExcjincmt = "${label.迟到}," + strExcjincmt;
 			} 
 			else {
 				intExcjindly = "0";
 			}

 			if (strExcjincmt =="") {
     			alert("${label.请输入您的备注信息}.");	
     			return;
 			}

 			if (intCarmbrsq == "${loginMbrSq}") {
     			alert("운전자는 승객으로 탑승할 수 없습니다.");	
     			return;
 			}
 			
 			loadingShow();
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intExcsq : intExcsq
 			 	 			,strExcjincmt : strExcjincmt
 			 	 			,strJobtype : strJobtype
 			 	 			,intExcjintp : intExcjintp
 			 	 			,intExcjindly : intExcjindly
 			 	 			,intCarmbrsq : intCarmbrsq
 			 	 			,strCaryn : strCaryn
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/exc/excJinCarRegSave.htm",
 					success : function(data) {
						
 		    			if(data.mapResult.length!=0){

 		    				if (data.mapResult[0].MSG_OUT != 'S') {
 		    					alert(data.mapResult[0].MSG_OUT);
 	     		    			loadingHide();
 		    					return;
 		    				}
 		    				
 		    				$("#subContentDiv").html('');
 		    				
 		    				for(var i=0;i<data.mapResult.length;i++){
 		    				
 		    					var delCss = "";
 		    					
 		    					if (data.mapResult[i].MBR_SQ == "${loginMbrSq}") {
 		    						delCss = " del";
 		    					}
 		    					
 		    					var htm=''
 		    					
 		    					if (data.mapResult[i].CAR_MBR_SQ == data.mapResult[i].MBR_SQ) {
     		    					htm=''
         		    					+	'<div class="list78 noborder top-dashed flex hang" data-instri="'+data.mapResult[i].CAR_MBR_SQ+'" style="padding:0;border-top: 2px solid #DDDDDD;">'
    		    						+		'<p class="member-head-wrap"><img class="member-head" src="/front/bbc/img/em/car.png"/></p>'
    		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
    		    						+		'<p class="flex1" style="max-width:75px;font-weight: bold;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
    		    						+		'<p class="flex1">탑승인원 : '+data.mapResult[i].EXC_JIN_TP+' 명</p>'
    		    						+		'<p class="flex1 right" style="padding-right:0;"><button onclick="popupCar('+data.mapResult[i].CAR_MBR_SQ+');" class="btn-join" style="background: #01cfb9;">탑승신청</button></p>'
    		    						+	'</div>'
    		    						+	'<div class="list78 noborder flex hang" style="padding:0;">'
    		    						+		'<p class="flex1" style="max-width:30px;">&nbsp;</p>'
    		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
    		    						+	'</div>'     		    					
         		    		    		;
 		    					}
 		    					else {
     		    					htm=''
         		    					+	'<div class="list78 noborder top-dashed flex hang" data-instri="'+data.mapResult[i].CAR_MBR_SQ+'" style="margin-left:20px; padding:0;">'
    		    						+		'<p class="member-head-wrap"><img class="member-head" style="width: 0.3rem;height: 0.3rem;margin: 0.25rem 0.1rem 0 0;" src="/front/bbc/img/em/chair.png"/></p>'
    		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
    		    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
    		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
    		    						+	'</div>'     		    					
         		    		    		;
 		    					}
 		    					
 		    					$("#subContentDiv").append(htm);

 		    					$(".del").on("click",function(){
 		    						console.log($(this))
 		    						var el=$(this).parents(".hang")
 		    						$(".pop-up-wrap-del").show();
 		    					});
 		    				}
 		    			}     						
 		    			loadingHide();
 		    			alert('${label.保存成功}');
 		    			$(".pop-up-wrap").hide();
 		    			
 					},
 					error : function(xhr, status, e) {
 						loadingHide();
 						alert("Error : " + status);
 					}
 				});
 		}

     		function fn_ExcJinDel() {
     			
     			var intExcsq = "${intExcsq}";
     			var strJobtype = "D";

     			var intCarmbrsq = $("#intCarmbrsq").val();

				<c:if test="${amsExcList.EXC_SQ_ING > 0}">
					alert('${label.已经开始运动}. ${label.不能删除}!');
					return;
				</c:if>
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intExcsq : intExcsq
     			 	 			,strJobtype : strJobtype
     			 	 			,intCarmbrsq : intCarmbrsq
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/exc/excJinCarRegSave.htm",
     					success : function(data) {

     		    			if(data.mapResult.length!=0){
								
     		    				if (data.mapResult[0].MSG_OUT != 'S') {
     		    					alert(data.mapResult[0].MSG_OUT);
     	     		    			loadingHide();
     		    					return;
     		    				}
     		    				
     		    				$("#subContentDiv").html('');
     		    				
     		    				for(var i=0;i<data.mapResult.length;i++){

     		    					var delCss = "";
     		    					
     		    					if (data.mapResult[i].MBR_SQ == "${loginMbrSq}") {
     		    						delCss = " del";
     		    					}

     		    					var htm=''
     		    					
     		    					if (data.mapResult[i].CAR_MBR_SQ == data.mapResult[i].MBR_SQ) {
         		    					htm=''
             		    					+	'<div class="list78 noborder top-dashed flex hang" data-instri="'+data.mapResult[i].CAR_MBR_SQ+'" style="padding:0;">'
        		    						+		'<p class="member-head-wrap"><img class="member-head" src="/front/bbc/img/em/car.png"/></p>'
        		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
        		    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
        		    						+		'<p class="flex1">탑승인원 : '+data.mapResult[i].EXC_JIN_TP+' 명</p>'
        		    						// +		'<p class="flex1 right" style="padding-right:0;"><button onclick="popupCar('+data.mapResult[i].CAR_MBR_SQ+');" class="btn-join" style="background: #01cfb9;">탑승신청</button></p>'
        		    						+	'</div>'
        		    						+	'<div class="list78 noborder flex hang" style="padding:0;">'
        		    						+		'<p class="flex1" style="max-width:30px;">&nbsp;</p>'
        		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
        		    						+	'</div>'     		    					
             		    		    		;
     		    					}
     		    					else {
         		    					htm=''
             		    					+	'<div class="list78 noborder top-dashed flex hang" data-instri="'+data.mapResult[i].CAR_MBR_SQ+'" style="margin-left:20px; padding:0;">'
        		    						+		'<p class="member-head-wrap"><img class="member-head" src="/front/bbc/img/em/chair.png"/></p>'
        		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
        		    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
        		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
        		    						+	'</div>'     		    					
             		    		    		;
     		    					}
     		    					
     		    					$("#subContentDiv").append(htm);

     		    					$(".del").on("click",function(){
     		    						console.log($(this))
     		    						var el=$(this).parents(".hang")
     		    						$(".pop-up-wrap-del").show();
     		    					});
     		    				}
     		    			}
     		    			else {
     		    				$("#subContentDiv").html('');
     		    			}
     		    			loadingHide();
     		    			alert('${label.删除成功}');
     		    			$(".pop-up-wrap-del").hide();
     						
     					},
     					error : function(xhr, status, e) {
     						loadingHide();
     						alert("Error : " + status);
     					}
     				});
     		}			
     		
     		
	</script>
	
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
		$(function(){ 
			  wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: "${appInfo.appId }", // 必填，公众号的唯一标识
				    timestamp: "${signInfo.timestamp }", // 必填，生成签名的时间戳
				    nonceStr: "${signInfo.nonceStr }", // 必填，生成签名的随机串
				    signature: "${signInfo.signature }",// 必填，签名，见附录1
				    jsApiList: [//分享接口
				       		 	 'onMenuShareTimeline'		//获取“分享到朋友圈”按钮点击状态及自定义分享内容接口
				        		,'onMenuShareAppMessage'	//获取“分享给朋友”按钮点击状态及自定义分享内容接口
				                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
				});  
			  
			  	wx.ready(function(){
			  		
			  		wx.onMenuShareTimeline({
			  		    title: '${amsExcList.HME_CLB_NM} ${label.参加活动}', // 分享标题
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcJinCar.htm%253FintExcsq%253D${intExcsq}%2526shopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', // 分享链接
			  		  link: '${shareInfo.link}',
			  		    		imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/em/car.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${amsExcList.HME_CLB_NM} - ${label.一起去} [배차]', // 分享标题
			  		    desc: '${amsExcList.EXC_TP_NM} ${amsExcList.EXC_TIT} ${amsExcList.EXC_DATE} ${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}', // 分享描述 
			  		  link: '${shareInfo.link}',
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcJinCar.htm%253FintExcsq%253D${intExcsq}%2526shopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/em/car.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		       // alert('success 11');
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    	// alert('error 11');
			  		    }
			  		});
				});
			  	
			  	
			  	wx.error(function(res){
			  	    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
		
			  	});
			  
		});
	</script>

			<!-- START bottom menu -->
			<c:set var="menuTag" value="1" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		
		<a href="excJin.htm?intExcsq=${intExcsq}" class="r_pg_top show" style="bottom: 65px;background-image: url(/front/bbc/img/btn_home.png);">홈으로</a>
		
	</body>
	
</html>