/**   
* @Title: EventService.java 
* @Package com.waremec.wpt.front.service 
* @Description:  
* @author taebem
* @date 2015年5月13日 下午2:28:15 
* @version V1.0   
*/
package com.waremec.wpt.front.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.front.dao.EventDao;
import com.waremec.wpt.front.domain.RouletteInfo;

/** 
 * @Package com.waremec.wpt.front.service 
 * @FileName EventService
 * @Description  
 * @author taebem 
 * @date 2015年5月13日 下午2:28:15 
 *  
 */
@Service
public class EventService extends CommonServiceImpl implements CommonService{

	@Resource
	private EventDao eventDao;

	/** 
	*
	* @param map
	* @return
	*/
	public RouletteInfo getGageActionInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return eventDao.getGageActionInfo(map);
	}

	/** 
	*
	* @param eventId
	* @return
	*/
	public List<Map<String, Object>> getGameItemListById(Integer eventId) {
		// TODO Auto-generated method stub
		return eventDao.selectGameItemListById(eventId);
	}

	/** 
	*
	* @param map
	* @return
	*/
	public Map<String, Object> selectRedParkInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return eventDao.selectRedParkInfo(map);
	}

	/** 
	*
	* @param map
	*/
	public void saveRedParkSendResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		eventDao.saveRedParkSendResult(map);
	}

	 
	/** 
	*
	* @param map
	*/
	public void insertEventFollowUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		eventDao.insertEventFollowUser(map);
	}

	/** 
	* 获取活动10 红包f信息
	* @param searchMap
	* @return
	*/
	public Map<String, Object> selectEvent10RedParkInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return eventDao.selectEvent10RedParkInfo(map);
	}

	/** 
	*保存活动10 红包发送结果
	* @param searchMap
	*/
	public void saveEvent10RedParkResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		eventDao.saveEvent10RedParkResult(map);
	}

	/** 
	* 判断是否已经参加活动
	* @param eventId
	* @param openid
	* @return
	*/
	public Boolean haveParticipatedInEvent(Integer eventId, String openid) {
		// TODO Auto-generated method stub
		return eventDao.selectHaveParticipatedInEvent(eventId, openid);
	}

	/** 
	*
	* @return
	*/
	public List<String> selectHongbaoUserList() {
		// TODO Auto-generated method stub
		return eventDao.selectHongbaoUserList();
	}
}
