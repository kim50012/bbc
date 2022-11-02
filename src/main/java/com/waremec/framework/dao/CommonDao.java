package com.waremec.framework.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.waremec.wpt.admin.domain.AdminGrade;
import com.waremec.wpt.admin.domain.AdminGroup;
import com.waremec.wpt.admin.domain.AdminGroupCorp;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.AdminUser;





@Repository("commonDao")
@SuppressWarnings("unchecked")
public class CommonDao extends SqlMapClientDaoSupport {

	protected final Log logger = LogFactory.getLog(this.getClass());

	public final static String SQL_ID = "SQL_ID";
	public final static String TOTAL_COUNT = "totalCount";
	public final static String SUCCESS = "S";


	public void insert(Map<String, Object> map) {
		insert((String) map.get(SQL_ID), map);
	}

	@SuppressWarnings("deprecation")
	public void insert(String sqlId, Map<String, Object> map) {
		getSqlMapClientTemplate().insert(sqlId, map);
	}

	public void update(Map<String, Object> map) {
		update((String) map.get(SQL_ID), map);
	}

	@SuppressWarnings("deprecation")
	public void update(String sqlId, Map<String, Object> map) {
		getSqlMapClientTemplate().update(sqlId, map);
	}

	public void delete(Map<String, Object> map) {
		delete((String) map.get(SQL_ID), map);
	}

	@SuppressWarnings("deprecation")
	public void delete(String sqlId, Map<String, Object> map) {
		getSqlMapClientTemplate().delete(sqlId, map);
	}

	public Map<String, Object> select(Map<String, Object> searchMap) {
		return select((String) searchMap.get(SQL_ID), searchMap);
	}

	public Map<String, Object> select(String sqlId,
			Map<String, Object> searchMap) {
		return (Map<String, Object>) selectObject(sqlId, searchMap);
	}

	public Map<String, Object> select(String sqlId, String queryStr) {
		return (Map<String, Object>) selectObject(sqlId, queryStr);
	}

	@SuppressWarnings("deprecation")
	public Object selectObject(String sqlId, String queryStr) {
		return getSqlMapClientTemplate().queryForObject(sqlId, queryStr);
	}

	@SuppressWarnings("deprecation")
	public Object selectObject(String sqlId, Map<String, Object> searchMap) {
		return getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}

	public List<Map<String, Object>> selectList(Map<String, Object> searchMap) {
		return selectList((String) searchMap.get(SQL_ID), searchMap);
	}
	 
	@SuppressWarnings("deprecation")
	public List<Map<String, Object>> selectList(String sqlId, Map<String, Object> searchMap) {
		return (List<Map<String, Object>>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}

	@SuppressWarnings("deprecation")
	public List<Map<String, Object>> selectList(String sqlId, String queryStr) {
		return (List<Map<String, Object>>)getSqlMapClientTemplate().queryForList(sqlId, queryStr);
	}

	public int selectListTotCnt(Map<String, Object> searchMap) {
		String sqlId = (String) searchMap.get(SQL_ID);
		return selectListTotCnt(sqlId, searchMap);
	}

	@SuppressWarnings("deprecation")
	public int selectListTotCnt(String sqlId, Map<String, Object> searchMap) {
		Integer count = null;
		try {
			getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
			count = (Integer)searchMap.get(TOTAL_COUNT);
		} catch (Exception e) {
			e.printStackTrace();
			count = 0;
		}
		return count ;

	}

	@SuppressWarnings("deprecation")
	public Object selectToObject(String sqlId, Map<String, Object> searchMap) {
		return getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}

	@SuppressWarnings("deprecation")
	public String selectString(String sqlId, Map<String, Object> searchMap) {
		return (String) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
	
	@SuppressWarnings("deprecation")
	public int selectInteger(String sqlId, Map<String, Object> searchMap) {
		return (Integer) getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}

	public void selectNoReturn(Map<String, Object> searchMap) {
		String sqlId = (String) searchMap.get(SQL_ID);
		selectNoReturn(sqlId ,searchMap);
		
	}

	@SuppressWarnings("deprecation")
	public void selectNoReturn(String sqlId, Map<String, Object> searchMap) {
		getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
 
}
