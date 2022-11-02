/**   
 * @Title: EventDao.java 
 * @Package com.waremec.wpt.front.dao 
 * @Description:  
 * @author taebem
 * @date 2015年5月13日 下午2:28:59 
 * @version V1.0   
 */
package com.waremec.wpt.front.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.pay.WeixinOrderInfo;
import com.waremec.wpt.front.domain.RouletteInfo;

/**
 * @Package com.waremec.wpt.front.dao
 * @FileName EventDao
 * @Description
 * @author taebem
 * @date 2015年5月13日 下午2:28:59
 * 
 */
@Repository
public class EventDao extends CommonDao {

	/**
	 *
	 * @param map
	 * @return
	 */
	public RouletteInfo getGageActionInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub

		RouletteInfo returns = new RouletteInfo();

		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Event.getGageActionInfo", map);

		if (!resultmap.isEmpty()) {
			String OUT_ERR_MSG = (String) resultmap.get("OUT_ERR_MSG");
			if ("S".equals(OUT_ERR_MSG)) {

				returns.setEventId((Integer) resultmap.get("EVENT_ID"));
				returns.setPrizeId((Long) resultmap.get("PRIZE_ID"));
				returns.setItemId((Integer) resultmap.get("ITEM_ID"));
				returns.setEventAngle((Integer) resultmap.get("EVENT_ANGLE"));
				returns.setChanceCount((Integer) resultmap.get("EVENT_CUST_CNT"));

			} else {
				throw new ProcedureBizException(OUT_ERR_MSG);
			}

		} else {
			throw new ProcedureBizException("[SHOP_GAME_ACTION_BY_CUST:无数据]");
		}

		return returns;
	}

	/** 
	*
	* @param eventId
	* @return
	*/
	public List<Map<String, Object>> selectGameItemListById(Integer eventId) {
		// TODO Auto-generated method stub
		return  (List<Map<String, Object>> ) getSqlMapClientTemplate().queryForList("Event.selectGameItemListById", eventId);
	}

	/** 
	*
	* @param map
	* @return
	*/
	public Map<String, Object> selectRedParkInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Event.selectRedParkInfo", map);
		return resultmap;
	}

	/** 
	*
	* @param map
	*/
	public void saveRedParkSendResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().queryForObject("Event.saveRedParkSendResult", map);
		
	}

	/** 
	*
	* @param map
	*/
	public void insertEventFollowUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().queryForObject("Event.insertEventFollowUser", map);
	}

	/** 
	*
	* @param map
	* @return
	*/
	public Map<String, Object> selectEvent10RedParkInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Event.selectEvent10RedParkInfo", map);
		return resultmap;
	}

	/** 
	*
	* @param map
	*/
	public void saveEvent10RedParkResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		getSqlMapClientTemplate().queryForObject("Event.saveEvent10RedParkResult", map);
	}

	/** 
	* 判断是否已经参加活动
	* @param eventId
	* @param openid
	* @return
	*/
	public Boolean selectHaveParticipatedInEvent(Integer eventId, String openid) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("EVENT_ID", eventId);
		map.put("FROM_OPENID", openid);
		
		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Event.SHOP_EVENT_USER_SELECT", map);
		boolean returns = true;
		
		if(resultmap == null || resultmap.isEmpty()){
			returns =false;
		}
		
		return returns;
	}

	/** 
	*
	* @return
	*/
	public List<String> selectHongbaoUserList() {
		// TODO Auto-generated method stub
		return  (List<String>)getSqlMapClientTemplate().queryForList("Event.selectHongbaoUserList", null);
	}
	 

}
