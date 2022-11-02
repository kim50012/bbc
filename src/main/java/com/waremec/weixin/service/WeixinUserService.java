/**   
* @Title: WeixinUserService.java 
* @Package com.waremec.weixin.service 
* @Description:  
* @author taebem
* @date 2015年5月22日 上午11:00:36 
* @version V1.0   
*/
package com.waremec.weixin.service;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.dao.WeixinUserDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.user.Cust;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.domain.user.UserReturn;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.DateUtils;
import com.waremec.weixin.utils.WeixinUserUtils;

/** 
 * @Package com.waremec.weixin.service 
 * @FileName WeixinUserService
 * @Description  
 * @author taebem 
 * @date 2015年5月22日 上午11:00:36 
 *  
 */
@Service
public class WeixinUserService extends CommonServiceImpl implements CommonService  {
  
	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	@Resource
	private WeixinService weixinService;
	@Resource
	private WeixinUserDao weixinUserDao;
	
	public SessionMember getSessionMemberById(String openid) {
		return weixinUserDao.getSessionMemberById(openid);
	}

	public SessionMember getSessionMemberByCustId(Integer userId) {
		return weixinUserDao.getSessionMemberByCustId(userId);
	}
	
	
	/** 
	* 根据ID获取用户信息
	* @param openid
	* @return
	*/
	public WXUser getUserInfoByOpenid(String openid) {
		return weixinUserDao.getUserInfoByOpenid(openid);
	} 
	
	/**
	 * 用户关注并同步用户信息
	 * @param user
	 * @return
	 */
	public void userSubscribe(String token , WXUser user) throws Exception {
		
		UserReturn userReturn = WeixinUserUtils.getUserInfoById(token , user.getOpenid());
		
		//值为0时，代表此用户没有关注该公众号，拉取不到其余信息。
		if(userReturn.getSubscribe() == 0){
			logger.info("======用户没有该公众号，获取不到用户信息");
			userUnsubscribe(user);
			return;
		} 
		
		user.setSubscribe(userReturn.getSubscribe());
		
		user.setNickname(userReturn.getNickname());
		user.setSex(userReturn.getSex());
		user.setCity(userReturn.getCity());
		user.setCountry(userReturn.getCountry());
		user.setProvince(userReturn.getProvince());
		user.setLanguage(userReturn.getLanguage());
		user.setHeadimgurl(userReturn.getHeadimgurl());
		user.setSubscribe_time(DateUtils.secondsToDate(userReturn.getSubscribe_time()));
		user.setUnionid(userReturn.getUnionid());
		user.setGroupid(userReturn.getGroupid());
		user.setRemark(userReturn.getRemark()); //added by zhengtafian at 20151223
		
		weixinUserDao.userSubscribe(user);
		
		AppInfo app=  weixinService.selectAppInfoByKey(user.getSysId());
		
		Cust cust = new Cust();  
		cust.setShopId(app.getShopId());
//		cust.setCustSysId(custSysId);
//		cust.setCustLoginId(custLoginId);
		cust.setWxIfOpenidP(user.getOpenid());
		cust.setEmail("");
		cust.setMobileNo("");
		cust.setWxIfIsSubscribe(user.getSubscribe());
		cust.setWxIfNickNm(user.getNickname());
		cust.setWxIfSexId(IntegerUtils.valueOf(user.getSex(),0));
		cust.setWxIfLanguage(user.getLanguage());
		cust.setWxIfCountryNm(user.getCountry());
		cust.setWxIfProvinceNm(user.getProvince());
		cust.setWxIfCityNm(user.getCity());
		cust.setWxIfHeadimgurl(user.getHeadimgurl());
		cust.setWxIfSubscribeTime(user.getSubscribe_time());
		cust.setWxIfUnionid(user.getUnionid());
		cust.setWxIfGroupid(user.getGroupid());
		cust.setWxIfRemark(user.getRemark());
		cust.setWxSubscribeDt(user.getSubscribe_time());
		cust.setWxIdP("");
		cust.setCustNickNm(cust.getWxIfNickNm());
		cust.setCustRealNm("");
		cust.setPwd("");
		
		
		weixinUserDao.saveCust(cust); 
	}
	

	/** 
	* 用户取消关注并同步信息
	* @param user
	* @return
	*/
	public void userUnsubscribe(WXUser user) {
		user.setSubscribe(Constants.UserSubscribeType.UN_SUBSCRIBE);
		weixinUserDao.userUnsubscribe(user);
	}
	
 
}
