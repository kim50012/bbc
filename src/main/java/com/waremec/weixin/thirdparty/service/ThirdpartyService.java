/**   
* @Title: WeixinCustomService.java 
* @Package com.waremec.weixin.service 
* @Description:  
* @author taebem
* @date 2015年9月22日 下午4:40:59 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.thirdparty.dao.ThirdpartyDao;
import com.waremec.weixin.thirdparty.domain.AuthorizationInfo;
import com.waremec.weixin.thirdparty.domain.AuthorizerInfo;
import com.waremec.weixin.thirdparty.domain.BusinessInfo;
import com.waremec.weixin.thirdparty.domain.GetAuthorizerInfoReturn;
import com.waremec.weixin.thirdparty.domain.PreAuthCode;
import com.waremec.weixin.thirdparty.domain.QueryAuth;
import com.waremec.weixin.thirdparty.domain.Token;
import com.waremec.weixin.thirdparty.utils.ThirdpartyUtils;

/** 
 * @Package com.waremec.weixin.thirdparty.service 
 * @FileName ThirdpartyService
 * @Description  第三方平台有关服务
 * @author naRan 
 * @date 2017年3月29日  14:35:59 
 *  
 */
@Service
public class ThirdpartyService  extends CommonServiceImpl implements CommonService{
	
	@Resource
	protected ThirdpartyDao thirdpartyDao;
	
	
	/** 
	 * 保存 ComponentVerifyTicket
	 * @param map
	 */
	public Map<String, Object>  saveComponentVerifyTicket (Map<String, String> map) {
		Map<String, Object> setMap = new HashMap<String, Object>();
		setMap.put("AppId", map.get("AppId"));
		setMap.put("InfoType", map.get("InfoType"));
		setMap.put("ComponentVerifyTicket", map.get("ComponentVerifyTicket"));
		setMap.put("CreateTime", map.get("CreateTime"));
		return thirdpartyDao.select("Thirdparty.WX_OP_VERIFY_TICKET_INSERT", setMap);
	}
	
	/** 
	 * 查询 ComponentVerifyTicket
	 * @param map
	 */
	public Map<String, Object>  getComponentVerifyTicket (Map<String, Object> map) {
		return thirdpartyDao.select("Thirdparty.WX_OP_VERIFY_TICKET_SELECT", map);
	}
	/** 
	 * 查询 ComponentVerifyTicketByAppId
	 * @param map
	 */
	public Map<String, Object>  ComponentVerifyTicketByAppId (String appId) {
		Map<String, Object> setMap = new HashMap<String, Object>();
		setMap.put("appId",appId);
		return thirdpartyDao.select("Thirdparty.WX_OP_VERIFY_TICKET_SELECT", setMap);
	}
	
	/** 
	 * 更新component_access_token
	 * @param map
	 */
	public Map<String, Object> getComponentAccessToken (Map<String, Object> map, String appSecret) {
//		public Map<String, Object> getComponentAccessToken (Map<String, Object> map, Map<String,Object> weixinInfo) {
		
		Map<String, Object> m = null;
		
		//检查有效期,10分钟剩余
		if(this.checkExpiresIn(String.valueOf(map.get("CA_TOKEN_EXPIRES_IN")), 10)){
//			if(this.checkExpiresIn(String.valueOf(map.get("CA_TOKEN_EXPIRES_IN")), 10)){
			m = map;
			m.put("OUT_ERR_MSG", "S");
		}else{
			//重新获取
			Token componentToken = ThirdpartyUtils.getComponentToken(String.valueOf(map.get("APPID")), String.valueOf(appSecret),  String.valueOf(map.get("COMPONENTVERIFYTICKET")));
//			Token componentToken = ThirdpartyUtils.getComponentToken(String.valueOf(weixinInfo.get("appId")), String.valueOf(weixinInfo.get("appSecret")),  String.valueOf(map.get("COMPONENTVERIFYTICKET")));
			
			Map<String, Object> saveMap = new HashMap<String, Object>();
			//保存componentToken
			saveMap.put("component_access_token", componentToken.getComponent_access_token());
//			saveMap.put("expires_in", System.currentTimeMillis() + (componentToken.getExpires_in() ));
			saveMap.put("componentAccessTokenExpiresIn", (System.currentTimeMillis() / 1000) + componentToken.getExpires_in());//服务器返回7200秒
			saveMap.put("AppId", String.valueOf(map.get("APPID")));
			saveMap.put("jopTpye", "C");
			
			Map<String, Object> reqMap = thirdpartyDao.select("Thirdparty.WX_OP_CODE_UPDATE", saveMap);
//			Map<String, Object> reqMap = thirdpartyDao.select("Thirdparty.WX_OP_ACCESS_TOKEN_UPDATE", saveMap);
			if("S".equals(reqMap.get("OUT_ERR_MSG"))){
				m = reqMap;
				m.put("OUT_ERR_MSG", "S");
			}else {
				m.put("OUT_ERR_MSG", reqMap.get("OUT_ERR_MSG"));
			}
		}
		
		return m;
	}
	
	
	/** 
	 * 更新 pre_auth_code
	 * @param map
	 */
	public Map<String, Object>  getPreAuthCode (Map<String, Object> map, Map<String,Object> weixinInfo) {
		Map<String, Object> m = null;

		//检查有效期,2分钟剩余
		if(this.checkExpiresIn(String.valueOf(map.get("PA_CODE_EXPIRES_IN")), 2)){
			m = map;
			m.put("OUT_ERR_MSG", "S");
		}else{
			//重新获取
			PreAuthCode preAuthCode = ThirdpartyUtils.createPreAuthCode(String.valueOf(map.get("COMPONENT_ACCESS_TOKEN")), String.valueOf(weixinInfo.get("appId")));
			
			Map<String, Object> saveMap = new HashMap<String, Object>();
			//保存PreAuthCode
			saveMap.put("pre_auth_code", preAuthCode.getPre_auth_code());
			saveMap.put("preAuthCodeExpiresIn", (System.currentTimeMillis() / 1000) + preAuthCode.getExpires_in() );
			saveMap.put("AppId", String.valueOf(weixinInfo.get("appId")));
			saveMap.put("jopTpye", "P");
			
			Map<String, Object> reqMap = thirdpartyDao.select("Thirdparty.WX_OP_CODE_UPDATE", saveMap);
//			Map<String, Object> reqMap = thirdpartyDao.select("Thirdparty.WX_OP_PRE_AUTH_CODE_UPDATE", saveMap);
			if("S".equals(reqMap.get("OUT_ERR_MSG"))){
				m = reqMap;
				m.put("OUT_ERR_MSG", "S");
			}else {
				m.put("OUT_ERR_MSG", reqMap.get("OUT_ERR_MSG"));
			}
		}
		return m ;
	}
	
	/** 
	 * 保存 AuthorizationCode -- 授权码
	 * @param map
	 */
	public Map<String, Object>  saveAuthorizationCode (Map<String, String> map) {

		Map<String, Object> saveMap = new HashMap<String, Object>();
		saveMap.put("AuthorizationCode", map.get("AuthorizationCode"));
		saveMap.put("AuthorizationCodeExpiresIn", map.get("AuthorizationCodeExpiredTime").toString());
		saveMap.put("AppId", String.valueOf(map.get("AppId")));
		saveMap.put("jopTpye", "A");
		
		return thirdpartyDao.select("Thirdparty.WX_OP_CODE_UPDATE", saveMap);
//		return thirdpartyDao.select("Thirdparty.WX_OP_AUTHORIZATION_CODE_UPDATE", saveMap);
	}
	
	/** 
	 * 使用授权码换取公众号的接口调用凭据和授权信息
	 * @param map
	 */
	public QueryAuth  getQueryAuth (Map<String, Object> map, String appSecret) {
//		public Map<String, Object>  getQueryAuth (Map<String, Object> map, Map<String,Object> weixinInfo) {
		QueryAuth queryAuth = null;
		//检查有效期,10分钟剩余
		if(this.checkExpiresIn(map.get("CA_TOKEN_EXPIRES_IN").toString(), 3)){
			queryAuth = ThirdpartyUtils.queryAuth(String.valueOf(map.get("COMPONENT_ACCESS_TOKEN")), String.valueOf(map.get("APPID")), String.valueOf(map.get("AUTHORIZATION_CODE")));
		} else {
			Map<String, Object> componentAccessToken = this.getComponentAccessToken(map, appSecret);
			queryAuth = ThirdpartyUtils.queryAuth(String.valueOf(componentAccessToken.get("COMPONENT_ACCESS_TOKEN")), String.valueOf(componentAccessToken.get("APPID")), String.valueOf(componentAccessToken.get("AUTHORIZATION_CODE")));
		}
		
		return queryAuth ;
	}
	
	/** 
	 * 获取授权方的账户信息
	 * @param map
	 */
	public GetAuthorizerInfoReturn  getAuthorizerInfo (Map<String,Object> weixinInfo, String authorizer_appid) {
		//获取component_verify_ticket
		Map<String, Object> componentVerifyTicket = this.getComponentVerifyTicket(weixinInfo);
		Map<String, Object> componentAccessToken = this.getComponentAccessToken(componentVerifyTicket, String.valueOf(weixinInfo.get("appSecret")));
//		GetAuthorizerInfoReturn getAuthorizerInfoReturn = ThirdpartyUtils.getAuthorizerInfo(String.valueOf(componentAccessToken.get("COMPONENT_ACCESS_TOKEN")), String.valueOf(componentAccessToken.get("APPID")), authorizer_appid);

		return ThirdpartyUtils.getAuthorizerInfo(String.valueOf(componentAccessToken.get("COMPONENT_ACCESS_TOKEN")), String.valueOf(componentAccessToken.get("APPID")), authorizer_appid);
	}
	
	
	
	/** 
	 * 保存授权方微信信息
	 * @param map
	 */
	public Map<String, Object>  saveAuthorizationWeiXinInfo (AppInfo appInfo, AuthorizationInfo authorization_info) {

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId",1002);
		map.put("originalAppId", "null");
		map.put("sysId", UUID.randomUUID().toString().toUpperCase().replaceAll("\\-", ""));
		map.put("compName", "扫码授权");
		map.put("appId", authorization_info.getAuthorizer_appid());
		map.put("appSecret", appInfo.getAppSecret() ); //使用平台AppSecret
		map.put("url", appInfo.getUrl() );//使用平台url
		map.put("token", authorization_info.getAuthorizer_access_token());//授权方令牌
		map.put("encordingAesKey", appInfo.getEncordingAesKey()); //使用平台EncordingAesKey
		map.put("accountType", 111);
		map.put("transferCustomerService", 111);//是否开启多客服 1:开启 0：关闭
		map.put("authorizerRefreshToken", authorization_info.getAuthorizer_refresh_token());//授权方的刷新令牌
		map.put("authorizerAccessToken", authorization_info.getAuthorizer_access_token());//授权方接口调用凭据(令牌)
		map.put("authorizerAccessTokenExpiresIn", (System.currentTimeMillis() / 1000) + authorization_info.getExpires_in());//(令牌)有效期
		map.put("jobType", "I"); //I 插入操作  U 修改操作 D 删除操作
		
		System.out.println("授权方信息===>" + map.toString());
		
		return this.select("AdminGroup.weiXinAppInfoSave", map);
		 
	}
	/** 
	 * 更新授权方微信信息
	 * @param map
	 */
	public Map<String, Object>  updateAuthorizationWeiXinInfo (AuthorizerInfo info, String sysId) {
		
		BusinessInfo business_info = info.getBusiness_info();
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("originalAppId", info.getUser_name());//授权方公众号的原始ID
		map.put("nickName", info.getNick_name());//授权方昵称
		map.put("headImg", info.getHead_img());//授权方头像
		map.put("accountType", info.getService_type_info().getId());//授权方公众号类型
		map.put("verifyTypeInfo", info.getVerify_type_info().getId());//授权方认证类型
		map.put("alias", info.getAlias());//授权方公众号所设置的微信号，可能为空
		map.put("qrcodeUrl", info.getQrcode_url());//授权方二维码图片url
		map.put("isAuthorizer", 1);//授权状态：0未授权 1 已授权

		map.put("open_store", business_info.getOpen_store() );//open_store:是否开通微信门店功能  （0代表未开通，1代表已开通）
		map.put("open_scan", business_info.getOpen_scan() );//open_scan:是否开通微信扫商品功能 （0代表未开通，1代表已开通）
		map.put("open_pay", business_info.getOpen_pay() );//open_pay:是否开通微信支付功能  （0代表未开通，1代表已开通）
		map.put("open_card", business_info.getOpen_card() );//open_card:是否开通微信卡券功能  （0代表未开通，1代表已开通）
		map.put("open_shake", business_info.getOpen_shake() );//open_shake:是否开通微信摇一摇功能  （0代表未开通，1代表已开通）
		
		map.put("jobType", "T"); //I 插入操作  U 修改操作 D 删除操作 T更新授权给第三方平台信息  A重新获得授权
		map.put("sysId", sysId);
		System.out.println("授权方信息===>" + map.toString());
		
		return this.select("AdminGroup.weiXinAppInfoSave", map);
	}
	
	/** 
	 * 重新获得授权，保存授权微信信息
	 * @param map
	 * Map<String,Object> thirdpartyInfo 平台信息
	 * AppInfo oldAppInfo 旧的公众号信息
	 * AuthorizationInfo authorization_info 授权公众号信息授权公众号信息
	 */
	public Map<String, Object>  againSaveAuthorizationWeiXinInfo (Map<String,Object> thirdpartyInfo, AuthorizationInfo authorization_info,AppInfo oldAppInfo) {

		Map<String,Object> map = new HashMap<String,Object>();
		
		GetAuthorizerInfoReturn authorizerInfo = this.getAuthorizerInfo(thirdpartyInfo, authorization_info.getAuthorizer_appid());
		if(authorizerInfo != null){
			AuthorizerInfo info = authorizerInfo.getAuthorizer_info();
			map.put("originalAppId", info.getUser_name());//授权方公众号的原始ID
			map.put("nickName", info.getNick_name());//授权方昵称
			map.put("headImg", info.getHead_img());//授权方头像
			map.put("accountType", info.getService_type_info().getId());//授权方公众号类型
			map.put("verifyTypeInfo", info.getVerify_type_info().getId());//授权方认证类型
			map.put("alias", info.getAlias());//授权方公众号所设置的微信号，可能为空
			map.put("qrcodeUrl", info.getQrcode_url());//授权方二维码图片url
			
			BusinessInfo business_info = info.getBusiness_info();
			map.put("open_store", business_info.getOpen_store() );//open_store:是否开通微信门店功能  （0代表未开通，1代表已开通）
			map.put("open_scan", business_info.getOpen_scan() );//open_scan:是否开通微信扫商品功能 （0代表未开通，1代表已开通）
			map.put("open_pay", business_info.getOpen_pay() );//open_pay:是否开通微信支付功能  （0代表未开通，1代表已开通）
			map.put("open_card", business_info.getOpen_card() );//open_card:是否开通微信卡券功能  （0代表未开通，1代表已开通）
			map.put("open_shake", business_info.getOpen_shake() );//open_shake:是否开通微信摇一摇功能  （0代表未开通，1代表已开通）
			
		}
		
		map.put("shopId",oldAppInfo.getShopId());
//		map.put("originalAppId", "null");
		map.put("appId", authorization_info.getAuthorizer_appid());
		map.put("appSecret", thirdpartyInfo.get("appSecret") ); //使用平台AppSecret
		map.put("url", thirdpartyInfo.get("url") );//使用平台url
		map.put("token", authorization_info.getAuthorizer_access_token());//授权方令牌
		map.put("encordingAesKey", thirdpartyInfo.get("encordingAesKey") ); //使用平台EncordingAesKey
		
		map.put("transferCustomerService", oldAppInfo.getTransferCustomerService());//是否开启多客服 1:开启 0：关闭
		map.put("authorizerRefreshToken", authorization_info.getAuthorizer_refresh_token());//授权方的刷新令牌
		map.put("authorizerAccessToken", authorization_info.getAuthorizer_access_token());//授权方接口调用凭据(令牌)
		map.put("authorizerAccessTokenExpiresIn", (System.currentTimeMillis() / 1000) + authorization_info.getExpires_in());//(令牌)有效期
		
		map.put("isAuthorizer", 1);//授权状态：0未授权 1 已授权
		map.put("sysId", oldAppInfo.getSysId() );
		map.put("jobType", "A"); //I 插入操作  U 修改操作 D 删除操作 T更新授权给第三方平台信息  A重新获得授权
		System.out.println("授权方信息===>" + map.toString());
		
		return this.select("AdminGroup.weiXinAppInfoSave", map);
		 
	}
	
	/** 
	 * 取消授权
	 * @param map
	 */
	public void  deauthorize (String authorizerAppid) {
		thirdpartyDao.select("Thirdparty.WX_OP_DEAUTHORIZE", authorizerAppid);
	}
	
	/** 
	 * 根据回调接口authCode参数查询授权方信息
	 * @param map
	 */
	public Map<String, Object>  getAuthorizationWeiXinInfoByauthCode (String authCode) {
		return thirdpartyDao.select("Thirdparty.getAuthorizationWeiXinInfoByauthCode", authCode);
	}
	/** 
	 * 根据appid查询
	 * @param map
	 */
	/*
	public Map<String, Object>  getAuthorizationWeiXinInfoByauthCode (String authCode) {
		return thirdpartyDao.select("Thirdparty.getAuthorizationWeiXinInfoByauthCode", authCode);
	}
	*/
	
	/**
	 * 检查有效期
	 * @return
	 */
	public Boolean checkExpiresIn(String pointWords, long min ){
		Boolean flag = false;
		long now = (System.currentTimeMillis() / 1000 );//秒
		if(!StringUtils.isBlank(pointWords) && !pointWords.equals("null")){//检查
			long expiresInTime = Long.valueOf(String.valueOf(pointWords)).longValue();//秒
			if((expiresInTime - now) > (min * 60)){
				flag = true;
			}
		}
		return flag;
	}
	
}