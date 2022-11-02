/**   
 * @Title: MenuService.java 
 * @Package com.waremec.wpt.admin.service 
 * @Description:  
 * @author taebem
 * @date 2015年6月29日 下午2:00:20 
 * @version V1.0   
 */
package com.waremec.wpt.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.MenuDao;
import com.waremec.wpt.admin.domain.Menu;
import com.waremec.wpt.admin.domain.ShopMenuAuth;

/**
 * @Package com.waremec.wpt.admin.service
 * @FileName MenuService
 * @Description
 * @author taebem
 * @date 2015年6月29日 下午2:00:20
 * 
 */
@Service
public class MenuService extends CommonServiceImpl implements CommonService {
	
	@Resource
	private MenuDao menuDao;
	
	public JSONArray generateMenuAuthTree(Integer shopId,String userId){
		ShopMenuAuth menuAuth = new ShopMenuAuth();
		menuAuth.setMenuId(0);
		menuAuth.setLeaf(0);
		
		generateMenuAuthTree(shopId,userId, menuAuth);
		
		return convert2Json(menuAuth.getSubmenus());
	}
	
	private JSONArray convert2Json(List<ShopMenuAuth> menuAuthList){
		JSONArray list = new JSONArray();
		for (ShopMenuAuth item : menuAuthList) {
			
			JSONObject treeNode = new JSONObject();
			
			JSONObject data = new JSONObject();
			data.put("menuId", item.getMenuId());
			
			treeNode.put("text", item.getMenuNm());
			treeNode.put("data", data);
			
			if(item.getLeaf() == 1){
				JSONObject state = new JSONObject();
				state.put("selected", item.getAuth() == 1);
				
				treeNode.put("state", state);
				
			}else{
				treeNode.put("children", convert2Json(item.getSubmenus()));
			}
			
			list.add(treeNode);
		}

		return list;
       /* { data : {menuId:1},"text" : "哈哈", "children" : [
            { data : {menuId:2},"text" : "Child node 1" },
            { data : {menuId:3},"text" : "Child node 2", "state" : { "selected" : false } },
            { data : {menuId:4},"text" : "Root node1", "state" : { "selected" : true } ,"children" : [
   	            { data : {menuId:5},"text" : "Child node 11" },
   	            {data : {menuId:6}, "text" : "Child node 21", "state" : { "selected" : true } }
   	          ]
   	        }
          ]
        },
        { data : {menuId:7},"text" : "Root node111", "children" : [
	            {data : {menuId:8}, "text" : "Child node 1111" },
	            {data : {menuId:9}, "text" : "Child node 2111", "state" : { "selected" : true } }
	          ]
	        }
      ]*/
	}
	
	public List<Menu> getMenuTree(Integer shopId,String userId){
		
		Menu menu = new Menu();
		menu.setMenuId(0);
		menu.setLeaf(0);
		
		generateTree(shopId,userId, menu);
		
//		for (Menu item : menu.getSubmenus()) {
//			System.out.println(item);
//			 
//			if(item.getIsLeaf() == 0){
//				List<Menu> level2list = item.getSubmenus();
//				for (Menu menu2 : level2list) {
//					System.out.println(menu2);
//					if(menu2.getIsLeaf() == 0){
//						List<Menu> level3list = menu2.getSubmenus();
//						for (Menu menu3 : level3list) {
//							System.out.println(menu3);
//						}
//					}
//				}
//			}
//		}
		
		return menu.getSubmenus();
		 
	}
	
	private void generateTree(Integer shopId,String userId,Menu menu){
		if(menu.getLeaf() == 0){
			menu.setSubmenus(menuDao.selectMenuListByPid(shopId,userId, menu.getMenuId()));
			if(!menu.getSubmenus().isEmpty()){
				for (int i = 0; i < menu.getSubmenus().size(); i++) {
					generateTree(shopId,userId,menu.getSubmenus().get(i));
				}
			}
		}
	}
	
	
	
	private List<Menu> getMenuListByPid(Integer shopId,String userId, Integer menuPid){
		List<Menu> list = menuDao.selectMenuListByPid(shopId,userId, menuPid);
				return list;
	}
	
	
	private void generateMenuAuthTree(Integer shopId,String userId,ShopMenuAuth menuAuth){
		if(menuAuth.getLeaf() == 0){
			menuAuth.setSubmenus(menuDao.selectShopMenuAuthListByPid(shopId,userId, menuAuth.getMenuId()));
			if(!menuAuth.getSubmenus().isEmpty()){
				for (int i = 0; i < menuAuth.getSubmenus().size(); i++) {
					generateMenuAuthTree(shopId,userId,menuAuth.getSubmenus().get(i));
				}
			}
		}
	}
	
	private List<ShopMenuAuth> selectShopMenuAuthListByPid(Integer shopId,String userId, Integer menuPid){
		return menuDao.selectShopMenuAuthListByPid(shopId,userId, menuPid);
	}

	/** 
	*
	* @param map
	*/
	public void saveShopMenuAuth(Map<String, Object> map) {
		// TODO Auto-generated method stub
		menuDao.saveShopMenuAuth(map);
	}
	
}
