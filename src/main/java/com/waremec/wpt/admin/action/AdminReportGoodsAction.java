package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
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

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;

@Controller("adminReportGoodsAction")
@Scope(ScopeType.prototype)
public class AdminReportGoodsAction extends BaseAction {
	private static final long serialVersionUID = 1L;

	// 存储店铺ID
	private Integer shopId;
	// 存储用户的Id
	private String userId = "";
	Date now = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");// 可以方便地修改日期格
	// 存储查询结束日期
	private String endDate = dateFormat.format(now);
	// 存储查询开始日期
	Date lw = new Date(now.getTime() - 1000 * 60 * 60 * 24 * 6);
	private String startDate = dateFormat.format(lw);

	// 用于存储实际每页多少条数据

	public String goodsSummary() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		// 查询出当前页数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		// --销量
		List<Map<String, Object>> saleslist = commonService.selectList("GoodsStatistics.selectSalesList", map);
		// --点击量
		List<Map<String, Object>> clicklist = commonService.selectList("GoodsStatistics.selectClicksList", map);
		request.put("startDate", startDate);
		request.put("endDate", endDate);

		PageData page = new PageData();
		if (!saleslist.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(saleslist.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, saleslist);
		}

		PageData page1 = new PageData();
		if (!clicklist.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(clicklist.get(0).get("TOTAL_CNT"));
			page1 = new PageData(pageCurr, pageUnit, totalCount, clicklist);
		}
		request.put("page", page);
		request.put("page1", page1);

		return "goodsSummary";
	}

	/** 
	*  商品销量&销售金额分页
	* @return
	*/
	public String goodsListFragment() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		// 查询出当前页数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		// --销量
		List<Map<String, Object>> list = commonService.selectList("GoodsStatistics.selectSalesList", map);

		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, list);
		}
		request.put("page", page);
		
		return "goodsListFragment";
	}

	/** 
	* 点击量&销售量分页
	* @return
	*/
	public String clicksListFragment() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		// 查询出当前页数据
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		// --点击量
		List<Map<String, Object>> list = commonService.selectList("GoodsStatistics.selectClicksList", map);

		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr, pageUnit, totalCount, list);
		}
		request.put("page", page);
		
		return "clicksListFragment";
	}

	// 走势图信息查询
	public String getWeeklyData() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		// --销量
		List<Map<String, Object>> salesList = commonService.selectList("GoodsStatistics.selectSalesList", map);
		// --点击量
		List<Map<String, Object>> clickList = commonService.selectList("GoodsStatistics.selectClicksList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("salesList", salesList);
		returnMap.put("clickList", clickList);
		renderJSON(returnMap);
		return NONE;
	}

	// 保存导出的EXCEL文件--销量
	public String downSalesExcel() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		boolean success = true;
		String err_msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", 1);
		map.put("pageUnit", 10000);
		// --销量
		List<Map<String, Object>> list = commonService.selectList("GoodsStatistics.selectSalesList", map);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();// 清空输出流
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			String fileNowName = getLabel("商品销量");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(fileNowName.replaceAll("\\s*", ""), "UTF-8") + ".xls");// 设定输出文件头
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// 创建新的一页
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);

			sheet.mergeCells(0, 0, 3, 0);// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableCellFormat titleFormate = new WritableCellFormat(bold);// 生成一个单元格样式控制对象
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// 单元格中的内容水平方向居中
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 单元格的内容垂直方向居中
			int length = list.size();
			Label[] label = new Label[4];
			Label title = new Label(0, 0, getLabel("商品销量") + "&" + getLabel("销售金额"), titleFormate);
			sheet.setRowView(0, 400, false);// 设置第一行的高度
			sheet.addCell(title);
			label[0] = new Label(0, 1, getLabel("销量排行"));
			sheet.addCell(label[0]);
			label[1] = new Label(1, 1, getLabel("商品名"));
			sheet.addCell(label[1]);
			label[2] = new Label(2, 1, getLabel("销售量"));
			sheet.addCell(label[2]);
			label[3] = new Label(3, 1, getLabel("销售金额"));
			sheet.addCell(label[3]);
			for (int i = 0; i < length; i++) {
				label = new Label[4];
				label[0] = new Label(0, i + 2, list.get(i).get("ID").toString());
				sheet.addCell(label[0]);
				label[1] = new Label(1, i + 2, list.get(i).get("GOODS_NM").toString());
				sheet.addCell(label[1]);
				if (list.get(i).get("GOODS_QTY") == "" || list.get(i).get("GOODS_QTY") == null) {
					label[2] = new Label(2, i + 2, "0");
				} else {
					label[2] = new Label(2, i + 2, list.get(i).get("GOODS_QTY").toString());
				}
				sheet.addCell(label[2]);
				label[3] = new Label(3, i + 2, list.get(i).get("PRICE_UNIT_SUM").toString());
				sheet.addCell(label[3]);
			}
			// 把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
		renderJSON(returnMap);
		return NONE;
	}

	// 保存导出的EXCEL文件--点击量
	public String downClickExcel() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId();
		boolean success = true;
		String err_msg = "";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("pageCurr", 1);
		map.put("pageUnit", 10000);
		// --点击量
		List<Map<String, Object>> list = commonService.selectList("GoodsStatistics.selectClicksList", map);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();// 清空输出流
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			String fileNowName = getLabel("商品点击量");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(fileNowName.replaceAll("\\s*", ""), "UTF-8") + ".xls");// 设定输出文件头
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// 创建新的一页
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);

			sheet.mergeCells(0, 0, 3, 0);// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableCellFormat titleFormate = new WritableCellFormat(bold);// 生成一个单元格样式控制对象
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// 单元格中的内容水平方向居中
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// 单元格的内容垂直方向居中
			int length = list.size();
			Label[] label = new Label[4];
			Label title = new Label(0, 0, getLabel("点击量") + "&" + getLabel("销售量"), titleFormate);
			sheet.setRowView(0, 400, false);// 设置第一行的高度
			sheet.addCell(title);

			label[0] = new Label(0, 1, getLabel("点击量排行"));
			sheet.addCell(label[0]);
			label[1] = new Label(1, 1, getLabel("商品名"));
			sheet.addCell(label[1]);
			label[2] = new Label(2, 1, getLabel("点击量"));
			sheet.addCell(label[2]);
			label[3] = new Label(3, 1, getLabel("销售量"));
			sheet.addCell(label[3]);

			for (int i = 0; i < length; i++) {
				label = new Label[4];
				label[0] = new Label(0, i + 2, list.get(i).get("ID").toString());
				sheet.addCell(label[0]);
				label[1] = new Label(1, i + 2, list.get(i).get("GOODS_NM").toString());
				sheet.addCell(label[1]);
				label[2] = new Label(2, i + 2, list.get(i).get("CLICKS").toString());
				sheet.addCell(label[2]);
				if (list.get(i).get("GOODS_QTY") == "" || list.get(i).get("GOODS_QTY") == null) {
					label[3] = new Label(3, i + 2, "0");
				} else {
					label[3] = new Label(3, i + 2, list.get(i).get("GOODS_QTY").toString());
				}
				sheet.addCell(label[3]);
			}
			// 把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", success);
		returnMap.put("err_msg", err_msg);
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
