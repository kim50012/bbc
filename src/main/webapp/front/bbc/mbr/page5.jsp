<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>QUERY</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<style>
.app {
	padding-top: 0;
}

.app-header {
	position: relative;
}

.app-header .logo img {
	width: 0.60rem;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		$("#appPage2").prepend(htm)
		$(".app-header")
				.click(
						function() {
							window.location.href = '/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
						});
	});
</script>
<style>
.subBtn {
	padding: 0.2rem 0.1rem;
}
</style>
</head>

<body>
	<div class="app" style="background: #ffffff;">
	
		<div class="scroll-wrap" id="appPage2">
	        <div class="proposal-wrap">
	          	<div>
	            	<div class="text-wrap mt10">
	              		<textarea id="proposalText" style="height:4rem;"></textarea>
	            	</div>
	          	</div>
	          	<div class="bold blueBtn comBtn f-col font26 mt24" onclick="query();">처리</div>
	          
				<div class="title2" style="border-bottom: solid 1px #909090;">
					<span class="font24 bold">결과</span>
				</div>
				<div class="mt24">
					<textarea id="queryResult" style="height:6rem;">결과가 없습니다.</textarea>
				
				</div>
				
	        </div>		
		</div>
		
	</div>

</body>
<script type="text/javascript">

	function query() {

		var para1 = "ADMIN_QUERY";
		var para2 = $("#proposalText").val();

		var load = loading();
		load.show();
		
		$("#queryResult").html('');
		
		$.ajax({
					data : {
						para1 : para1,
						para2 : para2
					},
					type : "POST",
				    contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						var jsonStr = JSON.stringify(data.list);
						$("#queryResult").html(jsonStr);
						load.hide();
					},
					error : function(xhr, status, e) {
						$("#queryResult").html('');
						load.hide();
					}
				});
	}     
	
</script>
</html>
