<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title>  
<style type="text/css">

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
}
.pay-name-span{word-break:break-word;text-overflow: -o-ellipsis-lastline; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical;text-align: left;}
.container{
	width:850px;
}
</style> 
 
<script type="text/javascript">
	$(function(){
		//关闭页面
		$('.submit-div.cancel').click(function(){
			parent.window.closebpoupMe();
		});
		//确认选择了的图片，并返回到主页面
		$('.submit-div.confirm').click(function(){
			var radObj = document.getElementsByName('check');
			var length = radObj.length;
			for(var i = 0;i < length;i++){
				if(radObj[i].checked){
					var obj = $(radObj[i]);
					parent.window.closeDivInterface(obj.val());
					return;
				}
			}
			alert('<ui:i18n key="请选择图文消息"/>');
		});
	});
	//分页操作
	function gets_value(){
		//存储分页的页数
		var pageCurr = $('#whole').find('option:selected').val();
		var serachLinkType = $('#serachLinkType').find('option:selected').val();
		var fileName = $('#fileName').val();
		window.location.href = '/admin/report/weixin/updateNewsInterface.htm?pageCurr='+pageCurr+'&serachTitle='+fileName+'&serachLinkType='+serachLinkType;
	}
	//页面的上一页，下一页，第一页，最后一页的操作。
	function pageNext(pageCurr){
		var serachLinkType = $('#serachLinkType').find('option:selected').val();
		var fileName = $('#fileName').val();
		window.location.href = '/admin/report/weixin/updateNewsInterface.htm?pageCurr='+pageCurr+'&serachTitle='+fileName+'&serachLinkType='+serachLinkType;
	}
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="showimg-body-out-div">
			<div class="result-grid" style="width:94%;margin-left:3%;height:350px;margin-top:30px;">
		      	<div class="js-grid-content">
		      		<table class="result-grid-table">
		      		 	<colgroup>
				      		<col width="35px"  />
	      		 			<col width="90px" />
	      		 			<col width="90px"  />
	      		 			<col width="90px" />
	      		 			<col width="90px"  />
	      		 			<col width="90px" />
	      		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk"></th>
			      		 		<th><ui:i18n key="创建日期"/></th>
			      		 		<th><ui:i18n key="修改日期"/></th>
			      		 		<th>MessageId</th>
			      		 		<th>HZM MsgId</th>
			      		 		<th>HZM NewsId</th>
			      		 		<th><ui:i18n key="图文消息标题"/></th>
			      		 	</tr>
			      		 </thead>
			      	</table>
		      		<div class="grid-fixed" style="height:298px;">
				      	<table class="result-grid-table fixed">
				      		<colgroup>
					      		<col width="35px"  />
		      		 			<col width="90px" />
		      		 			<col width="90px"  />
		      		 			<col width="90px" />
		      		 			<col width="90px"  />
		      		 			<col width="90px" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	<c:forEach items="${list}" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td class="chk" style="text-align: center;"><input class="icradio" type="radio" name="check" value="${list.MSG_ID}" ></td>
					      		 		<td>${list.CREATED_DT }</td>
										<td>${list.MODIFIED_DT }</td>
										<td>${list.WX_MSG_ID }</td>
										<td>${list.MSG_ID }</td>
										<td>${list.NEWS_ID }</td>
										<td><span class="pay-name-span" title="${list.MTITLE }">${list.MTITLE }</span></td>
					      		 	</tr>
				      		 	</c:forEach>
				      		 </tbody>
				      	</table>
			      	</div>
	      		</div>
	      	</div>
	      </div>
		<div class="bottom-div-pageNum">
			<div class="submit-div confirm">
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
						<img src="/admin/images/goodsSell/page_nextno.png" "/>
						<img src="/admin/images/goodsSell/page_endno.png" style="margin-left: 20px;" />
					</c:when>
					<c:otherwise>
						<img src="/admin/images/goodsSell/page_next.png"  onclick="pageNext(${requestScope.pageCurr+1});" />
						<img src="/admin/images/goodsSell/page_last.png"  style="margin-left: 20px;" onclick="pageNext(${requestScope.pageCount});" />
					</c:otherwise>
				</c:choose> 
				<div class="pageShowNum">
					<span><ui:i18n key="每页"/>10<ui:i18n key="条"/>，<ui:i18n key="共"/> ${requestScope.pageUnitCount } <ui:i18n key="条"/></span>
				</div>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
</body>
</html>