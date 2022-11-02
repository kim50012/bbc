package com.waremec.alipay.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.alipay.domain.AlipayInfo;
import com.waremec.alipay.domain.AlipayOrderInfo;
import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;

/** 
* @Package com.waremec.alipay.dao 
* @FileName AlipayDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:38 
*  
*/
@Repository
public class AlipayDao extends CommonDao {

	public AlipayInfo selectAlipayInfoByKey(String key) {
		// TODO Auto-generated method stub
		return (AlipayInfo) getSqlMapClientTemplate().queryForObject("Alipay.selectAlipayInfoByKey", key);
	}

	public AlipayInfo selectAlipayInfoByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return (AlipayInfo) getSqlMapClientTemplate().queryForObject("Alipay.selectAlipayInfoByShopId", shopId);
	}

	public AlipayOrderInfo getAlipayOrderInfoById(Map<String, Object> map) {

		AlipayOrderInfo returns = new AlipayOrderInfo();

		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Alipay.getAlipayOrderInfoById", map);

		if (!resultmap.isEmpty()) {
			String OUT_ERR_MSG = (String) resultmap.get("OUT_ERR_MSG");
			if ("S".equals(OUT_ERR_MSG)) {

				// private String detail;//商品详情

				// private String refund_id;//微信退款单号
				// private Integer refund_fee;//退款金额

				returns.setOrderId((Integer) resultmap.get("ORDER_ID"));
				returns.setCustOrderId((String) resultmap.get("CUST_ORDER_ID"));
				returns.setOut_trade_no((Integer) resultmap.get("OUT_TRADE_NO") + "");
				returns.setStatusId((Integer)  resultmap.get("STATUS_ID"));
				returns.setIsRefundReq((Integer) resultmap.get("IS_REFUND_REQ"));
				returns.setShopNm((String) resultmap.get("SHOP_NM"));
				
				returns.setSubject((String) resultmap.get("ALIPAY_SUBJECT"));
				returns.setTotal_fee((String) resultmap.get("ALIPAY_TOTAL_FEE"));
//				returns.setBatch_no((String) resultmap.get("BATCH_NO"));//批次号 --另外方法来生成
				returns.setBatch_num(String.valueOf((Integer) resultmap.get("ALIPAY_BATCH_NUM")));//退款笔数 
				returns.setTrade_no((String) resultmap.get("ALIPAY_TRADE_NO"));//原付款支付宝交易号
				returns.setRefund_fee((String) resultmap.get("ALIPAY_REFUND_FEE"));//退款总金额
				returns.setRefund_reason((String) resultmap.get("ALIPAY_REFUND_REASON")); //退款理由
				
			} else {
				throw new ProcedureBizException("[无订单数据]");
			}

			// TODO Auto-generated method stub
		}
		return returns;
	}

	public String insertAlipayNotifyAndLogging(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Alipay.insertAlipayNotifyAndLogging", map);
				
		Integer OUT_ORDER_ID = (Integer) resultmap.get("OUT_ORDER_ID");
		if(OUT_ORDER_ID > 0){
			return "success";
		}else{
			return "fail";
		}
		
	}
	public String selectCreatedAlipayBatchNo(Integer orderId) {
		// TODO Auto-generated method stub
		Map<String, Object> resultmap = (Map<String, Object>) getSqlMapClientTemplate().queryForObject("Alipay.selectCreatedAlipayBatchNo", orderId);
		Long BATCH_NO = (Long) resultmap.get("BATCH_NO");
		return String.valueOf(BATCH_NO);
		
	}
}
