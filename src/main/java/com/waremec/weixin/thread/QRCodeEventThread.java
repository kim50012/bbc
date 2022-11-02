/**   
* @Title: QRCodeEventThread.java 
* @Package com.waremec.weixin.thread 
* @Description:  
* @author taebem
* @date 2015年6月15日 上午10:12:46 
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
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.PropertiesUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.weixin.utils.WeixinMessageUtils;

/** 
 * @Package com.waremec.weixin.thread 
 * @FileName QRCodeEventThread
 * @Description  
 * @author taebem 
 * @date 2015年6月15日 上午10:12:46 
 *  
 */
public class QRCodeEventThread implements Runnable {

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	
	private HttpServletRequest request;
	
	private WeixinService weixinService;
	private WeixinMessageDao weixinMessageDao;
	
	private AppInfo appInfo;
	
	Map<String,String> map;
	
	
	
	public QRCodeEventThread(HttpServletRequest request, WeixinService weixinService,WeixinMessageDao weixinMessageDao, AppInfo appInfo, Map<String, String> map) {
		this.request = request;
		this.weixinService = weixinService;
		this.weixinMessageDao = weixinMessageDao;
		this.appInfo = appInfo;
		this.map = map;
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
			String scene_id = "";
			String msg = "";
			String token = "";
			
			logger.info("Event============" + event);
			logger.info("EventKey=========" + eventKey);
			logger.info("Ticket===========" + ticket);
			
			if (Constants.Event.SUBSCRIBE.equals(event)) {
				if(StringUtils.isNotBlank(eventKey)){
					scene_id = eventKey.substring(8); //QRCode 场景值ID
					msg = "首次关注 scene_id:" + scene_id;
					Thread.sleep(2000);
					token = weixinService.getAccessToken(appInfo);
				}
			}else if (Constants.Event.SCAN.equals(event)) {
				scene_id = eventKey; //QRCode 场景值ID
				msg = "已关注用户 scene_id:" + scene_id;
				token = weixinService.getAccessToken(appInfo);
			}
			
			//根据scene_id来判断回复什么样的内容（从数据库返回回复的类型）
			logger.info("scene_id=========" + scene_id);
			logger.info("msg==============" + msg);
			logger.info("toUser===========" + fromUserName);
			logger.info("token===========" + token);
			logger.info("scene_id===========" +  scene_id);
			logger.info("keywork===========" +  "QR_" + scene_id);
 
			
			try {
				logger.info("<><><><>scan<><><>");
				weixinMessageDao.insertQRCodeScanedResult(appInfo.getShopId(),fromUserName,Integer.valueOf(scene_id));
				logger.info("<><><><>scan<><><>");
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			List<Map<String,Object>> msgList = weixinMessageDao.getReturnMessage(appInfo,  "QR_" + scene_id);
			
			List<Map<String,Object>> textMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> imageMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> voiceMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> videoMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> musicMsgList = new ArrayList<Map<String,Object>>();
			List<Map<String,Object>> newsMsgList = new ArrayList<Map<String,Object>>();
			
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
					
					String thumbFileUrl 	= (String) item.get("LINK_URL");
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
