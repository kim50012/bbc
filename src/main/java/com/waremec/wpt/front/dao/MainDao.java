package com.waremec.wpt.front.dao;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.wpt.front.domain.SessionSkin;

@Repository
public class MainDao extends CommonDao{
	
	public SessionSkin getSessionSkinByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return (SessionSkin)getSqlMapClientTemplate().queryForObject("Main.getSessionSkinByShopId",shopId);
	}
	
}
