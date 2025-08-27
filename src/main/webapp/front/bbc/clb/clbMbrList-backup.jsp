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
		<title>${label.会员管理}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<style type="text/css">
				.month input{
					width:2.65rem;
					height:0.4rem;
					padding:0 0.2rem;
					border:1px solid #d2d2d2;
					font-size:0.2rem;
					border-radius:0.04rem;
					color:#aaa;
				}
				.cell-1{width:0.5rem;}
				.cell-2{width:0.7rem;}
				.cell-3{width:0.8rem;}
				.cell-4{width:0.9rem;}
				.cell-5{width:1.3rem;}
				.cell-6{width:0.6rem;}
				.cell-7{width:0.8rem;}
				.cell-8{width:0.7rem;}
				.cell-9{width:0.9rem;}
				.cell-10{width:1rem;}
				.cell-11{width:0.7rem;}
	
		</style>
	</head>
	<body>
		<div class="content">
			<div class="module" >
					<div class="list-110">
						<p  class="club-logo1 float" >
							<img src="${amsClb.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="word-title float" style="white-space:nowrap;overflow:ellipsis;" onclick="window.location='clbDetMy.htm?intClbsq=${amsClb.CLB_SQ}';">
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
							<p class="flex1 switch-btn switch-btn1 active" ><span>${label.加入申请}</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn2"><span>${label.会员}</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn3"><span>${label.退出会员}</span></p>
							<c:if test="${amsClb.CLB_SQ != 11}">
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn4"><span>${label.会员}생일</span></p>
							</c:if>
						</div>
					</div>
<!-- 					<div class="float1" style="height:0.7rem;line-height:0.7rem;position:relative;"> -->
<!-- 						<button class="btn-borders " style="vertical-align:middle;padding-right:0.33rem;background-image:url(../img/greenup.png);background-position:right 0.1rem;background-repeat:no-repeat;background-size:0.14rem;background-position:right 0.1rem center;">10个</button> -->
<!-- 					</div> -->
				</div>
			</div>
			<div class="switcharea-apply">
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">아이디</li>
					<li class="flex2 cell-4 cell">${label.状态}</li>
					<li class="flex2 cell-5 cell">${label.加入日}</li>
					<li class="flex2 cell-6 cell">${label.确认}</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;overflow: scroll;height: 82Vh;">
				
				<!-- START Data Loop -->
				<c:forEach var="atrClbJinReq" items="${atrClbJinReq}" varStatus="status">
				  
					<!-- 가입신청 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell">${atrClbJinReq.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${atrClbJinReq.MBR_ID}</li>
						<li class="flex2 cell-4 cell">${atrClbJinReq.CLB_JIN_REQ_ST_NM}</li>
						<li class="flex2 cell-5 cell">${atrClbJinReq.REQ_DT}</li>
						<li class="flex2 cell-6 cell" onclick="fn_ClbMbrOpen('${atrClbJinReq.CLB_JIN_REQ_SQ}', '${atrClbJinReq.JIN_REQ_MBR_SQ}');">${label.确认}</li>
						
						<input type="hidden" id="CLB_NIK_NM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.CLB_NIK_NM}">
						<input type="hidden" id="MBR_NM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.MBR_NM}">
						<input type="hidden" id="AGE_YY${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.AGE_YY}">
						<input type="hidden" id="GND_DV${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.GND_DV}">
						<input type="hidden" id="BMT_GD${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.BMT_GD}">
						<textarea style="display:none" id="JIN_GRT_TXT${atrClbJinReq.CLB_JIN_REQ_SQ}" placeholder="请输入内容" readonly="true">${atrClbJinReq.JIN_GRT_TXT}</textarea>
						<input type="hidden" id="MBR_MAI_IMG_FNM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.MBR_MAI_IMG_FNM}">
						<input type="hidden" id="CLB_NM${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.CLB_NM}">
						<input type="hidden" id="OPENID${atrClbJinReq.CLB_JIN_REQ_SQ}" value="${atrClbJinReq.OPENID}">
						
					</ul>
					
				 </c:forEach>
				<!-- END Data Loop -->
				
				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;">
<!-- 					<div class="button flex2"> -->
<!-- 						<button class="btn-stop">上一页</button> -->
<!-- 						<button class="btn-stop">下一页</button> -->
<!-- 					</div> -->
				</ul>
				</div>
			</div>
			<div class="switcharea-number" style="display:none;">
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-3 cell">${label.图片}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-2 cell">아이디</li>
					<li class="flex2 cell-4 cell">${label.会员等级}</li>
					<li class="flex2 cell-5 cell">${label.加入日}</li>
					<li class="flex2 cell-6 cell">${label.修改}</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;overflow: scroll;height: 82Vh;">
				
				
				<!-- START Data Loop -->
				<c:forEach var="amsClbMbr" items="${amsClbMbr}" varStatus="status">  
					
					<!-- 회원 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-3 cell"><img src="${amsClbMbr.MBR_MAI_IMG_PTH}" style="width: 0.6rem;height: auto;padding-top: 0.05rem;"></li>
						<li class="flex2 cell-2 cell">${amsClbMbr.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${amsClbMbr.MBR_ID}</li>
						<li class="flex2 cell-4 cell">${amsClbMbr.CLB_GD_NM}</li>
						<li class="flex2 cell-5 cell">${amsClbMbr.CLB_JIN_DT}</li>
						<li class="flex2 cell-6 cell" onclick="window.location='/front/bbc/clb/clbMbrInfo.htm?intClbsq=${amsClbMbr.CLB_SQ}&intMbrsq=${amsClbMbr.MBR_SQ}';">${label.修改}</li>
					</ul>
				
				 </c:forEach>
				<!-- END Data Loop -->
				
				
				</ul>
				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;">
<!-- 					<div class="button flex2"> -->
<!-- 						<button class="btn-stop">上一页</button> -->
<!-- 						<button class="btn-stop">下一页</button> -->
<!-- 					</div> -->
				</ul>
				</div>
			</div>
			<div class="switcharea-out-number" style="display:none;">
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">아이디</li>
					<li class="flex2 cell-4 cell">${label.会员等级}</li>
					<li class="flex2 cell-5 cell">${label.退出日}</li>
					<li class="flex2 cell-6 cell">Rank</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;overflow: scroll;height: 82Vh;">
				
				
				<!-- START Data Loop -->
				<c:forEach var="amsClbMbrExi" items="${amsClbMbrExi}" varStatus="status">  
					
					<!-- 탈퇴회원 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell">${amsClbMbrExi.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${amsClbMbrExi.MBR_ID}</li>
						<li class="flex2 cell-4 cell">${amsClbMbrExi.CLB_GD_NM}</li>
						<li class="flex2 cell-5 cell">${amsClbMbrExi.CLB_JIN_DT}</li>
						<li class="flex2 cell-6 cell">${amsClbMbrExi.CLB_RANK}</li>
					</ul>
				
				 </c:forEach>
				<!-- END Data Loop -->
				
				
				
				</ul>
				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;">
<!-- 					<div class="button flex2"> -->
<!-- 						<button class="btn-stop">上一页</button> -->
<!-- 						<button class="btn-stop">下一页</button> -->
<!-- 					</div> -->
				</ul>
				</div>
			</div>
			
			<div class="switcharea-bth-number" style="display:none;">
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-7 cell">월</li>
					<li class="flex2 cell-8 cell">${label.姓名}</li>
					<li class="flex2 cell-9 cell">${label.会员等级}</li>
					<li class="flex2 cell-10 cell">올해생일</li>
					<li class="flex2 cell-11 cell">생일</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;overflow: scroll;height: 82Vh;">
				
				
				<!-- START Data Loop -->
				<c:forEach var="amsClbMbrBth" items="${amsClbMbrBth}" varStatus="status">  
					

					<c:if test="${amsClbMbrBth.RANKING == 1 and status.count > 1}">
					<ul class="flex list78 ul-list word" style="background: #f8f8f8;border-bottom: 1px solid #ddd;">
						<li class="flex2 cell-7 cell">${amsClbMbrBth.THIS_YEAR_MONTH}월</li>
						<li class="flex2 cell-8 cell">${label.姓名}</li>
						<li class="flex2 cell-9 cell">${label.会员等级}</li>
						<li class="flex2 cell-10 cell">올해생일</li>
						<li class="flex2 cell-11 cell">생일</li>
					</ul>
					</c:if>					
					
					<!-- 생일 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-7 cell">${amsClbMbrBth.THIS_YEAR_MONTH}</li>
						<li class="flex2 cell-8 cell">${amsClbMbrBth.CLB_NIK_NM}</li>
						<li class="flex2 cell-9 cell">${amsClbMbrBth.CLB_GD_NM}</li>
						<li class="flex2 cell-10 cell">${amsClbMbrBth.THIS_YEAR_BTH_DT}</li>
						<li class="flex2 cell-11 cell">${amsClbMbrBth.BTH_DT}</li>
					</ul>
				
				 </c:forEach>
				<!-- END Data Loop -->
				
				
				
				</ul>
				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;">
<!-- 					<div class="button flex2"> -->
<!-- 						<button class="btn-stop">上一页</button> -->
<!-- 						<button class="btn-stop">下一页</button> -->
<!-- 					</div> -->
				</ul>
				</div>
			</div>
			

		<div class="pop-up-wrap" style="display:none;">
<%-- 			<p class="flex1 title-icon">${label.个人信息}</p> --%>
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
	
		var vintClbjinreqsq, vintJinreqmbrsq;
	
		$(document).ready(function(){
			$(".switch-btn").on("click",function(){
				$(".switch-btn").removeClass("active");
				$(this).addClass("active");
				if($(this).attr("class").indexOf("switch-btn1") >= 0){
					$(".switcharea-apply").show();
					$(".switcharea-number").hide();
					$(".switcharea-out-number").hide();
					$(".switcharea-bth-number").hide();
				}
				else if($(this).attr("class").indexOf("switch-btn2") >= 0){
					$(".switcharea-number").show();
					$(".switcharea-apply").hide();
					$(".switcharea-out-number").hide();
					$(".switcharea-bth-number").hide();
				}
				else if($(this).attr("class").indexOf("switch-btn3") >= 0){
					$(".switcharea-out-number").show();
					$(".switcharea-apply").hide();
					$(".switcharea-number").hide();
					$(".switcharea-bth-number").hide();
				}
				else if($(this).attr("class").indexOf("switch-btn4") >= 0){
					$(".switcharea-bth-number").show();
					$(".switcharea-apply").hide();
					$(".switcharea-number").hide();
					$(".switcharea-out-number").hide();
				}
			});
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