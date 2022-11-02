<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${returnPageName == null}">
<a href="/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }" class="r_pg_top show">홈으로</a>
</c:if>
<c:if test="${returnPageName != null}">
<a href="${returnPageName}.htm?intClbsq=${intClbsq }" class="r_pg_top show">홈으로</a>
</c:if>