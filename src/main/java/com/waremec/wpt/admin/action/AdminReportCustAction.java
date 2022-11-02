/**   
 * @Title: AdminReportCustAction.java 
 * @Package com.waremec.wpt.admin.action 
 * @Description:  
 * @author taebem
 * @date 2015年9月6日 上午9:24:37 
 * @version V1.0   
 */
package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LabelUtil;
import com.waremec.framework.utilities.StringUtil;

/**
 * @Package com.waremec.wpt.admin.action
 * @FileName AdminReportCustAction
 * @Description
 * @author taebem
 * @date 2015年9月6日 上午9:24:37
 * 
 */
@Controller("adminReportCustAction")
@Scope(ScopeType.prototype)
public class AdminReportCustAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	
	private Integer shopId;
	private String userId = "";
	// 性别
	private String wx_if_sex_id = "";
	private Integer custSysId;
	private String custSysIds;
	// 用于存储实际每页多少条数据
	private String pageEntity = "";
	// 等级id
	private Integer gradeId;
	// 调用存储类型
	private String jobType = "";
	private String languageFlag = "";
	private String man = "";
	private String manPayment = "";
	private String manNopay = "";
	private String manNoorder = "";
	private String startDate ;
	private String endDate ;

	public String custAnalyze() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");// 可以方便地修改日期格
		
		if(StringUtils.isBlank(startDate)){
			startDate = dateFormat.format(new Date(new Date().getTime() - 6 * 24 * 60 * 60 * 1000));
		}
		if(StringUtils.isBlank(endDate)){
			endDate = dateFormat.format(new Date());
		}
		
		
		// 查询出当前页数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		
		map.put("jobType", "A");
		// --性别和交易现况(饼图)
		Map<String, Object> pieMst = commonService.select("CustRatio.selectCustRatio", map);
		// --性别和交易现况(列表)
		map.put("jobType", "B");
		List<Map<String, Object>> genderAndTradeList = commonService.selectList("CustRatio.selectCustRatio", map);
		// --等级和消费金额
		map.put("jobType", "C");
		List<Map<String, Object>> gradeAndConsumptionList = commonService.selectList("CustRatio.selectCustRatio", map);
		
		request.put("pieMst", pieMst);
		request.put("genderAndTradeList", genderAndTradeList);
		request.put("gradeAndConsumptionList", gradeAndConsumptionList);
		return "custAnalyze";
	}
	
	
	/** 
	*性别与交易现状走势图
	* @return
	*/
	public String getJsonGenderAndTradeChartData(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		
		// --性别和交易现况(列表)
		map.put("jobType", "B");
		List<Map<String, Object>> genderAndTradeList = commonService.selectList("CustRatio.selectCustRatio", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("genderAndTradeList", genderAndTradeList);
		renderJSON(returnMap);
		return NONE;
	}
	
	/** 
	* 人数与消费总额走势图
	* @return
	*/
	public String getJsonGradeAndConsumptionChartData(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		
		// --等级和消费金额
		map.put("jobType", "C");
		List<Map<String, Object>> gradeAndConsumptionList = commonService.selectList("CustRatio.selectCustRatio", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("gradeAndConsumptionList", gradeAndConsumptionList);
		renderJSON(returnMap);
		return NONE;
	}
	
	
	// 向custPoupe.jsp传参时调用的方法--性别
		/*public String getCustsByGender() {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();
			// --性别和交易现况(具体)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("wx_if_sex_id", StringUtil.emptyToNull(wx_if_sex_id));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustList", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", list);
			renderJSON(returnMap);
			return NONE;
		}*/

	
		// 向custPoupe.jsp传参时调用的方法--等级
		/*public String getCustsByGrade() {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();

			// --等级和消费金额(具体)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("gradeId", gradeId);
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectGrade", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("list", list);
			renderJSON(returnMap);
			return NONE;
		}*/
	
		
		
		public String custSexList() {
			// 查询客户信息
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();
			// --性别和交易现况(具体)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("wx_if_sex_id", StringUtil.emptyToNull(wx_if_sex_id));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustSexList", map);
			
			request.put("list", list);
			// 分页
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TEMP_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);

			return "custSexList";
		}
		
		
		public String custSexListFragment() {
			// 查询客户信息
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();
			// --性别和交易现况(具体)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("wx_if_sex_id", StringUtil.emptyToNull(wx_if_sex_id));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustSexList", map);
			
			request.put("list", list);
			// 分页
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TEMP_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);

			return "custSexListFragment";
		}

		public String createExcelGender() throws UnsupportedEncodingException {
			String ret = "";
			Map<String, String> label = LabelUtil.getLabelMap(getServletContext());

			Integer shopId = getBackSessionShopId();
			String userId = getBackSessionUserId();
			String startDate = StringUtils.trimToNull(getRequest().getParameter("startDate"));
			String endDate = StringUtils.trimToNull(getRequest().getParameter("endDate"));
			Map<String, Object> map = new HashMap<String, Object>();
			if (startDate == "" || startDate == null) {
				Calendar ca = Calendar.getInstance();
				int year = ca.get(Calendar.YEAR);// 获取年份
				int month = ca.get(Calendar.MONTH);// 获取月份
				startDate = year + "-" + (month + 1) + "-0";
			}
			map.put("shopId", shopId);
			map.put("startDate", startDate);
			map.put("endDate", StringUtil.emptyToNull(endDate));
			jobType = "B";
			map.put("jobType", jobType);
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustRatio", map);
			try {
				String statusNm = getLabel("性别和交易详情");
				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				// 清空输出流
				response.reset();
				response.setContentType("application/vnd.ms-excel;charset=utf-8");
				// 设定输出文件头
				response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm.replaceAll("\\s*", ""), "UTF-8") + ".xls");
				// 创建工作薄
				WritableWorkbook workbook = Workbook.createWorkbook(os);
				// 创建新的一页
				WritableSheet sheet = workbook.createSheet("First Sheet", 0);
				// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
				sheet.mergeCells(0, 0, 4, 0);
				// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
				WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
				// 生成一个单元格样式控制对象
				WritableCellFormat titleFormate = new WritableCellFormat(bold);
				// 单元格中的内容水平方向居中
				titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
				// 单元格的内容垂直方向居中
				titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
				// 设置第一行合并单元格的文本
				Label title = new Label(0, 0, statusNm, titleFormate);
				// 设置第一行的高度
				sheet.setRowView(0, 600, false);
				// 工作表中添加
				sheet.addCell(title);
				// 添加内容
				int row = 1;
				int col = 0;

				String[] titles = { getLabel("客户性别"), getLabel("总人数"), getLabel("已成交"), getLabel("待付款"), getLabel("无订单") };
				for (int i = 0; i < titles.length; i++) {
					// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
					sheet.addCell(new Label(col++, row, titles[i]));
				}
				row = 2;
				col = 0;
				for (int i = 0; i < list.size(); i++) {
					sheet.addCell(new Label(col++, row, list.get(i).get("WX_IF_SEX_NM").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_CNT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("DEAL_CNT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("WAIT_CNT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("UNKNOWN_CNT").toString(), titleFormate));
					row++;
					col = 0;

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
		
		
		public String custGradeList() {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();

			// --等级和消费金额(具体)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("gradeId", gradeId);
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustGradeList", map);
			
			request.put("list", list);
			// 分页
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TEMP_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);

			return "custGradeList";
		}
		
		public String custGradeListFragment() {
			userId = getBackSessionUserId();
			shopId = getBackSessionShopId();

			// --等级和消费金额(具体)
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("gradeId", gradeId);
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustGradeList", map);
			
			request.put("list", list);
			// 分页
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TEMP_CNT"));
				page = new PageData(pageCurr, pageUnit, totalCount, list);
			}

			request.put("page", page);

			return "custGradeListFragment";
		}
		
		
		public String createExcelGrade() throws UnsupportedEncodingException {
			String ret = "";
			Map<String, String> label = LabelUtil.getLabelMap(getServletContext());

			Integer shopId = getBackSessionShopId();
			String userId = getBackSessionUserId();
			String startDate = StringUtils.trimToNull(getRequest().getParameter("startDate"));
			String endDate = StringUtils.trimToNull(getRequest().getParameter("endDate"));
			Map<String, Object> map = new HashMap<String, Object>();
			if (startDate == "" || startDate == null) {
				Calendar ca = Calendar.getInstance();
				int year = ca.get(Calendar.YEAR);// 获取年份
				int month = ca.get(Calendar.MONTH);// 获取月份
				startDate = year + "-" + (month + 1) + "-0";
			}
			map.put("shopId", shopId);
			map.put("startDate", startDate);
			map.put("endDate", StringUtil.emptyToNull(endDate));
			jobType = "C";
			map.put("jobType", jobType);
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustRatio", map);
			try {
				String statusNm = getLabel("各等级会员消费总金额");
				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				// 清空输出流
				response.reset();
				response.setContentType("application/vnd.ms-excel;charset=utf-8");
				// 设定输出文件头
				response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm.replaceAll("\\s*", ""), "UTF-8") + ".xls");
				// 创建工作薄
				WritableWorkbook workbook = Workbook.createWorkbook(os);
				// 创建新的一页
				WritableSheet sheet = workbook.createSheet("First Sheet", 0);
				// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
				sheet.mergeCells(0, 0, 4, 0);
				// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
				WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
				// 生成一个单元格样式控制对象
				WritableCellFormat titleFormate = new WritableCellFormat(bold);
				// 单元格中的内容水平方向居中
				titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
				// 单元格的内容垂直方向居中
				titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
				// 设置第一行合并单元格的文本
				Label title = new Label(0, 0, statusNm, titleFormate);
				// 设置第一行的高度
				sheet.setRowView(0, 600, false);
				// 工作表中添加
				sheet.addCell(title);
				// 添加内容
				int row = 1;
				int col = 0;

				String[] titles = { getLabel("会员等级"), getLabel("总人数"), getLabel("人数占比"), getLabel("消费总金额"), getLabel("金额占比") };
				for (int i = 0; i < titles.length; i++) {
					// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
					sheet.addCell(new Label(col++, row, titles[i]));
				}
				row = 2;
				col = 0;
				for (int i = 0; i < list.size(); i++) {
					sheet.addCell(new Label(col++, row, list.get(i).get("GRADE_NM").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_GRADE_CNT").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_AVG").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("PRICE_GRADE_SUM").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("PRICE_AVG").toString(), titleFormate));
					row++;
					col = 0;

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
		
		
		public String createExcelCustSex() throws UnsupportedEncodingException {
			String ret = "";
			Map<String, String> label = LabelUtil.getLabelMap(getServletContext());

			Integer shopId = getBackSessionShopId();
			Map<String, Object> map = new HashMap<String, Object>();
			if (StringUtils.isBlank(startDate)) {
				Calendar ca = Calendar.getInstance();
				int year = ca.get(Calendar.YEAR);// 获取年份
				int month = ca.get(Calendar.MONTH);// 获取月份
				startDate = year + "-" + (month + 1) + "-0";
			}
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("wx_if_sex_id", StringUtil.emptyToNull(wx_if_sex_id));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			map.put("pageCurr", 1);
			map.put("pageUnit", Integer.MAX_VALUE);
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustSexList", map);
			try {
				String statusNm = getLabel("客户信息");
				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				// 清空输出流
				response.reset();
				response.setContentType("application/vnd.ms-excel;charset=utf-8");
				// 设定输出文件头
				response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm, "UTF-8") + ".xls");
				// 创建工作薄
				WritableWorkbook workbook = Workbook.createWorkbook(os);
				// 创建新的一页
				WritableSheet sheet = workbook.createSheet("First Sheet", 0);
				// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
				sheet.mergeCells(0, 0, 7, 0);
				// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
				WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
				// 生成一个单元格样式控制对象
				WritableCellFormat titleFormate = new WritableCellFormat(bold);
				// 单元格中的内容水平方向居中
				titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
				// 单元格的内容垂直方向居中
				titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
				// 设置第一行合并单元格的文本
				Label title = new Label(0, 0, statusNm, titleFormate);
				// 设置第一行的高度
				sheet.setRowView(0, 600, false);
				// 工作表中添加
				sheet.addCell(title);
				// 添加内容
				int row = 1;
				int col = 0;

				String[] titles = { getLabel("粉丝"), getLabel("等级"), getLabel("积分"), getLabel("关注时间"), getLabel("最后对话"), getLabel("最后购买"), getLabel("购买次数"),
						getLabel("购买均价") };
				for (int i = 0; i < titles.length; i++) {
					// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
					sheet.addCell(new Label(col++, row, titles[i]));
				}
				row = 2;
				col = 0;
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).get("CUST_NICK_NM") == null) {
						sheet.addCell(new Label(col++, row, "", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("CUST_NICK_NM").toString(), titleFormate));
					}
					if (list.get(i).get("GRADE_NM") == null) {
						sheet.addCell(new Label(col++, row, "", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("GRADE_NM").toString(), titleFormate));
					}
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_POINT").toString(), titleFormate));
					if (list.get(i).get("SUBSCRIBE_TIME") == null) {
						sheet.addCell(new Label(col++, row, "无", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("SUBSCRIBE_TIME").toString(), titleFormate));
					}
					if (list.get(i).get("RECEIVE_DT") == null) {
						sheet.addCell(new Label(col++, row, "无", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("RECEIVE_DT").toString(), titleFormate));
					}
					if (list.get(i).get("LAST_PUR_DT") == null) {
						sheet.addCell(new Label(col++, row, "无", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("LAST_PUR_DT").toString(), titleFormate));
					}
					sheet.addCell(new Label(col++, row, list.get(i).get("PUR_TIMES").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("GOODS_PRICE_AVG").toString(), titleFormate));
					row++;
					col = 0;

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
		
		public String createExcelCustGrade() throws UnsupportedEncodingException {
			String ret = "";
			Map<String, String> label = LabelUtil.getLabelMap(getServletContext());

			Integer shopId = getBackSessionShopId();
			Map<String, Object> map = new HashMap<String, Object>();
			if (StringUtils.isBlank(startDate)) {
				Calendar ca = Calendar.getInstance();
				int year = ca.get(Calendar.YEAR);// 获取年份
				int month = ca.get(Calendar.MONTH);// 获取月份
				startDate = year + "-" + (month + 1) + "-0";
			}
			map.put("shopId", shopId);
			map.put("startDate", StringUtil.emptyToNull(startDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("gradeId", gradeId);
			map.put("userId", StringUtil.emptyToNull(userId));
			map.put("jobType", StringUtil.emptyToNull(jobType));
			map.put("pageCurr", 1);
			map.put("pageUnit", Integer.MAX_VALUE);
			List<Map<String, Object>> list = commonService.selectList("CustRatio.selectCustGradeList", map);
			try {
				String statusNm = getLabel("客户信息");
				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				// 清空输出流
				response.reset();
				response.setContentType("application/vnd.ms-excel;charset=utf-8");
				// 设定输出文件头
				response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm, "UTF-8") + ".xls");
				// 创建工作薄
				WritableWorkbook workbook = Workbook.createWorkbook(os);
				// 创建新的一页
				WritableSheet sheet = workbook.createSheet("First Sheet", 0);
				// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
				sheet.mergeCells(0, 0, 7, 0);
				// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
				WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
				// 生成一个单元格样式控制对象
				WritableCellFormat titleFormate = new WritableCellFormat(bold);
				// 单元格中的内容水平方向居中
				titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
				// 单元格的内容垂直方向居中
				titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
				// 设置第一行合并单元格的文本
				Label title = new Label(0, 0, statusNm, titleFormate);
				// 设置第一行的高度
				sheet.setRowView(0, 600, false);
				// 工作表中添加
				sheet.addCell(title);
				// 添加内容
				int row = 1;
				int col = 0;

				String[] titles = { getLabel("粉丝"), getLabel("等级"), getLabel("积分"), getLabel("关注时间"), getLabel("最后对话"), getLabel("最后购买"), getLabel("购买次数"),
						getLabel("购买均价") };
				for (int i = 0; i < titles.length; i++) {
					// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
					sheet.addCell(new Label(col++, row, titles[i]));
				}
				row = 2;
				col = 0;
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).get("CUST_NICK_NM") == null) {
						sheet.addCell(new Label(col++, row, "", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("CUST_NICK_NM").toString(), titleFormate));
					}
					if (list.get(i).get("GRADE_NM") == null) {
						sheet.addCell(new Label(col++, row, "", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("GRADE_NM").toString(), titleFormate));
					}
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_POINT").toString(), titleFormate));
					if (list.get(i).get("SUBSCRIBE_TIME") == null) {
						sheet.addCell(new Label(col++, row, "无", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("SUBSCRIBE_TIME").toString(), titleFormate));
					}
					if (list.get(i).get("RECEIVE_DT") == null) {
						sheet.addCell(new Label(col++, row, "无", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("RECEIVE_DT").toString(), titleFormate));
					}
					if (list.get(i).get("LAST_PUR_DT") == null) {
						sheet.addCell(new Label(col++, row, "无", titleFormate));
					} else {
						sheet.addCell(new Label(col++, row, list.get(i).get("LAST_PUR_DT").toString(), titleFormate));
					}
					sheet.addCell(new Label(col++, row, list.get(i).get("PUR_TIMES").toString(), titleFormate));
					sheet.addCell(new Label(col++, row, list.get(i).get("GOODS_PRICE_AVG").toString(), titleFormate));
					row++;
					col = 0;

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


	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWx_if_sex_id() {
		return wx_if_sex_id;
	}

	public void setWx_if_sex_id(String wx_if_sex_id) {
		this.wx_if_sex_id = wx_if_sex_id;
	}

	public Integer getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(Integer custSysId) {
		this.custSysId = custSysId;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getLanguageFlag() {
		return languageFlag;
	}

	public void setLanguageFlag(String languageFlag) {
		this.languageFlag = languageFlag;
	}

	public String getMan() {
		return man;
	}

	public void setMan(String man) {
		this.man = man;
	}

	public String getManPayment() {
		return manPayment;
	}

	public void setManPayment(String manPayment) {
		this.manPayment = manPayment;
	}

	public String getManNopay() {
		return manNopay;
	}

	public void setManNopay(String manNopay) {
		this.manNopay = manNopay;
	}

	public String getManNoorder() {
		return manNoorder;
	}

	public void setManNoorder(String manNoorder) {
		this.manNoorder = manNoorder;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getCustSysIds() {
		return custSysIds;
	}


	public void setCustSysIds(String custSysIds) {
		this.custSysIds = custSysIds;
	}
	
	
	
	
}
