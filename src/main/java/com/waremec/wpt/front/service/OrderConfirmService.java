package com.waremec.wpt.front.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.front.dao.OrderConfirmDao;
import com.waremec.wpt.front.domain.FrontOrder;
import com.waremec.wpt.front.domain.FrontOrderConfirm;

@Service
public class OrderConfirmService extends CommonServiceImpl implements CommonService{
	 
	@Resource
	private OrderConfirmDao orderConfirmDao;
	/**
	 * @author wangbin
	 * @param string
	 * @param map
	 * @return 订单确认页面信息
	 */
	public List<FrontOrderConfirm> selectOrderConfirmList(String string,
			FrontOrderConfirm map) {
		try{
			return orderConfirmDao.selectOrderConfirmList(string,map);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param map
	 * @throws Exception
	 * 修改默认地址
	 */
	public void updateModifyAddress(String string,Map<String,Object> map) throws Exception{
		orderConfirmDao.updateModifyAddress(string,map);
	}
	/**
	 * @author wangbin
	 * @param string
	 * @param map
	 * @throws Exception
	 * 删除默认地址。
	 */
	public void deleteAddress(String string, Map<String, Object> map)throws Exception {
		orderConfirmDao.deleteAddress(string,map);
	}
	/**
	 * @author  
	 * @param frontOrder
	 * @return 订单的ID号
	 */
	public Map<String, Object> saveOrderConfirm(FrontOrder frontOrder) {
		return orderConfirmDao.saveOrderConfirm(frontOrder);
	}
	
}
