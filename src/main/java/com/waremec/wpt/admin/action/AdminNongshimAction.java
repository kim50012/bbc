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
import com.waremec.framework.utilities.StringUtil;

@Controller("adminNongshimAction")
@Scope(ScopeType.prototype)
public class AdminNongshimAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	private String shopId = "";
	private String userId = "";
	private String startDt = "";
	private String endDt = "";
	private String pageEntity = "";
 
	public String bbsResultList() {
		
		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		
		if (StringUtils.isBlank(startDt)) {
			startDt = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date((new Date()).getTime() - 1000 * 60 * 60 * 24 * 7));
		}
		
	
		if (StringUtils.isBlank(endDt)) {	
			endDt = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date((new Date()).getTime() - 1000 * 60 * 60 * 24 * 1));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDt", StringUtil.emptyToNull(startDt));
		map.put("endDt", StringUtil.emptyToNull(endDt));
		map.put("jobType", "LIST");
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String,Object>> list = commonService.selectList("AdminNongshim.getList", map);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		request.put("list", list);
		request.put("startDt", startDt);
	 	request.put("endDt", endDt);
		 
		return "bbsResultList";
	}
	public String bbsResultListFragment(){

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		
		if (StringUtils.isBlank(startDt)) {
			startDt = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date((new Date()).getTime() - 1000 * 60 * 60 * 24 * 7));
		}
		
	
		if (StringUtils.isBlank(endDt)) {	
			endDt = (new SimpleDateFormat("yyyy-MM-dd")).format(new Date((new Date()).getTime() - 1000 * 60 * 60 * 24 * 1));
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDt", StringUtil.emptyToNull(startDt));
		map.put("endDt", StringUtil.emptyToNull(endDt));
		map.put("jobType", "LIST");
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		
		List<Map<String,Object>> list = commonService.selectList("AdminNongshim.getList", map);
		
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (Integer) list.get(0).get("TOTAL_CNT");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		request.put("list", list);
		request.put("startDt", startDt);
	 	request.put("endDt", endDt);
		 
		return "bbsResultListFragment";
	}
	// ???????????????EXCEL??????
	public String resultDown() {
		
		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		
		String ret = "success";

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("startDt", StringUtil.emptyToNull(startDt));
		map.put("endDt", StringUtil.emptyToNull(endDt));
		map.put("jobType", "Excel");
		
		List<Map<String,Object>> list = commonService.selectList("AdminNongshim.getList", map);
		String statusNm = StringUtils.trimToNull(getLabel("BBS????????????"));
		try {
			
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();// ???????????????
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(statusNm, "UTF-8") + ".xls");// ?????????????????????
			// ???????????????
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			// ??????????????????
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);

			sheet.mergeCells(0, 0, 6, 0);// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);// ?????????????????????????????????,?????????Arial,???????????????10,??????????????????
			WritableCellFormat titleFormate = new WritableCellFormat(bold);// ???????????????????????????????????????
			titleFormate.setAlignment(jxl.format.Alignment.CENTRE);// ???????????????????????????????????????
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);// ????????????????????????????????????
			Label[] label = new Label[7];
			Label title = new Label(0, 0,statusNm, titleFormate);
			sheet.setRowView(0, 400, false);// ????????????????????????
			sheet.addCell(title);
			label[0] = new Label(0, 1, getLabel("??????"));
			sheet.addCell(label[0]);
			label[1] = new Label(1, 1, getLabel("??????"));
			sheet.addCell(label[1]);
			label[2] = new Label(2, 1, getLabel("????????????"));
			sheet.addCell(label[2]);
			label[3] = new Label(3, 1, getLabel("????????????"));
			sheet.addCell(label[3]);
			label[4] = new Label(4, 1, getLabel("Email"));
			sheet.addCell(label[4]);
			label[5] = new Label(5, 1, getLabel("????????????"));
			sheet.addCell(label[5]);
			label[6] = new Label(6, 1, getLabel("??????"));
			sheet.addCell(label[6]);
			
			int length = list.size();
			try {
				
				for (int i = 0; i < length; i++) {
					//System.out.println("========" + i + "=========");
					label = new Label[7];
					label[0] = new Label(0, i + 2, (String)list.get(i).get("CUST_NM"));
					sheet.addCell(label[0]);
					label[1] = new Label(1, i + 2, (String)list.get(i).get("BIRTHDAY"));
					sheet.addCell(label[1]);
					label[2] = new Label(2, i + 2, (String)list.get(i).get("MOBILE_NO"));
					sheet.addCell(label[2]);
					label[3] = new Label(3, i + 2, (String) list.get(i).get("ADRESS"));
					sheet.addCell(label[3]);
					label[4] = new Label(4, i + 2, (String)list.get(i).get("EMAIL"));
					sheet.addCell(label[4]);
					label[5] = new Label(5, i + 2, (String)list.get(i).get("CREATE_DT"));
					sheet.addCell(label[5]);
					label[6] = new Label(6, i + 2, (String)list.get(i).get("REASON"));
					sheet.addCell(label[6]);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
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

	public String getStartDt() {
		return startDt;
	}

	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}

	public String getEndDt() {
		return endDt;
	}

	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}


}
