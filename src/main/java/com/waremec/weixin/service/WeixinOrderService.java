package com.waremec.weixin.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.weixin.dao.WeixinOrderDao;
import com.waremec.weixin.domain.pay.OrderPayInsert;
import com.waremec.weixin.domain.pay.PayRefundInsert;
import com.waremec.weixin.domain.pay.WeixinOrderInfo;


/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinOrderService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:38 
*  
*/
@Service
public class WeixinOrderService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());
	
	@Resource
	private WeixinOrderDao weixinOrderDao;

	/** 
	* 获取订单详细信息 
	* @param map
	* @return
	*/
	public WeixinOrderInfo getWeixinOrderInfoById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return weixinOrderDao.getWeixinOrderInfoById(map);
	}
	
	public Map<String, Object> saveNotifyOrder(OrderPayInsert orderPay) {
		return weixinOrderDao.saveNotifyOrder(orderPay);
	}
	
	public void savePayRefundResult(PayRefundInsert payRefundInsert) {
		// TODO Auto-generated method stub
		weixinOrderDao.savePayRefundResult(payRefundInsert); 
	}
	 
	
}