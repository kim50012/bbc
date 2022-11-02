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
						<div class="view">
							<table summary="공지사항 게시판">
                    			<caption>공지사항 게시판</caption>
								<colgroup>  
									<col width="70%" /> 
									<col width="30%" />   
								</colgroup>
								<thead>
									<tr> 
										<th scope="row" class="subject"><strong>회원등급 변경안내</strong></th> 
										<th scope="row" class="sub"><strong>发表日</strong><span>2013.06.20</span><strong>浏览次数</strong><span>1004</span></th>  
									</tr>
								</thead>
								<tbody>    
									<tr>  
										<td colspan="2" class="con">
											<div class="con">
												<!-- 개발시 삭제 -->
												<p style="padding:250px 0; text-align:center; font-weight:bold; background:#eaeaea;">내용이 들어갑니다.</p>
												<!-- //개발시 삭제 -->
											</div>
										</td>   
									</tr>  
								</tbody>  
							</table>
						</div>  

						 
						<ul class="view-pager"> 
							<li><a href="#"><span class="prev">上一篇</span><strong class="subject">2013.05월 무이자 할부 행사 안내</strong></a></li> 
							<li><a href="#"><span class="next">下一篇</span><strong class="subject">TISSOT/LONGINES 시계 할인율 변경 및 쿠폰 사용 중단 안내</strong></a></li> 
						</ul>	
						
						<div class="btn_wrap">
							<p class="right"><a href="#"><img src="/images/shop/cn/customer/btn_list.gif" alt="目录" /></a></p>
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