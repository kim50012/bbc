<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="图文消息"/></title>  
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
	height:480px;
	border-radius:7px;
	margin-left:13px;
	background-image: url("/admin/images/sendMsgAll/iphone_top.png");
	background-position: 0 0;
	background-repeat: no-repeat;
	border:1px solid #eee; 
} 
.poup-body-div .body-title{
	width:200px;
	margin-left:39px;
	height:20px;
	color:#fff;
	text-align: center;
	margin-top:22px;
	font-size:9px;
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
	left:50px;
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
</style> 
 
<script type="text/javascript">
	var audio = document.createElement('audio');
	$(function(){
		//关闭预览弹出框
		$('.close-div-img').click(function(){
			closeBpopupWindow('showNowBefore');
			var video = document.getElementById('videoShowNow');
			video.pause();
			audio.pause();
		});
	});
	//分页操作
	function showPage(pageNo, pageSize){
		window.scrollTo(0,0);
		query(pageNo, pageSize);
	}
	//分页的查询
	function query(pageNo, pageSize){
		
		console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
		var params = {
				pageCurr : pageNo
				,pageUnit : pageSize
		}
		var url = '/admin/msgControl/msgControlListFragment.htm';
		 
		 var $this = $('.js-grid-content');	
		 $this.showLoading();
		 $this.load(url , params ,  function(){ 
			 $this.find('.select2').select2({
				 minimumResultsForSearch : 5
				 ,allowClear : true 
			 }); 
			 $this.hideLoading();
		 });
		 
	}
	//打开修改页面
	function modifyMsg(messageId){
		window.location.href = '/admin/msgControl/msgModify.htm?messageId=' + messageId;
	}
	//打开预览操作
	function showMsgNow(messageId){
		$.ajax({
			data : {messageId : messageId},
			url : '/admin/msgControl/msgControlPreview.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			success : function(data){
				if(data.ret == 'success'){
					var map = data.map;
					$('.body-title').text(map.SHOP_NM);
					$('.body-msg-div').children().remove();
					if(map.SEND_FILE_TYPE == '素材'){
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
						if(map.SEND_FILE_TYPE == '文本'){
							htm += '<p>'+map.SEND_MSG_BODY + '</p>';
						}else if(map.SEND_FILE_TYPE == '图片'){
							htm += '<img src="'+map.FILE_URL + '" style="width:190px;height:150px;margin-left:5px;margin-top:5px;margin-bottom:5px;" />';
						}else if(map.SEND_FILE_TYPE == '音频'){
							htm += '<img src="/admin/images/sendMsgAll/music_play.png" id="musicFullUrl" style="cursor:pointer; border:1px solid #e5e5e5;margin-left:10px;margin-top:5px;" data-musicurl="' + map.FILE_URL + '"/>';
						}else if(map.SEND_FILE_TYPE == '视频'){
							htm += '<video id="videoShowNow" src="' + map.FILE_URL + '"  onclick="showVideo();"></video><img src="/admin/images/myFile/video_play.png" id="video_show_img" class="video-preview" onclick="showVideo();"/>';
						}
						$('.body-msg-div').append(htm);
					}
					showBpopup({
						id : 'showNowBefore',
						width : 300,
						height : 620,
						top:60
					});
					if(map.SEND_FILE_TYPE == '音频'){
						$('#musicFullUrl').click(function(){
							if(audio.paused){	
								audio.src = $('#musicFullUrl').data('musicurl');
								audio.play();
								flag_music = false;
							}else{
								audio.pause();
								flag_music = true;
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
			$('#video_show_img').attr('style','visibility: hidden;');
		}else{
			video.pause();
			$('#video_show_img').attr('style','visibility: visible;');
		}
	}
	//发送信息
	function sendMsg(messageId,sendFileType){
		window.location.href = '/admin/msgControl/msgSend.htm?messageId=' + messageId+'&sendFileType='+sendFileType;
	}
	//删除图文信息
	function deleteMsg(messageId){
		if(confirm('<ui:i18n key="您确定删除该信息吗"/>？')){
			var jobType = 'D';
			var messageId = messageId;
			//判断发送文件，素材类型等标志
			var sendFileType = $('#sendFileType').val();
			//存储发送的文件ID
			var materialFileId = '';//$('#fileId').val();
			//存储封面图片ID
			var coverPageId = '';
			//存储店铺素材连接地址
			var shopGoodsUrl = '';
			//存储发送的内容
			var sendMsgBody = '';
			//存储发送标题
			var msgTitle = '';
			var param = {
					sendFileType:sendFileType,
					materialFileId:materialFileId,
					coverPageId:coverPageId,
					shopGoodsUrl:shopGoodsUrl,
					sendMsgBody:sendMsgBody,
					msgTitle:msgTitle,
					jobType:jobType,
					messageId:messageId
			};
			$.ajax({
				data : param,
				url : '/admin/msgControl/saveMsgControl.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
				success : function(data){
					if(data.result == 'success'){
						alert('<ui:i18n key="操作成功"/>');
// 						window.location.href = '/admin/msgControl/msgControl.htm';
						var pageCurr = Number($('#currentPage').find('option:selected').val());
						var pageUnit = Number($('#pageUnit').find('option:selected').val());
						showPage(pageCurr,pageUnit);
					}else if(data.result == 'fail'){
						alert('<ui:i18n key="操作失败请重新操作"/>');
					}
				},
				error : function(a, msg, c) {
					alert('error: ' + msg);
				}
			});
		}
	}
	//打开新建图文消息页面
	function createMsg(){
		window.location.href = '/admin/msgControl/msgAdd.htm';
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="result-grid" style="margin-top: 30px;">
	      	<div class="result-grid-header">
   				<div class="result-grid-tools">
   				   <span class="result-grid-tool" onclick="createMsg();">
      		   	 	 	<img alt="" src="/admin/images/v2-icons/icon-plus.png" /><ui:i18n key="新建"/>
      		   		</span>
   				</div>
   			</div>
   			<div class="js-grid-content">
   				<div class="result-data-warp" style="">
   					<table class="result-grid-table">
			      		<colgroup>
		      		 			<col width="10%" />
		      		 			<col width="10%" />
		      		 			<col width="32%" />
		      		 			<col width="22%" />
		      		 			<col />
		      		 		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th>ID</th>
			      		 		<th><ui:i18n key="信息区分"/></th>
			      		 		<th><ui:i18n key="信息"/></th>
			      		 		<th><ui:i18n key="生成日期"/></th>
			      		 		<th><ui:i18n key="操作"/></th>
			      		 	</tr>
			      		 </thead>
			      		 <tbody  class="result-grid-tbody">
			      			<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${list.MESSAGE_ID }</td>
									<td >${list.SEND_FILE_TYPE}</td>
									<td>
										<c:choose>
											<c:when test="${list.SEND_FILE_TYPE eq '文本'  or list.SEND_FILE_TYPE eq '素材'}">
												<span class="text-ellipsis">${list.SEND_MSG_BODY }</span>
											</c:when>
											<c:otherwise>
												<span class="text-ellipsis">${list.FILE_NM }</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td ><ui:date value="${list.CREATED_DT}" pattern="date" /> </td>
									<td>
										<span class="gridbutton red"  onclick="modifyMsg(${list.MESSAGE_ID });"><ui:i18n key="编辑"/></span>
										<span class="gridbutton red" onclick="showMsgNow(${list.MESSAGE_ID });"><ui:i18n key="预览"/></span>
										<span class="gridbutton red" onclick="sendMsg(${list.MESSAGE_ID },${list.SEND_FILE_TYPE_ID});"><ui:i18n key="发送"/></span>
			      		 				<span class="gridbutton red" onclick="deleteMsg(${list.MESSAGE_ID });"><ui:i18n key="删除"/></span>
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
	      		<div class="poup-body-div">
	      			<div class="body-title">
	      			</div>
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