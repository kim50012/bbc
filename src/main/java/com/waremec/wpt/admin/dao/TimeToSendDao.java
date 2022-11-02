package com.waremec.wpt.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;


@Repository
@SuppressWarnings("unchecked")
public class TimeToSendDao extends CommonDao {
	/**
	 * @author chenzheng
	 * @param List<Map<String,Object>>
	 * @return 定时发送内容查询
	 */

	public List<Map<String,Object>> selectContant(String string,
			Map<String,Object> searchMap) {
		return  getSqlMapClientTemplate().queryForList(string,searchMap);
	}
	
}
