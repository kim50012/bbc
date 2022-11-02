<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> <!-- , target-densitydpi=medium-dpi" -->
<meta name="format-detection" content="telephone=no" />
<title>我的评论</title>
<%@ include file="/front/skin/common.jsp"%>
<%@ include file="/front/main/messageTip.jsp"%>
<style>
	.preview-out-div{width:96%;margin-left:2%;position: relative;color:#313131;padding-top:10px;}
	.blog-div-show{width:100%;background-color: #fff;padding-top:12px;padding-bottom:10px;margin-top:10px;}
	.header-img-div{width:100px;height:100px;margin-right:10px;margin-left:8px;display: inline-block;}
	.header-img-div a img{border: 0 solid #ededed;width:100px;height:100px;}
	.header-text-div{margin:0px 10px 0px 0; -webkit-box-flex: 1;display:inline-block;width:96%;}
	.header-text-div p{font-size:14px;line-height:18px;overflow:hidden;}
	.header-text-div .blog-preview-detail{line-height:20px;margin-top:2px;word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical;  color: #616161;}
	.date-time-show{position: absolute;right:0px;top:1px;font-size:12px;}
	/* .header-text-div .point-img-show-p{margin-top:5px;} */
	.point-img-show-p .hollow { position: absolute; width: 120px;height: 19.32px;  margin: 2px; background: url('/front/skin/demo/img/common/star_hollow.png') no-repeat 0 0; background-size: 120px 19.32px; }
	.point-img-show-p .solid { position: absolute;  height: 19.32px; margin: 0px; background: url('/front/skin/demo/img/common/star_solid.png') no-repeat 0 0;  background-size: 120px 19.32px;}
	.point-img-show-p .point-name-span{ display: inline-block; font-size:14px; margin-top:3px; }
	.header-text-div .title-blog{font-size:14px;margin-top:8px;  color: #616161;}
	.header-text-div .title-blog .span-first-one{word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;}
</style>
<script type="text/javascript">
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
    	
    	var param={pageCurr:pageCurr};
    	$.ajax({
    		data : param,
    		dataType : "json",
    		type : "GET",
    		cache : false,
    		url : "/front/customer/getNextPreviewList.htm", //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
    		contentType : "application/x-www-form-urlencoded; charset=UTF-8", 
    		success : function(data){
    			if(data.list.length!=0){
    				for(var i=0;i<data.list.length;i++){
    					var list=data.list;
    					var name=list[i].CUST_NICK_NM;
    					if(name.length>=9){
    						name=name.substring(0,7)+"...";
    					}
    					var htm='<div class="blog-div-show"><table style="width:100%;position: relative;"><tr style="width:100%;position: relative;"><td style="width:100px;vertical-align: top;">'+
		    					'<div class="header-img-div"><a  href="/front/magazine/magazineDetail.htm?shopId='+list[i].SHOP_ID+'&magazineId='+list[i].BLOG_ID+'" >'+
		    					'<img src="'+list[i].BLOG_FILE_URL +'" alt=""/></a></div></td>'+
		    					'<td style="position: relative;"><div class="header-text-div"><p style="font-size:12px;position: relative;width:100%;">'+name+'<span class="date-time-show">'+list[i].CREATED_DT +'</span></p>'+
		    					'<p class="blog-preview-detail">'+
		    					'<span style="color:#313131;">内容：</span>'+list[i].REVIEW_DESC +'</p>'+
		    					'<p class="title-blog" onclick=\'window.location.href="/front/blog/blogmagazine/magazineDetailId='+list[i].SHOP_ID+'&magazineId='+list[i].BLOG_ID+'"\'><span class="span-first-one"><span style="color:#313131;">标题：</span>'+list[i].BLOG_TITLE +'</span></p>'+
		    					/* '<p class="point-img-show-p"><span class="point-name-span">评分：</span><span class="hollow"><span class="solid" style="width:'+list[i].REVIEW_POINT +'0%;"></span></span></p>'+ */
		    					'</div></td></tr></table></div>';
    					$(".preview-out-div").append(htm);
    				}
    			}
				$('#foo').fadeOut(200);
    		},
    		error : function(a, msg, c) {
				$('#foo').fadeOut(200);
    			alertTip("error: " + msg);
    		}
    	});
    }
});
</script>

</head>
<body  class="bodyColorBlogList">
	<div class="preview-out-div">
		<div class="listMsg">
			共有 <span id="spnTotalCount"> ${requestScope.newsList[0].TOTAL_CNT } </span> 条评论
			<input type="hidden" id="pageCount" value="${requestScope.pageCount }"/>
		</div>
		<c:forEach items="${newsList }" var="list" varStatus="status">
			<div class="blog-div-show">
				<table style="width:100%;position: relative;">
					<tr style="width:100%;position: relative;">
						<td style="width:100px;vertical-align: top;">
							<div class="header-img-div">
								<a  href="/front/magazine/magazineDetail.htm?shopId=${list.SHOP_ID}&magazineId=${list.BLOG_ID}" >
									<img src="${list.BLOG_FILE_URL }" alt=""/>
								</a>
							</div>
						</td>
						<td style="position: relative;">
							<div class="header-text-div">
								<p style="font-size:12px;position: relative;width:100%;">
									<c:if test="${fn:length(list.CUST_NICK_NM)>=9 }">
										${fn:substring(list.CUST_NICK_NM, 0, 7) }...
									</c:if>
									<c:if test="${fn:length(list.CUST_NICK_NM)<9 }">
										${list.CUST_NICK_NM}
									</c:if>
									<span class="date-time-show">${list.CREATED_DT }</span>
								</p>
								<p class="blog-preview-detail">
									<span style="color:#313131;">内容：</span>${list.REVIEW_DESC }
								</p>
								<p class="title-blog" onclick='window.location.href="/front/magazine/magazineDetail.htm?shopId=${list.SHOP_ID}&magazineId=${list.BLOG_ID}"'><span class="span-first-one"><span style="color:#313131;">标题：</span>${list.BLOG_TITLE }</span></p>
								<%-- <p class="point-img-show-p">
									<span class="point-name-span">评分：</span><span class="hollow"><span class="solid" style="width:${list.REVIEW_POINT }0%;"></span></span>
								</p> --%>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</div>
	<br>
	<br>
	<br><br>
	<%@ include file="/front/skin/common_bottom.jsp"%>
</body>
</html>