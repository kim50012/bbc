package com.waremec.weixin.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Package com.waremec.weixin.utils
 * @FileName ServletRequestUtils
 * @Description ServletRequest工具类
 * @author taebem
 * @date 2015年5月7日 下午4:02:15
 * 
 */
public class ServletRequestUtils {

	private static final transient Log logger = LogFactory.getLog(ServletRequestUtils.class);

	public static String readStreamParameter(HttpServletRequest request) {

		String returns = "";
		StringBuilder sb = new StringBuilder();

		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}

			returns = new String(sb.toString().getBytes("gbk"), "utf-8");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("获取POST数据:" + e.getMessage());
		} finally {
			if (null != reader) {
				try {
					reader.close();
				} catch (IOException e) {
					logger.error("111==>" + e.getMessage()); 
				}
			}
		}

		return returns;
	}

}
