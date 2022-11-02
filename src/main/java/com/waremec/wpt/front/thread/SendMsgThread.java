package com.waremec.wpt.front.thread;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.waremec.weixin.domain.template.DataItem;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.PropertiesUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.weixin.utils.WeixinMessageUtils;

public class SendMsgThread  implements Runnable{
private final transient Log logger = LogFactory.getLog(this.getClass());

	private static final String DEFAUT_COLOR = "#173177";
	private static final String RED_COLOR = "#df1414";
	private static final String BLUE_COLOR = "#2714df";
	
	private HttpServletRequest request;
	
	private WeixinService weixinService;
	private WeixinTemplateMessageService weixinTemplateMessageService;
	
	private AppInfo appInfo;
	List<Map<String, Object>> followUserList;
	private String strExcsq;
	
	
	
	public SendMsgThread(WeixinService weixinService, WeixinTemplateMessageService weixinTemplateMessageService, AppInfo appInfo, List<Map<String, Object>> followUserList, String strExcsq) {
		this.weixinService = weixinService;
		this.weixinTemplateMessageService = weixinTemplateMessageService;
		this.appInfo = appInfo;
		this.followUserList = followUserList;
		this.strExcsq = strExcsq;
	}

	@Override
	public void run() {
		

		try {
			for(int i = 0; i < followUserList.size(); i++){
				String openid = followUserList.get(i).get("OPENID").toString();

				String first = followUserList.get(i).get("TITLE").toString();
				String keyword1 = followUserList.get(i).get("NIK_NM").toString();
				String strEXC_NM = followUserList.get(i).get("EXC_NM").toString();
				
				String strAttr[] = strEXC_NM.split("@@");

				String keyword2 = strAttr[0];
				String keyword3 = strAttr[1];
				String keyword4 = strAttr[2];
				
				String strCMT  = followUserList.get(i).get("CMT").toString();

				String strCMTAttr[] = strCMT.split("@@");
				
				String keyword5 = strCMTAttr[0];
				String remark = strCMTAttr[1];

				String templateId = "v6QtH2apmc9jF6S6N8K1cIEDRjR6WTgxI8KGzBMPzIw";	//报名成功通知
				
				Map<String, DataItem> data = new HashMap<String, DataItem>();
				data.put("first", new DataItem(first, DEFAUT_COLOR));
				data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
				data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
				data.put("keyword3", new DataItem(keyword3, BLUE_COLOR));
				data.put("keyword4", new DataItem(keyword4, RED_COLOR));
				data.put("keyword5", new DataItem(keyword5, DEFAUT_COLOR));
				data.put("remark", new DataItem(remark, DEFAUT_COLOR));					
				
				String linkUrl = "/front/bbc/exc/excJin.htm?intExcsq="+strExcsq;
				
				try {
					weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openid, data, linkUrl);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Error e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
				
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}
}
