package com.waremec.weixin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.dao.WeixinLetterDao;

/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinLetterService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:17 
*  
*/
@Service
public class WeixinLetterService extends CommonServiceImpl implements CommonService {

	@Resource
	private WeixinLetterDao weixinLetterDao;
	
	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	
	 

	public WeixinLetterService() {
		logger.info("***********WeixinLetterService*************");
	}

	/** 
	* 根据ID获取Letter信息
	* @param letterId
	* @return
	*/
	public Map<String, Object> selectLetterInfoById(Integer letterId) {
		// TODO Auto-generated method stub
		return weixinLetterDao.selectLetterInfoById(letterId);
	}
	
	/** 
	* 记录用户点击此Letter
	* @param map
	*/
	public void insertLetter(Map<String, Object> map){
		weixinLetterDao.insertLetter(map);
	}
	
	
}
