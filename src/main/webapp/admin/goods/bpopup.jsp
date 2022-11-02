<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0L);

	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="basePath" value="<%=basePath%>" />
 <!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>无标题文档</title>  
  <link rel="stylesheet" type="text/css" href="/admin/css/chosen.css" />  
 <link rel="stylesheet" type="text/css" href="/admin/css/select2.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/jquery-ui.min.css" />  
 <link rel="stylesheet" type="text/css" href="/admin/css/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="/admin/css/common.css" />  
  
	<script type="text/javascript" src="/admin/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="/admin/js/underscore-min.js"></script>
	<script type="text/javascript" src="/admin/js/backbone-min.js"></script>
	<script type="text/javascript" src="/admin/js/template.js"></script>
	<script type="text/javascript" src="/admin/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/admin/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="/admin/js/select2.min.js"></script>
 
 
 
<script type="text/javascript">
$(function(){
	document.title = 'bPopup';
	$('#btnTest').click(function(){
		$('.divPopup').bPopup({ 	
	     	 modalClose: false,//弹出框深色区域，关闭的响应
	         modalColor: "#aeaeae",
	         opacity: 0.8,
	         follow: [true, true], //x, y
	           // position: [150, 400], //x, y
	         //positionStyle: 'fixed' ,
	         fadeSpeed: 'slow' //弹出速度  string ('slow'/'fast') or int (1500)           
	     });
		
	});
	 
     $('#btnClose').click(function () {
         $('.divPopup').bPopup().close();
     });
})
</script>
<script> 

$(function() {
	$(".select2").select2({
		width:"element"
		//,minimumInputLength:2
		//,maximumInputLength:10
		//,minimumResultsForSearch:5
		,separator:'^'
		,allowClear: true 
		,closeOnSelect:true  //defalut:true
		,openOnEnter:true 
	}); 
	
	$('#btn_set').click(function(){
		 
		$('#select2_1').select2('val',1);
		$('#select2_2').select2('val',[1,2,4]);
		$('#select2_1').select2('open'); 
		alert(1);
		$('#select2_1').select2('close');
	});
	$('#btn_value').click(function(){
		
		alert($('#select2_1').select2('val'));
		alert($('#select2_2').select2('val'));
	});
	
	  $("#select2_1").on("change", function (e) { 
		  if($(this).val() != ''){
			  $("#chosen2").attr('disabled', false).trigger("chosen:updated.chosen");
		  }else{
			  $("#chosen2").val('').attr('disabled', true).trigger("chosen:updated.chosen"); 
		  }
		   
	  });
	  
	  
	  $('#chosen2').val([2,3]).trigger("chosen:updated.chosen");
	  
	  $("#chosen2").chosen().change(function(){
		  //alert($(this).val());
		    
		});
}); 

</script>
<style type="text/css">
.select2{
 width: 300px;
}
</style>
</head>
<body>
	<jsp:include page="/admin/inc/menutop.jsp">
		<jsp:param value="${topMenuType}" name="topMenuType"/> 
	</jsp:include>
	<!-- ▼ Main container --> 
        <div class="container">
        	<!-- ▼ Left Menu  --> 
        	<jsp:include page="/admin/inc/menuleft.jsp">
				<jsp:param value="${topMenuType}" name="topMenuType"/> 
				<jsp:param value="${leftMenuLelel1}" name="leftMenuLelel1"/> 
				<jsp:param value="${leftMenuLelel2}" name="leftMenuLelel2"/> 
			</jsp:include>
		    <!-- ▲ Left Menu  -->
		    
		    
            <%--  --%>
            <!-- ▼ detali content  --> 
            <div class="ui-right-content">
				<div class="content-warp">
				<div style="border:1px solid red; ">
				
				<form class=""> 
				   <div class="controls">
				        <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
				        <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
				       <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
				       <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
					</div>
				   <div class="controls">
				        <span  style="display:inline-block; width:80px;padding-left:5px;" >中国你好订单 </span>
				        <input type="text" class="input-medium"  placeholder="Email">
				        <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
				       <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
				       <span  style="display:inline-block; width:80px;padding-left:5px;" >Emalaa </span>
				        <input type="text" class="input-medium"  placeholder="Email">
					</div>
				   
						 
					 
					 
				</form>
				</div>
				
				
				<hr>
				
				
				 
          <h3>chosen下拉框</h3>
          <label>单选
          <select data-placeholder="请选择" class="chosen-select-deselect"  >
            <option value=""></option>
            <option value="1">United States</option>
            <option value="2">United Kingdom</option>
            <option value="3">Afghanistan</option>
            <option value="4">Aland Islands</option>
            <option value="5">Albania</option>
            <option value="6">Algeria</option>
            <option value="7">American Samoa</option>
            <option value="8">Andorra</option>
          </select>
          </label>
          
          <label>多选
        <select id="chosen2" data-placeholder="请选择" class="chosen-select-deselect" multiple   >
           <option value=""></option>
            <option value="1">United States</option>
            <option value="2">United Kingdom</option>
            <option value="3">Afghanistan</option>
            <option value="4">Aland Islands</option>
            <option value="5">Albania</option>
            <option value="6">Algeria</option>
            <option value="7">American Samoa</option>
            <option value="8">Andorra</option>
          </select>
          </label>
         <h3>select2下拉框</h3>
          
          <label>单选
          <select id="select2_1" data-placeholder="请选择" class="select2"   >
            <option value=""></option>
            <option value="1">中华人民共和国</option>
            <option value="2">United Kingdom</option>
            <option value="3">Afghanistan</option>
            <option value="4">Aland Islands</option>
            <option value="5">Albania</option>
            <option value="6">Algeria</option>
            <option value="7">American Samoa</option>
            <option value="8">Andorra</option>
          </select>
          </label>
          
          <label>多选
        <select id="select2_2"  data-placeholder="请选择" class="select2" multiple  >
           <option value=""></option>
            <option value="1">United States</option>
            <option value="2">United Kingdom</option>
            <option value="3">Afghanistan</option>
            <option value="4">Aland Islands</option>
            <option value="5">Albania</option>
            <option value="6">Algeria</option>
            <option value="7">American Samoa</option>
            <option value="8">Andorra</option>
          </select>
          </label>
           <button id="btn_set">设置值</button>
           <button id="btn_value">获取值</button>
        </div>
        
				  <button id="btnTest">测试</button>
				  
				<hr/>
				 	<div id="tab"></div>
				 	  <style scoped="scoped">
							table { width: 80%; height: 100%;}
							input[type=text]{
							text-align:center;
							}
							.input-mini ,.input-small{
								width: 60px;
							}
 					 </style>
				 	 <script type="text/javascript">
var items = [
		{"code":"1","value":"颜色","subitems":[
				{"code":"11","value":"橙色"},
				{"code":"12","value":"白色"}
			]
		},
		{"code":"2","value":"手镯内径","subitems":[
				{"code":"21","value":"53-55mm"},
				{"code":"22","value":"51-53mm"}
			]
		},
		/*{"code":"3","value":"戒圈","subitems":[
				{"code":"31","value":"19"},
				{"code":"32","value":"15"},
				{"code":"33","value":"12"}
			]
		},
		{"code":"4","value":"大小","subitems":[
				{"code":"41","value":"大"},
				{"code":"42","value":"小"}
			]
		},*/
		{"code":"5","value":"尺寸","subitems":[
				{"code":"51","value":"A"},
				{"code":"52","value":"B"},
				{"code":"53","value":"C"}
			]
		}
	];

 
 
var rowspans = [1]; 
//var subitemSize = []; 
var linesize = 1;
var itemsLen = items.length; 

for(var i = items.length - 1 ; i > -1  ; i--){
	 rowspans.unshift(linesize *= items[i].subitems.length); 
 // subitemSize.unshift(items[i].subitems.length);
}
  
 
 linesize =  rowspans.shift();  

  //document.getElementById('subitemSize').innerHTML = subitemSize;
 //document.getElementById('rowspans').innerHTML = rowspans;
 
 var strHtml= '<table border="1" id="table1"><thead><tr>';
 for(var i = 0; i < items.length  ; i++){
	strHtml+= '<th>' + items[i].value + '</th>';
 }	

 strHtml+= '<th class="th-price">价格（元）</th>';
 strHtml+= '<th class="th-stock">库存</th>';
 strHtml+= '<th class="th-code">商家编码</th>';
 strHtml+= '<th class="text-right">销量</th>';

strHtml+= '</tr></thead><tbody>';

 for(var i = 0; i < linesize  ; i++){
	strHtml+= '<tr>'; 
	 for(var j = 0; j < rowspans.length ; j++){ 
		if(i % rowspans[j] == 0){ 
			if(j == 0){
				strHtml+= '<td data-spec-id="' + items[j].subitems[i / rowspans[j]].code + '" rowspan="' + rowspans[j] + '">' + items[j].subitems[i / rowspans[j]].value + '</td>'; 
			}else{
				strHtml+= '<td data-spec-id="' + items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].code + '" rowspan="' + rowspans[j] + '">' + items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].value + '</td>'; 
			} 
		} 
	 }
 
		var ids='';
		for(var j = 0; j < rowspans.length ; j++){  
			ids += items[j].subitems[parseInt(i / rowspans[j]) % items[j].subitems.length].code ;// + '|'; 
		 }

	  
		strHtml+= '<td>' + '<input type="text" name="sku_price" class="js-price input-mini" value="' + i + '">' + '</td>'; 
		strHtml+= '<td>' + '<input type="text" name="stock_num" class="js-stock-num input-mini" value="">' + '</td>';  
		//strHtml+= '<td>' + '<input type="text" name="code" class="js-code input-small" value="">' + '</td>';  
		strHtml+= '<td>' +  i + '</td>';  
		strHtml+= '<td>' + ids + '</td>';  
	 


	strHtml+= '</tr>';
 }

 strHtml+='</tbody></table>';

document.getElementById('tab').innerHTML = strHtml;
  </script>
				<hr/>
				
				</div>  
				
				
				
				
				<!-- ▼ Popup -->
		        <div class="divPopup" style="display: none;">
		        	  <button id="btnClose">X</button>
		        	  <div class="clearfix">
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa<br>
		        	  </div>
		        </div>
		<!-- ▲ Popup -->  
				        
			</div> 
            <!-- ▲ detali content -->
        </div>

		<!-- ▲ Main container -->
		  <!-- ▼ Main footer -->
        <footer class="ui-footer"> 
			<div class="ui-footer-inner clearfix">
			底部（footer） 
			</div>
		</footer>
		<!-- ▲  Main footer -->
<script type="text/javascript">
    var config = {
      '.chosen-select'           : {},
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
    	 
      $(selector).chosen(config[selector]);
    }
  </script>
</body>
</html>