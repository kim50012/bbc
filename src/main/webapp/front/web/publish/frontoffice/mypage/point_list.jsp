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
						<a href="#">??????</a><span>&gt;</span><a href="#">????????????</a><span>&gt;</span><a href="#">??????????????????</a><span>&gt;</span><strong>?????? (Point)</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //??????????????? ?????? -->
					 
					<h3><img src="/images/shop/cn/mypage/title_pointlist.gif" alt="?????????Point???" /><span><img src="/images/shop/cn/mypage/explain_pointlist.gif" alt="?????????????????????????????????????????????????????????" /></span></h3>
				 
					<div class="savemoney-box point-box">
						<div class="bg-box bg-point">
							<div class="my-save">
								<p class="info">
									<span class="con01"><span class="member-id">?????????</span> ????????????????????????</span> 
									<span class="total-save">6,000 POINT</span> <span class="con01"></span>
								</p> 
							</div>
							<p class="save-btn"><a href="#" class="save-change02"><img src="/images/shop/cn/mypage/btn_savemoney_change02.gif" alt="????????????" /></a></p> 
						</div>
					</div>
						 
					<div class="table-listhtype point-table">  
						<div class="list">
							<table summary="????????? ????????????">
								<caption>????????? ????????????</caption> 
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
										<th scope="row">??????</th>  
										<th scope="row">??????</th> 
										<th scope="row">?????????</th>  
										<th scope="row">????????????</th>
										<th scope="row">??????(P)</th>
										<th scope="row">??????(P)</th>       
									</tr>
								</thead> 
								<tbody>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>???????????????</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td>
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td class="subject"><span>???????????????</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>???????????????</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td>
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>???????????????</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>???????????????</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>??????????????? ??????</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>??????????????????????????????5,000??????</span></td>  
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
									</tr>
									<tr>  
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>?????????????????????10,000??????</span></td>  
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>??????????????????????????????5,000??????</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
									</tr>
									<tr> 
										<td><span class="divide">??????</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td class="subject"><span>???????????????</span></td>  
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td> 
									</tr>
									<tr> 
										<td colspan="6">????????????????????????</td>
									</tr>
								</tbody>  
							</table>
						</div>
						<!-- //[D] ?????? ????????? ???????????? ????????? -->  
						<div class="pager">
							<a href="#"><img src="/images/shop/cn/common/btn_page_first.gif" alt="????????????" /></a>
							<a href="#"><img src="/images/shop/cn/common/btn_page_prev.gif" alt="??????" /></a>
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
							<a href="#"><img src="/images/shop/cn/common/btn_page_next.gif" alt="??????" /></a>
							<a href="#"><img src="/images/shop/cn/common/btn_page_last.gif" alt="???????????????" /></a>
						</div> 
					</div>
					
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_point_info.gif" alt="?????????Point???????????????" /></p>
					<div class="tipping-box"> 
						<ul>
							<li>?????????Point?????????????????????????????????????????????????????????</li>
							<li>?????????Point??????????????????1000P??????1000P?????????????????????????????????1,000 P ??? $1??? </li>
							<li>?????????????????????????????????????????????</li>
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