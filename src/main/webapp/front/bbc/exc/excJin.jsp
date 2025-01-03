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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${label.参加活动}</title>
    <link rel="stylesheet" type="text/css" href="../css/font.css" />
    <!--字体图标：公用-->
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <!--reset：公用-->
    <link rel="stylesheet" type="text/css" href="../css/common.css" />
    <!--公共：公用-->
    <link rel="stylesheet" type="text/css" href="../css/button.css" />
    <!--按钮：公用-->
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <!--jquery公用-->
    <script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
    <!--rem公用-->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
    <style>
	    .app-header .logo img {
	    	width: 0.60rem;
	    }
	    .app {
	    	padding-top: 0;
	    }
	    .app-header {
	    	position: relative;
	    }
	    .imgTab img {
		    height: 0.5rem;
		    width: auto;
		    display: inline-block;
	    }
	    .imgTab img:last-of-type {
	    	border: 0;
	    }
	    .imgPf {
		    height: 0.5rem;
		    width: auto;
	    }
	    .riskTitle > div > span:first-of-type {
	    	font-weight: initial;
		}
    </style>  
    <script>
	    $(function() {
			//if($("body > div").attr("id") === 'appExcJin') {
			  // 这里是生成header
			  var htm = '<header class="app-header"><div class="logo"><image src="${amsExcList.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsExcList.HME_CLB_NM}</div></header>'
			  $("#appExcJin").prepend(htm)
			//}
			$(".app-header").click(function() {
				window.location.href='/front/bbc/exc/excDoList.htm';
			});
		});
    </script>
</head>
<body>
<div class="app scheduleManagement">
	<div class="content">
		<div class="scroll-wrap refresh-wrap" id="appExcJin">
			<div class="container1" id="tableWrap">
				<div class="table-wrap">
					<div class="table">
						<table class="drag-table" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
							<colgroup>
                  				<col width="23%" />
                  				<col width="77%" />
                  			</colgroup>
                  			<tr>
                    			<th colspan="2"><img src="../image/purpleDoshed.png" class="tipColor mr6"></img><span class="fontBlack" id="blueTitle">${amsExcList.EXC_TP_NM}</span></th>
                  			</tr>
                  			<tr>
                    			<td>${label.俱乐部}</td><!-- 클럽 -->
                    			<td>
                    				<div class="tab-img">
                    					<img src="${amsExcList.CLB_MAI_IMG_PTH}" style="border: 0;height: 0.4rem;"/>
                    					<span style="text-decoration: underline;" onclick="window.location.href='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsExcList.HME_CLB_SQ}';">${amsExcList.HME_CLB_NM}</span>
                    				</div>
                  				</td>
                  			</tr>
                  			<tr>
                    			<td>${label.场地}</td><!-- 경기장 -->
                    			<td style="font-weight:bold;">
                    				<div class="tab-img">
                    					<img src="../image/downLoad9.gif" style="border: 0;height: 0.4rem;"/>
                    					<span>${amsExcList.EXC_TIT}</span>
                    					<img src="../image/downLoad9.gif" style="border: 0;height: 0.4rem;"/>
                    					<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    					<span ${amsExcList.MAP_URL}>${label.查看地图}</span>
                  					</div>
                  				</td>
                  			</tr>
                  			<tr>
                    			<td>${label.时日}</td><!-- 시간 -->
                    			<td style="font-weight:bold;">${amsExcList.EXC_DATE} , ${amsExcList.EXC_FR_TIME}~${amsExcList.EXC_TO_TIME} ${amsExcList.WEEKNAME}</td>
                  			</tr>
                  			<tr>
                    			<td>${label.活动介绍}</td>
                    			<td><pre style="white-space: pre-wrap;line-height: 1.4;">${amsExcList.EXC_DCT}</pre></td>
                  			</tr>
                  			<c:if test="${amsExcList.EXC_TP == '1002'}">
                  			<tr>
                    			<td>${label.参与人员}</td><!-- 참여인원 -->
                    			<td>${amsExcList.ATD_CNT}</td>
                  			</tr>
                  			</c:if>
                  			<c:if test="${amsExcList.EXC_TP != '1003'}">
				                <c:if test="${loginMbrSq == 20}">
		                  			<tr>
		                    			<td>${label.预测}${label.参与人员}</td><!-- 참여인원 -->
		                    			<td>최소 ${amsExcList.BCNT} 명 ~ 최대 ${amsExcList.CCNT} 명  (<span onclick="window.location.href='/front/bbc/exc/getPage.htm?pageName=page5&intClbsq=${amsExcList.HME_CLB_SQ}&para3=${amsExcList.EXC_DATE}';">자세히보기<span></span>)</td>
		                  			</tr>
				                </c:if>
                  			</c:if>
                  			<tr>
                    			<td>${label.参加人员}</td>
                    			<td>
									<c:if test="${amsExcList.EXC_TP == '1003'}">
										${label.参与}: <span style="font-size: 0.3rem;">${amsExcList.JIN_EXC_CNT}</span>, 응원: ${amsExcList.JIN_VT_CNT}, 미정: ${amsExcList.JIN_LES_CNT}, ${label.不参加}: ${amsExcList.JIN_NO_CNT}
									</c:if>
									<c:if test="${amsExcList.EXC_TP != '1003'}">
										${label.正常}: <span style="font-size: 0.3rem;">${amsExcList.JIN_EXC_CNT}</span>${label.个人}, ${label.培训}: ${amsExcList.JIN_LES_CNT}${label.个人}, ${label.取消}: ${amsExcList.JIN_NO_CNT}${label.个人}
									</c:if>	
                    			</td>
                  			</tr>
                  			<tr>
                    			<td>${label.创建}</td>
                    			<td style="font-weight:bold;">
                    				<div class="buttons" style="padding: 0;">
						                ${amsExcList.CLB_NIK_NM}
						                <c:if test="${(amsExcList.CLB_GD == 'A') || amsClb.amsExcList == 'B' || amsExcList.REG_MBR_SQ == loginMbrSq}">
						                	<div id="delEsc" class="blueBtn subBtn f-col font26" style="padding: 0.2rem 0.1rem;margin-left: 0.4rem;">${label.内容}${label.修改}</div>
						                </c:if>
				              		</div>
                    			</td>
                  			</tr>
                		</table>
              		</div>
            	</div>
         
          		<div class="btn-wrap">
          	  		<div class="buttons">
                		<div id="btn2" class="blueBtn subBtn f-col font26">${label.安排车辆}</div>
						<c:if test="${amsExcList.CLB_GD == 'A' || amsClb.amsExcList == 'B'}">
                		<div id="btn4" class="blueBtn subBtn f-col font26">게스트등록</div>
						</c:if>  
                		<div id="btn" class="orangeBtn subBtn f-col font26">${label.参加活动}</div>
              		</div>
            	</div>
			</div>
          
			<c:if test="${amsJinList.size() >= 0 }">
        	<div class="container refresh-wrap f-column">
          		<div class="tabHead pb22">
            		<div class="tabSelected" onclick="changeTab(this, 1, 0)">${label.排时间}</div>
            		<div onclick="changeTab(this, 2, 0)">${label.排序排名}</div>
          		</div>
          		<div id="tab1" class="f-col">

            		<ul class="tabAllList">
            
						<c:forEach var="amsJinList" items="${amsJinList}" varStatus="status">
						
							<c:set var="excJinDeleteTag" value="" />
							
							<c:if test="${amsJinList.EXC_JIN_TP == 7}">
								<c:set var="excJinDeleteTag" value="background-color: #eaeaea;" />
							</c:if>
							
							<li style="${excJinDeleteTag}background-image: url(${amsJinList.MBR_MAI_IMG_PTH});background-repeat: no-repeat;background-size: 0.8rem;background-position: 0 0.28rem;">
                				<div class="title" style="margin-left: 1rem;">
                  					<div class="date-wrap">
                    					${amsJinList.NEWTAG }
                    					<div class="imgTab">
                      						<img src="/front/bbc/img/em/${amsJinList.EM_TYPE}.gif" />
                      						<span onclick="gotoMbrPageMonth('${amsJinList.MBR_NM}', '${amsJinList.CLB_SQ}', '${amsJinList.MBR_SQ}', '${amsExcList.EXC_DATE}');" style="font-size: 0.3rem;position: absolute;top: 0.12rem;padding-left: 0.2rem;">
                      							<c:if test="${amsJinList.EXC_JIN_TP == 7 and amsJinList.EXC_TP != '1003' and amsJinList.RANKING > 0}">[대기 ${amsJinList.RANKING} 순위]</c:if>
                      							${status.count}.${amsJinList.MBR_NM}${amsJinList.DAILY_FEE_TAG}
                      						</span>
                    					</div>
                      					<span onclick="changeTab(this, 3, ${amsJinList.MBR_SQ})" style="font-size: 0.2rem;">${label.写留言}</span>
                  					</div>
                  					<div class="riskTitle">
                    					<div style="max-width: 4.6rem;">
                    						<span style="line-height: 1.3;font-size: 0.28rem;"><!--  onclick="fnTranslate($(this).text(), 'org');" --> <c:if test="${amsJinList.EXC_JIN_TP == 7 and amsJinList.EXC_TP != '1003' and amsJinList.RANKING > 0}">대기</c:if>${amsJinList.EXC_JIN_CMT} </span>
                    						
											<c:if test="${amsJinList.MBR_SQ eq loginMbrSq || (amsExcList.CLB_GD == 'A' || amsClb.amsExcList == 'B')}">
											<span onclick="fn_ExcJinDelOpen('${amsJinList.MBR_SQ}');" style="border-radius: 4px;border: 1px solid #ec8921;padding-left: 0.1rem;padding-right: 0.1rem;background-color: #ec8921;color: #FFFFFF;">${label.删除}</span>
											</c:if>                      						
                      						
					  						<c:if test="${amsJinList.EM_TYPE ne '9'}">
												<c:if test="${amsJinList.MBR_SQ != loginMbrSq}"><span></span></c:if>
					  						</c:if>
                    					</div>
                      					<span style="text-align: right;">${amsJinList.REGDT2}</span>
                  					</div>
                				</div>
                				<div class="gray-model" style="display:none;" id="gray-model${amsJinList.MBR_SQ}">
									<c:set var="displayReply" value="N" />
									<c:forEach items="${amsJinListReply }" var="reply" varStatus="status">
										<c:if test="${reply.MBR_SQ  eq amsJinList.MBR_SQ}">
                							<p style="line-height: 0.4rem;position: relative;"><!--  onclick="fnTranslate($(this).text(), 'org');" -->
                								<span style="font-weight: bold;">${reply.CLB_NIK_NM}</span> : ${reply.EXC_JIN_CMT}
                								<c:if test="${reply.MBR_SQ_CMT  eq loginMbrSq}">
                								&nbsp;<span class="delBtn" onclick="delCarMsg('${reply.REPLY_SQ}');" style="padding: 0 0.14rem;margin-top: 0.05rem;float: right;line-height: 0.3rem;}">${label.删除}</span>
                								</c:if>
                							</p>
											<c:set var="displayReply" value="Y" />
										</c:if>
									</c:forEach>
									<c:if test="${displayReply  eq 'Y'}">
										<script>$("#gray-model${amsJinList.MBR_SQ}").show();</script>
									</c:if>
                				</div>
              				</li>  
						</c:forEach>
              
              			<li style="padding-bottom:2rem;">
                			<br>
                			<br>
                			<br>
              			</li>  
            		</ul>
          		</div>

          		<div id="tab2" style="display: none;" class="scroll-wrap f-col">
            		<ul class="tabAllList">
						<c:forEach var="amsJinList" items="${amsJinListRank}" varStatus="status">
							<c:set var="excJinDeleteTag" value="" />
							<c:if test="${amsJinList.EXC_JIN_TP == 7 and amsJinList.EXC_TP != '1003'}">
								<c:set var="excJinDeleteTag" value="background-color: #eaeaea;" />
							</c:if>
							<c:if test="${amsJinList.EM_TYPE ne '9' and amsJinList.EM_TYPE ne '7'}">
              					<li style="${excJinDeleteTag}">
                					<div class="title">
                  						<div class="date-wrap">
                    						<div class="imgTab">
                      							<img src="/front/bbc/img/em/${amsJinList.EM_TYPE}.gif" />
                      							<span onclick="gotoMbrPage('${amsJinList.MBR_NM}', '${amsJinList.CLB_SQ}', '${amsJinList.MBR_SQ}');" style="font-size: 0.3rem;position: absolute;top: 0.12rem;padding-left: 0.2rem;">${status.count}.${amsJinList.MBR_NM}${amsJinList.DAILY_FEE_TAG}</span>
                    						</div>
                    						<div class="imgTab">
					  							<c:if test="${amsJinList.CLB_GD eq 'E'}">
                      								<img src="/front/bbc/image/c.jpg" />
					  							</c:if>
					  							<c:if test="${amsJinList.CLB_GD eq 'F'}">
                      								<img src="/front/bbc/image/e.jpg" />
					  							</c:if>
					  							<c:if test="${amsJinList.CLB_GD ne 'E' && amsJinList.CLB_GD ne 'F'}">
    	                  							<span style="font-size: 0.3rem;position: absolute;top: 0.12rem;right: 0.7rem;">
	                      								${amsJinList.CLB_RANK}${label.位 }
                      								</span>
					  							</c:if>
                      							<img src="${amsJinList.MBR_MAI_IMG_PTH}" />
                    						</div>
                  						</div>
                  						<div class="riskTitle">
                    						<div style="min-width: 3rem;">
                      							<span><!--  onclick="fnTranslate($(this).text(), 'org');" --> ${amsJinList.EXC_JIN_CMT} </span>
                      							<span></span>
                    						</div>
                    						<span>${amsJinList.REGDT2}</span>
                  						</div>
                					</div>
              					</li>  
							</c:if>
						</c:forEach>
              			<li style="padding-bottom:2rem;">
                			<br>
                			<br>
                			<br>
              			</li>  
            		</ul>
          		</div>

          		<div id="tab3" style="display: none;" class="f-col">
            		<div class="tabContent" style="padding-bottom: 2rem;">
              			<div>
                			<textarea class="textWord fontBlack font20" id="replyText" name="replyText" placeholder="텍스트를 입력해 주세요. (请输入内容)" cols="80" rows="10"></textarea>
                			<input type="hidden" id="replyMbrsq" />
              			</div>
	          			<div class="btn-wrap">
	          	  			<div class="buttons">
	                			<div onclick="fn_ExcJinReg();" id="fn_ExcJinReg" class="orangeBtn subBtn f-col font26" >${label.发布留言}</div>
	              			</div>
	            		</div>
            		</div>
          		</div>

          		<div id="tab4" style="display: none;" class="f-col">
            		<div class="tabContent" style="padding-bottom: 2rem;">
              			<div style="padding: 0.3rem;border: solid 1px #c0c0c0;">
                			<input class="textWord fontBlack font20" type="text" placeholder="게스트 이름을 입력하세요." id="gName" style="line-height: 0.8rem;margin-bottom:5px;" value=""/>
                			<input class="textWord fontBlack font20" type="tel" placeholder="게스트 코인을 입력하세요." id="gCoin" style="line-height: 0.8rem;margin-bottom:5px;" value=""/>
                			<input class="textWord fontBlack font20" type="text" placeholder="코멘트를 입력하세요." id="gCmtCmt" style="line-height: 0.8rem;margin-bottom:5px;" value=""/>
              			</div>
	          			<div class="btn-wrap">
	          	  			<div class="buttons">
	                			<div onclick="fn_gSave();" id="fn_gSave" class="orangeBtn subBtn f-col font26" >게스트 등록</div>
	              			</div>
	            		</div>
            		</div>
          		</div>
        	</div>     
	  		</c:if>
		</div>
      
	</div>
</div>

<div class="message-pop" style="display:none;">
	<div class="message-content">
		<div class="message-header">${label.不参加}</div>
		<div class="message">
			<span style="padding-bottom:0.2rem;">${label.确认不再参加这次活动了吗}？</span>
			<input class="textWord fontBlack font20" type="text" placeholder="${label.请输入不参加原因}" id="delCmt" style="line-height: 0.8rem;margin-bottom:5px;" value=""/>
			<input type="hidden" id="delMbrsq" />
		</div>
		<div class="message-button">
			<div class="cancel" onclick="$('.message-pop').hide()">${label.取消}</div>
			<div class="confirm" onclick="fn_ExcJinDel($('#delMbrsq').val(), $('#delCmt').val())">${label.确认}</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function changeTab(el, index, userId){
  		$(".tabSelected").removeClass("tabSelected");
	  	$(el).addClass("tabSelected");
	  	$("#replyMbrsq").val(userId);
	  	if(index == 1) {
		  $("#tab4").hide();
	      $("#tab3").hide();
	      $("#tab2").hide();
	      $("#tab1").show();
	  	} else if(index == 2) {
	  	  $("#tab1").hide();
	      $("#tab2").show();
	      $("#tab3").hide();
		  $("#tab4").hide();
	  	} else if(index == 3) {
	      $("#tab1").hide();
	      $("#tab2").hide();
	      $("#tab3").show();
		  $("#tab4").hide();
  		} else if(index == 4) {
	      $("#tab1").hide();
	      $("#tab2").hide();
	      $("#tab3").hide();
		  $("#tab4").show();
	  	}
	}

	function gotoMbrPageMonth(name, CLB_SQ, MBR_SQ, dt) {
		  messageBox({
		    title: '확인',
		    message: name+'님의 월간 참석 현황 페이지로 이동하시겠습니까?',
		    type: 'confirm',
		    callback: function() {
		    	window.location.href='/front/bbc/clb/clbMbrMonthly.htm?intClbsq='+CLB_SQ+'&intMbrsq='+MBR_SQ+'&datFrdt='+dt.substring(0,7);
		    }
		  })
	}

	function gotoMbrPage(name, CLB_SQ, MBR_SQ) {
		  messageBox({
		    title: '확인',
		    message: name+'님의 개인 페이지로 이동하시겠습니까?',
		    type: 'confirm',
		    callback: function() {
		    	window.location.href='/front/bbc/clb/clbMbrCard.htm?intClbsq='+CLB_SQ+'&intMbrsq='+MBR_SQ;
		    }
		  })
	}
	
	$(document).ready(function(){
		$("#btn3").click(function(){
			window.location = '/front/bbc/exc/msgDoList.htm?intClbsq=${amsExcList.HME_CLB_SQ}';
		});
		$("#btn2").click(function(){
			window.location = '/front/bbc/exc/excJinCar.htm?intExcsq=${intExcsq}';
		});
		$("#btn").click(function(){
			window.location = '/front/bbc/exc/excJinSave.htm?intExcsq=${intExcsq}';
		});
		$("#btn4").click(function(){
			changeTab(this, 4, 0);
		});
	});
			
	
	function fn_ExcJinDelOpen(intMbrsq) {
		$('#delMbrsq').val(intMbrsq);
		$(".message-pop").show();
		
	}
	
	
 	function fn_ExcJinDel(intMbrsq, cmt) {

		if (cmt == "") {
			alert("${label.请输入不参加原因}");
			return;
		}
		
		var intExcsq = "${intExcsq}";
		var strJobtype = "I";
		var intExcjintp = "7";
		var strExcjincmt = "[${label.不参加}] " + cmt;

		<c:if test="${amsExcList.EXC_SQ_ING > 0}">
			alert('${label.已经开始运动}. ${label.不能删除}!');
			return;
		</c:if>

		var load = loading();
		load.show()
 			
 		$.ajax({
 		 		data:{
 		 	 			intExcsq : intExcsq
 		 	 			,strJobtype : strJobtype
 		 	 			,intExcjintp : intExcjintp
 		 	 			,strExcjincmt : strExcjincmt
 		 	 			,intMbrsq : intMbrsq
 		 	 		},
 				type : "POST",
 				url : "/front/bbc/exc/excJinRegSaveG.htm",
 				success : function(data) {
 		   			window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
 				},
 				error : function(xhr, status, e) {
 					load.hide()
 					alert("Error : " + status);
 				}
 		});
 	}			
		

	function delCarMsg(intMbrsq) {

		messageBox({
			title : '확인',
			message : '삭제하시겠습니까?',
			type : 'confirm',
			callback : function() {
				fn_ExcReplyDel(intMbrsq);
			}
		})
	}	
	

 	function fn_ExcReplyDel(intMbrsq) {

 		var intExcsq = "${intExcsq}";
 		var strJobtype = "X";

		<c:if test="${amsExcList.EXC_DATE < amsExcList.TODAY}">
			alert("날짜가 지난 운동공지 입니다. 일자를 확인하세요.");
			return;
		</c:if>
		
 		var load = loading();
 		load.show()
 			
 		$.ajax({
 			data:{
 		 			intExcsq : intExcsq
 		 			,strJobtype : strJobtype
 		 			,intMbrsq : intMbrsq
 			},
 			type : "POST",
 			url : "/front/bbc/exc/excJinReplySave.htm",
 			success : function(data) {
 				window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
 			},
 			error : function(xhr, status, e) {
 				load.hide()
 				$("#fn_ExcJinReg").show();
 				alert("Error : " + status);
 			}
 		});
 	}		
 	

 	function fn_gSave() {

 		var gName = $('#gName').val();
 		var gCoin = $('#gCoin').val();
 		var intClbsq = "${amsExcList.HME_CLB_SQ}";
 		var intExcsq = "${intExcsq}";
 		var strExcjincmt = $('#gCmtCmt').val();

 		if (gName == "") {
     		alert("게스트 이름을 입력하세요.");	
     		return;
 		}

 		if (gCoin == "") {
     		alert("초기 코인을 입력하세요.");	
     		return;
 		}
 		
 		$("#fn_gSave").hide();

 		var load = loading();
 		load.show()
 			
 		$.ajax({
 			data:{
 					intClbsq : intClbsq
 		 			,strClbniknm : gName
 		 			,intClbbbc : gCoin
 		 			,intExcsq : intExcsq
		 	 		,strExcjincmt : strExcjincmt
 			},
 			type : "POST",
 			url : "/front/bbc/exc/clbExcJinGsave.htm",
 			success : function(data) {
 				window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
 			},
 			error : function(xhr, status, e) {
 				load.hide()
 				$("#fn_gSave").show();
 				alert("Error : " + status);
 			}
 		});
 	}		
 	
 	function fn_ExcJinReg() {

 		var intExcsq = "${intExcsq}";
 		var strExcjincmt = $('#replyText').val();
 		var intMbrsq = $('#replyMbrsq').val();
 		var strJobtype = "R";

 		if (strExcjincmt =="") {
     		alert("${label.请输入您的备注信息}.");	
     		return;
 		}

 		$("#fn_ExcJinReg").hide();

 		var load = loading();
 		load.show()
 			
 		$.ajax({
 			data:{
 		 			intExcsq : intExcsq
 		 			,strExcjincmt : strExcjincmt
 		 			,strJobtype : strJobtype
 		 			,intMbrsq : intMbrsq
 			},
 			type : "POST",
 			url : "/front/bbc/exc/excJinReplySave.htm",
 			success : function(data) {
 				window.location.href="/front/bbc/exc/excJin.htm?intExcsq=${intExcsq}";
 			},
 			error : function(xhr, status, e) {
 				load.hide()
 				$("#fn_ExcJinReg").show();
 				alert("Error : " + status);
 			}
 		});
 	}			


	$("#delEsc").click(function(){
		window.location = '/front/bbc/exc/excView.htm?intExcsq=${intExcsq}';
	});
	
	
	
 	function fnTranslate(msg, tranType) {

 		var load = loading();
 		load.show()
 			
 		$.ajax({
 			data:{
 				para1 : msg
		 		,para2 : "kor"
			 	,para3 : "zh"
				,para4 : tranType
 			},
 			type : "POST",
 			url : "/front/bbc/clb/translate.htm",
 			success : function(data) {
 				load.hide();
 				
 				if (tranType == 'org') {
 	 				messageBox({
 	 					title : 'Translate to [' + data.to + ']',
 	 					message : data.trans_result[0].dst + '<br><br>[' + data.from + ']으로 재 번역 하시겠습니까?',
 	 					type : 'confirm',
 	 					callback : function() {
 	 						setTimeout(function() {
 	 							fnTranslate(msg, 'convert');
 	 						}, 500);
 	 					}
 	 				})
 				}
 				else {

 	 				messageBox({
 	 					title : 'Translate to [' + data.to + ']',
 	 					message : data.trans_result[0].dst,
 	 					type : 'alert',
 	 					callback : function() {}
 	 				})
 				}
 				
 			},
 			error : function(xhr, status, e) {
 				load.hide();
 			}
 		});
 	}	
 		
		
</script>

</body>
</html>