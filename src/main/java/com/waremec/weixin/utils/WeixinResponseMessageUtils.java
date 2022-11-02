package com.waremec.weixin.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.waremec.weixin.aes.AesException;
import com.waremec.weixin.aes.WXBizMsgCrypt;
import com.waremec.weixin.dao.WeixinMassDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.domain.msg.resp.Article;
import com.waremec.weixin.domain.msg.resp.Image;
import com.waremec.weixin.domain.msg.resp.ImageMessage;
import com.waremec.weixin.domain.msg.resp.MusicMessage;
import com.waremec.weixin.domain.msg.resp.NewsMessage;
import com.waremec.weixin.domain.msg.resp.TextMessage;
import com.waremec.weixin.domain.msg.resp.VideoMessage;
import com.waremec.weixin.domain.msg.resp.Voice;
import com.waremec.weixin.domain.msg.resp.VoiceMessage;
import com.waremec.weixin.service.WeixinService;

/** 
* @Package com.waremec.weixin.utils 
* @FileName WeixinResponseMessageUtils
* @Description  发送消息 - 发送被动消息接口工具类
* @author taebem 
* @date 2015年5月7日 下午4:00:51 
*  
*/
public class WeixinResponseMessageUtils {

	private static final transient Log logger = LogFactory.getLog(WeixinResponseMessageUtils.class);
	
	public static String genResponseMsg(HttpServletRequest request, AppInfo appInfo, Map<String,String> requestMap,List<Map<String,Object>> resultList){
		String returns = "";
		
		
		if(!resultList.isEmpty()){
			
			String xml = "";
			//随机数
			String nonce  		= request.getParameter("nonce");	 
			// 发送方帐号
			String fromUserName = requestMap.get("FromUserName");
			// 开发者微信号
			String toUserName = requestMap.get("ToUserName");
			
			long createTime = System.currentTimeMillis() / 1000;
			
			String type = (String)resultList.get(0).get("MSG_TYPE");
			 
			if("text".equalsIgnoreCase(type)){// 回复文本消息
				TextMessage message = new TextMessage();
				
				message.setToUserName(fromUserName);
				message.setFromUserName(toUserName);
				message.setCreateTime(createTime);
				message.setMsgType("text");
				
				message.setContent((String)resultList.get(0).get("CONTENT"));
				
				xml = XmlUtils.messageToXml(message);
				
			}else if("image".equalsIgnoreCase(type)){//回复图片消息
				
				
				String mediaId = (String) resultList.get(0).get("MEDIA_ID");
				
				
				if(StringUtils.isEmpty(mediaId)){
					
					WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
					
					WeixinMassDao weixinMassDao = wac.getBean(WeixinMassDao.class);
					WeixinService weixinService = wac.getBean(WeixinService.class);
					
					logger.info("weixinMassDao=" + weixinMassDao);
					String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
					String picUrl = (String) resultList.get(0).get("PIC_URL");
					Integer fileId = (Integer) resultList.get(0).get("FILE_ID");
					logger.info("uploadBaseDir=" + uploadBaseDir);
					logger.info("picUrl=" + picUrl);
					
					String token = weixinService.getAccessToken(appInfo);
					logger.info("token=" + token);
					MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "image", uploadBaseDir + picUrl);
					mediaId = mediaReturn.getMedia_id();
					weixinMassDao.updateMediaId(fileId, mediaId);
				}
				
				ImageMessage message = new ImageMessage();
				
				message.setToUserName(fromUserName);
				message.setFromUserName(toUserName);
				message.setCreateTime(createTime);
				message.setMsgType("image");
				
				Image image = new Image(mediaId);
				
				message.setImage(image);
				
				xml = XmlUtils.messageToXml(message);
				
				logger.info("response img xml==========" + xml);
				
			}else if("voice".equalsIgnoreCase(type)){//回复语音消息
				VoiceMessage message = new VoiceMessage();
				
				message.setToUserName(fromUserName);
				message.setFromUserName(toUserName);
				message.setCreateTime(createTime);
				message.setMsgType("voice");
				
				Voice voice = new Voice();
				
				message.setVoice(voice);
				
				xml = XmlUtils.messageToXml(message);
				
			}else if("video".equalsIgnoreCase(type)){//回复视频消息
				
				VideoMessage message = new VideoMessage();
				
				message.setToUserName(fromUserName);
				message.setFromUserName(toUserName);
				message.setCreateTime(createTime);
				message.setMsgType("video");
				
				com.waremec.weixin.domain.msg.resp.Video video = new com.waremec.weixin.domain.msg.resp.Video();
				
				message.setVideo(video);
				
				xml = XmlUtils.messageToXml(message);
				
			}else if("music".equalsIgnoreCase(type)){//回复音乐消息
				
				MusicMessage message = new MusicMessage();
				
				message.setToUserName(fromUserName);
				message.setFromUserName(toUserName);
				message.setCreateTime(createTime);
				message.setMsgType("music");
				
				com.waremec.weixin.domain.msg.resp.Music music = new com.waremec.weixin.domain.msg.resp.Music();
				
				message.setMusic(music);
				
				xml = XmlUtils.messageToXml(message);
				
			}else if("news".equalsIgnoreCase(type)){//回复图文消息
				
				NewsMessage message = new NewsMessage();
				
				List<Article> articles = new ArrayList<Article>();
				
				message.setToUserName(fromUserName);
				message.setFromUserName(toUserName);
				message.setCreateTime(createTime);
				message.setMsgType("news");
				
				logger.info("<<<<<<<<<<<<<<<<<s<<<<<<<<<<<<<<<<<<<<<<<<");
				
				for (Map<String,Object> item : resultList) {
					
					Article article = new Article();
					
					article.setDescription((String)item.get("CONTENT"));
					article.setTitle((String)item.get("MSG_TITLE"));
					article.setPicUrl(appInfo.getDomain() + (String)item.get("PIC_URL"));
					String linkUrl = (String) item.get("LINK_URL");
					
					if (whetherMakeOauth2Url(appInfo, linkUrl)) {
						article.setUrl(Oauth2Utils.getNormalLinkUrl(appInfo, linkUrl));
					}else{
						article.setUrl( (String) item.get("LINK_URL"));
					}
				 
					logger.info("article.getUrl" +article.getUrl());
					
					articles.add(article);
					
				}
				logger.info("<<<<<<<<<<<<<<<<e<<<<<<<<<<<<<<<<<<<<<<<<<");
				
				message.setArticleCount(articles.size());
				message.setArticles(articles);
				
				 xml = XmlUtils.messageToXml(message);
				 
				 logger.debug("pesponseXml=\n" + xml);
			} 
			
			if(StringUtils.isNotEmpty(xml)){
				try {
					WXBizMsgCrypt pc = new WXBizMsgCrypt(appInfo.getToken(), appInfo.getEncordingAesKey(), appInfo.getAppId());
					returns = pc.encryptMsg(xml, createTime + "", nonce);
				} catch (AesException e) {
					e.printStackTrace();
					returns = "";
				}
			}
		} 
		
		return returns;
	}
	
	
	private static boolean whetherMakeOauth2Url(AppInfo appInfo, String url){
		if (StringUtils.isNotBlank(url) && (url.startsWith("/") || url.startsWith(appInfo.getDomain()) && !url.endsWith(".html")) ) {
			return true;
		}
		return false;
	}
	
	
}
