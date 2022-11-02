<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title></title>
<style type="text/css">
.poup-div-msg{
		width:80%;
		border-radius:4px;
		background-color: #fff;
		display:none;
		position: absolute;
		top:35%;
		z-index:20;
	}
	.poup-div-msg table{
		width:100%;
	}
	.poup-div-msg table thead tr td{
		padding-top:10px;
		border-bottom:1px solid #eee;
		height:100px;
		line-height:90px;
		font-size:16px;
		text-align: center;
	}
	.poup-div-msg table tbody tr td{
		height:45px;
		line-height: 45px;
		font-size:16px;
		color:#007bff;
		text-align: center;
	}
	
	.confirm-button-td{width: 50%;}
</style>
<script type="text/javascript">

//普通输入框提示信息
function alertTip(msg){
	
	$('#alertTip .know-msg-show').text(msg);
	$('#alertTip').bPopup({
    	modalClose: false,//弹出框深色区域，关闭的响应
        modalColor: "#000000",
        opacity: 0.4,
        fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
   	    position: [$(window).width()*0.1, ($(window).height() -200) /2]
    });
	
}

//关闭提示信息弹出框的操作
function closePoupDiv(){
	
	$('#alertTip').bPopup().close();
	
}


//确认框显示
function confirmTip(msg){
	
	$('#confirmTip .know-msg-show').text(msg);
	$('#confirmTip').bPopup({
    	modalClose: false,//弹出框深色区域，关闭的响应
        modalColor: "#000000",
        opacity: 0.4,
        fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
   	    position: [$(window).width()*0.1, ($(window).height() -200) /2]
    });
	
}

$(function(){
	
	 $(".confirm-button").click(function(){
		 var returnValue=$(this).attr("data-item");
		 $('#returnValue').val(returnValue);
		 $('#confirmTip').bPopup().close(); 
	 });
	
});

function closePopup(){
	
	if($('#returnValue').val()=='1'){
		return true;
	}else{
		return false;
	}
	
}

/**
confirmTip('评论失败');
	var times=0;
	$(".confirm-button").click(function(){
		times++;
		if(times==1){
			alert(closePopup());
		}
	});


lertTip('评论失败');
**/
</script>
</head>
<body>
	<div id="alertTip" class="poup-div-msg">
  		<table>
  			<thead>
	  			<tr>
	  				<td>
	  					<span class="know-msg-show">
	  						
	  					</span>
	  				</td>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<tr>
	  				<td class="exitPoup" onclick="closePoupDiv();">
	  					<span >确定</span>
	  				</td>
	  			</tr>
	  		</tbody>
  		</table>
  	</div>
  	
  	<div id="confirmTip" class="poup-div-msg">
  		<table>
  			<thead>
	  			<tr>
	  				<td colspan="2">
	  					<span class="know-msg-show">
	  						
	  					</span>
	  				</td>
	  			</tr>
	  		</thead>
	  		<tbody>
	  			<tr>
	  				<td class="confirm-button-td" onclick="closePopup()">
	  					<span class="confirm-button" data-item="1">确定</span>
	  				</td>
	  				<td class="confirm-button-td" onclick="closePopup()" style="border-left:1px solid #eee;">
	  					<span class="confirm-button" data-item="0">取消</span>
	  				</td>
	  				<input type="hidden" value="" id="returnValue"/>
	  			</tr>
	  		</tbody>
  		</table>
  	</div>
</body>
</html>