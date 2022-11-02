<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>
<html lang="en">
 <head>
  <meta charset="UTF-8"> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  
  <title>微信分享链接生成页面</title>
  
<%@ include file="/admin/template/uiInc.jsp"%>
  
  <style type="text/css">
  	* {
  		padding: 0; margin: 0;
  	}
	 
	.item { display:block;word-break: break-all; word-wrap: break-word; margin-bottom: 10px;background-color: #fff;padding: 10px; }
	
	
	#container{
		width: 95%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px;
		background-color: #fff;
		position: relative;
		padding-top: 10px;
	}
	
	table{border:0;margin:0;border-collapse:collapse;
	margin: 10px;
	}
	table td{padding:5;}
	
	caption, th, td {
	  font-size: 1.2em;
	}
	
	.button{
		border: 1px solid green;
		background-color: #e3e3e3;
		padding:5px 20px;
		  border-radius: 8px;
		  display: inline-block;
		  cursor: pointer;
	}
	
	.button + .button{
		margin-left: 20px;
	}
	 
  </style>
   <script type="text/javascript">
    
   $(function(){
	   
	   $(".datepicker").datepicker(); 
	   
	   $('#type').change(function(){
		   
		   var limit = $(this).find("option:selected").data('limit');
		   if(!!limit){
			   $('#maxRange').text(limit + '天');
		   }else{
			   $('#maxRange').text('');
		   }
	   });
	   
	   $('#menuBtn').click(function(){
		   
		   var shopId = $('#shopId').val();
		   var type = $('#type').val();
		   var startDate = $('#startDate').val();
		   var endDate = $('#endDate').val(); 
		 
		 
		   if(shopId == ''){
			   alert('请选择Shop ID');
			   return false;
		   }
		   if(type == ''){
			   alert('请选择接口类型');
			   return false;
		   }
		   if(startDate == ''){
			   alert('请选择Start Date');
			   return false;
		   }
		   if(endDate == ''){
			   alert('请选择End Date');
			   return false;
		   }
		   
		   //var url = 'http://www.hanzhimeng.com/wx/qrcode/create.htm?shopId=' + shopId + '&type=' + type;
			  var url = '/wx/static/sync.htm?shopId=' + shopId + '&type=' + type+ '&startDate=' + startDate+ '&endDate=' + endDate;
			  
			   $('#ifr-result').attr('src',url);
		   
	   });
	   
   });
  </script>
  
 </head>
 <body style="background-color: #eee;min-width:1000px;">
  <div id="container" >
  	
  	 <h3 style="margin: 10px;">生成二维码</h3>
  	 
  	<table width="100%" >
  		<tr>
  		
  		</tr>
  		<colgroup>
  		 <col width="10%" />
  		 <col width="23%" />
  		 <col width="10%" />
  		 <col width="23%" />
  		 <col width="10%" />
  		 <col width="23%" />
  		</colgroup>
	  <tr>
		<td>Shop ID: </td>
		<td>
		<select id="shopId" style="width: 90%; height:26px;"    >
            <option value=""></option>
            <c:forEach items="${requestScope.appInfoList}" var="item" varStatus="status">
				<option value="${item.shopId}" <c:if test="${shopId eq item.shopId }"> selected="selected" </c:if>>${item.shopId} - ${item.shopNm}</option>
			</c:forEach>
        </select>
		</td>
	 
		<td>接口类型: </td>
		<td colspan="3">
			<select id="type" style="width: 90%; height:26px;"    >
              <option value="">请选择</option>
               <optgroup label="-----用户分析数据接口-----">
	              <option value="101" data-limit="7">获取用户增减数据(getusersummary)</option> 
	              <option value="102" data-limit="7">获取累计用户数据(getusercumulate)</option> 
               </optgroup>
               <optgroup label="-----图文分析数据接口-----">
	              <option value="201" data-limit="1">获取图文群发每日数据(getarticlesummary)</option> 
	              <option value="202" data-limit="1">获取图文群发总数据(getarticletotal)</option> 
	              <option value="203" data-limit="3">获取图文统计数据(getuserread)</option> 
	              <option value="204" data-limit="1">获取图文统计分时数据(getuserreadhour)</option> 
	              <option value="205" data-limit="7">获取图文分享转发数据(getusershare)</option> 
	              <option value="206" data-limit="1">获取图文分享转发分时数据(getusersharehour)</option> 
               </optgroup>
               <optgroup label="-----消息分析数据接口-----">
	              <option value="301" data-limit="7">获取消息发送概况数据(getupstreammsg)</option> 
	              <option value="302" data-limit="1">获取消息分送分时数据(getupstreammsghour)</option> 
	              <option value="303" data-limit="30">获取消息发送周数据(getupstreammsgweek)</option> 
	              <option value="304" data-limit="30">获取消息发送月数据(getupstreammsgmonth)</option> 
	              <option value="305" data-limit="15">获取消息发送分布数据(getupstreammsgdist)</option> 
	              <option value="306" data-limit="30">获取消息发送分布周数据(getupstreammsgdistweek)</option> 
	              <option value="307" data-limit="30">获取消息发送分布月数据(getupstreammsgdistmonth)</option> 
               </optgroup>
               <optgroup label="-----接口分析数据接口-----">
	              <option value="401" data-limit="30">获取接口分析数据(getinterfacesummary)</option> 
	              <option value="402" data-limit="1">获取接口分析分时数据(getinterfacesummaryhour)</option> 
               </optgroup>
           </select>
		</td>
	 </tr>
	  <tr>	
		<td>Date Range:</td>
		<td>
			<input id="startDate" type="input" style="width: 100px;" class="datepicker"> 
			&nbsp;&nbsp;~&nbsp;&nbsp; 
			<input id="endDate" type="input"  style="width: 100px;" class="datepicker">
		</td>
		<td>最大时间跨度:</td>
		<td>
			<span id="maxRange" style="color: red; font-weight: bold;"></span>
		</td>
		<td></td>
		<td></td>
	  </tr>
	  <tr>
		<td colspan="6" style="text-align: center;">
			<span class="button" id="menuBtn">生成</span> 
	  </tr>
	  </table>
	  	 
  </div>
 
 <div style="margin: 10px auto; width: 95%;">
      <iframe id="ifr-result" src="" width="100%" height="500px" frameborder="no" 
      border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes" 
      style="background-color: #fff;min-height: 500px;"></iframe>
  
  	 
  </div> 
  

 </body> 
</html>