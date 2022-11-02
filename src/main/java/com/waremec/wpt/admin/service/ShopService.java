package com.waremec.wpt.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.ShopDao;
import com.waremec.wpt.admin.domain.AdminGoodsClass;
import com.waremec.wpt.admin.domain.AdminGroupCorp;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.AdminShopClass;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.domain.AdminUser;

@Service
public class ShopService extends CommonServiceImpl implements CommonService{

	@Resource
	private ShopDao shopDao;

	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGroupCorp
	 * @return:		List<AdminGroupCorp>
	 * @exception:	创建店铺时候查询公司信息。
	 */
	public List<AdminGroupCorp> selectShopCreateClass(String sqlId,
			Map<String, Object> searchMap) {
		try{
			return shopDao.selectShopCreateClass(sqlId,searchMap);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--sqlId
	 * @return:		Object
	 * @exception:	创建店铺时候查询用户的信息。
	 */
	public	Object selectAdminUserByUserId(String sqlId,
			AdminUser adminUser) {
		try {
			return shopDao.selectAdminUserByUserId(sqlId, adminUser);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminMap
	 * @return:		List<AdminMap>
	 * @exception:	创建店铺时候查询地址信息。
	 */
	public List<AdminMap> selectAdminMapByID(String sqlId, AdminMap adminMap) {
		try {
			return shopDao.selectAdminUserByUserId(sqlId, adminMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminShop
	 * @exception:	创建店铺。
	 */
	public String saveShopCreate(String sqlId, AdminShop adminShop) {
		try {
			return shopDao.saveShopCreate(sqlId, adminShop);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
		try {
			return shopDao.selectAdminGoodsClass(sqlId, adminGoodsClass);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--AdminShopClass
	 * @return:		List<AdminGoodsClass>
	 * @exception:	创建店铺时候查询商品类型信息。
	 */
	public List<AdminShopClass> selectAdminShopClass(String string) {
		try {
			return shopDao.selectAdminShopClass(string);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @return:		List<AdminGoodsClass>
	 * @exception:	店铺认证时候修改店铺的信息
	 */
	public void updateShopMessage(String string, AdminShop adminShop) throws Exception {
	
			shopDao.updateShopMessage(string,adminShop);
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
		 
		 return shopDao.saveShopFileMst(string,adminShopFileMst);
		 
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @return:		string
	 * @exception:	修改店铺时候查询其所需要的店铺信息
	 */
	public AdminShop selectAdminShop(String string, AdminShop adminShop) {
		try{
			return shopDao.selectAdminShop(string,adminShop);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
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
	 
		return shopDao.selectAdminShopFileMst(string,adminShopFileMst);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @exception:	删除店铺
	 */
	public void deleteShop(String string, AdminShop adminShop) throws Exception {
		shopDao.deleteShop(string,adminShop);
	}
	/**
	 * @author:		wangbin
	 * @version:	v1.0
	 * @param:		string,paramIn--adminShop
	 * @return:		List<AdminGoodsClass>
	 * @exception:	修改的公用
	 */
	public void updateObject(String string, Map map) throws Exception {
	
			shopDao.updateObject(string,map);
	}
	/** 
	* 根据公司ID获取店铺列表
	* @param userId 用户ID
	* @param companyId 公司ID
	* @return
	*/
	public List<AdminShop> getShopListByGroupId(String userId, Integer companyId) {
		// TODO Auto-generated method stub
		return shopDao.selectShopListByGroupId(userId, companyId);
	}
	
	/**
	 * 检查店铺主页情况
	 * @param shopId
	 * @param setId
	 * @return pageId
	 */
	public String queryShopSetting(String shopId, String setId){
		String pageId = null;
		//查询该店铺是否有主页
		Map<String, Object> parmsMap = new HashMap<String, Object>();
		parmsMap.put("SHOP_ID", shopId);
		parmsMap.put("SET_ID", setId);
		
		List<Map<String, Object>> list = commonDao.selectList("AdminGoods.SHOP_SETTING_SELECT",parmsMap);
//		List<Map<String, Object>> list = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",parmsMap);
		
		if(!list.isEmpty()){
			//跳转到该主页,跳转到店铺详情
			pageId = String.valueOf(list.get(0).get("VAL_INT"));
		}
		return pageId;
	}
 
	 
}
