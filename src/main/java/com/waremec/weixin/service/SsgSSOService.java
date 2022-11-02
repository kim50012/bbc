/**   
* @Title: SsgSSOService.java 
* @Package com.waremec.weixin.service 
* @Description:  
* @author taebem
* @date 2015年10月20日 下午5:18:26 
* @version V1.0   
*/
package com.waremec.weixin.service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.weixin.dao.SsgSSODao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.SsgSSO;
import com.waremec.weixin.utils.SsgSSOSignUtils;

/** 
 * @Package com.waremec.weixin.service 
 * @FileName SsgSSOService
 * @Description  
 * @author taebem 
 * @date 2015年10月20日 下午5:18:26 
 *  
 */
	@Service
	public class SsgSSOService  extends CommonServiceImpl implements CommonService{
		
		private final transient Log logger = LogFactory.getLog(this.getClass());
		
		public static final String SSO_FREFIX = "/wx/sso/ssgindex.htm?url=";
		
		@Resource
		private SsgSSODao ssgSSODao;
		
		
		public Map<String,String> getPramerterMap(String url){
			Map<String,String> paramsMap = new HashMap<String,String>();
			if(url.indexOf("?") > -1){
				url = url.substring(url.indexOf("?") + 1);
				String[] params = url.split("&");
				for (String item : params) {
					paramsMap.put(item.split("=")[0], item.split("=")[1]);
				}
			}
			return paramsMap;
		}

		/** 
		*
		* @param appInfo
		* @param openid
		* @param menuId
		* @param redirect_uri
		* @return
		*/
		public String generateSSOUrl(AppInfo appInfo, String openid, Integer menuId, String redirect_uri) {
			// TODO Auto-generated method stub
			
			redirect_uri = redirect_uri.substring(SsgSSOService.SSO_FREFIX.length());
			try {
				redirect_uri = URLDecoder.decode(redirect_uri, "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			logger.info("url====" + redirect_uri);
			
			
			String ticket = RandomUtils.generateRandomString();
			String sign = "";
			String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			Map<String,String> paramsMap = getPramerterMap(redirect_uri);
			
			Map<String,String> signMap = new HashMap<String,String>();
			
			signMap.put("shopId", appInfo.getShopId() + "");
			signMap.put("openid", openid);
			signMap.put("ticket", ticket);
			signMap.put("timestamp", timestamp);
			
			sign = SsgSSOSignUtils.sign(signMap);
			
			logger.info("shopId=======" + appInfo.getShopId());
			logger.info("openid=======" + openid);
			logger.info("ticket=======" + ticket);
			logger.info("timestamp====" + timestamp);
			logger.info("sign=========" + sign);
			
			SsgSSO sso = new SsgSSO();
			sso.setShopId(appInfo.getShopId());
			sso.setOpenid(openid);
			sso.setTicket(ticket);
			sso.setTimestamp(timestamp);
			sso.setUrl(redirect_uri);
			sso.setMenuId(menuId);
			sso.setSign(sign);
			
//			String ssoUrl = ssgSSODao.selectReturnUrlByShopId(appInfo.getShopId());
			String url = ssgSSODao.insertSsgSSOTicketReturnUrl(sso);
			
			
			logger.info("SSO url=========" + url);
			
			try {
				redirect_uri = URLEncoder.encode(redirect_uri, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			if (url.indexOf("?") < 0) {
				url += "?";
			} else {
				url += "&";
			}
			
			url += "shopId=" + appInfo.getShopId()
				 + "&openid=" + openid	
				 + "&ticket=" + ticket	
				 + "&timestamp=" + timestamp	
				 + "&sign=" + sign	
				 //*********************************************************************************************************************************
				 + "&redirect_uri=" + redirect_uri;	 
					
			logger.info("SSO FULL URL =========" + url);
			
			return url;
		}
		
		/** 
		 *
		 * @param appInfo
		 * @param openid
		 * @param menuId
		 * @param redirect_uri
		 * @return
		 */
		public String generateSSO2Url(AppInfo appInfo, String openid, String redirect_uri) {
			// TODO Auto-generated method stub
			logger.info("url====" + redirect_uri);
			
			String url = ssgSSODao.selectReturnUrlByShopId(appInfo.getShopId());
			
			logger.info("reutrn url=========" + url);
			
			try {
				redirect_uri = URLEncoder.encode(redirect_uri, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			if (url.indexOf("?") < 0) {
				url += "?";
			} else {
				url += "&";
			}
			url += "shopId=" + appInfo.getShopId()
			     + "&openid=" + openid	
				 + "&redirect_uri=" + redirect_uri;	 
			
			logger.info("reutrn url2=========" + url);
			
			return url;
		}
		
		/** 
		 *
		 * @param appInfo
		 * @param openid
		 * @param menuId
		 * @param redirect_uri
		 * @return
		 */
		public String generateSSONoMenuUrl(AppInfo appInfo, String openid, Integer menuId, Integer ssoId) {
			// TODO Auto-generated method stub

			logger.info("generateSSONoMenuUrl=======Start");
			
			String redirect_uri = "";
			
			String ticket = RandomUtils.generateRandomString();
			String sign = "";
			String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			Map<String,String> paramsMap = getPramerterMap(redirect_uri);
			
			Map<String,String> signMap = new HashMap<String,String>();
			
			signMap.put("shopId", appInfo.getShopId() + "");
			signMap.put("openid", openid);
			signMap.put("ticket", ticket);
			signMap.put("timestamp", timestamp);
			
			sign = SsgSSOSignUtils.sign(signMap);
			
			logger.info("shopId=======" + appInfo.getShopId());
			logger.info("openid=======" + openid);
			logger.info("ticket=======" + ticket);
			logger.info("timestamp====" + timestamp);
			logger.info("sign=========" + sign);
			
			SsgSSO sso = new SsgSSO();
			sso.setShopId(appInfo.getShopId());
			sso.setOpenid(openid);
			sso.setTicket(ticket);
			sso.setTimestamp(timestamp);
			sso.setUrl(redirect_uri);
			sso.setMenuId(menuId);
			sso.setSign(sign);
			
			String url = ssgSSODao.insertSsgSSOTicketReturnUrl(sso);
			
			
			url += "?shopId=" + appInfo.getShopId()
					+ "&openid=" + openid	
					+ "&ticket=" + ticket	
					+ "&timestamp=" + timestamp	
					+ "&sign=" + sign	
					//**********************************************************************************
					+ "&menuId=" + menuId
					+ "&ssoId=" + ssoId;	
			
			logger.info("reutrn url no menu =========" + url);
			
			return url;
		}
		
}
