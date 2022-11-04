package com.waremec.wpt.front.action;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.baidu.translate.TransApi;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.template.DataItem;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.thread.QRCodeEventThread;
import com.waremec.weixin.utils.EncryptUtils;
import com.waremec.wpt.admin.domain.AdminMyIncome;
import com.waremec.wpt.admin.domain.AdminOrders;
import com.waremec.wpt.front.domain.BbcAtrClbBbd;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.BbcService;
import com.waremec.wpt.front.thread.SendMsgBadMatchThread;
import com.waremec.wpt.front.thread.SendMsgThread;

import net.sf.json.JSONObject;

import com.waremec.framework.utilities.LabelUtil;

@Controller("badMatchAction")
@Scope(ScopeType.prototype)
public class BadMatchAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;
	private static final String DEFAUT_COLOR = "#173177";
	private static final String RED_COLOR = "#df1414";
	private static final String BLUE_COLOR = "#2714df";
	
	private String shopId;
	private String strJobtype;
	private String strLngdv;
	private String pageName;
	
	private String para1;
	private String para2;
	private String para3;
	private String para4;
	private String para5;
	private String para6;
	private String para7;
	private String para8;
	private String para9;
	private String para10;
	private String para11;
	private String para12;
	private String para13;
	private String para14;
	private String para15;
	private String para16;
	private String para17;
	private String para18;
	private String para19;
	private String para20;

	
	

	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getStrJobtype() {
		return strJobtype;
	}
	public void setStrJobtype(String strJobtype) {
		this.strJobtype = strJobtype;
	}
	public String getStrLngdv() {
		return strLngdv;
	}
	public void setStrLngdv(String strLngdv) {
		this.strLngdv = strLngdv;
	}
	public String getPageName() {
		return pageName;
	}
	public void setPageName(String pageName) {
		this.pageName = pageName;
	}
	public String getPara1() {
		return para1;
	}
	public void setPara1(String para1) {
		this.para1 = para1;
	}
	public String getPara2() {
		return para2;
	}
	public void setPara2(String para2) {
		this.para2 = para2;
	}
	public String getPara3() {
		return para3;
	}
	public void setPara3(String para3) {
		this.para3 = para3;
	}
	public String getPara4() {
		return para4;
	}
	public void setPara4(String para4) {
		this.para4 = para4;
	}
	public String getPara5() {
		return para5;
	}
	public void setPara5(String para5) {
		this.para5 = para5;
	}
	public String getPara6() {
		return para6;
	}
	public void setPara6(String para6) {
		this.para6 = para6;
	}
	public String getPara7() {
		return para7;
	}
	public void setPara7(String para7) {
		this.para7 = para7;
	}
	public String getPara8() {
		return para8;
	}
	public void setPara8(String para8) {
		this.para8 = para8;
	}
	public String getPara9() {
		return para9;
	}
	public void setPara9(String para9) {
		this.para9 = para9;
	}
	public String getPara10() {
		return para10;
	}
	public void setPara10(String para10) {
		this.para10 = para10;
	}
	public String getPara11() {
		return para11;
	}
	public void setPara11(String para11) {
		this.para11 = para11;
	}
	public String getPara12() {
		return para12;
	}
	public void setPara12(String para12) {
		this.para12 = para12;
	}
	public String getPara13() {
		return para13;
	}
	public void setPara13(String para13) {
		this.para13 = para13;
	}
	public String getPara14() {
		return para14;
	}
	public void setPara14(String para14) {
		this.para14 = para14;
	}
	public String getPara15() {
		return para15;
	}
	public void setPara15(String para15) {
		this.para15 = para15;
	}
	public String getPara16() {
		return para16;
	}
	public void setPara16(String para16) {
		this.para16 = para16;
	}
	public String getPara17() {
		return para17;
	}
	public void setPara17(String para17) {
		this.para17 = para17;
	}
	public String getPara18() {
		return para18;
	}
	public void setPara18(String para18) {
		this.para18 = para18;
	}
	public String getPara19() {
		return para19;
	}
	public void setPara19(String para19) {
		this.para19 = para19;
	}
	public String getPara20() {
		return para20;
	}
	public void setPara20(String para20) {
		this.para20 = para20;
	}

	
	
	//---------------------------------------------------------------
	//---------------------------------------------------------------
	//---------------------------------------------------------------
	//---------------------------------------------------------------
	//---------------------------------------------------------------
	//---------------------------------------------------------------
	//---------------------------------------------------------------
	
	

	//---------------------------------------------------------------
	// getPage
	//---------------------------------------------------------------
	public String getPage(){

		try{
			//--------- Main Logic
			jsSdkSttingNormal();

			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				if ("page2".equals(pageName)) {
					loginMbrSq = 0;
					strLngdv = "ko-KR";
					request.put("strLngdv", strLngdv);
				}
				else {				
					String goUrl = getFullUrl();
					goUrl = URLEncoder.encode(goUrl, "utf-8");
					request.put("goUrl", goUrl);
					return "timeout";
				}
			}
			else {
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("P1", "BADMATCH_SELECT_USER");
			searchMap.put("P2", loginMbrSq);
			searchMap.put("P3", para3);
			Map<String, Object> userInfo = commonService.select("Bbc.sqlAMS_BADMATCH_PROCEDURE",searchMap);
			request.put("userInfo", userInfo);
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("para1", para1);
			request.put("para2", para2);
			request.put("para3", para3);
			request.put("para4", para4);
			request.put("para5", para5);
			request.put("para6", para6);
			request.put("para7", para7);
			request.put("para8", para8);
			request.put("para9", para9);
			request.put("para10", para10);
			request.put("para11", para11);
			request.put("para12", para12);
			request.put("para13", para13);
			request.put("para14", para14);
			request.put("para15", para15);
			request.put("para16", para16);
			request.put("para17", para17);
			request.put("para18", para18);
			request.put("para19", para19);
			request.put("para20", para20);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return pageName;
	}
	
	//---------------------------------------------------------------
	// getData
	//---------------------------------------------------------------
	public String getData(){

		String ret = "fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			ret="fail";
//			request.put("strLngdv", "zh-CN");
//			return NONE;
			strLngdv = "ko-KR";
			request.put("strLngdv", strLngdv);
		}
		else {
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("P1", para1);
			searchMap.put("P2", para2);
			searchMap.put("P3", para3);
			searchMap.put("P4", para4);
			searchMap.put("P5", para5);
			searchMap.put("P6", para6);
			searchMap.put("P7", para7);
			searchMap.put("P8", para8);
			searchMap.put("P9", para9);
			searchMap.put("P10", para10);
			searchMap.put("P11", para11);
			searchMap.put("P12", para12);
			searchMap.put("P13", para13);
			searchMap.put("P14", para14);
			searchMap.put("P15", para15);
			searchMap.put("P16", para16);
			searchMap.put("P17", para17);
			searchMap.put("P18", para18);
			searchMap.put("P19", para19);
			searchMap.put("P20", para20);
			List<Map<String, Object>> pageData = commonService.selectList("Bbc.sqlAMS_BADMATCH_PROCEDURE", searchMap);
			renderJSON(pageData);
			
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
		}		
		
		return NONE;
	}


	//---------------------------------------------------------------
	// sendMsg
	//---------------------------------------------------------------
	public String sendMsg(){

		String ret = "FAIL";
		
		try{
			

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				Map<String, Object> returnMap = new HashMap<String, Object>();
				returnMap.put("ret", ret);
				renderJSON(returnMap);
				return NONE;
			}
			else {
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}			
			
			String openId1 = para1;
			String openId2 = para2;
			String openId3 = para3;
			String openId4 = para4;
			String first = para5;
			String keyword1A1 = para6 +", " + para7 + " vs " + para8 + ", " + para9;
			String keyword3 = para10;
			String remark1 = para11;

			int shopid = 68;

	    	AppInfo appInfo = weixinService.selectAppInfoByShopId(shopid);

			if (!openId1.isEmpty()) {
				try {
			    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId1, first, keyword1A1, para12, keyword3, remark1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Error e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!openId2.isEmpty()) {
				try {
			    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId2, first, keyword1A1, para12, keyword3, remark1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Error e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!openId3.isEmpty()) {
				try {
			    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId3, first, keyword1A1, para12, keyword3, remark1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Error e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (!openId4.isEmpty()) {
				try {
			    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId4, first, keyword1A1, para12, keyword3, remark1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Error e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			ret = "SUCCESS";
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
			
		}catch(Exception e){
			//e.printStackTrace();
			logger.info("##### Exception==>" +  e.getMessage());
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
		}
	
		return NONE;
	}
	

	//---------------------------------------------------------------
	// sendMsg
	//---------------------------------------------------------------
	public String sendMsgByMap(){
	
	
		try{
			
			String templateId = para8;
			String openid = para9;
			String linkUrl = para10;
			
			Map<String, DataItem> data = new HashMap<String, DataItem>();
			if (para1 != null) data.put(para1, new DataItem(para11, DEFAUT_COLOR));
			if (para2 != null) data.put(para2, new DataItem(para12, DEFAUT_COLOR));
			if (para3 != null) data.put(para3, new DataItem(para13, DEFAUT_COLOR));
			if (para4 != null) data.put(para4, new DataItem(para14, DEFAUT_COLOR));
			if (para5 != null) data.put(para5, new DataItem(para15, DEFAUT_COLOR));
			if (para6 != null) data.put(para6, new DataItem(para16, DEFAUT_COLOR));
			if (para7 != null) data.put(para7, new DataItem(para17, DEFAUT_COLOR));
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(68);
			try {
				weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openid, data, linkUrl);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}catch (Error e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
		}catch(Exception e){
			//e.printStackTrace();
			logger.info("##### Exception==>" +  e.getMessage());
		}
	
		return NONE;
	}
	

	//---------------------------------------------------------------
	// sendMsg
	//---------------------------------------------------------------
	public String sendMultiMsg(){
	
	
		try{

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				Map<String, Object> returnMap = new HashMap<String, Object>();
				returnMap.put("ret", "FAIL");
				renderJSON(returnMap);
				return NONE;
			}
			else {
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}			
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("P1", "BADMATCH_SEND_MULTI_MSG_TARGET_USER");
			searchMap.put("P2", para2);
			searchMap.put("P3", para3);		// MSG TYPE
			searchMap.put("P4", para4);
			searchMap.put("P5", para5);
			searchMap.put("P6", para6);
			searchMap.put("P7", para7);
			searchMap.put("P8", para8);
			searchMap.put("P9", para9);
			searchMap.put("P10", para10);
			searchMap.put("P11", para11);
			searchMap.put("P12", para12);
			searchMap.put("P13", para13);
			searchMap.put("P14", para14);
			searchMap.put("P15", para15);
			searchMap.put("P16", para16);
			searchMap.put("P17", para17);
			searchMap.put("P18", para18);
			searchMap.put("P19", para19);
			searchMap.put("P20", para20);
			List<Map<String, Object>> userList = commonService.selectList("Bbc.sqlAMS_BADMATCH_PROCEDURE", searchMap);
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());

			try {
				Thread thread = new Thread(new SendMsgBadMatchThread(weixinService, weixinTemplateMessageService, appInfo, userList, para2));
				thread.start();
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("thread0000000000:" + e.getMessage());
			}
			
			
		}catch(Exception e){
			//e.printStackTrace();
			logger.info("##### Exception==>" +  e.getMessage());
		}
	
		return NONE;
	}
	

	
	//---------------------------------------------------------------
	// userInsert
	//---------------------------------------------------------------
	public String userInsert(){

		String ret = "fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
//			ret="fail";
//			request.put("strLngdv", "zh-CN");
//			return NONE;
			strLngdv = "ko-KR";
			request.put("strLngdv", strLngdv);
		}
		else {
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("P1", para1);
			searchMap.put("P2", para2);
			searchMap.put("P3", para3);
			searchMap.put("P4", para4);
			searchMap.put("P5", para5);
			searchMap.put("P6", para6);
			searchMap.put("P7", para7);
			searchMap.put("P8", para8);
			searchMap.put("P9", para9);
			searchMap.put("P10", para10);
			searchMap.put("P11", para11);
			searchMap.put("P12", para12);
			searchMap.put("P13", para13);
			searchMap.put("P14", para14);
			searchMap.put("P15", para15);
			searchMap.put("P16", para16);
			searchMap.put("P17", para17);
			searchMap.put("P18", para18);
			searchMap.put("P19", para19);
			searchMap.put("P20", para20);
			List<Map<String, Object>> pageData = commonService.selectList("Bbc.sqlAMS_BADMATCH_PROCEDURE", searchMap);
			renderJSON(pageData);
			
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
		}		
		
		return NONE;
	}	
	
}
