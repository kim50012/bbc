package com.waremec.wpt.admin.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.MyIncomeDao;
import com.waremec.wpt.admin.domain.AdminMyIncome;

@Service
public class MyIncomeService extends CommonServiceImpl implements CommonService{

	@Resource
	private MyIncomeDao myIncomeDao;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminMyIncome>
	 * @exception:	店铺商品分类一级分类查询
	 */ 
	/*public List<AdminGoods> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		try {
			return goodsDao.selectshopGoodsClassMap(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}*/
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminMyIncome
	 * @return:		List<AdminOrders>
	 * @exception:	查询-LIST
	 */
	public List<AdminMyIncome> selectList(String sqlId, AdminMyIncome searchMap) {
		try {
			return myIncomeDao.selectList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminMyIncome
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */
	/*public void insertDomain(String sqlId, AdminGoods paramIn) {
		try {
			goodsDao.insertDomain(sqlId, paramIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminMyIncome>
	 * @exception:	店铺商品登记一级分类查询
	 */ 
	/*public List<AdminGoods> selectGoodsClass(String sqlId, AdminGoods searchMap) {
		try {
			return goodsDao.selectGoodsClass(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}*/
}
