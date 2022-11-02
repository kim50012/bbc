<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<table cellpadding="0" cellspacing="0" border="1" width="100%">
	<tr>
		<th width="30%">Key</th>
		<th width="20%">中文</th>
		<th width="20%">한국어</th>
		<th width="30%">English</th>
	</tr>
	<%
		Map<String,String> cnLabel = (Map<String,String>)application.getAttribute("LABEL_CN");
		Map<String,String> koLabel = (Map<String,String>)application.getAttribute("LABEL_KO");
		Map<String,String> enLabel = (Map<String,String>)application.getAttribute("LABEL_EN");
		Object[] key = (Object[]) cnLabel.keySet().toArray();
		
		Comparator cmp = java.text.Collator.getInstance(java.util.Locale.CHINA);
		Arrays.sort(key, cmp);
	 	for (int i = 0; i < key.length; i++) {
	 		//System.out.println(koLabel.get(key[i]));
	 	//}
		//for (Map.Entry<String, String> entry: koLabel.entrySet()) {
	%>
	<tr>
		<td><%= key[i] %></td>
		<td><%= cnLabel.get(key[i]) %></hd>
		<td><%= koLabel.get(key[i]) %></hd>
		<td><%= enLabel.get(key[i]) %></hd>
	</tr>
	<% 	 
	}
	%>
</table> 