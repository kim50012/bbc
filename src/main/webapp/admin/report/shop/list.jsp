<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="微店铺概况"/></title>
<script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts.js"></script>
<style type="text/css">
	body{margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 12px;}
	*{margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 12px;}
	.name{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
	.show-div-msg{font-size:12px;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
	.show-div-msg td{height:25px;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;border:0;}
	.title{
		width: 100%;
		font-size: 14px;
		margin-bottom: 8px;
		height: 20px;
		line-height: 20px;
	}
	.title div{float: left;}
	.title div span:first-child{margin-left: 15px;}
	.title div span:last-child{margin-left: 50px;}
	.identfy-span{
		background-position: 1px 0;
		background-repeat: no-repeat;
		padding-left:30px;
	}
	.identfy-span.sure{
		background-image: url('/admin/images/msgControl/confirm -sure.png');
	}
	.identfy-span.no{
		background-image: url('/admin/images/msgControl/confirm -no.png');
	}
	.report-warp {
		padding: 20px 10px;
		border: 1px solid #eeeeee;
	}
	.report-warp .report-item + .report-item
	,.report-warp .report-item + .report-item2
	,.report-warp .report-item2 + .report-item2
	,.report-warp .report-item2 + .report-item {
		margin-left: 12px;
	}
	.report-warp .report-item {
		position: relative;
		float: left;
		width: 110px;
		height: 100px;
		border: 1px solid #e5e5e5;
		border-radius: 8px;
	}
	.report-warp .report-item .report-type-content {
		position: relative;
		float: left;
		width: 	102px;
		height: 100%;
		border-top-right-radius: 8px;
		border-bottom-right-radius: 8px;
	}
	.report-warp .report-item2 {
		position: relative;
		float: left;
		width: 250px;
		height: 100px;
		border: 1px solid #e5e5e5;
		border-radius: 8px;
	}
	.report-warp .report-item2 .report-type-color {
		float: left;
		width: 8px;
		height: 100%;
		border-bottom-left-radius: 8px;
		border-top-left-radius: 8px;
	}
	
	.report-warp .report-type-color.bg-red {
		background-color: #d1102d;
	}
	
	.report-warp .report-type-color.bg-gray {
		background-color: #e6e6e6;
	}
	.report-warp .report-item2 .report-type-content1 {
		position: relative;
		float: left;
		width: 	92px;
		height: 100%;
	}
	.report-warp .report-item2 .report-type-content2 {
		position: relative;
		float: left;
		width: 	1px;
		height: 80px;
		margin-top: 10px;
		border-right: 1px solid #e5e5e5;
	}
	.report-warp .report-item2 .report-type-content3 {
		position: relative;
		float: left;
		width: 	148px;
		height: 100%;
		border-top-right-radius: 8px;
		border-bottom-right-radius: 8px;
	}
	
	.time-li.time-select{
		color:#313131;
		background-color: #fff799;
	}
	.time-li.time-no{
		color:#a3a3a3;
	}
	.PoupDiv{
	 	border-radius:4px;
	 	min-width:150px;
	 	min-height:45px;
	 	/* border:1px solid #c5c5c5; */
	 	position:absolute;
	 	background-color: #fff799;
	 	z-index: 2000;
		/* filter: progid:DXImageTransform.Microsoft.Shadow(color=#e0e0e0,direction=120, strength=2); */
		/* -moz-box-shadow: 2px 2px 10px #e0e0e0;
		-webkit-box-shadow: 2px 2px 10px #e0e0e0;
		box-shadow: 0px 0px 10px #e0e0e0; */
		left:512px;
		top:25px; 
		display:none;
	}
	 .dropDown1,.dropDown2
	 {
	 	width:0;
	 	height:0; 
	 	overflow:hidden;
	 	border-width:5px; 
	 	border-style:dotted dotted solid;  
	 	position:absolute;
	 }
	 .PoupDivBody{
	 	position: absolute; 
	 	width:10px; 
	 	height: 10px; 
	 	left:20px; 
	 	top:-10px
	 }
	 .dropDown1{
	 	border-color:transparent transparent #fff;
	 	top:-1px
	 }
	 .dropDown2{
	 	border-color:transparent transparent #FFF799; 
	 	top:0
	 }
	 .ui-box-body {
	 	padding-top:2px;
	 }
	.ui-box-body p{
		font-size:12px;
		line-height:20px;
		color:#313131;
		padding-left:5px;
		padding-right:30px;
	}
	.show-div-msg{font-size:14px;}
	.show-div-msg td{height:25px;}
</style>
<script type="text/javascript">
function showPage(pageNo, pageSize){
	window.scrollTo(0,$('.result-grid-table').offset().top);
	var params = {
			startDate : $('#createdDateFrom').val()
			,endDate : $('#createdDateTo').val()
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/report/shop/listFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		 $this.hideLoading();
	 });
}
function searchData(){
	var startDate = $('#createdDateFrom').val();
	var endDate = $('#createdDateTo').val();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	window.location.href = '/admin/report/shop/list.htm?startDate='+startDate+'&endDate='+endDate;
}
$(function(){
	//显示不同时间的不同数据。
	$('.time-li').click(function(){
		var flagNum = $(this).attr('data-flagCount');
		var flagUv = $(this).parent().parent().attr('data-flagUv');
		$(this).parent().parent().find('li').find('.time-li.time-select').removeClass('time-select').addClass('time-no');
		$(this).removeClass('time-no').addClass('time-select');
		var num = 0;
		if(flagNum == 1){
			if(flagUv == 'PV'){
				num = ${requestScope.countMap.PV_COUNT1};
			}else{
				num = ${requestScope.countMap.UV_COUNT1};
			}
		}else if(flagNum == 2){
			if(flagUv == 'PV'){
				num = ${requestScope.countMap.PV_COUNT2};
			}else{
				num = ${requestScope.countMap.UV_COUNT2};
			}
		}else if(flagNum == 3){
			if(flagUv == 'PV'){
				num = ${requestScope.countMap.PV_COUNT3};
			}else{
				num = ${requestScope.countMap.UV_COUNT3};
			}
		}
		if(num == 0){
			if(flagUv == 'PV'){
				$('#content-left-1').removeClass('bg-red');
				$('#content-left-1').addClass('bg-gray');
				$('#content-right-1').text(num);
			}else{
				$('#content-left-2').removeClass('bg-red');
				$('#content-left-2').addClass('bg-gray');
				$('#content-right-2').text(num);
			}
		}else{
			if(flagUv == 'PV'){
				$('#content-left-1').removeClass('bg-gray');
				$('#content-left-1').addClass('bg-red');
				$('#content-right-1').text(num);
			}else{
				$('#content-left-2').removeClass('bg-gray');
				$('#content-left-2').addClass('bg-red');
				$('#content-right-2').text(num);
			}
		}
	});
	
	var msg = new Array();
	$.ajax({
		url : '/admin/report/shop/getSevenMsg.htm', 
		success : function(data){
			var dataM = data.result;
			$('.highcharts-legend-item').hover(function(){
	    	},
	    	function(){
	    		$('#PoupDivClose').hide()
	    	}
	    	);
			if(dataM.length == 0){
				for(var i = 0;i < 7;i++){
					msg[i] = new Array();
					var today = new Date(); // 获取今天时间
					today.setDate(today.getDate()+(i-6));
					var day = getMyDate(today);
					var flag = true;
					for(var j = 0;j < dataM.length;j++){
						if(dataM[j].AI_YMD == day){
							msg[i][0] = day;
							msg[i][1] = dataM[j].PV_COUNT4;
							msg[i][2] = dataM[j].UV_COUNT4;
							msg[i][3] = dataM[j].GOODS_COUNT;
							//msg[i][4]=dataM[j].ORDER_PRICE_SUM;
							break;
						}
						if(j == dataM.length-1){
							flag = false;	
						}
					}
					if(!flag || dataM.length == 0){
						msg[i][0] = day;
						msg[i][1] = 0;
						msg[i][2] = 0;
						msg[i][3] = 0;
						//msg[i][4]=0;
					}
					
				}
				var splinechart;  
				Highcharts.setOptions({ 
				    colors: ['#3473dd', '#0e9715', '#d1102d', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', 
				'#FFF263', '#6AF9C4'] 
				}); 
			    $(document).ready(function () {  
			    	
			        splinechart = new Highcharts.Chart({  
			            chart: {  
			                renderTo: 'chart-container',  
			                type: 'spline',  
			                margin: [50, 30, 70, 34],

			            }
			            , 
			            credits: {  
			            	  enabled: false  
			            	},  
			            color: [  
			            '#006ebe'  
			            ]  ,  
			            subtitle: {  
			                style: {  
			                    display: 'none'  
			                }  
			            } ,  
			            xAxis: {  
			                lineWidth: 1,  
			                //lineColor: '#dfe7ef',  
			                gridLineWidth: 0,  
			                lineColor: '#000000',  
			                startOnTick: false,  
			                tickPixelInterval: 110,  
			                type: 'datetime', 
			                dateTimeLabelFormats: {
			                	day: '%Y-%m-%d'
			                },
			                labels: {  
			                    y: 40,
			                    x:-4,
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '8px',  
			                        fontWeight: 'normal' 
			                     }
			                },  
			                tickColor: '#000000',  
			                tickLength: 5,  
			                tickWidth: 1,  
			                title: {  
			                    style:  
			              	{  
			                  display: 'none'  
			              	}  
			               },
			            },  
			      yAxis: {  
			                allowDecimals: true,  
			                startOnTick: false,  
			               	endOnTick: true,  
			                lineWidth: 1,  
			                gridLineWidth:0,  
			                gridLineColor: '#d3d3d3',  
			                lineColor: '#000000',  
			                tickColor: '#000000',  
			                tickLength: 5,  
			                tickWidth: 1,
			                min:0,
			                max:40,
			                tickInterval:40,
			                title: {  
			                    text: '',  
			                    style: {  
			                        color: '#02528b',  
			                        fontSize: '12px',  
			                        fontWeight: 'normal'  

			                    }  
			                }, 
			               labels: {  
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '10px',  
			                        fontWeight: 'normal' ,
			                    }  
			                }  
			            },  
			            legend: {  
			                layout: 'horizontal',  
			                backgroundColor: '#ffffff',  
			                align: 'center',  
			                verticalAlign: 'top',  
			                x: 0,  
			                y: -10,  
			                floating: true,  
			                shadow: false, 
			                itemWidth:140,
			                borderWidth: 0,
			                itemStyle: {
			                    fontSize:'12px'
			                }
			            },  
			            plotOptions: {  
			                spline: {  
			                    shadow: false,  
			                    animation: false,  
			                    lineWidth: 1  
			                }  
			            }, 
			          tooltip: {
			        	  shared: true, //是否共享提示，也就是X一样的所有点都显示出来
			            	useHTML: true, //是否使用HTML编辑提示信息
			            	headerFormat: '<small style="font-size:12px;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;">{point.key}</small><table>',//<small>{point.key}</small><table>
			            	pointFormat: '<tr class="show-div-msg"><td style="color: {series.color};width:40px;">{series.name}:&nbsp;&nbsp;</td>' +
			            	'<td style="font-weight:bold;text-align:left;"><b>{point.y}</b></td></tr>',
			            	footerFormat: '</table>',
			            	valueDecimals: 2 //数据值保留小数位数
			            	,crosshairs:true,
			            	xDateFormat:'%A', 
			            	formatter:function(){
			            		var formatterName = dayChange(Highcharts.dateFormat('%A', this.x));
			            		formatterName = "<span class='name'>"+formatterName+"</span>";
			            		for(var i = 0 ;i<this.points.length;i++)
			            		{
			            			if (this.points[i].series.name == 'K10AH_AP'){
			            				formatterName +="<br/><span class='name' style='color: "+this.points[i].series.color+"'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'>" +  this.points[i].y + '</span>';		            				
			            			}
			            			else{
			            				formatterName +="</span>"+"<br/><span class='name' style='color: "+this.points[i].series.color+"'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'>" + this.points[i].y + '</span>';		            				
			            			}
			            		}
			            		return formatterName;
			            	}
			            }, 
			            series: [
			                     {  
			                name: '<ui:i18n key="点击量"/>PV',  
			                data: [[ msg[0][1] ],
			                       [ msg[1][1] ],
			                       [ msg[2][1] ], 
			                       [ msg[3][1] ], 
			                       [ msg[4][1] ],
			                       [ msg[5][1] ], 
			                       [ msg[6][1] ]], 
			                lineColor:'#3473dd',
			              /*   dataLabels: {  
			                    enabled: true  
			                }, */
			                marker: {
			                	symbol: 'circle'
			                	},
			                pointStart: Date.UTC(msg[0][0].split('-')[0], (msg[0][0].split('-')[1]-1), msg[0][0].split('-')[2]),
				             pointInterval: 24 * 3600 * 1000   
			            }   ,
			            {  
			                name: '<ui:i18n key="访客数"/>UV',  
			                data: [[ msg[0][2] ],
			                       [ msg[1][2] ],
			                       [ msg[2][2] ], 
			                       [ msg[3][2] ], 
			                       [ msg[4][2] ],
			                       [ msg[5][2] ], 
			                       [ msg[6][2] ]], 
			                Color:'#0e9715',
			              /*   dataLabels: {  
			                    enabled: true  
			                }, */
			                marker: {
			                	symbol: 'circle'
			                	},
			                pointStart: Date.UTC(msg[0][0].split('-')[0], (msg[0][0].split('-')[1]-1), msg[0][0].split('-')[2]),
				             pointInterval: 24 * 3600 * 1000   
			            } ,
			            {  
			                name: '<ui:i18n key="商品"/>',  
			                data: [[ msg[0][3] ],
			                       [ msg[1][3] ],
			                       [ msg[2][3] ], 
			                       [ msg[3][3] ], 
			                       [ msg[4][3] ],
			                       [ msg[5][3] ], 
			                       [ msg[6][3] ]], 
			                lineColor:'#d1102d',
			              /*   dataLabels: {  
			                    enabled: true  
			                }, */
			                marker: {
			                	symbol: 'circle'
			                	},
			                pointStart: Date.UTC(msg[0][0].split('-')[0], (msg[0][0].split('-')[1]-1), msg[0][0].split('-')[2]),
				             pointInterval: 24 * 3600 * 1000   
			            } 
			            ]  

			        });  
			    	$('.highcharts-legend-item').hover(function(){
			    		var id = $(this).index();
			    		$('.ui-box-body').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose').attr('style','left:232px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="点击量"/>：<ui:i18n key="浏览本店网页的次数"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose').attr('style','left:372px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p>'+
			    					'<p><ui:i18n key="访客数"/>：<ui:i18n key="浏览本店网页的一台客户端为一个访客"/>.</p><p>00:00-24:00<ui:i18n key="内相同的客户端只被计算一次"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 2){
			    			$('#PoupDivClose').attr('style','left:512px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="商品"/>：<ui:i18n key="浏览本店商品的次数"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}
			    	},
			    	function(){
			    		$('#PoupDivClose').hide()
			    	}
			    	);
			    });  
			}else{
				for(var i = 0;i < 7;i++){
					msg[i] = new Array();
					var today = new Date(); // 获取今天时间
					today.setDate(today.getDate()+(i-6));
					var day = getMyDate(today);
					var flag = true;
					for(var j = 0;j < dataM.length;j++){
						if(dataM[j].AI_YMD == day){
							msg[i][0] = day;
							msg[i][1] = dataM[j].PV_COUNT4;
							msg[i][2] = dataM[j].UV_COUNT4;
							msg[i][3] = dataM[j].GOODS_COUNT;
							//msg[i][4]=dataM[j].ORDER_PRICE_SUM;
							break;
						}
						if(j == dataM.length-1){
							flag = false;	
						}
					}
					if(!flag || dataM.length == 0){
						msg[i][0] = day;
						msg[i][1] = 0;
						msg[i][2] = 0;
						msg[i][3] = 0;
						//msg[i][4]=0;
					}
					
				}
				var splinechart;  
				Highcharts.setOptions({ 
				    colors: ['#3473dd', '#0e9715', '#d1102d', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', 
				'#FFF263', '#6AF9C4'] 
				}); 
				Highcharts.setOptions({ 
                    lang: { 
                        numericSymbols: null 
                    } 
                });
			    $(document).ready(function () {  
			    	
			        splinechart = new Highcharts.Chart({  
			            chart: {  
			                renderTo: 'chart-container',  
			                type: 'spline',  
			                margin: [50, 30, 70, 70],

			            }
			            , 
			            credits: {  
			            	  enabled: false  
			            	},  
			            color: [  
			            '#006ebe'  
			            ]  ,  
			            subtitle: {  
			                style: {  
			                    display: 'none'  
			                }  
			            } ,  
			            xAxis: {  
			                lineWidth: 1,  
			                //lineColor: '#dfe7ef',  
			                gridLineWidth: 0,  
			                lineColor: '#000000',  
			                startOnTick: false,  
			                tickPixelInterval: 110,  
			                type: 'datetime', 
			                dateTimeLabelFormats: {
			                	day: '%Y-%m-%d'
			                },
			                labels: {  
			                    y: 40, 
			                    x:-4,
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '8px',  
			                        fontWeight: 'normal' 
			                     }
			                },  
			                tickColor: '#000000',  
			                tickLength: 5,  
			                tickWidth: 1,  
			                title: {  
			                    style:  
			              	{  
			                  display: 'none'  
			              	}  
			               },
			            },  
			      yAxis: {  
			                allowDecimals: true,  
			                startOnTick: false,  
			               	endOnTick: true,  
			                lineWidth: 1,  
			                gridLineWidth:0,  
			                gridLineColor: '#d3d3d3',  
			                lineColor: '#000000',  
			                tickColor: '#000000',  
			                tickLength: 5,  
			                tickWidth: 1,
			                min:0,
			                //max:100,
			                //tickInterval:40,
			                title: {  
			                    text: '',  
			                    style: {  
			                        color: '#02528b',  
			                        fontSize: '12px',  
			                        fontWeight: 'normal'  

			                    }  
			                }, 
			               labels: {  
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '10px',  
			                        fontWeight: 'normal'  
			                    }  
			                }  
			            },  
			            legend: {  
			                layout: 'horizontal',  
			                backgroundColor: '#ffffff',  
			                align: 'center',  
			                verticalAlign: 'top',  
			                x: 0,  
			                y: -10,  
			                floating: true,  
			                shadow: false, 
			                itemWidth:140,
			                borderWidth: 0,
			                itemStyle: {
			                    fontSize:'12px'
			                }
			            },  
			            plotOptions: {  
			                spline: {  
			                    shadow: false,  
			                    animation: false,  
			                    lineWidth: 1  
			                }  
			            }, 
			          tooltip: {
			        	  shared: true, //是否共享提示，也就是X一样的所有点都显示出来
			            	useHTML: true, //是否使用HTML编辑提示信息
			            	headerFormat: '<small style="font-size:12px;">{point.key}</small><table>',//<small>{point.key}</small><table>
			            	pointFormat: '<tr class="show-div-msg"><td style="color: {series.color};width:40px;">{series.name}：&nbsp;&nbsp;</td>' +
			            	'<td style="font-weight:bold;text-align:left;"><b>{point.y}</b></td></tr>',
			            	footerFormat: '</table>',
			            	valueDecimals: 2 //数据值保留小数位数
			            	,crosshairs:true,
			            	xDateFormat:'%A', 
			            	formatter:function(){
			            		var formatterName = dayChange(Highcharts.dateFormat('%A', this.x));
			            		formatterName = "<span class='name'>"+formatterName+"</span>";
			            		for(var i = 0 ;i < this.points.length;i++)
			            		{
			            			if (this.points[i].series.name == 'K10AH_AP'){
			            				formatterName += "<br/><span class='name' style='color: "+this.points[i].series.color+"'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'>" +  this.points[i].y + '</span>';		            				
			            			}
			            			else{
			            				formatterName += "</span>"+"<br/><span class='name' style='color: "+this.points[i].series.color+"'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'>" + this.points[i].y + '</span>';		            				
			            			}
			            		}
			            		return formatterName;
			            	}
			            }, 
			            series: [
			                     {  
			                name: '<ui:i18n key="点击量"/>PV',  
			                data: [[ msg[0][1] ],
			                       [ msg[1][1] ],
			                       [ msg[2][1] ], 
			                       [ msg[3][1] ], 
			                       [ msg[4][1] ],
			                       [ msg[5][1] ], 
			                       [ msg[6][1] ]], 
			                lineColor:'#3473dd',
			              /*   dataLabels: {  
			                    enabled: true  
			                }, */
			                marker: {
			                	symbol: 'circle'
			                	},
			                pointStart: Date.UTC(msg[0][0].split('-')[0], (msg[0][0].split('-')[1]-1), msg[0][0].split('-')[2]),
				             pointInterval: 24 * 3600 * 1000   
			            }   ,
			            {  
			                name: '<ui:i18n key="访客数"/>UV',  
			                data: [[ msg[0][2] ],
			                       [ msg[1][2] ],
			                       [ msg[2][2] ], 
			                       [ msg[3][2] ], 
			                       [ msg[4][2] ],
			                       [ msg[5][2] ], 
			                       [ msg[6][2] ]], 
			                Color:'#0e9715',
			              /*   dataLabels: {  
			                    enabled: true  
			                }, */
			                marker: {
			                	symbol: 'circle'
			                	},
			                pointStart: Date.UTC(msg[0][0].split('-')[0], (msg[0][0].split('-')[1]-1), msg[0][0].split('-')[2]),
				             pointInterval: 24 * 3600 * 1000   
			            } ,
			            {  
			                name: '<ui:i18n key="商品"/>',  
			                data: [[ msg[0][3] ],
			                       [ msg[1][3] ],
			                       [ msg[2][3] ], 
			                       [ msg[3][3] ], 
			                       [ msg[4][3] ],
			                       [ msg[5][3] ], 
			                       [ msg[6][3] ]], 
			                lineColor:'#d1102d',
			              /*   dataLabels: {  
			                    enabled: true  
			                }, */
			                marker: {
			                	symbol: 'circle'
			                	},
			                pointStart: Date.UTC(msg[0][0].split('-')[0], (msg[0][0].split('-')[1]-1), msg[0][0].split('-')[2]),
				             pointInterval: 24 * 3600 * 1000   
			            } 
			            ]  

			        });  
			        $('.highcharts-legend-item').hover(function(){
			    		var id = $(this).index();
			    		$('.ui-box-body').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose').attr('style','left:232px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="点击量"/>：<ui:i18n key="浏览本店网页的次数"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose').attr('style','left:372px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p>'+
			    					'<p><ui:i18n key="访客数"/>：<ui:i18n key="浏览本店网页的一台客户端为一个访客"/>.</p><p>00:00-24:00<ui:i18n key="内相同的客户端只被计算一次"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 2){
			    			$('#PoupDivClose').attr('style','left:512px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="商品"/>：<ui:i18n key="浏览本店商品的次数"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}
			    	},
			    	function(){
			    		$('#PoupDivClose').hide()
			    	}
			    	);
			    });  
			}
			
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
		
	
});
	
function dayChange(dayName){
	if(dayName == 'Monday'){
		return '<ui:i18n key="星期一"/>';
	}else if(dayName == 'Tuesday'){
		return '<ui:i18n key="星期二"/>';
	}else if(dayName == 'Wednesday'){
		return '<ui:i18n key="星期三"/>';
	}else if(dayName == 'Thursday'){
		return '<ui:i18n key="星期四"/>';
	}else if(dayName == 'Friday'){
		return '<ui:i18n key="星期五"/>';
	}else if(dayName == 'Saturday'){
		return '<ui:i18n key="星期六"/>';
	}else if(dayName == 'Sunday'){
		return '<ui:i18n key="星期七"/>';
	}
}

function getMyDate(tmpDate){  
    var date1,date2;               
	//定义两个变量
    date1 = tmpDate.getMonth()+1+'';  
	//获取当前月份+1的值
    if(date1.length<2)            
	//判断当前月份是否是双位数，10以上
    date1 = '0'+date1;          
	//单位数的情况下，需要在月份前补0
    date2 = tmpDate.getDate()+'';    
	//获取当前日期 
    if(date2.length<2)           
	//判断日期的位数是否是双位
    date2 = '0'+date2;         
	//不足双位补0
    return tmpDate.getFullYear()+'-'+date1+'-'+date2;   
	//返回完整的日期
}
</script>
</head>
<body>
<div class="container">
	<!-- ▼ 标题--> 
	<div class="title">
		<div style="min-width:450px;">
			<span><ui:i18n key="公司名称"/>：${requestScope.userMap.GROUPCORPNAME }</span>
			<span><ui:i18n key="店铺名称"/>：${requestScope.userMap.SHOPNAME }</span>
		</div>
		<div>
			<span <c:if test="${requestScope.userMap.AUTH_IS_SUCC==0}">class="identfy-span no"</c:if> <c:if test="${requestScope.userMap.AUTH_IS_SUCC==2}">class="identfy-span sure"</c:if>><ui:i18n key="已认证"/></span>
		</div>
	</div>
	<!-- ▲ 标题  -->
	<!-- ▼ 查询表单区域  --> 
    <div class="query-from">
    		<div class="form-table" >
    		 	<table class="ftable">
    		 		<colgroup>
    		 			<col width="15%" />
    		 			<col width="45%" />
    		 			<col width="15%" />
    		 			<col width="25%" />
    		 		</colgroup>
    		 		<tr>
    		 			<td class="flabel"><ui:i18n key="查询日期"/>：</td>
    		 			<td class="fcomp">
     		 				<input  value="${requestScope.startDate }" type="text" id="createdDateFrom" style="width:100px;" class="w100 datepicker calendar"  />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input value="${requestScope.endDate }" style="width:100px;" type="text" id="createdDateTo" class="w100 datepicker calendar" />
    		 			</td>
    		 			<td class="flabel"></td>
    		 			<td class="fcomp">
    		 			</td>
    		 		</tr>
    		 	</table>
    		</div>
    		
    		<div class="butttn-area m1" onclick="javascript:searchData();">
    		   <span class="button">
    		   	  <span class="button-icon search"></span>
    		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
    		   </span>
    		</div>
   	</div>
	<!-- ▲ 查询表单区域  -->
	<!-- ▼ 数据统计区域  -->
	<div class="clearfix">
		<div class="report-warp" style="border: 0;">
			 <div class="clearfix">
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.countMap.PV_COUNT4 gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.countMap.PV_COUNT4 }</div>
			  	 		<div class="content-type-name"><ui:i18n key="点击量"/>(PV)</div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.countMap.UV_COUNT4 gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.countMap.UV_COUNT4 }</div>
			  	 		<div class="content-type-name"><ui:i18n key="访客数"/>(UV)</div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item2">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.countMap.PV_COUNT2 gt 0}">
			  	 			<div id="content-left-1" class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div id="content-left-1" class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content1">
			  	 		<ul data-flagUv="PV" style="height: 100px;margin-top: 20px;margin-left: 10px;">
							<li ><span class="time-li time-no" data-flagCount="1">00:00~07:59</span></li>
							<li ><span class="time-li time-select" data-flagCount="2">08:00~15:59</span></li>
							<li ><span class="time-li time-no" data-flagCount="3">16:00~23:59</span></li>
						</ul>
			  	 	</div>
			  	 	<div class="report-type-content2"></div>
			  	 	<div class="report-type-content3">
			  	 		<div id="content-right-1" class="content-type-num">${requestScope.countMap.PV_COUNT2 }</div>
			  	 		<div class="content-type-name"><ui:i18n key="各时段点击量"/></div>
			  	 	</div>
			  	 </div>
			  	 <div class="report-item2">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.countMap.UV_COUNT2 gt 0}">
			  	 			<div id="content-left-2" class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div id="content-left-2" class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content1">
			  	 		<ul data-flagUv="UV" style="height: 100px;margin-top: 20px;margin-left: 10px;">
							<li ><span class="time-li time-no" data-flagCount="1">00:00~07:59</span></li>
							<li ><span class="time-li time-select" data-flagCount="2">08:00~15:59</span></li>
							<li ><span class="time-li time-no" data-flagCount="3">16:00~23:59</span></li>
						</ul>
			  	 	</div>
			  	 	<div class="report-type-content2"></div>
			  	 	<div class="report-type-content3">
			  	 		<div id="content-right-2"  class="content-type-num">${requestScope.countMap.UV_COUNT2 }</div>
			  	 		<div class="content-type-name"><ui:i18n key="各时段访客数"/></div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.countMap.GOODS_COUNT gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.countMap.GOODS_COUNT }</div>
			  	 		<div class="content-type-name"><ui:i18n key="商品"/></div>
			  	 	</div>
			  	 </div>
			  	 
			 </div>
		</div>
	</div>
	<!-- ▲ 数据统计区域 -->
	
	<!-- ▼标题 -->
	<div class="clearfix" style="margin-top: 20px;">
		<div class="title-warp">
			<img alt="" src="/admin/images/orderBaseCount/trend.png"/>
			<span class="title-name"><ui:i18n key="流量趋势图"/></span>
		</div>
	</div>
	<!-- ▲标题 -->

	<!-- 图表显示区域 -->
	<div class="chart-area">
			<div class="chart-warp">
       			<div id="chart-container">
       				
       			</div>
       			<div class="PoupDiv" id="PoupDivClose">
			        <div class="PoupDivBody">
			            <div class="dropDown1"></div>
			            <div class="dropDown2"></div>
			        </div>
			        <div class="ui-box">
					  	<div class="ui-box-header">
					  	</div>
					  	<div class="ui-box-body">
					  		<p>${label.点击可隐藏显示该数据}.</p>
									<p>${label.点击量}：${label.浏览本店网页的次数}.</p>
					  	</div>
					 </div>
		    	</div> 
       		</div>
       		<div class="clearfix">
				<div class="title-warp">
					<img alt="" src="/admin/images/msgControl/sort.png"/>
					<span class="title-name"><ui:i18n key="交易现况"/></span>
				</div>
			</div>
       		<div class="js-summary-detail" >
		       		<div class="result-grid" style="margin-top:0px;">
			   			<div class="js-grid-content">
			   			<div class="result-data-warp">
					      	<table class="result-grid-table" style="margin-bottom:30px;">
					      		<colgroup>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 			<col width="20%" 	/>
			       		 		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th>
					           				<span><ui:i18n key="日期"/></span>					
					           			</th>
					           			<th>
					           				<span><ui:i18n key="下单数"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="付款数"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="发货数"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="付款金额"/></span>
					           			</th>
					      		 	</tr>
					      		 </thead>
					      		 <tbody  class="result-grid-tbody">
    		 			           	<c:forEach items="${page.data }" var="item" varStatus="status">
						           		<tr >
						           			<td>
						           				<span>${item.STS_ORDER_DT }</span>
						           				<input name="payNoneNum" type="hidden" value="${item.PAY_NEXT_NUM}"/>
						           				<input name="goodsQty" type="hidden" value="${item.GOODS_QTY}"/>
						           			</td>
						           			<td><span name="dayOrderSum">${item.DAY_ORDER_SUM }</span></td>
						           			<td><span name="orderPaySum">${item.ORDER_PAY_SUM }</span></td>
						           			<td><span name="goodsSendSum">${item.GOODS_SEND_SUM }</span></td>
						           			<td><span name="orderPriceSum"><fmt:formatNumber type="number" value="${item.ORDER_PRICE_SUM }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span></td>
						           		</tr>
					           		</c:forEach>
					      		 </tbody>
				      		</table>
			      		</div>
			      		<ui:paging page="${page }" />
			     	</div>	
			     </div>
		    </div> 
		</div>
	 <!-- 图表显示区域 -->			
</div>
</body>
</html>