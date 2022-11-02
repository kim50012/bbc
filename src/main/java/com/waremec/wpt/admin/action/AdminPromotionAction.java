package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.wpt.admin.domain.AdminPromotion;
import com.waremec.wpt.admin.service.PromotionService;
             
@Controller("adminPromotionAction")
@Scope(ScopeType.prototype)
public class AdminPromotionAction extends BaseAction implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");
	
	private String shopId = "";
	private String userId = "";
	private String proId = "";
	private String proTitle = "";
	private String proStartDt = "";
	private String proEndDt = "";
	private String proImgIdF = "";
	private String proImgIdS = "";
	private String proAbs = "";
	private String proDesc = "";
	private String pageEntity = "";
	private String proType = "";
	private String winType = "";
	private String mesIds = "";
	private String optionId = "";
	
	private File[] files = null;
	private String logoFileName = "";
	private ServletContext context = null;
	

	@Resource
	private PromotionService promotionService;

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 * @exception: 促销管理一主页面加载
	 */
	public String promotionList() throws UnsupportedEncodingException, ParseException {

		shopId = getBackSessionShopId().toString();
		String strTitle = "";
		
		if (proStartDt.equals("") && proEndDt.equals("")) {
			
			proStartDt = getMinMonthDate(getNowDate());
			proEndDt = getMaxMonthDate(getNowDate());
		}
		
		if (!proTitle.equals("")) {
			
			strTitle = URLDecoder.decode(proTitle, "UTF-8");
		}

		AdminPromotion proIn = new AdminPromotion();
		proIn.setShopId_IN(Integer.parseInt(shopId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!strTitle.equals("")) {
			
			proIn.setProTitle_IN(strTitle);
		}
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!proType.equals("")) {
			
			proIn.setProType_IN(proType);
		}
		List<AdminPromotion> reProList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProList", proIn);

		
		int pageUnitCount = promotionService.selectCount("AdminPromotion.selectProListCount", proIn);

		PageData page = new PageData();
		if(!reProList.isEmpty()){
			int totalCount =pageUnitCount;
			page = new PageData(pageCurr,pageUnit, totalCount , reProList);
		 
		}
		
		request.put("reProList", reProList);
		request.put("page", page);
		return "promotionList";
	}

	public String promotionListFragment() throws Exception{
		shopId = getBackSessionShopId().toString();
		String strTitle = "";
		
		if (proStartDt.equals("") && proEndDt.equals("")) {
			
			proStartDt = getMinMonthDate(getNowDate());
			proEndDt = getMaxMonthDate(getNowDate());
		}
		
		if (!proTitle.equals("")) {
			
			strTitle = URLDecoder.decode(proTitle, "UTF-8");
		}

		AdminPromotion proIn = new AdminPromotion();
		proIn.setShopId_IN(Integer.parseInt(shopId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!strTitle.equals("")) {
			
			proIn.setProTitle_IN(strTitle);
		}
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!proType.equals("")) {
			
			proIn.setProType_IN(proType);
		}
		List<AdminPromotion> reProList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProList", proIn);

		
		int pageUnitCount = promotionService.selectCount("AdminPromotion.selectProListCount", proIn);
		int pageCount = 0;

		if (pageEntity.equals("") || pageEntity == null) {
			
			pageCount = pageUnitCount / pageUnit + (pageUnitCount % pageUnit == 0 ? 0 : 1);
		} else {
			
			pageCount = pageUnitCount / Integer.parseInt(pageEntity) + (pageUnitCount % Integer.parseInt(pageEntity) == 0 ? 0 : 1);
		}

		PageData page = new PageData();
		if(!reProList.isEmpty()){
			int totalCount =pageUnitCount;
			page = new PageData(pageCurr,pageUnit, totalCount , reProList);
		 
		}
		
		request.put("reProList", reProList);
		request.put("page", page);
		return "promotionListFragment";
	}
	
	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: 促销管理一促销活动新建或编辑-页面加载
	 */
	public String promotionPublish() throws UnsupportedEncodingException {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String strTitle = "";
		
		if (!proTitle.equals("")) {
			
			strTitle = new String(proTitle.getBytes("ISO-8859-1"),"UTF-8");
		}

		if (!proId.equals("")) {
			
			AdminPromotion rePro = null;
			AdminPromotion proIn = new AdminPromotion();
			proIn.setShopId_IN(Integer.parseInt(shopId));
			proIn.setUserId_IN(userId);
			proIn.setProId_IN(Integer.parseInt(proId));
			List<AdminPromotion> reProList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectPro", proIn);
			if (reProList.size() > 0) {
				
				rePro = reProList.get(0);
				request.put("proId", rePro.getPRO_ID());
				request.put("proTitle", rePro.getPRO_TITLE());
				request.put("proStartDt", rePro.getPRO_START_DT_PC());
				request.put("proEndDt", rePro.getPRO_END_DT_PC());
				request.put("proPicUrl", rePro.getPRO_PIC_URL());
				request.put("proPicDltUrl", rePro.getPRO_PIC_DLT_URL());
				request.put("proAbs", rePro.getPRO_ABSTRACT());
				request.put("proDesc", rePro.getPRO_DESC());
				
				request.put("PproTitle", strTitle);
				request.put("PproStartDt", proStartDt);
				request.put("PproEndDt", proEndDt);
				request.put("PproType", proType);
			}
		} else {
			request.put("proId", "");
			request.put("proTitle", "");
			request.put("proStartDt", "");
			request.put("proEndDt", "");
			request.put("proPicUrl", "");
			request.put("proPicDltUrl", "");
			request.put("proAbs", "");
			request.put("proDesc", "");
			
			request.put("PproTitle", strTitle);
			request.put("PproStartDt", proStartDt);
			request.put("PproEndDt", proEndDt);
			request.put("PproType", proType);
		}

		return "promotionPublish";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 促销管理一促销活动新建或编辑-保存
	 */
	public String proSave() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String ret = "SUCCESS";

		try {

			AdminPromotion proIn = new AdminPromotion();
			proIn.setShopId_IN(Integer.parseInt(shopId));
			proIn.setUserId_IN(userId);
			proIn.setProTitle_IN(proTitle);
			proIn.setProStartDt_IN(proStartDt);
			proIn.setProEndDt_IN(proEndDt);
			if (!proImgIdF.equals("")) {
				proIn.setProPicIdF_IN(Integer.parseInt(proImgIdF));
			}
			if (!proImgIdS.equals("")) {
				proIn.setProPicIdS_IN(Integer.parseInt(proImgIdS));
			}
			proIn.setProAbs_IN(proAbs);
			proIn.setProDesc_IN(proDesc);
			
			if (proId.equals("")) {
				
				promotionService.insertDomain("AdminPromotion.proSave", proIn);
			} else {
				
				proIn.setProId_IN(Integer.parseInt(proId));
				promotionService.insertDomain("AdminPromotion.proModify", proIn);
			}

		} catch (Exception e) {
			ret = "FAIL";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("result", ret);
		renderJSON(map);

//		JSONObject jo = new JSONObject();
//		jo.put("result", ret);
//
//		renderHtml(jo.toString());

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 促销留言一页面加载
	 */
	public String promotionMessList() {

		AdminPromotion proIn = new AdminPromotion();
		proIn.setProId_IN(Integer.parseInt(proId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!winType.equals("")) {
			
			proIn.setWinType_IN(winType);
		}
		List<AdminPromotion> reProMessList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessList", proIn);
		
		request.put("reProMessList", reProMessList);
		request.put("proId", proId);
		request.put("proStartDt", proStartDt);
		request.put("proEndDt", proEndDt);


		PageData page = new PageData();
		if(!reProMessList.isEmpty()){
			int totalCount = (Integer)reProMessList.get(0).getCOUNT_TOTAL();
			page = new PageData(pageCurr,pageUnit, totalCount , reProMessList);
		 
		}
		request.put("page", page);
		return "promotionMessList";
	}
	
	public String promotionMessListFragment() {

		AdminPromotion proIn = new AdminPromotion();
		proIn.setProId_IN(Integer.parseInt(proId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!winType.equals("")) {
			
			proIn.setWinType_IN(winType);
		}
		List<AdminPromotion> reProMessList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessList", proIn);

		
		request.put("reProMessList", reProMessList);
		request.put("proId", proId);
		PageData page = new PageData();
		if(!reProMessList.isEmpty()){
			int totalCount = (Integer)reProMessList.get(0).getCOUNT_TOTAL();
			page = new PageData(pageCurr,pageUnit, totalCount , reProMessList);
		 
		}
		request.put("page", page);
		return "promotionMessListFragment";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 留言信息一页面加载
	 */
	public String ajaxPromotionMessList() {

		//AdminPromotion reProId = null;
		AdminPromotion proIn = new AdminPromotion();
		proIn.setProId_IN(Integer.parseInt(proId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!winType.equals("")) {
			
			proIn.setWinType_IN(winType);
		}
		List<AdminPromotion> reProMessList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessList", proIn);
		
		int pageUnitCount = promotionService.selectCount("AdminPromotion.selectProMessListCount", proIn);
		int pageCount = 0;

		if (pageEntity.equals("") || pageEntity == null) {
			
			pageCount = pageUnitCount / pageUnit + (pageUnitCount % pageUnit == 0 ? 0 : 1);
		} else {
			
			pageCount = pageUnitCount / Integer.parseInt(pageEntity) + (pageUnitCount % Integer.parseInt(pageEntity) == 0 ? 0 : 1);
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reProMessList", reProMessList);
		returnMap.put("pageCount", pageCount);
		returnMap.put("pageCurr", pageCurr);
		returnMap.put("proId", proId);
		returnMap.put("proStartDt", proStartDt);
		returnMap.put("proEndDt", proEndDt);
		returnMap.put("winType", winType);

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 中奖信息一页面加载
	 */
	public String ajaxPromotionWinList() {

		AdminPromotion reProId = null;
		AdminPromotion proIn = new AdminPromotion();
		proIn.setProId_IN(Integer.parseInt(proId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!winType.equals("")) {
			
			proIn.setWinType_IN(winType);
		}
		List<AdminPromotion> reProWinList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessList", proIn);
		
		int pageUnitCount = promotionService.selectCount("AdminPromotion.selectProMessListCount", proIn);
		int pageCount = 0;

		if (pageEntity.equals("") || pageEntity == null) {
			
			pageCount = pageUnitCount / pageUnit + (pageUnitCount % pageUnit == 0 ? 0 : 1);
		} else {
			
			pageCount = pageUnitCount / Integer.parseInt(pageEntity) + (pageUnitCount % Integer.parseInt(pageEntity) == 0 ? 0 : 1);
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("reProWinList", reProWinList);
		returnMap.put("pageCount", pageCount);
		returnMap.put("pageCurr", pageCurr);
		if (reProWinList.size() > 0) {
			reProId = reProWinList.get(0);
			returnMap.put("proId", reProId.getPRO_ID());
		}

		renderJSON(returnMap);

		return NONE;
	}

	public String promotionWinList() {

		AdminPromotion proIn = new AdminPromotion();
		proIn.setProId_IN(Integer.parseInt(proId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!winType.equals("")) {
			
			proIn.setWinType_IN(winType);
		}
		List<AdminPromotion> reProWinList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessList", proIn);
		
		int pageUnitCount = promotionService.selectCount("AdminPromotion.selectProMessListCount", proIn);
		
		PageData page = new PageData();
		if(!reProWinList.isEmpty()){
			int totalCount = pageUnitCount;
			page = new PageData(pageCurr,pageUnit, totalCount , reProWinList);
		 
		}
		request.put("reProWinList", reProWinList);
		request.put("page", page);

		return "promotionWinList";
	}
	public String promotionWinListFragment() {

		AdminPromotion proIn = new AdminPromotion();
		proIn.setProId_IN(Integer.parseInt(proId));
		proIn.setPageCurr(pageCurr);
		proIn.setPageUint(pageUnit);
		if (!proStartDt.equals("")) {
			
			proIn.setProStartDt_IN(proStartDt);
		}
		if (!proEndDt.equals("")) {
			
			proIn.setProEndDt_IN(proEndDt);
		}
		if (!winType.equals("")) {
			
			proIn.setWinType_IN(winType);
		}
		List<AdminPromotion> reProWinList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessList", proIn);
		
		int pageUnitCount = promotionService.selectCount("AdminPromotion.selectProMessListCount", proIn);
		
		PageData page = new PageData();
		if(!reProWinList.isEmpty()){
			int totalCount = pageUnitCount;
			page = new PageData(pageCurr,pageUnit, totalCount , reProWinList);
		 
		}
		request.put("reProWinList", reProWinList);
		request.put("page", page);

		return "promotionWinListFragment";
	}
	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 促销管理一发布中奖信息-保存
	 */
	public String winSave() {

		userId = getBackSessionUserId();
		String ret = "SUCCESS";
		String[] strMesId = mesIds.split(",");

		try {
			
			for (int i = 0; i < strMesId.length; i++) {

				AdminPromotion proIn = new AdminPromotion();
				proIn.setProId_IN(Integer.parseInt(proId));
				proIn.setMesId_IN(Integer.parseInt(strMesId[i]));
				proIn.setUserId_IN(userId);
				promotionService.insertDomain("AdminPromotion.winSave", proIn);
			}

		} catch (Exception e) {
			ret = "FAIL";
		}

		Map<String,Object> map=new HashMap<String,Object>();
		map.put("result", ret);
		renderJSON(map);
		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 促销管理一发布中奖信息-发布
	 */
	public String publishSave() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String ret = "SUCCESS";

		try {

			AdminPromotion proIn = new AdminPromotion();
			proIn.setShopId_IN(Integer.parseInt(shopId));
			proIn.setProId_IN(Integer.parseInt(proId));
			proIn.setUserId_IN(userId);
			
			promotionService.insertDomain("AdminPromotion.winPublishSave", proIn);

		} catch (Exception e) {
			ret = "FAIL";
		}

//		JSONObject jo = new JSONObject();
//		jo.put("result", ret);
//
//		renderHtml(jo.toString());
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("result", ret);
		renderJSON(map);
		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 所有订单一导出Excel
	 */
	public String exportExcel() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();

		String ret = "SUCCESS";

		try {
			
			AdminPromotion proIn = new AdminPromotion();
			proIn.setProId_IN(Integer.parseInt(proId));
			if (!proStartDt.equals("")) {
				proIn.setProStartDt_IN(proStartDt);
			}
			if (!proEndDt.equals("")) {
				proIn.setProEndDt_IN(proEndDt);
			}
			if (!winType.equals("")) {
				proIn.setWinType_IN(winType);
			}
			proIn.setUserId_IN(userId);
			List<AdminPromotion> reProWinList = (List<AdminPromotion>) promotionService.selectProList("AdminPromotion.selectProMessExcelList", proIn);
			

			if (reProWinList.size() > 0) {

				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				// 清空输出流
				response.reset();
				response.setContentType("application/vnd.ms-excel;charset=utf-8");
				// 设定输出文件头
				response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(getLabel("中奖者信息") + getNowDate2(), "UTF-8") + ".xls");
				// 创建工作薄
				WritableWorkbook workbook = Workbook.createWorkbook(os);
				// 创建新的一页
				WritableSheet sheet = workbook.createSheet("First Sheet", 0);
				// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
				sheet.mergeCells(0, 0, 3, 0);
				// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
				WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
				// 生成一个单元格样式控制对象
				WritableCellFormat titleFormate = new WritableCellFormat(bold);
				// 单元格中的内容水平方向居中
				titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
				// 单元格的内容垂直方向居中
				titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
				// 设置第一行合并单元格的文本
				Label title = new Label(0, 0, getLabel("中奖者信息"), titleFormate);
				// 设置第一行的高度
				sheet.setRowView(0, 400, false);
				// 工作表中添加
				sheet.addCell(title);
				// 添加内容
				int row = 1;
				int col = 0;
				String[] titles = {"ID",getLabel("名称"),getLabel("留言时间"),getLabel("留言内容")};
				for (int i = 0; i < titles.length; i++) {
					// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
					sheet.addCell(new Label(col++, row, titles[i]));
				}
			
			    row = 2;
			    col = 0;
				for (int i = 0 ; i < reProWinList.size(); i++) {
					
					AdminPromotion item = reProWinList.get(i);
					sheet.addCell(new Label(col++, row, item.getMES_ID(),titleFormate));
					sheet.addCell(new Label(col++, row, item.getMES_NM(),titleFormate));
					sheet.addCell(new Label(col++, row, item.getMES_DT_PC(),titleFormate));
					sheet.addCell(new Label(col++, row, item.getMES_CONTENT(),titleFormate));
					
					row++;
					col = 0;
				}

				// 把创建的内容写入到输出流中，并关闭输出流
				workbook.write();
				workbook.close();
				os.close();

			} else {
				HttpServletResponse response = ServletActionContext.getResponse();
				OutputStream os = new BufferedOutputStream(response.getOutputStream());
				// 清空输出流
				response.reset();
				response.setContentType("application/vnd.ms-excel;charset=utf-8");
				// 设定输出文件头
				response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode("中奖者信息" + getNowDate2(), "UTF-8") + ".xls");
				// 创建工作薄
				WritableWorkbook workbook = Workbook.createWorkbook(os);
				// 创建新的一页
				WritableSheet sheet = workbook.createSheet("First Sheet", 0);
				// 添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
				sheet.mergeCells(0, 0, 3, 0);
				// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
				WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);
				// 生成一个单元格样式控制对象
				WritableCellFormat titleFormate = new WritableCellFormat(bold);
				// 单元格中的内容水平方向居中
				titleFormate.setAlignment(jxl.format.Alignment.CENTRE);
				// 单元格的内容垂直方向居中
				titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
				// 设置第一行合并单元格的文本
				Label title = new Label(0, 0, getLabel("中奖者信息"), titleFormate);
				// 设置第一行的高度
				sheet.setRowView(0, 400, false);
				// 工作表中添加
				sheet.addCell(title);
				// 添加内容
				int row = 1;
				int col = 0;
				String[] titles = {"ID",getLabel("名称"),getLabel("留言时间"),getLabel("留言内容")};
				for (int i = 0; i < titles.length; i++) {
					// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
					sheet.addCell(new Label(col++, row, titles[i]));
				}

				// 把创建的内容写入到输出流中，并关闭输出流
				workbook.write();
				workbook.close();
				os.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
			ret = "FAIL";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 促销管理一主页面-运行或停止
	 */
	public String ajaxRunOpton() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String ret = "SUCCESS";

		try {
			
			AdminPromotion proIn = new AdminPromotion();
			proIn.setShopId_IN(Integer.parseInt(shopId));
			proIn.setProId_IN(Integer.parseInt(proId));
			proIn.setOptionId_IN(optionId);
			proIn.setUserId_IN(userId);
			promotionService.insertDomain("AdminPromotion.runOptionSave", proIn);

		} catch (Exception e) {
			ret = "FAIL";
		}
		Map<String,Object> map=new HashMap<String,Object>();
//		JSONObject jo = new JSONObject();
		map.put("result", ret);
		renderJSON(map);
//		renderHtml(jo.toString());

		return NONE;
	}

    /** 
     * @param  		null
     * @return		2015-01-01
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	获取当前日期 
     */ 
	public static String getNowDate(){
		return dateFormat.format(new Date());  
    }

    /** 
     * @param  		null
     * @return		20150101
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	获取当前日期 
     */
	public static String getNowDate2(){
		return dateFormat2.format(new Date());  
    }
	
    /**  
     * @param		String date 
     * @return		
     * @throws		ParseException 
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	获取月份起始日期 
     */  
	public static String getMinMonthDate(String date) throws ParseException { 
    	
        Calendar calendar = Calendar.getInstance();  
        calendar.setTime(dateFormat.parse(date));  
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
        
        return dateFormat.format(calendar.getTime());  
    } 
	
    /**  
     * @param		String date 
     * @return		
     * @throws		ParseException 
	 * @author:		liyang
	 * @version:	v1.0
	 * @exception:	获取月份结束日期 
     */ 
	public static String getMaxMonthDate(String date) throws ParseException {  
		
		Calendar calendar = Calendar.getInstance();  
		calendar.setTime(dateFormat.parse(date));  
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		return dateFormat.format(calendar.getTime());  
	}   

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProTitle() {
		return proTitle;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	public String getProDesc() {
		return proDesc;
	}

	public void setProDesc(String proDesc) {
		this.proDesc = proDesc;
	}

	public String getProStartDt() {
		return proStartDt;
	}

	public void setProStartDt(String proStartDt) {
		this.proStartDt = proStartDt;
	}

	public String getProEndDt() {
		return proEndDt;
	}

	public void setProEndDt(String proEndDt) {
		this.proEndDt = proEndDt;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}

	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		
	}

	public PromotionService getPromotionService() {
		return promotionService;
	}

	public void setPromotionService(PromotionService promotionService) {
		this.promotionService = promotionService;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getWinType() {
		return winType;
	}

	public void setWinType(String winType) {
		this.winType = winType;
	}

	public String getMesIds() {
		return mesIds;
	}

	public void setMesIds(String mesIds) {
		this.mesIds = mesIds;
	}

	public String getOptionId() {
		return optionId;
	}

	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String getProImgIdF() {
		return proImgIdF;
	}

	public void setProImgIdF(String proImgIdF) {
		this.proImgIdF = proImgIdF;
	}

	public String getProImgIdS() {
		return proImgIdS;
	}

	public void setProImgIdS(String proImgIdS) {
		this.proImgIdS = proImgIdS;
	}

	public String getProAbs() {
		return proAbs;
	}

	public void setProAbs(String proAbs) {
		this.proAbs = proAbs;
	}

}
