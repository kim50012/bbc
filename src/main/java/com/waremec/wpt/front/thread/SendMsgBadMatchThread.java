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

public class SendMsgBadMatchThread  implements Runnable{
private final transient Log logger = LogFactory.getLog(this.getClass());

	private static final String DEFAUT_COLOR = "#173177";
	private static final String RED_COLOR = "#df1414";
	private static final String BLUE_COLOR = "#2714df";
	
	private HttpServletRequest request;
	
	private WeixinService weixinService;
	private WeixinTemplateMessageService weixinTemplateMessageService;
	
	private AppInfo appInfo;
	List<Map<String, Object>> followUserList;
	private String mchSq;
	
	
	
	public SendMsgBadMatchThread(WeixinService weixinService, WeixinTemplateMessageService weixinTemplateMessageService, AppInfo appInfo, List<Map<String, Object>> followUserList, String mchSq) {
		this.weixinService = weixinService;
		this.weixinTemplateMessageService = weixinTemplateMessageService;
		this.appInfo = appInfo;
		this.followUserList = followUserList;
		this.mchSq = mchSq;
	}

	@Override
	public void run() {
		

		try {
			for(int i = 0; i < followUserList.size(); i++){
				String openid = followUserList.get(i).get("OPENID").toString();
				String first = followUserList.get(i).get("FIRST").toString();		//제목
				String keyword1 = followUserList.get(i).get("KEYWORD1").toString();	//服务名称  예선, 본선
				String keyword2 = followUserList.get(i).get("KEYWORD2").toString();	//服务进度
				String keyword3 = followUserList.get(i).get("KEYWORD3").toString();	//服务人员
				String remark = followUserList.get(i).get("REMARK").toString();

				String templateId = "2w2pxtVJo1AhPn0MWeahtHpPC_SGbeYAV6MgyaFkQOE";	//服务状态提醒
				
				Map<String, DataItem> data = new HashMap<String, DataItem>();
				data.put("first", new DataItem(first, DEFAUT_COLOR));
				data.put("keyword1", new DataItem(keyword1, RED_COLOR));
				data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
				data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
				data.put("remark", new DataItem(remark, BLUE_COLOR));					
				
				String linkUrl = "/front/bbc/badMatch/getPage.htm?pageName=page15&para3="+mchSq;
				
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
