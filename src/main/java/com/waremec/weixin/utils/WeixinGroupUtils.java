/**   
* @Title: WeixinGroupUtils.java 
* @Package com.waremec.weixin.utils 
* @Description:  用户管理 - 用户分组管理工具类
* @author taebem
* @date 2015年5月21日 下午2:36:49 
* @version V1.0   
*/
package com.waremec.weixin.utils;

import java.util.List;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.gson.Gson;
import com.waremec.weixin.domain.WeixinReturn;
import com.waremec.weixin.domain.group.CreateGroupReturn;
import com.waremec.weixin.domain.group.GetAllGroupReturn;
import com.waremec.weixin.domain.group.GetGroupByOpenIdReturn;
import com.waremec.weixin.domain.group.Group;
import com.waremec.weixin.exception.WeixinErrorException;

/** 
 * @Package com.waremec.weixin.utils 
 * @FileName WeixinGroupUtils
 * @Description  用户管理 - 用户分组管理工具类
 * 				开发者可以使用接口，对公众平台的分组进行查询、创建、修改、删除等操作，也可以使用接口在需要时移动用户到某个分组。
 * @author taebem 
 * @date 2015年5月21日 下午2:36:49 
 *  
 */
public class WeixinGroupUtils extends WeixinBaseUtils{

	private static final transient Log logger = LogFactory.getLog(WeixinGroupUtils.class);
	
	/**  
	* 创建分组URL
	*/
	private static final String GROUPS_CREATE_URL  = "https://api.weixin.qq.com/cgi-bin/groups/create?access_token=ACCESS_TOKEN";
	/**  
	* 查询所有分组URL
	*/
	private static final String GROUPS_GET_URL  = "https://api.weixin.qq.com/cgi-bin/groups/get?access_token=ACCESS_TOKEN";
	/**  
	* 查询用户所在分组URL
	*/
	private static final String GROUPS_GETID_URL  = "https://api.weixin.qq.com/cgi-bin/groups/getid?access_token=ACCESS_TOKEN";
	/**  
	* 修改分组名URL
	*/
	private static final String GROUPS_UPDATE_URL  = "https://api.weixin.qq.com/cgi-bin/groups/update?access_token=ACCESS_TOKEN";
	/**  
	* 移动用户分组URL
	*/
	private static final String GROUPS_MEMBERS_UPDATE_URL  = "https://api.weixin.qq.com/cgi-bin/groups/members/update?access_token=ACCESS_TOKEN";
	/**  
	* 批量移动用户分组URL
	*/
	private static final String GROUPS_MEMBERS_BATCHUPDATE_URL  = "https://api.weixin.qq.com/cgi-bin/groups/members/batchupdate?access_token=ACCESS_TOKEN";
	/**  
	* 删除分组URL
	*/
	private static final String GROUPS_DELETE_URL  = "https://api.weixin.qq.com/cgi-bin/groups/delete?access_token=ACCESS_TOKEN";

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String token = TokenUtils.getToken(8);
		logger.info("token==" + token);
		
//		logger.info("********************************************************"); 
//		Integer groupId = createGroup(token, "testgggg");
//		logger.info("groupId==" + groupId); //104
//		logger.info("********************************************************"); 
//		List<Group> groupList = getAllGroup(token);
//		logger.info("group size===" + groupList.size());
//		for (Group group : groupList) {
//			logger.info(group);
//		}
//		logger.info("********************************************************"); 
//		Integer groupId = getGroupByOpenId(token, "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY");
//		logger.info("groupId==" + groupId);
//		logger.info("********************************************************"); 
//		updateGroup(token, 104, "中国北京");
//		logger.info("********************************************************"); 
//		updateMemberGroup(token, "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY", 104);
//		logger.info("********************************************************"); 
//		List<String> openid_list = new ArrayList<String>();
//		openid_list.add("o1yuEt_fi-yatQvLIdgHq8xbANsI");
//		openid_list.add("o1yuEt2859nWhHpYmZ-HntsRxiZQ");
//		openid_list.add("o1yuEt5JyxuI3VqDuVcLGLXaUqaE");
//		batchUpdateMemberGroup(token ,openid_list, 104);
//		logger.info("********************************************************"); 
//		deleteGroup(token, 105);
//		logger.info("********************************************************"); 
		
		
	}
	
	/** 
	*  创建分组
	* @param access_token 调用接口凭证
	* @param name 分组名字（30个字符以内）
	* @return Integer 分组id
	*/
	public static Integer createGroup(String access_token, String name) {
	 
		String url = getInterfaceUrl(GROUPS_CREATE_URL, access_token);
		
		String postData = "{\"group\":{\"name\":\"" + name + "\"}}";
		JSONObject jsonObject = JSONObject.fromObject(postData);
	    
		String result =   HttpClientUtils.requestPost(url, jsonObject);
	    logger.info(result);
		
	    CreateGroupReturn returns = new Gson().fromJson(result, CreateGroupReturn.class);
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
		
		return returns.getGroup().getId();
	}
	
	/** 
	*  查询所有分组
	* @param access_token 调用接口凭证
	* @return List<Group> 分组
	*/
	public static List<Group> getAllGroup(String access_token) {
		 
		String url = getInterfaceUrl(GROUPS_GET_URL, access_token);
		
		String result = HttpClientUtils.requestGet(url);
	    logger.info(result);
		
	    GetAllGroupReturn returns = new Gson().fromJson(result, GetAllGroupReturn.class);
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
		
		return returns.getGroups();
	}
	
	/** 
	* 查询用户所在分组 通过用户的OpenID查询其所在的GroupID。
	* @param access_token 调用接口凭证
	* @param openid openid
	* @return Integer 用户所属的groupid
	*/
	public static Integer getGroupByOpenId(String access_token, String openid) {
		 
		String url = getInterfaceUrl(GROUPS_GETID_URL, access_token);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("openid", openid); 
		//return HttpClientUtils.requestPost(url, jsonObject);
		
		String result = HttpClientUtils.requestPost(url, jsonObject);
	    logger.info(result);
		
	    GetGroupByOpenIdReturn returns = new Gson().fromJson(result, GetGroupByOpenIdReturn.class);
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
		
		return returns.getGroupid();
	}
	
	/** 
	* 修改分组名
	* @param access_token 调用接口凭证
	* @param id 分组id，由微信分配
	* @param name 分组名字（30个字符以内）
	*/
	public static void updateGroup(String access_token, Integer id, String name) {
		
		String url = getInterfaceUrl(GROUPS_UPDATE_URL, access_token);
		
		String postData = "{\"group\":{\"id\": " + id + " ,\"name\":\"" + name + "\"}}";
		JSONObject jsonObject = JSONObject.fromObject(postData);
		
		String result =   HttpClientUtils.requestPost(url, jsonObject);
		logger.info(result);
		
		WeixinReturn returns = new Gson().fromJson(result, WeixinReturn.class);
		
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
	}
	
	/** 
	* 移动用户分组
	* @param access_token 调用接口凭证
	* @param openid 用户唯一标识符
	* @param to_groupid 分组id
	*/
	public static void updateMemberGroup(String access_token, String openid, Integer to_groupid) {
		String url = getInterfaceUrl(GROUPS_MEMBERS_UPDATE_URL, access_token);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("openid", openid);
		jsonObject.put("to_groupid", to_groupid);

		String result =   HttpClientUtils.requestPost(url, jsonObject);
		logger.info(result);
		
		WeixinReturn returns = new Gson().fromJson(result, WeixinReturn.class);
		
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
	}
	
	/** 
	* 批量移动用户分组
	* @param access_token 调用接口凭证
	* @param openid_list 用户唯一标识符openid的列表（size不能超过50）
	* @param id to_groupid 分组id
	*/
	public static void batchUpdateMemberGroup(String access_token,List<String> openid_list, Integer to_groupid) {
		String url = getInterfaceUrl(GROUPS_MEMBERS_BATCHUPDATE_URL, access_token);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("openid_list", openid_list);
		jsonObject.put("to_groupid", to_groupid);

		String result =   HttpClientUtils.requestPost(url, jsonObject);
		logger.info(result);
		
		WeixinReturn returns = new Gson().fromJson(result, WeixinReturn.class);
		
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
	}
	
	/** 
	* 删除分组<br>
	* 注意本接口是删除一个用户分组，删除分组后，所有该分组内的用户自动进入默认分组。
	* @param access_token 调用接口凭证
	* @param id 分组的id
	*/
	public static void deleteGroup(String access_token, Integer id) {
		String url = getInterfaceUrl(GROUPS_DELETE_URL, access_token);
		
		String postData = "{\"group\":{\"id\":" + id + "}}";
		JSONObject jsonObject = JSONObject.fromObject(postData);
		
		String result =   HttpClientUtils.requestPost(url, jsonObject);
		logger.info(result);
		
		WeixinReturn returns = new Gson().fromJson(result, WeixinReturn.class);
		
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}
	}
	
}
