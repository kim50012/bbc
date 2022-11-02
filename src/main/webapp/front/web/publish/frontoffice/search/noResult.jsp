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
	$(".list-select").selectbox();

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
						<p class="cnt"><span>搜索 000</span> 共找到 900件相关内容</p>
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
								<li><a href="#represent03">商品评价(<span>100</span>)</a></li>
								<li><a href="#represent04">Q&A(<span>100</span>)</a></li>
							</ul>
						</div><!-- end represent-navi -->
						<div class="represent-section">
							<div id="represent01" class="represent-list represent-brand" style="display: none;">
								<p class="result-no">没有相关的企划展。1</p>
							</div><!-- end represent01 -->
							<div id="represent02" class="represent-list represent-plan-event" style="display: none;">
								<p class="result-no">没有相关的企划展。2</p>
							</div><!-- end represent02 -->
							<div id="represent03" class="represent-list represent-plan-event" style="display: none;">
								<p class="result-no">没有相关的企划展。3</p>
							</div><!-- end represent03 -->
							<div id="represent04" class="represent-list represent-review" style="display: none;">
								<p class="result-no">没有相关的企划展。 4</p>
							</div><!-- end represent04 -->
						</div><!-- end represent-section -->
					</div><!-- end result-represent -->
				</div><!-- end represent-wrap -->
				<div class="no-result">
					<p class="title-line">
						商品 <span>(<strong>100</strong>)</span>
					</p>
					<img src="//image.ssgdfs.com/images/shop/search/no_result.gif" alt="찾으시는 상품이 없으세요 스페셜오더 를 이용하시면 신속하게 구매가능 합니다." usemap="#sp-order"/>
					<map id="sp-order" name="sp-order">
						<area shape="rect" href="#" coords="816,35,925,139" alt="스페셜 오더 신청 바로가기" />
					</map>
				</div>
				<div class="all-list result-no">
					<p class="title-line">
						商品 <span>(<strong>100</strong>)</span>
					</p>
					<div class="brand-list">
						<p>没有相关的企划展。</p>
					</div><!-- end all-list -->
				</div>
				<div class="all-list result-no">
					<p class="title-line">
						FAQ <span>(<strong>100</strong>)</span>
					</p>
					<div class="brand-list">
						<p>没有相关的企划展。</p>
					</div><!-- end all-list -->
				</div>
				<div class="all-list result-no">
					<p class="title-line">
						公告事项 <span>(<strong>100</strong>)</span>
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
									<p>不满意
										<span>
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