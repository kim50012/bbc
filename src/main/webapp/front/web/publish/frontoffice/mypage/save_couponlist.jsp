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
 	
	$('.save-la').hide(); 
	$(".savemoney-box a.save-change01").click(function(){
    	$('.save-la').toggle();
    });
    $(".save-la a.close").click(function(){
    	$('.save-la').hide(); 
    }); 
	 
	 
	$('.detail-list').hide(); 
	$("td.check .checkbox a").click(function(){
    	$('.detail-list').toggle();
    });
    $(".detail-list a.close").click(function(){
    	$('.detail-list').hide(); 
    }); 
	
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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的购物优惠</a><span>&gt;</span><strong>积分</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					 
					<h3><img src="/images/shop/cn/mypage/title_savelist.gif" alt="积分" /><span><img src="/images/shop/cn/mypage/explain_savelist.gif" alt="购买商品、 参加活动可累积积分。积分可在订购付款时当现金使用。" /></span></h3>
					  
					<div class="savemoney-box">
						<div class="bg-box">
							<div class="my-save">
								<p class="info">
									<span class="con01"><span class="member-id">홍길동</span> 顾客 您可以使用的积分总额为</span> 
									<span class="total-save">$ 43,910</span> <span class="subml">(约 ￥10,075)</span>
									<!-- 오픈일 기준으로 이전 적립금 내역 있을경우 -->
									<span class="hslist">查看2013.09.01 <a href="#"><img src="/images/shop/cn/mypage/btn_breakdown.gif" alt="以前的积分" /></a></span> 
									<!-- //오픈일 기준으로 이전 적립금 내역 있을경우 -->
								</p>  
							</div>
							<!-- To-Be 시스템 오픈 이전에 환전한 내역이 있을 경우에만 노출 -->
							<div class="now-save">
								<span class="past">您有过去累积的 $积分<a href="#"><img src="/images/shop/cn/mypage/btn_breakdown2.gif" alt="查看$积分" /></a></span>
								<span class="hold">拥有金额 : <span>$2</span><a href="#" class="save-change01"><img src="/images/shop/cn/mypage/btn_savemoney_change.gif" alt="兑换积分" /></a></span>
							</div> 
							<!-- //To-Be 시스템 오픈 이전에 환전한 내역이 있을 경우에만 노출 -->
						</div>
					</div> 
					 
					<!-- 적립금 사용 시 상세보기 -->
					<div class="layer-changeoverbox detail-list">
						<div class="layer-changeover">
							<p class="tit"><span>积分详细内容</span><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="close" /></a></p>
							<div class="contents">
								<div class="layer-money">
									<div class="txt-box">
										<p class="txt-tipping">订购日期 : <span class="">2013.05.02 15:13:00</span></p>
										<p class="txt-tipping">订单号码 : <a href="#"><span>6809314123456</span></a></p>
										<p class="txt-tipping">订购商品 : <span>ULTRA RACIAL CREAM 125ML외 2개</span></p>
										<p class="txt-tipping">购买金额 : <span>$279,6 (约￥312,300)</span></p>
									</div>
									<table summary="적립금 상세내역">
										<caption>적립금 상세내역</caption>
										<colgroup>
											<col width="170px" />
											<col width="100px" />
											<col width="90px" />
										</colgroup>
										<thead>
											<tr>
												<th>积分内容</th>
												<th>积分有效期</th>
												<th>使用金额</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th><span>重装开业活动</span></td>
												<td>2013.10.01</td>
												<td>-5,000</td>
											</tr>
											<tr>
												<th><span>会员注册活动</span></td>
												<td>2013.10.01</td>
												<td>-15,000</td>
											</tr>
											<tr class="total-use">
												<th colspan="2"><span>合计</span></td>
												<td><span class="use-m">-20,000</span></td>
											</tr>
										</tbody>
									</table>
									<p class="layor-btn">
										<a href="#"><img src="/images/shop/cn/mypage/popup/btn_close.gif" alt="关闭" /></a>
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- //적립금 사용 시 상세보기 -->
					 
					<!-- 적립금 소멸 시 상세보기  -->
					<div class="layer-changeoverbox detail-list">
						<div class="layer-changeover">
							<p class="tit"><span>积分详细内容</span><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="close" /></a></p>
							<div class="contents">
								<div class="layer-money"> 
									<table summary="적립금 상세내역">
										<caption>적립금 상세내역</caption>
										<colgroup>
											<col width="150px" />
											<col width="90px" />
											<col width="120px" />
										</colgroup>
										<thead>
											<tr>
												<th>积分内容</th>
												<th>积分有效期</th>
												<th>使用(消失) 金额(\)</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th><span>重装开业活动</span></td>
												<td>2013.10.01</td>
												<td>-5,000</td>
											</tr> 
											<tr class="total-use">
												<th colspan="2"><span>合计</span></td>
												<td><span class="use-m">-20,000</span></td>
											</tr>
										</tbody>
									</table>
									<p class="layor-btn">
										<a href="#"><img src="/images/shop/cn/mypage/popup/btn_close.gif" alt="关闭" /></a>
									</p>
								</div>
							</div>
						</div>
					</div> 
					<!-- //적립금 소멸 시 상세보기 -->
					 
					<div class="table-listhtype point-table">
						<div class="list">
							<table summary="적립금 보유 내역">
								<caption>적립금 보유 내역</caption> 
								<colgroup>  
									<col width="75px" /> 
									<col width="70px" /> 
									<col width="105px" /> 
									<col width="250px" /> 
									<col width="95px" />
									<col width="95px" />  
									<col width="90px" />    
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">区分</th> 
										<th scope="row">积累日期</th> 
										<th scope="row">积分有效期</th> 
										<th scope="row">详细内容</th>
										<th scope="row">积分金额(\)</th> 
										<th scope="row">使用金额(\)</th>  
										<th scope="row">详细内容</th>       
									</tr>
								</thead> 
								<tbody>    
									<tr>  
										<td><span class="divide">消失</span></td> 
										<td><span class="fta">2013.01.02</span></td>  
										<td><span class="fta">2013.01.02</span></td> 
										<td class="subject"><span>유효기간 만료</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-5,000</span></td>
										<td class="check"> 
											<div class="checkbox">
												<a href="#"><img src="/images/shop/cn/mypage/btn_check.gif" alt="浏览" /></a>
											</div>
										</td>
									</tr>
									<tr>  
										<td><span class="divide">使用</span></td> 
										<td><span class="fta">2013.01.02</span></td>  
										<td><span class="fta">2013.01.02</span></td>  
										<td class="subject"><span class="orderno">주문번호 6809314123456</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-10</span></td>
										<td class="check"> 
											<div class="checkbox">
												<a href="#"><img src="/images/shop/cn/mypage/btn_check.gif" alt="浏览" /></a> 
											</div>
										</td>
									</tr>
									<tr>  
										<td><span class="divide">使用</span></td> 
										<td><span class="fta">2013.01.02</span></td>  
										<td><span class="fta">2013.01.02</span></td>  
										<td class="subject"><span>출국정보 등록 적립금 5,000원 증정</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
										<td class="check"> 
											<div class="checkbox"> 
											</div>
										</td>
									</tr>
									<tr>   
										<td><span class="divide">使用</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>   
										<td class="subject"><span>출석체크 5,000원 증정</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
										<td class="check"> 
											<div class="checkbox"> 
											</div>
										</td>
									</tr>
									<tr>   
										<td><span class="divide">消失</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>   
										<td class="subject"><span class="orderno">주문번호 6809314123456</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-1,000</span></td>
										<td class="check"> 
											<div class="checkbox">
												<a href="#"><img src="/images/shop/cn/mypage/btn_check.gif" alt="浏览" /></a> 
											</div>
										</td>
									</tr>
									<tr>  
										<td><span class="divide">消失</span></td> 
										<td><span class="fta">2013.01.02</span></td> 
										<td><span class="fta">2013.01.02</span></td>   
										<td class="subject"><span>어린이날 기념 적립금 5,000원 증정</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
										<td class="check"> 
											<div class="checkbox"> 
											</div>
										</td>
									</tr>
									<tr>   
										<td><span class="divide">使用</span></td> 
										<td><span class="fta">2013.01.02</span></td>  
										<td><span class="fta">2013.01.02</span></td>  
										<td class="subject"><span>출석체크 5,000원 증정</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
										<td class="check"> 
											<div class="checkbox">
												<a href="#"><img src="/images/shop/cn/mypage/btn_check.gif" alt="浏览" /></a> 
											</div>
										</td>
									</tr>   
									<tr>  
										<td><span class="divide">消失</span></td> 
										<td><span class="fta">2013.01.02</span></td>
										<td><span class="fta">2013.01.02</span></td>    
										<td class="subject"><span>유효기간 만료</span></td> 
										<td><span class="point2">-</span></td>
										<td><span class="point1">-5,000</span></td>
										<td>
											<a href="#"><img src="/images/shop/cn/mypage/btn_check.gif" alt="浏览" /></a>
										</td>
									</tr>
									<tr>  
										<td><span class="divide">使用</span></td> 
										<td><span class="fta">2013.01.02</span></td>  
										<td><span class="fta">2013.01.02</span></td>  
										<td class="subject"><span>어린이날 기념 적립금 5,000원 증정</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
										<td class="check"> 
											<div class="checkbox"> 
											</div>
										</td>
									</tr>
									<tr>  
										<td><span class="divide">使用</span></td> 
										<td><span class="fta">2013.01.02</span></td>  
										<td><span class="fta">2013.01.02</span></td>  
										<td class="subject"><span>출석체크 5,000원 증정</span></td> 
										<td><span class="point2">5,000</span></td>
										<td><span class="point1">-</span></td>
										<td class="check"> 
											<div class="checkbox">
												<a href="#"><img src="/images/shop/cn/mypage/btn_check.gif" alt="浏览" /></a>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="7">没有积分内容。</td>
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
					  
					<p class="stitle"><img src="/images/shop/cn/mypage/stitle_save_useinfo.gif" alt="积分使用指南" /></p>	
					<div class="tipping-box"> 
						<ul>  
							<li>积分有效期因积分种类而异，请正确确认各个积分的有效期。</li>
							<li>有效期满后，积分将自动消失而不会延期。</li> 
							<li>过去拥有$积分的顾客可以兑换为积分后使用。</li>
							<li>详细内容可在 <span>客服中心 &gt; 会员指南 &gt; 积分</span>确认。</li> 
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