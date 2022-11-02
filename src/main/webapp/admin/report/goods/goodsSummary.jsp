<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="商品统计 "/></title>
<script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts.js"></script>

<style type="text/css">
 .name{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial}
</style> 
<style type="text/css">

.ui-gridarea.clearfix{border:1px solid #eeeeee;position: relative;height: auto;padding-bottom: 10px}
.ui-gridarea .trend-img-show{height: auto;width: 100%;position: relative;margin-bottom: 30px;}
.ui-gridarea .trend-img-show .trendImg{width:100%;height:auto;display: inline-block;}

.prevPage{position: absolute;top:363px;left:40px;cursor: pointer;}
.nextPage{position: absolute;top:363px;right:40px;cursor: pointer;}
.listOne{position: relative;}
.showListOne{height: 20px;line-height: 20px;position: absolute;bottom:-10px;left:80%;background-color: #ffffff;text-align: center;cursor: pointer;}
.jian{position: absolute;left:25px;top:50px;z-index: 1; }
.yuan{position: absolute;right:25px;top:50px;z-index: 1}
.PoupDiv{border-radius:4px;min-width:150px;min-height:45px;position:absolute;background-color: #fff799;z-index: 1000;top:40px; left:40%;display: none}
.PoupDivBody{position: absolute; width:10px; height: 10px; left:20px; top:-10px}
.dropDown1,.dropDown2{width:0;height:0; overflow:hidden;border-width:5px; border-style:dotted dotted solid;  position:absolute;}
.dropDown1{border-color:transparent transparent #fff;top:0px;z-index:0;}
.dropDown2{border-color:transparent transparent #FFF799; top:0px;z-index:0;}
.ui-box-body {padding-top:2px;}
.ui-box-body p{font-size:12px;line-height:20px;color:#313131;padding-left:5px;}


.ui-gridarea.clearfix-two{border:1px solid #eeeeee;position: relative;height: auto;padding-bottom: 10px}
.ui-gridarea .trend-img-show-two{height: auto;width: 100%;position: relative;margin-bottom: 30px;}
.ui-gridarea .trend-img-show-two .trendImg-two{width:100%;height:auto;display: inline-block;}
.prevPage-two{position: absolute;top:363px;left:40px;cursor: pointer;}
.nextPage-two{position: absolute;top:363px;right:40px;cursor: pointer;}
.listTwo{position: relative;}
.showListTwo{height: 20px;line-height: 20px;position: absolute;bottom:-10px;left:80%;background-color: #ffffff;text-align: center;cursor: pointer;}
.jian-two{position: absolute;left:25px;top:50px;z-index: 1; }
.yuan-two{position: absolute;right:25px;top:50px;z-index: 1}
.PoupDiv-two{border-radius:4px;min-width:150px;min-height:45px;position:absolute;background-color: #fff799;z-index: 1000;top:40px; left:34%;display: none}
.PoupDivBody-two{position: absolute; width:10px; height: 10px; left:20px; top:-10px}
.dropDown1-two,.dropDown2-two{width:0;height:0; overflow:hidden;border-width:5px; border-style:dotted dotted solid;  position:absolute;}
.dropDown1-two{border-color:transparent transparent #fff;top:0px;z-index:0;}
.dropDown2-two{border-color:transparent transparent #FFF799; top:0px;z-index:0;}
.ui-box-body-two {padding-top:2px;}
.ui-box-body-two p{font-size:12px;line-height:20px;color:#313131;padding-left:5px;}
</style>

<script type="text/javascript">
//商品销量&销售金额列表的显示与隐藏
function showListOne(){
	if($('.listOne').is(':hidden') == true){
		$('.listOne').show();
		$('.showListOne img').attr('src','/admin/images/orderBaseCount/btn_hide.png');
		$('.showListOne .text').text('<ui:i18n key="隐藏详情数据"/>');
		$('.showListOne').css('top','99%');
		$('.trend-img-show').css('border','1px solid #eeeeee');
		$('.ui-gridarea.clearfix').css('border','0');
		$('.ui-gridarea.clearfix').css('border-bottom','1px solid #eeeeee');
	}else{
		$('.listOne').hide();
		$('.showListOne img').attr('src','/admin/images/orderBaseCount/btn_detail.png');
		$('.showListOne .text').text('<ui:i18n key="显示详情数据"/>');
		$('.showListOne').css('top','97.5%');
		$('.trend-img-show').css('border','0');
		$('.ui-gridarea.clearfix').css('border-bottom','0');
		$('.ui-gridarea.clearfix').css('border','1px solid #eeeeee');
	}
}
// 点击量&销售量列表的显示与隐藏
function showListTwo(){
	if($('.listTwo').is(':hidden') == true){
		$('.listTwo').show();
		$('.showListTwo img').attr('src','/admin/images/orderBaseCount/btn_hide.png');
		$('.showListTwo .text').text('<ui:i18n key="隐藏详情数据"/>');
		$('.showListTwo').css('top','99%');
		$('.trend-img-show-two').css('border','1px solid #eeeeee');
		$('.ui-gridarea.clearfix-two').css('border','0');
		$('.ui-gridarea.clearfix-two').css('border-bottom','1px solid #eeeeee');
	}else{
		$('.listTwo').hide();
		$('.showListTwo img').attr('src','/admin/images/orderBaseCount/btn_detail.png');
		$('.showListTwo .text').text('<ui:i18n key="显示详情数据"/>');
		$('.showListTwo').css('top','97.5%');
		$('.trend-img-show-two').css('border','0');
		$('.ui-gridarea.clearfix-two').css('border-bottom','0');
		$('.ui-gridarea.clearfix-two').css('border','1px solid #eeeeee');
	}
}

$(function (){
	//加载第一个走势图

	first(1,10);
	if(${page.totalPageCount } == '0'){
		$('.prev').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
	}else{
		$('.prevPage').click(function(){
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var date1 = new Date(startDate);
			var date2 = new Date(endDate);
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			var pageCurr = Number($('.js-grid-content.one #currentPage').find('option:selected').val());
			var pageUnit = Number($('.js-grid-content.one #pageUnit').find('option:selected').val());
			if(pageCurr == 1){
				$('.prev').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
				$('.next').attr('src','/admin/images/goodsStatistics/icon_right.png');
				showPage(pageCurr,pageUnit);
			}else{
				if(pageCurr == 2){
					$('.prev').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
				}else{
					$('.prev').attr('src','/admin/images/goodsStatistics/icon_left.png');
				}
				$('.next').attr('src','/admin/images/goodsStatistics/icon_right.png');
				showPage(pageCurr-1,pageUnit);
			}
		});
	}
	if(${page.totalPageCount } == '0'){
		$('.next').attr('src','/admin/images/goodsStatistics/icon_right_end.png');
	}else{
		$('.nextPage').click(function(){
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var date1 = new Date(startDate);
			var date2 = new Date(endDate);
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			var pageCurr = Number($('.js-grid-content.one #currentPage').find('option:selected').val());
			var pageUnit = Number($('.js-grid-content.one #pageUnit').find('option:selected').val());
			
			if(pageCurr == ${page.totalPageCount }){
				$('.prev').attr('src','/admin/images/goodsStatistics/icon_left.png');
				$('.next').attr('src','/admin/images/goodsStatistics/icon_right_end.png');
				showPage(pageCurr,pageUnit);
			}else{
				if(pageCurr == ${page.totalPageCount -1}){
					$('.next').attr('src','/admin/images/goodsStatistics/icon_right_end.png');			
				}else{
					$('.next').attr('src','/admin/images/goodsStatistics/icon_right.png');
				}
				$('.prev').attr('src','/admin/images/goodsStatistics/icon_left.png');
				showPage(pageCurr+1,pageUnit);
			}
		});
	}
	
	//加载第二个走势图
	second(1,10);
	if(${page1.totalPageCount} == '0'){
		$('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
	}else{
		$('.prevPage-two').click(function(){
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var date1 = new Date(startDate);
			var date2 = new Date(endDate);
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			var pageCurr = Number($('.js-grid-content.two #currentPage').find('option:selected').val());
			var pageUnit = Number($('.js-grid-content.two #pageUnit').find('option:selected').val());
			if(pageCurr == 1){
				$('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
				$('.next-two').attr('src','/admin/images/goodsStatistics/icon_right.png');
				showPageTwo(pageCurr,pageUnit);
			}else{
				if(pageCurr == 2){
					$('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
				}else{
					$('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left.png');
				}
				$('.next-two').attr('src','/admin/images/goodsStatistics/icon_right.png');
				showPageTwo(pageCurr-1,pageUnit);
			}
		});
	}
	if(${page1.totalPageCount} == '0'){
		$('.next-two').attr('src','/admin/images/goodsStatistics/icon_right_end.png');
	}else{
		$('.nextPage-two').click(function(){
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var date1 = new Date(startDate);
			var date2 = new Date(endDate);
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			var pageCurr = Number($('.js-grid-content.two #currentPage').find('option:selected').val());
			var pageUnit = Number($('.js-grid-content.two #pageUnit').find('option:selected').val());
			if(pageCurr == ${page1.totalPageCount}){
				$('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left.png');
				$('.next-two').attr('src','/admin/images/goodsStatistics/icon_right_end.png');
				showPageTwo(pageCurr,pageUnit);
			}else{
				if(pageCurr == ${page1.totalPageCount -1}){
					$('.next-two').attr('src','/admin/images/goodsStatistics/icon_right_end.png');			
				}else{
					$('.next-two').attr('src','/admin/images/goodsStatistics/icon_right.png');
				}
				$('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left.png');
				showPageTwo(pageCurr+1,pageUnit);
			}
		});
	}
	
}); 
//保存表单内容--销量
function downSalesExcel(){
	if(window.confirm('<ui:i18n key="您确定要导出Excel吗"/>？')){
		//存储excel表中的内容
		//var excelBody=gethtml();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var date1 = new Date(startDate);
		var date2 = new Date(endDate);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		
		var url = '/admin/report/goods/downSalesExcel.htm';
		var params = {
				startDate : startDate
				,endDate : endDate
		}
		ggFormSubmit(url,params);
		
	}
}
//保存表单内容--点击量
function downClickExcel(){
	if(window.confirm('<ui:i18n key="您确定要导出Excel吗"/>？')){
		//存储excel表中的内容
		//var excelBody=gethtml();
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		var date1 = new Date(startDate);
		var date2 = new Date(endDate);
		if(date1 > date2){
			alert('<ui:i18n key="查询时间选择错误"/>！');
			return;
		}
		
		var url = '/admin/report/goods/downClickExcel.htm';
		var params = {
				startDate : startDate
				,endDate : endDate
		}
		ggFormSubmit(url,params);
		
	}
}
//销量与金额走势图
function first(num1,num2){
	var msg = new Array();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var pageCurr = num1;
	var pageUnit = num2;
	var param = {startDate:startDate,endDate:endDate,pageCurr:pageCurr,pageUnit:pageUnit};
	$.ajax({
		data : param,
		url : '/admin/report/goods/getWeeklyData.htm', 
		success : function(data){
			var dataM = data.salesList;
			var length = dataM.length; 
				for(var i=0;i<10;i++){
					msg[i] = new Array();
					var flag = true;
					for(var j=0;j<length;j++){
						if(i == j){
							msg[i][0] = dataM[j].GOODS_NM;
							msg[i][1] = dataM[j].GOODS_CNT;
							msg[i][2] = parseInt(dataM[j].PRICE_UNIT_SUM);
							break;
						}	
						if(i > length-1){
							flag = false;	
						}
					}
					if(!flag || length == 0){
						msg[i][0] = '';
						msg[i][1] = 0;
						msg[i][2] = 0;
					} 
				}
				
				var splinechart;  
				Highcharts.setOptions({ 
				    colors: ['#3473dd', '#0e9715', '#d1102d', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', 
				'#FFF263', '#6AF9C4'] 
				}); 
			    $(document).ready(function () {  
			    	
			        splinechart = new Highcharts.Chart({  
			            chart : {  
			                renderTo : 'splineContainer',  
			                type : 'column',  
			                margin : [80, 60, 50, 60],
			            }
			            , 
			            
			            credits: {  
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
			            title : {  
		                    style :{  
		                  		display : 'none'  
		              		}
		                },
			            xAxis : {
			            	categories : [msg[0][0],msg[1][0],msg[2][0],msg[3][0],msg[4][0],msg[5][0],msg[6][0],msg[7][0],msg[8][0],msg[9][0]],
			            	left :60,
			                lineWidth : 1,  
			                lineColor : '#dfe7ef',  
			                gridLineWidth : 0,  
			                lineColor : '#000000', 
			                startOnTick : false,  
			                tickPixelInterval : 100,  
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
			                     useHTML : true,
			                     formatter : function() {
			                    	 //获取到刻度值
			                    	 var labelVal = this.value;
			                    	 //实际返回的刻度值
			                    	 var reallyVal = '<span  title='+this.value+'>'+labelVal+'</span>';
			                    	 //判断刻度值的长度
			                    	 if(labelVal.length > 5){
			                    	 //截取刻度值
			                    	 reallyVal = '<span  title='+this.value+'>'+labelVal.substr(0,5)+'<br/>'+labelVal.substring(5,10)+'</span>';
			                    	 }
			                    	 return reallyVal;
			                    }
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
			                gridLineWidth : 1,  
			                gridLineColor : '#d3d3d3',  
			                lineColor : '#000000',  
			                tickColor : '#000000',  
			                tickWidth : 0,
			                min:0,
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
			                gridLineWidth :1,  
			                gridLineColor : '#d3d3d3',  
			                lineColor : '#000000',  
			                tickColor : '#000000',  
			                tickWidth : 0,
			                min : 0,
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
			            
			            legend: {  
			                layout : 'horizontal',  
			                backgroundColor : '#ffffff',  
			                align : 'center',  
			                verticalAlign : 'top',  
			                x : 0,  
			                y : 0,  
			                floating : true,
			                symbolPadding : 10,
			                symbolWidth : 20,
			                shadow : false, 
			                itemWidth : 100,
			                borderWidth : 0,
			                labelFormatter: function() {
			                    return "<span class='name'>"+this.name+'&nbsp'+"</span>";
			                },
			                useHTML:true
			            },  
			            tooltip : {  
			                shared : true,  
			                crosshairs : true,
			                useHTML : true,
			                headerFormat : '<span style="font-family: "Microsoft YaHei";font-size:12px">{point.key}</span><br>',//<small>{point.key}</small><table>
			            	pointFormat : '<span style="color: {series.color};text-align:left">{series.name}&nbsp:&nbsp</span>' +
			            	'<span style="font-weight:bold;text-align:left;"><b>{point.y}</b></span><br>',
			            	formatter : function(){
			            		var formatterName = '<span class="name">'+this.x+'</span>';
			            		for(var i = 0 ;i<this.points.length;i++)
			            		{		
			            			if(i == 0){
			            				formatterName +='<br/><span class="name" style="color: '+this.points[i].series.color+'">' + this.points[i].series.name + '</span>&nbsp;:&nbsp;<span style="font-weight:bold;" class="name">' + this.points[i].y +'&nbsp;件'+'</span>';	
			            			}else{
			            				formatterName +='<br/><span class="name" style="color: '+this.points[i].series.color+'">' + this.points[i].series.name + '</span>&nbsp;:&nbsp;<span style="font-weight:bold;" class="name">' + this.points[i].y +'&nbsp;元'+'</span>';	
			            			}
			            				            				
			            		}
			            		return formatterName;
			            	}
			            }, 
			            plotOptions : {  
				            column : {
				                pointPadding : 0,
				                borderWidth : 0,
				                pointWidth : 30,
				                groupPadding :0.13,
				            },
			            
			            }, 
			            series : [{ //第一个Y轴的数据
			                name : '<ui:i18n key="销售量"/>',
			                color : '#74beff',
			                type : 'column',
			                yAxis : 0,
			                data : [msg[0][1],msg[1][1],msg[2][1],msg[3][1],msg[4][1],msg[5][1],msg[6][1],msg[7][1],msg[8][1],msg[9][1]],
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
		                        valueSuffix : '<ui:i18n key="件"/>'
		                    }
			            },{ //第二个Y轴的数据
			                name : '<ui:i18n key="销售金额"/>',
			                color : '#ffa1db',
			                type : 'column',
			                yAxis : 1,//坐标轴序号
			                data : [msg[0][2],msg[1][2],msg[2][2],msg[3][2],msg[4][2],msg[5][2],msg[6][2],msg[7][2],msg[8][2],msg[9][2]],
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
		                        valueSuffix : '<ui:i18n key="元"/>'
		                    },
			            }]
			        });
			       $('.trendImg .highcharts-legend-item').hover(function(){
			    		var id = $(this).index();
			    		$('.ui-box-body').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose').attr('style','left:37.5%').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="查询期间内各商品的销售总件数"/>. </p>';
			    			$('.ui-box-body').append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose').attr('style','left:48.9%').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="查询期间内各商品的销售总金额"/>.</p>';	
			    			$('.ui-box-body').append(htm);
			    		}
			    	},
			    	function(){
			    		$('#PoupDivClose').hide()
			    	}
			    	);
			    }); 
			 
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
}
//点击量与销量走势图
function second(num1,num2){
	var msg = new Array();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var pageCurr = num1;
	var pageUnit = num2;
	var param = {startDate:startDate,endDate:endDate,pageCurr:pageCurr,pageUnit:pageUnit};
	$.ajax({
		data : param,
		url : '/admin/report/goods/getWeeklyData.htm', 
		success : function(data){
			var dataM = data.clickList;
			var length = dataM.length;
				for(var i=0;i<10;i++){
					msg[i] = new Array();
					var flag = true;
					for(var j=0;j<length;j++){
						if(i == j){
							msg[i][0] = dataM[j].GOODS_NM;
							msg[i][1] = dataM[j].CLICKS;
							msg[i][2] = dataM[j].GOODS_CNT;
							break;
						}
						if(i > length-1){
							flag = false;	
						}
					}
					if(!flag || length == 0){
						msg[i][0] = '';
						msg[i][1] = 0;
						msg[i][2] = 0;
					} 
				}
				
				var splinechart;  
				Highcharts.setOptions({ 
				    colors: ['#3473dd', '#0e9715', '#d1102d', '#DDDF00', '#24CBE5', '#64E572', '#FF9655', 
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
			            	categories : [msg[0][0],msg[1][0],msg[2][0],msg[3][0],msg[4][0],msg[5][0],msg[6][0],msg[7][0],msg[8][0],msg[9][0]],
			            	left : 60,
			                lineWidth : 1,  
			                lineColor : '#dfe7ef',  
			                gridLineWidth : 0,  
			                lineColor : '#000000', 
			                startOnTick : false,  
			                tickPixelInterval : 100,  
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
			                     useHTML : true,
			                     formatter : function() {
			                    	 //获取到刻度值
			                    	 var labelVal = this.value;
			                    	 //实际返回的刻度值
			                    	 var reallyVal = '<span  title='+this.value+'>'+labelVal+'</span>';
			                    	 //判断刻度值的长度
			                    	 if(labelVal.length > 5){
			                    	 //截取刻度值
			                    	 reallyVal = '<span  title='+this.value+'>'+labelVal.substr(0,5)+'<br/>'+labelVal.substring(5,10)+'</span>';
			                    	 }
			                    	 return reallyVal;
			                    }
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
			                tickWidth : 0,
			                min:0,
			                title : {  
			                    style:  
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
			                gridLineWidth :1,  
			                gridLineColor : '#d3d3d3',  
			                lineColor : '#000000',  
			                tickColor : '#000000',   
			                tickWidth : 0,
			                min:0,
			                title : {  
			                    style:  
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
			                symbolPadding : 10,
			                symbolWidth : 20,
			                itemWidth : 140,
			                borderWidth : 0,
			                labelFormatter: function() {
			                    return "<span class='name'>"+this.name+'&nbsp'+"</span>";
			                },
			                useHTML:true
			            },  
			            tooltip : {  
			                shared : true,  
			                crosshairs : true,
			                useHTML : true,
			                headerFormat : '<span style="font-family : "Microsoft YaHei";font-size:12px">{point.key}</span><br>',//<small>{point.key}</small><table>
			            	pointFormat : '<span style="color : {series.color};text-align:left">{series.name}&nbsp:&nbsp</span>' +
			            	'<span style="font-weight:bold;text-align:left;"><b>{point.y}</b></span><br>',
			            	formatter : function(){
			            		var formatterName = '<span class="name">'+this.x+'</span>';
			            		for(var i = 0 ;i<this.points.length;i++)
			            		{		
			            			if(i == 0){
			            				formatterName += '<br/><span class="name" style="color: '+this.points[i].series.color+'">' + this.points[i].series.name + '</span>&nbsp;:&nbsp;<span style="font-weight:bold;" class="name">' + this.points[i].y +'&nbsp;次'+'</span>';	
			            			}else{
			            				formatterName += '<br/><span class="name" style="color: '+this.points[i].series.color+'">' + this.points[i].series.name + '</span>&nbsp;:&nbsp;<span style="font-weight:bold;" class="name">' + this.points[i].y +'&nbsp;件'+'</span>';	
			            			}
			            				            				
			            		}
			            		return formatterName;
			            	}
			            },  
			            plotOptions : {  
				            column : {
				                pointPadding : 0,
				                borderWidth : 0,
				                pointWidth : 30,
				                zIndex : 0
				            },
				            spline : {
				            	 zIndex : 10
				            }
			            }, 
			            series : [{ //第一个Y轴的数据
			            	name : '<ui:i18n key="点击量"/>',
			                color : '#ffa1db',
			                type : 'spline',
			                data : [msg[0][1],msg[1][1],msg[2][1],msg[3][1],msg[4][1],msg[5][1],msg[6][1],msg[7][1],msg[8][1],msg[9][1]],
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
		                        valueSuffix : '<ui:i18n key="次"/>'
		                    },
		                    connectNulls :true,
			            },{ //第二个Y轴的数据
			            	name : '<ui:i18n key="销售量"/>',
			                color : '#74beff',
			                type : 'column',
			                yAxis : 1,//坐标轴序号
			                data : [msg[0][2], msg[1][2],msg[2][2],msg[3][2],msg[4][2],msg[5][2],msg[6][2],msg[7][2],msg[8][2],msg[9][2]],
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
		                        valueSuffix : '<ui:i18n key="件"/>'
		                    }
			            }]
			        });
			        $('.trendImg-two .highcharts-legend-item').hover(function(){
			    		var id = $(this).index();
			    		$('.ui-box-body-two').children().remove();
			    		if(id == 0){
			    			$('#PoupDivClose-two').attr('style','left:33.3%').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="查询期间内各商品的点击总次数"/>.</p>';
			    			$('.ui-box-body-two').append(htm);
			    		}else if(id == 1){
			    			$('#PoupDivClose-two').attr('style','left:48.8%').show();
			    			var htm = '<p><ui:i18n key="点击可隐藏显示该数据"/>.</p><p><ui:i18n key="查询期间内各商品的销售总件数"/>.</p>'
			    			$('.ui-box-body-two').append(htm);
			    		}
			    	},
			    	function(){
			    		$('#PoupDivClose-two').hide()
			    	}
			    	);
			    });
			},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	});
}
function showPage(pageNo, pageSize){
	query(pageNo, pageSize);
}

function search(){
	query(1, 10); 
	queryTwo(1, 10); 
}

function query(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	
	var params = {
			startDate : startDate
			,endDate : endDate
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/report/goods/goodsListFragment.htm';
	 
	 var content = $('.js-grid-content.one');
	 var qushi = $('.trend-img-show');
	 content.showLoading();
	 qushi.showLoading();
	 content.load(url , params ,  function(){ 
		 content.find('.select2').select2({
			 minimumResultsForSearch : 5
			 ,allowClear : true 
		 });
		 if( pageNo == 1){
			 $('.prev').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
		 }else{
			 $('.prev').attr('src','/admin/images/goodsStatistics/icon_left.png');
		 }
		 if(pageNo == ${page.totalPageCount}){
			 $('.next').attr('src','/admin/images/goodsStatistics/icon_right_end.png');
		 }else{
			 $('.next').attr('src','/admin/images/goodsStatistics/icon_right.png');
		 }
		first(pageNo,pageSize);
		content.hideLoading();
		qushi.hideLoading();
	 });
}
function showPageTwo(pageNo, pageSize){
	queryTwo(pageNo, pageSize);
}
function queryTwo(pageNo, pageSize){
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var date1 = new Date(startDate);
	var date2 = new Date(endDate);
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	
	var params = {
			startDate : startDate
			,endDate : endDate
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/report/goods/clicksListFragment.htm';
	 
	 var content = $('.js-grid-content.two');	
	 var qushi = $('.trend-img-show-two');
	 content.showLoading();
	 qushi.showLoading();
	 content.load(url , params ,  function(){ 
		 content.find('.select2').select2({
			 minimumResultsForSearch : 5
			 ,allowClear : true 
		 });
		 if( pageNo == 1){
			 $('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left_end.png');
		 }else{
			 $('.prev-two').attr('src','/admin/images/goodsStatistics/icon_left.png');
		 }
		 if(pageNo == ${page1.totalPageCount}){
			 $('.next-two').attr('src','/admin/images/goodsStatistics/icon_right_end.png');
		 }else{
			 $('.next-two').attr('src','/admin/images/goodsStatistics/icon_right.png');
		 }
		second(pageNo,pageSize);
		content.hideLoading();
		qushi.hideLoading();
	 });
	 
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
			
			<!-- ▼标题 -->
			<div class="clearfix" style="margin-top: 20px;">
				<div class="title-warp">
					<img alt="" src="/admin/images/orderBaseCount/trend.png" style="height: 16px;width: 16px">
					<span class="title-name"><ui:i18n key="商品销量"/>&<ui:i18n key="销售金额"/></span>
				</div>
			</div>
			<!-- ▲标题 -->
			
          	<div class="ui-gridarea clearfix">
          		<!-- start趋势图 -->
          	 	<div class="trend-img-show">
          	 		<div class="jian">(<ui:i18n key="件"/>)</div>
          	 		<div class="yuan">(<ui:i18n key="元"/>)</div>
					<div class="trendImg" id="splineContainer" >
	          				
	          		</div>
	          		<div class="prevPage">
	          			<c:choose>
							<c:when test="${page.totalPageCount == 1 || requestScope.pageCurr == 1}">
								<img class="prev" src="/admin/images/goodsStatistics/icon_left_end.png"/>
							</c:when>
							<c:otherwise>
								<img class="prev" src="/admin/images/goodsStatistics/icon_left.png"/>
							</c:otherwise>
						</c:choose>
	          		</div>
					<div class="nextPage">
						<c:choose>
							<c:when test="${page.totalPageCount == 1 || requestScope.pageCurr==page.totalPageCount}">
								<img class="next" src="/admin/images/goodsStatistics/icon_right_end.png"/>
							</c:when>
							<c:otherwise>
								<img class="next" src="/admin/images/goodsStatistics/icon_right.png"/>
							</c:otherwise>
						</c:choose>
						
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
				
				<!-- end趋势图 -->
				<!-- start详细数据 -->
				<div class="listOne" style="display: none">
					<div class="result-grid" style="margin-top: 50px;">
				      	<div class="result-grid-header">
			   				<div class="result-grid-tools">
			   				   <span class="result-grid-tool" onclick="downSalesExcel();">
			      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出到Excel"/>
			      		   		</span>
			   				</div>
			   			</div>
			   			<div class="js-grid-content one">
			   				<div class="result-data-warp" style="">
			   					<table class="result-grid-table">
						      		<colgroup>
					      		 			<col width="100px" />
					      		 			<col  />
					      		 			<col width="120px" />
					      		 			<col width="120px" />
					      		 		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th><ui:i18n key="销量排名"/></th>
						      		 		<th><ui:i18n key="商品名"/></th>
						      		 		<th><ui:i18n key="销售量"/></th>
						      		 		<th><ui:i18n key="销售金额"/></th>
						      		 	</tr>
						      		 </thead>
						      		 <tbody  class="result-grid-tbody">
						      		 <c:forEach items="${page.data}" var="item">
						      		 	<tr>
						      		 		<td>${item.ID }</td>
						      		 		<td>${item.GOODS_NM }</td>
						      		 		<td>${item.GOODS_CNT }</td>
						      		 		<td>${item.PRICE_UNIT_SUM }</td>
						      		 	</tr>
						      		 </c:forEach>
						      		 </tbody>
						      	</table>
			   				</div>
					      	<ui:paging page="${page }" />
					      	 
				     	</div>
		      		</div>
	           	</div>
	           <div class="showListOne" onclick="showListOne();">
					<span id="showMarkSpan" style="margin-right:10px;"><img alt="" src="/admin/images/orderBaseCount/btn_detail.png" style="margin-right: 10px;margin-left: 10px;"><span class="text"><ui:i18n key="显示详情数据"/></span></span>
				</div>
	          </div>
				
	          
	        <!-- ▼标题 -->
			<div class="clearfix" style="margin-top: 20px;">
				<div class="title-warp">
					<img alt="" src="/admin/images/orderBaseCount/trend.png" style="height: 16px;width: 16px">
					<span class="title-name"><ui:i18n key="点击量"/>&<ui:i18n key="销售量"/></span>
				</div>
			</div>
			<!-- ▲标题 -->
			
	         <div class="ui-gridarea clearfix-two">
	           	<!-- start趋势图 -->
          	 	<div class="trend-img-show-two">
          	 		<div class="jian-two">(<ui:i18n key="次"/>)</div>
          	 		<div class="yuan-two">(<ui:i18n key="件"/>)</div>
					<div class="trendImg-two" id="splineContainerTwo" >
	          				
	          		</div>
	          		<div class="prevPage-two">
	          			<c:choose>
							<c:when test="${page1.totalPageCount == 1 || requestScope.pageCurr == 1}">
								<img class="prev-two" src="/admin/images/goodsStatistics/icon_left_end.png"/>
							</c:when>
							<c:otherwise>
								<img class="prev-two" src="/admin/images/goodsStatistics/icon_left.png"/>
							</c:otherwise>
						</c:choose>
	          		</div>
	          		<div class="nextPage-two">
						<c:choose>
							<c:when test="${page1.totalPageCount == 1 || requestScope.pageCurr1==page1.totalPageCount}}">
								<img class="next-two" src="/admin/images/goodsStatistics/icon_right_end.png"/>
							</c:when>
							<c:otherwise>
								<img class="next-two" src="/admin/images/goodsStatistics/icon_right.png"/>
							</c:otherwise>
						</c:choose>
						
					</div>	
	          		<div class="PoupDiv-two" id="PoupDivClose-two">
					    <div class="PoupDivBody-two">
					         <div class="dropDown1-two"></div>
					         <div class="dropDown2-two"></div>
					    </div>
					    <div class="ui-box-two">
							<div class="ui-box-header-two">
							  	<h3 class="title-two"></h3>
							</div>
							<div class="ui-box-body-two">
							  		
							</div>
						</div>
				    </div> 
				</div>
				<!-- end趋势图 -->
				<!-- start详细数据 -->
				<div class="listTwo" style="display: none">
	           	<div class="result-grid" style="margin-top: 50px;">
				      	<div class="result-grid-header">
			   				<div class="result-grid-tools">
			   				   <span class="result-grid-tool" onclick="downClickExcel();">
			      		   	 	 	<img alt="" src="/admin/images/goodsStatistics/icon_excel.png" /><ui:i18n key="导出到Excel"/>
			      		   		</span>
			   				</div>
			   			</div>
			   			<div class="js-grid-content two">
			   				<div class="result-data-warp" style="">
			   					<table class="result-grid-table">
						      		<colgroup>
					      		 			<col width="100px" />
					      		 			<col  />
					      		 			<col width="120px" />
					      		 			<col width="120px" />
					      		 		</colgroup>
						      		 <thead class="result-grid-thead">
						      		 	<tr>
						      		 		<th><ui:i18n key="点击量排名"/></th>
						      		 		<th><ui:i18n key="商品名"/></th>
						      		 		<th><ui:i18n key="点击量"/></th>
						      		 		<th><ui:i18n key="销售量"/></th>
						      		 	</tr>
						      		 </thead>
						      		 <tbody  class="result-grid-tbody">
						      		 <c:forEach items="${page1.data}" var="item">
						      		 	<tr>
						      		 		<td>${item.ID }</td>
						      		 		<td>${item.GOODS_NM }</td>
						      		 		<td>${item.CLICKS }</td>
						      		 		<td>${item.GOODS_CNT }</td>
						      		 	</tr>
						      		 </c:forEach>
						      		 </tbody>
						      	</table>
			   				</div>
					      	<ui:paging page="${page1 }" method="showPageTwo"/>
					      	 
				     	</div>
		      		</div>
	         </div>
	         <div class="showListTwo" onclick="showListTwo();">
	           	<span id="showMarkSpan" style="margin-right:10px;"><img alt="" src="/admin/images/orderBaseCount/btn_detail.png" style="margin-right: 10px;margin-left: 10px;"><span class="text"><ui:i18n key="显示详情数据"/></span></span>
	         </div>
		</div>
	<!-- ▲ Main container -->
	<!-- ▼ Main footer -->
	<%-- <footer class="ui-footer">
		<div class="ui-footer-inner clearfix">
			<jsp:include page="/admin/inc/footer.jsp"></jsp:include>
		</div>
	</footer> --%>
	<!-- ▲ Main footer -->
</body>
</html>