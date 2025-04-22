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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자체대회 현황판</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
        /* --- 기본 설정 및 REM 구성 --- */
        html {
            font-size: 62.5%; /* 10px = 1rem */
            height: 100%;
            box-sizing: border-box;
        }

        *, *:before, *:after {
            box-sizing: inherit;
        }

        body {
            font-family: "Malgun Gothic", sans-serif;
            margin: 0;
            padding: 1rem;
            background-color: #1f2328; /* 약간 더 어두운 배경 */
            color: #e6edf3; /* 밝은 기본 텍스트 색상 */
            font-size: 1.6rem;
            min-height: 100%;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        /* --- 대시보드 컨테이너 --- */
        .dashboard-container {
            display: flex; /* 컬럼 래퍼들을 가로로 배치 */
            gap: 1.5rem;
            width: 100%;
            max-width: 192rem;
            padding: 1rem;
            padding-top:0rem;
            align-items: flex-start; /* 상단 정렬 */
        }

        /* --- 컬럼 래퍼 스타일 --- */
        .column-wrapper {
            display: flex;
            flex-direction: column; /* 제목과 컬럼을 세로로 배치 */
            gap: 1.5rem; /* 제목과 컬럼 사이 간격 */
        }
        .column-wrapper.teams-wrapper {
             flex: 0 0 40%; /* 너비 40% */
        }
        .column-wrapper.courts-wrapper {
             flex: 0 0 60%; /* 너비 60% */
        }

        /* --- 컬럼 타이틀 스타일 --- */
        .column-title {
            font-size: 1.5rem; /* 타이틀 크기 */
            color: #e6edf3;
            text-align: center;
            margin: 0; /* 기본 마진 제거 */
            padding-bottom: 1rem;
            border-bottom: 2px solid #373e47; /* 구분선 색상 */
            font-weight: 600;
            text-shadow: 0 0 5px rgba(0, 188, 212, 0.5); /* 모든 타이틀에 사이언 글로우 효과 */
        }
        /* 코트 컬럼 타이틀 글로우 제거 */
        .courts-wrapper .column-title {
             text-shadow: none;
             border-bottom-color: #373e47;
        }


        /* --- 컬럼 스타일 (Grid 사용) --- */
        .column {
            display: grid;
            gap: 1.5rem;
        }

        .teams-column {
            grid-template-columns: repeat(2, 1fr);
            align-content: start;
        }

        .courts-column {
            grid-template-columns: repeat(4, 1fr);
            align-content: start;
        }

        /* --- 카드 스타일링 (기본) --- */
        .card {
            background-color: #262a30; /* 기본 카드 배경색 */
            border-radius: 0.6rem;
            padding: 1.5rem;
            box-shadow: none;
            border: 1px solid #455a64; /* 기본 테두리 (모든 카드 동일) */
            display: flex;
            flex-direction: column;
            overflow-x: auto;
            overflow-y: hidden;
        }
        /* --- 팀 카드 스타일 --- */
        .teams-column .card {
             background-color: #21252b; /* 팀 카드 배경색 (더 어둡게) */
             /* 테두리는 기본값 사용 */
        }
         /* --- 코트 카드 스타일 --- */
        .courts-column .card {
             background-color: #2a2f36; /* 코트 카드 배경색 */
             /* 테두리는 기본값 사용 */
        }

        /* --- 카드 헤더 (제목 + 버튼) --- */
        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid #455a64; /* 기본 구분선 */
            padding-bottom: 1rem;
        }
         /* 팀 카드 헤더 구분선 */
         .teams-column .card .card-header {
             border-bottom-color: #455a64;
         }


        .card .card-header h2 {
            font-size: 1.7rem;
            margin: 0;
            color: #e6edf3; /* 밝은 텍스트 색상 */
            border-bottom: none;
            padding-bottom: 0;
            font-weight: 600;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            flex-grow: 1;
            margin-right: 1rem;
            text-shadow: 0 0 3px rgba(0, 188, 212, 0.4); /* 팀 카드 제목: 사이언 글로우 */
        }
        /* 코트 카드 제목 */
         .courts-column .card h2 {
            font-size: 1.7rem;
            margin: 0;
            margin-bottom: 1.5rem;
            color: #e6edf3; /* 밝은 텍스트 색상 */
            border-bottom: 1px solid #455a64; /* 구분선 색상 통일 */
            padding-bottom: 1rem;
            font-weight: 600;
            text-shadow: 0 0 5px rgba(255, 152, 0, 0.6); /* 주황색 글로우 유지 */
         }


        /* --- 테이블 스타일링 (통일) --- */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 1.4rem;
            table-layout: fixed; /* 레이아웃 고정 */
        }

        th, td {
            border: 1px solid #455a64; /* 모든 그리드 라인 색상 통일 (연하게) */
            padding: 0.9rem 0.8rem;
            padding-left: 0px;
            padding-right: 0px;
            text-align: center;
            color: #e6edf3; /* 밝은 텍스트 */
            vertical-align: middle;
            overflow: hidden;
        }

        th {
            background-color: #373e47; /* 모든 헤더 배경색 통일 */
            font-weight: 600;
            color: #909dab; /* 헤더 텍스트 색상 조정 */
            white-space: nowrap;
        }

         /* 이름/선수 열 스타일 (Ellipsis 적용 - 클래스 사용) */
         .player-name-cell,
         .teams-column td:nth-child(2), /* 팀 카드 이름 셀 */
         th.player-header /* 이름/선수 헤더 */
          {
             white-space: nowrap;
             text-overflow: ellipsis;
             overflow: hidden;
             text-indent: 0;
         }
         /* 코트 카드 순서, 점수 열은 중앙 정렬 */
          .courts-column td:nth-child(1), .courts-column th:nth-child(1),
          .courts-column td:nth-child(3), .courts-column th:nth-child(3) {
              text-align: center;
          }


        /* 기본 행 스타일 */
        tbody tr {
             border: none;
        }

        /* --- 1위 또는 이기는 팀 강조 스타일 --- */
        tbody tr.rank-1,
        tbody tr.winning-team {
            background-color: rgba(0, 188, 212, 0.1); /* 사이언 배경 강조 */
            font-weight: bold;
        }
        tbody tr.rank-1 td,
        tbody tr.winning-team td {
            color: #4dd0e1; /* 밝은 사이언 텍스트 */
        }
        tbody tr td.winning-team {
            background-color: rgba(0, 188, 212, 0.1); /* 사이언 배경 강조 */
            font-weight: bold;
            color: #4dd0e1; /* 밝은 사이언 텍스트 */
        }

        /* --- 순위 숨김 스타일 --- */
        tbody tr.hidden-rank {
           display: none;
        }

        /* --- 코트 카드 부제목 공통 스타일 --- */
        tbody tr.court-subheading-row td {
           padding: 0.6rem 0.8rem;
           font-size: 1.35rem;
           font-weight: bold;
           text-align: center;
           border: 1px solid #455a64; /* 테두리 연하게 통일 */
           border-left: none;
           border-right: none;
           white-space: normal;
           overflow: visible;
        }
        /* --- 현재 경기 부제목 스타일 --- */
        tbody tr.current-match-header td {
             color: #FFA726; /* 밝은 주황색 강조 */
             background-color: #423425; /* 주황색 톤 배경 */
             text-shadow: none; /* 빛 효과 제거 */
        }
         /* --- 다음 경기 부제목 스타일 (덜 강조) --- */
        tbody tr.next-match-header td {
             color: #909dab; /* 덜 강조된 회색 (헤더 텍스트 색상과 동일) */
             background-color: #373e47; /* 기본 헤더 배경색과 동일 */
             /* text-shadow 제거됨 */
        }


        /* 코트 카드 경기 행 스타일 */
        tbody tr.court-match-row td {
            border-left: 1px solid #455a64; /* 테두리 연하게 통일 */
            border-right: 1px solid #455a64;
            border-top: none;
            border-bottom: none;
        }
         /* 각 매치의 첫번째 행 위쪽 테두리 */
         tbody tr.court-match-row.match-row-1 td {
             border-top: 1px solid #455a64;
         }
         /* --- 팀 간 구분선 추가 --- */
         tbody tr.court-match-row.match-row-2 td {
             border-bottom: 1px solid #455a64;
         }
         /* 각 매치의 마지막 행 아래쪽 테두리 */
         tbody tr.court-match-row.match-row-4 td {
             border-bottom: 1px solid #455a64;
         }
         /* rowspan 적용된 셀 테두리 조정 */
         tbody tr.court-match-row td[rowspan] {
             border-top: 1px solid #455a64;
             border-bottom: 1px solid #455a64;
         }


        /* --- 더보기/접기 버튼 컨테이너 제거됨 --- */

        /* --- 더보기/접기 버튼 스타일 (팀 카드) --- */
        .toggle-ranks-button {
            background-color: transparent; /* 배경 투명 */
            color: #00bcd4; /* 사이언 색상 */
            border: 1px solid #00bcd4; /* 사이언 테두리 */
            padding: 0.4rem 0.8rem;
            font-size: 1.2rem;
            border-radius: 0.4rem; /* 약간 더 각지게 */
            cursor: pointer;
            transition: all 0.2s ease;
            flex-shrink: 0;
        }
        .toggle-ranks-button:hover {
            background-color: rgba(0, 188, 212, 0.2); /* 호버 시 배경 */
            color: #4dd0e1;
            border-color: #4dd0e1;
        }
        .toggle-ranks-button.less {
             background-color: rgba(0, 188, 212, 0.2);
             color: #4dd0e1;
             border-color: #4dd0e1;
        }
         .toggle-ranks-button.less:hover {
             background-color: transparent;
             color: #00bcd4;
             border-color: #00bcd4;
         }
         /* 비활성화된 버튼 스타일 제거 */
         /*
         .toggle-ranks-button:disabled { ... }
         */


        /* 로딩 및 오류 메시지 스타일 */
        .loading, .error {
            text-align: center;
            padding: 2rem;
            color: #8b949e; /* 회색 텍스트 */
        }
        .error {
            color: #f85149; /* 오류 텍스트 색상 (빨간색) */
            background-color: #492222; /* 오류 배경색 (어두운 빨간색) */
            border: 1px solid #6b3030;
            border-radius: 0.6rem;
        }
        
        .pdtbLow td {
        	padding-top: 0.8rem;
    		padding-bottom: 0.8rem;
        }

    </style>
</head>
<body>

    <div class="dashboard-container">

        <div class="column-wrapper teams-wrapper">
            <h1 class="column-title">조별 순위</h1>
            <div class="column teams-column">
                <div class="card">
                    <div class="card-header">
                        <h2>A조</h2>
                        </div>
                    <table>
                        <thead>
                            <tr><th>순위</th><th class="player-header">이름</th><th>승</th><th>패</th><th>득실</th></tr>
                        </thead>
                        <tbody id="team-a-data"><tr><td colspan="5" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                     <div class="card-header">
                        <h2>B조</h2>
                    </div>
                    <table>
                        <thead>
                            <tr><th>순위</th><th class="player-header">이름</th><th>승</th><th>패</th><th>득실</th></tr>
                        </thead>
                        <tbody id="team-b-data"><tr><td colspan="5" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                     <div class="card-header">
                        <h2>C조</h2>
                    </div>
                    <table>
                        <thead>
                            <tr><th>순위</th><th class="player-header">이름</th><th>승</th><th>패</th><th>득실</th></tr>
                        </thead>
                        <tbody id="team-c-data"><tr><td colspan="5" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                     <div class="card-header">
                        <h2>D조</h2>
                    </div>
                    <table>
                        <thead>
                            <tr><th>순위</th><th class="player-header">이름</th><th>승</th><th>패</th><th>득실</th></tr>
                        </thead>
                        <tbody id="team-d-data"><tr><td colspan="5" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                     <div class="card-header">
                        <h2>E조</h2>
                    </div>
                    <table>
                        <thead>
                            <tr><th>순위</th><th class="player-header">이름</th><th>승</th><th>패</th><th>득실</th></tr>
                        </thead>
                        <tbody id="team-e-data"><tr><td colspan="5" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                     <div class="card-header">
                        <h2>F조</h2>
                    </div>
                    <table>
                        <thead>
                            <tr><th>순위</th><th class="player-header">이름</th><th>승</th><th>패</th><th>득실</th></tr>
                        </thead>
                        <tbody id="team-f-data"><tr><td colspan="5" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
            </div> </div> <div class="column-wrapper courts-wrapper">
             <h1 class="column-title">경기 순서</h1>
            <div class="column courts-column">
                <div class="card">
                    <h2>1번 코트</h2>
                    <table>
                        <thead>
                             <tr><th>순서</th><th class="player-header">선수</th><th>점수</th></tr>
                        </thead>
                        <tbody id="court-1-data"><tr><td colspan="3" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                    <h2>2번 코트</h2>
                    <table>
                        <thead>
                            <tr><th>순서</th><th class="player-header">선수</th><th>점수</th></tr>
                        </thead>
                        <tbody id="court-2-data"><tr><td colspan="3" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                    <h2>3번 코트</h2>
                    <table>
                        <thead>
                            <tr><th>순서</th><th class="player-header">선수</th><th>점수</th></tr>
                        </thead>
                        <tbody id="court-3-data"><tr><td colspan="3" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
                <div class="card">
                    <h2>4번 코트</h2>
                    <table>
                        <thead>
                            <tr><th>순서</th><th class="player-header">선수</th><th>점수</th></tr>
                        </thead>
                        <tbody id="court-4-data"><tr><td colspan="3" class="loading">로딩중...</td></tr></tbody>
                    </table>
                </div>
            </div> </div> </div>
    <script>
    
        // AJAX를 통해 데이터를 가져와 특정 카드의 테이블을 업데이트하는 함수
        function fetchData(cardId, apiUrl, queryType, courtNo) {
        	var finalYn = "N";
            $.ajax({
                url: apiUrl,
	 	 		data:{
	 	 			para1 : queryType
	 	 			,para2 : "${intClbsq}"
	 	 			,para3 : "${para1}"
		 	 		,para4 : courtNo
	 	 		},
     			type : "POST",
                success: function(dataRetulst) {
                	var data = dataRetulst.list;
                    const tableBody = $('#' + cardId);
                    const isCourtCard = cardId.startsWith('court-');
                    const defaultColspan = isCourtCard ? 3 : 5;
                    const $card = tableBody.closest('.card'); // 현재 카드 찾기
                    const $cardHeader = $card.find('.card-header'); // 카드 헤더 찾기

                    // --- "더보기" 상태 유지 로직 (시작) ---
                    let isCurrentlyExpanded = false;
                    let $existingButton = null;
                    if (!isCourtCard && $cardHeader.length > 0) {
                         $existingButton = $cardHeader.find('.toggle-ranks-button');
                         isCurrentlyExpanded = $existingButton.data('expanded') === true;
                    }
                    // --- "더보기" 상태 유지 로직 (끝) ---

                    tableBody.empty(); // 테이블 내용 비우기
                    if (data.length > 0) {
                        // 팀 카드 처리
                        if (!isCourtCard) {
                            let totalRanks = data.length; // 전체 순위 개수
                            $.each(data, function(index, item) {
                                let rowClass = "";
                                if (item.TEAM_RANK === 1) { rowClass += "rank-1 "; }
                                if (index >= 3 && !isCurrentlyExpanded) {
                                    rowClass += "hidden-rank";
                                }

                                let row = '<tr class="' + rowClass.trim() + '">';
                                row += '<td>' + (item.TEAM_RANK !== undefined ? item.TEAM_RANK : '-') + '</td>';
                                row += '<td class="player-name-cell" title="' + (item.CLB_NIK_NM || '') + '">' + (item.CLB_NIK_NM !== undefined ? item.CLB_NIK_NM : '-') + '</td>';
                                row += '<td>' + (item.WIN !== undefined ? item.WIN : '-') + '</td>';
                                row += '<td>' + (item.LOSE !== undefined ? item.LOSE : '-') + '</td>';
                                row += '<td>' + (item.SCR_MBR !== undefined ? item.SCR_MBR : '-') + '</td>';
                                row += '</tr>';
                                tableBody.append(row);
                            });

                            // 더보기 버튼 상태 업데이트 및 추가 (헤더에)
                            $cardHeader.find('.toggle-ranks-button').remove(); // 기존 버튼 제거
                            const buttonText = isCurrentlyExpanded ? '접기' : '더보기';
                            const buttonClass = isCurrentlyExpanded ? 'toggle-ranks-button less' : 'toggle-ranks-button';
                            // const isDisabled = totalRanks <= 3; // 비활성화 로직 제거됨
                            const $newButton = $(
                                // disabled 속성 제거됨
                                '<button class="' + buttonClass + '" data-target="#' + cardId + '">' + buttonText + '</button>'
                            );
                            // 확장 상태 데이터 저장/갱신
                            $newButton.data('expanded', isCurrentlyExpanded); // isDisabled 조건 제거
                            $cardHeader.append($newButton);

                        }
                        // 코트 카드 처리 (4행 레이아웃)
                        else {
                            let currentMatch = null;
                            let nextMatches = [];
                            $.each(data, function(index, item) {
                                const status = (item.GAME_STATUS || "").trim().toLowerCase();
                                if (status.includes('현재') || status.includes('current')) {
                                    currentMatch = item;
                                } else {
                                    nextMatches.push(item);
                                }
                            });

                            // 현재 경기 표시 - 클래스 추가
                            tableBody.append('<tr class="court-subheading-row current-match-header"><td colspan="' + defaultColspan + '">현재 경기</td></tr>');
                            console.log(currentMatch);
                            if (currentMatch) {
                                // 이기는 팀 결정
                                let team1WinClass = "";
                                let team2WinClass = "";
                                const score1 = currentMatch.A_TEM_SCR;
                                const score2 = currentMatch.B_TEM_SCR;
                                if (score1 > score2) {
                                    team1WinClass = " winning-team";
                                } else if (score2 > score1) {
                                    team2WinClass = " winning-team";
                                }

                                // 4개 행 생성 - 이기는 팀 클래스 추가
                                let row1 = '<tr class="pdtbLow court-match-row match-row-1' + team1WinClass + '">';
                                row1 += '<td class="winning-team" rowspan="4">' + (currentMatch.GAME_SEQ !== undefined ? currentMatch.GAME_SEQ : '-') + '경기</td>';
                                row1 += '<td class="player-name-cell" title="' + (currentMatch.P_NM_A1 || '') + '">' + (currentMatch.P_NM_A1 || '-') + '</td>'; // 선수1
                                row1 += '<td rowspan="2">' + (score1 !== undefined ? score1 : '-') + '</td>';
                                row1 += '</tr>';

                                let row2 = '<tr class="pdtbLow court-match-row match-row-2' + team1WinClass + '">';
                                row2 += '<td class="player-name-cell" title="' + (currentMatch.P_NM_A2 || '') + '">' + (currentMatch.P_NM_A2 || '-') + '</td>'; // 선수2
                                row2 += '</tr>';

                                let row3 = '<tr class="pdtbLow court-match-row match-row-3' + team2WinClass + '">';
                                row3 += '<td class="player-name-cell" title="' + (currentMatch.P_NM_B1 || '') + '">' + (currentMatch.P_NM_B1 || '-') + '</td>'; // 선수3
                                row3 += '<td rowspan="2">' + (score2 !== undefined ? score2 : '-') + '</td>';
                                row3 += '</tr>';

                                let row4 = '<tr class="pdtbLow court-match-row match-row-4' + team2WinClass + '">';
                                row4 += '<td class="player-name-cell" title="' + (currentMatch.P_NM_B2 || '') + '">' + (currentMatch.P_NM_B2 || '-') + '</td>'; // 선수4
                                row4 += '</tr>';

                                tableBody.append(row1 + row2 + row3 + row4);
                            } else {
                                tableBody.append('<tr><td colspan="' + defaultColspan + '">진행중인 경기 없음</td></tr>');
                            }

                            // 다음 경기 표시 - 클래스 추가
                            tableBody.append('<tr class="court-subheading-row next-match-header"><td colspan="' + defaultColspan + '">다음 경기</td></tr>');
                            if (nextMatches.length > 0) {
                                $.each(nextMatches, function(index, item) {
                                    if (nextMatches.P_NM_A1 != "") {
                                        // 다음 경기는 승리팀 강조 안함
                                        let row1 = '<tr class="pdtbLow court-match-row match-row-1">';
                                        row1 += '<td rowspan="4">' + (item.GAME_SEQ !== undefined ? item.GAME_SEQ : '-') + '경기</td>';
                                        row1 += '<td class="player-name-cell" title="' + (item.P_NM_A1 || '') + '">' + (item.P_NM_A1 || '-') + '</td>'; // 선수1
                                        row1 += '<td rowspan="2">' + (item.A_TEM_SCR !== undefined ? item.A_TEM_SCR : '-') + '</td>';
                                        row1 += '</tr>';
                                        let row2 = '<tr class="pdtbLow court-match-row match-row-2">';
                                        row2 += '<td class="player-name-cell" title="' + (item.P_NM_A2 || '') + '">' + (item.P_NM_A2 || '-') + '</td>'; // 선수2
                                        row2 += '</tr>';
                                        let row3 = '<tr class="pdtbLow court-match-row match-row-3">';
                                        row3 += '<td class="player-name-cell" title="' + (item.P_NM_B1 || '') + '">' + (item.P_NM_B1 || '-') + '</td>'; // 선수3
                                        row3 += '<td rowspan="2">' + (item.B_TEM_SCR !== undefined ? item.B_TEM_SCR : '-') + '</td>';
                                        row3 += '</tr>';
                                        let row4 = '<tr class="pdtbLow court-match-row match-row-4">';
                                        row4 += '<td class="player-name-cell" title="' + (item.P_NM_B2 || '') + '">' + (item.P_NM_B2 || '-') + '</td>'; // 선수4
                                        row4 += '</tr>';
                                        tableBody.append(row1 + row2 + row3 + row4);
                                    } else {
                                         tableBody.append('<tr><td>' + (item.GAME_SEQ || '-') + '</td><td>(선수/점수 정보 부족)</td><td>-</td></tr>');
                                    }
                                });
                            } else {
                                tableBody.append('<tr><td colspan="' + defaultColspan + '">예정된 경기 없음</td></tr>');
                            }
                        }
                    } else {
                        tableBody.append('<tr><td colspan="' + defaultColspan + '">표시할 데이터가 없습니다.</td></tr>');
                         if (!isCourtCard) {
                              $cardHeader.find('.toggle-ranks-button').remove();
                         }
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("데이터 가져오기 오류 " + cardId + ": " + textStatus, errorThrown);
                    const tableBody = $('#' + cardId);
                    const isCourtCard = cardId.startsWith('court-');
                    const defaultColspan = isCourtCard ? 3 : 5;
                     if(tableBody.is(':empty')) {
                        tableBody.html('<tr><td colspan="' + defaultColspan + '" class="error">데이터를 로드하지 못했습니다.</td></tr>');
                     }
                     if (!isCourtCard) {
                          const $cardHeader = tableBody.closest('.card').find('.card-header');
                          $cardHeader.find('.toggle-ranks-button').remove();
                     }
                }
            });
        }

        // --- 문서 준비 완료 ---
        $(document).ready(function() {

            // --- 초기 데이터 로드 함수 (변경 없음) ---
            function loadMockData() {
                fetchData('team-a-data', '/front/bbc/badMatch/getData.htm', 'SELECT_DAILY_GAME_MULTI_RANK', "A");
                fetchData('team-b-data', '/front/bbc/badMatch/getData.htm', 'SELECT_DAILY_GAME_MULTI_RANK', "B");
                fetchData('team-c-data', '/front/bbc/badMatch/getData.htm', 'SELECT_DAILY_GAME_MULTI_RANK', "C");
                fetchData('team-d-data', '/front/bbc/badMatch/getData.htm', 'SELECT_DAILY_GAME_MULTI_RANK', "D");
                fetchData('team-e-data', '/front/bbc/badMatch/getData.htm', 'SELECT_DAILY_GAME_MULTI_RANK', "E");
                fetchData('team-f-data', '/front/bbc/badMatch/getData.htm', 'SELECT_DAILY_GAME_MULTI_RANK', "F");
                fetchData('court-1-data', '/front/bbc/badMatch/getData.htm', 'SELECT_MINI_GAME_MULTI_LIST', 1);
                fetchData('court-2-data', '/front/bbc/badMatch/getData.htm', 'SELECT_MINI_GAME_MULTI_LIST', 2);
                fetchData('court-3-data', '/front/bbc/badMatch/getData.htm', 'SELECT_MINI_GAME_MULTI_LIST', 3);
                fetchData('court-4-data', '/front/bbc/badMatch/getData.htm', 'SELECT_MINI_GAME_MULTI_LIST', 4);
            }

            // 초기 데이터 로드 (변경 없음)
             loadMockData();

            // --- 주기적 데이터 새로고침 (변경 없음) ---
            setInterval(function() {
                 loadMockData();
            }, 2000);

            // --- 창 크기 조정 처리 (변경 없음) ---
            function handleResize() {
                const windowWidth = $(window).width();
                if (windowWidth < 768) {
                    $('html').css('font-size', '50%');
                } else if (windowWidth < 1200) {
                     $('html').css('font-size', '56.25%');
                } else {
//                     $('html').css('font-size', '62.5%');
                    $('html').css('font-size', '76%');
                }
            }

            $(window).on('resize', handleResize);
            $(window).trigger('resize');

            // --- 더보기/접기 버튼 이벤트 리스너 (slideToggle 사용) ---
            $('.dashboard-container').on('click', '.toggle-ranks-button', function() {
                const $button = $(this);
                 // 비활성화 로직 제거됨

                const targetTableBodyId = $button.data('target');
                const $hiddenRows = $(targetTableBodyId).find('tr.hidden-rank');
                const $buttonContainer = $button.closest('.card-header'); // 버튼 컨테이너는 이제 card-header

                // 순위가 3개 이하인 경우 토글할 행이 없으므로 버튼 상태만 변경
                if ($hiddenRows.length === 0) {
                     const isExpanding = !$button.hasClass('less');
                     $button.data('expanded', isExpanding); // 상태 저장
                     if (isExpanding) {
                        $button.text('접기').addClass('less');
                     } else {
                        $button.text('더보기').removeClass('less');
                     }
                     return; // 더 이상 진행 안 함
                }

                // 실제 토글 로직
                const isExpanding = !$button.hasClass('less');
                $button.data('expanded', isExpanding); // 현재 상태 저장

                $hiddenRows.slideToggle(200); // 애니메이션 효과 적용

                if (isExpanding) {
                    $button.text('접기').addClass('less');
                } else {
                    $button.text('더보기').removeClass('less');
                }
            });

        });
    </script>

</body>
</html>