package com.waremec.alipay.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.alipay.dao.AlipayDao;
import com.waremec.alipay.domain.AlipayInfo;
import com.waremec.alipay.domain.AlipayOrderInfo;
import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.exception.InvalidAccountException;

/** 
* @Package com.waremec.alipay.service 
* @FileName AlipayService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:47 
*  
*/
@Service
public class AlipayService extends CommonServiceImpl implements CommonService {

	@Resource
	private AlipayDao alipayDao;
	
	private final transient Log logger = LogFactory.getLog(AlipayService.class);
	
	
	public AlipayInfo selectAlipayInfoByKey(String key) {
		try {
			AlipayInfo alipayInfo = alipayDao.selectAlipayInfoByKey(key);
			if(alipayInfo == null){
				throw new InvalidAccountException("您没有支付宝的权限 key=" + key);
			}
			return alipayInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	
	public AlipayInfo selectAlipayInfoByShopId(Integer shopId) {
		try {
			AlipayInfo alipayInfo = alipayDao.selectAlipayInfoByShopId(shopId);
			if(alipayInfo == null){
				throw new InvalidAccountException("您没有支付宝的权限 shopId=" + shopId);
			}
			return alipayInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}

	public AlipayOrderInfo getAlipayOrderInfoById(Map<String, Object> map) {
		return alipayDao.getAlipayOrderInfoById(map);
	}

	public String insertAlipayNotifyAndLogging(Map<String, Object> map) {
		return alipayDao.insertAlipayNotifyAndLogging(map);
	}
	
	public String selectCreatedAlipayBatchNo(Integer orderId) {
		return alipayDao.selectCreatedAlipayBatchNo(orderId);
		
	}
	
	
}
