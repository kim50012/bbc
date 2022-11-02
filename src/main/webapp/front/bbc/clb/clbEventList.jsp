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
		<title>Event</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
	</head>
	<style type="text/css">
		.encourage{
			height:0.58rem;
			background:#f6f6f6;
			border:1px solid #ddd;
			padding-left:0.2rem;
			padding-right:0.2rem;            
			margin-left:0.2rem;
			margin-right:0.2rem;
			color:#666;
			font-size:0.22rem;
			line-height:0.58rem;
		}
		.bg{
			background:#fff;
		}
		.open{
			background:#f6f6f6;
			width:5.96rem;
			margin:0 auto;
			border-left:1px solid #ddd;
			border-right:1px solid #ddd;
			border-bottom:1px solid #ddd;
		}
		.list58-1 span{
			font-size:0.2rem;
		}
		.radio-box label.active:before{
			background-image: url(../img/radio-checked-red.png);
		}
		.rate-border{
			width:6rem;
			margin:0 auto;
			height:1rem;
			border:1px solid #ddd;
		}
		.fifty{
			color: #f54141;
			font-weight:bold;	
		}
	</style>
	<body>
		<div class="content">
			<div class="module" >
					<div class="list-110">
						<p  class="club-logo1 float" >
							<img src="${amsClb.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="word-title float" style="white-space:nowrap;overflow:ellipsis;" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClb.CLB_SQ}';">
							${amsClb.CLB_NM}【<span>${amsClb.CLB_MBR_CNT}</span>人】
						</p>
						<div class="number-information float" style="padding-right: 0.2rem;right: 0;position: absolute;">
							<div class="number-name" >${amsClb.MBR_NM}</div> 
							<div class="number-level" >${amsClb.CLB_GD_NM}</div>
						</div>
					</div>
			</div>
			
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="" style="height:0.7rem;width:100%;">
					<div class="float" style="width:100%;">
						<div class="list68 flex" style="padding:0;">
							<p class="flex1 switch-btn switch-btn1 active" ><span>진행중</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn2" onclick="window.location='clbEventListEnd.htm?intClbsq=${amsClb.CLB_SQ}';"><span>완료</span></p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="switcharea-apply">
			
				<div class="modules bg" style="margin-top:0; padding-left:0.2rem;padding-right:0.2rem;">
					<div class="flex">
						<p class="flex1 title-icon">${label.进行中}Event</p>
						<button id="btn" class="btn-join" onclick="window.location='/front/bbc/clb/clbEventReg.htm?intClbsq=${amsClb.CLB_SQ}';">Event${label.创建}</button>
					</div>
				</div>
				
				<!-- START Data Loop -->
				<c:forEach var="atrEvtList" items="${atrEvtList}" varStatus="status">  
				
					<div class="module" style="border-top:none;margin-top: 5px;">
						<div class="list178 flex bg"  style="border:none;height:auto;">
											<div style="width: 2rem;height:auto;text-align: center;margin:0.2rem 0.2rem 0.0rem 0rem;" onclick="imgBig(this);">
												<img style="width:100%;height:auto;" src="${atrEvtList.PTO_URL}" onclick="eventImgView('${atrEvtList.PTO_URL}');"/>
											</div>
											<div class="flex1" style="padding-top:0.1rem;width:3.7rem;">
												<p class="lh03 word-title text-flow nowrap">${atrEvtList.HME_NM} vs ${atrEvtList.AWY_NM}</p>
												<p class="small22-text small22">${label.创建}${label.日期}：${atrEvtList.REG_DT}</p>
												<p class="small22-text small22 text-flow" style="white-space: normal">${atrEvtList.EVT_CTE}</p>
											</div>
						</div>
						
						<div class="rate bg" style="padding-bottom:0.1rem;padding-top:0.1rem;">
							<div class="list68 flex rate-border" >
								<p class="flex1 switch-btn" style="text-align:center;line-height:1rem;">이벤트 기한이 <span style="font-size:0.36rem;color:red;">${atrEvtList.REM_DT}</span>일 남았습니다.</p>
							</div>
						</div>
						<div class="rate bg" style="padding-bottom:0.1rem;padding-top:0.1rem;display:none<c:if test="${atrEvtList.MBR_SQ_MY == amsClb.MBR_SQ}">1</c:if>;">
							<div class="list68 flex rate-border" >
											<p class="flex1 switch-btn" style="text-align:center;line-height:1rem;"><span style="font-size:0.36rem;color: #f54141;" >${atrEvtList.RATE_A}% </span><span style="font-size:0.18rem;">${atrEvtList.CNT_A} ${label.人参与}</span></p>
											<p><div class="parting-line" style="margin-top:0.34rem;"></div></p>
											<p class="flex1 switch-btn" style="text-align:center;line-height:1rem;"><span style="font-size:0.36rem;color: #f54141;">${atrEvtList.RATE_B}% </span><span style="font-size:0.18rem;">${atrEvtList.CNT_B} ${label.人参与}</span></p>
							</div>
						</div>
						
						<div class="rate bg" style="padding-bottom:0.1rem;display:none<c:if test="${atrEvtList.MBR_SQ_MY == amsClb.MBR_SQ}">1</c:if>;">
							<div class="list68 flex rate-border" style="height:0.7rem;">
								<c:if test="${(amsClb.CLB_GD == 'A') || amsClb.CLB_GD == 'B' || amsClb.MBR_SQ == atrEvtList.REG_MBR_SQ}">
									<p class="flex1 switch-btn" style="text-align:center;line-height:0.7rem;"><span style="font-size:0.2rem;color:blue;" onclick="fn_EvtUpd(${atrEvtList.MTC_SQ},${atrEvtList.CLB_SQ},'D');">${label.删除}</span></p>
									<p><div class="parting-line" style="line-height:0.5rem;"></div></p>
								</c:if>
								<p class="flex1 switch-btn" style="text-align:center;line-height:0.7rem;"><span style="font-size:0.24rem;color:blue;" onclick="eventCheResultReg(${atrEvtList.MTC_SQ}, ${atrEvtList.CLB_SQ}, '${atrEvtList.HME_NM}', '${atrEvtList.AWY_NM}');">EVENT ${label.结果保存}</span></p>
							</div>
						</div>
						
						<div class="slid bg" style="padding-top:0rem;padding-bottom:0.4rem;">
							<div class="encourage" style="<c:if test="${atrEvtList.MBR_SQ_MY == amsClb.MBR_SQ}">display:none;</c:if>">
									<div class=" float nowrap text-flow" style="width:4.8rem;text-align:left;">
										<span>${atrEvtList.CNT}</span>${label.个人正在加油助威你可以点击按钮参与啦啦队队伍}
									</div>
									
									<div class="float1 horn-btn">
										<img  style="height:0.24rem;width:0.28rem;" onclick="eventCheReg(${atrEvtList.MTC_SQ}, '${atrEvtList.HME_NM}', '${atrEvtList.AWY_NM}');" src="../img/horn.png">
									</div>
									<div class="float1 comment" style="display:none;color:#007165;">4</div>
							</div>
							
						    <div class="open" style="border-top: 1px solid #ddd;display:none<c:if test="${atrEvtList.MBR_SQ_MY == amsClb.MBR_SQ}">1</c:if>;">

						       <c:forEach var="atrEvtcheList" items="${atrEvtcheList}" varStatus="status">
						
						        <c:if test="${atrEvtList.MTC_SQ == atrEvtcheList.MTC_SQ}">
								
									<ul class="flex list58-1 ul-list" style="background:#f6f6f6;">
										<li class="flex2 cell-3"  style="line-height:0.28rem;display: flex;white-space: normal;">
											<c:if test="${atrEvtcheList.CHE_TEM_DV == 'A'}">
												<span class="green" style="min-width: 1rem;float: left;">${atrEvtcheList.CLB_NIK_NM}: </span>
												<span style="width:5rem;float: left;">${atrEvtcheList.CHE_CTE}</span>
											</c:if>
											<c:if test="${atrEvtcheList.CHE_TEM_DV == 'B'}">
												<span style="width:5rem;text-align: right;float: right;">${atrEvtcheList.CHE_CTE}</span>
												<span class="green" style="min-width: 1rem;float: right;text-align:right;"> :${atrEvtcheList.CLB_NIK_NM}</span>
											</c:if>
										</li>
									</ul>
								
						        </c:if>
						
						       </c:forEach>
								
								
							</div>
						</div>
						
					</div>				
					
				 </c:forEach>
				<!-- END Data Loop -->
				
			</div>

		
			<div class="switcharea-number" style="display:none;">
			
				<div class="modules bg" style="margin-top:0; padding-left:0.2rem;padding-right:0.2rem;">
					<div class="flex">
						<p class="flex1 title-icon">완료 Event</p>
					</div>
				</div>
				
				
			</div>

		</div>

		<!--点击喇叭之后的弹窗提醒-->
		<div class="pop-up-wrap" style="display:none;">
			<div class="pop-up-content">
				<div style="margin-top:0.14rem;border-bottom:1px solid #ddd;padding-bottom:0.2rem;">
					<p>${label.预测一下哪个队会赢}?</p><input type="radio" name="sle" value="one" >
				</div>
				<div class="float" style="width:1.64rem;height:1.2rem;border:1px solid #ddd;border-radius:4%;padding:0.2rem;margin-top:0.2rem;">
					<div class="radio-box" style="margin-bottom:0.2rem;">
								<label for="r3"><input type="radio" name="strChetemdv" id="r3" value="A" />A${label.队}${label.胜}</label>
					</div>
					<p id="pnameA"></p>
				</div>
				<div class="float" style="width:0.35rem;height:1.2rem;line-height:2rem;text-align:right;">
					VS
				</div>
				<div class="float1" style="width:1.64rem;height:1.2rem;border:1px solid #ddd;border-radius:4%;padding:0.2rem;margin-top:0.2rem;">
					<div class="radio-box" style="margin-bottom:0.2rem;">
								<label for="r4"><input type="radio" name="strChetemdv" id="r4" value="B" />B${label.队}${label.胜}</label>
					</div>
					<p id="pnameB"></p>
				</div>
				<div class="inp-wrap">
					<textarea class="textboxcontent" style="margin-top:0.2rem;border-color:#ddd;" id="strChecte">${label.加油}~</textarea>
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span class="comeon" onclick="fn_atrEvtCheReg();">${label.加油助威}</span>
				</div>
				<input type="hidden" id="intMtcsq" value=""/>
			</div>
		</div>
		
		<!--点击喇叭之后的弹窗提醒-->
		<div class="pop-up-wrap-del" style="display:none;">
			<div class="pop-up-content" style="padding-bottom: 0.8rem;">
				<div style="margin-top:0.14rem;border-bottom:1px solid #ddd;padding-bottom:0.2rem;">
					<p>${label.比赛结果保存}</p><input type="radio" name="sle" value="one" >
				</div>
				<div class="float" style="width:1.64rem;height:2rem;border:1px solid #ddd;border-radius:4%;padding:0.2rem;margin-top:0.2rem;">
					<div class="radio-box" style="margin-bottom:0.2rem;">
							<label for="r5"><input type="radio" name="strChetemdvResult" id="r5" value="A" />A${label.队}${label.胜}</label>
					</div>
					<p id="pnameResultA"></p>
					<div style="margin-top:0.14rem;border-bottom:0px solid #ddd;padding-bottom:0.2rem;">
						<input type="tel" class="left" style="border: 1px solid #ddd;" id="numScoreA" value="" />
					</div>
				</div>
				<div class="float" style="width:0.35rem;height:1.2rem;line-height:2rem;text-align:right;">
					VS
				</div>
				<div class="float1" style="width:1.64rem;height:2rem;border:1px solid #ddd;border-radius:4%;padding:0.2rem;margin-top:0.2rem;">
					<div class="radio-box" style="margin-bottom:0.2rem;">
							<label for="r6"><input type="radio" name="strChetemdvResult" id="r6" value="B" />B${label.队}${label.胜}</label>
					</div>
					<p id="pnameResultB"></p>
					<div style="margin-top:0.14rem;border-bottom:0px solid #ddd;padding-bottom:0.2rem;">
						<input type="tel" class="left" style="border: 1px solid #ddd;" id="numScoreB" value="" />
					</div>
					<br><br><br>
				</div>
				<div class="float" style="width:100%;height:0.5rem;line-height:0.5rem;text-align:right;">
					<div class="buttons">
						<span class="cancel" style="padding-top:0.2rem;">${label.取消}</span>
						<span class="comeon" style="padding-top:0.2rem;" onclick="fn_atrEvtCheResultReg();">${label.比赛结果保存}</span>
					</div>
				</div>
			</div>
		</div>
		

<script type="text/javascript">


	$(document).ready(function(){

		$(".switch-btn").on("click",function(){
			$(".switch-btn").removeClass("active");
			$(this).addClass("active");
			if($(this).attr("class").indexOf("switch-btn1") >= 0){
				$(".switcharea-apply").show();
				$(".switcharea-number").hide();
				/*显示所有俱乐部的内容*/
			}
			else if($(this).attr("class").indexOf("switch-btn2") >= 0){
				$(".switcharea-apply").hide();
				$(".switcharea-number").show();
			}
		});
		
		$(".cancel").on("click",function(){
			$(".pop-up-wrap").hide();
			$(".pop-up-wrap-del").hide();
		});

		$("input").change(function(){
			$(".active").removeClass("active");
			$("input:checked").remove("checked")
			$(this).attr("checked","checked")
			$(this).parent('label').addClass("active")
		})

	});

	function eventCheReg(intMtcsq, a, b) {
		$("#intMtcsq").val(intMtcsq);
		$("#pnameA").html(a);
		$("#pnameB").html(b);
		$('html, body').animate({scrollTop:0}, 1);
		$(".pop-up-wrap").show();
	}

	function eventCheResultReg(intMtcsq, intClbsq, a, b) {
		$("#intMtcsq").val(intMtcsq);
		$("#pnameResultA").html(a);
		$("#pnameResultB").html(b);
		$('html, body').animate({scrollTop:0}, 1);
		$(".pop-up-wrap-del").show();
	}
	

	function imgBig(obj) {
		if ($(obj).css('border') == '0px none rgb(0, 0, 0)') {
			$(obj).css({border:'0px none rgb(68, 68, 68)'});
			$(obj).css({width: '2rem'});
		}
		else {
			$(obj).css({border:'0px none rgb(0, 0, 0)'});
			$(obj).animate({width: '100%'});
		}
	}	
	
	function eventImgView(url) {
// 		$('html, body').animate({scrollTop:0}, 1);
// 		$('#eventImg').attr("src", url);
// 		$(".pop-up-wrap-del").show();
	}	
	
	function fn_EvtUpd(intMtcsq, intClbsq, strJobtype) {
		if (strJobtype == 'D') {
			if (!confirm("${label.确认删除活动吗}?")) {
				return;
			}
		}
		
		loadingShow();
		
		 $.ajax({
		 	 		data:{
		 	 			intMtcsq : intMtcsq
		 	 			,intClbsq : intClbsq
		 	 			,strJobtype : strJobtype
		 	 		},
				type : "POST",
				url : "/front/bbc/clb/clbEventUpdate.htm",
				success : function(data) {

    				alert("${label.保存成功了}");
   				window.location = "/front/bbc/clb/clbEventList.htm?intClbsq="+intClbsq;
     			
				},
				error : function(xhr, status, e) {
					loadingHide();
					alert("Error : " + status);
				}
			});				
		
	}

	function fn_atrEvtCheResultReg() {

		var strEvtst = $(':radio[name="strChetemdvResult"]:checked').val(); 
		var intClbsq = "${amsClb.CLB_SQ}";
		var intMtcsq= $('#intMtcsq').val();
		var intRegmbrsq= $('#numScoreA').val();
		var intLstmodmbrsq= $('#numScoreB').val();
		var strJobtype = "U";
		

		if (strEvtst == "") {
			alert("${请选择A队orB队}");
			return;
		}
		if (intRegmbrsq == "") {
			alert("${label.请输入分数}");
			return;
		}	
		if (intLstmodmbrsq == "") {
			alert("${label.请输入分数}");
			return;
		}		
		
		loadingShow();
		
		 $.ajax({
		 	 		data:{
		 	 			intMtcsq : intMtcsq
		 	 			,intClbsq : intClbsq
		 	 			,strJobtype : strJobtype
		 	 			,strEvtst : strEvtst
		 	 			,intRegmbrsq : intRegmbrsq
		 	 			,intLstmodmbrsq : intLstmodmbrsq
		 	 		},
				type : "POST",
				url : "/front/bbc/clb/clbEventUpdate.htm",
				success : function(data) {

    				alert("${label.保存成功了}");
   				window.location = "/front/bbc/clb/clbEventList.htm?intClbsq="+intClbsq;
     			
				},
				error : function(xhr, status, e) {
					loadingHide();
					alert("Error : " + status);
				}
			});		
	}
	
	function fn_atrEvtCheReg() {

		var strChetemdv = $(':radio[name="strChetemdv"]:checked').val(); 
		var intClbsq = "${amsClb.CLB_SQ}";
		var intMtcsq= $('#intMtcsq').val();
		var strChecte= $('#strChecte').val();
		
		if (strChetemdv == "") {
			alert("${请选择A队orB队}");
			return;
		}
		if (strChecte == "") {
			alert("${label.请输入内容}");
			return;
		}
		
		loadingShow();
		
		 $.ajax({
		 	 		data:{
		 	 			strChetemdv : strChetemdv
		 	 			,intClbsq : intClbsq
		 	 			,intMtcsq : intMtcsq
		 	 			,strChecte : strChecte
		 	 		},
				type : "POST",
				url : "/front/bbc/clb/atrEvtcheSave.htm",
				success : function(data) {

    				alert("${label.保存成功了}");
    				window.location = "/front/bbc/clb/clbEventList.htm?intClbsq="+intClbsq;
     				
					
				},
				error : function(xhr, status, e) {
					loadingHide();
					alert("Error : " + status);
				}
			});
	}
	
	
</script>		
		
		
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		

		<script>
		var pageTitle = "${amsClb.CLB_NM}";
		var shareWeDesc = "${label.进行中}Event";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		
		
	</body>
</html>