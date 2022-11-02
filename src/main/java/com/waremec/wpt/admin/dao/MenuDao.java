/**   
* @Title: MenuDao.java 
* @Package com.waremec.wpt.admin.dao 
* @Description:  
* @author taebem
* @date 2015年6月29日 下午2:01:05 
* @version V1.0   
*/
package com.waremec.wpt.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.Menu;
import com.waremec.wpt.admin.domain.ShopMenuAuth;

/** 
 * @Package com.waremec.wpt.admin.dao 
 * @FileName MenuDao
 * @Description  
 * @author taebem 
 * @date 2015年6月29日 下午2:01:05 
 *  
 */
@Repository
public class MenuDao extends CommonDao {
 
	/** 
	*
	* @param shopId
	* @param userId
	* @param menuPid
	* @return
	*/
	public List<Menu> selectMenuListByPid(Integer shopId, String userId, Integer menuPid) {
		
		Map<String,Object> map = new HashMap<String,Object>();	
		map.put("SHOP_ID", shopId);
		map.put("MENU_PID", menuPid);
		map.put("USER_ID", userId);
		
		List<Menu> list = (List<Menu>)getSqlMapClientTemplate().queryForList("Menu.selectMenuListByPid", map);
		
		return list;
		
	}
	/** 
	*
	* @param shopId
	* @param userId
	* @param menuPid
	* @return
	*/
	public List<ShopMenuAuth> selectShopMenuAuthListByPid(Integer shopId, String userId, Integer menuPid) {
		
		Map<String,Object> map = new HashMap<String,Object>();	
		map.put("SHOP_ID", shopId);
		map.put("MENU_PID", menuPid);
		map.put("USER_ID", userId);
		
		List<ShopMenuAuth> list = (List<ShopMenuAuth>)getSqlMapClientTemplate().queryForList("Menu.selectShopMenuAuthListByPid", map);
		
		return list;
		
	}
	/** 
	*
	* @param map
	*/
	public void saveShopMenuAuth(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().update("Menu.saveShopMenuAuth", map);
	}

}
