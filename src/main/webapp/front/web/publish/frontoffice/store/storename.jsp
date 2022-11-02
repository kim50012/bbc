<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE LAYOUT</title>
<link href="/css/layout_store.css" rel="stylesheet" type="text/css" />
<link href="/css/store.css" rel="stylesheet" type="text/css" />
<link href="/css/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="/js/jquery/jquery.tools.min02.js"></script>  
<script type="text/javascript" src="/js/jquery/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/js/jquery/mwheelIntent.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $("#mapcontents").scrollable({
	vertical: true,
	keyboard: 'static',

	// assign left/right keys to the actively viewed scrollable
	//onSeek: function(event, i) {
	  //horizontal.eq(i).data("scrollable").focus();
	//}

  }).navigator("#main_navi");

  //var horizontal = $(".scrollable").scrollable({ circular: true }).navigator(".navi");

  //horizontal.eq(0).data("scrollable").focus();
});
 
 
jQuery(function($){
  
	$('.store-list dd').jScrollPane({showArrows: true});
	 
	$(".store dl dd").hide();
	$(".store dl dd.first-child").show();
	$(".store dl dt").click(function(){
		$(".store dl dd").hide();
		$(".store dl dt").each(function(){
			$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
		});
		$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
		$(this).next().show();
	});
	$(".store dl dd.first-child ul li").mouseover(function(){
		$(".store dl dd.first-child ul li").each(function(){
			$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_on.gif" , "_off.gif"));
		});
			$(this).find("img").attr("src" , $(this).find("img").attr("src").replace("_off.gif" , "_on.gif"));
	});
});
</script>
<!-- //[D] 소스변경 -->
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head_store.jsp"%>
		<div id="body"> 
			<%@include file="/publish/frontoffice/include/sidebar_store02.jsp"%>
			<div id="contents">
				<div class="page-sublocation">
					<a href="#">主页</a><span>&gt;</span><a href="#">介绍店面</a><span>&gt;</span><strong>各楼层介绍/寻找店铺</strong>
				</div> 
				<div class="location-title visual02">
					<h3><img src="/images/shop/cn/store/h3_title02.gif" alt=" INFO" /></h3>
					<p><img src="/images/shop/cn/store/comment02.gif" alt="请在新世界免税店尽享购物之快乐！!我们将为顾客的购物方便尽最大的努力。" /></p>
				</div> 
				<h4><img src="/images/shop/cn/store/h4_floor_guide.gif" alt="各楼层介绍 / 寻找店铺" /></h4>
				<div class="store-search">
					<div class="store">
						<dl>
							<dt class="first-child"><img src="//image.ssgdfs.com/images/shop/store/category_on.gif" alt="CATEGORY" /></dt>
							<dd class="first-child">
								<ul>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category01_off.gif" alt="전체보기" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category02_off.gif" alt="화장품" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category03_off.gif" alt="향수" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category04_off.gif" alt="지갑/가방" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category05_off.gif" alt="시계/악세사리" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category06_off.gif" alt="패션/잡화" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category07_off.gif" alt="전자제품" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category08_off.gif" alt="식품" /></a></li>
									<li><a href="#"><img src="//image.ssgdfs.com/images/shop/store/category09_off.gif" alt="국내브랜드" /></a></li>
								</ul>
							</dd>
							<dt><img src="//image.ssgdfs.com/images/shop/store/search_off.gif" alt="search" /></dt>
							<dd>
								<div class="store-search-form">
									<fieldset>
										<legend>매장 검색</legend>
										<input type="text" />
										<input type="image" src="/images/shop/cn/store/btn_search_list.gif" alt="搜索" />
									</fieldset>
								</div><!-- end sstore-search-form -->
							</dd>
						</dl>
					</div><!-- end store -->
					<div class="store-list">
						<dl>
							<dt><img src="//image.ssgdfs.com/images/shop/store/section_store_list.gif" alt="STORE LIST" /></dt>
							<dd>
								<ul>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li class="selected"><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
									<li><a href="#">BURBERRY <span>(가방/지갑)</span></a></li>
									<li><a href="#">JOHN MASTERS ORGANICS<span>(시계/액세서리)</span></a></li>
								</ul>
							</dd>
						</dl>ㅡ
					</div><!-- end store-list -->
					<div class="store-info">
						<dl>
							<dt><img src="//image.ssgdfs.com/images/shop/store/section_store_info.gif" alt="STROE INFO" /></dt>
							<dd>
								<p class="photo"><img src="//image.ssgdfs.com/images/shop/store/220X202.gif" alt="매장사진" /></p>
								<p class="storename">매장명</p>
								<p class="brand">JOHN MASTERS ORGANICS</p>
								<p class="category-depth">시계/액세서리</p>
								<p class="tel">Tel : 051-123-4567</p>
								<p class="location">신세계면세점 B1f가능합니다.에 입점</p>
								<p class="link-set">
									<a href="#"><img src="//image.ssgdfs.com/images/shop/store/link_event.gif" alt="이벤트" /></a>
									<a href="#"><img src="//image.ssgdfs.com/images/shop/store/link_online.gif" alt="온라인 샵" /></a>
									<span><img src="//image.ssgdfs.com/images/shop/store/icon_online.gif" alt="좋아요" /></span>
									<span class="count">909999</span>
								</p>
							</dd>
						</dl>
					</div><!-- end store-info -->
				</div><!-- end store-search -->
			  			
				<div class="floor-box">
					<ul id="main_navi">
						<li class="active a01"><span>3F</span></li>
						<li class="a02"><span>2F</span></li>
						<li class="a03"><span>1F</span></li>
						<li class="a04"><span>B1F</span></li>
					</ul>
					<div id="mapcontents"> 
						<div id="pages">  
							<div class="page"> 					 
								<div class="scrollable"> 
									<div class="item"> 
										<!-- 영역 -->
										<div class="storelink"> 
											<a href="#" class="store03-01"><span>01</span></a>
											<a href="#" class="store03-02"><span>02</span></a>
											<a href="#" class="store03-03"><span>03</span></a>
											<a href="#" class="store03-04"><span>04</span></a>
											<a href="#" class="store03-05"><span>05</span></a>
											<a href="#" class="store03-06"><span>06</span></a>
											<a href="#" class="store03-07"><span>07</span></a>
											<a href="#" class="store03-08"><span>08</span></a>
											<a href="#" class="store03-09"><span>09</span></a>
											<a href="#" class="store03-10"><span>10</span></a> 
											<a href="#" class="store03-11"><span>11</span></a>
											<a href="#" class="store03-12"><span>12</span></a>
											<a href="#" class="store03-13"><span>13</span></a>
											<a href="#" class="store03-14"><span>14</span></a>
											<a href="#" class="store03-15"><span>15</span></a>
											<a href="#" class="store03-16"><span>16</span></a>
											<a href="#" class="store03-17"><span>17</span></a>
											<a href="#" class="store03-18"><span>18</span></a>
											<a href="#" class="store03-19"><span>19</span></a> 
										</div> 
										<div class="layerbox"> 
											<p class="photo"><img src="//image.ssgdfs.com/images/shop/store/220X202.gif" alt="매장사진" /></p>
											<p class="storename">매장명</p> 
											<p class="brand">JOHN MASTERS ORGANICS</p> 
											<p class="tel">Tel : 051-123-4567</p> 
											<p class="loc">신세계면세점 B1f가능합니다.에 입점</p>
											<p class="close"><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/store/btn_close_layer.gif" alt="close" /></a></p>
										</div>
										<div class="change"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormap03_01.gif) no-repeat 0 0"><span>3F</span></p></div>	
										<div class="basics"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormap03.gif) no-repeat 0 0"><span>3F</span></p></div>	
										<!-- //영역 -->							
									</div>						 
								</div>
							</div> 
							<div class="page"> 					 
								<div class="scrollable"> 
									<div class="item"> 
										<!-- 영역 -->
										<div class="storelink"> 
											<a href="#" class="store02-01"><span></span></a>
											<a href="#" class="store02-02"><span></span></a>
											<a href="#" class="store02-03"><span>03</span></a>
											<a href="#" class="store02-04"><span>04</span></a>
											<a href="#" class="store02-05"><span>05</span></a>
											<a href="#" class="store02-06"><span>06</span></a>
											<a href="#" class="store02-07"><span>07</span></a>
											<a href="#" class="store02-08"><span>08</span></a>
											<a href="#" class="store02-09"><span>09</span></a>
											<a href="#" class="store02-10"><span>10</span></a> 
											<a href="#" class="store02-11"><span>11</span></a>
											<a href="#" class="store02-12"><span>12</span></a>
											<a href="#" class="store02-13"><span>13</span></a>
											<a href="#" class="store02-14"><span>14</span></a>
											<a href="#" class="store02-15"><span>15</span></a>
											<a href="#" class="store02-16"><span>16</span></a>
											<a href="#" class="store02-17"><span>17</span></a>
											<a href="#" class="store02-18"><span>18</span></a>
											<a href="#" class="store02-19"><span>19</span></a>
											<a href="#" class="store02-20"><span>20</span></a> 
											<a href="#" class="store02-21"><span>21</span></a>
											<a href="#" class="store02-22"><span>22</span></a>
											<a href="#" class="store02-23"><span>23</span></a>
											<a href="#" class="store02-24"><span>24</span></a>
											<a href="#" class="store02-25"><span>25</span></a>
											<a href="#" class="store02-26"><span>26</span></a>
											<a href="#" class="store02-27"><span>27</span></a>
											<a href="#" class="store02-28"><span>28</span></a>
											<a href="#" class="store02-29"><span>29</span></a>
											<a href="#" class="store02-30"><span>30</span></a>
											<a href="#" class="store02-31"><span>31</span></a>
											<a href="#" class="store02-32"><span>32</span></a>
											<a href="#" class="store02-33"><span>33</span></a>
										</div>
										<div class="layerbox"> 
											<p class="photo"><img src="//image.ssgdfs.com/images/shop/store/220X202.gif" alt="매장사진" /></p><!-- [D] 08/05 이미지 사이즈 150*120 -->
											<p class="storename">매장명</p> 
											<p class="brand">JOHN MASTERS ORGANICS</p> 
											<p class="tel">Tel : 051-123-4567</p> 
											<p class="loc">신세계면세점 B1f가능합니다.에 입점</p>
											<p class="close"><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/store/btn_close_layer.gif" alt="close" /></a></p>
										</div>
										<!-- [D] 08/05 이미지 floormap02_33 까지 --> 
										<div class="change"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormap02_01.gif) no-repeat 0 0"><span>2F</span></p></div>	
										<div class="basics"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormap02.gif) no-repeat 0 0"><span>2F</span></p></div>
										<!-- //영역 -->							
									</div>						 
								</div>
							</div> 
							<div class="page"> 					 
								<div class="scrollable"> 
									<div class="item"> 
										<!-- 영역 -->
										<div class="storelink">
											<a href="#" class="store01-01"><span>01</span></a>
											<a href="#" class="store01-02"><span>02</span></a>
											<a href="#" class="store01-03"><span>03</span></a>
											<a href="#" class="store01-04"><span>04</span></a>
											<a href="#" class="store01-05"><span>05</span></a> 
										</div>
										<div class="layerbox"> 
											<p class="photo"><img src="//image.ssgdfs.com/images/shop/store/220X202.gif" alt="매장사진" /></p><!-- [D] 08/05 이미지 사이즈 150*120 -->
											<p class="storename">매장명</p> 
											<p class="brand">JOHN MASTERS ORGANICS</p> 
											<p class="tel">Tel : 051-123-4567</p> 
											<p class="loc">신세계면세점 B1f가능합니다.에 입점</p>
											<p class="close"><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/store/btn_close_layer.gif" alt="close" /></a></p>
										</div> 
										<!-- [D] 08/05 이미지 floormap01_7 까지 --> 
										<div class="change"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormap01_01.gif) no-repeat 0 0"><span>1F</span></p></div>	
										<div class="basics"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormap01.gif) no-repeat 0 0"><span>1F</span></p></div>
										<!-- //영역 -->							
									</div>						 					 
								</div>
							</div> 
							<div class="page"> 					 
								<div class="scrollable">
									<div class="item"> 
										<!-- 영역 -->
										<div class="storelink"> 
											<a href="#" class="storeb1-01"><span>01</span></a>
											<a href="#" class="storeb1-02"><span>02</span></a>
											<a href="#" class="storeb1-03"><span>03</span></a>
											<a href="#" class="storeb1-04"><span>04</span></a>
											<a href="#" class="storeb1-05"><span>05</span></a>
											<a href="#" class="storeb1-06"><span>06</span></a>
											<a href="#" class="storeb1-07"><span>07</span></a>
											<a href="#" class="storeb1-08"><span>08</span></a>
											<a href="#" class="storeb1-09"><span>09</span></a>
											<a href="#" class="storeb1-10"><span>10</span></a> 
											<a href="#" class="storeb1-11"><span>11</span></a>
											<a href="#" class="storeb1-12"><span>12</span></a>
											<a href="#" class="storeb1-13"><span>13</span></a>
											<a href="#" class="storeb1-14"><span>14</span></a>
											<a href="#" class="storeb1-15"><span>15</span></a>
											<a href="#" class="storeb1-16"><span>16</span></a>
											<a href="#" class="storeb1-17"><span>17</span></a>
											<a href="#" class="storeb1-18"><span>18</span></a>
											<a href="#" class="storeb1-19"><span>19</span></a>
											<a href="#" class="storeb1-20"><span>20</span></a> 
											<a href="#" class="storeb1-21"><span>21</span></a>
											<a href="#" class="storeb1-22"><span>22</span></a>
											<a href="#" class="storeb1-23"><span>23</span></a>
											<a href="#" class="storeb1-24"><span>24</span></a>
											<a href="#" class="storeb1-25"><span>25</span></a>
											<a href="#" class="storeb1-26"><span>26</span></a>
											<a href="#" class="storeb1-27"><span>27</span></a>
											<a href="#" class="storeb1-28"><span>28</span></a>
											<a href="#" class="storeb1-29"><span>29</span></a>
											<a href="#" class="storeb1-30"><span>30</span></a> 
											<a href="#" class="storeb1-31"><span>31</span></a>
											<a href="#" class="storeb1-32"><span>32</span></a>
											<a href="#" class="storeb1-33"><span>33</span></a>
											<a href="#" class="storeb1-34"><span>34</span></a>
											<a href="#" class="storeb1-35"><span>35</span></a>
											<a href="#" class="storeb1-36"><span>36</span></a>
											<a href="#" class="storeb1-37"><span>37</span></a>
											<a href="#" class="storeb1-38"><span>38</span></a>
											<a href="#" class="storeb1-39"><span>39</span></a>
											<a href="#" class="storeb1-40"><span>40</span></a>
											<a href="#" class="storeb1-41"><span>41</span></a>
											<a href="#" class="storeb1-42"><span>42</span></a>
											<a href="#" class="storeb1-43"><span>43</span></a>											
											<a href="#" class="storeb1-44"><span>44</span></a>
											<a href="#" class="storeb1-45"><span>45</span></a>
											<a href="#" class="storeb1-46"><span>46</span></a>
											<a href="#" class="storeb1-47"><span>47</span></a>
										</div>
										<div class="layerbox"> 
											<p class="photo"><img src="//image.ssgdfs.com/images/shop/store/220X202.gif" alt="매장사진" /></p><!-- [D] 08/05 이미지 사이즈 150*120 -->
											<p class="storename">매장명</p> 
											<p class="brand">JOHN MASTERS ORGANICS</p> 
											<p class="tel">Tel : 051-123-4567</p> 
											<p class="loc">신세계면세점 B1f가능합니다.에 입점</p>
											<p class="close"><a href="#" class="close"><img src="//image.ssgdfs.com/images/shop/store/btn_close_layer.gif" alt="close" /></a></p>
										</div>
										<div class="change"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormapb1_01.gif) no-repeat 0 0"><span>B1F</span></p></div>	
										<div class="basics"><p style="background:url(//image.ssgdfs.com/images/shop/store/floormapb1.gif) no-repeat 0 0"><span>B1F</span></p></div>
										<!-- //영역 -->							
									</div>						 				 
								</div>
							</div>
						</div>	 
					</div>	
				</div>	
				 
				<h4><strong>1F가능합니다. 매장리스트</strong></h4>
				<div class="table-listhtype">  
					<div class="list storename">
						<table summary="매장리스트">
							<caption>매장리스트</caption>
							<colgroup>  
								<col width="33%" /> 
								<col width="34%" /> 
								<col width="33%" />  
							</colgroup> 
							<tbody>    
								<tr> 
									<td><a href="#"><span class="no">01</span><span class="brand">JOHN MASTERS ORGANICS</span><span class="item">(노트북/전자사전/MP3)</span><span class="tel">010-9034-3464</span></a></td>
									<td><a href="#"><span class="no">01</span><span class="brand">브랜드명1</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
									<td><a href="#"><span class="no">01</span><span class="brand">브랜드명1</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
								</tr>     
								<tr> 
									<td><a href="#" class="selected"><span class="no">01</span><span class="brand">브랜드명1</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
									<td><a href="#"><span class="no">01</span><span class="brand">브랜드명1</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
									<td><a href="#"><span class="no">01</span><span class="brand">FREDERIQUE CONSTANT</span><span class="item">(노트북/전자사전/MP3)</span><span class="tel">010-9034-3464</span></a></td>
								</tr>    
								<tr> 
									<td><a href="#"><span class="no">01</span><span class="brand">브랜드명1</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
									<td><a href="#"><span class="no">01</span><span class="brand">JOHN MASTERS ORGANICS</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
									<td><a href="#"><span class="no">01</span><span class="brand">브랜드명1</span><span class="item">(아이템명)</span><span class="tel">010-9034-3464</span></a></td>
								</tr> 
							</tbody>
						</table>
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



