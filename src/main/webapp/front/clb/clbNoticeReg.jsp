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
		<title>${label.公告注册}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		.radio-box label.active:before{
			background-image: url(../img/radio-checked-red.png);
		}
		.right-btn.active:after{
			display: none;
		}
		.right-btn.active{
			color:#666;

		}
		</style>
	</head>
	<body>
			<div class="wrap no-footer">
				<div class="header">
					<div class="back">返回</div>
					<div class="title">公告注册</div>
					<div class="menu-bar">
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				<div class="content">
					<div class="modules">
						<div class="sub-content">
<!-- 							<div class="list90 bottom-dashed flex"  id="updateBIRTHDAY">	 -->
<!-- 								<p class="flex1">注册日</p> -->
<!-- 								<label for="time" style="position: relative;"> -->
<!-- 									<input style="color:#666;" class="right weui-input" id="time" type="text" value="" /> -->
<!-- 									<p class="right-btn" style="position: absolute;height: 100%;top: 0;right:0;">请选择</p> -->
<!-- 								</label> -->
<!-- 							</div> -->
							<div class="list90 bottom-dashed flex">
								<p class="left-part">${label.题目}</p>
								<div class="flex1">
									<input class="right" type="text" name="strClbbbdtit" id="strClbbbdtit" value="${atrClbBbdList.CLB_BBD_TIT}" placeholder="请输入" style="text-align:left;"/>
								</div>
							</div>
							<div class="list90 bottom-dashed flex">
								<p class="left-part">${label.上端固定}</p>
								<div class="flex1">
									<input type="checkbox" name="intRcmcnt" id="intRcmcnt" style="margin-top:0.2rem;width:10%;" value="1" ${atrClbBbdList.RCM_CNT_TAG}/>
								</div>
							</div>
							<div class="list90  flex">
								<p class="left-part">${label.内容}</p>
								<div class="flex1">
									&nbsp;
								</div>
							</div>
							<div class="list90  flex">
								<div class="flex1">
									<textarea class="textboxcontent" id="strClbbbdcte" placeholder="请输入内容" style="width:100%;height:4rem;padding:0px;padding-top:0.14rem;padding-bottom:0.14rem;">${atrClbBbdList.CLB_BBD_CTE}</textarea>
								</div>
							</div>
							
						</div>
					</div>
<!-- 					<div class="modules"> -->
<!-- 						<div class="sub-content"> -->
<!-- 							<div class="file flex"> -->
<!-- 								<p class="left-part">图片</p> -->
<!-- 								<div class="flex1 right"> -->
<!-- 									<span>请上传</span> -->
<!-- 									<img class="file-img" src="../img/file.png"/> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit" onclick="fn_NoticeReg();">${label.提交}</button>
					</div>
				</div>
			</div>
		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
		
	</body>

	 <script type="text/javascript">
     		$(function(){
     		 	$("#time").calendar({
			        onChange: function (p, values, displayValues) {
			        
			          $("#time").siblings("p").hide()
			        }
		      	})

		      });
			
     		function fn_NoticeReg() {
     			
     			var intClbsq = "${intClbsq}";
     			var strClbbbdtit = $('#strClbbbdtit').val();
     			var strClbbbdcte = $('#strClbbbdcte').val();
     			var strClbbbdtp = "1001";
     			var intRcmcnt = 0;
     			if ($(':checkbox[name="intRcmcnt"]:checked').val()){
     				intRcmcnt = $(':checkbox[name="intRcmcnt"]:checked').val();
     			}
     			var strJobtype = "I";
     			var intClbbbdsq = "${atrClbBbdList.CLB_BBD_SQ}";
     			
     			if (strClbbbdtit == "") {
     				alert("${label.请输入}${label.题目}");
     				return;
     			}
     			
     			if (strClbbbdcte == "") {
     				alert("${label.请输入内容}");
     				return;
     			}
     			
     			loadingShow();
     			
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,strClbbbdtit : strClbbbdtit
     			 	 			,strClbbbdcte : strClbbbdcte
     			 	 			,strClbbbdtp : strClbbbdtp
     			 	 			,intRcmcnt : intRcmcnt
     			 	 			,strJobtype : strJobtype
     			 	 			,intClbbbdsq : intClbbbdsq
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbNoticeSave.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.href="/front/bbc/clb/clbNotice.htm?intClbsq="+intClbsq;
     						}else{
     							loadingHide();
     		     				alert("${label.失败了}");
     						}
     						
     					},
     					error : function(xhr, status, e) {
     						loadingHide();
     						alert("Error : " + status);
     					}
     				});
     		}
     		
     </script>
</html>