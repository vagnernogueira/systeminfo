package br.com.vagnernogueira.systeminfo;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

public class Main {
	public static String getTime() {
		final DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS");
		return df.format(new Date());
	}

	public static String getHostName() {
		try {
			String result = InetAddress.getLocalHost().getHostName();
			if (result != null && !result.trim().isEmpty()) {
				return result;
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		String host = System.getenv("COMPUTERNAME");
		if (host != null) {
			return host;
		}

		host = System.getenv("HOSTNAME");
		if (host != null) {
			return host;
		}
		return "Não consegui determinar";
	}

	public static List<NetworkInterface> getNetworkInterfaces() {
		Enumeration<NetworkInterface> nets = null;
		try {
			nets = NetworkInterface.getNetworkInterfaces();
		} catch (SocketException e) {
			e.printStackTrace();
		}
		return Collections.list(nets);
	}
	
	public static List<InetAddress> getInetAddresses(NetworkInterface netint) {
		Enumeration<InetAddress> inetAddresses = netint.getInetAddresses();
		return Collections.list(inetAddresses);
	}
	
	public static List<NetworkInterface> getSubInterfaces(NetworkInterface netint) {
		Enumeration<NetworkInterface> subIfs = netint.getSubInterfaces();
		return Collections.list(subIfs);
	}
}
