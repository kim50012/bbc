/**   
* @Title: DownloadImageMsgThread.java 
* @Package com.waremec.weixin.thread 
* @Description:  
* @author taebem
* @date 2015年12月29日 上午10:11:53 
* @version V1.0   
*/
package com.waremec.weixin.thread;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.waremec.weixin.cons.DownloadFileType;
import com.waremec.weixin.dao.WeixinMessageDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.FileItem;
import com.waremec.weixin.domain.msg.Image;
import com.waremec.weixin.service.WeixinMediaService;
import com.waremec.weixin.service.WeixinService;
import com.waremec.wpt.front.service.EventService;

/** 
 * @Package com.waremec.weixin.thread 
 * @FileName DownloadImageMsgThread
 * @Description  下载用户在微信对话窗口中上传的图片
 * @author taebem 
 * @date 2015年12月29日 上午10:11:53 
 *  
 */
public class DownloadImageMsgThread implements Runnable {

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	private HttpServletRequest request;
	private AppInfo appInfo;
	private Image image;
	
	public DownloadImageMsgThread() {}


	public DownloadImageMsgThread(HttpServletRequest request,AppInfo appInfo, Image image) {
		this.request = request;
		this.appInfo = appInfo;
		this.image = image;
	}




	/* (非 Javadoc) 
	 * <p>Title: run</p> 
	 * <p>Description: </p>  
	 * @see java.lang.Runnable#run() 
	 */
	@Override
	public void run() {
		// TODO Auto-generated method stub
		logger.info("=================DownloadImageMsgThread start=====================");
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
		WeixinMediaService weixinMediaService = wac.getBean(WeixinMediaService.class);
		WeixinMessageDao weixinMessageDao  = wac.getBean(WeixinMessageDao.class);
		
		FileItem fileItme = weixinMediaService.downloadFile(request, appInfo.getShopId(), image.getMediaId(), DownloadFileType.get(1), null);
		image.setFileId(fileItme.getFileId());
		
		weixinMessageDao.insertImageMsg(image); 
		logger.info("=================DownloadImageMsgThread end=====================");
	}

}
