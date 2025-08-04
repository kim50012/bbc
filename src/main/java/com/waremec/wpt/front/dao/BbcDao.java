package com.waremec.wpt.front.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.domain.SessionMember;
import com.waremec.wpt.front.domain.BbcAtrClbBbd;
import com.waremec.wpt.front.domain.SessionSkin;

@Repository
public class BbcDao extends CommonDao{
	
	public SessionSkin getSessionSkinByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return (SessionSkin)getSqlMapClientTemplate().queryForObject("Bbc.getSessionSkinByShopIdBbc",shopId);
	}

	public List<BbcAtrClbBbd> selectBbcAtrClbBbd(String sqlId, Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (List<BbcAtrClbBbd>)getSqlMapClientTemplate().queryForList(sqlId, searchMap);
	}

	public BbcAtrClbBbd selectBbcAtrClbBbdOne(String sqlId, Map<String, Object> searchMap) {
		// TODO Auto-generated method stub
		return (BbcAtrClbBbd)getSqlMapClientTemplate().queryForObject(sqlId, searchMap);
	}
	

	@SuppressWarnings("deprecation")
	public SessionMember getSessionMemberById(String openid) {
		try {
			return (SessionMember)getSqlMapClientTemplate().queryForObject("Bbc.getSessionMemberById",openid);
		} catch (Exception e) {
			logger.error("++++++++++++++++++++++++++++++++++++++++++++++++++=");
			e.printStackTrace();
			return null;
		}
	}
	

	
}
