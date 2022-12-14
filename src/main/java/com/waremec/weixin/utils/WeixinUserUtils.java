/**   
* @Title: WeixinUserUtils.java 
* @Package com.waremec.weixin.utils 
* @Description:  用户管理工具类(除用户分组管理)
* @author taebem
* @date 2015年5月21日 下午6:12:18 
* @version V1.0   
*/
package com.waremec.weixin.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.gson.Gson;
import com.waremec.weixin.domain.WeixinReturn;
import com.waremec.weixin.domain.user.UserBatchReturn;
import com.waremec.weixin.domain.user.UserListReturn;
import com.waremec.weixin.domain.user.UserReturn;
import com.waremec.weixin.exception.WeixinErrorException;

/** 
 * @Package com.waremec.weixin.utils 
 * @FileName WeixinUserUtils
 * @Description  用户管理工具类(除用户分组管理)
 * @author taebem 
 * @date 2015年5月21日 下午6:12:18 
 *  
 */
public class WeixinUserUtils extends WeixinBaseUtils {
	
	
	private static final transient Log logger = LogFactory.getLog(WeixinUtils.class);

	/**  
	* 创建分组URL
	*/
	private static final String USER_INFO_UPDATEREMARK_URL  = "https://api.weixin.qq.com/cgi-bin/user/info/updateremark?access_token=ACCESS_TOKEN";
	
	/**  
	 * 批量获取用户基本信息URL
	 */
	private static final String USER_INFO_BATCH_GET_URL  = "https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token=ACCESS_TOKEN";
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String token = TokenUtils.getToken(8);
		logger.info("token==" + token);
		
		//o1yuEtw1PN5sc6W6Bxd7Q4hty2hY
//		logger.info("********************************************************"); 
//  		updateUserRemark(token,"o1yuEtw1PN5sc6W6Bxd7Q4hty2hY","");
//		logger.info("********************************************************"); 
//		UserListReturn returns = getUserList(token, null);
//		logger.info("total==========" + returns.getTotal());
//		logger.info("count==========" + returns.getCount());
//		logger.info("next_openid====" + returns.getNext_openid());
//		Data data = returns.getData();
//		for (String item : data.getOpenid()) {
//			 logger.info(item);
////			 logger.info(getUserInfoById(token, item));
//		}
//		logger.info("********************************************************"); 
 		UserReturn user = getUserInfoById(token, "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY");
 		logger.info(user);
//		logger.info("********************************************************"); 
//		logger.info("********************************************************"); 
//		logger.info("********************************************************"); 
//		logger.info("********************************************************"); 
		
//		List<String> openids = new ArrayList<String>();
//		openids.add("odMFxs0vWmZZI3s4RCDbQWr0sMEI");
//		openids.add("odMFxs_9uQtDak37ultXoMr6jMjg");
//		openids.add("odMFxs14mQ6ySO1w6j-6sbLmu3oM");
//		openids.add("odMFxs3o8BlRh9Oz6oEn_G-oBNXI");
//		openids.add("odMFxsyJUw4WOql8LgoepFajwqw4");
//		 List<UserReturn> returns = batchGetUserInfoByIds(token,openids);
//		 for (UserReturn userReturn : returns) {
//			logger.info(userReturn);
//		}
		
	}
	
	/**
	 * 设置用户备注名
	 * 
	 * @param access_token  调用接口凭证
	 * @param openid 用户标识
	 * @param remark 新的备注名，长度必须小于30字符
	 */
	public static void updateUserRemark(String access_token, String openid, String remark) {
		 
		String url = getInterfaceUrl(USER_INFO_UPDATEREMARK_URL, access_token);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("openid", openid); 
		jsonObject.put("remark", remark); 
		
		String result = HttpClientUtils.requestPost(url, jsonObject);
		logger.info(result);

		WeixinReturn returns = new Gson().fromJson(result, WeixinReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

	}
	
	/**
	 * 获取用户基本信息（包括UnionID机制）
	 * 
	 * 在关注者与公众号产生消息交互后，公众号可获得关注者的OpenID
	 * （加密后的微信号，每个用户对每个公众号的OpenID是唯一的。
	 * 对于不同公众号，同一用户的openid不同）。公众号可通过本接口来
	 * 根据OpenID获取用户基本信息，包括昵称、头像、性别、所在城市、语言和关注时间。
	 * 
	 * @param access_token 调用接口凭证
	 * @param openid 普通用户的标识，对当前公众号唯一
	 * @return UserReturn
	 */
	public static UserReturn getUserInfoById(String access_token, String openid) {
		String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=" + access_token;
		url += "&openid=" + openid;
		url += "&lang=" + "zh_CN";
	 

		String result = HttpClientUtils.requestGet(url);

		UserReturn returns = new Gson().fromJson(result, UserReturn.class);
		
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

		return returns;

	}
	
	/** 
	* 批量获取用户基本信息 
	* 开发者可通过该接口来批量获取用户基本信息。最多支持一次拉取100条。
	* @param access_token
	* @param openids
	* @return
	* 更新日志
	* 2015年6月29日
	* 为了帮助开发者提高效率，用户管理接口中新增了批量获取用户基本信息的接口。
	*/
	public static List<UserReturn> batchGetUserInfoByIds(String access_token, List<String> openids) {
		String url = getInterfaceUrl(USER_INFO_BATCH_GET_URL, access_token);
		
		JSONObject jsonObject = new JSONObject();
	 
//		jsonObject.put("openid", openid); 
//		jsonObject.put("remark", remark); 
		
		List<Map<String,Object>> user_list = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < openids.size(); i++) {
			Map<String,Object> user = new HashMap<String,Object>();
			user.put("openid", openids.get(i));
			user_list.add(user);
		}
		
		jsonObject.put("user_list", user_list);
		
		String result = HttpClientUtils.requestPost(url, jsonObject);
		logger.info(result);
		
		UserBatchReturn returns = new Gson().fromJson(result, UserBatchReturn.class);
		
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		
		return returns.getUser_info_list();
		
	}
	
	
	
	/**
	 * 获取用户列表
	 * <br>
	 * 公众号可通过本接口来获取帐号的关注者列表，关注者列表由一串OpenID（加密后的微信号，
	 * 每个用户对每个公众号的OpenID是唯一的）组成。一次拉取调用最多拉取10000个关注者的OpenID，
	 * 可以通过多次拉取的方式来满足需求。
	 * 
	 * @param access_token 调用接口凭证
	 * @param next_openid 第一个拉取的OPENID，不填默认从头开始拉取
	 * @return UserListReturn
	 */
	public static UserListReturn getUserList(String access_token, String next_openid) {
		//https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID
		String url = "https://api.weixin.qq.com/cgi-bin/user/get?access_token=" + access_token;
		if (StringUtils.isNotBlank(next_openid)) {
			url += "&next_openid=" + next_openid;
		}

		String result = HttpClientUtils.requestGet(url);

		UserListReturn returns = new Gson().fromJson(result, UserListReturn.class);
		
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

		return returns;
	}
	

}
