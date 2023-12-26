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
		<title>${label.会规管理}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<style type="text/css">
				.cell-1{
					width:0.8rem;
					text-align:left;
				}
				.cell-2{
					width:2.8rem; 
					text-align:left;
					
				}
				.cell-3{
					width:0.5rem;
					text-align:right; 
				}
				.newtext{
					width:2.8rem;
					text-align:left;
					word-break:keep-all;
					white-space:nowrap;
					overflow:hidden;
					text-overflow:ellipsis;
				}
				.news:after{
				display: inline-block;
				content: "";
				width: 0.32rem;
				height: 0.16rem;
				background-image: url(../img/new.png);
				background-size:0.32rem;
				margin-left:0.1rem;
				background-repeat: no-repeat;
				background-position: right center;
				z-index:888;
				}


		</style>
	</head>
	<body>
		<div class="content">
			<div class="module" >
					<div class="list-110">
						<p  class="club-logo1 float" >
							<img src="${amsClb.CLB_MAI_IMG_PTH}"/>
						</p>
						<p class="word-title float" style="white-space:nowrap;overflow:ellipsis;" onclick="window.location='/front/bbc/clb/clbDetMy.htm?intClbsq=${amsClb.CLB_SQ}';">
							${amsClb.CLB_NM}【<span>${amsClb.CLB_MBR_CNT}</span>人】
						</p>
						<div class="number-information float" style="padding-right: 0.2rem;right: 0;position: absolute;">
							<div class="number-name" >${amsClb.MBR_NM}</div> 
							<div class="number-level" >${amsClb.CLB_GD_NM}</div>
						</div>
					</div>
			</div>
			<div class="modules" style="background:#fff;padding-left:0.2rem;padding-right:0.2rem;">
					<div class="flex">
							<p class="flex1 title-icon">${label.俱乐部会规}</p>
							<c:if test="${(amsClbMbr.CLB_GD == 'A') || amsClbMbr.CLB_GD == 'B'}">
								<button id="btn" class="btn-join" onclick="window.location='/front/bbc/clb/clbRuleReg.htm?intClbsq=${amsClb.CLB_SQ}';">${label.创建会规}</button>
							</c:if>
					</div>
			</div>
			<div class="switcharea-apply">
				<div class="module" style="border-top:none;background:#fff;font-size:0.22rem;">
				
				<!-- START Data Loop -->
				<c:forEach var="atrClbBbdList" items="${atrClbBbdList}" varStatus="status">
				  
					<ul class="flex list68 ul-list" onclick="$('#ulNoticeBody${atrClbBbdList.CLB_BBD_SQ}').toggle(600);">
						<li class="flex2 cell-1 cell">${atrClbBbdList.REG_DT}</li>
						<li class="flex2 cell-2 cell"><div class="newtext float">${atrClbBbdList.CLB_BBD_TIT}</div>${atrClbBbdList.NEW_TAG}</li>
<%-- 						<li class="flex2 cell-3 cell">${atrClbBbdList.RCM_CNT}人查看</li> --%>
						<li class="flex2 cell-3 cell">${label.管理员}</li>
					</ul>
					<ul class="flex ul-list" style="display:none;" id="ulNoticeBody${atrClbBbdList.CLB_BBD_SQ}">
						<li class="flex2 cell-1 cell" style="padding:0.2rem;line-height:0.4rem">
							<pre style="white-space: pre-wrap;">${atrClbBbdList.CLB_BBD_CTE}</pre>
							<c:if test="${atrClbBbdList.REG_MBR_SQ == amsClbMbr.MBR_SQ}">
								<div class="flex">
									<p class="flex1">&nbsp;</p>
									<button id="btn" class="btn-join" onclick="fn_NoticeDel('${atrClbBbdList.CLB_BBD_SQ}');" style="right:0px;padding-right:0.2rem;">${label.删除}</button>
									&nbsp;
									<button id="btn" class="btn-join" onclick="window.location='/front/bbc/clb/clbRuleReg.htm?intClbsq=${atrClbBbdList.CLB_SQ}&intClbbbdsq=${atrClbBbdList.CLB_BBD_SQ}';" style="right:0px;padding-right:0.2rem;">${label.修改}</button>
								</div>
							</c:if>
						</li>
					</ul>
					
				 </c:forEach>
				<!-- END Data Loop -->
				
				</div>
			</div>
        </div>

		<%@ include file="/front/bbc/inc/returnPage.jsp"%>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
		
	 <script type="text/javascript">

     		function fn_NoticeDel(intClbbbdsq) {
     			
     			var intClbsq = "${intClbsq}";

         		if (!confirm("${label.确认删除吗}?")) {
     				return;
     			}
         		
         		loadingShow();
         		
     			 $.ajax({
     			 	 		data:{
     			 	 			intClbsq : intClbsq
     			 	 			,intClbbbdsq : intClbbbdsq
     			 	 		},
     					type : "POST",
     					url : "/front/bbc/clb/clbNoticeDel.htm",
     					success : function(data) {

     						if(data.ret=="success"){
     		     				alert("${label.保存成功了}");
     							window.location.href="/front/bbc/clb/clbRule.htm?intClbsq="+intClbsq;
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
     

		<script>
		var pageTitle = $(document).attr("title");
		var shareWeDesc = "";
		var shareWeImgUrl = "";
		</script>
		<%@ include file="/front/bbc/inc/wechatShare.jsp"%> 	
		     
             
    </body>
</html>