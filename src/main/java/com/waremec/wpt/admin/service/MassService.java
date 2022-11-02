package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.mass.MassReturn;
import com.waremec.weixin.service.WeixinMassService;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.wpt.admin.dao.MassDao;
@Service
public class MassService extends CommonServiceImpl implements CommonService{

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	@Resource
	private MassDao massDao;
	
	@Resource
	private WeixinMassService weixinMassService;
	
	@Deprecated
	public Integer saveMassMessage(Integer shopId, Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return massDao.saveMassMessage(map);
	}
	
	/**
	 * 群发文本消息
	 * @param shopId
	 * @param is_to_all
	 * @param touser
	 * @param content
	 * @return
	 */
	public MassReturn sendTextMassMessage(Integer shopId, boolean is_to_all, List<String> touser, String content){
		return weixinMassService.sendTextMass(shopId,is_to_all,touser,content);
		//massDao.saveSendResult(map);
		
	}
	
	/**
	 * 预览群发文本消息
	 * @param shopId
	 * @param openid
	 * @param content
	 * @return
	 */
	public void previewTextMassMessage(Integer shopId, String openid, String content){
		weixinMassService.previewTextMass(shopId,openid,content);
		
	}
	 
	
	/**
	 * 群发图文消息
	 * @param shopId
	 * @param is_to_all
	 * @param touser
	 * @param newsList
	 * @return
	 */
	public MassReturn sendMassMessage(Integer shopId, boolean is_to_all, List<String> touser, List<Map<String, Object>> newsList){
		return weixinMassService.sendMass(shopId,is_to_all,touser,newsList);
		//massDao.saveSendResult(map);
		
	}
	
	/**
	 * 预览群发图文消息
	 * @param shopId
	 * @param openid
	 * @param newsList
	 * @return
	 */
	public void previewMassMessage(Integer shopId, String openid, List<Map<String, Object>> newsList){
		weixinMassService.previewMass(shopId,openid,newsList);
		
	}
	
	/** 
	* 保存群发对象
	* @param map
	*/
	public  void saveSendTarget(Map<String, Object> map) {
		// TODO Auto-generated method stub
		  massDao.saveSendTarget(map);
	}
	/** 
	* 保存群发结果
	* @param map
	*/
	public void saveSendResult(Map<String, Object> map) {
		// TODO Auto-generated method stub
		 massDao.saveSendResult(map);
	}
	
}

