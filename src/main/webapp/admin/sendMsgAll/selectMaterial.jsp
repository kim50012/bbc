<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title><ui:i18n key=""/></title>  
<style type="text/css">
 .container{
	width:830px;
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
.result-grid-tbody tr td span{
	width:150px;
	display:inline-block;  
	white-space:nowrap; 
	text-overflow:ellipsis; 
	overflow:hidden;
}
</style> 
 
<script type="text/javascript">
	$(function(){
		//上传图片
		$('.upload-file-img').click(function(){
			$('#fileEntity').trigger("click");
		});
		//刷新图片列表
		$('.refresh-page').click(function(){
			window.location.reload();
		});
		
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
					parent.window.closeDivMaterial(obj.data('material'));
					return;
				}
			}
			alert('<ui:i18n key="请选择链接"/>');
		});
		
		basePageShow();//linkTableLogo
		
	});
	//分页操作
	function gets_value(){
		//存储分页的页数
		var pageCurr = $('#whole').find('option:selected').val();
		var serachLinkType = $('#serachLinkType').find('option:selected').val();
		var fileName = $('#fileName').val();
		window.location.href = '/admin/sendMsgAll/selectMaterial.htm?pageCurr='+pageCurr+'&serachTitle='+fileName+'&serachLinkType='+serachLinkType;
	}
	//页面的上一页，下一页，第一页，最后一页的操作。
	function pageNext(pageCurr){
		var serachLinkType = $('#serachLinkType').find('option:selected').val();
		var fileName = $('#fileName').val();
		window.location.href = '/admin/sendMsgAll/selectMaterial.htm?pageCurr='+pageCurr+'&serachTitle='+fileName+'&serachLinkType='+serachLinkType;
	}
	//文件名类似查询
	function selectByName(){
		var serachLinkType = $('#serachLinkType').find('option:selected').val();
		var fileName = $('#fileName').val();
		window.location.href = '/admin/sendMsgAll/selectMaterial.htm?serachTitle='+fileName+'&serachLinkType='+serachLinkType;
	}
	//显示基础页
	function show(){
		$('#linkTable').css('display','none');
		$('#linkTableLogo').show();
	}
	function hidden(){
		$('#linkTableLogo').css('display','none');
		$('#linkTable').show();
	}
	function basePageShow(){
		var serachLinkType = ${serachLinkType };
		if( serachLinkType == 0 ){
			show();
		}else{
			hidden();
		}
	};
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="query-from" style="border:0;">
       		<div class="form-table"  style="width:80%;">
       		 	<table class="ftable">
       		 		<colgroup>
       		 			<col width="12%" />
       		 			<col width="30%" />
       		 			<col width="20%" />
       		 			<col />
       		 		</colgroup>
       		 		<tr>
       		 			<td class="flabel" style="padding-left:10px;"><ui:i18n key="标题"/>：</td>
       		 			<td class="fcomp">
       		 				<input type="text" id="fileName" value="${requestScope.serachTitle }"  style="width:180px;"/>
						</td>
       		 			<td class="flabel" style="text-align: right;padding-right:20px;padding-left:0;"><ui:i18n key="链接类型"/>：</td>
       		 			<td class="fcomp">
       		 				<select id="serachLinkType" class="select2" style="width:180px;" onchange="basePageShow()">	
								<option value='0' <c:if test="${requestScope.serachLinkType==0 }">selected="selected"</c:if>><ui:i18n key="基础页面"/></option>
								<option value='1' <c:if test="${requestScope.serachLinkType==1 }">selected="selected"</c:if>><ui:i18n key="店铺基本页面"/></option>
								<option value='2' <c:if test="${requestScope.serachLinkType==2 }">selected="selected"</c:if>><ui:i18n key="商品分类"/></option>
								<option value='3' <c:if test="${requestScope.serachLinkType==3 }">selected="selected"</c:if>><ui:i18n key="商品"/></option>
								<option value='4' <c:if test="${requestScope.serachLinkType==4 }">selected="selected"</c:if>><ui:i18n key="自定义页面"/></option>
								<option value='5' <c:if test="${requestScope.serachLinkType==5 }">selected="selected"</c:if>><ui:i18n key="微杂志页面"/></option>
								<option value="6" <c:if test="${requestScope.serachLinkType==6 }">selected="selected"</c:if>><ui:i18n key="店铺主页"/></option>
							</select>
						</td>
       		 		</tr>
       		 	</table>
       		</div>
       		<!-- -->
       		<div class="butttn-area m1" >
       		   <span class="button" onclick="selectByName();">
       		   	  <span class="button-icon search"></span>
       		   	  <ui:i18n key="查询"/>
       		   </span>
       		</div>
      	</div>
		<div class="showimg-body-out-div">
			<div class="result-grid" style="width:96%;margin-left:2%;height:320px;">
		      	<div class="js-grid-content">
		      		<table class="result-grid-table">
		      		 	<colgroup>
				      		<col width="140px"  />
	      		 			<col width="150px" />
	      		 			<col />
			      		</colgroup>
			      		 <thead class="result-grid-thead">
			      		 	<tr>
			      		 		<th class="chk"></th>
			      		 		<th><ui:i18n key="标题"/></th>
			      		 		<th><ui:i18n key="链接"/></th>
			      		 	</tr>
			      		 </thead>
			      	</table>
		      		<div class="grid-fixed" style="height:268px;">
				      	<table class="result-grid-table fixed" id="linkTable">
				      		<colgroup>
					      		<col width="140px"  />
		      		 			<col width="150px" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	<c:forEach items="${list}" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td class="chk" style="text-align: center;"><input class="iccheckbox" type="radio" name="check" value="" data-material="${list.URL}" ></td>
					      		 		<td  class="title_show_td">
											<span title="${list.PAGE_NM }">${list.PAGE_NM }</span>										
										</td>
					      		 		<td><span  style="width:500px;" title="${list.URL}">${list.URL }</span></td>
					      		 	</tr>
				      		 	</c:forEach>
				      		 </tbody>
				      	</table>
				      	<table class="result-grid-table fixed" id="linkTableLogo">
				      		<colgroup>
					      		<col width="140px"  />
		      		 			<col width="150px" />
		      		 			<col />
				      		</colgroup>
				      		 <tbody  class="result-grid-tbody">
				      		 	<c:forEach items="${list}" var="list" varStatus="status">
				      		 		<tr>
					      		 		<td class="chk" style="text-align: center;"><input class="iccheckbox" type="radio" name="check" value="" data-material="${list.URL}" ></td>
					      		 		<td>
					      		 			<c:choose>
						           				<c:when test="${list.PAGE_NM eq '首页'}">
							      		 			<img alt="logo" src='/hzm/images/serachLinkType/main.png' style="background-color:#000000;height: 46PX;width: 46PX;">
						           				</c:when>
						           				<c:when test="${list.PAGE_NM eq '日志'}">
							      		 			<img alt="logo" src='/hzm/images/serachLinkType/log.png' style="background-color:#000000;height: 46PX;width: 46PX;">
						           				</c:when>
						           				<c:when test="${list.PAGE_NM eq '朋友圈'}">
							      		 			<img alt="logo" src='/hzm/images/serachLinkType/friends.png' style="background-color:#000000;height: 46PX;width: 46PX;">
						           				</c:when>
						           				<c:when test="${list.PAGE_NM eq '微杂志'}">
							      		 			<img alt="logo" src='/hzm/images/serachLinkType/magazine.png' style="background-color:#000000;height: 46PX;width: 46PX;">
						           				</c:when>
						           				<c:when test="${list.PAGE_NM eq '店铺'}">
							      		 			<img alt="logo" src='/hzm/images/serachLinkType/shop.png' style="background-color:#000000;height: 46PX;width: 46PX;">
						           				</c:when>
						           			</c:choose>
					      		 		</td>
					      		 		<td  class="title_show_td">
											<span title="${list.PAGE_NM }">${list.PAGE_NM }</span>										
										</td>
					      		 		<td><span  style="width:500px;" title="${list.URL}">${list.URL }</span></td>
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
						<img src="/admin/images/goodsSell/page_nextno.png" />
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