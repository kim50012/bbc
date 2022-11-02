package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;

public class AdminOrders {
	
	/*----------所有订单in----------*/
	/*店铺Id*/
	private Integer SHOP_ID_IN;
	
	/*订单类型ID*/
	private Integer STATUS_ID_IN;
	
	/*下单日期开始*/
	private String STS_ORDER_DT_FR_IN;
	
	/*下单日期结束*/
	private String STS_ORDER_DT_TO_IN;
	
	/*付款日期开始*/
	private String STS_PAYMENT_DT_FR_IN;
	
	/*付款日期结束*/
	private String STS_PAYMENT_DT_TO_IN;
	
	/*发货日期开始*/
	private String STS_DELIVERY_DT_FR_IN;
	
	/*发货日期结束*/
	private String STS_DELIVERY_DT_TO_IN;
	
	/*签收日期开始*/
	private String STS_ARRIVAL_DT_FR_IN;
	
	/*签收日期结束*/
	private String STS_ARRIVAL_DT_TO_IN;
	
	/*关闭日期开始*/
	private String STS_COLLECT_DT_FR_IN;
	
	/*关闭日期结束*/
	private String STS_COLLECT_DT_TO_IN;
	
	/*退款日期开始*/
	private String STS_RETURN_DT_FR_IN;
	
	/*退款日期结束*/
	private String STS_RETURN_DT_TO_IN;
	
	/*维权日期开始*/
	private String STS_WEIQUAN_DT_FR_IN;
	
	/*维权日期结束*/
	private String STS_WEIQUAN_DT_TO_IN;
	
	/*系统订单编号*/
	private Integer ORDER_ID_IN;
	
	/*订单编号*/
	private String ORDER_OUT_ID_IN;
	
	/*付款方式ID*/
	private Integer PAY_TYPE_ID_IN;
	
	/*维权状态*/
	private Integer STS_WEIQUAN_ID_IN;
	
	/*收货人手机号*/
	private String ADR_MOBILE_IN;
	
	/*收货人姓名*/
	private String ADR_RECEIPTOR_NM_IN;
	
	/*微信昵称*/
	private String CUST_NICK_NM_IN;
	
	/*当前页*/
	private int pageCurr = 1;
	
	/*当前页条数*/
	private int pageUint = 10;
	
	/*User*/
	private String USER_ID_IN;
	
	/*排序基准*/
	private String ORDERBY_IN;
	
	/*物流公司*/
	private int TRANS_COMP_IN;
	
	/*运单号*/
	private String TRANS_NO_IN;
	
	/*卖家备注*/
	private String INVOICE_DESC_IN;
	
	/*修改价格*/
	private String JOB_TYPE_IN;
	private String PRICE_SUM_IN;
	private String TRANS_FEE_IN;
	private String PRICE_TT_AFTER_NEGO_IN;
	private String PAY_MILEAGE_POINT_IN;
	
	
	/*----------所有订单out----------*/
	/*System Customer ID*/
	private String CUST_SYS_ID;
	
	/*店铺Id*/
	private String SHOP_ID;
	
	/*店铺名称*/
	private String SHOP_NM;
	
	/*订单类型ID*/
	private String STATUS_ID;
	
	/*订单类型名称*/
	private String STATUS_NM;
	
	/*订单类型操作名称*/
	private String STATUS_OPTION_NM;
	
	/*下单时间*/
	private String STS_ORDER_DT;
	
	/*发货时间*/
	private String STS_DELIVERY_DT;
	
	/*签收时间*/
	private String STS_ARRIVAL_DT;
	
	/*关闭时间*/
	private String STS_COLLECT_DT;
	
	/*系统订单编号*/
	private String ORDER_ID;
	
	/*订单编号*/
	private String ORDER_OUT_ID;
	
	/*付款方式ID*/
	private String PAY_TYPE_ID;
	
	/*付款方式名称*/
	private String PAY_TYPE_NM;
	
	/*付款方式名称*/
	private String PAY_NAME;
	
	/*维权状态*/
	private String STS_WEIQUAN_ID;
	
	/*收货人手机号*/
	private String ADR_MOBILE;
	
	/*收货人姓名*/
	private String ADR_RECEIPTOR_NM;
	
	/*微信昵称*/
	private String CUST_NICK_NM;
	
	/*订单总数量*/
	private String GOODS_QTY;
	
	/*客户微信名称*/
	private String WX_IF_NICK_NM;
	
	/*商品照片*/
	private String GOODS_LIST_IMG_URL;
	
	/*商品ID*/
	private String GOODS_ID;
	
	/*商品名称*/
	private String GOODS_NM;
	
	/*上架ID*/
	private String DISPLAY_ID;
	
	/*价格ID*/
	private String PRICE_OPTION_ID;
	
	/*商品上架标题*/
	private String DESC_TITLE;
	
	/*购买数量*/
	private String GOODS_QTY2;
	
	/*单价*/
	private String PRICE_UNIT_SALE;
	
	/*总价*/
	private String PRICE_UNIT_SUM;
	
	/*收货信息*/
	private String CUST_ADDRESS;
	
	/*买家备注*/
	private String CUST_MSG;
	
	/*卖家备注*/
	private String INVOICE_DESC;
	
	/*下单用户*/
	private String CUST_REAL_NM;
	
	/*付款时间*/
	private String STS_PAYMENT_DT;
	
	/*运费*/
	private String TRANS_FEE;
	
	/*折扣后价格*/
	private String PRICE_TT_AFTER_NEGO;
	
	/*积分*/
	private String PAY_MILEAGE_POINT;
	
	/*订单总价格*/
	private String PRICE_SUM;
	
	/*订单明细*/
	List<AdminOrders> ordersDtlList = new ArrayList<AdminOrders>();
	
	/*物流公司ID*/
	private String TRANS_COMP_ID;
	
	/*物流公司名称*/
	private String TRANS_COMP_NM;
	
	/*运单号*/
	private String TRANS_NO;
	
	/*商品属性名称1*/
	private String SPEC_NM1;
	
	/*商品属性内容1*/
	private String SPEC_VALUE1;
	
	/*商品属性名称2*/
	private String SPEC_NM2;
	
	/*商品属性内容2*/
	private String SPEC_VALUE2;
	
	/*优惠价格*/
	private String PRICE_SALE;
	
	/*总数*/
	private int TOTAL_CNT;
	
	/*退款申请与否*/
	private String IS_REFUND_REQ;
	
	/*发货提醒*/
	private String REQUEST_DLV_DT;
	
	/*发货提醒*/
	private String PRICE_TT_BEFORE_NEGO;
	
	/*发货提醒*/
	private String TRANS_FEE_ORG;
	
	/*发货提醒*/
	private String PRICE_SUM_ORG;
	
	/*发货提醒*/
	private String DEL_YN;
	
	/*描述*/
	private String GOODS_GPA;
	
	/*物流*/
	private String GOODS_LOGISTIC_GPA;
	
	/*服务*/
	private String GOODS_SERVICE_GPA;
	
	/*宝贝综合文字评价*/
	private String REVIEW_DESC;
	
	/*宝贝综合星星评价*/
	private String TOTAL_GPA;
	
	/*排序*/
	private String ROW_CNT;
	
	
	public Integer getSHOP_ID_IN() {
		return SHOP_ID_IN;
	}

	public void setSHOP_ID_IN(Integer sHOP_ID_IN) {
		SHOP_ID_IN = sHOP_ID_IN;
	}

	public Integer getSTATUS_ID_IN() {
		return STATUS_ID_IN;
	}

	public void setSTATUS_ID_IN(Integer sTATUS_ID_IN) {
		STATUS_ID_IN = sTATUS_ID_IN;
	}

	public String getSTS_ORDER_DT_FR_IN() {
		return STS_ORDER_DT_FR_IN;
	}

	public void setSTS_ORDER_DT_FR_IN(String sTS_ORDER_DT_FR_IN) {
		STS_ORDER_DT_FR_IN = sTS_ORDER_DT_FR_IN;
	}

	public String getSTS_ORDER_DT_TO_IN() {
		return STS_ORDER_DT_TO_IN;
	}

	public void setSTS_ORDER_DT_TO_IN(String sTS_ORDER_DT_TO_IN) {
		STS_ORDER_DT_TO_IN = sTS_ORDER_DT_TO_IN;
	}

	public String getSTS_DELIVERY_DT_FR_IN() {
		return STS_DELIVERY_DT_FR_IN;
	}

	public void setSTS_DELIVERY_DT_FR_IN(String sTS_DELIVERY_DT_FR_IN) {
		STS_DELIVERY_DT_FR_IN = sTS_DELIVERY_DT_FR_IN;
	}

	public String getSTS_DELIVERY_DT_TO_IN() {
		return STS_DELIVERY_DT_TO_IN;
	}

	public void setSTS_DELIVERY_DT_TO_IN(String sTS_DELIVERY_DT_TO_IN) {
		STS_DELIVERY_DT_TO_IN = sTS_DELIVERY_DT_TO_IN;
	}

	public String getSTS_ARRIVAL_DT_FR_IN() {
		return STS_ARRIVAL_DT_FR_IN;
	}

	public void setSTS_ARRIVAL_DT_FR_IN(String sTS_ARRIVAL_DT_FR_IN) {
		STS_ARRIVAL_DT_FR_IN = sTS_ARRIVAL_DT_FR_IN;
	}

	public String getSTS_ARRIVAL_DT_TO_IN() {
		return STS_ARRIVAL_DT_TO_IN;
	}

	public void setSTS_ARRIVAL_DT_TO_IN(String sTS_ARRIVAL_DT_TO_IN) {
		STS_ARRIVAL_DT_TO_IN = sTS_ARRIVAL_DT_TO_IN;
	}

	public String getSTS_COLLECT_DT_FR_IN() {
		return STS_COLLECT_DT_FR_IN;
	}

	public void setSTS_COLLECT_DT_FR_IN(String sTS_COLLECT_DT_FR_IN) {
		STS_COLLECT_DT_FR_IN = sTS_COLLECT_DT_FR_IN;
	}

	public String getSTS_COLLECT_DT_TO_IN() {
		return STS_COLLECT_DT_TO_IN;
	}

	public void setSTS_COLLECT_DT_TO_IN(String sTS_COLLECT_DT_TO_IN) {
		STS_COLLECT_DT_TO_IN = sTS_COLLECT_DT_TO_IN;
	}

	public String getSTS_RETURN_DT_FR_IN() {
		return STS_RETURN_DT_FR_IN;
	}

	public void setSTS_RETURN_DT_FR_IN(String sTS_RETURN_DT_FR_IN) {
		STS_RETURN_DT_FR_IN = sTS_RETURN_DT_FR_IN;
	}

	public String getSTS_RETURN_DT_TO_IN() {
		return STS_RETURN_DT_TO_IN;
	}

	public void setSTS_RETURN_DT_TO_IN(String sTS_RETURN_DT_TO_IN) {
		STS_RETURN_DT_TO_IN = sTS_RETURN_DT_TO_IN;
	}

	public String getSTS_WEIQUAN_DT_FR_IN() {
		return STS_WEIQUAN_DT_FR_IN;
	}

	public void setSTS_WEIQUAN_DT_FR_IN(String sTS_WEIQUAN_DT_FR_IN) {
		STS_WEIQUAN_DT_FR_IN = sTS_WEIQUAN_DT_FR_IN;
	}

	public String getSTS_WEIQUAN_DT_TO_IN() {
		return STS_WEIQUAN_DT_TO_IN;
	}

	public void setSTS_WEIQUAN_DT_TO_IN(String sTS_WEIQUAN_DT_TO_IN) {
		STS_WEIQUAN_DT_TO_IN = sTS_WEIQUAN_DT_TO_IN;
	}

	public Integer getORDER_ID_IN() {
		return ORDER_ID_IN;
	}

	public void setORDER_ID_IN(Integer oRDER_ID_IN) {
		ORDER_ID_IN = oRDER_ID_IN;
	}

	public Integer getPAY_TYPE_ID_IN() {
		return PAY_TYPE_ID_IN;
	}

	public void setPAY_TYPE_ID_IN(Integer pAY_TYPE_ID_IN) {
		PAY_TYPE_ID_IN = pAY_TYPE_ID_IN;
	}

	public Integer getSTS_WEIQUAN_ID_IN() {
		return STS_WEIQUAN_ID_IN;
	}

	public void setSTS_WEIQUAN_ID_IN(Integer sTS_WEIQUAN_ID_IN) {
		STS_WEIQUAN_ID_IN = sTS_WEIQUAN_ID_IN;
	}

	public String getADR_MOBILE_IN() {
		return ADR_MOBILE_IN;
	}

	public void setADR_MOBILE_IN(String aDR_MOBILE_IN) {
		ADR_MOBILE_IN = aDR_MOBILE_IN;
	}

	public String getADR_RECEIPTOR_NM_IN() {
		return ADR_RECEIPTOR_NM_IN;
	}

	public void setADR_RECEIPTOR_NM_IN(String aDR_RECEIPTOR_NM_IN) {
		ADR_RECEIPTOR_NM_IN = aDR_RECEIPTOR_NM_IN;
	}

	public String getCUST_NICK_NM_IN() {
		return CUST_NICK_NM_IN;
	}

	public void setCUST_NICK_NM_IN(String cUST_NICK_NM_IN) {
		CUST_NICK_NM_IN = cUST_NICK_NM_IN;
	}

	public String getUSER_ID_IN() {
		return USER_ID_IN;
	}

	public void setUSER_ID_IN(String uSER_ID_IN) {
		USER_ID_IN = uSER_ID_IN;
	}

	public String getORDERBY_IN() {
		return ORDERBY_IN;
	}

	public void setORDERBY_IN(String oRDERBY_IN) {
		ORDERBY_IN = oRDERBY_IN;
	}

	public String getCUST_SYS_ID() {
		return CUST_SYS_ID;
	}

	public void setCUST_SYS_ID(String cUST_SYS_ID) {
		CUST_SYS_ID = cUST_SYS_ID;
	}

	public String getSHOP_ID() {
		return SHOP_ID;
	}

	public void setSHOP_ID(String sHOP_ID) {
		SHOP_ID = sHOP_ID;
	}

	public String getSHOP_NM() {
		return SHOP_NM;
	}

	public void setSHOP_NM(String sHOP_NM) {
		SHOP_NM = sHOP_NM;
	}

	public String getSTATUS_ID() {
		return STATUS_ID;
	}

	public void setSTATUS_ID(String sTATUS_ID) {
		STATUS_ID = sTATUS_ID;
	}

	public String getSTATUS_NM() {
		return STATUS_NM;
	}

	public void setSTATUS_NM(String sTATUS_NM) {
		STATUS_NM = sTATUS_NM;
	}

	public String getSTS_ORDER_DT() {
		return STS_ORDER_DT;
	}

	public void setSTS_ORDER_DT(String sTS_ORDER_DT) {
		STS_ORDER_DT = sTS_ORDER_DT;
	}

	public String getSTS_DELIVERY_DT() {
		return STS_DELIVERY_DT;
	}

	public void setSTS_DELIVERY_DT(String sTS_DELIVERY_DT) {
		STS_DELIVERY_DT = sTS_DELIVERY_DT;
	}

	public String getSTS_ARRIVAL_DT() {
		return STS_ARRIVAL_DT;
	}

	public void setSTS_ARRIVAL_DT(String sTS_ARRIVAL_DT) {
		STS_ARRIVAL_DT = sTS_ARRIVAL_DT;
	}

	public String getSTS_COLLECT_DT() {
		return STS_COLLECT_DT;
	}

	public void setSTS_COLLECT_DT(String sTS_COLLECT_DT) {
		STS_COLLECT_DT = sTS_COLLECT_DT;
	}

	public String getORDER_ID() {
		return ORDER_ID;
	}

	public void setORDER_ID(String oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}

	public String getORDER_OUT_ID() {
		return ORDER_OUT_ID;
	}

	public void setORDER_OUT_ID(String oRDER_OUT_ID) {
		ORDER_OUT_ID = oRDER_OUT_ID;
	}

	public String getPAY_TYPE_ID() {
		return PAY_TYPE_ID;
	}

	public void setPAY_TYPE_ID(String pAY_TYPE_ID) {
		PAY_TYPE_ID = pAY_TYPE_ID;
	}

	public String getPAY_TYPE_NM() {
		return PAY_TYPE_NM;
	}

	public void setPAY_TYPE_NM(String pAY_TYPE_NM) {
		PAY_TYPE_NM = pAY_TYPE_NM;
	}

	public String getSTS_WEIQUAN_ID() {
		return STS_WEIQUAN_ID;
	}

	public void setSTS_WEIQUAN_ID(String sTS_WEIQUAN_ID) {
		STS_WEIQUAN_ID = sTS_WEIQUAN_ID;
	}

	public String getADR_MOBILE() {
		return ADR_MOBILE;
	}

	public void setADR_MOBILE(String aDR_MOBILE) {
		ADR_MOBILE = aDR_MOBILE;
	}

	public String getADR_RECEIPTOR_NM() {
		return ADR_RECEIPTOR_NM;
	}

	public void setADR_RECEIPTOR_NM(String aDR_RECEIPTOR_NM) {
		ADR_RECEIPTOR_NM = aDR_RECEIPTOR_NM;
	}

	public String getCUST_NICK_NM() {
		return CUST_NICK_NM;
	}

	public void setCUST_NICK_NM(String cUST_NICK_NM) {
		CUST_NICK_NM = cUST_NICK_NM;
	}

	public String getGOODS_QTY() {
		return GOODS_QTY;
	}

	public void setGOODS_QTY(String gOODS_QTY) {
		GOODS_QTY = gOODS_QTY;
	}

	public String getPRICE_SUM() {
		return PRICE_SUM;
	}

	public void setPRICE_SUM(String pRICE_SUM) {
		PRICE_SUM = pRICE_SUM;
	}

	public String getWX_IF_NICK_NM() {
		return WX_IF_NICK_NM;
	}

	public void setWX_IF_NICK_NM(String wX_IF_NICK_NM) {
		WX_IF_NICK_NM = wX_IF_NICK_NM;
	}

	public String getGOODS_LIST_IMG_URL() {
		return GOODS_LIST_IMG_URL;
	}

	public void setGOODS_LIST_IMG_URL(String gOODS_LIST_IMG_URL) {
		GOODS_LIST_IMG_URL = gOODS_LIST_IMG_URL;
	}

	public String getGOODS_ID() {
		return GOODS_ID;
	}

	public void setGOODS_ID(String gOODS_ID) {
		GOODS_ID = gOODS_ID;
	}

	public String getGOODS_NM() {
		return GOODS_NM;
	}

	public void setGOODS_NM(String gOODS_NM) {
		GOODS_NM = gOODS_NM;
	}

	public String getDISPLAY_ID() {
		return DISPLAY_ID;
	}

	public void setDISPLAY_ID(String dISPLAY_ID) {
		DISPLAY_ID = dISPLAY_ID;
	}

	public String getPRICE_OPTION_ID() {
		return PRICE_OPTION_ID;
	}

	public void setPRICE_OPTION_ID(String pRICE_OPTION_ID) {
		PRICE_OPTION_ID = pRICE_OPTION_ID;
	}

	public String getDESC_TITLE() {
		return DESC_TITLE;
	}

	public void setDESC_TITLE(String dESC_TITLE) {
		DESC_TITLE = dESC_TITLE;
	}

	public String getGOODS_QTY2() {
		return GOODS_QTY2;
	}

	public void setGOODS_QTY2(String gOODS_QTY2) {
		GOODS_QTY2 = gOODS_QTY2;
	}

	public String getPRICE_UNIT_SALE() {
		return PRICE_UNIT_SALE;
	}

	public void setPRICE_UNIT_SALE(String pRICE_UNIT_SALE) {
		PRICE_UNIT_SALE = pRICE_UNIT_SALE;
	}

	public String getPRICE_UNIT_SUM() {
		return PRICE_UNIT_SUM;
	}

	public void setPRICE_UNIT_SUM(String pRICE_UNIT_SUM) {
		PRICE_UNIT_SUM = pRICE_UNIT_SUM;
	}

	public List<AdminOrders> getOrdersDtlList() {
		return ordersDtlList;
	}

	public void setOrdersDtlList(List<AdminOrders> ordersDtlList) {
		this.ordersDtlList = ordersDtlList;
	}

	public String getCUST_ADDRESS() {
		return CUST_ADDRESS;
	}

	public void setCUST_ADDRESS(String cUST_ADDRESS) {
		CUST_ADDRESS = cUST_ADDRESS;
	}

	public String getCUST_MSG() {
		return CUST_MSG;
	}

	public void setCUST_MSG(String cUST_MSG) {
		CUST_MSG = cUST_MSG;
	}

	public String getCUST_REAL_NM() {
		return CUST_REAL_NM;
	}

	public void setCUST_REAL_NM(String cUST_REAL_NM) {
		CUST_REAL_NM = cUST_REAL_NM;
	}

	public String getSTS_PAYMENT_DT() {
		return STS_PAYMENT_DT;
	}

	public void setSTS_PAYMENT_DT(String sTS_PAYMENT_DT) {
		STS_PAYMENT_DT = sTS_PAYMENT_DT;
	}

	public String getTRANS_FEE() {
		return TRANS_FEE;
	}

	public void setTRANS_FEE(String tRANS_FEE) {
		TRANS_FEE = tRANS_FEE;
	}

	public String getSTS_PAYMENT_DT_FR_IN() {
		return STS_PAYMENT_DT_FR_IN;
	}

	public void setSTS_PAYMENT_DT_FR_IN(String sTS_PAYMENT_DT_FR_IN) {
		STS_PAYMENT_DT_FR_IN = sTS_PAYMENT_DT_FR_IN;
	}

	public String getSTS_PAYMENT_DT_TO_IN() {
		return STS_PAYMENT_DT_TO_IN;
	}

	public void setSTS_PAYMENT_DT_TO_IN(String sTS_PAYMENT_DT_TO_IN) {
		STS_PAYMENT_DT_TO_IN = sTS_PAYMENT_DT_TO_IN;
	}

	public String getORDER_OUT_ID_IN() {
		return ORDER_OUT_ID_IN;
	}

	public void setORDER_OUT_ID_IN(String oRDER_OUT_ID_IN) {
		ORDER_OUT_ID_IN = oRDER_OUT_ID_IN;
	}

	public String getSTATUS_OPTION_NM() {
		return STATUS_OPTION_NM;
	}

	public void setSTATUS_OPTION_NM(String sTATUS_OPTION_NM) {
		STATUS_OPTION_NM = sTATUS_OPTION_NM;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUint() {
		return pageUint;
	}

	public void setPageUint(int pageUint) {
		this.pageUint = pageUint;
	}

	public int getTRANS_COMP_IN() {
		return TRANS_COMP_IN;
	}

	public void setTRANS_COMP_IN(int tRANS_COMP_IN) {
		TRANS_COMP_IN = tRANS_COMP_IN;
	}

	public String getTRANS_NO_IN() {
		return TRANS_NO_IN;
	}

	public void setTRANS_NO_IN(String tRANS_NO_IN) {
		TRANS_NO_IN = tRANS_NO_IN;
	}

	public String getTRANS_NO() {
		return TRANS_NO;
	}

	public void setTRANS_NO(String tRANS_NO) {
		TRANS_NO = tRANS_NO;
	}

	public String getTRANS_COMP_ID() {
		return TRANS_COMP_ID;
	}

	public void setTRANS_COMP_ID(String tRANS_COMP_ID) {
		TRANS_COMP_ID = tRANS_COMP_ID;
	}

	public String getTRANS_COMP_NM() {
		return TRANS_COMP_NM;
	}

	public void setTRANS_COMP_NM(String tRANS_COMP_NM) {
		TRANS_COMP_NM = tRANS_COMP_NM;
	}

	public String getSPEC_NM1() {
		return SPEC_NM1;
	}

	public void setSPEC_NM1(String sPEC_NM1) {
		SPEC_NM1 = sPEC_NM1;
	}

	public String getSPEC_VALUE1() {
		return SPEC_VALUE1;
	}

	public void setSPEC_VALUE1(String sPEC_VALUE1) {
		SPEC_VALUE1 = sPEC_VALUE1;
	}

	public String getSPEC_NM2() {
		return SPEC_NM2;
	}

	public void setSPEC_NM2(String sPEC_NM2) {
		SPEC_NM2 = sPEC_NM2;
	}

	public String getSPEC_VALUE2() {
		return SPEC_VALUE2;
	}

	public void setSPEC_VALUE2(String sPEC_VALUE2) {
		SPEC_VALUE2 = sPEC_VALUE2;
	}

	public String getINVOICE_DESC() {
		return INVOICE_DESC;
	}

	public void setINVOICE_DESC(String iNVOICE_DESC) {
		INVOICE_DESC = iNVOICE_DESC;
	}

	public String getINVOICE_DESC_IN() {
		return INVOICE_DESC_IN;
	}

	public void setINVOICE_DESC_IN(String iNVOICE_DESC_IN) {
		INVOICE_DESC_IN = iNVOICE_DESC_IN;
	}

	public String getPAY_NAME() {
		return PAY_NAME;
	}

	public void setPAY_NAME(String pAY_NAME) {
		PAY_NAME = pAY_NAME;
	}

	public String getPRICE_SALE() {
		return PRICE_SALE;
	}

	public void setPRICE_SALE(String pRICE_SALE) {
		PRICE_SALE = pRICE_SALE;
	}

	public int getTOTAL_CNT() {
		return TOTAL_CNT;
	}

	public void setTOTAL_CNT(int tOTAL_CNT) {
		TOTAL_CNT = tOTAL_CNT;
	}

	public String getIS_REFUND_REQ() {
		return IS_REFUND_REQ;
	}

	public void setIS_REFUND_REQ(String iS_REFUND_REQ) {
		IS_REFUND_REQ = iS_REFUND_REQ;
	}

	public String getREQUEST_DLV_DT() {
		return REQUEST_DLV_DT;
	}

	public void setREQUEST_DLV_DT(String rEQUEST_DLV_DT) {
		REQUEST_DLV_DT = rEQUEST_DLV_DT;
	}

	public String getJOB_TYPE_IN() {
		return JOB_TYPE_IN;
	}

	public void setJOB_TYPE_IN(String jOB_TYPE_IN) {
		JOB_TYPE_IN = jOB_TYPE_IN;
	}

	public String getPRICE_SUM_IN() {
		return PRICE_SUM_IN;
	}

	public void setPRICE_SUM_IN(String pRICE_SUM_IN) {
		PRICE_SUM_IN = pRICE_SUM_IN;
	}

	public String getTRANS_FEE_IN() {
		return TRANS_FEE_IN;
	}

	public void setTRANS_FEE_IN(String tRANS_FEE_IN) {
		TRANS_FEE_IN = tRANS_FEE_IN;
	}

	public String getPRICE_TT_AFTER_NEGO_IN() {
		return PRICE_TT_AFTER_NEGO_IN;
	}

	public void setPRICE_TT_AFTER_NEGO_IN(String pRICE_TT_AFTER_NEGO_IN) {
		PRICE_TT_AFTER_NEGO_IN = pRICE_TT_AFTER_NEGO_IN;
	}

	public String getPAY_MILEAGE_POINT_IN() {
		return PAY_MILEAGE_POINT_IN;
	}

	public void setPAY_MILEAGE_POINT_IN(String pAY_MILEAGE_POINT_IN) {
		PAY_MILEAGE_POINT_IN = pAY_MILEAGE_POINT_IN;
	}

	public String getPRICE_TT_AFTER_NEGO() {
		return PRICE_TT_AFTER_NEGO;
	}

	public void setPRICE_TT_AFTER_NEGO(String pRICE_TT_AFTER_NEGO) {
		PRICE_TT_AFTER_NEGO = pRICE_TT_AFTER_NEGO;
	}

	public String getPAY_MILEAGE_POINT() {
		return PAY_MILEAGE_POINT;
	}

	public void setPAY_MILEAGE_POINT(String pAY_MILEAGE_POINT) {
		PAY_MILEAGE_POINT = pAY_MILEAGE_POINT;
	}

	public String getPRICE_TT_BEFORE_NEGO() {
		return PRICE_TT_BEFORE_NEGO;
	}

	public void setPRICE_TT_BEFORE_NEGO(String pRICE_TT_BEFORE_NEGO) {
		PRICE_TT_BEFORE_NEGO = pRICE_TT_BEFORE_NEGO;
	}

	public String getTRANS_FEE_ORG() {
		return TRANS_FEE_ORG;
	}

	public void setTRANS_FEE_ORG(String tRANS_FEE_ORG) {
		TRANS_FEE_ORG = tRANS_FEE_ORG;
	}

	public String getPRICE_SUM_ORG() {
		return PRICE_SUM_ORG;
	}

	public void setPRICE_SUM_ORG(String pRICE_SUM_ORG) {
		PRICE_SUM_ORG = pRICE_SUM_ORG;
	}

	public String getDEL_YN() {
		return DEL_YN;
	}

	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}

	public String getGOODS_GPA() {
		return GOODS_GPA;
	}

	public void setGOODS_GPA(String gOODS_GPA) {
		GOODS_GPA = gOODS_GPA;
	}

	public String getGOODS_LOGISTIC_GPA() {
		return GOODS_LOGISTIC_GPA;
	}

	public void setGOODS_LOGISTIC_GPA(String gOODS_LOGISTIC_GPA) {
		GOODS_LOGISTIC_GPA = gOODS_LOGISTIC_GPA;
	}

	public String getGOODS_SERVICE_GPA() {
		return GOODS_SERVICE_GPA;
	}

	public void setGOODS_SERVICE_GPA(String gOODS_SERVICE_GPA) {
		GOODS_SERVICE_GPA = gOODS_SERVICE_GPA;
	}

	public String getREVIEW_DESC() {
		return REVIEW_DESC;
	}

	public void setREVIEW_DESC(String rEVIEW_DESC) {
		REVIEW_DESC = rEVIEW_DESC;
	}

	public String getTOTAL_GPA() {
		return TOTAL_GPA;
	}

	public void setTOTAL_GPA(String tOTAL_GPA) {
		TOTAL_GPA = tOTAL_GPA;
	}

	public String getROW_CNT() {
		return ROW_CNT;
	}

	public void setROW_CNT(String rOW_CNT) {
		ROW_CNT = rOW_CNT;
	}
}
