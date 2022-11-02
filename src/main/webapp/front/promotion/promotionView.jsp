<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>促销活动</title>
<style type="text/css">
	body{
		width:100%;
		text-align: center;
		font-family: 微软雅黑;
	}
	.promotionView-div{ width:92%;display:inline-block; background-color: #ffffff; position: relative; text-align: center; margin-bottom:20px; }
	.promotionView-div .title-head{font-family:microsoft yahei;font-size:16px;display:inline-block;color:#2e3336;height:20px;width:100%;text-align: left;margin-top:10px;margin-bottom:5px;}
	.promotionView-div .img-show-div{display: inline-block;width:100%;text-align: left;position: relative;}
	.promotionView-div .img-show-div img{width:100%;height:150px;margin-bottom:13px;}
	.promotionView-div .promotionView-msg-detail{color:#696969;width:100%;border-bottom:1px solid #e5e5e5;margin-bottom:25px;text-align: left;}
	.promotionView-div .promotionView-msg-detail div{width:30%;height:25px;line-height:25px;text-align:left;padding-left:5px; background-color: #9dc214;margin-bottom:0;}
	.promotionView-div .promotionView-msg-detail div span{font-size:14px;color:#ffffff;}
	.promotionView-div .promotionView-msg-detail p{line-height:16px; margin-bottom:2px;margin-top:3px; font-size:14px;font-family:microsoft yahei;  }
	.promotionView-div .comment-div-detail{width:100%;text-align: left;position: relative;}
	.promotionView-div .comment-div-detail textarea{width:75%;border-radius:4px;height:80px;margin-top:5px;margin-bottom:5px;}
	.promotionView-div .comment-div-detail p{color:#696969;}
	.submit-comment{max-width:100px;width:20%;height:30px;background-color: #eeeeee;float:right;border-radius:4px;text-align: center;line-height: 30px;margin-top:5px;}
	.submit-comment.submit-can{background-color:#97bc3c;}
	.promotionView-div .comment-div-detail div span{font-family:microsoft yahei;color:#ffffff;font-size:14px;}
	.promotionView-div .comment-table-detail .cust-name-td{color:#696969;width:20%;vertical-align: top;padding-top:15px;font-size:13px;font-family:microsoft yahei;}
	.promotionView-div .comment-table-detail .cust-comment-msg-td{color:#696969;width:80%;border-bottom:1px solid #e5e5e5;padding-top:10px;padding-bottom:10px;font-size:13px;font-family:microsoft yahei;}
	.promotionView-div .comment-table-detail .cust-comment-msg-td p{line-height:18px;}
	.promotionView-div .comment-table .show-comment-msg-tfoot tr td{width:100%;font-size:14px;font-family:microsoft yahei;border-bottom:1px solid #eeeeee;z-index: 10;padding-top:20px;}
	.promotionView-div .comment-table .show-comment-msg-tfoot tr td span{position:absolute;width:30%;background-color: #ffffff;z-index: 20;display: inline-block;margin-left:35%;margin-top:-8px;text-align: center;}
	.promotionView-div .comment-table .show-comment-msg-tfoot tr td span img{width:12px;height:12px;margin-top:1px;margin-left:15%;}
	.promotionView-div .comment-table {width:100%;position: relative;color:#696969;margin-bottom:20px;}

</style>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 13,				//PROMOTION_RESULTVIEW
	 pageId : '${requestScope.map.PRO_ID }' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

//当前显示到第几页
var pageCurr=1;
//点击显示更多的评论
function getMoreMessage(){
	var pageCount=$("#pageCount").val();
	var proId=$("#proId").val();
	pageCurr+=1;
	if(pageCurr>pageCount){
		return;
	}
	var param={pageCurr:pageCurr,proId:proId,pageUnit:3,mesType:"P"};
	$.ajax({
		data : param,
		dataType : "json",
		type : "GET",
		cache : false,
		url : "/front/promotion/getNextPromotionView.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(data){
			if(data.list.length!=0){
				for(var i=0;i<data.list.length;i++){
					var text=data.list[i].MES_NM;
					text=text.substr(0,4);
					if(!text.match(/^[0-9a-zA-Z_]{4}$/)){
						text=text.substr(0,2);
					}
					text=text+'****';
					var htm='<tr> <td class="cust-name-td"><span>'+text+'</span></td><td class="cust-comment-msg-td"><p>'+
					data.list[i].MES_CONTENT+'</p></td> </tr>';
					$(".comment-table-detail").append(htm);
				}
			}
		},
		error : function(a, msg, c) {
			alert("error: " + msg);
		}
	});
	
}
$(function(){
	//发布评论的操作
	$(".submit-comment.submit-can").click(function(){
		var mesContent=$("#mesContent").val();
		var proId=$("#proId").val();
		var param={mesContent:mesContent,proId:proId};
		$.ajax({
			data : param,
			dataType : "json",
			type : "GET",
			cache : false,
			url : "/front/promotion/savePromotionView.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
			contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
			success : function(data){
				if(data.ret=='success'){
					window.location.href="/front/promotion/promotionView.htm?proId="+proId;
				}else{
					alert("评论失败，请重新操作");
				}
			},
			error : function(a, msg, c) {
				alert("error: " + msg);
			}
		});
	});
});
function loadFunciton(){
	$(".cust-name-td").each(function(){
		var text=$(this).text();
		text=text.substr(0,4);
		if(!text.match(/^[0-9a-zA-Z_]{4}$/)){
			text=text.substr(0,2);
		}
		$(this).text(text+'****');
	});
}
</script>
</head>
<body onload="loadFunciton();">
	<div class="promotionView-div">
		<div class="title-head" >
			${requestScope.map.PRO_TITLE }
		</div>
		<div class="img-show-div">
			<img src="${requestScope.map.PRO_PIC_URL }"/>	
		</div>
		<div class="promotionView-msg-detail">
			<div>
				<span>活动详情 >></span>
			</div>
				${requestScope.map.PRO_DESC }
		</div>
		<div class="comment-div-detail">
			<p>活动评论（${requestScope.countTotal }<c:if test="${ requestScope.pageCount==''}">0</c:if>条）</p>
			<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
			<input type="hidden" id="proId" value="${requestScope.map.PRO_ID }"/>
			<textarea rows="4" cols="50" placeholder="" id="mesContent"></textarea>
			<div  class="submit-comment <c:if test="${requestScope.flagView==0}">submit-can</c:if>" >
				<span>发表评论</span>
			</div>
		</div>
		<table class="comment-table">
			<tbody class="comment-table-detail">
				<c:forEach items="${list}" var="list" varStatus="status">
					<tr>
						<td class="cust-name-td"><span>${list.MES_NM }</span></td>
						<td class="cust-comment-msg-td"><p>${list.MES_CONTENT }</p></td>
					</tr>
				</c:forEach>
				<!-- <tr>
					<td class="cust-name-td"><span>yaro****</span></td>
					<td class="cust-comment-msg-td"><p>我买了好多，难得有这样的活动，大家也快去，送的年糕真心不错~http://facebook.c om </p></td>
				</tr>
				<tr>
					<td class="cust-name-td"><span>yaro****</span></td>
					<td class="cust-comment-msg-td"><p>我买了好多，难得有这样的活动，大家也快去，送的年糕真心不错~http://facebook.c om </p></td>
				</tr> -->
			</tbody>
			<tfoot class="show-comment-msg-tfoot" <c:if test="${requestScope.pageCount==1 or requestScope.pageCount==''}">style="display:none;"</c:if> >
				<tr>
					<td colspan="2" >
						<span onclick="getMoreMessage();">查看更多<img src="/images/portal/btn_down.png" /></span>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<a href="#" class="bottom_totop">top</a>
</body>
</html>