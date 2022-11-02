<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
<%@ include file="/admin/template/uiIncV2Iframe.jsp"%> 
<!doctype html>
<head>
<title><ui:i18n key=""/></title>
</head>
<body>
<div class="pages">
	<div data-page="seatManage" class="page">
		<div class="page-content"> 
			<!-- <div class="navbar-inner">
				<div class="left"><a href="#" class="back link"> <i class=""></i><span>Back</span></a></div>
			</div>  -->
			<div class="label-header"  style="position: fixed;width:100%;z-index:100;padding-bottom:10px;">
				<div class="header-warp clearfix" style="background-image: url(/wxi/image/seatManage/seat_title_bg.png);">
					<img alt="" src="/wxi/image/seatManage/icon_group1.png" class="top-seat-img" >
				 	<div class="header-left">
				 		<div class="tab-title icon-tools">坐席组管理</div>
				 		<div class="tab-title-right-bg"></div>
				 	</div>
				 	<div class="header-right">
				 		<a href="/wxi/dkf/seatGroupAdd.jsp" class="item-link"><span><img alt="" src="/wxi/image/seatManage/icon_add.png">&nbsp;&nbsp;<span>添加</span></span></a>&nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#"  class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
	 		<div class="seat-list-div" style="margin-top:70px;">
				<table>
					<thead>
						<tr style="height:50px;">
							<td  style="width:33%;">坐席组</td>
							<td  style="width:24%;">坐席员数</td>
							<td  style="width:24%;">关键字数</td>
							<td  style="width:19%;">删除</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var ="list" varStatus="status">
							<tr>
								<td><a href="/wxi/dkf/seatGroupAdd.jsp?groupName=${list.GROUP_NAME }" class="item-link"><span class="limit-span">${list.GROUP_NAME }</span></a></td>
								<td>${list.ACCOUNT_NUM }</td>
								<td>${list.KEY_WORD_NUM }</td>
								<td><img src="/wxi/image/seatManage/btn_delete1.png" class='seatManage-delete-img'  onclick="deleteSeatGroupName('${list.GROUP_NAME }','GROUP')"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
 			</div>
 			
 		</div>
	</div>
</div>

</body>
</html>