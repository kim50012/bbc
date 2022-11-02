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
					<a href="#">主页</a><span>&gt;</span><a href="#">使用指南 </a><span>&gt;</span><strong>顾客便利设施</strong>
				</div>  
				<div class="location-title visual05">
					<h3><img src="/images/shop/cn/store/h3_title05.gif" alt="information" /></h3>
					<p><img src="/images/shop/cn/store/comment03.gif" alt="请在新世界免税店尽享购物之快乐！ 我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				 
				<h4><img src="/images/shop/cn/store/title_customer_service.gif" alt="顾客便利设施" /></h4> 
				<div class="shopping-info sho-customer">
					<p class="stitle"><img src="/images/shop/cn/store/stitle_parking.gif" alt="代客停车服务" /></p>
					<div class="hbox01">
						<p class="n-txt"><span class="no">1.</span> 在新世界免税店购物的会员及非会员顾客可以在本店停车场（地上、地下）以及乐园酒店的新馆、本馆停车。<br />
							停车时出示购物发票，可免费停车3小时，超过3小时将按照超过的时间收取费用，望各位顾客敬请谅解。</p>
						<p class="n-txt"><span class="no">2.</span> 对于为购物以外的咨询、售后服务而访问本店的顾客，我们将在咨询台免费提供1小时的停车券。</p>
					</div>
					
					<p class="mtitle"><img src="/images/shop/cn/store/stitle_parking_service.gif" alt="代客停车服务" /></p>
					<div class="tip-box first-child">
						<div class="tipping-box bg-parking">
							<p class="txt">为了提供更加真诚的服务，我们将有关代客停车服务做如下介绍，希望各位顾客能够舒适地购物。<br />
							来访本店时，在车辆上面贴有给新世界免税店优秀会员的贴纸，可享受代客停车服务。</p>
							<p class="txt-tipping">负责部门(促销部) : <span>051-749-1277~9</span></p>
							<p class="txt-tipping">咨询台 : <span>051-749-1287~9</span></p>
						</div>
					</div>
					
					<div class="tip-box">
						<div class="tipping-box bg-cafe">
							<p class="mtitle"><img src="/images/shop/cn/store/stitle_cafe.gif" alt="自助餐丁" /></p>
							<p class="txt-tipping">是为顾客设计的“敞开的休息空间”。</p>
							<p class="txt-tipping">不论您是否购买饮料，都可以自由自在地使用自助餐丁，并且在3楼休息厅可眺望海云台的大海。</p>
							<p class="txt-tipping">饮料： 备有咖啡类、菊花茶、新鲜果汁与各种季节饮料。</p>
							<p class="txt-tipping">自助餐厅 : <span>051-749-1465</span></p>
						</div>
					</div>
					<div class="tip-box">
						<div class="tipping-box bg-baby">
							<p class="mtitle"><img src="/images/shop/cn/store/stitle_baby_carriage.gif" alt="借贷婴儿车" /></p>
							<p class="txt-tipping">为了给顾客提供更为方便的购物环境，我们将免费为顾客借贷婴儿车。需要的顾客请咨询附近的柜台。</p>
						</div>
					</div>
					<div class="tip-box">
						<p class="mtitle"><img src="/images/shop/cn/store/stitle_bus.gif" alt="班车运行指南(外国人专用)" /></p>
						<p class="stitle">- 西面路线</p>
						<div class="table-listhtype">	 
							<div class="list">
								<table summary="서면 노선 테이블">
									<caption>서면 노선 테이블</caption>
									<colgroup>  
										<col width="255px" /> 
										<col width="130px" />  
										<col width="130px" />  
										<col width="130px" />  
										<col width="130px" /> 
									</colgroup>
									<thead>
										<tr>  
											<th scope="row">运行路线</th>
											<th scope="row">第一班</th>
											<th scope="row">第二班</th>
											<th scope="row">第三班</th>
											<th scope="row">第四班</th>
										</tr>
									</thead>
									<tbody>   
										<tr>  
											<td>东横INN酒店(西面店)</td>
											<td>08:50</td>
											<td>11:10</td>
											<td>14:10</td>
											<td>16:30</td>
										</tr>    
										<tr>  
											<td>釜山乐天酒店</td>
											<td>09:00</td>
											<td>11:20</td>
											<td>14:20</td>
											<td>16:40</td>
										</tr>   
										<tr>  
											<td>国际酒店</td>
											<td>09:10</td>
											<td>11:30</td>
											<td>14:30</td>
											<td>16:50</td>
										</tr>   
										<tr>  
											<td>釜山威斯汀朝鲜酒店</td>
											<td>09:40</td>
											<td>12:00</td>
											<td>15:10</td>
											<td>17:30</td>
										</tr>   
										<tr>  
											<td>到达新世界免税店</td>
											<td>10:00</td>
											<td>12:20</td>
											<td>15:20</td>
											<td>17:40</td>
										</tr>   
										<tr>  
											<td>从新世界免税店出发</td>
											<td>10:20</td>
											<td>13:20</td>
											<td>15:40</td>
											<td></td>
										</tr>
									</tbody>  
								</table> 
							</div>
						</div><!-- //table-listhtype -->
						<p class="stitle">- 中央洞路线</p>
						<div class="table-listhtype">	 
							<div class="list">
								<table summary="중앙동 노선 테이블">
									<caption>중앙동 노선 테이블</caption>
									<colgroup>  
										<col width="255px" /> 
										<col width="130px" />  
										<col width="130px" />  
										<col width="130px" />  
										<col width="130px" /> 
									</colgroup>
									<thead>
										<tr>  
											<th scope="row">运行路线</th>
											<th scope="row">第一班</th>
											<th scope="row">第二班</th>
											<th scope="row">第三班</th>
											<th scope="row">第四班</th>
										</tr>
									</thead>
									<tbody>   
										<tr>  
											<td>东横INN酒店(中央洞店)</td>
											<td>08:30</td>
											<td>11:00</td>
											<td>14:00</td>
											<td>16:30</td>
										</tr>    
										<tr>  
											<td>釜山酒店</td>
											<td>08:40</td>
											<td>11:10</td>
											<td>14:10</td>
											<td>16:40</td>
										</tr>   
										<tr>  
											<td>东横INN酒店(釜山站店)</td>
											<td>08:50</td>
											<td>11:20</td>
											<td>14:20</td>
											<td>16:50</td>
										</tr>   
										<tr>  
											<td>釜山威斯汀朝鲜酒店</td>
											<td>09:30</td>
											<td>11:50</td>
											<td>15:00</td>
											<td>16:50</td>
										</tr>   
										<tr>  
											<td>到达新世界免税店</td>
											<td>09:40</td>
											<td>12:10</td>
											<td>15:10</td>
											<td>17:40</td>
										</tr>   
										<tr>  
											<td>从新世界免税店出发</td>
											<td>10:00</td>
											<td>13:00</td>
											<td>15:30</td>
											<td></td>
										</tr>
									</tbody>  
								</table> 
							</div>
						</div><!-- //table-listhtype -->
						<p class="stitle">- 해운대 노선</p>
						<div class="table-listhtype">	 
							<div class="list">
								<table summary="중앙동 노선 테이블">
									<caption>중앙동 노선 테이블</caption>
									<colgroup>  
										<col width="255px" /> 
										<col width="75px" />  
										<col width="75px" />  
										<col width="75px" />  
										<col width="75px" />  
										<col width="75px" />  
										<col width="75px" />  
										<col width="75px" />  
									</colgroup>
									<thead>
										<tr>  
											<th scope="row">运行路线</th>
											<th scope="row">第一班</th>
											<th scope="row">第二班</th>
											<th scope="row">第三班</th>
											<th scope="row">第四班</th>
											<th scope="row">第五班</th>
											<th scope="row">第六班</th>
											<th scope="row">第七班</th>
										</tr>
									</thead>
									<tbody>   
										<tr>  
											<td>신세계면세점 출발</td>
											<td>10:30</td>
											<td>11:30</td>
											<td>13:30</td>
											<td>14:30</td>
											<td>15:30</td>
											<td>16:30</td>
											<td>17:30</td>
										</tr>   
										<tr>  
											<td>달맞이</td>
											<td>10:40</td>
											<td>11:40</td>
											<td>11:40</td>
											<td>14:40</td>
											<td>15:40</td>
											<td>16:40</td>
											<td>17:40</td>
										</tr>      
										<tr>  
											<td>이마트(해운대점)</td>
											<td>10:50</td>
											<td>11:50</td>
											<td>13:50</td>
											<td>14:50</td>
											<td>15:50</td>
											<td>16:50</td>
											<td>17:50</td>
										</tr>   
										<tr>  
											<td>해운대시장</td>
											<td>11:00</td>
											<td>12:00</td>
											<td>14:00</td>
											<td>15:00</td>
											<td>16:00</td>
											<td>17:00</td>
											<td>18:00</td>
										</tr>      
										<tr>  
											<td>신세계 Centum City</td>
											<td>11:15</td>
											<td>12:15</td>
											<td>14:15</td>
											<td>15:15</td>
											<td>16:15</td>
											<td>17:15</td>
											<td>18:15</td>
										</tr>      
										<tr>  
											<td>조선호텔(Nurimaru)</td>
											<td>11:20</td>
											<td>12:20</td>
											<td>14:20</td>
											<td>15:20</td>
											<td>16:20</td>
											<td>17:20</td>
											<td>18:20</td>
										</tr>      
										<tr>  
											<td>신세계면세점 도착</td>
											<td>11:25</td>
											<td>12:25</td>
											<td>14:25</td>
											<td>15:25</td>
											<td>16:25</td>
											<td>17:25</td>
											<td>18:25</td>
										</tr>    
									</tbody>  
								</table> 
							</div>
						</div>
					</div>
				</div><!-- end shopping-info -->
				
			</div><!-- end contents -->
		</div><!-- end body -->
		<%@include file="/publish/frontoffice/include/foot_store.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>



