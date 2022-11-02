<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%>
<style type="text/css">
body{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
}
input{
	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
} 
.popupContent{
	width: 700px;
	min-height: 450px;
	border-radius: 10px 10px 0px 0px;
}
.modalHeader{
position:relative; height:40px; background-color: #636363;border-radius: 10px 10px 0px 0px;
}
.modalHeader .modalClose{
	position:absolute; right: 15px;top: 12px;cursor: pointer;
}


.modalContent{
position:relative;
}
.modalContent .headImage{
	position:absolute; left:20px; top:-30px;
}
.modalContent .headImage img{
	width: 46px; height: 46px;
}
.modalContent .headImage span{
	font-size: 14px;
	color: #ffffff;
	margin-left: 10px;
}
.modalContent  .titleBar{
 	list-style:none;
 	padding-left: 120px;
 
}

.modalContent  .titleBar li{
	display: inline-block;
	line-height: 40px;
	padding-left: 10px;
	padding-right: 10px;
} 
.modalContent  .titleBar li.split{ 
padding-left: 0;
padding-right: 40px;
font-size: 15px;
} 
.modalContent  .titleBar li .chat-nickName{ 
font-size: 16px;
} 

.chatHistWarp {
position:relative;
	width: 100%;
	margin-left: 15px;
	margin-right: 15px;
}
.chatHistWarp .mainArea{
	float: left;
	width: 460px;
	
}

.chatHistWarp .custInfo{
	float: left;
	width: 220px;
	margin-left: 10px; 
	margin-top: 20px
}

.chatHistWarp .custInfo li{
	margin-bottom: 10px;
}


.chatHistWarp .mainArea .chatHsit{
	width:460px;
	height: 270px; 
	border: 1px solid #eeeeee;
	margin-top: 20px
}
.chatHistWarp .mainArea .chatHsit .chatHistContent{
	width:460px;
	height: 250px;
	overflow-y: auto;
	margin: 10px 5px 10px 5px;
}
.chatHistWarp .mainArea .chatHsit .chatHistContent li{
	min-height:60px;
	position: relative;
	
}

.chatHistWarp .mainArea .chatHsit .chatHistContent li:first-of-type{
	margin-top: 0;
}

.chatHistWarp .mainArea .responseArea{
	position:relative;
	height: 120px;
	border: 1px solid #eeeeee;
	border-top-left-radius : 5px;
	border-top-right-radius : 5px;
	margin-top: 10px;
}
.chatHistWarp .mainArea .responseArea .responseTypeWarp{
	height: 35px;
	padding-left: 5px;
	border-bottom: 1px solid #eeeeee;
	background-color: #f7f7f7;
}
 
.chatHistWarp .mainArea .responseArea .responseTypeWarp ul  {
	display:inline-block;
	
}

.chatHistWarp .mainArea .responseArea .responseTypeWarp .responseType  {
	display:inline-block;
	height: 30px;
	line-height: 30px;
	margin-left: 10px;
	width:30px;
	background-size: 20px 20px;
	background-position: center; 
	background-repeat: no-repeat;
	
}

.imgText {
	background-image: url("/admin/images/cust/text_gray.png");
}
.imgImage {
	background-image: url("/admin/images/cust/picture_gray.png");
}
.imgMusic {
	background-image: url("/admin/images/cust/music_gray.png");
}
.imgVideo {
	background-image: url("/admin/images/cust/video_gray.png");
}
.imgNews {
	background-image: url("/admin/images/cust/image-text_gray.png");
}
.imgText.active , .imgText:hover{
	background-image: url("/admin/images/cust/text_green.png");
}
.imgImage.active , .imgImage:hover {
	background-image: url("/admin/images/cust/picture_green.png");
}
.imgMusic.active,.imgMusic:hover {
	background-image: url("/admin/images/cust/music_green.png");
}
.imgVideo.active ,.imgVideo:hover{
	background-image: url("/admin/images/cust/video_green.png");
}
.imgNews.active ,.imgNews:hover{
	background-image: url("/admin/images/cust/image-text_green.png");
}

 
.chatHistWarp .mainArea .responseArea .responseContent{

}
.chatHistWarp .mainArea .responseArea .responseContent textarea{
	width: 95%; 
	height:75px;
	font-size:12px;
	border: 0; 
	outline: none; 
	box-shadow:none;
	resize : none;
}
.chatHistWarp .mainArea .responseArea .sendArea{

	text-align: right;
	padding-right: 5px;
	padding-bottom: 3px;
}


.chatHistContent .custHistItem {
	position: relative;
	min-height: 60px;
}
.cartHistLeft{
	min-height: 60px;
	margin-bottom: 10px;
}
.cust .custHeadIcon {
	width: 46px;
	height: 46px;
	border: 1px solid #eeeeee;
}
.user .userHeadIcon {
	width: 46px;
	height: 46px;
	border: 1px solid #eeeeee
}		        					  	
.cust .custContent {
	height:auto;
	border: 1px solid #eeeeee;
	max-width:380px;
	border-radius:5px;
	padding: 5px;
	display: inline-block;
	word-break: break-all; 
	work-wrap: break-word;
	overflow:hidden
}
.cust .custDate{
	color: #a2a2a2;
}
.user .userContent {
	height:auto;
	border: 1px solid #eeeeee;
	width:auto;
	border-radius:5px;
	padding: 5px;
	display: inline-block;
	word-break: break-all; 
	work-wrap: break-word;
	overflow:hidden
}
.user .userDate{
	color: #a2a2a2;
}

.cartHistRight {
	float:right;
	top: 0;
	right: 0;
	width: 200px;
	max-width: 200px;
	word-wrap: break-word;
}

.cartHistRight .addComment {
	position: absolute;
	top: 0;
	right: 0;
	display: inline-block;
	width: 18px;
	height: 18px;
	background-image: url('/admin/images/sendMsgAll/icon_start_plus.png');
	background-position: center;
	background-repeat: no-repeat;
	cursor: pointer;
}

.cartHistRight .conmentDetail {
	position: relative;
	overflow-x: hidden;
	margin-top: 20px;
	text-align: left;
	  padding: 10px 5px 10px 10px;
	  border : 1px solid rgb(211, 33, 57);
}

.editinput{
 width:  100px;
 margin-bottom: 0px;
}
.btn-icon{
	display:inline-block; 
	width: 68px;
	height: 30px;
	position: relative; 
	cursor: pointer;
	background-repeat: no-repeat;
	background-position: center;
	vertical-align:middle;
	text-align:center;
	background-color: #fb6e52;
	line-height:30px;
	font-size: 12px;
	color: #ffffff;
}
.send{
	position: absolute;
	right: 5px;
	top: 85px
	
}
.img-send{
	max-width: 150px;
	max-height: 154px
}
.clearfloat:after{display:block;clear:both;content:"";visibility:hidden;height:0} 
.clearfloat{zoom:1} 
</style>
<script type="text/javascript">
$(function(){
	$('.responseType').click(function(){
		$(this).addClass('active').siblings().removeClass('active');	
		
		/* if($(this).hasClass('imgText')){
			alert('1');
		}else if($(this).hasClass('imgImage')){
			alert('2');
		}else if($(this).hasClass('imgNews')){
			alert('3');
		} 
	  */
	});
	
	$('.js-modal-close').click(function(){
		if(window.parent && window.parent.closeChatWindow){
			window.parent.closeChatWindow();
		}
		
	});
	
	/* $('.js-nickname-remark').click(function(){    
        if(!$(this).is('.input')){    
        	var text = $(this).text();
            $(this).addClass('input').html('<input type="text" class="editinput" maxlength=7  value="" />').find('input').focus().val(text).blur(function(){    
                var thisValue=$(this).val() || '';    
                var custSysId =  $(this).parent().data('custSysId');
                var type =  $(this).parent().data('type');
                var placeholder =  $(this).parent().data('placeholder');
                // console.error(custSysId +',' +type +',' + placeholder +',' + thisValue);
                
              $.ajax({    
                  type: 'POST',    
                  url: '/admin/cust/modifyCustInfo.htm',    
                  data:{
                	  custSysId : custSysId,
                	  type:'CUST_REAL_NM',
                	  value : thisValue
                  }
                });    
                $(this).parent().removeClass('input').html($(this).val() || placeholder);    
            });                        
        }    
    }).hover(function(){    
        $(this).addClass('hover');    
    },function(){    
        $(this).removeClass('hover');    
    });  */   		
    $('.js-nickname-remark').hover(function(){  
    	var text = $(this).text();
    	if(!$(this).is('.input')){    
            $(this).addClass('input').html('<input type="text" class="editinput" maxlength=7  value="" />').find('input').focus().val(text).blur(function(){    
                var thisValue=$(this).val() || '';    
                var custSysId =  $(this).parent().data('custSysId');
                var type =  $(this).parent().data('type');
                var placeholder =  $(this).parent().data('placeholder');
                // console.error(custSysId +',' +type +',' + placeholder +',' + thisValue);
                
              $.ajax({    
                  type: 'POST',    
                  url: '/admin/cust/modifyCustInfo.htm',    
                  data:{
                	  custSysId : custSysId,
                	  type:'CUST_REAL_NM',
                	  value : thisValue
                  }
                });    
                $(this).parent().removeClass('input').html($(this).val() || placeholder);    
            });                        
        }      
    },function(){ 
    	
    });		
		 
	$('.conmentDetail').blur(function(){
		//alert($(this).text());
		
	});
	
	
	 
});
function load(){
	$('.chatHistContent')[0].scrollTop = $('.chatHistContent')[0].scrollHeight;
}
function sendMessage(){
	
	var custSysId = $('#CUST_SYS_ID').val();
	var openid = $('#OPENID').val();
	var textMessage = $('#textMessage').val(); 
	
	$.ajax({
 	 	data:{
 	 		type : 'text',
 	 		openid : openid,
 	 		custSysId: custSysId,
 	 		textMessage: textMessage
 	 	},
			type : "POST",
			url : "/wx/msg/send.htm",
			success : function(res) {
				if(res.success){
					
					$('#textMessage').val('');
					
					//重新获取数据
					 $.ajax({
							url : "/admin/cust/relaodMessage.htm",
							type : "POST",
				    	    data:{cust_sys_id : $('#CUST_SYS_ID').val(), lastMsgId: $('#LAST_MSG_ID').val()},
							success : function(res) {
								if(res.success){
									// console.error(res);
									$('#LAST_MSG_ID').val(res.custInfo.LAST_MSG_ID);
									  if(res.cartHsitList.length > 0){
										  
										 var tpl = _.template($("#tpl_cust_hist").html());
										 $('.js-chat-hist-ul').append(tpl(res));
										 $('.chatHistContent')[0].scrollTop = $('.chatHistContent')[0].scrollHeight;
										 //console.error(html);
									}  
								} 
							},
							error : function(xhr, status, e) {
								alert("error: " + status);
							}
						});
					
				}else{
					alert('发送失败!' + res.errmsg);
				} 
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
	
}


function relaodMessage() { 
	//重新获取数据
	 $.ajax({
			url : "/admin/cust/relaodMessage.htm",
			type : "POST",
   	    data:{cust_sys_id : $('#CUST_SYS_ID').val(), lastMsgId: $('#LAST_MSG_ID').val()},
			success : function(res) {
				if(res.success){
					// console.error(res);
					$('#LAST_MSG_ID').val(res.custInfo.LAST_MSG_ID);
					$('#last_msg_time').text(res.custInfo.RECEIVE_DT);
					  if(res.cartHsitList.length > 0){
						  
						 var tpl = _.template($("#tpl_cust_hist").html());
						 $('.js-chat-hist-ul').append(tpl(res));
						 $('.chatHistContent')[0].scrollTop = $('.chatHistContent')[0].scrollHeight;
						 //console.error(html);
					}  
				} 
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
} 
var msgInterval = setInterval(relaodMessage, 10000); 


function fnFoucs(selector){
	$(selector).focus();
}
</script>
 
</head>
<body class="" style="overflow-x:hidden;overflow-y: auto;background-color: #fff; min-width: 600px;min-height: 450px;" onload="load()">
	 
	 <input type="hidden"  id="CUST_SYS_ID" value="${custInfo.CUST_SYS_ID }"/>
	 <input type="hidden"  id="OPENID" value="${custInfo.OPENID }"/>
	 <input type="hidden"  id="LAST_MSG_ID" value="${custInfo.LAST_MSG_ID }"/>
	 
	<!-- ▼ Main container --> 
        <div class="popupContent">
        	<div class="modalHeader" style="">
        		<div class="js-modal-close modalClose"  >
					<img src="/admin/images/goodsClass/close.png ">
				</div>
        	</div>
        	<div class="modalContent">
        	
	        	<div class="headImage">
					<a href="javascript:void(0)"> 
						<img src="${custInfo.WX_IF_HEADIMGURL}">
						<span class="chat-nickName">${custInfo.CUST_NICK_NM }</span>
					</a>
					<span><span style="color: #fb6e52">OPENID：</span>[&nbsp;${custInfo.OPENID}&nbsp;]</span>
				</div>
	        	
	        	<%-- <ul class="titleBar">
	        		<li><span class="chat-nickName">${custInfo.CUST_NICK_NM }</span></li>
	        		<li class="split"><img alt="" src="/admin/images/cust/vertical_line.png" style="margin-left:10%;margin-top:-2px"></li>
	        		
	        		<!-- <li><a href="#"  onclick="javascript:void(0);">${label.全部}</a></li>
	        		<li><a href="#"  onclick="javascript:void(0);">${label.有备注}</a></li> -->
	        	</ul> --%>
        	
        	
        		<div class="chatHistWarp">
        			<div class="mainArea">
        				<div class="chatHsit">
        					<div class="chatHistContent">
        					
		        				<ul class="js-chat-hist-ul">
		        					<c:forEach var="item" items="${cartHsitList }" varStatus="status">
		        					<li>
		        						<div class="custHistItem clearfix">
				        						<c:choose>
				        							<c:when test="${item.FROM_TYPE eq 1}">
				        								<div class="cartHistLeft">
				        									<%-- <img class="custHeadIcon" src="${custInfo.WX_IF_HEADIMGURL}">
				        									<div class="custDate"><fmt:formatDate value="${item.RECEIVE_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></div> 
				        									<div class="custContent" > 										
				        										<div class="custMessage">${item.CONTENT }</div> 
					        							ID=${item.ID },COMMENT=<br>
					        							MARK=${item.MARK },MSG_ID=${item.MSG_ID } 
				        									</div> --%>
				        									<table class="cust" style="width: 98%">
				        										<tr>
				        											<td rowspan="2" style="width: 60px;vertical-align: top;">
				        												<img class="custHeadIcon" src="${custInfo.WX_IF_HEADIMGURL}">
				        											</td>
				        											<td>
				        												<div class="custDate"><fmt:formatDate value="${item.RECEIVE_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></div> 
				        											</td>
				        										</tr>
				        										<tr>
				        											
				        											<td>
				        												<span class="custContent" > 										
				        													<c:choose>
												           						<c:when test="${item.MSG_TYPE == 'text'}">
												           							${item.CONTENT }
												           						</c:when>
												           						<c:when test="${item.MSG_TYPE == 'image'}">
												           							<c:choose>
												           								<c:when test="${empty item.FULL_URL}">
												           									<img alt="" src="${item.PIC_URL }" class="img-send">
												           								</c:when>
												           								<c:otherwise>
												           									<img alt="" src="${item.FULL_URL }" class="img-send">
												           								</c:otherwise>
												           							</c:choose>
												           						</c:when>
												           					</c:choose><%-- <span class="custMessage">${item.CONTENT }</span>  --%>
				        												</span>
				        											</td>
				        										</tr>
				        									</table>
				        								</div>
				        							<%-- 	<div class="cartHistRight">
				        										<div class="addComment" onclick="fnFoucs('.js-conmentDetail${status.index }');" ></div>
				        										<div class="conmentDetail js-conmentDetail${status.index }" data-id="${item.MSG_ID }" style="" contenteditable="true" >
				        										</div>
				        								</div> --%>
					        						
				        							</c:when>
				        							<c:otherwise>
				        								 <div class="cartHistLeft" style="text-align: right;">
				        									<%--<div class="userHeadIcon"><img src="${userInfo.imgUrl}"></div>
				        									<div class="userDate"><fmt:formatDate value="${item.RECEIVE_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></div> 
				        									<div class="userContent">
				        										<div class="userMessage">${item.CONTENT }</div> 
					        							ID=${item.ID },COMMENT=<br>
					        							MARK=${item.MARK },MSG_ID=${item.MSG_ID } 
				        									</div>
				        								</div> --%>
				        								<table class="user" style="width: 99%;">
			        										<tr>
			        											<td>
			        												<div class="userDate"><fmt:formatDate value="${item.RECEIVE_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></div> 
			        											</td>
			        											<td rowspan="2" style="width: 60px;vertical-align: top;">
			        												<img class="userHeadIcon" src="${userInfo.imgUrl}">
			        											</td>
			        										</tr>
			        										<tr>
			        											
			        											<td>
			        												<span class="userContent" > 										
			        													${item.CONTENT }<%-- <div class="custMessage">${item.CONTENT }</div>  --%>
			        												</span>
			        											</td>
			        										</tr>
				        								</table>
				        							<%-- <div>
					        							RECEIVE_DT=${item.RECEIVE_DT },CONTENT=${item.CONTENT }<br>
					        							ID=${item.ID },COMMENT=${item.COMMENT }<br>
					        							MARK=${item.MARK },MSG_ID=${item.MSG_ID }<br>
					        						</div> --%>
				        							</c:otherwise>
				        						</c:choose>
				        						
		        							</div>
		        							
			        					</li>
			        					
		        					</c:forEach>
		        				</ul>
		        				
        					</div>
        					
	        			</div>
	        			<div class="responseArea">
	        				 <div class="responseTypeWarp">
	        				 	<ul>
	        				 		<li class="responseType imgText active"></li>
	        				 		<!--<li class="responseType imgImage"></li>
	        				 		 <li class="responseType imgMusic"></li>
	        				 		<li class="responseType imgVideo"></li> 
	        				 		<li class="responseType imgNews"></li>-->
	        				 	</ul>
	        				 </div>
	        				 
	        				 <div class="responseContent">
	        				 	 <textarea id="textMessage" rows="4" style="" placeholder="${label.在此输入回复客户的内容}" ></textarea>
	        				 </div>
	        				 	<c:choose>
	        				 		<c:when test="${sendAble or true}">
	        				 			<!-- <div class="sendArea" >
	        				 				<img onclick="sendMessage();" src="/admin/images/cust/send.png" style="cursor: pointer;">
										</div> -->
										<div class="send" onclick="sendMessage();">
											<span class="btn-icon" ><ui:i18n key="发表"/></span>
										</div>
	        				 		</c:when>
	        				 		<c:otherwise>
	        				 			${label.不能主动发送消息给顾客}
	        				 		</c:otherwise>
	        				 	</c:choose>
	        			</div>
        			</div>
        			<div class="custInfo">
        				<c:set value="${custInfo.CUST_REAL_NM }" var="custRealNm"></c:set>
        				<c:if test="${empty custInfo.CUST_REAL_NM }">
        				<c:set value="${label.编辑}" var="custRealNm"></c:set>
        				
        				</c:if>
        			
        				<ul>
        					<li>${label.备注姓名}：<span class="js-nickname-remark" data-cust-sys-id="${custInfo.CUST_SYS_ID }" data-placeholder="${label.编辑}">${custRealNm }</span></li>
        					<li>${label.所在地区}：${custInfo.WX_IF_COUNTRY_NM } ${custInfo.WX_IF_PROVINCE_NM} ${custInfo.WX_IF_CITY_NM}</li>
        					<!-- <li>${label.淘宝旺旺}：${无}</li>
        					<li>${label.淘宝VIP}：${无}</li>
        					<li>${label.淘宝注册}：${无}</li>
        					<li>${label.淘宝信用}：${无}</li> -->
        					<li>${label.本店等级}：${custInfo.GRADE_NM }</li>
        					<!-- <li>会${label.会员标签}：无  <a href="javascript:">--${label.修改}</a></li> -->
        					<li>${label.关注时间}：<fmt:formatDate value="${custInfo.CREATED_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
        					<li>${label.最后对话}：<span id="last_msg_time"><fmt:formatDate value="${custInfo.RECEIVE_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></span></li>
        					<li>${label.最后购买}：<fmt:formatDate value="${custInfo.LAST_PUR_DT }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
        					<li>${label.购买次数}：${custInfo.PUR_TIMES }</li>
        					<li>${label.商品均价}：${custInfo.GOODS_PRICE_AVG }</li>
        					<li>${label.给我差评}：${无}</li>
        					<li>${label.领优惠券}：${无}</li>
        				</ul>
        			</div>
   				</div>
   
        	</div>
        </div>
	<!-- ▲ Main container -->
	
	
	
 <script id="tpl_cust_hist" type="text/template"> 
  {{ 
	for(var i = 0; i < cartHsitList.length ; i++){  
}}
	<li>
		<div class="custHistItem clearfix"> 
{{ 
		if(cartHsitList[i].FROM_TYPE == 1){
}}
		<div class="cartHistLeft">
			<table class="cust" style="width: 98%">
				<tr>
					<td rowspan="2" style="width: 60px">
				        <img class="custHeadIcon" src="${custInfo.WX_IF_HEADIMGURL}">
				    </td>
				    <td>
				        <div class="custDate">{{=cartHsitList[i].RECEIVE_DT }}</div> 
				    </td>
				</tr>
				<tr>       											
				    <td>
				    	<span class="custContent" > 	
							{{
								if(cartHsitList[i].MSG_TYPE == 'text'){
							}}		
								{{=cartHsitList[i].CONTENT}}
							{{
								}else if(cartHsitList[i].MSG_TYPE == 'image'){		
							}}		
									{{
										if(cartHsitList[i].FULL_URL == ''){
									}}		
											<img alt="" src="{{=cartHsitList[i].PIC_URL}}" class="img-send">
									{{
										}else{
									}}
											<img alt="" src="{{=cartHsitList[i].FULL_URL}}" class="img-send">
										{{
											}
										}}
							{{
								}
							}}
				    	</span>
				    </td>
				</tr>
			</table>
		</div>
						 
 {{ 
	}else{
}}
				<div class="cartHistLeft" style="text-align: right;">
				   <table class="user" style="width: 99%;">
			        	<tr>
			        		<td>
			        			<div class="userDate">{{=cartHsitList[i].RECEIVE_DT }}</div> 
			        		</td>
			        		<td rowspan="2" style="width: 60px">
			        			<img class="userHeadIcon" src="${userInfo.imgUrl}">
			        		</td>
			        	</tr>
			        	<tr>									
			        		<td>
			        			<span class="userContent" > 										
			        				{{=cartHsitList[i].CONTENT}}
			        			</span>
			        		</td>
			        	</tr>
				    </table>
				</div>

{{	
		}
}}
</div>
	</li>

{{
	}
}}
</script>
</body>
</html>