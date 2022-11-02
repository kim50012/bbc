package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminCustShop;
import com.waremec.wpt.admin.domain.AdminGrade;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminWxMessageInfoEtc;

@Repository
@SuppressWarnings("unchecked")
public class CustDao extends CommonDao{
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询用户信息
	 */
	public List<Map<String,Object>> selectCustList(String string,
			Map<String,Object> searchMap) {
		return getSqlMapClientTemplate().queryForList(string, searchMap);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminMap
	 * @return 查询区域
	 */
	public List<AdminMap> selectMapList(String string,
			AdminMap adminMap) {
		return getSqlMapClientTemplate().queryForList(string, adminMap);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCustShop
	 * @return 根据用户id查询等级
	 */
	public AdminCustShop selectGradeById(String string,
			AdminCustShop adminCustShop) {
		return (AdminCustShop)getSqlMapClientTemplate().queryForObject(string,adminCustShop);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCustShop
	 * 更新操作
	 */
	public void updateCustShop(String string,
			AdminCustShop adminCustShop) {
		 getSqlMapClientTemplate().update(string,adminCustShop);
				
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminCustShop
	 * @return 查询总条数
	 */
	public int selectCount(String string,
			AdminCustShop adminCustShop) {
		return (Integer) getSqlMapClientTemplate().queryForObject(string,adminCustShop);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询等级信息
	 */
	public List<AdminGrade> selectGrade(String string,
			AdminGrade adminGrade) {
		return getSqlMapClientTemplate().queryForList(string, adminGrade);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询一个用户信息
	 */
	public Map<String,Object> selectChat(String string,
			Map<String,Object> searchMap) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject(string,searchMap);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param searchMap
	 * @return 查询用户信息
	 */
	public List<Map<String,Object>> selectChatList(String string,
			Map<String,Object> searchMap) {
		return getSqlMapClientTemplate().queryForList(string, searchMap);
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminWxMessageInfoEtc
	 * 插入操作
	 */
	public void insertWxMessageInfoEtc(String string,
			AdminWxMessageInfoEtc adminWxMessageInfoEtc) {
		 getSqlMapClientTemplate().insert(string,adminWxMessageInfoEtc);
				
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminWxMessageInfoEtc
	 * 更新操作
	 */
	public void updateWxMessageInfoEtc(String string,
			AdminWxMessageInfoEtc adminWxMessageInfoEtc) {
		 getSqlMapClientTemplate().update(string,adminWxMessageInfoEtc);
				
	}
	/**
	 * @author chenzheng
	 * @param string
	 * @param adminWxMessageInfoEtc
	 * @return 根据id查询
	 */
	public int selectById(String string,
			AdminWxMessageInfoEtc adminWxMessageInfoEtc) {
		return (Integer)getSqlMapClientTemplate().queryForObject(string,adminWxMessageInfoEtc);
	}
	public void modifyCustInfo(Map<String, Object> saveMap) {
		// TODO Auto-generated method stub
		Map<String, Object> result = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Cust.modifyCustInfo",saveMap);
		
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
	}
}
