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
		background-color: #f0f0f0;
		font-family:microsoft yahei;
	}
	.promotion-div{ width:92%; border:1px solid #c5c5c5; display:inline-block; background-color: #ffffff; position: relative; text-align: center; margin-bottom:20px; }
	.top-height-value{ height:30px; background-color: #f0f0f0; }
	.promotion-div .title-head{font-size:16px;display:inline-block;color:#2e3336;height:20px;width:94%;text-align: left;margin-top:10px;margin-bottom:5px;}
	.promotion-div .img-show-div{display: inline-block;width:94%;text-align: left;position: relative;}
	.promotion-div .img-show-div img{width:100%;height:150px;margin-bottom:0px;}
	.promotion-div .img-show-div p{color:#696969;font-family:microsoft yahei;padding-left:5px;padding-right:0px;font-size:12px;}
	.promotion-div .img-show-div .show-p p{display: inline-block;width: auto;height:auto;margin-top:0;marign-bottom:0;}
	.promotion-div .img-show-div .show-p{font-size:14px;width:100%;height:20px;overflow: hidden;margin-top:5px;border:0;display: inline-block;position: relative;white-space:nowrap; text-overflow:ellipsis; }
	.promotion-div .img-show-div div{margin-top:5px;border-top:1px solid #eeeeee;}
	.promotion-div .img-show-div div a{font-family:microsoft yahei;float:right;font-size:12px;margin-top:15px;color:#98bc3c;}
	.promotion-div .img-show-div div p{font-family:microsoft yahei;display: inline-block;margin-top:15px;margin-bottom:10px;}
	.promotion-div .img-show-div div p span{font-family:microsoft yahei;color:#ff7e38}
</style>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 12,				//PROMOTION_LIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

//当前显示到第几页
var pageCurr=1;
$(window).scroll(function () {
    var scrollTop = $(this).scrollTop();
    var scrollHeight = $(document).height();
    var windowHeight = $(this).height();
    var pageCount=$("#pageCount").val();
    if (scrollTop + windowHeight == scrollHeight) {
    	pageCurr+=1;
    	if(pageCurr>pageCount){
    		return;
    	}
    	
    	$('#foo').fadeIn(200);
    	
    	var param={pageCurr:pageCurr,pageUnit:2,proId:null,proType:'I',proWinType:null,searchTitle:null};
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
    					var detail=data.list[i].PRO_DESC;
    					var htm='<div class="promotion-div">'+
    		    		'<div class="title-head" >'+
    		    		data.list[i].PRO_TITLE+
    					'</div>'+
    					'<div class="img-show-div" onclick="window.location.href=\'/front/promotion/promotionView.htm?proId='+data.list[i].PRO_ID+'\';">'+
    						'<img src="'+data.list[i].PRO_PIC_URL+'"/>'+
    						'<div class="show-p">'+detail+'</div>'+
    						'<div>'+
    							'<p><span>活动日期：</span>'+data.list[i].PRO_START_DT+'-'+data.list[i].PRO_END_DT+'</p>'+
    							'<a>查看详情>></a>'+
    						'</div>	'+
    					'</div>'+
    				'</div>';
    				$(".promotion-all").append(htm);
    				}
    			}
				$('#foo').fadeOut(200);
    		},
    		error : function(a, msg, c) {
				$('#foo').fadeOut(200);
    			alert("error: " + msg);
    		}
    	});
    }
});
function loadFunciton(){
	$(".show-p").each(function(){
		var pageCount=$("#pageCount").val();
		if(pageCount==0){
			alert("没有数据");
			return;
		} 
		var proDesc=$(this).html();
	});
}
</script>
</head>
<body>
	<div class='top-height-value'></div>
	<div class="promotion-all">
		<c:forEach items="${list }" var="list" varStatus="status">
			<div class="promotion-div">
				<div class="title-head" >
					${list.PRO_TITLE }
				</div>
				<div class="img-show-div" onclick="window.location.href='/front/promotion/promotionView.htm?proId=${list.PRO_ID}';">
					<img src="${list.PRO_PIC_URL }"/>
					<div class="show-p">${list.PRO_DESC }</div>
					<div>
						<p><span>活动日期：</span>${list.PRO_START_DT }-${list.PRO_END_DT }</p>
						<a>查看详情>></a>
					</div>	
				</div>
			</div>
		</c:forEach>
		<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
	</div>
	<a href="#" class="bottom_totop">top</a>
</body>
</html>