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
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store03.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">活动</a><span>&gt;</span><strong>活动店铺</strong>
				</div> 
				<div class="location-title visual03">
					<h3><img src="/images/shop/cn/store/h3_title03.gif" alt="SHOP EVENT" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！! 我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				 
				<h4><img src="/images/shop/cn/store/title_event01.gif" alt="店内活动 " /><span><img src="/images/shop/cn/store/explain_event01.gif" alt="(本活动与网上免税店无关)" /></span></h4>
				  
				<div class="board-atypelist">  	
					<div class="view shopevent">
						<table summary="매장 이벤트 게시판">
							<caption>매장 이벤트 게시판</caption>
							<colgroup>  
								<col width="100px" /> 
								<col width="520px" />  
								<col width="160px" /> 
							</colgroup>
							<thead>
								<tr> 
									<th scope="row"><span>题目</span></th>
									<td scope="row" class="subject"><strong>회원등급 변경안내</strong></td> 
									<td scope="row" class="date"><span class="fta">2013-06-20 ~ 2013-06-20</span></td>  
								</tr>
							</thead>
							<tbody>    
								<tr>  
									<td colspan="3" class="con01">
										<div class="con"> 
											<p>내용이 들어갑니다.</p>  
											<p><img src="//image.ssgdfs.com/images/shop/store/banner_event.gif" alt="이벤트명" /></p> 
										</div>
									</td>   
								</tr>  
							</tbody>  
						</table>
					</div>    
					<div class="btn_wrap">
						<p class="right"><a href="#"><img src="/images/shop/cn/customer/btn_list.gif" alt="返回目录" /></a></p>
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



