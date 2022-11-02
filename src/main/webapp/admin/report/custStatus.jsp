 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<style type="text/css">
 .name{
 	font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;
 	width:160px;
 	white-space:nowrap; 
 	text-overflow:ellipsis; 
 	overflow:hidden;
 	display: inline-block;
 	text-align: center;
 }

 .date-p{
 	word-break:break-all;
 	position: absolute;
 	font-size:12px;
 	line-height:10px;
 	color:#666;
 	left:75px;
 }
 
 
</style> 

<style type="text/css">
/**************报表5个方块儿部分******************/
.cust-report-warp {
	padding: 30px 8px;
}

.cust-report-warp .report-item {
	position: relative;
	float: left;
	width: 170px;
	height: 80px;
	border: 1px solid #e5e5e5;
	border-radius: 8px;
	cursor: pointer;
}

.cust-report-warp .report-item + .report-item {
	margin-left: 8px;
}

 

.cust-report-warp .report-item .report-type-color {
	float: left;
	width: 8px;
	height: 100%;
	border-bottom-left-radius: 8px;
	border-top-left-radius: 8px;
}

.cust-report-warp .report-type-color.bg-red {
	background-color: #d1102d;
}

.cust-report-warp .report-type-color.bg-gray {
	background-color: #e6e6e6;
}

.cust-report-warp .report-item .report-type-content {
	position: relative;
	float: left;
	width: 162px;
	height: 100%;
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
}

.report-item-icon{
	position: absolute;left: 6px; top: 10px;
}
.report-item-num{
	position: absolute;right: 10px; top: 10px;
	font-size: 20px;
}
.report-item-name{
	position: absolute;right: 10px; bottom: 10px;
	text-align: right;
}

</style>

<script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts-4.1.9.js"></script>
<style type="text/css"> 
.trend-name{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
.trend-img-show{height: auto;width: 100%;position: relative;margin-bottom: 30px;}
.trend-img-show .trendImg{width:100%;height:auto;display: inline-block}
.PoupDiv{border-radius:4px;min-width:150px;min-height:45px;padding:5px 12px 5px 8px; position:absolute;background-color: #fff799;z-index: 2000;top:45px; left:40%;display: none}
.PoupDivBody{position: absolute; width:10px; height: 10px; left:20px; top:-10px}
.dropDown1,.dropDown2{width:0;height:0; overflow:hidden;border-width:5px; border-style:dotted dotted solid;  position:absolute;}
.dropDown1{border-color:transparent transparent #fff;top:0px;z-index:0;}
.dropDown2{border-color:transparent transparent #FFF799; top:0px;z-index:0;}
.ui-box-body {padding-top:2px;}
.ui-box-body p{font-size:12px;line-height:20px;color:#313131;padding-left:5px;}
</style>
<script type="text/javascript">
$(function(){
	//导出Excel数据
	$('.js-export-excel').click(function(){
		
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		//***************
		//y验证各个查询条件是否符合条件
		//***************
		
		if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
			var url = '/admin/report/custStatusExcelDownload.htm';
			var params = {
					startDate : $('#startDate').val()
					,endDate : $('#endDate').val()
			}
			ggFormSubmit(url,params);
			
		}
	});
});
</script>
<script type="text/javascript">


function showPage(pageNo, pageSize){
	
	window.scrollTo(0,$('.result-grid-table').offset().top);
	
	var pageNm = $('#pageNm').val();
	var pageGroup = $('#pageGroup').select2('val'); 
	var params = {
			startDate : $('#startDate').val()
			,endDate : $('#endDate').val()
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/report/custStatusFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params , function(){ 
		$this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 });
		 $this.hideLoading();
	 });
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
 
//根据时间查找数据
function query(){
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	
	var action = '/admin/report/custStatus.htm';
	var params = {
		startDate : startDate
		,endDate : endDate
	}
	
	ggFormSubmit(action,params);
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


$(function () {  
	
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}  
	var msg = new Array();
	var params={startDate:startDate,endDate:endDate};
	$.ajax({
		data: params,
		url : '/admin/report/getCustStatusLast7Day.htm', 
		success : function(data){
			var dataM = data.result;			
			if(dataM.length == 0){
				//没有数据时，趋势图样式 
				var day = $('#startDate').val();
				var times = data.arr;//查询总天数
			    var newFuns = [];
				var outFuns = [];
				var growFuns = [];
			    for(var i = 0;i < times.length;i++){
					msg[i] = new Array();
												
					msg[i][1] = 0;
					msg[i][2] = 0;
					msg[i][3] = 0;
					
					newFuns.push(msg[i][1]);
					outFuns.push(msg[i][2]);
					growFuns.push(msg[i][3]);
				}
				var splinechart;  
				Highcharts.setOptions({ 
					lang: { 
                        numericSymbols: null,
                        resetZoom:'<ui:i18n key="点击重置"/>',
                        resetZoomTitle: "", 
                    }
				}); 
			    $(document).ready(function () {  
			        splinechart = new Highcharts.Chart({  
			            chart: {  
			            	renderTo: 'chart-container',  
			                //defaultSeriesType: 'line', 
			                type: 'spline',
			                zoomType: 'x',
			                margin: [80, 50, 70, 50],
			                resetZoomButton: {		                	
			                    theme: {
			                        fill: '#d0112d',
			                        stroke: '#d0112d',
			                        states: {
				                        hover: {
				                        	fill: '#d0112d',
				                        	stroke:'#d0112d',
				                            style: {	
				                            	color: '#fff',
				                                cursor: 'pointer',
				                            }
				                        }
				                    },
			                    	style:{		
			                    		color: '#fff',
			                    		fontWeight: 'normal',
			                    		fontFamily : '"Microsoft YaHei","Malgun Gothic","맑은 고딕", Arial',
			                    	}				                    
			                    },
			                    position: {
			                    	align:'right',
			                    	x: -80,
			                    	y: -58
			                    },
			                },
			            }
			            , 
			            credits: {  
			            	  enabled: false  
			            	},  
			            color: [  
			            '#006ebe'  
			            ]  ,
			            title: {  
			                style: {  
			                    display: 'none'  
			                }  
			            } ,
			            subtitle: {  
			                style: {  
			                    display: 'none'  
			                }  
			            } ,  
			            xAxis: {
			            	lineColor: '#d3d3d3',
			                type: 'datetime', 
			                labels: {    
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '8px',  
			                        fontWeight: 'normal',
			                        fontFamily: 'Microsoft YaHei',
			                     },
			                     //让x轴显示年-月-日格式
		                         formatter: function () {  
		                             return Highcharts.dateFormat('%Y-%m-%d', this.value);  
		                         } , 			
		                         tickInterval: 1,
			                     rotation: -45
			                },  
			                title: {  
			                    style:  
			              	{  
			                  display: 'none'  
			              	}  
			               },
			            },  
			      yAxis: {  
			    	  	min: 0,
		                max: 100,
		                tickInterval: 20,
						allowDecimals: false,
				        minPadding: 0,
				        //startOnTick: false,
				      	title: {   
				            style: {  
				               display: 'none',
				            }  
				        },
						labels: {  
						     style: {  
						         color: '#000000',  
						         fontSize: '10px',  
						         fontWeight: 'normal',
						         fontFamily: 'Microsoft YaHei',
						     }  
						 }
			                
			            }, 
			            legend: {  
			                layout: 'horizontal',  
			                backgroundColor: '#ffffff',  
			                align: 'center',  
			                verticalAlign: 'top',  
			                x: 0,  
			                y: 10,  
			                floating: true,
			                symbolPadding: 10,
			                symbolWidth: 20,
			                shadow: false, 
			                itemWidth: 120,
			                borderWidth: 0,
			                labelFormatter: function() {
			                    return "<span class='trend-name'>" + this.name + '&nbsp' + "</span>";
			                },
			                useHTML: true
			            },
			            tooltip: {  
			                shared: true,  
			                crosshairs: true,
			                useHTML: true,
			                headerFormat: '<span style="font-family: "Microsoft YaHei";font-size:12px">{point.key}</span><br>',//<small>{point.key}</small><table>
			            	pointFormat: '<span style="color: {series.color};text-align:left">{series.name}&nbsp:&nbsp</span>' +
			            	'<span style="font-weight:bold;text-align:left;"><b>{point.y}</b></span><br>',
			            	valueDecimals: 2,//数据值保留小数位数
			            	xDateFormat: '%A', 
			            	formatter: function(){
			            		var formatterName = dayChange(Highcharts.dateFormat('%A', this.x));
			            		formatterName = "<span class='trend-name'>" + formatterName + "</span>";
			            		for(var i = 0 ;i < this.points.length;i++)
			            		{
			            			formatterName += "<br/><span class='trend-name' style='color: " + this.points[i].series.color + "'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'>" + this.points[i].y + '</span>';		            				    			
			            		}
			            		return formatterName;
			            	}
			            },  
			            plotOptions: {
			            	series: {
			                    lineWidth: 1.5,//统一设置图表线条宽度，单位为px
			                    shadow: false,
			                    marker: {
				                	//symbol: 'circle',
				                	radius: 3
				                },
			                }
		            	 
			            },  
			            series: [
			               {  
			                name: '<ui:i18n key="新增粉丝"/>',  
			                data: newFuns, 
			                color: '#2b908f',	
			                pointStart: Date.UTC(day.split('-')[0], (day.split('-')[1]-1), day.split('-')[2]),
				            pointInterval: 24 * 3600 * 1000   
			            }   ,
			            {   
			            	//type:'area',
			                name: '<ui:i18n key="跑路粉丝"/>',  
			                data: outFuns, 
			                color: '#f45b5b', 
			                marker: {
			                	//symbol: 'circle',
			                	radius: 4
			                },
			                pointStart: Date.UTC(day.split('-')[0], (day.split('-')[1]-1), day.split('-')[2]),
				            pointInterval: 24 * 3600 * 1000 
			            } ,
			            {  
			            	//type:'area',
			                name: '<ui:i18n key="净增粉丝"/>',  
			                data: growFuns,
			                color: '#90ee7e', 
			                pointStart: Date.UTC(day.split('-')[0], (day.split('-')[1]-1), day.split('-')[2]),
				            pointInterval: 24 * 3600 * 1000  
			            } 
			            ]  
			        }); 
			        $('.highcharts-legend-item').hover(function(){
			    		var id = $(this).index();
			    		$('.ui-box-body').children().remove();
			    		if(id == 0){
			    			$('#poupDiv').attr('style','left:269px').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="新增粉丝"/>：<ui:i18n key="新关注本店的粉丝人数"/>，<ui:i18n key="用户当天内重复操作也只计数一次"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 1){
			    			$('#poupDiv').attr('style','left:389px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p>'+
			    					'<p><ui:i18n key="跑路粉丝"/>：<ui:i18n key="取消关注的粉丝人数"/>，<ui:i18n key="用户当天内重复操作也只计数一次"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 2){
			    			$('#poupDiv').attr('style','left:510px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="净增粉丝"/>：<ui:i18n key="新关注与取消关注的用户数之差"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}
			    	},
			    	function(){
			    		$('#poupDiv').hide()
			    	}
			    	);
			    });
			}else{
				//有数据时，趋势图样式
				
				//起始时间
				var day = $('#startDate').val();
			    //获取起始与结束时间之间的所有日期
			    var times = data.arr;//查询总天数

			    var newFuns = [];
				var outFuns = [];
				var growFuns = [];
			    for(var i = 0;i < times.length;i++){
					msg[i] = new Array();
					//alert(data[i]);
					for(var j = 0;j < dataM.length;j++){
						if(dataM[j].FOLLOW_DT == times[i]){
							msg[i][1] = dataM[j].NEW_FANS;
							msg[i][2] = dataM[j].OUT_FANS;
							msg[i][3] = dataM[j].GROW_FANS;	
							break;
						}else{							
							msg[i][1] = 0;
							msg[i][2] = 0;
							msg[i][3] = 0;
						}

					}
					newFuns.push(msg[i][1]);
					outFuns.push(msg[i][2]);
					growFuns.push(msg[i][3]);
	
				}
				var splinechart;   
				Highcharts.setOptions({ 
                    lang: { 
                        numericSymbols: null,
                        resetZoom: '<ui:i18n key="点击重置 "/>',
                        resetZoomTitle: "", 
                    } 
                });
			    $(document).ready(function () {  
			    	
			        splinechart = new Highcharts.Chart({  
			            chart: {  
			                renderTo: 'chart-container',  
			                //defaultSeriesType: 'line', 
			                type: 'spline',
			                zoomType: 'x',
			                margin: [80, 50, 70, 50],
			                resetZoomButton: {		                	
			                    theme: {
			                        fill: '#d0112d',
			                        stroke: '#d0112d',
			                        states: {
				                        hover: {
				                        	fill: '#d0112d',
				                        	stroke:'#d0112d',
				                            style: {	
				                            	color: '#fff',
				                                cursor: 'pointer',
				                            }
				                        }
				                    },
				                    style: {					                    	
			                    		color: '#fff',
			                    		fontWeight: 'normal',
			                    		fontFamily : '"Microsoft YaHei","Malgun Gothic","맑은 고딕", Arial',
			                    	}				                    
			                    },
			                    position: {
			                    	align: 'right',
			                    	x: -80,
			                    	y: -58
			                    },
			                    
			                },
			            }
			        
			            , 
			            credits: {  
			            	  enabled: false  
			            	},  
			            color: [  
			            	'#006ebe'  
			            ]  , 
			            title:{
			            	style: {  
			                    display: 'none'  
			                }  
			            },
			            subtitle: {  
			                style: {  
			                    display: 'none'  
			                }  
			            } , 
			            xAxis: {
			                lineColor: '#d3d3d3',
			                type: 'datetime', 
			                labels: {    
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '8px',  
			                        fontWeight: 'normal',
			                        fontFamily: 'Microsoft YaHei',
			                     },
			                     //让x轴显示年-月-日格式
		                         formatter: function () {  
		                             return Highcharts.dateFormat('%Y-%m-%d', this.value);  
		                         } , 			
			                     rotation: -45
			                },  
			                title: {  
			                    style:  
			              	{  
			                  display: 'none'  
			              	}  
			               },
			            },  
			      yAxis: {  
			                allowDecimals: false,
			                minPadding: 0,
			                //startOnTick: false,
			              	title: {   
			                    style: {  
			                       display:'none',
			                    }  
			                },
			               labels: {  
			                    style: {  
			                        color: '#000000',  
			                        fontSize: '10px',  
			                        fontWeight: 'normal',
			                        fontFamily: 'Microsoft YaHei',
			                    }  
			                }
			            },  
			            legend: {  
			                layout: 'horizontal',  
			                backgroundColor: '#ffffff',  
			                align: 'center',  
			                verticalAlign: 'top',  
			                x: 0,  
			                y: 10,  
			                floating: true,
			                symbolPadding: 10,
			                symbolWidth: 20,
			                shadow: false, 
			                itemWidth: 120,
			                borderWidth: 0,
			                labelFormatter: function() {
			                    return "<span class='trend-name'>" + this.name + '&nbsp' + "</span>";
			                },
			                useHTML: true
			            },  
			            tooltip: {  
			                shared: true,  
			                crosshairs: true,
			                useHTML: true,
			                headerFormat: '<span style="font-family: "Microsoft YaHei";font-size:12px">{point.key}</span><br>',//<small>{point.key}</small><table>
			            	pointFormat: '<span style="color: {series.color};text-align:left">{series.name}&nbsp:&nbsp</span>' +
			            	'<span style="font-weight:bold;text-align:left;"><b>{point.y}</b></span><br>',
			            	valueDecimals: 2,//数据值保留小数位数
			            	xDateFormat: '%A', 
			            	formatter: function(){
			            		var formatterName = dayChange(Highcharts.dateFormat('%A', this.x));
			            		formatterName = "<span class='trend-name'>" + formatterName + "</span>";
			            		for(var i = 0 ;i < this.points.length;i++)
			            		{
			            			formatterName += "<br/><span class='trend-name' style='color: " + this.points[i].series.color + "'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'>" + this.points[i].y + '</span>';		            				    			
			            		}
			            		return formatterName;
			            	}
			            },   
			            plotOptions: {
			            	series: {
			                    lineWidth: 1.5,//统一设置图表线条宽度，单位为px
			                    shadow: false,
			                    marker: {
				                	//symbol: 'circle',
				                	radius: 3
				                },
			                }
		            	 
			            }, 
			            series: [
			             {  		
			            	//type:'area',
			                name: '<ui:i18n key="新增粉丝"/>',  
			                data: newFuns, 
			                color: '#2b908f',
			                pointStart: Date.UTC(day.split('-')[0], (day.split('-')[1]-1), day.split('-')[2]),
				            pointInterval: 24 * 3600 * 1000  
			            }   ,
			            {   
			            	//type:'area',
			                name: '<ui:i18n key="跑路粉丝"/>',  
			                data: outFuns, 
			                color: '#f45b5b', 
			                marker: {
			                	//symbol: 'circle',
			                	radius: 4
			                },
			                pointStart: Date.UTC(day.split('-')[0], (day.split('-')[1]-1), day.split('-')[2]),
				            pointInterval: 24 * 3600 * 1000 
			            } ,
			            {  
			            	//type:'area',
			                name: '<ui:i18n key="净增粉丝"/>',  
			                data: growFuns,
			                color: '#90ee7e', 
			                pointStart: Date.UTC(day.split('-')[0], (day.split('-')[1]-1), day.split('-')[2]),
				            pointInterval: 24 * 3600 * 1000  
			            } 
			            ]  
			        }); 
			        $('.highcharts-legend-item').hover(function(){
			        	var id = $(this).index();
			    		$('.ui-box-body').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose').attr('style','left:269px').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="新增粉丝"/>：<ui:i18n key="新关注本店的粉丝人数"/>，<ui:i18n key="用户当天内重复操作也只计数一次"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose').attr('style','left:389px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p>'+
			    					'<p><ui:i18n key="跑路粉丝"/>：<ui:i18n key="取消关注的粉丝人数"/>，<ui:i18n key="用户当天内重复操作也只计数一次"/>.</p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 2){
			    			$('#PoupDivClose').attr('style','left:510px;').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="净增粉丝"/>：<ui:i18n key="新关注与取消关注的用户数之差"/>.</p>';
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
	}});
	
}); 

 
function getMyDate(tmpDate){  
    var date1,date2;               
//定义两个变量
    date1 = tmpDate.getMonth()+1+'';  
//获取当前月份+1的值
    if(date1.length < 2)            
//判断当前月份是否是双位数，10以上
        date1 = '0' + date1;          
//单位数的情况下，需要在月份前补0
    date2 = tmpDate.getDate()+'';    
//获取当前日期 
     if(date2.length < 2)           
//判断日期的位数是否是双位
         date2 = '0' + date2;         
//不足双位补0
   return tmpDate.getFullYear() + '-' + date1 + '-' + date2;   
//返回完整的日期
}

function newFans(){
	parent.ggShowTab({
		'url' : '/admin/cust/cust.htm?dateStart=${requestScope.startDate}&dateEnd=${requestScope.endDate }&subscribe=1',
		'name' : '<ui:i18n key="客户筛选"/>',
		'icon' : 'cust' 
	});  
}
function outFans(){
	parent.ggShowTab({
		'url' : '/admin/cust/cust.htm?dateStart=${requestScope.startDate}&dateEnd=${requestScope.endDate }&subscribe=0',
		'name' : '<ui:i18n key="客户筛选"/>',
		'icon' : 'cust' 
	});  
}
function nowFans(){
	parent.ggShowTab({
		'url' : '/admin/cust/cust.htm',
		'name' : '<ui:i18n key="客户筛选"/>',
		'icon' : 'cust' 
	});  
}
</script>
</head>

<body>
	<!-- ▼ Main container -->
	<div class="container">
		 
		 
		 <!--▼ 查询表单区域  -->
		 <div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="120px" />
       		 			<col />
       		 		</colgroup>
					<tr>
       		 			<td class="flabel last"><ui:i18n key="查询日期"/>：</td>
       		 			<td class="fcomp last">
      		 				<input type="text" id="startDate" class="w12 datepicker calendar" value="${requestScope.startDate}" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
  			 	 			<input type="text" id="endDate" class="w12 datepicker calendar" value="${requestScope.endDate}" />
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button js-search" onclick="query();">
       		   	  <span class="button-icon search"></span>
       		   	  <span class="button-name"><ui:i18n key="查询"/></span>
       		   </span>
       		</div>
      	</div>
      	
      	
      	<div class="cust-report-warp">
			<div class="clearfix">
				<div class="report-item" onclick="newFans()">  
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.summary.NEW_FANS gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/custCurrent/newFan.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	${requestScope.summary.NEW_FANS}
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="新增粉丝"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item" onclick="outFans()">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.summary.OUT_FANS gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/custCurrent/runaway fan.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${requestScope.summary.OUT_FANS}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="跑路粉丝"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.summary.GROW_FANS gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/custCurrent/newFan.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${requestScope.summary.GROW_FANS}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="净增粉丝"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item" onclick="nowFans()">
			  	 	<c:choose>
			  	 		<c:when test="${requestScope.summary.COUNT gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/custCurrent/fan.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${requestScope.summary.COUNT}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="现有粉丝"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
			</div>
		</div>
  		 
  		 <!-- ▼标题 -->
		<div class="clearfix">
			<div class="title-warp">
				<img alt="" src="/admin/images/v2-icons/icon-grap.png">
				<span class="title-name"><ui:i18n key="微信粉丝增减趋势"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		
  		 <div class="chart-area">
			<div class="trend-img-show">
       			<div class="trendImg" id="chart-container">
       				
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
					  	<div class="ui-box-body">
					  		
					  	</div>
					 </div>
	    		</div>
       		</div>
       		<div class="js-summary-detail"  style="display:none;">
		       		<div class="result-grid " style="margin-top:20px;">
				      	<div class="result-grid-header">
			   				<div class="result-grid-tools js-export-excel">
			   					<img alt="" src="/admin/images/imgTextSituation/icon_excel.png" />
			   				   <span class="result-grid-tool">
								  	<ui:i18n key="导出Excel"/>
			      		   		</span>
			   				</div>
			   			</div>
			   			<div class="js-grid-content">
			   			<div class="result-data-warp">
					      	<table class="result-grid-table" style="margin-bottom:30px;">
					      		<colgroup>
			       		 			<col width="25%" 	/>
			       		 			<col width="25%" 	/>
			       		 			<col width="25%" 	/>
			       		 			<col width="25%" 	/>
			       		 		</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th>
					           				<span><ui:i18n key="时间"/></span>					
					           			</th>
					           			<th>
					           				<span><ui:i18n key="新增粉丝"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="跑路粉丝"/></span>
					           			</th>
					           			<th>
					           				<span><ui:i18n key="净增粉丝"/></span>
					           			</th>
					      		 	</tr>
					      		 </thead>
					      		 <tbody  class="result-grid-tbody">
					      		 	<c:forEach items="${list }" var="list" varStatus="status">
						           		<tr>
						           			<td>${list.FOLLOW_DT }</td>
						           			<td>${list.NEW_FANS }</td>
						           			<td>${list.OUT_FANS }</td>
						           			<td>${list.GROW_FANS }</td>
						           		</tr>
					           		</c:forEach>
					      		 </tbody>
				      		</table>
			      		</div>
			      	 <ui:paging page="${page }" />
			     	</div>	
			     </div>
		    </div> 
		    
		    <div onclick="showData();" class="show-more js-show-more">
				<a class="show-more-icon"></a>
				<span><ui:i18n key="显示详情数据"/></span>
			</div>
		</div>		   
		 
	</div>
	<!-- ▲ Main container -->
</body>
</html>