<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/wxi/scripts/jquery.min.js"></script>
</head>
<body>
상담원:  <span id="worker_account"></span><br/><br/>
상담 고객:  <span id="user_account"></span><br/><br/>
<script type="text/javascript">
	var ticket = '<%=request.getParameter("ticket")%>';
	$.getScript('http://crm1.dkf.qq.com/php/index.php/thirdapp/appdemo/get_workeraccount_by_sessionkey?callback=wokerAccountCallback&ticket='+ticket);
	
	function wokerAccountCallback(data){
		// 상담원 표시
 		$("#worker_account").html(data.workeraccount);
	}
	function MCS_ClientNotify(EventData) {
		_eventData = JSON.parse(EventData);
		if (_eventData.event == "OnUserChange") {
			// 상담 고객 표시
 			$("#user_account").html(_eventData.useraccount);
		}
	}
</script>
</body>
</html>