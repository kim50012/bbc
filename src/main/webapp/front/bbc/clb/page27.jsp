<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sample Standard UI Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/front/scripts/CommonScripts.jsp" %>
	<%@ include file="/front/styles/CommonStyles.jsp" %>
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
</head>
<body>
<div class="container">
    <h2>Sample Standard UI Page</h2>
    <div class="alert">This is a sample alert message for notifications.</div>
    <form id="sampleForm">
        <div class="form-row">
            <div class="form-label">Text Input</div>
            <div class="form-input"><input type="text" name="textInput" class="form-control" placeholder="Enter text"></div>
        </div>
        <div class="form-row">
            <div class="form-label">Password</div>
            <div class="form-input"><input type="password" name="password" class="form-control"></div>
        </div>
        <div class="form-row">
            <div class="form-label">Select</div>
            <div class="form-input">
                <select name="selectBox" class="form-control">
                    <option value="">-- Select --</option>
                    <option value="1">Option 1</option>
                    <option value="2">Option 2</option>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="form-label">Checkbox</div>
            <div class="form-input">
                <label><input type="checkbox" name="chk1"> Check 1</label>
                <label><input type="checkbox" name="chk2"> Check 2</label>
            </div>
        </div>
        <div class="form-row">
            <div class="form-label">Radio</div>
            <div class="form-input">
                <label><input type="radio" name="radioGroup" value="A"> A</label>
                <label><input type="radio" name="radioGroup" value="B"> B</label>
            </div>
        </div>
        <div class="form-row">
            <div class="form-label">Date</div>
            <div class="form-input"><input type="date" name="dateInput" class="form-control"></div>
        </div>
        <div class="button-group">
            <button type="button" class="btn btn-primary" onclick="alert('Save')">저장</button>
            <button type="button" class="btn btn-secondary" onclick="alert('Cancel')">취소</button>
            <button type="button" class="btn btn-danger" onclick="alert('Delete')">삭제</button>
            <button type="button" class="btn btn-success" onclick="alert('Apply')">신청</button>
            <button type="button" class="btn btn-warning" onclick="alert('Edit')">수정</button>
            <button type="button" class="btn btn-info" onclick="alert('View')">보기</button>
            <button type="button" class="btn btn-dark" onclick="alert('Search')">조회</button>
        </div>
    </form>
    <!-- Tab Component Start -->
    <div class="tab-container" style="margin-top:40px;">
        <ul class="tab-list">
            <li class="tab-item active" data-tab="tab1">Tab 1</li>
            <li class="tab-item" data-tab="tab2">Tab 2</li>
            <li class="tab-item" data-tab="tab3">Tab 3</li>
        </ul>
        <div class="tab-content" id="tab1" style="display:block;">
            <p>This is Tab 1 content.</p>
        </div>
        <div class="tab-content" id="tab2" style="display:none;">
            <p>This is Tab 2 content.</p>
        </div>
        <div class="tab-content" id="tab3" style="display:none;">
            <p>This is Tab 3 content.</p>
        </div>
    </div>
    <!-- Tab Component End -->
    <h3 style="margin-top:40px;">Sample Grid</h3>
    <div class="grid-table-wrapper">
        <table class="grid-table">
            <thead>
            <tr>
                <th>No</th>
                <th>Name</th>
                <th>Email</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>1</td>
                <td>홍길동</td>
                <td>hong@test.com</td>
                <td>Active</td>
                <td><button class="btn btn-info btn-sm">보기</button></td>
            </tr>
            <tr>
                <td>2</td>
                <td>김철수</td>
                <td>kim@test.com</td>
                <td>Inactive</td>
                <td><button class="btn btn-info btn-sm">보기</button></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(function(){
        // Sample jQuery: highlight row on click
        $('.grid-table tbody tr').on('click', function(){
            $(this).toggleClass('selected').siblings().removeClass('selected');
        });

        // Tab functionality
        $('.tab-item').on('click', function(){
            var tabId = $(this).data('tab');
            $('.tab-item').removeClass('active');
            $(this).addClass('active');
            $('.tab-content').removeClass('active').hide();
            $('#' + tabId).addClass('active').show();
        });
    });
</script>
</body>
</html>