/**   
* @Title: AdminMenuAction.java 
* @Package com.waremec.wpt.admin.action 
* @Description:  
* @author taebem
* @date 2015年6月29日 下午1:58:23 
* @version V1.0   
*/
package com.waremec.wpt.admin.action;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.wpt.admin.common.domain.Combo;
import com.waremec.wpt.admin.common.service.ComboService;
import com.waremec.wpt.admin.service.MenuService;

/** 
 * @Package com.waremec.wpt.admin.action 
 * @FileName AdminMenuAction
 * @Description  
 * @author taebem 
 * @date 2015年6月29日 下午1:58:23 
 *  
 */

@Controller("adminMenuAction")
@Scope(ScopeType.prototype)
public class AdminMenuAction extends BaseAction{
	 
	private static final long serialVersionUID = 1L;
	
	private String parentMenuId="";
	private String firstMenuId="";
	private String secondMenuId="";
	private String thirdMenuId="";
	private String menuId="";
	private String status="";
	private String menuName="";
	private String menuNm="";
	private String menuUrl="";
	private String menuIcon="";
	private String menuLevel="";
	private String menuStatus="";
	private int firstLevelMenu;
	private int secondLevelMenu;
	private int thirdLevelMenu;
	private String firstLevelMenuName="";
	private String secondLevelMenuName="";
	private String thirdLevelMenuName="";
	private int firstLevelMenuNew;
	private int secondLevelMenuNew;
	private int thirdLevelMenuNew;
	private String firstLevelMenuNameNew="";
	private String secondLevelMenuNameNew="";
	private String thirdLevelMenuNameNew="";
	
	
	@Resource
	protected ComboService comboService;
	@Resource
	protected MenuService menuService;
	
	
	/**
	 * 查询菜单列表
	 * @return
	 * @throws Exception 
	 */
	public String menuList() throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		if(!(parentMenuId==""||parentMenuId.equals("")||parentMenuId==null)){
			map.put("MENU_PID", parentMenuId);
		}
		map.put("MENU_NM", URLDecoder.decode(menuNm, "UTF-8"));
		if(!(menuStatus.equals("")||menuStatus=="")){
			map.put("STATUS", menuStatus);
		}
		List<Map<String,Object>> menuList=commonService.selectList("AdminMenu.menuList",map);
		
		map.put("MENU_PID", 0);
		List<Map<String,Object>> parentMenuList=commonService.selectList("AdminMenu.menuList",map);
		
		PageData page = new PageData();
		if(!menuList.isEmpty()){
			int totalCount = (Integer)menuList.get(0).get("NUM");
			page = new PageData(pageCurr,pageUnit, totalCount , menuList);
		 
		}
		
		request.put("firstMenuId", firstMenuId);
		request.put("secondMenuId", secondMenuId);
		request.put("thirdMenuId", thirdMenuId);
		request.put("menuNm", menuNm);
		
		request.put("page", page);
		request.put("menuList", menuList);
		request.put("parentMenuList", parentMenuList);
		
		return "menuList";
	}
	
	public String menuListFragment() throws Exception{
		// 查询出模板列表
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pageCurr",pageCurr);
		map.put("pageUnit", pageUnit);
		if(!(parentMenuId==""||parentMenuId.equals("")||parentMenuId==null)){
			map.put("MENU_PID", parentMenuId);
		}
		map.put("MENU_NM", URLDecoder.decode(menuNm, "UTF-8"));
		if(!(menuStatus.equals("")||menuStatus=="")){
			map.put("STATUS", menuStatus);
		}
		
		List<Map<String,Object>> menuList=commonService.selectList("AdminMenu.menuList",map);
		
		if (!menuList.isEmpty()) {
			for (int i = 0; i < menuList.size(); i++) {
				MapUtil.convertClob2String(menuList.get(i));
			}
		}
		request.put("menuList", menuList);
		 
		PageData page = new PageData();
		if (!menuList.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(menuList.get(0).get("NUM"));
			page = new PageData(pageCurr,pageUnit, totalCount , menuList);
		}
		
		request.put("page", page);
		
		// t.setSubList(map);
		return "menuListFragment";
	}
	
	
	/**
	 * 查询菜单二级下拉框列表
	 * @return
	 */
	public String getChildMenuList(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pageCurr",1);
		map.put("pageUnit", 999);
		map.put("MENU_PID", parentMenuId);
		List<Map<String,Object>> childMenuList=commonService.selectList("AdminMenu.menuList",map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", childMenuList);
		renderJSON(returnMap);
		return NONE;
	}
	
	/**
	 * 修改菜单状态
	 * @return
	 */
	public String updateStatus(){
		//updateMenuMst
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("MENU_ID", menuId);
		map.put("ACTIVE_STS", status);
		map.put("FLG", "U");
		map=commonService.select("AdminMenu.updateMenuMst",map);
		map.put("result", map.get("OUT_ERR_MSG").toString());
		renderJSON(map);
		return NONE;
	}
	
	public String menuDetail(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("MENU_ID", menuId);
		map=commonService.select("AdminMenu.menuList",map);
		renderJSON(map);
		return NONE;
	}
	
	public String updateMenu(){
		Map<String,Object> map=new HashMap<String,Object>();
		if(!(menuId==""||menuId.equals(""))){
			map.put("MENU_ID", menuId);
		}
		
		map.put("MENU_PID", parentMenuId);
		map.put("MENU_NM", menuName);
		map.put("MENU_URL", menuUrl);
		map.put("MENU_ICON", menuIcon);
		map.put("MENU_LEVEL", menuLevel);
		map=commonService.select("AdminMenu.updateMenuMst",map);
		map.put("result", map.get("OUT_ERR_MSG").toString());
		renderJSON(map);
		return NONE;
	}
	

	public String modify(){
		//modifyMenuMst
		Map<String,Object> map=new HashMap<String,Object>();
		if(!(menuId==""||menuId.equals(""))){
			map.put("MENU_ID", menuId);
		}
		map.put("MENU_ID1", firstLevelMenu);
		if(!(firstLevelMenuName==""||firstLevelMenuName.equals(""))){
			map.put("MENU_NM1", firstLevelMenuName);
		}
		map.put("MENU_ID2", secondLevelMenu);
		if(!(secondLevelMenuName==""||secondLevelMenuName.equals(""))){
			map.put("MENU_NM2", secondLevelMenuName);
		}
		map.put("MENU_ID3", thirdLevelMenu);
		if(!(thirdLevelMenuName==""||thirdLevelMenuName.equals(""))){
			map.put("MENU_NM3", thirdLevelMenuName);
		}
		map.put("MENU_ID1_NEW", firstLevelMenuNew);
		if(!(firstLevelMenuNameNew==""||firstLevelMenuNameNew.equals(""))){
			map.put("MENU_NM1_NEW", firstLevelMenuNameNew);
		}
		map.put("MENU_ID2_NEW", secondLevelMenuNew);
		if(!(thirdLevelMenuNameNew==""||secondLevelMenuNameNew.equals(""))){
			map.put("MENU_NM2_NEW", secondLevelMenuNameNew);
		}
		map.put("MENU_ID3_NEW", thirdLevelMenuNew);
		if(!(thirdLevelMenuNameNew==""||thirdLevelMenuNameNew.equals(""))){
			map.put("MENU_NM3_NEW", thirdLevelMenuNameNew);
		}
		map.put("MENU_URL", menuUrl);
		map.put("MENU_LEVEL",menuLevel );
		map=commonService.select("AdminMenu.modifyMenuMst",map);
		map.put("result", map.get("OUT_ERR_MSG").toString());
		renderJSON(map);
		return NONE;
	}
	
	public String saveMenu(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("MENU_ID", firstLevelMenu);
		if(!(firstLevelMenuName.equals("")||firstLevelMenuName=="")){
			map.put("MENU_NM", firstLevelMenuName);
		}
		map.put("MENU_ID2", secondLevelMenu);
		if(!(secondLevelMenuName.equals("")||secondLevelMenuName=="")){
			map.put("MENU_NM2", secondLevelMenuName);
		}
		map.put("MENU_ID3", thirdLevelMenu);
		if(!(thirdLevelMenuName.equals("")||thirdLevelMenuName=="")){
			map.put("MENU_NM3", thirdLevelMenuName);
		}
		map.put("MENU_URL", menuUrl);
		map.put("MENU_ICON", menuIcon);
		map=commonService.select("AdminMenu.insertMenuMst",map);
		map.put("result", map.get("OUT_ERR_MSG").toString());
		renderJSON(map);
		return NONE;
	}
	
	
	public String menuTree() {
		return "menuTree";
	}
	
	public String auth(){
		List<Combo> companyCombo =  comboService.getCompanyCombo();
		
		request.put("companyCombo", companyCombo);
		return "auth";
	}
	
	
	public String getShopListByCompanyCombo() {
		Integer corpId = IntegerUtils.valueOf(getRequest().getParameter("corpId"));
		List<Combo> companyCombo =  comboService.getShopListByCompanyCombo(corpId);
		renderJSON(companyCombo);
		return NONE;
	}
	
	private String getLabel(Map<String,String> label, String key){
		String val = label.get(key);
		if(StringUtils.isBlank(val)){
			val = key;
		}
		return val;
	}
	
	public String getShopMenuAuthTree(){
		HttpServletRequest request =ServletActionContext.getRequest();
		Map<String,String> label = LabelUtil.getLabelMap(request.getSession().getServletContext());	
		Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		String userId = getBackSessionUserId();
		
		JSONArray authTree = menuService.generateMenuAuthTree(shopId,userId);
//		for(int i=0;i<authTree.size();i++){
//			JSONObject firstMenuJson = authTree.getJSONObject(i);  
//			firstMenuJson.put("text", getLabel(label, firstMenuJson.get("text").toString()));
//		    JSONArray secondMenu= (JSONArray) firstMenuJson.get("children");
//		    if(secondMenu!=null){
//		    	for(int j=0;j<secondMenu.size();j++){
//			    	JSONObject secondMenuJson = secondMenu.getJSONObject(j);
//			    	secondMenuJson.put("text", getLabel(label, secondMenuJson.get("text").toString()));
//			    	JSONArray thirdMenu= (JSONArray) secondMenuJson.get("children");
//			    	if(thirdMenu!=null){
//			    		for(int h=0;h<thirdMenu.size();h++){
//				    		JSONObject thirdMenuJson = thirdMenu.getJSONObject(h);
//				    		thirdMenuJson.put("text", getLabel(label, thirdMenuJson.get("text").toString()));
//				    	}
//			    	}
//			    	
//			    }
//		    }
//		    
//		}
		renderJSON(authTree.toString());
		return NONE;
	}
	public String saveShopMenuAuth(){
		boolean success = true;
		String err_msg = "";
		
		try {
			Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
			String menuIds = getRequest().getParameter("menuIds");
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("SHOP_ID", shopId);
			map.put("MENU_ID_LIST", menuIds);
			
			menuService.saveShopMenuAuth(map);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
			
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		
		return NONE;
	}

	public String getParentMenuId() {
		return parentMenuId;
	}

	public void setParentMenuId(String parentMenuId) {
		this.parentMenuId = parentMenuId;
	}

	public String getFirstMenuId() {
		return firstMenuId;
	}

	public void setFirstMenuId(String firstMenuId) {
		this.firstMenuId = firstMenuId;
	}

	public String getSecondMenuId() {
		return secondMenuId;
	}

	public void setSecondMenuId(String secondMenuId) {
		this.secondMenuId = secondMenuId;
	}

	public String getThirdMenuId() {
		return thirdMenuId;
	}

	public void setThirdMenuId(String thirdMenuId) {
		this.thirdMenuId = thirdMenuId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public String getMenuUrl() {
		return menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}

	public String getMenuIcon() {
		return menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}

	public String getMenuLevel() {
		return menuLevel;
	}

	public void setMenuLevel(String menuLevel) {
		this.menuLevel = menuLevel;
	}

	public String getMenuStatus() {
		return menuStatus;
	}

	public void setMenuStatus(String menuStatus) {
		this.menuStatus = menuStatus;
	}

	public int getFirstLevelMenu() {
		return firstLevelMenu;
	}

	public void setFirstLevelMenu(int firstLevelMenu) {
		this.firstLevelMenu = firstLevelMenu;
	}

	public int getSecondLevelMenu() {
		return secondLevelMenu;
	}

	public void setSecondLevelMenu(int secondLevelMenu) {
		this.secondLevelMenu = secondLevelMenu;
	}

	public int getThirdLevelMenu() {
		return thirdLevelMenu;
	}

	public void setThirdLevelMenu(int thirdLevelMenu) {
		this.thirdLevelMenu = thirdLevelMenu;
	}

	public String getFirstLevelMenuName() {
		return firstLevelMenuName;
	}

	public void setFirstLevelMenuName(String firstLevelMenuName) {
		this.firstLevelMenuName = firstLevelMenuName;
	}

	public String getSecondLevelMenuName() {
		return secondLevelMenuName;
	}

	public void setSecondLevelMenuName(String secondLevelMenuName) {
		this.secondLevelMenuName = secondLevelMenuName;
	}

	public String getThirdLevelMenuName() {
		return thirdLevelMenuName;
	}

	public void setThirdLevelMenuName(String thirdLevelMenuName) {
		this.thirdLevelMenuName = thirdLevelMenuName;
	}

	public int getFirstLevelMenuNew() {
		return firstLevelMenuNew;
	}

	public void setFirstLevelMenuNew(int firstLevelMenuNew) {
		this.firstLevelMenuNew = firstLevelMenuNew;
	}

	public int getSecondLevelMenuNew() {
		return secondLevelMenuNew;
	}

	public void setSecondLevelMenuNew(int secondLevelMenuNew) {
		this.secondLevelMenuNew = secondLevelMenuNew;
	}

	public int getThirdLevelMenuNew() {
		return thirdLevelMenuNew;
	}

	public void setThirdLevelMenuNew(int thirdLevelMenuNew) {
		this.thirdLevelMenuNew = thirdLevelMenuNew;
	}

	public String getFirstLevelMenuNameNew() {
		return firstLevelMenuNameNew;
	}

	public void setFirstLevelMenuNameNew(String firstLevelMenuNameNew) {
		this.firstLevelMenuNameNew = firstLevelMenuNameNew;
	}

	public String getSecondLevelMenuNameNew() {
		return secondLevelMenuNameNew;
	}

	public void setSecondLevelMenuNameNew(String secondLevelMenuNameNew) {
		this.secondLevelMenuNameNew = secondLevelMenuNameNew;
	}

	public String getThirdLevelMenuNameNew() {
		return thirdLevelMenuNameNew;
	}

	public void setThirdLevelMenuNameNew(String thirdLevelMenuNameNew) {
		this.thirdLevelMenuNameNew = thirdLevelMenuNameNew;
	}
	
	/**********************/
	
	
}
