<%@ include file="/front/skin/common.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8;"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>发布中奖者</title>
<style type="text/css">
	body{
		width:100%;
		text-align: center;
		font-family: 微软雅黑;
	}
	.promotionResultView-div{ width:92%;display:inline-block; background-color: #ffffff; position: relative; text-align: left; margin-bottom:20px; }
	.promotionResultView-div .title-head{font-family:microsoft yahei;font-size:16px;display:inline-block;color:#2e3336;height:20px;width:100%;text-align: left;margin-top:10px;margin-bottom:5px;}
	.promotionResultView-div .activity-describe{line-height:20px;font-size:14px;color:#696969;width:95%;whitewhite-space: pre-wrap;  whitewhite-space: -moz-pre-wrap; whitewhite-space: -pre-wrap; whitewhite-space: -o-pre-wrap;  word-wrap: break-word; whitewhite-space : normal ;margin-top:0;margin-bottom:0px;font-family: microsoft yahei;}
	.promotionResultView-div .winning-detail{max-width:190px;background-color: #9dc214;width:30%;height:25px;color:#ffffff;text-align: left;padding-left:5px; line-height: 25px;margin-top:-20px;margin-bottom:15px;}
	.promotionResultView-div .winning-detail-table{width:100%;position: relative;text-align: center;font-size:14px;margin-bottom:20px;}
	.promotionResultView-div .winning-detail-table tr td{height:25px;}
	.promotionResultView-div .winning-detail-table tr .winning-id{width:28%;border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;}
	.promotionResultView-div .winning-detail-table tr .winning-name{width:28%;border:1px solid #e5e5e5;}
	.promotionResultView-div .winning-detail-table tr .winning-type{width:44%;border-top:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;}
	.promotionResultView-div .winning-detail-table tfoot tr td{width:100%;height:30px;border-bottom:1px solid #e5e5e5;}
	.winning-detail-tbody tr td{color:#696969;}
	.promotionResultView-div .comment-div-detail{width:100%;text-align: left;position: relative;}
	.promotionResultView-div .comment-div-detail textarea{width:75%;border-radius:4px;height:80px;margin-top:5px;margin-bottom:5px;}
	.promotionResultView-div .comment-div-detail p{color:#696969;}
	.submit-comment{max-width:100px;width:20%;height:30px;background-color: #eeeeee;float:right;border-radius:4px;text-align: center;line-height: 30px;margin-top:5px;}
	.submit-comment.submit-can{background-color:#97bc3c;}
	.promotionResultView-div .comment-div-detail div span{font-family:microsoft yahei;color:#ffffff;font-size:14px;}
	.promotionResultView-div .comment-table-detail .cust-name-td{color:#696969;width:20%;vertical-align: top;padding-top:15px;font-size:13px;font-family:microsoft yahei;}
	.promotionResultView-div .comment-table-detail .cust-comment-msg-td{color:#696969;width:80%;border-bottom:1px solid #e5e5e5;padding-top:10px;padding-bottom:10px;font-size:13px;font-family:microsoft yahei;}
	.promotionResultView-div .comment-table-detail .cust-comment-msg-td p{line-height:18px;}
	.promotionResultView-div .comment-table .show-comment-msg-tfoot tr td{width:100%;font-size:14px;font-family:microsoft yahei;border-bottom:1px solid #eeeeee;z-index: 10;padding-top:20px;}
	.promotionResultView-div .comment-table .show-comment-msg-tfoot tr td span{position:absolute;width:30%;background-color: #ffffff;z-index: 20;display: inline-block;margin-left:35%;margin-top:-8px;text-align: center;}
	.promotionResultView-div .comment-table .show-comment-msg-tfoot tr td span img{width:12px;height:12px;margin-top:1px;margin-left:15%;}
	.promotionResultView-div .comment-table {width:100%;position: relative;color:#696969;margin-bottom:20px;}
</style>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 15,				//PROMOTION_RESULTVIEW
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
		var param={pageCurr:pageCurr,proId:proId,pageUnit:3,mesType:'W'};
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
		$(".submit-comment").click(function(){
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
						window.location.href="/front/promotion/promotionResultView.htm?proId="+proId;
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
	//将姓名隐藏部分以*代替来显示
	function loadFunciton(){
		$(".cust-name-td").each(function(){
			var text=$(this).text();
			text=text.substr(0,4);
			if(!text.match(/^[0-9a-zA-Z_]{4}$/)){
				text=text.substr(0,2);
			}
			$(this).text(text+'****');
		});
		 $(".winning-id.show-tbody").each(function(){
			var text=$(this).text();
			text=text.substr(0,4);
			if(!text.match(/^[0-9a-zA-Z_]{4}$/)){
				text=text.substr(0,2);
			}
			$(this).text(text+'****');
		});
		$(".winning-name.show-tbody").each(function(){
			var text=$(this).text();
			var text1=text.substr(0,2);
			var text2=text.substr(text.length-2,text.length);
			if(!text1.match(/^[0-9a-zA-Z_]{2}$/)){
				text1=text1.substr(0,1);
			}
			if(!text2.match(/^[0-9a-zA-Z_]{2}$/)){
				text2=text2.substr(text2.length-1,text2.length);
			}
			$(this).text(text1+'*'+text2);
		});
	}
</script>
</head>
<body onload="loadFunciton();">
	<div class="promotionResultView-div">
		<div class="title-head" >
			${requestScope.map.PRO_TITLE} 分享抽奖 中奖名单
			<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
			<input type="hidden" id="proId" value="${requestScope.map.PRO_ID }"/>
		</div>
		<pre class="activity-describe">
			${requestScope.map.RESULT_DESC }
		</pre>
		<div class="winning-detail">
			中奖名单 >>
		</div>
		<table class="winning-detail-table">
			<thead>
				<tr>
					<td class="winning-id">ID</td>
					<td class="winning-name">姓名</td>
					<td class="winning-type">分享方式</td>
				</tr>
			</thead>
			<tbody class="winning-detail-tbody">
				<c:forEach items="${listWin}" var="list" varStatus="status">
					<tr>
						<td class="winning-id show-tbody">${list.MES_NM}</td>
						<td class="winning-name show-tbody">${list.CUST_REAL_NM }</td>
						<td class="winning-type">${list.SHARE_TYPE }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3"></td>
				</tr>
			</tfoot>
		</table>
		<div class="comment-div-detail">
			<p>活动评论（${requestScope.countTotal }<c:if test="${ requestScope.pageCount==''}">0</c:if>条）</p>
			<textarea rows="" cols="" id="mesContent">
			</textarea>
			<div class="submit-comment <c:if test="${requestScope.flagView==0}">submit-can</c:if>">
				<span>发表评论</span>
			</div>
		</div>
		<table class="comment-table">
			<tbody class="comment-table-detail">
				<c:forEach items="${list }" var="list" varStatus="status"> 
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
			<tfoot class="show-comment-msg-tfoot" <c:if test="${requestScope.pageCount==1 or requestScope.pageCount==''}">style="display:none;"</c:if>>
				<tr>
					<td colspan="2">
						<span onclick="getMoreMessage();">查看更多<img src="/images/portal/btn_down.png"/></span>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<a href="#" class="bottom_totop">top</a>
</body>
</html>