/**   
* @Title: ThirdpartyUtils.java 
* @Package com.waremec.weixin.thirdparty.utils 
* @Description:  
* @author taebem
* @date 2015年6月2日 下午5:08:07 
* @version V1.0   
*/
package com.waremec.weixin.thirdparty.utils;

import net.sf.json.JSONObject;

import com.google.gson.Gson;
import com.waremec.weixin.thirdparty.domain.AuthorizerToken;
import com.waremec.weixin.thirdparty.domain.GetAuthorizerInfoReturn;
import com.waremec.weixin.thirdparty.domain.GetAuthorizerOptionReturn;
import com.waremec.weixin.thirdparty.domain.PreAuthCode;
import com.waremec.weixin.thirdparty.domain.QueryAuth;
import com.waremec.weixin.thirdparty.domain.Token;
import com.waremec.weixin.thirdparty.exception.InterfaceException;
import com.waremec.weixin.utils.HttpClientUtils;

/** 
 * @Package com.waremec.weixin.thirdparty.utils 
 * @FileName ThirdpartyUtils
 * @Description  微信第三方平台 - 代公众号调用接口
 * @author taebem 
 * @date 2015年6月2日 下午5:08:07 
 *  
 */
public class ThirdpartyUtils {

//	public static void main(String[] args) {
//		getComponentToken("wxf4ff15142f410758","a8b1ec6488389a5e1be2f4941a8b9f3f", "ddddd");
//	}
	
	/** 
	* 1、获取第三方平台令牌（component_access_token）
	* @param component_appid 第三方平台appid
	* @param component_appsecret 第三方平台appsecret
	* @param component_verify_ticket 微信后台推送的ticket，此ticket会定时推送，具体请见本页末尾的推送说明
	* @return Token
	*/
	public static Token getComponentToken(String component_appid, String component_appsecret, String component_verify_ticket){
		String url = "https://api.weixin.qq.com/cgi-bin/component/api_component_token";
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
		jsonObject.put("component_appsecret", component_appsecret);
		jsonObject.put("component_verify_ticket", component_verify_ticket);
	 
		String result = HttpClientUtils.requestPost(url,jsonObject);
		
		Token returns = new Gson().fromJson(result, Token.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
		
		return returns;
	 }
	
	/** 
	* 2、获取预授权码
	*<br/> 该API用于获取预授权码。预授权码用于公众号授权时的第三方平台方安全验证。
	* @param component_access_token 第三方平台access_token
	* @param component_appid 第三方平台方appid
	* @return PreAuthCode
	*/
	public static PreAuthCode createPreAuthCode(String component_access_token, String component_appid){
		String url = "https://api.weixin.qq.com/cgi-bin/component/api_create_preauthcode?component_access_token=" + component_access_token;
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
	 
		String result = HttpClientUtils.requestPost(url,jsonObject);

		PreAuthCode returns = new Gson().fromJson(result, PreAuthCode.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
		
		return returns;
	 }
	
	//https://open.weixin.qq.com/cgi-bin/showdocument?action=dir_list&t=resource/res_list&verify=1&lang=zh_CN&token=b28386638fa70b2ce3c7e2f3d15831067b63438d
	
	/** 
	* 3、使用授权码换取公众号的授权信息
	* @param component_access_token 第三方平台access_token
	* @param component_appid  第三方平台appid
	* @param authorization_code 授权code,会在授权成功时返回给第三方平台，详见第三方平台授权流程说明
	* @return QueryAuth
	*/
	public static QueryAuth queryAuth(String component_access_token, String component_appid, String authorization_code){
		String url = "https://api.weixin.qq.com/cgi-bin/component/api_query_auth?component_access_token=" + component_access_token;
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
		jsonObject.put("authorization_code", authorization_code);
	 
		String result = HttpClientUtils.requestPost(url,jsonObject);
		
		QueryAuth returns = new Gson().fromJson(result, QueryAuth.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
		
		return returns;
	 }
 
	/** 
	*	4、获取（刷新）授权公众号的令牌
	* @param component_access_token 第三方平台access_token
	* @param component_appid 第三方平台appid
	* @param authorizer_appid 授权方appid
	* @param authorizer_refresh_token 授权方的刷新令牌，刷新令牌主要用于公众号第三方平台获取和刷新已授权用户的access_token，只会在授权时刻提供，请妥善保存。 一旦丢失，只能让用户重新授权，才能再次拿到新的刷新令牌
	* @return AuthorizerToken
	*/
	public static AuthorizerToken authorizerToken(String component_access_token, String component_appid, String authorizer_appid, String authorizer_refresh_token){
		String url = "https:// api.weixin.qq.com /cgi-bin/component/api_authorizer_token?component_access_token=" + component_access_token;
		 
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
		jsonObject.put("authorizer_appid", authorizer_appid);
		jsonObject.put("authorizer_refresh_token", authorizer_refresh_token);
		
		String result = HttpClientUtils.requestPost(url,jsonObject);
		
		AuthorizerToken returns = new Gson().fromJson(result, AuthorizerToken.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
		
		return returns;
	}
	/** 
	 *	5、获取授权方的账户信息
	 * <br/>该API用于获取授权方的公众号基本信息，包括头像、昵称、帐号类型、认证类型、微信号、原始ID和二维码图片URL。
	 * <br/>需要特别记录授权方的帐号类型，在消息及事件推送时，对于不具备客服接口的公众号，需要在5秒内立即响应；
	 *      而若有客服接口，则可以选择暂时不响应，而选择后续通过客服接口来发送消息触达粉丝。
	 * @param component_access_token 第三方平台access_token
	 * @param component_appid 第三方平台appid(服务appid)
	 * @param authorizer_appid 授权方appid
	 * @return GetAuthorizerInfoReturn
	 */
	public static GetAuthorizerInfoReturn getAuthorizerInfo(String component_access_token, String component_appid, String authorizer_appid){
		String url = "https://api.weixin.qq.com/cgi-bin/component/api_get_authorizer_info?component_access_token=" + component_access_token;
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
		jsonObject.put("authorizer_appid", authorizer_appid);
		
		String result = HttpClientUtils.requestPost(url,jsonObject);
		
		GetAuthorizerInfoReturn returns = new Gson().fromJson(result, GetAuthorizerInfoReturn.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
		
		return returns;
	}
	
	/** 
	*6、获取授权方的选项设置信息
	*<br/>该API用于获取授权方的公众号的选项设置信息，
	*   如：地理位置上报，语音识别开关，多客服开关。注意，获取各项选项设置信息，需要有授权方的授权，详见权限集说明。
	* @param component_access_token 第三方平台access_token
	* @param component_appid 第三方平台appid
	* @param authorizer_appid 授权公众号appid
	* @param option_name 选项名称
	* @return GetAuthorizerOptionReturn
	*/
	public static GetAuthorizerOptionReturn getAuthorizerOption(String component_access_token, String component_appid, String authorizer_appid, String option_name){
		String url = "https://api.weixin.qq.com/cgi-bin/component/api_get_authorizer_option?component_access_token=" + component_access_token;
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
		jsonObject.put("authorizer_appid", authorizer_appid);
		jsonObject.put("option_name", option_name);
		
		String result = HttpClientUtils.requestPost(url,jsonObject);
		
		GetAuthorizerOptionReturn returns = new Gson().fromJson(result, GetAuthorizerOptionReturn.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
		
		return returns;
	}
	
	/** 
	* 7、设置授权方的选项信息
	* <br/>该API用于设置授权方的公众号的选项信息，如：地理位置上报，语音识别开关，多客服开关。
	* 注意，设置各项选项设置信息，需要有授权方的授权，详见权限集说明。
	* @param component_access_token 第三方平台access_token
	* @param component_appid 第三方平台appid
	* @param authorizer_appid 授权公众号appid
	* @param option_name 选项名称
	* @param option_value 设置的选项值
	* @return
	*/
	public static void setAuthorizerOption(String component_access_token, String component_appid, String authorizer_appid, String option_name, String option_value){
		String url = "https://api.weixin.qq.com/cgi-bin/component/api_set_authorizer_option?component_access_token=" + component_access_token;
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("component_appid", component_appid);
		jsonObject.put("authorizer_appid", authorizer_appid);
		jsonObject.put("option_name", option_name);
		jsonObject.put("option_value", option_value);
		
		String result = HttpClientUtils.requestPost(url,jsonObject);
		
		GetAuthorizerOptionReturn returns = new Gson().fromJson(result, GetAuthorizerOptionReturn.class);
		if(returns.isError()){
			throw new InterfaceException(returns);
		}
	}
	
	
	/** 
	* @Package com.waremec.weixin.thirdparty.utils 
	* @FileName AuthorizerOptionLocationReport
	* @Description  地理位置上报选项
	* @author taebem 
	* @date 2015年6月3日 上午9:57:06 
	*  
	*/
	public static class AuthorizerOptionLocationReport {
        /**  
        * 无上报
        */
        public static final int NONE_REPORT 				= 0;
        /**  
        * 进入会话时上报
        */
        public static final int IN_SESSION_REPORT  			= 1;
        /**  
        * 每5s上报
        */
        public static final int EVERY_5_SECONDS_REPORT  	= 2;
	}
	/** 
	* @Package com.waremec.weixin.thirdparty.utils 
	* @FileName AuthorizerOptionVoiceRecognize
	* @Description  语音识别开关选项
	* @author taebem 
	* @date 2015年6月3日 上午10:04:08 
	*  
	*/
	public static class AuthorizerOptionVoiceRecognize {
		/**  
		 * 关闭语音识别
		 */
		public static final int COLSE	= 0;
		/**  
		 * 开启语音识别
		 */
		public static final int OPEN 	= 1;
	}
	/** 
	* @Package com.waremec.weixin.thirdparty.utils 
	* @FileName AuthorizerOptionCustomerService
	* @Description  客服开关选项
	* @author taebem 
	* @date 2015年6月3日 上午10:05:09 
	*  
	*/
	public static class AuthorizerOptionCustomerService {
		/**  
		 * 关闭多客服
		 */
		public static final int COLSE	= 0;
		/**  
		 * 开启多客服
		 */
		public static final int OPEN 	= 1;
	}
	
}
