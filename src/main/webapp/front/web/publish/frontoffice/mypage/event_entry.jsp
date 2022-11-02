<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/mypage.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_mypage.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>   	
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
			<div class="mypage"> 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_mypage.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  
					<div class="page-sublocation">  
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><strong>关注商品</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					
					<h3><img src="/images/shop/cn/mypage/title_event01.gif" alt="参与活动" /></h3>	
					
					<div class="table-searchtype">
						<div class="event">
							<table summary="응모 이벤트 검색 테이블">
								<caption>응모 이벤트 검색 테이블</caption>
								<colgroup>
									<col width="87px" /> 
									<col width="377px" />  
									<col width="88px" />  
									<col width="228px" />  
								</colgroup> 
								<tbody> 
									<tr>  
										<th><span>活动期间</span></th>
										<td> 
											<p class="date"> 
												<input type="text" class="date term" title="출국일자를 입력하세요" /> 
												<span>~</span>
												<input type="text" class="date term" title="출국일자를 입력하세요" />
											</p>
										</td>
										<th class="tow"><span>活动状态</span></th>
										<td class="event-search">
											<div class="event-searchbox"> 
												<select id="event-search" title="검색범위 선택">
													<option>全部</option>
													<option>正在进行</option>
													<option>被抽选</option>
													<option>未被抽选</option>
													<option>无抽选信息</option> 
												</select>
											</div>
										</td>
									</tr>  
									<tr>
										<th><span>检索词</span></th>
										<td colspan="3" class="shin"><input type="text" name="" id="" title="검색어 입력" /><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_search.gif" alt="검색" /></a></td> 
									</tr>
								</tbody>
							</table>  
						</div> 
					</div>
				 
					<div class="table-listhtype">							 
						<div class="list">
							<table summary="응모 이벤트 게시판">
                    			<caption>응모 이벤트 게시판</caption>
								<colgroup>  
									<col width="104px" /> 
									<col width="276px" /> 
									<col width="165px" />  
									<col width="101px" />  
									<col width="134px" />  
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">参与日</th> 
										<th scope="row">活动名</th> 
										<th scope="row">活动期间</th> 
										<th scope="row">发表日</th>   
										<th scope="row">抽选与否</th>   
									</tr>
								</thead>
								<tbody>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event ing"><a href="#"><span>[正在进行]</span> 회원등급 변경안내</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">正在进行</span></td> 
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event ing"><a href="#"><span>[正在进行]</span> 어버이날 적립금 전 고객 2만원 지급</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">正在进行</span></td>
									</tr>  
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event ing"><a href="#"><span>[正在进行]</span> 웨딩 페스티발 웨딩쿠폰 증정</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">-</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event"><a href="#"><span>[已结束]</span> 신규가입 즉시 5,000원 지급</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check-on">被抽选<br />(新世界手机版商品券)</span></td>
									</tr> 
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event"><a href="#"><span>[已结束]</span> 신세계 모바일 상품권을 잡아라</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">未被抽选</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event"><a href="#"><span>[已结束]</span> 어버이날 적립금 전 고객 2만원 지급</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">未被抽选</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event"><a href="#"><span>[已结束]</span> 웨딩 페스티발 웨딩쿠폰 증정</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">未被抽选</span></td>
									</tr>  
									<tr> 
										<td><span class="fta">2012.08.29</span></td>  
										<td class="event"><a href="#"><span>[已结束]</span> 신규가입 즉시 5,000원 지듭</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td>
										<td><span class="check">-</span></td> 
									</tr>  
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event"><a href="#"><span>[已结束]</span> 신세계 모바일 상품권을 잡아라</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td>
										<td><span class="check">未被抽选</span></td> 
									</tr>  
									<tr> 
										<td><span class="fta">2012.08.29</span></td> 
										<td class="event"><a href="#"><span>[已结束]</span> 어버이날 적립금 전 고객 2만원 지급</a></td>  
										<td><span class="fta">2012.08.29 ~ 2012.08.29</span></td>
										<td><span class="fta">2012.08.29</span></td> 
										<td><span class="check">未被抽选</span></td>
									</tr> 
								</tbody>  
							</table>
						</div> 	
						
						<div class="pager">
							<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="처음으로" /></a>
							<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="이전" /></a>
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
							<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="다음" /></a>
							<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="마지막으로" /></a>
						</div>									
					</div>
						
					 
					 
				</div><!-- //contents -->  
			</div><!-- //mypage -->	 
			
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>