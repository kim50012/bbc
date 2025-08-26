<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Iframe 테스트 페이지</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        #dashboardFrame {
            width: 100%;
            height: 80vh; /* 화면 높이의 80% */
            border: 1px solid #ccc;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <h2>대시보드 Iframe 로드 테스트</h2>
    <p>아래 버튼을 클릭하면 지정된 URL이 Iframe에 로드됩니다.</p>

    <button onclick="loadDashboard()">대시보드 불러오기</button>

    <hr>

    <iframe id="dashboardFrame" src="about:blank" title="대시보드">
        Iframe을 지원하지 않는 브라우저입니다.
    </iframe>

    <script>
        function loadDashboard() {
            // iframe 요소를 찾습니다.
            const iframe = document.getElementById('dashboardFrame');
            
            // iframe의 src 속성에 PDM 대시보드 URL을 설정합니다.
            iframe.src = 'http://midas-dev.hsvina.com/Windchill/midas/dashboard/dsbdCommonPageForm?pageName=seasonReadinessDashboard';
//             iframe.src = 'http://midas-dev.hsvina.com/Windchill/midas/report/searchBuyReadyEnablementForm';
            console.log('Iframe에 URL을 로드합니다:', iframe.src);
        }
    </script>

</body>
</html>