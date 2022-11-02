package com.waremec.wpt.front.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.front.domain.FrontOrder;
import com.waremec.wpt.front.domain.FrontOrderConfirm;

@Repository
public class OrderConfirmDao extends CommonDao {
	/**
	 * @author wangbin
	 * @param string
	 * @param map
	 * @return 订单确认页面信息
	 */
	public List<FrontOrderConfirm> selectOrderConfirmList(String string, FrontOrderConfirm map) {
		return getSqlMapClientTemplate().queryForList(string, map);
	}

	/**
	 * @author wangbin
	 * @param string
	 * @param map
	 * @throws Exception
	 *             修改默认地址
	 */
	public void updateModifyAddress(String string, Map<String, Object> map) {
		getSqlMapClientTemplate().update(string, map);
	}

	/**
	 * @author wangbin
	 * @param string
	 * @param map
	 * @throws Exception
	 *             删除默认地址。
	 */
	public void deleteAddress(String string, Map<String, Object> map) {
		getSqlMapClientTemplate().delete(string, map);
	}

	/**
	 * @author  
	 * @param frontOrder
	 * @return 订单的ID号
	 */
	public Map<String, Object> saveOrderConfirm( FrontOrder frontOrder) {
		
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("OrderConfirm.saveOrderConfirm", frontOrder);
	 
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return result;
	}

}
