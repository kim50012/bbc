package com.waremec.wpt.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminGoodsClass;
import com.waremec.wpt.admin.domain.AdminGroupCorp;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.AdminShopClass;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.AdminUser;

@Repository
public class ShopDao extends CommonDao {
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGroupCorp
	 * @return:		List<AdminGroupCorp>
	 * @exception:	创建店铺时候查询公司信息。
	 */
	public Object selectAdminUserByUserId(String sqlId, AdminUser adminUser) {
		return getSqlMapClientTemplate().queryForObject(sqlId,adminUser);
		
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--sqlId
	 * @return:		Object
	 * @exception:	创建店铺时候查询用户的信息。
	 */
	public List<AdminGroupCorp> selectShopCreateClass(String sqlId,
			Map<String, Object> searchMap) {
		return (List<AdminGroupCorp>)getSqlMapClientTemplate().queryForList(sqlId,searchMap);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminMap
	 * @return:		List<AdminMap>
	 * @exception:	创建店铺时候查询地址信息。
	 */
	public List<AdminMap> selectAdminUserByUserId(String sqlId,
			AdminMap adminMap) {
		return getSqlMapClientTemplate().queryForList(sqlId, adminMap);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminShop
	 * @return:		String
	 * @exception:	创建店铺。
	 */
	public String saveShopCreate(String sqlId, AdminShop adminShop) {
		Map<String,Object> map=(Map<String,Object>) getSqlMapClientTemplate().queryForObject(sqlId, adminShop);
		if(map.get("OUT_SHOP_ID")==null){
			return null;
		}else{
			return map.get("OUT_SHOP_ID")+"";
		}	
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoodsClass
	 * @return:		List<AdminGoodsClass>
	 * @exception:	创建店铺时候查询商品类型信息。
	 */
	public List<AdminGoodsClass> selectAdminGoodsClass(String sqlId,
			AdminGoodsClass adminGoodsClass) {
		return (List<AdminGoodsClass>)getSqlMapClientTemplate().queryForList(sqlId, adminGoodsClass);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminShopClass
	 * @return:		List<AdminGoodsClass>
	 * @exception:	创建店铺时候查询商品类型信息。
	 */
	public List<AdminShopClass> selectAdminShopClass(String string) {
		return (List<AdminShopClass>)getSqlMapClientTemplate().queryForList(string);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @return:		List<AdminGoodsClass>
	 * @exception:	店铺认证时候修改店铺的信息
	 */
	public void updateShopMessage(String string, AdminShop adminShop) {
		getSqlMapClientTemplate().update(string, adminShop);
		
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShopFileMst
	 * @return:		string
	 * @throws Exception 
	 * @exception:	店铺认证时候存储图片信息
	 */
	public String saveShopFileMst(String string,
			AdminShopFileMst adminShopFileMst) throws Exception {
		Map<String,Object> map=(Map<String, Object>) getSqlMapClientTemplate().queryForObject(string,adminShopFileMst);
		
		Integer fileId = 		(Integer)map.get("OUT_FILE_ID");
		String OUT_ERR_MSG = 	(String)map.get("OUT_ERR_MSG");
		if(fileId == 0){ 
			throw new Exception(OUT_ERR_MSG);
		}
		return fileId + "";
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @return:		string
	 * @exception:	修改店铺时候查询其所需要的店铺信息
	 */
	public AdminShop selectAdminShop(String string, AdminShop adminShop) {
		return (AdminShop) getSqlMapClientTemplate().queryForObject(string, adminShop);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShopFileMst
	 * @return:		string
	 * @exception:	修改店铺时候查询其所需要的店铺logo信息
	 */
	public AdminShopFileMst selectAdminShopFileMst(String string,
			AdminShopFileMst adminShopFileMst) {
		return (AdminShopFileMst) getSqlMapClientTemplate().queryForObject(string, adminShopFileMst);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @exception:	删除店铺
	 */
	public void deleteShop(String string, AdminShop adminShop) {
		getSqlMapClientTemplate().delete(string, adminShop);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @return:		List<AdminGoodsClass>
	 * @exception:	修改的公用
	 */
	public void updateObject(String string, Map map) {
		getSqlMapClientTemplate().update(string,map);
	}
	/** 
	*根据公司ID获取店铺列表
	* @param userId
	* @param companyId
	* @return
	*/
	public List<AdminShop> selectShopListByGroupId(String userId, Integer companyId) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("USER_ID", userId);
		map.put("COMP_ID", companyId);
		
		return ( List<AdminShop>)getSqlMapClientTemplate().queryForList("Shop.selectShopListByGroupId", map);
	}
	
}
