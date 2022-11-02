<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<% 
	response.setHeader("Cache-Control", "no-cache"); 
	response.setHeader("Cache-Control", "no-store"); 
	response.setDateHeader("Expires", 0); 
	response.setHeader("Pragma", "no-cache"); 
%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="自动回复"/></title>  
<style type="text/css">
 .poupDiv{
 	position:absolute;
 	width:300px;
 	height:620px;
 	border-radius:47px;
 	background-color: #fff; 
 	box-shadow:0 0 10px #fff;
 	display:none;
 }
  .poupDiv .poup-top-title{
  	width:100%;
  	height:70px;
 	text-align: center;
  }
   .poupDiv .poup-foot{
  	width:100%;
  	height:63px;
 	text-align: center;
 	vertical-align: bottom;
 	padding-top:7px;
  }
 
.poup-body-div{
	width:274px;
	height:434px;
	border-radius: 0 0 7px 7px;
	margin-left:13px;
	border:1px solid #eee; 
	overflow-y:auto; ; 
	overflow-x: hidden;
}
.poup-body-div1{
	width:274px;
	height:46px;
	border-radius:7px 7px 0 0;
	margin-left:13px;
	border:1px solid #eee; 
} 
.body-title{
	width:100%;
	padding-top:20px;
	height:26px;
	color:#fff;
	text-align: center;
	font-size:9px;
	background-image: url("/admin/images/sendMsgAll/iphone_top.png");
	background-position: 0 0;
	background-repeat: no-repeat;
	vertical-align: bottom;
}
.poup-body-div .body-msg-div{
	width:100%;
	margin-top:20px;
	position: relative;
}
.shop-img img{
 	width:40px;
 	height:40px;
 	border:1px solid #eeeeee;
 	margin-top:20px;
 	margin-left:10px;
 }
  .div-show-msg{
 	width:200px;
 	min-height:70px;
 	border:1px solid #c5c5c5;
 	position:absolute;
 	background-color: #fff;
 	z-index:30;
	filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2);
	-moz-box-shadow: 2px 2px 10px #e0e0e0;
	-webkit-box-shadow: 2px 2px 10px #e0e0e0;
	box-shadow: 0px 0px 10px #e0e0e0;
	left:60px;
	top:10px;
}
.dropDown1,.dropDown3,.dropDown2
 {
 	width:0;
 	height:0; 
 	overflow:hidden;
 	border-width:10px; 
 	border-style:dotted dotted solid;  
 	position:absolute
 }
 .PoupDivBody{
 	position: absolute; 
 	width:8px; 
 	height:8px; 
 	left:-20px; 
 	top:15px
 }
 .dropDown1{
 	border-color: transparent #c5c5c5 transparent   transparent  ;
 	top:-0.6px;
 	z-index:0;
 }
 .dropDown3{
 	border-color: transparent #c5c5c5 transparent  transparent  ;
 	top:0.5px;
 	z-index:0;
 }
 .dropDown2{
 	border-color: transparent #ffffff transparent  transparent  ; 
 	top:0;
 	z-index:1;
 }
  .preview-div{
	 	width:270px;
	 }
	 .ui-box p{
	 	line-height: 20px;
	 	padding-left:5px;
	 	margin-top:5px;
	 	margin-bottom:5px;
	 	padding-right:5px;
	 }
	 .ui-box {
	 	position: relative;
	 }
	 .ui-box video{
	 	width:190px;
	 	height:150px;
	 	margin-left:5px;
	 	margin-top:15px;
	 	margin-bottom:10px;
	 	cursor: pointer;
	 }
	 .video-preview{
	 	cursor: pointer;
	 	position: absolute;
	 	top:80px;
	 	left:85px;
	 }
	 .materal-div-out{
	 	width:92%;
	 	margin-left:4%;
	 	border:1px solid #e5e5e5;
	 	margin-top:5px;
	 	margin-bottom:5px;
	 	position: relative;
	 	background-color: #ffffff;
	 	border-radius: 6px;
	 }
	 .materal-div-in{
	 	width:92%;
	 	margin-left:4%;
	 	position: relative;
	 }
	 .materal-div-in img{
	 	width:100%;
	 	height:150px;
	 }
	 .materal-div-in span{
	 	width:230px;
	 	white-space:nowrap; 
		text-overflow:ellipsis; 
		overflow:hidden;
	 }
	 .materal-div-in span:first-child{
	 	width:250px;
	 	margin-top:10px;
	 	margin-bottom:0px;
	 	display: inline-block;
	 	font-size:16px;
	 }
	 .close-div-img{
	 	position: absolute;
	 	margin-left:300px;
	 	cursor: pointer;
	 }
	 .gray {
    color: #a2a2a2;
}
</style> 
 
 
 
 <script type="text/javascript">
//分页操作
function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}
//分页的查询
function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var keyWord = $('#keyWord').val();
	var params = {
			keyWord : keyWord
			,sendFileType : $('#sendFileType').val()
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/weixin/reply/autoFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 $this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 }); 
		 $this.hideLoading();
	 });
	 
}

 </script>
<script type="text/javascript">
var flag_music=true;
var audio =document.createElement("audio");
	$(function(){
		//条件查询数据
		$(".js-query").click(function(){
			query(1,10);
		});
		//关闭预览弹出框
		$('.close-div-img').click(function(){
			closeBpopupWindow('showNowBefore');
			var video = document.getElementById("videoShowNow");
			if(!!video){
				video.pause();
				audio.pause();
			}
		});
		
		$('#currentPage').select2('val','1');
// 		$('#sendFileType').selct2('val','${requestScope.sendFileType}')
	});
	 
	//删除自动回复信息
	function deleteMessage(messageId){
		if(confirm('<ui:i18n key="您确定删除该信息吗"/>？')){
			$.ajax({
				url : '/admin/weixin/reply/delete.htm',  
				data : {
					messageId : messageId
				},
				success : function(res){
					if(res.success){
						alert('<ui:i18n key="删除成功"/>');
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
// 						window.location.reload();
					}else{
						alert('<ui:i18n key="删除失败"/>\n' + res.err_msg);
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		}
	}
	//信息的修改
	function modifyMessage(id){
		window.location.href = '/admin/weixin/reply/editAuto.htm?messageId=' + id;
	}
	//信息的创建
	function createAutoReply(){
		window.location.href = '/admin/weixin/reply/editAuto.htm';
	}
	//信息的预览
	function showMsgNow(messageId){
		$.ajax({
			data : {messageId : messageId},
			type : 'POST',
			url : '/admin/weixin/reply/preview.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.ret == 'success'){
					var map=data.map;
					$('.body-title').text(map.SHOP_NM);
					$('.body-msg-div').children().remove();
					if(map.SEND_FILE_TYPE == 5){
						var htm = '<div class="materal-div-out">' +
									'<div class="materal-div-in clearfix">' +
										'<span style="font-weight: bold; color: #020202;">' + map.MSG_TITLE + '</span>' +
										'<div style="margin-bottom: 6px; color: #adadad;" ></div>' +
										'<img src="'+map.COVER_PAGE_URL + '" />' +
										'<span style="display:inline-block;margin-top:5px; color: #747474;">' + map.SEND_MSG_BODY + '</span>' +
										'<div style="background-color: #e3e3e3; height: 1px; margin-top: 5px;"></div> ' +
										'<div style="position: relative ;margin-bottom: 30px; padding-top: 5px; ">' +
											' <div style="float: left;  color:#191919; display: inline-block; width: 50%; line-height: 20px; height: 20px;">阅读全文</div>' +
											' <div style="float: right; color:#929292; display: inline-block;width: 50%; text-align: right;line-height: 20px; height: 20px;">></div>' +
										'</div> </div> </div>';
						$('.body-msg-div').append(htm);
					}else{
						var htm = '<div class="preview-div">' +
									'<div class="shop-img"><img src="' + map.IMG_URL + '"/></div>' +
									'<div class="div-show-msg" id="updatePoupDiv">' +
										'<div class="PoupDivBody">' +
											'<div class="dropDown1"></div>' +
											'<div class="dropDown2"></div>' +
											'<div class="dropDown3"></div>' +
										'</div>' +
										'<div class="ui-box">';
						if(map.SEND_FILE_TYPE == 1){
							htm += '<p>'+map.SEND_MSG_BODY + '</p>';
						}else if(map.SEND_FILE_TYPE == 2){
							htm += '<img src="'+map.FILE_URL + '" style="width:190px;height:150px;margin-left:5px;margin-top:5px;margin-bottom:5px;" />';
						}else if(map.SEND_FILE_TYPE == 3){
							htm += '<img src="/admin/images/sendMsgAll/music_play.png" id="musicFullUrl" style="cursor:pointer; border:1px solid #e5e5e5;margin-left:10px;margin-top:5px;" data-musicUrl="' + map.FILE_URL + '"/>';
						}else if(map.SEND_FILE_TYPE == 4){
							htm += '<video id="videoShowNow" src="' + map.FILE_URL + '"  onclick="showVideo();"></video><img src="/admin/images/myFile/video_play.png" id="video_show_img" class="video-preview" onclick="showVideo();"/>';
						}
						$('.body-msg-div').append(htm);
					}
					showBpopup({
						id : 'showNowBefore',
						width : 300,
						height : 620,
						top:30
					});
					if(map.SEND_FILE_TYPE == 3){
						$("#musicFullUrl").click(function(){
							if(audio.paused){	
								audio.src=$("#musicFullUrl").attr("data-musicUrl");
								audio.play();
								flag_music=false;
							}else{
								audio.pause();
								flag_music=true;
							}
						});
					}
				}else if(data.result == 'fail'){
					alert('<ui:i18n key="操作失败"/>' + '，' + '<ui:i18n key="请重新操作"/>');
				}
			},
			error : function(a, msg, c) {
				alert('error: ' + msg);
			}
		});
	}
	
	//视频的暂停，播放
	function showVideo(){
		var video = document.getElementById("videoShowNow");
		if(video.paused){
			video.play();
			$("#video_show_img").attr("style","visibility: hidden;");
		}else{
			video.pause();
			$("#video_show_img").attr("style","visibility: visible;");
		}
	}
	 function previewNewsMaterial(msgId){
		 $('.body-msg-div').children().remove();
		 $('.body-msg-div').append('<iframe height="400px;" src="/admin/weixin/reply/previewNewsMaterial.htm?msgId='+msgId+'" id="showPreviewNewsMaterial" src=""></iframe>');
		showBpopup({
				id : 'showNowBefore',
				width : 300,
				height : 620,
				top:30
		});
		//window.open('/admin/weixin/reply/previewNewsMaterial.htm?msgId='+msgId,'newwindow','width=320, height=568, menubar=no, status=no, toolbar=no');
	 }
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="12%" />
       		 			<col width="38%" />
       		 			<col width="12%" />
       		 			<col width="38%" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="关键字"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="keyWord" value="${requestScope.keyWord }"  />
						</td>
       		 			<td class="flabel"><ui:i18n key="信息区分"/>：</td>
       		 			<td class="fcomp">
       		 				<select  class="select2" id="sendFileType" style="width:260px;" >
       		 					<option value="">全部</option>
       		 					<option value="1">文本</option>
       		 					<option value="2">图片</option>
       		 					<option value="3">音乐</option>
       		 					<option value="4">视频</option>
       		 					<option value="5">图文</option>
       		 					<option value="6">素材</option>
							</select>
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button js-query">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
      	
      	
		<div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="createAutoReply();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="9%" />
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="32%" />
		      		 			<col width="20%" />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th>ID</th>
			      		 		<th><ui:i18n key="关键字"/></th>
			      		 		<th><ui:i18n key="信息区分"/></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="生成日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.MESSAGE_ID }</td>
									<td ><span>${list.KEYWORD}</span></td>
									<td>${list.SEND_FILE_TYPE_NM}</td>
									<td>
										<%-- <span class="text-ellipsis" title="<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq 1  or list.SEND_FILE_TYPE eq 5}">
												 ${list.SEND_MSG_BODY } 
											</c:when>
											<c:otherwise>
												${list.FILE_NM }
											</c:otherwise>
										</c:choose>">
										<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq 1  or list.SEND_FILE_TYPE eq 5}">
												 ${list.SEND_MSG_BODY } 
											</c:when>
											<c:otherwise>
												${list.FILE_NM }
											</c:otherwise>
										</c:choose>
										</span> --%>
										<span class="text-ellipsis" title="${list.MSG_TITLE}">${list.MSG_TITLE}</span>
									</td>
									<td ><ui:date value="${list.CREATED_DT}" pattern="date" /> </td>
									<td>
										<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq 6}">
												<span class="gridbutton gray" ><ui:i18n key="编辑"/></span>
												<span class="gridbutton red" onclick="previewNewsMaterial(${list.MESSAGE_ID });"><ui:i18n key="预览"/></span>
											</c:when>
											<c:otherwise>
												<span class="gridbutton red"  onclick="modifyMessage(${list.MESSAGE_ID });"><ui:i18n key="编辑"/></span>
												<span class="gridbutton red" onclick="showMsgNow(${list.MESSAGE_ID });"><ui:i18n key="预览"/></span>
											</c:otherwise>
										</c:choose>
			      		 				<span class="gridbutton red" onclick="deleteMessage(${list.MESSAGE_ID });"><ui:i18n key="删除"/></span>
									</td>
								</tr>
							</c:forEach> 
			      		 </tbody>
			      	</table>
   				</div>
		      	
		      	 <ui:paging page="${page }" />
	     	</div>
	    </div>
	      
	      <div class="poupDiv" id="showNowBefore">
	      	<img src="/admin/images/sendMsgAll/btn_close.png" class="close-div-img"/>
	      		<div class="poup-top-title">
	      			<img src="/admin/images/sendMsgAll/iphone_1.png"/>
	      		</div>
	      		<div class="poup-body-div1">
		      		<div class="body-title">
		      		</div>
		      	</div>
	      		<div class="poup-body-div">
	      			<div class="body-msg-div">
					</div>
	      		</div>
	      		<div class="poup-foot">
	      			<img src="/admin/images/sendMsgAll/iphone_home.png"/>
	      		</div>
	      </div>
	      
	</div>
	<!-- ▲ container  -->
</body>
</html>