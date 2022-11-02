/**   
 * @Title: AdminPaymentAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年9月2日 上午11:33:24 
 * @version V1.0   
 */
package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.util.Calendar;
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

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.wpt.admin.domain.AdminMyIncome;
import com.waremec.wpt.admin.service.MyIncomeService;

/**
 * @Package com.waremec.wpt.admin.action
 * @FileName AdminPaymentAction
 * @Description
 * @author taebem
 * @date 2015年9月2日 上午11:33:24
 * 
 */
@Controller("adminIncomeAction")
@Scope(ScopeType.prototype)
public class AdminIncomeAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private String SHOP_ID = "";
	private String USER_ID = "";

	private String opType = "";
	private Integer shopId;
	private Integer payTypeId;
	private String isUse = "";
	private String payName;
	private String payPreDate;
	private String payPreInfo;
	private String payRreDesc;
	private String logoFileName;
	private String jobType;
	private File logo_input = null;

	private int pageCount;
	
	//存储要导出的表单内容
	private String excelBody="";
	//存储查询开始时间
	private String createdDateFrom="";
	//存储查询结束时间
	private String createdDateTo="";
	//存储有无退款
	private String isRefund="";
	//存储当前排序方式
	private String orderBy="";
	//存储订单ID
	private String orderId="";
	//存储用户的ID号
	private String userId="";
	

	@Resource
	private MyIncomeService myIncomeService;

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 我的收入一页面加载
	 */
	public String incomeList() {

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();
		AdminMyIncome myIncome = null;

		AdminMyIncome myIncomeIn = new AdminMyIncome();
		myIncomeIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		myIncomeIn.setUSER_ID_IN(USER_ID);
		if (!(isUse.equals("") || isUse == "")) {
			myIncomeIn.setIS_USE(isUse);
		} else {
			myIncomeIn.setIS_USE(null);
		}
		if (payTypeId != null) {
			myIncomeIn.setPAY_TYPE_ID(payTypeId + "");
		} else {
			myIncomeIn.setPAY_TYPE_ID(null);
		}
		myIncomeIn.setPageCurr(pageCurr);
		myIncomeIn.setPageUnit(pageUnit);
		List<AdminMyIncome> myIncomeList = (List<AdminMyIncome>) myIncomeService.selectList("AdminMyIncome.searchList", myIncomeIn);
		if (myIncomeList.size() > 0) {
			myIncome = myIncomeList.get(0);
		}
		PageData page = new PageData();
		if (!myIncomeList.isEmpty()) {
			int totalCount = (Integer) myIncomeList.get(0).getTOTAL_COUNT();
			page = new PageData(pageCurr, pageUnit, totalCount, myIncomeList);

		}
		request.put("page", page);
		request.put("myIncome", myIncome);

		Map<String, Object> map = new HashMap<String, Object>();
		// 获取支付方式下拉框list
		List<Map<String, Object>> payTypeList = myIncomeService.selectList("IncomeDetail.selectPayType", map);
		request.put("payTypeList", payTypeList);
		return "incomeList";
	}

	public String incomeListFragment() {
		// 查询出模板列表

		SHOP_ID = getBackSessionShopId().toString();
		USER_ID = getBackSessionUserId();

		AdminMyIncome myIncomeIn = new AdminMyIncome();
		myIncomeIn.setSHOP_ID_IN(Integer.parseInt(SHOP_ID));
		myIncomeIn.setUSER_ID_IN(USER_ID);
		if (!(isUse.equals("") || isUse == "")) {
			myIncomeIn.setIS_USE(isUse);
		} else {
			myIncomeIn.setIS_USE(null);
		}
		if (payTypeId != null) {
			myIncomeIn.setPAY_TYPE_ID(payTypeId + "");
		} else {
			myIncomeIn.setPAY_TYPE_ID(null);
		}
		myIncomeIn.setPageCurr(pageCurr);
		myIncomeIn.setPageUnit(pageUnit);
		List<AdminMyIncome> myIncomeList = (List<AdminMyIncome>) myIncomeService.selectList("AdminMyIncome.searchList", myIncomeIn);

		PageData page = new PageData();
		if (!myIncomeList.isEmpty()) {
			int totalCount = (Integer) myIncomeList.get(0).getTOTAL_COUNT();
			page = new PageData(pageCurr, pageUnit, totalCount, myIncomeList);
		}
		request.put("page", page);

		return "incomeListFragment";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 我的收入-支付方式修改
	 */
	public String modifyIncome() {

		USER_ID = getBackSessionUserId();
		String result = "SUCCESS";

		try {
			AdminMyIncome myIncomeIn = new AdminMyIncome();
			myIncomeIn.setSHOP_ID_IN(shopId);
			myIncomeIn.setPAY_TYPE_ID_IN(payTypeId);
			myIncomeIn.setOP_TYPE_IN(opType);
			myIncomeIn.setUSER_ID_IN(USER_ID);

			myIncomeService.selectList("AdminMyIncome.modify", myIncomeIn);

		} catch (Exception e) {
			result = "FAIL";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);

		renderJSON(returnMap);

		return NONE;
	}

	public String deleteIncome() {
		String result = "SUCCESS";
		Map<String, Object> map = new HashMap<>();
		map.put("SHOP_ID", shopId);
		map.put("PAY_TYPE_ID", payTypeId);
		try {
			myIncomeService.update("AdminMyIncome.deletePayment", map);
		} catch (Exception e) {
			result = "FAIL";
			e.printStackTrace();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", result);

		renderJSON(returnMap);
		return NONE;
	}

	public String addIncome() {
		Map<String, Object> map = new HashMap<>();
		if (logo_input != null) {
			UploadResult result = UploadFileUtil.upload(getRequest(), logo_input, logoFileName, UploadFileUtil.UPLOAD_GOODS);
			map.put("LOGO_URL", result.getFileUrl());
		}
		map.put("JOB_TYPE", jobType);
		map.put("PAY_NAME", payName);
		map.put("IS_DIRECT", 1);
		map.put("IS_ONLINE", 1);
		map.put("PAY_IF_INFO", payName);
		map.put("SORT_NO", 1);
		map.put("PAY_PRE_DESC", payRreDesc);
		map.put("PAY_PRE_DT", payPreDate);
		map.put("PAY_PRE_INFO", payPreInfo);
		map.put("SHOP_ID", getBackSessionShopId());
		map.put("IS_AVAILABLE", 1);
		map.put("PAY_TYPE_ID", payTypeId);
		if (isUse.equals("") || isUse == "") {
			isUse = "1";
		}
		map.put("IS_USE", isUse);
		try {
			map = myIncomeService.select("AdminMyIncome.paymentInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// Map<String, Object> returnMap = new HashMap<String, Object>();
		// returnMap.put("result", map.get("OUT_ERR_MSG").toString());
		JSONObject jo = new JSONObject();
		jo.put("result", map.get("OUT_ERR_MSG").toString());
		renderHtml(jo.toJSONString());
		// renderJSON(returnMap);
		return NONE;
	}

	public String incomeDetail() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("PAY_TYPE_ID", payTypeId);
		map.put("IS_USE", null);
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map = commonService.select("AdminMyIncome.paymentDetail", map);
		renderJSON(map);
		return NONE;
	}
	
	
	
	
	public String detailList(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		orderBy=null;
		map.put("shopId", shopId);
		map.put("createdDateFrom", StringUtil.emptyToNull(createdDateFrom));
		map.put("createdDateTo", StringUtil.emptyToNull(createdDateTo));
		map.put("isRefund", StringUtil.emptyToNull(isRefund));
		map.put("payTypeId", payTypeId);
		map.put("pageCurr",pageCurr );
		map.put("pageUnit", pageUnit);
		map.put("orderBy", orderBy);
		request.put("createdDateFrom", createdDateFrom);
		request.put("createdDateTo", createdDateTo);
		request.put("isRefund", isRefund);
		request.put("payTypeId",payTypeId);
		List<Map<String,Object>> list=commonService.selectList("IncomeDetail.selectOrderList", map);
		request.put("list",list);
		List<Map<String,Object>> listPayType=commonService.selectList("IncomeDetail.selectPayType", map);
		request.put("listPayType", listPayType);
		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_COUNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		 
		}
		request.put("page", page);
		return "detailList";
	}
	
	public String detailListFragment() throws Exception{
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		orderBy=null;
		map.put("shopId", shopId);
		map.put("createdDateFrom", StringUtil.emptyToNull(createdDateFrom));
		map.put("createdDateTo", StringUtil.emptyToNull(createdDateTo));
		map.put("isRefund", StringUtil.emptyToNull(isRefund));
		map.put("payTypeId", payTypeId);
		map.put("pageCurr",pageCurr );
		map.put("pageUnit", pageUnit);
		map.put("orderBy", orderBy);
		request.put("createdDateFrom", createdDateFrom);
		request.put("createdDateTo", createdDateTo);
		request.put("isRefund", isRefund);
		request.put("payTypeId",payTypeId);
		List<Map<String,Object>> list=commonService.selectList("IncomeDetail.selectOrderList", map);
		request.put("list",list);
		List<Map<String,Object>> listPayType=commonService.selectList("IncomeDetail.selectPayType", map);
		request.put("listPayType", listPayType);
		PageData page = new PageData();
		if(!list.isEmpty()){
			int totalCount = (Integer)list.get(0).get("TOTAL_COUNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		 
		}
		request.put("page", page);
		return "detailListFragment";
	}
	
	
	//保存导出的EXCEL文件
		public String createExcel(){
			userId=getBackSessionUserId();
			shopId = getBackSessionShopId();
			String ret="success";
			Map<String,Object> map=new HashMap<String,Object>();
			orderBy=null;
			if(createdDateFrom==""|| createdDateFrom==null){
				 Calendar ca = Calendar.getInstance();
			     int year = ca.get(Calendar.YEAR);//获取年份
			     int month=ca.get(Calendar.MONTH);//获取月份
			     createdDateFrom=year+"-"+(month+1)+"-0";
			}
			map.put("shopId", shopId);
			map.put("createdDateFrom", createdDateFrom);
			map.put("createdDateTo", StringUtil.emptyToNull(createdDateTo));
			map.put("isRefund", StringUtil.emptyToNull(isRefund));
			map.put("payTypeId", payTypeId);
			map.put("pageCurr",1 );
			map.put("pageUnit", 10000);
			map.put("orderBy", orderBy);
			List<Map<String,Object>> list=commonService.selectList("IncomeDetail.selectOrderList", map);
			String statusNm = StringUtils.trimToNull(getLabel("收支明细"));
			try{
				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os= new BufferedOutputStream(response.getOutputStream());  
	            response.reset();// 清空输出流   
	            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
	            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode(statusNm, "UTF-8")+".xls");// 设定输出文件头
				//创建工作薄
		        WritableWorkbook workbook = Workbook.createWorkbook(os);
		        //创建新的一页
		        WritableSheet sheet = workbook.createSheet("First Sheet",0);
		        
		        sheet.mergeCells(0, 0, 7, 0);//添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
		        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
		        WritableCellFormat titleFormate = new WritableCellFormat(bold);//生成一个单元格样式控制对象
		        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
		        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向居中
		        Label[] label=new Label[8];
		        int length=list.size();
		  
	        	Label title = new Label(0,0,statusNm,titleFormate);
		        sheet.setRowView(0, 400, false);//设置第一行的高度
		        sheet.addCell(title);
		        //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
		       /* excelBody=new String(excelBody.getBytes("ISO-8859-1"),"UTF-8");
		        String [] row=excelBody.split(";");
		        for(int i=0;i<row.length;i++){
		      	  String [] cell=row[i].split(",");
		      	  Label [] label=new Label[cell.length];
		      	  for(int j=0;j<cell.length;j++){
		      		  System.out.println(cell[j]);
		      		  label[j]=new Label(j,i+1,cell[j]);
		      		  sheet.addCell(label[j]);
		      	  }
		        }*/
		        label[0]=new Label(0,1,getLabel("时间"));
		        sheet.addCell(label[0]);
		        label[1]=new Label(1,1,getLabel("类型"));
		        sheet.addCell(label[1]);
		        label[2]=new Label(2,1,getLabel("收入流水号"));
		        sheet.addCell(label[2]);
		        label[3]=new Label(3,1,getLabel("收入")+"（"+getLabel("元")+"）");
		        sheet.addCell(label[3]);
		        label[4]=new Label(4,1,getLabel("退款金额")+"（"+getLabel("元")+"）");
		        sheet.addCell(label[4]);
		        label[5]=new Label(5,1,getLabel("余额")+"（"+getLabel("元")+"）");
		        sheet.addCell(label[5]);
		        label[6]=new Label(6,1,getLabel("支付渠道"));
		        sheet.addCell(label[6]);
		        label[7]=new Label(7,1,getLabel("单号"));
		        sheet.addCell(label[7]);

		        
		        for(int i=0;i<length;i++){
		        	label=new Label[8];
		 	        label[0]=new Label(0,i+2,(String) list.get(i).get("CREATED_DT"));
		 	        sheet.addCell(label[0]);
		 	        label[1]=new Label(1,i+2,(String) list.get(i).get("ORDER_AMT_NM"));
		 	        sheet.addCell(label[1]);
		 	        label[2]=new Label(2,i+2,(String) list.get(i).get("PAY_PG_KEY"));
		 	        sheet.addCell(label[2]);
		 	        label[3]=new Label(3,i+2,formatNumber(list.get(i).get("PAY_AMT").toString()));
		 	        sheet.addCell(label[3]);
		 	        label[4]=new Label(4,i+2,formatNumber(list.get(i).get("RE_PAY_AMT").toString()));
		 	        sheet.addCell(label[4]);
		 	        label[5]=new Label(5,i+2,formatNumber(list.get(i).get("PRICE_TT_AFTER_NEGO").toString()));
		 	        sheet.addCell(label[5]);
		 	        label[6]=new Label(6,i+2,(String) list.get(i).get("PAY_NAME"));
		 	        sheet.addCell(label[6]);
		 	        label[7]=new Label(7,i+2,(String) list.get(i).get("ORDER_OUT_ID"));
		 	        sheet.addCell(label[7]);
		        }
		        //把创建的内容写入到输出流中，并关闭输出流
		        workbook.write();
		        workbook.close();
		        os.close();
			}catch(Exception e){
				e.printStackTrace();
				ret="fail";
			}  
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("result", ret);
			renderJSON(returnMap);
		    return NONE;
		}
	
		public String formatNumber(String str){
			return str.substring(0,str.indexOf(".")+3);
		}

	public String getSHOP_ID() {
		return SHOP_ID;
	}

	public void setSHOP_ID(String sHOP_ID) {
		SHOP_ID = sHOP_ID;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getOpType() {
		return opType;
	}

	public void setOpType(String opType) {
		this.opType = opType;
	}
	 

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(Integer payTypeId) {
		this.payTypeId = payTypeId;
	}

	public String getExcelBody() {
		return excelBody;
	}

	public void setExcelBody(String excelBody) {
		this.excelBody = excelBody;
	}

	public String getCreatedDateFrom() {
		return createdDateFrom;
	}

	public void setCreatedDateFrom(String createdDateFrom) {
		this.createdDateFrom = createdDateFrom;
	}

	public String getCreatedDateTo() {
		return createdDateTo;
	}

	public void setCreatedDateTo(String createdDateTo) {
		this.createdDateTo = createdDateTo;
	}

	public String getIsRefund() {
		return isRefund;
	}

	public void setIsRefund(String isRefund) {
		this.isRefund = isRefund;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIsUse() {
		return isUse;
	}

	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}

	public MyIncomeService getMyIncomeService() {
		return myIncomeService;
	}

	public void setMyIncomeService(MyIncomeService myIncomeService) {
		this.myIncomeService = myIncomeService;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public String getPayName() {
		return payName;
	}

	public void setPayName(String payName) {
		this.payName = payName;
	}

	public String getPayRreDesc() {
		return payRreDesc;
	}

	public void setPayRreDesc(String payRreDesc) {
		this.payRreDesc = payRreDesc;
	}

	public String getPayPreDate() {
		return payPreDate;
	}

	public void setPayPreDate(String payPreDate) {
		this.payPreDate = payPreDate;
	}

	public String getPayPreInfo() {
		return payPreInfo;
	}

	public void setPayPreInfo(String payPreInfo) {
		this.payPreInfo = payPreInfo;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public File getLogo_input() {
		return logo_input;
	}

	public void setLogo_input(File logo_input) {
		this.logo_input = logo_input;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

}
