package com.waremec.wxi.thread;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.domain.msg.Article;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.weixin.utils.WeixinMessageUtils;

public class WxInterfaceWarningThread implements Runnable{

	private String openid;
	private WeixinService weixinService;
	private List<Article> ars_Msg;
	private ServletContext context;
	private AppInfo appInfo;
	public WxInterfaceWarningThread(HttpServletRequest request, WeixinService weixinService,
		   String openid,List<Article> ars_Msg,AppInfo appInfo,ServletContext context) {
		//this.request = request;
		this.openid = openid;
		this.weixinService = weixinService;
		this.ars_Msg = ars_Msg;
		this.appInfo = appInfo;
		this.context = context;
	}

	
	@Override
	public void run() {
		String token = weixinService.getAccessToken(appInfo); 
		 
		System.out.println(ars_Msg.get(0).getTitle());
		WeixinMessageUtils.sendTextMsg(token, openid, ars_Msg.get(0).getTitle());
		 
	}

}
