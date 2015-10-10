<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "br.com.vagnernogueira.systeminfo.Main" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>System Info - Jboss</title>
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
	<p>Requisição: <%= Main.getTime() %></p>
	<table class="sample">
		<tr>
			<td><b>Property Names</b></td>
			<td><b>Property Values</b></td>
		</tr>
		<%
		final String[] properties = {
				"jboss.server.name",
				"jboss.host.name",
				"jboss.node.name",
				"jboss.home.dir",
				"jboss.domain.base.dir",
				"jboss.domain.config.dir",
				"java.runtime.name",
				"java.vm.vendor",
				"java.runtime.version",
				"user.timezone",
				"user.language",
				"user.country",
				"os.name",
				"os.arch",
				"os.version" };
			for (int i = 0; i < properties.length; i++) {
				String propsname = properties[i];
				String propsvalue = System.getProperty(propsname);
		%>
		<tr>
			<td><%=propsname%></td>
			<td><%=propsvalue%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>