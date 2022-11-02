package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminPromotion;

@Repository
@SuppressWarnings("unchecked")
public class PromotionDao extends CommonDao {

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminPromotion>
	 * @exception:	店铺促销管理一查询
	 */ 
	public List<AdminPromotion> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		return (List<AdminPromotion>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminPromotion> selectProList(String sqlId, AdminPromotion searchMap) {
		return (List<AdminPromotion>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */ 
	public void insertDomain(String sqlId, AdminPromotion paramIn) {
		getSqlMapClientTemplate().insert(sqlId, paramIn);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminPromotion> selectGoodsClass(String sqlId, AdminPromotion searchMap) {
		return (List<AdminPromotion>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	public int selectCount(String sqlId, AdminPromotion searchMap) {
		return (Integer) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
}
