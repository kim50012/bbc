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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><strong>订购明细</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					
					<h3><img src="/images/shop/cn/mypage/title_orderlist.gif" alt="订购明细" /></h3>						
						 
					<div class="con-tab">	 
						<div class="tab-atype">
							<ul class="tab-menu"> 
								<li class="selected"><a href="#">按订单查看明细</a></li> 
								<li><a href="#">按出境日期查看明细</a></li>
							</ul>
						</div>
					</div>
					
					<div class="table-searchtype">
						<p class="info">可按订单查看订购/取消的处理现状。</p>
						
						<div class="order">
							<table summary="주문 내역 검색 테이블">
								<caption>주문 내역 검색 테이블</caption>
								<colgroup>  
									<col width="87px" /> 
									<col width="693px" />  
								</colgroup> 
								<tbody> 
									<tr>  
										<th><span>订购时间</span></th>
										<td>
											<p class="btn">
												<a href="#"><img src="/images/shop/cn/mypage/btn_sh1month.gif" alt="1个月" /></a>
												<a href="#"><img src="/images/shop/cn/mypage/btn_sh3month.gif" alt="3个月" /></a>
												<a href="#"><img src="/images/shop/cn/mypage/btn_sh6month.gif" alt="6个月" /></a>											
												<a href="#"><img src="/images/shop/cn/mypage/btn_sh1year.gif" alt="1年" /></a>
											</p>
											<p class="date"> 
												<input type="text" class="date term" title="출국일자를 입력하세요" /> 
												<span>~</span>
												<input type="text" class="date term" title="출국일자를 입력하세요" />
											</p>
										</td>
									</tr>   
									<tr>   
										<th><span>订购状态</span></th>
										<td>
											<div class="stateinfo">                                                         
												<input type="checkbox" class="orderStatCodes" value="01" name="orderStatCodes"><label>全部</label>                  
												<input type="checkbox" class="orderStatCodes" value="02" name="orderStatCodes"><label>等待订购</label>                  
												<input type="checkbox" class="orderStatCodes" value="03" name="orderStatCodes"><label>接受订购</label>
												<input type="checkbox" class="orderStatCodes" value="04" name="orderStatCodes"><label class="la01">正在处理订购</label>                
												<input type="checkbox" class="orderStatCodes" value="05" name="orderStatCodes"><label class="la01">等待运送</label>  
												<input type="checkbox" class="orderStatCodes" value="06" name="orderStatCodes"><label>运送中</label>  
												<input type="checkbox" class="orderStatCodes" value="07" name="orderStatCodes"><label>运送完毕</label>                  
												<input type="checkbox" class="orderStatCodes" value="08" name="orderStatCodes"><label>取货完毕</label>  
												<input type="checkbox" class="orderStatCodes" value="08" name="orderStatCodes"><label>未取货</label>  
												<input type="checkbox" class="orderStatCodes" value="08" name="orderStatCodes"><label>再运进</label> 										                
												<input type="checkbox" class="orderStatCodes" value="09" name="orderStatCodes"><label class="la01">接受取消</label>                  
												<input type="checkbox" class="orderStatCodes" value="10" name="orderStatCodes"><label class="la01">正在处理取消</label>                   
												<input type="checkbox" class="orderStatCodes" value="10" name="orderStatCodes"><label>取消完毕</label>   
											</div>   
										</td>
									</tr>
								</tbody>
							</table>  							            
						</div>
						<div class="btn_wrap">
							<p class="center"><a href="#"><img src="/images/shop/cn/mypage/btn_inquiry.gif" alt="查看" /></a></p>
						</div>
					</div>
					 
					<p class="stitle"><a href="#" class="btn"><img src="/images/shop/cn/mypage/btn_airinfo.gif" alt="取货处指南" /></a></p> 
					<div class="table-listhtype">  
						<div class="list list-product">
							<table summary="주문 내역 리스트">
                    			<caption>주문 내역 리스트</caption>
								<colgroup>   
									<col width="88px" /> 
									<col width="96px" /> 
									<col width="287px" />  
									<col width="123px" /> 
									<col width="85px" />  
									<col width="101px" />  
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">订购日</th> 
										<th scope="row">订单号码</th> 
										<th scope="row">商品名</th> 
										<th scope="row">付款金额</th>  
										<th scope="row">礼品</th>  
										<th scope="row">订购状态<a href="#"><img src="/images/shop/cn/mypage/btn_order_stateinfo.gif" alt="주문상태 안내" /></a></th>  
									</tr>
								</thead>
								<tbody> 
									<tr class="selected"> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>TISSOT WATCH</span></td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">等待订购</span>
										<a href="#"><img src="/images/shop/cn/mypage/btn_eticket_en.gif" alt="注册电子机票" /></span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约￥1,091,270)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受订购</span></td>
									</tr>  
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>TISSOT WATCH</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr> 
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>TISSOT WATCH</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受订购</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr>  
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>TISSOT WATCH</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr>   
									<tr> 
										<td><span class="fta">2012.08.29</span></td>
										<td><a href="#"><span class="ordernumber">6809314133505</span></a></td>
										<td class="orderproduct"><span>L`OREAL PARIS COSMETIC 외 2종</span></td>
										<td>
											<p class="price"> 
												<span class="us-currency">$395</span>
												<span class="nation-currency">(约￥453.12)</span>
											</p>
										</td>
										<td><a href="#"><img src="/images/shop/cn/mypage/btn_gift.gif" alt="申请礼品" /></td>
										<td class="state"><span class="check">接受取消</span></td>
									</tr> 
									<tr>
										<td colspan="6">没有订购明细。</td>
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