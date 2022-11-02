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
						<li class="selected">
							<a href="#">
								<span class="section"><img src="/images/shop/cn/search/tab07_on.gif" alt="公告事项" /></span>
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
					公告事项 
					<span>(100)</span>
				</p>
				<div class="select-wraper">
					<select class="list-select">
						<option>40개씩 보기</option>
					</select>
				</div><!-- end list-wrap -->
				<div class="notice-list">
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
				</div><!-- end notice-list -->
				
				<div class="all-list result-no">
					<p class="title-line">
						公告事项 
					</p>
					<div class="brand-list">
						<p>没有搜索结果。</p>
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