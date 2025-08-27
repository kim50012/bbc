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
/*             display: flex; */
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
            min-width: 380px;
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
            flex-grow: 2;
            display: ruby;
            justify-content: space-between;
/*             display: flex; */
/*             flex-direction: column; */
            gap: 15px;
/*             max-height: 44rem; */
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
            margin: 0 25px; min-width: 40px; text-align: center;
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
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            overflow-y: auto;
        }
        .court {
            border: 2px solid #0077cc; border-radius: 10px;
            padding: 15px; background-color: #f8f9fa;
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
            text-align: center; 
            font-size: 2.5rem;
            font-weight: 500; 
            cursor: pointer;
            max-width: 12rem;
/*             overflow: hidden;  */
/*             text-overflow: ellipsis; */
/*             white-space: nowrap; */
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
        .waiting-list-header {
            display: flex; justify-content: space-between;
            align-items: center; margin-bottom: 15px;
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
        	padding: 20px;
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
            <div id="courts-wrapper">
                <div class="header">
                    <h1>코트 개수</h1>
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
            </div>
            <div id="global-queue-wrapper" style="margin-top: 10px;">
                <h2>전체 대기열</h2>
                <div id="global-queue"></div>
            </div>
        </div>
        <div id="waiting-list-container">
            <div class="waiting-list-header">
                <div class="waiting-list-title">대기자 <span id="totalWaitingCount"></span></div>
                <div class="waiting-list-actions">
                    <button id="auto-make-game-btn" class="action-btn" style="display:no<c:if test="${(amsClb.CLB_GD == 'A')}">1</c:if>ne;">자동경기매칭</button>
                    <button id="add-member-btn" class="action-btn">회원추가</button>
                    <button id="delete-member-btn" class="action-btn cancel-btn">회원삭제</button>
                    <button id="add-player-btn" class="action-btn" style="display:no<c:if test="${(amsClb.CLB_GD == 'A')}">1</c:if>ne;">게스트추가</button>
                    <button id="add-to-queue-btn" class="action-btn save-btn">대기열추가</button>
                </div>
            </div>
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
                <button id="change-que" class="action-btn cancel-btn" style="background-color: #495057;">대기열로 이동</button>
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
                <button id="save-player-btn" class="action-btn save-btn">게스트추가</button>
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
        var mockDB = {
            players: [],
            allClubMembers: [
                {id: 'user101', name: '김민준', level: 'a', bbc: 901, clb: 1},
                {id: 'user102', name: '이서연', level: 'b', bbc: 551, clb: 1},
                {id: 'user103', name: '박도윤', level: 'c', bbc: 501, clb: 1},
                {id: 'user104', name: '최아린', level: 'a', bbc: 651, clb: 1},
                {id: 'user105', name: '정하준', level: 'd', bbc: 301, clb: 1},
                {id: 'user106', name: '윤지아', level: 'c', bbc: 451, clb: 1}
            ],
            courts: [],
            waitingQueue: [],
            nextPlayerId: 1,
            nextCourtId: 1
        };

        var mockAPI = {
            _delay: function(ms) { return new Promise(function(resolve) { setTimeout(resolve, ms); }); },

            getAllClubMembers: async function() {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', 
			        data: {
			            para1: "EXC_MBR_LIST_2",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' 
                }).then(function(serverData) {
                	var players = serverData.list;
                	mockDB.allClubMembers = [];
                	mockDB.allClubMembers = players;
                    const presentPlayerIds = new Set(mockDB.players.map(p => p.id));
                    const availableMembers = mockDB.allClubMembers.filter(member => !presentPlayerIds.has(member.id));
                    return JSON.parse(JSON.stringify(availableMembers));
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            },
            addExistingMemberToEvent: async function(member) {
                return $.ajax({
                    url: '/front/bbc/exc/excJinRegSaveG.htm', 
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
                    mockDB.players.push(member);
                    return { success: true };
                }).fail(function() {
                    console.error(member.name + '님 추가 실패.');
                    throw new Error(member.name + "님 추가 중 오류 발생");
                });
            },
            getWaitingQueue: async function() {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', 
			        data: {
			            para1: "GAME_QUEUE_LIST",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' 
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
                                clb: item.CLB_SQ 
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
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            },
            getCourts: async function() {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', 
			        data: {
			            para1: "GAME_QUEUE_COURT_LIST",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' 
                }).then(function(serverData) {
                    const courts = serverData.list.map(item => {
                        // Check if teamA and teamB player IDs are valid (not null/empty)
                        const isTeamAValid = item.id_a1 && item.id_a1 !== '' && item.id_a2 && item.id_a2 !== '';
                        const isTeamBValid = item.id_b1 && item.id_b1 !== '' && item.id_b2 && item.id_b2 !== '';
                        return {
                            id: item.id,
                            name: item.name,
                            queSq: item.queSq,
                            teamA: isTeamAValid ? [{
                                id: item.id_a1,
                                name: item.name_a1,
                                level: item.level_a1,
                                bbc: item.bbc_a1,
                                clb: item.QUE_SQ 
                            }, {
                                id: item.id_a2,
                                name: item.name_a2,
                                level: item.level_a2,
                                bbc: item.bbc_a2,
                                clb: item.QUE_SQ
                            }] : [],
                            teamB: isTeamBValid ? [{
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
                            }] : []
                        };
                    });
                    const sortedCourts = [...courts].sort((a, b) => a.name.localeCompare(b.name));
                    mockDB.courts = [];
                    mockDB.courts = sortedCourts;
                    return JSON.parse(JSON.stringify(sortedCourts));
			    }).fail(function(jqXHR, textStatus, errorThrown) {
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            },
            getPlayers: async function() {
				    return $.ajax({
				        url: '/front/bbc/clb/getData.htm',
				        type: 'POST', 
				        data: {
				            para1: "EXC_MBR_LIST",
				            para2: "${para2}",
				            para3: "${para3}"
				        },
				        dataType: 'json' 
	                }).then(function(serverData) {
	                	mockDB.players = [];
	                	var players = serverData.list;
						mockDB.players.push(...players);
						$("#totalWaitingCount").html(" ("+players.length+")");
	                	return JSON.parse(JSON.stringify(mockDB.players));
				    }).fail(function(jqXHR, textStatus, errorThrown) {
				        console.error("API: Failed to fetch players:", textStatus, errorThrown);
				    });
            },
            addPlayer: async function(name, gCoin) {
                if (mockDB.players.some(function(p) { return p.name === name; })) {
                    throw new Error("이미 존재하는 회원입니다.");
                }
			    return $.ajax({
			        url: '/front/bbc/exc/clbExcJinGsave.htm',
			        type: 'POST', 
			        data: {
     					intClbsq : "${para2}"
     		 			,strClbniknm : name
     		 			,intClbbbc : gCoin
     		 			,intExcsq : "${para3}"
    		 	 		,strExcjincmt : ""
			        },
			        dataType: 'json' 
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
                    var urlLink = "http://kr.bbcoin.net:8080/front/bbc/clb/getPage.htm?intClbsq=59&pageName=page24&para1=EXC_MBR_LIST&para2=${para2}&para3=${para3}";
                    if (emptyCourt) {
                        showMessage("경기 등록되었으니 바로 경기를 시작하세요.");
                        var msg = "경기 등록되었으니 바로 경기를 시작하세요.\n\n" + team.teamA[0].name + ", " + team.teamA[1].name + " vs " + team.teamB[0].name + ", " + team.teamB[1].name
//                         sendMsg(team.teamA[0].id, msg, urlLink, "상세보기");
//                         sendMsg(team.teamA[1].id, msg, urlLink, "상세보기");
//                         sendMsg(team.teamB[0].id, msg, urlLink, "상세보기");
//                         sendMsg(team.teamB[1].id, msg, urlLink, "상세보기");
                    } else {
                        showMessage("대기열에 등록되었습니다.");
                        var msg = "대기열에 등록되었습니다.\n\n" + team.teamA[0].name + ", " + team.teamA[1].name + " vs " + team.teamB[0].name + ", " + team.teamB[1].name
//                         sendMsg(team.teamA[0].id, msg, urlLink, "상세보기");
//                         sendMsg(team.teamA[1].id, msg, urlLink, "상세보기");
//                         sendMsg(team.teamB[0].id, msg, urlLink, "상세보기");
//                         sendMsg(team.teamB[1].id, msg, urlLink, "상세보기");
                    }
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            },
            deleteMember: async function(teamA_ids) {
                var team = {
                    teamA: teamA_ids.map(function(id) { return mockDB.players.find(function(p) { return p.id === id; }); })
                };

                var id1 = 0;
                var id2 = 0;
                if (team.teamA.length == 2) {
                	id1 = team.teamA[0].id;
                	id2 = team.teamA[1].id;
                }
                else {
                	id1 = team.teamA[0].id;
                }
                
                return $.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: "EXC_DELETE_MBR",
                        para2: "${para2}",
                        para3: "${para3}",
                        para4: id1,
                        para5: id2
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
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

                var nm_a1 = court.teamA[0].name;
                var nm_a2 = court.teamA[1].name;
                var nm_b1 = court.teamB[0].name;
                var nm_b2 = court.teamB[1].name;
                
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
                    var msg = "";
                    var linkUrl = "";
                    var btnNm = "";
                    if (winner == "C") {
                        msg = "경기가 취소되었습니다.\n" + nm_a1 + ", " + nm_a2 + " vs " + nm_b1 + ", " + nm_b2;
                        linkUrl = "http://kr.bbcoin.net:8080/front/bbc/clb/getPage.htm?intClbsq=59&pageName=page24&para1=EXC_MBR_LIST&para2=${para2}&para3=${para3}";
                        btnNm = "다시하기";
                    }
                    else {
                        msg = "※ 경기가 종료되었습니다.\n\n" + nm_a1 + ", " + nm_a2 + " vs " + nm_b1 + ", " + nm_b2 + "\n\n아래 버튼을 클릭하여 이긴팀을 확인하세요~!";
                        linkUrl = "http://kr.bbcoin.net:8080/front/bbc/clb/getPage.htm?intClbsq=59&pageName=page25&para1="+winner+"&para2=${para2}&para3=${para3}&para4="+queSq;
                        btnNm = "결과보기";
                        sendMsg(id_a1, msg, linkUrl, btnNm);
                        sendMsg(id_a2, msg, linkUrl, btnNm);
                        sendMsg(id_b1, msg, linkUrl, btnNm);
                        sendMsg(id_b2, msg, linkUrl, btnNm);
                    }
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to fetch players:", textStatus, errorThrown);
                    return { success: false };
                });
            },
            changeGameQue: async function(queSq, courtId, scoreA, scoreB, winner) {
                var court = mockDB.courts.find(function(c) { return c.id === courtId; });
                if (!court) throw new Error("코트를 찾을 수 없습니다.");
                var id_a1 = court.teamA[0].id;
                var id_a2 = court.teamA[1].id;
                var id_b1 = court.teamB[0].id;
                var id_b2 = court.teamB[1].id;

                var nm_a1 = court.teamA[0].name;
                var nm_a2 = court.teamA[1].name;
                var nm_b1 = court.teamB[0].name;
                var nm_b2 = court.teamB[1].name;
                
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
                        para1: "GAME_QUEUE_CHANGE",
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
                    showMessage("대기열로 이동되었습니다.");
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
			        type: 'POST', 
			        data: {
			            para1: "GAME_QUEUE_AUTO_MAKE_GAME",
			            para2: "${para2}",
			            para3: "${para3}",
			            para4: targetGameCount,
			            para5: groupingStrategyValue
			        },
			        dataType: 'json' 
                }).then(function(serverData) {
                    return { success: true };
			    }).fail(function(jqXHR, textStatus, errorThrown) {
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
                    mockDB.waitingQueue.forEach(function(t, i) { t.rank = i + 1; });

                    mockDB.nextCourtId++;

                    $.ajax({
                        url: '/front/bbc/clb/getData.htm',
                        type: 'POST',
                        data: {
                            para1: "GAME_QUEUE_ADD_COURT",
                            para2: "WITH_QUE",
                            para3: "${para3}",
                            para4: nextTeamQueSq,
                        },
                        dataType: 'json'
                    }).then(function(serverData) {
                        showMessage("새 코트가 추가 되었습니다.");
                        if (reFresh) {
                            fetchAllDataAndRender();
                        }
                        return { success: true };
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.error("API: Failed to fetch courts:", textStatus, errorThrown);
                        return { success: false };
                    });
                }
                else {

                    $.ajax({
                        url: '/front/bbc/clb/getData.htm',
                        type: 'POST',
                        data: {
                            para1: "GAME_QUEUE_ADD_COURT",
                            para2: "NEW",
                            para3: "${para3}",
                            para4: nextTeamQueSq,
                        },
                        dataType: 'json'
                    }).then(function(serverData) {
                        showMessage("새 코트가 추가 되었습니다.");
                        if (reFresh) {
                            fetchAllDataAndRender();
                        }                        
                        return { success: true };
                    }).fail(function(jqXHR, textStatus, errorThrown) {
                        console.error("API: Failed to fetch courts:", textStatus, errorThrown);
                        return { success: false };
                    });
                }
            },
            _removeCourt: async function() {
                $.ajax({
                    url: '/front/bbc/clb/getData.htm',
                    type: 'POST',
                    data: {
                        para1: "GAME_QUEUE_DELETE_COURT",
                        para3: "${para3}",
                    },
                    dataType: 'json'
                }).then(function(serverData) {
                    fetchAllDataAndRender();
                    return { success: true };
                }).fail(function(jqXHR, textStatus, errorThrown) {
                    console.error("API: Failed to delete courts:", textStatus, errorThrown);
                    return { success: false };
                });
            },
            _initializeDB: function(players, courtCount) {
			    return $.ajax({
			        url: '/front/bbc/clb/getData.htm',
			        type: 'POST', 
			        data: {
			            para1: "EXC_MBR_LIST",
			            para2: "${para2}",
			            para3: "${para3}"
			        },
			        dataType: 'json' 
                }).then(function(serverData) {
                	var players = serverData.list;
	                 mockDB.players = players.map(function(player) {
		                 return {
		                     id: player.id,       
		                     name: player.name,   
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
			        console.error("API: Failed to fetch players:", textStatus, errorThrown);
			    });
            }
        };


        function sendMsg(mbrSq, msg, link, btnNm) {
        	$.ajax({
                url: '/front/bbc/badMatch/sendMsgToKakao.htm',
                type: 'POST',
                data: {
                    para2: mbrSq,
                    para3: msg,
                    para4: link,
                    para5: btnNm
                },
                dataType: 'json'
            }).then(function(serverData) {
                return { success: true };
            }).fail(function(jqXHR, textStatus, errorThrown) {
                return { success: false };
            });
        }
        
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
                    '<div class="waiting-team game-section" style="margin: 5px;width: 46%;" data-quesq="' + team.queSq + '" data-teamrank="' + team.rank + '">' +
                        '<div class="section-header">' +
                            '<span class="section-title">' + team.rank + '순위</span>' +
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
            	var gameCntTag = "["+player.gameCnt+"]";
                var $tag = $(createPlayerTag(player.name, player.id, player.level, gameCntTag));
                
                if (inGameIds.includes(player.id)) $tag.addClass('in-game');
                else if (inQueueIds.includes(player.id)) $tag.addClass('in-queue');

                if (currentSelections.selected.includes(player.id)) $tag.addClass('selected');
                if (currentSelections.selected_team2.includes(player.id)) $tag.addClass('selected-team2');

                $list.append($tag);
            });
        }

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
        
        $('#increase-court').on('click', async function() {
            if (mockDB.courts.length >= 10) {
                showMessage("최대 10개 코트만 생성 가능합니다.");
                return;
            }
            showMessage("코트를 추가 중입니다. 잠시만 기다려 주세요.");

            try {
                await mockAPI._addCourt(true);
            } catch (e) {
                showMessage('코트 추가 중 오류가 발생했습니다: ' + e.message);
            } finally {
            }
        });        
        $('#decrease-court').on('click', async function() {
            try {
                await mockAPI._removeCourt();
            } catch(e) { showMessage(e.message); }
        });
        $('#add-player-btn').on('click', function() { $('#add-player-modal').css('display', 'flex'); });
        $('#cancel-add-player-btn, #save-player-btn').on('click', async function() {
            if ($(this).is('#save-player-btn')) {
                var name = $('#new-player-name').val().trim();
                if (!name) { showMessage("이름을 입력하세요."); return; }
                
                var $selectedLevel = $('#add-player-modal .option-btn.selected');
                if ($selectedLevel.length === 0) {
                	showMessage("레벨을 선택해주세요."); 
                    return; 
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

        $('#change-que').on('click', async function() {
            var courtId = $('#score-modal').data('court-id');
            var queSq = $('#score-modal').data('que-sq');
            try {
                await mockAPI.changeGameQue(queSq, courtId, 0, 0, "D");
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
            $(this).addClass('selected').siblings().removeClass('selected');
        });        
        $('#auto-make-game-modal .option-btn').on('click', function() {
            $(this).addClass('selected').siblings().removeClass('selected');
        });

        $('#add-member-btn').on('click', async function() {
            try {
                const availableMembers = await mockAPI.getAllClubMembers();
                const $list = $('#member-selection-list').empty();

                if (availableMembers.length === 0) {
                    $list.html('<p>추가할 수 있는 회원이 없습니다.</p>');
                } else {
                    availableMembers.forEach(function(member) {
                        const $memberItem = $('<div class="member-item"></div>')
                            .text(member.name)   
                            .data('member-data', member);
                        $list.append($memberItem);
                    });
                }
                $('#add-member-modal').css('display', 'flex');
            } catch (error) {
                showMessage('회원 목록을 불러오는 데 실패했습니다: ' + error.message);
            }
        });

        $('#delete-member-btn').on('click', async function() {
            var teamA_ids = $('#waiting-list .player-tag.selected').map(function(i, el) { return $(el).data('player-id'); }).get();
            try {
                await mockAPI.deleteMember(teamA_ids);
                $('#waiting-list .player-tag').removeClass('selected selected-team2');
                await fetchAllDataAndRender();
            } catch(e) { showMessage(e.message); }
        });
    
        $('#auto-make-game-btn').on('click', async function() {
            $('#auto-make-game-modal').css('display', 'flex');
        });

        $('#cancel-auto-make-game-btn').on('click', function() {
            $('#auto-make-game-modal').hide();
        });

        $('#create-auto-game-btn').on('click', async function() {
            var targetGameCount = $('#target-game-count').val().trim();
            if (!targetGameCount) { showMessage("인당 최대 경기수를 입력하세요."); return; }
            
            var $selectedLevel = $('#auto-make-game-modal .option-btn.selected');
            if ($selectedLevel.length === 0) {
            	showMessage("자동 경기 매칭 유형을 선택 하세요."); 
                return; 
            }
            var groupingStrategyValue = $selectedLevel.attr('groupingStrategy');
            
            try {
                await mockAPI.createAutoGameEvent(targetGameCount, groupingStrategyValue);
                await fetchAllDataAndRender();
            } catch (e) { showMessage(e.message); return; }
            $('#auto-make-game-modal').hide();
            $('#target-game-count').val('');
        });

        $(document).on('click', '#member-selection-list .member-item', function() {
            $(this).toggleClass('selected');
        });

        $('#cancel-add-member-btn').on('click', function() {
            $('#add-member-modal').hide();
        });

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
                await fetchAllDataAndRender(); 
            }

            $('#add-member-modal').hide();
        });

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
                await fetchAllDataAndRender(); 
            }

            $('#add-member-modal').hide();
        });
        
        // --- 앱 시작 ---
     	var initialPlayers = JSON.parse("${pageData}".replace(/([a-zA-Z_]+)=/g, '"$1":').replace(/:([a-zA-Z\uac00-\ud7a3].*?)(, |})/g, ':"$1"$2'));
        var fullscreenIcon = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M7 14H5v5h5v-2H7v-3zm-2-4h2V7h3V5H5v5zm12 2h-2v3h-3v2h5v-5zm-3-2V5h-2v2h-3v2h5z"/></svg>';
        var exitFullscreenIcon = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5 16h3v3h2v-5H5v2zm3-8H5v2h5V5H8v3zm6 11h2v-3h3v-2h-5v5zm2-11V5h-2v5h5V8h-3z"/></svg>';
        mockAPI._initializeDB(initialPlayers, 0);
    });
    </script>
</body>
</html>