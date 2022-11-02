package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminOrders;

@Repository
@SuppressWarnings("unchecked")
public class OrdersDao extends CommonDao {

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一查询
	 */ 
	/*public List<AdminGoods> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		return (List<AdminGoods>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}*/
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminOrders
	 * @return:		List<AdminOrders>
	 * @exception:	查询-LIST
	 */ 
	public List<AdminOrders> selectList(String sqlId, AdminOrders searchMap) {
		return (List<AdminOrders>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	} 
	public AdminOrders select(String sqlId, AdminOrders searchMap) {
		return (AdminOrders)getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	订单一保存
	 */ 
	public void insertDomain(String sqlId, AdminOrders paramIn) {
		getSqlMapClientTemplate().insert(sqlId, paramIn);
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminOrders
	 * @return:		INT
	 * @exception:	查询-COUNT
	 */ 
	public int selectCount(String sqlId, AdminOrders searchMap) {
		return (Integer) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}

	public Map<String, Object> getOrderInfoById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>)getSqlMapClientTemplate().queryForObject("AdminOrdersAll.getOrderInfoById", map);
	}

	public Map<String, Object> selectOrderRefundInfo(Map<String, Object> map) {
		  Map<String, Object> result = (Map<String, Object>)getSqlMapClientTemplate().queryForObject("AdminOrdersAll.selectOrderRefundInfo", map);
		// TODO Auto-generated method stub
		 String OUT_ERR_MSG = (String) result.get("OUT_ERR_MSG");
		 if(!"S".equals(OUT_ERR_MSG)){
			 throw new ProcedureBizException(OUT_ERR_MSG);
		 }
		return result;
	}
	
}
