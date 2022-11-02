package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.expression.spel.ast.OpNE;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("webzineAction")
@Scope(ScopeType.prototype)
public class WebzineAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String shopId;
	private String webzinePageId;
	private String skinType;
	private String pageId;
	private String openId = "";
	private Integer custSysId;

	@Resource
	protected MainService mainService;
	
	
	 public String webad(){
		 Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.clear();
			searchMap.put("SHOP_ID", getBackSessionShopId().toString());
			searchMap.put("PAGE_ID", pageId); 	//page id
			searchMap.put("PAGE_TYPE", null);			//5 : webzine
			searchMap.put("SKIN_TYPE", "1");			//1 : default
			searchMap.put("TMPL_NO", null);
			List<Map<String, Object>> webzineMap = commonService.selectList("Main.getTemplate01List", searchMap);
			request.put("webzineMap", webzineMap);

			request.put("pageId", pageId);
			
//			ListUtil.printListMap(webzineMap);
			return "webad";
	 }
	 public String webzine() {
		
		Map<String,Object> searchMap=new HashMap<String, Object>();
		if(shopId==""){
			shopId=getBackSessionShopId().toString();
		}
		searchMap.clear();
		searchMap.put("SHOP_ID",shopId );
		searchMap.put("PAGE_ID", webzinePageId); 	//page id
		searchMap.put("PAGE_TYPE", null);			//5 : webzine
		searchMap.put("SKIN_TYPE", "1");			//1 : default
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> webzineMap = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("webzineMap", webzineMap);
		
		request.put("webzinePageId", webzinePageId);
		
//		ListUtil.printListMap(webzineMap);
		
		return "webzine";
	}
	 public String webzinePreview(){
		 Integer displayId=null;
			Integer pageId = IntegerUtils.valueOf(getRequest().getParameter("pageId"));
			Map<String,Object> paramsMap = new HashMap<String,Object>();
			paramsMap.put("SHOP_ID", getBackSessionShopId());
			paramsMap.put("DISPLAY_ID", displayId);
			paramsMap.put("PAGE_ID", pageId);
			paramsMap.put("USER_ID", getBackSessionUserId());
			Map<String,Object> pageHeaderAndItem = commonService.select("Template.DYNAMIC_PAGE_HEADER_MODIFY_SELECT" , paramsMap);
			paramsMap.clear();
			paramsMap.put("SHOP_ID", getBackSessionShopId());
			paramsMap.put("DISPLAY_ID", displayId);
			paramsMap.put("PAGE_ID",pageId);
			paramsMap.put("ITEM_ID", pageHeaderAndItem.get("ITEM_ID"));
			paramsMap.put("USER_ID", getBackSessionUserId());
			List<Map<String,Object>> pageDtls = commonService.selectList("Template.DYNAMIC_PAGE_DTL_MODIFY_SELECT" , paramsMap);
			request.put("list", pageDtls);
		 return "webzinePreview";
	 }
	 public String webPage() {
		jsSdkStting();
		Map<String,Object> searchMap=new HashMap<String, Object>();
		if(getBackSessionShopId()==null){
			searchMap.put("SHOP_ID",shopId);
		}else{
			searchMap.put("SHOP_ID", getBackSessionShopId().toString());
		}
		//分类
		List<Map<String, Object>> classList = commonService.selectList("Main.getShopClassGrade1List",searchMap);
		request.put("classList", classList);
		//品牌
		List<Map<String, Object>> brandList = commonService.selectList("Main.getBrandList",searchMap);
		request.put("brandList", brandList);

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		if(sessionSkin == null){
			sessionSkin = mainService.getSessionSkinByShopId(Integer.valueOf(shopId));
			session.put(SessionUtils.SESSION_SKIN, sessionSkin);
		}	
		skinType = sessionSkin.getSkinTypeShop().toString();

		searchMap.clear();
		if(getBackSessionShopId()==null){
			searchMap.put("SHOP_ID",shopId);
		}else{
			searchMap.put("SHOP_ID", getBackSessionShopId().toString());
		}
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", "4");
		searchMap.put("SKIN_TYPE", skinType);
		searchMap.put("TMPL_NO", null);
		List<Map<String, Object>> userDefinePageData = commonService.selectList("Main.getTemplate01List", searchMap);
		request.put("userDefinePageData", userDefinePageData);
		
		//insert read cnt
		
		SessionMember sessionMember = getSessionMember();
		if(sessionMember != null){
			custSysId = sessionMember.getCustSysId();
		}else{
			custSysId =0;
		}
		if(getSessionOpenid() != null){
			openId = getSessionOpenid();
		}
		Map<String,Object> paramMap= new HashMap<String, Object>();
		paramMap.put("PAGE_ID", pageId);
		paramMap.put("CUST_SYS_ID", custSysId);
		paramMap.put("FLAG", "READ");
		paramMap.put("OPEN_ID", openId);
		try {
			commonService.select("Magazine.webzineLikeInsert",paramMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//查询阅读书和喜欢数
		Map<String, Object> resultMap=commonService.select("Magazine.webzineLikeSelect",paramMap);
		request.put("result", resultMap);
		
//		ListUtil.printListMap(classList);
//		ListUtil.printListMap(brandList);
//		ListUtil.printListMap(userDefinePageData);
		
		String strReturn = "webPage";

		if ((skinType.equals("1")) || (skinType.equals("2"))) {		//skin type 1 or 2
			strReturn = "webPage";
		}
		else if ((skinType.equals("3")) || (skinType.equals("4"))) {		//skin type 3 or 4
			strReturn = "webPage2";
		}
		else if ((skinType.equals("5")) || (skinType.equals("6"))) {		//skin type 5 or 6
			strReturn = "webPage3";
		}
		else if ((skinType.equals("7")) || (skinType.equals("8"))) {		//skin type 7 or 8
			strReturn = "webPage4";
		} 
		else {
			strReturn = "webPage5";
		}
		request.put("pageId",pageId );
		return strReturn;
		
	 }
	 
	 public String like(){
		 SessionMember sessionMember = getSessionMember();
		 if(sessionMember != null){
			 custSysId = sessionMember.getCustSysId();
		 }else{
			 custSysId =0;
		 }
		 if(getSessionOpenid() != null){
			openId = getSessionOpenid();
		 }
		 Map<String,Object> paramMap= new HashMap<String, Object>();
		 paramMap.put("PAGE_ID", pageId);
		 paramMap.put("CUST_SYS_ID", custSysId);
		 paramMap.put("FLAG", "LIKE");
		 paramMap.put("OPEN_ID", openId);
		 commonService.select("Magazine.webzineLikeInsert",paramMap);
		 Map<String, Object> resultMap=commonService.select("Magazine.webzineLikeSelect",paramMap);
		 renderJSON(resultMap);
		 return NONE;
		 
	 }
	 
	
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getWebzinePageId() {
		return webzinePageId;
	}

	public void setWebzinePageId(String webzinePageId) {
		this.webzinePageId = webzinePageId;
	}

	public String getSkinType() {
		return skinType;
	}

	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}
	public Integer getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(Integer custSysId) {
		this.custSysId = custSysId;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}

	
}
