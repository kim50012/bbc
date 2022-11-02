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
						<a href="#">主页</a><span>&gt;</span><a href="#">我的页面</a><span>&gt;</span><a href="#">我的资讯</a><span>&gt;</span><strong>商品评价</strong>
					</div>
			 
					<%@include file="/publish/frontoffice/include/top_mypage.jsp"%><!-- //마이페이지 공통 -->
					 
					<h3><img src="/images/shop/cn/mypage/title_premiumreview.gif" alt="商品评价" /></h3>	
					 				 
					<div class="table-listhtype">	
						<p class="info">Premium商品评价共有 <strong>8</strong> 件。</p>
							 
						<div class="list info-product">
							<table summary="주문가능 상품 테이블">
                    			<caption>주문가능 상품 테이블</caption>
								<colgroup>   
									<col width="55px" /> 
									<col width="121px" /> 
									<col width="194px" />  
									<col width="170px" />  
									<col width="90px" />   
									<col width="90px" />  
									<col width="60px" />    
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">序号</th> 
										<th scope="row" colspan="2">商品名</th> 
										<th scope="row">题目</th>  
										<th scope="row">评分</th> 
										<th scope="row">发表日</th>    
										<th scope="row">浏览次数</th>
									</tr>
								</thead>
								<tbody>   
									<tr>  
										<td>8743</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>   
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>   
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
											<span class="check-on">(待认可)</span>
										</td>
										<td><span class="fta">999</span></td>
									</tr>    
									<tr>  
										<td>7</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
										</td>
										<td><span class="fta">999</span></td>
									</tr>   
									<tr>  
										<td>6</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
										</td>
										<td><span class="fta">999</span></td>
									</tr>   
									<tr>  
										<td>5</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
											<span class="check-on">(待认可)</span>
										</td>
										<td><span class="fta">999</span></td>
									</tr>   
									<tr>  
										<td>4</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
											<span class="check-on">(待认可)</span>
										</td>
										<td><span class="fta">999</span></td>
									</tr> 
									<tr>
										<td colspan="7">没有商品评价。</td>
									</tr>  
								</tbody>  
							</table>
						</div>
						<div class="pager">
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음으로" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
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
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막으로" /></a>
						</div>									
					</div>					 					
					 
					<div class="table-listhtype">	
						<p class="info">一般商品评价共有 <strong>8</strong> 件。</p>
							 
						<div class="list info-product">
							<table summary="주문가능 상품 테이블">
                    			<caption>주문가능 상품 테이블</caption>
								<colgroup>  
									<col width="55px" /> 
									<col width="121px" /> 
									<col width="240px" />  
									<col width="184px" />  
									<col width="90px" />   
									<col width="90px" />
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">序号</th> 
										<th scope="row" colspan="2">商品名</th> 
										<th scope="row">题目</th>  
										<th scope="row">评分</th> 
										<th scope="row">发表日</th>
									</tr>
								</thead>
								<tbody>   
									<tr>  
										<td>8</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>  
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>   
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
											<span class="check-on">(待认可)</span>
										</td>
									</tr>    
									<tr>  
										<td>7</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
										</td>
									</tr>
									<!-- 클릭하면 첫번째 <td> rowspan="2" 추가 -->
									<tr>  
										<td rowspan="2">6</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
										</td>
									</tr>
									<!-- 클릭하면 나오는 내용영역 -->
									<tr>
										<td colspan="5" class="review-box">
											<div class="con_box">
												<div class="review-tit">
													<p class="star-box">
														<span>价格
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점5" />
														</span>
														<span>设计
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점5" />
														</span>
														<span>品质
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
															<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
														</span>
														<span>满意度
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
															<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
															<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점3" />
															<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점4" />
															<img src="/images/shop/cn/product/detail/star_off.gif" alt="별점5" />
														</span>
													</p>
													<p class="mobile-txt">
														<img src="/images/shop/cn/mypage/ico_phone.gif" alt="핸드폰" />到手机版新世界免税店撰写
													</p>
												</div>
												<div  class="con">
													말이 필요없는 상품이에요. <br />
													림밤으로 사용하면서 또 색깔도 이쁘게 나와서 완전 대만족 입니다. <br />
													면세점 갈일있을때마다 구매해서 쓰고 있는데 벌써 몇통째 쓰는 건지 몰겠네요. <br />
													양이 팍팍 주는게 보여서 슬프지만 면세점에서 적립금 같은걸로 싸게 사면 되니까요~~
												</div>
												<p class="revise"><a href="#"><img src="/images/shop/cn/mypage/btn_revise.gif" alt="修改" /></a>
													<a href="#"><img src="/images/shop/cn/mypage/btn_delete_s.gif" alt="删除" /></a></p>
											</div>
										</td>
									</tr>
									<!-- //클릭하면 나오는 내용영역 끝 -->  
									<tr>  
										<td>5</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
											<span class="check-on">(待认可)</span>
										</td>
									</tr>   
									<tr>  
										<td>4</td>
										<td><img src="/images/shop/cn/order/temp_order_pro.gif" alt="상품" /></td>
										<td class="info tit-name"> 
											<div class="product-info"> 
												<p class="brand"><a href="#">[KIEHL`S]</a></p>  
												<p class="product"><a href="#">ULTRA FACIAL CREAM 125MLTAG HEUER CARRERA</a></p>
												<p class="product-num"><a href="#"><span>REF. NO :</span> PEANU-MD.F/97</a></p> 
											</div> 
										</td>  
										<td class="review">
											<p><span><a href="#">너무 좋아요</a></span></p>
										</td>
										<td class="star">
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점1" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점2" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점3" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점4" />
											<img src="/images/shop/cn/product/detail/star_on.gif" alt="별점5" />
										</td>
										<td class="date-box">
											<span class="fta">2013.05.02</span>
											<span class="check-on">(待认可)</span>
										</td>
									</tr>  
									<tr>
										<td colspan="7">没有商品评价。</td>
									</tr>   
								</tbody>  
							</table>
						</div>
						<div class="pager">
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음으로" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
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
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막으로" /></a>
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