package com.waremec.weixin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.WeixinMenu;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinMenuDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:20 
*  
*/
@Repository
public class WeixinMenuDao extends CommonDao {
  
	
	@SuppressWarnings("deprecation")
	public int insert(WeixinMenu weixinMenu) {
		return (Integer)getSqlMapClientTemplate().insert("WeixinMenu.insert", weixinMenu);
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Map<String, Object>> selectCustomMenuLevel1(Integer shopId) {
		return getSqlMapClientTemplate().queryForList("WeixinMenu.selectCustomMenuLevel1", shopId);
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Map<String, Object>> selectCustomMenuLevel2(Integer shopId, Integer menuId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("SHOP_ID", shopId);
		map.put("MENU_ID", menuId);
		return getSqlMapClientTemplate().queryForList("WeixinMenu.selectCustomMenuLevel2", map);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public String getViewUrlById(Integer menuId) {
		Map<String,Object> map = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinMenu.getViewUrlById", menuId);
		String url = (String)map.get("MENU_URL");
		return url;
	}
	
}
