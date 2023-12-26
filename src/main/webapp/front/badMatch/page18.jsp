<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>대회 협찬</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<%@ include file="/front/bbc/badMatch/js.jsp"%> 
<style>
.drag-table {
    width: 100%;
    border-left: none;
    border-right: none;
    border-top: 2px solid #006ecd;
    border-bottom: 1px solid #CCCCCC;
    z-index: 300;
}
.table {
    padding-bottom: 0.2rem;
}
.activeTr td {
    border-bottom: 1px solid #e42e43 !important;
}
.activeTr th {
    border-bottom: 1px solid #e42e43 !important;
}
.activeTr td {
    color: #333333 !important;
}
</style>
</head>

  <body>

    <div class="app pop-page">
      <header class="page-head">
        <div class="page-name">
            <img src="../image/back.png" class="mr24" onclick='window.location.href="/front/bbc/badMatch/getPage.htm?pageName=page2&para3=${para3}";'/>
          <span>대회 협찬</span>
        </div>
      </header>
      <div class="content">
          <div class="scroll-wrap f-col" id="gameTable1" style="padding-bottom:1.64rem;">
        	<c:if test="${para3 == '5'}">
	        	<c:if test="${para4 == '1'}">
		          <img src="http://bbc.manhuaking.cn/uploads/68/2020/09/03/68_shop_2020_09_03_11_41_09_81924.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/uploads/68/2020/09/03/68_shop_2020_09_03_11_41_19_71105.jpg" style="width:100%;"/>
	        	</c:if>
	        	<c:if test="${para4 == '2'}">
		          <img src="http://bbc.manhuaking.cn/uploads/68/2020/09/03/68_shop_2020_09_03_11_41_09_81924.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/uploads/68/2020/09/03/68_shop_2020_09_03_11_41_19_71105.jpg" style="width:100%;"/>
	        	</c:if>
	        	<c:if test="${para4 == '3'}">
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-01.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-02.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-03.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-04.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-05.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-06.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-07.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/gaga-08.jpg" style="width:100%;"/>
	        	</c:if>
	        	<c:if test="${para4 == '5'}">
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/hj-01.jpg" style="width:100%;"/>
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner/hj-02.jpg" style="width:100%;"/>
	        	</c:if>
	        	
        	</c:if>
        	<c:if test="${para3 == '14'}">
		          <img src="http://bbc.manhuaking.cn/front/bbc/badMatch/img/banner2/31.jpg" style="width:100%;"/>
        	</c:if>
          </div>
          
      </div>

    </div>
    
        
  </body>
<%@ include file="/front/bbc/badMatch/jsWx.jsp"%>
</html>
