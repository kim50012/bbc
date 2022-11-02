<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%> 
 <style>
table{
     border-collapse: collapse; 
}
th{
     border: 1px solid #666666;
}
td{
     border: 1px solid #666666;
     padding: 5px;
}
</style>
 
 <div>货币标签</div>
 
 <table border="1" >
 	<tr>
 		<td>标签</td>
 		<td>样例</td>
 		<td>结果</td>
 		<td>备注</td>
 	</tr>
 	<tr>
 		<td>JSTL</td>
 		<td>&lt;fmt:formatNumber type="number" value="123.456" pattern="##.##" minFractionDigits="2"/></td>
 		<td>123.456</td>
 		<td></td>
 	</tr>
 	<tr>
 		<td>UI</td>
 		<td>&lt;ui:money value="123.456"/></td>
 		<td>123.456</td>
 		<td>默认精度为2，若要其他则设置 scale参数</td>
 	</tr>
 	
 </table>
 
 
