/**   
* @Title: WeixinCustomService.java 
* @Package com.waremec.weixin.service 
* @Description:  
* @author taebem
* @date 2015年9月22日 下午4:40:59 
* @version V1.0   
*/
package com.waremec.weixin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.dao.WeixinCustomDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.customservice.GetOnlineKflistReturn;
import com.waremec.weixin.domain.customservice.GetkflistReturn;
import com.waremec.weixin.domain.customservice.Kflist;
import com.waremec.weixin.domain.customservice.OnlineKflist;
import com.waremec.weixin.domain.dkf.CheckDkf;
import com.waremec.weixin.utils.WeixinMessageUtils;

/** 
 * @Package com.waremec.weixin.service 
 * @FileName WeixinCustomService
 * @Description  微信多客服有关服务
 * @author taebem 
 * @date 2015年9月22日 下午4:40:59 
 *  
 */
@Service
public class WeixinCustomService  extends CommonServiceImpl implements CommonService{
	@Resource
	private WeixinService weixinService;
	@Resource
	private WeixinCustomDao weixinCustomDao;
	
	public void syscDkfUser(Integer shopId){
		
		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
		String token = weixinService.getAccessToken(appInfo);
		GetkflistReturn getkflistReturn = WeixinMessageUtils.getkflist(token); 
		List<Kflist> kf_list = getkflistReturn.getKf_list();
		
		 for (Kflist item : kf_list) {
			 Map<String,Object> map = new HashMap<String,Object>();
			 map.put("SHOP_ID", appInfo.getShopId());
			 map.put("dkfUser", item);
			 
			 weixinCustomDao.syscDkfUser(map);
		}
	}
	
	public void updateDkfUserStatus(Integer shopId){
		
		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
		String token = weixinService.getAccessToken(appInfo);
		GetOnlineKflistReturn getOnlineKflistReturn = WeixinMessageUtils.getonlinekflist(token); 
		List<OnlineKflist> onlineKflist = getOnlineKflistReturn.getKf_online_list();
 
		 for (OnlineKflist item : onlineKflist) {
			 Map<String,Object> map = new HashMap<String,Object>();
			 map.put("SHOP_ID", appInfo.getShopId());
			 map.put("dkfUser", item);
			 
			 weixinCustomDao.updateDkfUserStatus(map);
		}
	}
	
	
	

	/** 
	*
	*判断是否使用多客服系统
	* @param appInfo
	* @param keywork 关键字
	* @return
	*/
	public CheckDkf checkIsUseDkf(AppInfo appInfo, String keywork) {
		return checkIsUseDkf(appInfo.getShopId(), keywork);
		 
	}
	/** 
	 *
	 *判断是否使用多客服系统
	 * @param appInfo
	 * @param keywork 关键字
	 * @return
	 */
	public CheckDkf checkIsUseDkf(Integer shopId, String keywork) {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("SHOP_ID", shopId);
		map.put("KEYWORD", keywork);
		
		return weixinCustomDao.selectDkfByKeywork(map);
		
	}
	

	public static void main(String[] args) {
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		WeixinCustomService weixinCustomService = ac.getBean(WeixinCustomService.class);
// 	    weixinCustomService.syscDkfUser(8);
//		weixinCustomService.updateDkfUserStatus(8);
		
//		CheckDkf dkf = weixinCustomService.checkIsUseDkf(8, "성형");
//		System.out.println(dkf);
	}
	
	
}
