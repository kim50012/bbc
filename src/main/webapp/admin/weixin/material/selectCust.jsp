<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<!doctype html>
<html>
<head>
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<title></title>  
<style type="text/css">
.title-out-div{
	width:100%;
	position: relative;	
	height:50px;
	line-height:50px;
	font-size:12px;
	color:#5f5f5f;
	margin-top:10px;
}
.title-out-div .title-left-div{
	float:left;
	margin-left:23px;
}
.title-out-div .title-left-div span{
	font-size:12px;
	color:#5f5f5f;
	margin-left:10px;
	display: inline-block;
}
.title-out-div .title-right-div{
	float:right;
	margin-right:25px;
	position: relative;
}
.title-out-div .title-right-div input{
	width:142px;
	padding-right:30px;
	margin-bottom:3px;
	height:20px;
}
.title-out-div .title-right-div img{
	position: absolute;
	right:10px;
	top:17px;
	cursor: pointer;
}
.showimg-body-out-div{
	width:100%;
}
.showimg-body-out-div .showimg-body-div{
	width:640px;
	margin-left:15px;
	height:360px;
	overflow-x:hidden; 
	position: relative;
}
.showimg-body-out-div .showimg-body-div .img-one-div{
	float:left;
	width:80px;
	height:80px;
	margin-bottom:10px;
	text-align: center;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show{
	width:60px;
	height:60px;
	border:1px solid #eee; 
	position: relative;
	cursor: pointer;
	display: inline-block;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show img:first-child{
	width:100%;
	height:100%;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show .img-select{
	width:100%;
	height:100%;
	position: absolute;
	top:0;
	left:0;
	background-position: 12px 18px;
	/* background-image: url("/admin/images/sendMsgAll/icon_choice.png"); */
	background-repeat: no-repeat;
	background-color: #000;
	opacity:0.4;
	display:none;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show .selected-img-top{
	position: absolute;
	z-index:30;
	top:20px;
	left:15px;
	display:none;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-show .img-select.selected{
	display: inline-block;
	cursor: pointer;
}
.showimg-body-out-div .showimg-body-div .img-one-div .image-name{
	width:100%;
	word-break:break-word;
	text-overflow: -o-ellipsis-lastline; 
	overflow: hidden; 
	text-overflow: ellipsis; 
	display: -webkit-box; 
	-webkit-line-clamp: 1; 
	-webkit-box-orient: vertical;
	font-size:12px;
	color:#a2a2a2;
	text-align: center;
	vertical-align: bottom;
	margin-top:3px;
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
.container{
	width:670px;
}
</style> 
 
<script type="text/javascript">
	$(function(){
		//选择图片
		$('.image-show').click(function(){
			var obj = $(this).parent().find('.img-select');
			var obj2 = $(this).parent().find('.selected-img-top');
			$(obj).addClass('selected');
			$(obj2).show();
			$('.img-select.selected,.selected-img-top').click(function(){
				$($(this).parent().find('.img-select')).removeClass('selected');
				event=event||window.event;    
			    event.stopPropagation();
			    $($(this).parent().find('.selected-img-top')).hide();
			});
		});
		/* $('#selectAllCust').on('ifChecked', function(event){
			$('.img-select').addClass('selected');
			$('.selected-img-top').show();
		});
		$('#selectAllCust').on('ifUnchecked', function(event){
			$('.img-select').removeClass('selected');
			$('.selected-img-top').hide();
		}); */
		//关闭页面
		$('.submit-div.cancel').click(function(){
			parent.window.closebpoupCust();
		});
		//确认选择了的图片，并返回到主页面
		$('.submit-div.confirm').click(function(){
			var custSysId = '';
			var nickName = '';
			var openId = '';
			$('.img-select.selected').each(function(){
				openId += "," + $(this).data('openid');
			});
			if(openId==""){
				alert('<ui:i18n key="请选择用户"/>');
				return;
			}else{
				openId=openId.substring(1,openId.length);
			}
			$.ajax({
				url : "/admin/weixin/material/insertCmCode.htm",
				data : {openId:openId},
				success : function(data) {
					if(data.ret=='success'){
						parent.window.addCustList();
					}else{
						alert('<ui:i18n key="操作失败"/>,<ui:i18n key="请重新操作"/>.');
					}
				},
				error : function(xhr, status, e) {
					alert("error: " + status);
				}
			});
		});
	});
	//分页操作
	function gets_value(){
		//存储分页的页数
		var custNickName = $('#custNickName').val();
		var pageCurr = $('#whole').find('option:selected').val();
		window.location.href='/admin/weixin/material/selectCust.htm?pageCurr=' + pageCurr + '&nickName='+custNickName;
	}
	//页面的上一页，下一页，第一页，最后一页的操作。
	function pageNext(pageCurr){
		var custNickName = $('#custNickName').val();
		window.location.href='/admin/weixin/material/selectCust.htm?pageCurr=' + pageCurr + '&nickName='+custNickName;
	}
	//文件名类似查询
	function selectByName(){
		var custNickName = $('#custNickName').val();
		window.location.href='/admin/weixin/material/selectCust.htm?nickName=' + custNickName;
	}
	
</script>
 
</head>
<body>
	<!-- ▼ container  --> 
	<div class="container">
		<div class="title-out-div">
			<%-- <div class="title-left-div">
				<input type="checkbox" id="selectAllCust" class="iccheckbox" name="selectAll" onchange="selectAll();"/>
				<span><ui:i18n key="全选"/></span>
			</div> --%>
			<div class="title-right-div">
				<input type="text" value="${requestScope.nickName}" id="custNickName" />
				<img alt="" src="/admin/images/sendMsgAll/query.png" onclick="selectByName();"/>
			</div>
		</div>
		<div class="showimg-body-out-div">
			<div class="showimg-body-div">
				<c:forEach items="${list}" var="item" varStatus="status">
					<div class="img-one-div">
						<div class="image-show" >
							<img src="${item.WX_IF_HEADIMGURL }"/>
							<div class="img-select" data-openid="${item.WX_IF_OPENID_P }"></div>
							<img src="/admin/images/sendMsgAll/ico_choice_02.png" class="selected-img-top"/>
						</div>
						<span class="image-name" title="${item.CUST_NICK_NM }">
							${item.CUST_NICK_NM }
						</span>
					</div>
				</c:forEach>
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
							style="margin-right: 20px;margin-left:30px;" />
						<img src="/admin/images/goodsSell/page_headno.png" />
					</c:when>
					<c:otherwise>
						<img src="/admin/images/goodsSell/page_first.png"
							onclick="pageNext('1');"
							style="margin-right: 20px;margin-left:30px;" />
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
					<span><ui:i18n key="每页"/>32<ui:i18n key="条"/>，<ui:i18n key="共"/> ${requestScope.pageUnitCount } <ui:i18n key="条"/></span>
				</div>
			</div>
		</div>
	</div>
	<!-- ▲ container  -->
	
</body>
</html>