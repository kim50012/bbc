/**   
 * @Title: SendMsgThread.java 
 * @Package com.waremec.weixin.thread 
 * @Description:  
 * @author taebem
 * @date 2015年8月27日 上午10:02:08 
 * @version V1.0   
 */
package com.waremec.wxi.thread;

import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.domain.msg.Article;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.weixin.utils.WeixinMessageUtils;

/**
 * @Package com.waremec.wxi.thread
 * @FileName SendMsgThread
 * @Description
 * @author taebem
 * @date 2015年8月27日 上午10:02:08
 * 
 */
public class WxiSendMsgThread implements Runnable {

	Map<String, String> requestMap;
	private WeixinService weixinService;
	private List<Article> ars_Msg;
	private ServletContext context;
	private AppInfo appInfo;
	public WxiSendMsgThread(HttpServletRequest request, WeixinService weixinService,
		   Map<String, String> requestMap,List<Article> ars_Msg,AppInfo appInfo,ServletContext context) {
		//this.request = request;
		this.requestMap = requestMap;
		this.weixinService = weixinService;
		this.ars_Msg = ars_Msg;
		this.appInfo = appInfo;
		this.context = context;
	}

	private boolean whetherMakeOauth2Url(AppInfo appInfo, String url){
		if (StringUtils.isNotBlank(url) && (url.startsWith("/") || url.startsWith(appInfo.getDomain()) && !url.endsWith(".html")) ) {
			return true;
		}
		return false;
	}
	/*
	 * (非 Javadoc) <p>Title: run</p> <p>Description: </p>
	 * 
	 * @see java.lang.Runnable#run()
	 */
	@Override
	public void run() {
		String fromUserName = requestMap.get("FromUserName");
	  //WareMecSNSDemo 多客服测试
		System.out.println(ars_Msg.size());
		String token = weixinService.getAccessToken(appInfo); 
		if(ars_Msg.size()>= 1 && !ars_Msg.get(0).getUrl().isEmpty()){
			
			if (whetherMakeOauth2Url(appInfo, ars_Msg.get(0).getUrl().toString())) {
				String url = Oauth2Utils.getNormalLinkUrl(appInfo, ars_Msg.get(0).getUrl().toString());
				ars_Msg.get(0).setUrl(url);
			} 
			WeixinMessageUtils.sendNewsMsg(token,
					fromUserName, ars_Msg);
		}else if(ars_Msg.get(0).getPicurl().isEmpty() || "".equals(ars_Msg.get(0).getPicurl())){
			System.out.println(ars_Msg.get(0).getTitle());
			WeixinMessageUtils.sendTextMsg(token, fromUserName, ars_Msg.get(0).getTitle());
		}else{
			System.out.println("--------");
			System.out.println(ars_Msg.get(0).getPicurl());
			System.out.println("--------");
			String fileUrl = context.getRealPath(ars_Msg.get(0).getPicurl());
			MediaReturn result = WeixinMediaUtils.uploadMedia(token, "image", fileUrl);
			String mediaId = result.getMedia_id();
			WeixinMessageUtils.sendImageMsg(token, fromUserName, mediaId);
 		}
  	}
 }
