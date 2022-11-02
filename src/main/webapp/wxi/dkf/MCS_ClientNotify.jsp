<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#container {width:420px; height: 100%; }
</style>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=1ee9d1c7b12db44a7b21a25bd3faf5d7"></script>
<script type="text/javascript">
	
	$(function(){
		initMap();
		
	});
	function MCS_ClientNotify(EventData) {
		_eventData = JSON.parse(EventData);
		if(_eventData.event == 'OnUserChange'){
			OnUserChange(_eventData);
 		}
		if(_eventData.event == 'OnMapMsgClick'){
			addMarker(_eventData);
		}
	}
	
	
	function initMap(){
		var map = new AMap.Map('container');
		map.setZoom(10);
		map.setCenter([116.39,39.9]);
	}
	
	function addMarker(data){
		var map = new AMap.Map('container');
 		var marker = new AMap.Marker({
	        position: [data.longitude,data.latitude],
			map:map
 	    });
		map.setZoom(14);
		map.setCenter([data.longitude,data.latitude]);
		marker.setMap(map);
 		
	}
	
	function OnUserChange(data){
		var str = "openID:" + data.userid + "<br/>channeltype:" + data.channeltype + 
		"<br/>event:" + data.event;
 		document.getElementById("page-content").innerHTML = str;
	} 
</script>
</head>
<body>
<div id="container"></div>
</body>
</html>