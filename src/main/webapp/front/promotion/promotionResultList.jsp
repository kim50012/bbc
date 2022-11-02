<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>发表中奖者</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
	body{
		width:100%;
		font-family: 微软雅黑;
	}
	.promotion-resultlist-div{ width:92%;display:inline-block; background-color: #ffffff; position: relative; text-align: left; margin-bottom:20px;margin-top:60px;margin-left:4%;}
	.promotion-resultlist-div .title-head{font-family:microsoft yahei;font-size:16px;display:inline-block;color:#2e3336;height:20px;width:100%;text-align: left;margin-top:10px;margin-bottom:5px;}
	.promotion-resultlist-div .promotion-resultlist-table{font-family:microsoft yahei;width:100%;position: relative;}
	.promotion-resultlist-div .promotion-resultlist-table tbody tr td{color:#696969;border-bottom:1px solid #eeeeee;}
	.promotion-resultlist-div .promotion-resultlist-table tbody tr td p span{color:#ff7e38;}
	.promotion-resultlist-div .promotion-resultlist-table tbody tr td p{font-size:13px;margin-bottom:15px;color:#696969;}
	.promotion-resultlist-div .promotion-resultlist-table tbody tr td p:first-child{font-size:14px;margin-top:15px;margin-bottom:5px;}
	
</style>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 14,				//PROMOTION_RESULTLIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

//查询判断标志字段
var flagTitle=true;
function doSearch(){
	var searchTitle=$("#title").val();
	if(searchTitle==''){
		flagTitle=true;
	}else{
		flagTitle=false;
	}
	window.location.href="/front/promotion/promotionResultList.htm?searchTitle="+searchTitle;
}
//当前显示到第几页
var pageCurr=1;
$(window).scroll(function () {
    var scrollTop = $(this).scrollTop();
    var scrollHeight = $(document).height();
    var windowHeight = $(this).height();
    var pageCount=$("#pageCount").val();
    var searchTitle='';
    if(!flagTitle){
    	searchTitle=$("#title").val();
    }
    if (scrollTop + windowHeight == scrollHeight) {
    	pageCurr+=1;
    	if(pageCurr>pageCount){
    		return;
    	}
    	var param={pageCurr:pageCurr,pageUnit:6,proId:null,proType:null,proWinType:'Y',searchTitle:searchTitle};
    	$.ajax({
    		data : param,
    		dataType : "json",
    		type : "GET",
    		cache : false,
    		url : "/front/promotion/getNextPromotion.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
    		success : function(data){
    			if(data.list.length!=0){
    				for(var i=0;i<data.list.length;i++){
    					var htm='<tr><td> <a href="/front/promotion/promotionResultView.htm?proId='+data.list[i].PRO_ID
    							+'"> <p>'+data.list[i].PRO_TITLE+'分享抽奖 中奖名单</p> <p><span>领奖日期：</span>'+
    							data.list[i].PRO_START_DT+'-'+data.list[i].PRO_END_DT+'</p></a></td></tr>';
    					$(".promotion-result-tbody").append(htm);
    				}
    			}
    		},
    		error : function(a, msg, c) {
    			alert("error: " + msg);
    		}
    	});
    }
});

</script>
</head>
<body>
	<header class="headerMain">
		<div class="searchPmd">
			<div class="title">
				<input id="title" type="text" value="${requestScope.searchTitle }"/>	
			</div>
			<div class="btnSearch" onClick="doSearch();"></div>
		</div>
	</header>
	<div class="promotion-resultlist-div">
		<div class="title-head">
			共有${requestScope.countTotal}<c:if test="${ requestScope.pageCount==''}">0</c:if>条中奖信息
		</div>
		<table class="promotion-resultlist-table">
			<tbody class="promotion-result-tbody">
				<c:forEach items="${list }" var="list" varStatus="status">
					<tr>
						<td>
							<a href="/front/promotion/promotionResultView.htm?proId=${list.PRO_ID }">
								<p>${list.PRO_TITLE} 分享抽奖 中奖名单</p>
								<p><span>领奖日期：</span>${list.PRO_START_DT }-${list.PRO_END_DT }</p>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
	<a href="#" class="bottom_totop">top</a>
	
</body>
</html>
