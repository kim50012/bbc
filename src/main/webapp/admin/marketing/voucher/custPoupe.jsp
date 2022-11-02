<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key="优惠券管理"/></title>  
<style type="text/css">

 .top-title-div{
 	font-size:12px;
 	color:#5f5f5f;
 	margin-left:20px;
 	margin-top:10px;
 	margin-bottom:-10px;
 }
 .showimg-body-out-div{
	width:100%;
	border-bottom:1px solid #eee;
 }
 .bottom-div-pageNum{
	height:68px;
	line-height:68px;
	position: relative;
}
.bottom-div-pageNum .page-select{
	float:right;
	width:450px;
}
.bottom-div-pageNum .page-select img{
	cursor: pointer;
}
.bottom-div-pageNum .page-select .select2{
	width:100px;
	margin-left:20px;
	margin-right:20px;
	
}
.bottom-div-pageNum .page-select .pageShowNum{
	display: inline-block;
	font-size:12px;
	color:#5f5f5f;
	margin-left:30px;
}
.bottom-div-pageNum  .submit-div{
	width:70px;
	height:30px;
	background-color: #fb6e52;
	color:#fff;
	font-size:12px;
	float:left;
	text-align: center;
	line-height:30px;
	display: inline-block;
	margin-top:19px;
	border-radius:2px;
	cursor: pointer;
}
.bottom-div-pageNum  .submit-div.confirm{
	margin-left:40px;
	margin-right:20px;
}
.showimg-body-out-div{
	width:100%;
	border-bottom:1px solid #eee;
}
.container{
	width:900px;
}
</style> 
 
<script type="text/javascript">
$(function() {
	$('#gradeSel').select2('val','${requestScope.grade}');
	 $('#selectAll').on('ifChecked', function(event){
		 $('.js-check-item').iCheck('check');
	 });
	 $('#selectAll').on('ifUnchecked', function(event){
		 $('.js-check-item').iCheck('uncheck');
	 });
	//关闭页面
	$('.submit-div.cancel').click(function(){
		parent.window.closebpoupMe();
	});
});

//分页操作
function gets_value(){
	//存储分页的页数
	var pageCurr = $('#whole').find('option:selected').val();
	var pageUnit = 10;
	var gradeSel = $('#gradeSel').val();
	var nickName = $('#nickName').val();
	var gradeId = $('#gradeId').val();
	var couponId = $('#couponId').val();
	var flag = 1;
	if(gradeSel == ''){
		gradeSel = gradeId;
		flag = 2;
	}
	window.location.href='/admin/voucher/custPoupe.htm?pageUnit=' + pageUnit + '&pageCurr=' + pageCurr + '&grade=' + gradeSel + '&nickName=' + nickName + '&couponId=' + couponId + '&gradeId=' + gradeId + '&flag=' + flag;
}
//页面的上一页，下一页，第一页，最后一页的操作。
function pageNext(pageCurr){
	var pageUnit = 10;
	var gradeSel = $('#gradeSel').val();
	var nickName = $('#nickName').val();
	var gradeId = $('#gradeId').val();
	var couponId = $('#couponId').val();
	var flag = 1;
	if(gradeSel == ''){
		gradeSel = gradeId;
		flag = 2;
	}
	window.location.href='/admin/voucher/custPoupe.htm?pageUnit=' + pageUnit + '&pageCurr=' + pageCurr + '&grade=' + gradeSel + '&nickName=' + nickName + '&couponId=' + couponId + '&gradeId=' + gradeId + '&flag=' + flag;
}
//文件名类似查询
function selectByParam(){
	var pageUnit = 10;
	var pageCurr = 1;
	var gradeSel = $('#gradeSel').val();
	var nickName = $('#nickName').val();
	var gradeId = $('#gradeId').val();
	var couponId = $('#couponId').val();
	var flag = 1;
	if(gradeSel == ''){
		gradeSel = gradeId;
		flag = 2;
	}
	window.location.href='/admin/voucher/custPoupe.htm?pageUnit=' + pageUnit + '&pageCurr=' + pageCurr + '&grade=' + gradeSel + '&nickName=' + nickName + '&couponId=' + couponId + '&gradeId=' + gradeId + '&flag=' + flag;
}
function send(){
	var custSysId='';  
	$('input[name="subcheck"]:checked').each(function(){
		if($(this).data('itemid') !=null){
			custSysId = custSysId + ',' + $(this).val();//向数组中添加元素 
		}
	});
	custSysId = custSysId.substr(1,custSysId.length);
	if(custSysId.length==''){
		alert('<ui:i18n key="请选择用户"/>.');
		return;
	}
	var couponId = $('#couponId').val();
	var param = {
			custSysId : custSysId,
			couponId : couponId,
			};
	$.ajax({
		data:param,
		dataType : 'json',
		type : 'GET',
		cache : false,
		url : '/admin/voucher/send.htm', //调用AdminGoodsSellAction中updateGoodsGroup方法进行商品分类的修改。
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8', 
		success : function(data){
			if(data.result == 'success'){
				if(data.error == '<ui:i18n key="没有足够的优惠券"/>'){
					alert(data.error);
					return;
				}
				alert('<ui:i18n key="优惠券发放成功"/>');
				//window.location.href='/admin/voucher/voucher.htm';
				parent.window.closeDiv();
			}else{
				alert('<ui:i18n key="优惠券发放失败"/>，<ui:i18n key="请重新操作"/>');
			}
		},
		error : function(a, msg, c) {
			alert('error: ' + msg);
		}
	 });
}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="top-title-div">
			<span>*</span>
			<span style="color: #d1102d;margin-left: 0;">${requestScope.adminGradeOneList.gradeName }</span>
			<span style="margin-left: 0;"><ui:i18n key="及更高等级客户可以领取该优惠券"/></span>
		</div>
		<div class="query-from" style="border:0;">
       		<div class="form-table" style="width:80%;">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="15%" />
       		 			<col width="30%"/>
       		 			<col width="10%"/>
       		 			<col/>
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel"><ui:i18n key="客户等级"/>：</td>
       		 			<td class="fcomp">
       		 				<select class="select2" data-placeholder="<ui:i18n key="请选择等级名称"/>" id="gradeSel" style="width:200px;">
								<option value=""></option>
								<c:forEach items="${gradeList}" var="gradeList">
			    				<option value="${gradeList.gradeId }">${gradeList.gradeName }</option>
			    				</c:forEach>
							</select>
						</td>
						<td class="flabel" ><ui:i18n key="昵称"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" value="${requestScope.nickName}" id="nickName" style="font-size: 12px;width:180px;"placeholder='<ui:i18n key="微信昵称不使用可不输入"/>' autocomplete="off"/>
							<input type="hidden" value="${requestScope.couponId }" id="couponId"/>
							<input type="hidden" value="${requestScope.gradeId }" id="gradeId"/>
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		
       		 
       		<!-- -->
       		<div class="butttn-area m1" style="margin-left:0;border:0;">
       		   <span class="button search-roulette" onclick="selectByParam();">
       		   	  <span class="button-icon search"></span>
       		   	 <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
      	<div class="showimg-body-out-div">
			<div class="result-grid" style="width:96%;margin-left:2%;height:290px;">
		      	<div class="js-grid-content">
		      		<table class="result-grid-table">
		      		 	<colgroup>
				      		<col width="55px"  />
	      		 			<col width="130px" />
	      		 			<col width="65px"  />
	      		 			<col width="40px" />
	      		 			<col width="90px"  />
	      		 			<col width="100px" />
	      		 			<col width="100px" />
	      		 			<col width="90px" />
	      		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk"><input type="checkbox" class="iccheckbox js-check-item" id="selectAll" name="selectAll"/><ui:i18n key="全选"/></th>
			      		 		<th><ui:i18n key="粉丝"/></th>
			      		 		<th><ui:i18n key="等级"/></th>
			      		 		<th><ui:i18n key="积分"/></th>
			      		 		<th><ui:i18n key="关注时间"/></th>
			      		 		<th><ui:i18n key="最后对话时间"/></th>
			      		 		<th><ui:i18n key="最后购买时间"/></th>
			      		 		<th><ui:i18n key="购买次数"/></th>
			      		 		<th><ui:i18n key="购买均价"/>（<ui:i18n key="元"/>）</th>
			      		 	</tr>
			      		 </thead>
			      	</table>
		      		<div class="grid-fixed" style="height:240px;">
				      	<table class="result-grid-table fixed">
				      		<colgroup>
					      		<col width="55px"  />
		      		 			<col width="130px" />
		      		 			<col width="65px"  />
		      		 			<col width="40px" />
		      		 			<col width="90px"  />
		      		 			<col width="100px" />
		      		 			<col width="100px" />
		      		 			<col width="90px" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	<c:forEach items="${list}" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td class="chk" style="text-align: left;">
					      		 			<input name="subcheck" <c:if test="${list.STATUS_ID ==2}">disabled="disabled"</c:if> class="iccheckbox js-check-item" value="${list.CUST_SYS_ID }" type="checkbox" data-itemid="${list.STATUS_ID}" >
					      		 		</td>
					      		 		<td style="text-align: left;">
											<img alt="" src="${list.WX_IF_HEADIMGURL }" style="width:60px;height:60px;border:1px solid #eeeeee;vertical-align: top;cursor: pointer;">
           									<span style="width:50px;white-space:nowrap; text-overflow:ellipsis;overflow: hidden; display:inline-block;" id="CUST_NICK_NM">${list.CUST_NICK_NM }</span>							
										</td>
					      		 		<td>${list.GRADE_NM }</td>
					      		 		<td>${list.CUST_POINT }</td>
					      		 		<td>
											<c:choose>
				           						<c:when test="${list.SUBSCRIBE_TIME == null}">
				           							<div style="margin-top:10px"><ui:i18n key="无"/></div>
				           						</c:when>
				           						<c:otherwise>
				           							<div style="margin-top:10px">${list.SUBSCRIBE_TIME}</div>
				           						</c:otherwise>
					           				</c:choose>
										</td>
					      		 		<td>
											<c:choose>
				           						<c:when test="${list.RECEIVE_DT == null}">
				           							<div style="margin-top:10px"><ui:i18n key="无"/></div>
				           						</c:when>
				           						<c:otherwise>
				           							<div style="margin-top:10px">${list.RECEIVE_DT }</div>
				           						</c:otherwise>
					           				</c:choose>	
										</td>
					      		 		<td>
					      		 			<c:choose>
				           						<c:when test="${list.LAST_PUR_DT == null}">
				           							<div style="margin-top:10px"><ui:i18n key="无"/></div>
				           						</c:when>
				           						<c:otherwise>
				           							<div style="margin-top:10px">${list.LAST_PUR_DT }</div>
				           						</c:otherwise>
					           				</c:choose>	
					      		 		</td>
					      		 		<td>${list.PUR_TIMES }</td>
					      		 		<td>${list.GOODS_PRICE_AVG }</td>
					      		 	</tr>
				      		 	</c:forEach>
				      		 </tbody>
				      	</table>
			      	</div>
	      		</div>
	      	</div>
	      </div>
	      <div class="bottom-div-pageNum">
			<div class="submit-div confirm" onclick="send()">
				<ui:i18n key="确认"/>	
			</div>
			<div class="submit-div cancel">
				<ui:i18n key="取消"/>
			</div>
			<div class="page-select">
				<c:choose>
					<c:when test="${requestScope.pageCurr==1}">
						<img src="/admin/images/goodsSell/page_firstno.png"
							style="margin-right: 20px;" />
						<img src="/admin/images/goodsSell/page_headno.png" />
					</c:when>
					<c:otherwise>
						<img src="/admin/images/goodsSell/page_first.png"
							onclick="pageNext('1');"
							style="margin-right: 20px;" />
						<img src="/admin/images/goodsSell/page_front.png"
							onclick="pageNext(${requestScope.pageCurr-1});" />
					</c:otherwise>
				</c:choose> 
				<select class="select2" id="whole" onchange="gets_value();">
					<c:forEach var='i' begin="1" end="${requestScope.pageCount }" varStatus="status">
						<c:if test="${status.index==requestScope.pageCurr }">
							<option value="${status.index}" selected="selected">${status.index}</option>
						</c:if>
						<c:if test="${status.index!=requestScope.pageCurr }">
							<option value="${status.index}">${status.index}</option>
						</c:if>
					</c:forEach>
					<c:if test="${requestScope.pageCount==0 }">
			    		<option  selected="selected">1</option>
			    	</c:if>
				</select> 
				<c:choose>
					<c:when test="${requestScope.pageCurr==requestScope.pageCount or requestScope.pageCount==0}">
						<img src="/admin/images/goodsSell/page_nextno.png" />
						<img src="/admin/images/goodsSell/page_endno.png" style="margin-left: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/admin/images/goodsSell/page_next.png"  onclick="pageNext(${requestScope.pageCurr+1});" />
						<img src="/admin/images/goodsSell/page_last.png"  style="margin-left: 20px;" onclick="pageNext(${requestScope.pageCount});" />
					</c:otherwise>
				</c:choose> 
				<div class="pageShowNum">
					<span><ui:i18n key="每页"/>10<ui:i18n key="条"/>，<ui:i18n key="共"/> ${requestScope.pageUintCount } <ui:i18n key="条"/></span>
				</div>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>