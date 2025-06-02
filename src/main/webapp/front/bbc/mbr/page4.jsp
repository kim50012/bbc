<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>연합회 회원 목록</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<style>
.app {
	padding-top: 0;
}

.app-header {
	position: relative;
}

.app-header .logo img {
	width: 0.60rem;
}
/* 클릭 가능한 썸네일 이미지 스타일 */
.thumbnail-image:hover {
  opacity: 0.7; /* 마우스 오버 시 약간 투명하게 */
}

/* 모달 배경 */
.image-viewer-modal {
  display: none; /* 평소에는 숨김 */
  position: fixed; /* 화면에 고정 */
  z-index: 1000; /* 다른 요소들 위에 표시 */
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; /* 내용이 많을 경우 스크롤 */
  background-color: rgba(0,0,0,0.9); /* 반투명 검은색 배경 */
  padding-top: 60px; /* 모달 내용물의 상단 여백 */
}

/* 모달 내용물 (확대 이미지) */
.image-viewer-modal-content {
	display: block;
	margin: auto;
	width: 90vw;
	max-width: none;
	max-height: 90vh;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-webkit-animation-name: zoomIn;
	-webkit-animation-duration: 0.3s;
	animation-name: zoomIn;
	animation-duration: 0.3s;
}

/* 확대 애니메이션 */
@-webkit-keyframes zoomIn {
  from {-webkit-transform: translate(-50%, -50%) scale(0)}
  to {-webkit-transform: translate(-50%, -50%) scale(1)}
}

@keyframes zoomIn {
  from {transform: translate(-50%, -50%) scale(0)}
  to {transform: translate(-50%, -50%) scale(1)}
}

/* 닫기 버튼 */
.image-viewer-close-button {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.image-viewer-close-button:hover,
.image-viewer-close-button:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 캡션 텍스트 (선택 사항) */
#imageViewerCaption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  /* 이미지가 중앙에 오도록 위치 조정이 필요할 수 있음 */
  position: absolute;
  bottom: 5%; /* 예시 위치 */
  left: 50%;
  transform: translateX(-50%);
}
<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
.drag-table td {
    position: relative;
    background: #ffffff;
    border: none;
    border-bottom: 1px solid #ededed;
    font-size: 0.24rem;
    line-height: 0.24rem;
    padding: 0.1rem 0.1rem;
    box-sizing: border-box;
    color: #333333;
}
</c:if>
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		$("#appPage2").prepend(htm)
		$(".app-header")
				.click(
						function() {
							window.location.href = '/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
						});
	});
</script>
<style>
.subBtn {
	padding: 0.2rem 0.1rem;
}
</style>
</head>

<body>
	<div class="app">


		<div class="content">
			<div class="scroll-wrap refresh-wrap" id="appPage2">
				<div class="container" style="padding-top:0.1rem;">
				
					<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
					<div class="model-gray" style="margin-top: 0.1rem;background: #fff;">
						<div class="bottom-model" style="padding-top: 0;">
							<div class="input-wrap" style="width: 70%;margin-right: 0.2rem;">
							<span>
								<c:if test="${amsClb.CLB_SQ == 11}">
								<select style="width:50%;" id="selClb">
									<option value="">ALL</option>
									<option value="1">BBC</option>
									<option value="2">WJBC</option>
									<option value="3">BSC</option>
									<option value="4">BWC</option>
									<option value="6">HBC</option>
									<option value="8">SBBC</option>
								</select>
								</c:if>
								<c:if test="${amsClb.CLB_SQ == 67}">
								<select style="width:50%;" id="selClb">
									<option value="">ALL</option>
									<option value="1">HSBC</option>
									<option value="2">SBC</option>
									<option value="3">FBC</option>
									<option value="10">KBC</option>
									<option value="13">ABC</option>
									<option value="14">PBC</option>
									<option value="18">팀카피바라</option>
									<option value="19">VHB</option>
								</select>
								</c:if>
								<input type="text" id="txtMbrnm" style="width:50%;">
							</span>
							</div>              
							<button class="confirmBtn" id="confirmBtn" onclick="getData('${amsClb.TODAY}');">조회</button>
						</div>
					</div>
					</c:if>
					
					<div class="title2">
						<span class="font24 bold">A ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableA" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">B ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableB" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">C ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableC" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">D ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableD" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="title2">
						<span class="font24 bold">E ${label.组}</span>
						<span class="font20 fontOrange">기준：${amsClb.TODAY}</span>
					</div>

					<div class="table-wrap">
						<div class="table">
							<table class="drag-table alignRightTable" id="tableE" cellspacing="0" cellpadding="2" width="100%" border="1">
								<tr>
									<th>No</th>
									<th>사진</th>
									<th>이름</th>
									<th>레벨</th>
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									<th style="width: 34%;">클럽</th>
									</c:if>
								</tr>
							</table>
						</div>
					</div>
					
					
					
				</div>
			</div>
		</div>


	</div>
	<div id="imageModal" class="image-viewer-modal">
		<span class="image-viewer-close-button">&times;</span>
			<img class="image-viewer-modal-content" id="enlargedImg">
		<div id="imageViewerCaption"></div>
	</div>

</body>
<script type="text/javascript">

	$(function() {
		getData("${amsClb.TODAY}");
		
	    // 모달 관련 요소들을 jQuery 객체로 가져옵니다.
	    var $modal = $("#imageModal");
	    var $modalImg = $("#enlargedImg");
	    var $captionText = $("#imageViewerCaption"); // 캡션 사용 시
	
	    // 이벤트 위임: document 전체에서 .thumbnail-image 클래스를 가진 요소의 클릭 이벤트를 감지합니다.
	    // 이렇게 하면 AJAX로 동적으로 추가된 이미지에도 이벤트 핸들러가 적용됩니다.
	    $(document).on("click", ".thumbnail-image", function() {
	        var $clickedImage = $(this); // 클릭된 이미지
	        
	        $modal.css("display", "block"); // 모달을 보여줍니다.
	        $modalImg.attr("src", $clickedImage.attr("src")); // 클릭된 이미지의 src를 모달 이미지의 src로 설정합니다.
	        
	        // 캡션 설정 (선택 사항): 이미지의 alt 속성을 사용하거나 비워둡니다.
	        // var altText = $clickedImage.attr("alt");
	        // if (altText) {
	        //     $captionText.html(altText);
	        // } else {
	        //     $captionText.html("");
	        // }
	        $captionText.html(""); // 현재 코드에서는 캡션을 비우도록 되어 있습니다.
	    });
	
	    // 닫기 버튼(.image-viewer-close-button) 클릭 시 모달 숨기기
	    var $closeButton = $(".image-viewer-close-button");
	    if ($closeButton.length) { // 닫기 버튼이 존재하는지 확인
	        $closeButton.on("click", function() {
	            $modal.css("display", "none");
	        });
	    }
	
	    // 모달 배경(이미지 바깥 영역) 클릭 시 모달 숨기기
	    $modal.on("click", function(event) {
	        // 클릭된 대상이 모달 배경 자체인지 확인합니다. (모달 내용물이 아닌)
	        if ($(event.target).is($modal)) {
	            $modal.css("display", "none");
	        }
	    });		
		
	});


	function getData(dt) {

		var para1 = "USER_LEVEL_LIST";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = "";
		var para4 = "";

		<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
		para3 = $("#selClb").val();
		para4 = $("#txtMbrnm").val();
		</c:if>

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						htm = ''
						+ '<tr>'
						+ '	<th>No</th>'
						+ '	<th>사진</th>'
						+ '	<th>이름</th>'
						+ '	<th>레벨</th>'
						<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
						+ '	<th style="width: 34%;">클럽</th>'
						</c:if>
						+ '</tr>'
						;
						$("#tableA").html(htm);
						$("#tableB").html(htm);
						$("#tableC").html(htm);
						$("#tableD").html(htm);
						$("#tableE").html(htm);
						
						if (data.list.length != 0) {

							var j = 0;
							var gdOld = "";
							
							for (var i = 0; i < data.list.length; i++) {
								
								if (gdOld != data.list[i].BMT_GD) {
									j = 0;
								}

								j++;
								
								var htm = '';
								if (i == 0) {

									htm = ''
									+ '<tr>'
									+ '	<th>No</th>'
									+ '	<th>사진</th>'
									+ '	<th>이름</th>'
									+ '	<th>레벨</th>'
									+ '</tr>'
									;
									// $("#table"+data.list[i].BMT_GD).append(htm);
								}
								var sTag = "padding-left: 0.5rem;";
								<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
								sTag = "";
								</c:if>
								htm = ''
									+ '<tr>'
									+ '	<td class="center">'+(j)+'</td>'
									+ '	<td class="center"><img class="thumbnail-image" src="'+data.list[i].MBR_MAI_IMG_PTH+'" style="width: 1rem;'+sTag+'"/></td>'
									+ '	<td class="center" style="text-decoration: underline;" onclick="goUserPage('+data.list[i].MBR_SQ+')">'
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									+ '<img src="../image/'+data.list[i].IMG+'.png" style="height:0.28rem;display: initial;"> '
									</c:if>
									+ data.list[i].CLB_NIK_NM
									+ '</td>'
									+ '	<td class="center">'+data.list[i].BMT_GD+'${label.组}</td>'
									<c:if test="${amsClb.CLB_SQ == 11 or amsClb.CLB_SQ == 67}">
									+ '	<td>'+data.list[i].CLB_NM+'</td>'
									</c:if>
									+ '</tr>'					
									;
									$("#table"+data.list[i].BMT_GD).append(htm);
								gdOld = data.list[i].BMT_GD;
							}
						} else {
							//$("#mbrList").html('');
						}
						load.hide()

					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
	function goUserPage(a) {
		window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page24&para3=&para5="+a;
	}
	
	function phoneHtml(a) {
		
		if (a == "") {
			return "";
		}
		else {
			return '<a href="tel:'+a+'">전화</a>';
		}
		
		return b
	}


	function deleteFee(a) {

		if ("${loginMbrSq}" != "20") {

			messageBox({
				title : '확인',
				message : '권한이 없습니다.',
				type : 'alert',
				callback : function() {
				}
			})
			return;
		}
		
		messageBox({
			title : '확인',
			message : '정회원에서 삭제하시겠습니까?',
			type : 'confirm',
			callback : function() {
				deleteMbrFee(a);
			}
		})
	}


	function deleteMbrFee(a) {

		var para1 = "MBR_FEE_USER_UPDATE";
		var para2 = "${amsClb.CLB_SQ}";
		var para3 = a;
		var para4 = "D";

		var load = loading();
		load.show();
		
		$.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
					},
					type : "POST",
				    contentType : "application/x-www-form-urlencoded;charset=utf-8",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {
						load.hide();
						getData();
					},
					error : function(xhr, status, e) {
						load.hide();
					}
				});
	}     

</script>
</html>
