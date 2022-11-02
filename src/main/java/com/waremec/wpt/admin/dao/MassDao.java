package com.waremec.wpt.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;

@Repository
@SuppressWarnings("unchecked")
public class MassDao extends CommonDao{

	public Integer saveMassMessage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>)getSqlMapClientTemplate().queryForObject("Mass.saveMassMessage", map);
	 
		Integer messageId = (Integer)result.get("OUT_MESSAGE_ID");
		String OUT_ERR_MSG = (String)result.get("OUT_ERR_MSG");
		
		if(messageId == 0){
			throw new ProcedureBizException(OUT_ERR_MSG);
		}
		
		return messageId;
	}

	public List<String> selectMassToUserList(Integer messageId) {
		List<String>  list = new ArrayList<String>();
		List<Map<String,Object>> listmap = (List<Map<String,Object>>)getSqlMapClientTemplate().queryForList("Mass.selectMassToUserList", messageId);
		 
		for (Map<String, Object> map : listmap) {
			list.add((String)map.get("OPENID"));
		}
		
		return list;
	}

	public void saveSendResult(Map<String, Object> map){
		// TODO Auto-generated method stub
		 getSqlMapClientTemplate().queryForObject("Mass.saveSendResult", map);
	}

	public void saveSendTarget(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 getSqlMapClientTemplate().queryForObject("Mass.saveSendTarget", map);
		 
	}
	 
}
