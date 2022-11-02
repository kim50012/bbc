/**   
* @Title: WeixinUserDao.java 
* @Package com.waremec.weixin.dao 
* @Description:  
* @author taebem
* @date 2015年5月22日 下午1:54:10 
* @version V1.0   
*/
package com.waremec.weixin.dao;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.user.Cust;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.domain.user.WXUser;

/** 
 * @Package com.waremec.weixin.dao 
 * @FileName WeixinUserDao
 * @Description  
 * @author taebem 
 * @date 2015年5月22日 下午1:54:10 
 *  
 */
@Repository
public class WeixinUserDao extends CommonDao {

	
	@SuppressWarnings("deprecation")
	public SessionMember getSessionMemberById(String openid) {
		try {
			
			return (SessionMember)getSqlMapClientTemplate().queryForObject("WeixinUser.getSessionMemberById",openid);
		} catch (Exception e) {
			logger.error("++++++++++++++++++++++++++++++++++++++++++++++++++=");
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("deprecation")
	public SessionMember getSessionMemberByCustId(Integer userId) {
		return (SessionMember)getSqlMapClientTemplate().queryForObject("WeixinUser.getSessionMemberByCustId",userId);
	}
	
	@SuppressWarnings("deprecation")
	public WXUser getUserInfoByOpenid(String openid) {
		return (WXUser) getSqlMapClientTemplate().queryForObject("WeixinUser.getUserInfoByOpenid", openid);
	}
	
	@SuppressWarnings("deprecation")
	@Deprecated
	public void saveUser(WXUser user) {
		getSqlMapClientTemplate().update("WeixinUser.saveUser",user);
	}
	
	public void userSubscribe(WXUser user) {
		getSqlMapClientTemplate().update("WeixinUser.userSubscribe",user);
	}
	
	public void userUnsubscribe(WXUser user) {
		getSqlMapClientTemplate().update("WeixinUser.userUnsubscribe",user);
	}
	
	
	@SuppressWarnings({ "deprecation" })
	public void saveCust(Cust cust) {
//		Map<String,Object> result = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinUser.saveCust", cust);
		 getSqlMapClientTemplate().queryForObject("WeixinUser.saveCust", cust);
	}

	/** 
	*
	* @param user
	*/
	@SuppressWarnings("deprecation")
	public void custUnsubscribe(WXUser user) {
		getSqlMapClientTemplate().update("WeixinUser.custUnsubscribe", user);
	}
}
