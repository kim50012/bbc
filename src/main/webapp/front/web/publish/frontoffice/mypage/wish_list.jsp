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
 	
	$('.pad-option').hide(); 
	$(".labox a.btn1").click(function(){
    	$('.pad-option').toggle();
    });
    $(".pad-option a.close").click(function(){
    	$('.pad-option').hide(); 
    }); 
	  
	/* 상품 옵션 */ 
	$("#option-search1").selectbox(); 
	$("#option-search2").selectbox(); 
   
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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><strong>关注商品</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					
					<h3><img src="/images/shop/cn/mypage/title_wish.gif" alt="关注商品" /><span><img src="/images/shop/cn/mypage/explain_wish.gif" alt="可以查看顾客所关注的商品。" /></span></h3>	
					
					<div class="table-listhtype">	 
						<div class="list wish-product">
							<table summary="주문가능 상품 테이블">
                    			<caption>주문가능 상품 테이블</caption>
								<colgroup>  
									<col width="46px" />  
									<col width="103px" /> 
									<col width="335px" /> 
									<col width="100px" />  
									<col width="74px" />  
									<col width="121px" />   
								</colgroup>
								<thead>
									<tr> 
										<th scope="row"><input type="checkbox" name="aaa" id="" /></th>   
										<th scope="row" colspan="2">商品名</th> 
										<th scope="row">销售价</th>  
										<th scope="row">状态</th> 
										<th scope="row">购物车/删除</th>    
									</tr>
								</thead>
								<tbody>  
									<tr>  
										<td><input type="checkbox" name="aaa" id="" /></td> 
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info">
												<p class="icon">
													<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
													<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
													<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
													<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
													<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
												</p>
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
												<p class="option">* 此商品有选项。</p>
											</div>
										</td>    
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约￥1,091,270)</span>
											</p>
										</td>
										<td class="buy"><span class="check-on">不可购买</span></td> 
										<td class="btn">
											<div class="labox">
												<a href="#" class="btn1"><img src="/images/shop/cn/mypage/btn_basket.gif" alt="购物车" /></a>
												<a href="#" class="btn2"><img src="/images/shop/cn/mypage/btn_dell.gif" alt="删除" /></a>
												<!-- 상품 옵션 --> 
												<div class="layer-changeover pad-option">
													<p class="tit"><span>更改选项</span><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/order/btn_close_layer.gif" alt="close" /></a></p>
													<div class="contents">
														<div class="layer-option">
															<p class="title"><span class="brand">兰蔻/LANCOME</a></span><span class="product">ULTRA FACIAL CREAM 125ML</span></p>
															<p class="option1"> 
																<span class="divide">옵션타이틀1 </span>  
																<select id="option-search1" title="검색범위 선택">
																	<option>선택하세요</option>
																	<option>핑크</option> 
																</select>
															</p>
															<p class="option2"> 
																<span class="divide">옵션타이틀12</span>  
																<select id="option-search2" title="검색범위 선택">
																	<option>선택하세요</option>
																	<option>핑크</option> 
																</select> 
															</p>						
															<div class="btn_wrap">
																<p class="center"><a href="#"><img src="/images/shop/cn/mypage/btn_cancel_la.gif" alt="取消" /></a>
																<a href="#" class="btnord"><img src="/images/shop/cn/mypage/btn_basket_la.gif" alt="购物车" /></a></p>
															</div>
														</div>
													</div> 
												</div>
												<!-- //상품 옵션 -->
											</div>
										</td>
									</tr>   
									<tr> 
										<td><input type="checkbox" name="aaa" id="" /></td> 
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info">   
												<p class="icon"><!-- 아이콘이 없을 경우 아이콘만 숨김
													<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
													<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
													<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
													<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
													<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" /> -->
												</p>
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div>
										</td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约￥1,091,270)</span>
											</p>
										</td>
										<td class="buy"><span class="check">正在销售</span></td>  
										<td class="btn">
											<div class="labox">
												<a href="#" class="btn1"><img src="/images/shop/cn/mypage/btn_basket.gif" alt="购物车" /></a>
												<a href="#" class="btn2"><img src="/images/shop/cn/mypage/btn_dell.gif" alt="删除" /></a>
											 </div>
										</td>
									</tr>   
									<tr>  
										<td><input type="checkbox" name="aaa" id="" /></td> 
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info">
												<p class="icon">
													<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
													<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
													<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
													<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
													<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
												</p>
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
												<p class="option">* 此商品有选项。</p>
											</div>
										</td>    
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约￥1,091,270)</span>
											</p>
										</td>
										<td class="buy"><span class="check-on">不可购买</span></td>  
										<td class="btn">
											<div class="labox">
												<a href="#" class="btn1"><img src="/images/shop/cn/mypage/btn_basket.gif" alt="购物车" /></a>
												<a href="#" class="btn2"><img src="/images/shop/cn/mypage/btn_dell.gif" alt="删除" /></a>
											</div>
										</td>
									</tr>   
									<tr> 
										<td><input type="checkbox" name="aaa" id="" /></td> 
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info"> 
												<p class="icon">
													<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
													<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
													<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
													<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
													<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
												</p>
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div>
										</td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约￥1,091,270)</span>
											</p>
										</td>
										<td class="buy"><span class="check">正在销售</span></td> 
										<td class="btn">
											<div class="labox">
												<a href="#" class="btn1"><img src="/images/shop/cn/mypage/btn_basket.gif" alt="购物车" /></a>
												<a href="#" class="btn2"><img src="/images/shop/cn/mypage/btn_dell.gif" alt="删除" /></a>
											</div>
										</td>
									</tr>     
									<tr> 
										<td><input type="checkbox" name="aaa" id="" /></td> 
										<td class="photo"><a href="#"><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품명" /></a></td>
										<td class="info">
											<div class="product-info"> 
												<p class="icon">
													<img src="/images/shop/cn/common/IconS01.gif" alt="打折" />
													<img src="/images/shop/cn/common/IconS02.gif" alt="BEST" />
													<img src="/images/shop/cn/common/IconS03.gif" alt="NEW" />
													<img src="/images/shop/cn/common/IconS04.gif" alt="赠品" />
													<img src="/images/shop/cn/common/IconS05.gif" alt="打折券" />
												</p>
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div>
										</td> 
										<td>
											<p class="price"> 
												<span class="us-currency">$663.2</span>
												<span class="nation-currency">(约￥1,091,270)</span>
											</p>
										</td>
										<td class="buy"><span class="check">正在销售</span></td>  
										<td class="btn">
											<div class="labox">
												<a href="#" class="btn1"><img src="/images/shop/cn/mypage/btn_basket.gif" alt="购物车" /></a>
												<a href="#" class="btn2"><img src="/images/shop/cn/mypage/btn_dell.gif" alt="删除" /></a>
											</div>
										</td>
									</tr>  
									<tr>
										<td colspan="6">关注商品中没有商品。</td>
									</tr>
								</tbody>  
							</table>
							<div class="tablebtn-bottom">
								<p class="left"><a href="#"><img src="/images/shop/cn/mypage/btn_in_basket.gif" alt="将所选商品加入购物车" /></a><a href="#"><img src="/images/shop/cn/mypage/btn_dell_product.gif" alt="删除所选商品" /></a></p>
							</div> 	
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