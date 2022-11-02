<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
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
    					'<div class="magazine-div " style="background: url('+data.list[i].BADGE_IMG_URL+') #ffffff no-repeat 96.5% 0;background-size:10% auto" >'+
    					
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
				<div class="magazine-div" style="background: url('${list.BADGE_IMG_URL}') #ffffff no-repeat 96.5% 0;background-size:10% auto" >
					<div class="title-head">
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
	
	<br/>
	<br/>
	<br/>

<style>


/*搴曢儴瀵艰埅*/
.footer{
	position: fixed;
	width: 100%;
	height: 57.41px;
	left: 0;
	bottom: 0;
	display:flex; 
  	flex-flow:row;
	background: #191a1f;
	z-index: 100;
}
.footer .footer-menu{
	flex: 1;
	text-align: center;
	color: #676767;
	font-size: 14px;
	padding-top: 5.859px;
	box-sizing: border-box;
}

.footer .footer-menu.active{
	color: #01cfb9;
}
.footer .footer-menu > span{
	display: inline-block;
	width: 26.363px;
	height: 26.363px;
}
/*鏈�変腑鐘舵�佸浘鐗�*/
.footer .footer-menu .participate{
	background: url(/front/bbc/img/participate.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu .club{
	background: url(/front/bbc/img/club.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu .discuss{
	background: url(/front/bbc/img/discuss.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu .system{
	background: url(/front/bbc/img/system.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}

.footer .footer-menu .mine{
	background: url(/front/bbc/img/mine.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
/*閫変腑鐘舵�佸浘鐗�*/
.footer .footer-menu.active .participate{
	background: url(/front/bbc/img/participate1.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu.active .club{
	background: url(/front/bbc/img/club1.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu.active .discuss{
	background: url(/front/bbc/img/discuss1.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu.active .system{
	background: url(/front/bbc/img/system1.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}
.footer .footer-menu.active .mine{
	background: url(/front/bbc/img/mine1.png) no-repeat center center;
	background-size: 26.363px 26.363px;
}

</style>


	<!-- START bottom menu -->
	<c:set var="menuTag" value="3" />
	<%@ include file="/front/bbc/exc/menu.jsp"%> 
	<!-- END bottom menu -->

<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>

</body>
</html>
