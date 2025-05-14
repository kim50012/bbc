<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${returnPageName == null}">
<a href="/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }" class="r_pg_top show">홈으로</a>
</c:if>
<c:if test="${returnPageName != null}">
<a href="${returnPageName}.htm?intClbsq=${intClbsq }" class="r_pg_top show">홈으로</a>
</c:if>
<style>
	@media(min-width:720px) {
 		body {
 			width:720px;
 		}
 		.module {
 			width:720px;
 		}
 		.footer {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 720px;
 		}
		.wrap {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 720px;
		}
		.head-information {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 720px;
		}
		.app {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 720px;
		}
		.content {
			position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    width: 720px;
		}
	}
</style>