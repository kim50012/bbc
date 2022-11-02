package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.GoodsSellDao;
import com.waremec.wpt.admin.domain.AdminGoodsDisplay;
import com.waremec.wpt.admin.domain.AdminGoodsDisplayClass;
import com.waremec.wpt.admin.domain.ShopGoodsClass;

@Service
public class GoodsSellService extends CommonServiceImpl implements CommonService{
	@Resource
	private GoodsSellDao goodsSellDao;
	/**
	 * @author wangbin
	 * @param string
	 * @param shopGoodsClass
	 * @return shopGoodsClass
	 */
	public List<ShopGoodsClass> selectShopGoodsClass(String string,
			ShopGoodsClass shopGoodsClass) {
		try{
			return goodsSellDao.selectShopGoodsClass(string,shopGoodsClass);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param shopGoodsClass
	 * 修改商品的分组。
	 */
	public Map<String,Object> updateGoodsGroup(String string, AdminGoodsDisplayClass adminGoodsDisplayClass){
		try{
			return goodsSellDao.updateGoodsGroup(string,adminGoodsDisplayClass);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminGoodsDisplay
	 * @return 该店铺上架商品的总条数。
	 * 
	 */
	public int selectCount(String string,AdminGoodsDisplay adminGoodsDisplay) {
		try{
			return goodsSellDao.selectCount(string,adminGoodsDisplay);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param adminGoodsDisplay
	 * 出售中商品的下架
	 */
	public Integer updateDisplayGoods(String string,
			AdminGoodsDisplay adminGoodsDisplay){
		try{
			return goodsSellDao.updateDisplayGoods(string,adminGoodsDisplay);
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	
}
