<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
 <%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
 <title><ui:i18n key="BBS申请管理"/></title>
<style type="text/css">
  .body{
  	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	width: 200px;
  }
  .title{
  	text-overflow: -o-ellipsis-lastline;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	width: 100px;
  }
</style> 
<script type="text/javascript">
var rowCount = 0;
var editRowCount = 0;
$(function(){
	//导出Excel数据
	$('.js-excel').click(function(){
		if(window.confirm('<ui:i18n key="您确定需要导出数据吗"/>？')){
			var startDt=$('#createdDateFrom').val();
			var endDt=$('#createdDateTo').val();
			var title=$('#title').val();
			var bbsSts=$('#bbsSts').val();
			var date1 = new Date(startDt);
			var date2 = new Date(endDt);
			if(date1 > date2){
				alert('<ui:i18n key="查询时间选择错误"/>！');
				return;
			}
			var url = '/admin/bbs/createExcel.htm';
			var params = {
					startDt : startDt
					,endDt : endDt
					,title : title
					,bbsSts : bbsSts
			}
			ggFormSubmit(url,params);
			
		}
	});
	$('.js-bbs-type-manage').click(function(){
		rowCount = 0;
		var $th2 = $('.js-bpopup-inner', $('#bbsTypePopup'));
		$th2.load('/admin/bbs/bbsType.htm' , {} ,  function(){
			$('.js-add', $th2).click(function(){
				var cdId = 0;
				if($('#cdId', $th2).val() != ''
				   &&$('#cdId', $th2).val() != undefined){
					cdId = parseInt($('#cdId', $th2).val());
				}
				var newCdId = cdId+1;
				$.ajax({
					data : {},
					async : false,
					url : '/admin/bbs/getBbsTypeCdId.htm',
					success : function(data){
						newCdId=data.newCdId;
					},
					error : function(a, msg, c){
						alert('error: ' + msg);
					}
				});
				if(rowCount == 0){
					var html = '';
					html += '<tr>';
					html += '	<td style="width:30%;"></td>';
					html += '	<td style="width:30%;"><input type="text" placeholder="<ui:i18n key="请输入类型名称" />" style="width:120px" onblur="saveBbsType(this.value);"/></td>';
					html += '	<td style="width:40%;">'+
								'<span class="gridbutton red" onclick="removeAttr(this);"><ui:i18n key="删除" /></span>'+
						  '	</td>';
					html += '</tr>';
					$('.result-grid-tbody', $th2).prepend(html);
					rowCount = 1;
				}
			});
			edit();
			startOrstop();
			removeAttr();
			showBpopup({
	 			id : 'bbsTypePopup',
	 			width :450,
	 			top:20 
	 		});
			
		});
	});
});

function removeAttr(obj){
	rowCount = 0;
	$(obj).parent().parent().remove();
}

function edit(cdId,desc){
	if(cdId != undefined){
		var jobType = 'U';
		var cdId = cdId;
		var cdDesc = $('#'+cdId+'Desc').html();
		if(cdDesc.indexOf("<input")==-1){
			var html = '<input type="text" style="width:120px" value="'+cdDesc+'" onblur="updateBbsType(this.value,'+cdId+',\''+cdDesc+'\');"/>';
			$('#'+cdId+'Desc').html(html);
			editRowCount = 1;
		}else{
			$('#'+cdId+'Desc').html(desc);
		}
	}
}

function updateBbsType(value,cdId,cdDesc){
	if(value != cdDesc){
		var jobType='U';
		if(value==''){
			alert('<ui:i18n key="BBS类型不能为空" />.');
			return;
		}
		var params={
				jobType:jobType
				,cdDesc:value
				,cdId:cdId
			};
		$.ajax({
			data:params,
			url : '/admin/bbs/bbsTypeUpdate.htm',
			success : function(data){
				if(data.result=='success'){
					alert('<ui:i18n key="修改成功" />.');
					queryBbstypeList(1, 99999);
					$('.js-bbs-type-manage').click();
				}else{
					alert('<ui:i18n key="修改失败" />.');
				}
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
	}else{
		$('#'+cdId+'Desc').html(value);
	}
}

function saveBbsType(value){
	var jobType = 'I';
	var cdDesc = value;
	if(cdDesc == ''){
		alert('<ui:i18n key="BBS类型不能为空" />.');
		return;
	}
	var params={
			jobType:jobType
			,cdDesc:cdDesc
		};
	$.ajax({
		data:params,
		url : '/admin/bbs/bbsTypeInsert.htm',
		success : function(data){
			if(data.result=='success'){
				alert('<ui:i18n key="保存成功" />.');
				queryBbstypeList(1, 99999);
				rowCount = 0;
			}else{
				alert('<ui:i18n key="保存失败" />.');
			}
		},
		error : function(a, msg, c){
			alert('error: ' + msg);
		}
	});
}

function queryBbstypeList(pageNo, pageSize){
	var params={};
	var url = '/admin/bbs/bbsTypeFragment.htm';
	 
	var $this = $('.js-bbs-type-page-grid');	
	$this.showLoading();
	$this.load(url , params ,  function(){ 
	 	$this.hideLoading();
	});
}

function showPage(pageNo, pageSize){
	window.scrollTo(0,0);
	query(pageNo, pageSize);
}

function searchData(){
	query(1, 10); 
}


function query(pageNo, pageSize){
	
	console.log('pageNo=' + pageNo + ',pageSize=' + pageSize);
	var startDt = $('#createdDateFrom').val();
	var endDt = $('#createdDateTo').val();
	var date1 = (new Date(startDt)).getTime();
	var date2 = (new Date(endDt)).getTime();
	if(date1 > date2){
		alert('<ui:i18n key="查询时间选择错误"/>！');
		return;
	}
	var title = $('#title').val();
	var bbsSts = $('#bbsSts').val();
	var bbsType = $('#bbsType').val();
	var params = {
			startDt : startDt
			,endDt : endDt
			,title : title
			,bbsSts : bbsSts
			,bbsType : bbsType
			,pageCurr : pageNo
			,pageUnit : pageSize
	}
	var url = '/admin/bbs/bbsListFragment.htm';
	 
	 var $this = $('.js-grid-content');	
	 $this.showLoading();
	 $this.load(url , params ,  function(){ 
		 $this.find('.select2').select2({
			 minimumResultsForSearch:5
			 ,allowClear: true 
		 }); 
		 $this.hideLoading();
	 });
	 
}

function jujue(bbsId,bbsSts){
	var conf = window.confirm('<ui:i18n key="确定要屏蔽本条信息吗"/>？');
	if(conf == false) {
        return ;
    }else{
		var param={bbsId:bbsId,bbsSts:bbsSts};
		$.ajax({
			data:param,
			url : '/admin/bbs/update.htm', 
			success : function(data){
				if(data.result=='success'){
					alert('<ui:i18n key="屏蔽成功"/>');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				}else{
					alert('<ui:i18n key="屏蔽失败"/>');
					var pageCurr = Number($('#currentPage').find('option:selected').val());
					var pageUnit = Number($('#pageUnit').find('option:selected').val());
					showPage(pageCurr,pageUnit);
				}	
			},
			error : function(a, msg, c) {e
				alert('error: ' + msg);
			}
		});
	}
}
function huanyuan(bbsId,bbsSts){
	var conf=window.confirm('<ui:i18n key="确定要还原本条信息吗"/>？');
	if(conf == false) {
        return ;
    }else{
		var param={bbsId:bbsId,bbsSts:bbsSts};
		$.ajax({
			data:param,
			url : '/admin/bbs/update.htm', 
			success : function(data){
				if(data.result=='success'){
					alert('<ui:i18n key="还原成功"/>');
					window.location.href='/admin/bbs/bbsList.htm';
				}else{
					alert('<ui:i18n key="还原失败"/>');
				}	
			},
			error : function(a, msg, c) {e
				alert('error: ' + msg);
			}
		});
    }
}
//启用和停用
function startOrstop(cdId,isDelete){
	if(cdId != undefined){
		if(isDelete==0){
			var conf=window.confirm('<ui:i18n key="确定要停用本条信息吗"/>?');
			var isDelete=1;
		}else{
			var conf=window.confirm('<ui:i18n key="确定要启用本条信息吗"/>?');
			var isDelete=0;
		}
	    if(conf == false) {
	        return ;
	        }
	    else {
	    var jobType="D";
	 /*    alert(isDelete);
	    return; */
		var params={
				isDelete:isDelete
				,jobType:jobType
				,cdId:cdId
				};
		$.ajax({
			data:params,
			url : '/admin/bbs/bbsTypeDelete.htm',
			success : function(data){
				if(data.result=='success'){
					if(isDelete==1){
						alert('<ui:i18n key="停用成功"/>.');
						queryBbstypeList(1, 99999);
						$('.js-bbs-type-manage').click();
					}
					if(isDelete==0){
						alert('<ui:i18n key="启用成功"/>.');
						queryBbstypeList(1, 99999);
						$('.js-bbs-type-manage').click();
					}
				}else{
					if(isDelete==0){
						alert('<ui:i18n key="停用失败"/>.');
					}
					if(isDelete==1){
						alert('<ui:i18n key="启用失败"/>.');
					}
				}
				
			},
			error : function(a, msg, c){
				alert('error: ' + msg);
			}
		});
	    }
	}
}
</script>
</head>

<body>
<div class="container">
	<!-- ▼ 查询表单区域  --> 
     <div class="query-from">
    		<div class="form-table" >
    		 	<table class="ftable">
    		 		<colgroup>
    		 			<col width="15%" />
    		 			<col width="30%" />
    		 			<col width="15%" />
    		 			<col width="40%" />
    		 		</colgroup>
    		 		<tr>
    		 			<td class="flabel"><ui:i18n key="BBS题目"/>：</td>
    		 			<td class="fcomp">
     		 				<input type="text" value="${requestScope.title }" style="width: 187px" id="title"/>
    		 			</td>
    		 			<td class="flabel"><ui:i18n key="提交日期"/>：</td>
    		 			<td class="fcomp">
	     		 			<input  value="${requestScope.startDt }" type="text" id="createdDateFrom" style="width:100px;" class="w100 datepicker calendar" />
							<span class="line"><img src="/admin/images/orders/wave line.png"></span>
							<input value="${requestScope.endDt}" style="width:100px;" type="text" id="createdDateTo" class="w100 datepicker calendar" />
    		 			</td>
    		 		</tr>
    		 		<tr>
    		 			<td class="flabel" ><ui:i18n key="BBS状态"/>：</td>
    		 			<td class="fcomp">
    		 				<select  class="select2" id="bbsSts" style="width:210px;">
									<option value=""></option>
									<option value="2"><ui:i18n key="生成"/></option>
									<option value="3"><ui:i18n key="已屏蔽"/></option>
								</select>
    		 			</td>
    		 			<td class="flabel" ><ui:i18n key="BBS类型"/>：</td>
    		 			<td class="fcomp">
    		 				<select  class="select2" id="bbsType" style="width:260px;" >
								<option value=""></option>
								<c:forEach items="${bbs }" var="bbs">
									<option value="${bbs.CD_ID }">${bbs.CD_DESC }</option>
								</c:forEach>	
							</select>
    		 			</td>
    		 		</tr>
    		 	</table>
    		</div>
    		
    		<div class="butttn-area m2" onclick="javascript:searchData();">
    		   <span class="button">
    		   	  <span class="button-icon search"></span>
    		   	  <span class="button-name"><ui:i18n key="查询"/></span> 
    		   </span>
    		</div>
   	</div>
	<!-- ▲ 查询表单区域  -->
	<!-- ▼ 普通表格  --> 
	    <div class="result-grid" style="margin-top: 50px;">
	      	<div class="result-grid-header" >
  				<div class="result-grid-tools">
     		   		<span class="result-grid-tool js-bbs-type-manage" >
    		   	 	 	<img alt="" src="/admin/images/goods/plus.png" /><ui:i18n key="BBS类型管理"/>
    		   		</span>
  				&nbsp;&nbsp;&nbsp;&nbsp;
     				<span class="tabpanel-tool js-excel">
	       		   	  <img alt="" src="/admin/images/v2-icons/ico_export.png" />
					  <span class="tool-name"><ui:i18n key="批量导出"/></span> 
	       		   	</span>
      			</div>
  			</div>
  			<div class="js-grid-content">
  				<div class="result-data-warp">
  					<table class="result-grid-table">
		      	 	<thead class="result-grid-thead">
		      		 	<tr>
		      		 		<th style="width:8%;">BBS ID</th>
		      		 		<th style="width:8%;">BBS<ui:i18n key="原文" />ID</th>
		      		 		<th style="width:10%;">BBS<ui:i18n key="类型" /></th>
		      		 		<th style="width:13%;">BBS<ui:i18n key="题目" /></th>
		      		 		<th style="width:25%;">BBS<ui:i18n key="内容" /></th>
		      		 		<th style="width:10%;"><ui:i18n key="提交人" /></th>
		      		 		<th style="width:10%;"><ui:i18n key="提交日期" /></th>
		      		 		<th style="width:8%;">BBS<ui:i18n key="状态" /></th>
		      		 		<th style="width:8%;"><ui:i18n key="操作" /></th>
		      		 	</tr>
		      		 </thead>
		      		 <tbody  class="result-grid-tbody" >
			      		<c:forEach items="${list }" var="list">
			           		<tr style="border-bottom: 1px solid #d6d6d6">
			           			<td style="text-align: center">
			           				${list.BBS_ID } 
			           			</td>
			           			<td style="text-align: center">
			           				${list.BBS_PARENT_ID }
			           			</td>
			           			<td style="text-align: center">
			           				${list.CD_DESC }
			           			</td>
			           			<td style="text-align: center;padding-left: 10px;padding-right: 10px">
			           				<span class="title" title="${list.TITLE }">${list.TITLE }</span>
			           			</td>
			           			<td style="text-align: center;padding-left: 10px;padding-right: 10px">
			           				<span class="body" title="${list.BODY }">${list.BODY }</span>
			           			</td>
			           			<td style="text-align: center;padding-left: 10px;padding-right: 10px">
			           				${list.WX_IF_NICK_NM }
			           			</td>
			           			<td style="text-align: center">
			           				${list.CREATE_DT }
			           			</td>
				           			<c:choose>
				           				<c:when test="${list.BBS_STS eq 2}">
				           					<td style="text-align: center">
				           						<ui:i18n key="生成"/>
				           					</td>
				           				</c:when>
				           				<c:when test="${list.BBS_STS eq 3}">
				           					<td style="text-align: center">
				           						<ui:i18n key="已屏蔽"/>
				           					</td>
				           				</c:when>
				           				<%-- <c:otherwise>
				           					<td style="text-align: center">
				           						已确认
				           					</td>
				           				</c:otherwise> --%>
				           			</c:choose>
			           			<td style="text-align: center">
			           				<c:choose>
			           					<c:when test="${list.BBS_STS eq 2}">
			           						<span class="gridbutton red" onclick="javascript:jujue('${list.BBS_ID }',3);"><ui:i18n key="屏蔽" /></span>
			           					</c:when>	
			           					<c:otherwise>
			           						<span class="gridbutton green" onclick="javascript:huanyuan('${list.BBS_ID }',2);"><ui:i18n key="还原" /></span>
			           					</c:otherwise>
			           				</c:choose>
<%-- 			           				<span class="gridbutton red" onclick="javascript:void();"><ui:i18n key="详情" /></span> --%>
			           			</td>
			           		</tr>
		           		</c:forEach>
		      		 </tbody>
	      		</table>
  				</div>
  				<ui:paging page="${page }" />
  			</div>
		</div> 
	<!-- ▲ 普通表格 -->
	<!-- ▼ bpopup area -->
		<div class="bpopup2" id="bbsTypePopup">
	 	<div class="bpopupWarp">
	 		 <div class="bpopupHeaderWarp">
				<h3 class="bpopupTitle js-title"><ui:i18n key="BBS类型管理"/></h3>
				<div class="bpopupColseWarp">
					<img class="b-close" src="/admin/images/goodsSell/close.png" />
				</div>
			</div>
	 		 <div class="bpopupContentWarp"> 
	 		 	 <!--  方式2 -->
	 		 	 <div class="bpopupInner js-bpopup-inner"> 
	 		 	    <!--  -->
	 		 	    
	 		 	    
	 		 	    <!--  -->
	 		 	 </div>
	 		 	
	 		 </div>
	 	</div>
	</div>
	<!-- ▲ bpopup area -->
</div>
</body>
</html>