package com.waremec.wpt.hzm.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.wpt.admin.domain.AdminOrders;
import com.waremec.wpt.admin.domain.OrderStatus;
import com.waremec.wpt.admin.service.OrdersService;

@Controller("hzmOrdersAction")
@Scope(ScopeType.prototype)
public class Hzm_OrdersAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private static final String rowEnd = ";";
	private static final String columnEnd = ",";
	private String SHOP_ID = "";
	private String STATUS_ID = "10";
	private String ORDER_ID = "";
	private String ORDER_OUT_ID = "";
	private String DATE_TYPE = "0";
	private String START_DATE = "";
	private String END_DATE = "";
	private String PAY_TYPE_ID = "";
	private String STS_WEIQUAN_ID = "";
	private String ADR_MOBILE = "";
	private String ADR_RECEIPTOR_NM = "";
	private String CUST_NICK_NM = "";
	private String USER_ID = "";
	private String pageEntity = "";
	private String TRANS_COMP = "";
	private String TRANS_NO = "";
	private String INVOICE_DESC = "";
	private String PRICE_TT_AFTER_NEGO = "";
	private String TRANS_FEE = "";
	private String PRICE_SUM = "";
	private String PAY_MILEAGE_POINT = "";
	private static final String START_TIME  = " 00:00:00";
	private static final String END_TIME 	= " 23:59:59";

	@Resource
	private OrdersService ordersService;

	
	//////////////////////////////
	/** 
	*  ????????????????????????   - V2
	* @author: zhengtaifan 
	* @return
	*/
	public String hzm_OrderList() {

		Integer shopId =  getBackSessionShopId();
		USER_ID = getBackSessionUserId();
		
		AdminOrders ordersIn = new AdminOrders();
		ordersIn.setSHOP_ID_IN(shopId);
		ordersIn.setUSER_ID_IN(getBackSessionUserId());
		
		List<AdminOrders> payCodeList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchPayList", ordersIn);
		List<AdminOrders> transCompList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchTransComp", ordersIn);
		
		request.put("payCodeList", payCodeList);
		request.put("transCompList", transCompList);

		Map<String,Object> queryMap = new HashMap<String,Object>();
		queryMap.put("SHOP_ID", shopId);
		queryMap.put("USER_ID", USER_ID);
		
		Map<String,Object> orderStatic = ordersService.select("AdminOrdersAll.ORDER_ALL_STATIC", queryMap);
		request.put("orderStatic", orderStatic);
		
		
		return "hzm_OrderList";
	}
	
	public String hzm_OrderListFragment() throws UnsupportedEncodingException {
		
		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();
		Integer statusId = IntegerUtils.valueOf(getRequest().getParameter("statusId"));
		String orderOutNo = StringUtils.trimToNull(getRequest().getParameter("orderOutNo"));
		Integer dateType = IntegerUtils.valueOf(getRequest().getParameter("dateType"));
		String startDate = StringUtils.trimToNull(getRequest().getParameter("startDate"));
		String endDate = StringUtils.trimToNull(getRequest().getParameter("endDate"));
		Integer payTypeId = IntegerUtils.valueOf(getRequest().getParameter("payTypeId"));
		String adrMobile = StringUtils.trimToNull(getRequest().getParameter("adrMobile"));
		String adrReceiptorNm = StringUtils.trimToNull(getRequest().getParameter("adrReceiptorNm"));
		String custNickNm = StringUtils.trimToNull(getRequest().getParameter("custNickNm"));
		
		AdminOrders orderQuery = new AdminOrders();
		orderQuery.setSHOP_ID_IN(shopId);
		orderQuery.setPageCurr(pageCurr);
		orderQuery.setPageUint(pageUnit);
		orderQuery.setSTATUS_ID_IN(statusId);
		orderQuery.setORDER_OUT_ID_IN(orderOutNo);
		
		if(dateType != null && StringUtils.isNotBlank(startDate) && StringUtils.isNotBlank(endDate) ){
			startDate = startDate + START_TIME;
			endDate = endDate + END_TIME;
			
			switch (dateType) {
			case 1:
				orderQuery.setSTS_ORDER_DT_FR_IN(startDate);
				orderQuery.setSTS_ORDER_DT_TO_IN(endDate);
				break;
			case 2:
				orderQuery.setSTS_PAYMENT_DT_FR_IN(startDate);
				orderQuery.setSTS_PAYMENT_DT_TO_IN(endDate);
				break;
			case 3:
				orderQuery.setSTS_DELIVERY_DT_FR_IN(startDate);
				orderQuery.setSTS_DELIVERY_DT_TO_IN(endDate);
				break;
			case 4:
				orderQuery.setSTS_ARRIVAL_DT_FR_IN(startDate);
				orderQuery.setSTS_ARRIVAL_DT_TO_IN(endDate);
				break;
			case 5:
				orderQuery.setSTS_COLLECT_DT_FR_IN(startDate);
				orderQuery.setSTS_COLLECT_DT_TO_IN(endDate);
				break;
			}
		}
		
		orderQuery.setPAY_TYPE_ID_IN(payTypeId);
		if (!STS_WEIQUAN_ID.equals("")) {  //???????????????????????
			orderQuery.setSTS_WEIQUAN_ID_IN(Integer.parseInt(STS_WEIQUAN_ID));
		}
		orderQuery.setADR_MOBILE_IN(adrMobile);
		orderQuery.setADR_RECEIPTOR_NM_IN(adrReceiptorNm);
		orderQuery.setCUST_NICK_NM_IN(custNickNm);
		orderQuery.setUSER_ID_IN(userId);
		
		List<AdminOrders> transCompList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchTransComp", orderQuery);
	 
		
		List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", orderQuery);
		
		PageData page = new PageData();
		if (!orderList.isEmpty()) {
			
			for (AdminOrders item : orderList) {
				orderQuery.setORDER_ID_IN(Integer.parseInt(item.getORDER_ID()));
				List<AdminOrders> list = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", orderQuery);
				item.setOrdersDtlList(list);
			}
			
			int totalCount = orderList.get(0).getTOTAL_CNT();
			page = new PageData(pageCurr,pageUnit, totalCount , orderList);
			System.out.println("totalCount=" + totalCount);
		}
		
		request.put("orderList", orderList);
		request.put("transCompList", transCompList);
		request.put("page", page);

		return "hzm_OrderListFragment";
	}
	
	
	public String reloadOrderStatic(){
		
		 
		Integer shopId =  getBackSessionShopId();
		USER_ID = getBackSessionUserId();
 
		Map<String,Object> queryMap = new HashMap<String,Object>();
		queryMap.put("SHOP_ID", shopId);
		queryMap.put("USER_ID", USER_ID);
		
		Map<String,Object> orderStatic = ordersService.select("AdminOrdersAll.ORDER_ALL_STATIC", queryMap);
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
		 rtnMap.put("data", orderStatic);
		 
		 renderJSON(rtnMap);
		
		return NONE;
	}
	
	
	
	/** 
	* ??????????????????
	* @return
	*/
	public String orderDeliver(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			Integer transComp = IntegerUtils.valueOf(getRequest().getParameter("transComp"));
			String transOrderNo = StringUtils.trimToNull(getRequest().getParameter("transOrderNo"));
			 
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setSTATUS_ID_IN(OrderStatus.STATUS_20);
			order.setTRANS_COMP_IN(transComp);
			order.setTRANS_NO_IN(transOrderNo);
			order.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.statusSave", order);

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		 Map<String,Object> rtnMap = new HashMap<String,Object>();
			
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		
		return NONE;
	}
	/** 
	 * ??????????????????
	 * @return
	 */
	public String orderSign(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setSTATUS_ID_IN(OrderStatus.STATUS_30);
			order.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.statusSave", order);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	/** 
	 * ??????????????????
	 * @return
	 */
	public String orderComplete(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setSTATUS_ID_IN(OrderStatus.STATUS_40);
			order.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.statusSave", order);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	/** 
	 * ????????????????????????
	 * @return
	 */
	public String orderPaymentException(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setSTATUS_ID_IN(OrderStatus.STATUS_10);
			order.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.statusSave", order);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	/** 
	 * ??????????????????
	 * @return
	 */
	public String orderDelete(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.timeDel", order);
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	
	
	/** 
	* ??????????????????
	* @return
	*/
	public String orderBatchDeliver(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			String[] orderIds = getRequest().getParameter("orderIds").split(",");
			Integer transComp = IntegerUtils.valueOf(getRequest().getParameter("transComp"));
			String transOrderNo = StringUtils.trimToNull(getRequest().getParameter("transOrderNo"));
			 
			AdminOrders order = new AdminOrders();
			order.setSTATUS_ID_IN(OrderStatus.STATUS_20);
			order.setTRANS_COMP_IN(transComp);
			order.setTRANS_NO_IN(transOrderNo);
			order.setUSER_ID_IN(USER_ID);
			
			for (String orderId : orderIds) {
				order.setORDER_ID_IN(IntegerUtils.valueOf(orderId));
				ordersService.insertDomain("AdminOrdersAll.statusSave", order);
			}
			

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		 Map<String,Object> rtnMap = new HashMap<String,Object>();
			
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 
		 renderJSON(rtnMap);
		
		return NONE;
	}
	
	/** 
	 * ??????????????????
	 * @return
	 */
	public String orderBatchSign(){
		
		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			String[] orderIds = getRequest().getParameter("orderIds").split(",");
			
			AdminOrders order = new AdminOrders();
			order.setSTATUS_ID_IN(OrderStatus.STATUS_30);
			order.setUSER_ID_IN(USER_ID);
			
			for (String orderId : orderIds) {
				order.setORDER_ID_IN(IntegerUtils.valueOf(orderId));
				ordersService.insertDomain("AdminOrdersAll.statusSave", order);
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	
	
	
	/** 
	* ??????????????????????????????
	* @return
	*/
	public String orderPriceModify() {
		USER_ID = getBackSessionUserId();
		Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
		
		AdminOrders order = new AdminOrders();
		order.setORDER_ID_IN(orderId);
		order.setUSER_ID_IN(USER_ID);
		
		AdminOrders orederPreice = (AdminOrders) ordersService.select("AdminOrdersAll.selectOrderCost", order);

		request.put("orederPreice", orederPreice);

		return "orderPriceModify";
	}
	
	/** 
	* ????????????????????????
	* @return
	*/
	public String priceModify() {
		////
		USER_ID = getBackSessionUserId();
		Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setUSER_ID_IN(USER_ID);
			order.setPRICE_TT_AFTER_NEGO_IN(getRequest().getParameter("goodsTotal"));
			order.setPAY_MILEAGE_POINT_IN(getRequest().getParameter("pointTotal"));
			order.setTRANS_FEE_IN(getRequest().getParameter("transTotal"));
			order.setPRICE_SUM_IN(getRequest().getParameter("orderTotal"));
			order.setJOB_TYPE_IN("U");
			
			ordersService.insertDomain("AdminOrdersAll.saveCost", order);
			
			returnMap.put("success", true);
			
		}catch(Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}

		renderJSON(returnMap);
		
		
		
		return NONE;
	}
	
	
	
	
	public String saveRemark() {

		USER_ID = getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try {
			
			Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
			String remark = StringUtils.trimToNull(getRequest().getParameter("remark"));
			
			AdminOrders order = new AdminOrders();
			order.setORDER_ID_IN(orderId);
			order.setINVOICE_DESC_IN(remark);
			order.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.sellComSave", order);

		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}

		JSONObject jo = new JSONObject();
		jo.put("success", success);
		jo.put("err_msg", err_msg);

		renderJSON(jo.toString());

		return NONE;
	}
	
	
	
	/** 
	* ????????????????????????
	* @return
	*/
	public String doExcel()  {

		String ret = "";
		
		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();
		Integer statusId = IntegerUtils.valueOf(getRequest().getParameter("statusId"));
		String orderOutNo = StringUtils.trimToNull(getRequest().getParameter("orderOutNo"));
		Integer dateType = IntegerUtils.valueOf(getRequest().getParameter("dateType"));
		String startDate = StringUtils.trimToNull(getRequest().getParameter("startDate"));
		String endDate = StringUtils.trimToNull(getRequest().getParameter("endDate"));
		Integer payTypeId = IntegerUtils.valueOf(getRequest().getParameter("payTypeId"));
		String adrMobile = StringUtils.trimToNull(getRequest().getParameter("adrMobile"));
		String adrReceiptorNm = StringUtils.trimToNull(getRequest().getParameter("adrReceiptorNm"));
		String custNickNm = StringUtils.trimToNull(getRequest().getParameter("custNickNm"));
		
		try {

			AdminOrders orderQuery = new AdminOrders();
			orderQuery.setSHOP_ID_IN(shopId);
			orderQuery.setPageCurr(pageCurr);
			orderQuery.setPageUint(Integer.MAX_VALUE);
			orderQuery.setSTATUS_ID_IN(statusId);
			orderQuery.setORDER_OUT_ID_IN(orderOutNo);
			
			if(dateType != null && StringUtils.isNotBlank(startDate) && StringUtils.isNotBlank(endDate) ){
				startDate = startDate + START_TIME;
				endDate = endDate + END_TIME;
				
				switch (dateType) {
				case 1:
					orderQuery.setSTS_ORDER_DT_FR_IN(startDate);
					orderQuery.setSTS_ORDER_DT_TO_IN(endDate);
					break;
				case 2:
					orderQuery.setSTS_PAYMENT_DT_FR_IN(startDate);
					orderQuery.setSTS_PAYMENT_DT_TO_IN(endDate);
					break;
				case 3:
					orderQuery.setSTS_DELIVERY_DT_FR_IN(startDate);
					orderQuery.setSTS_DELIVERY_DT_TO_IN(endDate);
					break;
				case 4:
					orderQuery.setSTS_ARRIVAL_DT_FR_IN(startDate);
					orderQuery.setSTS_ARRIVAL_DT_TO_IN(endDate);
					break;
				case 5:
					orderQuery.setSTS_COLLECT_DT_FR_IN(startDate);
					orderQuery.setSTS_COLLECT_DT_TO_IN(endDate);
					break;
				}
			}
			
			orderQuery.setPAY_TYPE_ID_IN(payTypeId);
			if (!STS_WEIQUAN_ID.equals("")) {  //???????????????????????
				orderQuery.setSTS_WEIQUAN_ID_IN(Integer.parseInt(STS_WEIQUAN_ID));
			}
			orderQuery.setADR_MOBILE_IN(adrMobile);
			orderQuery.setADR_RECEIPTOR_NM_IN(adrReceiptorNm);
			orderQuery.setCUST_NICK_NM_IN(custNickNm);
			orderQuery.setUSER_ID_IN(userId);
	
			List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", orderQuery);
			for (AdminOrders orders : orderList) {
				orderQuery.setORDER_ID_IN(Integer.parseInt(orders.getORDER_ID()));
				List<AdminOrders> list = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", orderQuery);
				orders.setOrdersDtlList(list);
			}
	
			String statusNm = "";
			if(statusId == null) {
				statusId = 0;
			}
			switch (statusId) {
			case 10:
				statusNm = getLabel("?????????");
				break;
			case 20:
				statusNm =  getLabel("?????????");
				break;
			case 30:
				statusNm =  getLabel("?????????");
				break;
			case 40:
				statusNm =  getLabel("?????????");
				break;
			case 50:
				statusNm =  getLabel("????????????");
				break;
			case 60:
				statusNm =  getLabel("????????????");
				break;
			case 21:
				statusNm =  getLabel("????????????");
				break;
			default:
				statusNm =  getLabel("????????????");
				break;
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			// ???????????????
			response.reset();
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			// ?????????????????????
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm+getNowDate(), "UTF-8") + ".xls");
			// ???????????????
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// ??????????????????
			WritableSheet sheet = workbook.createSheet(statusNm, 0);
			// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
			sheet.mergeCells(0, 0, 15, 0);
			// ?????????????????????????????????,?????????Arial,???????????????10,??????????????????
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			// ???????????????????????????????????????
			WritableCellFormat titleFormate = new WritableCellFormat(bold);
			// ???????????????????????????????????????
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
			// ????????????????????????????????????
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			// ???????????????????????????????????????
			Label title = new Label(0, 0, statusNm, titleFormate);
			// ????????????????????????
			sheet.setRowView(0, 600, false);
			// ??????????????????
			sheet.addCell(title);
			// ????????????
			int row = 1;
			int col = 0;
			
			String[] titles = {
					getLabel("?????????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("??????") ,
					getLabel("??????") ,
					getLabel("????????????") ,
					getLabel("??????") ,
					getLabel("??????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("??????") ,
					getLabel("??????") ,
					getLabel("????????????") ,
					getLabel("????????????") 
			};
			for (int i = 0; i < titles.length; i++) {
				// ????????????????????????,????????????????????????????????????????????????????????????????????????????????????????????????????????????
				sheet.addCell(new Label(col++, row, titles[i]));
			}
			if (orderList.size() > 0) {
				 
			
			    row = 2;
			    col = 0;
				for (int i = 0 ; i < orderList.size(); i++) {
				
					AdminOrders item = orderList.get(i);
					//sheet.addCell(new Label(col++, row, item.getORDER_OUT_ID(),titleFormate));
					
					for (int j = 0; j < item.getOrdersDtlList().size(); j++) {
						
						AdminOrders itemDlt = item.getOrdersDtlList().get(j);
						sheet.addCell(new Label(col++, row, itemDlt.getORDER_OUT_ID(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getSTATUS_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_SUM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getGOODS_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getSPEC_NM1()+":"+itemDlt.getSPEC_VALUE1()+"   "+itemDlt.getSPEC_NM2()+":"+itemDlt.getSPEC_VALUE2(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_UNIT_SALE().substring(0, itemDlt.getPRICE_UNIT_SALE().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getGOODS_QTY(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_SALE().substring(0, itemDlt.getPRICE_SALE().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_UNIT_SUM().substring(0, itemDlt.getPRICE_UNIT_SUM().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getTRANS_FEE().substring(0, itemDlt.getTRANS_FEE().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPAY_TYPE_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getCUST_ADDRESS(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getADR_RECEIPTOR_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getADR_MOBILE(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getCUST_MSG(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getINVOICE_DESC(), titleFormate));
						
						row++;
						col = 0;
						
					}
				}
	
			} else {
				ret = "fail";
			}
			// ????????????????????????????????????????????????????????????
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);

		return NONE;
	}
	
	
	
	/** 
	* ???????????????????????????
	* @return
	*/
	public String orderDetail() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();

		Integer shopId =  getBackSessionShopId();
		USER_ID = getBackSessionUserId();
		Integer orderId = IntegerUtils.valueOf(getRequest().getParameter("orderId"));
		
		
		AdminOrders order = new AdminOrders();
		order.setSHOP_ID_IN(shopId);
		order.setORDER_ID_IN(orderId);
		order.setUSER_ID_IN(USER_ID);

		List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", order);

		request.put("orderList", orderList);
		request.put("order", orderList.get(0));
		 

		return "orderDetail";
	}
	
	//////////////////////////////
	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ???????????????????????????
	 */
	public String ordersAll() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();
		
		AdminOrders ordersIn = new AdminOrders();
		ordersIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		ordersIn.setUSER_ID_IN(USER_ID);
		
		List<AdminOrders> payCodeList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchPayList", ordersIn);
		List<AdminOrders> transCompList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchTransComp", ordersIn);
		
		request.put("payCodeList", payCodeList);
		request.put("transCompList", transCompList);

		return "ordersAll";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: ???????????????list????????????
	 */
	public String ordersAllConds() throws UnsupportedEncodingException {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();
		String strAdrReceiptorNm = "";
		String strCustNickNm = "";
		int pageUnitCount = 0;
		int waitFaTatal = 0;
		int waitTuiTatal = 0;
		
		
		if (!ADR_RECEIPTOR_NM.equals("")) {
			
			strAdrReceiptorNm = new String(ADR_RECEIPTOR_NM.getBytes("ISO-8859-1"),"UTF-8");
		}
		if (!CUST_NICK_NM.equals("")) {
			
			strCustNickNm = new String(CUST_NICK_NM.getBytes("ISO-8859-1"),"UTF-8");
		}

		//AdminOrders transCompIn = new AdminOrders();
		AdminOrders ordersIn = new AdminOrders();
		ordersIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		ordersIn.setPageCurr(pageCurr);
		ordersIn.setPageUint(pageUnit);
		if (!STATUS_ID.equals("")) {
			ordersIn.setSTATUS_ID_IN(Integer.parseInt(STATUS_ID));
		}
		if (!ORDER_OUT_ID.equals("")) {
			ordersIn.setORDER_OUT_ID_IN(ORDER_OUT_ID);
		}
		switch (Integer.parseInt(DATE_TYPE)) {
		case 1:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_ORDER_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_ORDER_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 2:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_PAYMENT_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_PAYMENT_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 3:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_DELIVERY_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_DELIVERY_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 4:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_ARRIVAL_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_ARRIVAL_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 5:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_COLLECT_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_COLLECT_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		}
		if (!PAY_TYPE_ID.equals("")) {
			ordersIn.setPAY_TYPE_ID_IN(Integer.parseInt(PAY_TYPE_ID));
		}
		if (!STS_WEIQUAN_ID.equals("")) {
			ordersIn.setSTS_WEIQUAN_ID_IN(Integer.parseInt(STS_WEIQUAN_ID));
		}
		if (!ADR_MOBILE.equals("")) {
			ordersIn.setADR_MOBILE_IN(ADR_MOBILE);
		}
		if (!strAdrReceiptorNm.equals("")) {
			ordersIn.setADR_RECEIPTOR_NM_IN(strAdrReceiptorNm);
		}
		if (!strCustNickNm.equals("")) {
			ordersIn.setCUST_NICK_NM_IN(strCustNickNm);
		}
		ordersIn.setUSER_ID_IN(USER_ID);
		
		List<AdminOrders> transCompList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchTransComp", ordersIn);
		//int pageUnitCount = ordersService.selectCount("AdminOrdersAll.searchListCount", ordersIn);
		
		List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);
		
		if (orderList.size() > 0) {
			pageUnitCount = orderList.get(0).getTOTAL_CNT();
		}
		for (AdminOrders orders : orderList) {
			ordersIn.setORDER_ID_IN(Integer.parseInt(orders.getORDER_ID()));
			List<AdminOrders> list = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);
			orders.setOrdersDtlList(list);
		}
		
		int pageCount = 0;
		if (pageEntity.equals("") || pageEntity == null) {
			pageCount = pageUnitCount / pageUnit + (pageUnitCount % pageUnit == 0 ? 0 : 1);
		} else {
			pageCount = pageUnitCount / Integer.parseInt(pageEntity) + (pageUnitCount % Integer.parseInt(pageEntity) == 0 ? 0 : 1);
		}
		
		AdminOrders ordersCntIn = new AdminOrders();
		ordersCntIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		ordersCntIn.setPageCurr(pageCurr);
		ordersCntIn.setPageUint(pageUnit);
		if (!ORDER_OUT_ID.equals("")) {
			ordersCntIn.setORDER_OUT_ID_IN(ORDER_OUT_ID);
		}
		switch (Integer.parseInt(DATE_TYPE)) {
		case 1:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersCntIn.setSTS_ORDER_DT_FR_IN(START_DATE + START_TIME);
				ordersCntIn.setSTS_ORDER_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 2:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersCntIn.setSTS_PAYMENT_DT_FR_IN(START_DATE + START_TIME);
				ordersCntIn.setSTS_PAYMENT_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 3:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersCntIn.setSTS_DELIVERY_DT_FR_IN(START_DATE + START_TIME);
				ordersCntIn.setSTS_DELIVERY_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 4:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersCntIn.setSTS_ARRIVAL_DT_FR_IN(START_DATE + START_TIME);
				ordersCntIn.setSTS_ARRIVAL_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 5:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersCntIn.setSTS_COLLECT_DT_FR_IN(START_DATE + START_TIME);
				ordersCntIn.setSTS_COLLECT_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		}
		if (!PAY_TYPE_ID.equals("")) {
			ordersCntIn.setPAY_TYPE_ID_IN(Integer.parseInt(PAY_TYPE_ID));
		}
		if (!STS_WEIQUAN_ID.equals("")) {
			ordersCntIn.setSTS_WEIQUAN_ID_IN(Integer.parseInt(STS_WEIQUAN_ID));
		}
		if (!ADR_MOBILE.equals("")) {
			ordersCntIn.setADR_MOBILE_IN(ADR_MOBILE);
		}
		if (!strAdrReceiptorNm.equals("")) {
			ordersCntIn.setADR_RECEIPTOR_NM_IN(strAdrReceiptorNm);
		}
		if (!strCustNickNm.equals("")) {
			ordersCntIn.setCUST_NICK_NM_IN(strCustNickNm);
		}
		ordersCntIn.setUSER_ID_IN(USER_ID);
		
		ordersCntIn.setSTATUS_ID_IN(20);
		List<AdminOrders> waitFaList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersCntIn);
		ordersCntIn.setSTATUS_ID_IN(21);
		List<AdminOrders> waitTuiList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersCntIn);
		//long start = System.currentTimeMillis();
		//System.out.println(System.currentTimeMillis() - start);
		
		if (waitFaList.size() > 0) {
			waitFaTatal = waitFaList.get(0).getTOTAL_CNT();
		}
		if (waitTuiList.size() > 0) {
			waitTuiTatal = waitTuiList.get(0).getTOTAL_CNT();
		}
		
		request.put("orderList", orderList);
		request.put("transCompList", transCompList);
		
		request.put("pageUnitCount", pageUnitCount);
		request.put("pageCount", pageCount);
		request.put("pageCurr", pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageEntity", pageEntity);
		
		request.put("waitFaTatal", waitFaTatal);
		request.put("waitTuiTatal", waitTuiTatal);

		return "ordersAllConds";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ?????????????????????
	 */
	public String search() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();

		AdminOrders ordersIn = new AdminOrders();
		ordersIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		if (!STATUS_ID.equals("")) {
			ordersIn.setSTATUS_ID_IN(Integer.parseInt(STATUS_ID));
		}
		if (!ORDER_OUT_ID.equals("")) {
			ordersIn.setORDER_OUT_ID_IN(ORDER_OUT_ID);
		}
		switch (Integer.parseInt(DATE_TYPE)) {
		case 1:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_ORDER_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_ORDER_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 2:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_PAYMENT_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_PAYMENT_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 3:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_DELIVERY_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_DELIVERY_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 4:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_ARRIVAL_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_ARRIVAL_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		case 5:
			if (!START_DATE.equals("") && !END_DATE.equals("")) {
				ordersIn.setSTS_COLLECT_DT_FR_IN(START_DATE + START_TIME);
				ordersIn.setSTS_COLLECT_DT_TO_IN(END_DATE + END_TIME);
			}
			break;
		}
		if (!PAY_TYPE_ID.equals("")) {
			ordersIn.setPAY_TYPE_ID_IN(Integer.parseInt(PAY_TYPE_ID));
		}
		if (!STS_WEIQUAN_ID.equals("")) {
			ordersIn.setSTS_WEIQUAN_ID_IN(Integer.parseInt(STS_WEIQUAN_ID));
		}
		if (!ADR_MOBILE.equals("")) {
			ordersIn.setADR_MOBILE_IN(ADR_MOBILE);
		}
		if (!ADR_RECEIPTOR_NM.equals("")) {
			ordersIn.setADR_RECEIPTOR_NM_IN(ADR_RECEIPTOR_NM);
		}
		if (!CUST_NICK_NM.equals("")) {
			ordersIn.setCUST_NICK_NM_IN(CUST_NICK_NM);
		}
		ordersIn.setUSER_ID_IN(USER_ID);

		List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);
		for (AdminOrders orders : orderList) {
			ordersIn.setORDER_ID_IN(Integer.parseInt(orders.getORDER_ID()));
			List<AdminOrders> list = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);
			orders.setOrdersDtlList(list);
		}

		request.put("orderList", orderList);

		return "ordersAllConds";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ?????????????????????????????????
	 */
	public String ordersAllDlt() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();

		AdminOrders ordersIn = new AdminOrders();
		ordersIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		ordersIn.setUSER_ID_IN(USER_ID);
		ordersIn.setORDER_ID_IN(Integer.parseInt(ORDER_ID));

		List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);

		String ORDER_OUT_ID_OUT = "";// ?????????
		String STS_ORDER_DT_OUT = "";// ????????????
		String STS_PAYMENT_DT_OUT = "";// ????????????
		String STS_DELIVERY_DT_OUT = "";// ????????????
		String STS_ARRIVAL_DT_OUT = "";// ????????????
		String STATUS_ID_OUT = "";// ????????????ID
		String STATUS_NM_OUT = "";// ??????????????????
		String PRICE_SUM_OUT = "";// ????????????
		String CUST_REAL_NM_OUT = "";// ????????????
		String PAY_TYPE_NM_OUT = "";// ????????????
		String CUST_ADDRESS_OUT = "";// ????????????
		String ADR_MOBILE_OUT = "";// ???????????????
		String ADR_RECEIPTOR_NM_OUT = "";// ???????????????
		String CUST_MSG_OUT = "";// ????????????
		String INVOICE_DESC_OUT = "";// ????????????
		String TRANS_FEE = "";// ??????
		String GOODS_GPA = "";// ??????
		String GOODS_LOGISTIC_GPA = "";// ??????
		String GOODS_SERVICE_GPA = "";// ??????

		AdminOrders reDlt = orderList.get(0);
		ORDER_OUT_ID_OUT = reDlt.getORDER_OUT_ID();
		STS_ORDER_DT_OUT = reDlt.getSTS_ORDER_DT();
		STS_PAYMENT_DT_OUT = reDlt.getSTS_PAYMENT_DT();
		STS_DELIVERY_DT_OUT = reDlt.getSTS_DELIVERY_DT();
		STS_ARRIVAL_DT_OUT = reDlt.getSTS_ARRIVAL_DT();
		STATUS_ID_OUT = reDlt.getSTATUS_ID();
		STATUS_NM_OUT = reDlt.getSTATUS_NM();
		PRICE_SUM_OUT = reDlt.getPRICE_SUM();
		CUST_REAL_NM_OUT = reDlt.getCUST_REAL_NM();
		PAY_TYPE_NM_OUT = reDlt.getPAY_TYPE_NM();
		CUST_ADDRESS_OUT = reDlt.getCUST_ADDRESS();
		ADR_MOBILE_OUT = reDlt.getADR_MOBILE();
		ADR_RECEIPTOR_NM_OUT = reDlt.getADR_RECEIPTOR_NM();
		CUST_MSG_OUT = reDlt.getCUST_MSG();
		INVOICE_DESC_OUT = reDlt.getINVOICE_DESC();
		TRANS_FEE = reDlt.getTRANS_FEE();
		GOODS_GPA = reDlt.getGOODS_GPA();
		GOODS_LOGISTIC_GPA = reDlt.getGOODS_LOGISTIC_GPA();
		GOODS_SERVICE_GPA = reDlt.getGOODS_SERVICE_GPA();

		request.put("orderList", orderList);
		request.put("ORDER_OUT_ID_OUT", ORDER_OUT_ID_OUT);
		request.put("STS_ORDER_DT_OUT", STS_ORDER_DT_OUT);
		request.put("STS_PAYMENT_DT_OUT", STS_PAYMENT_DT_OUT);// ????????????
		request.put("STS_DELIVERY_DT_OUT", STS_DELIVERY_DT_OUT);
		request.put("STS_ARRIVAL_DT_OUT", STS_ARRIVAL_DT_OUT);
		request.put("STATUS_ID_OUT", STATUS_ID_OUT);
		request.put("STATUS_NM_OUT", STATUS_NM_OUT);
		request.put("PRICE_SUM_OUT", PRICE_SUM_OUT);
		request.put("CUST_REAL_NM_OUT", CUST_REAL_NM_OUT);
		request.put("PAY_TYPE_NM_OUT", PAY_TYPE_NM_OUT);
		request.put("CUST_ADDRESS_OUT", CUST_ADDRESS_OUT);
		request.put("ADR_MOBILE_OUT", ADR_MOBILE_OUT);
		request.put("ADR_RECEIPTOR_NM_OUT", ADR_RECEIPTOR_NM_OUT);
		request.put("CUST_MSG_OUT", CUST_MSG_OUT);
		request.put("INVOICE_DESC_OUT", INVOICE_DESC_OUT);
		request.put("TRANS_FEE", TRANS_FEE);
		request.put("GOODS_GPA", GOODS_GPA);
		request.put("GOODS_LOGISTIC_GPA", GOODS_LOGISTIC_GPA);
		request.put("GOODS_SERVICE_GPA", GOODS_SERVICE_GPA);

		return "ordersAllDlt";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ???????????????????????????
	 */
	public String orderOption() {

		USER_ID = getBackSessionUserId();
		String ret = "SUCCESS";

		try {

			AdminOrders ordersIn = new AdminOrders();
			ordersIn.setORDER_ID_IN(Integer.parseInt(ORDER_ID));
			ordersIn.setSTATUS_ID_IN(Integer.parseInt(STATUS_ID));
			if (!TRANS_COMP.equals("")) {
				ordersIn.setTRANS_COMP_IN(Integer.parseInt(TRANS_COMP));
			}
			if (!TRANS_NO.equals("")) {
				ordersIn.setTRANS_NO_IN(TRANS_NO);
			}
			ordersIn.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.statusSave", ordersIn);

		} catch (Exception e) {
			ret = "FAIL";
		}

		JSONObject jo = new JSONObject();
		jo.put("result", ret);

		renderHtml(jo.toString());

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ???????????????????????????
	 */
	public String orderTimeDel() {

		USER_ID = getBackSessionUserId();

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {

			AdminOrders ordersIn = new AdminOrders();
			ordersIn.setORDER_ID_IN(Integer.parseInt(ORDER_ID));
			ordersIn.setUSER_ID_IN(USER_ID);

			ordersService.insertDomain("AdminOrdersAll.timeDel", ordersIn);
			
			returnMap.put("SUCCESS", true);
			
		}catch(Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("SUCCESS", false);
			returnMap.put("ERR_MSG", e.getMessage());
		}

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: menuTop user img modify
	 */
	public String userImgModify() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {

			Map<String, Object> ordersIn = new HashMap<String, Object>();
			ordersIn.put("SHOP_ID", SHOP_ID);
			ordersIn.put("USER_ID", USER_ID);

			Map<String,Object> reMap = commonService.select("AdminOrdersAll.getShopImg", ordersIn);
			
			returnMap.put("SUCCESS", true);
			returnMap.put("SHOP_LOGO_PIC", (String)reMap.get("SHOP_LOGO_PIC"));
			
		}catch(Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("SUCCESS", false);
			returnMap.put("SHOP_LOGO_PIC", "/admin/images/icon/icon-user.png");
		}

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ???????????????????????????
	 */
	public String ajaxSellComSave() {

		USER_ID = getBackSessionUserId();
		String ret = "SUCCESS";

		try {

			AdminOrders ordersIn = new AdminOrders();
			ordersIn.setORDER_ID_IN(Integer.parseInt(ORDER_ID));
			ordersIn.setINVOICE_DESC_IN(INVOICE_DESC);
			ordersIn.setUSER_ID_IN(USER_ID);
			
			ordersService.insertDomain("AdminOrdersAll.sellComSave", ordersIn);

		} catch (Exception e) {
			ret = "FAIL";
		}

		JSONObject jo = new JSONObject();
		jo.put("result", ret);

		renderHtml(jo.toString());

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: ?????????????????????????????????
	 */
	public String ordersOption() {

		USER_ID = getBackSessionUserId();
		String ret = "SUCCESS";
		String[] strOrderIds = ORDER_ID.split(",");

		try {
			
			for (int i = 0; i < strOrderIds.length; i++) {

				AdminOrders ordersIn = new AdminOrders();
				ordersIn.setORDER_ID_IN(Integer.parseInt(strOrderIds[i]));
				ordersIn.setSTATUS_ID_IN(Integer.parseInt(STATUS_ID));
				ordersIn.setUSER_ID_IN(USER_ID);
				if (!TRANS_COMP.equals("")) {
					ordersIn.setTRANS_COMP_IN(Integer.parseInt(TRANS_COMP));
				}
				if (!TRANS_NO.equals("")) {
					ordersIn.setTRANS_NO_IN(TRANS_NO);
				}
				
				ordersService.insertDomain("AdminOrdersAll.statusSave", ordersIn);
			}

		} catch (Exception e) {
			ret = "FAIL";
		}

		JSONObject jo = new JSONObject();
		jo.put("result", ret);

		renderHtml(jo.toString());

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: ?????????????????????Excel
	 */
	public String exportExcel() throws UnsupportedEncodingException {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();
		String strAdrReceiptorNm = "";
		String strCustNickNm = "";
		String statusNm = "";
		String ret = "SUCCESS";
		int statusId = 0;
		if (!STATUS_ID.equals("")) {
			statusId = Integer.parseInt(STATUS_ID);
		}
		
		if (!ADR_RECEIPTOR_NM.equals("")) {
			
			strAdrReceiptorNm = new String(ADR_RECEIPTOR_NM.getBytes("ISO-8859-1"),"UTF-8");
		}
		if (!CUST_NICK_NM.equals("")) {
			
			strCustNickNm = new String(CUST_NICK_NM.getBytes("ISO-8859-1"),"UTF-8");
		}
		
		try {

			AdminOrders ordersIn = new AdminOrders();
			ordersIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
			ordersIn.setPageCurr(pageCurr);
			ordersIn.setPageUint(1000000);
			if (!STATUS_ID.equals("")) {
				ordersIn.setSTATUS_ID_IN(Integer.parseInt(STATUS_ID));
			}
			if (!ORDER_OUT_ID.equals("")) {
				ordersIn.setORDER_OUT_ID_IN(ORDER_OUT_ID);
			}
			switch (Integer.parseInt(DATE_TYPE)) {
			case 1:
				if (!START_DATE.equals("") && !END_DATE.equals("")) {
					ordersIn.setSTS_ORDER_DT_FR_IN(START_DATE + START_TIME);
					ordersIn.setSTS_ORDER_DT_TO_IN(END_DATE + END_TIME);
				}
				break;
			case 2:
				if (!START_DATE.equals("") && !END_DATE.equals("")) {
					ordersIn.setSTS_PAYMENT_DT_FR_IN(START_DATE + START_TIME);
					ordersIn.setSTS_PAYMENT_DT_TO_IN(END_DATE + END_TIME);
				}
				break;
			case 3:
				if (!START_DATE.equals("") && !END_DATE.equals("")) {
					ordersIn.setSTS_DELIVERY_DT_FR_IN(START_DATE + START_TIME);
					ordersIn.setSTS_DELIVERY_DT_TO_IN(END_DATE + END_TIME);
				}
				break;
			case 4:
				if (!START_DATE.equals("") && !END_DATE.equals("")) {
					ordersIn.setSTS_ARRIVAL_DT_FR_IN(START_DATE + START_TIME);
					ordersIn.setSTS_ARRIVAL_DT_TO_IN(END_DATE + END_TIME);
				}
				break;
			case 5:
				if (!START_DATE.equals("") && !END_DATE.equals("")) {
					ordersIn.setSTS_COLLECT_DT_FR_IN(START_DATE + START_TIME);
					ordersIn.setSTS_COLLECT_DT_TO_IN(END_DATE + END_TIME);
				}
				break;
			}
			if (!PAY_TYPE_ID.equals("")) {
				ordersIn.setPAY_TYPE_ID_IN(Integer.parseInt(PAY_TYPE_ID));
			}
			if (!STS_WEIQUAN_ID.equals("")) {
				ordersIn.setSTS_WEIQUAN_ID_IN(Integer.parseInt(STS_WEIQUAN_ID));
			}
			if (!ADR_MOBILE.equals("")) {
				ordersIn.setADR_MOBILE_IN(ADR_MOBILE);
			}
			if (!strAdrReceiptorNm.equals("")) {
				ordersIn.setADR_RECEIPTOR_NM_IN(strAdrReceiptorNm);
			}
			if (!strCustNickNm.equals("")) {
				ordersIn.setCUST_NICK_NM_IN(strCustNickNm);
			}
			ordersIn.setUSER_ID_IN(USER_ID);
	
			List<AdminOrders> orderList = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);
			for (AdminOrders orders : orderList) {
				ordersIn.setORDER_ID_IN(Integer.parseInt(orders.getORDER_ID()));
				List<AdminOrders> list = (List<AdminOrders>) ordersService.selectList("AdminOrdersAll.searchList", ordersIn);
				orders.setOrdersDtlList(list);
			}
			switch (statusId) {
			case 10:
				statusNm = getLabel("?????????");
				break;
			case 20:
				statusNm =  getLabel("?????????");
				break;
			case 30:
				statusNm =  getLabel("?????????");
				break;
			case 40:
				statusNm =  getLabel("?????????");
				break;
			case 50:
				statusNm =  getLabel("????????????");
				break;
			case 60:
				statusNm =  getLabel("????????????");
				break;
			case 21:
				statusNm =  getLabel("????????????");
				break;
			default:
				statusNm =  getLabel("????????????");
				break;
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			// ???????????????
			response.reset();
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			// ?????????????????????
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm+getNowDate(), "UTF-8") + ".xls");
			// ???????????????
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// ??????????????????
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
			// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
			sheet.mergeCells(0, 0, 15, 0);
			// ?????????????????????????????????,?????????Arial,???????????????10,??????????????????
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			// ???????????????????????????????????????
			WritableCellFormat titleFormate = new WritableCellFormat(bold);
			// ???????????????????????????????????????
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
			// ????????????????????????????????????
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			// ???????????????????????????????????????
			Label title = new Label(0, 0, statusNm, titleFormate);
			// ????????????????????????
			sheet.setRowView(0, 600, false);
			// ??????????????????
			sheet.addCell(title);
			// ????????????
			int row = 1;
			int col = 0;
			
			String[] titles = {
					getLabel("?????????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("??????") ,
					getLabel("??????") ,
					getLabel("????????????") ,
					getLabel("??????") ,
					getLabel("??????") ,
					getLabel("????????????") ,
					getLabel("????????????") ,
					getLabel("??????") ,
					getLabel("??????") ,
					getLabel("????????????") ,
					getLabel("????????????") 
			};
			for (int i = 0; i < titles.length; i++) {
				// ????????????????????????,????????????????????????????????????????????????????????????????????????????????????????????????????????????
				sheet.addCell(new Label(col++, row, titles[i]));
			}
			if (orderList.size() > 0) {
			    row = 2;
			    col = 0;
				for (int i = 0 ; i < orderList.size(); i++) {
				
					AdminOrders item = orderList.get(i);
					//sheet.addCell(new Label(col++, row, item.getORDER_OUT_ID(),titleFormate));
					
					for (int j = 0; j < item.getOrdersDtlList().size(); j++) {
						
						AdminOrders itemDlt = item.getOrdersDtlList().get(j);
						sheet.addCell(new Label(col++, row, itemDlt.getORDER_OUT_ID(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getSTATUS_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_SUM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getGOODS_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getSPEC_NM1()+":"+itemDlt.getSPEC_VALUE1()+"   "+itemDlt.getSPEC_NM2()+":"+itemDlt.getSPEC_VALUE2(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_UNIT_SALE().substring(0, itemDlt.getPRICE_UNIT_SALE().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getGOODS_QTY(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_SALE().substring(0, itemDlt.getPRICE_SALE().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPRICE_UNIT_SUM().substring(0, itemDlt.getPRICE_UNIT_SUM().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getTRANS_FEE().substring(0, itemDlt.getTRANS_FEE().length()-2), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getPAY_TYPE_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getCUST_ADDRESS(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getADR_RECEIPTOR_NM(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getADR_MOBILE(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getCUST_MSG(), titleFormate));
						sheet.addCell(new Label(col++, row, itemDlt.getINVOICE_DESC(), titleFormate));
						
						row++;
						col = 0;
						
					}
				}
	
			} else {
				ret = "fail";
			}
			// ????????????????????????????????????????????????????????????
			workbook.write();
			workbook.close();
			os.close();

		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);

		return NONE;
	}


	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: ???????????????list????????????
	 */
	public String orderCostM() {
		
		AdminOrders ordersIn = new AdminOrders();
		ordersIn.setORDER_ID_IN(Integer.parseInt(ORDER_ID));
		ordersIn.setUSER_ID_IN(USER_ID);
		
		AdminOrders reCost = (AdminOrders) ordersService.select("AdminOrdersAll.selectOrderCost", ordersIn);

		request.put("reCost", reCost);

		return "orderCostM";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: ???????????????list????????????
	 */
	public String ajaxSaveCost() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();

		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		try {
			
			AdminOrders ordersIn = new AdminOrders();
			ordersIn.setORDER_ID_IN(Integer.parseInt(ORDER_ID));
			ordersIn.setUSER_ID_IN(USER_ID);
			ordersIn.setPRICE_TT_AFTER_NEGO_IN(PRICE_TT_AFTER_NEGO);
			ordersIn.setTRANS_FEE_IN(TRANS_FEE);
			ordersIn.setPRICE_SUM_IN(PRICE_SUM);
			ordersIn.setPAY_MILEAGE_POINT_IN(PAY_MILEAGE_POINT);
			ordersIn.setJOB_TYPE_IN("U");
			
			ordersService.insertDomain("AdminOrdersAll.saveCost", ordersIn);
			
			returnMap.put("success", true);
			
		}catch(Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: list??????String
	 */
	public static String ListToString(List<AdminOrders> list) {

		StringBuffer sb = new StringBuffer();

		if (list != null && list.size() > 0) {

			for (int i = 0; i < list.size(); i++) {
				for (int j = 0; j < list.get(i).hashCode(); j++) {
					// sb.append(list.get(i));
					sb.append(columnEnd);
				}
				sb.append(rowEnd);
			}
		}
		return sb.toString();
	}
	
	public static String getNowDate(){
		return new SimpleDateFormat("yyyyMMdd").format(new Date());  
    }

	public String getSHOP_ID() {
		return SHOP_ID;
	}

	public void setSHOP_ID(String sHOP_ID) {
		SHOP_ID = sHOP_ID;
	}

	public String getSTATUS_ID() {
		return STATUS_ID;
	}

	public void setSTATUS_ID(String sTATUS_ID) {
		STATUS_ID = sTATUS_ID;
	}

	public String getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	public String getDATE_TYPE() {
		return DATE_TYPE;
	}

	public void setDATE_TYPE(String dATE_TYPE) {
		DATE_TYPE = dATE_TYPE;
	}

	public String getSTART_DATE() {
		return START_DATE;
	}

	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}

	public String getEND_DATE() {
		return END_DATE;
	}

	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}

	public String getPAY_TYPE_ID() {
		return PAY_TYPE_ID;
	}

	public void setPAY_TYPE_ID(String pAY_TYPE_ID) {
		PAY_TYPE_ID = pAY_TYPE_ID;
	}

	public String getSTS_WEIQUAN_ID() {
		return STS_WEIQUAN_ID;
	}

	public void setSTS_WEIQUAN_ID(String sTS_WEIQUAN_ID) {
		STS_WEIQUAN_ID = sTS_WEIQUAN_ID;
	}

	public String getADR_RECEIPTOR_NM() {
		return ADR_RECEIPTOR_NM;
	}

	public void setADR_RECEIPTOR_NM(String aDR_RECEIPTOR_NM) {
		ADR_RECEIPTOR_NM = aDR_RECEIPTOR_NM;
	}

	public String getADR_MOBILE() {
		return ADR_MOBILE;
	}

	public void setADR_MOBILE(String aDR_MOBILE) {
		ADR_MOBILE = aDR_MOBILE;
	}

	public String getCUST_NICK_NM() {
		return CUST_NICK_NM;
	}

	public void setCUST_NICK_NM(String cUST_NICK_NM) {
		CUST_NICK_NM = cUST_NICK_NM;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getORDER_OUT_ID() {
		return ORDER_OUT_ID;
	}

	public void setORDER_OUT_ID(String oRDER_OUT_ID) {
		ORDER_OUT_ID = oRDER_OUT_ID;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getTRANS_COMP() {
		return TRANS_COMP;
	}

	public void setTRANS_COMP(String tRANS_COMP) {
		TRANS_COMP = tRANS_COMP;
	}

	public String getTRANS_NO() {
		return TRANS_NO;
	}

	public void setTRANS_NO(String tRANS_NO) {
		TRANS_NO = tRANS_NO;
	}

	public String getINVOICE_DESC() {
		return INVOICE_DESC;
	}

	public void setINVOICE_DESC(String iNVOICE_DESC) {
		INVOICE_DESC = iNVOICE_DESC;
	}

	public String getPRICE_TT_AFTER_NEGO() {
		return PRICE_TT_AFTER_NEGO;
	}

	public void setPRICE_TT_AFTER_NEGO(String pRICE_TT_AFTER_NEGO) {
		PRICE_TT_AFTER_NEGO = pRICE_TT_AFTER_NEGO;
	}

	public String getTRANS_FEE() {
		return TRANS_FEE;
	}

	public void setTRANS_FEE(String tRANS_FEE) {
		TRANS_FEE = tRANS_FEE;
	}

	public String getPRICE_SUM() {
		return PRICE_SUM;
	}

	public void setPRICE_SUM(String pRICE_SUM) {
		PRICE_SUM = pRICE_SUM;
	}

	public String getPAY_MILEAGE_POINT() {
		return PAY_MILEAGE_POINT;
	}

	public void setPAY_MILEAGE_POINT(String pAY_MILEAGE_POINT) {
		PAY_MILEAGE_POINT = pAY_MILEAGE_POINT;
	}

}