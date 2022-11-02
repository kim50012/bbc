/**   
* @Title: DiffConfig.java 
* @Package com.waremec.framework.common 
* @Description:  
* @author taebem
* @date 2015年10月30日 上午11:49:47 
* @version V1.0   
*/
package com.waremec.framework.common;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.weixin.utils.PaymentUtils;

/** 
 * @Package com.waremec.framework.common 
 * @FileName DiffConfig
 * @Description  
 * @author taebem 
 * @date 2015年10月30日 上午11:49:47 
 *  
 */
public class DiffConfig {
private static final transient Log logger = LogFactory.getLog(DiffConfig.class);
	
	private static Properties prop;

	static {
//		System.out.println("==============================");
		InputStream inputStream = PaymentUtils.class.getClassLoader().getResourceAsStream("config/diff.properties");

		prop = new Properties();
		try {
			prop.load(inputStream);
			inputStream.close();
		} catch (IOException e1) {
			e1.printStackTrace();
			logger.error(e1.getMessage());
		}
	}

	private DiffConfig() {
	}

	public static String getValue(String key) {
		return prop.getProperty(key);
	}
	
	public static void main(String[] args) {
		System.out.println(getValue("bbs.type.pumeiduo.shichifankui"));
	}
}
