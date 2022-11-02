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
		<title>콕 구매 신청</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
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
			<div class="content" style="overflow: hidden;margin: 10px;">
				<div class="module">
					<div class="list68 flex">
						<p class="flex1 title-icon">콕 구매 신청 목록</p>
						<button class="add-btn" onclick="msgConfirm();"></button>
					</div>
				</div>
				
			<!-- START Data Loop -->
			<c:forEach var="amsExcList" items="${amsExcList}" varStatus="status">  
						<p></p>
				<script>
					$("#intClbSq").val("${amsExcList.HME_CLB_SQ}");
				</script>
				<div class="modules">
					<div class="list78 flex">
						<p class="club-logo">
							<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="flex1 row1 word-title">${amsExcList.EXC_DATE} ${amsExcList.EXC_TP_NM}</p>
						<p class="row1">
							<div class="sub-content-title" style="margin:0;">
								<c:if test="${(amsExcList.CLB_GD == 'A') || amsClb.amsExcList == 'B' || amsExcList.REG_MBR_SQ == loginMbrSq}">
									<span onclick="delExcGame('${amsExcList.EXC_SQ}');" style="border:1px solid #c0c0c0; background:#c0c0c0;">${label.删除 }</span>
								</c:if>								
							</div>						
						</p>
					</div>
					<div class="sub-content" onclick="window.location='msgJin.htm?intClbsq=${amsExcList.HME_CLB_SQ}&intExcsq=${amsExcList.EXC_SQ}';">
<!-- 						<div class="sub-content-title"> -->
<%-- 							<span>${amsExcList.EXC_TP_NM}</span> --%>
<!-- 						</div> -->
<%-- 						<div class="list flex row1"><span class="text-outline">${label.日期}：</span><p>${amsExcList.EXC_DATE}</p></div> --%>
						<div class="list flex row1"><span class="text-outline">담당자：</span><p>${amsExcList.CLB_NIK_NM}</p></div>
						<div class="list flex row1"><span class="text-outline">구매신청：</span><p>${amsExcList.JIN_CNT} ${label.人参与}</p></div>
						<div class="list flex row1" style="padding-bottom:20px;">
							<span class="nowrap text-outline">${label.活动介绍}：</span>
							<p class="flex1" style="white-space: initial; overflow: initial;">
								<pre style="white-space: pre-wrap;">
									
${amsExcList.EXC_DCT}
								</pre>
								<br>
							</p>
						</div>
						<div class="top-dashed flex" style="padding:8px;">
							<div class="sub-content-title" style="margin:0;padding:5px;padding-bottom: 0.35rem;">
								<span style="padding:5px;border-radius: 8px;font-size: 0.25rem;line-height: 0.5rem;background-color: #0080c6;color: #FFFFFF;border: 0px;width: 4rem;text-align: center;margin-left: 0.8rem;" onclick="window.location='msgJin.htm?intClbsq=${amsExcList.HME_CLB_SQ}&intExcsq=${amsExcList.EXC_SQ}';">
								콕 신청하기
							</span>
							</div>
						</div>
						<div class="top-dashed flex" style="padding:8px;">
							콕 구매 신청하실 분들은 위에 "콕 신청하기" 버튼을 클릭하세요. 
							<!--
							<p class="flex1 beyond">
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_1 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_1}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_2 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_2}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_3 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_3}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_4 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_4}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_5 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_5}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_6 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_6}"/></c:if>
								<c:if test="${amsExcList.MBR_MAI_IMG_PTH_7 != null}"><img class="member-head" src="${amsExcList.MBR_MAI_IMG_PTH_7}"/></c:if>
							</p>
							<p style="padding-top: 0.15rem; font-size: 0.22rem; color: #555555;" onclick="window.location='msgJin.htm?intClbsq=${amsExcList.HME_CLB_SQ}&intExcsq=${amsExcList.EXC_SQ}';">
								<span class="number red">${amsExcList.JIN_CNT}</span>${label.人参与}
							</p>
							-->
						</div>
					</div>
					
				</div>

			 </c:forEach>
			<!-- END Data Loop -->

			</div>
			<input type="hidden" id="intClbSq" />
			
			
			<!-- START bottom menu -->
			<c:set var="menuTag" value="1" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
		<script type="text/javascript">

 		function delExcGame(intExcsq) {
 			
     		if (!confirm("삭제하시겠습니까?")) {
 				return;
 			}
 			
 			var intExcsq = intExcsq;
 			
 			 $.ajax({
 			 	 		data:{
 			 	 			intExcsq : intExcsq
 			 	 		},
 					type : "POST",
 					url : "/front/bbc/exc/msgDel.htm",
 					success : function(data) {

 						if(data.ret=="success"){
 							window.location.href="/front/bbc/exc/msgDoList.htm?intClbsq="+$("#intClbSq").val();
 						}else{
 							alertBbc(data.ret);
 						}
 						
 					},
 					error : function(xhr, status, e) {
 						alert("Error : " + status);
 					}
 				});
 		}
 		
 		function msgConfirm() {
 			if (confirm("콕 관리 담당자 이신가요?\n일반 회원은 아래 '콕 신청하기' 버튼을 클릭하세요.")) {
 				window.location='msgReg.htm';	
 			}
 			
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
			  		    title: '회원 참여 공지 목록', // 分享标题
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.png', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${shareInfo.title}', // 分享标题
			  		    desc: '회원 참여 공지 목록', // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.png', // 分享图标
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
	
		</div>
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
