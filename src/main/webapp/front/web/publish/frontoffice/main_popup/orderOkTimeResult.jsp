<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.ssgdfs.com/taglib/ui" prefix="ui" %>
<%@taglib uri="http://www.ssgdfs.com/taglib/hfn" prefix="hfn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<script type="text/javascript" src="/js/jquery/jquery.form.js"></script>
<script type="text/javascript">
jQuery(function() {
    
});
</script>
<c:if test="${orderValidTime ne null and  orderValidTime.dDayYn}">
					<div class="result-box">
						<p class="title"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/time_title.gif" alt="结果" /></p>
						<p class="txt">
							<strong>${fn:substring(userExitInfo.exitDt,0,4)}年${fn:substring(userExitInfo.exitDt,4,6)}月${fn:substring(userExitInfo.exitDt,6,8)}日${fn:substring(userExitInfo.exitTime,0,2)}時 ${fn:substring(userExitInfo.exitTime,2,4)}分<ui:code codeName="${userExitInfo.exitCode}" codeClass="exitCode"/></strong><br />
							出境时商品订购时间截止到 <span>${fn:substring(orderValidTime.orderOkTime,0,4)}年${fn:substring(orderValidTime.orderOkTime,4,6)}月${fn:substring(orderValidTime.orderOkTime,6,8)}日${fn:substring(orderValidTime.orderOkTime,8,10)}時</span>为止。
						</p>
						<p class="txt02">离商品订购截止时间还剩<span>D-${orderValidTime.dDayCount}</span></p>
						<p class="btn">
							<a href="javascrtip://" class="btnSaveUserExitInfo"><img src="//image.ssgdfs.com/images/shop/cn/common/popup/btn_close.gif" alt="关闭" /></a> 
						</p>
					</div>
</c:if>
<c:if test="${orderValidTime eq null or !orderValidTime.dDayYn}">
					<div class="result-box">
						<p class="title"><img src="http://image.ssgdfs.com/images/shop/cn/common/popup/time_title.gif" alt="结果" /></p>
						<p class="txt">
							<strong>${fn:substring(userExitInfo.exitDt,0,4)}年${fn:substring(userExitInfo.exitDt,4,6)}月${fn:substring(userExitInfo.exitDt,6,8)}日${fn:substring(userExitInfo.exitTime,0,2)}時${fn:substring(userExitInfo.exitTime,2,4)}分<ui:code codeName="${userExitInfo.exitCode}" codeClass="exitCode"/></strong><br />
							出境时商品订购时间截止到<span>${fn:substring(orderValidTime.orderOkTime,0,4)}年${fn:substring(orderValidTime.orderOkTime,4,6)}月${fn:substring(orderValidTime.orderOkTime,6,8)}日${fn:substring(orderValidTime.orderOkTime,8,10)}時</span>为止。
						</p>
						<p class="txt02">
							<p class="txt02"><span>已超过可订购时间，无法进行订购。</span></p>
						</p>
						<p class="btn">
							<a href="javascript://" class="btnClose"><img src="//image.ssgdfs.com/images/shop/cn/common/popup/btn_close.gif" alt="关闭" /></a> 
						</p>
					</div>
</c:if>