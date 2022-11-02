/**   
* @Title: SendMsgThread.java 
* @Package com.waremec.weixin.thread 
* @Description:  
* @author taebem
* @date 2015年8月27日 上午10:02:08 
* @version V1.0   
*/
package com.waremec.weixin.thread;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.waremec.weixin.dao.WeixinMessageDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.domain.msg.Article;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.PropertiesUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.weixin.utils.WeixinMessageUtils;

/** 
 * @Package com.waremec.weixin.thread 
 * @FileName SendMsgThread
 * @Description  
 * @author taebem 
 * @date 2015年8月27日 上午10:02:08 
 *  
 */
public class SendMsgThread  implements Runnable{
private final transient Log logger = LogFactory.getLog(this.getClass());
	
	
	private HttpServletRequest request;
	
	private WeixinService weixinService;
	private WeixinMessageDao weixinMessageDao;
	
	private AppInfo appInfo;
	Map<String,String> map;
	private String keywork;
	
	
	
	public SendMsgThread(HttpServletRequest request, WeixinService weixinService,WeixinMessageDao weixinMessageDao, AppInfo appInfo, Map<String, String> map, String keywork) {
		this.request = request;
		this.weixinService = weixinService;
		this.weixinMessageDao = weixinMessageDao;
		this.appInfo = appInfo;
		this.map = map;
		this.keywork = keywork;
	}


	private boolean whetherMakeOauth2Url(AppInfo appInfo, String url){
		if (StringUtils.isNotBlank(url) && (url.startsWith("/") || url.startsWith(appInfo.getDomain()) && !url.endsWith(".html")) ) {
			return true;
		}
		return false;
	}

	/* (非 Javadoc) 
	* <p>Title: run</p> 
	* <p>Description: </p>  
	* @see java.lang.Runnable#run() 
	*/
	@Override
	public void run() {
		
		try {
			logger.info("=================thread start=====================");
			// TODO Auto-generated method stub
			// 事件类型
			String event = map.get("Event");
			// 发送方帐号
			String fromUserName = map.get("FromUserName");
			String eventKey = map.get("EventKey");// 事件KEY值，qrscene_为前缀，后面为二维码的参数值
			String ticket = map.get("Ticket");// Ticket 
			 
			logger.info("Event============" + event);
			logger.info("EventKey=========" + eventKey);
			logger.info("Ticket===========" + ticket);
			
			String token = weixinService.getAccessToken(appInfo); 
			
			List<Map<String,Object>> msgList = weixinMessageDao.getReturnMessageUser(appInfo, keywork, fromUserName);
			
			List<Map<String,Object>> textMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> imageMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> voiceMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> videoMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> musicMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> newsMsgList = new ArrayList<Map<String,Object>>();
			
			try {
				logger.info("===================msgList.size()===>"+msgList.size());
			}
			catch (Exception e) {
				logger.info("===================msgList.size()===>ERROR");
			}
			
			
			if(!msgList.isEmpty()){
				for (Map<String,Object> item : msgList) {
					String type = (String) item.get("MSG_TYPE");
					if("text".equalsIgnoreCase(type)){
						textMsgList.add(item);
					}else if("image".equalsIgnoreCase(type)){
						imageMsgList.add(item);
					}else if("voice".equalsIgnoreCase(type)){
						voiceMsgList.add(item);
					}else if("video".equalsIgnoreCase(type)){
						videoMsgList.add(item);
					}else if("music".equalsIgnoreCase(type)){
						musicMsgList.add(item);
					}else if("news".equalsIgnoreCase(type)){
						newsMsgList.add(item);
					}
				}
			}
			
			//挨个儿发送消息
			if(!textMsgList.isEmpty()){// 回复文本消息
				for (Map<String, Object> item : textMsgList) {
					String content = (String) item.get("CONTENT");
					logger.info("===================content==================");
					logger.info(content);
					logger.info("===================content==================");
					WeixinMessageUtils.sendTextMsg(token, fromUserName, content);
				}
			}
			
			if(!imageMsgList.isEmpty()){//回复图片消息
				
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				for (Map<String, Object> item : imageMsgList) {
					
					String mediaId = (String) item.get("MEDIA_ID");
					
					if(StringUtils.isBlank(mediaId)){
						String picUrl = (String) item.get("PIC_URL");
						Integer fileId = (Integer) item.get("FILE_ID");
						
						MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "image", uploadBaseDir + picUrl);
						mediaId = mediaReturn.getMedia_id();
						weixinMessageDao.updateMediaId(fileId, mediaId);
					}
					
					WeixinMessageUtils.sendImageMsg(token, fromUserName, mediaId);
				}
			}
			if(!voiceMsgList.isEmpty()){//回复语音消息
//				for (Map<String, Object> item : voiceMsgList) {
//				}
			}
			if(!videoMsgList.isEmpty()){//回复视频消息
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				
				for (Map<String, Object> item : videoMsgList) {
//					String thumbMediaId = (String) item.get("THUMB_MEDIA_ID");
					String thumbMediaId = "";
					String mediaId = (String) item.get("MEDIA_ID");
					String title 	= (String) item.get("MSG_TITLE");
					String description = title;
//					String description = (String) item.get("CONTENT");
					
					if(StringUtils.isBlank(mediaId)){
						String videoUrl = (String) item.get("PIC_URL");
						Integer fileId = (Integer) item.get("FILE_ID");
						mediaId = WeixinMediaUtils.addVideoMaterial(token, uploadBaseDir + videoUrl, title, description);
						weixinMessageDao.updateMediaId(fileId, mediaId);
					}
					//TODO 回复视频文件
					WeixinMessageUtils.sendVideoMsg(token, fromUserName, mediaId, thumbMediaId, title, description);
					
				}
			}
			if(!musicMsgList.isEmpty()){//回复音乐消息
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				for (Map<String, Object> item : musicMsgList) {
					String title 	= (String) item.get("MSG_TITLE");
//					String description = (String) item.get("DESCRIPTION");
					String description = title;
					Integer fileId 	= (Integer) item.get("FILE_ID");
					String musicUrl 	= appInfo.getDomain() + (String) item.get("PIC_URL");
					String hqMusicUrl 	= appInfo.getDomain() + (String) item.get("PIC_URL");
					
					String thumbFileUrl 	=  (String) item.get("LINK_URL");
					MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "thumb", uploadBaseDir + thumbFileUrl);
					String thumbMediaId = mediaReturn.getThumb_media_id();
					
					//TODO 回复音乐文件
					WeixinMessageUtils.sendMusicMsg(token, fromUserName, title, description, musicUrl, hqMusicUrl, thumbMediaId);
				}
			}
			
			if(!newsMsgList.isEmpty()){//回复图文消息
					
				List<Article> articles = new ArrayList<Article>();
				for (Map<String,Object> item : newsMsgList) {
					
					String msgTitle = (String)item.get("MSG_TITLE");
					String description = (String)item.get("CONTENT");
					String picurl = appInfo.getDomain() + (String)item.get("PIC_URL");
					String url =  (String)item.get("LINK_URL");
					
					logger.info("msgTitle=====" + msgTitle);
					logger.info("description==" + description);
					logger.info("picurl=======" + picurl);
					logger.info("url==========" + url);
					
					if (whetherMakeOauth2Url(appInfo, url)) {
						url = Oauth2Utils.getNormalLinkUrl(appInfo, url);
					} 
					
					Article article = new Article(msgTitle, description, picurl,url );
					
					articles.add(article);
				}
				
				WeixinMessageUtils.sendNewsMsg(token, fromUserName, articles);
				 
			}
			
			
//			//这里暂时hardcoding回复文本内容
//			if(StringUtils.isNotBlank(scene_id)){
//				WeixinMessageUtils.sendTextMsg(token, fromUserName, msg);
//			}
			logger.info("=================thread end=====================");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}
