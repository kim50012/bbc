/**   
 * @Title: IPUtils.java 
 * @Package com.waremec.weixin.utils 
 * @Description:  
 * @author taebem
 * @date 2015年9月25日 上午11:36:03 
 * @version V1.0   
 */
package com.waremec.weixin.utils;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.InterfaceAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Package com.waremec.weixin.utils
 * @FileName IPUtils
 * @Description
 * @author taebem
 * @date 2015年9月25日 上午11:36:03
 * 
 */
public class IPUtils {

	private static final transient Log logger = LogFactory.getLog(IPUtils.class);

	public static String getLocalIPv4() {
		String ip = null;
		try {
			for (Enumeration e = NetworkInterface.getNetworkInterfaces(); e.hasMoreElements();) {
				NetworkInterface item = (NetworkInterface) e.nextElement();

				// 非虚拟非回路并开启状态
				if ((!item.isVirtual()) && item.isUp() && (!item.isLoopback())) {
					for (InterfaceAddress address : item.getInterfaceAddresses()) {

						if (address.getAddress() instanceof Inet4Address) {
							Inet4Address inet4Address = (Inet4Address) address.getAddress();
							// if(inet4Address.isSiteLocalAddress()){
							ip = inet4Address.getHostAddress();
							break;
							// }

						}
					}
				}
			}
		} catch (IOException ex) {

		}

		if(ip == null){
			logger.error("Local Ip is null!!");
			ip = "127.0.0.1";
		}
		
		return ip;
	}

}
