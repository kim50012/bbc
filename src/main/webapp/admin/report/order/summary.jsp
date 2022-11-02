<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <title><ui:i18n key="订单概况统计"/></title>
 <script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts.js"></script>
<style type="text/css">
body{margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 12px;}
*{margin: 0; padding: 0; font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial; font-size: 12px;}
.name{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
.show-div-msg{font-size:12px;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
.show-div-msg td{height:25px;font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;border:0;}
.shopSellMsg{font-size:12px;border:1px solid #eeeeee;height:91px;widht:100%;}
.shopSellMsg table{width:100%;}
.shopSellMsg table  tr{height:40px;line-height:40px;text-align: center;}
.shopSellMsg table  tr td{text-align: left;border:0;}
.PoupDiv{display:none; border-radius:4px; min-width:150px; min-height:45px; position:absolute; background-color: #fff799;  left:512px; top:25px;}
.dropDown1,.dropDown2 { width:0; height:0;  overflow:hidden; border-width:5px; border-style:dotted dotted solid; position:absolute;}
.PoupDivBody{position: absolute; width:10px; height: 10px; left:20px; top:-10px}
.dropDown1{border-color:transparent transparent #fff;top:-1px}
.dropDown2{border-color:transparent transparent #FFF799; top:0}
.dropDown3,.dropDown4 { width:0; height:0;  overflow:hidden; border-width:5px; border-style:dotted dotted solid; position:absolute;}
.dropDown3{border-color:transparent transparent #fff;top:-1px}
.dropDown4{border-color:transparent transparent #FFF799; top:0}
.dropDown5,.dropDown6 { width:0; height:0;  overflow:hidden; border-width:5px; border-style:dotted dotted solid; position:absolute;}
.dropDown5{border-color: #fff transparent transparent ;top:40px}
.dropDown6{border-color: #FFF799 transparent transparent ; top:40px}
.average-price-span{margin-left:0;}
.report-item{cursor: pointer;}
.ui-box-body {padding-top:2px;}
.ui-box-body p{font-size:12px;line-height:20px;color:#313131;padding-left:5px;padding-right:30px; }
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
	var url = '/admin/report/order/summaryFragment.htm';
	 
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

//隐藏，显示数据
function showData(){
	if($('.js-show-more').hasClass('hidden')){
		$('.js-show-more').removeClass('hidden').find('span').text('<ui:i18n key="显示详情数据"/>');
		$('.js-summary-detail').hide();
	}else{
		$('.js-show-more').addClass('hidden').find('span').text('<ui:i18n key="隐藏详情数据"/>');
		$('.js-summary-detail').show();
	}
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
	window.location.href = '/admin/report/order/summary.htm?startDate='+startDate+'&endDate='+endDate;
}
$(function(){
	$('.report-item').click(function(){
		var url = '/admin/orders/orderList.htm';
		parent.ggShowTab({
			'url' : url || '',
			'name' : '<ui:i18n key="所有订单"/>',
			'icon' : 'shopoperation' 
		});
	});
	$('.average-price-span').hover(function(){
		$('#PoupDivMsg').show();
	},function(){
		$('#PoupDivMsg').hide();
	});
	$('.change-num').hover(function(){
		$('#PoupDivMsgChange').show();
	},function(){
		$('#PoupDivMsgChange').hide();
	});
	

	var msg=new Array();
	$.ajax({
		url : '/admin/report/order/getSevenMsg.htm',  
		success : function(data){
			var dataM = data.result
			if(dataM.length == 0){
				for(var i = 0;i < 7;i++){
					msg[i] = new Array();
					var today = new Date(); // 获取今天时间
					today.setDate(today.getDate()+(i-6));
					var day = getMyDate(today);
					var flag = true;
					for(var j = 0;j<dataM.length;j++){
						if(dataM[j].STS_ORDER_DT == day){
							msg[i][0] = day;
							msg[i][1] = dataM[j].DAY_ORDER_SUM;
							msg[i][2] = dataM[j].ORDER_PAY_SUM;
							msg[i][3] = dataM[j].GOODS_SEND_SUM;
							msg[i][4] = dataM[j].ORDER_PRICE_SUM;
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
						msg[i][4] = 0;
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
			                lineColor: '#dfe7ef',  
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
			                    x:-1,
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
			                tickInterval:20,
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
			            	headerFormat: '<small style="font-size:14px;">{point.key}</small><table>',//<small>{point.key}</small><table>
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
			            			if (this.points[i].series.name == "K10AH_AP"){
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
			                name: '<ui:i18n key="下单数"/>',  
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
			                name: '<ui:i18n key="付款数"/>',  
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
			                name: '<ui:i18n key="发货数"/>',  
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
			    		$('#addui-box-body').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose').attr('style','left:231px;').show();
			    			var htm='<p><ui:i18n key="点击可隐藏显示该数据"/>'+'.</p><p><ui:i18n key="下单数"/>'+'：'+'<ui:i18n key="客户当天在本店铺下订单的总件数"/>'+'.</p>';
			    			$("#addui-box-body").append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose').attr('style','left:371px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>'+'.</p>'+
			    					  '<p><ui:i18n key="付款数"/>'+'：'+'<ui:i18n key="客户当天完成支付的订单总件数"/>'+'.</p>';
			    			$('#addui-box-body').append(htm);
			    		}else if(id == 2){
			    			$('#PoupDivClose').attr('style','left:511px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>'+'.</p><p><ui:i18n key="发货数"/>'+'：'+'<ui:i18n key="卖家当天已完成发货的订单总数"/>'+'.</p>';
			    			$('#addui-box-body').append(htm);
			    		}//付款金额：客户当天支付的交易总金额.
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
						if(dataM[j].STS_ORDER_DT == day){
							msg[i][0] = day;
							msg[i][1] = dataM[j].DAY_ORDER_SUM;
							msg[i][2] = dataM[j].ORDER_PAY_SUM;
							msg[i][3] = dataM[j].GOODS_SEND_SUM;
							msg[i][4] = dataM[j].ORDER_PRICE_SUM;
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
						msg[i][4] = 0;
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
			                lineColor: '#dfe7ef',  
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
			                    x:-1,
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
			                //tickInterval:20,
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
			            	headerFormat: '<small style="font-size:14px;">{point.key}</small><table>',//<small>{point.key}</small><table>
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
			                name: '<ui:i18n key="下单数"/>',  
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
			                name: '<ui:i18n key="付款数"/>',  
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
			                name: '<ui:i18n key="发货数"/>',  
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
			    		$('#addui-box-body').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose').attr('style','left:231px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>'+'.</p><p><ui:i18n key="下单数"/>'+'：'+'<ui:i18n key="客户当天在本店铺下订单的总件数"/>'+'.</p>';
			    			$('#addui-box-body').append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose').attr('style','left:371px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>'+'.</p>'+
			    					'<p><ui:i18n key="付款数"/>'+'：'+'<ui:i18n key="客户当天完成支付的订单总件数"/>'+'.</p>';
			    			$('#addui-box-body').append(htm);
			    		}else if(id == 2){
			    			$('#PoupDivClose').attr('style','left:511px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>'+'.</p><p><ui:i18n key="发货数"/>'+'：'+'<ui:i18n key="卖家当天已完成发货的订单总数"/>'+'.</p>';
			    			$('#addui-box-body').append(htm);
			    		}//付款金额：客户当天支付的交易总金额.
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
		}});
});
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
</script>
</head>

<body>
<div class="container">
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
    		 			<td class="flabel"><ui:i18n key="日期"/>：</td>
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
			  	 		<c:when test="${requestScope.mapOne.ALL_PAY_NO gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.mapOne.ALL_PAY_NO }</div>
			  	 		<div class="content-type-name"><ui:i18n key="待付款"/></div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.mapOne.ALL_SEND_NO gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.mapOne.ALL_SEND_NO }</div>
			  	 		<div class="content-type-name"><ui:i18n key="待发货"/></div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.mapOne.DAY_ORDER_SUM_Z gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.mapOne.DAY_ORDER_SUM_Z }</div>
			  	 		<div class="content-type-name"><ui:i18n key="昨日下单数"/></div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.mapOne.ORDER_PAY_SUM gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.mapOne.ORDER_PAY_SUM }</div>
			  	 		<div class="content-type-name"><ui:i18n key="昨日付款数"/></div>
			  	 	</div>
			  	 </div>
			  	 
			  	 <div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.mapOne.GOODS_SEND_SUM_Z gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		<div class="content-type-num">${requestScope.mapOne.GOODS_SEND_SUM_Z }</div>
			  	 		<div class="content-type-name"><ui:i18n key="昨日发货数"/></div>
			  	 	</div>
			  	 </div>
			  	 
			 </div>
		</div>
	</div>
	<!-- ▲ 数据统计区域 -->
	
	<!-- ▼ 数据统计区域2  -->
	<div class="shopSellMsg">
		<table>
			<tr style="height:5px;"><td colspan="4"></td></tr>
			<tr>
				<td style="width:6%;"></td>
				<td style="width:33%;"><ui:i18n key="付款金额"/>：￥ <span id="shopMsg1"><fmt:formatNumber type="number" value="${requestScope.mapOne.ORDER_PRICE_SUM }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span></td>
				<td style="width:28%;"><ui:i18n key="付款订单"/>：<span id="shopMsg2">${requestScope.mapOne.ORDER_PAY_SUM }</span></td>
				<td style="width:33%;position: relative;"><span class="change-num"><ui:i18n key="全店转化率"/>：<span id="shopMsg3">${requestScope.mapOne.UV_AVG }</span>%</span>
					<div class="PoupDiv" id="PoupDivMsgChange" style="left:5px;top:-20px;min-height:30px;text-align: center;">
				        <div class="PoupDivBody">
				            <div class="dropDown5"></div>
				            <div class="dropDown6"></div>
				        </div>
				        <div class="ui-box">
						  	<div class="ui-box-body" >
						  		<p style="margin-top:2px;padding-right:10px;"><ui:i18n key="全店转化率"/>=<ui:i18n key="成交用户数"/>/<ui:i18n key="访客数"/></p>
						  	</div>
						 </div>
			    	</div> 
				</td>
			</tr>
			<tr>
				<td></td>
				<td><span><ui:i18n key="付款商品数"/>：<span id="shopMsg4">${requestScope.mapOne.ORDER_GOODS_SUM }</span></span></td>
				<td><span><ui:i18n key="付款人数"/>：<span id="shopMsg5">${requestScope.mapOne.ORDER_PERSON_SUM }</span></span></td>
				<td style="position: relative;"><span class="average-price-span"><ui:i18n key="订单平均金额"/>：￥<span id="shopMsg6">${requestScope.mapOne.PRICE_AVG }</span></span>
					<div class="PoupDiv" id="PoupDivMsg" style="left:5px;top:30px;min-height:30px;text-align: center;">
				        <div class="PoupDivBody">
				            <div class="dropDown3"></div>
				            <div class="dropDown4"></div>
				        </div>
				        <div class="ui-box">
						  	<div class="ui-box-body">
						  		<p style="margin-top:2px;padding-left:10px;padding-right:10px;"><ui:i18n key="订单平均金额"/>=<ui:i18n key="销售总金额"/>/<ui:i18n key="付款及后续状态的订单总数"/>
						 </div>
			    	</div>  
				</td>
			</tr>
			<tr style="height:5px;"><td colspan="4"></td></tr>
		</table>
	</div>	
	<!-- ▲ 数据统计区域2 -->
	
	<!-- ▼标题 -->
	<div class="clearfix" style="margin-top: 20px;">
		<div class="title-warp">
			<img alt="" src="/admin/images/orderBaseCount/trend.png"/>
			<span class="title-name"><ui:i18n key="七天订单趋势"/></span>
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
					  		<h3 class="title"></h3>
					  	</div>
					  	<div class="ui-box-body" id="addui-box-body">
					  		<p>${label.点击可隐藏显示该数据}.</p>
									<p></p>
					  	</div>
					 </div>
		    	</div> 
       		</div>
       		<div class="js-summary-detail"  style="display:none;">
		       		<div class="result-grid " style="margin-top:20px;">
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
					           				<span><ui:i18n key="时间"/></span>					
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
    		 			           	<c:forEach items="${list }" var="list" varStatus="status">
						           		<tr >
						           			<td>
						           				<span>${list.STS_ORDER_DT }</span>
						           				<input name="payNoneNum" type="hidden" value="${list.PAY_NEXT_NUM}"/>
						           				<input name="goodsQty" type="hidden" value="${list.GOODS_QTY}"/>
						           				<input id="allSendNo${status.index}" type="hidden" value="${list.ALL_SEND_NO}"/>
						           				<input id="allPayNo${status.index}" type="hidden" value="${list.ALL_PAY_NO}"/>
						           				<input id="allPayOrder${status.index}" type="hidden" value="${list.ALL_PAY_ORDER}"/>
						           			</td>
						           			<td><span name="dayOrderSum">${list.DAY_ORDER_SUM }</span></td>
						           			<td><span name="orderPaySum">${list.ORDER_PAY_SUM }</span></td>
						           			<td><span name="goodsSendSum">${list.GOODS_SEND_SUM }</span></td>
						           			<td><span name="orderPriceSum"><fmt:formatNumber type="number" value="${list.ORDER_PRICE_SUM }" pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span></td>
						           		</tr>
					           		</c:forEach>
					      		 </tbody>
				      		</table>
			      		</div>
			      		<ui:paging page="${page }" />
			     	</div>	
			     </div>
		    </div> 
		    <div style="height:30px;"></div>
		    <div onclick="showData();" class="show-more js-show-more">
				<a class="show-more-icon"></a>
				<span><ui:i18n key="显示详情数据"/></span>
			</div>
		</div>
	 <!-- 图表显示区域 -->			
				
</div>			 
		   
		 
</body>
</html>