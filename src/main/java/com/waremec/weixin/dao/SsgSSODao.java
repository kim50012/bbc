/**   
* @Title: SsgSSODao.java 
* @Package com.waremec.weixin.dao 
* @Description:  
* @author taebem
* @date 2015年10月20日 下午5:19:10 
* @version V1.0   
*/
package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.SsgSSO;

/** 
 * @Package com.waremec.weixin.dao 
 * @FileName SsgSSODao
 * @Description  
 * @author taebem 
 * @date 2015年10月20日 下午5:19:10 
 *  
 */
@Repository
public class SsgSSODao extends CommonDao {

	/** 
	*
	* @param sso
	* @return
	*/
	public String insertSsgSSOTicketReturnUrl(SsgSSO sso) {
		// TODO Auto-generated method stub
		Map<String, Object> returnMap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("SsgSSO.insertSsgSSOTicketReturnUrl", sso);
		
		
		return (String) returnMap.get("REDIRECT_URL");
	}

	/** 
	*
	* @param shopId
	* @return
	*/
	public String selectReturnUrlByShopId(Integer shopId) {
		return(String)getSqlMapClientTemplate().queryForObject("SsgSSO.selectReturnUrlByShopId", shopId);
	}

}
