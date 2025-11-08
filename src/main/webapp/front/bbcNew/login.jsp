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
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>배드민턴 그라운드 | 동호회 & 대회 포털</title>
    <style>
        /* Apply Inter font globally */
        body {
            font-family: 'Inter', sans-serif;
        }
        /* Flag icons (Placeholders) */
        .flag-icon {
            width: 24px;
            height: 18px;
            background-size: cover;
            background-position: center;
            display: inline-block;
            border-radius: 2px;
            box-shadow: 0 0 2px rgba(0,0,0,0.2);
            vertical-align: middle;
        }
        /* Placeholder Flags - 실제 서비스 시 이미지 URL 교체 필요 */
        .flag-vn { background-image: url('https://placehold.co/24x18/ffffff/DA251D?text=VN'); } /* 베트남 */
        .flag-kr { background-image: url('https://placehold.co/24x18/ffffff/E60013?text=KR'); } /* 대한민국 */
        .flag-cn { background-image: url('https://placehold.co/24x18/ffffff/EE1C25?text=CN'); } /* 중국 */


        /* Club Logo Style */
        .club-logo-img {
            width: 64px;
            height: 64px;
            object-fit: cover;
            border-radius: 0.375rem;
            margin-right: 1rem;
            flex-shrink: 0;
            background-color: #e2e8f0;
        }
        /* Tournament Icon Style */
        .tournament-icon {
            font-size: 1.5rem;
            color: #6366f1; /* indigo-500 */
            margin-right: 0.75rem;
        }
        /* Tournament Type and Status Badge Styles */
        .badge {
            display: inline-block;
            padding: 0.25em 0.6em;
            font-size: 0.75rem;
            font-weight: 600;
            line-height: 1;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: 0.375rem;
            /* margin-left: 0.5rem; /* 뱃지 자체의 왼쪽 마진 제거, 필요시 부모에서 처리 */
        }
        .badge-internal { /* 자체 대회 */
            color: #1d4ed8; /* text-blue-700 */
            background-color: #dbeafe; /* bg-blue-100 */
        }
        .badge-official { /* 공식 대회 */
            color: #057a55; /* text-green-700 */
            background-color: #def7ec; /* bg-green-100 */
        }
        .badge-ongoing { /* 진행중 */
            color: #047857; /* text-emerald-700 */
            background-color: #d1fae5; /* bg-emerald-100 */
        }
        .badge-finished { /* 종료 */
            color: #4b5563; /* text-gray-600 */
            background-color: #e5e7eb; /* bg-gray-200 */
        }
        .loading-text, .error-text {
            text-align: center;
            padding: 2rem;
            color: #6b7280; /* gray-500 */
        }
        /* Base Section Title Style */
        .section-title-base {
            font-size: 1.5rem; /* text-2xl */
            font-weight: 600; /* font-semibold */
            margin-bottom: 2rem; /* mb-8 */
            padding: 1rem; /* p-4 */
            border-radius: 0.5rem; /* rounded-lg */
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); /* shadow-md */
            border-left-width: 4px;
            display: flex;
            align-items: center;
        }
        /* Tournament Section Title Style */
        .section-title-tournaments {
            color: #1e40af; /* text-blue-800 */
            background-color: #dbeafe; /* bg-blue-100 */
            border-color: #3b82f6; /* border-blue-500 */
        }
        /* Club Section Title Style */
        .section-title-clubs {
            color: #065f46; /* text-green-800 */
            background-color: #d1fae5; /* bg-green-100 */
            border-color: #10b981; /* border-green-500 */
        }
        .card-info-label {
            font-weight: 500; /* medium */
            color: #374151; /* gray-700 */
        }
    </style>
</head>
<body class="bg-gray-100">

    <header class="bg-white shadow-md sticky top-0 z-50">
        <nav class="container mx-auto px-6 py-3 flex justify-between items-center">
            <a href="index.html" class="text-2xl font-bold text-indigo-600 flex items-center">
                <i class="fas fa-shuttlecock mr-2"></i>
                <span>배드민턴 그라운드</span>
            </a>

            <div class="hidden md:flex items-center space-x-6">
                <a href="index.html" class="text-gray-600 hover:text-indigo-600 transition duration-300">홈</a>
                <a href="#tournament-info" class="text-gray-600 hover:text-indigo-600 transition duration-300">대회 정보</a>
                <a href="#club-directory" class="text-gray-600 hover:text-indigo-600 transition duration-300">동호회 둘러보기</a>
                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=f8b8ac6fcf571cfe300bc86228b077ce&redirect_uri=http://kr.bbcoin.net:8080/front/bbc/mbr/userAddRequest.htm&scope=profile_nickname,profile_image,account_email,name,gender,birthyear,phone_number,friends,plusfriends,talk_message,openid"
                   class="bg-yellow-400 hover:bg-yellow-500 text-black py-2 px-4 rounded-lg transition duration-300 flex items-center font-semibold">
                    <i class="fas fa-comment mr-2"></i> 카카오 로그인
                </a>

                <div class="relative group">
                    <button class="flex items-center text-gray-600 hover:text-indigo-600 focus:outline-none">
                        <span class="mr-1">언어</span>
                        <i class="fas fa-chevron-down text-xs"></i>
                    </button>
                    <div class="absolute right-0 mt-2 w-32 bg-white rounded-lg shadow-xl hidden group-hover:block z-10">
                        <a href="#" class="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-indigo-100">
                            <span class="flag-icon flag-vn mr-2"></span> Tiếng Việt
                        </a>
                        <a href="#" class="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-indigo-100">
                            <span class="flag-icon flag-kr mr-2"></span> 한국어
                        </a>
                        <a href="#" class="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-indigo-100">
                            <span class="flag-icon flag-cn mr-2"></span> 中文
                        </a>
                    </div>
                </div>
            </div>
            <div class="md:hidden">
                <button id="mobile-menu-button" class="text-gray-600 hover:text-indigo-600 focus:outline-none">
                    <i class="fas fa-bars text-xl"></i>
                </button>
            </div>
        </nav>

        <div id="mobile-menu" class="md:hidden hidden bg-white pb-4">
            <a href="index.html" class="block px-6 py-2 text-gray-600 hover:bg-indigo-50">홈</a>
            <a href="#tournament-info" class="block px-6 py-2 text-gray-600 hover:bg-indigo-50">대회 정보</a>
            <a href="#club-directory" class="block px-6 py-2 text-gray-600 hover:bg-indigo-50">동호회 둘러보기</a>
            <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=f8b8ac6fcf571cfe300bc86228b077ce&redirect_uri=http://kr.bbcoin.net:8080/front/bbc/mbr/userAddRequest.htm&scope=profile_nickname,profile_image,account_email,name,gender,birthyear,phone_number,friends,plusfriends,talk_message,openid"
               class="block px-6 py-2 text-yellow-700 font-semibold hover:bg-yellow-50">
                <i class="fas fa-comment mr-2"></i>카카오 로그인
            </a>
             <div class="px-6 py-2">
                 <span class="text-gray-500 text-sm block mb-2">언어 선택:</span>
                 <a href="#" class="flex items-center py-1 text-gray-700 hover:text-indigo-600">
                     <span class="flag-icon flag-vn mr-2"></span> Tiếng Việt
                 </a>
                 <a href="#" class="flex items-center py-1 text-gray-700 hover:text-indigo-600">
                     <span class="flag-icon flag-kr mr-2"></span> 한국어
                 </a>
                 <a href="#" class="flex items-center py-1 text-gray-700 hover:text-indigo-600">
                     <span class="flag-icon flag-cn mr-2"></span> 中文
                 </a>
             </div>
        </div>
    </header>
    <main>
        <section class="bg-gradient-to-r from-indigo-600 to-purple-600 text-white py-20 md:py-28">
            <div class="container mx-auto px-6 text-center">
                <h1 class="text-4xl md:text-5xl font-bold mb-4 leading-tight">
                    배드민턴 그라운드에 오신 것을 환영합니다!
                </h1>
                <p class="text-lg md:text-xl mb-8 text-indigo-100 max-w-3xl mx-auto">
                    베트남, 한국, 중국의 다양한 배드민턴 동호회와 대회 정보를 만나보세요.
                    쉽게 찾고, 참여하고, 관리할 수 있습니다.
                </p>
                <div class="space-y-4 sm:space-y-0 sm:space-x-4">
                    <a href="#tournament-info" class="inline-block bg-white text-indigo-600 hover:bg-gray-100 font-semibold py-3 px-8 rounded-lg shadow-md transition duration-300 text-lg w-full sm:w-auto">
                        대회 정보 보기
                    </a>
                    <a href="#club-directory" class="inline-block bg-yellow-400 text-gray-900 hover:bg-yellow-300 font-semibold py-3 px-8 rounded-lg shadow-md transition duration-300 text-lg w-full sm:w-auto">
                        동호회 둘러보기
                    </a>
                </div>
            </div>
        </section>
        <section id="tournament-info" class="py-16 bg-gray-50">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">지역별 배드민턴 대회 정보</h2>

                <div class="mb-12">
                    <h3 class="section-title-base section-title-tournaments">
                        <span class="flag-icon flag-vn mr-3"></span> 베트남 대회 정보 (Thông tin giải đấu)
                    </h3>
                    <div id="vietnam-tournaments-grid" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <p class="loading-text col-span-full">베트남 대회 정보를 불러오는 중입니다...</p>
                    </div>
                </div>

                <div class="mb-12">
                    <h3 class="section-title-base section-title-tournaments">
                        <span class="flag-icon flag-kr mr-3"></span> 대한민국 대회 정보
                    </h3>
                    <div id="korea-tournaments-grid" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <p class="loading-text col-span-full">대한민국 대회 정보를 불러오는 중입니다...</p>
                    </div>
                </div>

                <div>
                    <h3 class="section-title-base section-title-tournaments">
                        <span class="flag-icon flag-cn mr-3"></span> 중국 대회 정보 (赛事信息)
                    </h3>
                     <div id="china-tournaments-grid" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <p class="loading-text col-span-full">중국 대회 정보를 불러오는 중입니다...</p>
                    </div>
                </div>
            </div>
        </section>
        <section id="club-directory" class="py-16 bg-white">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center text-gray-800 mb-12">지역별 동호회 둘러보기</h2>

                 <div class="mb-12">
                    <h3 class="section-title-base section-title-clubs">
                        <span class="flag-icon flag-vn mr-3"></span> 베트남 동호회 (Câu lạc bộ)
                    </h3>
                    <div id="vietnam-clubs-grid" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <p class="loading-text col-span-full">베트남 동호회 정보를 불러오는 중입니다...</p>
                    </div>
                </div>

                <div class="mb-12">
                    <h3 class="section-title-base section-title-clubs">
                        <span class="flag-icon flag-kr mr-3"></span> 대한민국 동호회
                    </h3>
                    <div id="korea-clubs-grid" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <p class="loading-text col-span-full">대한민국 동호회 정보를 불러오는 중입니다...</p>
                    </div>
                </div>

                <div>
                    <h3 class="section-title-base section-title-clubs">
                        <span class="flag-icon flag-cn mr-3"></span> 중국 동호회 (俱乐部)
                    </h3>
                    <div id="china-clubs-grid" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                        <p class="loading-text col-span-full">중국 동호회 정보를 불러오는 중입니다...</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer class="bg-gray-800 text-gray-300 py-8 mt-16">
        <div class="container mx-auto px-6 text-center">
            <p>&copy; 2025 배드민턴 그라운드. 모든 권리 보유.</p>
            <div class="mt-4 space-x-6">
                <a href="#" class="hover:text-white transition duration-300">회사 소개</a>
                <a href="#" class="hover:text-white transition duration-300">이용 약관</a>
                <a href="#" class="hover:text-white transition duration-300">개인정보 처리방침</a>
                <a href="#" class="hover:text-white transition duration-300">문의하기</a>
            </div>
        </div>
    </footer>
    <script>
        // API Base URL (주의: 실제 환경에서는 CORS 문제가 발생할 수 있습니다. API 서버에서 적절한 헤더 설정 필요)
        const API_BASE_URL = 'http://kr.bbcoin.net:8080/front/bbcNew/getData.htm';
        const IMG_BASE_URL = 'http://kr.bbcoin.net:8080'; // 이미지 경로가 상대 경로일 경우 사용

        // --- Helper Functions ---
        /**
         * API로부터 데이터를 가져오는 함수
         * @param {string} queryName - API 쿼리 이름 (예: SELECT_MATCH_HEAD_LIST)
         * @param {string} regionCode - 지역 코드 (예: KR, CN, VN)
         * @returns {Promise<Array<Object>>} - 데이터 배열 Promise
         */
        async function fetchData(queryName, regionCode) {
            const url = API_BASE_URL + '?para1=' + queryName + '&para2=' + regionCode;
            try {
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error('HTTP error! status: ' + response.status);
                }
                const data = await response.json();
                // API 응답이 {"list": [...]} 형태이므로 data.list를 반환
                return data.list || [];
            } catch (error) {
                console.error('Error fetching ' + queryName + ' for ' + regionCode + ':', error);
                return []; // 오류 발생 시 빈 배열 반환
            }
        }

        /**
         * 대회 카드 HTML 생성 함수
         * @param {Object} tournament - 대회 정보 객체
         * @returns {string} - 대회 카드 HTML 문자열
         */
        function createTournamentCard(tournament) {
            const typeBadgeClass = tournament.MCH_TYPE === '공식대회' ? 'badge-official' : 'badge-internal';
            const statusBadgeClass = tournament.MCH_STATUS === '진행중' ? 'badge-ongoing' : 'badge-finished';
            const location = tournament.CITY ? tournament.CITY + ', ' + tournament.PLACE : tournament.PLACE;

            let cardHTML = '<div class="bg-white rounded-lg shadow hover:shadow-lg transition duration-300 overflow-hidden flex flex-col">';
            cardHTML += '<div class="p-6 flex-grow">'; // 내용 영역
            cardHTML += '<div class="flex items-center justify-between mb-2">'; // 대회명과 아이콘
            cardHTML += '<h4 class="text-xl font-semibold text-gray-800 truncate" title="' + (tournament.MCH_NM || '') + '">' + (tournament.MCH_NM || '대회명 정보 없음') + '</h4>';
            cardHTML += '<i class="fas fa-trophy tournament-icon ' + (tournament.MCH_TYPE !== '공식대회' ? 'text-yellow-500' : '') + '"></i>';
            cardHTML += '</div>';

            cardHTML += '<p class="text-gray-600 text-sm mb-1">';
            cardHTML += '<i class="fas fa-calendar-alt mr-2 text-gray-500"></i>';
            cardHTML += '날짜: ' + (tournament.MCH_DT || '날짜 정보 없음');
            cardHTML += '</p>';

            cardHTML += '<p class="text-gray-600 text-sm mb-2">'; // 장소 정보 다음으로 유형과 상태를 옮기기 위해 mb-2로 변경
            cardHTML += '<i class="fas fa-map-marker-alt mr-2 text-gray-500"></i>';
            cardHTML += '장소: ' + (location || '장소 정보 없음');
            cardHTML += '</p>';

            cardHTML += '<p class="text-gray-600 text-sm mb-1">';
            cardHTML += '<span class="card-info-label">대회 유형: </span>';
            cardHTML += '<span class="badge ' + typeBadgeClass + '">' + (tournament.MCH_TYPE || '유형 정보 없음') + '</span>';
            cardHTML += '</p>';

            cardHTML += '<p class="text-gray-600 text-sm mb-3">'; // 마지막 정보이므로 mb-3 유지
            cardHTML += '<span class="card-info-label">대회 상태: </span>';
            cardHTML += '<span class="badge ' + statusBadgeClass + '">' + (tournament.MCH_STATUS || '상태 정보 없음') + '</span>';
            cardHTML += '</p>';

            cardHTML += '</div>'; // 내용 영역 끝
            // 상세 보기 링크 삭제됨
            cardHTML += '</div>';
            return cardHTML;
        }

        /**
         * 클럽 카드 HTML 생성 함수
         * @param {Object} club - 클럽 정보 객체
         * @returns {string} - 클럽 카드 HTML 문자열
         */
        function createClubCard(club) {
            let logoSrc = 'https://placehold.co/64x64/e2e8f0/4a5568?text=Logo'; // 기본 플레이스홀더
            if (club.CLB_MAI_IMG_PTH) {
                if (club.CLB_MAI_IMG_PTH.startsWith('http')) {
                    logoSrc = club.CLB_MAI_IMG_PTH;
                } else if (club.CLB_MAI_IMG_PTH.startsWith('/')) {
                    logoSrc = IMG_BASE_URL + club.CLB_MAI_IMG_PTH;
                } else {
                    logoSrc = club.CLB_MAI_IMG_PTH;
                }
            }
            const defaultLogoOnError = "this.onerror=null; this.src='https://placehold.co/64x64/e2e8f0/cccccc?text=Error';";

            let cardHTML = '<div class="bg-gray-50 rounded-lg shadow hover:shadow-lg transition duration-300 overflow-hidden flex flex-col">';
            cardHTML += '<div class="p-6 flex-grow">'; // 내용 영역
            cardHTML += '<div class="flex items-start mb-3">'; // 로고와 클럽명
            cardHTML += '<img src="' + logoSrc + '" alt="' + (club.CLB_NM || '클럽 로고') + '" class="club-logo-img" onerror="' + defaultLogoOnError + '">';
            cardHTML += '<div>';
            cardHTML += '<h4 class="text-xl font-semibold text-gray-800 mb-1">' + (club.CLB_NM || '클럽명 정보 없음') + '</h4>';
            cardHTML += '<p class="text-gray-500 text-xs">' + (club.ATD_ADR_DTL || '주소 정보 없음') + '</p>'; // 주소
            cardHTML += '</div>';
            cardHTML += '</div>';
            cardHTML += '<p class="text-gray-600 text-sm">' + (club.CLB_ITD || '소개 정보 없음') + '</p>'; // 소개
            cardHTML += '</div>'; // 내용 영역 끝
            // 상세 보기 링크 삭제됨
            cardHTML += '</div>';
            return cardHTML;
        }

        /**
         * 특정 그리드 컨테이너에 데이터를 렌더링하는 함수
         * @param {string} gridId - 데이터를 표시할 그리드 요소의 ID
         * @param {Array<Object>} data - 렌더링할 데이터 배열
         * @param {Function} cardCreator - 각 데이터 항목에 대한 카드 HTML 생성 함수
         * @param {string} entityName - 로딩/에러 메시지에 사용될 엔티티 이름 (예: "대회", "동호회")
         */
        function renderData(gridId, data, cardCreator, entityName) {
            const gridElement = document.getElementById(gridId);
            if (!gridElement) {
                console.error('Element with ID ' + gridId + ' not found.');
                return;
            }

            if (!data || data.length === 0) { // 데이터가 null이거나 빈 배열인지 확인
                gridElement.innerHTML = '<p class="error-text col-span-full">' + entityName + ' 정보가 없습니다.</p>';
                return;
            }

            try {
                const cardsHTML = data.map(cardCreator).join('');
                if (cardsHTML.trim() === '') {
                    // cardCreator가 모든 항목에 대해 빈 문자열을 반환한 경우
                    gridElement.innerHTML = '<p class="error-text col-span-full">' + entityName + ' 정보가 없거나, 카드 생성에 실패했습니다.</p>';
                    console.warn('Generated cardsHTML is empty for ' + gridId);
                } else {
                    gridElement.innerHTML = cardsHTML;
                }
            } catch (error) {
                console.error('Error rendering cards for ' + gridId + ':', error);
                gridElement.innerHTML = '<p class="error-text col-span-full">' + entityName + ' 정보를 표시하는 중 오류가 발생했습니다. 개발자 콘솔을 확인해주세요.</p>';
            }
        }

        // --- 페이지 로드 시 데이터 가져오기 및 렌더링 ---
        document.addEventListener('DOMContentLoaded', async () => {
            // 변경된 지역 순서: 베트남, 대한민국, 중국
            const regions = ['VN', 'KR', 'CN'];
            const regionNames = { VN: '베트남', KR: '대한민국', CN: '중국' };
            // HTML ID는 그대로 유지하고, JS에서 호출 순서만 변경
            const tournamentGridIds = { VN: 'vietnam-tournaments-grid', KR: 'korea-tournaments-grid', CN: 'china-tournaments-grid' };
            const clubGridIds = { VN: 'vietnam-clubs-grid', KR: 'korea-clubs-grid', CN: 'china-clubs-grid' };

            for (const region of regions) {
                // 대회 정보
                const tournaments = await fetchData('SELECT_MATCH_HEAD_LIST', region);
                renderData(tournamentGridIds[region], tournaments, createTournamentCard, regionNames[region] + ' 대회');

                // 클럽 정보
                const clubs = await fetchData('SELECT_CLB_LIST', region);
                renderData(clubGridIds[region], clubs, createClubCard, regionNames[region] + ' 동호회');
            }

            // 모바일 메뉴 토글
            const mobileMenuButton = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');
            if (mobileMenuButton && mobileMenu) {
                mobileMenuButton.addEventListener('click', () => {
                    mobileMenu.classList.toggle('hidden');
                });
            }

            // 내부 링크 스무스 스크롤
            const internalLinks = document.querySelectorAll('a[href^="#"]');
            internalLinks.forEach(link => {
                link.addEventListener('click', (e) => {
                    const targetId = link.getAttribute('href');
                    if (targetId && targetId.length > 1 && targetId.startsWith("#")) {
                        e.preventDefault();
                        const targetElement = document.querySelector(targetId);
                        if (targetElement) {
                            targetElement.scrollIntoView({ behavior: 'smooth' });
                        }
                        if (mobileMenu && !mobileMenu.classList.contains('hidden')) {
                            mobileMenu.classList.add('hidden');
                        }
                    }
                });
            });

            // 언어 변경 시뮬레이션 (기존 코드 유지)
            document.querySelectorAll('.group-hover\\:block a, #mobile-menu a').forEach(link => {
                const flagIcon = link.querySelector('.flag-icon');
                if (flagIcon) {
                    link.addEventListener('click', (e) => {
                        e.preventDefault();
                        const langText = link.textContent.trim();
                        console.log('Language selected: ' + langText);
                        alert('언어 변경 시뮬레이션: ' + langText + '. 실제 구현에서는 페이지 새로고침 또는 콘텐츠 업데이트가 필요합니다.');
                    });
                }
            });
        });
    </script>

</body>
</html>