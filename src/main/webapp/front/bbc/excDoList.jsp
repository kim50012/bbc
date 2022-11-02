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
				
			<!-- START Data Loop -->
			<c:forEach var="amsExcList" items="${amsExcList}" varStatus="status">  
						<p></p>
				
				<div class="modules">
					<div class="list78 flex">
						<p class="club-logo">
							<img class="club-icon" src="${amsExcList.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="flex1 row1 word-title">${amsExcList.HME_CLB_NM}</p>
<!-- 						<p class="row1"><span class="number">777</span>km</p> -->
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
<!-- 						<div class="sub-content-title"> -->
<%-- 							<span>${amsExcList.EXC_TP_NM}</span> --%>
<!-- 						</div> -->
						<div class="list flex row1"><span class="text-outline">${label.日期}：</span><p style="font-weight:bold;">${amsExcList.EXC_DATE} ${amsExcList.WEEKNAME }</p></div>
						<div class="list flex row1"><span class="text-outline">${label.时间}：</span><p style="font-weight:bold;">${amsExcList.EXC_FR_TIME} ~ ${amsExcList.EXC_TO_TIME}</p></div>
						<div class="list flex row1"><span class="text-outline">${label.场地}：</span><p style="font-weight:bold;">${amsExcList.EXC_TIT}</p>&nbsp;<span class="blink">※</span></div>
						<div class="list flex row1"><span class="text-outline">${label.创建}：</span><p>${amsExcList.CLB_NIK_NM}</p></div>
						<c:if test="${amsExcList.EXC_TP == '1002'}">
							<div class="list flex row1"><span class="text-outline">${label.参与人员}：</span><p>${amsExcList.ATD_CNT}</p></div>
						</c:if>
						<div class="list flex row1">
							<span class="nowrap text-outline">${label.活动介绍}：</span>
							<p class="flex1">${amsExcList.EXC_DCT}&nbsp;
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
								<span class="number red">${amsExcList.JIN_CNT}</span>${label.人参与}
							</p>
						</div>
					</div>
<%-- 					<c:if test="${(amsExcList.CLB_GD == 'A') || amsClb.amsExcList == 'B' || amsExcList.REG_MBR_SQ == loginMbrSq}"> --%>
<!-- 						<div class="top-dashed flex" style="text-align:right;height:0.8rem;"> -->
<!-- 							<div class="sub-content-title" style="margin:0;right:0;padding:0.2rem;float:left;width:100%;"> -->
<%-- 								<span onclick="delExcGame('${amsExcList.EXC_SQ}');" style="border:1px solid #c0c0c0; background:#c0c0c0;">${label.删除 }</span> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:if> --%>
					
				</div>

			 </c:forEach>
			<!-- END Data Loop -->

<br>
<br>
<br>

			</div>
			
			
			<!-- START bottom menu -->
			<c:set var="menuTag" value="1" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
		<script type="text/javascript">

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
		
	</script>
			
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	
// 	    // 페이지 로딩 직후 앱에서 자동 호출 합니다.
// 	    function callfromApp() {
// 	    	alert("${loginMbrSq}");
// 	        if (typeof app_login_complete === 'function') {
// 	            app_login_complete('${loginMbrSq}');
// 	        }
// 	    }
	
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
			  		    title: '${label.活动列表} ${label.参加活动}', // 分享标题
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcDoList.htm%253FshopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect', //'${shareInfo.link}', // 分享链接
			  		    link: '${shareInfo.link}',
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.jpg', // 分享图标
			  		    success: function () { 
			  		        // 用户确认分享后执行的回调函数
			  		    },
			  		    cancel: function () { 
			  		        // 用户取消分享后执行的回调函数
			  		    }
			  		});
			  		
			  		wx.onMenuShareAppMessage({
			  		    title: '${label.活动列表}', // 分享标题
			  		    desc: '${label.参加活动}', // 分享描述 
// 			  		    link: 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa1bf729b5d982ae1&redirect_uri=http%3A%2F%2Fbbc.manhuaking.cn%2Fw%2Ft.htm%3Fk%3DMWMUFH2V1W1WUOXWUHUWBH4ZTUAXGDRQ%26tu%3Dhttp%253A%252F%252Fbbc.manhuaking.cn%252Ffront%252Fbbc%252Fexc%252FexcDoList.htm%253FshopId%253D68&response_type=code&scope=snsapi_base&state=n#wechat_redirect',//'${shareInfo.link}', // 分享链接
						link: '${shareInfo.link}',
			  		    imgUrl: 'http://bbc.manhuaking.cn/front/bbc/img/logo.jpg', // 分享图标
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
