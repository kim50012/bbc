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
				<div class="table-listhtype">	
					<p class="info">共有 <strong>10</strong> 个活动。</p> 
					<div class="table-search"> 
						<div class="box">
							<select id="table-search" title="검색범위 선택">
								<option>题目</option>
								<option>내용</option>
							</select>
							<input type="text" name="" id="" title="검색어 입력" /> 
						</div>
						<a href="#" class="btn"><img src="/images/shop/cn/store/btn_search_list.gif" alt="搜索" /></a>						 
					</div>
						
					<div class="list">
						<table summary="신세계면세점 DM 보기 테이블">
							<caption>신세계면세점 DM 보기 테이블</caption>
							<colgroup>  
								<col width="62px" /> 
								<col width="549px" />  
								<col width="97px" />    
								<col width="72px" />   
							</colgroup>
							<thead>
								<tr>  
									<th scope="row">序号</th> 
									<th scope="row">题目</th>     
									<th scope="row">发表日</th> 
									<th scope="row">浏览次数</th>     
								</tr>
							</thead>
							<tbody>   
								<tr>  
									<td><span><img src="/images/shop/cn/store/ico_repot.gif" alt="通知" /></span></td>  
									<td class="subject"><a href="#">클라란스 댓글 이벤트 당첨자</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span><img src="/images/shop/cn/store/ico_repot.gif" alt="通知" /></span></td>  
									<td class="subject"><a href="#">클라란스 댓글 이벤트 당첨자</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>    
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>    
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr>     
								<tr>  
									<td><span class="fta">1</span></td>  
									<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>    
									<td><span class="fta">2013-01-30</span></td>
									<td><span class="fta">1234</span></td> 
								</tr> 
							</tbody>  
						</table> 
					</div> 	
						
					<div class="pager">
						<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="first" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="previous" /></a>
						<strong>1</strong>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="next" /></a>
						<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="last" /></a>
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



