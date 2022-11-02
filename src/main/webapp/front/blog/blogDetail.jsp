<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>${blogList.BLOG_TITLE }</title>
<%@ include file="/front/skin/common.jsp"%>
<style type="text/css">
	.blogDetail-point-table{width:100%;}
	.span-position-span{float:right;margin-right:10px;}
	.point-star-border{display:inline-block;height:30px; width:155px;background: url('/front/skin/demo/img/common/star_hollow.png') no-repeat 0 0;position: relative;}
	.point-star-in{width:155px;display:inline-block;height:30px; background: url('/front/skin/demo/img/common/star_solid.png') no-repeat 0 0;position: absolute;}
	.preview-div-text textarea{width:75%;border-radius:4px;height:80px;margin-top:5px;margin-bottom:5px;}
	.submit-comment{color:#ffffff;max-width:100px;width:20%;height:30px;background-color: #97bc3c;float:right;border-radius:4px;text-align: center;line-height: 30px;margin-top:5px;}
</style> 
<script type="text/javascript">

//-- Common Page usage Counting
counter({
	 pageTp : 9,				//BLOG_DETAIL
	 pageId : '${blogList.BLOG_ID}' || '',
	 goodsId : '' || '',
	 displayId : '' || '',
});

$(function(){
	
	var totalPage = "${totalPage}";
	var totalRecords = "${totalNum}";
	var pageNo = "${pageNO}"; 
	if(!pageNo){
		pageNo = 1;
	}
	//生成分页
	//有些参数是可选的，比如lang，若不传有默认值
	kkpager.generPageHtml({
		//当前页码
		pno : pageNo,
		mode : 'click',
		//总页码
		total : totalPage,
		//总数据条数
		totalRecords : totalRecords,
		//链接前部
		hrefFormer : 'page',
		//链接尾部
		hrefLatter : '.action',
		click : function(n){
	        this.selectPage(n);
	        var params = "pageNO="+ n+"#pCont3";
			var	oldUrl = location.href;
			var idx = oldUrl.indexOf("?");
			var idx2 = oldUrl.indexOf("pageNO");
			
			if(idx==-1){
				location.href = oldUrl +"?"+ params; 
			}else{
				if(idx2==-1){
					location.href = oldUrl +"&"+ params; 
				}else{
					location.href = oldUrl.substring(0,idx2) + params; 
				}
			} 
	    },
		lang : { 
			prePageText : '< Prev',
			nextPageText : '> Next'
		} 
	});
	
	
	$(".point-star-border").click(function(){
		var left=$(this).get(0).offsetLeft;
		var event=window.event.clientX;
		var flag=event-left;
		if(0<flag && flag<31){
			$(".point-star-in").attr("style","width:20%;");
			$(".point-show-span").text(2);
		}else if(31<flag && flag<62){
			$(".point-star-in").attr("style","width:40%;");
			$(".point-show-span").text(4);
		}else if(62<flag && flag<93){
			$(".point-star-in").attr("style","width:60%;");
			$(".point-show-span").text(6);
		}else if(93<flag && flag<124){
			$(".point-star-in").attr("style","width:80%;");
			$(".point-show-span").text(8);
		}else if(124<flag && flag<155){
			$(".point-star-in").attr("style","width:100%;");
			$(".point-show-span").text(10);
		}
	});
	$(".point-add-plus").click(function(){
		var item=$(this).attr("data-item");
		var width=Number($(".point-show-span").text());
		if(item=="+"){
			if(width==10){
				return;
			}else{
				width=width+1;
			}
		}else if(item=="-"){
			if(width==0){
				return;
			}else{
				width=width-1;
			}
		}
		$(".point-star-in").attr("style","width:"+width*10+"%;");
		$(".point-show-span").text(width);
	});
	$(".submit-comment").click(function(){
		var reviewPoint=$(".point-show-span").text();
		var mesContent=$("#mesContent").val();
		var blogId=$("#blogId").val();
		var reviewCnt=Number(${requestScope.reviewCnt});
		if(reviewPoint=='0' && reviewCnt==0){
			alert("请填写评分");
			return;
		}
		var param={reviewPoint:reviewPoint,mesContent:mesContent,blogId:blogId};
		$.ajax({
			data:param,
			dataType:"json",
			type:"GET",
			cache:false,
			url:"/front/blog/saveBlogReview.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				if(data.ret=="success"){
					alert("评论成功");
					window.location.href="/front/blog/blogDetail.htm?shopId=${blogList.SHOP_ID }&blogId="+blogId;
				}else{
					alert("评论失败，请重新操作");
				}
			},
			error:function(a, msg, c) {
				alert("error: " + msg);
			}
		}); 
	});
});

function fn_SnsSareLayerShow() {
	$('#container').addClass('on layerZindex');
	$('.snsShareLayerPopup').show();
}


function fn_SnsSareLayerHide() {
	$('#container').removeClass('on layerZindex');
	$('.snsShareLayerPopup').hide();
}

</script>
</head>
<body  class="bodyColorBlogDetail">
	<!-- header -->
	<header class="headerDetail">
		<div class="searchPmd">
			<div class="logoShare" style="background:url('${blogList.SHOP_LOGO}') no-repeat; background-size: 100% 100%;"></div>
			<div class="title">${blogList.BLOG_TITLE }</div>
<!-- 			<div class="btnShare" onclick="fn_SnsSareLayerShow();"></div> -->
		</div>
	</header>
	<!-- //header -->


	<!-- container -->
	<div id="container">
		<section id="contents">
			<!-- ---------------------------------------------------------- -->
			<!-- 
			<section class="detailTopSlide">
				<h2>Banner</h2>
				<div class="sliderList" data-slider="1">
					<ul>
						<li><img src="${blogList.BLOG_FILE_URL }" alt="" /></li>
					</ul>
				</div>
				<div class="sliderpage"></div>
			</section>
			 -->
			<!-- ---------------------------------------------------------- -->
			<!-- 
			<table style="width: 100%;">
				<tr>
					<td colspan="4" style="padding: 10px;">
						<span class="detail_headtitle"><pre class="detail-Desc">${blogList.BLOG_DETAIL}</pre></span>
					</td>
				</tr>
			</table>
			 -->
			
		    <div id="container">
		    
			    <section id="contents">
			    	
			    	<!-- 
			    		----------------------------------------------------------------
			    		-- 商品属性 (GOODS SPEC)
			    		---------------------------------------------------------------- 
			    	-->
<!-- 			    	<div class="detailSubTitle"> -->
<!-- 			    		<span>详细内容 >></span> -->
<!-- 			    	</div> -->
					
			    	<!-- 
			    		----------------------------------------------------------------
			    		-- 商品介绍(GOODS INTR)
			    		---------------------------------------------------------------- 
			    	-->
					<c:forEach var="list" items="${blogDetailList }" varStatus="status">  
						<c:if test="${list.HEADER_FLG == 'Y' }">
							${list.HEADER_TAG}
						</c:if>
							
							<c:if test="${list.TMPL_NO eq '99' }">
							${list.TXT01 }
							</c:if>
							<c:if test="${list.TMPL_NO ne '99' }">
							${list.BODY_TAG }
							</c:if>
							
						<c:if test="${list.FOOTER_FLG=='Y'}">
							${list.FOOTER_TAG}
						</c:if>			
					</c:forEach>

				</section>
				
			</div>
			 
			<div id="pCont3" style="height:47px;"></div>
			<div class="sToggle mgt10"><!-- 2014-07-23 -->
				<h3 class="sToggleTit detailReviewTitle on"><a href="#">日志评价</a></h3>
				<div class="sToggleCont" style="display:block;">
					<div class="detailReviewList">
					
						<!-- star_rating -->
						<div class="reviewTopRating">
							<ul>
								<li class="lft">
									<div class="detailReviewStar">
										<p class="ReviewRating">
											<span class="hollow"><span class="solid" style="width:${blogList.REVIEW_POINT_AVG }0%;"></span></span>
										</p>
									</div>
								</li>
								<li class="cnt">&nbsp;&nbsp;${blogList.REVIEW_POINT_AVG }分</li>
								<li class="rgt">${blogList.REVIEW_POINT_CNT }人参写评价</li>
								<input type="hidden" value="${blogList.BLOG_ID}" id="blogId"/>
							</ul>
						</div>
						<table class="blogDetail-point-table" <c:if test="${requestScope.reviewCnt>=1}">style="display:none;"</c:if>>
							<tr>
								<td>
									<img src="/front/skin/main/img/orderConfirm/left.png" class="point-add-plus" data-item="-"/>
									<span class="point-star-border">
										<span class="point-star-in" style="width:0%;">
										</span>
									</span>
									<img src="/front/skin/main/img/orderConfirm/plus.png" class="point-add-plus" data-item="+"/>
								</td>
								<td>
									<span class="span-position-span"><span class="point-show-span">0</span>.0分</span>
								</td>
							</tr>
						</table>
						
						<div style="width:100%; height: 30px; line-height: 30px; ">日志评价 ( ${blogList.REVIEW_CNT } 条 )</div>
						<div class="preview-div-text">
							<textarea rows="4" cols="50" placeholder="" id="mesContent"></textarea>
							<div  class="submit-comment">
								<span>发表评论</span>
							</div>
						</div>
						<!-- review -->
						<ul class="pRatingList">
							<c:forEach var="reviewList" items="${reviewList }" varStatus="status">
								<li style="border-bottom: 1px solid #C8C8C8;">
									<span class="mail"></span>
									<div class="txt">
										<span>${reviewList.REVIEW_DESC }</span>
									</div>
									<span class="date">${reviewList.CUST_NICK_NM } (${reviewList.CREATED_DT })</span>
									<span class="shopping">
										<c:if test="${reviewList.REVIEW_POINT > 0 }">
											<span class="rating star2">
												<span style="width:${reviewList.REVIEW_POINT }0%"></span>
											</span>
										</c:if>
									</span>
								</li>
							</c:forEach>
						</ul>
						<div style="border-top: 0px; margin-top: -20px;" align="center">
							<div style="height: 5px;"></div>
							<div id="kkpager"></div>
							<div style="height: 10px;"></div>
						</div>
						<!-- End -->
						
					</div>
				</div>
					
			</div>
				
			<br />
			<br />
			<br />
			<br />
			<br />

		</section>
	</div>
	<a href="#" class="bottom_totop">top</a>

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
	
	
</body>
</html>
