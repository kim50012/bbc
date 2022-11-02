package com.waremec.wpt.hzm.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.Hzm_StopPageType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.RandomUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.common.domain.PageDtl;
import com.waremec.wpt.admin.common.domain.PageHeader;
import com.waremec.wpt.admin.common.domain.PageItem;
import com.waremec.wpt.admin.domain.AdminShop;
import com.waremec.wpt.admin.domain.TmplType;
import com.waremec.wpt.admin.domain.dispaly.ImageItem;
import com.waremec.wpt.admin.service.ShopService;

/** 
* @Package com.waremec.wpt.admin.action 
* @FileName AdminReportSummaryAction
* @Description  
* @author taebem 
* @date 2015年7月17日 下午2:43:53 
*  
*/
@Controller("hzmReportSummaryAction")
@Scope(ScopeType.prototype)
public class Hzm_ReportSummaryAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	// 存储用户的Id
	private String startDate="";
	private String endDate="";

	// 存储要导出的表单内容
	private String excelBody = "";
	// 存储查询开始时间
	private String createdDateFrom = "";
	// 存储查询结束时间
	private String createdDateTo = "";
	// 存储年的字段
	private String yearDate = "";
	// 存储月的字段
	private String monthDate = "";
	// 存储当前排序方式
	private String msgId = "";
	private String orderBy = "";
	private String descFlag = "";
	private String title = "";
	private String newsId = "";
	private String titleOne = "";
	private String custNum = "";
	private String dateOne = "";
	private String mobile = "";
	private String sendStatus="";
	private String nickName = "";
	private String redParkStatus="";
	
	@Resource
	private ShopService shopService;
	
	/********************************数据概况*************************************/
	public String createpacketExcel(){

		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		String ret="success";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("redParkStatus", StringUtil.emptyToNull(redParkStatus));
		map.put("nickName", StringUtil.emptyToNull(nickName));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", 10000);
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.WX_RED_PACK_SEND_HIST_SELECT",map);
		String statusNm = StringUtils.trimToNull(getLabel("红包查询"));
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os= new BufferedOutputStream(response.getOutputStream());  
            response.reset();// 清空输出流   
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode(statusNm.replaceAll("\\s*", ""), "UTF-8")+".xls");// 设定输出文件头
			//创建工作薄
	        WritableWorkbook workbook = Workbook.createWorkbook(os);
	        //创建新的一页
	        WritableSheet sheet = workbook.createSheet("First Sheet",0);
	        
	        sheet.mergeCells(0, 0, 7, 0);//添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
	        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
	        WritableCellFormat titleFormate = new WritableCellFormat(bold);//生成一个单元格样式控制对象
	        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
	        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向居中
	        
	        Label title = new Label(0,0,statusNm,titleFormate);
       	 	sheet.setRowView(0, 400, false);//设置第一行的高度
	         sheet.addCell(title);

	        int length=list.size();
	        Label[] label=new Label[8];
	       
        	label[0]=new Label(0,1,getLabel("客户昵称"));
 	        sheet.addCell(label[0]); 
 	        label[1]=new Label(1,1,getLabel("商户订单号"));
 	        sheet.addCell(label[1]); 
 	        label[2]=new Label(2,1,getLabel("商户名称"));
 	        sheet.addCell(label[2]);
 	        label[3]=new Label(3,1,getLabel("付款金额"));
 	        sheet.addCell(label[3]);
 	        label[4]=new Label(4,1,getLabel("发送状态"));
	        sheet.addCell(label[4]); 
	        label[5]=new Label(5,1,getLabel("错误信息"));
	        sheet.addCell(label[5]); 
	        label[6]=new Label(6,1,getLabel("IP地址"));
	        sheet.addCell(label[6]);
	        label[7]=new Label(7,1,getLabel("创建时间"));
	        sheet.addCell(label[7]);
	        /*label[7]=new Label(7,1,getLabel("活动名称"));
	        sheet.addCell(label[7]);
	        label[8]=new Label(8,1,getLabel("备注"));
	        sheet.addCell(label[8]);
	        label[9]=new Label(9,1,getLabel("创建时间"));
	        sheet.addCell(label[9]);*/
	        for(int i=0;i<length;i++){
	        	label=new Label[8];
	 	        label[0]=new Label(0,i+2,(String) list.get(i).get("CUST_NICK"));
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1,i+2,(String) list.get(i).get("MCH_BILLNO"));
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2,i+2,(String)list.get(i).get("SEND_NAME"));
	 	        sheet.addCell(label[2]);
	 	        label[3]=new Label(3,i+2,list.get(i).get("TOTAL_AMOUNT").toString());
	 	        sheet.addCell(label[3]);
	 	        label[4]=new Label(4,i+2,(String) list.get(i).get("RED_PARK_STATUS_NM"));
	 	        sheet.addCell(label[4]);
	 	        label[5]=new Label(5,i+2,(String) list.get(i).get("ERR_CODE"));
	 	        sheet.addCell(label[5]);
	 	        label[6]=new Label(6,i+2,(String) list.get(i).get("CLIENT_IP"));
	 	        sheet.addCell(label[6]);
	 	        /*label[7]=new Label(7,i+2,(String) list.get(i).get("ACT_NAME"));
	 	        sheet.addCell(label[7]);
	 	       label[8]=new Label(8,i+2,(String) list.get(i).get("REMARK"));
	 	        sheet.addCell(label[8]);*/
	 	       Timestamp timestamp =  (Timestamp) list.get(i).get("CREATE_DT");
	 	       Date date = new Date(timestamp.getTime());
	 	       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	 	       label[7]=new Label(7,i+2,sdf.format(date));
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
	public String packetQuery(){
		Integer shopId = getBackSessionShopId();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("redParkStatus", StringUtil.emptyToNull(redParkStatus));
		map.put("nickName", StringUtil.emptyToNull(nickName));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.WX_RED_PACK_SEND_HIST_SELECT",map);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		request.put("redParkStatus", redParkStatus);
		request.put("nickName", nickName);
		return "packetQuery";
	}
	
	public String packetQueryListFragment(){
		Integer shopId = getBackSessionShopId();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("redParkStatus", StringUtil.emptyToNull(redParkStatus));
		map.put("nickName", StringUtil.emptyToNull(nickName));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.WX_RED_PACK_SEND_HIST_SELECT",map);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		request.put("redParkStatus", redParkStatus);
		request.put("nickName", nickName);
		return "packetQueryListFragment";
	}
	public String noteQuery(){
		Integer shopId = getBackSessionShopId();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("sendStatus", StringUtil.emptyToNull(sendStatus));
		map.put("mobile", StringUtil.emptyToNull(mobile));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.SMS_SEND_HIST_SELECT",map);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		request.put("sendStatus", sendStatus);
		request.put("mobile", mobile);
		return "noteQuery";
	}
	public String noteQueryListFragment(){
		Integer shopId = getBackSessionShopId();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("sendStatus", StringUtil.emptyToNull(sendStatus));
		map.put("mobile", StringUtil.emptyToNull(mobile));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.SMS_SEND_HIST_SELECT",map);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		request.put("sendStatus", sendStatus);
		request.put("mobile", mobile);
		return "noteQueryListFragment";
	}
	
	
	public String createNoteExcel(){

		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		String ret="success";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("sendStatus", StringUtil.emptyToNull(sendStatus));
		map.put("mobile", StringUtil.emptyToNull(mobile));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", 10000);
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.SMS_SEND_HIST_SELECT",map);
		String statusNm = StringUtils.trimToNull(getLabel("短信查询"));
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os= new BufferedOutputStream(response.getOutputStream());  
            response.reset();// 清空输出流   
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode(statusNm.replaceAll("\\s*", ""), "UTF-8")+".xls");// 设定输出文件头
			//创建工作薄
	        WritableWorkbook workbook = Workbook.createWorkbook(os);
	        //创建新的一页
	        WritableSheet sheet = workbook.createSheet("First Sheet",0);
	        
	        sheet.mergeCells(0, 0, 7, 0);//添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
	        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
	        WritableCellFormat titleFormate = new WritableCellFormat(bold);//生成一个单元格样式控制对象
	        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
	        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向居中
	        
	        Label title = new Label(0,0,statusNm,titleFormate);
       	 	sheet.setRowView(0, 400, false);//设置第一行的高度
	         sheet.addCell(title);

	        int length=list.size();
	        Label[] label=new Label[8];
	       
        	label[0]=new Label(0,1,getLabel("手机号码"));
 	        sheet.addCell(label[0]); 
 	        label[1]=new Label(1,1,getLabel("发送内容"));
 	        sheet.addCell(label[1]); 
 	        label[2]=new Label(2,1,getLabel("发送状态"));
 	        sheet.addCell(label[2]);
 	        label[3]=new Label(3,1,getLabel("发送编号"));
 	        sheet.addCell(label[3]);
 	        label[4]=new Label(4,1,getLabel("异常信息"));
	        sheet.addCell(label[4]); 
	        label[5]=new Label(5,1,getLabel("发送时间"));
	        sheet.addCell(label[5]); 
	        label[6]=new Label(6,1,getLabel("发送ID"));
	        sheet.addCell(label[6]);
	        label[7]=new Label(7,1,getLabel("创建时间"));
	        sheet.addCell(label[7]);
	        for(int i=0;i<length;i++){
	        	label=new Label[8];
	 	        label[0]=new Label(0,i+2,(String) list.get(i).get("MOBILE"));
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1,i+2,(String) list.get(i).get("CONTENT"));
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2,i+2,(String)list.get(i).get("SEND_STATUS"));
	 	        sheet.addCell(label[2]);
	 	        Long msgId =  (Long) list.get(i).get("MSG_ID");
	 	        String str="";
	 	        if(msgId == null){
	 	        	str ="";
	 	        }else{
	 	        	str = ""+msgId;
	 	        }
	 	        label[3]=new Label(3,i+2,str);
	 	        sheet.addCell(label[3]);
	 	        label[4]=new Label(4,i+2,(String) list.get(i).get("ERR_MSG"));
	 	        sheet.addCell(label[4]);
	 	        label[5]=new Label(5,i+2,(String) list.get(i).get("SEND_DT"));
	 	        sheet.addCell(label[5]);
	 	        label[6]=new Label(6,i+2,list.get(i).get("SEND_ID").toString());
	 	        sheet.addCell(label[6]);
	 	        label[7]=new Label(7,i+2,(String) list.get(i).get("CREATE_DT"));
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
	/**
	 * 跳转到数据现况页面
	 */
	public String hzm_DataSummary() {
		Integer shopId = getBackSessionShopId();
		//拿到所使用的的页面id
		String pageId = shopService.queryShopSetting(String.valueOf(shopId), Hzm_StopPageType.HZM_HOME);
		request.put("pageId", pageId);
		//查询店铺信息
		AdminShop shopInfo = this.getShopInfo(shopId);
		request.put("shopInfo", shopInfo);
		
		//查询店铺店铺页面信息
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("SHOP_ID", shopId.toString());
		Map<String, Object> codeMap = commonService.select("ShopMainPage.selectShopPage", queryMap);
		request.put("codeMap", codeMap);

		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isBlank(startDate)) {
			try {
				startDate = DateUtil.getAddDay(DateUtil.DEFAULT_DATE, -6).substring(0, 10);
			} catch (ParseException e) {
			}
			endDate = DateUtil.today();
		}
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		Map<String, Object> summary = commonService.select("OrderBaseCount.selectDataCurrent", map);

		request.put("summary", summary);

		return "hzm_DataSummary";
	}

	//查询店铺信息并存入session
	private AdminShop getShopInfo(int shopId){
		AdminShop shopInfo = getBackSessionShopInfo();
		if(shopInfo == null){
			AdminShop shopInfo1 = new AdminShop();
			shopInfo1.setShopId(shopId + "");
			shopInfo = shopService.selectAdminShop("Shop.selectAdminShop", shopInfo1);
			
			//查询该店铺微信公众号信息
			Map<String,Object> WXmap=new HashMap<String,Object>();
			WXmap.put("shopId",shopId);
			WXmap.put("originalAppId", null);
			WXmap.put("sysId", null);
			Map<String,Object> WeChatInfo=commonService.select("AdminGroup.weiXinAppInfoSelect", WXmap);
			
			shopInfo.setWxType(String.valueOf(WeChatInfo.get("accountType")));
			//把店铺信息放入session
			session.put(SessionUtils.BACK_SHOPINFO_SESSION, shopInfo);
		}
		
		return shopInfo;
	}
	/********************************图文群发现况*************************************/
	
	/** 
	 * 跳转到图文信息概况页面
	 * @return
	 */
	public String newsfeedSummary() {
//		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			if (yearDate == "" && monthDate == "") {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				// 获取当前月第一天：
				Calendar c = Calendar.getInstance();
				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
				String first = format.format(c.getTime());
				// 获取当前月最后一天
				Calendar ca = Calendar.getInstance();
				ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				String last = format.format(ca.getTime());
				yearDate = ca.get(Calendar.YEAR) + "";// 获取年份
				monthDate = (ca.get(Calendar.MONTH) + 1) + "";// 获取月份
				createdDateFrom = first;
				createdDateTo = last + " 23:59:59";
			} else {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String str = yearDate + "-" + monthDate + "-01";
				// 获取当前月第一天：
				Calendar c = Calendar.getInstance();
				c.setTime(format.parse(str));
				c.add(Calendar.MONTH, 0);
				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
				String first = format.format(c.getTime());
				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
				String last = format.format(c.getTime());
				createdDateFrom = first;
				createdDateTo = last + " 23:59:59";
			}
			map.put("shopId", shopId);
			map.put("beginDate", createdDateFrom);
			map.put("endDate", createdDateTo);
			Map<String, Object> summary = commonService.select("ImgTextSituation.WX_IF_MESSAGE_STATS_DATA_SUMMARY", map);
			request.put("yearDate", yearDate);
			request.put("monthDate", monthDate);
			request.put("summary", summary);
			if (orderBy == "") {
				orderBy = "1";
			}
			if (descFlag == "") {
				descFlag = "1";
			}
			map.put("descFlag", StringUtil.emptyToNull(descFlag));
			map.put("orderBy", StringUtil.emptyToNull(orderBy));
			map.put("title", StringUtil.emptyToNull(title));
			request.put("title", title);
			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.WX_IF_MESSAGE_STATS_DATA_SELECT_LIST", map);
			request.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "newsfeedSummary";
	}
	/** 
	* 跳转到图文信息概况页面
	* @return
	*/
//	public String newsfeedSummary() {
//		String userId = getBackSessionUserId();
//		Integer shopId = getBackSessionShopId();
//		try {
//			Map<String, Object> map = new HashMap<String, Object>();
//			if (yearDate == "" && monthDate == "") {
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				// 获取当前月第一天：
//				Calendar c = Calendar.getInstance();
//				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//				String first = format.format(c.getTime());
//				// 获取当前月最后一天
//				Calendar ca = Calendar.getInstance();
//				ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
//				String last = format.format(ca.getTime());
//				yearDate = ca.get(Calendar.YEAR) + "";// 获取年份
//				monthDate = (ca.get(Calendar.MONTH) + 1) + "";// 获取月份
//				createdDateFrom = first;
//				createdDateTo = last + " 23:59:59";
//			} else {
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				String str = yearDate + "-" + monthDate + "-01";
//				// 获取当前月第一天：
//				Calendar c = Calendar.getInstance();
//				c.setTime(format.parse(str));
//				c.add(Calendar.MONTH, 0);
//				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//				String first = format.format(c.getTime());
//				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
//				String last = format.format(c.getTime());
//				createdDateFrom = first;
//				createdDateTo = last + " 23:59:59";
//			}
//			map.put("shopId", shopId);
//			map.put("beginDate", createdDateFrom);
//			map.put("endDate", createdDateTo);
//			Map<String, Object> summary = commonService.select("ImgTextSituation.selectAllNum", map);
//			request.put("yearDate", yearDate);
//			request.put("monthDate", monthDate);
//			request.put("summary", summary);
//			if (orderBy == "") {
//				orderBy = "1";
//			}
//			if (descFlag == "") {
//				descFlag = "1";
//			}
//			map.put("newsId", StringUtil.emptyToNull(newsId));
//			map.put("descFlag", StringUtil.emptyToNull(descFlag));
//			map.put("orderBy", StringUtil.emptyToNull(orderBy));
//			map.put("userId", StringUtil.emptyToNull(userId));
//			map.put("title", StringUtil.emptyToNull(title));
//			request.put("title", title);
//			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.selectImgTextList", map);
//			request.put("list", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "newsfeedSummary";
//	}
	
	
	/** 
	* 图文信息概况下载
	* @return
	*/
	public String newsfeedSummaryDownload(){
		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		String ret = "success";
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			// **********获取要导出的EXCEL中的数据 START*************//
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String str = yearDate + "-" + monthDate + "-01";
			// 获取当前月第一天：
			Calendar c = Calendar.getInstance();
			c.setTime(format.parse(str));
			c.add(Calendar.MONTH, 0);
			c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
			String first = format.format(c.getTime());
			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
			String last = format.format(c.getTime());
			createdDateFrom = first;
			createdDateTo = last + " 23:59:59";
			map.put("shopId", shopId);
			map.put("beginDate", createdDateFrom);
			map.put("endDate", StringUtil.emptyToNull(createdDateTo));
			map.put("newsId", StringUtil.emptyToNull(newsId));
			map.put("descFlag", StringUtil.emptyToNull(descFlag));
			map.put("orderBy", StringUtil.emptyToNull(orderBy));
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("title", StringUtil.emptyToNull(title));
			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.WX_IF_MESSAGE_STATS_DATA_SELECT_LIST", map);
			// **********获取要导出的EXCEL中的数据 END*************//
			
			// **********创建EXCEL文件，写入数据 START*************//
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();// 清空输出流
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(getLabel("群发现况汇总表").replaceAll("\\s*", ""), "UTF-8") + ".xls");// 设定输出文件头
			/*
			 * 群发现况汇总表 Summary table 群发详细信息表 Detail table
			 */
			
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// 创建新的一页
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
			
			sheet.mergeCells(0, 0, 6, 0);// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10);// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableCellFormat titleFormate = new WritableCellFormat(bold);// 生成一个单元格样式控制对象
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// 单元格中的内容水平方向居中
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 单元格的内容垂直方向居中
			titleFormate.setWrap(true);
			Label title = new Label(0, 0, getLabel("群发现况汇总表"), titleFormate);
			sheet.setRowView(0, 400, false);// 设置第一行的高度
			sheet.addCell(title);
			Label[] label1 = new Label[7];
			label1[0] = new Label(0, 1, getLabel("日期"), titleFormate);
			label1[1] = new Label(1, 1, getLabel("标题"), titleFormate);
			label1[2] = new Label(2, 1, getLabel("送达人数"), titleFormate);
			label1[3] = new Label(5, 1, getLabel("分享转发人数"), titleFormate);
			label1[4] = new Label(3, 1, getLabel("图文页阅读人数"), titleFormate);
			label1[5] = new Label(4, 1, getLabel("原文页阅读人数"), titleFormate);
			label1[6] = new Label(6, 1, getLabel("微信收藏人数"), titleFormate);
			sheet.addCell(label1[0]);
			sheet.addCell(label1[1]);
			sheet.addCell(label1[2]);
			sheet.addCell(label1[3]);
			sheet.addCell(label1[4]);
			sheet.addCell(label1[5]);
			sheet.addCell(label1[6]);
			
			if (list.isEmpty() || list.size() == 0) {
				
			} else {
				int length = list.size();
				Label[] label = new Label[7];
				for (int i = 0; i < length; i++) {
					label = new Label[7];
					label[0] = new Label(0, i + 2, (String) list.get(i).get("REF_DATE"));
					sheet.addCell(label[0]);
					label[1] = new Label(1, i + 2, (String) list.get(i).get("TITLE"));
					sheet.addCell(label[1]);
					label[2] = new Label(2, i + 2, (list.get(i).get("SEND_TARGET_CNT") + ""));
					sheet.addCell(label[2]);
					label[3] = new Label(3, i + 2, (list.get(i).get("INT_PAGE_READ_USER") + ""));
					sheet.addCell(label[3]);
					label[4] = new Label(4, i + 2, (list.get(i).get("ORI_PAGE_READ_USER") + ""));
					sheet.addCell(label[4]);
					label[5] = new Label(5, i + 2, (list.get(i).get("SHARE_USER") + ""));
					sheet.addCell(label[5]);
					label[6] = new Label(6, i + 2, (list.get(i).get("ADD_TO_FAV_USER") + ""));
					sheet.addCell(label[6]);
				}
			}
			// 把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();
			// **********创建EXCEL文件，写入数据 START*************//
		} catch (Exception e) {
			ret = "fail";
			e.printStackTrace();
			
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
//	public String newsfeedSummaryDownload(){
//		String userId = getBackSessionUserId();
//		Integer shopId = getBackSessionShopId();
//		String ret = "success";
//		Map<String, Object> map = new HashMap<String, Object>();
//		try {
//
//			// **********获取要导出的EXCEL中的数据 START*************//
//			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//			String str = yearDate + "-" + monthDate + "-01";
//			// 获取当前月第一天：
//			Calendar c = Calendar.getInstance();
//			c.setTime(format.parse(str));
//			c.add(Calendar.MONTH, 0);
//			c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//			String first = format.format(c.getTime());
//			c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
//			String last = format.format(c.getTime());
//			createdDateFrom = first;
//			createdDateTo = last + " 23:59:59";
//			map.put("shopId", shopId);
//			map.put("beginDate", createdDateFrom);
//			map.put("endDate", StringUtil.emptyToNull(createdDateTo));
//			map.put("newsId", StringUtil.emptyToNull(newsId));
//			map.put("descFlag", StringUtil.emptyToNull(descFlag));
//			map.put("orderBy", StringUtil.emptyToNull(orderBy));
//			map.put("userId", StringUtil.emptyToNull(userId));
//			map.put("title", StringUtil.emptyToNull(title));
//			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.selectImgTextList", map);
//			// **********获取要导出的EXCEL中的数据 END*************//
//
//			// **********创建EXCEL文件，写入数据 START*************//
//			HttpServletResponse response = ServletActionContext.getResponse();
//			OutputStream os = new BufferedOutputStream(response.getOutputStream());
//			response.reset();// 清空输出流
//			response.setContentType("application/vnd.ms-excel;charset=utf-8");
//			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(getLabel("群发现况汇总表").replaceAll("\\s*", ""), "UTF-8") + ".xls");// 设定输出文件头
//			/*
//			 * 群发现况汇总表 Summary table 群发详细信息表 Detail table
//			 */
//
//			// 创建工作薄
//			WritableWorkbook workbook = Workbook.createWorkbook(os);
//			// 创建新的一页
//			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
//
//			sheet.mergeCells(0, 0, 6, 0);// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
//			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10);// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
//			WritableCellFormat titleFormate = new WritableCellFormat(bold);// 生成一个单元格样式控制对象
//			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// 单元格中的内容水平方向居中
//			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 单元格的内容垂直方向居中
//			titleFormate.setWrap(true);
//			Label title = new Label(0, 0, getLabel("群发现况汇总表"), titleFormate);
//			sheet.setRowView(0, 400, false);// 设置第一行的高度
//			sheet.addCell(title);
//			Label[] label1 = new Label[7];
//			label1[0] = new Label(0, 1, getLabel("日期"), titleFormate);
//			label1[1] = new Label(1, 1, getLabel("标题"), titleFormate);
//			label1[2] = new Label(2, 1, getLabel("送达人数"), titleFormate);
//			label1[3] = new Label(5, 1, getLabel("分享转发人数"), titleFormate);
//			label1[4] = new Label(3, 1, getLabel("图文页阅读人数"), titleFormate);
//			label1[5] = new Label(4, 1, getLabel("原文页阅读人数"), titleFormate);
//			label1[6] = new Label(6, 1, getLabel("微信收藏人数"), titleFormate);
//			sheet.addCell(label1[0]);
//			sheet.addCell(label1[1]);
//			sheet.addCell(label1[2]);
//			sheet.addCell(label1[3]);
//			sheet.addCell(label1[4]);
//			sheet.addCell(label1[5]);
//			sheet.addCell(label1[6]);
//
//			if (list.isEmpty() || list.size() == 0) {
//
//			} else {
//				int length = list.size();
//				Label[] label = new Label[7];
//				for (int i = 0; i < length; i++) {
//					label = new Label[7];
//					label[0] = new Label(0, i + 2, (String) list.get(i).get("REF_DATE"));
//					sheet.addCell(label[0]);
//					label[1] = new Label(1, i + 2, (String) list.get(i).get("MTITLE"));
//					sheet.addCell(label[1]);
//					label[2] = new Label(2, i + 2, (list.get(i).get("NEWS_CUST_CNT") + ""));
//					sheet.addCell(label[2]);
//					label[3] = new Label(3, i + 2, (list.get(i).get("READ_CUST_CNT") + ""));
//					sheet.addCell(label[3]);
//					label[4] = new Label(4, i + 2, (list.get(i).get("LINK_CUST_CNT") + ""));
//					sheet.addCell(label[4]);
//					label[5] = new Label(5, i + 2, (list.get(i).get("SHARE_CUST_CNT") + ""));
//					sheet.addCell(label[5]);
//					label[6] = new Label(6, i + 2, (list.get(i).get("LIKE_CUST_CNT") + ""));
//					sheet.addCell(label[6]);
//				}
//			}
//			// 把创建的内容写入到输出流中，并关闭输出流
//			workbook.write();
//			workbook.close();
//			os.close();
//			// **********创建EXCEL文件，写入数据 START*************//
//		} catch (Exception e) {
//			ret = "fail";
//			e.printStackTrace();
//
//		}
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		returnMap.put("result", ret);
//		renderJSON(returnMap);
//		return NONE;
//	}
	
	
	
	/** 
	* 跳转到图文信息概况详细页面
	* @return
	*/
	public String newsfeedDetail() {
		Integer shopId = getBackSessionShopId();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("shopId", shopId);
			map.put("msgId", StringUtil.emptyToNull(msgId));
			List<Map<String, Object>> dataList = commonService.selectList("ImgTextSituation.WX_IF_MESSAGE_STATS_DATA_SELECT_DETAIL", map);
			request.put("dataList", dataList);
			if(!dataList.isEmpty()){
				String msgTitle = (String)dataList.get(0).get("TITLE");
				request.put("msgTitle", msgTitle);
				String sendDate = (String)dataList.get(0).get("REF_DATE");
				request.put("sendDate", sendDate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		request.put("newsId", newsId);
		request.put("dateOne", dateOne);
		request.put("titleOne", titleOne);
		request.put("custNum", custNum);
		return "newsfeedDetail";
	}
//	public String newsfeedDetail() {
//		String userId = getBackSessionUserId();
//		Integer shopId = getBackSessionShopId();
//		try {
//			titleOne = new String(titleOne.getBytes("ISO-8859-1"), "UTF-8");
//			title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
//			Map<String, Object> map = new HashMap<String, Object>();
//			if (yearDate == "" && monthDate == "") {
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				// 获取当前月第一天：
//				Calendar c = Calendar.getInstance();
//				c.add(Calendar.MONTH, 0);
//				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//				String first = format.format(c.getTime());
//				// 获取当前月最后一天
//				Calendar ca = Calendar.getInstance();
//				ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
//				String last = format.format(ca.getTime());
//				yearDate = ca.get(Calendar.YEAR) + "";// 获取年份
//				monthDate = (ca.get(Calendar.MONTH) + 1) + "";// 获取月份
//				createdDateFrom = first;
//				createdDateTo = last + " 23:59:59";
//			} else {
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				String str = yearDate + "-" + monthDate + "-01";
//				// 获取当前月第一天：
//				Calendar c = Calendar.getInstance();
//				c.setTime(format.parse(str));
//				c.add(Calendar.MONTH, 0);
//				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//				String first = format.format(c.getTime());
//				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
//				String last = format.format(c.getTime());
//				createdDateFrom = first;
//				createdDateTo = last + " 23:59:59";
//			}
//			orderBy = "1";
//			descFlag = "1";
//			
//			map.put("shopId", shopId);
//			map.put("beginDate", createdDateFrom);
//			map.put("endDate", createdDateTo);
//			map.put("newsId", StringUtil.emptyToNull(newsId));
//			map.put("descFlag", StringUtil.emptyToNull(descFlag));
//			map.put("orderBy", StringUtil.emptyToNull(orderBy));
//			map.put("userId", StringUtil.emptyToNull(userId));
//			map.put("title", StringUtil.emptyToNull(title));
//			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.selectImgTextList", map);
//			request.put("list", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		request.put("newsId", newsId);
//		request.put("dateOne", dateOne);
//		request.put("titleOne", titleOne);
//		request.put("custNum", custNum);
//		return "newsfeedDetail";
//	}

	/** 
	 *  图文详细下载
	 * @return
	 */
	public String newsfeedDetalDownload(){
		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		String ret = "success";
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("shopId", shopId);
			map.put("msgId", StringUtil.emptyToNull(msgId));
			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.WX_IF_MESSAGE_STATS_DATA_SELECT_DETAIL", map);
			
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();// 清空输出流
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(getLabel("群发详细信息表").replaceAll("\\s*", ""), "UTF-8") + ".xls");// 设定输出文件头
			/*
			 * 群发现况汇总表 Summary table 群发详细信息表 Detail table
			 */
			
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// 创建新的一页
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
			
			sheet.mergeCells(0, 0, 7, 0);// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
			sheet.mergeCells(0, 1, 0, 2);
			sheet.mergeCells(1, 1, 2, 1);
			sheet.mergeCells(3, 1, 4, 1);
			sheet.mergeCells(5, 1, 6, 1);
			sheet.mergeCells(7, 1, 7, 2);
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10);// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableCellFormat titleFormate = new WritableCellFormat(bold);// 生成一个单元格样式控制对象
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// 单元格中的内容水平方向居中
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 单元格的内容垂直方向居中
			titleFormate.setWrap(true);
			Label title = new Label(0, 0, getLabel("群发详细信息表"), titleFormate);
			sheet.setRowView(0, 400, false);// 设置第一行的高度
			sheet.addCell(title);
			Label[] label1 = new Label[5];
			label1[0] = new Label(0, 1, getLabel("日期"), titleFormate);
			label1[1] = new Label(1, 1, getLabel("图文页阅读"), titleFormate);
			label1[2] = new Label(3, 1, getLabel("原文页阅读"), titleFormate);
			label1[3] = new Label(5, 1, getLabel("分享转发"), titleFormate);
			label1[4] = new Label(7, 1, getLabel("微信收藏人数"), titleFormate);
			sheet.addCell(label1[0]);
			sheet.addCell(label1[1]);
			sheet.addCell(label1[2]);
			sheet.addCell(label1[3]);
			sheet.addCell(label1[4]);
			Label[] label2 = new Label[6];
			label2[0] = new Label(1, 2, getLabel("人数"), titleFormate);
			label2[1] = new Label(2, 2, getLabel("次数"), titleFormate);
			label2[2] = new Label(3, 2, getLabel("人数"), titleFormate);
			label2[3] = new Label(4, 2, getLabel("次数"), titleFormate);
			label2[4] = new Label(5, 2, getLabel("人数"), titleFormate);
			label2[5] = new Label(6, 2, getLabel("次数"), titleFormate);
			sheet.addCell(label2[0]);
			sheet.addCell(label2[1]);
			sheet.addCell(label2[2]);
			sheet.addCell(label2[3]);
			sheet.addCell(label2[4]);
			sheet.addCell(label2[5]);
			int length = list.size();
			Label[] label = new Label[8];
			for (int i = 0; i < length; i++) {
				label = new Label[8];
				label[0] = new Label(0, i + 3, (String) list.get(i).get("REF_DATE"));
				sheet.addCell(label[0]);
				label[1] = new Label(1, i + 3, (list.get(i).get("INT_PAGE_READ_USER") + ""));
				sheet.addCell(label[1]);
				label[2] = new Label(2, i + 3, (list.get(i).get("INT_PAGE_READ_COUNT") + ""));
				sheet.addCell(label[2]);
				label[3] = new Label(3, i + 3, (list.get(i).get("ORI_PAGE_READ_USER") + ""));
				sheet.addCell(label[3]);
				label[4] = new Label(4, i + 3, (list.get(i).get("ORI_PAGE_READ_COUNT") + ""));
				sheet.addCell(label[4]);
				label[5] = new Label(5, i + 3, (list.get(i).get("SHARE_USER") + ""));
				sheet.addCell(label[5]);
				label[6] = new Label(6, i + 3, (list.get(i).get("SHARE_COUNT") + ""));
				sheet.addCell(label[6]);
				label[7] = new Label(7, i + 3, (list.get(i).get("ADD_TO_FAV_USER") + ""));
				sheet.addCell(label[7]);
			}
			// 把创建的内容写入到输出流中，并关闭输出流
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
	*  图文详细下载
	* @return
	*/
//	public String newsfeedDetalDownload(){
//		String userId = getBackSessionUserId();
//		Integer shopId = getBackSessionShopId();
//		String ret = "success";
//		try {
//			titleOne = new String(titleOne.getBytes("ISO-8859-1"), "UTF-8");
//			title = new String(title.getBytes("ISO-8859-1"), "UTF-8");
//			Map<String, Object> map = new HashMap<String, Object>();
//			if (yearDate == "" && monthDate == "") {
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				// 获取当前月第一天：
//				Calendar c = Calendar.getInstance();
//				c.add(Calendar.MONTH, 0);
//				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//				String first = format.format(c.getTime());
//				// 获取当前月最后一天
//				Calendar ca = Calendar.getInstance();
//				ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
//				String last = format.format(ca.getTime());
//				yearDate = ca.get(Calendar.YEAR) + "";// 获取年份
//				monthDate = (ca.get(Calendar.MONTH) + 1) + "";// 获取月份
//				createdDateFrom = first;
//				createdDateTo = last + " 23:59:59";
//			} else {
//				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//				String str = yearDate + "-" + monthDate + "-01";
//				// 获取当前月第一天：
//				Calendar c = Calendar.getInstance();
//				c.setTime(format.parse(str));
//				c.add(Calendar.MONTH, 0);
//				c.set(Calendar.DAY_OF_MONTH, 1);// 设置为1号,当前日期既为本月第一天
//				String first = format.format(c.getTime());
//				c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
//				String last = format.format(c.getTime());
//				createdDateFrom = first;
//				createdDateTo = last + " 23:59:59";
//			}
//			orderBy = "1";
//			descFlag = "1";
//			map.put("shopId", shopId);
//			map.put("beginDate", createdDateFrom);
//			map.put("endDate", createdDateTo);
//			map.put("newsId", StringUtil.emptyToNull(newsId));
//			map.put("descFlag", StringUtil.emptyToNull(descFlag));
//			map.put("orderBy", StringUtil.emptyToNull(orderBy));
//			map.put("userId", StringUtil.emptyToNull(userId));
//			map.put("title", StringUtil.emptyToNull(title));
//			List<Map<String, Object>> list = commonService.selectList("ImgTextSituation.selectImgTextList", map);
//
//			HttpServletResponse response = ServletActionContext.getResponse();
//			OutputStream os = new BufferedOutputStream(response.getOutputStream());
//			response.reset();// 清空输出流
//			response.setContentType("application/vnd.ms-excel;charset=utf-8");
//			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(getLabel("群发详细信息表").replaceAll("\\s*", ""), "UTF-8") + ".xls");// 设定输出文件头
//			/*
//			 * 群发现况汇总表 Summary table 群发详细信息表 Detail table
//			 */
//
//			// 创建工作薄
//			WritableWorkbook workbook = Workbook.createWorkbook(os);
//			// 创建新的一页
//			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
//
//			sheet.mergeCells(0, 0, 7, 0);// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
//			sheet.mergeCells(0, 1, 0, 2);
//			sheet.mergeCells(1, 1, 2, 1);
//			sheet.mergeCells(3, 1, 4, 1);
//			sheet.mergeCells(5, 1, 6, 1);
//			sheet.mergeCells(7, 1, 7, 2);
//			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10);// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
//			WritableCellFormat titleFormate = new WritableCellFormat(bold);// 生成一个单元格样式控制对象
//			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// 单元格中的内容水平方向居中
//			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 单元格的内容垂直方向居中
//			titleFormate.setWrap(true);
//			Label title = new Label(0, 0, getLabel("群发详细信息表"), titleFormate);
//			sheet.setRowView(0, 400, false);// 设置第一行的高度
//			sheet.addCell(title);
//			Label[] label1 = new Label[5];
//			label1[0] = new Label(0, 1, getLabel("日期"), titleFormate);
//			label1[1] = new Label(1, 1, getLabel("图文页阅读"), titleFormate);
//			label1[2] = new Label(3, 1, getLabel("原文页阅读"), titleFormate);
//			label1[3] = new Label(5, 1, getLabel("分享转发"), titleFormate);
//			label1[4] = new Label(7, 1, getLabel("微信收藏人数"), titleFormate);
//			sheet.addCell(label1[0]);
//			sheet.addCell(label1[1]);
//			sheet.addCell(label1[2]);
//			sheet.addCell(label1[3]);
//			sheet.addCell(label1[4]);
//			Label[] label2 = new Label[6];
//			label2[0] = new Label(1, 2, getLabel("人数"), titleFormate);
//			label2[1] = new Label(2, 2, getLabel("次数"), titleFormate);
//			label2[2] = new Label(3, 2, getLabel("人数"), titleFormate);
//			label2[3] = new Label(4, 2, getLabel("次数"), titleFormate);
//			label2[4] = new Label(5, 2, getLabel("人数"), titleFormate);
//			label2[5] = new Label(6, 2, getLabel("次数"), titleFormate);
//			sheet.addCell(label2[0]);
//			sheet.addCell(label2[1]);
//			sheet.addCell(label2[2]);
//			sheet.addCell(label2[3]);
//			sheet.addCell(label2[4]);
//			sheet.addCell(label2[5]);
//			int length = list.size();
//			Label[] label = new Label[8];
//			for (int i = 0; i < length; i++) {
//				label = new Label[8];
//				label[0] = new Label(0, i + 3, (String) list.get(i).get("REF_DATE"));
//				sheet.addCell(label[0]);
//				label[1] = new Label(1, i + 3, (list.get(i).get("READ_CUST_CNT") + ""));
//				sheet.addCell(label[1]);
//				label[2] = new Label(2, i + 3, (list.get(i).get("READ_CNT") + ""));
//				sheet.addCell(label[2]);
//				label[3] = new Label(3, i + 3, (list.get(i).get("LINK_CUST_CNT") + ""));
//				sheet.addCell(label[3]);
//				label[4] = new Label(4, i + 3, (list.get(i).get("LINK_CNT") + ""));
//				sheet.addCell(label[4]);
//				label[5] = new Label(5, i + 3, (list.get(i).get("SHARE_CUST_CNT") + ""));
//				sheet.addCell(label[5]);
//				label[6] = new Label(6, i + 3, (list.get(i).get("SHARE_CNT") + ""));
//				sheet.addCell(label[6]);
//				label[7] = new Label(7, i + 3, (list.get(i).get("LIKE_CNT") + ""));
//				sheet.addCell(label[7]);
//			}
//			// 把创建的内容写入到输出流中，并关闭输出流
//			workbook.write();
//			workbook.close();
//			os.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//			ret = "fail";
//		}
//		Map<String, Object> returnMap = new HashMap<String, Object>();
//		returnMap.put("result", ret);
//		renderJSON(returnMap);
//		return NONE;
//	}
	
	
	
	/******************************** 客户现况 *************************************/
	
	public String hzm_CustStatus(){
		
		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		
		if (StringUtils.isBlank(startDate)) {
			try {
				startDate = DateUtil.getAddDay(DateUtil.DEFAULT_DATE, -30).substring(0, 10);
			} catch (ParseException e) {
			}
			endDate = DateUtil.today();
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("CustCurrent.selectCustCurrentList", map); //查询详情数据
		
		
		Map<String,Object> mapAll = new HashMap<String,Object>();
		mapAll.put("shopId", shopId);
		mapAll.put("startDate", StringUtil.emptyToNull(startDate));
		mapAll.put("endDate", StringUtil.emptyToNull(endDate));
		mapAll.put("jobType", "A");
		Map<String,Object> summary = commonService.select("CustCurrent.selectAllCount", mapAll); //查询总数量
		
		
		
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		request.put("list", list);
		request.put("summary", summary);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		return "hzm_CustStatus";
	}
	
	
	public String hzm_CustStatusFragment(){
		
		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("CustCurrent.selectCustCurrentList", map); //查询详情数据
		 
		request.put("list", list);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		return "hzm_CustStatusFragment";
	}
	
	public String hzm_GetCustStatusLast7Day() throws ParseException{
		
		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		
		if (StringUtils.isBlank(startDate)) {
			try {
				startDate = DateUtil.getAddDay(DateUtil.DEFAULT_DATE, -30).substring(0, 10);
			} catch (ParseException e) {
			}
			endDate = DateUtil.today();
		}
		
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", 100000);
		List<Map<String,Object>> list = commonService.selectList("CustCurrent.selectCustCurrentList", map); //查询详情数据
		
		//得到两个日期之间的所有日期
		Calendar startCalendar = Calendar.getInstance();
        Calendar endCalendar = Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date data = df.parse(startDate);
        Calendar cal=Calendar.getInstance();
        cal.setTime(data);
        cal.add(Calendar.DATE, -1);  //减1天
        Date start =cal.getTime();
        startCalendar.setTime(start);
        Date end = df.parse(endDate);
        endCalendar.setTime(end);
        ArrayList<String> arr = new ArrayList<String>();
        while(true){
            startCalendar.add(Calendar.DAY_OF_MONTH, 1);
            if(startCalendar.getTimeInMillis() <= endCalendar.getTimeInMillis()){//TODO 转数组或是集合
            	arr.add(df.format(startCalendar.getTime()));
        }else{
            break;
        }
       }
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", list);
		returnMap.put("arr", arr);
		renderJSON(returnMap);
		
		
		return NONE;
	
	}
	
	
	public String custStatusExcelDownload(){

		String userId = getBackSessionUserId();
		Integer shopId = getBackSessionShopId();
		String ret="success";
		Map<String,Object> map=new HashMap<String,Object>();
		if(startDate==""|| startDate==null){
			 Calendar ca = Calendar.getInstance();
		     int year = ca.get(Calendar.YEAR);//获取年份
		     int month=ca.get(Calendar.MONTH);//获取月份
		     startDate=year+"-"+(month+1)+"-0";
		}
		map.put("shopId", shopId);
		map.put("startDate", startDate);
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr",1 );
		map.put("pageUnit", 10000);
		List<Map<String,Object>> list=commonService.selectList("CustCurrent.selectCustCurrentList", map);
		String statusNm = StringUtils.trimToNull(getLabel("客户现况"));
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os= new BufferedOutputStream(response.getOutputStream());  
            response.reset();// 清空输出流   
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode(statusNm.replaceAll("\\s*", ""), "UTF-8")+".xls");// 设定输出文件头
			//创建工作薄
	        WritableWorkbook workbook = Workbook.createWorkbook(os);
	        //创建新的一页
	        WritableSheet sheet = workbook.createSheet("First Sheet",0);
	        
	        sheet.mergeCells(0, 0, 3, 0);//添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
	        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
	        WritableCellFormat titleFormate = new WritableCellFormat(bold);//生成一个单元格样式控制对象
	        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
	        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向居中
	        
	        Label title = new Label(0,0,statusNm,titleFormate);
       	 	sheet.setRowView(0, 400, false);//设置第一行的高度
	         sheet.addCell(title);

	        int length=list.size();
	        Label[] label=new Label[4];
	       
        	label[0]=new Label(0,1,getLabel("时间"));
 	        sheet.addCell(label[0]); 
 	        label[1]=new Label(1,1,getLabel("新增粉丝"));
 	        sheet.addCell(label[1]); 
 	        label[2]=new Label(2,1,getLabel("跑路粉丝"));
 	        sheet.addCell(label[2]);
 	        label[3]=new Label(3,1,getLabel("净增粉丝"));
 	        sheet.addCell(label[3]);
 	        
	        for(int i=0;i<length;i++){
	        	label=new Label[4];
	 	        label[0]=new Label(0,i+2,list.get(i).get("FOLLOW_DT").toString());
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1,i+2,list.get(i).get("NEW_FANS").toString());
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2,i+2,list.get(i).get("OUT_FANS").toString());
	 	        sheet.addCell(label[2]);
	 	        label[3]=new Label(3,i+2,list.get(i).get("GROW_FANS").toString());
	 	        sheet.addCell(label[3]);
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
	
	public String menuClickRate(){
		
		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.ANALYSIS_MENU_SELECT", map);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, list);
		}

		request.put("list", list);
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		
		return "menuClickRate";
	}
	
	public String menuClickRateListFragment(){
		
		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.ANALYSIS_MENU_SELECT", map);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, list);
		}

		request.put("list", list);
		request.put("page", page);
		request.put("startDate", startDate);
		request.put("endDate", endDate);
		
		return "menuClickRateListFragment";
	}
	
	public String menuClickRateExcel(){

		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();
		String statusNm = StringUtils.trimToNull(getLabel("菜单点击率"));
		String ret="success";
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", 100000000);
		
		List<Map<String,Object>> list = commonService.selectList("OrderBaseCount.ANALYSIS_MENU_SELECT", map);
		
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os= new BufferedOutputStream(response.getOutputStream());  
            response.reset();// 清空输出流   
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode(statusNm.replaceAll("\\s*", ""), "UTF-8")+".xls");// 设定输出文件头
			//创建工作薄
	        WritableWorkbook workbook = Workbook.createWorkbook(os);
	        //创建新的一页
	        WritableSheet sheet = workbook.createSheet("First Sheet",0);
	        
	        sheet.mergeCells(0, 0, 16, 0);//添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
	        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
	        WritableCellFormat titleFormate = new WritableCellFormat(bold);//生成一个单元格样式控制对象
	        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
	        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向居中
	        
	        Label title = new Label(0,0,statusNm,titleFormate);
       	 	sheet.setRowView(0, 400, false);//设置第一行的高度
	         sheet.addCell(title);

	        int length = list.size();
	        Label[] label = new Label[17];
	       
        	label[0]=new Label(0,1,getLabel("店铺ID"));
 	        sheet.addCell(label[0]); 
 	        label[1]=new Label(1,1,getLabel("分析统计ID"));
 	        sheet.addCell(label[1]); 
 	        label[2]=new Label(2,1,getLabel("生成日期"));
 	        sheet.addCell(label[2]);
 	        label[3]=new Label(3,1,getLabel("年月日"));
 	        sheet.addCell(label[3]);
 	        label[4]=new Label(4,1,getLabel("年月"));
	        sheet.addCell(label[4]); 
	        label[5]=new Label(5,1,getLabel("年"));
	        sheet.addCell(label[5]); 
	        label[6]=new Label(6,1,getLabel("月"));
	        sheet.addCell(label[6]);
	        label[7]=new Label(7,1,getLabel("天"));
	        sheet.addCell(label[7]);
	        label[8]=new Label(8,1,getLabel("小时"));
	        sheet.addCell(label[8]);
	        label[9]=new Label(9,1,getLabel("OPENID"));
	        sheet.addCell(label[9]);
	        label[10]=new Label(10,1,getLabel("昵称"));
	        sheet.addCell(label[10]);
	        label[11]=new Label(11,1,getLabel("店铺菜单分类ID"));
	        sheet.addCell(label[11]);
	        label[12]=new Label(12,1,getLabel("店铺菜单分类名称"));
	        sheet.addCell(label[12]);
	        label[13]=new Label(13,1,getLabel("菜单操作区分"));
	        sheet.addCell(label[13]);
	        label[14]=new Label(14,1,getLabel("消息ID"));
	        sheet.addCell(label[14]);
	        label[15]=new Label(15,1,getLabel("菜单操作标题"));
	        sheet.addCell(label[15]);
	        label[16]=new Label(16,1,getLabel("菜单操作内容"));
	        sheet.addCell(label[16]);
	        
	        for(int i=0;i<length;i++) {
	        	
	        	label = new Label[17];
	 	        label[0]=new Label(0, i+2, (String)list.get(i).get("SHOP_ID"));
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1, i+2, (String)list.get(i).get("AM_ID"));
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2, i+2, (String)list.get(i).get("AM_DT_H"));
	 	        sheet.addCell(label[2]);
	 	        label[3]=new Label(3, i+2, (String)list.get(i).get("AM_YMD"));
	 	        sheet.addCell(label[3]);
	 	        label[4]=new Label(4, i+2, (String)list.get(i).get("AM_YM"));
	 	        sheet.addCell(label[4]);
	 	        label[5]=new Label(5, i+2, (String)list.get(i).get("AM_YY"));
	 	        sheet.addCell(label[5]);
	 	        label[6]=new Label(6, i+2, (String)list.get(i).get("AM_MM"));
	 	        sheet.addCell(label[6]);
	 	        label[7]=new Label(7, i+2, (String)list.get(i).get("AM_DD"));
	 	        sheet.addCell(label[7]);
	 	        label[8]=new Label(8, i+2, (String)list.get(i).get("AM_HOUR"));
	 	        sheet.addCell(label[8]);
	 	        label[9]=new Label(9, i+2, (String)list.get(i).get("OPENID"));
	 	        sheet.addCell(label[9]);
	 	        label[10]=new Label(10, i+2, (String)list.get(i).get("NICKNAME"));
	 	        sheet.addCell(label[10]);
	 	        label[11]=new Label(11, i+2, (String)list.get(i).get("MENU_ID"));
	 	        sheet.addCell(label[11]);
	 	        label[12]=new Label(12, i+2, (String)list.get(i).get("MENU_NM"));
	 	        sheet.addCell(label[12]);
	 	        label[13]=new Label(13, i+2, (String)list.get(i).get("MENU_OP_TYPE"));
	 	        sheet.addCell(label[13]);
	 	        label[14]=new Label(14, i+2, (String)list.get(i).get("MENU_OP_ID"));
	 	        sheet.addCell(label[14]);
	 	        label[15]=new Label(15, i+2, (String)list.get(i).get("MENU_OP_TITLE"));
	 	        sheet.addCell(label[15]);
	 	        label[16]=new Label(16, i+2, (String)list.get(i).get("MENU_OP_COM"));
	 	        sheet.addCell(label[16]);
	 	        
	 	        /*Timestamp timestamp =  (Timestamp) list.get(i).get("AM_DT");
	 	        Date date = new Date(timestamp.getTime());
	 	        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-mm-HH"); 
	 	        label[7] = new Label(7, i+2, sdf.format(date));
	 	        sheet.addCell(label[7]);*/
	        }
	        //把创建的内容写入到输出流中，并关闭输出流
	        workbook.write();
	        workbook.close();
	        os.close();
		} catch (Exception e) {
			e.printStackTrace();
			ret="fail";
		}  
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		
	    return NONE;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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

	public String getYearDate() {
		return yearDate;
	}

	public void setYearDate(String yearDate) {
		this.yearDate = yearDate;
	}

	public String getMonthDate() {
		return monthDate;
	}

	public void setMonthDate(String monthDate) {
		this.monthDate = monthDate;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getDescFlag() {
		return descFlag;
	}

	public void setDescFlag(String descFlag) {
		this.descFlag = descFlag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNewsId() {
		return newsId;
	}

	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}

	public String getTitleOne() {
		return titleOne;
	}

	public void setTitleOne(String titleOne) {
		this.titleOne = titleOne;
	}

	public String getCustNum() {
		return custNum;
	}

	public void setCustNum(String custNum) {
		this.custNum = custNum;
	}

	public String getDateOne() {
		return dateOne;
	}

	public void setDateOne(String dateOne) {
		this.dateOne = dateOne;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSendStatus() {
		return sendStatus;
	}
	public void setSendStatus(String sendStatus) {
		this.sendStatus = sendStatus;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getRedParkStatus() {
		return redParkStatus;
	}
	public void setRedParkStatus(String redParkStatus) {
		this.redParkStatus = redParkStatus;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	
	
}
