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
				<a href="#">?????????</a><span>&gt;</span><strong>????????????</strong>
			</div><!-- end page-sublocation -->
			<div class="result">
				<div class="result-tab">
					<ul>
						<li class="selected">
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab01_on.gif" alt="????????????" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab02_off.gif" alt="??????" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab03_off.gif" alt="?????????" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab04_off.gif" alt="????????????" /></span>
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
								<span class="section"><img src="/images/shop/cn/search/tab07_off.gif" alt="????????????" /></span>
								<span class="cnt">000</span>
							</a>
						</li>
					</ul>
				</div><!-- end result-tab -->
				
				<div class="simple-result">
					<div class="word-cnt">
						<p class="cnt"><span>?????? 000</span> ????????? 900???????????????</p>
						<dl>
							<dt>???????????????</dt>
							<dd>
								<ul>
									<li class="first-child"><a href="#">??????</a></li>
									<li><a href="#">???????????????</a></li>
									<li><a href="#">???????????????</a></li>
									<li><a href="#">????????????</a></li>
									<li><a href="#">????????????</a></li>
								</ul>
							</dd>
						</dl>
					</div><!-- end word-cnt -->
					
				</div><!-- end simple-result -->
				<div class="search-form">
					<fieldset>
						<legend>????????????</legend>
						<div class="input-set">
							<div class="select-zone">
								<input type="radio" id="word-in" />
								<label for="word-in">????????????</label>
								<input type="radio" id="word-out" />
								<label for="word-out">????????????</label>
							</div><!-- end select-zone -->
							<select class="search-select">
								<option>????????????</option>
							</select>
							<input type="text" title="????????? ??????" />
							<input type="image" src="/images/shop/cn/search/btn_total_search.gif" alt="??????" />
						</div><!-- end input-set -->
						<div class="keyword">
							<dl>
								<dt><img src="/images/shop/cn/search/title_popular.gif" alt="???????????????" /></dt>
								<dd>
									<ul>
										<li><a href="#">??????</a></li>
										<li><a href="#">???????????????</a></li>
										<li><a href="#">???????????????</a></li>
										<li><a href="#">????????????</a></li>
										<li><a href="#">????????????</a></li>
									</ul>
								</dd>
							</dl>
						</div><!-- end keyword -->
						<div class="word-select">
							<dl class="inclusion">
								<dt>????????????</dt>
								<dd>
									<ul>
										<li>??????<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
										<li>???????????????<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
									</ul>
								</dd>
							</dl>
							<dl class="transport">
								<dt>????????????</dt>
								<dd>
									<ul>
										<li>??????<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
										<li>???????????????<span><img src="//image.ssgdfs.com/images/shop/search/btn_remove.gif" alt="X" /></span></li>
									</ul>
								</dd>
							</dl>
						</div><!-- end word-select -->
					</fieldset>
				</div><!-- end search-form -->
				<p class="title-line">????????????</p>
				<div class="list-basic recommend-list">
					<ul class="single">
						<li class="first-child">
							<p class="icon">
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_sale.gif" alt="sale" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_best.gif" alt="best" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_new.gif" alt="new" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="?????????" />
								<img src="//image.ssgdfs.com/images/shop/product/list/icon_gift.gif" alt="??????" />
							</p>
							<div class="photo">
								<a href="#" title="ULTRA FACIAL 125ML">
									<img src="//image.ssgdfs.com/images/shop/product/list/160X160.gif" alt="?????????" />
								</a>
								<span><a href="#"><img src="//image.ssgdfs.com/images/shop/product/list/link_preview.png" alt="????????????" /></a></span>
								<ul class="link-menu">
									<li class="menu01 on"><a href="#">????????????</a></li>
									<li class="menu02"><a href="#">????????????</a></li>
									<li class="menu03"><a href="#">????????????</a></li>
									<li class="menu04"><a href="#">????????????</a></li>
								</ul>
							</div><!-- end photo -->
							<p class="brand"><a href="#">??????/LANCOME</a></p>
							<p class="product-name"><a href="#">?????? ???????????????(?????????</a></p>
							<p class="price">
								<span class="us-currency">$ 2,999</span>
								<span class="nation-currency">(??? ???10,075)</span>
							</p>
						</li>
					</ul>
				</div><!-- end list-single -->
<div class="represent-wrap">
					<div class="result-represent">
						<div class="represent-navi">
							<ul>
								<li class="selected"><a href="#represent01">??????(<span>100</span>)</a></li>
								<li><a href="#represent02">?????????(<span>100</span>)</a></li>
								<li><a href="#represent03">????????????(<span>100</span>)</a></li>
								<li><a href="#represent04">Q&A(<span>100</span>)</a></li>
							</ul>
						</div><!-- end represent-navi -->
						<div class="represent-section">
							<div id="represent01" class="represent-list represent-brand" style="display: none;">
								<p class="result-no">???????????????????????????1</p>
							</div><!-- end represent01 -->
							<div id="represent02" class="represent-list represent-plan-event" style="display: none;">
								<p class="result-no">???????????????????????????2</p>
							</div><!-- end represent02 -->
							<div id="represent03" class="represent-list represent-plan-event" style="display: none;">
								<p class="result-no">???????????????????????????3</p>
							</div><!-- end represent03 -->
							<div id="represent04" class="represent-list represent-review" style="display: none;">
								<p class="result-no">??????????????????????????? 4</p>
							</div><!-- end represent04 -->
						</div><!-- end represent-section -->
					</div><!-- end result-represent -->
				</div><!-- end represent-wrap -->
				<div class="no-result">
					<p class="title-line">
						?????? <span>(<strong>100</strong>)</span>
					</p>
					<img src="//image.ssgdfs.com/images/shop/search/no_result.gif" alt="???????????? ????????? ???????????? ??????????????? ??? ??????????????? ???????????? ???????????? ?????????." usemap="#sp-order"/>
					<map id="sp-order" name="sp-order">
						<area shape="rect" href="#" coords="816,35,925,139" alt="????????? ?????? ?????? ????????????" />
					</map>
				</div>
				<div class="all-list result-no">
					<p class="title-line">
						?????? <span>(<strong>100</strong>)</span>
					</p>
					<div class="brand-list">
						<p>???????????????????????????</p>
					</div><!-- end all-list -->
				</div>
				<div class="all-list result-no">
					<p class="title-line">
						FAQ <span>(<strong>100</strong>)</span>
					</p>
					<div class="brand-list">
						<p>???????????????????????????</p>
					</div><!-- end all-list -->
				</div>
				<div class="all-list result-no">
					<p class="title-line">
						???????????? <span>(<strong>100</strong>)</span>
					</p>
					<div class="brand-list">
						<p>???????????????????????????</p>
					</div><!-- end all-list -->
				</div>
				<p class="title-line">
					??????????????????????????? <font class="tit-info-txt">??????????????????????????????????????????????????????????????????</font>
				</p>
				<div class="satisfaction">
					<table summary="????????? ???????????? ?????? ">
						<caption>????????? ??????</caption>
						<colgroup>
							<col width="149px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">?????????</th>
								<td>
									<p>?????????
										<span>
											<img src="//image.ssgdfs.com/images/shop/search/large_star_on.gif" alt="1???" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
											<img src="//image.ssgdfs.com/images/shop/search/large_star_off.gif" alt="0" />
										</span>
										??????
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row">????????????</th>
								<td>
									<textarea cols="100" rows="10">
									</textarea>
									<input type="image" src="/images/shop/cn/search/btn_sf_submit.gif" alt="??????" />
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