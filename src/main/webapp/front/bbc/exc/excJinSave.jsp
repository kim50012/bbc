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
		.blink2 {
		    -webkit-animation: blink2 1s linear infinite;
		} 
		@-webkit-keyframes blink2 {
		    0% { color: blue; }
		    33% { color: white; }
		    66% { color: red; }
		    100% { color: white; }
		/*    from { background-color: red;}
		    to {background-color: green;}  */
		}
		</style>	
	
<!-- 		<script type="text/javascript" src="https://www.appmake.co.kr/asset/js/appmake_sendpush.js"></script>	 -->
	</head>
	<%@ include file="/front/bbc/inc/tags.jsp"%>
	<body style="background:#fff;margin: 0 auto;">
		<div class="wrap no-footer" style="background:#fff;height: 100%;">
		<c:set var="hmeClbsq" value="${amsExcList.HME_CLB_SQ}"/>
		<c:set var="excJintpTag" value="" />
		<c:if test="${hmeClbsq == 2300}">
			<c:set var="excJintpTag" value="display:none;" />
		</c:if>
		<c:set var="jinTag1" value="(正常) 基本参与办法，BB COIN是比赛结束后正常反映。" />
		<c:set var="jinTag2" value="(和平) 愉快运动~BB COIN是只能反映30%。" />
		<c:set var="jinTag3" value="(受伤) 身体状态不好~BB COIN是只能反映30%。" />
		<c:set var="jinTag4" value="(培训) 教练，被培训的人要选这个。" />
		<c:set var="jinTag5" value="如果有人选和平和受伤的话，双打比赛结束后已被算好的bb coin的只能反映30%。" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="jinTag1" value="[정상] 기본 참여 방법으로 경기 후 BB Coin이 정상 반영됩니다." />
			<c:set var="jinTag2" value="[평화] 운동을 즐겁게~ 경기 후 BB Coin이 30%만 반영됩니다." />
			<c:set var="jinTag3" value="[부상] 컨디션이 안좋을 경우~ BB Coin이 30%만 반영됩니다." />
			<c:set var="jinTag4" value="[레슨] 코치,레슨자는 이곳을~ 자동 경기 매칭시 제외됩니다~" />
			<c:set var="jinTag5" value="평화 또는 부상을 선택한 분이 한분이라도 있을 경우 해당 복식경기는 최종 계산된 코인 * 30% 만 코인 등락으로 반영됩니다." />
		</c:if>
			
		<div class="pop-up-wrap" id="joinExc" style="display: block;">
			<div class="pop-up-content" style="padding-top:0.1rem;top:48%;height: 100%;width: 100%;">
			
				<div class="module" style="width: 100%;margin-top: 0.5rem;">
					<div class="list68 flex">
						<p class="flex1 title-icon" style="">${label.参与类型}</p>
					</div>
				</div>
				
				<c:if test="${amsExcList.EXC_TP == '1003'}">
					<div class="inp-wrap">
						<div class="radio-box checked" style="padding-top:0.25rem;">
							<label for="r1-5" class="float1"><input  type="radio" name="activityType1" id="r1-5" value="5" checked/></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/5.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>[${label.参与}] ${label.我掺加}.</p>
						</div>
					</div>
					
					<div class="inp-wrap">
						<div class="radio-box " style="padding-top:0.25rem;">
							<label for="r1-6" class="float1"><input  type="radio" name="activityType1" id="r1-6" value="6" /></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/6.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>[${label.未定}] ${label.还没定}.</p>
						</div>
					</div>
					
					<div class="inp-wrap">
						<div class="radio-box " style="padding-top:0.25rem;">
							<label for="r1-7" class="float1"><input  type="radio" name="activityType1" id="r1-7" value="7" /></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/7.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>[${label.不参加}] ${label.我不参加}.</p>
						</div>
					</div>
					
					<div class="inp-wrap">
						<div class="radio-box " style="padding-top:0.25rem;">
							<label for="r1-8" class="float1"><input  type="radio" name="activityType1" id="r1-8" value="8" /></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/8.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>[${label.啦啦队}] ${label.加油}.</p>
						</div>
					</div>
					
					<div class="inp-wrap" style="color:red;">
						※ ${label.还没定的会员是确定以后修改一下 }。 아울러, 선수가 모자를 경우 후보로 뛸수 있는 선수일 경우 "미정" 아이콘을 선택하고 후보라고 명기해주세요 ~
					</div>
				</c:if>
				
				<c:if test="${amsExcList.EXC_TP != '1003'}">
					<div class="inp-wrap" style="${excJintpTag }">
						<div class="radio-box checked" style="padding-top:0.25rem;">
							<label for="r1-1" class="float1"><input  type="radio" name="activityType1" id="r1-1" value="1" checked/></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/1.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>${jinTag1}</p>
						</div>
					</div>
					
					<div class="inp-wrap" style="${excJintpTag }">
						<div class="radio-box " style="padding-top:0.25rem;">
							<label for="r1-2" class="float1"><input  type="radio" name="activityType1" id="r1-2" value="2" /></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/2.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>${jinTag2}</p>
						</div>
					</div>
					
					<div class="inp-wrap" style="${excJintpTag }">
						<div class="radio-box " style="padding-top:0.25rem;">
							<label for="r1-3" class="float1"><input  type="radio" name="activityType1" id="r1-3" value="3" /></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/3.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.7rem;">
							<p>${jinTag3}</p>
						</div>
					</div>
					
					<div class="inp-wrap" style="border-bottom: 1px dashed #d2d2d2;${excJintpTag }">
						<div class="radio-box " style="padding-top:0.25rem;">
							<label for="r1-4" class="float1"><input  type="radio" name="activityType1" id="r1-4" value="4" /></label>
						</div>
						<div style="width:0.7rem;height:0.6rem;">
							<img src="/front/bbc/img/em/4.gif" style="width:0.5rem;height:0.5rem;">
						</div>
						<div style="width:4rem;height:0.8rem;">
							<p>${jinTag4}</p>
						</div>
					</div>
					<div class="inp-wrap" style="color:red;">
						※ ${jinTag5} 아울러 지각시 자동경기매칭에서 제외됩니다. 
					</div>
				</c:if>
				

				<div class="inp-wrap" style="border-bottom: 1px dashed #d2d2d2;">
					${label.备注}
				</div>
				<div class="inp-wrap">
					<textarea id="strExcjincmt" style="height: 1rem;" placeholder="${label.请输入您的备注信息}">${label.参加}</textarea>
				</div>
				
				<div class="buttons" style="padding-bottom: 0.2rem;border-bottom: 1px dashed #d2d2d2;text-align:left;padding-left: 1.2rem;">
					<span class="btnDelay" style="left:0px;margin-left:0;">
						<input  type="checkbox" name="intExcjindly" id="intExcjindly" value="1" style="position: absolute;width: 1rem;height: 0.4rem;left: 0.5rem;margin-top: -0.01rem;"/>					
						${label.迟到}
					</span>
				</div>
				
				<div class="buttons" style="padding-bottom: 3rem;">
					<div class="flex Participant-title" style="padding-top: 0;padding-left:0.5rem;padding-bottom: 0.2rem;">		
						<button id="cancel" class="btn-join" style="margin-top: 0;width: 2rem;background: #909090;line-height: 0;padding: 0.29rem 0.1rem;">${label.取消}</button>
						<button onclick="fn_ExcJinReg();" id="saveBtn" class="btn-join" style="margin-top: 0;width: 2rem;margin-left:0.5rem;line-height: 0;padding: 0.29rem 0.1rem;">${label.参加}</button>
					</div>
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
		</div>	
		<div>
			<br/><br/><br/><br/>
		</div>
		<script type="text/javascript">

		$(document).ready(function(){
		

			$(".switch-btn").on("click",function(){
				$(".switch-btn").removeClass("active");
				$(this).addClass("active");
				if($(this).attr("class").indexOf("switch-btn1") >= 0){
					$(".switcharea-apply").show();
					$(".switcharea-number").hide();
					$(".switcharea-reply").hide();
				}
				else if($(this).attr("class").indexOf("switch-btn2") >= 0){
					$(".switcharea-number").show();
					$(".switcharea-apply").hide();
					$(".switcharea-reply").hide();
				}
				else if($(this).attr("class").indexOf("switch-btn3") >= 0){
					$(".switcharea-reply").show();
					$(".switcharea-apply").hide();
					$(".switcharea-number").hide();
				}
			});

			$("#btn3").click(function(){
				window.location = '/front/bbc/exc/msgDoList.htm?intClbsq=${intExcsq}';
			});
			$("#btn2").click(function(){
				window.location = '/front/bbc/exc/excJinCar.htm?intExcsq=${intExcsq}';
			});
			$("#btn").click(function(){
				$('html, body').animate({scrollTop:0}, 1);
				$("#joinExc").show();
			});
			$("#cancel").click(function(){
				window.location = '/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}';
			});
			$("#delEsc").click(function(){
				window.location = '/front/bbc/exc/excView.htm?intExcsq=${intExcsq}';
			});

			$(".pop-up-wrap input[type='radio']").change(function(){
				if ($(":radio[name='activityType1']").is(':checked')) {
					$(".radio-box").removeClass("checked");
			        $(this).parents(".radio-box").addClass("checked");
			        if ($(this).val() == "6") {
			        	$("#strExcjincmt").val("${label.未定}");
			        } else if ($(this).val() == "7") {
			        	$("#strExcjincmt").val("${label.不参加}");
			        } else if ($(this).val() == "8") {
			        	$("#strExcjincmt").val("${label.加油}!");
			        } else if ($(this).val() == "4") {
			        	$("#strExcjincmt").val("${label.培训}!");
			        } else { // ($(this).val() == "5")
			        	$("#strExcjincmt").val("${label.参加}");
			        }
				}
			});
		});
		

		$(document).ready(function(){
			$(".del").on("click",function(){
				console.log($(this))
				var el=$(this).parents(".hang")
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
			

     		function fn_ExcJinReg() {

     			$("#saveBtn").hide();
     			
     			<c:if test="${amsExcList.FEE_MSG == 'Y'}">
     				// alert("${amsExcList.CLB_NIK_NM}님 아직 회비 납부를 하지 않으셨네요. \n회비 납부 부탁드립니다~\n\n혹시 이미 납부를 하셨다면 총무님께 연락 부탁드립니다.");
     			</c:if>
     			
     			<c:if test="${amsExcList.EXC_DATE < amsExcList.TODAY}">
     				alert("날짜가 지난 운동공지 입니다. 일자 확인 후 참가 신청 해주세요.");
     				return;
     			</c:if>
     			
     			<c:if test="${amsExcList.EXC_TP == '1002'}">
    				<c:if test="${hmeClbsq == 9}">
    					var now = new Date();
    					var nowTime = now.getHours();
    					if (nowTime >= 12) {
    						<c:if test="${strLngdv == 'ko-KR'}">
    							alert("회원 여러분! 가급적 참가 댓글 빨리 달아주신다면 (12시 전), 운영진이 코트 확보 및 예약하는데 아주 도움이 많이 됩니다 ~  감사합니다");
    						</c:if>
    						<c:if test="${strLngdv != 'ko-KR'}">
    							alert("为了顺利的场地约定，请12点之前运动参加一下吧。");
    						</c:if>
    					}
    				</c:if>
    			</c:if>
    			
     			var intExcjintp = $(':radio[name="activityType1"]:checked').val();
     			var intExcjindly = $(':checkbox[name="intExcjindly"]:checked').val();
     			
     			var intExcsq = "${intExcsq}";
     			var strExcjincmt = $('#strExcjincmt').val();
     			var strJobtype = "I";

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
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/exc/excJinRegSave.htm",
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
     		    					+	'<div class="list78 noborder bottom-dashed flex hang" style="padding:0;">'
		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
		    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
		    						+		'<p class="member-head-wrap" style="${excJintpTag}"><img class="member-head" style="border-radius: 0;width:0.3rem;height:0.3rem;margin-top:0.23rem;"  src="/front/bbc/img/em/'+data.mapResult[i].EM_TYPE+'.gif"/></p>'
		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
		    						+		'<p class="flex1 right" style="max-width:40px;">'+data.mapResult[i].CLB_RANK+'${label.位 }</p>'
		    						+	'</div>'     		    					
     		    		    		;
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
     		    			window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
     		    			
//      		    			try
//      		    			{
// 								var date=new Date();//현재 년월일시분초로 date객체생성
// 								var yy=date.getFullYear();
// 								var mm=date.getMonth()+1; //1월은 0으로 리턴.
// 								var dd=date.getDate();
// 								var hh=date.getHours(); //0-23리턴
// 								var mi=date.getMinutes();
// 								var ss=date.getSeconds();
// 								//2015-9-17 17:20:11
// 								var msgNo=yy+mm+dd+hh+mi+ss;     		    				
     		    				
// 	     		    		    if (typeof sendPush === 'function') {
// 	     		    		        no = msgNo;
// 	     		    		        app_srno = 1232;
// 	     		    		        send_id = '${loginMbrSq}';
// 	     		    		        receive_id = '20';
// 	     		    		        title = "[운동 신청 알림]";
// 	     		    		        contents = "${amsExcList.LOGIN_NIK_NM}";
// 	     		    		        sendPush(no, app_srno, send_id, receive_id, title, contents);
// 								}
//      		    		    }
//   		    				catch (ex) {
//   		    				}
     		    			
     		    			
     						
//      						if(data.ret=="success"){
//      							window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
//      						}else{
//      							loadingHide();
//      							alertBbc(data.ret);
//      						}
     						
     					},
     					error : function(xhr, status, e) {
     						loadingHide();
     						alert("Error : " + status);
     					}
     				});
     		}			

     		function fn_ExcJinDel() {

     			<c:if test="${amsExcList.EXC_DATE < amsExcList.TODAY}">
     				alert("날짜가 지난 운동공지 입니다. 일자를 확인하세요.");
     				return;
     			</c:if>
     			
     			var intExcsq = "${intExcsq}";
     			var strJobtype = "I";
     			var intExcjintp = "7";
     			var strExcjincmt = "${label.不参加}";
     			

				<c:if test="${amsExcList.EXC_SQ_ING > 0}">
					alert('${label.已经开始运动}. ${label.不能删除}!');
					return;
				</c:if>
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intExcsq : intExcsq
     			 	 			,strJobtype : strJobtype
     			 	 			,intExcjintp : intExcjintp
     			 	 			,strExcjincmt : strExcjincmt
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/exc/excJinRegSave.htm",
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
     		    					+	'<div class="list78 noborder bottom-dashed flex hang" style="padding:0;">'
		    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
		    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
		    						+		'<p class="member-head-wrap" style="${excJintpTag}"><img class="member-head" style="border-radius: 0;width:0.3rem;height:0.3rem;margin-top:0.23rem;"  src="/front/bbc/img/em/'+data.mapResult[i].EM_TYPE+'.gif"/></p>'
		    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
		    						+		'<p class="flex1 right" style="max-width:40px;">'+data.mapResult[i].CLB_RANK+'${label.位 }</p>'
		    						+	'</div>'     		    					
     		    		    		;
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
     		    			window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
     						
     					},
     					error : function(xhr, status, e) {
     						loadingHide();
     						alert("Error : " + status);
     					}
     				});
     		}			

     		function fn_ExcJinBBCoin() {

     			<c:if test="${amsExcList.EXC_DATE < amsExcList.TODAY}">
     				alert("날짜가 지난 운동공지 입니다. 일자 확인 후 참가 신청 해주세요.");
     				return;
     			</c:if>
     			
     			var intExcsq = "${intExcsq}";
     			var strJobtype = "B";
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intExcsq : intExcsq
     			 	 			,strJobtype : strJobtype
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/exc/excJinRegSave.htm",
     					success : function(data) {

     		    			if(data.mapResult.length!=0){
								
     		    				if (data.mapResult[0].MSG_OUT != 'S') {
     		    					alert(data.mapResult[0].MSG_OUT);
     								//window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
     	     		    			loadingHide();
     		    					return;
     		    				}
     		    			}
     		    			loadingHide();
     		    			alert('${label.保存成功}');
     		    			window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
     						
     					},
     					error : function(xhr, status, e) {
     						loadingHide();
     						alert("Error : " + status);
     					}
     				});
     		}			
			
     		

     		function fn_gameTodaySave() {

     			<c:if test="${amsExcList.EXC_DATE < amsExcList.TODAY}">
     				alert("날짜가 지난 운동공지 입니다. 일자 확인 후 참가 신청 해주세요.");
     				return;
     			</c:if>
     			
     			var intExcsq = "${intExcsq}";
     			var strJobtype = "S";
     			var intClbsq = "${hmeClbsq}";

				window.location.href="/front/bbc/exc/excAutoGame.htm?intClbsq=${hmeClbsq}&intExcsq=${intExcsq}";
				return;
				
         		if (!confirm("${label.自动比赛生成吗}?\n${label.只能一次生成}!")) {
     				return;
     			}
     			
     			loadingShow();
     			
     			$.ajax({
		 	 		data:{
		 	 			intExcsq : intExcsq
		 	 			,strJobtype : strJobtype
		 	 			,intClbsq : intClbsq
		 	 		},
					type : "POST",
					url : "/front/bbc/clb/gameTodaySave.htm",
					success : function(data) {
		
// 						if(data.ret=="success"){
							window.location.href="/front/bbc/clb/gameTody.htm?intClbsq="+intClbsq;
// 						}else{
// 							loadingHide();
// 							alertBbc(data.ret);
// 						}
						
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
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcJin.htm%253FintExcsq%253D${intExcsq}%2526shopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', // 分享链接
						link: '${shareInfo.link}',
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${amsExcList.HME_CLB_NM}', // 分享标题
			  		    desc: '${amsExcList.EXC_TP_NM} ${amsExcList.EXC_TIT} ${amsExcList.EXC_DATE} ${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}', // 分享描述 
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcJin.htm%253FintExcsq%253D${intExcsq}%2526shopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', // 分享链接
			  		    link: '${shareInfo.link}',
						imgUrl: 'http://bbc.manhuaking.cn${amsExcList.CLB_MAI_IMG_PTH}', // 分享图标
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
		
		<c:set var="helpTag" value="65" />
		<c:if test="${strLngdv == 'ko-KR'}">
			<c:set var="helpMsg" value="운동에 참여 여부를 댓글로 관리하는 화면 입니다.<br><br>운동참여 버튼을 이용하여 참석 여부를 등록하시고, 혹시 참석 취소를 할 경우 자신의 프로필 사진의 '-' 아이콘을 클릭하여 삭제하시면 됩니다." />
		</c:if>
		<c:if test="${strLngdv != 'ko-KR'}">
			<c:set var="helpMsg" value="这画面是使用回帖管理是否参与运动。<br><br>使用按钮登录参与，如果取消参与的话点击自己的头像的'-'会删除参与。" />
		</c:if>
		
		<%@ include file="/front/bbc/inc/helpPage.jsp"%> 

		<a href="excJinCar.htm?intExcsq=${intExcsq}" class="r_pg_top show" style="bottom: 65px;background-image: url(/front/bbc/img/btn_car.png);">홈으로</a>
		
	</body>
	
</html>