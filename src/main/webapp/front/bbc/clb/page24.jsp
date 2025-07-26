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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>QUE</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/@mdi/font@7.4.47/css/materialdesignicons.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* 기본 스타일 및 폰트 설정 */
        body {
            font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            -webkit-user-select: none;
            user-select: none;
        }

        /* 전체 레이아웃 컨테이너 */
        #app-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            max-width: 1400px;
            margin: auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 20px;
            min-height: calc(100vh - 40px);
        }
        
        /* 메인 컨텐츠 영역 (대기열 + 코트) */
        #main-content {
            display: flex;
            gap: 20px;
            flex-grow: 1;
            min-height: 500px;
        }

        /* 좌측: 전체 대기열 */
        #global-queue-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            border: 2px solid #6c757d;
            border-radius: 10px;
            padding: 15px;
            min-width: 315px;
        }
        #global-queue-wrapper h2 {
            margin: 0 0 15px 0;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
            text-align: center;
            color: #333;
        }
        #global-queue {
            overflow-y: auto;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        /* 우측: 경기 코트 */
        #courts-wrapper {
            flex: 2;
            display: flex;
            flex-direction: column;
        }
        .header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        .header h1 { font-size: 24px; color: #333; margin-right: 20px; }
        .court-control-btn {
            width: 50px; height: 50px; font-size: 28px;
            font-weight: bold; color: white;
            background-image: linear-gradient(to bottom, #00aaff, #0077cc);
            border: none; border-radius: 50%; cursor: pointer;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        #court-count {
            font-size: 28px; font-weight: bold; color: #333;
/*             margin: 0 25px; */
            min-width: 40px; text-align: center;
        }
        #refreshBtn {
            margin-left: auto; background-color: #6c757d;
            width: 50px; height: 50px; border-radius: 50%;
            padding: 0; display: flex; align-items: center; justify-content: center;
        }
        #countDown {
            background-color: #6c757d;
            width: 50px; height: 50px; border-radius: 50%;
            padding: 0; display: flex; align-items: center; justify-content: center;
        }
        #fullscreen-btn {
            margin-left: auto; background-color: #6c757d;
            width: 50px; height: 50px; border-radius: 50%;
            padding: 0; display: flex; align-items: center; justify-content: center;
        }
        #fullscreen-btn svg { width: 24px; height: 24px; fill: white; }

        #court-grid {
/*             display: grid; */
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            overflow-y: auto;
        }
        .court {
            border: 2px solid #0077cc; border-radius: 10px;
            padding: 5px; background-color: #f8f9fa;
            margin-bottom: 10px;
        }
        .court-title {
            font-size: 20px; font-weight: bold; color: #0055aa;
            margin-bottom: 10px;
        }

        /* 경기/대기 공통 */
        .game-section { border: 1px solid #ccc; border-radius: 8px; padding: 10px; }
        .section-header {
            display: flex; justify-content: space-between;
            align-items: center; margin-bottom: 10px;
        }
        .section-title { font-weight: bold; font-size: 16px; }
        .header-team-labels { display: flex; align-items: center; gap: 8px; font-weight: bold; }
        .vs-header { font-size: 12px; color: #6c757d; }
        .playing-now .section-title { color: #28a745; }
        .waiting-team .section-title { color: #17a2b8; }
        .team-players {
            display: flex; align-items: center;
            justify-content: space-between; gap: 5px;
        }
        .players-group { 
            display: flex; 
            gap: 5px; 
            align-items: center; 
            min-width: 0; 
        }
        .team-label { font-size: 14px; font-weight: bold; }
        .team-label.team-a { color: #dc3545; }
        .team-label.team-b { color: #007bff; }
        .vs { font-size: 18px; font-weight: bold; color: #dc3545; }

        /* 선수 이름표 */
        .player-tag {
            background-color: #e9ecef; border: 1px solid #ced4da;
            border-radius: 5px; padding: 6px 6px;
            text-align: center; font-size: 15px;
            font-weight: 500; cursor: pointer;
            max-width: 70px; 
            overflow: hidden; 
/*             text-overflow: ellipsis;  */
/*             white-space: nowrap;  */
            transition: all 0.2s ease;
        }
        #waiting-list .player-tag:hover {
            transform: scale(1.05);
        }
        
        /* 대기자 목록 선수 상태 표시 */
        #waiting-list .player-tag.in-queue {
            background-color: #17a2b8; /* 대기열 색상 */
            color: white;
        }
        #waiting-list .player-tag.in-game {
            background-color: #28a745; /* 경기중 색상 */
            color: white;
        }
        
        #waiting-list .player-tag.selected,
        #waiting-list .player-tag.in-queue.selected,
        #waiting-list .player-tag.in-game.selected {
            background-color: #dc3545; /* A팀 색상 */
            color: white;
        }
        #waiting-list .player-tag.selected-team2,
        #waiting-list .player-tag.in-queue.selected-team2,
        #waiting-list .player-tag.in-game.selected-team2 {
            background-color: #007bff; /* B팀 색상 */
            color: white;
        }

        .game-section .player-tag { background-color: #fdfdfe; cursor: default; }

        /* 버튼 */
        .action-btn {
            padding: 8px 15px; border-radius: 5px; border: none;
            color: white; font-weight: bold; cursor: pointer;
        }
        .finish-btn { background-color: #28a745; }
        .cancel-btn { background-color: #dc3545; }
        .save-btn { background-color: #007bff; }
        .cancel-btn2 { background-color: #ffffff; color: #dc3545;}
        .up-btn { background-color: #ffffff; color: #007bff;}
        .down-btn { background-color: #ffffff; color: #007bff;}

        /* 하단 대기자 목록 */
        #waiting-list-container {
            border: 2px solid #6c757d; border-radius: 10px;
            padding: 15px; flex-shrink: 0;
        }
        #waiting-list-container h2 {
            margin: 0 0 15px 0;
            padding-bottom: 15px;
            border-bottom: 2px solid #e0e0e0;
            text-align: center;
            color: #333;
        }
        .waiting-list-header {
            display: flex; justify-content: space-between;
            align-items: center;
/*             margin-bottom: 15px; */
        }
        .waiting-list-title { font-size: 20px; font-weight: bold; color: #495057; }
        .waiting-list-actions { display: flex; gap: 10px; }
        #add-player-btn { background-color: #17a2b8; }
        #add-member-btn { background-color: #17a2b8; }
        #auto-make-game-btn { background-color: #007bff; }
        #waiting-list { display: flex; flex-wrap: wrap; gap: 10px; }

        /* 모달 */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.6); display: none;
            justify-content: center; align-items: center; z-index: 2000;
        }
        .modal-content {
            background: white; padding: 25px; border-radius: 10px;
            width: 90%; max-width: 1200px; text-align: center;
        }
        .modal-content h2 { margin: 0 0 20px; }
        .modal-input-group { margin-bottom: 15px; }
        .modal-input-group input {
            width: 80%; padding: 8px; font-size: 18px; text-align: center;
            border: 1px solid #ccc; border-radius: 5px; margin-top: 8px;
        }
        .modal-actions { margin-top: 25px; display: flex; justify-content: flex-end; gap: 10px; }
        #message-box {
            position: fixed; top: 20px; left: 10px;
/*             transform: translateX(-50%); */
            background-color: #ffc107; color: #333; padding: 15px 25px;
            border-radius: 8px; font-size: 16px; font-weight: bold;
            z-index: 2001; display: none;
        }
        .option-btn {
        	padding: 15px;
        }
        .option-btn.selected {
		    background-color: #007bff;
		    color: white;
		    font-weight: bold;
		    border-color: #007bff;
		}
		.mdi {
			font-size: 24px;
		}
		.mdi-alpha-a-circle {
/* 			color:#9c27b0; */
		}
		.mdi-alpha-b-circle {
/* 			color:#ff5722; */
		}
		.mdi-alpha-c-circle {
/* 			color:#007bff; */
		}
		.mdi-alpha-d-circle {
/* 			color:#4caf50; */
		}
		.mdi-alpha-e-circle {
/* 			color:#ffc107; */
		}
        
        /* ADDED START: 회원 추가 모달 스타일 */
        #member-selection-list {
            max-height: 500px;
            overflow-y: auto;
            border: 1px solid #ddd;
            padding: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
        }
        .member-item {
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            background-color: #f8f9fa;
            transition: background-color 0.2s, color 0.2s;
        }
        .member-item.selected {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }
        /* ADDED END */
        
		/* 이 코드를 <style> 태그 안에 추가하세요. */
		.loader-spinner {
		    border: 8px solid #f3f3f3; /* Light grey */
		    border-top: 8px solid #3498db; /* Blue */
		    border-radius: 50%;
		    width: 60px;
		    height: 60px;
		    animation: spin 1s linear infinite;
		}
		
		@keyframes spin {
		    0% { transform: rotate(0deg); }
		    100% { transform: rotate(360deg); }
		}
		
		/* 초기에 로딩 오버레이는 숨겨둡니다. */
		#loader-overlay {
		    display: none;
		}        
    </style>
</head>
<body>

    <div id="app-container">
        <div id="main-content">
            
            <div id="global-queue-wrapper">
            

                <h2>코트 개수</h2>
	            <div class="header">
	                <button class="court-control-btn" id="decrease-court">-</button>
	                <span id="court-count">2</span>
	                <button class="court-control-btn" id="increase-court">+</button>
	                <button id="refreshBtn" class="action-btn">
	                    <span class="mdi mdi-refresh-circle"></span>
	                </button>
	                <button id="countDown" class="action-btn"></button>
	                <button id="fullscreen-btn" class="action-btn">
	                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M7 14H5v5h5v-2H7v-3zm-2-4h2V7h3V5H5v5zm12 2h-2v3h-3v2h5v-5zm-3-2V5h-2v2h-3v2h5z"/></svg>
	                </button>
	            </div>
	            <div id="court-grid"></div>            
            	<br><br>
                <h2>전체 대기열</h2>
                <div id="global-queue"></div>
            </div>
<!--             <div id="courts-wrapper"> -->
<!--             </div> -->
        </div>
        <div id="waiting-list-container">
            <h2>대기자</h2>
            <div class="waiting-list-header">
                <div class="waiting-list-actions">
                    <button id="auto-make-game-btn" class="action-btn">자동경기매칭</button>
                    <button id="add-member-btn" class="action-btn">회원 추가</button>
                    <button id="add-player-btn" class="action-btn">게스트 추가</button>
                    <button id="add-to-queue-btn" class="action-btn save-btn">대기열 추가</button>
                </div>
            </div>
            <h2></h2>
            <div id="waiting-list"></div>
        </div>
    </div>
    
    <!-- Modals -->
    <div id="score-modal" class="modal-overlay">
        <div class="modal-content">
            <h2>이긴 팀을 클릭해주세요</h2>
            <div class="modal-input-group" style="display:none;">
                <label for="teamA-score">A팀 점수</label>
                <input type="number" id="teamA-score" min="0" value="0">
            </div>
            <div class="modal-input-group" style="display:none;">
                <label for="teamB-score">B팀 점수</label>
                <input type="number" id="teamB-score" min="0" value="0">
            </div>
            <div class="modal-actions" style="display: initial;">
                <button id="save-score-btnA" class="action-btn cancel-btn" style="width: 120px;height: 100px;font-size:30px">A 팀</button>
                <button id="save-score-btnB" class="action-btn save-btn" style="width: 120px;height: 100px;font-size:30px">B 팀</button>
            </div>
            <div class="modal-actions">
                <button id="save-score-btnC" class="action-btn cancel-btn">경기 취소</button>
                <button id="cancel-score-btn" class="action-btn cancel-btn" style="background-color: #495057;">닫기</button>
            </div>
        </div>
    </div>
    
    <div id="add-player-modal" class="modal-overlay">
        <div class="modal-content">
            <h2>게스트 추가</h2>
            <div class="modal-input-group">
                <label for="new-player-name">이름</label>
                <input type="text" id="new-player-name" placeholder="회원 이름 입력">
            </div>
	        <div class="modal-input-group">
	            <div class="option-buttons">
	            	<br>
	                <button class="option-btn" bbCoin="901">남자<br>A조</button>
	                <button class="option-btn" bbCoin="701">남자<br>B조</button>
	                <button class="option-btn" bbCoin="501">남자<br>C조</button>
	                <button class="option-btn" bbCoin="301">남자<br>D조</button>
	                <button class="option-btn" bbCoin="151">남자<br>초심</button>
	            	<br>
	            	<br>
	                <button class="option-btn" bbCoin="651">여자<br>A조</button>
	                <button class="option-btn" bbCoin="551">여자<br>B조</button>
	                <button class="option-btn" bbCoin="451">여자<br>C조</button>
	                <button class="option-btn" bbCoin="251">여자<br>D조</button>
	                <button class="option-btn" bbCoin="141">여자<br>초심</button>
	            </div>
	        </div>             
            <div class="modal-actions">
                <button id="cancel-add-player-btn" class="action-btn cancel-btn">취소</button>
                <button id="save-player-btn" class="action-btn save-btn">저장</button>
            </div>
        </div>
    </div>

    <div id="add-member-modal" class="modal-overlay">
        <div class="modal-content">
            <h2>회원 추가</h2>
            <p>대기자 목록에 추가할 회원을 선택하세요.</p>
            <div id="member-selection-list">
                </div>
            <div class="modal-actions">
                <button id="cancel-add-member-btn" class="action-btn cancel-btn">취소</button>
                <button id="save-members-btn" class="action-btn save-btn">추가하기</button>
            </div>
        </div>
    </div>
    
    <div id="auto-make-game-modal" class="modal-overlay">
        <div class="modal-content">
            <h2>자동 경기 매칭</h2>
            <div class="modal-input-group">
                <label for="target-game-count">인당 게임수</label>
                <input type="text" id="target-game-count" placeholder="인당 게임 횟수 입력">
            </div>
	        <div class="modal-input-group">
	            <div class="option-buttons">
	            	<br>
	                <button class="option-btn" groupingStrategy="SINGLE">전체 인원 1 그룹</button>
	                <button class="option-btn" groupingStrategy="TIERED">레벨에 따른 그룹 지정</button>
	            </div>
	        </div>             
            <div class="modal-actions">
                <button id="cancel-auto-make-game-btn" class="action-btn cancel-btn">취소</button>
                <button id="create-auto-game-btn" class="action-btn save-btn">자동 경기 생성</button>
            </div>
        </div>
    </div>
    <div id="message-box"></div>
	<div id="loader-overlay" class="modal-overlay" style="z-index: 9999;">
	    <div class="loader-spinner"></div>
	</div>

    <script>
    $(document).ready(function() {
        // --- Mock API & 데이터베이스 ---
        var mockDB = {
            players: [],
            allClubMembers: [],
            courts: [],
            waitingQueue: [],
            nextPlayerId: 1,
            nextCourtId: 1
        };

        var mockAPI = {
            _delay: function(ms) { return new Promise(function(resolve) { setTimeout(resolve, ms); }); },

            // ADDED START: 전체 클럽 회원 목록을 가져오는 가상 API
            getAllClubMembers: async function() {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', // 요청 타입
			        data: {
			            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
			            para1: "EXC_MBR_LIST_2",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
                }).then(function(serverData) {
                	var players = serverData.list;
                	mockDB.allClubMembers = [];
                	mockDB.allClubMembers = players;
                    const presentPlayerIds = new Set(mockDB.players.map(p => p.id));
                    const availableMembers = mockDB.allClubMembers.filter(member => !presentPlayerIds.has(member.id));
                    return JSON.parse(JSON.stringify(availableMembers));
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        // 오류 발생 시 콘솔에 상세 정보를 출력합니다.
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            },
            // ADDED START: 개별 회원을 행사에 추가하는 가상 API
            // ADDED START: Mock API to add an individual existing member to the event
            addExistingMemberToEvent: async function(member) {
                return $.ajax({
                    url: '/front/bbc/exc/excJinRegSaveG.htm', // 예시 API 엔드포인트
                    type: 'POST',
                    data: {
		 	 			intExcsq : "${para3}"
		 	 			,strExcjincmt : "참석"
		 	 			,strJobtype : "I"
		 	 			,intExcjintp : "1"
			 	 		,intExcjindly : "0"
				 	 	,intMbrsq : member.id
                    },
                    dataType: 'json'
                }).then(function(response) {
                    // 서버 응답 성공 시, 로컬 DB에도 즉시 반영
                    mockDB.players.push(member);
                    return { success: true };
                }).fail(function() {
                    console.error(member.name + '님 추가 실패.');
                    throw new Error(member.name + "님 추가 중 오류 발생");
                });
            },
            // ADDED END
            getWaitingQueue: async function() {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', // 요청 타입
			        data: {
			            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
			            para1: "GAME_QUEUE_LIST",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
                }).then(function(serverData) {
                    const newWaitingQueue = serverData.list.map(item => {
                        return {
                            rank: item.QUE_RANK,
                            queSq: item.queSq,
                            teamA: [{
                                id: item.id_a1,
                                name: item.name_a1,
                                level: item.level_a1,
                                bbc: item.bbc_a1,
                                clb: item.CLB_SQ // Assuming 'QUE_SQ' is the source for 'clb'
                            }, {
                                id: item.id_a2,
                                name: item.name_a2,
                                level: item.level_a2,
                                bbc: item.bbc_a2,
                                clb: item.CLB_SQ
                            }],
                            teamB: [{
                                id: item.id_b1,
                                name: item.name_b1,
                                level: item.level_b1,
                                bbc: item.bbc_b1,
                                clb: item.CLB_SQ
                            }, {
                                id: item.id_b2,
                                name: item.name_b2,
                                level: item.level_b2,
                                bbc: item.bbc_b2,
                                clb: item.CLB_SQ
                            }]
                        };
                    });

                    mockDB.waitingQueue = [];
                    mockDB.waitingQueue = newWaitingQueue;
                    return JSON.parse(JSON.stringify(newWaitingQueue));
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        // 오류 발생 시 콘솔에 상세 정보를 출력합니다.
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            },
            getCourts: async function() {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', // 요청 타입
			        data: {
			            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
			            para1: "GAME_QUEUE_COURT_LIST",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
                }).then(function(serverData) {
                    const courts = serverData.list.map(item => {
                        return {
                            id: item.id,
                            name: item.name,
                            queSq: item.queSq,
                            teamA: [{
                                id: item.id_a1,
                                name: item.name_a1,
                                level: item.level_a1,
                                bbc: item.bbc_a1,
                                clb: item.QUE_SQ // Assuming 'QUE_SQ' is the source for 'clb'
                            }, {
                                id: item.id_a2,
                                name: item.name_a2,
                                level: item.level_a2,
                                bbc: item.bbc_a2,
                                clb: item.QUE_SQ
                            }],
                            teamB: [{
                                id: item.id_b1,
                                name: item.name_b1,
                                level: item.level_b1,
                                bbc: item.bbc_b1,
                                clb: item.QUE_SQ
                            }, {
                                id: item.id_b2,
                                name: item.name_b2,
                                level: item.level_b2,
                                bbc: item.bbc_b2,
                                clb: item.QUE_SQ
                            }]
                        };
                    });
					const newCourts = mockDB.courts.filter(mockCourt => 
					    !courts.some(existingCourt => existingCourt.id === mockCourt.id)
					);
                    courts.push(...newCourts);
                    const sortedCourts = [...courts].sort((a, b) => a.name.localeCompare(b.name));
                    mockDB.courts = [];
                    mockDB.courts = sortedCourts;
                    return JSON.parse(JSON.stringify(sortedCourts));
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        // 오류 발생 시 콘솔에 상세 정보를 출력합니다.
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            },
            getPlayers: async function() {
				    return $.ajax({
				        url: '/front/bbc/clb/getData.htm',
				        type: 'POST', // 요청 타입
				        data: {
				            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
				            para1: "EXC_MBR_LIST",
				            para2: "${para2}",
				            para3: "${para3}"
				        },
				        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
	                }).then(function(serverData) {
	                	mockDB.players = [];
	                	var players = serverData.list;
						mockDB.players.push(...players);
						$("#totalWaitingCount").html(" ("+players.length+")");
	                	return JSON.parse(JSON.stringify(mockDB.players));
				    }).fail(function(jqXHR, textStatus, errorThrown) {
				        // 오류 발생 시 콘솔에 상세 정보를 출력합니다.
				        console.error("API: Failed to fetch players:", textStatus, errorThrown);
				    });
            },
            addPlayer: async function(name, gCoin) {
                if (mockDB.players.some(function(p) { return p.name === name; })) {
                    throw new Error("이미 존재하는 회원입니다.");
                }
			    return $.ajax({
			        url: '/front/bbc/exc/clbExcJinGsave.htm',
			        type: 'POST', // 요청 타입
			        data: {
			            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
     					intClbsq : "${para2}"
     		 			,strClbniknm : name
     		 			,intClbbbc : gCoin
     		 			,intExcsq : "${para3}"
    		 	 		,strExcjincmt : ""
			        },
			        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
                }).then(function(serverData) {
                    return mockAPI.getPlayers();
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        console.error("API: addPlayer CALLED:", textStatus, errorThrown);
			    });
            },
            addToQueue: async function(teamA_ids, teamB_ids) {
                var team = {
                    teamA: teamA_ids.map(function(id) { return mockDB.players.find(function(p) { return p.id === id; }); }),
                    teamB: teamB_ids.map(function(id) { return mockDB.players.find(function(p) { return p.id === id; }); })
                };
                
                if (team.teamA.some(function(p) { return !p; }) || team.teamB.some(function(p) { return !p; })) {
                    throw new Error("유효하지 않은 선수가 포함되어 있습니다.");
                }
                
                var emptyCourt = mockDB.courts.find(function(c) { return !c.teamA || c.teamA.length === 0; });
                var addType = "GAME_QUEUE_COURT";
                var rankQueue = 0;
                var emptyCourtCd = "";
                if (emptyCourt) {
                    emptyCourt.teamA = team.teamA;
                    emptyCourt.teamB = team.teamB;
                    emptyCourtCd = emptyCourt.id;
                    addType = "GAME_QUEUE_COURT";
                } else {
                	var rankQueue = mockDB.waitingQueue.length + 1;
                    mockDB.waitingQueue.push({ rank: rankQueue, teamA: team.teamA, teamB: team.teamB });
                    addType = "GAME_QUEUE_QUEUE";
                }
                return $.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: addType,
                        para2: "${para2}",
                        para3: "${para3}",
                        para4: emptyCourtCd,
                        para5: team.teamA[0].id,
                        para6: team.teamA[1].id,
                        para7: team.teamB[0].id,
                        para8: team.teamB[1].id,
                        para9: rankQueue
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    if (emptyCourt) {
                        showMessage("경기 등록되었으니 바로 경기를 시작하세요.");
                    } else {
                        showMessage("대기열에 등록되었습니다.");
                    }
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            },
            finishGame: async function(queSq, courtId, scoreA, scoreB, winner) {
                var court = mockDB.courts.find(function(c) { return c.id === courtId; });
                if (!court) throw new Error("코트를 찾을 수 없습니다.");
                var id_a1 = court.teamA[0].id;
                var id_a2 = court.teamA[1].id;
                var id_b1 = court.teamB[0].id;
                var id_b2 = court.teamB[1].id;
                var nextTeamQueSq = "";
                var nextTeamCourtId = "";
                court.teamA = [];
                court.teamB = [];

                if (mockDB.waitingQueue.length > 0) {
                    var nextTeam = mockDB.waitingQueue.shift();
                    nextTeamQueSq = nextTeam.queSq;
                    court.teamA = nextTeam.teamA;
                    court.teamB = nextTeam.teamB;
                    mockDB.waitingQueue.forEach(function(t, i) { t.rank = i + 1; });
                }
                
                return $.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: "GAME_QUEUE_DONE",
                        para2: nextTeamQueSq,
                        para3: courtId,
                        para4: queSq,
                        para5: id_a1,
                        para6: id_a2,
                        para7: id_b1,
                        para8: id_b2,
                        para9: winner,
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    showMessage("경기가 종료되었습니다.");
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            },
            cancelFromQueue: async function(queSq) {
                mockDB.waitingQueue = mockDB.waitingQueue.filter(function(t) { return t.queSq !== queSq; });
                mockDB.waitingQueue.forEach(function(t, i) { t.rank = i + 1; });
                return $.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: "GAME_QUEUE_CANCEL",
                        para4: queSq,
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    showMessage("대기열에서 삭제되었습니다.");
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            },
            createAutoGameEvent: async function(targetGameCount, groupingStrategyValue) {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', // 요청 타입
			        data: {
			            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
			            para1: "GAME_QUEUE_AUTO_MAKE_GAME",
			            para2: "${para2}",
			            para3: "${para3}",
			            para4: targetGameCount,
			            para5: groupingStrategyValue
			        },
			        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
                }).then(function(serverData) {
                    return { success: true };
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        // 오류 발생 시 콘솔에 상세 정보를 출력합니다.
			        console.error("API: Failed to Create Game:", textStatus, errorThrown);
                    throw new Error("자동 경기 매칭 중 오류 발생");
			    });
            },
            _addCourt: async function(reFresh) {
            	if (mockDB.nextCourtId <= 0) {
            		mockDB.nextCourtId = 1;
            	}
                var newCourt = { id: 'c' + mockDB.nextCourtId, name: mockDB.nextCourtId + ' 코트', teamA: [], teamB: [] };
                var nextTeamQueSq = "";
                var nextTeamCourtId = "";
                if (mockDB.waitingQueue.length > 0) {
                    var nextTeam = mockDB.waitingQueue.shift();
                    nextTeamQueSq = nextTeam.queSq;
                    newCourt.teamA = nextTeam.teamA;
                    newCourt.teamB = nextTeam.teamB;
                    mockDB.waitingQueue.forEach(function(t, i) { t.rank = i + 1; });

                    mockDB.courts.push(newCourt);
                    mockDB.nextCourtId++;

                    $.ajax({
                        url: '/front/bbc/clb/getData.htm',
                        type: 'POST',
                        data: {
                            para1: "GAME_QUEUE_START_GAME",
                            para3: newCourt.id,
                            para4: nextTeamQueSq,
                        },
                        dataType: 'json'
                    }).then(function(serverData) {
                        showMessage("새 코트가 추가 되었습니다.");
                        if (reFresh) {
                            fetchAllDataAndRender();
                        }
                        return newCourt;
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.error("API: Failed to fetch players:", textStatus, errorThrown);
                        return { success: false };
                    });
                }
                else {
                    showMessage("코트가 추가 되었습니다.");
                    if (reFresh) {
                        fetchAllDataAndRender();
                    }
                    mockDB.courts.push(newCourt);
                    mockDB.nextCourtId++;
                    return newCourt;
                }
            },
            _removeCourt: async function() {
//                 if (mockDB.courts.length <= 1) {
//                     throw new Error("최소 1개의 코트가 필요합니다.");
//                 }
                const courtToRemove = mockDB.courts[mockDB.courts.length - 1];
                const liveCourt = mockDB.courts.find(c => c.id === courtToRemove.id);
                if (liveCourt && liveCourt.teamA && (!Array.isArray(liveCourt.teamA) || liveCourt.teamA.length > 0)) {
                    throw new Error("코트 " + courtToRemove.name + "에는 팀이 배정되어 삭제할 수 없습니다.");
                }
                const removedCourt = mockDB.courts.pop();
                mockDB.nextCourtId = mockDB.nextCourtId - 1;
                return removedCourt;
            },
            _initializeDB: function(players, courtCount) {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', // 요청 타입
			        data: {
			            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
			            para1: "EXC_MBR_LIST",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
                }).then(function(serverData) {
                	var players = serverData.list;
	                 mockDB.players = players.map(function(player) {
		                 return {
		                     id: player.id,       // user 데이터의 id를 사용
		                     name: player.name,   // user 데이터의 name을 사용
		                     level: player.level,
		                     bbc: player.bbc,
		                     gameCnt: player.gameCnt,
		                     clb: player.clb
		                 };
		             });
                    mockDB.courts = [];
                    mockDB.nextCourtId = 1;
                    for(var i=0; i<courtCount; i++) {
                        mockAPI._addCourt(false);
                    }
                    fetchAllDataAndRender();
                    startAutoRefreshCountdown();
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        // 오류 발생 시 콘솔에 상세 정보를 출력합니다.
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            }
        };

        // --- UI 렌더링 함수 ---
        function renderAll(data) {
            renderWaitingQueue(data.queue);
            renderCourts(data.courts);
            renderPlayers(data.players, data.courts, data.queue);
        }

        function renderWaitingQueue(queueData) {
            var $queue = $('#global-queue').empty();
            if (!queueData) return;
            queueData.forEach(function(team) {
                var teamHtml = createTeamHtmlFromData2(team.teamA, team.teamB);
                var waitingTeamHtml =
                    '<div class="waiting-team game-section" style="margin: 5px;" data-quesq="' + team.queSq + '">' +
                        '<div class="section-header">' +
                            '<span class="section-title">대기 ' + team.rank + '순위</span>' +
//                             '<div class="header-team-labels">' +
//                                 '<span class="team-label team-a">A팀</span><span class="vs-header">vs</span><span class="team-label team-b">B팀</span>' +
//                             '</div>' +
                            '<button class="action-btn up-btn" style="padding:0;"><span class="mdi mdi-arrow-up-bold-circle"></span></button>' +
                            '<button class="action-btn down-btn" style="padding:0;"><span class="mdi mdi-arrow-down-bold-circle"></span></button>' +
                            '<button class="action-btn cancel-btn2" style="padding:0;"><span class="mdi mdi-close-circle"></span></button>' +
                        '</div>' +
                        '<div class="team-players">' + teamHtml + '</div>' +
                    '</div>';
                $queue.append(waitingTeamHtml);
            });
        }

        function renderCourts(courtsData) {
            $('#court-grid').empty();
            if (!courtsData) return;
            $('#court-count').text(courtsData.length);
            courtsData.forEach(function(court) {
                var teamHtml = (court.teamA && court.teamA.length > 0) ? createTeamHtmlFromData(court.teamA, court.teamB) : '';
                var courtHtml =
                    '<div class="court" id="' + court.id + '" queSq="'+court.queSq+'">' +
                        '<div class="court-title">' + court.name + '</div>' +
                        '<div class="playing-now game-section">' +
                            '<div class="section-header">' +
                                '<span class="section-title">경기중</span>' +
                                '<div class="header-team-labels" style="' + (teamHtml ? '' : 'display:none;') + '">' +
                                    '<span class="team-label team-a">A팀</span><span class="vs-header">vs</span><span class="team-label team-b">B팀</span>' +
                                '</div>' +
                                '<button class="action-btn finish-btn" style="' + (teamHtml ? '' : 'display:none;') + '">종료</button>' +
                            '</div>' +
                            '<div class="team-players">' + teamHtml + '</div>' +
                        '</div>' +
                    '</div>';
                $('#court-grid').append(courtHtml);
            });
        }
        
        function renderPlayers(playersData, courtsData, queueData) {
            var $list = $('#waiting-list');
            var currentSelections = {
                selected: $list.find('.player-tag.selected').map(function() { return $(this).data('player-id'); }).get(),
                selected_team2: $list.find('.player-tag.selected-team2').map(function() { return $(this).data('player-id'); }).get()
            };
            
            $list.empty();

            if (!playersData) return;
            var inGameIds = (courtsData || []).flatMap(function(c) { return [].concat(c.teamA || [], c.teamB || []); }).map(function(p) { return p ? p.id : null; }).filter(Boolean);
            var inQueueIds = (queueData || []).flatMap(function(t) { return [].concat(t.teamA || [], t.teamB || []); }).map(function(p) { return p ? p.id : null; }).filter(Boolean);

            playersData.forEach(function(player) {
            	var gameCntTag = " [" + player.gameCnt + "]";
                var $tag = $(createPlayerTag(player.name, player.id, player.level, gameCntTag));
                
                if (inGameIds.includes(player.id)) $tag.addClass('in-game');
                else if (inQueueIds.includes(player.id)) $tag.addClass('in-queue');

                if (currentSelections.selected.includes(player.id)) $tag.addClass('selected');
                if (currentSelections.selected_team2.includes(player.id)) $tag.addClass('selected-team2');

                $list.append($tag);
            });
        }

        // --- 데이터 기반 HTML 생성 ---
//         function createPlayerTag(name, id, level, gameCntTag) { return '<div class="player-tag" data-player-id="' + id + '" title="' + name + '"><span class="mdi mdi-alpha-'+level.toLowerCase()+'-circle">'+gameCntTag+'</span><br>' + name + '</div>'; }
        function createPlayerTag(name, id, level, gameCntTag) { return '<div class="player-tag" data-player-id="' + id + '" title="' + name + '">' + name + gameCntTag + '</div>'; }
        function createTeamHtmlFromData(teamA, teamB) {
            var teamAGroup = (teamA || []).map(function(p) { return p ? createPlayerTag(p.name, p.id, p.level, "") : ''; }).join('');
            var teamBGroup = (teamB || []).map(function(p) { return p ? createPlayerTag(p.name, p.id, p.level, "") : ''; }).join('');
            return (
                '<div class="players-group">' + teamAGroup + '</div>' +
                '<span class="vs">VS</span>' +
                '<div class="players-group">' + teamBGroup + '</div>'
            );
        }
        function createPlayerTag2(name, id, level, gameCntTag) { return '<div class="player-tag" style="overflow: hidden;" data-player-id="' + id + '" title="' + name + '">' + name + '</div>'; }
        function createTeamHtmlFromData2(teamA, teamB) {
            var teamAGroup = (teamA || []).map(function(p) { return p ? createPlayerTag2(p.name, p.id, p.level, "") : ''; }).join('');
            var teamBGroup = (teamB || []).map(function(p) { return p ? createPlayerTag2(p.name, p.id, p.level, "") : ''; }).join('');
            return (
                '<div class="players-group">' + teamAGroup + '</div>' +
                '<span class="vs">VS</span>' +
                '<div class="players-group">' + teamBGroup + '</div>'
            );
        }

        // --- 중앙 데이터 로딩 및 새로고침 ---
        async function fetchAllDataAndRender() {
            try {
                var [queue, courts, players] = await Promise.all([
                    mockAPI.getWaitingQueue(),
                    mockAPI.getCourts(),
                    mockAPI.getPlayers()
                ]);
                renderAll({ queue: queue, courts: courts, players: players });
            } catch (error) {
                showMessage('데이터 로딩 실패: ' + error.message);
            }
        }

        // --- 유틸리티 ---
        function showMessage(msg) { $('#message-box').text(msg).fadeIn().delay(2000).fadeOut(); console.log(msg);}
        function toggleFullScreen() {
          if (!document.fullscreenElement) {
              document.documentElement.requestFullscreen().catch(function(err) { showMessage('전체화면 실패'); });
          } else if (document.exitFullscreen) {
              document.exitFullscreen();
          }
        }

        function startAutoRefreshCountdown() {
            let seconds = 10;
            setInterval(() => {
                $('#countDown').html(seconds.toString().padStart(2, '0'));
                if (seconds === 1) {
                    console.log('자동 갱신: 데이터를 새로고침합니다.');
                    fetchAllDataAndRender();
                }
                if (seconds <= 0) {
                    seconds = 10;
                } else {
                    seconds--;
                }
            }, 1000);
        }        
        
        // --- 이벤트 핸들러 ---
        $('#increase-court').on('click', async function() {
            if (mockDB.courts.length >= 10) {
                showMessage("최대 10개 코트만 생성 가능합니다.");
                return;
            }
            
            // 로딩 화면 표시
            showMessage("코트를 추가 중입니다. 잠시만 기다려 주세요.");

            try {
                // 코트 추가 비동기 함수 호출
                await mockAPI._addCourt(true);
            } catch (e) {
                // 에러 발생 시 메시지 표시
                showMessage('코트 추가 중 오류가 발생했습니다: ' + e.message);
            } finally {
                // 작업 완료 후 항상 로딩 화면 숨김
//                 $('#loader-overlay').hide();
            }
        });        
        $('#decrease-court').on('click', async function() {
            try {
                await mockAPI._removeCourt();
                fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
        });
        $('#add-player-btn').on('click', function() { $('#add-player-modal').css('display', 'flex'); });
        $('#cancel-add-player-btn, #save-player-btn').on('click', async function() {
            if ($(this).is('#save-player-btn')) {
                var name = $('#new-player-name').val().trim();
                if (!name) { showMessage("이름을 입력하세요."); return; }
                
                var $selectedLevel = $('#add-player-modal .option-btn.selected');
                if ($selectedLevel.length === 0) {
                	showMessage("레벨을 선택해주세요."); // Please select a level.
                    return; // Stop the function
                }
                var bbCoinValue = $selectedLevel.attr('bbCoin');
                
                try {
                    await mockAPI.addPlayer(name, bbCoinValue);
                    await fetchAllDataAndRender();
                } catch (e) { showMessage(e.message); return; }
            }
            $('#add-player-modal').hide();
            $('#new-player-name').val('');
        });
        
        $(document).on('click', '#waiting-list .player-tag', function() {
            var $this = $(this);
            if ($this.hasClass('selected') || $this.hasClass('selected-team2')) {
                $this.removeClass('selected selected-team2');
            } else {
                if ($('#waiting-list .player-tag.selected').length < 2) $this.addClass('selected');
                else if ($('#waiting-list .player-tag.selected-team2').length < 2) $this.addClass('selected-team2');
                else showMessage("선수는 4명까지 선택할 수 있습니다.");
            }
        });

        $('#add-to-queue-btn').on('click', async function() {
            var teamA_ids = $('#waiting-list .player-tag.selected').map(function(i, el) { return $(el).data('player-id'); }).get();
            var teamB_ids = $('#waiting-list .player-tag.selected-team2').map(function(i, el) { return $(el).data('player-id'); }).get();
            if (teamA_ids.length !== 2 || teamB_ids.length !== 2) {
                showMessage("A팀(빨강) 2명, B팀(파랑) 2명을 선택해야 합니다."); return;
            }
            try {
                await mockAPI.addToQueue(teamA_ids, teamB_ids);
                // 대기열 추가 후 선택 해제
                $('#waiting-list .player-tag').removeClass('selected selected-team2');
                await fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
        });

        $(document).on('click', '.finish-btn', function() {
            var courtId = $(this).closest('.court').attr('id');
            var queSq = $(this).closest('.court').attr('queSq');
            $('#score-modal').data('court-id', courtId).data('que-sq', queSq).css('display', 'flex');
        });
        
        $('#save-score-btnA').on('click', async function() {
            var scoreA = $('#teamA-score').val();
            var scoreB = $('#teamB-score').val();
            if (scoreA === '' || scoreB === '') {
                showMessage("점수를 모두 입력해주세요."); return;
            }
            var courtId = $('#score-modal').data('court-id');
            var queSq = $('#score-modal').data('que-sq');
            try {
                await mockAPI.finishGame(queSq, courtId, parseInt(scoreA), parseInt(scoreB), "A");
                await fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
            $('#score-modal').hide();
            $('#teamA-score, #teamB-score').val(0);
        });
        
        $('#save-score-btnB').on('click', async function() {
            var scoreA = $('#teamA-score').val();
            var scoreB = $('#teamB-score').val();
            if (scoreA === '' || scoreB === '') {
                showMessage("점수를 모두 입력해주세요."); return;
            }
            var courtId = $('#score-modal').data('court-id');
            var queSq = $('#score-modal').data('que-sq');
            try {
                await mockAPI.finishGame(queSq, courtId, parseInt(scoreA), parseInt(scoreB), "B");
                await fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
            $('#score-modal').hide();
            $('#teamA-score, #teamB-score').val(0);
        });
        
        $('#save-score-btnC').on('click', async function() {
            var scoreA = $('#teamA-score').val();
            var scoreB = $('#teamB-score').val();
            if (scoreA === '' || scoreB === '') {
                showMessage("점수를 모두 입력해주세요."); return;
            }
            var courtId = $('#score-modal').data('court-id');
            var queSq = $('#score-modal').data('que-sq');
            try {
                await mockAPI.finishGame(queSq, courtId, parseInt(scoreA), parseInt(scoreB), "C");
                await fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
            $('#score-modal').hide();
            $('#teamA-score, #teamB-score').val(0);
        });

        $('#cancel-score-btn').on('click', function() { $('#score-modal').hide(); });
        $('#refreshBtn').on('click', function() { location.reload(); });
        
        $(document).on('click', '.cancel-btn2', async function() {
            var queSq = $(this).closest('.waiting-team').data('quesq');
            try {
            	await mockAPI.cancelFromQueue(queSq);
            	await mockAPI.getPlayers();
                await fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
        });

        $(document).on('click', '.up-btn', async function() {
            var queSq = $(this).closest('.waiting-team').data('quesq');
            var teamRank = $(this).closest('.waiting-team').data('teamrank');
            console.log(queSq);
            console.log(teamRank);
        	if (teamRank==1) {
                showMessage("대기열 순위를 변경할 수 없습니다.");
                return;
        	}

            try {

            	$.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: "GAME_QUEUE_CHANGE_RANK",
    		            para2: "${para2}",
    		            para3: "${para3}",
    		            para4: "UP",
    		            para5: teamRank
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    showMessage("대기열 순위가 변경되었습니다.");
                    fetchAllDataAndRender();
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            	
            } catch(e) { showMessage(e.message); }
        });

        $(document).on('click', '.down-btn', async function() {
            var queSq = $(this).closest('.waiting-team').data('quesq');
            var teamRank = $(this).closest('.waiting-team').data('teamrank');
            console.log(queSq);
            console.log(teamRank);
        	if (teamRank==1) {
                showMessage("대기열 순위를 변경할 수 없습니다.");
                return;
        	}

            try {

            	$.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: "GAME_QUEUE_CHANGE_RANK",
    		            para2: "${para2}",
    		            para3: "${para3}",
    		            para4: "DOWN",
    		            para5: teamRank
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    showMessage("대기열 순위가 변경되었습니다.");
                    fetchAllDataAndRender();
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            	
            } catch(e) { showMessage(e.message); }
        });
        
        $('#fullscreen-btn').on('click', toggleFullScreen);
        $(document).on('fullscreenchange', function() { $('#fullscreen-btn').html(document.fullscreenElement ? exitFullscreenIcon : fullscreenIcon); });

        $('#add-player-modal .option-btn').on('click', function() {
            // Add 'selected' class to the clicked button and remove it from others
            $(this).addClass('selected').siblings().removeClass('selected');
        });        
        $('#auto-make-game-modal .option-btn').on('click', function() {
            // Add 'selected' class to the clicked button and remove it from others
            $(this).addClass('selected').siblings().removeClass('selected');
        });

        // ADDED START: 회원 추가 버튼 클릭 이벤트
        $('#add-member-btn').on('click', async function() {
            try {
                const availableMembers = await mockAPI.getAllClubMembers();
                const $list = $('#member-selection-list').empty();

                if (availableMembers.length === 0) {
                    $list.html('<p>추가할 수 있는 회원이 없습니다.</p>');
                } else {
                    availableMembers.forEach(function(member) {
                        const $memberItem = $('<div class="member-item"></div>')
                            .text(member.name) // + ' (' + member.level.toUpperCase() + '조)')
                            .data('member-data', member);
                        $list.append($memberItem);
                    });
                }
                $('#add-member-modal').css('display', 'flex');
            } catch (error) {
                showMessage('회원 목록을 불러오는 데 실패했습니다: ' + error.message);
            }
        });

        // ADDED START: 자동 경기 매칭 버튼 클릭 이벤트
        $('#auto-make-game-btn').on('click', async function() {
            $('#auto-make-game-modal').css('display', 'flex');
        });

        // ADDED START: 자동 경기 매칭 모달의 '취소' 버튼 이벤트
        $('#cancel-auto-make-game-btn').on('click', function() {
            $('#auto-make-game-modal').hide();
        });

        // ADDED START: 자동 경기 매칭 모달의 '취소' 버튼 이벤트
        $('#create-auto-game-btn').on('click', async function() {
            var targetGameCount = $('#target-game-count').val().trim();
            if (!targetGameCount) { showMessage("인당 최대 경기수를 입력하세요."); return; }
            
            var $selectedLevel = $('#auto-make-game-modal .option-btn.selected');
            if ($selectedLevel.length === 0) {
            	showMessage("자동 경기 매칭 유형을 선택 하세요."); // Please select a level.
                return; // Stop the function
            }
            var groupingStrategyValue = $selectedLevel.attr('groupingStrategy');
            
            try {
                await mockAPI.createAutoGameEvent(targetGameCount, groupingStrategyValue);
                await fetchAllDataAndRender();
            } catch (e) { showMessage(e.message); return; }
            $('#auto-make-game-modal').hide();
            $('#target-game-count').val('');
        });
        

        
        // ADDED START: 회원 추가 모달 내 회원 선택 이벤트
        $(document).on('click', '#member-selection-list .member-item', function() {
            $(this).toggleClass('selected');
        });

        // ADDED START: 회원 추가 모달의 '취소' 버튼 이벤트
        $('#cancel-add-member-btn').on('click', function() {
            $('#add-member-modal').hide();
        });

        // ADDED START: 회원 추가 모달의 '추가하기' 버튼 이벤트
        $('#save-members-btn').on('click', async function() {
            const selectedMembers = [];
            $('#member-selection-list .member-item.selected').each(function() {
                selectedMembers.push($(this).data('member-data'));
            });
            
            if (selectedMembers.length > 0) {           
                for (const member of selectedMembers) {
                    await mockAPI.addExistingMemberToEvent(member);
                }                
                showMessage(selectedMembers.length + '명의 회원이 대기자 목록에 추가되었습니다.');
                await fetchAllDataAndRender(); // UI 새로고침
            }

            $('#add-member-modal').hide();
        });

        // ADDED START: 회원 추가 모달의 '추가하기' 버튼 이벤트
        $('#create-auto-game-btn').on('click', async function() {
            const selectedMembers = [];
            $('#member-selection-list .member-item.selected').each(function() {
                selectedMembers.push($(this).data('member-data'));
            });
            
            if (selectedMembers.length > 0) {           
                for (const member of selectedMembers) {
                    await mockAPI.addExistingMemberToEvent(member);
                }                
                showMessage(selectedMembers.length + '명의 회원이 대기자 목록에 추가되었습니다.');
                await fetchAllDataAndRender(); // UI 새로고침
            }

            $('#add-member-modal').hide();
        });
        
        // ADDED END
        
     	var initialPlayers = JSON.parse("${pageData}".replace(/([a-zA-Z_]+)=/g, '"$1":').replace(/:([a-zA-Z\uac00-\ud7a3].*?)(, |})/g, ':"$1"$2'));
        var fullscreenIcon = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M7 14H5v5h5v-2H7v-3zm-2-4h2V7h3V5H5v5zm12 2h-2v3h-3v2h5v-5zm-3-2V5h-2v2h-3v2h5z"/></svg>';
        var exitFullscreenIcon = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5 16h3v3h2v-5H5v2zm3-8H5v2h5V5H8v3zm6 11h2v-3h3v-2h-5v5zm2-11V5h-2v5h5V8h-3z"/></svg>';
        mockAPI._initializeDB(initialPlayers, 0);
    });
    </script>
</body>
</html>