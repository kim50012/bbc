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
<script type="text/javascript" src="/js/jquery/jquery.jqzoom-core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/productlist.js"></script>
<script type="text/javascript">
jQuery(function($){
	$(".search-select").selectbox();
	$(".list-select").selectbox();
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
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab01_off.gif" alt="综合搜索" /></span>
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
						<li class="selected">
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab04_on.gif" alt="商品评价" /></span>
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
						<p class="cnt">상품평에서 <span>화장품</span>으로 총 <span>900건</span>이 검색되었습니다.</p>
						<dl>
							<dt>연관 검색어</dt>
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
					<p class="sub-title sub-title-type01"><img src="//image.ssgdfs.com/images/shop/search/sub_title01.gif" alt="카테고리" /><span>(100)</span></p>
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
				</div><!-- end simple-result -->
				<div class="search-result">
					<p class="sub-title"><img src="//image.ssgdfs.com/images/shop/search/sub_title02.gif" alt="브랜드" /><span>(100)</span></p>
					<ul>
						<li><input type="checkbox" />SALVATORE FERRAGAMO(<span>100</span>)</li>
						<li><input type="checkbox" />MARC BY MARC JAOBS(<span>100</span>)</li>
						<li><input type="checkbox" />LEONARD(<span>100</span>)</li>
						<li><input type="checkbox" />SALVATORE FERRAGAMO(<span>100</span>)</li>
						<li><input type="checkbox" />KENZO(<span>100</span>)</li>
						<li><input type="checkbox" />LONGCHAMP(<span>100</span>)</li>
						<li><input type="checkbox" />SALVATORE FERRAGAMO(<span>100</span>)</li>
						<li><input type="checkbox" />JOHN MASTERS ORGANICS(<span>100</span>)</li>
					</ul>
				</div>
				<div class="search-form">
					<fieldset>
						<legend>包含词汇</legend>
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
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_sale.gif" alt="sale" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_best.gif" alt="best" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_new.gif" alt="new" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="사은품" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="쿠폰" />
							</p>
							<div class="photo">
								<a href="#" title="ULTRA FACIAL 125ML">
									<img src="//image.ssgdfs.com/images/shop/product/list/160X160.gif" alt="상품명" />
								</a>
								<span><a href="#"><img src="//image.ssgdfs.com/images/shop/product/list/link_preview.png" alt="미리보기" /></a></span>
								<ul class="link-menu">
									<li class="menu01 on"><a href="#">미리보기</a></li>
									<li class="menu02"><a href="#">관심상품</a></li>
									<li class="menu03"><a href="#">장바구니</a></li>
									<li class="menu04"><a href="#">바로구매</a></li>
								</ul>
							</div><!-- end photo -->
							<p class="brand"><a href="#">[KIEHL'S]</a></p>
							<p class="product-name"><a href="#">ULTRA FACIAL 125ML</a></p>
							<p class="price">
								<span class="origin">$80</span>
								<span class="us-currency">$39</span>
								<span class="nation-currency">(￦54,970원)</span>
							</p>
						</li>
					</ul>
				</div><!-- end list-single -->
				<div class="review-list">	
					<p class="title-line">
						商品评价
						<span>(100)</span>
					</p>
					<div class="select-wraper">
						<select class="list-select">
							<option>40개씩 보기</option>
						</select>
					</div><!-- end list-wrap -->
					<div class="table-review">
						<table summary="일반 상품평 정보를 제공하는 표">
							<caption>일반 상품평</caption>
							<colgroup>
								<col width="120px" />
								<col width="617px" />
								<col width="120px" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<td><p class="photo"><img src="//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p></td>
									<td class="info">
										<p class="title">일반상품평</p>
										<p class="brand-product-name"><span>[KIEHL`S]</span>ULTRA FACIAL CREAM 125ML</p>
										<p class="review-content">
											<a href="#">
												행사할때 할인율이 커서 처음으로 구매 했는데 정말 만족합니다!<br />
												행사할때 할인율이 커서 처음으로 구매 했는데 정말 만족합니다!<br />
												행사할때 할인율이 커서 처음으로 구매 했는데 정말 만족합니다!
											</a>
										</p>
									</td>
									<td>
										<p>
											평점
											<span class="star">
												<img src="//image.ssgdfs.com/images/shop/search/star_on.gif" alt="1점" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
											</span>
										</p>
									</td>
									<td>
										<p class="regi-date">
											<span>등록일 :</span>
											<span>2013-05-01</span>
										</p>
									</td>
								</tr>
								<tr>
									<td><p class="photo"><img src="//image.ssgdfs.com/images/shop/product/list/temp_product_small.gif" alt="" /></p></td>
									<td class="info">
										<p class="title title-premi">프리미엄 상품평</p>
										<p class="brand-product-name"><span>[KIEHL`S]</span>ULTRA FACIAL CREAM 125ML</p>
										<p class="review-content">
											<a href="#">
												행사할때 할인율이 커서 처음으로 구매 했는데 정말 만족합니다!<br />
												행사할때 할인율이 커서 처음으로 구매 했는데 정말 만족합니다!<br />
												행사할때 할인율이 커서 처음으로 구매 했는데 정말 만족합니다!
											</a>
										</p>
									</td>
									<td>
										<p>
											평점
											<span class="star">
												<img src="//image.ssgdfs.com/images/shop/search/star_on.gif" alt="1점" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
												<img src="//image.ssgdfs.com/images/shop/search/star_off.gif" alt="0" />
											</span>
										</p>
									</td>
									<td>
										<p class="regi-date">
											<span>등록일 :</span>
											<span>2013-05-01</span>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div><!-- end table-review -->
					<div class="pager">
						<a href="#" class="first"><img src="//image.ssgdfs.com/images/shop/common/btn_page_first.gif" alt="처음" /></a>
						<a href="#" class="prev"><img src="//image.ssgdfs.com/images/shop/common/btn_page_prev.gif" alt="이전" /></a>
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
						<a href="#" class="next"><img src="//image.ssgdfs.com/images/shop/common/btn_page_next.gif" alt="다음" /></a>
						<a href="#" class="last"><img src="//image.ssgdfs.com/images/shop/common/btn_page_last.gif" alt="마지막" /></a>
					</div><!-- end pager -->
				</div><!-- end review-list -->
				
				<div class="all-list result-no">
					<p class="title-line">
						商品评价
						<span>(0)</span>
					</p>
					<div class="brand-list">
						<p>没有相关的企划展。</p>
					</div><!-- end all-list -->
				</div>
				
				
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