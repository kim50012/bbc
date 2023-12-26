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
		<title>자동로그인</title>
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
			<div class="switcharea-number">
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">${label.排序}</li>
					<li class="flex2 cell-2 cell">${label.姓名}</li>
					<li class="flex2 cell-3 cell">BB Coin</li>
					<li class="flex2 cell-4 cell">${label.会员等级}</li>
					<li class="flex2 cell-5 cell">${label.加入日}</li>
					<li class="flex2 cell-6 cell">${label.修改}</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;">
				
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell"><input type="text" id="mbrSqManual"/></li>
						<li class="flex2 cell-6 cell" onclick="login($('#mbrSqManual').val());">로그인</li>
					</ul>
					
				<!-- START Data Loop -->
				<c:forEach var="amsClbMbr" items="${amsClbMbr}" varStatus="status">  
					
					<!-- 회원 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${status.count}</li>
						<li class="flex2 cell-2 cell">${amsClbMbr.CLB_NIK_NM}</li>
						<li class="flex2 cell-3 cell">${amsClbMbr.CLB_BBC}</li>
						<li class="flex2 cell-4 cell">${amsClbMbr.CLB_GD_NM}</li>
						<li class="flex2 cell-5 cell">${amsClbMbr.CLB_JIN_DT}</li>
						<li class="flex2 cell-6 cell" onclick="login('${amsClbMbr.MBR_SQ}');">로그인</li>
					</ul>
				
				 </c:forEach>
				<!-- END Data Loop -->
				
				</div>

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
						<select class="textboxcontent" id="strBmtgd" style="width:100%;color:#666;padding-right: 0;flex: 1;" readonly="true">
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
					/*显示所有俱乐部的内容*/
				}
				else if($(this).attr("class").indexOf("switch-btn2") >= 0){
					$(".switcharea-number").show();
					$(".switcharea-apply").hide();
					$(".switcharea-out-number").hide();/*显示我的俱乐部的内容*/
				}
				else if($(this).attr("class").indexOf("switch-btn3") >= 0){
					$(".switcharea-out-number").show();
					$(".switcharea-apply").hide();
					$(".switcharea-number").hide();/*显示我的俱乐部的内容*/
				}
			});
		});
		

		function login(a) {
			window.location="/w/rl.htm?shopId=68&hl=ko-KR&custId="+a;
		}

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
 			
 			loadingShow();
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intClbsq : intClbsq
 			 	 			,intClbjinreqsq : intClbjinreqsq
 			 	 			,intJinreqmbrsq : intJinreqmbrsq
 			 	 			,strJobtype : strJobtype
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/clb/clbMbrSave.htm",
 					success : function(data) {

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
		
	</script>
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
	</body>
</html>