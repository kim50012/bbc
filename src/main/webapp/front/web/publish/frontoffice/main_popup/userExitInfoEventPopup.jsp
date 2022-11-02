<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@taglib uri="http://www.ssgdfs.com/taglib/ui" prefix="ui"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<ui:decorator name="popup" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/event.css" rel="stylesheet" type="text/css" />
<link href="/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>

<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>

<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.timers-1.2.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.form.js"></script>


<script type="text/javascript">
var isLogin = ${isLogin};
function setFltCode(fltOtherName){
    $("[name='fltCode']").val(fltOtherName);
}
jQuery(function($) {
    $("a.searchFltCode").click(function() {
    	alert();
        var exitName = $("select[name=exitCode] option:selected").text();
        if (isEmpty($("select[name=exitCode]").val())) {
            Alert("<ui:message key='validate.exitCode.select'/>");
            return;
        }
        
        alert(exitName);
        
        if (exitName.indexOf("机场") < 0) {
            var url = "/shop/order/harborPop";
            window.open(url, "harborPop",'width=490,height=450,scrollbars=no,resizable=no');
        } else {
            var url = "/shop/order/flightPop";
            window.open(url, "flightPop",'width=600,height=650,scrollbars=no,resizable=no');
        }
    });
    
    $(".btnSearchOrderOk").click(function() {
        var exitDt = $("[name='exitDt']").val();
        var exitTime = $("[name='hour']").val() + $("[name='minute']").val();
        $("[name='exitTime']").val(exitTime);
        var fltCode = $("[name='fltCode']").val();
        if (isEmpty(exitDt)) {
            Alert("<ui:message key='validate.exitDay.required'/>");
            $("[name='exitDt']").focus();
            return false;
        }
        if (isEmpty(fltCode)) {
            Alert("<ui:message key='validate.fltCode.required'/>");
            $("[name='fltCode']").focus();
            return false;
        }
        $("form#searchOrderForm").ajaxSubmit({
            url: "/shop/promotion/searchOrderOk"
            , dataType: "html"
            , success: function(html) {
                $(".result-box").html(html);
            }
            , error: function(xhr, status, error) {
                alert("<ui:message key='error.common.system'/>");
            }
        });
    });
    
    $("#resetFieldSet").click(function() {
        $("#searchOrderFieldSet").show();
        $("#searchOrderResult").hide();
    });
    
    $("body").on("click" , ".btnClose" , function() {
    	window.close();
    });
    
    $("body").on("click" , ".btnSaveUserExitInfo", function() {
        if ("${isLogin}" == "true") {
        	$("form#searchOrderForm").ajaxSubmit({
                url: "/shop/promotion/entryExitInfoEvent"
                , dataType: "json"
                , success: function(data) {
                    if (data.entry) {
                        Alert("<ui:message key='message.saved.success'/>");
                        window.close();
                    } else {
                        if(data.entryJoinStat == "01"){
                            Alert("<ui:message key='message.eventEntry.already'/>");
                        }else if(data.entryJoinStat == "02"){
                            Alert("<ui:message key='message.eventTodayEntry.already'/>");
                        }
                        else if(data.entryJoinStat == "99"){
                            Alert("<ui:message key='message.eventEntry.cant'/>");
                        }
                    }
                }
                , error: function(xhr, status, error) {
                    Alert("<ui:message key='error.common.system'/>");
                }
            });
        	return false;
        } else {
            var url = "/shop/login/loginPopupForm?redirectUrl="+escape(location.href);
            openWindow(url, 500, 540, 'loginPopupForm'); 
            return false;
        }
    });
    

	/*** select box ***/
	$("#placeCn").selectbox();
	$("#hourCn").selectbox();
	$("#minuteCn").selectbox();
	
});


</script>

</head>
<body>
<div id="wrap">
	<div id="head">
		<h1><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/h1_ordertime.gif" alt="查询可订购时间" /></h1>
	</div><!-- end head -->
	<div id="body"> 
		<div class="contents">
			<div class="prbox">
				<div class="time-check">
					<div class="time-box">
					<form id="searchOrderForm" name="searchOrderForm" method="post">
						<input type="hidden" name="eventId" id="eventId" value="${eventParam.eventId}"/>
						<input type="hidden" name="userId" id="userId" value="${loginUser.user.userId}"/>
						<input type="hidden" name="dupJoinTypeCode" id="dupJoinTypeCode" value="${eventParam.dupJoinTypeCode}"/>
						<input type="hidden" name="buyTgtClassCode2" id="buyTgtClassCode2" value="${eventParam.buyTgtClassCode2}"/>
						<input type="hidden" name="eventClassCode" id="eventClassCode" value="${eventParam.eventClassCode}"/>
						
						
						<table summary="查询可订购时间">
							<caption>查询可订购时间</caption>
							<colgroup>
								<col width="80px" />
								<col width="354px" />
							</colgroup>
							<tbody>
								<tr>
									<th><p class="txt-tipping"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/time_txt01.gif" alt="出境地点" /></p></th>
									<td class="place">
										<p>
											<ui:select iD="placeCn" name="exitCode" key="exitCode"></ui:select>
										</p>
									</td>
								</tr>
								<tr>
									<th><p class="txt-tipping"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/time_txt02.gif" alt="出境日期" /></p></th>
									<td><p><input type="text" class="date term" title="出境日期" name="exitDt" readonly="readonly" /></p></td>
								</tr>
								<tr> 
									<th><p class="txt-tipping"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/time_txt03.gif" alt="出境时间" /></p></th>
									<td class="time">
										<p>
											<ui:select iD="hourCn" name="hour" key="hours"></ui:select>
										</p>
										<p>
											<ui:select iD="minuteCn" name="minute" key="minutes"></ui:select>
											<input type="hidden" name="exitTime" value=""/>
										</p>
									</td>
								</tr>
								<tr>
									<th><p class="txt-tipping"><img src="http://image.ssgdfs.com/images/shop/cn/order/sheet_tit02_4.gif" alt="航班号" /></p></th>
									<td>
										<p class="name-ch">
											<input type="text" class="sidech" title="航班号" name="fltCode" name="fltCode" readonly="readonly"  />
											<a href="javascript://" class="searchFltCode"><img src="http://image.ssgdfs.com/images/shop/cn/order/btn_flight_name.gif" alt="搜索航班" /></a>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
						<p class="btn">
							<a href="javascript://" class="btnSearchOrderOk"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/btn_check.gif" alt="查询" /></a> 
						</p>
					</div>
					<div class="result-box">
						<p class="title"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/time_title.gif" alt="结果" /></p>
					</div>
				</div><!-- end order-timepop -->
			</div>
		</div>
	</div>
</div>
</body>
</html>