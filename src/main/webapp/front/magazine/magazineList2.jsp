<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>${sessionScope.sessionSkin.shopName}</title>
<%@ include file="/front/skin/common.jsp"%>

<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 8,				//SHOP_BLOGLIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

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
    	
    	var orderby = "BLOG_ID";
    	var blogGroupId = $('#hdblogGroupId').val();
    	var blogTitle = $.trim($("#title").val());
    	var listClassName = $('#hdListClassName').val();
    	
    	var param={
    			pageCurr : pageCurr,
    			pageUnit : 30,
    			orderby : orderby,
    			blogGroupId : blogGroupId,
    			blogTitle : blogTitle,
    			listClassName : listClassName
    			   };
    	$.ajax({
    		data : param,
    		dataType : "json",
    		type : "GET",
    		cache : false,
    		url : "/front/magazine/magazineAjaxList.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
    		success : function(data){
				
    			if(data.list.length!=0){
    				for(var i=0;i<data.list.length;i++){
    				
    					var htm='<div onclick="window.location.href=\'/front/magazine/magazineDetail.htm?shopId='+data.list[i].SHOP_ID+'&magazineId='+data.list[i].BLOG_ID+'\';">'+
    					'<div class="magazine-div">'+
    		    		'<div class="title-head" >'+
    		    		data.list[i].BLOG_TITLE+
    					'</div>'+
    					'<div class="date-head" >'+
    		    		data.list[i].CREATED_DT+
    					'</div>'+
    					'<div class="img-show-div" >'+
    						'<img src="'+data.list[i].BLOG_FILE_URL+'"/>'+
    						'<div class="show-p">'+data.list[i].BLOG_DETAIL+'</div>'+
    						'<div>'+
    							'<p>阅读全文</p>'+
    							'<a>></a>'+
    						'</div>	'+
    					'</div>'+
    					'</div>'+
    				'</div>';
    				$(".magazine-all").append(htm);
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


</script>

</head>
<body id="body" class="magazine-bodyColorList">

	<div class='top-height-value'></div>
	
	<div class="magazine-all" >
		<c:forEach items="${list }" var="list" varStatus="status">
			<div onclick="window.location.href='/front/magazine/magazineDetail.htm?shopId=${list.SHOP_ID}&magazineId=${list.BLOG_ID}';">
				<div class="magazine-div">
					<div class="title-head" >
						${list.BLOG_TITLE }
					</div >
					<div class="date-head" >
						${list.CREATED_DT }
					</div>
					<div class="img-show-div" >
						<img src="${list.BLOG_FILE_URL}"/>
						<div class="show-p">${list.BLOG_DETAIL }</div>
						<div>
							<p>阅读全文</p>
							<a>&gt;</a>
						</div>	
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="magazine-all" >
		<div onclick="window.location.href='/front/magazine/magazineList2.htm?shopId=${sessionScope.sessionSkin.shopId}';">
			<div class="magazine-div" style="height:50px;">
				<div class="title-head" style="text-align: center;">
					换一换
				</div >
			</div>
		</div>
	</div>
	
	
	<br/>
	<br/>
	<br/>

<%@ include file="/front/skin/common_navigation.jsp"%>

<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>

</body>
</html>
