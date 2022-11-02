<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiInc.jsp"%> 
<title>定时发送</title>  
<link rel="stylesheet" type="text/css" href="/admin/css/goods/goods-editor.css" />  
<script type="text/javascript" src="/admin/js/jquery.bpopup.min.js"></script>
<style>

	.topBorder {width: 100%; height: 25px; margin-top: 30px; border-top: 1px solid #eeeeee; position: relative;}
	.ui-title {position: absolute; width: 160px; height: 24px; top: -10px; left: 0px; z-index: 1; background-color: #ffffff;}
	.ui-title img {margin: -4px 20px 0px 15px;}
	.ui-title span {font-size: 16px;}
	.ui-but {position: absolute; width: 96px; height: 24px; top: -12px; right: 100px; z-index: 1; background-color: #ffffff;}
	.ui-but .ui-bg {width: 100%; height: 24px; position: relative;}
	.ui-but .ui-bg .newAddBg {float: left; width: 96px; height: 24px; position: relative; cursor: pointer;}
	.ui-but .ui-bg .newAddBg .addImg {float: left; width: 14px; height: 14px; background-image: url("/admin/images/goods/plus.png"); background-repeat: no-repeat; margin-top: 5px; margin-right: 10px; margin-left: 20px;}
	.ui-but .ui-bg .newAddBg .addText {float: left; font-size: 14px; margin-top: 3px;}
	.btn-icon{ display:inline-block;width: 29px; height: 25px; position: relative; cursor: pointer; background-repeat: no-repeat; background-position: center; margin-left:3px; }
	.btn-icon.icon-edit{ background-image: url("/admin/images/pointMst/icon-edit.png"); }
	.btn-icon.icon-deleteImage{ background-image: url("/admin/images/pointMst/main_delete.png"); }
	.btn-icon.icon-query{ background-image: url("/admin/images/orders/details.png"); }
	.btn-tip{ position:absolute;  right:20px;  top:-5px;  width:40px; height: 20px; line-height:20px;  text-align: center; border-radius: 20px; background-color: #3574db; color: #fff; display: none;}
	.add-autoReply {
		display:none;
		position: relative; 
		font-size : 14px;
		width: 100%;
		margin-top: 20px;
		border:1px solid #eeeeee;
	}
	.add-autoReply table{
		margin-top:30px;
	}.add-autoReplyix table tr td{
		height:30px;
		text-align: left;
	}
	.add-autoReply table .topSpan{
		height:30px;
		width:130px;
		vertical-align: top;
	}
	.add-autoReply table .topSpan span{
		margin-left:40px;
		padding:0;
		margin-top:5px;
		display: inline-block;
	}
	.add-autoReply table  .selectInput{
		width:135px;
	}
	.add-autoReply table  .selectInput span{
		margin-top:5px;
		display: inline-block;
	}
	.add-autoReply table  .selectInput input{
		margin-top:-2px;
		width:13px;
		height:13px;
		margin-left:20px;
		margin-right:10px;
	}
	.add-autoReply table .grade_tr .select2{
		margin-top:5px;
		width:263px;
		margin-bottom:5px;
	}
	.add-autoReply table .custInput{
		width:250px;
		margin-top:5px;
		margin-bottom:5px;
	}
	.add-autoReply table .selectDiv{
		width:60px;
		height:30px;
		border-radius:8px;
		background-color:#ff7e00;
		color:#ffffff; 
		line-height:30px;
		text-align: center;
		cursor: pointer;
		display:inline-block;
		position: absolute;
		top:6px;
		right:-80px;
	}
	 .file_type_td .imgFile{
		margin-left:15px;
		margin-right:13px;
		width:40px;
		height:37px;
		display:inline-block;
		cursor: pointer;
		background-repeat: no-repeat;
	}
	.imgFile.text.publish{
		background-image: url("/admin/images/sendMsgAll/text.png");
	}
	.imgFile.text.none{
		background-image: url("/admin/images/sendMsgAll/text_none.png");
	}
	.imgFile.image.publish{
		background-image: url("/admin/images/sendMsgAll/image.png");
	}
	.imgFile.image.none{
		background-image: url("/admin/images/sendMsgAll/image_none.png");
	}
	.imgFile.music.publish{
		background-image: url("/admin/images/sendMsgAll/music.png");
	}
	.imgFile.music.none{
		background-image: url("/admin/images/sendMsgAll/music_none.png");
	}
	.imgFile.avi.publish{
		background-image: url("/admin/images/sendMsgAll/avi.png");
	}
	.imgFile.avi.none{
		background-image: url("/admin/images/sendMsgAll/avi_none.png");
	}
	.imgFile.file_text.publish{
		background-image: url("/admin/images/sendMsgAll/file_text.png");
	}
	.imgFile.file_text.none{
		background-image: url("/admin/images/sendMsgAll/file_text_none.png");
	}
	.file_type_div .link_div,.cover_page_div{
		height:30px;
		width:100%;
		margin-top:10px;
		display: none;
	}
	.file_type_div .title_head,.link_head,.cover_page_head{
		width:130px;
		display: inline-block;
		vertical-align: top;
	}
	.file_type_div .title_div{
		height:30px;
		width:100%;
		margin-top:10px;
	}
	.file_type_div .headSpan{
		margin-left:40px;
		display: inline-block;
		margin-top:5px;
	}
	.file_type_div .title_body,.link_body,.cover_page_body{
		display: inline-block;
	}
	.file_type_div input{
		width:380px;
	}
	.file_type_div  .selectDiv{
		position:absolute;
		width:60px;
		height:30px;
		border-radius:8px;
		display:inline-block;
		margin-left:20px;
		background-color:#ff7e00;
		color:#ffffff; 
		line-height:30px;
		text-align: center;
		cursor: pointer;
	}
	.foot_div{
		margin-top:15px;
	}
	.foot_div .send_msg_div{
		width:100%;
		height:175px;
	}
	.foot_div .send_msg_div span{
		display: inline-block;
		margin-left:40px;
		margin-top:5px;
	}
	.foot_div .send_msg_div div{
		display: inline-block;
		vertical-align: top;
	}
	.foot_div .send_msg_body {
		position: relative;
	}
	.foot_div .send_msg_body textarea{
		width:392px;
		height:175px;
		padding:0;
		font-size:14px;
	}
	.foot_div .send_msg_body div{
		width:370px;
		height:150px;
		position: absolute;
		display: inline-block;
		margin-top:10px;
		margin-left:10px;
		display:none;
	}
	.foot_div .send_msg_body div .music_display{
		background-image: url('/admin/images/sendMsgAll/music_play.png');
		width:60px;
		height:60px;
		border:1px solid #eeeeee;
		display: inline-block;
		cursor: pointer;
		background-color: #ffffff;
	}
	.foot_div .send_msg_body div  video{
		width:370px;
		height:150px;
		border:1px solid #eeeeee;
	}
	.foot_div .send_msg_body div .img_show_img{
		max-height: 150px;
		max-width: 370px;
	}
	
	
	.submitDiv{
		height:50px;
		width:100%;
		text-align: center;
		line-height: 50px;
		background-color: #eeeeee;
		margin-top:30px;
		margin-bottom:30px;
	}
	.submit{
		width:103px;
		height:35px;
		display: inline-block;
		margin-top:7.5px;
		cursor: pointer;
		background-repeat: no-repeat;
		margin-left:20px;
	}
	.submit.img_send{
		background-image: url("/admin/images/shopCreate/main_save.png");
	}
	.submit.img_servise{
		background-image: url("/admin/images/transport/abolish.png");
	}
	.file_select_div div{
		display: inline-block;
	}
	.file_select_div{
		margin-top:10px;
		margin-bottom:0px;
		height:30px;
		display:none;
		width:100%;
	}
	.popover {
		position: absolute;
		top: 0;
		left: 0;
		z-index: 1010;
		display: none;
		max-width: 376px;
		padding: 1px;
		text-align: left;
		background-color: #ffffff;
		-webkit-background-clip: padding-box;
		-moz-background-clip: padding;
		background-clip: padding-box;
		border: 1px solid #ccc;
		border: 1px solid rgba(0, 0, 0, 0.2);
		-webkit-border-radius: 6px;
		-moz-border-radius: 6px;
		border-radius: 6px;
		-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
		-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
		box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
		white-space: normal;
	}
	.keyWord-input-div{
		margin-top:20px;
		position: relative;	
		margin-bottom:10px;
	}
	.keyWord-input-div span{
		font-size:16px;
	}
	.popover span{
		display:inline-block;
		margin-top:-5px;
	}
	.keyWord-input-div a{
		margin-left:0px;
		color:#333333;
	}
	.keyWord-input-div a img{
		margin-right:10px;
	}
	.li-sp{
		display:inline-block;
		margin-right:10px;
	}
	.li-sp img{
		margin-bottom:3px;
	}
	.query-div-title a img{
		margin-bottom:3px;
	}
	.query-div-title{
		display:inline-block;
		font-size:12px;
		vertical-align: top;
	}
	.poupMessage .poupMessageTable {
		height: 30px;
		width: 580px;
		border-radius: 5px;
		text-align: center;
		font-size: 15px;
	}
	.poupMessage .poupMessageTable .poupTableHead td {
		height: 30px;
		width: 300px;
		background-color: #d1102d;
		border-radius: 5px 5px 0px 0px;
		font-size: 14px;
		color: #ffffff;
		text-align: left;
	}
	
	.poupMessage .poupMessageTable .poupTableHead td span {
		margin-left: 30px;
	}
	.poupMessage {
		position: absolute;
		background-color: #ffffff;
		top: -140px;
		left: -280px;
		border: 1px solid #eeeeee;
		border-radius: 5px;
		width: 580px;
		height: 410px;
		z-index: 0;
		filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0, direction=120, strength=2);
		-moz-box-shadow: 2px 2px 10px #e0e0e0;
		-webkit-box-shadow: 2px 2px 10px #e0e0e0;
		box-shadow: 0px 0px 10px #e0e0e0;
	}
 
.topSpan{
	height:30px;
	width:130px;
	vertical-align: top;
}
.show-cust-select{
	min-height:30px;
	width:260px;
	border:1px solid #e5e5e5;
	display: inline-block;
	margin-top:5px;
	border-radius:4px;
}
.show-cust-select li{
	float:left;
	border:1px solid #eeeeee;
	height:24px;
	margin-top:2px;
	margin-bottom:2px;
	line-height: 25px;
	border-radius:4px;
	width:80px;
	margin-left:3px;
	position: relative;
}
.show-cust-select li span{
	width:80px;
	display: inline-block;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
.show-cust-select li a{
	 position: absolute;
	cursor: pointer;
	top:-3px;
	right:-3px;
	border:1px solid #eeeeee; 
	height:10px;
	width:10px;
	border-radius:5px;
	font-size:8px;
	color:#333333;
	line-height: 8px;
	text-align: center;
}
.poupMessage .poupMessageTable .selectTable td{
	text-align: left;
	width:100%;
	font-size:12px;
}
.poupMessage .poupMessageTable .selectTable td input{
	margin-left:30px;
	margin-top:0;
	margin-right:10px;
}
.poupMessage .poupMessageTable .selectTable td span{
	margin-top:15px;
	display: inline-block;
}
.poupMessage .body_div_cust{
	margin-left:30px;
	width:520px;
	height:300px;
	margin-top:10px;
}
.poupMessage .body_div_cust .cust_one_div{
	width:75px;
	height:90px;
	display: inline-block;
	margin-left:10px;
	margin-rgith:7px;
	display:none;
}
.poupMessage .body_div_cust .cust_one_div .cust_img_show{
	width:60px;
	height:60px;
	border:1px solid #eeeeee;
	margin-bottom:5px;
	position: relative;
	cursor: pointer;
	margin-left:5px;
}
.poupMessage .body_div_cust .cust_one_div span{
	width:75px;
	display:block;  
	white-space:nowrap; 
	text-overflow:ellipsis; 
	overflow:hidden;
}
.poupMessage .cust_list_table{
	width:100%;
	margin-top:-15px;
}
.poupMessage .cust_list_table tfoot .confirm_div{
	width:90px;
	height:30px;
	color:#ffffff;
	text-align: center;
	line-height: 30px;
	font-size:14px;
	display: inline-block;
	background-color:#ff7e00;
	border-radius:8px;
	margin-left:40px;
	margin-top:5px;
	cursor: pointer;
}
.poupMessage .cust_list_table tfoot tr td{
	vertical-align: bottom;
}
.page_span{
	width:12px;
	height:22px;
	background-repeat: no-repeat;
	display: inline-block;
	cursor: pointer;
	margin-bottom:-2px;
}
.poupMessage .cust_list_table tfoot .select2{
	width:100px;
}
.poupMessage .cust_list_table tfoot .total_page_span{
	margin-bottom:5px;
	margin-left:0;
}
.page_span.page_first{
	background-image: url("/admin/images/sendMsgAll/page_first.png");
}
.page_span.page_first_none{
	background-image: url("/admin/images/sendMsgAll/page_firstno.png");
}
.page_span.page_front{
	background-image: url("/admin/images/sendMsgAll/page_front.png");
}
.page_span.page_front_none{
	background-image: url("/admin/images/sendMsgAll/page_headno.png");
}
.page_span.page_next{
	background-image: url("/admin/images/sendMsgAll/page_next.png");
}
.page_span.page_next_none{
	background-image: url("/admin/images/sendMsgAll/page_nextno.png");
}
.page_span.page_end{
	background-image: url("/admin/images/sendMsgAll/page_last.png");
}
.page_span.page_end_none{
	background-image: url("/admin/images/sendMsgAll/page_endno.png");
}
.select_flag{
	width:10px;
	height:10px;
	border:1px solid #eeeeee;
	position: absolute;
	bottom:0px;
	right:0px;
	background-image: url("/admin/images/sendMsgAll/select.png");
	background-repeat: no-repeat;
	background-position: 1px 2px;
	display:none;
}
.send_way_div{
	margin-top:20px;
}
.send_way_div div{
	display:inline-block;	
}
.send_way_div .send_way_head {
	width:130px;
	vertical-align: top;
}
.send_way_div .send_way_head span{
	margin-left:40px;
	margin-top:5px;
}
.send_way_div .send_way_body{

}
.send_way_div .send_way_body input{
	margin-left:20px;
	width:13px;
	height:13px;
	margin-top:0px;
}
.send_way_div .send_way_body span{
	margin-left:10px;
	display: inline-block;
}
.time_div{
	height:30px;
	margin-left:135px;
	margin-top: -23px;
}
.time_div input{
	width:100px;
	margin-bottom:0;
	padding:0;
	height:25px;
	background-image: url("/admin/images/pointMst/calendar.png");
	background-position: 80px 5px;
	background-repeat: no-repeat;
	cursor: pointer;
}
.time_div .select2{
	width:100px;
} 
.delete-flag.show-delete{
	background-color: #07d;
	color:#ffffff;
}
</style> 
<script type="text/javascript">
//判断标志
var flag_music=true;
var audio =document.createElement("audio");
$(function(){ 
	//操作提示文字的显示，隐藏
	$('.btn-icon').hover(function() {
		$(this).find('.btn-tip').show();
	}, function() {
		$(this).find('.btn-tip').hide();
	});
	$('.date_input').datepicker();
	//选择顾客时候的方式操作
	$(".cust_type" ).click(function(){
		var type_id=$(this).val();
		if(type_id==1){
			$("#custSelected").val('');
			//$("#custSysIdAll").val('');
			$(".show-cust-select").children().remove();
			$("#gradeSelected").select2("val","");
			$("#gradeSelected").attr("disabled",true);
			$("#select_cust_list").attr("style","background-color:#eeeeee;");
		}else if(type_id==2){
			$("#custSelected").val('');
			//$("#custSysIdAll").val('');
			$(".show-cust-select").children().remove();
			$("#gradeSelected").attr("disabled",false);
			$("#select_cust_list").attr("style","background-color:#eeeeee;");
		}else if(type_id==3){
			$("#gradeSelected").attr("disabled",true);
			$("#gradeSelected").select2("val","");
			$("#select_cust_list").attr("style","background-color:#ff7e00;");
		}
	});
	
	//选择上传文件的类型
	$('.imgFile').click(function(){
		var $this = $(this);
		$(".imgFile.image").removeClass('publish').addClass('none');
		$(".imgFile.avi").removeClass('publish').addClass('none');
		$(".imgFile.music").removeClass('publish').addClass('none');
		$(".imgFile.text").removeClass('publish').addClass('none');
		$(".imgFile.file_text").removeClass('publish').addClass('none');
		$this.removeClass('none').addClass('publish');
		var item = $this.data('item');
		if(item==1){
			$("#sendMsg").val('').attr("readonly",false);
			$(".link_div").attr("style","display:none");
			//$(".title_div").attr("style","display:inline-block");
			$(".cover_page_div").attr("style","display:none");
			$(".file_select_div").attr("style","display:none");
			$(".send_file_show").attr("style","display:none;");
			$(".send_file_show").children().remove();
			if(!flag_music){
				audio.pause();
			}
		}else if(item=='2' || item=='3' || item=='4'){
			$("#sendMsg").val('').attr("readonly","readonly");
			$(".link_div").attr("style","display:none");
			//$(".title_div").attr("style","display:none");
			$(".cover_page_div").attr("style","display:none");
			$(".file_select_div").attr("style","display:inline-block");
			if(item=='2'){
				$("#fileSelect").attr("placeholder","请选择所要发送的图片");
				$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectImg.htm?fileGroup=2");
				$("#bpoup_title").text("选择图片");
				if(($("#sendFileType").val())!='2'){
					$(".send_file_show").children().remove();
					$(".send_file_show").attr("style","display:none;");
					$("#fileSelect").val("");
				}
			}else if(item=='3'){
				$("#fileSelect").attr("placeholder","请选择所要发送的音频");
				$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectMusic.htm?fileGroup=2");
				$("#bpoup_title").text("选择音频");
				if(($("#sendFileType").val())!='3'){
					$(".send_file_show").children().remove();
					$(".send_file_show").attr("style","display:none;");
					$("#fileSelect").val("");
				}
				if(!flag_music){
					audio.pause();
				}
			}else if(item=='4'){
				$("#fileSelect").attr("placeholder","请选择所要发送的视频");
				$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectAvi.htm?fileGroup=2");
				$("#bpoup_title").text("选择视频");
				if(($("#sendFileType").val())!='4'){
					$(".send_file_show").children().remove();
					$(".send_file_show").attr("style","display:none;");
					$("#fileSelect").val("");
				}
				if(!flag_music){
					audio.pause();
				}
			}
		}else if(item=='5'){
			$("#sendMsg").val('').attr("readonly",false);
			$(".title_div").attr("style","display:inline-block");
			$(".cover_page_div").attr("style","display:inline-block");
			$(".link_div").attr("style","display:inline-block");
			$(".file_select_div").attr("style","display:none");
			$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectImg.htm?fileGroup=2");
			$("#bpoup_title").text("选择图片");
			$(".send_file_show").children().remove();
			$(".send_file_show").attr("style","display:none;");
			if(!flag_music){
				audio.pause();
			}
		}
		$("#sendFileType").val(item);
	});	
	//分页操作
	$(".page_span").click(function(){
		var item=$(this).data("item");
		var total_slip=$("#total_slip").val();
		var page_total=Number($("#page_total").text());
		//存储分页的页数
		var pageCurr=Number($("#pageSelect").find("option:selected").val());
		if(page_total==1){
			return;
		}//next end start front
		if((item=='next' && pageCurr!=page_total) || (item=="front" && pageCurr!=1)){
			var step=1;
			if(item=='front'){
				step=-1;
			}
			pageCurr+=step;
			var i=(pageCurr-1)*3;
			$(".cust_one_div").attr("style","dispaly:none;");
			$(".page"+i).attr("style","display:inline-block;");
			$(".page"+(i+1)).attr("style","display:inline-block;");
			$(".page"+(i+2)).attr("style","display:inline-block;");
			//alert(1);
			$("#pageSelect").select2("val",pageCurr);
			//alert(pageCurr);
		}
		if((item=='start' && pageCurr!=1)||(item=='end'&& pageCurr!=page_total)){
			pageCurr=1;
			if(item=="end"){
				pageCurr=page_total;
			}
			var i=(pageCurr-1)*3;
			$(".cust_one_div").attr("style","dispaly:none;");
			$(".page"+i).attr("style","display:inline-block;");
			$(".page"+(i+1)).attr("style","display:inline-block;");
			$(".page"+(i+2)).attr("style","display:inline-block;");
			$("#pageSelect").select2("val",pageCurr);
		}
		if(pageCurr==1){
			$(".page_span.page_front").removeClass("page_front").addClass("page_front_none");
			$(".page_span.page_first").removeClass("page_first").addClass("page_first_none");
			$(".page_span.page_next_none").removeClass("page_next_none").addClass("page_next");
			$(".page_span.page_end_none").removeClass("page_end_none").addClass("page_end"); 
		}else if(pageCurr==page_total){
			$(".page_span.page_front_none").removeClass("page_front_none").addClass("page_front");
			$(".page_span.page_first_none").removeClass("page_first_none").addClass("page_first");
			$(".page_span.page_next").removeClass("page_next").addClass("page_next_none");
			$(".page_span.page_end").removeClass("page_end").addClass("page_end_none");
		}else{
			$(".page_span.page_front_none").removeClass("page_front_none").addClass("page_front");
			$(".page_span.page_first_none").removeClass("page_first_none").addClass("page_first");
			$(".page_span.page_next_none").removeClass("page_next_none").addClass("page_next");
			$(".page_span.page_end_none").removeClass("page_end_none").addClass("page_end"); 
		}
		var flag=true;
		$(".cust_one_div").each(function(){
			if($(this).css("display")=='inline-block'){
				var flag_style=$(this).find(".cust_img_show").find(".select_flag").css("display");
				if(flag_style=="none"){
					flag=false;
				}
			}
		});
		if(flag){
			document.getElementById("selectAllCust").checked=true;
		}else{
			document.getElementById("selectAllCust").checked=false;
		}
	});
	//保存定时发送信息
	$(".submit.img_send").click(function(){
		var jobType='';
		var messageId='';
		if($(this).attr("data-flag")=="ADD"){
			jobType='I';
		}else if($(this).attr("data-flag")=="UPDATE"){
			jobType='U';
			messageId=$("#messageId").val();
		}

		//存储选择顾客的方式
		var cust_type_id=$('input[name="custSelect"]:checked').val();
		//存储选择的客户等级
		var gradeId='';
		//存储顾客的ID
		var custSysId="";
		if(typeof(cust_type_id)=='undefined'){
			alert("请选择要发送信息的顾客");
			return;
		}else if(cust_type_id==2){
			gradeId=$("#gradeSelected").find("option:selected").val();
		}else if(cust_type_id==3){
			$(".delete-flag").each(function(){
				custSysId+=$(this).attr("data-custId")+",";
			});
			if(custSysId==''){
				alert("请选择要发送的顾客");
				return;
			}
		}
		custSysId=custSysId.substr(0,custSysId.length-1);
		//判断发送文件，素材类型等标志
		var sendFileType=$("#sendFileType").val();
		//存储发送的文件ID
		var materialFileId="";//$("#fileId").val();
		//存储封面图片ID
		var coverPageId="";
		//存储店铺素材连接地址
		var shopGoodsUrl='';
		//存储发送的内容
		var sendMsgBody="";
		//发送时间(天)
		var dateInput=$("#dateInput").val();
		//发送时间(小时)
		var hourSelect=$("#hourSelect").val();
		if(hourSelect.length==1){
			hourSelect="0"+hourSelect;
		}
		//发送时间(分)
		var minuteSelect=$("#minuteSelect").val();
		if(minuteSelect.length==1){
			minuteSelect="0"+minuteSelect;
		}
		//发送时间
		var sendTime=dateInput+" "+hourSelect+":"+minuteSelect+":00";
		//存储发送标题
		var msgTitle=$("#titleMsg").val();
		if(msgTitle==""){
			alert("请填写标题");
			return;
		}
		if(sendFileType==1){
			sendMsgBody=$("#sendMsg").val();
			if(sendMsgBody==''){
				alert("请填写发送内容");
				return;
			}
		}else if(sendFileType==2 || sendFileType==3 || sendFileType==4){
			materialFileId=$("#fileId").val();
			if(materialFileId==''){
				alert("请选择要发送的文件");
				return;
			}
		}else if(sendFileType==5){
			coverPageId=$("#coverPageId").val();
			sendMsgBody=$("#sendMsg").val();
			shopGoodsUrl=$("#shopGoodsUrl").val();
			if(coverPageId==""){
				alert("请选择封面图片");
				return;
			}
			if(sendMsgBody==""){
				alert("请填写发送内容");
				return;
			}
			if(shopGoodsUrl==""){
				alert("请选择或者书写素材地址");
				return;
			}
		}
		var param={
				gradeId:gradeId,
				custSysId:custSysId,
				sendTypeId:cust_type_id,
				sendFileType:sendFileType,
				materialFileId:materialFileId,
				coverPageId:coverPageId,
				shopGoodsUrl:shopGoodsUrl,
				sendMsgBody:sendMsgBody,
				msgTitle:msgTitle,
				jobType:jobType,
				messageId:messageId,
				sendTime:sendTime
		};
		$.ajax({
			data : param,
			dataType : "json",
			type : "GET",
			cache : false,
			url : "/admin/weixin/timer/saveTimeToSend.htm", 
			contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				if(data.result=='success'){
					alert("操作成功");
					window.location.href="/admin/weixin/timer/timeToSend.htm";
				}else if(data.result=="fail"){
					alert("操作失败，请重新操作");
				}
			},
			error : function(a, msg, c) {
				alert("error: " + msg);
			}
		});
		
	});
	
	//关闭新建定时发送框
	$(".submit.img_servise").click(function(){
		$(".ui-but").show();
		$(".auto-replay-list").show();
		$(".add-autoReply").hide();
	});
	
	 //分页操作，前一页，第一页，后一页，最后一页
	$('#js-result-grid-footer .page-navi .page-icon').click(function(){
		var $this = $(this);
		if($this.attr('class').indexOf('-disabled') > -1 ){
			return ;
		}
		var $target = $($this.closest('tfoot').data('target'));
		if($this.hasClass('js-page-first')){
			var pageCurr=1;
			var pageUnit=$("#pageUnit").find("option:selected").val();
			window.location.href="/admin/weixin/timer/timeToSend.htm?pageCurr="+pageCurr+"&pageUnit="+pageUnit;
		}else if($this.hasClass('js-page-preview')){
			var pageCurr=Number($("#currentPage").find("option:selected").val())-1;
			var pageUnit=$("#pageUnit").find("option:selected").val();
			window.location.href="/admin/weixin/timer/timeToSend.htm?pageCurr="+pageCurr+"&pageUnit="+pageUnit;
		}else if($this.hasClass('js-page-next')){
			var pageCurr=Number($("#currentPage").find("option:selected").val())+1;
			var pageUnit=$("#pageUnit").find("option:selected").val();
			window.location.href="/admin/weixin/timer/timeToSend.htm?pageCurr="+pageCurr+"&pageUnit="+pageUnit;
		}else if($this.hasClass('js-page-last')){
			var pageCurr=${requestScope.totalPageCount};
			var pageUnit=$("#pageUnit").find("option:selected").val();
			window.location.href="/admin/weixin/timer/timeToSend.htm?pageCurr="+pageCurr+"&pageUnit="+pageUnit;
		}
	});
	//改变显示的第几页
	$('#currentPage').bind('change.change',function(){
		var pageCurr=Number($("#currentPage").find("option:selected").val());
		var pageUnit=$("#pageUnit").find("option:selected").val();
		window.location.href="/admin/weixin/timer/timeToSend.htm?pageCurr="+pageCurr+"&pageUnit="+pageUnit;
	});
	//改变每页显示条数
	$('#pageUnit').bind('change.change',function(){
		var pageCurr=Number($("#currentPage").find("option:selected").val());
		var pageUnit=$("#pageUnit").find("option:selected").val();
		window.location.href="/admin/weixin/timer/timeToSend.htm?pageCurr="+pageCurr+"&pageUnit="+pageUnit;
	});
	
	//打开修改定时发送信息页面
	 $(".btn-icon.icon-edit").click(function(){
		var messageId=$(this).attr("data-messageId");
		$("#messageId").val(messageId);
		$(".ui-but").hide();
		$(".auto-replay-list").hide();
		$(".add-autoReply").show();
		$(".submit.img_send").attr("data-flag","UPDATE");
		
		$.ajax({
  	 		data:{
  	 			messageId:messageId
  	 		},
			type : "POST",
			url : "/admin/weixin/timer/getTimeToSendUpdateMessage.htm",
			success : function(data) {
				if(data.list.length>0){
					var list=data.list;
					if(list[0].SEND_TYPE_ID==2){
						$("input[type=radio][name=custSelect][value=2]").attr("checked",true);
						$("#gradeSelected").removeAttr("disabled");
						var gradeId=list[0].CUST_GRADE;
						$("#gradeSelected").select2("val",gradeId);
					}else if(list[0].SEND_TYPE_ID==3){
						$("input[type=radio][name=custSelect][value=3]").attr("checked",true);
						$(".selectDiv").css("background-color","#ff7e00");
						var custSysId="";
						for(var i=0;i<data.list.length;i++){
							custSysId=list[i].CUST_SYS_ID;
							custName=list[i].CUST_NAME;
							var htm='<li class="show-div-delete"><span>'+custName+'</span><a class="delete-flag" data-custId="'+
							custSysId+'">×</a></li>';
							$(".show-cust-select").append(htm);
							
							$(".show-div-delete").mouseover(function(){
								$(this).find(".delete-flag").addClass("show-delete");
								$(".delete-flag.show-delete").click(function(){
									$(this).parent().remove();
								});
							});
							$(".show-div-delete").mouseout(function(){
								$(this).find(".delete-flag").removeClass("show-delete");
							});
							$("#bPoupDivCustSelect").bPopup().close();
						}
					}else if(list[0].SEND_TYPE_ID==1){
						$("input[type=radio][name=custSelect][value=1]").attr("checked",true);
					}
					var sendTime=list[0].SEND_TIME;
					dateInput=sendTime.substr(0,10);
					hour=sendTime.substr(11,2);
					minute=sendTime.substr(14,2);
					$("#dateInput").val(dateInput);
					num=hour.substr(0,1);
					num2=minute.substr(0,1);
					if(num==0){
						hour=sendTime.substr(12,1);
					}
					$("#hourSelect").select2("val",hour);
					if(num2==0){
						minute=sendTime.substr(15,1);
					}
					$("#minuteSelect").select2("val",minute);
					$("#titleMsg").val(list[0].MSG_TITLE);
					if(list[0].SEND_FILE_TYPE=='文本'){
						$("#sendMsg").val(list[0].SEND_MSG_BODY).attr("readonly",false);
						$(".link_div").attr("style","display:none");
						//$(".title_div").attr("style","display:none");
						$(".cover_page_div").attr("style","display:none");
						$(".file_select_div").attr("style","display:none");
						$(".send_file_show").attr("style","display:none;");
					}else if(list[0].SEND_FILE_TYPE=='图片'){
						$(".imgFile.image").removeClass('none').addClass('publish');
						$(".imgFile.text").removeClass('publish').addClass('none');
						$("#sendMsg").val('').attr("readonly","readonly");
						$(".link_div").attr("style","display:none");
						//$(".title_div").attr("style","display:none");
						$(".cover_page_div").attr("style","display:none");
						$(".file_select_div").attr("style","display:inline-block");
						$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectImg.htm?fileGroup=2");
						$("#sendFileType").val('2');
						$("#fileId").val(list[0].MATERIAL_FILE_ID);
						$("#fileSelect").val(list[0].FILE_NM);
						$(".send_file_show").attr("style","display:inline-block;");
						$(".send_file_show").append("<img class='img_show_img'  alt='' src='"+list[0].FILE_URL+"'/>");
					}else if(list[0].SEND_FILE_TYPE=='音频'){
						$(".imgFile.music").removeClass('none').addClass('publish');
						$(".imgFile.text").removeClass('publish').addClass('none');
						$("#sendMsg").val('').attr("readonly","readonly");
						$(".link_div").attr("style","display:none");
						//$(".title_div").attr("style","display:none");
						$(".cover_page_div").attr("style","display:none");
						$(".file_select_div").attr("style","display:inline-block");
						$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectMusic.htm?fileGroup=2");
						$("#fileId").val(list[0].MATERIAL_FILE_ID);
						$("#fileSelect").val(list[0].FILE_NM);
						$("#sendFileType").val('3');
						$(".send_file_show").attr("style","display:inline-block;").append("<div class='music_display' onclick='musicPlay();'><input type='hidden' value='"+list[0].FILE_URL
								+"' id='musicFullUrl'/></div>");
					}else if(list[0].SEND_FILE_TYPE=='视频'){
						$(".imgFile.avi").removeClass('none').addClass('publish');
						$(".imgFile.text").removeClass('publish').addClass('none');
						$("#sendMsg").val('').attr("readonly","readonly");
						$(".link_div").attr("style","display:none");
						//$(".title_div").attr("style","display:none");
						$(".cover_page_div").attr("style","display:none");
						$(".file_select_div").attr("style","display:inline-block");
						$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectAvi.htm?fileGroup=2");
						$("#sendFileType").val('4');
						$("#fileId").val(list[0].MATERIAL_FILE_ID);
						$("#fileSelect").val(list[0].FILE_NM);
						$(".send_file_show").attr("style","display:inline-block;").append('<video id="videoShowNow" src="'+list[0].FILE_URL+'"   controls="controls"   ></video>');
					}else if(list[0].SEND_FILE_TYPE=='素材'){
						$(".imgFile.text").removeClass('publish').addClass('none');
						$(".imgFile.file_text").removeClass('none').addClass('publish');
						$("#sendMsg").val(list[0].SEND_MSG_BODY).attr("readonly",false);
						$(".title_div").attr("style","display:inline-block");
						$(".cover_page_div").attr("style","display:inline-block");
						$(".link_div").attr("style","display:inline-block");
						$(".file_select_div").attr("style","display:none");
						$("#sendFileType").val('5');
						$("#coverPageName").val(list[0].COVER_PAGE_NM);
						$("#coverPageId").val(list[0].COVER_PAGE_ID);
						$("#shopGoodsUrl").val(list[0].SHOP_GOODS_URL);
					}
				}else{
					alert("操作失败，请重新操作");
				}
			},
			error : function(xhr, status, e) {
				alert( "error: " + status);
			}
		});
	 });
	 
	//定时发送信息的删除操作
	$(".btn-icon.icon-deleteImage").click(function(){
		if(confirm("你确定删除该信息？")){
			var jobType='D';
			var messageId=$(this).attr("data-messageId");
			//存储选择顾客的方式
			var cust_type_id="";
			//存储选择的客户等级
			var gradeId='';
			//存储顾客的ID
			var custSysId="";
			//判断发送文件，素材类型等标志
			var sendFileType="";
			//存储发送的文件ID
			var materialFileId="";//$("#fileId").val();
			//存储封面图片ID
			var coverPageId="";
			//存储店铺素材连接地址
			var shopGoodsUrl='';
			//存储发送的内容
			var sendMsgBody="";
			//存储发送标题
			var msgTitle="";
			var param={
					gradeId:gradeId,
					custSysId:custSysId,
					sendTypeId:cust_type_id,
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
				dataType : "json",
				type : "GET",
				cache : false,
				url : "/admin/weixin/timer/saveTimeToSend.htm", 
				contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
				success : function(data){
					if(data.result=='success'){
						alert("操作成功");
						window.location.href="/admin/weixin/timer/timeToSend.htm";
					}else if(data.result=="fail"){
						alert("操作失败，请重新操作");
					}
				},
				error : function(a, msg, c) {
					alert("error: " + msg);
				}
			});
		}
	});
	
	 $(".select2").select2({
			//width:"element"
			//,minimumInputLength:2
			//,maximumInputLength:10
			minimumResultsForSearch:90,
			//,separator:'^'
			 allowClear: true 
			//,closeOnSelect:true  //defalut:true
			//,openOnEnter:true 
	});
	
});
var flagSelectCust=true;
//弹出选择顾客的窗口
function bPoupCustSelect(){
	if(flagSelectCust){
		flagSelectCust=false;
		var cust_type_id=$('input[name="custSelect"]:checked').val();
		if(typeof(cust_type_id)=='undefined'|| cust_type_id=='1' || cust_type_id=='2'){
			return;
		}
		document.getElementById("selectAllCust").checked=false;
		$(".body_div_cust").children().remove();
		$("#pageSelect").children().remove();
		$.ajax({
			dataType : "json",
			type : "GET",
			cache : false,
			url : "/admin/sendMsgAll/selectCustMsg.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				var list=data.list;
				$("#total_slip").val(list.length);
				if(list.length==0){
					alert("暂时没有顾客");
				}else{
					for(var i=0;i<data.page_Count;i++){
						var htm='';
						//alert(i);
						var k=0;
						if(((i+1)*6)>list.length){
							k=list.length-i*6;
						}else{
							k=6;
						}
						 for(var j=0;j<k;j++){
							var m=i*6+j;
							htm+='<div class="cust_one_div page'+i
								+'"> <div class="cust_img_show" onclick="selectCustOne(this);"> <img src="'+list[m].WX_IF_HEADIMGURL
								+'"/> <input type="hidden" id="custSysId'+m+'" value="'+list[m].CUST_SYS_ID
								+'"/><div class="select_flag" id="select_flag'+m
								+'"></div></div><span  class="custName" id="custName'+m
							 	+'">'+list[m].WX_IF_NICK_NM+'</span> </div>';
						}
						 $(".body_div_cust").append(htm);
					}
				}
				$(".page0").attr("style","display:inline-block;");
				$(".page1").attr("style","display:inline-block;");
				$(".page2").attr("style","display:inline-block;");
				var pageCount=data.pageCount;
				if(data.pageCount==1 || data.pageCount==0){
					$(".page_span.page_next").removeClass("page_next").addClass("page_next_none");
					$(".page_span.page_end").removeClass("page_end").addClass("page_end_none");
					pageCount=1;
				}
				for(var i=1;i<=data.pageCount;i++){
					$("#pageSelect").append("<option value='"+i+"'>"+i+"</option>");
				}
				$("#page_total").text(data.pageCount);
				$("#pageSelect").select2("val","1");
				$('#bPoupDivCustSelect').bPopup({
				    	modalClose: false,//弹出框深色区域，关闭的响应
				       modalColor: "#aeaeae",
				       opacity: 0.3,
				       fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
				   	closeClass:'exitPoup'
				 });
				flagSelectCust=true;
			},
			error : function(a, msg, c) {
				alert("error: " + msg);
			}
		 });
	}
}
//选择一个顾客操作
function selectCustOne(obj){
	var $this=$(obj);
	var objSelect=$this.find(".select_flag");
	if(objSelect.css("display")=='none'){
		objSelect.attr("style","display:inline-block;");
	}else{
		objSelect.attr("style","display:none;");
	}
	var flag=true;
	$(".cust_one_div").each(function(){
		if($(this).css("display")=='inline-block'){
			var flag_style=$(this).find(".cust_img_show").find(".select_flag").css("display");
			if(flag_style=="none"){
				flag=false;
			}
		}
	});
	if(flag){
		document.getElementById("selectAllCust").checked=true;
	}else{
		document.getElementById("selectAllCust").checked=false;
	}
}
//确认选择的顾客
function submitCustSelect(){
	var name="";
	var custSysId="";
	var flag_cust=true;
	$(".select_flag").each(function(){
		if($(this).css("display")=="block"){
			custSysId=$(this).parent().find("input").val();
			$(".delete-flag").each(function(){
				if(custSysId==($(this).attr("data-custId"))){
					flag_cust=false;
				}
			});
		}
	});
	if(!flag_cust){
		alert("不可选择已选过的顾客");
		return;
	}
	$(".select_flag").each(function(){
		if($(this).css("display")=="block"){
			name=$(this).parent().parent().find(".custName").text();
			custSysId=$(this).parent().find("input").val();
			var htm='<li class="show-div-delete"><span>'+name+'</span><a class="delete-flag" data-custId="'+
			custSysId+'">×</a></li>';
			$(".show-cust-select").append(htm);
		}
	});
	if(custSysId==''){
		alert("没有选择顾客");
		return;
	}
	$(".show-div-delete").mouseover(function(){
		$(this).find(".delete-flag").addClass("show-delete");
		$(".delete-flag.show-delete").click(function(){
			$(this).parent().remove();
		});
	});
	$(".show-div-delete").mouseout(function(){
		$(this).find(".delete-flag").removeClass("show-delete");
	});
	$("#bPoupDivCustSelect").bPopup().close();
	flagSelectCust=true;
}
//选择顾客时候的全选按钮操作
function selectAll(){
	var pageCurr=Number($("#pageSelect").find("option:selected").val());
	var ctlBoxEle=document.getElementById("selectAllCust");
	var i=(pageCurr-1)*3;
	if(ctlBoxEle.checked){
		$(".cust_one_div").each(function(){
			if($(this).css("display")=='inline-block'){
				$(this).find(".cust_img_show").find(".select_flag").attr("style","display:inline-block;");
			}
		});
	}else{
		$(".cust_one_div").each(function(){
			if($(this).css("display")=='inline-block'){
				$(this).find(".cust_img_show").find(".select_flag").attr("style","display:none;");
			}
		});
	}
}
//弹出框
function bpoupAviMusicImgDiv(id){
	if(id=='1'){
		$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectMaterial.htm?fileGroup=2");
		$("#bpoup_title").text("选择链接");
	}else if(id=='2'){
		$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectImg.htm?fileGroup=2");
		$("#bpoup_title").text("选择图片");
	}
	$('#bpoupImgDiv').bPopup({
    	modalClose: false,//弹出框深色区域，关闭的响应
       modalColor: "#aeaeae",
       opacity: 0.3,
       fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
   	closeClass:'exitPoup'
 });
}
//关闭弹出框的操作
function closeDiv(id,name,url){
	$("#fileId").val(id);
	$("#fileSelect").val(name);
	$("#bpoupImgDiv").bPopup().close();
	var type=$("#sendFileType").val();
	if(type=='2'){
		$(".send_file_show").children().remove();
		$(".send_file_show").attr("style","display:inline-block;");
		$(".send_file_show").append("<img class='img_show_img'  alt='' src='"+url+"'/>");
	}else if(type=='3'){
		$(".send_file_show").children().remove();
		$(".send_file_show").attr("style","display:inline-block;").append("<div class='music_display' onclick='musicPlay();'><input type='hidden' value='"+url
								+"' id='musicFullUrl'/></div>");
	}else if(type=="4"){
		$("#iframe_avi_music_image").attr("src","/admin/sendMsgAll/selectAvi.htm?fileGroup=2");
		$(".send_file_show").children().remove();
		$(".send_file_show").attr("style","display:inline-block;").append('<video id="videoShowNow" src="'+url+'"   controls="controls"   ></video>');
	}else if(type=="5"){
		$("#coverPageName").val(name);
		$("#coverPageId").val(id);
	}
}
//关闭弹出框的操作
function closeDivMaterial(id,name,url){
	$("#shopGoodsUrl").val(url);
	$("#bpoupImgDiv").bPopup().close();
}
//音乐播放
function musicPlay(){
	if(flag_music){	
		audio.src=$("#musicFullUrl").val();
		audio.play();
		flag_music=false;
	}else{
		audio.pause();
		flag_music=true;
	}
}
//打开新建自动回复
function addTimeToSend(){
	$(".ui-but").hide();
	$(".auto-replay-list").hide();
	$(".add-autoReply").show();
	$(".submit.img_send").attr("data-flag","ADD");
}

</script>

<link rel="stylesheet" type="text/css" href="/admin/css/test.css" /> 
</head>
<body>
	<jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType"/> 
	</jsp:include>
	<!-- ▼ Main container --> 
        <div class="container">
        	<!-- ▼ Left Menu  --> 
        	<jsp:include page="/admin/inc/menuleft.jsp">
				<jsp:param value="${topMenuType}" name="topMenuType"/> 
				<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1"/> 
				<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2"/> 
			</jsp:include>
		    <!-- ▲ Left Menu  -->
		    
		    
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content">
            	<form action="">
            		<input type="hidden" id="goodsId" value="" /> 
            	</form>
            	
            	<form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
			         <input id="files" type="file" name="files[]" multiple style="display: none;" >  
			    </form>
            
				<div class="goods-step-area" >
				
			  		<div class="goods-content-step js-goods-content-step-1">

						<div class="topBorder">
							<div class="ui-title">
								<img src="/admin/images/icon2/manage.png">
								<span>定时发送</span>
							</div>
							<div class="ui-but">
								<div class="ui-bg">
									<div class="newAddBg" onclick="addTimeToSend();">
										<div class="addImg"></div>
										<div class="addText">新&nbsp;&nbsp;建</div>
									</div>
								</div>
							</div>
						</div>
			  			<div class="auto-replay-list" >
			  				<div class="ui-gridarea clearfix" style="min-height: 200px;">
								<table class="grid">
									<thead>
										<tr>
											<td style="width: 1%;"></td>
											<td style="width: 8%;">ID</td>
											<td style="width: 20%;">信息区分</td>
											<td style="width: 32%;">信息</td>
											<td style="width: 20%;">生成日期</td>
											<td style="width: 19%;">操作</td>
										</tr>
									</thead>
									<tbody class="js-result-grid-content">
										<c:forEach items="${list}" var="list" varStatus="status">
											<tr>
											   <td class="textalign" style="text-align: right;">
												 &nbsp;
											   </td>
												<td>${list.MESSAGE_ID }</td>
												<td>${list.SEND_FILE_TYPE}</td>
												<td>
													<c:choose>
														<c:when test="${list.SEND_FILE_TYPE eq '文本' or list.SEND_FILE_TYPE eq '素材'}">
															<span class="text-ellipsis">${list.SEND_MSG_BODY }</span>
														</c:when>
														<c:otherwise>
															<span class="text-ellipsis">${list.FILE_NM }</span>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="js-grid-gexing-nm">${list.CREATED_DT} </td>
												<td class="js-grid-gexing-nm">
													<div class="actions">
														<div class="actions-wrap">
															<a class="btn-icon icon-edit" data-messageId="${list.MESSAGE_ID }">
											           			<span class="btn-tip">编辑</span>
											           		</a>
															<a class="btn-icon icon-query" onclick="window.open('/admin/weixin/timer/timeToSendPreview.htm?messageId=${list.MESSAGE_ID}','newwindow','width=320, height=568, menubar=no, status=no, toolbar=no');">
											           			<span class="btn-tip">预览</span>
											           		</a>
															<a class="btn-icon  icon-deleteImage" data-messageId="${list.MESSAGE_ID }">
																<span class="btn-tip">删除</span>
															</a>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach> 
									</tbody>
									<tfoot data-target="#btnSerachGrid" id="js-result-grid-footer">
								        <tr>
								        	<td colspan="7"  class="grid-has-result" style="height:35px; line-height:35px;">
								        	  <div style="position: relative;">
												<div class="page-navigation" style="margin-top: 20px;margin-left:200px;text-align:left;" >
										         	<c:choose>
										         		<c:when test="${requestScope.pageCurr==1 }">
										         			<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
										         			<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
										         		</c:when>
										         		<c:otherwise>
										         			<a class="page-navi"><span class="page-icon js-page-first page-first"></span></a>
										         			<a class="page-navi"><span class="page-icon js-page-preview page-preview"></span></a>
										         		</c:otherwise>
										         	</c:choose>
										         	<select id="currentPage" class="page-select select2 js-current-page" >
											         	<c:forEach begin="1" end="${requestScope.totalPageCount}" varStatus="status">
											         		<option <c:if test="${status.index==requestScope.pageCurr }">selected="selected"</c:if>>${status.index }</option>
											         	</c:forEach>
											         	<c:if test="${requestScope.totalPageCount==0}">
											         		<option  selected="selected">1</option>
											         	</c:if>
										         	</select>
										         	<c:choose>
										         		<c:when test="${requestScope.pageCurr==requestScope.totalPageCount}">
										         			<a class="page-navi"><span class="page-icon js-page-next page-next-disabled"></span></a>
										         			<a class="page-navi"><span class="page-icon js-page-last page-last-disabled"></span></a>	
										         		</c:when>
										         		<c:otherwise>
										         			<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
										         			<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>	
										         		</c:otherwise>
										         	</c:choose>
										         	<select id="pageUnit" class="page-select select2 js-page-unit" >
										         		<option value="10" <c:if test="${requestScope.pageUnit==10 }">selected="selected"</c:if>>10</option>
										         		<option value="20" <c:if test="${requestScope.pageUnit==20 }">selected="selected"</c:if>>20</option>
										         		<option value="30" <c:if test="${requestScope.pageUnit==30 }">selected="selected"</c:if>>30</option>
										         		<option value="50" <c:if test="${requestScope.pageUnit==50 }">selected="selected"</c:if>>50</option>
										         	</select>
										         	<span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span>
										    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
										    			 每页${requestScope.pageUnit }条, 共${requestScope.totalCount }条
										    		</div>
										    	</div>
										    	</div>
											</td> 
								        </tr>
								        <tr class="grid-not-result" style="display: none;">
											<td colspan="7" style="padding-right: 4%; height: 35px; text-align: right;">
												 查询没有数据
											</td>
										 </tr>
									</tfoot>
								</table>
							</div>
						</div>
						<!-- Start 新建自动回复 -->
						<div class="add-autoReply" style="margin-top:0px;">
							<!-- <div class="keyWord-input-div">
								<span style="margin-left:47px;margin-right:20px;">关键字：</span>
								<a><img id="goods-tag-add" src="/admin/images/icon/icon-plus2.png">查询新标签（查询关键字）</a>
							</div> -->
							<table style="margin-top:20px;">
								<tr>
									<td rowspan="3" class="topSpan">
										<span>信息发送给：</span>
									</td>
									<td class="selectInput">
										<input type="radio" class="cust_type"  name="custSelect" value="1"/>
										<span>所有人</span>
									</td>
									<td>
									</td>
								</tr>
								<tr class="grade_tr">
									<td class="selectInput">
										<input type="radio" class="cust_type" name="custSelect" value="2"/>
										<span>客户等级</span>
									</td>
									<td style="height:40px;">
										<select  class="select2" id="gradeSelected" disabled="disabled" data-placeholder="请选择需要发送的客户等级" >
											<option value=""></option>
											<c:forEach items="${gradeList}" var="list" varStatus="status">
												<option value="${list.GRADE_ID}">${list.GRADE_NM}</option>								
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td class="selectInput" style="	vertical-align: top;">
										<input type="radio" class="cust_type"  name="custSelect" value="3" />
										<span style="margin-top:10px;display:inline-block;">筛选</span>
									</td>
									<td>
										<!-- <input type="text" class="custInput" readonly="readonly" id="custSelected" placeholder="请选择需要发送的客户"/>
										<input type="hidden" id="custSysIdAll" value=""/> -->
										<div style="display:inline-block;position: relative;max-height:35px;">
											<ul class="show-cust-select">

											</ul>
											<div class="selectDiv" style="background-color:#eeeeee;" id="select_cust_list" onclick="bPoupCustSelect();">
												<span>选择</span>
											</div>
										</div>
									</td>
								</tr>
								<tr ><td colspan="3" style="height:25px;"></td></tr>
								<tr style="height:40px;">
									<td class="topSpan">
										<span>发送类型：</span>
									</td>
									<td colspan="2" class="file_type_td">
										<span data-item='1' class="imgFile text publish"></span>
										<span data-item='2' class="imgFile image none"></span>
										<span data-item='3' class="imgFile music none"></span>
										<span data-item='4' class="imgFile avi none"></span>
										<span data-item='5' class="imgFile file_text none"></span>
										<input type="hidden" id="sendFileType" value="1" />
									</td>
								</tr>
							</table>
							<div style="width:100%;height:5px;"></div>
							<div class="file_type_div">
								<div class="title_div">
									<div class="title_head">
										<span class="headSpan">标题：</span>
									</div>
									<div class="title_body">
										<input type="text" value="" id="titleMsg" placeholder="请输入标题" />
									</div>
								</div>
								<div class="link_div">
									<div class="link_head">
										<span class="headSpan">链接到：</span>
									</div>
									<div class="link_body">
										<input type="text" id="shopGoodsUrl" value="" placeholder="请直接输入或选择所要发送的素材链接"/>
									</div>
									<div class="selectDiv" onclick="bpoupAviMusicImgDiv('1');">
										<span>选择</span>
									</div>
								</div>
								<div class="cover_page_div">
									<div class="cover_page_head">
										<span class="headSpan">封面：</span>
									</div>
									<div class="cover_page_body">
										<input type="text" value="" id="coverPageName" placeholder="请选择封面" readonly="readonly"/>
										<input type="hidden" value="" id="coverPageId"/>
									</div>
									<div class="selectDiv" onclick="bpoupAviMusicImgDiv('2');">
											<span>选择</span>
									</div>
								</div>
								<div class="file_select_div">
									<div class="cover_page_head">
									
									</div>
									<div >
										<input type="text" value="" id="fileSelect" placeholder="请选择所要发送的图片" readonly="readonly"/>
										<input type="hidden" value="" id="fileId"/>
									</div>
									<div class="selectDiv" onclick="bpoupAviMusicImgDiv('0');">
										<span>选择</span>
									</div>
								</div>
							</div>
							<div class="foot_div">
								<div class="send_msg_div" >
									<div class="send_msg_head" style="width:130px;">
										<span>发送内容：</span>
									</div>
									<div class="send_msg_body">
										<div class="send_file_show"></div>
										<textarea wrap="hard" rows="4" cols="50"  id="sendMsg" ></textarea>
									</div>
								</div>
								<div class="send_way_div">
									<div class="send_way_head">
										<span>发送时间：</span>
									</div>
								</div>
								<div class="time_div">
									<input type="text" id="dateInput" class="date_input" readonly="readonly" placeholder=" 年 月 日"/>
									<select class="select2" id="hourSelect"  data-placeholder=" 时">
										<option value=""></option>
										<c:forEach begin="0" end="23" varStatus="status">
											<option value="${status.index}">${status.index}</option>
										</c:forEach>
									</select>
									<select class="select2" id="minuteSelect" data-placeholder=" 分">
										<option value=""></option>
										<c:forEach begin="0" end="59" varStatus="status">
											<option value="${status.index}">${status.index}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="submitDiv" >
								<span class="submit img_send" data-flag="ADD"></span>
								<input type="hidden" value="" id="messageId"/>
								<span class="submit img_servise"></span>
							</div>
						</div>
						<!-- Start 弹出框 -->
						<!-- 弹出选择顾客的弹出框 -->
						<div class="bPoupDiv" id="bPoupDivCustSelect" style="display:none;">
							<div class="poupMessage" >
								<table class="poupMessageTable">
									<tr class="poupTableHead">
										<td>
											<span>选择客户</span> 
											<div style="float: right;">
												<img class="exitPoup" style="margin-right: 20px;cursor:pointer; width: 14px; height: 14px;" src="/admin/images/goodsSell/close.png" />
											</div>
										</td>
									</tr>
									<tr class="selectTable">
										<td>
											<input type="checkbox" id="selectAllCust" name="selectAll" onchange="selectAll();"/>
											<span>全选</span>
										</td>
									</tr>
								</table>
								<div class="body_div_cust">
								</div>
								<!-- <div class="foot_div_page"> -->
									<table class="cust_list_table">
										<tfoot>
											<tr>
												<td style="width:180px;">
													<div class="confirm_div" onclick="submitCustSelect();">
														<span>确认选择</span>
													</div>
												</td>
												<td style="width:90px;">
													<span class="page_span page_first_none" data-item='start'></span>
													<span class="page_span page_front_none" data-item='front'></span>
												</td>
												<td style="width:110px;">
													<select class="select2" id="pageSelect" onchange="getPageValue();">
														<option value=""></option>
													</select>
												</td>
												<td style="width:90px;">
													<span class="page_span page_next" data-item='next'></span>
													<span class="page_span page_end" data-item='end'></span>
												</td>
												<td>
													<input type="hidden" value="" id="total_slip"/>
													<span class="total_page_span">共 <span id="page_total"></span> 页</span>
												</td>
											</tr>
										</tfoot>
									</table>
								<!-- </div> -->
							</div>
						</div>
						<!-- End 弹出框结束 -->
						<!-- 弹出选择文件的弹出框 -->
						<div class="bPoupDiv" id="bpoupImgDiv" style="display:none;">
							<div class="poupMessage"  style="width:580px;height:410px;">
								<table class="poupMessageTable">
									<tr class="poupTableHead">
										<td>
											<span id="bpoup_title">选择图片</span> 
											<div style="float: right;">
												<img class="exitPoup" style="margin-right: 20px;cursor:pointer; width: 14px; height: 14px;" src="/admin/images/goodsSell/close.png" />
											</div>
										</td>
									</tr>
								</table>
								<iframe width=580px; height=380px; frameBorder=0 scrolling=no  src="" id="iframe_avi_music_image">
								</iframe>
							</div>
						</div>
						<!-- End 新建自动回复 -->
			  		</div><!--js-goods-content-step-1 -->
			  		
			  		 
			  	</div>	
				<!-- end22 -->
			
			</div> 
            <!-- ▲ detali content -->
        </div>

		<!-- ▲ Main container -->
		  <!-- ▼ Main footer -->
       <jsp:include page="/admin/inc/footer.jsp"></jsp:include>
		<!-- ▲  Main footer -->
 
</body>
</html>
