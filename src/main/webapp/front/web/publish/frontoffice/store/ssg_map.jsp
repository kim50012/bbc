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
			<%@include file="/publish/frontoffice/include/sidebar_store01.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">新世界免税店</a><span>&gt;</span><strong>前往路线</strong>
				</div>  
				<div class="location-title visual01">
					<h3><img src="/images/shop/cn/store/h3_title01.gif" alt="company introduce" /></h3>
					<p><img src="/images/shop/cn/store/h3_comment01.gif" alt="为您介绍新世界免税店." /></p>
				</div> 	
				 
				<h4><img src="/images/shop/cn/store/title_map.gif" alt="前往路线" /></h4> 
				<div class="map-box">
					<p><img src="/images/shop/cn/store/img_map.gif" alt="" /></p>
					<p class="map-txt">地址: 釜山广域市海云台区海云台海边路296/联系方式 : 新世界免税店客服中心  1577-0161 FAX051-749-1266</p>
				</div>
				<div class="map-info">
					<div class="table-listhtype">	 
						<div class="list">
							<table summary="찾아오시는 길 테이블">
								<caption>찾아오시는 길 테이블</caption>
								<colgroup>  
									<col width="182px" /> 
									<col width="466px" />  
									<col width="130px" />
								</colgroup>
								<thead>
									<tr>  
										<th scope="row">前往海云台的路线</th>
										<th scope="row">使用指南</th>
										<th scope="row">所需时间</th>
									</tr>
								</thead>
								<tbody>   
									<tr>  
										<td rowspan="3" class="first-child bor-bot"><span>金海国际机场</span>&rarr;海云台</td>
										<td><p>大巴 (307号)</p></td>
										<td>1小时 30分</td>
									</tr>
									<tr>
										<td><p>机场巴士(乘坐海云台方向 的2号线，在乐园酒店下车）</p></td>
										<td>50分</td>
									</tr>   
									<tr class="bor-bot">
										<td><p>普通(模范)出租车</p></td>
										<td>50分</td>
									</tr>   
									<tr>  
										<td rowspan="4" class="first-child bor-bot"><span>札嘎其 (南浦洞)</span>&rarr;海云台</td>
										<td><p>普通公交车 (139号)</p></td>
										<td>1小时 20分</td>
									</tr>   
									<tr>
										<td><p>大巴 (1003号)</p></td>
										<td>1小时</td>
									</tr>   
									<tr>
										<td><p><span>地铁</span>札嘎其站或者南浦洞站(老圃行1号线) &rarr; 西面 (转乘长神行 2号线)) &rarr; <br />海云台站 (2号线)</p></td>
										<td>45分</td>
									</tr>   
									<tr class="bor-bot">
										<td><p><span>地铁</span>札嘎其站或者南浦洞站(老圃行 1号线) &rarr; 莲山洞站 (转乘水营行3号线) &rarr; 
										水营站(转乘长神行2号线) &rarr; 海云台站 (2号线)</p></td>
										<td>45分</td>
									</tr>   
									<tr>  
										<td rowspan="4" class="first-child bor-bot"><span>釜山站(KTX)</span>&rarr;海云台</td>
										<td><p>普通公交车 （9139号)</p></td>
										<td>1小时 10分</td>
									</tr>   
									<tr>
										<td><p>大巴(1003号)</p></td>
										<td>50分</td>
									</tr>   
									<tr>
										<td><p><span>地铁</span>釜山站 (老圃行 1号线) &rarr; 西面 (转乘长神行 2号线) &rarr;海云台站 (2号线)</p></td>
										<td>40分</td>
									</tr>   
									<tr class="bor-bot">
										<td><p><span>地铁</span>釜山站 (老圃行 1号线) &rarr; 莲新洞站 (转乘水营行3号线) &rarr; <br />
										水营站 (转乘长神行 2号线) &rarr; 海云台站 (2号线)</p></td>
										<td>36分	</td>
									</tr>   
									<tr class="bor-bot">  
										<td class="first-child"><span>釜山国际旅客码头</span>&rarr;海云台</td>
										<td><p>普通出租车</p></td>
										<td>40分</td>
									</tr>   
									<tr>  
										<td rowspan="6" class="first-child bor-bot"><span>西面(乐天百货)</span>&rarr;海云台</td>
										<td><p>普通公交车 (141号)</p></td>
										<td>40分</td>
									</tr>   
									<tr>
										<td><p>普通公交车 (63号)</p></td>
										<td>50分</td>
									</tr>   
									<tr>
										<td><p>普通公交车 (63号)</p></td>
										<td>50分</td>
									</tr>    
									<tr>
										<td><p>普通出租车</p></td>
										<td>30~40分</td>
									</tr>   
									<tr>
										<td><p><span>地铁</span>西面站 (长神行 2号线) &rarr; 海云台站 (2号线)</p></td>
										<td>30分</td>
									</tr>   
									<tr class="bor-bot">
										<td><p><span>地铁</span>西面站 (老圃行1号线) &rarr; 莲新洞站 (转乘水营行3号线) &rarr; 
										水营站 (转乘长神行2号线) &rarr; 海云台站(2号线))</p></td>
										<td>26分</td>
									</tr>   
									<tr>  
										<td class="first-child"><span>苌山</span>&rarr;海云台</td>
										<td><p>地铁 (湖浦行2号线) &rarr; 海云台站</p></td>
										<td>10分</td>
									</tr>
								</tbody>  
							</table> 
							<p class="txt-tipping">从海云台站坐地铁到新世界免税店（海云台海水浴场方面）需要5~8分钟</p>
						</div>
					</div><!-- //table-listhtype -->
				</div><!-- end map-info -->
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



