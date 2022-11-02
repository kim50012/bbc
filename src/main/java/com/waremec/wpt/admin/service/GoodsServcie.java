package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.GoodsDao;
import com.waremec.wpt.admin.dao.ShopGoodsClassDao;
import com.waremec.wpt.admin.domain.AdminGoods;

@Service
public class GoodsServcie extends CommonServiceImpl implements CommonService{

	@Resource
	private GoodsDao goodsDao;
	
	@Resource
	private ShopGoodsClassDao shopGoodsClassDao;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */ 
	public List<AdminGoods> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		try {
			return goodsDao.selectshopGoodsClassMap(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */
	public List<AdminGoods> selectshopGoodsClassDomain(String sqlId, AdminGoods searchMap) {
		try {
			return goodsDao.selectshopGoodsClassDomain(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */
	public void insertDomain(String sqlId, AdminGoods paramIn) {
		  goodsDao.insertDomain(sqlId, paramIn);
		 
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品登记一级分类查询
	 */ 
	public List<AdminGoods> selectGoodsClass(String sqlId, AdminGoods searchMap) {
		try {
			return goodsDao.selectGoodsClass(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	public int selectCount(String sqlId, AdminGoods searchMap) {
		try {
			return goodsDao.selectCount(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Map<String, Object> addSpecLevelOne(Map<String, Object> paramsMap) {
		// TODO Auto-generated method stub
		return goodsDao.addSpecLevelOne(paramsMap);
	}

	public Map<String, Object> addSpecLevelTwo(Map<String, Object> paramsMap) {
		// TODO Auto-generated method stub
		return goodsDao.addSpecLevelTwo(paramsMap);
	}

	public AdminGoods saveGoodsClass(AdminGoods saveIn) {
		// TODO Auto-generated method stub
		return goodsDao.saveGoodsClass(saveIn);
	}
}
