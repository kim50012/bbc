<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/search.css" rel="stylesheet" type="text/css" />
<link href="/css/product_list.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.slider.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript">
jQuery(function($){
	$(".search-select").selectbox();
	$('.word-set dl dd').jScrollPane({showArrows: true});

	$(".price-slider").slider({
			range: true,
			min: 0,
			max: 1600,
			orientation: "horizontal",
			value: 100,
			values: [ 0, 1600 ],
			slide: function( event, ui ) {
				 $(".ui-slider-handle" ).eq(0).find("span.range-text").text( + ui.values[ 0 ]);
				 $(".ui-slider-handle" ).eq(1).find("span.range-text").text( + ui.values[ 1 ]);
				 $(".max").val("$"+ui.values[ 1 ]);
				 $(".min").val("$"+ui.values[ 0 ]);
			}
		});
		$(".ui-slider-handle" ).eq(0).find("span.range-text").text($(".price-slider" ).slider( "values", 0 ));
		$(".ui-slider-handle" ).eq(1).find("span.range-text").text( $(".price-slider" ).slider( "values", 1 ));
		$(".max").val($(".price-slider" ).slider( "values", 1 ));
		$(".min").val($(".price-slider" ).slider( "values", 0 ));


		$(".qna-board tr td a").click(function(){
			$(".qna-board tr.answer").children().hide();
			question = $(this).parent().parent();
			question.next().children().show();
			return false;
		});

		$(".represent-list").hide();
		$(".represent-list").eq(0).show();
		$(".represent-navi ul li a").click(function(){
			$(".represent-list").hide();
			$(".represent-navi ul li").attr("class" , "");
			$(this).parent().attr("class" , "selected");
			$($(this).attr("href")).show();
			return false;
		});

});
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">
			<div class="page-sublocation ">
				<a href="#">홈으로</a><span>&gt;</span><strong>통합검색</strong>
			</div><!-- end page-sublocation -->
			<div class="result">
				<div class="result-tab">
					<ul>
						<li class="selected">
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab01_on.gif" alt="综合搜索" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab02_off.gif" alt="品牌" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab03_off.gif" alt="企划展" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab04_off.gif" alt="商品评价" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab05_off.gif" alt="Q&amp;A" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab06_off.gif" alt="FAQ" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab07_off.gif" alt="公告事项" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
					</ul>
				</div><!-- end result-tab -->
				<div class="simple-result">
					<div class="word-cnt">
						<p class="cnt"><span>搜索 000</span> 共找到 <span>900</span> 件相关内容</p>
						<dl>
							<dt>相关检索词</dt>
							<dd>
								<ul>
									<li class="first-child"><a href="#">안경</a></li>
									<li><a href="#">남성화장품</a></li>
									<li><a href="#">브랜드식품</a></li>
									<li><a href="#">크리니크</a></li>
									<li><a href="#">할인쿠폰</a></li>
								</ul>
							</dd>
						</dl>
					</div><!-- end word-cnt -->
					
				</div><!-- end simple-result -->
				<div class="search-form">
					<fieldset>
						<legend>통합검색</legend>
						<div class="input-set">
							<div class="select-zone">
								<input type="radio" id="word-in" />
								<label for="word-in">包含词汇</label>
								<input type="radio" id="word-out" />
								<label for="word-out">排除词汇</label>
							</div><!-- end select-zone -->
							<select class="search-select">
								<option>통합검색</option>
							</select>
							<input type="text" title="검색어 입력" />
							<input type="image" src="/images/shop/cn/search/btn_total_search.gif" alt="搜索" />
						</div><!-- end input-set -->
						<div class="keyword">
							<dl>
								<dt><img src="/images/shop/cn/search/title_popular.gif" alt="热门检索词" /></dt>
								<dd>
									<ul>
										<li><a href="#">안경</a></li>
										<li><a href="#">남성화장품</a></li>
										<li><a href="#">브랜드식품</a></li>
										<li><a href="#">크리니크</a></li>
										<li><a href="#">할인쿠폰</a></li>
									</ul>
								</dd>
							</dl>
						</div><!-- end keyword -->
						<div class="word-select">
							<dl class="inclusion">
								<dt>包含词汇</dt>
								<dd>
									<ul>
										<li>여성<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
										<li>여성화장품<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
									</ul>
								</dd>
							</dl>
							<dl class="transport">
								<dt>排除词汇</dt>
								<dd>
									<ul>
										<li>남성<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
										<li>남성화장품<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
									</ul>
								</dd>
							</dl>
						</div><!-- end word-select -->
					</fieldset>
				</div><!-- end search-form -->
				<p class="title-line">推荐商品</p>
				<div class="list-basic recommend-list">
					<ul class="single">
						<li class="first-child">
							<p class="icon">
								<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
								<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
								<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
								<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
								<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
							</p>
							<div class="photo">
								<a href="#" title="ULTRA FACIAL 125ML">
									<img src="/images/shop/cn/product/list/temp_image.gif" alt="상품명" />
								</a>
								<span><img src="/images/shop/cn/product/list/link_preview.png" alt="预览" /></span>
								<ul class="link-menu">
									<li class="menu01 on"><a href="#">商品比较</a></li>
									<li class="menu02"><a href="#">关注商品</a></li>
									<li class="menu03"><a href="#">购物车</a></li>
									<li class="menu04"><a href="#">立即购买</a></li>
								</ul>
							</div><!-- end photo -->
							<p class="brand"><a href="#">兰蔻/LANCOME</a></p>
							<p class="product-name"><a href="#">兰蔻 精华肌底液(小黑…</a></p>
							<p class="price">
								<span class="us-currency">$ 2,999</span>
								<span class="nation-currency">(约 ￥10,075)</span>
							</p>
						</li>
					</ul>
				</div><!-- end list-single -->
				<div class="represent-wrap">
					<div class="result-represent">
						<div class="represent-navi">
							<ul>
								<li class="selected"><a href="#represent01">品牌(<span>100</span>)</a></li>
								<li><a href="#represent02">企划展(<span>100</span>)</a></li>
								<li><a href="#represent04">商品评价(<span>100</span>)</a></li>
								<li><a href="#represent05">Q&amp;A(<span>100</span>)</a></li>
							</ul>
						</div><!-- end represent-navi -->
						<div class="represent-section">
							<div id="represent01" class="represent-list represent-brand" style="display: none;">
								<ul>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/temp_brand.gif" alt="" /></a></li>
								</ul>
								<p class="result-more">
									<a href="#"><img src="/images/shop/cn/search/link_result.gif"alt="查看更多搜索结果" /></a>
								</p>
							</div><!-- end represent01 -->
							<div id="represent02" class="represent-list represent-plan-event" style="display: none;">
								<div class="qna-board plan-board">
									<table summary="대표 질문과 답변을 보여주는 표">
										<caption>질문과 답변</caption>
										<colgroup>
											<col width="12%" />
											<col width="*" />
											<col width="14%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row">9</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<tr>
												<th scope="row">8</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<tr>
												<th scope="row">7</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<tr>
												<th scope="row">6</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<tr>
												<th scope="row">5</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
										</tbody>
									</table>
								</div><!-- end qna-board -->
								<p class="result-more">
									<a href="#"><img src="/images/shop/cn/search/link_result.gif"alt="查看更多搜索结果" /></a>
								</p>
							</div><!-- end represent02 -->
							<div id="represent03" class="represent-list represent-plan-event" style="display: none;">
								<ul>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/196X96.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/196X96.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/196X96.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/196X96.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/196X96.gif" alt="" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/196X96.gif" alt="" /></a></li>
								</ul>
								<p class="result-more">
									<a href="#"><img src="/images/shop/cn/search/link_result.gif"alt="查看更多搜索结果" /></a>
								</p>
							</div><!-- end represent03 -->
							<div id="represent04" class="represent-list represent-review" style="display: none;">
								<div class="review">
									<ul>
										<li>
											<div class="product-report">
												<div class="product-info">
													<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/search/160X160.gif" alt="" /></a></p>
													<p class="brand"><a href="#">[ESTEE LAUDER]</a></p>
													<p class="product-name">ADVANCED NIGHT REPAIR <a href="#"></a></p>
													<p class="price">
														<span class="origin">$80</span>
														<span class="us-currency">$39</span>
														<span class="nation-currency">(￦54,970원)</span>
													</p>
												</div><!-- end product-info -->
												<div class="review-product">
													<p class="count">商品评(<span>100</span>)</p>
													<p class="star">
														<img src="//image.ssgdfs.com/images/shop/search/star_on.gif" alt="1" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
													</p>
													<p class="review">
														에스티로더에서 유명한 갈색병,<br /> 
														여행 다녀올 때 면세점에서 구입 한 <br />
														후 엄마 선물로 드리기에 참 좋아요.<br />
														시중가보다 훨씬 저렴하게 구입할 수 <br />
														있고, 많은 사람들이 구매하는 만큼 <br />
														믿고 살 수 있었습니다.<br />
														다음엔 저도 하나 구매해서 <br />
														써보려구요.
													</p>
												</div><!-- end review-product -->
											</div><!-- end product-report -->
										</li>
										<li>
											<div class="product-report">
												<div class="product-info">
													<p class="photo"><a href="#"><img src="//image.ssgdfs.com/images/shop/search/160X160.gif" alt="" /></a></p>
													<p class="brand"><a href="#">[ESTEE LAUDER]</a></p>
													<p class="product-name">ADVANCED NIGHT REPAIR <a href="#"></a></p>
													<p class="price">
														<span class="origin">$80</span>
														<span class="us-currency">$39</span>
														<span class="nation-currency">(￦54,970원)</span>
													</p>
												</div><!-- end product-info -->
												<div class="review-product">
													<p class="count">商品评(<span>100</span>)</p>
													<p class="star">
														<img src="//image.ssgdfs.com/images/shop/search/star_on.gif" alt="1" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
														<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
													</p>
													<p class="review">
														에스티로더에서 유명한 갈색병,<br /> 
														여행 다녀올 때 면세점에서 구입 한 <br />
														후 엄마 선물로 드리기에 참 좋아요.<br />
														시중가보다 훨씬 저렴하게 구입할 수 <br />
														있고, 많은 사람들이 구매하는 만큼 <br />
														믿고 살 수 있었습니다.<br />
														다음엔 저도 하나 구매해서 <br />
														써보려구요.
													</p>
												</div><!-- end review-product -->
											</div><!-- end product-report -->
										</li>
									</ul>
								</div><!-- end review -->
								<p class="result-more">
									<a href="#"><img src="/images/shop/cn/search/link_result.gif"alt="查看更多搜索结果" /></a>
								</p>
							</div><!-- end represent04 -->
							<div id="represent05" class="represent-list represent-qna">
								<div class="qna-board">
									<table summary="대표 질문과 답변을 보여주는 표">
										<caption>질문과 답변</caption>
										<colgroup>
											<col width="12%" />
											<col width="*" />
											<col width="14%" />
										</colgroup>
										<tbody> 
											<tr>
												<th scope="row">8</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<!-- [D] 08/11 추가 -->    
											<tr>
												<td colspan="3" class="answer">
													<div class="questions-box">
														<span class="icon"><img src="//image.ssgdfs.com/images/shop/search/title_questions.gif" alt="질문" /></span>
														<p class="questions-txt">
															<span>상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.</span>
															<span>취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.</span>
															<span>※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.</span>
															<span>※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.</span>
														</p>
													</div> 
												</td>
											</tr> 
											<!-- //[D] 08/11 추가 -->
											<tr>
												<th scope="row">7</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<tr>
												<th scope="row">6</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<tr>
												<th scope="row">5</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
											<!-- [D] 08/11 추가 -->    
											<tr>
												<td colspan="3" class="answer">
													<div class="questions-box">
														<span class="icon"><img src="//image.ssgdfs.com/images/shop/search/title_questions.gif" alt="질문" /></span>
														<p class="questions-txt">
															<span>상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.</span>
															<span>취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.</span>
															<span>※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.</span>
															<span>※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.</span>
														</p>
													</div>
													<div class="answer-box">
														<span class="icon"><img src="//image.ssgdfs.com/images/shop/search/title_answer.gif" alt="답변" /></span>
														<p class="answer-txt">
															<span>상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.</span>
															<span>취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.</span>
															<span>※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.</span>
															<span>※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.</span>
														</p>
													</div>
												</td>
											</tr> 
											<!-- //[D] 08/11 추가 -->
											<tr>
												<th scope="row">6</th>
												<td class="title"><a href="#">[MONTBLANCE] 가격인상 안내</a></td>
												<td class="date-time">2013.05.01</td>
											</tr>
										</tbody>
									</table>
								</div><!-- end qna-board -->
								<p class="result-more">
									<a href="#"><img src="/images/shop/cn/search/link_result.gif"alt="查看更多搜索结果" /></a>
								</p>
							</div><!-- end represent05 -->
						</div><!-- end represent-section -->
					</div><!-- end result-represent -->
				</div><!-- end represent-wrap -->
				<p class="title-line">商品<span>(<strong>100</strong>)</span></p>
				<p class="sub-title">分类<span>(<strong>100</strong>)</span></p>
				<div class="result-table">
					<table summary="카테고리별 검색을 보여주는 표">
						<caption>카테고리별 검색</caption>
						<colgroup>
							<col width="20%" />
							<col width="30%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<input type="checkbox" id="category01" />
									<label for="category01">화장품</label>
								</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="depth0101" />
											<label for="depth01">화장품(<span>100</span>)</label>
										</li>
										<li>
											<input type="checkbox" id="depth0102" />
											<label for="depth02">화장품(<span>100</span>)</label>
										</li>
										<li>
											<input type="checkbox" id="depth0103" />
											<label for="depth03">화장품(<span>100</span>)</label>
										</li>
										<li>
											<input type="checkbox" id="depth0104" />
											<label for="depth04">화장품(<span>100</span>)</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<input type="checkbox" id="category02" />
									<label for="category02">향수</label>
								</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="depth0101" />
											<label for="depth01">여성용(<span>100</span>)</label>
										</li>
										<li>
											<input type="checkbox" id="depth0102" />
											<label for="depth02">남성용(<span>100</span>)</label>
										</li>
										<li>
											<input type="checkbox" id="depth0103" />
											<label for="depth03">기성용(<span>100</span>)</label>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<input type="checkbox" id="category03" />
									<label for="category03">시계/악세서리</label>
								</th>
								<td>
									<ul>
										<li>
											<input type="checkbox" id="depth0101" />
											<label for="depth01">가방(<span>100</span>)</label>
										</li>
										<li>
											<input type="checkbox" id="depth0101" />
											<label for="depth01">지갑(<span>100</span>)</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end result-table -->
				<p class="sub-title">品牌<span>(<strong>100</strong>)</span></p>
				<div class="brand-result-list">
					<ul>
						<li>
							<input type="checkbox" id="brand-pattern01" />
							<label for="brand-pattern01">SALVATORE FERRAGAMO(<span>100</span>)</label>
						</li>
						<li>
							<input type="checkbox" id="brand-pattern02" />
							<label for="brand-pattern02">SALVATORE FERRAGAMO(<span>100</span>)</label>
						</li>
						<li>
							<input type="checkbox" id="brand-pattern03" />
							<label for="brand-pattern03">SALVATORE FERRAGAMO(<span>100</span>)</label>
						</li>
						<li>
							<input type="checkbox" id="brand-pattern04" />
							<label for="brand-pattern04">SALVATORE FERRAGAMO(<span>100</span>)</label>
						</li>
						<li>
							<input type="checkbox" id="brand-pattern05" />
							<label for="brand-pattern05">SALVATORE FERRAGAMO(<span>100</span>)</label>
						</li>
						<li>
							<input type="checkbox" id="brand-pattern06" />
							<label for="brand-pattern06">SALVATORE FERRAGAMO(<span>100</span>)</label>
						</li>
					</ul>
				</div><!-- end brand-result-list -->
				<div class="simple-search">
					<table summary="상품 간단 검색 서식">
						<caption>상품 간단 검색</caption>
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">价位</th>
								<th scope="col">颜色</th>
								<th scope="col">选项</th>
								<th scope="col">结果中再次搜索</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<td colspan="4">
									<div class="selected-item">
										<dl>
											<dt>选择条件 :</dt>
											<dd>
												<ul>
													<li>
														가격$1~$100
														<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span>
													</li>
													<li>
														gray
														<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span>
													</li>
												</ul>
											</dd>
										</dl>
										<p><a href="#">初始化选择</a></p>
									</div><!-- end selected item -->
									<p class="search-btn"><input type="image" src="/images/shop/cn/search/btn_simple_submit.gif" alt="검색" /></p>
								</td>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>
									<div class="range">
										<div class="range-select">
											<div class="distribution">
												<ul>
													<li class="on"><span style="width: 1%; height: 10%;"></span></li>
													<li class="on"><span style="width: 1%; height: 20%;"></span></li>
													<li class="on"><span style="width: 1%; height: 30%;"></span></li>
													<li class="on"><span style="width: 1%; height: 40%;"></span></li>
													<li class="on"><span style="width: 1%; height: 50%;"></span></li>
													<li class="on"><span style="width: 1%; height: 40%;"></span></li>
													<li class="on"><span style="width: 1%; height: 30%;"></span></li>
													<li class="on"><span style="width: 1%; height: 20%;"></span></li>
													<li class="on"><span style="width: 1%; height: 10%;"></span></li>
													<li class="on"><span style="width: 1%; height: 50%;"></span></li>
												</ul>
											</div><!-- end distribution -->
											<div class="price-slider">
											</div><!-- end price-slider -->
											<div class="price-set">
												<input type="text" class="min" title="최소 가격" /> <span>~</span>
												<input type="text" class="max" title="최대 가격" />
											</div><!-- end price-set -->
										</div><!-- end renge -->
									</div><!-- end range -->
								</td>
								<td class="color">
									<ul>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_02.gif" alt="white" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_13.gif" alt="beige" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_20.gif" alt="ivory" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_08.gif" alt="gold" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_11.gif" alt="sky" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_04.gif" alt="blue" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_10.gif" alt="navy" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_07.gif" alt="purple" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_19.gif" alt="violet" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_06.gif" alt="pink" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_05.gif" alt="red" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_14.gif" alt="brown" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_15.gif" alt="khaki" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_12.gif" alt="green" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_17.gif" alt="olive" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_16.gif" alt="yellow" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_09.gif" alt="silver" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_03.gif" alt="gray" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_18.gif" alt="charcoal" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_01.gif" alt="black" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_21.gif" alt="multi" /></a></li>
										<li><a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_22.gif" alt="pattern" /></a></li>
									</ul>
								</td>
								<td class="option">
									<ul>
										<li>
											<input type="checkbox" id="option01" />
											<label for="option01">打折商品</label>
										</li>
										<li>
											<input type="checkbox" id="option02" />
											<label for="option02">赠品</label>
										</li>
										<li>
											<input type="checkbox" id="option03" />
											<label for="option03">断货商品除外 </label>
										</li>
									</ul>
								</td>
								<td>
									<div class="input-form">
										<p class="connote-exclude">
											<input type="radio" id="connote" />
											<label for="connote" class="connote">包含词汇</label>
											<input type="radio" id="exclude " />
											<label for="exclude">排除词汇</label>
										</p>
										<p class="search"><input type="text" title="검색어를 입력하세요" /></p>
									</div><!-- end input-form -->
									<div class="word-set">
										<dl>
											<dt>包含词汇</dt>
											<dd>
												<ul>
													<li>
														여성<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
													<li>
														화장품<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
													<li>
														여름 가방<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
													<li>
														여성<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
													<li>
														화장품<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
													<li>
														여름 가방<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
												</ul>
											</dd>
										</dl>
										<dl>
											<dt>排除词汇</dt>
											<dd>
												<ul>
													<li>
														남성<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="삭제" /></span>
													</li>
												</ul>
											</dd>
										</dl>
									</div><!-- end word-set -->
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end simple-search -->
				<div class="product-list">
					<div class="list-con">
						<div class="list-sort">
							<ul>
								<li class="first-child selected"><a href="#">按排行</a></li>
								<li><a href="#">按人气商品</a></li>
								<li><a href="#">按最新商品</a></li>
								<li><a href="#">按高价</a></li>
								<li><a href="#">按底价</a></li>
								<li><a href="#">按商品评价数</a></li>
							</ul>
						</div><!-- end list-sort -->
						<!-- [D] 08/11 추가   분석된 색상 개수를 최대 15개까지 출력/ 검색결과가 많은 색상순으로 정렬(왼쪽부터)-->
						<div class="color-sort">
							<a href="#"><span></span></a>
							<a href="#"><span></span></a>
							<a href="#"><span></span></a>
							<!--  
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s02.gif" alt="white" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s13.gif" alt="beige" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s20.gif" alt="ivory" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s08.gif" alt="gold" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s11.gif" alt="sky" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s04.gif" alt="blue" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s10.gif" alt="navy" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s07.gif" alt="purple" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s19.gif" alt="violet" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s06.gif" alt="pink" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s05.gif" alt="red" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s14.gif" alt="brown" /></a>  
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s15.gif" alt="khaki" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s12.gif" alt="green" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s17.gif" alt="olive" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s16.gif" alt="yellow" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s09.gif" alt="silver" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s03.gif" alt="gray" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s18.gif" alt="charcoal" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s01.gif" alt="black" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s21.gif" alt="multi" /></a>
							<a href="#"><img src="//image.ssgdfs.com/images/shop/search/color_s22.gif" alt="pattern" /></a>	-->						 
						</div>
						<!-- //[D] 08/11 추가 -->
						<div class="list-view-con">
							<div class="list-pattern">
								<a href="#basic"><img src="//image.ssgdfs.com/images/shop/product/list/btn_basic_view.gif" alt="view large" /></a>
								<a href="#small"><img src="//image.ssgdfs.com/images/shop/product/list/btn_small_view.gif" alt="view small" /></a>
							</div>
							<div class="select-wrap">
								<select class="view-select" title="리스트 뷰 범위 선택">
									<option>1次查看60个</option>
								</select>
							</div>
						</div><!-- end list-view-con -->
					</div><!-- end list-con -->
					<div class="list-basic listing" id="basic">
							<ul class="list">
								<li>
									<div class="info">
										<p class="icon">
											<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
											<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
											<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
											<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
											<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
										</p>
										<p class="photo">
											<a href="#" title="ULTRA FACIAL 125ML"><img src="//image.ssgdfs.com/images/shop/product/list/160X160.gif" alt="" /></a>
											<span><img src="//image.ssgdfs.com/images/shop/product/list/link_preview.png" alt="미리보기" /></span>
										</p>
										<p class="brand"><a href="#">[ESTEE LAUDER]</a></p>
										<p class="copy-right">
											<a href="#">
												가장 퍼펙트한 화장품을<br />
												만나보실수있습니다. 
											</a>
										</p>
										<p class="product-name">
											<a href="#">
												Advanced Night Repair<br /> 
												Synchronized Recovery Complex<br />
												Face & Eye Set
											</a>
										</p>
										<p class="price">
											<span class="origin">$80</span>
											<span class="us-currency">$39</span>
											<span class="nation-currency">(￦54,970원)</span>
										</p>
										<ul class="link-menu">
											<li class="menu01 on"><a href="#">상품비교</a></li>
											<li class="menu02"><a href="#">관심상품</a></li>
											<li class="menu03"><a href="#">장바구니</a></li>
											<li class="menu04"><a href="#">바로구매</a></li>
										</ul>
									</div><!-- end info -->
								</li>
							</ul>
						</div><!-- end list-basic -->
						<div class="list-table listing" id="small">
							<table summary="상품 정보전달 이미지 브랜드/상품명 제품번호 상품펼 가격 담기/구매 메뉴로 구성된 표">
								<caption>상품 리스트</caption>
								<colgroup>
									<col width="119" />
									<col width="369" />
									<col width="95" span="3" />
									<col width="222px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first-child">图片</th>
										<th scope="col">品牌/商品名</th>
										<th scope="col">REF_NO</th>
										<th scope="col">商品评</th>
										<th scope="col">销售金额</th>
										<th scope="col">装入/购买</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="first-child">
											<p class="photo"><img src="//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p>
										</td>
										<td class="explain">
											<p class="icon">
												<img src="/images/shop/cn/common/t_icon01.gif" alt="sale" />
												<img src="/images/shop/cn/common/t_icon02.gif" alt="best" />
												<img src="/images/shop/cn/common/t_icon03.gif" alt="new" />
												<img src="/images/shop/cn/common/t_icon04.gif" alt="赠品" />
												<img src="/images/shop/cn/common/t_icon05.gif" alt="打折券" />
											</p>
											<p class="brand"><a href="#">[KIEHL'S]</a></p>
											<p class="product-name"><a href="#">ULTRA FACIAL 125ML</a></p>
										</td>
										<td>5066610</td>
										<td>
											<p class="star-point">
												<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="1" />
												<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="2" />
												<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="3" />
												<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="4" />
												<img src="//image.ssgdfs.com/images/shop/product/list/star_on.gif" alt="5" />
											</p>
											<p class="total-count">(101개)</p>
										</td>
										<td>
											<p class="price">
												<span class="origin">$80</span>
												<span class="us-currency">$39</span>
												<span class="nation-currency">(￦54,970)</span>
											</p>
										</td>
										<td class="order">
											<ul>
												<li>	
													<span>
														<img src="/images/shop/cn/product/list/linking_menu01_off.gif" alt="预览" />
													</span>
												</li>
												<li>
													<a href="#">
														<img src="/images/shop/cn/product/list/linking_menu02_off.gif" alt="商品比较" />
													</a>
												</li>
												<li>
													<a href="#">
														<img src="/images/shop/cn/product/list/linking_menu03_off.gif" alt="关注商品" />
													</a>
												</li>
												<li>
													<a href="#">
														<img src="/images/shop/cn/product/list/linking_menu04_off.gif" alt="购物车" />
													</a>
												</li>
												<li>
													<a href="#">
														<img src="/images/shop/cn/product/list/linking_menu05_off.gif" alt="立即购买" />
													</a>
												</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						</div><!-- list-table -->
					</div><!-- end product-list -->
					<div class="pager">
						<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음" /></a>
						<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
						<a href="#">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
						<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막" /></a>
					</div><!-- end pager -->
					
				<p class="title-line">FAQ (<span>100</span>)</p>
				<p class="more-view"><a href="#">+查看更多搜索结果</a></p>
				<div class="qna-board">
					<table summary="질문과 답변을 제공하는 표">
						<caption>질문 답변</caption>
						<colgroup>
							<col width="60px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">Q</th>
								<td><a href="#">구매한 상품 중에 일부<strong>신세계면세점</strong> 상품만 취소가 가능하나요?</a></td>
							</tr>
							<tr class="answer">
								<th scope="row">A</th>
								<td>
									상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.<br />
									취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.<br />
									※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.<br />
									※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.
								</td>
							</tr>
							<tr>
								<th scope="row">Q</th>
								<td><a href="#">구매한 상품 중에 일부<strong>신세계면세점</strong> 상품만 취소가 가능하나요?</a></td>
							</tr>
							<tr class="answer">
								<th scope="row">A</th>
								<td>
									상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.<br />
									취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.<br />
									※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.<br />
									※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.
								</td>
							</tr>
							<tr>
								<th scope="row">Q</th>
								<td><a href="#">구매한 상품 중에 일부<strong>신세계면세점</strong> 상품만 취소가 가능하나요?</a></td>
							</tr>
							<tr class="answer">
								<th scope="row">A</th>
								<td>
									상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.<br />
									취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.<br />
									※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.<br />
									※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.
								</td>
							</tr>
							<tr>
								<th scope="row">Q</th>
								<td><a href="#">구매한 상품 중에 일부<strong>신세계면세점</strong> 상품만 취소가 가능하나요?</a></td>
							</tr>
							<tr class="answer">
								<th scope="row">A</th>
								<td>
									상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.<br />
									취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.<br />
									※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.<br />
									※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.
								</td>
							</tr>
							<tr>
								<th scope="row">Q</th>
								<td><a href="#">구매한 상품 중에 일부<strong>신세계면세점</strong> 상품만 취소가 가능하나요?</a></td>
							</tr>
							<tr class="answer">
								<th scope="row">A</th>
								<td>
									상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.<br />
									취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.<br />
									※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.<br />
									※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end qun-board -->
				<p class="title-line">公告事项</p>
				<p class="more-view"><a href="#">+查看更多搜索结果</a></p>
				<ul class="notice-list">
					<li>
						<p class="location">
							고객센터
							<span>&gt;</span>
							 면세점 이용안내
							 <span>&gt;</span>
							 쇼핑가이드
							 <span>&gt;</span>
							 쇼핑절차
							<span class="date-time"></span>
						</p>
						<p class="notice-content">
							해운대 <strong>신세계면세점</strong>에는 핫핑크와 흰테두리가 있는 베이지가 그레이가 남아 있었어요. 제가 산 오렌지색은 재고 마지막이예요. 비슷한 디자인으로 앞쪽에 리본장식으로 된 숄더백도 <br />
							있으니 구경가세요...
						</p>
					</li>
					<li>
						<p class="location">
							고객센터
							<span>&gt;</span>
							 면세점 이용안내
							 <span>&gt;</span>
							 쇼핑가이드
							 <span>&gt;</span>
							 쇼핑절차
							<span class="date-time"></span>
						</p>
						<p class="notice-content">
							해운대 <strong>신세계면세점</strong>에는 핫핑크와 흰테두리가 있는 베이지가 그레이가 남아 있었어요. 제가 산 오렌지색은 재고 마지막이예요. 비슷한 디자인으로 앞쪽에 리본장식으로 된 숄더백도 <br />
							있으니 구경가세요...
						</p>
					</li>
					<li>
						<p class="location">
							고객센터
							<span>&gt;</span>
							 면세점 이용안내
							 <span>&gt;</span>
							 쇼핑가이드
							 <span>&gt;</span>
							 쇼핑절차
							<span class="date-time"></span>
						</p>
						<p class="notice-content">
							해운대 <strong>신세계면세점</strong>에는 핫핑크와 흰테두리가 있는 베이지가 그레이가 남아 있었어요. 제가 산 오렌지색은 재고 마지막이예요. 비슷한 디자인으로 앞쪽에 리본장식으로 된 숄더백도 <br />
							있으니 구경가세요...
						</p>
					</li>
				</ul>
				<p class="title-line">
					调查搜索结果满意度 <font class="tit-info-txt">通过听取顾客的宝贵意见，提供更加优质的服务。</font>
				</p>
				<div class="satisfaction">
					<table summary="만족도 설문조사 서식 ">
						<caption>만족도 선택</caption>
						<colgroup>
							<col width="149px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">满意度</th>
								<td>
									<p>
										<span>不满意
											<img src="//image.ssgdfs.com/images/shop/search/large_star_on.gif" alt="1점" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
										</span>
										满意
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row">顾客意见</th>
								<td>
									<textarea cols="100" rows="10">
									</textarea>
									<input type="image" src="/images/shop/cn/search/btn_sf_submit.gif" alt="提交" />
								</td>
							</tr>
						</tbody>
					</table>
				</div><!-- end satisfaction -->
			</div><!-- end result -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>