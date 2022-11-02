<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>列表</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 2,				//SHOP_LIST
	 pageId : '' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

function fn_SnsSareLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.snsShareLayerPopup').show();
}


function fn_SnsSareLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.snsShareLayerPopup').hide();
}

function listClassChange(obj){
	var strBtnClass = "listClass";
	var strSearchListClass = "list-search-list list-larger-view";
	
	if ($("#hdListClassName").val() == "list-search-list list-list-view") {

		strBtnClass = "listClass";
		strSearchListClass = "list-search-list list-larger-view";
	}
	else {

		strBtnClass = "listClass2";
		strSearchListClass = "list-search-list list-list-view";
	}
	
	$("#hdListClassName").val(strSearchListClass);
	
    $(obj).attr("class", strBtnClass);
    $("#J_SearchList").attr("class", strSearchListClass); 
	
}

function fn_GetData(newFlag) {

	var pageCurr = $('#hdPageCurr').val();
	var pageUnit = $('#hdPageUnit').val();
	var totalCount = $('#hdPageTotal').val();
	
	if (newFlag) {
		pageCurr = 1;
		pageUnit = 10;
	}
	else {
		if ((pageCurr * pageUnit) >= totalCount) {
			//alert("没有数据.");
			return;
		}
		pageCurr++;
	}

	$('#foo').fadeIn(200);
	
	 $.ajax({
	 	 		data:{
	 	 			pageCurr : pageCurr
	 	 			,pageUnit : pageUnit
	 	 			,goodsName : $.trim($("#title").val())
	 	 			,brandId : 0
	 	 			,shopGradeClassId : 0
	 	 			,orderby : "DISPLAY_ID"
	 	 		},
			type : "POST",
			url : "/front/main/getListData.htm",
			success : function(data) {
				
				var list = data.data || [];
				if(list.length > 0 ){
					
					if (newFlag) {
						$('#J_SearchListTarget').html(template('tpl_list-search-result', data));	
					}
					else {
						$('#J_SearchListTarget').append(template('tpl_list-search-result', data));	
					}
					
					$('#hdPageCurr').val(pageCurr);
					$('#hdPageTotal').val(list[0].TOTAL_CNT);
					$('#spnTotalCount').html(list[0].TOTAL_CNT);
											 
				}else{
					alertTip("没有数据.");
				}
				
				$('#foo').fadeOut(200);
				
			},
			error : function(xhr, status, e) {
				alert("Error : " + status);
				$('#foo').fadeOut(200);
			}
		});
}


function fn_Search(newFlag, nextFlag) {

	var pageCurr = $('#hdPageCurr').val();
	var pageUnit = $('#hdPageUnit').val();
	var totalCount = $('#hdPageTotal').val();
	var orderby = "DISPLAY_ID";
	var shopGradeClassId = $('#hdShopGradeClassId').val();
	var brandId = $('#hdBrandId').val();
	var goodsName = $.trim($("#title").val());
	var listClassName = $('#hdListClassName').val();;

	pageUnit = 10;
	if (newFlag) {
		pageCurr = 1;
	}
	else {
		if (nextFlag) {
			pageCurr++;
		}
		else {
			pageCurr = pageCurr - 1;
		}
	}
	
	location.href =	'/front/main/list.htm?pageCurr='+pageCurr
					+'&pageUnit='+pageUnit
					+'&orderby='+orderby
					+'&shopGradeClassId='+shopGradeClassId
					+'&brandId='+brandId
					+'&goodsName='+goodsName
					+'&listClassName='+listClassName
					;
					
}


// $(window).scroll(function(){
// 	 if($(window).scrollTop() == $(document).height() - $(window).height()){
// 	 	window.setTimeout(function () {
// 			fn_GetData(false);
// 		}, 100);
//         }
// });

</script>
</head>
<body id="body">

<!-- hidden input data -->
<input type="hidden" id="hdListClassName" value="${listClassName }"/>	<!-- list-view -->
<input type="hidden" id="hdPageCurr" value="${pageCurr }"/>
<input type="hidden" id="hdPageUnit" value="${pageUnit }"/>
<input type="hidden" id="hdPageTotal" value="${totalCount }"/>
<input type="hidden" id="hdBrandId" value="${brandId }"/>
<input type="hidden" id="hdShopGradeClassId" value="${shopGradeClassId }"/>

<header class="headerList">
	<div class="searchPmd">
		<div class="title">
			<input id="title" type="text" value="${goodsName }"/>	
		</div>
		<div class="btnShare" onClick="fn_SnsSareLayerShow();"></div>
		<div class="btnSearch" onClick="fn_Search(true, true);"></div>
		<div class="listClass" onclick="listClassChange(this);"></div>
	</div>
</header>

<div id="container"  style="margin-top: 0px;">

	<div class="listMsg">
		<br>共有 <span id="spnTotalCount"> ${totalCount } </span> 个商品
	</div>
					
	<div class="${listClassName }" id="J_SearchList">
	
		<ul>
			<div class="page-container J_PageContainer_1" data-page="1" id="J_SearchListTarget">
	
			<!-- START Data Loop -->
			<c:forEach var="goodsList" items="${goodsList}" varStatus="status">  
				<li >
					<div class="list-item">
						<div class="p">
							<a href="/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}" target="_blank" title=""> <!-- target="_blank"  -->
								<img class="p-pic" src="${goodsList.GOODS_LIST_IMG_URL }" style="visibility: visible;">
								<span class="flag c-icon-pt">${goodsList.SGC_NM }</span>
							</a>
						</div>
						<div class="d">
							<a href="/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}" target="_blank" title=""> <!-- target="_blank"  -->
								<h3 class="d-title">${goodsList.DESC_TITLE }</h3>
							</a>
							<p class="d-price"><em class="h">￥${goodsList.PRICE_UNIT_SALES }</em><del></del></p>
							<div class="d-main">
								<p class="d-freight">平分 : ${goodsList.REVIEW_POINT_AVG }分</p>
								<p class="d-num">
									<span class="hollow"><span class="solid" style="width:${goodsList.REVIEW_POINT_AVG }0%;"></span></span>
<!-- 									<span class="solid" style="width:${goodsList.REVIEW_POINT_AVG }0%; "></span>	 -->
								</p>
							</div>
							<span class="flag c-icon-p4p" onclick="javascript:window.open('/front/detail/detail.htm?shopId=${goodsList.SHOP_ID}&displayId=${goodsList.DISPLAY_ID}&goodsId=${goodsList.GOODS_ID}', 'detailPopup', '')">查看详情 >></span>
						</div>
					</div>
					<div class="icons-group"></div>
				</li>
				
			 </c:forEach>
			<!-- END Data Loop -->
			
			
			</div>
		</ul>
		
	</div>


	<!-- mainLayerPop -->
	<div class="snsShareLayerPopup">
		<div class="inner">
			<div class="cont-Title">
				<span onclick="fn_SnsSareLayerHide();"><img src="/front/skin/pumeiduo/img/btn_close.png" /></span>
			</div>
			<div class="cont-Body">
				<ul class="shareList">
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn01.png" /></span><span class="shareTxt">发送给朋友</span></li>
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn02.png" /></span><span class="shareTxt">分享到朋友圈</span></li>
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn03.png" /></span><span class="shareTxt">收&nbsp;&nbsp;藏</span></li>
<!-- 					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn04.png" /></span><span class="shareTxt">邮&nbsp;&nbsp;件</span></li> -->
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn05.png" /></span><span class="shareTxt">分享到QQ</span></li>
					<li><span class="shareIcon"><img src="/front/skin/pumeiduo/img/share_btn06.png" /></span><span class="shareTxt">分享到QQ空间</span></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- //mainLayerPop -->

	<div class="listNaviBtn">
		<a href="javascript:fn_Search(false, false);" class="prevBtn" id="prevBtn">上一页</a>
		<a class="prevBtnDisable" id="prevBtnDisable">上一页</a>
		<script>
			if(${pageCurr }==1){
				$("#prevBtn").hide();
				$("#prevBtnDisable").show();
			}
			else {
				$("#prevBtn").show();
				$("#prevBtnDisable").hide();
			}
		</script>
		<a href="javascript:fn_Search(false, true);" class="nextBtn" id="nextBtn">下一页</a>
		<a class="nextBtnDisable" id="nextBtnDisable">下一页</a>
		<script>
			var pageCurr = $('#hdPageCurr').val();
			var pageUnit = $('#hdPageUnit').val();
			var totalCount = $('#hdPageTotal').val();

			if ((pageCurr * pageUnit) >= totalCount) {
				$("#nextBtn").hide();
				$("#nextBtnDisable").show();
			}	
			else {
				$("#nextBtn").show();
				$("#nextBtnDisable").hide();
			}
		</script>
	</div>
	<br />
	<br />
	<br />
	<br />
	
	<!-- //container -->
	<div class="bottom_fixed length2">
		<a href="/front/main/main2.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_home.png" class="bottom_image">
		</a>
		<a href="/front/customer/myPage.htm">
			<img alt="" src="/front/skin/main/img/icon/btn_personalcenter.png"  class="bottom_image">
		</a>
	</div>
	<a href="#" class="bottom_totop">top</a>

 <script id="tpl_list-search-result" type="text/html">
		{{each data}} 
				<li >
					<div class="list-item">
						<div class="p">
							<a href="/front/detail/detail.htm?shopId={{$value.SHOP_ID}}&displayId={{$value.DISPLAY_ID}}&goodsId={{$value.GOODS_ID}}" target="_blank" title="">
								<img class="p-pic" src="{{$value.GOODS_LIST_IMG_URL}}" style="visibility: visible;">
								<span class="flag c-icon-pt">{{$value.SGC_NM}}</span>
							</a>
						</div>
						<div class="d">
							<a href="/front/detail/detail.htm?shopId={{$value.SHOP_ID}}&displayId={{$value.DISPLAY_ID}}&goodsId={{$value.GOODS_ID}}" target="_blank" title="">
								<h3 class="d-title">{{$value.GOODS_NM}}</h3>
							</a>
							<p class="d-price"><em class="h">￥{{$value.PRICE_UNIT_SALES}}</em><del></del></p>
							<div class="d-main">
								<p class="d-freight">平分 : 8分</p>
								<p class="d-num">
									<img src="/front/skin/demo/img/common/star_hollow.png" />
									<img src="/front/skin/demo/img/common/star_solid.png" />
								</p>
							</div>
							<span class="flag c-icon-p4p" onclick="javascript:window.open('/front/detail/detail.htm?shopId={{$value.SHOP_ID}}&displayId={{$value.DISPLAY_ID}}&goodsId={{$value.GOODS_ID}}', 'detailPopup', '')">查看详情 >></span>
						</div>
					</div>
					<div class="icons-group"></div>
				</li>
		{{/each}}
 </script>
</body>
</html>
