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
<script language="javascript" type="text/javascript"> 
//<![CDATA[
jQuery(function($){
 
	 
	 
}); 
//]]>
</script> 
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
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><a href="#">购物指南</a><span>&gt;</span><strong>新世界免税店使用指南</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					
					  
					<h3><img src="/images/shop/cn/customer/title_Internetinfo.gif" alt="新世界免税店使用指南" /></h3>						
						 
					<div class="guide-conbox">
					
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_guide01_1.gif" alt="新世界免税店仅限于国外旅游的顾客购买商品。 (国内旅游时不可购买)" /></p>
						<div class="hbox01">
							<div class="con01">
								<p class="stitle"><img src="/images/shop/cn/customer/stitle_guide01_11.gif" alt="访问免税店卖场" /></p>
								<p class="txt-tit">
									新世界免税店全年无休运营。<br /> 
									必须由出境者本人携带护照（可带复印件）访问免税店。<br /> 
									记住出境日期后访问免税店，可购买商品。<br /> 
									若离出境日期有30日以上，则需携带电子机票或预约单。
								</p>
							</div>
							<div class="con02">
								<p class="stitle"><img src="/images/shop/cn/customer/stitle_guide01_12.gif" alt="使用网上免税店" /></p>
								<p class="txt-tit">   
									新世界免税店可24小时购买商品，购买时只有正确填写顾客的护照信息和出境信息，<br />
									才能领取商品。
								</p>
							</div>								
						</div>
						 
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_guide01_2.gif" alt="各出境地点的可订购时间" /></p> 
						<div class="airtime">
							<table summary="各出境地点的可订购时间">
                    			<caption>各出境地点的可订购时间</caption>
								<colgroup>  
									<col width="225px" /> 
									<col width="235px" /> 
									<col width="320px" />    
								</colgroup> 
								<tbody> 
									<tr> 
										<th rowspan="2"><span>从仁川国际机场出境时</span></th>
										<td><span>23时以后出境</span></td>  
										<td><span>截止至10时为止</span></td>   
									</tr>   
									<tr>  
										<td><span>07时以后出境</span></td>  
										<td><span>截止至前一天18时为止</span></td>   
									</tr>   
									<tr> 
										<th rowspan="2"><span>从金浦/大邱机场出境时</span></th>
										<td><span>08时以前出境</span></td>  
										<td><span>截止至前二日18时为止</span></td>   
									</tr>    
									<tr>  
										<td><span>08时以后出境</span></td>  
										<td><span>截止至前一天 18时为止</span></td>   
									</tr>  
									<tr> 
										<th rowspan="7"><span>从金海机场/釜山港出境时</span></th>
										<td><span>07时以后 ，12时以前出境</span></td>  
										<td><span>截止至前一天18时为止</span></td>   
									</tr>     
									<tr>  
										<td><span>13时以前出境</span></td>  
										<td><span>截止至09时为止</span></td>   
									</tr>     
									<tr>  
										<td><span>14时以前出境</span></td>  
										<td><span>截止至10时为止</span></td>   
									</tr>     
									<tr>  
										<td><span>15时以前出境</span></td>  
										<td><span>截止至11时为止</span></td>   
									</tr>     
									<tr>  
										<td><span>16时以前出境</span></td>  
										<td><span>截止至12时为止</span></td>   
									</tr>     
									<tr>  
										<td><span>17时以前出境</span></td>  
										<td><span>截止至13时为止</span></td>   
									</tr>     
									<tr>  
										<td><span>17时以前出境</span></td>  
										<td><span>截止至14时为止</span></td>   
									</tr> 
								</tbody>
							</table>
						</div>
						 
						<p class="mtitle"><img src="/images/shop/cn/customer/stitle_guide01_3.gif" alt="구매한도" /> <a href="#" class="btn"><img src="/images/shop/cn/customer/btn_guide01.gif" alt="详细查看携带液体类、凝胶类到机内的规" /></a></p>
						<div class="wbox01"> 
							<ul class="txt-tipping">
								<li>使用网上免税店购物时，液体类和凝胶类商品装入安全防揭透明加封袋并贴好收据后送达至取货处，因此可以购买液体类和凝胶类商品。</li>
								<li>在韩国转机或经由时，限制购买液体类和凝胶类商品，望顾客敬请留意。</li>
								<li>回国时，请托运限制携带机内的商品。</li>
							</ul>		
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