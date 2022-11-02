/**   
 * @Title: WeixinCustomDao.java 
 * @Package com.waremec.weixin.dao 
 * @Description:  
 * @author taebem
 * @date 2015年9月22日 下午4:41:59 
 * @version V1.0   
 */
package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.dkf.CheckDkf;

/**
 * @Package com.waremec.weixin.dao
 * @FileName WeixinCustomDao
 * @Description
 * @author taebem
 * @date 2015年9月22日 下午4:41:59
 * 
 */
@Repository
public class WeixinCustomDao extends CommonDao {

	/** 
	*
	* @param map
	*/
	public void syscDkfUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 getSqlMapClientTemplate().queryForObject("WeixinCustom.syscDkfUser", map);
	}

	/** 
	*
	* @param map
	*/
	public void updateDkfUserStatus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 getSqlMapClientTemplate().queryForObject("WeixinCustom.updateDkfUserStatus", map);
	}

	/** 
	*
	* @param map
	* @return
	*/
	public CheckDkf selectDkfByKeywork(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		Map<String, Object> returnMap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("WeixinCustom.selectDkfByKeywork", map);
		
		CheckDkf dkf = new CheckDkf();
		
		dkf.setDkf((Integer)returnMap.get("IS_DKF"));
		dkf.setAuto((Integer)returnMap.get("IS_AUTO"));
		dkf.setKf_account((String)returnMap.get("KF_ACCOUNT"));
		
		return dkf;
	}
	
}
