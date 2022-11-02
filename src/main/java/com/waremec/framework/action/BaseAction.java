package com.waremec.framework.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.opensymphony.xwork2.ActionSupport;
import com.waremec.framework.service.CommonService;
import com.waremec.framework.utilities.JsonUtil;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.front.domain.SessionSkin;


public class BaseAction extends ActionSupport implements RequestAware,
		SessionAware, ApplicationAware {

	private static final long serialVersionUID = 1L;

	protected final transient Log logger = LogFactory.getLog(super.getClass());

	public static final String INDEX = "index";
	public static final String FAILURE = "failure";
	public static final String CONFIRM = "confirm";
	public static final String CANCEL = "cancel";
	public static final String ADD_SUCCESS = "add_success";
	public static final String EDIT_SUCCESS = "edit_success";
	public static final String FORWARD_SUCCESS = "forward_success";
	public static final String REMOVE_SUCCESS = "remove_success";
	public static final String GET_SUCCESS = "get_success";
	public static final String LIST_SUCCESS = "success";
	public static final String QUERY_SUCCESS = "query_success";
	public static final String AJAX_SUCCESS = "ajax_success";
	public static final String AJAX_ERROR = "ajax_error";
	public static final String ADMIN_SESSOIN_NEED = "adminSessionNeed";

	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;

	protected String errorMsg;
	protected int pageNo;
	protected int pageSize;
	protected int pageCurr = 1;
	protected int pageUnit = 10;
	
	@Autowired
	@Qualifier("commonService")
	protected CommonService commonService;
	
	
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}

	public HttpSession getSession() {
		return getRequest().getSession();
	}

	public HttpSession getSession(boolean flag) {
		return getRequest().getSession(flag);
	}

	public ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	public String getRealyPath(String path) {
		return getServletContext().getRealPath(path);
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public int getPageNo() {
		if (this.pageNo <= 0)
			this.pageNo = 1;
		return this.pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		if (this.pageSize <= 0)
			this.pageSize = 10;
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	protected String getCurrentLanguage(){
		return LabelUtil.getCurrentLanguage();
	}
	
	protected String getCurrentSortLanguage(){
		return LabelUtil.getCurrentSortLanguage();
	}
	
	protected void render(String text, String contentType) {
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType(contentType);
			response.getWriter().write(text);
		} catch (IOException e) {
			this.logger.error(e.getMessage(), e);
		}
	}

	protected void renderText(String text) {
		render(text, "text/plain;charset=UTF-8");
	}

	protected void renderHtml(String html) {
		render(html, "text/html;charset=UTF-8");
	}

	protected void renderXML(String xml) {
		render(xml, "text/xml;charset=UTF-8");
	}
	
	protected void renderJSON(Object value) {
		if(value == null){
			render("{}", "application/json;charset=UTF-8");
		}else{
			String json = JsonUtil.getJsonString(value);
			render(json, "application/json;charset=UTF-8");
		}
	}
	

	protected void renderJSON(String value) {
		if(value == null){
			render("{}", "application/json;charset=UTF-8");
		}else{
			render(value, "application/json;charset=UTF-8");
		}
	}

	@SuppressWarnings("rawtypes")
	protected void renderJSON(List value) {
		if(value == null){
			render("{}", "application/json;charset=UTF-8");
		}else{
			String json = JsonUtil.getJsonString(value);
			render(json, "application/json;charset=UTF-8");
		}
	}

	@SuppressWarnings("rawtypes")
	protected void renderNoTitleJSON(List value) {
		if(value == null){
			render("{}", "application/json;charset=UTF-8");
		}else{
			String json = JsonUtil.getNoTitleJsonString(value);
			render(json, "application/json;charset=UTF-8");
		}
	}
	
	@SuppressWarnings("rawtypes")
	public void OutputJSON(List value) {
		String responseData = JsonUtil.toJSONString(value);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json; charset=UTF-8;");
		response.setBufferSize(8192000);
		try {
			if (value == null) {
				response.getWriter().print("{}");
			} else {
				response.getWriter().print(responseData);
			}
		} catch (IOException e) {
		}
	}
	
	protected String getSessionOpenid(){
		String openid = "";
		SessionMember sessionMember = getSessionMember();
		if(sessionMember != null){
			openid = sessionMember.getOpenid();
		}else{
			openid = (String) session.get(SessionUtils.SESSION_OPENID);
		}
		return openid;
	}
	
	
	protected Integer getBackSessionShopId(){
		/**
		 * 原先这个获取shopId的方法报错
		 */
//		String shopId = (String) session.get(SessionUtils.BACK_SHOP_ID_SESSION);
		String shopId = String.valueOf(session.get(SessionUtils.BACK_SHOP_ID_SESSION));
		if(!StringUtils.isBlank(shopId) && shopId != "null" && shopId != "NULL"){
		  return Integer.parseInt(shopId);
		}
		return null;
	}
	
	protected AdminUser getBackSessionUser(){
		AdminUser adminUser =(AdminUser) session.get(SessionUtils.BACK_USER_SESSION);
		return adminUser;
		
	}

	protected AdminShop getBackSessionShopInfo(){
		AdminShop shopInfo =(AdminShop) session.get(SessionUtils.BACK_SHOPINFO_SESSION);
		if(shopInfo != null){
			return shopInfo;
		}else{
			return null;
		}
	}
	
	protected String getBackSessionUserId(){
		AdminUser adminUser =getBackSessionUser();
		if(adminUser != null){
			return adminUser.getUserId();
		}else{
			return null;
		}
		
	}
	
	protected SessionMember getSessionMember(){
		 
		SessionMember  sessionMember = null;
		try {
			sessionMember = (SessionMember)session.get(SessionUtils.SESSION_MEMEBER);
			/*if(sessionMember == null){
				SessionSkin sessionSkin = (SessionSkin)session.get(SessionUtils.SESSION_MEMEBER);
				if(sessionSkin != null){
					Integer shopId = sessionSkin.getShopId();
					
					WeixinService weixinService = ApplicationContextUtils.getBean(WeixinService.class);
					AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
					
					//TODO 构造获取openid的URL 并跳转，  待开发
					 
					
				}else{
					
				}
			}*/
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sessionMember;
	}
	
	protected SessionSkin getSessionSkin(){
		 
		SessionSkin  frontSkin = null;
		try {
			frontSkin = (SessionSkin)session.get(SessionUtils.SESSION_SKIN);
		} catch (Exception e) {
			// TODO: handle exception
			frontSkin = new SessionSkin();
			frontSkin.setSkinTypeShop(3);
		}
		return frontSkin;
	}
	
	protected Integer getFrontSessionShopId(){
		SessionSkin skin = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		if(skin != null){
		  return skin.getShopId();
		}
		return null;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	
	

	public String getBasePath(){
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		int serverPort =  request.getServerPort();
		String basePath = "";
		if(80 == serverPort){
			basePath = request.getScheme() + "://" + request.getServerName() + path + "/" ;
		}else{
			basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		}
		
		return basePath;
	}
	
	
	public String getFullUrl(){
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		int serverPort =  request.getServerPort();
		String basePath = "";
		if(80 == serverPort){
			basePath = request.getScheme() + "://" + request.getServerName() + path ;
		}else{
			basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path ;
		}
		
		String url =  basePath + request.getRequestURI();
 
		if(StringUtils.isNotEmpty(request.getQueryString())){
			url += "?" + request.getQueryString();
		} 
		
		return url;
	}
	
	protected String getLabel(String key){
		Map<String,String> label = LabelUtil.getLabelMap(getServletContext());	
		String val = label.get(key);
		if(StringUtils.isBlank(val)){
			val = key;
		}
		return val;
	}
	

}
