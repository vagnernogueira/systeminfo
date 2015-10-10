<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.com.vagnernogueira.systeminfo.Main, java.net.NetworkInterface, java.net.InetAddress, java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>System Info - Network</title>
</head>
<body>
	<p>
		Requisição:
		<%=Main.getTime()%></p>
	<p>HostName: <%=Main.getHostName()%></p>
	<%
		for (NetworkInterface netint : Main.getNetworkInterfaces()) {
	%>
	<p>
		<strong>Display name: </strong> <%=netint.getDisplayName()%>
		<br />
		<strong>Name: </strong> <%=netint.getName()%>
		<br />
		<strong>Up? </strong> <%=netint.isUp()%>
		<br />
        <strong>Loopback? </strong> <%=netint.isLoopback()%>
        <br />
        <strong>PointToPoint? </strong> <%=netint.isPointToPoint()%>
        <br />
        <strong>Supports multicast? </strong> <%=netint.supportsMulticast()%>
        <br />
        <strong>Virtual? </strong><%=netint.isVirtual()%>
        <br />
        <strong>Hardware address: </strong><%=Arrays.toString(netint.getHardwareAddress())%>
        <br />
        <strong>MTU: </strong> <%=netint.getMTU()%>
        <br />
		<%
			for (InetAddress inetAddress : Main.getInetAddresses(netint)) { 
			%>
			<strong>InetAddress: </strong> <%=inetAddress%>
			<br />
			<%
				}
				for (NetworkInterface subIf : Main.getSubInterfaces(netint)) { 
			%>
			<strong>Sub Interface Display name: </strong> <%=subIf.getDisplayName()%>
			<br />
			<strong>Sub Interface name: </strong> <%=subIf.getName()%>
			<br />
			<%
					}
			%>
	</p>
	<%
		}
	%>
</body>
</html>