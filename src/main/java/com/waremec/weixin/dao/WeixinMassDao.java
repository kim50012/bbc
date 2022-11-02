package com.waremec.weixin.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinMassDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:13 
*  
*/
@Repository
public class WeixinMassDao extends CommonDao {

	@SuppressWarnings({ "unchecked", "deprecation" })
	public Map<String, Object> selectSendMsgById(Integer messageId) {
		return (Map<String, Object>) getSqlMapClientTemplate().queryForObject("WeixinMass.selectSendMsgById", messageId);
	}

	@SuppressWarnings("deprecation")
	public void updateMediaId(Integer fileId, String mediaId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileId", fileId);
		map.put("mediaId", mediaId);
		
		getSqlMapClientTemplate().update("WeixinMass.updateMediaId",map);
		
	}

	 

}
