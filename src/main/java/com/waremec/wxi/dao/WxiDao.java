package com.waremec.wxi.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.waremec.wxi.domain.DKFAcountDomain;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.msg.Article;
import com.waremec.weixin.domain.user.UserReturn;

@Repository
@SuppressWarnings("deprecation")
public class WxiDao extends SqlMapClientDaoSupport{

	  
	
	public List<DKFAcountDomain> dkfAccountByDKFKeyword(String content,int shopId){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("content", content);
		params.put("shopId", shopId);
		return getSqlMapClientTemplate().queryForList("wxi.dkfAccountByDKFKeyword", params);
	}
	
	public List<DKFAcountDomain> dkfAccountByMaster(int shopId,List<DKFAcountDomain> account){
		List<DKFAcountDomain> masterList = new ArrayList<DKFAcountDomain>();
		for(int i=0;i<account.size();i++){
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("shopId", shopId);
			params.put("account", account.get(i).getAccount());
			DKFAcountDomain masterAccount = (DKFAcountDomain) getSqlMapClientTemplate().queryForObject("wxi.dkfAccountByMaster",params);
			if(masterAccount != null){
				masterList.add(masterAccount);
			}
 		}
 		return masterList;
	}
	
	public List<Article> dkfAccountByARSKeyword(String content,int shopId){
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("content", content);
		params.put("shopId", shopId);
		return getSqlMapClientTemplate().queryForList("wxi.dkfAccountByARSKeyword", params);
	}
	
	
	public UserReturn userInfoToIF(String sysId,String openId){
		Map<String,Object> params = new HashMap<String,Object>();
 		params.put("sysId", sysId);
		params.put("openId", openId);
		return (UserReturn)getSqlMapClientTemplate().queryForObject("wxi.userInfoToIF",params);
	}
 
}
