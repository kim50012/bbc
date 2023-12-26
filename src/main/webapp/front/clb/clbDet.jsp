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
		<title>${amsClb.CLB_NM}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
	</head>
	<body >
			<div class="modules">
					<div class="list68 flex">
						<p class="flex1 title-icon">${label.俱乐部概况}</p>
					</div>
			</div>
			<div class="module" style="border-top:none;position:relative;font-size:0.22rem;">
					<div class="module" style="background:#fff;padding:0.2rem;border:none;">
						<div class="list flex row1"><span class="text-outline text-width">${label.俱乐部名称}</span><p>${amsClb.CLB_NM}</p></div>
						<div class="list flex row1"><span class="nowrap text-outline text-width">${label.会员数}</span><p class="flex1">${amsClb.CLB_MBR_CNT}${label.人}</p></div>
						<div class="list flex row1"><span class="nowrap text-outline text-width">${label.俱乐部介绍}</span><div class="flex1" style="line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsClb.CLB_ITD}</pre></div></div>
						<div class="list flex row1"><span class="text-outline text-width">${label.联系人}</span><p>${amsClb.CTT_NM}</p></div>
						<div class="list flex row1"><span class="text-outline text-width">${label.联系电话}</span><p>${amsClb.CTT_PHN_NO}</p><p><img class="dial" style="width:0.18rem;margin-right:0rem;" src="../img/phone.png"/></p><p><img class="dial" src="../img/message.png"/></p></div>
						<div class="list flex row1"><span class="nowrap text-outline text-width">${label.活动时间}</span><div class="flex1" style="line-height:0.4rem"><pre style="white-space: pre-wrap;">${amsClb.EXC_TME_DCT}</pre></div></div>
					</div>
					<div style="width:0.8rem;height:0.8rem;border-radius:50%;position:absolute;right:0.2rem;top:0.2rem;white-space:nowrap;overflow:hidden;background:#fff;">
						<img style="width:0.8rem;height:0.8rem;" src="${amsClb.CLB_MAI_IMG_PTH}">
					</div>
			</div>
			<div class="modules" style="border:none;font-size:0.22rem;">
					<div class="module" style="background:#fff;padding:0.2rem">
						<div class="list flex row1"><span class="text-outline text-width">${label.场地数}</span><p>${amsClb.COR_CNT}${label.个}</p></div>
						<div class="list flex row1"><span class="nowrap text-outline text-width">${label.地址}</span><p class="flex1" style="white-space: pre-wrap;"><!-- ${amsClb.ATD_ADR} -->${amsClb.ATD_ADR_DTL}</p></div>
<%-- 						<div class="list flex row1" style="flex-flow:row-reverse;" ><span style="color:#01cfb9;margin-left:0.1rem;">${label.查看地图}</span><img style="width:0.17rem;height:0.22rem;margin-top:0.04rem;" src="../img/map.png"/></div> --%>
					</div>
			</div>
			<style>
				.buttons {text-align:left;}
			</style>
			<div class="buttons modules" style="background:#fff;padding-bottom:2rem;padding-left:0.18rem;">
			
					<c:if test="${amsClb.JIN_REQ_MBR_SQ != amsClb.MBR_SQ}">
						<c:if test="${amsClb.CLB_JIN_ST == 'JIN'}">
							<button class="btn-big btn-out" onclick="fn_ClbMbrDelete()">${label.退出}</button>	
						</c:if>
						<c:if test="${amsClb.CLB_JIN_ST == 'EXI'}">
							<button class="btn-big btn-apply">${label.加入申请}</button>
						</c:if>
					</c:if>
					<c:if test="${amsClb.JIN_REQ_MBR_SQ == amsClb.MBR_SQ}">
						<button class="btn-big btn-out">${label.加入取消}</button>
					</c:if>
					<button class="btn-big btn-friend">${label.邀请朋友}</button>
<%-- 					<c:if test="${amsClb.REG_MBR_SQ == amsClb.CLB_MBR_SQ}"> --%>
					<c:if test="${amsClb.CLB_GD == 'A'}">
						<button class="btn-big btn-modify" onclick="window.location='/front/bbc/clb/clbView.htm?intClbsq=${amsClb.CLB_SQ}'">${label.修改}</button>
						<button class="btn-big btn-delete" onclick="fn_ClbDelete()">${label.俱乐部删除}</button>
					</c:if>
			</div>
			
			
<!-- 点击按钮的弹窗-->
		<div class="pop-up-wrap" style="display:none;">
<%-- 			<p class="flex1 title-icon">${label.个人信息}</p> --%>
			<div class="pop-up-content">
				<div class="inp-wrap">
					<p>${label.俱乐部}：</p>
					<input class="textboxcontent" type="text" id="" value="${amsClb.CLB_NM}"  readonly/>
				</div>
				<div class="inp-wrap">
					<p>${label.姓名}：</p>
					<input class="textboxcontent" type="text" id="strClbniknm" value="" />
<%-- 					<input class="textboxcontent" style="width:2.1rem;margin-right:0.1rem;" type="text" id="" value="${amsClb.MBR_NM}" /> --%>
<%-- 					<button style="background:#666;color:#fff;">${label.重复确认}</button> --%>
				</div>
				<div class="inp-wrap">
					<p>${label.年龄}：</p>
						<select class="textboxcontent" id="strAgeyy" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="10">19${label.岁}${label.以下}</option>
							<option value="20">20~29${label.岁}</option>
							<option value="30">30~39${label.岁}</option>
							<option value="40">40~49${label.岁}</option>
							<option value="50">50${label.岁}${label.以上}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.性别}：</p>
						<select class="textboxcontent" id="strGnddv" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="MALE">${label.男}</option>
							<option value="FEMA">${label.女}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.小组}：</p>
						<select class="textboxcontent" id="strBmtgd" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="A">A${label.组}</option>
							<option value="B">B${label.组}</option>
							<option value="C">C${label.组}</option>
							<option value="D">D${label.组}</option>
							<option value="E">${label.新手}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.球历}：</p>
						<select class="textboxcontent" id="strYear" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="1">1${label.年}</option>
							<option value="2">2${label.年}</option>
							<option value="3">3${label.年}</option>
							<option value="4">4${label.年}</option>
							<option value="5">5${label.年}${label.以上}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.内容}：</p>
					<textarea class="textboxcontent" id="strJingrttxt" placeholder="请输入内容"></textarea>
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span id="spanClbJinReg" onclick="fn_ClbJinReg();">${label.加入申请}</span>
				</div>
			</div>
		</div>
		
		
		<div class="pop-up-wrap-del" style="display: none;">
			<div class="pop-up-content">
				<div class="inp-wrap-del">
					${label.确认删除这个俱乐部吗}？
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span>${label.确认}</span>
				</div>
			</div>
		</div>
		
		<div class="pop-up-wrap-friend" style="display: none;">
			<div class="pop-up-content" style="width:100%; height:100%; padding:0;">
				<div class="inp-wrap-del">
					<img src="/front/bbc/img/share.png" id="shareCancel" style="width:100%;"/>
				</div>
			</div>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$(".btn-apply").click(function(){
					$('html, body').animate({scrollTop:0}, 1);
					$(".pop-up-wrap").show();
				});
				$(".cancel").click(function(){
					$(".pop-up-wrap").hide();
				});
			});	
			$(document).ready(function(){
				$(".btn-delete").click(function(){
					//$(".pop-up-wrap-del").show();
				});
				$(".cancel").click(function(){
					$(".pop-up-wrap-del").hide();
				});
			});
			$(document).ready(function(){
				$(".btn-friend").click(function(){
					$('html, body').animate({scrollTop:0}, 1);
					$(".pop-up-wrap-friend").show();
				});
				$("#shareCancel").click(function(){
					$(".pop-up-wrap-friend").hide();
				});
			});
			

     		function fn_ClbJinReg() {
     			
     			var intClbsq= "${amsClb.CLB_SQ}";	  // [클럽가입신청] 클럽시퀀스
     			var strClbniknm= $('#strClbniknm').val();	  // [클럽가입신청] 클럼내닉네임
     			var strAgeyy= $('#strAgeyy').val();	  // [클럽가입신청] 연령(10대,20대...)
     			var strGnddv= $('#strGnddv').val();	  // [클럽가입신청] 성별구분
     			var strBmtgd= $('#strBmtgd').val();	  // [클럽가입신청] 배드민턴 조(A,B,C,D)     	
     			var strJingrttxt= $('#strJingrttxt').val();	  // [클럽가입신청] 가입인사말		
	 			var strYear = $("#strYear").val();

     			if (strClbniknm =="") {
         			alert("${label.请输入}${label.简称}.");	
         			return;
     			}
     			if (strAgeyy =="" || strAgeyy =="${label.请选择}") {
         			alert("${label.请输入}${label.年龄}.");	
         			return;
     			}
     			if (strGnddv =="" || strGnddv =="${label.请选择}") {
         			alert("${label.请输入}${label.性别}.");	
         			return;
     			}
     			if (strBmtgd =="" || strBmtgd =="${label.请选择}") {
         			alert("${label.请输入}${label.小组}.");	
         			return;
     			}
     			if (strJingrttxt =="") {
         			alert("${label.请输入}${label.内容}.");	
         			return;
     			}
	 			if (strYear == "") {
	 				alert("${label.请选择}${label.球历}");
	 				return;
	 			}

				$("#spanClbJinReg").hide();
					
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,strClbniknm : strClbniknm
     			 	 			,strJingrttxt : strJingrttxt
     			 	 			,strAgeyy : strAgeyy
     			 	 			,strGnddv : strGnddv
     			 	 			,strBmtgd : strBmtgd
     			 	 			,strYwday : strYear
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbJinSave.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.reload(true);
     						}else{
     							alert(data.ret);
     							$("#spanClbJinReg").show();
     						}
     						
     					},
     					error : function(xhr, status, e) {
 							$("#spanClbJinReg").show();
     						alert("Error : " + status);
     					}
     				});
     		}	

     		function fn_ClbMbrDelete() {
     			
     			var intClbsq= "${amsClb.CLB_SQ}";	  // [클럽가입신청] 클럽시퀀스
     			if (!confirm("${label.退出吗}?")) {
     				return;
     			}
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbMbrDelete.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.reload(true);
     						}else{
     							alert(data.ret);
     						}
     						
     					},
     					error : function(xhr, status, e) {
     						alert("Error : " + status);
     					}
     				});
     		}	
     		

     		function fn_ClbDelete() {

     			var intClbsq = "${amsClb.CLB_SQ}";	  // [클럽가입신청] 클럽시퀀스
     			var strClbst = "CLSE";
				
     			if (!confirm("${label.确认删除吗}?")) {
     				return;
     			}
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,strClbst : strClbst
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbUpdate.htm",
     					success : function(data) {

    	     				alert("${label.保存成功了}");
    	     				window.location = "/front/bbc/clb/clb.htm";
     						
     					},
     					error : function(xhr, status, e) {
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
			  		    title: '${amsClb.CLB_NM} ${label.加入}', // 分享标题
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
			  		    title: '${amsClb.CLB_NM}', // 分享标题
			  		    desc: '${label.加入}', // 分享描述 
			  		    link: '${shareInfo.link}', // 分享链接
			  		    imgUrl: 'http://bbc.manhuaking.cn${amsClb.CLB_MAI_IMG_PTH}', // 分享图标
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
<%-- 			<c:set var="menuTag" value="2" /> --%>
<%-- 			<%@ include file="/front/bbc/exc/menu.jsp"%>  --%>
			<!-- END bottom menu -->
			
	<c:if test="${amsClb.CLB_JIN_ST == 'JIN'}">
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
	</c:if>
	</body>
	</html>