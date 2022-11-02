<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts.js"></script>
<title><ui:i18n key="图文群发现况"/></title>  
<style type="text/css">
 .mtitle-span-limit{
 	width:90%;
 	white-space:nowrap;
 	text-overflow:ellipsis; 
 	overflow:hidden;
 }
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
	background-color: #fb6e52;
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

 
<script type="text/javascript">
window.onload = function(){
 
	/********  时间的显示操作  Start  *********/
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var dateNow = '';
	if(month < 10){
		dateNow = year+'-0'+month+'-00';
	}else{
		dateNow = year+''+month+'-00';
	}
	var yearShow = Number(${requestScope.yearDate});
	var monthShow = Number(${requestScope.monthDate});
	$('#yearDate').append('<option value=""></option>');
	if(year >= 2015){
		for(var i = 0;i <= (year-2015);i++){
			$('#yearDate').append('<option value="' + (2015 + i) + '">' + (2015 + i) + '<ui:i18n key="年"/></option>');				
		}
	}
	//var yearSelect=$("#yearDate').val();
	$('#monthDate').children().remove();
	$('#monthDate').append('<option value=""></option>');
	if(year == yearShow){
		for(var i = 1;i <= month;i++){
			$('#monthDate').append('<option value="' + i + '">' + i + '<ui:i18n key="月"/></option>');	
		}
	}else{
		for(var i = 1;i <= 12;i++){
			$('#monthDate').append('<option value="' + i + '" >' + i + '<ui:i18n key="月"/></option>');
		}
	}
	$('#yearDate').select2('val',yearShow);
	$('#monthDate').select2('val',monthShow).attr('disabled',false);
	/********  时间的显示操作  END  *********/
	//趋势图的颜色设置
	$('.datepicker').datepicker();
	Highcharts.setOptions({ 
	    colors: ['#498cfd', '#18d90e', '#ff5341', '#fff368', '#2bd2ec','#64E572', '#FF9655', 
	'#FFF263', '#6AF9C4'] 
	}); 
	//设置X轴坐标值的显示
	var msg = new Array();
	var trData = $('.result-grid-tbody').find('tr');
	msg[0] = new Array();
	msg[1] = new Array();
	msg[2] = new Array();
	msg[3] = new Array();
	msg[4] = new Array();
	msg[5] = new Array();
	msg[6] = new Array();
	for(var i = 0;i < trData.length;i++){
		var tdData = $(trData.get(i)).find('td');
		for(var j = 0;j <= 6;j++){
			if(j>1){
				msg[j][i] = Number($(tdData.get(j)).text());	
			}else{
				if(j == 0){
					msg[j][i] = $(tdData.get(j)).text();
				}else{
					if($(tdData.get(j)).text().length>13){
						msg[j][i] = '<span class="name" title="' + $(tdData.get(j)).text() + '">' + $(tdData.get(j)).text() + '</span>';
					}else{
						msg[j][i] = '<span class="name" title="' + $(tdData.get(j)).text() + '">' + $(tdData.get(j)).text() + '</span>';					
					}
				}
			}
		}
	}
	for(var i = 1;i <= trData.length;i++){
		$('.chart-warp').append('<p class="date-p" id="date' + i + '"></p>');
	}
	 
	//设置X轴的时间显示位置，设定X轴的间距
	for(var i = 1;i <= msg[0].length;i++){
		$('#date' + i).text(msg[0][i-1]).attr('style','top:' + (135 + 182*(i-1)) + 'px;');
		$('#chart-container').attr('style','height:' + (149 + 182*i + 2) + 'px');
	}
	
	 
	//趋势图的显示
	$('#chart-container').highcharts({                                           
        chart: {                                                           
            type: 'bar',
            marginLeft:200,
            marginBottom:80,
        },                                                                 
        title: {                                                           
            text: ''                    
        },                                                                 
        subtitle: {                                                        
            text: ''                                  
        },                                                                 
        xAxis: {                                                           
            categories: msg[1],
            tickColor: '#e8e8e8',  
            tickLength: 180,  
            tickWidth: 1, 
            tickPixelInterval:190,
            title: {                                                       
                text: null                                                 
            },
            labels:{
            	useHTML:true
            }                                                              
        },                                                                 
        yAxis: {                                                           
            min: 0,                                                        
            title: {                                                       
                text: '(<ui:i18n key="人"/>)',                             
                /* verticalAlign: 'bottom', */
                align:'high',
                style:{
                	color:"#313131",
                	fontFamily:'font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;',
                	fontWeight:'normal'
                }
            },
            opposite:true,
            labels: {                                                      
                overflow: 'justify' ,
                x:0,
                y:-20
            }                                                              
        },                                                                 
        tooltip: {                                                         
            valueSuffix: ''                                       
        },                                                                 
        plotOptions: {                                                     
            bar: {                                                         
                dataLabels: {                                              
                    enabled: true                                          
                }                                                          
            },
            series: {
                pointPadding: 0, //数据点之间的距离值
                groupPadding: 0.07, //分组之间的距离值
                borderWidth: 0,
                shadow: false,
                pointWidth:18 //柱子之间的距离值
            }
        },                                                                 
        legend: {                                                          
            layout: 'horizontal',                                            
            align: 'center',                                                
            verticalAlign: 'bottom',                                          
            x: 0,                                                        
            y: 0,                                                        
            floating: true,                                                
            borderWidth: 0,                                                
            backgroundColor: '#FFFFFF',                                    
            shadow: false,
            itemStyle: {
                
                fontSize:'12px'
            },
            reversed:true
        },                                                                 
        credits: {                                                         
            enabled: false                                                 
        },                                                                 
        series: [{                                                               
            name: '<span style="font-family: \'Microsoft YaHei\', \'Malgun Gothic\',\'맑은 고딕\', Arial;"><ui:i18n key="微信收藏人数"/></span>',                                             
            data: (function(){
            	return msg[6];
            })()                               
        },{                                                               
            name: '<span style="font-family: \'Microsoft YaHei\', \'Malgun Gothic\',\'맑은 고딕\', Arial;"><ui:i18n key="分享转发人数"/></span>',                                             
            data: (function(){
            	return msg[5];
            })()                              
        }, {                                                               
            name: '<span style="font-family: \'Microsoft YaHei\', \'Malgun Gothic\',\'맑은 고딕\', Arial;"><ui:i18n key="原文页阅读人数"/></span>',                                             
            data: (function(){
            	return msg[4];
            })()                             
        }, {                                                               
            name: '<span style="font-family: \'Microsoft YaHei\', \'Malgun Gothic\',\'맑은 고딕\', Arial;"><ui:i18n key="图文页阅读人数"/></span>',                                             
            data: (function(){
            	return msg[3];
            })()                                
        }, {                                                         
            name: '<span style="font-family: \'Microsoft YaHei\', \'Malgun Gothic\',\'맑은 고딕\', Arial;"><ui:i18n key="送达人数"/></span>',                                             
            data: (function(){
            	return msg[2];
            })()                                
        } 
        ]                                                                 
    });   
	//根据条件查询数据
	$('.js-search').click(function(){
		var yearDate = $('#yearDate').val();
		var monthDate = $('#monthDate').val();
		var title = $('#title').val();
		var descFlag = $('#descFlag').val();
		var orderBy = $('#orderBy').val();
		if(yearDate == ''){
			alert('<ui:i18n key="请选择查询的年份"/>。');
			return;
		}
		if(monthDate == ''){
			alert('<ui:i18n key="请选择查询的月份"/>。');
			return;
		}
		var action =  '/admin/report/newsfeedSummary.htm';
		var params = {
			yearDate : yearDate
			,monthDate : monthDate
			,title : title
			,descFlag : descFlag
			,orderBy : orderBy
		}
		
		ggFormSubmit(action,params);
		
	});
	
	//导出Excel数据
	$('.js-export-excel').click(function(){
		//***************
		//y验证各个查询条件是否符合条件
		//***************
		
		
		if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
			var url = '/admin/report/newsfeedSummaryDownload.htm';
			var params = {
					yearDate : $('#yearDate').val()
					,monthDate : $('#monthDate').val()
					,title : $('#title').val()
					,descFlag : $('#descFlag').val()
					,orderBy : $('#orderBy').val()
			}
			ggFormSubmit(url,params);
			
		}
	});
	
	
	$('.js-show-detal').click(function(){
		var msgid = $(this).data('msgid');
		var custNum = $(this).data('custnum');
		 showIframeBpopupWindow({
				id : 'bpoupMessage',
				width : 810,
				height : 600,
				action : '/admin/report/newsfeedDetail.htm?msgId='+ msgid + '&custNum='+custNum
			});	  	 
	});
	//详细信息框的关闭
	$('.bpopupColseWarp').click(function(){
		closeBpopupWindow('bpoupMessage');
	});
};
	//年份变化操作
	function yearChange(){
		$('#monthDate').select2('val','').attr('disabled',false);
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var yearSelect = $('#yearDate').val();
		$('#monthDate').children().remove();
		$('#monthDate').append('<option value=""></option>');
		if(yearSelect == year){
			for(var i = 1;i <= month;i++){
				$('#monthDate').append('<option value="' + i + '">' + i + '<ui:i18n key="月"/></option>');
			}
		}else if(yearSelect == ''){
			$('#monthDate').attr('disabled','disabled');
		}else{
			for(var i = 1;i <= 12;i++){
				$('#monthDate').append('<option value="' + i + '">' + i + '<ui:i18n key="月"/></option>');
			}
		}
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
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from">
       		<div class="form-table" >
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="120px" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="日期"/>：</td>
       		 			<td class="fcomp">
       		 				<select class="select2 sw9" id="yearDate" data-placeholder="<ui:i18n key="年"/>" onchange="yearChange();">
							</select>
							<select class="select2 sw6" id="monthDate" data-placeholder="<ui:i18n key="月"/>" disabled="disabled">
							</select>
						</td>
					</tr>
					<tr>
       		 			<td class="flabel last"><ui:i18n key="排序"/>：</td>
       		 			<td class="fcomp last">
       		 				<select class="select2 sw18" id="orderBy" >
								<option value=""></option>
								<option value="1" <c:if test="${requestScope.orderBy=='1' }">selected="selected"</c:if>><ui:i18n key="发布时间"/></option>
								<option value="2" <c:if test="${requestScope.orderBy=='2' }">selected="selected"</c:if>><ui:i18n key="送达人数"/></option>
								<option value="3" <c:if test="${requestScope.orderBy=='3' }">selected="selected"</c:if>><ui:i18n key="图文页阅读人数"/></option>
								<option value="4" <c:if test="${requestScope.orderBy=='4' }">selected="selected"</c:if>><ui:i18n key="原文页阅读人数"/></option>
								<option value="5" <c:if test="${requestScope.orderBy=='5' }">selected="selected"</c:if>><ui:i18n key="分享转发人数"/></option>
								<option value="6" <c:if test="${requestScope.orderBy=='6' }">selected="selected"</c:if>><ui:i18n key="微信收藏人数"/></option>
							</select>
							<select class="select2 sw9" id="descFlag">
								<option value=""></option>
								<option value="1" <c:if test="${requestScope.descFlag=='1' }">selected="selected"</c:if>><ui:i18n key="正序"/></option>
								<option value="2" <c:if test="${requestScope.descFlag=='2' }">selected="selected"</c:if>><ui:i18n key="倒序"/></option>
							</select>
							<input type="text"   class="w21" value="${requestScope.title }" id="title" placeholder='<ui:i18n key="按标题搜索"/>' style="background-color: #fff;padding:4px 6px;" autocomplete="off" />
       		 			</td>
       		 		</tr>
       		 	</table>
       		</div>
       		 
       		<!-- -->
       		<div class="butttn-area m2" >
       		   <span class="button js-search">
       		   	  <span class="button-icon search"></span>
       		   	  <span class="button-name"><ui:i18n key="查询"/></span>
       		   </span>
       		</div>
      	</div>
  		<!-- ▲ 查询表单区域  -->
		
		<div class="cust-report-warp">
			<div class="clearfix">
				<div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${summary.SEND_CNT gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/imgTextSituation/icon_mass.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	${summary.SEND_CNT}
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="群发总次数"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${summary.SEND_TARGET_CNT gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/imgTextSituation/icon_send.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${summary.SEND_TARGET_CNT}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="送达总人数"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${summary.READ_CUST_CNT gt 0}">
			  	 			<div class="INT_PAGE_READ_USER bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/imgTextSituation/icon_imagestext.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${summary.INT_PAGE_READ_USER}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="图文页阅读总人数"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${summary.ORI_PAGE_READ_USER gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/imgTextSituation/icon_detail.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${summary.ORI_PAGE_READ_USER}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="原文页阅读总人数"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
				<div class="report-item">
			  	 	<c:choose>
			  	 		<c:when test="${summary.SHARE_USER gt 0 or summary.ADD_TO_FAV_USER gt 0}">
			  	 			<div class="report-type-color bg-red"></div>
			  	 		</c:when>
			  	 		<c:otherwise>
			  	 			<div class="report-type-color bg-gray"></div>
			  	 		</c:otherwise>
			  	 	</c:choose>
			  	 	<div class="report-type-content">
			  	 		 <div class="report-item-icon">
			  	 		 	<img src="/admin/images/imgTextSituation/icon_retweet.png"/>
			  	 		 </div>
			  	 		 <div class="report-item-num">
			  	 		 	<fmt:formatNumber value="${summary.SHARE_USER  + summary.ADD_TO_FAV_USER}" pattern="###,###,##0"/>
			  	 		 </div>
			  	 		 <div class="report-item-name">
			  	 		 	<ui:i18n key="转发收藏总人数"/>
			  	 		 </div>
			  	 	</div>
			  	 </div>
			</div>
		</div>
		
		<!-- ▼标题 -->
		<div class="clearfix">
			<div class="title-warp">
				<img alt="" src="/admin/images/v2-icons/icon-grap.png">
				<span class="title-name"><ui:i18n key="图文群发现况"/></span>
			</div>
		</div>
		<!-- ▲标题 -->
		
		<div class="chart-area">
			<div class="chart-warp">
       			<div id="chart-container">
       				
       			</div>
       		</div>
       		<div class="result-grid js-summary-detail" style="margin-top:20px;display:none;">
		      	<div class="result-grid-header">
	   				<div class="result-grid-tools js-export-excel">
	   					<img alt="" src="/admin/images/imgTextSituation/icon_excel.png" />
	   				   <span class="result-grid-tool">
						  	<ui:i18n key="导出Excel"/>
	      		   		</span>
	   				</div>
	   			</div>
		      	<table class="result-grid-table" style="margin-bottom:30px;">
		      		<colgroup>
       		 			<col width="10%" 	/>
       		 			<col width="20%" 	/>
       		 			<col width="10.5%" 	/>
       		 			<col width="15%"	/>
       		 			<col width="12.5%" 	/>
       		 			<col width="11%" 	/>
       		 			<col width="11%" 	/>
       		 			<col width="10%" 	/>
       		 		</colgroup>
		      		 <thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th>
		           				<span><ui:i18n key="日期"/></span>					
		           			</th>
		           			<th>
		           				<span><ui:i18n key="标题"/></span>
		           			</th>
		           			<th>
		           				<span><ui:i18n key="送达人数"/></span>
		           			</th>
		           			<th>
		           				<span><ui:i18n key="图文页阅读人数"/></span>
		           			</th>
		           			<th>
		           				<span><ui:i18n key="原文页阅读人数"/></span>
		           			</th>
		           			<th>
		           				<span><ui:i18n key="分享转发人数"/></span>
		           			</th>
		           			<th>
		           				<span><ui:i18n key="微信收藏人数"/></span>
		           			</th>
		           			<th>
		           				<span><ui:i18n key="操作"/></span>&nbsp;&nbsp;&nbsp;	
		           			</th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody">
		      		 	<c:forEach items="${list }" var="list" varStatus="status">
			           		<tr>
			           			<td>${list.REF_DATE }</td>
			           			<td class="text-left"><span class="mtitle-span-limit" title="${list.TITLE }">${list.TITLE }</span></td>
			           			<td>${list.SEND_TARGET_CNT }</td>
			           			<td>${list.INT_PAGE_READ_USER }</td>
			           			<td>${list.ORI_PAGE_READ_USER }</td>
			           			<td>${list.SHARE_USER }</td>
			           			<td>${list.ADD_TO_FAV_USER }</td>
			           			<td>
									<span class="gridbutton red js-show-detal"  data-msgid="${list.MSGID }" data-custnum="${list.SEND_TARGET_CNT }" ><ui:i18n key="详细信息"/></span>
			           			</td>
			           		</tr>
		           		</c:forEach>
		      		 </tbody>
		      	</table>
		     </div>
		    <div style="height:30px;"></div>
		    <div onclick="showData();" class="show-more js-show-more">
				<a class="show-more-icon"></a>
				<span><ui:i18n key="显示详情数据"/></span>
			</div>
		</div>
		
		<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bpoupMessage" >
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title"><ui:i18n key="详情信息"/></h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp"> 
		 		 	<iframe class="js-content-iframe"  width=100%; height=100%; id="iframe_msg_detail"  style="overflow: hidden;" src=""></iframe>
		 		 </div>
		 	</div>
		</div>
		<!-- ▲ bpopup area -->
	</div>
	<!-- ▲ container  -->
</body>
</html>
