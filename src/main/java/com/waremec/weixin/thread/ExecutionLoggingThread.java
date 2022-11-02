/**   
* @Title: ExecutionLoggingThread.java 
* @Package com.waremec.weixin.thread 
* @Description:  
* @author taebem
* @date 2015年8月10日 上午10:50:23 
* @version V1.0   
*/
package com.waremec.weixin.thread;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.weixin.domain.ExecutionLog;
import com.waremec.weixin.domain.WeixinPageExecutionLog;
import com.waremec.weixin.domain.WeixinSessionPageExeLog;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.utils.Constants;

/** 
 * @Package com.waremec.weixin.thread 
 * @FileName ExecutionLoggingThread
 * @Description  
 * @author taebem 
 * @date 2015年8月10日 上午10:50:23 
 *  
 */
public class ExecutionLoggingThread implements Runnable {

	private final transient Log logger = LogFactory.getLog(this.getClass());

//	private ExecutionLog executionLog;
	
	private WeixinService weixinService;
	private String type;
	private Object log;
	


	public ExecutionLoggingThread(WeixinService weixinService, String type, Object log) {
		this.weixinService = weixinService;
		this.type = type;
		this.log = log;
	}





	/* (非 Javadoc) 
	* <p>Title: run</p> 
	* <p>Description: </p>  
	* @see java.lang.Runnable#run() 
	*/
	@Override
	public void run() {
		// TODO Auto-generated method stub
//		weixinService.insertExecutionLog(executionLog);
		
		try {
			if(type.equals(Constants.LogType.WX_SERVER_IF)){
				weixinService.insertExecutionLog((ExecutionLog)log);
			}else if(type.equals(Constants.LogType.SESSION_PAGE)){
				weixinService.insertWeixinSessionPageExeLog((WeixinSessionPageExeLog)log);
			}else if(type.equals(Constants.LogType.SHARE_SETTIONG)){
				weixinService.insertWeixinPageExecutionLog((WeixinPageExecutionLog)log);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
