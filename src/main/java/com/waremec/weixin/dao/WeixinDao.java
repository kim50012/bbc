package com.waremec.weixin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.AccessToken;
import com.waremec.weixin.domain.ApiTicket;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.ExecutionLog;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.WeixinPageExecutionLog;
import com.waremec.weixin.domain.WeixinSessionPageExeLog;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:06 
*  
*/
@Repository
public class WeixinDao extends CommonDao {

	/** 
	*
	* @return
	*/
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<AppInfo> selectAllAppInfoList() {
	 
		return (List<AppInfo>) getSqlMapClientTemplate().queryForList("Weixin.selectAllAppInfoList");
		 
	}

	
	@SuppressWarnings("deprecation")
	public AppInfo selectAppInfoByKey(String key) {
		return (AppInfo) getSqlMapClientTemplate().queryForObject("Weixin.selectAppInfoByKey", key);
	}
	@SuppressWarnings("deprecation")
	public AppInfo selectAppInfoByShopId(Integer shopId) {
		return (AppInfo) getSqlMapClientTemplate().queryForObject("Weixin.selectAppInfoByShopId", shopId);
	}
	@SuppressWarnings("deprecation")
	public AppInfo selectAppInfoByOriginalAppId(String originalAppId) {
		return (AppInfo) getSqlMapClientTemplate().queryForObject("Weixin.selectAppInfoByOriginalAppId", originalAppId);
	}
	@SuppressWarnings("deprecation")
	public AppInfo selectAppInfoByAppId(String appId) {
		return (AppInfo) getSqlMapClientTemplate().queryForObject("Weixin.selectAppInfoByAppId", appId);
	}
	
	@SuppressWarnings("deprecation")
	public MchInfo selectMchInfoByKey(String key) {
		return (MchInfo)getSqlMapClientTemplate().queryForObject("Weixin.selectMchInfoByKey", key);
	}
	
	@SuppressWarnings("deprecation")
	public MchInfo selectMchInfoByShopId(Integer shopId) {
		return (MchInfo)getSqlMapClientTemplate().queryForObject("Weixin.selectMchInfoByShopId", shopId);
	}
	
	@SuppressWarnings("deprecation")
	public String getAccessToken(String key) {
		return (String) getSqlMapClientTemplate().queryForObject("Weixin.getAccessToken", key);
	}
	

	@SuppressWarnings("deprecation")
	public void saveAccessToken(AccessToken accessToken) {
		getSqlMapClientTemplate().update("Weixin.saveAccessToken",accessToken);
	}
	@SuppressWarnings("deprecation")
	public String getApiTicket(String key) {
		return (String) getSqlMapClientTemplate().queryForObject("Weixin.getApiTicket", key);
	}
	
	@SuppressWarnings("deprecation")
	public void saveApiTicket(AppInfo appInfo, ApiTicket apiTicket) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("SYS_ID", appInfo.getSysId());
		map.put("TICKET", apiTicket.getTicket());
		
		getSqlMapClientTemplate().update("Weixin.saveApiTicket",map);
	}


	/** 
	*
	* @param executionLog
	*/
	public void insertExecutionLog(ExecutionLog executionLog) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().insert("Weixin.insertExecutionLog",executionLog);
	}
	
	public void insertWeixinSessionPageExeLog(WeixinSessionPageExeLog weixinSessionPageExeLog) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().insert("Weixin.insertWeixinSessionPageExeLog",weixinSessionPageExeLog);
	}
	public void insertWeixinPageExecutionLog(WeixinPageExecutionLog weixinPageExecutionLog) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().insert("Weixin.insertWeixinPageExecutionLog",weixinPageExecutionLog);
	}


	/** 
	*
	* @param map
	*/
	public void insertMenuClickLogging(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().insert("Weixin.insertMenuClickLogging",map);
	}


	/** 
	*
	* @param shopId
	* @return
	*/
	public String selectWechatNoByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return (String) getSqlMapClientTemplate().queryForObject("Weixin.selectWechatNoByShopId", shopId);
	}
	 
	
}
