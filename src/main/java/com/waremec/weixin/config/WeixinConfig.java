/**   
 * @Title: WeixinConfig.java 
 * @Package com.waremec.weixin.config 
 * @Description:  
 * @author taebem
 * @date 2015年5月29日 下午1:08:10 
 * @version V1.0   
 */
package com.waremec.weixin.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.weixin.utils.PaymentUtils;

/**
 * @Package com.waremec.weixin.config
 * @FileName WeixinConfig
 * @Description
 * @author taebem
 * @date 2015年5月29日 下午1:08:10
 * 
 */
public class WeixinConfig {

	private static final transient Log logger = LogFactory.getLog(WeixinConfig.class);

	private static Properties props;

	static {
		// System.out.println("==============================");
		InputStream inputStream = PaymentUtils.class.getClassLoader().getResourceAsStream("config/weixin.properties");

		props = new Properties();
		try {
			props.load(inputStream);
			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}

	private WeixinConfig() {
	}

	public static String getValue(String key) {
		return props.getProperty(key);
	}

	public static void main(String[] args) {
		Enumeration en = props.propertyNames();
		while (en.hasMoreElements()) {
			String key = (String) en.nextElement();
			String value = props.getProperty(key);
			logger.info(key + "==>" +  value);
		}
	}
}
