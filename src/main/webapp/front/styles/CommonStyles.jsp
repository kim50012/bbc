<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- CommonStyles.jsp: 공통 CSS 라이브러리 및 스타일 import --%>
<!-- Bootstrap CSS (optional, for UI components) -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- 추가 공통 CSS 파일 import 예시 -->
<%-- <link rel="stylesheet" href="/front/styles/your-custom.css"> --%>
    <style>
        html, body { width: 100%; max-width: 100%; overflow-x: hidden; }
        .container { max-width: 1200px; width: 100%; margin: 30px auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px #eee; box-sizing: border-box; }
        .form-row { display: flex; align-items: center; margin-bottom: 16px; }
        .form-label { width: 120px; font-weight: bold; }
        .form-input { flex: 1; min-width: 0; }
        .button-group { margin-top: 24px; display: flex; flex-wrap: wrap; gap: 8px; }
        .button-group button { margin-right: 10px; min-width: 0; word-break: break-all; }
        .grid-table-wrapper { width: 100%; overflow-x: auto; box-sizing: border-box; }
        .grid-table { width: 100%; min-width: 480px; border-collapse: collapse; margin-top: 30px; }
        .grid-table th, .grid-table td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        .grid-table th { background: #f5f5f5; }
        .alert { background: #e7f3fe; color: #31708f; padding: 10px 20px; border-radius: 4px; margin-bottom: 20px; }
        .tab-container { border-top: 1px solid #ddd; padding-top: 20px; }
        .tab-list { list-style: none; padding: 0; display: flex; min-width: 0; }
        .tab-item { padding: 10px 20px; cursor: pointer; border: 1px solid #ddd; border-top-left-radius: 4px; border-top-right-radius: 4px; margin-right: 4px; min-width: 0; word-break: break-all; }
        .tab-item.active { background: #fff; border-bottom: 1px solid #fff; }
        .tab-content { border: 1px solid #ddd; padding: 20px; border-radius: 4px; display: none; }
        .tab-content.active { display: block; }
        /* 모바일 최적화 개선 */
        @media (max-width: 768px) {
            .container { padding: 10px; }
            .form-row { flex-direction: column; align-items: flex-start; }
            .form-label { width: 100%; margin-bottom: 4px; }
            .form-input { width: 100%; }
            .button-group { flex-direction: column; gap: 8px; }
            .button-group button { width: 100%; margin-right: 0; margin-bottom: 8px; }
            .tab-list { flex-direction: column; }
            .tab-item { width: 100%; margin-bottom: 2px; }
            .grid-table-wrapper { width: 100%; }
            .grid-table { min-width: 320px; font-size: 14px; }
            .grid-table th, .grid-table td { font-size: 14px; padding: 6px; }
            h2, h3 { font-size: 1.2em; }
        }
    </style>