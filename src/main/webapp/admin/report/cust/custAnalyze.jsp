<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%>  
<title><ui:i18n key="客户占比分析 "/></title>

<script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts.js"></script>
<style type="text/css">
.name{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}

/* 第一组饼图 */
.bieOne{width:880px;height: 250px; position: relative;margin-top: 50px;margin-left:auto;margin-right: auto;margin-bottom: 25px}
.sex{margin-top:-25px; position: absolute;top:0px;left:0px;font-size: 12px;}
.deal{margin-top:-25px;position: absolute;top:0px;left:465px;font-size: 12px}
.genderPieChart{width:400px;height: 250px;border-top: 1px solid #d1102d;display: inline-block;}
.dealCurrent{width:400px;height: 250px;border-top: 1px solid #d1102d;display: inline-block;margin-left: 60px;}

.PoupDiv{border-radius:4px;min-width:150px;min-height:45px;position:absolute;background-color: #fff799;z-index: 1000;display: none;right:130px}
.PoupDivBody{ width: 0;height: 0;border-top: 5px solid transparent;border-left: 10px solid #FFF799;border-bottom: 5px solid transparent;position: absolute;right:-10px;top:17px;z-index: 2000}
.ui-box-body {padding-top:2px;}
.ui-box-body p{font-size:12px;line-height:20px;color:#313131;padding-left:5px;}

/* 第一个走势图和列表*/
.ui-gridarea.clearfix{border:1px solid #eeeeee;position: relative;height: auto;padding-bottom: 10px}
.ui-gridarea .trend-img-show{height: auto;width: 100%;position: relative;margin-bottom: 30px;}
.ui-gridarea .trend-img-show .trendImg{width:100%;height:auto;display: inline-block;}
.ren{position: absolute;left:20px;top:50px;z-index: 1;}
.listOne{position: relative;}
.showListOne{height: 20px;line-height: 20px;position: absolute;bottom:-10px;left:80%;background-color: #ffffff;text-align: center;cursor: pointer;}

/* 第二组饼图 */
.bieTwo{width: 880px;height: 250px;position: relative;margin-top: 50px;margin-left:auto;margin-right: auto;margin-bottom: 25px}
.grade{margin-top:-25px; position: absolute;top:0px;left:0px;font-size: 12px}
.consumption{margin-top:-25px;position: absolute;top:0px;left:465px;font-size: 12px}
.custGrade{width:400px;height: 250px;border-top: 1px solid #d1102d;display: inline-block;}
.custConsumption{width:400px;height: 250px;border-top: 1px solid #d1102d;display: inline-block;margin-left:60px}

/* 第二个走势图和列表 */
.ui-gridarea.clearfix-two{border:1px solid #eeeeee;position: relative;height: auto;padding-bottom: 10px}
.ui-gridarea .trend-img-show-two{height: auto;width: 100%;position: relative;}
.ui-gridarea .trend-img-show-two .trendImg-two{width:100%;height:auto;display: inline-block;margin-bottom:30px;} 
.ren-two{position: absolute;left:20px;top:50px;z-index: 1}
.yuan-two{position: absolute;right:20px;top:50px;z-index: 1}
.listTwo{position: relative;}
.showListTwo{height: 20px;line-height: 20px;position: absolute;bottom:-10px;left:80%;background-color: #ffffff;text-align: center;cursor: pointer;}

</style>
<script type="text/javascript">

$(function (){
	//客户性别饼状图
    initGenderPieChart();
  //交易现况饼状图
	initTradePieChart();
	//性别与交易现状走势图
	initGenderAndTradeSplineChart();
	//客户等级饼状图
	initGradePieChart();
	//客户消费总额饼状图
	initConsumptionPieChart();
	//人数与消费总额走势图
	initGradeAndConsumptionSplineChart();
}); 

//根据时间查找数据
function search(){
	var startDate  =  $('#startDate').val();
	var endDate  =  $('#endDate').val();
	var date1  =  new Date(startDate);
	var date2  =  new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	window.location.href = '/admin/report/cust/custAnalyze.htm?startDate=' + startDate + '&endDate=' + endDate;
} 

</script>
<script type="text/javascript">
//客户性别饼状图 
function initGenderPieChart(){
	var chart;
	
	var man 	= '${requestScope.pieMst.MALE_CNT}' || 0;
	var women 	= '${requestScope.pieMst.FEMALE_CNT}' || 0;
	var unKnow 	= '${requestScope.pieMst.UNKNOWN_CNT}' || 0;

	var arr = [man,women,unKnow];
	var data1 = parseFloat(arr[0]);
  	var data2 = parseFloat(arr[1]);
	var data3 = parseFloat(arr[2]);
	// Build the chart
 $('#genderPieChart').highcharts({
     chart : {
			margin : [20,80,20,0],
			plotBackgroundColor : null,
			plotBorderWidth : null,
			plotShadow : false
     },
     title : {
       style : {
     	  display :'none'
       }
     },
     colors : [
             '#74beff',
             '#ffa1db',
             '#cbdeff',
         ],
     tooltip : {
  	   borderRadius :0,
			formatter : function() {
			   return "<span class='name' style='font-size:14px'>"+ this.point.name +"</span><br/>"+"<span class='name'><ui:i18n key='人数'/>&nbsp;:&nbsp;" + Highcharts.numberFormat(this.y, 0, ',') + "<br/><span class='name'><ui:i18n key='比例'/>&nbsp;:&nbsp;</b>" + Highcharts.numberFormat(this.percentage, 1) + "%";
			},
  	   useHTML : true, //是否使用HTML编辑提示信息
     },
     credits : {  
   	  enabled : false  
   	},
     plotOptions : {
         pie : {
             allowPointSelect : true,
             cursor : 'pointer',
             dataLabels : {
                 enabled : false,
             },
             showInLegend : true,
             borderWidth : 0,
         }
     },
     legend : {
         layout : 'vertical',
         align : 'right',
         verticalAlign : 'bottom',
         symbolPadding  : 10,
         symbolWidth  : 20,
         borderWidth : 0,

         labelFormatter : function() {
             return "<span class='name'>" + this.name + '&nbsp' + "</span>";
         },
         useHTML : true
     },
     series : [{//设置每小个饼图的颜色、名称、百分比
         type : 'pie',
         //name : '比例',
         data : [
                 ['<ui:i18n key="男"/>',data1],
                 ['<ui:i18n key="女"/>',data2],
                 ['<ui:i18n key="未知"/>',data3],
                ]
     }],

 });
}

</script>

<script type="text/javascript">
//交易现况饼状图 
function initTradePieChart(){
	var chart;
	var payMent = '${requestScope.pieMst.DEAL_FANS}' || 0;
	var noPay = '${requestScope.pieMst.WAIT_FANS}' || 0;
	var noOrder = '${requestScope.pieMst.UNKNOWN_FANS}' || 0;
	var arr = [payMent,noPay,noOrder];
	var data1 = parseFloat(arr[0]);
    var data2 = parseFloat(arr[1]);
    var data3 = parseFloat(arr[2]);
	// Build the chart
   $('#dealCurrent').highcharts({
       chart : {
    	   margin : [20,80,20,0],
           plotBackgroundColor : null,
           plotBorderWidth : null,
           plotShadow : false
       },
       title : {
         style : {
       	  display :'none'
         }
       },
       colors : [
               '#74beff',
               '#ffa1db',
               '#cbdeff',
           ],
       tooltip : {
    	   borderRadius : 0,
	   	    formatter : function() {
	           return "<span class='name' style='font-size:14px'>" + this.point.name + "</span><br/>" + "<span class='name'><ui:i18n key='人数'/>&nbsp;:&nbsp;</span>" + Highcharts.numberFormat(this.y, 0, ',') + "<br/><b class='name'><ui:i18n key='比例'/>&nbsp;:&nbsp;</b>" + Highcharts.numberFormat(this.percentage, 1) + "%";
	        },
	        useHTML : true
       },
       credits : {  
     	  enabled : false  
     	},
       plotOptions : {
           pie : {
               allowPointSelect : true,
               cursor : 'pointer',
               dataLabels : {
                   enabled : false,
               },
               showInLegend : true,
               borderWidth : 0,
           }
       },
       legend : {
           layout : 'vertical',
           align : 'right',
           verticalAlign : 'bottom',
           symbolPadding  : 10,
           symbolWidth  : 20,
           borderWidth : 0,

           labelFormatter : function() {
               return "<span class='name'>" + this.name + '&nbsp' + "</span>";
           },
           useHTML : true
       },
       series : [{//设置每小个饼图的颜色、名称、百分比
           type : 'pie',
           size : '100%',
           //name : '比例',
	        data : [
	                ['<ui:i18n key="已成交粉丝"/>',data1],
	                ['<ui:i18n key="待付款粉丝"/>',data2],
	                ['<ui:i18n key="无订单粉丝"/>',data3],
	               ]
       }]
   });
	
   $(".dealCurrent .highcharts-legend-item").hover(function(){
		var id = $(this).index();
		$('.ui-box-body').children().remove();
		if(id == 0){
			$('#PoupDivClose').attr('style','top:170px;').show();
			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="有交易成功订单的粉丝"/>.</p>';
			$('.ui-box-body').append(htm);
		}else if(id == 1){
			$('#PoupDivClose').attr('style','top:188px;').show();
			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="已下单但从未付款的粉丝"/>.</p>';	
			$('.ui-box-body').append(htm);
		}else if(id == 2){
			$('#PoupDivClose').attr('style','top:206px;').show();
			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="从未下单的粉丝"/>.</p>';	
			$('.ui-box-body').append(htm);
		}
	},
	function(){
		$('#PoupDivClose').hide()
	}
); 
}

</script>

<script type="text/javascript">
//性别与交易现状走势图 
function initGenderAndTradeSplineChart(){
	var msg = new Array();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var param = {
			startDate : startDate
			,endDate : endDate
		};
	$.ajax({
		data : param,
		url : '/admin/report/cust/getJsonGenderAndTradeChartData.htm', 
		success : function(data){
			var dataM = data.genderAndTradeList;
			for(var i = 0;i<4;i++){
				msg[i] = new Array();
				var flag = true;
				for(var j = 0;j<dataM.length;j++){
					if(i == j){
						msg[i][0] = dataM[j].DEAL_CNT;
						msg[i][1] = dataM[j].WAIT_CNT;
						msg[i][2] = dataM[j].UNKNOWN_CNT;
						break;
					}
					if(j == dataM.length-1){
						flag = false;	
					}
				}
				if(!flag || dataM.length == 0){
					msg[i][0] = '';
					msg[i][1] = '';
					msg[i][2] = '';
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
		            chart : {  
		                renderTo : 'splineContainer',  
		                type : 'column',  
		                margin : [80, 60, 50, 60],
		            }
		            , 
		            credits : {  
		            	  enabled : false  
		            	},  
		            color: [  
		            '#006ebe'  
		            ]  ,  
		            subtitle : {  
		                style : {  
		                    display : 'none'  
		                }  
		            } ,  
		            xAxis : {
		            	categories : ['<ui:i18n key="已成交"/>','<ui:i18n key="待付款"/>','<ui:i18n key="无订单"/>'],
		            	left : 60,
		                lineWidth : 1,  
		                lineColor : '#dfe7ef',  
		                gridLineWidth : 0,  
		                lineColor : '#000000', 
		                startOnTick : false,  
		                tickPixelInterval :300,  
		                type : 'category', 
		                labels : {  
		                	x : 0,
		                    y : 30,  
		                    style : {  
		                        color : '#000000',  
		                        fontSize : '12px',  
		                        fontWeight : 'normal',
		                        fontFamily : '"Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial',
		                     },
		                     
		                },  
		                tickColor : '#000000',  
		                tickLength : 5,  
		                tickWidth : 1,  
		                title : {  
		                    style :  
		              	{  
		                  display : 'none'  
		              	}  
		               },
		            },  
		            yAxis : [{ 	
		            	allowDecimals : true,  
		                startOnTick : false,  
		               	endOnTick : true,  
		                lineWidth : 0,  
		                gridLineWidth :1,  
		                gridLineColor : '#d3d3d3',  
		                lineColor : '#000000',  
		                tickColor : '#000000',  
		                //tickLength : 30,  
		                tickWidth : 0,
		                min :0,
		                //max:180,
		                //tickInterval:20,
		                title : {  
		                    style :  
		              	{  
		                  display : 'none'  
		              	}  
		               },
		                labels : {  
		                    style : {  
		                        color : '#000000',  
		                        fontSize : '14px',  
		                        fontWeight : 'normal',
		                        fontFamily : 'Microsoft YaHei',
		                     }
		                },  
		            }],
		            
		            legend : {  
		                layout : 'horizontal',  
		                backgroundColor : '#ffffff',  
		                align : 'center',  
		                verticalAlign : 'top',  
		                x : 0,  
		                y : 0,  
		                floating : true,  
		                shadow : false, 
		                symbolPadding : 10,
		                symbolWidth : 20,
		                itemWidth : 100,
		                borderWidth : 0,
		                labelFormatter : function() {
		                    return "<span class='name'>" + this.name + '&nbsp' + "</span>";
		                },
		                useHTML : true
		            },  
		            tooltip : {  
		                shared : true,  
		                crosshairs : true,
		                useHTML : true,
		                headerFormat : '<span style="font-family: "Microsoft YaHei";font-size:12px">{point.key}</span><br>',//<small>{point.key}</small><table>
		            	pointFormat : '<span style="color: {series.color};text-align:left">{series.name}&nbsp:&nbsp</span>' +
		            	'<span style="font-weight:bold;text-align:left;"><b>{point.y}</b></span><br>',
		            	formatter:function(){
		            		var formatterName = "<span class='name'>" + this.x + "</span>";
		            		for(var i = 0 ;i < this.points.length;i++)
		            		{		
		            			formatterName += "<br/><span class='name' style='color: "+this.points[i].series.color+"'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;' class='name'>" + this.points[i].y + "&nbsp;人" + '</span>';	            				
		            		}
		            		return formatterName;
		            	}
		            },   
		            plotOptions : {  
			            column : {
			                pointPadding : 0,
			                borderWidth : 0,
			                pointWidth : 30,
			                groupPadding :0.33,
			            },
		            
		            }, 
		            series : [{
		                name : '<ui:i18n key="男"/>',
		                color : '#74beff',
		                type : 'column',
		                yAxis : 0,
		                data : [msg[1][0],msg[1][1],msg[1][2]],
		                dataLabels : {  //这个属性可以在柱子上显示的显示数值为多少
	                        enabled : true,
	                        rotation : 0,
	                        color : 'black',
	                        align : 'center',
	                        x : 0,
	                        y : 0,
	                        style :{
	                        	fontSize : '12px',
	                            fontFamily : 'Microsoft YaHei',
	                        }
	                    },
	                    tooltip : {
	                        valueSuffix : '<ui:i18n key="人"/>'
	                    }
		            },{ 
		                name : '<ui:i18n key="女"/>',
		                color : '#ffa1db',
		                type : 'column',
		                yAxis : 0,//坐标轴序号
		                data : [msg[2][0],msg[2][1],msg[2][2]],
		                dataLabels : {  //这个属性可以在柱子上显示的显示数值为多少
	                        enabled : true,
	                        rotation : 0,
	                        color : 'black',
	                        align : 'center',
	                        x : 0,
	                        y : 0,
	                        style : {
	                            fontSize : '12px',
	                            fontFamily : 'Microsoft YaHei',
	                        }
	                    },
	                    tooltip: {
	                        valueSuffix : '<ui:i18n key="人"/>'
	                    },
		            },{ 
		                name : '<ui:i18n key="未知"/>',
		                color : '#cbdeff',
		                type : 'column',
		                yAxis : 0,//坐标轴序号
		                data : [msg[0][0],msg[0][1],msg[0][2]],
		                dataLabels : {  //这个属性可以在柱子上显示的显示数值为多少
	                        enabled : true,
	                        rotation : 0,
	                        color : 'black',
	                        align : 'center',
	                        x : 0,
	                        y : 0,
	                        style : {
	                            fontSize : '12px',
	                            fontFamily : 'Microsoft YaHei',
	                        }
	                    },
	                    tooltip : {
	                        valueSuffix : '<ui:i18n key="人"/>'
	                    },
		            }
		            ]
		        });
		    });  
		},
		error : function(a, msg, c) {
			alert("error: " + msg);
		}
	});
}


</script>

<script type="text/javascript">

//客户等级饼状图 
function initGradePieChart(){
	var chart;
	var num;
	var count = '';
	var name;
	var gradeNm = '';
	$('.gradeId').each(function(){
		if($(this).val() != 999){
			num = $(this).prevAll('.num').val();
			count = count + ',' + num;
			name = $(this).prevAll('.gradeNm').val();
			gradeNm = gradeNm + ',' + name;
		}
	}); 
	count = count.substr(1,count.length);
	gradeNm = gradeNm.substr(1,gradeNm.length);
	count = count.split(',');
	gradeNm = gradeNm.split(',');
	
	var arr = [];
	for(var i = 0;i < count.length;i++){
		arr.push([gradeNm[i],parseFloat(count[i])]);
	}
	// Build the chart
 $('#custGrade').highcharts({
     chart : { 
  	   margin : [20,80,20,0],
         plotBackgroundColor : null,
         plotBorderWidth : null,
         plotShadow : false 
     },
     title : {
  	   style : {
				display :'none'
			}
     },
     colors : [
			'#74beff',
			'#ffa1db',
			'#cbdeff',
			'#ff926f',
			'#c1e68c',
			'#61e1ff',
			'#c7abff',
			'#ff6c82',
			'#ffe274',
			'#65e2cb',
         ],
     tooltip : {
  	   borderRadius : 0,
	   	    formatter : function() {
	           return "<span class='name' style='font-size :14px'>" + this.point.name + "</span><br/>"+"<span class='name'><ui:i18n key='人数'/>&nbsp;:&nbsp;</span>" + Highcharts.numberFormat(this.y, 0, ',')+"<br/><b class='name'><ui:i18n key='比例'/>&nbsp;:&nbsp;</b>" + Highcharts.numberFormat(this.percentage, 1) + "%";
	        },
	        useHTML : true
     },
     credits : {  
   	  enabled : false  
   	},
	   legend : {
			layout : 'vertical',
		    align : 'right',
		    verticalAlign : 'bottom',
		    symbolPadding  : 10,
		    symbolWidth  : 20,
		    borderWidth : 0,
		
		    labelFormatter : function() {
		        return "<span class='name'>" + this.name + '&nbsp' + "</span>";
		    },
		    useHTML : true
		},
     plotOptions : {
         pie : {
             allowPointSelect : true,
             cursor : 'pointer',
             dataLabels : {
                 enabled : false,
             },
             showInLegend : true,
             borderWidth : 0,
         }
     },
     series : [{//设置每小个饼图的颜色、名称、百分比
         type : 'pie',
         //name : '比例',
         data : arr,
         //size :'100%'
     }]
    
 });
 
}
</script>

<script type="text/javascript">

//客户消费总额饼状图 
function initConsumptionPieChart(){
	var chart;
	var num;
	var priceUnitSum = '';
	var name;
	var gradeNm = '';
	$('.gradeId').each(function(){
		if($(this).val() != 999){
			num = $(this).prevAll('.priceUnitSum').val();
			priceUnitSum = priceUnitSum + ',' + num;
			name = $(this).prevAll('.gradeNm').val();
			gradeNm = gradeNm + ',' + name;
		}
	}); 
	priceUnitSum = priceUnitSum.substr(1,priceUnitSum.length);
	gradeNm = gradeNm.substr(1,gradeNm.length);
	priceUnitSum = priceUnitSum.split(',');
	gradeNm = gradeNm.split(',');
	
	var arr = [];
	for(var i = 0;i < priceUnitSum.length;i++){
		arr.push([gradeNm[i],parseFloat(priceUnitSum[i])]);
	}
	// Build the chart
 $('#custConsumption').highcharts({
     chart : {
  	   margin : [20,80,20,0],
         plotBackgroundColor : null,
         plotBorderWidth : null,
         plotShadow : false
     },
     title : {
  	   style : {
				display :'none'
			}
     },
     colors :[
			'#74beff',
			'#ffa1db',
			'#cbdeff',
			'#ff926f',
			'#c1e68c',
			'#61e1ff',
			'#c7abff',
			'#ff6c82',
			'#ffe274',
			'#65e2cb',
         ],
     tooltip : {
  	   borderRadius : 0,
	   	    formatter : function() {
	           return "<span class='name' style='font-size:14px'>" + this.point.name + "</span><br/>" + "<span class='name'><ui:i18n key='金额'/>&nbsp;:&nbsp;</span>" + Highcharts.numberFormat(this.y, 0, ',') + "<br/><b class='name'><ui:i18n key='比例'/>&nbsp;:&nbsp;</b>" + Highcharts.numberFormat(this.percentage, 1) + "%";
	        },
	        useHTML : true
     },
     credits : {  
   	  enabled : false  
   	},
   	legend : {
   		layout : 'vertical',
		    align : 'right',
		    verticalAlign : 'bottom',
		    symbolPadding  : 10,
		    symbolWidth  : 20,
		    borderWidth : 0,
		
		    labelFormatter : function() {
		        return "<span class='name'>" + this.name + '&nbsp' + "</span>";
		    },
		    useHTML : true
    	},
     plotOptions : {
         pie : {
             allowPointSelect : true,
             cursor : 'pointer',
             dataLabels : {
                 enabled : false,
             },
             showInLegend : true,
             borderWidth : 0,
         }
     },
     series : [{//设置每小个饼图的颜色、名称、百分比
         type : 'pie',
         //name : '比例',
         data : arr,
         //size :'100%'
     }]
 });
}
</script>

<script type="text/javascript">

//人数与消费总额走势图
function initGradeAndConsumptionSplineChart(){
	var msg = new Array();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var param = {startDate:startDate,endDate:endDate};
	$.ajax({
		data : param,
		url : '/admin/report/cust/getJsonGradeAndConsumptionChartData.htm', 
		success : function(data){
			var dataM = data.gradeAndConsumptionList;
			var num = [];
			var money = [];
			var name = [];
			for(var i = 0;i < dataM.length;i++){
				msg[i] = new Array();
				var flag = true;
				
				for(var j = 0;j < dataM.length;j++){
					if(i == j){
						msg[i][0] = dataM[j].CUST_GRADE_CNT;
						msg[i][1] = dataM[j].PRICE_GRADE_SUM;
						msg[i][2] = dataM[j].GRADE_NM;
						num.push(msg[i][0]);
						money.push(msg[i][1]);
						name.push(msg[i][2]);
						break;
					}
					if(j == dataM.length-1){
						flag = false;	
					}
				}
				if(!flag || dataM.length == 0){
					msg[i][0] = i+1;
					msg[i][1] = '';
					msg[i][2] = '';
				} 
			}
			var splinechart;  
			Highcharts.setOptions({ 
			    colors : ['#3473dd', '#0e9715', '#d1102d', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', 
			'#FFF263', '#6AF9C4'] 
			}); 
		    $(document).ready(function () {  
		    	
		        splinechart = new Highcharts.Chart({  
		            chart : {  
		                renderTo : 'splineContainerTwo',  
		                type : 'column',  
		                margin : [80, 60, 50, 60],
		            }
		            , 
		            credits : {  
		            	  enabled : false  
		            	},  
		            color : [  
		            '#006ebe'  
		            ]  ,  
		            subtitle : {  
		                style : {  
		                    display : 'none'  
		                }  
		            } ,  
		            xAxis : {
		            	categories : name,
		            	left : 60,
		                lineWidth : 1,  
		                lineColor : '#dfe7ef',  
		                gridLineWidth : 0,  
		                lineColor : '#000000', 
		                startOnTick : false,  
		                //tickPixelInterval: 100,  
		                type : 'category', 
		                labels : {  
		                	x : 0,
		                    y : 30,  
		                    style : {  
		                        color : '#000000',  
		                        fontSize : '12px',  
		                        fontWeight : 'normal',
		                        fontFamily : 'Microsoft YaHei',
		                     },
		                },  
		                tickColor : '#000000',  
		                tickLength : 5,  
		                tickWidth : 1,  
		                title : {  
		                    style :  
		              	{  
		                  display : 'none'  
		              	}  
		               },
		            },  
		            yAxis : [{ //第一个Y轴，序号为0
		            	
		            	allowDecimals : true,  
		                startOnTick : false,  
		               	endOnTick : true,  
		                lineWidth : 0,  
		                gridLineWidth :1,  
		                gridLineColor : '#d3d3d3',  
		                lineColor : '#000000',  
		                tickColor : '#000000',  
		                //tickLength : 30,  
		                tickWidth : 0,
		                min : 0,
		               // max :200,
		                //tickInterval :20,
		                title : {  
		                    style :  
		              	{  
		                  display : 'none'  
		              	}  
		               },
		                labels : {  
		                    style : {  
		                        color : '#000000',  
		                        fontSize : '14px',  
		                        fontWeight : 'normal',
		                        fontFamily : 'Microsoft YaHei',
		                     }
		                },  
		            }, { //第二个Y轴，序号为1
		            	allowDecimals : true,  
		                startOnTick : false,  
		               	endOnTick : true,  
		                lineWidth : 0,  
		                gridLineWidth : 1,  
		                gridLineColor : '#d3d3d3',  
		                lineColor : '#000000',  
		                tickColor : '#000000',  
		                //tickLength : 30,  
		                tickWidth : 0,
		                min : 0,
		                //max :500,
		                //tickInerval :500,
		                title : {  
		                    style :  
		              	{  
		                  display : 'none'  
		              	}  
		               },
		                labels : {  
		                    style : {  
		                        color : '#000000',  
		                        fontSize : '14px',  
		                        fontWeight : 'normal',
		                        fontFamily : 'Microsoft YaHei',
		                     }
		                },
		                
		                opposite : true
		            }],
		            
		            legend : {  
		            	layout : 'horizontal',  
		                backgroundColor : '#ffffff',  
		                align : 'center',  
		                verticalAlign : 'top',  
		                x : 0,  
		                y : 0,  
		                floating : true,  
		                shadow : false, 
		                symbolPadding  : 10,
		                symbolWidth  : 20,
		                itemWidth  : 100,
		                borderWidth  : 0,
		                labelFormatter : function() {
		                    return "<span class='name'>" + this.name + '&nbsp'+"</span>";
		                },
		                useHTML : true
		            },  
		            tooltip : {  
		                shared : true,  
		                crosshairs : true,
		                useHTML : true,
		                headerFormat : '<span style="font-family:"Microsoft YaHei";font-size:12px">{point.key}</span><br>',//<small>{point.key}</small><table>
		            	pointFormat : '<span style="color:{series.color};text-align:left">{series.name}&nbsp:&nbsp</span>' +
		            	'<span style="font-weight:bold;text-align:left;"><b>{point.y}</b></span><br>',
		            	formatter :function(){
		            		var formatterName = "<span class='name'>"+this.x+"</span>";
		            		for(var i = 0 ;i < this.points.length;i++)
		            		{		
		            			if(i == 0){
		            				formatterName += "<br/><span class='name' style='color:" + this.points[i].series.color + "'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;' class='name'>" + this.points[i].y +"&nbsp;人"+'</span>';	
		            			}else{
		            				formatterName += "<br/><span class='name' style='color:" + this.points[i].series.color + "'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;' class='name'>" + this.points[i].y +"&nbsp;元"+'</span>';	
		            			}	            				
		            		}
		            		return formatterName;
		            	}
		            },  
		            plotOptions : {  
			            column : {
			               pointWidth : 30,
			               pointPadding : 0,
			               groupPadding : 0,
                         borderWidth : 0, 
                         shadow : false,  
                         animation : false,
			            },
		            }, 
		            series : [{ //第一个Y轴的数据
		            	name : '<ui:i18n key="人数"/>',
		                color : '#74beff',
		                type : 'column',
		                data : num,
		                dataLabels : {  //这个属性可以在柱子上显示的显示数值为多少
	                        enabled : true,
	                        rotation : 0,
	                        color : 'black',
	                        align : 'center',
	                        x : 0,
	                        y : 0,
	                        style : {
	                            fontSize : '12px',
	                            fontFamily : 'Microsoft YaHei',
	                        }
	                    },
	                    tooltip : {
	                        valueSuffix : '<ui:i18n key="人"/>'
	                    },
	                    connectNulls : true,
		            },{ //第二个Y轴的数据
		            	name : '<ui:i18n key="消费总额"/>',
		                color : '#ffa1db',
		                type : 'column',
		                yAxis : 1,//坐标轴序号
		                data : money,
		                dataLabels : {  //这个属性可以在柱子上显示的显示数值为多少
	                        enabled : true,
	                        rotation : 0,
	                        color : 'black',
	                        align : 'center',
	                        style :{
	                        	fontSize : '12px',
	                            fontFamily : 'Microsoft YaHei',
	                        }
	                    },
	                    tooltip : {
	                        valueSuffix : '<ui:i18n key="元"/>'
	                    }
		            }]
		        });
		    });  
		},
		error  : function(a, msg, c) {
			alert("error:" + msg);
		}
	});
}

</script>

<script type="text/javascript">
</script>

<script type="text/javascript">

//性别&交易现况列表的显示与隐藏
function showListOne(){
	if($('.listOne').is(':hidden') == true){
		$('.listOne').show();
		$('.showListOne img').attr('src','/admin/images/orderBaseCount/btn_hide.png');
		$('.showListOne .text').text('<ui:i18n key="隐藏详情数据"/>');
		$('.showListOne').css('top','98.5%');
		$('.trend-img-show').css('border-bottom','1px solid #eeeeee');
		$('.trend-img-show').css('border','1px solid #eeeeee');
		$('.ui-gridarea.clearfix').css('border','0');
		$('.ui-gridarea.clearfix').css('padding-bottom','40px');
		$('.ui-gridarea.clearfix').css('border-bottom','1px solid #eeeeee');
	}else{
		$('.listOne').hide();
		$('.showListOne img').attr('src','/admin/images/orderBaseCount/btn_detail.png');
		$('.showListOne .text').text('<ui:i18n key="显示详情数据"/>');
		$('.showListOne').css('top','97.5%');
		$('.trend-img-show').css('border','0');
		$('.ui-gridarea.clearfix').css('padding-bottom','10px');
		$('.ui-gridarea.clearfix').css('border-bottom','0');
		$('.ui-gridarea.clearfix').css('border','1px solid #eeeeee');
	}
}
//会员等级&会员消费列表的显示与隐藏
function showListTwo(){
	if($('.listTwo').is(':hidden') == true){
		$('.listTwo').show();
		$('.showListTwo img').attr('src','/admin/images/orderBaseCount/btn_hide.png');
		$('.showListTwo .text').text('<ui:i18n key="隐藏详情数据"/>');
		$('.showListTwo').css('top','99%');
		$('.trend-img-show-two').css('border','1px solid #eeeeee');
		$('.ui-gridarea.clearfix-two').css('border','0');
		$('.ui-gridarea.clearfix-two').css('padding-bottom','40px');
		$('.ui-gridarea.clearfix-two').css('border-bottom','1px solid #eeeeee');
	}else{
		$('.listTwo').hide();
		$('.showListTwo img').attr('src','/admin/images/orderBaseCount/btn_detail.png');
		$('.showListTwo .text').text('<ui:i18n key="显示详情数据"/>');
		$('.showListTwo').css('top','97.5%');
		$('.trend-img-show-two').css('border','0');
		$('.ui-gridarea.clearfix-two').css('border-bottom','0');
		$('.ui-gridarea.clearfix-two').css('padding-bottom','10px');
		$('.ui-gridarea.clearfix-two').css('border','1px solid #eeeeee');
	}
}



function toCust(sex,id){
	//sex,0:未知，1：男，2：女，999:合计
	var sex = sex;
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var wx_if_sex_id = '';
	var jobType = '';
	
	if(sex != 999){
		wx_if_sex_id = sex;
	}
	
	//未知：总数
	if(id == 3){
		jobType = 'CUST';
	//未知：已成交
	}else if(id == 1){
		jobType = 'DEAL';
	//未知：待付款
	}else if(id == 2){
		jobType = 'WAIT';
	//未知：无订单
	}else if(id == 0){
		jobType = 'UNKNOWN';
	}
	$('#iframe').attr('src','/admin/report/cust/custSexList.htm?startDate=' + startDate + '&endDate='+endDate+'&wx_if_sex_id='+wx_if_sex_id+'&jobType='+jobType);    
	showBpopup({
		id : 'bpoupImgDiv',
		width : 850
	});

}
function toCustTwo(grade,num){
	//grade等级
	var gradeId = '';
	if(grade != 999){
		gradeId = grade;
	}
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var jobType = 'CUST';
	
	$('#iframe').attr('src','/admin/report/cust/custGradeList.htm?gradeId=' + gradeId+'&startDate='+startDate+'&endDate='+endDate+'&jobType='+jobType);
	
	showBpopup({
		id : 'bpoupImgDiv',
		width : 850
	});
}


function ggDoDownload(action, params){
	
	console.log('action=' + action);
	console.log('params=');
	console.log(params);
	
	// 创建Form  
    var form = $('<form></form>');  
 	// 设置属性  
    form.attr('action', action);  
    form.attr('method', 'POST');  
    
    for(var key in params){
        form.append($('<input type="text" name="' + key + '" value="' + params[key] + '" />'));  
   	}
	console.log(form.html());
    form.appendTo(document.body).submit().remove();
	
}
//保存表单内容(性别)
function exportExcelGender(){
	if(window.confirm('<ui:i18n key="您确定要导出Excel吗"/>?')){
		var startDate = $('#startDate').val().trim();
		var endDate = $('#endDate').val().trim();
		
		var params = {
				startDate : startDate
				,endDate : endDate
		}
		
		var url = '/admin/report/cust/createExcelGender.htm';
		
		ggDoDownload(url,params);
	}
} 
//保存表单内容(等级)
function exportExcelGrade(){
	if(window.confirm('<ui:i18n key="您确定要导出Excel吗"/>?')){
		var startDate = $('#startDate').val().trim();
		var endDate = $('#endDate').val().trim();
		
		var params = {
				startDate : startDate
				,endDate : endDate
		}
		
		var url = '/admin/report/cust/createExcelGrade.htm';
		
		ggDoDownload(url,params);
	}
} 
</script>
</head>

<body>
	
	<!-- ▼ Main container -->
	<div class="container">
	<!-- ▼ 查询表单区域  --> 
       <div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="15%" />
       		 			<col width="50%" />
       		 			<col width="" />
       		 			<col width="" />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel last" ><ui:i18n key="日期"/>：</td>
       		 			<td class="fcomp last">
       		 				<input type="text" id="startDate" class="w9 datepicker calendar" value="${requestScope.startDate}" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
		  			 	 	<input type="text" id="endDate" class="w9 datepicker calendar" value="${requestScope.endDate}" />
       		 			</td>
       		 			<td class="flabel last"></td>
       		 			<td class="fcomp last"> </td>
       		 		</tr>
       		 	</table>
       		</div>
       		 
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button" onclick="search();">
       		   	  <span class="button-icon search"></span>
       		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
       		   </span>
       		</div>
      	</div>
	  	<!-- ▲ 查询表单区域  -->
			
		<div class="bieOne">
			<!--客户性别饼状图  -->
			<div class="sex"><ui:i18n key="性别分布"/></div>
			<div class="genderPieChart" id="genderPieChart">
				
			</div>
			<!--交易现状饼状图  -->
			<div class="deal"><ui:i18n key="交易现况"/></div>
			<div class="dealCurrent" id="dealCurrent">
				
			</div>
			<div class="PoupDiv" id="PoupDivClose">
			    <div class="PoupDivBody"></div>
			    <div class="ui-box">
					<div class="ui-box-header">
					  	<h3 class="title"></h3>
					</div>
					<div class="ui-box-body">
					  		
					 </div>
				</div>
			</div> 
		</div>
		
		<div class="ui-gridarea clearfix">
       		<!-- start趋势图 -->
       	 	<div class="trend-img-show">
       	 		<div class="ren">(<ui:i18n key="人"/>)</div>
				<div class="trendImg" id="splineContainer" >
         				
         		</div>
			</div>
	
			<!-- end趋势图 -->
			<!-- start详细数据 -->
			<div class="listOne" style="display: none">
				<div class="result-grid" style="margin-top: 50px;">
			      	<div class="result-grid-header">
		   				<div class="result-grid-tools">
		   				   <span class="result-grid-tool" onclick="exportExcelGender();">
		      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
		      		   		</span>
		   				</div>
		   			</div>
		   			<div class="js-grid-content one">
		   				<div class="result-data-warp" style="">
		   					<table class="result-grid-table">
					      		<colgroup>
				      		 			<col width="20%" />
				      		 			<col width="20%" />
				      		 			<col width="20%" />
				      		 			<col width="20%" />
				      		 			<col width="20%" />
				      		 	</colgroup>
					      		 <thead class="result-grid-thead">
					      		 	<tr>
					      		 		<th><ui:i18n key="客户性别"/></th>
					      		 		<th><ui:i18n key="总人数"/></th>
					      		 		<th><ui:i18n key="已成交"/></th>
					      		 		<th><ui:i18n key="待付款"/></th>
					      		 		<th><ui:i18n key="无订单"/></th>
					      		 	</tr>
					      		 </thead>
					      		 <tbody  class="result-grid-tbody">
					      		 <c:forEach items="${genderAndTradeList}" var="item">
					      		 	<tr>
					      		 		<td><span class="cust_sex">${item.WX_IF_SEX_NM}</span></td>
					      		 		<td><span style="cursor: pointer;" onclick="toCust('${item.WX_IF_SEX_ID}',3)">${item.CUST_CNT}</span></td>
					      		 		<td><span style="cursor: pointer;" onclick="toCust('${item.WX_IF_SEX_ID}',1)">${item.DEAL_CNT}</span></td>
					      		 		<td><span style="cursor: pointer;" onclick="toCust('${item.WX_IF_SEX_ID}',2)">${item.WAIT_CNT}</span></td>
					      		 		<td><span style="cursor: pointer;" onclick="toCust('${item.WX_IF_SEX_ID}',0)">${item.UNKNOWN_CNT}</span></td>
					      		 		<input type="hidden" class="SEX"  value="${item.WX_IF_SEX_ID}"/>
					           			<input type="hidden" class="man"  value="${item.CUST_CNT}"/>
				           				<input type="hidden" class="manPayment"  value="${item.DEAL_CNT}"/>
				           				<input type="hidden" class="manNoorder" value="${item.WAIT_CNT}"/>
				           				<input type="hidden" class="manNopay" value="${item.UNKNOWN_CNT}"/>  
					      		 	</tr>
					      		 </c:forEach>
					      		 </tbody>
					      	</table>
		   				</div> 
			     	</div>
		      	</div>
			</div>
			<div class="showListOne" onclick="showListOne();">
				<span id="showMarkSpan" style="margin-right:10px;"><img alt="" src="/admin/images/orderBaseCount/btn_detail.png" style="margin-right: 10px;margin-left: 10px;"><span class="text"><ui:i18n key="显示详情数据"/></span></span>
			</div>
		</div>
		
         <div class="bieTwo">
			<!--会员等级分布饼状图  -->
			<div class="grade"><ui:i18n key="会员等级分布"/></div>
			<div class="custGrade" id="custGrade">
			
			</div>
			<!--会员消费占比饼状图  -->
			<div class="consumption"><ui:i18n key="会员消费占比"/></div>
			<div class="custConsumption" id="custConsumption">
			
			</div>
		</div>
		
        <div class="ui-gridarea clearfix-two">
        
           	<!-- start趋势图 -->
         	 <div class="trend-img-show-two">
         	 	<div class="ren-two">(<ui:i18n key="人"/>)</div>
         	 	<div class="yuan-two">(<ui:i18n key="元"/>)</div>
				<div class="trendImg-two" id="splineContainerTwo" >
          				
          		</div>
			</div>
			<!-- end趋势图 -->
			
			<!-- start详细数据 -->
			<div class="listTwo" style="display:none">
         		
	        <div class="result-grid" style="margin-top: 50px;">
		      	<div class="result-grid-header">
	   				<div class="result-grid-tools">
	   				   <span class="result-grid-tool" onclick="exportExcelGrade();">
	      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出Excel"/>
	      		   		</span>
	   				</div>
	   			</div>
	   			<div class="js-grid-content one">
	   				<div class="result-data-warp" style="">
	   					<table class="result-grid-table">
				      		<colgroup>
			      		 			<col width="20%" />
			      		 			<col width="20%" />
			      		 			<col width="20%" />
			      		 			<col width="20%" />
			      		 			<col width="20%" />
			      		 	</colgroup>
				      		 <thead class="result-grid-thead">
				      		 	<tr>
				      		 		<th><ui:i18n key="会员等级"/></th>
				      		 		<th><ui:i18n key="总人数"/></th>
				      		 		<th><ui:i18n key="人数占比"/></th>
				      		 		<th><ui:i18n key="消费总金额"/></th>
				      		 		<th><ui:i18n key="金额占比"/></th>
				      		 	</tr>
				      		 </thead>
				      		 <tbody  class="result-grid-tbody">
				      		 <c:forEach items="${gradeAndConsumptionList}" var="item">
				      		 	<tr>
				      		 		<td><span>${item.GRADE_NM}</span></td>
				      		 		<td><span style="cursor: pointer;" onclick="toCustTwo('${item.GRADE_ID}',0)">${item.CUST_GRADE_CNT}</span></td>
				           			<td><span>${item.CUST_AVG}%</span></td>
				           			<td><span style="cursor: pointer;" onclick="toCustTwo('${item.GRADE_ID}',1)">${item.PRICE_GRADE_SUM}</span></td>
				           			<td><span>${item.PRICE_AVG}%</span></td>
				           			<input type="hidden" class="num"  value="${item.CUST_GRADE_CNT}"/>
				           			<input type="hidden" class="gradeNm"  value="${item.GRADE_NM}"/>
			           				<input type="hidden" class="custRatio"  value="${item.CUST_AVG}"/>
			           				<input type="hidden" class="priceUnitSum" value="${item.PRICE_GRADE_SUM}"/>
			           				<input type="hidden" class="moneyRatio"  value="${item.PRICE_AVG}"/>
			           				<input type="hidden" class="gradeId" value="${item.GRADE_ID}"/>  
				      		 	</tr>
				      		 </c:forEach>
				      		 </tbody>
				      	</table>
	   				</div> 
		     	</div>
	      	</div>
		</div>
		<div class="showListTwo" onclick="showListTwo();">
	        <span id="showMarkSpan" style="margin-right:10px;"><img alt="" src="/admin/images/orderBaseCount/btn_detail.png" style="margin-right: 10px;margin-left: 10px;"><span class="text"><ui:i18n key="显示详情数据"/></span></span>
	    </div>
	</div>
	</div>	
	<!-- 弹出选择文件的弹出框 -->
	<div class="bpopup2" id="bpoupImgDiv">
		<div class="bpopupWarp">
			<div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="客户列表"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
			<div class="bpopupContentWarp"> 
				<iframe class="js-content-iframe" id="iframe" width="850" height="420" frameBorder=0 scrolling=yes  src=""></iframe>
			</div>
		</div>
	</div>
	<!-- ▲ Main container -->
</body>
</html>