<%@page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="2013 SHINSEGAE DUTY FREE" />
<title>SHINSEGAE 고객센터</title>
<link href="/css/layout.css" rel="stylesheet" type="text/css" />
<link href="/css/customer.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie7.css"><![endif]-->
<link href="/css/jquery.ui.datepicker.css" rel="stylesheet" type="text/css" /> 
<link href="/css/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
<link href="/css/selectbox.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/js/chart/css/jquery.jqplot.min.css" />

<script type="text/javascript" src="/js/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.rotate.js"></script>
<script type="text/javascript" src="/js/jquery/common.js"></script>
<script type="text/javascript" src="/js/jquery/common_customer.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.core.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="/js/jquery/calendar.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.selectbox-0.2.1.js"></script> 
<script type="text/javascript" src="/js/chart/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="/js/chart/shCore.min.js"></script>
<script type="text/javascript" src="/js/chart/shBrushJScript.min.js"></script>
<script type="text/javascript" src="/js/chart/shBrushXml.min.js"></script>
<script type="text/javascript" src="/js/chart/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="/js/chart/jqplot.highlighter.min.js"></script>
<script type="text/javascript" src="/js/chart/jqplot.cursor.min.js"></script> 
<script type="text/javascript" src="/js/chart/jqplot.pointLabels.min.js"></script>
<script type="text/javascript">

    $(document).ready(function () {
        var s1 = [[1, 1000.33], [2, 900.33], [3, 1000.33], [4, 900.33], [5, 1000.33], [6, 900.33], [7, 1000.33], [8, 900.33], [9, 1000.33], [10, 900.33], [11, 1000.33], [12, 900.33], [13, 1000.33], [14, 900.33], [15, 1000.33], [16, 1000.33], [17, 1000.33], [18, 1000.33], [19, 1000.33], [20, 1000.33], [21, 1000.33], [22, 1000.33], [23, 1000.33], [24, 1000.33], [25, 1000.33], [26, 1000.33], [27, 1000.33], [28, 1000.33], [29, 1000.33], [30, 1000.33], [31, 1000.33]];
        var s2 = [[1, 101.01], [2, 101.01], [3, 101.01], [4, 101.01], [5, 101.01], [6, 101.01], [7, 101.01], [8, 101.01], [9, 101.01], [10, 101.01], [11, 101.01], [12, 101.01], [13, 101.01], [14, 101.01], [15, 101.01], [16, 101.01], [17, 101.01], [18, 101.01], [19, 101.01], [20, 101.01], [21, 101.01], [22, 101.01], [23, 101.01], [24, 101.01], [25, 101.01], [26, 101.01], [27, 101.01], [28, 101.01], [29, 101.01], [30, 101.01], [31, 101.01]];
        var s3 = [[1, 7.17], [2, 7.17], [3, 7.17], [4, 7.17], [5, 7.17], [6, 7.17], [7, 7.17], [8, 7.17], [9, 7.17], [10, 7.17], [11, 7.17], [12, 7.17], [13, 7.17], [14, 7.17], [15, 7.17], [16, 7.17], [17, 7.17], [18, 7.17], [19, 7.17], [20, 7.17], [21, 7.17], [22, 7.17], [23, 7.17], [24, 7.17], [25, 7.17], [26, 7.17], [27, 7.17], [28, 7.17], [29, 7.17], [30, 7.17], [31, 7.17]];

        plot1 = $.jqplot("exchangeRate", [s1, s2, s3], {
            // Turns on animatino for all series in this plot.
            animate: false,
            // Will animate plot on calls to plot1.replot({resetAxes:true})
            animateReplot: true,
            cursor: {
                style:'default',
                followMouse:true,
                show: true,
                zoom: true,
                looseZoom: true,
                showTooltip: false
            },
            series:[
                {
                    pointLabels: {
                        show: false
                    },
                    showHighlight: true,
                    yaxis: 'yaxis',
                    rendererOptions: {
                        // Speed up the animation a little bit.
                        // This is a number of milliseconds.  
                        // Default for bar series is 3000.  
                        animation: {
                            speed: 2500
                        },
                        highlightMouseOver: false
                    }
                }, 
                {
                    yaxis: 'y2axis',
                    rendererOptions: {
                        // speed up the animation a little bit.
                        // This is a number of milliseconds.
                        // Default for a line series is 2500.
                        animation: {
                            speed: 2000
                        }
                    }
                }, 
                {
                    yaxis: 'y3axis',
                    rendererOptions: {
                        // speed up the animation a little bit.
                        // This is a number of milliseconds.
                        // Default for a line series is 2500.
                        animation: {
                            speed: 2000
                        }
                    }
                }
            ],
            axesDefaults: {
                pad: 0,
                showGridline:false
            },
            axes: {
                // These options will set up the x axis like a category axis.
                xaxis: {
                    tickInterval: 2,
                    drawMajorGridlines: true,
                    drawMinorGridlines: false,
                    drawMajorTickMarks: false,
                    drawMinorTickMarks: false,
                    rendererOptions: {
                        // tickInset: 0,
                        // minorTicks: 0,
                        min:1,
                        max:31
                    }
                },
                yaxis: {
                    show: false,
                    tickOptions: {
                        showMark: false,
                        showGridline:false,
                        formatString: "%P",
                        showLabel:false
                    },
                    rendererOptions: {
                        //forceTickAt0: true
                    },
                    min:0,
                    max:1500
                },
                y2axis: {
                    tickOptions: {
                        showMark: false,
                        showGridline:false,
                        formatString: "%P",
                        showLabel:false
                    },
                    rendererOptions: {
                        // align the ticks on the y2 axis with the y axis.
                        //alignTicks: true,
                        //forceTickAt0: true
                    },
                    min:0,
                    max:200
                },y3axis: {
                    tickOptions: {
                        showMark: false,
                        showGridline:false,
                        formatString: "%P",
                        showLabel:false
                    },
                    rendererOptions: {
                        // align the ticks on the y2 axis with the y axis.
                        // alignTicks: true,
                        // forceTickAt0: true
                    },
                    min:0,
                    max:10
                }
            },
            highlighter: {
                show: true, 
                showLabel: true, 
                tooltipAxes: 'y',
                sizeAdjust: 7.5 , tooltipLocation : 'ne'
            }
        });

		var htmlRate = "";
        $('#exchangeRate').bind('jqplotDataMouseOver', 
            function (ev, seriesIndex, pointIndex, data) {
			  htmlRate = '<span class="f_krw">￦'+s1[pointIndex][1]+'</span><span class="f_jpy">￥'+s2[pointIndex][1]+'</span><span class="f_cny">元'+s3[pointIndex][1]+'</span>';
              $('#exchangeRateText span').remove();
			  $('#exchangeRateText').append(htmlRate);
            }
        );

      
    });
</script>
</head>
<body>
<div id="wrapper">
	<div id="wrap">
		<%@include file="/publish/frontoffice/include/head.jsp"%>
		<div id="body">  
			<div class="customer">				 
				<div class="sidebar">
					<%@include file="/publish/frontoffice/include/sub_customer.jsp"%>						
					<%@include file="/publish/frontoffice/include/side_common.jsp"%>					
				</div> 
				<div id="contents">  				
					<div class="page-sublocation">   
						<a href="#">主页</a><span>&gt;</span><a href="#">客服中心</a><span>&gt;</span><strong>查看汇率</strong>
					</div>
					
					<%@include file="/publish/frontoffice/include/top_customer.jsp"%><!-- //고객센터 공통 -->
					 
					<h3><img src="/images/shop/cn/customer/title_exchange.gif" alt="查看汇率" /><span><img src="/images/shop/cn/customer/explain_exchange.gif" alt="既可以简单查看多种汇率变动，也可 选择查看您想了解的汇率。" /></span></h3>
					
					<div class="today-exchange">  
						<p class="title"><img src="/images/shop/cn/customer/exchange_title.gif" alt="今日汇率" /></p>
						<p class="today">2013.07.03</p> 						
						<p class="info">汇率变更时间 <span>凌晨12时</span></p>						
						<p class="exchange-info"><span class="f_usd">$1</span><span class="f_jpy">￥101.01</span><span class="f_krw">￦1,000.33</span><!--<span class="f_cny">元7.17</span>--></p>						
					</div>	
					
					<ul class="ch-check">
						<li>
							<input type="checkbox" id="all01" />
							<label for="all01">全部</label>
						</li>
						<li>
							<input type="checkbox" id="jpy01" />
							<label for="jpy01">中国 CNY(￥)</label>
						</li>
						<li>
							<input type="checkbox" id="krw01" />
							<label for="krw01">韩国 KRW(\)</label>
						</li><!--
						<li>
							<input type="checkbox" id="cny01" />
							<label for="cny01">위안화</label>
						</li> -->
					</ul>
					
					<!-- exchange-con 01 -->
					<div class="exchange-con">
						<div class="date-info">
							<p class="year"><a href="#"><img src="/images/shop/cn/customer/btn_date_prev.gif" alt="이전" /></a><span>2013</span><a href="#"><img src="/images/shop/cn/customer/btn_date_next.gif" alt="다음" /></a></p>
							<p class="month"><a href="#"><img src="/images/shop/cn/customer/btn_date_prev.gif" alt="이전달" /></a><span>07</span><a href="#"><img src="/images/shop/cn/customer/btn_date_next.gif" alt="다음달" /></a></p>
							<p class="today"><a href="#"><img src="/images/shop/cn/customer/btn_today.gif" alt="今日" /></a></p>							
						</div>						
					
						<div class="date-table"> 
							<table summary="달력">
                    			<caption>달력</caption>
								<colgroup>  
									<col width="15%" />
									<col width="14%" /> 
									<col width="14%" /> 
									<col width="14%" /> 
									<col width="14%" /> 
									<col width="14%" /> 
									<col width="15%" /> 
								</colgroup>
								<thead>
									<tr> 
										<th scope="row">星期日</th> 
										<th scope="row">星期一</th> 
										<th scope="row">星期二</th> 
										<th scope="row">星期三</th>  
										<th scope="row">星期四</th> 
										<th scope="row">星期五</th> 
										<th scope="row">星期六</th>  
									</tr>
								</thead>
								<tbody>  
									<tr> 
										<td></td>  
										<td>
											<div class="box">
												<p class="work">1</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">2</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td class="today">
											<div class="box">
												<p class="work">3</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">4</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">5</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">6</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
									</tr> 
									<tr>   
										<td>
											<div class="box">
												<p class="work">7</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>  
										<td>
											<div class="box">
												<p class="work">8</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">9</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">10</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">11</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">12</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">13</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
									</tr>  
									<tr>   
										<td>
											<div class="box">
												<p class="work">14</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>  
										<td>
											<div class="box">
												<p class="work">15</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">16</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">17</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">18</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">19</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">20</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
									</tr>   									  
									<tr>   
										<td>
											<div class="box">
												<p class="work">21</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">22</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">23</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
										</td>
										<td>
											<div class="box">
												<p class="work">24</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">25</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">26</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">27</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
									</tr> 
									<tr>   
										<td>
											<div class="box">
												<p class="work">28</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">29</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">30</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td>
											<div class="box">
												<p class="work">31</p>
												<p><span class="f_jpy">￥</span>101.01</p>
												<p><span class="f_krw">￦</span>1,000.33</p><!--
												<p><span class="f_cny">元</span>7.17</p>-->
											</div>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr> 
								</tbody>
							</table>
						</div> 					
					</div>
 					<!-- //exchange-con 01 -->
					
					<!-- exchange-con 02 -->
					<div class="exchange-con">
						<div class="date-info">
							<p class="year"><a href="#"><img src="/images/shop/cn/customer/btn_date_prev.gif" alt="이전" /></a><span>2013</span><a href="#"><img src="/images/shop/cn/customer/btn_date_next.gif" alt="다음" /></a></p>
							<p class="month"><a href="#"><img src="/images/shop/cn/customer/btn_date_prev.gif" alt="이전달" /></a><span>07</span><a href="#"><img src="/images/shop/cn/customer/btn_date_next.gif" alt="다음달" /></a></p>
							<p class="today"><a href="#"><img src="/images/shop/cn/customer/btn_today.gif" alt="今日" /></a></p>							
						</div>	
						
						<div class="today-info">     						
							<p class="today">2013.07.03</p>  				
							<p class="exchange-info" id="exchangeRateText"><span class="f_usd">$1</span><span class="f_jpy">￥101.01</span><span class="f_krw">￦1,000.33</span><!--<span class="f_cny">元7.17</span>--></p> 													
						</div>	
						
						<div class="graph-table"> 
						
							<!-- [D] 정보공유 개발시 삭제 -->
							<div style="padding:50px; line-height:20px;">
								<p style="padding-bottom:10px; color:#333; font-weight:bold;">환율 차트 (원화, 엔화, 위안화 색상 구분)</p>
								<p>원화 <span class="f_krw">￦1,000.33</span> _ #be1e2d</p>
								<p>엔화 <span class="f_jpy">￥101.01</span> _ #df4800</p>
								<p>위안화 <span class="f_cny">元7.17</span> _ #638c0d</p>
							</div>
							<!-- //[D] 정보공유 개발시 삭제 -->
							<div id="exchangeRate">
							</div>
						</div>
					</div>
					<!-- //exchange-con 02 -->					
					 										
				 
				</div><!-- //contents -->  
			</div><!-- //customer -->	 
		
		</div><!-- end body -->		
		<%@include file="/publish/frontoffice/include/quickbar.jsp"%>
		<%@include file="/publish/frontoffice/include/foot.jsp"%>
	</div><!-- end wrap -->
	<p class="go-top"><a href="#head"><img src="//image.ssgdfs.com/images/shop/common/top.png" alt="top" /></a></p>
</div><!-- end wrapper -->
</body>
</html>