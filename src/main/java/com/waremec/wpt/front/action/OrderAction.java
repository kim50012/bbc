package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.domain.user.SessionMember;

/**
 * 2014.1.12
 * @author lilifang
 *
 */
@Controller("orderAction")
@Scope(ScopeType.prototype)
public class OrderAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private String statusId;
	private String orderId;
	private String customerId;
	private String orderIndex;
	private String reviewDesc; 
	private String custRequestDesc;
	private int goodsId;
	private int displayId;
	private int priceOptionId;
	private int totalGpa;
	private int goodsGpa;
	private int logisticGpa;
	private int serviceGpa;
	private int custReturnRequestType;
	private int custReturnReasonType;
	private String isRefundReqis;
	
	                                                                                                                                                                                                                                                                           
	/**
	 * 订单列表
	 * @return
	 */
	public String orderList(){
		 
		
		SessionMember sessionMember = getSessionMember();
		
		if(StringUtils.isEmpty(orderIndex)){
			orderIndex = "1";
		}
		
		if(orderIndex.equals("2")){
			statusId = "10" ;
		}else if(orderIndex.equals("3")){
			statusId = "20" ;
		}else if(orderIndex.equals("4")){
			statusId = "30" ;
		}else if(orderIndex.equals("5")){
			statusId = "40" ;
		}
		
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());//sessionMember.getCustSysId()
		map.put("SHOP_ID",sessionMember.getShopId() );//sessionMember.getShopId()
		map.put("STATUS_ID", statusId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999);
		
		List<Map<String,Object>> myOrderList=commonService.selectList("Order.getMyOrderList",map);
		
		request.put("myOrderList", myOrderList);
		
		
		
		return "orderList";
	}

	/**
	 * 删除订单
	 * @return
	 */
	
	public String cancelOrder(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderId", orderId);
		try {
			commonService.update("Order.cancelOrder", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		return NONE;
	}
	
	/**
	 * 退款申请
	 * @return
	 */
	public String refund(){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderId", orderId);
		map.put("isRefundReqis", isRefundReqis);
		try {
			commonService.update("Order.refund", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		
		return NONE;
	}
	
	/**
	 * 确认收货
	 * @return
	 */
	public String receipt(){
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderId", orderId);
		
		try {
			commonService.update("Order.receipt", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		
		return NONE;
	}
    
	/**
	* 物流详情
	* @return
	*/
	public String transDlt(){

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("orderId", orderId);
		
		Map<String,Object> myTrans = commonService.select("Order.getMyTrans",map);
		
		request.put("myTrans", myTrans);
		
		return "transDlt";
	}
	
	/**
	 * 提醒订单
	 * @return
	 */
	public String remindOrder(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("orderId", orderId);
		try {
			commonService.update("Order.remindOrder", map);
			map.put("status", "S");
			renderJSON(map);
		} catch (Exception e) {
			map.put("status", "F");
			renderJSON(map);
			e.printStackTrace();
		}
		return NONE;
	}
	
	
	/**
	 * 到评价页面
	 * @return
	 */
	public String review(){
		SessionMember sessionMember=getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("STATUS_ID", statusId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999);
		map.put("ORDER_ID", orderId);
		List<Map<String,Object>> myOrderList=commonService.selectList("Order.getMyOrderList",map);
		request.put("myOrderList", myOrderList);
		return "review";
	}
	
	/**
	 * 添加评论
	 * @return
	 */
	public String reviewInsert(){
		SessionMember sessionMember=getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		map.put("ORDER_ID", orderId);
		map.put("SHOP_ID",sessionMember.getShopId());
		map.put("GOODS_ID", goodsId);
		map.put("DISPLAY_ID", displayId);
		map.put("PRICE_OPTION_ID", priceOptionId);
		map.put("REVIEW_DESC", reviewDesc);
		map.put("TOTAL_GPA", totalGpa);
		map.put("GOODS_GPA", goodsGpa);
		map.put("GOODS_LOGISTIC_GPA", logisticGpa);
		map.put("GOODS_SERVICE_GPA", serviceGpa);
		
		Map<String,Object> returnMap=commonService.select("Order.reviewInsert",map);
		renderJSON(returnMap);
		return NONE;
	}
	
	public String orderInformation(){
		SessionMember sessionMember=getSessionMember();
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("STATUS_ID", statusId);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999);
		map.put("ORDER_ID", orderId);
		
		List<Map<String,Object>> orderList=commonService.selectList("Order.getMyOrderList",map);
		
		request.put("orderList", orderList);
		
		return "orderInformation";
	}
	
	public String custReturnInsert(){
		SessionMember sessionMember=getSessionMember();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("CUST_SYS_ID", sessionMember.getCustSysId());
		map.put("ORDER_ID", orderId);
		map.put("CUST_RETURN_REASON_TYPE", custReturnReasonType);
		map.put("CUST_RETURN_REQ_TYPE", custReturnRequestType);
		map.put("CUST_REQ_DESC", custRequestDesc);
		
		Map<String,Object> returnMap=commonService.select("Order.custReturnInsert",map);
		renderJSON(returnMap);
		return NONE;
	}
	
	public String reviewSuccess(){
		
		return "reviewSuccess";
	}
	
	public String returnGoods(){
		return "returnGoods";
	}
	
	public String couponList(){
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("SHOP_ID", sessionMember.getShopId());
		map.put("CUST_ID", sessionMember.getCustSysId());
		List<Map<String,Object>> couponAll=commonService.selectList("Order.getMyCouponList", map);
		List<Map<String,Object>> couponOutOfDate=commonService.selectList("Order.getCouponOutOfDateList", map);
		request.put("couponAll",couponAll);
		request.put("couponOutOfDate",couponOutOfDate);
		return "couponList";
	}
	
	public String getStatusId() {
		return statusId;
	}

	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}



	public String getOrderId() {
		return orderId;
	}



	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getOrderIndex() {
		return orderIndex;
	}

	public void setOrderIndex(String orderIndex) {
		this.orderIndex = orderIndex;
	}

	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public int getDisplayId() {
		return displayId;
	}

	public void setDisplayId(int displayId) {
		this.displayId = displayId;
	}

	public int getPriceOptionId() {
		return priceOptionId;
	}

	public void setPriceOptionId(int priceOptionId) {
		this.priceOptionId = priceOptionId;
	}

	public int getTotalGpa() {
		return totalGpa;
	}

	public void setTotalGpa(int totalGpa) {
		this.totalGpa = totalGpa;
	}

	public String getReviewDesc() {
		return reviewDesc;
	}

	public void setReviewDesc(String reviewDesc) {
		this.reviewDesc = reviewDesc;
	}

	public int getGoodsGpa() {
		return goodsGpa;
	}

	public void setGoodsGpa(int goodsGpa) {
		this.goodsGpa = goodsGpa;
	}

	public int getLogisticGpa() {
		return logisticGpa;
	}

	public void setLogisticGpa(int logisticGpa) {
		this.logisticGpa = logisticGpa;
	}

	public int getServiceGpa() {
		return serviceGpa;
	}

	public void setServiceGpa(int serviceGpa) {
		this.serviceGpa = serviceGpa;
	}

	public String getCustRequestDesc() {
		return custRequestDesc;
	}

	public void setCustRequestDesc(String custRequestDesc) {
		this.custRequestDesc = custRequestDesc;
	}

	public int getCustReturnRequestType() {
		return custReturnRequestType;
	}

	public void setCustReturnRequestType(int custReturnRequestType) {
		this.custReturnRequestType = custReturnRequestType;
	}

	public int getCustReturnReasonType() {
		return custReturnReasonType;
	}

	public void setCustReturnReasonType(int custReturnReasonType) {
		this.custReturnReasonType = custReturnReasonType;
	}

	public String getIsRefundReqis() {
		return isRefundReqis;
	}

	public void setIsRefundReqis(String isRefundReqis) {
		this.isRefundReqis = isRefundReqis;
	}
		
		
}
