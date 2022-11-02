package com.waremec.weixin.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PropertiesUtils {

	
	private static final transient Log logger = LogFactory.getLog(PropertiesUtils.class);
	
	private static Properties prop;

	static {
		logger.info("=============PropertiesUtils. init =================");
		InputStream inputStream = PropertiesUtils.class.getClassLoader().getResourceAsStream("config/common.properties");

		prop = new Properties();
		try {
			prop.load(inputStream);
			inputStream.close();
		} catch (IOException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
	}

	private PropertiesUtils() {
	}
	
	public static String getUploadBaseDir() {
		return getValue("upload.base.dir");
	}

	public static String getValue(String key) {
		return prop.getProperty(key);
	}
}
