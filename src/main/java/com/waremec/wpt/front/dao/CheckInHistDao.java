package com.waremec.wpt.front.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminCheckIn;
import com.waremec.wpt.admin.domain.AdminCustShop;
import com.waremec.wpt.front.domain.FrontCheckInHist;


@Repository
@SuppressWarnings("unchecked")
public class CheckInHistDao extends CommonDao{
	/**
	 * @author chenzheng
	 * @param string
	 * @param Map<String,Object>
	 * @return 查询客户信息
	 */
	public Map<String,Object> selectCust(String string,
			Map<String,Object> searchMap) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject(string,searchMap);
				
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param frontCheckInHist
	 * @return 签到历史的创建
	 */

	public void insertCheckInHist(String sqlId, FrontCheckInHist saveIn) {
		
		 getSqlMapClientTemplate().insert(sqlId,saveIn);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCheckIn
	 * @return 查询签到规则信息
	 */
	public AdminCheckIn selectCheckIn(String string,
			AdminCheckIn adminCheckIn) {
		return (AdminCheckIn) getSqlMapClientTemplate().queryForObject(string,adminCheckIn);
				
	}
	/**
	 * @author chenzheng
	 * @param void
	 * @param adminCustShop
	 * @return 客户积分的修改
	 */

	public void updatePoint(String sqlId, AdminCustShop updateIn) {
		
		 getSqlMapClientTemplate().update(sqlId,updateIn);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param FrontCheckInHist
	 * @return 查询签到历史信息
	 */
	public List<FrontCheckInHist> selectHist(String string,
			FrontCheckInHist frontCheckInHist) {
		return getSqlMapClientTemplate().queryForList(string,frontCheckInHist);
				
	}
	/**
	 * @author chenzheng
	 * @param integer
	 * @return 查询总条数
	 */
	public int selectCount(String string,
			FrontCheckInHist frontCheckInHist) {
		return (Integer) getSqlMapClientTemplate().queryForObject(string,frontCheckInHist);
	}
	
	/**
	 * @author chenzheng
	 * @param string
	 * @param FrontCheckInHist
	 * @return 查询签到规则信息
	 */
	public List<AdminCheckIn> selectMst(String string,
			AdminCheckIn adminCheckIn) {
		return getSqlMapClientTemplate().queryForList(string,adminCheckIn);
				
	}
}
