<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<!doctype html>
<head>
<title><ui:i18n key=""/></title>
</head>
<body>
<div class="pages">
	<div data-page="keyWordList" class="page">
		<div class="page-content"> 
			<!-- <div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class=""></i><span>Back</span></a></div>
			</div>  -->
			<div class="label-header">
				<div class="header-warp clearfix">
				 	<div class="header-left">
				 		<div class="tab-title icon-tools">关键字管理</div>
				 		<div class="tab-title-right-bg"></div>
				 	</div>
				 	<div class="header-right">
				 		<span onclick="showBpopup_RemoveKeyword()"><img alt="" src="/wxi/image/dkfManager/delete.png">&nbsp;&nbsp;<span>删除</span></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span ><a href="#" class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
	 		<c:forEach items="${groupList }" var="list" varStatus="status">
		 		<div class="agent-item">
					<div class="agent-title-bar clearfix">
						<span class="group-title-icon">
							<img alt="" src="/wxi/image/dkfManager/group-title.png">
						</span>
					 	<span class="agent-title">${list.groupName }</span>
	 				</div>
	 				<div class="keywork-warp">
	 					<ul class="clearfix">
	 						<a href="/wxi/dkf/keywordAdd.htm?groupCode=${list.groupCode}" class="item-link">
	 							<li class="keyword-add" style="border: 1px solid #009900"><span class="" data-id=""></span></li>
	 						</a>
			 				<c:forEach items="${keywordList }" var="keywordList" varStatus="status">
			 					<c:choose>
				 					<c:when test="${list.groupCode eq keywordList.groupCode}">
 						 				<%-- <li class="key-world-select" onclick="keyWorldSelect(this)" data-id="${keywordList.keyword}">
 						 					<span>${keywordList.keyword }</span>
	 						 				<c:if test="${keywordList.keywordType eq 'ARS'}">
 						 						<img style="margin-top: -30px;margin-left: 99;" alt="" src="/wxi/image/dkfManager/ars.png">
 						 					</c:if>
    						 			</li> --%>
    						 			<c:if test="${keywordList.keywordType eq 'ARS'}">
 						 					 <a href="/wxi/dkf/updateKeyword.jsp?keyword=${keywordList.keyword}" class="item-link">
	 						 					<li class="key-world-hover"  data-id="${keywordList.keyword}">
		 						 					<span>${keywordList.keyword }</span>
	 						 						<img style="margin-top: -30px;margin-left: 99;" alt="" src="/wxi/image/dkfManager/ars.png">
		    						 			</li>
	    						 			</a>
 						 				</c:if>
 						 				<c:if test="${!(keywordList.keywordType eq 'ARS')}">
 						 					<li class="key-world-select" onclick="keyWorldSelect(this)" data-id="${keywordList.keyword}">
	 						 					<span>${keywordList.keyword }</span>
	    						 			</li>
 						 				</c:if>
						 			</c:when>
 			 		 		 	</c:choose>
						 	</c:forEach>
				 		</ul>
	 				</div>
	 			</div>
	 		</c:forEach>
 		</div>
 		
 		
	</div>
</div>
</body>
</html>