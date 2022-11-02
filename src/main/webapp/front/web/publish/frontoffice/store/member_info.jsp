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
<script type="text/javascript">
jQuery(function($){
	$('.auto-complete dd').jScrollPane({showArrows: true});
});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
			<div id="body">
			<%@include file="/publish/frontoffice/include/sidebar_store04.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">会员</a><span>&gt;</span><strong>会员指南</strong>
				</div> 
				<div class="location-title visual03">
					<h3><img src="/images/shop/cn/store/h3_title04.gif" alt="MEMBERSHIP" /></h3>
					<p><img src="/images/shop/cn/store/comment04.gif" alt="介绍新世界免税店会员" /></p>
				</div>				 
				<h4><img src="/images/shop/cn/store/title_memberinfo.gif" alt="会员指南" /><span><img src="/images/shop/cn/store/explain_memberinfo.gif" alt="会员等级标准以及优惠" /></span></h4>
				  
				<div class="table-listhtype">	 
					<div class="list memberinfo">
						<table summary="주문가능 상품 테이블">
							<caption>주문가능 상품 테이블</caption>
							<colgroup>  
								<col width="210px" /> 
								<col width="235px" />  
								<col width="235px" />  
								<col width="101px" />   
							</colgroup>
							<thead>
								<tr>  
									<th scope="row">等级</th> 
									<th scope="row">韩国人</th>  
									<th scope="row">外国人</th>  
									<th scope="row">折扣优惠</th>     
								</tr>
							</thead>
							<tbody>   
								<tr>  
									<td><img src="/images/shop/cn/store/img_membership01.gif" alt="银卡" /></td> 
									<td class="info">    
										<p><strong>注册会员时发放</strong></p>  
									</td>   
									<td class="info">    
										<p><strong>购买$1,000以上的 顾客</strong></p>  
										<p><span class="tow">1次出国购买金额达到$15,000 以上<br />
										升级为铂卡会员</span></p> 
									</td>     
									<td>5~10%</td>
								</tr>    
								<tr class="linetow"> 
									<td><img src="/images/shop/cn/store/img_membership02.gif" alt="金卡" /></td>  
									<td class="info">    
										<p><strong>3年内购买$3,000以上的顾客</strong></p> 
										<p class="txt">资格维持条件 :<br />
											升级后五年内购买金额达到 $5,000 以上的顾客</p> 
										<p><span>(未达到资格时 · 转换为银卡会员)</span></p> 
									</td>   
									<td class="info">    
										<p><strong>3年内或自发放银卡后5年内<br />
											购买金额达到$10,000 以上的顾客</strong></p> 
										<p class="txt">资格维持条件 · 升级后五年内<br />
											达到购买金额 $5,000 以上的顾客</p>
										<p><span>(未达到资格时 · 转换为银卡会员)</span></p>   
										<p><span class="tow">1次出国购买金额达到$15,000以上<br />
										升级为铂卡会员</span></p> 
									</td>     
									<td>5~15%</td>
								</tr>       
								<tr> 
									<td><img src="/images/shop/cn/store/img_membership03.gif" alt="铂卡" /></td>  
									<td class="info">    
										<p><strong>3年内购买 $10,000 以上的顾客</strong></p> 
										<p class="txt">资格维持条件  ·  <br />
											升级后2年内2购买$5,000 以上的顾客</p> 
										<p><span>(未达到资格时· 转换为金卡会员)</span></p> 
									</td>   
									<td class="info">    
										<p><strong>4年内购买金额达到$20,000 <br />
											以上的顾客</strong></p>
										<p class="txt">资格维持条件  · <br />
											升级后2年内购买$10,000 以上的顾客</p>
										<p><span>(未达到资格时· 转换为金卡会员)</span></p> 
									</td>     
									<td>5~20%</td>
								</tr>           
							</tbody>  
						</table> 
					</div> 	
					
					<div class="check-box"> 
						<ul>
							<li>部分品牌或商品不适用打折优惠。</li>
							<li>从2013年开始，Paradise免税店的外国人VIP会员等级将自动升级为新世界免税店的金卡会员，<br />
								外国人钻石卡会员的等级将自动升级为新世界免税店的铂卡会员。</li>
							<li>银卡会员/金卡会员的资格后维持5年， 铂卡员会员资格维持1年。</li> 
						</ul>
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



