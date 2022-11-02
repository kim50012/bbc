<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE 고객센터</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/customer.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_customer.js"></script>
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
			<div class="customer">				 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_customer.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  				
					<div class="page-sublocation">   
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><strong>公告事项</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					 			 
					<h3><img src="/images/shop/cn/customer/title_notice.gif" alt="公告事项" /><span><img src="/images/shop/cn/customer/explain_notice.gif" alt="新世界免税店告诉您最新的消息。" /></span></h3>
					 
					<div class="board-atypelist">  									 
						<p class="info"></p>						
						<div class="table-search"> 
							<div class="box">
								<select id="table-search" title="검색범위 선택">
									<option>请选择</option>
									<option>내용</option>
								</select>
								<input type="text" name="" id="" title="검색어 입력" /> 
							</div>
							<a href="#" class="btn"><img src="/images/shop/cn/customer/btn_search.gif" alt="搜索" /></a>						 
						</div>
		 
						<div class="list">
							<table summary="公告事项">
                    			<caption>公告事项</caption>
								<colgroup>  
									<col width="57px" /> 
									<col width="550px" /> 
									<col width="79px" />  
									<col width="94px" />  
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
									<tr class="notice"> 
										<td><img src="/images/shop/cn/customer/ico_notice.gif" alt="通知" /></td> 
										<td class="subject"><a href="#">회원등급 변경안내</a></td>  
										<td>2013.06.20</td>
										<td>3426</td>
									</tr>   
									<tr class="notice"> 
										<td><img src="/images/shop/cn/customer/ico_notice.gif" alt="通知" /></td> 
										<td class="subject"><a href="#">액체류 기내 반입 안내</a></td>  
										<td>2013.06.20</td>
										<td>150</td>
									</tr>  
									<tr class="notice"> 
										<td><img src="/images/shop/cn/customer/ico_notice.gif" alt="通知" /></td> 
										<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>  
										<td>2013.06.20</td>
										<td>1379</td>
									</tr>   
									<tr class="notice"> 
										<td><img src="/images/shop/cn/customer/ico_notice.gif" alt="通知" /></td> 
										<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>  
										<td>2013.06.20</td>
										<td>2345</td>
									</tr> 
									<tr> 
										<td>16</td> 
										<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>  
										<td>2013.06.20</td>
										<td>32</td>
									</tr>   
									<tr> 
										<td>15</td> 
										<td class="subject"><a href="#">시스템점검안내-6월11일</a></td>  
										<td>2013.06.20</td>
										<td>3426</td>
									</tr>   
									<tr> 
										<td>14</td> 
										<td class="subject"><a href="#">2013.06월 부분무이자할부 이벤트</a></td>  
										<td>2013.06.20</td>
										<td>97</td>
									</tr>  
									<tr> 
										<td>13</td> 
										<td class="subject"><a href="#">KIEHL`S 일부 상품 가격 인상 안내</a></td>  
										<td>2013.06.20</td>
										<td>1004</td>
									</tr>  
									<tr> 
										<td>12</td> 
										<td class="subject"><a href="#">TISSOT/LONGINES/RADO 시계 할인율 변경 및 쿠폰 사용 중단 안내</a></td>  
										<td>2013.06.20</td>
										<td>7979</td>
									</tr>  
									<tr> 
										<td>11</td> 
										<td class="subject"><a href="#">[MONTBLANC] 가격 인상 안내</a></td>  
										<td>2013.06.20</td>
										<td>3426</td>
									</tr>  
									<tr> 
										<td>10</td> 
										<td class="subject"><a href="#">회원등급 변경안내</a></td>  
										<td>2013.06.20</td>
										<td>3426</td>
									</tr>   
									<tr> 
										<td>9</td> 
										<td class="subject"><a href="#">액체류 기내 반입 안내</a></td>  
										<td>2013.06.20</td>
										<td>150</td>
									</tr>  
									<tr> 
										<td>8</td> 
										<td class="subject"><a href="#">관리자 상승 오류시 해결 방법</a></td>  
										<td>2013.06.20</td>
										<td>1379</td>
									</tr>   
									<tr> 
										<td>7</td> 
										<td class="subject"><a href="#">환승전용 내항기"이용 고객 쇼핑시 유의사항</a></td>  
										<td>2013.06.20</td>
										<td>2345</td>
									</tr> 
									<tr> 
										<td>6</td> 
										<td class="subject"><a href="#">모바일교환권 및 적립금 지급 공지</a></td>  
										<td>2013.06.20</td>
										<td>32</td>
									</tr>   
									<tr> 
										<td>5</td> 
										<td class="subject"><a href="#">시스템점검안내-6월11일</a></td>  
										<td>2013.06.20</td>
										<td>3426</td>
									</tr>   
									<tr> 
										<td>4</td> 
										<td class="subject"><a href="#">2013.06월 부분무이자할부 이벤트</a></td>  
										<td>2013.06.20</td>
										<td>97</td>
									</tr>  
									<tr> 
										<td>3</td> 
										<td class="subject"><a href="#">KIEHL`S 일부 상품 가격 인상 안내</a></td>  
										<td>2013.06.20</td>
										<td>1004</td>
									</tr>  
									<tr> 
										<td>2</td> 
										<td class="subject"><a href="#">TISSOT/LONGINES/RADO 시계 할인율 변경 및 쿠폰 사용 중단 안내</a></td>  
										<td>2013.06.20</td>
										<td>7979</td>
									</tr>  
									<tr> 
										<td>1</td> 
										<td class="subject"><a href="#">[MONTBLANC] 가격 인상 안내</a></td>  
										<td>2013.06.20</td>
										<td>3426</td>
									</tr> 
									<tr>
										<td class="noinfo" colspan="4">没有‘活动’的相关搜索结果。请重新输入搜索词。</td>
									</tr>
								</tbody>  
							</table>
						</div> 	
						
						<div class="pager">
							<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음으로" /></a>
							<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
							<a href="#" class="selected"><strong>1</strong></a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">6</a>
							<a href="#">7</a>
							<a href="#">8</a>
							<a href="#">9</a>
							<a href="#">10</a>
							<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
							<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막으로" /></a>
						</div>	 
					</div> 
						 
					 
				</div><!-- //contents -->  
			</div><!-- //customer -->	 
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>