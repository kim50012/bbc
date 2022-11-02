/**   
* @Title: WeixinTemplateMessageDao.java 
* @Package com.waremec.weixin.dao 
* @Description:  
* @author taebem
* @date 2015年5月11日 下午10:27:41 
* @version V1.0   
*/
package com.waremec.weixin.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.dao.CommonDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.template.TemplateMessageHistory;

/** 
 * @Package com.waremec.weixin.dao 
 * @FileName WeixinTemplateMessageDao
 * @Description  
 * @author taebem 
 * @date 2015年5月11日 下午10:27:41 
 *  
 */
@Repository
public class WeixinTemplateMessageDao  extends CommonDao {

 
	/** 
	*获得模板ID
	* @param appInfo 公众账号信息
	* @param shortId 模板库中模板的编号，有“TM**”和“OPENTMTM**”等形式
	* @return 模板ID
	*/
	@SuppressWarnings({ "unchecked", "deprecation" })
	public String getTemplateIdByShortId(AppInfo appInfo, String shortId) {
		
		Map<String,Object> searhMap = new HashMap<String,Object>();
		searhMap.put("sysId", appInfo.getSysId());
		searhMap.put("shortId", shortId);
		
		Map<String,Object> map = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinTemplateMessage.getTemplateIdByShortId", searhMap);
		String WX_TMPL_ID = (String)map.get("WX_TMPL_ID");
		return WX_TMPL_ID;
	}

	/** 
	* 保存模板
	* @param appInfo 公众账号信息
	* @param shortId 模板库中模板的编号，有“TM**”和“OPENTMTM**”等形式
	* @param templateId 模板ID
	*/
	@SuppressWarnings("deprecation")
	public void saveTemplate(AppInfo appInfo, String shortId,String templateId) {
		Map<String,Object> saveMap = new HashMap<String,Object>();
		saveMap.put("sysId", appInfo.getSysId());
		saveMap.put("shortId", shortId);
		saveMap.put("templateId", templateId);
		
		 getSqlMapClientTemplate().queryForObject("WeixinTemplateMessage.saveTemplate", saveMap);
		
	}
	
	/** 
	*更新客户收到模板消息的状态
	* @param messageId 消息ID
	* @param status 接收状态
	*/
	@SuppressWarnings("deprecation")
	public void updateSendStatus(Long messageId, String status) {
		Map<String,Object> saveMap = new HashMap<String,Object>();
		saveMap.put("MSG_ID", messageId);
		saveMap.put("STATUS", status);
		
		
		try {
			getSqlMapClientTemplate().queryForObject("WeixinTemplateMessage.updateSendStatus", saveMap);
		} catch (Exception e) {
			logger.error( e.getMessage() );
		}
		
		
	}

	/** 
	* 保存模板消息发送记录
	* @param history TemplateMessageHistory
	*/
	@SuppressWarnings("deprecation")
	public void insertSendTemplateMessageHistory(TemplateMessageHistory history) {
		getSqlMapClientTemplate().insert("WeixinTemplateMessage.insertSendTemplateMessageHistory", history);
	}

}
