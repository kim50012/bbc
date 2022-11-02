package com.waremec.wpt.admin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.admin.domain.NewsItem;

@Repository
public class MaterialDao extends CommonDao {

	public Integer addNewsMaterial(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Material.addNewsMaterial", map);
		
		Integer msgId = (Integer)result.get("OUT_MSG_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return msgId;
	}
	
	public Integer modifyNewsMaterial(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Material.modifyNewsMaterial", map);
		
		Integer msgId = (Integer)result.get("OUT_MSG_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return msgId;
	}

	public void addNewsMaterialItem(NewsItem newsItem) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Material.addNewsMaterialItem", newsItem);
		
		
		Integer newsId = (Integer)result.get("OUT_NEWS_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(!"S".equals(OUT_ERR_MSG)){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
	}

	public void modifyNewsMaterialItem(NewsItem item) {
		// TODO Auto-generated method stub
			Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Material.modifyNewsMaterialItem", item);
			
			
			Integer newsId = (Integer)result.get("OUT_NEWS_ID");
			String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
			
			if(!"S".equals(OUT_ERR_MSG)){
				throw new ProcedureBizException(OUT_ERR_MSG);
			}
	}
	 
}
