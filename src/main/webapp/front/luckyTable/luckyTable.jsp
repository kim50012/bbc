<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>幸运大转盘</title>
<%@ include file="/front/skin/common.jsp"%>
<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/admin/js/ajaxfileupload.js"></script>

<style type="text/css">
body{background-color: #e2e2e2;}
.contant{width: 100%;height: 100%;}
.top{width: 100%;}
.top img{width: 100%;}
.fenlei{width: 35%;height: 25px;position: absolute;top: 22%;left:10%}
.fenlei input{width: 40%;height: 100%;font-size: 16px;color:#8b8b8b ;border: 1px solid #8b8b8b;background-color: #e2e2e2}
.user{width: 39%;height:60px;position: absolute;top: 16%;right: 1%}
.user table td{text-align: center;}
.user .myHead{width:40px;height:40px; }
.user .myHead img{width: 40px;height: 40px;border-radius:8px;}
.body{width: 100%;position: absolute;top:27%;height: auto;}
.body table td{color: #8b8b8b;}
.headImg{width:40px;height: 40px;display: inline-block;}
.headImg img{width: 40px;height: 40px;border-radius:8px}
</style>

<script type="text/javascript">
$(function(){
	$(".ID").each(function(){
		if($(this).text()=="1"){
			$(this).css("color","black");
		}else if($(this).text()=="2"){
			$(this).css("color","#444444");
		}
	});
	var bodyHeight=$("body").height();
	var height=bodyHeight*0.108;
	$(".bodyTable td").height(height);
	var length=${requestScope.list}.length;
	if(length==0){
		$(".myWin").text("0");
	}
});
function clickHongbao(){
	$.ajax({
		data:{gameId:$("#gameId").val()},
 		dataType : "json",
 		type : "GET",
 		cache : false,
 		url : "/front/luckyTable/hongbao.htm",
 		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
 		success : function(data){
 			if (data.result == 'success'){
 				var list=data.list;
 				if(list.length>0){
 				$(".leiji-text").text("我的累计红包");
 				$(".myWin").text(data.list[0].MY_HONGBAO);
 				$(".winType").text("总红包");
 				$(".bodyTable").empty();
 				for(var i=0;i<list.length;i++){
				var htm="";
				htm='<tr style="border-bottom: 2px solid #d6d6d6">'+
						'<td style="width:15%;text-align:center;"><sapn class="ID">'+data.list[i].ID+'</sapn></td>'+
						'<td style="width:35%;text-align:center;">'+
							'<table style="width: 100%">'+
								'<tr>'+
									'<td style="width: 35%;text-align: left;">'+
										'<div class="headImg">'+
											'<img alt="" src="'+data.list[i].WX_IF_HEADIMGURL+'">'+
										'</div>'+
									'</td>'+
									'<td style="width: 65%;text-align: left;font-size: 16px">'+data.list[i].CUST_NICK_NM+'</td>'+
								'</tr>'+
							'</table>'+
						'</td>'+
						'<td style="width:20%;text-align:center;padding-right: 4%">'+data.list[i].NUM+'</td>'+
						'<td style="width:20%;text-align:center;color:#4452b5;">'+data.list[i].WIN_HONGBAO+'</td>'+
					'</tr>';
				$(".bodyTable").append(htm);
 				}
 				//加载td的高度
				var bodyHeight=$("body").height();
				var height=bodyHeight*0.108;
				$(".bodyTable td").height(height);
				
				$(".hongbao").css("color","red");
				$(".jifen").css("color","#8b8b8b");
				$(".ID").each(function(){
					if($(this).text()=="1"){
						$(this).css("color","black");
					}else if($(this).text()=="2"){
						$(this).css("color","#444444");
					}
				});
 				}else{
 					$(".leiji-text").text("我的累计红包");
 	 				$(".myWin").text("0");
 	 				$(".winType").text("总红包");
 	 				$(".hongbao").css("color","red");
 					$(".jifen").css("color","#8b8b8b");
 	 				$(".bodyTable").empty();
 				} 
 			} else if (data.result == 'false'){
 				alert("查询失败.");
 			}
 		},
 		error : function(a, msg, c){
 			alert("error: " + msg);
 		}
	});
}
function clickJifen(){
	$.ajax({
		data:{gameId:$("#gameId").val()},
		dataType : "json",
 		type : "GET",
 		cache : false,
 		url : "/front/luckyTable/jifen.htm",
 		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
 		success : function(data){
 			if (data.result == 'success'){
 				var list=data.list;
 				if(list.length>0){
 				$(".leiji-text").text("我的累计积分");
 				$(".myWin").text(data.list[0].MY_POINT);
 				$(".winType").text("总积分");
 				$(".bodyTable").empty();
 				for(var i=0;i<list.length;i++){
				var htm="";
				htm='<tr style="border-bottom: 2px solid #d6d6d6">'+
						'<td style="width:15%;text-align:center;"><sapn class="ID">'+data.list[i].ID+'</sapn></td>'+
						'<td style="width:35%;text-align:center;">'+
							'<table style="width: 100%">'+
								'<tr>'+
									'<td style="width: 35%;text-align: left;">'+
										'<div class="headImg">'+
											'<img alt="" src="'+data.list[i].WX_IF_HEADIMGURL+'">'+
										'</div>'+
									'</td>'+
									'<td style="width: 65%;text-align: left;font-size: 16px">'+data.list[i].CUST_NICK_NM+'</td>'+
								'</tr>'+
							'</table>'+
						'</td>'+
						'<td style="width:20%;text-align:center;padding-right: 4%">'+data.list[i].NUM+'</td>'+
						'<td style="width:20%;text-align:center;color:#4452b5;">'+data.list[i].WIN_POINT+'</td>'+
					'</tr>';
				$(".bodyTable").append(htm);
 				}
 				var bodyHeight=$("body").height();
				var height=bodyHeight*0.108;
				$(".bodyTable td").height(height);
				
				$(".hongbao").css("color","#8b8b8b");
				$(".jifen").css("color","red");
				$(".ID").each(function(){
					if($(this).text()=="1"){
						$(this).css("color","black");
					}else if($(this).text()=="2"){
						$(this).css("color","#444444");
					}
				});
				} else{
					$(".leiji-text").text("我的累计积分");
	 				$(".myWin").text("0");
	 				$(".winType").text("总积分");
	 				$(".hongbao").css("color","#8b8b8b");
					$(".jifen").css("color","red");
	 				$(".bodyTable").empty();
				}
 			} else if (data.result == 'false'){
 				alert("查询失败.");
 			}
 		},
 		error : function(a, msg, c){
 			alert("error: " + msg);
 		}
	});
}
</script>

</head>
<body >
	<div class="contant">
		<div class="top">
			<img alt="" src="/front/skin/main/img/luckyTable/top(1).png">
		</div>
		<div class="fenlei">
			<input type="button" value="红包" onclick="clickHongbao();" class="hongbao" style="color: red"/>
			<input type="button" value="积分" onclick="clickJifen();" class="jifen"/>
		</div>
		<div class="user">
			<table style="width: 100%;height: 100%">
				<tr>
					<td rowspan="2" >
						<div class="myHead">
							<img alt="" src="${requestScope.custImg.WX_IF_HEADIMGURL}">
						</div>
					</td>
					<td style="color: #8b8b8b;height: 25px;vertical-align: bottom;"><span class="leiji-text">我的累计红包</span></td>
				</tr>
				<tr>
					<td style="color: #000fa4;font-size: 25px;height: 35px;line-height: 35px;font-weight: bold;"><span class="myWin">${requestScope.list[0].MY_HONGBAO }</span></td>
				</tr>
			</table>
		</div>
		<div class="body">
			<table style="width: 96%;margin-left:4%; font-size: 16px;">
					<tr>
						<td style="width:17%;height:35px;text-align:center;background-color: #bcbcbc;border-radius: 15px 0px 0px 15px;">排名</td>
						<td style="width:30%;height:35px;text-align:center;background-color: #bcbcbc;">ID</td>
						<td style="width:20%;height:35px;text-align:center;background-color: #bcbcbc;">参与次数</td>
						<td style="width:20%;height:35px;text-align:center;background-color: #bcbcbc;"><span class="winType">总红包</span></td>
						<td style="width:3%;height:35px;text-align:center;background-color: #bcbcbc;"></td>
					</tr>
			</table>
			<input type="hidden" value="${requestScope.gameId }" id="gameId"/>
			<table style="width: 90%;margin-left: 6%; font-size: 20px;" class="bodyTable">
				<c:forEach items="${list }" var="list">
					<tr style="border-bottom: 2px solid #d6d6d6;">
						<td style="width:15%;text-align:center;"><sapn class="ID">${list.ID }</sapn></td>
						<td style="width:35%;text-align:center;">
							<table style="width: 100%">
								<tr>
									<td style="width: 35%;text-align: left;">
										<div class="headImg">
											<img alt="" src="${list.WX_IF_HEADIMGURL }">
										</div>
									</td>
									<td style="width: 65%;text-align: left;font-size: 16px">${list.CUST_NICK_NM }</td>
								</tr>
							</table>
						</td>
						<td style="width:20%;text-align:center;padding-right: 4%">${list.NUM }</td>
						<td style="width:20%;text-align:center;color:#4452b5;">${list.WIN_HONGBAO }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>