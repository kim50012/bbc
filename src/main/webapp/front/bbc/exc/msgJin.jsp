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
		<title>회원 참여 공지 상세</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<link rel="stylesheet" type="text/css" href="../css/jquery.typeahead.css"/>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery.typeahead.js" type="text/javascript" charset="utf-8"></script>
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

<!-- 						<div class="flex Participant-title" style="position:absolute;right:0.25rem;"> -->
<!-- 							<p class="flex1">&nbsp;</p> -->
<%-- 							<c:if test="${(amsExcList.CLB_GD == 'A') || amsClb.amsExcList == 'B' || amsExcList.REG_MBR_SQ == loginMbrSq}"> --%>
<%-- 								<button id="delEsc" class="btn-join">${label.内容}${label.修改}</button> --%>
<%-- 							</c:if> --%>
<!-- 						</div> -->
						<div class="list flex row1" style="padding-top:0.2rem;"><span class="text-outline">${amsExcList.EXC_TP_NM}</span></div>
						<div class="list flex row1"><span class="text-outline">${label.日期}：</span><p>${amsExcList.EXC_DATE}</p></div>
<%-- 						<c:if test="${amsExcList.EXC_TP == '1002'}"> --%>
<%-- 							<div class="list flex row1"><span class="text-outline">${label.参与人员}：</span><p>${amsExcList.ATD_CNT}</p></div> --%>
<%-- 						</c:if> --%>
						<div class="list flex row1 le">
							<span class="nowrap text-outline">${label.活动介绍}：</span>
							<p class="flex1">
								&nbsp;
							</p>
						</div>
						<div class="list flex row1 le" style="padding:0.2rem;line-height:0.4rem">
							<pre style="white-space: pre-wrap;">${amsExcList.EXC_DCT}</pre>
						</div>
						<div class="flex Participant-title top-dashed">
							<p class="flex1 title-icon">${label.参加人员}</p>
						</div>
						<div class="flex Participant-title" style="padding-top: 0;padding-bottom: 0.2rem;">
							<p class="flex1">&nbsp;&nbsp;&nbsp;(${label.共} ${amsExcList.JIN_CNT}${label.个人})</p>
							<c:if test="${amsExcList.EXC_TP == '1001'}">
								<button id="btn" class="btn-join" style="margin-top: 0;">구매신청</button>
							</c:if>
							<c:if test="${amsExcList.EXC_TP == '1002'}">
								<button id="btn" class="btn-join" style="margin-top: 0;">회비납부</button>
							</c:if>
							<c:if test="${amsExcList.EXC_TP == '1003'}">
								<button id="btn" class="btn-join" style="margin-top: 0;">의견달기</button>
							</c:if>
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
							
							<div class="list78 noborder bottom-dashed flex hang" data-intMsgSq="${amsJinList.MSG_SQ}" style="padding:0;">
								<p class="member-head-wrap <c:if test="${amsJinList.MBR_SQ == loginMbrSq}"> del</c:if>"><img class="member-head" src="${amsJinList.MBR_MAI_IMG_PTH}"/></p>
								<p class="flex1"  style="padding-top: 0.1rem;line-height: 0.3rem;max-width:75px;"><span class="${amsJinList.GND_DV_TAG}"></span>${amsJinList.MBR_NM}<br>
									<font style="color: #bfbaba;font-size: 0.2rem; padding-left: 0.2rem;">${amsJinList.REG_DT}</font>
								</p>
								<p class="flex1" onclick="alert($(this).html());">${amsJinList.EXC_JIN_CMT}</p>
								<p class="flex1 right" style="max-width:50px;" onclick="fn_ExcJinStatusUpdate('${amsJinList.MSG_SQ}', '${amsJinList.MBR_SQ}');">${amsJinList.EXC_JIN_DLY} <c:if test="${amsExcList.EXC_TP == '1001'}">통</c:if><c:if test="${amsExcList.EXC_TP == '1002'}">개월</c:if></p>
							</div>
						
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
						회원 이름
					</div>
					<div class="month float" style="height:0.7rem;line-height:0.7rem;margin-right:0.1rem;">
				        <div class="typeahead__container">
				            <div class="typeahead__field">
					            <span class="typeahead__query" style="padding-top:0.07rem;">
					                <input id="strMbrnm"
					                	   name="q"
					                       type="search"
					                       autofocus
					                       autocomplete="off"
					                       placeholder="${label.输入姓名}"
					                       value="${strMbrnickname }"
					                       class="name-input" style="margin-bottom:0.02rem;height: 0.59rem;"

											<c:if test="${(amsExcList.CLB_GD != 'A') && amsClb.amsExcList != 'B' && amsExcList.REG_MBR_SQ != loginMbrSq}">
												readonly
											</c:if>					                       
					                       >
					            </span>
				            </div>
				        </div>
					</div>
					<input type="hidden" id="intMbrsq" value="${loginMbrSq}"/>
					
				<c:if test="${amsExcList.EXC_TP == '1001'}">
					<div class="inp-wrap" style="padding-top:0.1rem;border-bottom: 1px dashed #d2d2d2;${excJintpTag }">
						구매 신청
					</div>
					<div class="inp-wrap" style="${excJintpTag }">
						<select class="textboxcontent" id="intExcjindly" style="width:100%;color:#000;padding-right: 0;flex: 1;">
							<option value="1">1 통</option>
							<option value="2">2 통</option>
							<option value="3">3 통</option>
							<option value="4">4 통</option>
							<option value="5">5 통</option>
							<option value="6">6 통</option>
							<option value="7">7 통</option>
							<option value="8">8 통</option>
							<option value="9">9 통</option>
							<option value="10">10 통</option>
						</select>
					</div>
				</c:if>

				<c:if test="${amsExcList.EXC_TP == '1002'}">
					<div class="inp-wrap" style="padding-top:0.1rem;border-bottom: 1px dashed #d2d2d2;${excJintpTag }">
						회비 납부
					</div>
					<div class="inp-wrap" style="${excJintpTag }">
						<select class="textboxcontent" id="intExcjindly" style="width:100%;color:#000;padding-right: 0;flex: 1;">
							<option value="1">1 개월</option>
							<option value="2">2 개월</option>
							<option value="3">3 개월</option>
							<option value="4">4 개월</option>
							<option value="5">5 개월</option>
							<option value="6">6 개월</option>
							<option value="7">7 개월</option>
							<option value="8">8 개월</option>
							<option value="9">9 개월</option>
							<option value="10">10 개월</option>
							<option value="11">11 개월</option>
							<option value="12">12 개월</option>
						</select>
					</div>
				</c:if>
				
				<c:if test="${amsExcList.EXC_TP == '1003'}">
						<select class="textboxcontent" id="intExcjindly" style="display:none;width:100%;color:#000;padding-right: 0;flex: 1;">
							<option value="0">0</option>
						</select>
				</c:if>
				
				<div class="inp-wrap" style="border-bottom: 1px dashed #d2d2d2;">
					${label.备注}
				</div>
				<div class="inp-wrap">
					<textarea id="strExcjincmt" style="height: 1rem;" placeholder="${label.请输入您的备注信息}"><c:if test="${amsExcList.EXC_TP == '1001'}">구매신청</c:if><c:if test="${amsExcList.EXC_TP == '1002'}">회비납부</c:if></textarea>
				</div>
				
				<div class="buttons">
					<span>&nbsp;</span>
					<span class="cancel">${label.取消}</span>
					<c:if test="${amsExcList.EXC_TP == '1001'}">
						<span onclick="fn_ExcJinReg();">구매신청</span>
					</c:if>
					<c:if test="${amsExcList.EXC_TP == '1002'}">
						<span onclick="fn_ExcJinReg();">회비납부</span>
					</c:if>
					<c:if test="${amsExcList.EXC_TP == '1003'}">
						<span onclick="fn_ExcJinReg();">댓글입력</span>
					</c:if>
				</div>
			</div>
		</div>
		
		<div class="pop-up-wrap-del" style="display: none;">
			<div class="pop-up-content">
				<div class="inp-wrap-del">
					<input type="hidden" id="del-intMsgsq">

				<c:if test="${amsExcList.EXC_TP == '1001'}">
					구매취소 하시겠습니까?
					<br>취소신청 후 담당자가 확인하여 취소 처리 합니다.
				</c:if>
				<c:if test="${amsExcList.EXC_TP == '1002'}">
					회비 납부를 취소하시겠습니까?
					<br>취소신청 후 담당자가 확인하여 취소 처리 합니다.
				</c:if>
				
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span class="sure" onclick="fn_ExcJinUpdate('D', $('#del-intMsgsq').val(), '${loginMbrSq}', '5');">${label.确认}</span>
				</div>
			</div>
		</div>
		
		<div class="pop-up-wrap" id="popupUpdate" style="display: none;">
			<div class="pop-up-content">
				<div class="inp-wrap-del">
					아래 버튼으로 상태를 변경 하세요.
					<input type="hidden" id="userMbrsq">
					<input type="hidden" id="intMsgsq">
				</div>
				
				<c:if test="${amsExcList.EXC_TP == '1001'}">
					<div class="flex Participant-title" style="padding: 0.2rem;">
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '2');">결재완료</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '3');">배송완료</button>
					</div>
					
					<div class="flex Participant-title" style="padding: 0.2rem;">
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '1');">구매신청</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '4');">취소완료</button>
					</div>
					
					<div class="flex Participant-title" style="padding: 0.2rem;">
						<button class="btn-join" style="margin-top: 0; width: 50%;background: #3a3a3a;" onclick="fn_ExcJinUpdate('D', $('#intMsgsq').val(), $('#userMbrsq').val(), '6');">삭제처리</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-join" style="margin-top: 0; width: 50%;background: #ffffff;">빈버튼</button>
					</div>
				</c:if>
				<c:if test="${amsExcList.EXC_TP == '1002'}">
				
					<div class="flex Participant-title" style="padding: 0.2rem;">
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '1');">확인대기</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '2');">확인완료</button>
					</div>
					
					<div class="flex Participant-title" style="padding: 0.2rem;">
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('U', $('#intMsgsq').val(), $('#userMbrsq').val(), '4');">취소완료</button>
						&nbsp;&nbsp;&nbsp;
						<button class="btn-join" style="margin-top: 0; width: 50%;" onclick="fn_ExcJinUpdate('D', $('#intMsgsq').val(), $('#userMbrsq').val(), '6');">삭제처리</button>
					</div>
				
				</c:if>
				
				<div class="buttons">
					<span class="cancel" onclick="$('#popupUpdate').hide();">${label.取消}</span>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
		

	    var data = ${kewordData};
	    //name, bbc, rank, imgUrl, keyword, id, grade
	    
	    var template = '<span class="row">' +
	    '<span class="avatar">' +
	    '<img class="member-head" src="{{imgUrl}}">' +
	    '</span>' +
	    //'<span class="username">{{name}} <small style="color:#777;">({{id}})</small></span>' +
	    '<span class="username">{{name}} </span>' +
	    ' <span class="id">( {{rank}}${label.位}, {{bbc}}${label.分} )</span>' +
	    '</span>';
	    
	    typeof $.typeahead === 'function' && $.typeahead({
	        input: "#strMbrnm",
	        minLength: 0,
	        maxItem: 8,
	        //order: "asc",
	        cashe: false,
	        searchOnFocus: false,
	        emptyTemplate: 'no result for {{query}}',
	        //display: ["name"],
	        correlativeTemplate: true,
	        templateValue: "{{name}}",
	        source: {
	        	myGroup: {
	                data: data,
	                display: ["name", "keyword"],
	                template: template
	            }
	        },
	        callback: {
	            onClickAfter: function (node, a, item, event) {
	            	$("#intMbrsq").val(item.id);
	            },
	        	onHideLayout: function (node, query) {
	            	if ($("#strMbrnm").val() == "") {
		            	$("#intMbrsq").val("");
	            	}
	            }
	        },
	        debug: true
	    });				
		
		$(document).ready(function(){
			$("#btn").click(function(){
				$('html, body').animate({scrollTop:0}, 1);
				$("#joinExc").show();
			});
			$(".cancel").click(function(){
				$("#joinExc").hide();
			});
			$("#delEsc").click(function(){
				window.location = '/front/bbc/exc/msgView.htm?intExcsq=${intExcsq}';
			});

			$(".del").on("click",function(){
				console.log($(this))
				var el=$(this).parents(".hang")
				console.log(el.attr("data-intMsgSq"));
				$('#del-intMsgsq').val(el.attr("data-intMsgSq"));
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

 		function fn_ExcJinStatusUpdate(intMsgSq, intExcJinSeq) {
			<c:if test="${amsExcList.REG_MBR_SQ == loginMbrSq}">
				$('html, body').animate({scrollTop:0}, 1);
				$('#userMbrsq').val(intExcJinSeq);
				$('#intMsgsq').val(intMsgSq);
				$("#popupUpdate").show();
			</c:if> 			
 		}
		
   		function fn_ExcJinReg() {

   			var intExcjintp = '1';
   			var intExcjindly = $('#intExcjindly').val();
   			
   			var intExcsq = "${intExcsq}";
   			var strExcjincmt = $('#strExcjincmt').val();
   			var strJobtype = "I";
   			var intMbrsq = $('#intMbrsq').val();

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
   			 	 			,intMbrsq : intMbrsq
   			 	 		},
   					type : "POST",
   					url : "/front/bbc/exc/msgJinRegSave.htm",
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

   		    					var htmPc = "";
   		    					if (data.mapResult[i].EXC_TP == '1001') {
   		    						htmPc = "통";
   			 					}
   		    					if (data.mapResult[i].EXC_TP == '1002') {
   		    						htmPc = "개월";
   			 					}
   		    					var htm=''
   		    					+	'<div class="list78 noborder bottom-dashed flex hang" data-intMsgSq="'+data.mapResult[i].MSG_SQ+'" style="padding:0;">'
    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
    						+		'<p class="flex1 right" style="max-width:50px;" onclick="fn_ExcJinStatusUpdate('+data.mapResult[i].MSG_SQ+', '+data.mapResult[i].MBR_SQ+');">'+data.mapResult[i].EXC_JIN_DLY+' '+htmPc+'</p>'
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
   		    			
   					},
   					error : function(xhr, status, e) {
   						loadingHide();
   						alert("Error : " + status);
   					}
   				});
   		}			

   		function fn_ExcJinUpdate(jobType, msgSq, mbrSq, excjintp) {
   			
   			var intExcsq = "${intExcsq}";
   			var strJobtype = jobType;
   			var intMbrsq = mbrSq;
   			var intExcjintp = excjintp;
   			var intMsgsq = msgSq;
   			
   			loadingShow();
   			
   			 $.ajax({
   			 	 		data:{
   			 	 			intExcsq : intExcsq
   			 	 			,strJobtype : strJobtype
   			 	 			,intMbrsq : intMbrsq
   			 	 			,intExcjintp : intExcjintp
   			 	 			,intMsgsq : intMsgsq
   			 	 		},
   					type : "POST",
   					url : "/front/bbc/exc/msgJinRegSave.htm",
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
   		    					
   		    					var htmPc = "";
   		    					if (data.mapResult[i].EXC_TP == '1001') {
   		    						htmPc = "통";
   			 					}
   		    					if (data.mapResult[i].EXC_TP == '1002') {
   		    						htmPc = "개월";
   			 					}
   		    					
   		    					var htm=''
   		    					+	'<div class="list78 noborder bottom-dashed flex hang" data-intMsgSq="'+data.mapResult[i].MSG_SQ+'" style="padding:0;">'
    						+		'<p class="member-head-wrap'+delCss+'"><img class="member-head" src="'+data.mapResult[i].MBR_MAI_IMG_PTH+'"/></p>'
    						+		'<p class="flex1" style="max-width:75px;"><span class="'+data.mapResult[i].GND_DV_TAG+'"></span>'+data.mapResult[i].MBR_NM+'</p>'
    						+		'<p class="flex1" onclick="alert($(this).html());">'+data.mapResult[i].EXC_JIN_CMT+'</p>'
    						+		'<p class="flex1 right" style="max-width:50px;" onclick="fn_ExcJinStatusUpdate('+data.mapResult[i].MSG_SQ+', '+data.mapResult[i].MBR_SQ+');">'+data.mapResult[i].EXC_JIN_DLY+' '+htmPc+'</p>'
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
   		    			alert('${label.保存成功}');
   		    			$(".pop-up-wrap-del").hide();
   		    			$("#popupUpdate").hide();
   						
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
	var msg = "";
	<c:if test="${amsExcList.EXC_TP == '1001'}">
		msg = "\n콕은 미리 미리 사전에 신청 부탁드립니다~ \n구장에서는 No !!";
	</c:if>
	
	
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
			  		    title: '${amsExcList.HME_CLB_NM} ${amsExcList.EXC_TP_NM}' + msg, // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
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
			  		    desc: '${amsExcList.EXC_DATE} ${amsExcList.EXC_TP_NM}' + msg, // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
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

	</body>
	
</html>