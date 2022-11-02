package com.waremec.weixin.dao;

 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.msg.EventLocation;
import com.waremec.weixin.domain.msg.Image;
import com.waremec.weixin.domain.msg.Link;
import com.waremec.weixin.domain.msg.Location;
import com.waremec.weixin.domain.msg.Text;
import com.waremec.weixin.domain.msg.Video;
import com.waremec.weixin.domain.msg.Voice;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinMessageDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:25 
*  
*/
@Repository
public class WeixinMessageDao extends CommonDao {

	/**
	 * 根据Key之获取关注之后回复给微信的消息
	 * @param key
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Map<String,Object>> getSubscribeMessage(AppInfo app) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("SYS_ID", app.getSysId());
		params.put("KEYWORD", "关注");
		
		return (List<Map<String,Object>>) getSqlMapClientTemplate().queryForList("WeixinMessage.getReturnMessage", params);
		
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Map<String,Object>> getReturnMessageUser(AppInfo app, String content, String fromUser) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("SYS_ID", app.getSysId());
		params.put("KEYWORD", content);
		params.put("OPENID", fromUser);
		
		return (List<Map<String,Object>>) getSqlMapClientTemplate().queryForList("WeixinMessage.getReturnMessage", params);
		 
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Map<String,Object>> getReturnMessage(AppInfo app, String content) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("SYS_ID", app.getSysId());
		params.put("KEYWORD", content);
		
		return (List<Map<String,Object>>) getSqlMapClientTemplate().queryForList("WeixinMessage.getReturnMessage", params);
		 
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public List<Map<String,Object>> getClickEventReturnMessage(AppInfo app, Integer eventKey) {
		
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("SYS_ID", app.getSysId());
		params.put("MESSAGE_ID", eventKey);
		
		return (List<Map<String,Object>>) getSqlMapClientTemplate().queryForList("WeixinMessage.getClickEventReturnMessage", params);
		
	}
	
	@SuppressWarnings({ "deprecation" })
	public Long insertTextMsg(Text text) {
		return (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertTextMsg", text);
	}

	@SuppressWarnings({ "deprecation" })
	public long insertImageMsg(Image image) {
		return (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertImageMsg", image);
	}

	@SuppressWarnings({ "deprecation" })
	public long insertVoiceMsg(Voice vocie) {
		return (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertVoiceMsg", vocie);
	}

	@SuppressWarnings({ "deprecation" })
	public long insertVideoMsg(Video video) {
		return (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertVideoMsg", video);
	}

	@SuppressWarnings({ "deprecation" })
	public long insertLocationMsg(Location location) {
		return  (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertLocationMsg", location);
	}

	@SuppressWarnings({ "deprecation" })
	public long insertLinkMsg(Link link) {
		return (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertLinkMsg", link);
	}

	@SuppressWarnings({ "deprecation" })
	public long insertEventLocation(EventLocation location) {
		return (Long) getSqlMapClientTemplate().insert("WeixinMessage.insertEventLocation", location);
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	public Integer saveSendLogging(Map<String, Object> saveMap) {
		Map<String,Object> map = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinMessage.saveSendLogging", saveMap);
		Integer OUT_MESSAGE_ID = (Integer)map.get("OUT_MESSAGE_ID");
		
		if(OUT_MESSAGE_ID == 0){
			throw new ProcedureBizException((String)map.get("OUT_ERR_MSG"));
		}
		
		return OUT_MESSAGE_ID;
	}
	
	public void updateMediaId(Integer fileId, String mediaId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileId", fileId);
		map.put("mediaId", mediaId);
		
		getSqlMapClientTemplate().update("WeixinMessage.updateMediaId",map);
		
	}

	/** 
	*
	* @param shopId
	* @param fromUserName
	* @param sceneId
	*/
	public void insertQRCodeScanedResult(Integer shopId, String fromUserName, Integer sceneId) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("OPENID", fromUserName);
		map.put("SCENE_ID", sceneId);
		
		 getSqlMapClientTemplate().queryForObject("Event.insertQRCodeScanedResult", map);
			
	}
	 
	
}
