<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>${label.俱乐部入驻}</title>
		<%@ include file="/front/bbc/inc/css.jsp"%> 
		<%@ include file="/front/bbc/inc/jquery_css.jsp"%>
		<%@ include file="/front/bbc/inc/js.jsp"%> 
		<script src="../js/jquery-weui.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/city-picker.min.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<div class="wrap no-footer">
			<div class="header">
				<div class="back">${label.返回}</div>
				<div class="title">${label.俱乐部入驻}</div>
				<div class="menu-bar">
					<span></span>
					<span></span>
					<span></span>
				</div>
			</div>
			<div class="content">
				
				<div class="modules">
				
					<div class="sub-content">
						
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.俱乐部名称}</p>
							<div class="flex1">
								<input class="right" type="text" id="strClbnm" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="flex1">${label.类型}</p>
							<div class="flex1">
								<select class="dropdown" id="strClbgd" dir="rtl" style="color:#666;padding-right: 0.24rem;" placeholder="${label.请输入}">
									<option value="A">랭킹모드 - BB Coin</option>
									<option value="C">A,B,C,D Level</option>
									<option value="D">클럽관리 모드</option>
									<option value="E">혼합모드</option>
									<option value="B">대회모드 - 대회,교류전</option>
								</select>
							</div>
						</div>
						<div class="list90 bottom-dashed flex" style="display:none;">
							<p class="left-part">${label.会员数}</p>
							<div class="flex1">
								<input class="right" type="text" id="intMbrcnt" value="0" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.俱乐部介绍}</p>
							<div class="flex1">
<%-- 								<input class="right" type="text" id="strClbitd" value="" placeholder="${label.请输入}"/> --%>
								<textarea class="textboxcontent" id="strClbitd" placeholder="请输入" style="width:95%;height:1rem;padding:0px;padding-top:0.34rem;padding-bottom:0.14rem;text-align:right;"></textarea>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.联系人}</p>
							<div class="flex1">
								<input class="right" type="text" id="strCttnm" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.联系电话}</p>
							<div class="flex1">
								<input class="right" type="tel" id="strCttphnno" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 flex">
							<p class="left-part">${label.活动时间}</p>
							<div class="flex1">
<%-- 								<input class="right" type="text" id="strExctmedct" value="" placeholder="${label.请输入}"/> --%>
								<textarea class="textboxcontent" id="strExctmedct" placeholder="请输入" style="width:95%;height:1rem;padding:0px;padding-top:0.34rem;padding-bottom:0.14rem;text-align:right;"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modules">
					<div class="sub-content">
						<div class="file flex">
							<p class="left-part">${label.俱乐部LOGO}</p>
							<div class="flex1 right">
								<span>${label.请上传}</span>
								<img class="file-img" id="customUploadBtn" src="../img/file.png"/>
								<input type="file" name="image" id="imageFile" accept="image/*" style="display:none;" onchange="javascript:logoUpload(this);">
							</div>
						</div>
					</div>
				</div>
				<div class="modules">
					<div class="sub-content">
						<div class="list90 bottom-dashed flex">
							<p class="left-part">${label.场地数}</p>
							<div class="flex1">
								<input class="right" type="text" id="strCorcnt" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
						<div class="list90 bottom-dashed flex" style="display:none;">
							<p class="left-part">${label.场地地址}</p>
							<label for="atdAdr" style="position: relative;">
								<input style="color:#666;width:4rem;" class="right weui-input" id="atdAdr" type="text" value="" >
								<p class="right-btn" style="position: absolute;height: 100%;top: 0;right: 0;">${label.请选择}</p>
							</label>
								<input type="hidden" id="strAtdadr" value=""/>
								<input type="hidden" id="strAtdadrcd" value=""/>
						</div>
						<div class="list90 flex">
							<p class="left-part">${label.详细地址}</p>
							<div class="flex1">
								<input class="right" type="text" id="strAtdadrdtl" value="" placeholder="${label.请输入}"/>
							</div>
						</div>
					</div>
				</div>
				<div style="text-align: center;margin-top: 0.8rem;">
					<button class="btn-submit">${label.提交}</button>
				</div>
				
<!-- 				<div class="modules"> -->
<!-- 					<div class="sub-content"> -->
<!-- 						<div class="list90 flex"> -->
<%-- 							<p class="left-part">${label.GPS定位}</p> --%>
<!-- 							<div class="flex1"> -->
<!-- 								<input class="right" type="text" id="" value="" placeholder="请从地图上输入"/> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				

			
			</div>
			
		</div>


		<!-- 点击按钮的弹窗-->
		<div class="pop-up-wrap" style="display:none;">
			<div class="pop-up-content">
				<div class="inp-wrap">
					<p>${label.简称}：</p>
					<input class="textboxcontent" type="text" id="strClbniknm" value="${amsClb.MBR_NM}" />
<%-- 					<input class="textboxcontent" style="width:2.1rem;margin-right:0.1rem;" type="text" id="" value="${amsClb.MBR_NM}" /> --%>
<%-- 					<button style="background:#666;color:#fff;">${label.重复确认}</button> --%>
				</div>
				<div class="inp-wrap">
					<p>${label.年龄}：</p>
						<select class="textboxcontent" id="strAgeyy" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="10">19${label.岁}${label.以下}</option>
							<option value="20">20~29${label.岁}</option>
							<option value="30">30~39${label.岁}</option>
							<option value="40">40~49${label.岁}</option>
							<option value="50">50${label.岁}${label.以上}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.性别}：</p>
						<select class="textboxcontent" id="strGnddv" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="MALE">${label.男}</option>
							<option value="FEMA">${label.女}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.小组}：</p>
						<select class="textboxcontent" id="strBmtgd" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="A">A${label.组}</option>
							<option value="B">B${label.组}</option>
							<option value="C">C${label.组}</option>
							<option value="D">D${label.组}</option>
							<option value="E">${label.新手}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.球历}：</p>
						<select class="textboxcontent" id="strYear" style="width:100%;color:#666;padding-right: 0;flex: 1;">
							<option>${label.请选择}</option>
							<option value="1">1${label.年}</option>
							<option value="2">2${label.年}</option>
							<option value="3">3${label.年}</option>
							<option value="4">4${label.年}</option>
							<option value="5">5${label.年}${label.以上}</option>
						</select>
				</div>
				<div class="inp-wrap">
					<p>${label.内容}：</p>
					<textarea class="textboxcontent" id="strJingrttxt" placeholder="请输入内容"></textarea>
				</div>
				<div class="buttons">
					<span class="cancel">${label.取消}</span>
					<span onclick="fn_ClbReg('Y');">${label.提交}</span>
				</div>
			</div>
		</div>
		<%@ include file="/front/bbc/inc/loading.jsp"%> 
	</body>
	<script type="text/javascript">
		$(document).ready(function(){

            $("#customUploadBtn").on("click", function () {
                $("#imageFile").click();
            });			
			
			$(".btn-submit").click(function(){
				
	 			//var intStdsq= $('#intClbsq').val();	  // [클럽] 경기장시퀀스
	 			var strClbnm= $('#strClbnm').val();	  // [클럽] 클럽명
	 			var strClbitd= $('#strClbitd').val();	  // [클럽] 클럽소개

	 			var strExctmedct= $('#strExctmedct').val();	  // [클럽] 운동시간설명

	 			//var strClbmaiimgpth= $('#intClbsq').val();	  // [클럽] 클럽메인이미지경로
	 			//var strClbmaiimgfnm= $('#intClbsq').val();	  // [클럽] 클럽메인이미지파일명
	 			var strCttnm= $('#strCttnm').val();	  // [클럽] 담당자이름
	 			var strCttphnno= $('#strCttphnno').val();	  // [클럽] 담당자전화
	 			
	 			var intMbrcnt= $('#intMbrcnt').val();	  // [클럽] 회원수
	 			var strCorcnt= $('#strCorcnt').val();	  // [클럽] 코트수
	 			var strAtdadr= $('#strAtdadr').val();	  // [클럽] 경기장주소
	 			var strAtdadrcd= $('#strAtdadrcd').val();	  // [클럽] 경기장주소코드
	 			var strAtdadrdtl= $('#strAtdadrdtl').val();	  // [클럽] 경기장상세주소

// 	 			var strClbmaiimgpth = $('#strClbmaiimgpth').val();	  // [클럽] 로고
// 	 			var strClbmaiimgfnm = strClbmaiimgpth;

	 			var strClbniknm= $('#strClbniknm').val();	  // [클럽가입신청] 클럼내닉네임
	 			var strAgeyy= $('#strAgeyy').val();	  // [클럽가입신청] 연령(10대,20대...)
	 			var strGnddv= $('#strGnddv').val();	  // [클럽가입신청] 성별구분
	 			var strBmtgd= $('#strBmtgd').val();	  // [클럽가입신청] 배드민턴 조(A,B,C,D)
	 			var strClbgd = $("#strClbgd").val();    
	 			var strYear = $("#strYear").val();
	 			
	 			if (strClbnm == "") {
	 				alert("${label.请输入俱乐部名称}");
	 				return;
	 			}
	 			if (strClbitd == "") {
	 				alert("${label.请输入俱乐部介绍}");
	 				return;
	 			}
	 			if (strExctmedct == "") {
	 				alert("${label.请输入活动时间}");
	 				return;
	 			}
	 			if (strCttnm == "") {
	 				alert("${label.请输入联系人}");
	 				return;
	 			}
	 			if (strCttphnno == "") {
	 				alert("${label.请输入联系电话}");
	 				return;
	 			}
	 			if (intMbrcnt == "") {
	 				alert("${label.请输入会员数}");
	 				return;
	 			}
	 			if (strCorcnt == "") {
	 				alert("${label.请输入场地数}");
	 				return;
	 			}
	 			if (strYear == "") {
	 				alert("${label.请选择}${label.球历}");
	 				return;
	 			}
	 			
				$(".pop-up-wrap").show();
				
			});
			$(".cancel").click(function(){
				$(".pop-up-wrap").hide();
			});
			$("#atdAdr").cityPicker({
				title: "选择城市",
				onChange: function (picker, values, displayValues) {
        	 		console.log(values, displayValues);
        	 		$('#strAtdadrcd').val(values);
        	 		$('#strAtdadr').val(displayValues);
					$("#atdAdr").siblings("p").hide();
				}
     		 });
      });

		function logoUpload(file){
			if(checkImage(file)){
				if (file.files && file.files[0]) {
					var reader = new FileReader();
					reader.onload = function(evt){
						$("#customUploadBtn").attr('src', evt.target.result);
					}; 
				 	reader.readAsDataURL(file.files[0]);
				}	
			}
		}

		function checkImage(file){
			var picPath = file.value;
			if(picPath == ''){
				return false;
			}
		     var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
		     if (type != 'jpg' && type != 'bmp' && type != 'gif' && type != 'png') {
		         alert('You can upload format of JPG, GIF, PNG');
		         return false;
		     }
			return true;
		}
		
 		function fn_ClbReg(Pubclbyn) {
 			
 			//var intStdsq= $('#intClbsq').val();	  // [클럽] 경기장시퀀스
 			var strClbnm= $('#strClbnm').val();	  // [클럽] 클럽명
 			var strClbitd= $('#strClbitd').val();	  // [클럽] 클럽소개

 			var strPubclbyn= Pubclbyn;	  // [클럽] 공개클럽여부
 			var strExctmedct= $('#strExctmedct').val();	  // [클럽] 운동시간설명

 			//var strClbmaiimgpth= $('#intClbsq').val();	  // [클럽] 클럽메인이미지경로
 			//var strClbmaiimgfnm= $('#intClbsq').val();	  // [클럽] 클럽메인이미지파일명
 			var strCttnm= $('#strCttnm').val();	  // [클럽] 담당자이름
 			var strCttphnno= $('#strCttphnno').val();	  // [클럽] 담당자전화
 			
 			var intMbrcnt= $('#intMbrcnt').val();	  // [클럽] 회원수
 			var strCorcnt= $('#strCorcnt').val();	  // [클럽] 코트수
 			var strAtdadr= $('#strAtdadr').val();	  // [클럽] 경기장주소
 			var strAtdadrcd= $('#strAtdadrcd').val();	  // [클럽] 경기장주소코드
 			var strAtdadrdtl= $('#strAtdadrdtl').val();	  // [클럽] 경기장상세주소

//  			var strClbmaiimgpth = $('#strClbmaiimgpth').val();	  // [클럽] 로고
//  			var strClbmaiimgfnm = strClbmaiimgpth;

 			var strClbniknm= $('#strClbniknm').val();	  // [클럽가입신청] 클럼내닉네임
 			var strAgeyy= $('#strAgeyy').val();	  // [클럽가입신청] 연령(10대,20대...)
 			var strGnddv= $('#strGnddv').val();	  // [클럽가입신청] 성별구분
 			var strBmtgd= $('#strBmtgd').val();	  // [클럽가입신청] 배드민턴 조(A,B,C,D)   
 			
 			var strClbgd = $("#strClbgd").val();
 			var strYear = $("#strYear").val(); 
 			
 			if (strClbnm == "") {
 				alert("${label.请输入俱乐部名称}");
 				return;
 			}
 			if (strClbitd == "") {
 				alert("${label.请输入俱乐部介绍}");
 				return;
 			}
 			if (strExctmedct == "") {
 				alert("${label.请输入活动时间}");
 				return;
 			}
 			if (strCttnm == "") {
 				alert("${label.请输入联系人}");
 				return;
 			}
 			if (strCttphnno == "") {
 				alert("${label.请输入联系电话}");
 				return;
 			}
 			if (intMbrcnt == "") {
 				alert("${label.请输入会员数}");
 				return;
 			}
 			if (strCorcnt == "") {
 				alert("${label.请输入场地数}");
 				return;
 			}
 			
 			loadingShow();
 			
 			

 		    var imgLogoPicture = $('#imageFile').val();
 			var imgFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
			const file = $("#imageFile")[0].files[0];
			const formData = new FormData();
			
			if (file != undefined) {
	            formData.append("imageFile", file);	
				console.log(file);
			}
			
            formData.append("strClbnm", strClbnm);
            formData.append("strClbitd", strClbitd);
            formData.append("strPubclbyn", strPubclbyn);
            formData.append("strExctmedct", strExctmedct);
            formData.append("strCttnm", strCttnm);
            formData.append("strCttphnno", strCttphnno);
            formData.append("intMbrcnt", intMbrcnt);
            formData.append("strCorcnt", strCorcnt);
            formData.append("strAtdadr", strAtdadr);
            formData.append("strAtdadrcd", strAtdadrcd);
            formData.append("strAtdadrdtl", strAtdadrdtl);
//             formData.append("strClbmaiimgpth", strClbmaiimgpth);
//             formData.append("strClbmaiimgfnm", strClbmaiimgfnm);
            formData.append("strClbniknm", strClbniknm);
            formData.append("strAgeyy", strAgeyy);
            formData.append("strGnddv", strGnddv);
            formData.append("strBmtgd", strBmtgd);
            formData.append("strClbgd", strClbgd);
            formData.append("strYwday", strYear);
            formData.append("strClbbakimgfnm", imgFileName);            
            
            /*
	 	 		data:{
	 	 			strClbnm : strClbnm
	 	 			,strClbitd : strClbitd
	 	 			,strPubclbyn : strPubclbyn
	 	 			,strExctmedct : strExctmedct
	 	 			,strCttnm : strCttnm
	 	 			,strCttphnno : strCttphnno
	 	 			,intMbrcnt : intMbrcnt
	 	 			,strCorcnt : strCorcnt
	 	 			,strAtdadr : strAtdadr
	 	 			,strAtdadrcd : strAtdadrcd
	 	 			,strAtdadrdtl : strAtdadrdtl
	 	 			,strClbmaiimgpth : strClbmaiimgpth
	 	 			,strClbmaiimgfnm : strClbmaiimgfnm
	 	 			,strClbniknm : strClbniknm
	 	 			,strAgeyy : strAgeyy
	 	 			,strGnddv : strGnddv
	 	 			,strBmtgd : strBmtgd
	 	 			,strClbgd : strClbgd
	 	 			,strYwday : strYear
	 	 			,strClbbakimgfnm : imgFileName
	 	 			,imageFile : file
	 	 		},
	 	 	*/
 			$.ajax({
				 	data : formData,
 					type : "POST",
 					url : "/front/bbc/clb/clbRegSave.htm",
 					contentType: false,
 					processData: false,
 					success : function(data) {
	     				alert("${label.保存成功了}");
	     				window.location = "/front/bbc/clb/clb.htm";
 					},
 					error : function(xhr, status, e) {
 						loadingHide();
 						alert("Error : " + status);
 					}
 				});
 		}

			
	</script>
	
</html>
