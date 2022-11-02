package com.waremec.wpt.front.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;

@Repository
@SuppressWarnings("unchecked")
public class FavoritesDao extends CommonDao {
	public List<Map<String, Object>> selectFavoritesList(String string, Map<String, Object> searchMap) {
		return getSqlMapClientTemplate().queryForList(string, searchMap);
	}

	public void updateNum(String string, Map<String, Object> searchMap) {
		getSqlMapClientTemplate().update(string, searchMap);
	}

	public void delete(String string, Map<String, Object> searchMap) {
		getSqlMapClientTemplate().delete(string, searchMap);
	}
}