<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "br.com.vagnernogueira.systeminfo.Main, java.util.Map, java.util.Iterator, java.util.Properties, java.util.Enumeration" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>System Info</title>
<style type="text/css">
table.sample {
	border-width: 1px;
	border-spacing: 1px;
	border-style: groove;
	border-color: red;
	border-collapse: collapse;
	background-color: white;
}

table.sample th {
	border-width: 1px;
	padding: 2px;
	border-style: solid;
	border-color: red;
	background-color: rgb(255, 255, 240);
	-moz-border-radius:;
}

table.sample td {
	border-width: 1px;
	padding: 2px;
	border-style: solid;
	border-color: red;
	background-color: rgb(255, 255, 240);
	-moz-border-radius:;
}
</style>
</head>
<body>
	<h1>System Properties</h1>
	<p>Requisição: <%= Main.getTime() %></p>
	<table class="sample">
		<tr>
			<td><b>Property Names</b></td>
			<td><b>Property Values</b></td>
		</tr>
		<%
			// System Properties
			Properties props = System.getProperties();
			Enumeration e = props.propertyNames();
			while (e.hasMoreElements()) {
				String key = (String) e.nextElement();
				String value = props.getProperty(key);
		%>
		<tr>
			<td><%=key%></td>
			<td><%=value%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br />
	<h1>Enviroment</h1>
	<table class="sample">
		<tr>
			<td><b>Variable Names</b></td>
			<td><b>Variable Values</b></td>
		</tr>
		<%
			// Enviroment
			Map<String, String> env = System.getenv();
			Iterator<?> it = env.entrySet().iterator();
			while (it.hasNext()) {
				@SuppressWarnings("unchecked")
				Map.Entry<String, String> pair = (Map.Entry<String, String>) it.next();
				String vkey = pair.getKey();
				String vValue = pair.getValue();
		%>
		<tr>
			<td><%=vkey%></td>
			<td><%=vValue%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>