/**   
* @Title: RedparkDao.java 
* @Package com.waremec.wpt.dao 
* @Description:  
* @author taebem
* @date 2015年10月28日 上午11:20:10 
* @version V1.0   
*/
package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.redpark.RedparkHist;

/** 
 * @Package com.waremec.wpt.dao 
 * @FileName RedparkDao
 * @Description  
 * @author taebem 
 * @date 2015年10月28日 上午11:20:10 
 *  
 */
@Repository
public class WeixinRedparkDao extends CommonDao {
	
	public Integer insertRedparkSendHist(RedparkHist redparkHist) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> result = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("Redpark.insertRedparkSendHist", redparkHist);
		
		Integer id = (Integer)result.get("SEND_ID");
		if(id == 0){
			String errMsg = (String)result.get("OUT_ERR_MSG");
			throw new Exception(errMsg);
		}
		return id;
	 
	}
	
	public void updateRedparkSendHist(RedparkHist redparkHist) {
		getSqlMapClientTemplate().queryForObject("Redpark.updateRedparkSendHist", redparkHist);
		
	}
	public void updateRedparkSendAdvice(RedparkHist redparkHist) {
		getSqlMapClientTemplate().queryForObject("Redpark.updateRedparkSendAdvice", redparkHist);
		
	}
 
	
	
}
