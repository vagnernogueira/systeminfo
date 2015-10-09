package br.com.vagnernogueira.systeminfo;

import static org.junit.Assert.assertTrue;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.junit.Test;

public class MainTest {

	@Test
	public void testProperties() {
		Properties props = System.getProperties();
		Enumeration<?> e = props.propertyNames();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			String value = props.getProperty(key);
			System.out.println(key + ": " + value);
		}
		assertTrue(true);
	}

	@Test
	public void testEnv() {
		Map<String, String> env = System.getenv();
		Iterator<?> it = env.entrySet().iterator();
		while (it.hasNext()) {
			@SuppressWarnings("unchecked")
			Map.Entry<String, String> pair = (Map.Entry<String, String>) it
					.next();
			System.out.println(pair.getKey() + ": " + pair.getValue());
		}
		assertTrue(true);
	}
}
