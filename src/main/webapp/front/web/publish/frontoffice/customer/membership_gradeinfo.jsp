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
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><a href="#">会员指南</a><span>&gt;</span><strong>网上会员优惠</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					
					<h3><img src="/images/shop/cn/customer/title_membership.gif" alt="网上会员优惠" /></h3>
					
					<div class="member-conbox"> 					  
						<div class="gradeinfo">
							<table summary="网上会员优惠">
                    			<caption>网上会员优惠</caption>
								<colgroup>  
									<col width="145px" /> 
									<col width="166px" /> 
									<col width="176px" /> 
									<col width="156px" /> 
									<col width="137px" />   
								</colgroup> 
								<thead>
									<th scope="row"><img src="/images/shop/cn/customer/membership_title01.gif" alt="会员" /></th>
									<th scope="row"><img src="/images/shop/cn/customer/membership_title02.gif" alt="资格条件" /></th>
									<th scope="row"><img src="/images/shop/cn/customer/membership_title03.gif" alt="维持等级" /></th>
									<th scope="row"><img src="/images/shop/cn/customer/membership_title04.gif" alt="折扣率" /></th>
									<th scope="row"><img src="/images/shop/cn/customer/membership_title05.gif" alt="累积" /></th>
								</thead>
								<tbody> 
									<tr> 
										<th scope="col"><img src="//image.ssgdfs.com/images/shop/common/member/member_grade05.gif" alt="Family" />
										<span><img src="/images/shop/cn/common/member/member_gradeinfo05.gif" alt="Family" /></span></th>
										<td>新注册新世界免税店的会员</td>    
										<td></td>    
										<td>5~10%<span>(按品牌适用)</span></td>     
										<td>购买时 2%<span>(按品牌适用)</span></td>    
									</tr>   
									<tr> 
										<th scope="col"><img src="//image.ssgdfs.com/images/shop/common/member/member_grade04.gif" alt="S.Club" />
										<span><img src="/images/shop/cn/common/member/member_gradeinfo04.gif" alt="S.Club" /></span></th>
										<td>最近2年内购买<br /> 
										$<strong>300</strong> 以上</td>     
										<td>最近2年有购买记录<br />
										<span>(未达到时，适用资格条件)</span></td>   
										<td>5~15%<span>(按品牌适用)</span></td> 
										<td>购买时 2%<span>(按品牌适用)</span></td>    
									</tr>    
									<tr> 
										<th scope="col"><img src="//image.ssgdfs.com/images/shop/common/member/member_grade03.gif" alt="S.Club VIP" />
										<span><img src="/images/shop/cn/common/member/member_gradeinfo03.gif" alt="S.Club VIP" /></span></th>
										<td>最近2年内购买<br /> 
										$<strong>500</strong> 以上</td>     
										<td>最近2年内购买 $<strong>300</strong> 以上<span>(未达到时，适用资格条件)</span></td>   
										<td>5~15%<span>(按品牌适用)</span></td> 
										<td>购买时 2%<span>(按品牌适用)</span></td>    
									</tr>    
									<tr> 
										<th scope="col"><img src="//image.ssgdfs.com/images/shop/common/member/member_grade02.gif" alt="Honours" />
										<span><img src="/images/shop/cn/common/member/member_gradeinfo02.gif" alt="Honours" /></span></th>
										<td>最近2年内购买<br /> 
										$<strong>1,000</strong> 以上</td>     
										<td>最近2年内购买 $<strong>500</strong> 以上<span>(未达到时，适用资格条件)</span></td>  
										<td>5~20%<span>(按品牌适用)</span></td> 
										<td>购买时 2%<span>(按品牌适用)</span></td>     
									</tr>    
									<tr> 
										<th scope="col"><img src="//image.ssgdfs.com/images/shop/common/member/member_grade01.gif" alt="Honours VIP" />
										<span><img src="/images/shop/cn/common/member/member_gradeinfo01.gif" alt="Honours VIP" /></span></th>
										<td>最近2年内购买<br /> 
										$<strong>3,000</strong> 以上</td>     
										<td>最近2年内购买 $<strong>1,000</strong> 以上<span>(未达到时，适用资格条件)</span></td>   
										<td>5~20%<span>(按品牌适用)</span></td> 
										<td>购买时 2%<span>(按品牌适用)</span></td>       
									</tr>  
								</tbody>
							</table>
						</div>
						 
						<div class="wbox"> 
							<p class="stitle"><img src="/images/shop/cn/customer/stitle_membership03.gif" alt="敬请阅读!" /></p> 
							<p class="txt-tit">
								1. 等级调整于购买后次日适用。<br />
								2. 会员等级要根据最近2年内的购买业绩而定，且维持2年。<br />
								3. 网上以取货完成时间，实体店以商品购买时间为准。<br />
								4. 各等级优惠今后可能有变动。<br />
								5. 各等级的折扣率将根据商品、品牌，有可能不被适用。
							</p>  	
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