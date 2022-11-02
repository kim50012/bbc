package com.waremec.framework.utilities;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.waremec.framework.service.CommonService;
import com.waremec.weixin.domain.user.SessionMember;


public class LabelUtil {
	
	private static final Log log = LogFactory.getLog(LabelUtil.class);	

	public static final String LABEL_CN = "LABEL_CN";
	public static final String LABEL_EN = "LABEL_EN";
	public static final String LABEL_KO = "LABEL_KO";

	public static final String LABEL_BBC_CN = "LABEL_BBC_CN";
	public static final String LABEL_BBC_EN = "LABEL_BBC_EN";
	public static final String LABEL_BBC_KO = "LABEL_BBC_KO";
	
	private static final String ZH_CN= "zh-CN";
	private static final String KO_KR= "ko-KR";
	private static final String EN_US= "en-US";
	
	private static final String[] AVAILABLE_LANGUAGES = { ZH_CN, KO_KR, EN_US };

	protected Map<String, Object> session;
	
	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getLabelMap(ServletContext servletContext){

 		//log.info("########## getLabelMap ##############");
		
		String language = getCurrentLanguage();
		Map<String,String> labelMap;
		if(language.equals(KO_KR)){
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_KO);
		}else if(language.equals(EN_US)){
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_EN);
		}else{
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_CN);
		}
		
		if(labelMap == null){
			labelMap = new HashMap<String,String>();
		}
		
		return labelMap;
	}

	
	@SuppressWarnings("unchecked")
	public static Map<String,String> getLabelBbcMap(ServletContext servletContext){
		String language = getCurrentLanguage();
		String ssLanguage = "";
		Map<String,String> labelMap;

		HttpServletRequest request = ServletActionContext.getRequest();
		SessionMember sessionMember = (SessionMember) request.getSession().getAttribute(SessionUtils.SESSION_MEMEBER);

		if(sessionMember != null){
			ssLanguage = sessionMember.getLang();
			if (!language.equals(ssLanguage)) {
				if (ssLanguage != null) {
					language = ssLanguage;
				}
			}
		}
		
		if(language.equals(KO_KR)){
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_BBC_KO);
		}else if(language.equals(EN_US)){
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_BBC_EN);
		}else if(language.equals(ZH_CN)){
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_BBC_CN);
		}else{
			labelMap =  (Map<String,String>)servletContext.getAttribute(LABEL_BBC_CN);
		}
		
		if(labelMap == null){
			labelMap = new HashMap<String,String>();
		}
		
		return labelMap;
	}
	
	public static void reloadLabel(ServletContext servletContext){
		
// 		log.info("########## reloadLabel start ##############");
//		System.out.println("########## reloadLabel start ##############");
		
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		
		CommonService commonService = (CommonService) context.getBean("commonService");

		List<Map<String, Object>> labelList = commonService.selectList("Label.GET_ALL_LABEL",new HashMap<String,Object>());
		
		Map<String, String> cnLabel = new HashMap<String, String>();
		Map<String, String> koLabel = new HashMap<String, String>();
		Map<String, String> enLabel = new HashMap<String, String>();
		try {
			for (Map<String, Object> map : labelList) {
			cnLabel.put((String)map.get("LABEL_ID"), (String)map.get("LABEL_NM_CN"));
			koLabel.put((String)map.get("LABEL_ID"), (String)map.get("LABEL_NM_KO"));
			enLabel.put((String)map.get("LABEL_ID"), (String)map.get("LABEL_NM_EN"));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		synchronized (servletContext) {
			servletContext.setAttribute("LABEL_CN", cnLabel);
			servletContext.setAttribute("LABEL_KO", koLabel);
			servletContext.setAttribute("LABEL_EN", enLabel);
		}
		

		List<Map<String, Object>> labelListBbc = commonService.selectList("Label.GET_ALL_LABEL_BBC",new HashMap<String,Object>());
		
		Map<String, String> cnLabelBbc = new HashMap<String, String>();
		Map<String, String> koLabelBbc = new HashMap<String, String>();
		Map<String, String> enLabelBbc = new HashMap<String, String>();
		try {
			for (Map<String, Object> map : labelListBbc) {
			cnLabelBbc.put((String)map.get("LABEL_ID"), (String)map.get("LABEL_NM_CN"));
			koLabelBbc.put((String)map.get("LABEL_ID"), (String)map.get("LABEL_NM_KO"));
			enLabelBbc.put((String)map.get("LABEL_ID"), (String)map.get("LABEL_NM_EN"));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		synchronized (servletContext) {
			servletContext.setAttribute("LABEL_BBC_CN", cnLabelBbc);
			servletContext.setAttribute("LABEL_BBC_KO", koLabelBbc);
			servletContext.setAttribute("LABEL_BBC_EN", enLabelBbc);
		}
		
// 		log.info("########## reloadLabel end ##############");
//		System.out.println("########## reloadLabel end ##############");
	 
	}
	
	public static String getCurrentSortLanguage() {
		try {
			String lang = getCurrentLanguage().substring(0,2).toUpperCase();
			return  "ZH".equals(lang) ? "CN" : lang;
		} catch (Exception e) {
			return "CN";
		}
	}
	
	public static String getCurrentLanguage() {
		
		String language = CookieUtil.getCookieValue(CookieUtil.COOKIE_CURRENT_LANGUAGE);

 		//log.info("########## getCurrentLanguage language ############## --> " + language);

		if(StringUtil.isEmpty(language)){
			language = getBrowserLanguage();
		}
		
		String requestLanguage = RequestUtil.getRequestLanguage();
		if(isAvailableLanguage(requestLanguage)){
			language = requestLanguage;
		}else{
			if(!isAvailableLanguage(language)){
				language = ZH_CN;
			}
		}

 		//log.info("########## getCurrentLanguage return language ############## --> " + language);
		
		return language;
		
	}
	
	public static void setLanguage(String language){
		CookieUtil.setCookie(CookieUtil.COOKIE_CURRENT_LANGUAGE, language, 7 ,DateType.ByDate);
	}
	
	private static boolean isAvailableLanguage(String language) {
		boolean returns = false;
		for (String item : AVAILABLE_LANGUAGES) {
			if (item.equalsIgnoreCase(language)) {
				returns = true;
				break;
			}
		}
		return returns;
	}
	
	
	private static String getBrowserLanguage() {
		String language = ZH_CN;
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			language = request.getLocale().toString();
		} catch (Exception e) {
			language = ZH_CN;
		}

		if (StringUtil.isEmpty(language)) {
			language = ZH_CN;
		}
		return language;
	}
 
}

