
//打开弹出层
function ShowPopup(show_div,bg_div){
	var bh = document.body.scrollHeight;
	var bw =document.body.scrollWidth;
	var scroHeight= Number(document.body.scrollTop);
	document.getElementById(show_div).style.display = 'block';
	document.getElementById(bg_div).style.display = 'block';
	$("#" + bg_div).height(bh);
	$("#" + bg_div).width(bw);
	$("#popup").attr("style","top:"+(scroHeight)+"px").show(); 
}
//关闭弹出层
function ClosePopup(show_div, bg_div) {
	document.getElementById(show_div).style.display = 'none';
	document.getElementById(bg_div).style.display = 'none';
};
//获取某个ID为X的元素
function getElement(x){ 
    return document.getElementById(x);
} 
//给其修改display属性
function sh(x){
	getElement(x).style.display = getElement(x).style.display? "" : "none";
}
//给某个元素赋值
function gets_value(str){
    $('#whole').val(str); 
    sh('pageNumId');
}
//给某个元素赋值
function gets_page_value(str){
	$('#wholePage').val(str);
	sh('pageNum');
}
//分页操作
function gets_value(){
	var numSum=$('#numSum').val();
	//存储店铺的ID
	var shopId=$("#shopIdValue").val();
	//存储分页的每页条数
	var pageUnit=$("#wholePage").find("option:selected").val();
	//存储分页的页数
	var pageCurr=$("#whole").find("option:selected").val();
	var numSumPage=pageUnit*pageCurr;
	var pageEntity="";
	if(numSum < numSumPage){
		pageEntity=pageUnit;
		pageUnit=numSum-(pageUnit*(pageCurr-1));
	}
	//window.location.href="/protal/cust.htm?pageUnit="+pageUnit+"&pageCurr="+pageCurr+"&pageEntity="+pageEntity;
}
//分页操作
function gets_page_value(){
	//存储店铺的ID
	var shopId=$("#shopIdValue").val();
	//存储分页的每页条数
	var pageUnit=$("#wholePage").find("option:selected").val();
	//存储分页的页数
	var pageCurr=1;
	//window.location.href="/admin/cust/cust.htm?pageUnit="+pageUnit+"&pageCurr="+pageCurr;
}
//页面的上一页，下一页，第一页，最后一页的操作。
function pageNext(pageCurr){
	var numSum=$('#numSum').val();
	//存储店铺的ID
	var shopId=$("#shopIdValue").val();
	//存储分页的页数
	var pageUnit=$("#wholePage").find("option:selected").val();
	var numSumPage=pageUnit*pageCurr;
	var pageEntity="";
	if(numSum < numSumPage){
		pageEntity=pageUnit;
		pageUnit=numSum-(pageUnit*(pageCurr-1));
	}
	//window.location.href="/admin/cust/cust.htm?pageUnit="+pageUnit+"&pageCurr="+pageCurr+"&pageEntity="+pageEntity;
}