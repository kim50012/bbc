package com.waremec.weixin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.dao.WeixinMassDao;
import com.waremec.weixin.domain.mass.Article;
import com.waremec.weixin.domain.mass.MassReturn;
import com.waremec.weixin.domain.mass.Media;
import com.waremec.weixin.domain.mass.NewsData;
import com.waremec.weixin.domain.mass.NewsMassDomain;
import com.waremec.weixin.domain.mass.Text;
import com.waremec.weixin.domain.mass.TextMassDomian;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.utils.PropertiesUtils;
import com.waremec.weixin.utils.WeixinMassMessageUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;

/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinMassService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:23 
*  
*/
@Service
public class WeixinMassService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());   
	@Resource
	private WeixinService weixinService;
	
	@Resource
	private WeixinMassDao weixinMassDao;
	
	/**
	 * 群发文本信息
	 * @param shopId
	 * @param is_to_all 是否全部发送
	 * @param touser 用户列表
	 * @param content 文本内容
	 * @return MassRetuen
	 */
	public MassReturn sendTextMass(Integer shopId,  boolean is_to_all,List<String> touser, String content){
		String mediaId = "";
		String token = weixinService.getAccessToken(shopId);
		logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		
		MassReturn massRetuen = null;
		if(is_to_all){
			logger.info("WeixinMassMessageUtils.sendTextAll=============");
			massRetuen = WeixinMassMessageUtils.sendTextAll(token, true, null, content);
		}else{
			TextMassDomian text = new TextMassDomian();
			text.setText(new Text(content));
			text.setTouser(touser);
			
			logger.info("WeixinMassMessageUtils.sendMass=============");
			massRetuen = WeixinMassMessageUtils.sendMass(token, text);
		}
		
		return massRetuen;
		 
		
	}
	
	/**
	 * 预览群发文本消息
	 * @param shopId
	 * @param openid 
	 * @param newsList 图文列表
	 * @return
	 */
	public void previewTextMass(Integer shopId, String openid, String content){
		String mediaId = "";
		String token = weixinService.getAccessToken(shopId);
		 
		Long msgId = WeixinMassMessageUtils.previewMassMessage(token, openid, "text", content);
		logger.info("msgId = " + msgId);
			 
	}
	
	
	
	/**
	 * 群发信息
	 * @param shopId
	 * @param is_to_all 是否全部发送
	 * @param touser 用户列表
	 * @param newsList 图文消息列表
	 * @return MassRetuen
	 */
	public MassReturn sendMass(Integer shopId,  boolean is_to_all,List<String> touser, List<Map<String, Object>> newsList){
		String mediaId = "";
		String token = weixinService.getAccessToken(shopId);
		 
		////////////
		logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		/////////////
	 
		NewsData newsData = new NewsData();
		
		List<Article> list = new ArrayList<Article>();
		
		for (int i = 0; i < newsList.size(); i++) {
			Map<String,Object> item = newsList.get(i);
			logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
			mediaId = (String)item.get("MEDIA_ID");
			Integer fileId = (Integer)item.get("MFILE_ID");
			String fileUrl = (String)item.get("FILE_URL");
			String author = (String)item.get("MAUTHOR");
			String title = (String)item.get("MTITLE");
			String sourceUrl = (String)item.get("MSOURCE_URL");
			String content = (String)item.get("MCONTENTWECHAT");
//			String content = (String)item.get("MCONTENT");
			String mdigest = (String)item.get("MDIGEST");
			Integer mshowCoverPic = (Integer)item.get("MSHOW_COVER_PIC");
			logger.info("old media id = " + mediaId);
			//mediaId失效，重新上传
			if(StringUtils.isEmpty(mediaId)){
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				logger.info("uploadBaseDir=" + uploadBaseDir);
				logger.info("fileUrl=" + fileUrl);
				logger.info("token=" + token);
				MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "image", uploadBaseDir + fileUrl);
				mediaId = mediaReturn.getMedia_id();
				weixinMassDao.updateMediaId(fileId, mediaId);
				
				logger.info("new media id = " + mediaId);
			}
			
			Article a = new Article();
			a.setThumb_media_id(mediaId);
			a.setAuthor(author);
			a.setTitle(title);
			a.setContent_source_url(sourceUrl);
			a.setContent(content);
			a.setDigest(mdigest);
			a.setShow_cover_pic(mshowCoverPic + "");
			
			list.add(a);
			
		}
		
		newsData.setArticles(list);
		 
			
		//上传图文消息素材【订阅号与服务号认证后均可用】
		MediaReturn mediaReturn = WeixinMassMessageUtils.uploadNews(token,newsData);
		 
		if(mediaReturn.getType().equals("news")){ 
			
			NewsMassDomain news = new NewsMassDomain();
			news.setMpnews(new Media(mediaReturn.getMedia_id()));
			news.setTouser(touser);
			
			MassReturn massRetuen = null;
			if(is_to_all){
				logger.info("WeixinMassMessageUtils.sendMpnewsAll=============");
				massRetuen = WeixinMassMessageUtils.sendMpnewsAll(token, true, null, mediaReturn.getMedia_id());
			}else{
				logger.info("WeixinMassMessageUtils.sendMass=============");
				massRetuen = WeixinMassMessageUtils.sendMass(token, news);
			}
			
			return massRetuen;
			 
		}
		
		return null;
		 
	}
	
	public  String getWeixinImageUrl(Integer shopId,  String fileUrl) {
		String token = weixinService.getAccessToken(shopId);
		return WeixinMassMessageUtils.uploadImg(token, fileUrl);
	}
	/**
	 * 预览群发图文消息
	 * @param shopId
	 * @param openid 
	 * @param newsList 图文列表
	 * @return
	 */
	public void previewMass(Integer shopId, String openid, List<Map<String, Object>> newsList){
		String mediaId = "";
		String token = weixinService.getAccessToken(shopId);
		 
		////////////
		logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		/////////////
	 
		NewsData newsData = new NewsData();
		
		List<Article> list = new ArrayList<Article>();
		
		for (int i = 0; i < newsList.size(); i++) {
			Map<String,Object> item = newsList.get(i);
			logger.info("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
			mediaId = (String)item.get("MEDIA_ID");
			Integer fileId = (Integer)item.get("MFILE_ID");
			String fileUrl = (String)item.get("FILE_URL");
			String author = (String)item.get("MAUTHOR");
			String title = (String)item.get("MTITLE");
			String sourceUrl = (String)item.get("MSOURCE_URL");
			String content = (String)item.get("MCONTENTWECHAT");
//			String content = (String)item.get("MCONTENT");
			String mdigest = (String)item.get("MDIGEST");
			Integer mshowCoverPic = (Integer)item.get("MSHOW_COVER_PIC");
			logger.info("old media id = " + mediaId);
			//mediaId失效，冲洗上传
 			if(StringUtils.isEmpty(mediaId)){
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				logger.info("uploadBaseDir=" + uploadBaseDir);
				logger.info("fileUrl=" + fileUrl);
				logger.info("token=" + token);
				MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "image", uploadBaseDir + fileUrl);
				mediaId = mediaReturn.getMedia_id();
				weixinMassDao.updateMediaId(fileId, mediaId);
				
				logger.info("new media id = " + mediaId);
 		}
			
			Article a = new Article();
			a.setThumb_media_id(mediaId);
			a.setAuthor(author);
			a.setTitle(title);
			a.setContent_source_url(sourceUrl);
			a.setContent(content);
			a.setDigest(mdigest);
			a.setShow_cover_pic(mshowCoverPic + "");
			
			list.add(a);
			
		}
		
		newsData.setArticles(list);
		 
			
		//上传图文消息素材【订阅号与服务号认证后均可用】
		MediaReturn mediaReturn = WeixinMassMessageUtils.uploadNews(token,newsData);
		 
		if(mediaReturn.getType().equals("news")){ 
			
			mediaId = mediaReturn.getMedia_id();
			
			Long msgId = WeixinMassMessageUtils.previewMassMessage(token, openid, "mpnews", mediaId);
			
			logger.info("msgId = " + msgId);
			 
		}
	}
	
	
	/*public boolean sendMass(Integer shopId, Integer messageId, List<String> touser){
		
		boolean flag = false;
		
		String mediaId = "";
		
		String token = weixinService.getAccessToken(shopId);
		
		logger.info("messageId=" + messageId);
		
		Map<String, Object> resultMap = weixinMassDao.selectSendMsgById(messageId);
		
		String type = (String)resultMap.get("SEND_FILE_TYPE");
		if(type.equals("news")){
			NewsData newsData = new NewsData();
			
			List<Article> list = new ArrayList<Article>();
			Article a = new Article();
			a.setThumb_media_id((String)resultMap.get("THUMB_MEDIA_ID"));
			a.setAuthor((String)resultMap.get("AUTHOR"));
			a.setTitle((String)resultMap.get("TITLE"));
			a.setContent_source_url((String)resultMap.get("CONTENT_SOURCE_URL"));
 			a.setContent((String)resultMap.get("CONTENT"));
			a.setDigest((String)resultMap.get("DIGEST"));
			a.setShow_cover_pic((String)resultMap.get("SHOW_COVER_PIC"));
			
			list.add(a);
			
			newsData.setArticles(list);
			try {
				
				//上传图文消息素材【订阅号与服务号认证后均可用】
				MediaReturn mediaReturn = WeixinMassMessageUtils.uploadNews(token,newsData);
				
				if(mediaReturn.getErrcode() == 0){
					if(mediaReturn.getType().equals("news")){ 
						
						NewsMassDomain news = new NewsMassDomain();
						news.setMpnews(new Media(mediaReturn.getMedia_id()));
						news.setTouser(touser);
						
						MassRetuen massRetuen = WeixinMassMessageUtils.sendMass(token, news);
						System.out.println(massRetuen.toString());
						if(massRetuen.getErrcode() == 0){
							flag = true;
						} 
						
//						MediaReturn sendMass(String access_token, Object obj);
					}
				}
				
//				MediaReturn [media_id=GGLJ_7u4z99WEnPIA5SEeEL-UZz61-hMO-o0CuFOJuggQDkoUKyQZNTFFTswS3pO, type=news, created_at=1425985728, errcode=0, errmsg=null]

				
				
				System.out.println(mediaReturn.toString());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag = false;
				
			}
		}else if("text".equals(type)){
			
		}else if("image".equals(type)){
			Integer fileId = (Integer)resultMap.get("FILE_ID");
			String fullUrl = (String)resultMap.get("FULL_URL");
			mediaId = (String)resultMap.get("MEDIA_ID");
			
			if(StringUtils.isEmpty(mediaId)){
			//	fullUrl
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				logger.info("uploadBaseDir=" + uploadBaseDir);
				logger.info("fullUrl=" + fullUrl);
				
				MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "image", uploadBaseDir + fullUrl);
				mediaId = mediaReturn.getMedia_id();
				weixinMassDao.updateMediaId(fileId, mediaId);
			}
			
			ImageMassDomain iamgeMass = new ImageMassDomain();
			iamgeMass.setImage(new Media(mediaId));
			iamgeMass.setTouser(touser);
			
			try {
				MassRetuen massRetuen = WeixinMassMessageUtils.sendMass(token, iamgeMass);
				System.out.println(massRetuen.toString());
				if(massRetuen.getErrcode() == 0){
					flag = true;
				} 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag = false;
			}
		}else if("voice".equals(type)){
			Integer fileId = (Integer)resultMap.get("FILE_ID");
			String fullUrl = (String)resultMap.get("FULL_URL");
			mediaId = (String)resultMap.get("MEDIA_ID");
			
			if(StringUtils.isEmpty(mediaId)){
			//	fullUrl
				String uploadBaseDir = PropertiesUtils.getUploadBaseDir();
				logger.info("uploadBaseDir=" + uploadBaseDir);
				logger.info("fullUrl=" + fullUrl);
				
				MediaReturn mediaReturn = WeixinMediaUtils.uploadMedia(token, "voice", uploadBaseDir + fullUrl);
				
				if(mediaReturn.getErrcode() == 0){
					mediaId = mediaReturn.getMedia_id();
					weixinMassDao.updateMediaId(fileId, mediaId);
				}else{
					return false;
				}
			}
			
			VoiceMassDomain voiceMass = new VoiceMassDomain();
			voiceMass.setVoice(new Media(mediaId));
			voiceMass.setTouser(touser);
			
			try {
				MassRetuen massRetuen = WeixinMassMessageUtils.sendMass(token, voiceMass);
				System.out.println(massRetuen.toString());
				if(massRetuen.getErrcode() == 0){
					flag = true;
				} 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag = false;
			}
		}else if("video".equals(type)){
			
		}
		
		
		
		
			
		return flag;
	}*/


 

}
