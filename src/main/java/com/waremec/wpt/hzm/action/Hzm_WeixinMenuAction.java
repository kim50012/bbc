package com.waremec.wpt.hzm.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.wpt.admin.common.service.ComboService;
import com.waremec.wpt.admin.common.service.ComboType;
import com.waremec.wpt.admin.domain.AdminWxCustMenu;
import com.waremec.wpt.admin.service.WxCustMenuService;

@Controller("hzmWeixinMenuAction")
@Scope(ScopeType.prototype)
public class Hzm_WeixinMenuAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String MENU_PARENT_ID = "";
	private String MENU_ID = "";
	private String MENU_NM = "";
	private String MENU_ID2 = "";
	private String MENU_NM2 = "";
	private String OPTION_TYPE = "";
	private String MENU_OP_TYPE = "";
	private String MENU_OP_ID = "";
	private String MENU_OP_TITLE = "";
	private String MENU_OP_COM = "";
	private String SEARCH_TYPE = "";
	private String MENU_OPTION = "";

	@Resource
	private WxCustMenuService wxCustMenuService;
	@Resource
	private ComboService comboService;

	public String hzm_MenuList() {

		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();

		AdminWxCustMenu menu = new AdminWxCustMenu();
		menu.setSHOP_ID_IN(shopId);
		menu.setUSER_ID_IN(userId);

		List<AdminWxCustMenu> menuList = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.select", menu);
		for (AdminWxCustMenu item : menuList) {
			menu.setMENU_PARENT_ID_IN(Integer.parseInt(item.getMENU_ID()));
			List<AdminWxCustMenu> list = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.select", menu);
			item.setSubList(list);
			item.setSubListSize(list.size() + "");
		}

		request.put("menuListSize", menuList.size());
		request.put("menuList", menuList);

		return "hzm_MenuList";
	}
	
	public String hzm_MoveMenu(){
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			AdminWxCustMenu custMenu = new AdminWxCustMenu();
			custMenu.setSHOP_ID_IN(getBackSessionShopId());
			custMenu.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			custMenu.setMENU_OPTION_IN(MENU_OPTION);
			custMenu.setUSER_ID_IN(getBackSessionUserId());
			
			wxCustMenuService.insertDomain("AdminWxCustMenu.menuSort", custMenu);

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
	
	
	public String hzm_ModifyMenuPopup(){
		
		AdminWxCustMenu custMenu = new AdminWxCustMenu();
		custMenu.setSHOP_ID_IN(getBackSessionShopId());
		custMenu.setMENU_ID_IN(Integer.parseInt(MENU_ID));
		
		custMenu = wxCustMenuService.getMenuById(custMenu);
		
		request.put("custMenu", custMenu);
		
		return "hzm_ModifyMenuPopup";
	}
	
	/** 
	* 删除菜单
	* @return
	*/
	public String hzm_Delete() {

		boolean success = true;
		String err_msg = "";
		
		try {

			AdminWxCustMenu custMenu = new AdminWxCustMenu();
			custMenu.setSHOP_ID_IN(getBackSessionShopId());
			custMenu.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			custMenu.setUSER_ID_IN(getBackSessionUserId());
			
			wxCustMenuService.insertDomain("AdminWxCustMenu.delete", custMenu);
			
		}catch(Exception e) {
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
	
	
	
	/** 
	*  添加菜单
	* @return
	*/
	public String hzm_AddMenu() {

		boolean success = true;
		String err_msg = "";
		
		Integer shopId = getBackSessionShopId();

		AdminWxCustMenu custMenu = new AdminWxCustMenu();
		custMenu.setSHOP_ID_IN(shopId);
		if (StringUtils.isNotBlank(MENU_ID)) {
			custMenu.setMENU_ID_IN(Integer.parseInt(MENU_ID));
		}
		custMenu.setMENU_NM_IN(MENU_NM);
		
		try {
			wxCustMenuService.addMenu(custMenu);
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
	
	/** 
	* 菜单重命名
	* @return
	*/
	public String hzm_MenuRename() {

		boolean success = true;
		String err_msg = "";
		
		try {

			AdminWxCustMenu custMenu = new AdminWxCustMenu();
			custMenu.setSHOP_ID_IN(getBackSessionShopId());
			custMenu.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			custMenu.setMENU_NM_IN(MENU_NM);
			custMenu.setUSER_ID_IN(getBackSessionUserId());
			
			wxCustMenuService.modifyMenuName(custMenu);
			
		}catch(Exception e) {
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
	
	public String hzm_ModifyMenu() {

		boolean success = true;
		String err_msg = "";
		
		try {

			AdminWxCustMenu custMenu = new AdminWxCustMenu();
			custMenu.setSHOP_ID_IN(getBackSessionShopId());
			custMenu.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			custMenu.setMENU_NM_IN(MENU_NM);
			custMenu.setMENU_OP_TYPE_IN(MENU_OP_TYPE);
			if("click".equals(MENU_OP_TYPE)){
				custMenu.setMENU_OP_ID_IN(Integer.parseInt(MENU_OP_ID));
				custMenu.setMENU_OP_TITLE_IN(MENU_OP_TITLE);
			}if("view".equals(MENU_OP_TYPE)){
				custMenu.setMENU_OP_COM_IN(MENU_OP_COM);
			}if("scancode_push".equals(MENU_OP_TYPE)){
				custMenu.setMENU_OP_ID_IN(201);
				custMenu.setMENU_OP_TITLE_IN("扫码推送1");
			}if("scancode_waitmsg".equals(MENU_OP_TYPE)){
				custMenu.setMENU_OP_ID_IN(202);
				custMenu.setMENU_OP_TITLE_IN("扫码推送2");
			}
			 
			custMenu.setOPTION_TYPE_IN("ALL");
			custMenu.setUSER_ID_IN(getBackSessionUserId());
			
			wxCustMenuService.insertDomain("AdminWxCustMenu.modify", custMenu);
			
		}catch(Exception e) {
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
	public String hzm_PublishMenu() {
 
		boolean success = true;
		String err_msg = "";
		
		try {
			
			AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
			wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
			wxCustMenuIn.setSEARCH_TYPE_IN(3);
			wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());

			List<AdminWxCustMenu> reList = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.saveCheck", wxCustMenuIn);
			if(!reList.isEmpty()){
				String message = getLabel("菜单必须指定操作") + ".\n" + getLabel("如果存在二级菜单") + "," + getLabel("二级菜单必须指定操作");
				throw new Exception(message);
			}
			wxCustMenuService.insertDomain("AdminWxCustMenu.publish", wxCustMenuIn);
			
		}catch(Exception e) {
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
	
	
	
	
	public String hzm_LinkTypePage(){
		
		Integer shopId = getBackSessionShopId();
		
		String serachTitle = StringUtils.trimToNull(getRequest().getParameter("serachTitle"));
		Integer serachLinkType = IntegerUtils.valueOf(getRequest().getParameter("serachLinkType"),2);
	 
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("LINK_TYPE", serachLinkType);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("USER_ID", null);
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		request.put("serachLinkType", serachLinkType);
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		if(serachLinkType > 90){
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.MATERIAL_TYPE_COMBO));
		}else{
			request.put("linkTypeCombo", comboService.getList(shopId, ComboType.LINK_TYPE_COMBO));
		}
		
		return "hzm_LinkTypePage";
	}
	public String hzm_LinkTypePageFragment(){
		
		Integer shopId = getBackSessionShopId();
		
		String serachTitle = StringUtils.trimToNull(getRequest().getParameter("serachTitle"));
		Integer serachLinkType = IntegerUtils.valueOf(getRequest().getParameter("serachLinkType"),2);
		
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("PAGE_NM", serachTitle);
		parmsMap.put("LINK_TYPE", serachLinkType);
		parmsMap.put("PAGE_CURR", pageCurr);
		parmsMap.put("PAGE_UINT", pageUnit);
		parmsMap.put("USER_ID", null);
		
		List<Map<String, Object>> list = commonService.selectList("AdminGoods.LINK_PAGE_LIST_SELECT",parmsMap);
		
		request.put("list", list);
		request.put("serachLinkType", serachLinkType);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		return "hzm_LinkTypePageFragment";
	}
	
	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 微信自定义菜单一页面加载
	 */
	public String wxCustMenu() {

		int reOneListCount = 0;

		AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
		wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
		wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());

		List<AdminWxCustMenu> reOneList = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.select", wxCustMenuIn);
		for (AdminWxCustMenu ones : reOneList) {
			wxCustMenuIn.setMENU_PARENT_ID_IN(Integer.parseInt(ones.getMENU_ID()));
			List<AdminWxCustMenu> list = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.select", wxCustMenuIn);
			ones.setSubList(list);
			ones.setSubListSize(list.size() + "");
		}
		reOneListCount = reOneList.size();

		request.put("reOneListCount", reOneListCount);
		request.put("reOneList", reOneList);

		return "wxCustMenu";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 微信自定义菜单一新建页面加载
	 */
	public String wxCustMenuPop() {


		AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
		wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
		wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());
		if (!MENU_PARENT_ID.equals("")) {
			wxCustMenuIn.setMENU_PARENT_ID_IN(Integer.parseInt(MENU_PARENT_ID));
		}

		List<AdminWxCustMenu> reOneList = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.select", wxCustMenuIn);

		request.put("reOneList", reOneList);

		return "wxCustMenuPop";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 微信自定义菜单一新建页面-一级菜单事件
	 */
	public String ajaxOneSelectChange() {

		AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
		wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
		wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());
		if (!MENU_PARENT_ID.equals("")) {
			wxCustMenuIn.setMENU_PARENT_ID_IN(Integer.parseInt(MENU_PARENT_ID));
		}

		List<AdminWxCustMenu> reOneList = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.select", wxCustMenuIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reOneList", reOneList);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 微信自定义菜单一验证
	 */
	public String ajaxCheck() {


		AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
		wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
		wxCustMenuIn.setSEARCH_TYPE_IN(Integer.parseInt(SEARCH_TYPE));
		if (!MENU_ID.equals("")) {
			wxCustMenuIn.setMENU_ID_IN(Integer.parseInt(MENU_ID));
		}
		if (!MENU_NM.equals("")) {
			wxCustMenuIn.setMENU_NM_IN(MENU_NM);
		}

		List<AdminWxCustMenu> reList = (List<AdminWxCustMenu>) wxCustMenuService.selectList("AdminWxCustMenu.saveCheck", wxCustMenuIn);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reList", reList);

		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	商品登记一菜单排序
	 */
	public String ajaxMenuSort() {	

		String ret = "SUCCESS";

		try {
						
			AdminWxCustMenu saveIn = new AdminWxCustMenu();
			saveIn.setSHOP_ID_IN(getBackSessionShopId());
			saveIn.setUSER_ID_IN(getBackSessionUserId());
			saveIn.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			if (!MENU_ID2.equals("")) {
				saveIn.setMENU_ID2_IN(Integer.parseInt(MENU_ID2));
			}
			saveIn.setMENU_OPTION_IN(MENU_OPTION);
			
			wxCustMenuService.insertDomain("AdminWxCustMenu.menuSort", saveIn);
			
		}catch(Exception e) {
			ret = "FAIL";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		
		renderJSON(returnMap);
  		
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	微信自定义菜单一新建页面-一保存
	 */
	public String save() {

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {

			AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
			wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
			if(!MENU_ID.equals("")){
				wxCustMenuIn.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			}
			wxCustMenuIn.setMENU_NM_IN(MENU_NM);
			if(!MENU_ID2.equals("")){
				wxCustMenuIn.setMENU_ID2_IN(Integer.parseInt(MENU_ID2));
			}
			if(!MENU_NM2.equals("")){
				wxCustMenuIn.setMENU_NM2_IN(MENU_NM2);
			}
			wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());
			
			wxCustMenuService.insertDomain("AdminWxCustMenu.save", wxCustMenuIn);
			
			returnMap.put("success", true);
			
		}catch(Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	微信自定义菜单一修改
	 */
	public String modify() {

		String ret = "SUCCESS";
		
		try {

			AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
			wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
			wxCustMenuIn.setMENU_ID_IN(Integer.parseInt(MENU_ID));
			wxCustMenuIn.setMENU_NM_IN(MENU_NM);
			if (!MENU_OP_TYPE.equals("")) {
				wxCustMenuIn.setMENU_OP_TYPE_IN(MENU_OP_TYPE);
			}
			if (!MENU_OP_ID.equals("")) {
				wxCustMenuIn.setMENU_OP_ID_IN(Integer.parseInt(MENU_OP_ID));
			}
			if (!MENU_OP_TITLE.equals("")) {
				wxCustMenuIn.setMENU_OP_TITLE_IN(MENU_OP_TITLE);
			}
			if (!MENU_OP_COM.equals("")) {
				wxCustMenuIn.setMENU_OP_COM_IN(MENU_OP_COM);
			}
			wxCustMenuIn.setOPTION_TYPE_IN(OPTION_TYPE);
			wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());
			
			wxCustMenuService.insertDomain("AdminWxCustMenu.modify", wxCustMenuIn);
			
		}catch(Exception e) {
			ret = "FAIL";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	微信自定义菜单一发布
	 */
	public String publish() {

		try {
			

				AdminWxCustMenu wxCustMenuIn = new AdminWxCustMenu();
				wxCustMenuIn.setSHOP_ID_IN(getBackSessionShopId());
				wxCustMenuIn.setUSER_ID_IN(getBackSessionUserId());
				wxCustMenuService.insertDomain("AdminWxCustMenu.publish", wxCustMenuIn);
			
				Map<String,Object> rtnMap = new HashMap<String,Object>();
				rtnMap.put("success", true);
				renderJSON(rtnMap);
			
		}catch(Exception e) {
			logger.error(e.getMessage());
			
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			 rtnMap.put("success", false);
			 rtnMap.put("err_msg", e.getMessage());
			 
			 renderJSON(rtnMap);
		}
		return NONE;
	}

	public String getMENU_PARENT_ID() {
		return MENU_PARENT_ID;
	}

	public void setMENU_PARENT_ID(String mENU_PARENT_ID) {
		MENU_PARENT_ID = mENU_PARENT_ID;
	}

	public String getMENU_ID() {
		return MENU_ID;
	}

	public void setMENU_ID(String mENU_ID) {
		MENU_ID = mENU_ID;
	}

	public String getMENU_NM() {
		return MENU_NM;
	}

	public void setMENU_NM(String mENU_NM) {
		MENU_NM = mENU_NM;
	}

	public String getMENU_ID2() {
		return MENU_ID2;
	}

	public void setMENU_ID2(String mENU_ID2) {
		MENU_ID2 = mENU_ID2;
	}

	public String getMENU_NM2() {
		return MENU_NM2;
	}

	public void setMENU_NM2(String mENU_NM2) {
		MENU_NM2 = mENU_NM2;
	}

	public String getOPTION_TYPE() {
		return OPTION_TYPE;
	}

	public void setOPTION_TYPE(String oPTION_TYPE) {
		OPTION_TYPE = oPTION_TYPE;
	}

	public String getMENU_OP_TYPE() {
		return MENU_OP_TYPE;
	}

	public void setMENU_OP_TYPE(String mENU_OP_TYPE) {
		MENU_OP_TYPE = mENU_OP_TYPE;
	}

	public String getMENU_OP_COM() {
		return MENU_OP_COM;
	}

	public void setMENU_OP_COM(String mENU_OP_COM) {
		MENU_OP_COM = mENU_OP_COM;
	}

	public String getMENU_OP_ID() {
		return MENU_OP_ID;
	}

	public void setMENU_OP_ID(String mENU_OP_ID) {
		MENU_OP_ID = mENU_OP_ID;
	}

	public String getSEARCH_TYPE() {
		return SEARCH_TYPE;
	}

	public void setSEARCH_TYPE(String sEARCH_TYPE) {
		SEARCH_TYPE = sEARCH_TYPE;
	}

	public String getMENU_OP_TITLE() {
		return MENU_OP_TITLE;
	}

	public void setMENU_OP_TITLE(String mENU_OP_TITLE) {
		MENU_OP_TITLE = mENU_OP_TITLE;
	}

	public String getMENU_OPTION() {
		return MENU_OPTION;
	}

	public void setMENU_OPTION(String mENU_OPTION) {
		MENU_OPTION = mENU_OPTION;
	}	
}
