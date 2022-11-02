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
					<img alt="" src="/wxi/image/seatManage/icon_seat.png" class="top-seat-img" >
				 	<div class="header-left">
				 		<div class="tab-title icon-tools">坐席管理</div>
				 		<div class="tab-title-right-bg"></div>
				 	</div>
				 	<div class="header-right">
				 		<a href="/wxi/dkf/seatAdd.jsp" class="item-link"><span><img alt="" src="/wxi/image/seatManage/icon_add.png">&nbsp;&nbsp;<span>添加</span></span></a>&nbsp;&nbsp;|&nbsp;&nbsp;<span><a href="#"  class="back link"><img alt="" src="/wxi/image/dkfManager/back.png">&nbsp;&nbsp;返回</a></span>
				 	</div>
	 			</div>
	 		</div>
	 		<div class="seat-list-div" style="margin-top:70px;">
				<table>
					<thead>
						<tr style="height:48px;">
							<td style="width:27%;">坐席人员</td>
							<td style="width:15%;">Master</td>
							<td style="width:27%;">所属分组</td>
							<td style="width:15%;">关键字<br>绑定数量</td>
							<td style="width:16%;">删除</td>
						</tr>
						<!-- <tr>
							<td style="width:12%;">组共同</td>
							<td style="width:11%;">单独</td>
						</tr> -->
					</thead>
					<tbody>
						<c:forEach items="${list }" var = "list" varStatus="status">
							<tr>
								<td><a href="/wxi/dkf/seatAdd.jsp?accountName=${list.ACCOUNT }" class="item-link"><span class="limit-span" title="${fn:substring(list.ACCOUNT,0,fn:indexOf(list.ACCOUNT,'@')) }">${fn:substring(list.ACCOUNT,0,fn:indexOf(list.ACCOUNT,'@')) }</span></a></td>
								<td>
									<div class="seatManage-selected-div<c:if test="${list.IS_MASTER eq '1' }"> selected</c:if>" onclick="masterSelected(this,${status.index},'${list.ACCOUNT }','${list.USERGROUP_CODE }')"></div>
								</td>
								<td><span class="limit-span">${list.USERGROUP_CODE }</span></td>
								<%-- <td>${list.KEY_WORD_GROUP_NUM }</td> --%>
								<td>${list.KEY_WORD_ONE_NUM }</td>
								<td>
									<c:choose>
										<c:when test="${list.IS_MASTER eq '1' }">
											<img src="/wxi/image/seatManage/btn_delete2.png" class='seatManage-delete-img' id="seatManageDelete${status.index}"/>
										</c:when>
										<c:otherwise>
											<img src="/wxi/image/seatManage/btn_delete1.png" class='seatManage-delete-img' id="seatManageDelete${status.index}" onclick="deleteSeatManage('${list.ACCOUNT }','SEAT');"/>
										</c:otherwise>
									</c:choose>
								</td>
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