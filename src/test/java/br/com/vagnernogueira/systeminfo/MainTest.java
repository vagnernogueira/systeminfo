package br.com.vagnernogueira.systeminfo;

import static org.junit.Assert.assertTrue;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import org.junit.Test;

public class MainTest {

	// @Test
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

	// @Test
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

	// @Test
	public void testJboss() {
		final String[] properties = { "jboss.server.name", "jboss.host.name",
				"jboss.node.name", "jboss.home.dir", "jboss.domain.base.dir",
				"jboss.domain.config.dir", "java.runtime.name",
				"java.vm.vendor", "java.runtime.version", "user.timezone",
				"user.language", "user.country", "os.name", "os.arch",
				"os.version" };
		for (int i = 0; i < properties.length; i++) {
			String propsname = properties[i];
			String propsvalue = System.getProperty(propsname);
			System.out.println(propsname + " :" + propsvalue);
			assertTrue(true);
		}
	}

	@Test
	public void defaultTest() {
		System.out.println(Main.getHostName());
		assertTrue(true);
	}
}
