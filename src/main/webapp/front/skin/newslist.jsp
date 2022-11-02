<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	String strCurrentTime = String.valueOf(System.currentTimeMillis());
%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/front/skin/common_news.jsp"%> 
 <script type="text/javascript">
 			function navnews(obj){
 				$('#pageNo').val('1');
 				$('#newstype').val(obj);
 				if(obj==''){obj=null};
 				$('.list-wrap').empty();
 				ajaxNewsList(obj,$('#pageNo').val(),5);
 			}
 			function reqnewsview(m,n){
 				window.location="/front/skin/newsview.htm?newsId="+m+"&msgId="+n;
 			}
 	</script>

</head>

<body>
<div id="wrap">
	<!-- s:header -->
	<div id="header">
		<a href="00_main.html" class="logo fl-l"><img src="/front/skin/images/common/logo.jpg" width="114" height="44" alt="logo" /></a>
		<a href="#" class="menu fl-r"><img src="/front/skin/images/common/btn_menu.jpg" width="40" height="44" alt="menu" /></a>
		<a href="#" class="search fl-r"><img src="/front/skin/images/common/btn_search.jpg" width="40" height="44" alt="search" /></a>
	</div>
	<!-- //e:header -->
	<!-- s:contentWrap -->
	<div id="contentWrap2">
		<!-- s:SubMenu -->
		<div id="sub-menu-wrap">
			<div>
				<ul>
					<li class="active"><a href="javascript:;"onclick="navnews('')">查看全部</a></li>
					<c:forEach items="${list }" var="list" varStatus="status">
					<li><a href="javascript:;"onclick="navnews(${list.CD_ID })">${list.CD_VAL}</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<!-- //e:SubMenu -->
		<!-- s:ListWrap -->
		<div class="list-wrap">
		<c:forEach items="${page.data}" var="item" varStatus="status">
					<div class="list">
				<a href="javascript:;"onclick="reqnewsview(${item.NEWS_ID},${item.MSG_ID})">
					<div class="list-img"><img src="/front/skin/images/page/img_list02.jpg" alt="" class="max"/></div>
					<div class="list-txt">
						<p class="list-title">
						<c:forEach items="${list }" var="listtype" >
							<c:if test="${listtype.CD_ID eq  item.NEWS_TYPE}">${listtype.CD_VAL}</c:if>
						</c:forEach>
						</p>
						<p class="list-cont">
						<c:if test="${fn:length(item.MTITLE)>7 }">${ fn:substring( item.MTITLE ,0,6)} <br/>${ fn:substring( item.MTITLE ,6,50)}</c:if>
						<c:if test="${fn:length(item.MTITLE)<=7 }">${item.MTITLE} </c:if>
						</p>
						<p class="list-date"><fmt:formatDate value="${item.CREATED_DT}" pattern="y-M-d"/></p>
					</div>
				</a>
			</div>
		</c:forEach> 
		</div>
		<!-- //e:ListWrap -->
		<!-- s:MoreButton -->
		<a href="#" class="btn-gray more">MORE<img src="/front/skin/images/page/icon_more2.jpg" alt="MORE" width="13" height="13"/></a>
		<a href="#" class="btn-gray loading" style="display:none;"><img src="/front/skin/images/page/more_loading.gif" alt="MORE" width="50" height="5"/></a>
		<!-- //e:MoreButton -->
	</div>
	<!-- //e:contentWrap -->
	<!-- s:footer -->
	<div id="footer">
		<ul>
			<li>电话预订 <span>40065-88888</span></li>
			<li>营业时间 <span>07:00 ~ 21:00</span></li>
		</ul>
		<p class="mt10">Copyright 2016 &copy; KOREAN AIR . All right Reserved.</p>
	</div>
	<input id="newstype" type="hidden" disabled="disabled" value=""/>
	<input id="pageNo" type="hidden" disabled="disabled" value="1"/>
	<input id="pageUnit" type="hidden" disabled="disabled" value="5"/>	
	<!-- //e:footer -->
	<!-- s:navi-->
	<div class="navi-wrap">
		<div class="navi">
			<ul>
				<li>
					<div><a href="#">HOME</a></div>
				</li>
				<li>
					<div><a href="#">DEAL &amp; OFFERS</a></div>
					<ul class="two">
						<li><a href="#">- Special Offer</a></li>
						<li><a href="#">- Promotions</a></li>
					</ul>
				</li>
				<li>
					<div><a href="#">BOOK A FLIGHT</a></div>
				</li>
				<li>
					<div><a href="#">ARTICLE</a></div>
					<ul class="two">
						<li><a href="#">- 女人喜欢的味道</a></li>
						<li><a href="#">- 免税商店 热门产品</a></li>
						<li><a href="#">- 编辑推荐</a></li>
					</ul>
				</li>
				<li>
					<div><a href="#">EVENT</a></div>
				</li>
				<li>
					<div><a href="#">KOREAN AIR</a></div>
					<ul class="two">
						<li><a href="#">- About Us</a></li>
						<li><a href="#">- SKY PASS</a></li>
						<li><a href="#">- VIP Service</a></li>
						<li><a href="#">- News & Notice</a></li>
					</ul>
				</li>
			</ul>
		</div>
		<a href="#" class="btn-close"><img src="/front/skin/images/common/btn_close.png" alt="close" width="40" height="44"/></a>
	</div>
	<!-- //e:navi-->
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('.more').click(function(){
			event.preventDefault();
			var a = $('#newstype').val()||'';
			var b = $('#pageNo').val()||'';
			var c = $('#pageUnit').val()||'';
			if(a=='')a=null;
			if(b==''&&c==''){window.location.reload();}
			$('.more').hide();
			$('.loading').show();
			ajaxNewsList(a,b,c);
		});

		$('#sub-menu-wrap > div > ul > li > a').click(function(){
			event.preventDefault();
			$(this).parent().addClass('active');
			$(this).parent().siblings().removeClass('active');
		});
	});
	function ajaxNewsList(a,b,c){
		var param={newsType:a,pgCurr:b,pgUnit:c};
	  	$.ajax({
  		    type: "POST",
  		    url: "/front/skin/ajaxNewsList.htm",
  		    data: param,
  		    dataType: "json",
  		    async:"false",
  		    success: function(res){
	  		  	if(res.success){
	  		  		var arr=[];
	  		  		var data=res.page.data;
	  		  		var dlist=res.list;
			  		 for(var i in data) { 
			  			 var len=data[i].MTITLE.length;
			  			var mtitle;
			  				 if(len>7){
			  					mtitle =data[i].MTITLE.substring(0,7)+"<br>"+data[i].MTITLE.substring(7,20);
			  				 }else{
			  					mtitle=data[i].MTITLE;
			  				 }
			  			var mtype='类型为空~';
			  			for(var j in dlist){
			  				if(dlist[j].CD_ID==data[i].NEWS_TYPE)mtype=dlist[j].CD_VAL;
			  			}
			  			var  p={a:mtype,b:mtitle,c:data[i].CREATED_DT.substring(0,10),d:data[i].NEWS_ID,e:data[i].MSG_ID};
			  			var con = template('tpl_news_item', p);  
						arr.push(con);
			  		 }
			  		 for(var i in arr) { 
		  				 $(".list-wrap").append(arr[i]);
			  		 }
						$('#pageNo').val(res.page.pageNo);
				  		$('.loading').hide();
				  		$('.more').show();
	  		  	}else{
	  		  		alert(res.msg);
		  		  	$('.loading').hide();
			  		$('.more').show();
	  		  	}
  		    	
  		    },
  			error : function(a, msg, c) {
  				alert('error: ' + msg);
  			}
  		})
	}
</script>
</body>
</html>

