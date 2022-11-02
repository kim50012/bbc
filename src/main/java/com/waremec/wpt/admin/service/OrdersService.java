package com.waremec.wpt.admin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wpt.admin.dao.OrdersDao;
import com.waremec.wpt.admin.domain.AdminOrders;

@Service
public class OrdersService extends CommonServiceImpl implements CommonService{

	@Resource
	private OrdersDao ordersDao;

	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--Map
	 * @return:		List<AdminGoods>
	 * @exception:	店铺商品分类一级分类查询
	 */ 
	/*public List<AdminGoods> selectshopGoodsClassMap(String sqlId, Map<String, Object> searchMap) {
		try {
			return goodsDao.selectshopGoodsClassMap(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}*/
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminOrders
	 * @return:		List<AdminOrders>
	 * @exception:	查询-LIST
	 */
	public List<AdminOrders> selectList(String sqlId, AdminOrders searchMap) {
		try {
			return ordersDao.selectList(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public AdminOrders select(String sqlId, AdminOrders searchMap) {
		try {
			return ordersDao.select(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,paramIn--AdminGoods
	 * @return:		void
	 * @exception:	订单一保存
	 */
	public void insertDomain(String sqlId, AdminOrders paramIn) {
		try {
			ordersDao.insertDomain(sqlId, paramIn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @author:		liyang
	 * @version:	v1.0
	 * @param:		sqlId,searchMap--AdminOrders
	 * @return:		INT
	 * @exception:	查询-COUNT
	 */ 
	public int selectCount(String sqlId, AdminOrders searchMap) {
		try {
			return ordersDao.selectCount(sqlId, searchMap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Map<String, Object> getOrderInfoById(Map<String, Object> map) {
		return ordersDao.getOrderInfoById(map); 
	}

	public Map<String, Object> selectOrderRefundInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return ordersDao.selectOrderRefundInfo(map);
	}
	
}
