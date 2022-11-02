<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout_store.css" rel="stylesheet" type="text/css" />
<link href="/css/store.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script> 

<!-- selectbox 있을경우 추가 -->
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 
	/* 게시판 검색 */ 
	$("#table-search").selectbox(); 	
	
});  
//]]>
</script> 
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store05.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页 </a><span>&gt;</span><a href="#">使用指南</a><span>&gt;</span><strong>公告事项</strong>
				</div>  
				<div class="location-title visual05">
					<h3><img src="/images/shop/cn/store/h3_title05.gif" alt="information" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！我们将为顾客的购物方便尽最大的努力。" /></p>
				</div>
				<h4><img src="/images/shop/cn/store/title_notice.gif" alt="公告事项" /></h4> 
				<div class="board-atypelist">  	
					<div class="view">
						<table summary="공지사항 게시판">
							<caption>공지사항 게시판</caption>
							<colgroup>  
								<col width="100px" /> 
								<col width="480px" /> 
								<col width="100px" /> 
								<col width="100px" /> 
							</colgroup>
							<thead>
								<tr> 
									<th scope="row"><span>题目</span></th>
									<td colspan="3" class="subject"><strong>회원등급 변경안내</strong></td>  
								</tr>
								<tr> 
									<th scope="row"><span>发表日</span></th>
									<td><span class="fta">2013-01-30</span></th> 
									<th scope="row" class="tow"><span>浏览次数</span></th>
									<td class="tow"><span class="fta">2013</span></th> 
								</tr>
							</thead>
							<tbody>    
								<tr>  
									<td colspan="4" class="con02">
										<div class="con"> 
											<p>내용이 들어갑니다.</p> 
										</div>
									</td>   
								</tr>  
							</tbody>  
						</table>
					</div>
					<ul class="view-pager"> 
						<li><a href="#" class="prev"><span>上一篇</span><strong class="subject">2013.05월 무이자 할부 행사 안내</strong></a></li> 
						<li><a href="#" class="next"><span>下一篇</span><strong class="subject">TISSOT/LONGINES 시계 할인율 변경 및 쿠폰 사용 중단 안내</strong></a></li> 
					</ul>	 
					<div class="btn_wrap">
						<p class="right"><a href="#"><img src="/images/shop/cn/store/btn_list.gif" alt="返回目录" /></a></p>
					</div>						
				</div> 
				
				
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



