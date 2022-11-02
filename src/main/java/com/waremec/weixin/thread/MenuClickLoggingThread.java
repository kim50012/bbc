/**   
* @Title: MenuClickLoggingThread.java 
* @Package com.waremec.weixin.thread 
* @Description:  
* @author taebem
* @date 2015年8月25日 上午10:41:47 
* @version V1.0   
*/
package com.waremec.weixin.thread;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.ExecutionLog;
import com.waremec.weixin.service.WeixinService;

/** 
 * @Package com.waremec.weixin.thread 
 * @FileName MenuClickLoggingThread
 * @Description  
 * @author taebem 
 * @date 2015年8月25日 上午10:41:47 
 *  
 */
public class MenuClickLoggingThread implements Runnable {

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	
	private AppInfo appInfo;
	private String openid;
	private String eventKey;
	
	private WeixinService weixinService;
	
 


	public MenuClickLoggingThread(AppInfo appInfo, String openid, String eventKey, WeixinService weixinService) {
		this.appInfo = appInfo;
		this.openid = openid;
		this.eventKey = eventKey;
		this.weixinService = weixinService;
	}




	/* (非 Javadoc) 
	* <p>Title: run</p> 
	* <p>Description: </p>  
	* @see java.lang.Runnable#run() 
	*/
	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
		  Integer menuId = Integer.valueOf(eventKey);
		  
		  Map<String,Object> map = new HashMap<String,Object>();
		  map.put("SHOP_ID", appInfo.getShopId());
		  map.put("MENU_ID", menuId);
		  map.put("OPENID", openid);
		  
		  weixinService.insertMenuClickLogging(map);
		  
		} catch (Exception e) {
			 
		}
	}

}
