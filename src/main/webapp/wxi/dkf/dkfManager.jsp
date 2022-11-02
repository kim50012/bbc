<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<!doctype html>
<head>
<title><ui:i18n key=""/></title>
<link rel="stylesheet" href="/wxi/styles/framework7.ios.min.css">
<link rel="stylesheet" href="/wxi/styles/keyWordList.css">
<link rel="stylesheet" href="/wxi/styles/seatManage.css">
<script type="text/javascript" src="/wxi/scripts/keyWordList.js"></script>
<script type="text/javascript" src="/wxi/scripts/seatManage.js"></script>
<link rel="stylesheet" type="text/css" href="/front/human/css/bpoupMsg.css" />
<script type="text/javascript" src="/front/human/js/bpoupMsg.js"></script>
<style type="text/css">
body{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
.view{
	width:420px;
	/* margin: 0 auto; */
}
.toolbar-through .page-content {
    padding-top: 0px;
}


</style>
<script type="text/javascript">
	
</script>
</head>
<html>
<body>
<div class="statusbar-overlay"></div>
<div class="panel-overlay"></div>
<div class="views">
   <div class="view view-main">
<!-- 	   <div class="navbar"> -->
<!-- 		   <div class="navbar-inner"> -->
		    
<!-- 		   </div> -->
<!-- 	   </div> -->
	   <div class="pages navbar-through toolbar-through">
	       <div data-page="dkfManager" class="page">
	           <div class="page-content" style="margin-top:35px;">
	              
		   		   <a href="/wxi/dkf/seatManage.jsp" class="item-link">
			           <div class="item-content">
				           <div class="item-inner"> 
				              <div class="item-title title-css" style="border-top:1px solid #ccc;"><img src="/wxi/image/seatManage/icon_zuoxi.png"/>坐席管理</div>
				           </div>
			           </div>
		   		   </a>
		   		   <a href="/wxi/dkf/seatGroupManage.jsp" class="item-link">
			           <div class="item-content">
				           <div class="item-inner"> 
				              <div class="item-title title-css"><img src="/wxi/image/seatManage/icon_zuoxizu.png"/>坐席组管理</div>
				           </div>
			           </div>
		   		   </a>
		   		    <a href="/wxi/dkf/keyWordList.htm" class="item-link">
			           <div class="item-content">
				           <div class="item-inner"> 
				              <div class="item-title title-css"><img src="/wxi/image/seatManage/icon_guanjianzi.png"/>关键字管理</div>
				           </div>
			           </div>
		   		   </a>
		   		   <a href="/wxi/dkf/keyWorldGroupManage.jsp" class="item-link">
			           <div class="item-content">
				           <div class="item-inner"> 
				              <div class="item-title title-css"><img src="/wxi/image/seatManage/icon_guanjianzizu.png"/>关键字组管理</div>
				           </div>
			           </div>
		   		   </a>
	           </div>
	       </div>
	        <%@ include file="/wxi/dkf/bPoupMsg.jsp"%>
	   </div>
    </div>
</div>
<script type="text/javascript" src="/wxi/scripts/framework7.min.js"></script>
<script type="text/javascript" src="/wxi/scripts/dkfManagement.js"></script>

</body>
</html>