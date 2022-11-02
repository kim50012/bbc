<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <script type="text/javascript" src="/admin/js/ueditor/third-party/highcharts/highcharts.js"></script>
<title></title>  
<style type="text/css">
 
 *{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;color:#5f5f5f;}
 .detail-title-div{width:100%;height:35px;font-size:15px;line-height: 35px;margin-top:20px;}
 .detail-title-div .title-div-left{float:left;margin-left:10px;font-size:12px;color:#5f5f5f;}
 .detail-title-div .title-div-right{float:right;margin-right:10px;}
 .detail-title-div .title-div-left span:first-child{color:#333;font-size:14px;}
 .detail-title-div .title-div-right span:first-child{color:#5f5f5f;font-size:12px;}
 .detail-title-div .title-div-right span:last-child{color:#d1102d;font-size:12px;}
 .detail-body-div{width:100%;height:400px;}
 .detail-body-div .img-trend-show{width:100%;height:400px;}
 .table-out-div{widht:100%;margin-bottom:30px;}
 .table-out-div .title-head-table-div{width:96%;margin-left:2%;font-size:12px;height:30px;line-height:30px;}
 /* .table-out-div .title-head-table-div div:first-child{font-size:15px;padding-left:30px;background-image: url("/admin/images/orderBaseCount/detail.png");background-repeat: no-repeat;background-position: 10px 13px;float:left;} */
 .table-out-div .title-head-table-div div{font-size:12px;padding-left:30px;color:#5f5f5f;background-image: url("/admin/images/imgTextSituation/icon_excel.png");background-repeat: no-repeat;background-position: 6px 7px;float:right;cursor: pointer;}
 .table-out-div table {width:100%;position: relative;font-size:12px;}
 .table-out-div table thead tr td{height:30px;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;border-right:1px solid #e5e5e5;font-size:12px;text-align: center;}
 .table-out-div table tbody tr td{height:30px;border-bottom:1px solid #e5e5e5;font-size:12px;text-align: center;}
 
.PoupDiv{display:none; border-radius:4px; min-width:150px; min-height:45px; position:absolute; background-color: #fff9ad;  left:512px; top:90px;}
.dropDown1,.dropDown2 { width:0; height:0;  overflow:hidden; border-width:5px; border-style:dotted dotted solid; position:absolute;}
.PoupDivBody{position: absolute; width:10px; height: 10px; left:20px; top:-10px}
.dropDown1{border-color:transparent transparent #fff;top:-1px}
.dropDown2{border-color:transparent transparent #FFF799; top:0}
.ui-box-body {padding-top:2px;}
.ui-box-body p{font-size:12px;line-height:20px;color:#5f5f5f;padding-left:5px;padding-right:30px; }
.name{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
.container{
	width:750px;
	margin-left:29px;
}
</style> 
 
<script type="text/javascript">
$(function () {
	
	$('.create-excel-out').click(function(){
		var flag = window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？');
		if(flag){
			var action =  '/admin/report/newsfeedDetalDownload.htm';
			var msgId = '${msgId }';
			var params = {
				msgId : msgId
			}
			ggFormSubmit(action,params);
		}
	});
	//设置X轴坐标值的显示
	var msg = new Array();
	var trData = $('#dataBody').find('tr');
	msg[0] = new Array(); 
	msg[1] = new Array();
	msg[2] = new Array();
	msg[3] = new Array();
	msg[4] = new Array();
	msg[5] = new Array();
	msg[6] = new Array();
	msg[7] = new Array();
	for(var i = 0;i<trData.length;i++){
		var tdData = $(trData.get(i)).find('td');
		for(var j = 0;j <=7 ;j++){
				if(j == 0){
					var date = $(tdData.get(j)).text();
					msg[j][i] = date.substring(6,date.length);
					//$(tdData.get(j)).text();		
				}else{
					msg[j][i] = Number($(tdData.get(j)).text());
				}
				
			}
		}
	//alert(msg);
	var numWidth1 = 0;
	var numWidth2 = 0;
	var numWidth3 = 0;
	var numWidth4 = 0;
	var numBegin = 0;
	if('<ui:i18n key="您确定需要导出数据吗"/>' == '您确定需要导出数据吗'){
		numWidth1 = 175;
		numWidth2 = 289;
		numWidth3 = 402;
		numWidth4 = 502;
	}else{
		numWidth1 = 154;
		numWidth2 = 310;
		numWidth3 = 430;
		numWidth4 = 523;
	}
	
	/* var msg=new Array();
	for(var i=0;i<7;i++){
		var today=new Date(); // 获取今天时间
		today.setDate(today.getDate()+(i-6));
		var day=getMyDate(today);
		msg[i]=day;			
	} */
    $('#imgTrendShow').highcharts({
    chart : {
        type : 'line',
        marginTop : 60,
        marginBottom : 50
    },
    credits : {  
  	  enabled : false  
  	},  
    title : {
        text : ''
    },
    subtitle : {
        text : ''
    },
    xAxis : {
        categories : msg[0],
        labels : {                                                      
            overflow : 'justify' ,
            x : 0,
            y : 30
        }    
    },
    yAxis : {
    	min : 0,
        title : {
            text : ''
        }
    },
    tooltip : {
    	shared : true, //是否共享提示，也就是X一样的所有点都显示出来
    	useHTML : true, //是否使用HTML编辑提示信息
    	headerFormat : '<small>{point.key}</small><table>',
    	pointFormat : '<tr><td style="color: {series.color}" class="name">{series.name}</td>:' +
    	'<td style="text-align: right" class="name"><b>{point.y}</b></td></tr>',
    	footerFormat : '</table>',
    	valueDecimals : 0, //数据值保留小数位数
    	crosshairs : true,
    	formatter : function(){
    		var formatterName = '';
    		/* formatterName="<span class='name'>"+formatterName+"</span>"; */
    		for(var i = 0 ;i < this.points.length;i++)
    		{
    			if (this.points[i].series.name == 'K10AH_AP'){
    				formatterName += "<span class='name' style='color: " + this.points[i].series.color+"'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;'class='name'>" +  this.points[i].y + '</span><br/>';		            				
    			}
    			else{
    				formatterName += "<span class='name' style='color: " + this.points[i].series.color + "'>" + this.points[i].series.name + "</span>&nbsp;:&nbsp;<span style='font-weight:bold;' class='name'>" + this.points[i].y + '</span><br/>';		            				
    			}
    		}
    		return formatterName;
    	}
    	},
    /* tooltip: {
        enabled: true,
        formatter: function() {
            return '<b>'+ this.series.name +'</b><br>'+this.x +': '+ this.y +'°C';
        }
    }, */
    plotOptions : {
        line : {
            dataLabels : {
                enabled : true
            }/* ,
            enableMouseTracking: false */
        }
    },
    legend : {                                                          
        layout : 'horizontal',                                            
        align : 'center',                                                
        verticalAlign : 'top',                                          
        x : 0,                                                        
        y : 0,                                                        
        floating : true,                                                
        borderWidth : 0, 
        //itemWidth :numWidth,
        backgroundColor : '#FFFFFF',                                    
        shadow : false,
        itemStyle : {
            
            fontSize : '12px'
        }
       	//reversed:true
    }, 
    series : [
     {                                                               
        name : '<ui:i18n key="图文页阅读人数"/>',                                             
        data : (function(){
        	return msg[1];
        })()                                
    },{                                                               
        name : '<ui:i18n key="原文页阅读人数"/>',                                             
        data : (function(){
        	return msg[3];
        })()                             
    },{                                                               
        name : '<ui:i18n key="分享转发人数"/>',                                             
        data : (function(){
        	return msg[5];
        })()                              
    }, 
    {                                                               
        name : '<ui:i18n key="微信收藏人数"/>',                                             
        data : (function(){
        	return msg[7];
        })()                               
    }
    ] 
});
  $('.highcharts-legend-item').hover(function(){
		var id = $(this).index();
		$('#addui-box-body').children().remove();
		if(id == 0){
			$('#PoupDivClose').attr('style','left:' + (numWidth1) + 'px;').show();
			var htm = '<p><ui:i18n key="点击图文页的去重人数包括非粉丝"/>' + '.</p><p><ui:i18n key="同一用户当天内重复阅读也只按一人计数"/>' + '.</p>';
			$('#addui-box-body').append(htm);
		}else if(id == 1){
			$('#PoupDivClose').attr('style','left:' + (numWidth2) + 'px;').show();
			var htm = '<p><ui:i18n key="点击原文页的去重人数包括非粉丝"/>' + '.</p>' + 
					'<p><ui:i18n key="同一用户当天内重复阅读也只按一人计数"/>' + '.</p>';
			$('#addui-box-body').append(htm);
		}else if(id == 2){
			$('#PoupDivClose').attr('style','left:' + (numWidth3) + 'px;').show();
			var htm = '<p><ui:i18n key="转发或分享到朋友朋友圈的去重用户数包括非粉丝"/>' + '. </p><p><ui:i18n key="当天内向同一用户重复分享也只按一人计数"/>' + '.</p>';
			$('#addui-box-body').append(htm);
		}else if(id == 3){
			$('#PoupDivClose').attr('style','left:' + (numWidth4) + 'px;').show();
			var htm = '<p><ui:i18n key="在微信中保存该图文信息的去重用户数包括非粉丝"/>' + '.</p><p><ui:i18n key="用户当天内重复收藏同一图文消息也只按一人计数"/>' + '.</p>';
			$('#addui-box-body').append(htm);
		}
		//付款金额：客户当天支付的交易总金额.
	},
	function(){
		$('#PoupDivClose').hide()
	}
	);
    /* $(parent.document.getElementById('iframe_msg_detail')).attr('style","height:"+document.body.scrollHeight+"px"); */ 
});

</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="detail-title-div">
			<div class="title-div-left">
				<span>【${msgTitle }】</span>
				<span>${sendDate}</span>
				<input type="hidden" value="${requestScope.newsId}" id="newsId"/>
			</div>
			<div class="title-div-right">
				<span><ui:i18n key="送达总人数"/>:</span>
				<span>${requestScope.custNum }</span>
			</div>
		</div>
		<div class="detail-body-div">
			<div class="img-trend-show" id="imgTrendShow">
				
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
				  		<p><ui:i18n key="点击可隐藏显示该数据"/>.</p>
								<p></p>
				  	</div>
				 </div>
	    	</div>
	    </div>
		<div class="table-out-div">
			<div class="title-head-table-div">
				<%-- <div>
					<span ><ui:i18n key="详情数据"/></span>
				</div> --%>
				<div>
					<span class="create-excel-out" style="font-size:14px;"><ui:i18n key="导出Excel"/></span>
				</div>
			</div>
			<div class="result-grid"> 
				<table class="result-grid-table" style="margin-bottom:30px;">
		      		<colgroup>
	   		 			<col width="20%" />
	   		 			<col width="10%" />
	   		 			<col width="10%" />
	   		 			<col width="10%" />
	   		 			<col width="10%" />
	   		 			<col width="10%" />
	   		 			<col width="10%" />
	   		 			<col width="20%" />
	   		 		</colgroup>
		      		<thead class="result-grid-thead">
						<tr style="height:32px;">
							<td style="border-left:0;border-right:0;" rowspan="2">
								<ui:i18n key="日期"/>
							</td>
							<td colspan="2">
								<ui:i18n key="图文页阅读"/>
							</td>
							<td colspan="2">
								<ui:i18n key="原文页阅读"/>
							</td>
							<td colspan="2">
								<ui:i18n key="分享转发"/>
							</td>
							<td style="border-right:0;border-right:0;" rowspan="2">
								<ui:i18n key="微信收藏人数"/>
							</td>
						</tr>
						<tr  style="height:32px;">
							<td style="width:10%;"><ui:i18n key="人数"/></td>
							<td style="width:10%;"><ui:i18n key="次数"/></td>
							<td style="width:10%;"><ui:i18n key="人数"/></td>
							<td style="width:10%;"><ui:i18n key="次数"/></td>
							<td style="width:10%;"><ui:i18n key="人数"/></td>
							<td style="width:10%;"><ui:i18n key="次数"/></td>
						</tr>
					</thead>
					<tbody id="dataBody">
						<c:forEach items="${dataList }" var="item" varStatus="status">
							<tr>
								<td>${item.REF_DATE }</td>
								<td>${item.INT_PAGE_READ_USER}</td>
								<td>${item.INT_PAGE_READ_COUNT  }</td>
								<td>${item.ORI_PAGE_READ_USER }</td>
								<td>${item.ORI_PAGE_READ_COUNT }</td>
								<td>${item.SHARE_USER}</td>
								<td>${item.SHARE_COUNT  }</td>
								<td>${item.ADD_TO_FAV_USER }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>