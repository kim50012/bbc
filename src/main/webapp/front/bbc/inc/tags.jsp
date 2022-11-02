<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application) %>" />

<script type="text/javascript">
var varCurrentLanguage = "<%=LabelUtil.getCurrentLanguage() %>";
function alertBbc(errorCode) {
	var message ="";
	if (varCurrentLanguage =="ko-KR" || 1 == 1) {
		 switch(errorCode)  {
		  case 'ER000001': message='이미 참여 하였습니다.'; break;
		  case 'ER000002': message='ER000002'; break;
		  case 'ER000003': message='ER000003'; break;
		  case 'ER000004': message='ER000004'; break;
		  case 'ER000005': message='ER000005'; break;
		  case 'ER000006': message='ER000006'; break;
		  case 'ER000007': message='ER000007'; break;
		  case 'ER000008': message='ER000008'; break;
		  case 'ER000009': message='ER000009'; break;
		  case 'ER000010': message='ER000010'; break;
		  case 'ER000011': message='ER000011'; break;
		  case 'ER000012': message='ER000012'; break;
		  case 'ER000013': message='ER000013'; break;
		  case 'ER000014': message='ER000014'; break;
		  case 'ER000015': message='ER000015'; break;
		  case 'ER000016': message='ER000016'; break;
		  case 'ER000017': message='ER000017'; break;
		  case 'ER000018': message='ER000018'; break;
		  case 'ER000019': message='ER000019'; break;
		  case 'ER000020': message='ER000020'; break;
		  case 'ER000021': message='ER000021'; break;
		  case 'ER000022': message='ER000022'; break;
		  case 'ER000023': message='ER000023'; break;
		  case 'ER000024': message='ER000024'; break;
		  case 'ER000025': message='ER000025'; break;
		  case 'ER000026': message='ER000026'; break;
		  case 'ER000027': message='ER000027'; break;
		  case 'ER000028': message='ER000028'; break;
		  case 'ER000029': message='ER000029'; break;
		  case 'ER000030': message='ER000030'; break;
		  case 'ER000031': message='ER000031'; break;
		  case 'ER000032': message='ER000032'; break;
		  case 'ER000033': message='ER000033'; break;
		  case 'ER000034': message='ER000034'; break;
		  case 'ER000035': message='ER000035'; break;
		  case 'ER000036': message='ER000036'; break;
		  case 'ER000037': message='ER000037'; break;
		  case 'ER000038': message='ER000038'; break;
		  case 'ER000039': message='ER000039'; break;
		  case 'ER000040': message='ER000040'; break;
		  case 'ER000041': message='ER000041'; break;
		  case 'ER000042': message='ER000042'; break;
		  case 'ER000043': message='ER000043'; break;
		  case 'ER000044': message='ER000044'; break;
		  case 'ER000045': message='ER000045'; break;
		  case 'ER000046': message='ER000046'; break;
		  case 'ER000047': message='ER000047'; break;
		  case 'ER000048': message='ER000048'; break;
		  case 'ER000049': message='ER000049'; break;
		  case 'ER000050': message='ER000050'; break;
		  case 'ER000051': message='ER000051'; break;
		  case 'ER000052': message='ER000052'; break;
		  case 'ER000053': message='ER000053'; break;
		  case 'ER000054': message='ER000054'; break;
		  case 'ER000055': message='ER000055'; break;
		  case 'ER000056': message='ER000056'; break;
		  case 'ER000057': message='ER000057'; break;
		  case 'ER000058': message='ER000058'; break;
		  case 'ER000059': message='ER000059'; break;
		  case 'ER000060': message='ER000060'; break;
		  case 'ER000061': message='ER000061'; break;
		  case 'ER000062': message='ER000062'; break;
		  case 'ER000063': message='ER000063'; break;
		  case 'ER000064': message='ER000064'; break;
		  case 'ER000065': message='ER000065'; break;
		  case 'ER000066': message='ER000066'; break;
		  case 'ER000067': message='ER000067'; break;
		  case 'ER000068': message='ER000068'; break;
		  case 'ER000069': message='ER000069'; break;
		  case 'ER000070': message='ER000070'; break;
		  case 'ER000071': message='ER000071'; break;
		  case 'ER000072': message='ER000072'; break;
		  case 'ER000073': message='ER000073'; break;
		  case 'ER000074': message='ER000074'; break;
		  case 'ER000075': message='ER000075'; break;
		  case 'ER000076': message='ER000076'; break;
		  case 'ER000077': message='ER000077'; break;
		  case 'ER000078': message='ER000078'; break;
		  case 'ER000079': message='ER000079'; break;
		  case 'ER000080': message='ER000080'; break;
		  case 'ER000081': message='ER000081'; break;
		  case 'ER000082': message='ER000082'; break;
		  case 'ER000083': message='ER000083'; break;
		  case 'ER000084': message='ER000084'; break;
		  case 'ER000085': message='ER000085'; break;
		  case 'ER000086': message='ER000086'; break;
		  case 'ER000087': message='ER000087'; break;
		  case 'ER000088': message='ER000088'; break;
		  case 'ER000089': message='ER000089'; break;
		  case 'ER000090': message='ER000090'; break;
		  case 'ER000091': message='ER000091'; break;
		  case 'ER000092': message='ER000092'; break;
		  case 'ER000093': message='ER000093'; break;
		  case 'ER000094': message='ER000094'; break;
		  case 'ER000095': message='ER000095'; break;
		  case 'ER000096': message='ER000096'; break;
		  case 'ER000097': message='ER000097'; break;
		  case 'ER000098': message='ER000098'; break;
		  case 'ER000099': message='ER000099'; break;
		  default: message="Msg Error"; break;
		 }
		 alert(message);
	}
}
</script>