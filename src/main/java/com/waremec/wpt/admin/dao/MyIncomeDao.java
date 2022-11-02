package com.waremec.wpt.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminMyIncome;

@Repository
@SuppressWarnings("unchecked")
public class MyIncomeDao extends CommonDao {

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @param: sqlId,searchMap--Map
	 * @return: List<AdminGoods>
	 * @exception: 店铺商品分类一查询
	 */
	/*
	 * public List<AdminGoods> selectshopGoodsClassMap(String sqlId, Map<String,
	 * Object> searchMap) { return
	 * (List<AdminGoods>)getSqlMapClientTemplate().queryForList(sqlId,
	 * searchMap); }
	 */

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @param: sqlId,searchMap--AdminMyIncome
	 * @return: List<AdminOrders>
	 * @exception: 查询-LIST
	 */
	public List<AdminMyIncome> selectList(String sqlId, AdminMyIncome searchMap) {
		return (List<AdminMyIncome>) getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @param: sqlId,paramIn--AdminGoods
	 * @return: void
	 * @exception: 店铺商品分类一保存
	 */
	/*
	 * public void insertDomain(String sqlId, AdminGoods paramIn) {
	 * getSqlMapClientTemplate().insert(sqlId, paramIn); }
	 */

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @param: sqlId,searchMap--AdminGoods
	 * @return: List<AdminGoods>
	 * @exception: 店铺商品分类一查询
	 */
	/*
	 * public List<AdminGoods> selectGoodsClass(String sqlId, AdminGoods
	 * searchMap) { return
	 * (List<AdminGoods>)getSqlMapClientTemplate().queryForList(sqlId,
	 * searchMap); }
	 */

}
