package br.com.vagnernogueira.systeminfo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {
	public static String getTime() {
		final DateFormat df = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss.SSS");
		return df.format(new Date());
	}
}
