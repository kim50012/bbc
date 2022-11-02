package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminVote;

@Repository
@SuppressWarnings("unchecked")
public class VoteDao extends CommonDao {

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminVote>
	 * @exception:	店铺促销管理一查询
	 */ 
	public List<AdminVote> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		return (List<AdminVote>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminVote> selectList(String sqlId, AdminVote searchMap) {
		return (List<AdminVote>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	public AdminVote select(String sqlId, AdminVote searchMap) {
		return (AdminVote)getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	店铺商品分类一保存
	 */ 
	public void insertDomain(String sqlId, AdminVote paramIn) {
		getSqlMapClientTemplate().insert(sqlId, paramIn);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminGoods
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	public List<AdminVote> selectGoodsClass(String sqlId, AdminVote searchMap) {
		return (List<AdminVote>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	public int selectCount(String sqlId, AdminVote searchMap) {
		return (Integer) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
}
