package com.waremec.weixin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.dao.WeixinMenuDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.WeixinMenu;
import com.waremec.weixin.domain.menu.Button;
import com.waremec.weixin.domain.menu.ClickButton;
import com.waremec.weixin.domain.menu.ComplexButton;
import com.waremec.weixin.domain.menu.Menu;
import com.waremec.weixin.domain.menu.ViewButton;
import com.waremec.weixin.exception.WeixinErrorException;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.WeixinMenuUtils;

/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinMenuService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:34 
*  
*/
@Service
public class WeixinMenuService extends CommonServiceImpl implements CommonService {

	@Resource
	private WeixinService weixinService;
	@Resource
	private WeixinMenuDao weixinMenuDao;

	public static void main(String[] args) {
		
	}
	
	@Deprecated
	public int insert(WeixinMenu weixinMenu) { 
		return weixinMenuDao.insert(weixinMenu);

	}

	
    private boolean whetherMakeOauth2Url(AppInfo appInfo, String url){
		
		if (StringUtils.isNotBlank(url) && (url.startsWith("/") || url.startsWith(appInfo.getDomain()) && !url.endsWith(".html")) ) {
			return true;
		}
		
		return false;
		
	}

	

	/** 
	* 发布微信菜单到微信服务器
	* @param shopId
	*/
	public void uploadMenus(Integer shopId) {

		 AppInfo appInfo =  weixinService.selectAppInfoByShopId(shopId);
		 
		 if(appInfo == null){
			 throw new WeixinErrorException("该商店没有权限发布菜单!");
		 }
		
		List<Map<String, Object>> list = weixinMenuDao.selectCustomMenuLevel1(shopId);

		List<Button> buttonList = new ArrayList<Button>();

		for (Map<String, Object> map : list) {
			Integer menuId 		= (Integer) map.get("MENU_ID");
			String menuName 	= (String) map.get("MENU_NM");
			Integer eventKey 	= (Integer) map.get("MENU_OP_ID");
			String url 			= (String) map.get("MENU_OP_COM");
			String isLeft 		= (String) map.get("IS_LEAT");
			String menuType 	= (String) map.get("MENU_OP_TYPE");

			logger.info("menuType=" + menuType);

			if ("Y".equals(isLeft)) {
				if ("click".equals(menuType)) {
					ClickButton btn = new ClickButton();
					btn.setName(menuName);
					btn.setType(menuType);
					btn.setKey(eventKey + "");

					buttonList.add(btn);
				}else if ("scancode_push".equals(menuType)) {
					ClickButton btn = new ClickButton();
					btn.setName(menuName);
					btn.setType(menuType);
					btn.setKey(eventKey + "");

					buttonList.add(btn);
				}else if ("scancode_waitmsg".equals(menuType)) {
					ClickButton btn = new ClickButton();
					btn.setName(menuName);
					btn.setType(menuType);
					btn.setKey(eventKey + "");

					buttonList.add(btn);
				}else if ("view".equals(menuType)) {
					ViewButton btn = new ViewButton();
					btn.setName(menuName);
					btn.setType(menuType);
					if (whetherMakeOauth2Url(appInfo, url)) {
						btn.setUrl(Oauth2Utils.getMenuIinkUrlNew(appInfo, menuId));
					} else {
						btn.setUrl(url);
					}
					buttonList.add(btn);
				}
			} else {
				ComplexButton cbtn = new ComplexButton();
				cbtn.setName(menuName);
				// cbtn.setSub_button(new Button[] { btn11, btn12, btn13, btn14
				// , btn15});

				List<Button> subBtns = new ArrayList<Button>();
				List<Map<String, Object>> sublist = weixinMenuDao.selectCustomMenuLevel2(shopId, menuId);

				for (Map<String, Object> item : sublist) {
					Integer menuId2 	= (Integer) item.get("MENU_ID");
					String menuName2 	= (String) item.get("MENU_NM");
					Integer eventKey2 	= (Integer) item.get("MENU_OP_ID");
					String url2 		= (String) item.get("MENU_OP_COM");
					String menuType2 	= (String) item.get("MENU_OP_TYPE");

					if ("click".equals(menuType2)) {
						ClickButton btn = new ClickButton();
						btn.setType(menuType2);
						btn.setName(menuName2);
						btn.setKey(eventKey2 + "");

						subBtns.add(btn);
					}else if ("scancode_push".equals(menuType2)) {
						ClickButton btn = new ClickButton();
						btn.setType(menuType2);
						btn.setName(menuName2);
						btn.setKey(eventKey2 + "");

						subBtns.add(btn);
					}else if ("scancode_waitmsg".equals(menuType2)) {
						ClickButton btn = new ClickButton();
						btn.setType(menuType2);
						btn.setName(menuName2);
						btn.setKey(eventKey2 + "");

						subBtns.add(btn);
					}else if ("view".equals(menuType2)) {
						ViewButton btn = new ViewButton();
						btn.setType(menuType2);
						btn.setName(menuName2);
						if (whetherMakeOauth2Url(appInfo, url2)) {
							btn.setUrl(Oauth2Utils.getMenuIinkUrlNew(appInfo, menuId2));
						} else {
							btn.setUrl(url2);
						}

						subBtns.add(btn);
					}
				}
				cbtn.setSub_button((Button[]) subBtns.toArray(new Button[subBtns.size()]));
				buttonList.add(cbtn);
			}
		}

		Menu menu = new Menu();
		menu.setButton((Button[]) buttonList.toArray(new Button[buttonList.size()]));
	 
		String token = weixinService.getAccessToken(appInfo);
      
//		WeixinMenuUtils.createMenu("bx545OEuKDx8xUnqvGPyeujuOgV7LBdvU1DJOrG2XeXESDdisqEgK3H8TSdNdUgHEbrSI9wsitEOY8cGMVzDF6qufC6ihGvAqfTcydPZdHvJMdU8SqLZDrQGJtSN4MlwXMJdAHAGVS", menu);
		WeixinMenuUtils.createMenu(token, menu);

	}
	
	/** 
	* 根据菜单ID获取菜单链接
	* @param menuId  菜单ID
	* @return String 菜单链接
	*/
	public String getViewUrlById(Integer menuId){
		return weixinMenuDao.getViewUrlById(menuId);
	}

}
