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
						<p class="word-title float">
							♣ WEB USER 신청 관리 페이지
						</p>
					</div>
			</div>
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
				<div class="" style="height:0.7rem;width:100%;">
					<div class="float" style="width:100%;">
						<div class="list68 flex" style="padding:0;">
							<p class="flex1 switch-btn switch-btn1 active" ><span>신규신청</span></p>
							<p><div class="parting-line"></div></p>
							<p class="flex1 switch-btn switch-btn2"><span>승인완료</span></p>
							<p><div class="parting-line"></div></p>
						</div>
					</div>
				</div>
			</div>
			<div class="switcharea-apply">
				<div class="module list-head" style="border-top:none;">
				<ul class="flex">
					<li class="flex2 cell-1 cell">신청번호</li>
					<li class="flex2 cell-2 cell">클럽</li>
					<li class="flex2 cell-3 cell">이름</li>
					<li class="flex2 cell-4 cell">클럽이름</li>
					<li class="flex2 cell-5 cell">ID</li>
					<li class="flex2 cell-6 cell">버튼</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;">
				
				<!-- START Data Loop -->
				<c:forEach var="mbrReqListN" items="${mbrReqListN}" varStatus="status">
				  
					<!-- 가입신청 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${mbrReqListN.REQ_SQ}</li>
						<li class="flex2 cell-2 cell">${mbrReqListN.CLB_SQ}</li>
						<li class="flex2 cell-3 cell">${mbrReqListN.MBR_NM}</li>
						<li class="flex2 cell-4 cell">${mbrReqListN.MBR_CLB_NICK}</li>
						<li class="flex2 cell-5 cell">${mbrReqListN.MBR_ID}</li>
						<li class="flex2 cell-6 cell" onclick="fn_ClbMbrOpen('${mbrReqListN.REQ_SQ}', '${mbrReqListN.CLB_SQ}', '${mbrReqListN.MBR_NM}', '${mbrReqListN.MBR_ID}', '${mbrReqListN.PASS_ORG}', '${mbrReqListN.PASS}', '${mbrReqListN.CMT}');">승인</li>
						
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
					<li class="flex2 cell-1 cell">신청번호</li>
					<li class="flex2 cell-2 cell">클럽</li>
					<li class="flex2 cell-3 cell">이름</li>
					<li class="flex2 cell-4 cell">클럽이름</li>
					<li class="flex2 cell-5 cell">ID</li>
					<li class="flex2 cell-6 cell">버튼</li>
				</ul>
				</div>
				<div class="module" style="border-top:none;background:#fff;">
				
				
				<!-- START Data Loop -->
				<c:forEach var="mbrReqListY" items="${mbrReqListY}" varStatus="status">  
					
					<!-- 회원 -->
					<ul class="flex list78 ul-list word">
						<li class="flex2 cell-1 cell">${mbrReqListY.REQ_SQ}</li>
						<li class="flex2 cell-2 cell">${mbrReqListY.CLB_SQ}</li>
						<li class="flex2 cell-3 cell">${mbrReqListY.MBR_NM}</li>
						<li class="flex2 cell-4 cell">${mbrReqListY.MBR_CLB_NICK}</li>
						<li class="flex2 cell-5 cell">${mbrReqListY.MBR_ID}</li>
						<li class="flex2 cell-6 cell" onclick="fn_ClbMbrOpen('${mbrReqListY.REQ_SQ}', '${mbrReqListY.CLB_SQ}', '${mbrReqListY.MBR_NM}', '${mbrReqListY.MBR_ID}', '${mbrReqListY.PASS_ORG}', '${mbrReqListY.PASS}', '${mbrReqListY.CMT}');">승인</li>
					</ul>
				
				 </c:forEach>
				<!-- END Data Loop -->
				
				
				</ul>
				<ul class="flex list90 ul-list" style="border-bottom:none;padding-bottom:0.6rem;">

				</ul>
				</div>
			</div>
			
			

		<div class="pop-up-wrap" style="display:none;">
<%-- 			<p class="flex1 title-icon">${label.个人信息}</p> --%>

			<div class="pop-up-content">
				<div class="inp-wrap">
					<p>신청번호</p>
					<input class="textboxcontent" type="text" id="mbrReqListREQ_SQ" value=""  readonly="true"/>
				</div>
				<div class="inp-wrap">
					<p>클럽</p>
					<input class="textboxcontent" type="text" id="mbrReqListCLB_SQ" value=""  readonly="true"/>
				</div>
				<div class="inp-wrap">
					<p>이름</p>
					<input class="textboxcontent" type="text" id="mbrReqListMBR_NM" value=""/>
				</div>
				<div class="inp-wrap">
					<p>아이디</p>
					<input class="textboxcontent" type="text" id="mbrReqListMBR_ID" value=""/>
				</div>
				<div class="inp-wrap">
					<p>비밀번호</p>
					<input class="textboxcontent" type="text" id="mbrReqListPASS_ORG" value=""/>
					<input class="textboxcontent" type="hidden" id="mbrReqListPASS" value=""/>
					<input class="textboxcontent" type="hidden" id="strOpenid" value=""/>
				</div>
				<div class="inp-wrap">
					<p>비고</p>
					<textarea class="textboxcontent" id="mbrReqListCMT" placeholder="请输入内容" readonly="true"></textarea>
				</div>
				<div class="inp-wrap">
					<p>사용자</p>
						<select class="textboxcontent" id="mbrSq" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option value="">선택하세요.</option>	
							<!-- START Data Loop -->
							<c:forEach var="amsMbrList" items="${amsMbrList}" varStatus="status">  
								<option value="${amsMbrList.MBR_SQ}" data-openid="${amsMbrList.OPENID}">${amsMbrList.MBR_NM}[${amsMbrList.WX_NICK}](${amsMbrList.MBR_ID})${amsMbrList.CLB_NM}</option>
							</c:forEach>
							<!-- END Data Loop -->
						</select>
				</div>
				<div class="buttons">
					<span class="cancel" id="spnClbMbrReject" onclick="$('.pop-up-wrap').hide();">취소</span>
					<span class="cancel" id="spnClbMbrReject" onclick="fn_ClbMbrReject($('#mbrReqListREQ_SQ').val());">삭제</span>
					<span id="spnClbMbrSave2" onclick="fn_ClbMbrSave2($('#mbrReqListREQ_SQ').val(), $('#mbrSq').val(), $('#mbrReqListMBR_ID').val(), $('#mbrReqListPASS_ORG').val());">승인</span>
				</div>
			</div>
		</div>			
			
	<script type="text/javascript">
	
		$(function(){
		    $('#mbrSq').change(function(){
		       var selected = $(this).find('option:selected');
		       var openid = selected.data('openid'); 
		       $("#strOpenid").val(openid);
		    });
		});
	
		var vintClbjinreqsq, vintJinreqmbrsq;
	
		$(document).ready(function(){
			$(".switch-btn").on("click",function(){
				$(".switch-btn").removeClass("active");
				$(this).addClass("active");
				if($(this).attr("class").indexOf("switch-btn1") >= 0){
					$(".switcharea-apply").show();
					$(".switcharea-number").hide();
				}
				else if($(this).attr("class").indexOf("switch-btn2") >= 0){
					$(".switcharea-number").show();
					$(".switcharea-apply").hide();
				}
			});
		});
		

 		function fn_ClbMbrOpen(a, b, c, d, e, f, g) {
 			// mbrReqListN.REQ_SQ, mbrReqListN.CLB_SQ, mbrReqListN.MBR_NM, mbrReqListN.MBR_ID, mbrReqListN.PASS_ORG, mbrReqListN.PASS

 			//mbrReqListREQ_SQ, mbrReqListCLB_SQ, mbrReqListMBR_NM, mbrReqListMBR_ID, mbrReqListPASS_ORG, mbrReqListPASS
 			
			$("#mbrReqListREQ_SQ").val(a);
			$("#mbrReqListCLB_SQ").val(b);
			$("#mbrReqListMBR_NM").val(c);
			$("#mbrReqListMBR_ID").val(d);
			$("#mbrReqListPASS_ORG").val(e);
			$("#mbrReqListPASS").val(f);
			$("#mbrReqListCMT").val(g);
			
 			$(".pop-up-wrap").show();
		}
 		function GetTodayDate() {
 		   var tdate = new Date();
 		   var dd = tdate.getDate(); //yields day
 		   var MM = tdate.getMonth(); //yields month
 		   var yyyy = tdate.getFullYear(); //yields year
 		   var currentDate= yyyy + "-" +( MM+1) + "-" + dd;

 		   return currentDate;
 		}
 		
 		function fn_ClbMbrSave2(a,b,c,d) {
 			var jopType = "U"
 	 		
 				if (b == "") {
 					alert("사용자를 선택하세요.");
 					return;
 				}
 			
 				var openid = $("#strOpenid").val();
 				var today = GetTodayDate();
 				var strMbrnm = $("#mbrReqListMBR_NM").val();
 				
 	 			loadingShow();
 				$.ajax({
 			 	 		data:{
 			 	 			strJobtype : jopType
 			 	 			,intNtesq : a
 			 	 			,intMbrsq : b
 			 	 			,strMbrid : c
 			 	 			,strMbrpw : d
 			 	 			,strLnkactid : openid
 			 	 			,datRegdt : today
 			 	 			,strMbrnm : strMbrnm
 			 	 		},
 						type : "POST",
 						url : "/front/bbc/mbr/userAddSave.htm",
 						success : function(data) {
 							loadingHide();
 							window.location = "/front/bbc/clb/mbrReqList.htm";
 						},
 						error : function(xhr, status, e) {
 							loadingHide();
 							alert("Error : " + status);
 						}
 				});
		}

 		function fn_ClbMbrReject(a) {
			
 			var jopType = "D"
 			
 			loadingShow();
			$.ajax({
		 	 		data:{
		 	 			strJobtype : jopType
		 	 			,intNtesq : a
		 	 		},
					type : "POST",
					url : "/front/bbc/mbr/userAddSave.htm",
					success : function(data) {
						loadingHide();
						window.location = "/front/bbc/clb/mbrReqList.htm";
					},
					error : function(xhr, status, e) {
						loadingHide();
						alert("Error : " + status);
					}
			});
			
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
	
		<a href="/front/bbc/mbr/myPage.htm" class="r_pg_top show">홈으로</a>
		<%@ include file="/front/bbc/inc/loading.jsp"%>
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
		 
	</body>
</html>