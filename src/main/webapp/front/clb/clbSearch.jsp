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
		<title>${label.俱乐部查询}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
	</head>
	<body>
		<div class="wrap">
			<div class="header">
				<div class="back">返回</div>
				<div class="title">俱乐部查询</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				<div class="search-bar" style="top:0;">
					<div class="search flex">
						<div class="select1">
								<p class="down" style="padding-left:0.1rem;padding-right:0.3rem;background-image: url(../img/whiteup.png);background-position: center right 0.2rem;white-space:nowrap;overflow:hidden; text-overflow:ellipsis;background-size: 0.14rem;background-repeat: no-repeat;color:#fff;">
									<c:if test="${strAtdadr == null || strAtdadr == ''}">
										${label.请选择}
									</c:if>									
									<c:if test="${strAtdadr != null && strAtdadr != ''}">
										${strAtdadr}
									</c:if>
								</p>
								<div class="screen" style="display:none;">
									<p class="single">${label.请选择}</p>
									<p class="single">北京</p>
									<p class="single">天津</p>
									<p class="single">河北省</p>
									<p class="single">山西省</p>
<!-- 									<p class="single">内蒙古自治区</p> -->
<!-- 									<p class="single">辽宁省</p> -->
<!-- 									<p class="single">吉林省</p> -->
<!-- 									<p class="single">黑龙江省</p> -->
									<p class="single">上海</p>
<!-- 									<p class="single">江苏省</p> -->
<!-- 									<p class="single">浙江省</p> -->
<!-- 									<p class="single">安徽省</p> -->
<!-- 									<p class="single">福建省</p> -->
<!-- 									<p class="single">江西省</p> -->
									<p class="single">山东省</p>
<!-- 									<p class="single">河南省</p> -->
<!-- 									<p class="single">湖北省</p> -->
<!-- 									<p class="single">湖南省</p> -->
									<p class="single">广东省</p>
<!-- 									<p class="single">广西壮族自治区</p> -->
<!-- 									<p class="single">海南省</p> -->
<!-- 									<p class="single">重庆</p> -->
<!-- 									<p class="single">四川省</p> -->
<!-- 									<p class="single">贵州省</p> -->
<!-- 									<p class="single">云南省</p> -->
<!-- 									<p class="single">西藏自治区</p> -->
<!-- 									<p class="single">陕西省</p> -->
<!-- 									<p class="single">甘肃省</p> -->
<!-- 									<p class="single">青海省</p> -->
<!-- 									<p class="single">宁夏回族自治区</p> -->
<!-- 									<p class="single">新疆维吾尔自治区</p> -->
<!-- 									<p class="single">台湾省</p> -->
<!-- 									<p class="single">香港特别行政区</p> -->
<!-- 									<p class="single">澳门特别行政区</p> -->
								</div>
								<input type="hidden" id="strAtdadr" value="${strAtdadr}"/>
						</div>
						<div class="search-box flex1">
							<input class="search-inp" type="text" id="strClbnm" value="${strClbnm}" 
							onkeydown="if(event.keyCode=='13'){search();}"
							placeholder="${label.俱乐部查询}"/>
						</div>
					</div>
				</div>
				<div class="list-area">
				
					<!-- START Data Loop -->
					<c:forEach var="amsClbList" items="${amsClbList}" varStatus="status">  
				
						<div class="modules" style="margin-top:0;">
								<div class="list178 flex">
									<div style="width: 1.78rem;text-align: center;">
										<img class="club-big" src="${amsClbList.CLB_MAI_IMG_PTH}"/>
									</div>
									<div class="flex1" style="padding-top: 0.3rem;">
										<p class="lh20 word-title" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsClbList.CLB_SQ}';">${amsClbList.CLB_NM}【${amsClbList.CLB_MBR_CNT} ${label.人}】</p>
										<p class="small22-text small22">${label.联系人}：${amsClbList.CTT_NM}</p>
										<div class="flex small22-text small22">
											<p class="flex1">${amsClbList.ATD_ADR}${amsClbList.ATD_ADR_DTL}</p>
											<span class="nowrap open" onclick="window.location='/front/bbc/clb/clbDet.htm?intClbsq=${amsClbList.CLB_SQ}';">${label.展开}</span>
										</div>
									</div>
								</div>
						</div>
					
					</c:forEach>
					<!-- END Data Loop -->
				
				</div>	
			</div>
		</div>	

			<!-- START bottom menu -->
			<c:set var="menuTag" value="2" />
			<%@ include file="/front/bbc/exc/menu.jsp"%> 
			<!-- END bottom menu -->
			
			
		<script type="text/javascript">
			$(document).ready(function(){
				$(".down").click(function(){
					$(".screen").toggle();
				});
				$(".single").click(function(){
					$(".down").html($(this).html());
					$("#strAtdadr").val($(this).html());
					$(".screen").hide();
					search();
				});
			});
			
			function search() {
				if ($('#strAtdadr').val() == "${label.请选择}") {
					window.location='clbSearch.htm?strClbnm='+$('#strClbnm').val();
				}
				else {
					window.location='clbSearch.htm?strClbnm='+$('#strClbnm').val()+'&strAtdadr='+$('#strAtdadr').val();
				}
			}
		</script>
		

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
				
		
	</body>
</html>
