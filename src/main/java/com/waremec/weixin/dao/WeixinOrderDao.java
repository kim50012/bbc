package com.waremec.weixin.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.waremec.framework.common.exception.ProcedureBizException;
import com.waremec.framework.dao.CommonDao;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.pay.OrderPayInsert;
import com.waremec.weixin.domain.pay.PayRefundInsert;
import com.waremec.weixin.domain.pay.WeixinOrderInfo;

/** 
* @Package com.waremec.weixin.dao 
* @FileName WeixinOrderDao
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:07:28 
*  
*/
@Repository
public class WeixinOrderDao extends CommonDao {

	@SuppressWarnings({ "deprecation", "unchecked" })
	public WeixinOrderInfo getWeixinOrderInfoById(Map<String, Object> map) {
		
		WeixinOrderInfo returns = new WeixinOrderInfo();
		
		Map<String,Object> resultmap = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinOrder.getWeixinOrderInfoById", map);
		
		if(!resultmap.isEmpty()){
			String OUT_ERR_MSG = (String)resultmap.get("OUT_ERR_MSG");
			if("S".equals(OUT_ERR_MSG)){
				
//				private String detail;//商品详情
				
//				private String refund_id;//微信退款单号
//				private Integer refund_fee;//退款金额
				
				returns.setOrderId((Integer)resultmap.get("ORDER_ID"));
				returns.setCustOrderId((String)resultmap.get("CUST_ORDER_ID"));
				returns.setOut_trade_no((Integer)resultmap.get("OUT_TRADE_NO") + "");
				returns.setStatusId((Integer)  resultmap.get("STATUS_ID"));
				returns.setIsRefundReq((Integer) resultmap.get("IS_REFUND_REQ"));
				returns.setShopNm((String)resultmap.get("SHOP_NM"));
				
				returns.setTransaction_id((String)resultmap.get("TRANSACTION_ID"));
				returns.setBody((String)resultmap.get("GOODS_BODY"));
				returns.setTotal_fee(IntegerUtils.valueOf((String)resultmap.get("TOTAL_FEE")));
				returns.setTotal_fee2((String)resultmap.get("TOTAL_FEE2"));
				returns.setOut_refund_no((Integer)resultmap.get("OUT_REFUND_NO") + "");
				returns.setRefund_fee(IntegerUtils.valueOf((String)resultmap.get("REFUND_FEE")));
			 
			}else{
				throw new ProcedureBizException(OUT_ERR_MSG);
			}
			
		}else{
			throw new ProcedureBizException("[无订单数据]");
		}
		
		return returns;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public Map<String, Object> saveNotifyOrder(OrderPayInsert orderPay) {
		Map<String,Object> result = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinOrder.saveNotifyOrder", orderPay);
		return result;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void savePayRefundResult(PayRefundInsert payRefundInsert) {
		Map<String,Object> map = (Map<String,Object>) getSqlMapClientTemplate().queryForObject("WeixinOrder.savePayRefundResult", payRefundInsert);
		Integer OUT_ORDER_ID = (Integer)map.get("OUT_ORDER_ID");
				
		if(OUT_ORDER_ID == 0){
			throw new ProcedureBizException((String)map.get("OUT_ERR_MSG"));
		}
	 
	}

	 

}
