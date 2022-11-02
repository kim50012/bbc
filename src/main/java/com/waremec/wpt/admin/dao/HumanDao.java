package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.AdminHuman;

@Repository
@SuppressWarnings("unchecked")
public class HumanDao extends CommonDao {

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminHuman>
	 * @exception:	演讲管理一查询
	 */ 
	public List<AdminHuman> getListDomain(String sqlId, AdminHuman searchMap) {
		return (List<AdminHuman>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	public AdminHuman getDomain(String sqlId, AdminHuman searchMap) {
		return (AdminHuman)getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
	public Map<String, Object> getList(String sqlId, Map<String, Object> searchMap) {
		return (Map<String, Object>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}
	public void insertDomain(String sqlId, AdminHuman paramIn) {
		getSqlMapClientTemplate().insert(sqlId, paramIn);
	}
	public int getListCount(String sqlId, AdminHuman searchMap) {
		return (Integer) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
}
