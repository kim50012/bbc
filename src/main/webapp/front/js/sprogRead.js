//选择要看的内容
function selectMsgSprog(obj,id){
	var $this=$(obj);
	var item = Number(id);
	$(".title_a").each(function(){
		$(this).removeClass("on_sprog").addClass("close_sprog");
		$(this).find("img").attr("style","display:none");
	});
	$this.find("img").attr("style","display:inline-block;");
	$this.removeClass("close_sprog").addClass("on_sprog");
	$(".show_message_div").attr("style","display:none;");
	$(".show_message_div.show_msg"+id).attr("style","display:inline-block;");
}
function addColorSprog(obj){
	$(obj).attr("style","background-color:#fcfcfc;");
}
function removeColorSprog(obj){
	$(obj).attr("style","background-color:#ffffff;");
}
//显示灰色 jQuery 遮罩层 
function showBg() { 
var bh = document.body.scrollHeight;
var bw =document.body.scrollWidth;
	$("#fullbg").css({ 
	height:bh, 
	width:bw, 
	display:"block" 
	}); 
	$("#dialog").show(); 
	} 
//关闭灰色 jQuery 遮罩 
function closeBg() { 
$("#fullbg,#dialog").hide(); 
} 