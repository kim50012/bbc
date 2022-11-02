package com.waremec.weixin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.weixin.dao.WeixinDao;
import com.waremec.weixin.domain.AccessToken;
import com.waremec.weixin.domain.Account;
import com.waremec.weixin.domain.ApiTicket;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.ExecutionLog;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.WeixinPageExecutionLog;
import com.waremec.weixin.domain.WeixinSessionPageExeLog;
import com.waremec.weixin.exception.InvalidAccountException;
import com.waremec.weixin.exception.WeixinAuthException;
import com.waremec.weixin.utils.WeixinUtils;

/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:41 
*  
*/
@Service
public class WeixinService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	@Resource
	private WeixinDao weixinDao;
	
	
	
	/** 
	*  随机生成公众账号基本信息 包括（sysid， token， EncodingAESKey）
	* @return
	*/
	public Account generateAccount(){
		
		Account account = new Account();
		
		String sysId = RandomUtils.generateRandomString(32).toUpperCase();
		String token = RandomUtils.generateRandomString();
		String encodingAESKey = RandomUtils.generateRandomString(43);
		
		account.setSysId(sysId);
		account.setToken(token);
		account.setEncordingAesKey(encodingAESKey);
		return account;
	}
	
	
	/** 
	* 获取全部公众账号信息
	* @return List<AppInfo> 公众账号信息List
	*/
	public List<AppInfo> selectAllAppInfoList() {
		// TODO Auto-generated method stub
		return weixinDao.selectAllAppInfoList();
	}
	 
	
	/** 
	* 根据ID获取公众账号信息
	* @param key ID
	* @return AppInfo 公众账号信息
	*/
	public AppInfo selectAppInfoByKey(String key) {
		try {
			AppInfo appInfo = weixinDao.selectAppInfoByKey(key);
			if(appInfo == null){
				logger.error("您没有操作公众账号的权限 key=" + key);
				throw new InvalidAccountException("您没有操作公众账号的权限");
			}
			return appInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	/** 
	*根据shopId获取公众账号信息
	* @param shopId
	* @return AppInfo 公众账号信息
	*/
	public AppInfo selectAppInfoByShopId(Integer shopId) {
		try {
			AppInfo appInfo = weixinDao.selectAppInfoByShopId(shopId);
			if(appInfo == null){
				logger.error("您没有操作公众账号的权限 shopId=" + shopId);
				throw new InvalidAccountException("您没有操作公众账号的权限");
			}
			return appInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	
	/** 
	* 根据公众账号原始ID获取公众账号信息
	* @param originalAppId 公众账号原始ID
	* @return AppInfo 公众账号信息
	*/
	public AppInfo selectAppInfoByOriginalAppId(String originalAppId) {
		try {
			AppInfo appInfo = weixinDao.selectAppInfoByOriginalAppId(originalAppId);
			if(appInfo == null){
				logger.error("您没有操作公众账号的权限 originalAppId=" + originalAppId);
				throw new InvalidAccountException("您没有操作公众账号的权限");
			}
			return appInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	/** 
	 * 根据公众账号App ID获取公众账号信息
	 * @param appId 公众账号ID
	 * @return AppInfo 公众账号信息
	 */
	public AppInfo selectAppInfoByAppId(String appId) {
		try {
			AppInfo appInfo = weixinDao.selectAppInfoByAppId(appId);
			if(appInfo == null){
				logger.error("您没有操作公众账号的权限 appId=" + appId);
				throw new InvalidAccountException("您没有操作公众账号的权限");
			}
			return appInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	
	/** 
	 * 根据公众账号App ID获取公众账号信息
	 * @param appId 公众账号ID
	 * @return AppInfo 公众账号信息
	 * 
	 */
	public AppInfo selectAppInfoByAppIdAndNoException(String appId) {
		return weixinDao.selectAppInfoByAppId(appId);
	}
	
	
	/** 
	* 根据ID获取支付账号信息
	* @param key ID
	* @return MchInfo 支付账号信息
	*/
	public MchInfo selectMchInfoByKey(String key) {
		try {
			MchInfo mchInfo = weixinDao.selectMchInfoByKey(key);
			if(mchInfo == null){
				logger.error("您没有微信支付的权限 key=" + key);
				throw new InvalidAccountException("您没有微信支付的权限");
			}
			return mchInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
		 
	}
	
	/** 
	* 根据shopId获取支付账号信息
	* @param shopId
	* @return MchInfo 支付账号信息
	*/
	public MchInfo selectMchInfoByShopId(Integer shopId) {
		try {
			MchInfo mchInfo = weixinDao.selectMchInfoByShopId(shopId);
			if(mchInfo == null){
				logger.error("您没有微信支付的权限 shopId=" + shopId);
				throw new InvalidAccountException("您没有微信支付的权限");
			}
			return mchInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	
	/** 
	* 获取 access token
	* @param appInfo
	* @return String  access token
	*/
	public String getAccessToken(AppInfo appInfo){
		if(appInfo == null){
			throw new WeixinAuthException(WeixinAuthException.APP_INFO_ERROR);
		}
		//1.从数据库获取
		String token = weixinDao.getAccessToken(appInfo.getSysId());
		System.out.println(token);
		if(StringUtils.isEmpty(token)){
			logger.info("<><><><><><><><><><><><><><><><><><><><>");
			logger.info("access token expires,create new access token");
			token = WeixinUtils.getAccessToken(appInfo.getAppId(), appInfo.getAppSecret());
			logger.info("token======================================================+"+token);
			weixinDao.saveAccessToken(new AccessToken(appInfo.getSysId(),token));
		}
		
		return token;
	}
	
	public String getAccessToken1(AppInfo appInfo){
		if(appInfo == null){
			throw new WeixinAuthException(WeixinAuthException.APP_INFO_ERROR);
		}
		//1.从数据库获取
		String token = null;
		System.out.println(token);
		if(StringUtils.isEmpty(token)){
			logger.info("<><><><><><><><><><><><><><><><><><><><>");
			logger.info("access token expires,create new access token");
			token = WeixinUtils.getAccessToken("wxb06504914e40437c", "5852e197890ed082f38fef166e2d5283");
			logger.info("token======================================================+"+token);
			weixinDao.saveAccessToken(new AccessToken(appInfo.getSysId(),token));
		}
		
		return token;
	}
	
	/** 
	* 获取 access token
	* @param shopId
	* @return String  access token
	*/
	public String getAccessToken(Integer shopId){
		return getAccessToken(selectAppInfoByShopId(shopId));
	}
	
	/** 
	* 获取 access token
	* @param key
	* @return String  access token
	*/
	public String getAccessToken(String key){
		return getAccessToken(selectAppInfoByKey(key));
	}
	
	
	/** 
	*  获取 api ticket
	* @param appInfo
	* @return String api ticket
	*/
	public String getApiTicket(AppInfo appInfo){
		if(appInfo == null){
			throw new WeixinAuthException(WeixinAuthException.APP_INFO_ERROR);
		}
		//1.从数据库获取
		String ticket = weixinDao.getApiTicket(appInfo.getSysId());
		if(StringUtils.isEmpty(ticket)){
			logger.info("Ticket expires,create new ticket");
			ApiTicket apiTicket = WeixinUtils.getApiTicket(getAccessToken(appInfo));
			weixinDao.saveApiTicket(appInfo,apiTicket);
			ticket = apiTicket.getTicket();
		}
		
		return ticket;
	}
	
	/** 
	* 获取 api ticket
	* @param shopId
	* @return String api ticket
	*/
	public String getApiTicket(Integer shopId){
		return getApiTicket(selectAppInfoByShopId(shopId));
	}
	/** 
	*获取 api ticket
	* @param key
	* @return String api ticket
	*/
	public String getApiTicket(String key){
		return getApiTicket(selectAppInfoByKey(key));
	}


	/** 
	*
	* @param executionLog
	*/
	public void insertExecutionLog(ExecutionLog executionLog) {
		// TODO Auto-generated method stub
		weixinDao.insertExecutionLog(executionLog);
	}
	
	public void insertWeixinSessionPageExeLog(WeixinSessionPageExeLog weixinSessionPageExeLog) {
		// TODO Auto-generated method stub
		weixinDao.insertWeixinSessionPageExeLog(weixinSessionPageExeLog);
	}


	/** 
	*
	* @param weixinPageExecutionLog
	*/
	public void insertWeixinPageExecutionLog(WeixinPageExecutionLog weixinPageExecutionLog) {
		// TODO Auto-generated method stub
		weixinDao.insertWeixinPageExecutionLog(weixinPageExecutionLog);
	}


	/** 
	*
	* @param map
	*/
	public void insertMenuClickLogging(Map<String, Object> map) {
		// TODO Auto-generated method stub
		weixinDao.insertMenuClickLogging(map);
	}


	/** 
	* 获取微信公众平台微信号
	* @param shopId
	* @return
	*/
	public String getWechatNoByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return weixinDao.selectWechatNoByShopId(shopId);
	}


	/** 
	* 检查第三方公司接口账户的有效性
	* @param appInfo 公众账号信息
	* @param hzmIfId 接口ID
	* @param hzmIfPw 接口密码
	*/
	public void accountIsValid(AppInfo appInfo, String hzmIfId, String hzmIfPw) {
		// TODO Auto-generated method stub
		if(!appInfo.getIfUserId().equals(hzmIfId) || !appInfo.getIfPassword().equals(hzmIfPw)){
			throw new InvalidAccountException("账号信息不符");
		}
		
	}

}
