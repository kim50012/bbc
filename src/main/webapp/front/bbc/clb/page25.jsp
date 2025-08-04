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
    <title>경기 결과 애니메이션</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        /* 사용자 정의 스타일 및 애니메이션 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            overflow: hidden; /* 효과가 화면 밖으로 나가지 않도록 */
        }

        /* 승리 애니메이션 (점프) */
        @keyframes victory-jump {
            0%, 100% { transform: translateY(0) scale(1); }
            50% { transform: translateY(-25px) scale(1.15); }
        }
        .animate-victory {
            /* 0.4초 동안 3번 점프 */
            animation: victory-jump 0.4s ease-out 3;
        }

        /* 패배팀 사라지는 애니메이션 */
        @keyframes fade-out {
            from { opacity: 1; transform: scale(1); }
            to { opacity: 0; transform: scale(0.5); visibility: hidden; }
        }
        .animate-fade-out {
            animation: fade-out 0.8s forwards;
        }
        
        /* 승리/리뷰 텍스트 나타나는 애니메이션 */
        @keyframes fade-in-up {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .winner-text {
            animation: fade-in-up 0.5s ease-out forwards;
        }
        .review-box {
             animation: fade-in-up 0.7s ease-out forwards;
        }

        /* 셔틀콕 랠리 애니메이션 경로 정의 */
        /* P1(A팀 좌) -> P4(B팀 우) */
        @keyframes rally-1-to-4 {
            from { top: 25%; left: 25%; transform: rotate(-45deg); }
            50% { top: 45%; transform: rotate(90deg); }
            to { top: 70%; left: 70%; transform: rotate(225deg); }
        }
        /* P4(B팀 우) -> P2(A팀 우) */
        @keyframes rally-4-to-2 {
            from { top: 70%; left: 75%; transform: rotate(225deg); }
            to { top: 25%; left: 70%; transform: rotate(315deg); }
        }
        /* P2(A팀 우) -> P3(B팀 좌) */
        @keyframes rally-2-to-3 {
            from { top: 25%; left: 75%; transform: rotate(-135deg); }
            50% { top: 45%; transform: rotate(90deg); }
            to { top: 70%; left: 25%; transform: rotate(45deg); }
        }
        /* P3(B팀 좌) -> P2(A팀 우) */
        @keyframes rally-3-to-2 {
            from { top: 70%; left: 25%; transform: rotate(45deg); }
            50% { top: 45%; transform: rotate(-90deg); }
            to { top: 25%; left: 70%; transform: rotate(-135deg); }
        }
        /* P2(A팀 우) -> P4(B팀 우) */
        @keyframes rally-2-to-4 {
            from { top: 25%; left: 75%; transform: rotate(45deg); }
            to { top: 70%; left: 70%; transform: rotate(135deg); }
        }
        /* P4(B팀 우) -> P1(A팀 좌) */
        @keyframes rally-4-to-1 {
            from { top: 70%; left: 75%; transform: rotate(-45deg); }
            50% { top: 45%; transform: rotate(-90deg); }
            to { top: 25%; left: 25%; transform: rotate(-225deg); }
        }

        /* 스매시 이펙트 (강화) */
        .animate-smash .flash {
            animation: flash-effect 0.4s ease-out forwards;
        }
        .animate-smash .shockwave {
            animation: shockwave-effect 0.4s ease-out 0.05s forwards; /* 0.05초 지연 시작 */
        }

        @keyframes flash-effect {
            0% { transform: scale(0); opacity: 0.8; }
            50% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); opacity: 0; }
        }

        @keyframes shockwave-effect {
            0% { transform: scale(0.2); opacity: 1; }
            100% { transform: scale(2.5); opacity: 0; }
        }

        /* 화면 흔들림 효과 */
        @keyframes screen-shake {
            0%, 100% { transform: translate(0, 0); }
            20% { transform: translate(4px, -4px) rotate(0.5deg); }
            40% { transform: translate(-4px, 4px) rotate(-0.5deg); }
            60% { transform: translate(4px, 4px) rotate(0.5deg); }
            80% { transform: translate(-4px, -4px) rotate(-0.5deg); }
        }
        .animate-screen-shake {
            animation: screen-shake 0.3s forwards;
        }


        /* 꽃가루 Canvas 스타일 */
        #confetti-canvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 9999;
        }
        
        /* 말풍선 스타일 (개선) */
        .speech-bubble {
            position: absolute;
            background-color: #2d3748; /* bg-gray-800 */
            color: white;
            border-radius: 1rem; /* rounded-lg */
            padding: 8px 16px;
            font-size: 16px;
            font-weight: bold;
            white-space: nowrap;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); /* shadow-md */
            z-index: 10;
            transform: translate(-50%, -120%) scale(0.95);
            left: 50%;
            top: -15px;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.2s ease-in-out, transform 0.2s ease-in-out, visibility 0s 0.2s;
        }

        .speech-bubble.show {
            transform: translate(-50%, -120%) scale(1);
            opacity: 1;
            visibility: visible;
            transition: opacity 0.2s ease-in-out, transform 0.2s ease-in-out;
        }

        .speech-bubble::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-width: 10px 8px 0 8px;
            border-style: solid;
            border-color: #2d3748 transparent transparent transparent;
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <!-- 꽃가루가 표시될 Canvas -->
    <canvas id="confetti-canvas"></canvas>

    <div id="main-container" class="w-full max-w-sm mx-auto bg-white rounded-2xl shadow-xl p-6 border border-gray-200 relative">
        
        <!-- 셔틀콕 -->
        <div id="shuttlecock" class="absolute opacity-0 z-20" style="width: 30px; height: 30px;">
            <img src="/front/bbc/img/shuttlecock.png">
        </div>
        <!-- 스매시 이펙트 -->
        <div id="smash-effect" class="absolute hidden z-30 pointer-events-none flex items-center justify-center w-32 h-32">
            <div class="flash absolute w-full h-full rounded-full bg-white opacity-0"></div>
            <div class="shockwave absolute w-8 h-8 rounded-full border-8 border-yellow-400 opacity-0"></div>
        </div>
        
        <!-- 경기 리뷰 컨테이너 -->
        <div id="review-container" class="absolute inset-0 hidden items-center justify-center p-6 z-40">
            <div id="review-box" class="bg-black bg-opacity-80 text-white p-4 rounded-xl shadow-lg text-center font-bold text-lg">
            </div>
        </div>

        <h1 class="text-3xl font-bold text-center mb-6 text-gray-800">경기 결과</h1>

        <!-- 결과 메시지 영역 -->
        <div id="result-message" class="text-center h-12 flex items-center justify-center"></div>

        <!-- A팀 -->
        <div id="teamA" class="border-2 border-gray-200 rounded-lg p-4 transition-all duration-500 relative">
            <div class="grid grid-cols-2 gap-4 text-center">
                <div id="player1" class="player relative">
                    <div class="speech-bubble"></div>
                    <img src="/front/bbc/img/mine1.png" id="imga1" class="w-24 h-24 mx-auto rounded-full object-cover border-4 border-white shadow-md">
                    <p class="mt-2 font-bold text-gray-700" id="nma1">-</p>
                </div>
                <div id="player2" class="player relative">
                    <div class="speech-bubble"></div>
                    <img src="/front/bbc/img/mine1.png" id="imga2" class="w-24 h-24 mx-auto rounded-full object-cover border-4 border-white shadow-md">
                    <p class="mt-2 font-bold text-gray-700" id="nma2">-</p>
                </div>
            </div>
        </div>

        <div class="text-center my-4 font-extrabold text-2xl text-gray-400">VS</div>

        <!-- B팀 -->
        <div id="teamB" class="border-2 border-gray-200 rounded-lg p-4 transition-all duration-500 relative">
            <div class="grid grid-cols-2 gap-4 text-center">
                <div id="player3" class="player relative">
                    <div class="speech-bubble"></div>
                    <img src="/front/bbc/img/mine1.png" id="imgb1" class="w-24 h-24 mx-auto rounded-full object-cover border-4 border-white shadow-md">
                    <p class="mt-2 font-bold text-gray-700" id="nmb1">-</p>
                </div>
                <div id="player4" class="player relative">
                    <div class="speech-bubble"></div>
                    <img src="/front/bbc/img/mine1.png" id="imgb2" class="w-24 h-24 mx-auto rounded-full object-cover border-4 border-white shadow-md">
                    <p class="mt-2 font-bold text-gray-700" id="nmb2">-</p>
                </div>
            </div>
        </div>

        <!-- 승리 버튼 -->
        <div id="control-buttons" class="grid gap-4 mt-8">
            <button id="teamWinBtn" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-bold py-3 px-4 rounded-lg transition-transform transform hover:scale-105">결과 보기</button>
        </div>

        <!-- 다시하기 버튼 -->
        <div id="reset-container" class="mt-8 text-center hidden">
            <button id="resetBtn" class="w-full bg-gray-500 hover:bg-gray-600 text-white font-bold py-3 px-4 rounded-lg transition-transform transform hover:scale-105">
            	대기열 화면으로 이동<br>(대기열에 등록하고 경기 한판 더 !!)
            </button>
        </div>
    </div>

    <script>
        // DOM 요소 가져오기
        const mainContainer = document.getElementById('main-container');
        const teamA = document.getElementById('teamA');
        const teamB = document.getElementById('teamB');
        const teamWinBtn = document.getElementById('teamWinBtn');
        const resetBtn = document.getElementById('resetBtn');
        const controlButtons = document.getElementById('control-buttons');
        const resetContainer = document.getElementById('reset-container');
        const resultMessage = document.getElementById('result-message');
        const shuttlecock = document.getElementById('shuttlecock');
        const smashEffect = document.getElementById('smash-effect');
        const reviewContainer = document.getElementById('review-container');
        const reviewBox = document.getElementById('review-box');
        
        // 플레이어 요소 가져오기
        const teamAPlayers = teamA.querySelectorAll('.player');
        const teamBPlayers = teamB.querySelectorAll('.player');

        // Confetti Canvas 관련 변수
        const confettiCanvas = document.getElementById('confetti-canvas');
        const confettiCtx = confettiCanvas.getContext('2d');
        let confettiParticles = [];
        let confettiAnimationId;

        // 승리 버튼 클릭 이벤트
        teamWinBtn.addEventListener('click', () => handleWin('${para1}'));

        // 다시하기 버튼 클릭 이벤트
        resetBtn.addEventListener('click', () => {
            window.location = "http://kr.bbcoin.net:8080/front/bbc/clb/getPage.htm?intClbsq=${para2}&pageName=page24&para1=EXC_MBR_LIST&para2=${para2}&para3=${para3}";
        });

        function showSpeechBubble(playerId, text, duration = 800) {
            const playerElement = document.getElementById(playerId);
            const bubble = playerElement.querySelector('.speech-bubble');
            if (bubble) {
                bubble.textContent = text;
                bubble.classList.add('show');
                setTimeout(() => {
                    bubble.classList.remove('show');
                }, duration);
            }
        }

        function handleWin(winner) {
            // 버튼 비활성화
            teamWinBtn.disabled = true;

            const rallyDuration = 550; // 랠리 당 시간(ms)
            let rallySteps;

            if (winner === 'A') {
                rallySteps = [
                    { name: 'rally-1-to-4', duration: rallyDuration, bubble: { player: 'player1', text: '서브' } },
                    { name: 'rally-4-to-2', duration: rallyDuration, bubble: { player: 'player4', text: '리시브' } },
                    { name: 'rally-2-to-3', duration: rallyDuration, smash: true, target: 'player3', bubble: { player: 'player2', text: '스매시' }, scream: { player: 'player3', text: '으악!' } }
                ];
            } else { // B팀 승리
                rallySteps = [
                    { name: 'rally-3-to-2', duration: rallyDuration, bubble: { player: 'player3', text: '서브' } },
                    { name: 'rally-2-to-4', duration: rallyDuration, bubble: { player: 'player2', text: '리시브' } },
                    { name: 'rally-4-to-1', duration: rallyDuration, smash: true, target: 'player1', bubble: { player: 'player4', text: '스매시' }, scream: { player: 'player1', text: '으악!' } }
                ];
            }

            let currentStep = 0;
            function runRally() {
                if (currentStep >= rallySteps.length) {
                    setTimeout(() => {
                        shuttlecock.style.opacity = '0';
                        finalizeWin(winner);
                    }, 100);
                    return;
                }

                const step = rallySteps[currentStep];
                
                // 말풍선 표시
                if (step.bubble) {
                    showSpeechBubble(step.bubble.player, step.bubble.text, 500);
                }
                
                shuttlecock.style.animation = step.name + ' ' + (step.duration / 1000) + 's linear forwards';
                shuttlecock.style.opacity = '1';

                if (step.smash) {
                    setTimeout(() => {
                        triggerSmashEffect(step.target);
                        // "으악!" 말풍선 표시
                        if (step.scream) {
                            showSpeechBubble(step.scream.player, step.scream.text, 800);
                        }
                    }, step.duration - 100); // 애니메이션 끝나기 직전에 스매시
                }

                currentStep++;
                setTimeout(runRally, step.duration);
            }

            runRally();
        }

        function triggerSmashEffect(targetPlayerId) {
            const target = document.getElementById(targetPlayerId);
            const containerRect = mainContainer.getBoundingClientRect();
            const targetRect = target.getBoundingClientRect();

            // 타겟 플레이어 중앙에 위치 설정
            const x = targetRect.left - containerRect.left + (targetRect.width / 2);
            const y = targetRect.top - containerRect.top + (targetRect.height / 2);

            smashEffect.style.left = x + 'px';
            smashEffect.style.top = y + 'px';
            smashEffect.style.transform = 'translate(-50%, -50%)'; // 중앙 정렬

            // Function to play one smash animation
            const playOneSmash = (delay) => {
                setTimeout(() => {
                    smashEffect.classList.remove('animate-smash');
                    mainContainer.classList.remove('animate-screen-shake');
                    void smashEffect.offsetWidth; 

                    smashEffect.classList.remove('hidden');
                    smashEffect.classList.add('animate-smash');
                    mainContainer.classList.add('animate-screen-shake');
                }, delay);
            };

            playOneSmash(0);    // 첫 번째 스매시
            playOneSmash(250);  // 두 번째 스매시 (0.25초 후)

            // 애니메이션 종료 후 다시 숨김
            setTimeout(() => {
                smashEffect.classList.add('hidden');
                smashEffect.classList.remove('animate-smash');
                mainContainer.classList.remove('animate-screen-shake');
            }, 800); 
        }

        function finalizeWin(winner) {
            let winningTeam, losingTeam, winnerText, winnerColor, losingTeamId, winnerNames, loserNames;

            if (winner === 'A') {
                winningTeam = teamAPlayers;
                losingTeam = teamB;
                losingTeamId = 'teamB';
	            winnerText = $("#nma1").html() + ", " + $("#nma2").html() + ' 승리!';
                winnerColor = 'blue';
                teamA.style.borderColor = 'rgb(59 130 246)';
                winnerNames = [$("#nma1").html(), $("#nma2").html()];
                loserNames = [$("#nmb1").html(), $("#nmb2").html()];
            } else {
                winningTeam = teamBPlayers;
                losingTeam = teamA;
                losingTeamId = 'teamA';
	            winnerText = $("#nmb1").html() + ", " + $("#nmb2").html() + ' 승리!';
                winnerColor = 'red';
                teamB.style.borderColor = 'rgb(239 68 68)';
                winnerNames = [$("#nmb1").html(), $("#nmb2").html()];
                loserNames = [$("#nma1").html(), $("#nma2").html()];
            }

            // 패배팀 사라지는 애니메이션 적용
            losingTeam.classList.add('animate-fade-out');

            // 승리팀에 승리 애니메이션 적용
            winningTeam.forEach(player => player.classList.add('animate-victory'));
            
            // 결과 메시지 및 다시하기 버튼 표시
            setTimeout(() => {
                resultMessage.innerHTML = '<span class="text-2xl font-bold text-' + winnerColor + '-500 winner-text">' + winnerText + '</span>';
                controlButtons.classList.add('hidden');
                resetContainer.classList.remove('hidden');
                showConfetti();
                showReview(losingTeamId, winnerNames, loserNames);
            }, 1200); // 승리 애니메이션 시간(0.4s * 3)
        }
        
        function showReview(losingTeamId, winnerNames, loserNames) {
            const reviews = [
                `{loser1} 선수, 오늘 셔틀콕이 야속했나요? {winner1} 선수의 스매시는 거의 음속이었어요!`,
                `관중석에서 {loser2} 선수의 동공지진을 목격했습니다. {winner2} 선수의 플레이, 인정합니다.`,
                `{loser1}와(과) {loser2} 팀, 다음 경기엔 핫식스라도 드시고 오셔야겠어요. {winner1} 선수의 체력은 끝이 없네요.`,
                `해설: '{loser1} 선수, 지금 필요한 건 스피드가 아니라 멘탈 관리입니다!' {winner2} 선수는 이미 즐기고 있네요.`,
                `{winner1}, {winner2} 팀의 호흡은 거의 부부클리닉 수준! {loser1}, {loser2} 팀은 다음엔 좀 더 친해져서 오세요.`,
                `오늘 {loser2} 선수의 네트 앞 순발력은... 마치 월요일 아침의 저 같았네요. {winner1} 선수의 공격은 빛의 속도!`,
                `{winner2} 선수의 스매시에 {loser1} 선수의 영혼이 잠시 가출한 것 같습니다. 괜찮으시죠?`,
                `경기가 끝난 후 {loser2} 선수가 {winner1} 선수에게 '살살 좀 해줘'라고 말했다는 소문이...`,
                `{loser1}, {loser2} 팀, 괜찮아요. 원래 주인공은 마지막에 이기는 법이죠. 오늘은 {winner1}, {winner2} 팀이 주인공!`,
                `오늘 경기의 MVP는 {winner1} 선수도, {winner2} 선수도 아닌... {loser1} 선수를 위로해 줄 치킨이 아닐까요?`
            ];
            const losingTeamEl = document.getElementById(losingTeamId);

            // 1. Position the review container over the losing team's area
            reviewContainer.style.top = losingTeamEl.offsetTop + 'px';
            reviewContainer.style.left = losingTeamEl.offsetLeft + 'px';
            reviewContainer.style.width = losingTeamEl.offsetWidth + 'px';
            reviewContainer.style.height = losingTeamEl.offsetHeight + 'px';

            // 2. Select and format a random review
            const randomIndex = Math.floor(Math.random() * reviews.length);
            let reviewText = reviews[randomIndex];
            reviewText = reviewText.replace('{winner1}', winnerNames[0]).replace('{winner2}', winnerNames[1])
                                   .replace('{loser1}', loserNames[0]).replace('{loser2}', loserNames[1]);

            // 3. Display the review
            reviewBox.innerHTML = reviewText;
            reviewContainer.classList.remove('hidden');
            reviewContainer.classList.add('flex');
            reviewBox.classList.add('review-box');
        }


        // --- Canvas 기반 꽃가루 애니메이션 (물리엔진 개선) ---
        function setupCanvas() {
            const dpr = window.devicePixelRatio || 1;
            const rect = confettiCanvas.getBoundingClientRect();
            confettiCanvas.width = rect.width * dpr;
            confettiCanvas.height = rect.height * dpr;
            confettiCtx.scale(dpr, dpr);
        }

        function Particle(x, y, color) {
            this.x = x;
            this.y = y;
            this.color = color;
            this.radius = Math.random() * 5 + 3; // 파티클 크기
            this.vx = Math.random() * 4 - 2;   // 초기 수평 속도
            this.vy = Math.random() * -2 - 1;  // 초기 수직 속도 (위로 살짝)
            this.opacity = 1;
            this.rotation = Math.random() * 360;
            this.gravity = 0.05; // 중력
            this.drag = 0.99;    // 공기 저항
            this.wobble = Math.random() * 10; // 흔들림 효과를 위한 값
        }

        Particle.prototype.draw = function() {
            confettiCtx.save();
            confettiCtx.beginPath();
            confettiCtx.translate(this.x, this.y);
            confettiCtx.rotate(this.rotation * Math.PI / 180);
            confettiCtx.fillStyle = this.color;
            confettiCtx.globalAlpha = this.opacity;
            confettiCtx.fillRect(-this.radius, -this.radius / 2, this.radius * 2, this.radius);
            confettiCtx.closePath();
            confettiCtx.restore();
        };

        Particle.prototype.update = function() {
            // 속도 업데이트
            this.vy += this.gravity; // 중력 적용
            this.vx *= this.drag;    // 공기 저항 적용

            // 위치 업데이트 (흔들림 효과 추가)
            this.wobble += 0.1;
            this.x += this.vx + Math.sin(this.wobble) * 0.5; // 좌우로 흔들리며 이동
            this.y += this.vy;
            
            // 회전
            this.rotation += this.vx * 0.5;
            
            // 화면 아래로 갈수록 투명도 감소
            if (this.y > confettiCanvas.getBoundingClientRect().height * 0.1) {
                 this.opacity -= 0.008;
            }
            
            this.draw();
        };

        function animateConfetti() {
            // 이전 프레임 지우기
            confettiCtx.clearRect(0, 0, confettiCanvas.width, confettiCanvas.height);

            // 살아있는 파티클만 필터링
            confettiParticles = confettiParticles.filter(p => p.opacity > 0 && p.y < confettiCanvas.height + 20);

            // 파티클이 없으면 애니메이션 중지
            if (confettiParticles.length === 0) {
                cancelAnimationFrame(confettiAnimationId);
                confettiAnimationId = null;
                return;
            }

            // 모든 파티클 업데이트 및 그리기
            confettiParticles.forEach(p => p.update());
            
            // 다음 프레임 요청
            confettiAnimationId = requestAnimationFrame(animateConfetti);
        }

        function showConfetti() {
            setupCanvas();
            // 이미 애니메이션이 실행 중이면 중복 실행 방지
            if (confettiAnimationId) {
                cancelAnimationFrame(confettiAnimationId);
            }
            confettiParticles = [];
            const confettiCount = 80; // 성능을 위해 개수 조정
            const colors = ['#fde68a', '#fca5a5', '#86efac', '#93c5fd', '#c4b5fd', '#fdba74'];

            for (let i = 0; i < confettiCount; i++) {
                const x = Math.random() * confettiCanvas.getBoundingClientRect().width;
                const y = -Math.random() * confettiCanvas.getBoundingClientRect().height * 0.2;
                const color = colors[Math.floor(Math.random() * colors.length)];
                confettiParticles.push(new Particle(x, y, color));
            }
            animateConfetti();
        }

        function initialSeting() {
    	    $.ajax({
    	        url: '/front/bbc/clb/getData.htm',
    	        type: 'POST', // 요청 타입
    	        data: {
    	            // 데이터를 객체 형태로 전달하면 jQuery가 알아서 처리해줍니다.
    	            para1: "EXC_GAME_MEMBER_INFO",
    	            para2: "${para4}"
    	        },
    	        dataType: 'json' // 서버로부터 JSON 형식의 응답을 기대함을 명시합니다.
            }).then(function(data) {
    			if (data.list.length != 0) {
    				$("#nma1").html(data.list[0].MBR_NM_A1);
    				$("#nma2").html(data.list[0].MBR_NM_A2);
    				$("#nmb1").html(data.list[0].MBR_NM_B1);
    				$("#nmb2").html(data.list[0].MBR_NM_B2);
    				$('#imga1').attr('src', data.list[0].IMG_A1);
    				$('#imga2').attr('src', data.list[0].IMG_A2);
    				$('#imgb1').attr('src', data.list[0].IMG_B1);
    				$('#imgb2').attr('src', data.list[0].IMG_B2);
    			}
    	    }).fail(function(jqXHR, textStatus, errorThrown) {
    	    });
        }
        
        $(document).ready(function() {
        	initialSeting();
        });
    </script>

</body>
</html>