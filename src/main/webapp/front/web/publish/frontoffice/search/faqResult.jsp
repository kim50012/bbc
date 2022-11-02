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
	$("td.answer").hide();
	$(".question-board td a").click(function(){
		$("td.answer").hide();
		$(".question-board td a").css({"font-weight" : "normal" , "color" : "#666"});
		$(this).css({"font-weight" : "bold" , "color" : "#333"});


		$(this).parent().parent().next().find("td.answer").show();
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
						<li class="selected">
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab06_on.gif" alt="FAQ" /></span>
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
						<p class="cnt">在FAQ中搜索 <span>化妆品 </span>共找到 <span>100 </span>件相关内容</p>
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
					<div class="faq-menu">
						<ul>
							<li>전체(<span>100</span>)</li>
							<li>회원(<span>100</span>)</li>
							<li>상품(<span>100</span>)</li>
							<li>주문 결제(<span>100</span>)</li>
							<li>상품수령(<span>100</span>)</li>
							<li>교환/환불(<span>100</span>)</li>
							<li>적립금/포인트(<span>100</span>)</li>
						</ul>
					</div><!-- end faq-menu -->
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
				<p class="title-line">
					FAQ
				</p>
				<div class="select-wraper">
					<select class="list-select">
						<option>40개씩 보기</option>
					</select>
				</div><!-- end list-wrap -->
				<div class="question-list">
					<div class="question-board">
						<table summary="질문 답변의 정보를 제공하는 표">
							<caption>질문 답변</caption>
							<colgroup>
								<col width="8%" />
								<col width="92%" />
							</colgroup>
							<tbody>
								<tr>
									<td class="num">10</td>
									<td><a href="#">구매한 상품 중에 일부 상품만 취소가 가능하나요?</a></td>
								</tr>
								<tr>
									<td class="answer" colspan="2">
										<dl>
											<dt><img src="//image.ssgdfs.com/images/shop/search/title_answer.gif" alt="답변" /></dt>
											<dd>
												상품의 취소는 주문번호당 취소가 가능하며, 부분취소는 가능하지 않습니다.<br />
												취소 후 재주문 시에는 기존의 주문에 대하여 전체취소 후 원하시는 상품을 재주문 해주셔야 합니다.<br />
												※주문취소 전 쿠폰과 적립금의 유효기간을 꼭 확인하신 후 취소해 주시기 바랍니다.<br />
												※취소 후 재구매 시 상품이 품절되는 경우가 있사오니, 취소 전 상품의 재고를 확인해 주시기 바랍니다.
											</dd>
										</dl>
									</td>
								</tr>
								<tr>
									<td class="num">9</td>
									<td><a href="#">[MONTBLANC] 가격 인상 안내</a></td>
								</tr>
								<tr>
									<td class="num">8</td>
									<td><a href="#">[MONTBLANC] 가격 인상 안내</a></td>
								</tr>
								<tr>
									<td class="num">7</td>
									<td><a href="#">[MONTBLANC] 가격 인상 안내</a></td>
								</tr>
								<tr>
									<td class="num">6</td>
									<td><a href="#">[MONTBLANC] 가격 인상 안내</a></td>
								</tr>
							</tbody>
						</table>
					</div><!-- end question-board -->
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
				</div><!-- end question-list -->
				<div class="all-list result-no">
					<p class="title-line">
						FAQ
					</p>
					<div class="brand-list">
						<p>没有搜索结果。</p>
					</div><!-- end all-list -->
				</div>
			</div><!-- end result -->
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>