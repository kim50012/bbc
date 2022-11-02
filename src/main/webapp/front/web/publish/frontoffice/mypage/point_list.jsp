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
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 	/*
	$('.save-point').hide(); 
	$(".savemoney-box a.save-change02").click(function(){
    	$('.save-point').toggle();
    });
    $(".save-point a.close").click(function(){
    	$('.save-point').hide(); 
    }); */
	
});  
//]]>
</script> 	
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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的购物优惠</a><span>&gt;</span><strong>点数 (Point)</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					 
					<h3><img src="/images/shop/cn/mypage/title_pointlist.gif" alt="点数（Point）" /><span><img src="/images/shop/cn/mypage/explain_pointlist.gif" alt="转换成积分以后，可在订购时当现金使用。" /></span></h3>
				 
					<div class="savemoney-box point-box">
						<div class="bg-box bg-point">
							<div class="my-save">
								<p class="info">
									<span class="con01"><span class="member-id">홍길동</span> 顾客目前的点数为</span> 
									<span class="total-save">6,000 POINT</span> <span class="con01"></span>
								</p> 
							</div>
							<p class="save-btn"><a href="#" class="save-change02"><img src="/images/shop/cn/mypage/btn_savemoney_change02.gif" alt="积分转换" /></a></p> 
						</div>
					</div>
						 
					<div class="table-listhtype point-table">  
						<div class="list">
							<table summary="포인트 사용내역">
								<caption>포인트 사용내역</caption> 
								<colgroup>  
									<col width="86px" /> 
									<col width="87px" /> 
									<col width="105px" />  
									<col width="334px" /> 
									<col width="84px" /> 
									<col width="84px" />  
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">区分</th>  
										<th scope="row">日期</th> 
										<th scope="row">有效期</th>  
										<th scope="row">详细内容</th>
										<th scope="row">积分(P)</th>
										<th scope="row">使用(P)</th>       
									</tr>
								</thead> 
								<tbody>
									<tr> 
										<td><span class="divide">转换</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>转换为积分</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td>
									</tr>
									<tr> 
										<td><span class="divide">转换</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td class="subject"><span>转换为积分</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">转换</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>转换为积分</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td>
									</tr>
									<tr> 
										<td><span class="divide">转换</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>转换为积分</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">转换</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>转换为积分</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">转换</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>적립금으로 전환</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">累积</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>赠送出境信息注册积分5,000韩元</span></td>  
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
									</tr>
									<tr>  
										<td><span class="divide">累积</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>赠送黄气球积分10,000韩元</span></td>  
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
									</tr>
									<tr> 
										<td><span class="divide">累积</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>赠送出境信息注册积分5,000韩元</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
									</tr>
									<tr> 
										<td><span class="divide">累积</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>转换为积分</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td colspan="6">没有累积的积分。</td>
									</tr>
								</tbody>  
							</table>
						</div>
						<!-- //[D] 변경 테이블 목록항목 재정리 -->  
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
					
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_point_info.gif" alt="点数（Point）使用指南" /></p>
					<div class="tipping-box"> 
						<ul>
							<li>点数（Point）兑换成积分以后，可在订购时当现金使用</li>
							<li>点数（Point）使用单位为1000P，满1000P可开始兑换积分，兑换时1,000 P → $1。 </li>
							<li>根据兑换日期的汇率转换成积分。</li>
						</ul>
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