<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
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
    <script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
    <title>회원정보 수정</title>
    <style>
        /* Apply Inter font globally */
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6; /* bg-gray-100 */
        }
        /* Custom style for disabled dropdown */
        select:disabled {
            background-color: #e5e7eb; /* bg-gray-200 */
            cursor: not-allowed;
        }
        /* Flag icons for cards */
        .card-flag-icon {
            width: 48px;
            height: 32px;
            background-size: cover;
            background-position: center;
            display: block;
            margin: 0 auto 0.5rem;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        /* Placeholder Flags */
        .flag-kr-card { background-image: url('https://placehold.co/48x32/ffffff/E60013?text=KR'); }
        .flag-cn-card { background-image: url('https://placehold.co/48x32/ffffff/EE1C25?text=CN'); }
        .flag-vn-card { background-image: url('https://placehold.co/48x32/ffffff/DA251D?text=VN'); }

        /* Style for selected region/gender/skill card */
        .selectable-card.selected {
            border-color: #4f46e5; /* indigo-600 */
            box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.5); /* Ring effect */
            background-color: #eef2ff; /* indigo-50 */
        }
        /* Profile Picture Placeholder/Container */
        .profile-picture-placeholder {
            width: 100px;
            height: 100px;
            background-color: #e2e8f0; /* gray-200, fallback background */
            border-radius: 50%; /* 원형 */
            margin: 0 auto 1rem; /* 가운데 정렬 및 하단 마진 */
            overflow: hidden; /* Ensures the image is clipped to the circle */
            display: flex; /* For centering fallback content if image fails badly */
            align-items: center;
            justify-content: center;
        }
         /* Gender Icon Style */
        .gender-icon {
            font-size: 2rem; /* 아이콘 크기 */
            margin-bottom: 0.5rem;
        }
        .gender-male { color: #3b82f6; } /* blue-500 */
        .gender-female { color: #ec4899; } /* pink-500 */

        /* Skill Level Card Style */
        .skill-card {
            padding: 0.75rem; /* p-3 for smaller cards */
        }
        .skill-icon { /* Optional: if you want icons for skill levels */
            font-size: 1.5rem; /* text-xl */
            margin-bottom: 0.25rem; /* mb-1 */
            color: #6b7280; /* gray-500 */
        }

    </style>
</head>
<body class="flex items-center justify-center min-h-screen py-12">
    <div class="bg-white p-8 md:p-12 rounded-lg shadow-xl w-full max-w-lg">
        <div class="text-center mb-6">
            <a href="index.html" class="inline-flex items-center text-2xl font-bold text-indigo-600 mb-2">
                <i class="fas fa-shuttlecock mr-2"></i>
                <span>배드민턴 그라운드</span>
            </a>
            <h2 class="text-xl text-gray-600">회원 가입</h2>
        </div>

        <form id="signup-form" action="#" method="POST">
            <div class="mb-6">
                <div class="profile-picture-placeholder">
                    <img id="profile-image" src="${userInfo.MBR_MAI_IMG_PTH}" alt="프로필 사진"
                         class="w-full h-full object-cover"
                         onerror="this.onerror=null; this.src='https://placehold.co/100x100/e2e8f0/6b7280?text=No Picture';">
                </div>
            </div>

            <div class="mb-4">
                <label for="name" class="block text-sm font-medium text-gray-700 mb-1">이름</label>
                <input type="text" id="name" name="name" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-200"
                       placeholder="홍길동 (실명을 입력해주세요)" value="${userInfo.MBR_NM}">
            </div>

            <div class="mb-4">
                <label for="name_en" class="block text-sm font-medium text-gray-700 mb-1">영문이름 <span style="color:blue;">(대문자로 작성해주세요)</span></label>
                <input type="text" id="name_en" name="name_en" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-200"
                       placeholder="영어 이름을 입력해주세요" value="${userInfo.WX_NICK}">
            </div>

            <div class="mb-4">
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">이메일</label>
                <input type="email" id="email" name="email" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-200"
                       value="${userInfo.LNK_ACT_ID}" readonly/>
            </div>

            <div class="mb-4">
                <label for="birthyear" class="block text-sm font-medium text-gray-700 mb-1">출생 연도</label>
                <input type="text" id="birthyear" name="birthyear" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-200"
                       placeholder="YYYY (예: 1990)" pattern="\d{4}" title="4자리 숫자로 입력해주세요. (예: 1990)" value="${userInfo.BIRTH_YEAR}">
                <p id="birthyear-error" class="text-red-500 text-xs mt-1 hidden">올바른 출생 연도(4자리 숫자)를 입력해주세요.</p>
            </div>

            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">배드민턴 급수 선택 <span style="color:red;">(급수 수정은 시스템 관리자에게 문의 하세요.)</span></label>
                <div id="skill-cards" class="grid grid-cols-3 sm:grid-cols-5 gap-2 sm:gap-3">
                    <div data-skill="A" class="selectable-card skill-card border border-gray-300 rounded-lg text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.B_LVL == 'A' ? ' selected' : ''}">
                        <span class="block text-sm font-bold text-gray-800">A조</span>
                    </div>
                    <div data-skill="B" class="selectable-card skill-card border border-gray-300 rounded-lg text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.B_LVL == 'B' ? ' selected' : ''}">
                        <span class="block text-sm font-bold text-gray-800">B조</span>
                    </div>
                    <div data-skill="C" class="selectable-card skill-card border border-gray-300 rounded-lg text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.B_LVL == 'C' ? ' selected' : ''}">
                        <span class="block text-sm font-bold text-gray-800">C조</span>
                    </div>
                    <div data-skill="D" class="selectable-card skill-card border border-gray-300 rounded-lg text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.B_LVL == 'D' ? ' selected' : ''}">
                        <span class="block text-sm font-bold text-gray-800">D조</span>
                    </div>
                    <div data-skill="E" class="selectable-card skill-card border border-gray-300 rounded-lg text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.B_LVL == 'E' ? ' selected' : ''}">
                        <span class="block text-sm font-medium text-gray-800">초심</span>
                    </div>
                </div>
                <input type="hidden" id="skill" name="skill" required value="${userInfo.B_LVL}">
                <p id="skill-error" class="text-red-500 text-xs mt-1 hidden">급수를 선택해주세요.</p>
            </div>

            <div class="mb-6">
                <label class="block text-sm font-medium text-gray-700 mb-2">성별 선택</label>
                <div id="gender-cards" class="grid grid-cols-2 gap-4">
                    <div data-gender="MALE" class="selectable-card gender-card border border-gray-300 rounded-lg p-4 text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.GND_DV == 'MALE' ? ' selected' : ''}">
                        <i class="fas fa-mars gender-icon gender-male"></i>
                        <span class="block text-sm font-medium text-gray-800">남성</span>
                    </div>
                    <div data-gender="FEMA" class="selectable-card gender-card border border-gray-300 rounded-lg p-4 text-center cursor-pointer hover:shadow-md transition duration-200${userInfo.GND_DV == 'FEMA' ? ' selected' : ''}">
                        <i class="fas fa-venus gender-icon gender-female"></i>
                        <span class="block text-sm font-medium text-gray-800">여성</span>
                    </div>
                </div>
                <input type="hidden" id="gender" name="gender" required value="${userInfo.GND_DV}">
                <p id="gender-error" class="text-red-500 text-xs mt-1 hidden">성별을 선택해주세요.</p>
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700 mb-2">지역 선택</label>
                <div id="region-cards" class="grid grid-cols-3 gap-4">
                    <div data-region="vn" class="selectable-card region-card border border-gray-300 rounded-lg p-4 text-center cursor-pointer hover:shadow-md transition duration-200">
                        <span class="card-flag-icon flag-vn-card"></span>
                        <span class="block text-sm font-medium text-gray-800">베트남</span>
                    </div>
                    <div data-region="kr" class="selectable-card region-card border border-gray-300 rounded-lg p-4 text-center cursor-pointer hover:shadow-md transition duration-200">
                        <span class="card-flag-icon flag-kr-card"></span>
                        <span class="block text-sm font-medium text-gray-800">대한민국</span>
                    </div>
                    <div data-region="cn" class="selectable-card region-card border border-gray-300 rounded-lg p-4 text-center cursor-pointer hover:shadow-md transition duration-200">
                        <span class="card-flag-icon flag-cn-card"></span>
                        <span class="block text-sm font-medium text-gray-800">중국</span>
                    </div>
                </div>
                <input type="hidden" id="region" name="region" required>
                <p id="region-error" class="text-red-500 text-xs mt-1 hidden">지역을 선택해주세요.</p>
            </div>

            <div class="mb-6">
                <label for="club" class="block text-sm font-medium text-gray-700 mb-1">소속 클럽 선택 <span style="color:blue;">(현재 소속 클럽 : ${userInfo.CLB_NM})</span></label>
                <select id="club" name="club" required disabled
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg bg-white focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-200">
                    <option value="" disabled selected>-- 지역을 먼저 선택하세요 --</option>
                </select>
                <p id="club-error" class="text-red-500 text-xs mt-1 hidden">소속 클럽을 선택해주세요.</p>
            </div>

            <div class="mb-6">
                 <div class="flex items-start">
                    <div class="ml-3 text-sm">
                        <label for="terms" class="font-medium text-gray-700">지역을 먼저 선택한 후 소속 클럽을 선택해주세요.</label>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <label for="dsc" class="block text-sm font-medium text-gray-700 mb-1">추가 요청 사항</label>
                <input type="text" id="dsc" name="dsc" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-200"
                       placeholder="관리자에게 문의할 내용 입력해주세요.">
            </div>

            <div>
                <button type="submit"
                        class="w-full flex justify-center py-3 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition duration-300">
                    나의 정보 수정
                </button>
            </div>
        </form>

        </div>

    <script>
    
        const API_BASE_URL = '/front/bbcNew/getData.htm';

        const skillCardsContainer = document.getElementById('skill-cards');
        const hiddenSkillInput = document.getElementById('skill');
        const skillError = document.getElementById('skill-error');

        const genderCardsContainer = document.getElementById('gender-cards');
        const hiddenGenderInput = document.getElementById('gender');
        const genderError = document.getElementById('gender-error');

        const regionCardsContainer = document.getElementById('region-cards');
        const hiddenRegionInput = document.getElementById('region');
        const regionError = document.getElementById('region-error');

        const clubSelect = document.getElementById('club');
        const clubError = document.getElementById('club-error');
        const signupForm = document.getElementById('signup-form');
        const birthyearInput = document.getElementById('birthyear');
        const birthyearError = document.getElementById('birthyear-error');


        // Function to fetch data from API
        async function fetchData(queryName, regionCode) {
            const url = API_BASE_URL + '?para1=' + queryName + '&para2=' + regionCode;
            try {
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error('HTTP error! status: ' + response.status);
                }
                const data = await response.json();
                return data.list || []; // API 응답 구조에 맞게 수정
            } catch (error) {
                console.error('Error fetching ' + queryName + ' for ' + regionCode + ':', error);
                return [];
            }
        }
        
        // Event listener for skill card clicks
        skillCardsContainer.addEventListener('click', (e) => {
            const clickedCard = e.target.closest('.skill-card');
            if (clickedCard) {
                const selectedSkill = clickedCard.dataset.skill;
                hiddenSkillInput.value = selectedSkill;
                skillError.classList.add('hidden');

                document.querySelectorAll('.skill-card').forEach(card => card.classList.remove('selected'));
                clickedCard.classList.add('selected');
            }
        });

        // Event listener for gender card clicks
        genderCardsContainer.addEventListener('click', (e) => {
            const clickedCard = e.target.closest('.gender-card');
            if (clickedCard) {
                const selectedGender = clickedCard.dataset.gender;
                hiddenGenderInput.value = selectedGender;
                genderError.classList.add('hidden');

                document.querySelectorAll('.gender-card').forEach(card => card.classList.remove('selected'));
                clickedCard.classList.add('selected');
            }
        });

        // Event listener for region card clicks
        regionCardsContainer.addEventListener('click', async (e) => {
            const clickedCard = e.target.closest('.region-card');
            if (clickedCard) {
                const selectedRegion = clickedCard.dataset.region;
                hiddenRegionInput.value = selectedRegion;
                regionError.classList.add('hidden');

                document.querySelectorAll('.region-card').forEach(card => card.classList.remove('selected'));
                clickedCard.classList.add('selected');

                // Fetch and populate club dropdown
                clubSelect.innerHTML = '<option value="" disabled selected>-- 클럽을 불러오는 중... --</option>';
                clubSelect.disabled = true;
                clubError.classList.add('hidden');

                const clubs = await fetchData('SELECT_MATCH_CLB_LIST', selectedRegion);

                if (clubs && clubs.length > 0) {
                    clubSelect.innerHTML = '<option value="" disabled selected>-- 클럽을 선택하세요 --</option>';
                    clubs.forEach(club => {
                        const option = document.createElement('option');
                        option.value = club.CLB_SQ; // 클럽 고유번호 사용
                        option.textContent = club.CLB_ITD; // 클럽명 표시
                        clubSelect.appendChild(option);
                    });
                    clubSelect.disabled = false;
                } else {
                    clubSelect.innerHTML = '<option value="" disabled selected>-- 해당 지역에 클럽이 없습니다 --</option>';
                    clubSelect.disabled = true;
                }
            }
        });

        // Function to validate birth year
        function validateBirthyear() {
            const year = birthyearInput.value;
            const yearPattern = /^\d{4}$/; // 정규식: 4자리 숫자
            if (!yearPattern.test(year)) {
                birthyearError.textContent = '올바른 출생 연도(4자리 숫자)를 입력해주세요.';
                birthyearError.classList.remove('hidden');
                return false;
            }
            const numericYear = parseInt(year, 10);
            const currentYear = new Date().getFullYear();
            // 간단한 범위 검사 (예: 1900년 ~ 현재년도)
            if (numericYear < 1900 || numericYear > currentYear) {
                birthyearError.textContent = '유효한 출생 연도를 입력해주세요. (예: 1900-' + currentYear + ')';
                birthyearError.classList.remove('hidden');
                return false;
            }
            birthyearError.classList.add('hidden');
            return true;
        }
        birthyearInput.addEventListener('input', validateBirthyear);


        // Event listener for form submission
        signupForm.addEventListener('submit', (e) => {
            e.preventDefault(); // Prevent actual submission for demo

            let isValid = true;

            // Validate name
            if (!document.getElementById('name').value.trim()) {
                alert('이름을 입력해주세요.');
                isValid = false;
            }

            // Validate name
            if (!document.getElementById('name_en').value.trim()) {
                alert('이름을 입력해주세요.');
                isValid = false;
            }
            // Validate email
            if (!document.getElementById('email').value.trim()) {
                alert('이메일을 입력해주세요.');
                isValid = false;
            }

            // Validate birthyear
            if (!validateBirthyear()) {
                isValid = false;
            }
            
            // Validate skill selection
            if (!hiddenSkillInput.value) {
                 skillError.classList.remove('hidden');
                 isValid = false;
            } else {
                 skillError.classList.add('hidden');
            }


            // Validate gender selection
            if (!hiddenGenderInput.value) {
                 genderError.classList.remove('hidden');
                 isValid = false;
            } else {
                 genderError.classList.add('hidden');
            }

            // Validate region selection
            if (!hiddenRegionInput.value) {
                 regionError.classList.remove('hidden');
                 isValid = false;
            } else {
                 regionError.classList.add('hidden');
            }
            
            // Validate club selection
            if (clubSelect.disabled || !clubSelect.value) {
                clubError.classList.remove('hidden');
                isValid = false;
            } else {
                clubError.classList.add('hidden');
            }

            // Stop submission if form is not valid
            if (!isValid) {
                 alert('입력 내용을 확인해주세요.');
                 return;
            }

            const formData = new FormData(signupForm);
            const data = Object.fromEntries(formData.entries());
            console.log('Sign up form submitted with:', data);
//             alert('회원 가입 정보: \n이름: ' + data.name + 
//                   '\n이메일: ' + data.email + 
//                   '\n출생연도: ' + data.birthyear + 
//                   '\n급수: ' + data.skill +
//                   '\n성별: ' + data.gender + 
//                   '\n지역: ' + data.region + 
//                   '\n클럽 SQ: ' + data.club);
            // 실제 서버로 데이터 전송 로직 추가
            

			 $.ajax({
			 	 		data:{
			 	 			para1 : "AMS_USER_MATCH_UPDATE_NEW"
			 	 			,para2 : "${userInfo.MBR_SQ}"
			 	 			,para3 : data.name_en
			 	 			,para4 : data.name
			 	 			,para5 : data.gender
			 	 			,para6 : data.dsc
					 	 	,para8 : data.club
					 	 	,para9 : data.birthyear
					 	 	,para10 : data.region
					 	 	,para11 : data.skill
			 	 		},
					type : "POST",
					url : "/front/bbc/badMatch/userInsert.htm",
					success : function(data) {
						console.log(data);
						var statusFlag = data.list[0].RSLT;
						
						if (statusFlag == 'FAIL') {
							alert("수정할 수 없습니다, 관리자에게 문의하세요.");
							loadingHide();
							return;
						}

						alert("수정되었습니다.");
						window.location.href = "/front/bbc/badMatch/getPage.htm?pageName=home";
						
					},
					error : function(xhr, status, e) {
						loadingHide();
						alert("Error : " + status);
					}
				});		 
            
            
        });
    </script>

</body>
</html>