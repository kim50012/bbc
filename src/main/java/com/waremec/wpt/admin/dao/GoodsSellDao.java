package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminGoodsDisplay;
import com.waremec.wpt.admin.domain.AdminGoodsDisplayClass;
import com.waremec.wpt.admin.domain.ShopGoodsClass;

@Repository
public class GoodsSellDao extends CommonDao{
	/**
	 * @author wangbin
	 * @param string
	 * @param shopGoodsClass
	 * @return shopGoodsClass
	 */
	public List<ShopGoodsClass> selectShopGoodsClass(String string,
			ShopGoodsClass shopGoodsClass) {
		return (List<ShopGoodsClass>) getSqlMapClientTemplate().queryForList(string,shopGoodsClass);
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param shopGoodsClass
	 * 修改商品的分组。
	 */
	public Map<String,Object> updateGoodsGroup(String string, AdminGoodsDisplayClass adminGoodsDisplayClass) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject(string, adminGoodsDisplayClass);
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminGoodsDisplay
	 * @return 该店铺上架商品的总条数。
	 * 
	 */
	public int selectCount(String string, AdminGoodsDisplay adminGoodsDisplay) {
		return (Integer) getSqlMapClientTemplate().queryForObject(string, adminGoodsDisplay);
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminGoodsDisplay
	 * 出售中商品的下架
	 */
	public Integer updateDisplayGoods(String string,
			AdminGoodsDisplay adminGoodsDisplay) {
		Map<String,Object> map=(Map<String, Object>) getSqlMapClientTemplate().queryForObject(string, adminGoodsDisplay);
		return (Integer) map.get("OUT_SHOP_ID");
	}

}
