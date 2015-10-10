<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
	<table class="sample">
		<tr>
			<td><b>Property Names</b></td>
			<td><b>Property Values</b></td>
		</tr>
		<%
			// System Properties
			java.util.Properties props = System.getProperties();
			java.util.Enumeration e = props.propertyNames();
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
			java.util.Map<String, String> env = System.getenv();
			java.util.Iterator<?> it = env.entrySet().iterator();
			while (it.hasNext()) {
				@SuppressWarnings("unchecked")
				java.util.Map.Entry<String, String> pair = (java.util.Map.Entry<String, String>) it
						.next();
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