package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
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

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.domain.AdminGoodsDisplayClass;
import com.waremec.wpt.admin.domain.AdminHuman;
import com.waremec.wpt.admin.service.HumanService;

@Controller("adminReplyControlAction")
@Scope(ScopeType.prototype)
public class AdminReplyControlAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private int shopId;
	private String lectId;
	private int lectReplyType;
	private String startDate;
	private String endDate;
	private int lectReplyId;
	@Resource
	private HumanService humanService;
	public String replyControl(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("lectId", StringUtil.emptyToNull(lectId));
		map.put("shopId", getBackSessionShopId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit",pageUnit);
		map.put("lectReplyType", 2);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate",StringUtil.emptyToNull(endDate));
		List<Map<String,Object>> replylist=commonService.selectList("ApplyManage.lectureReplySelect",map);
		PageData page = new PageData();
		if (!replylist.isEmpty()) {
			int totalCount=(Integer)(replylist.get(0).get("TOTAL_CNT"));
			for(int i=0;i<replylist.size();i++){
				MapUtil.convertClob2String(replylist.get(i));
			}
			page = new PageData(pageCurr,pageUnit, totalCount , replylist);
		}
		request.put("page", page);
		AdminHuman human = new AdminHuman();
		human.setSHOP_ID(getBackSessionShopId());
		human.setUSER_ID(getBackSessionUserId());			
		human.setPageCurr(pageCurr);
		human.setPageUnit(10000);

		List<AdminHuman> getList = (List<AdminHuman>) humanService.getListDomain("AdminHuman.getlist", human);
		request.put("getList", getList);
		request.put("lectId", lectId);
		request.put("replylist", replylist);
		return "replyControl";
	}
	public String replyControlListFragment(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("lectId", StringUtil.emptyToNull(lectId));
		map.put("shopId", getBackSessionShopId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit",pageUnit);
		map.put("lectReplyType", 2);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate",StringUtil.emptyToNull(endDate));
		List<Map<String,Object>> replylist=commonService.selectList("ApplyManage.lectureReplySelect",map);
		PageData page = new PageData();
		if (!replylist.isEmpty()) {
			int totalCount=(Integer)(replylist.get(0).get("TOTAL_CNT"));
			for(int i=0;i<replylist.size();i++){
				MapUtil.convertClob2String(replylist.get(i));
			}
			page = new PageData(pageCurr,pageUnit, totalCount , replylist);
		}
		request.put("page", page);
		request.put("replylist", replylist);
		return "replyControlListFragment";
	}
	//??????????????????????????????
		public String deleteReplyMsg(){
			shopId = getBackSessionShopId();
			//????????????????????????????????????????????????
			String ret="success";
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("lectId", lectId);
			map.put("shopId", getBackSessionShopId());
			map.put("lectReplyId", lectReplyId);
			Map<String,Object> mapReturn= commonService.select("ApplyManage.deleteReplyMsg", map);
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("map", mapReturn);
			renderJSON(returnMap);
			return NONE;
		}
		//???????????????EXCEL??????
	public String createExcel(){
		shopId = getBackSessionShopId();
		String ret="success";
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("lectId", StringUtil.emptyToNull(lectId));
		map.put("shopId", getBackSessionShopId());
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", 100000);
		map.put("lectReplyType", 2);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate",StringUtil.emptyToNull(endDate));
		List<Map<String,Object>> list=commonService.selectList("ApplyManage.lectureReplySelect",map);
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os= new BufferedOutputStream(response.getOutputStream());  
            response.reset();// ???????????????   
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode(getLabel("????????????"), "UTF-8")+".xls");// ?????????????????????
			//???????????????
	        WritableWorkbook workbook = Workbook.createWorkbook(os);
	        //??????????????????
	        WritableSheet sheet = workbook.createSheet("First Sheet",0);
	        
	        sheet.mergeCells(0, 0,3, 0);//?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
	        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//?????????????????????????????????,?????????Arial,???????????????10,??????????????????
	        WritableCellFormat titleFormate = new WritableCellFormat(bold);//???????????????????????????????????????
	        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//???????????????????????????????????????
	        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//????????????????????????????????????
	        Label[] label=new Label[4];
	        int length=list.size();
        	Label title = new Label(0,0,getLabel("??????????????????"),titleFormate);
	        sheet.setRowView(0, 400, false);//????????????????????????
	        sheet.addCell(title);
	        //????????????????????????,????????????????????????????????????????????????????????????????????????????????????????????????????????????
	        label[0]=new Label(0,1,getLabel("????????????"));
	        sheet.addCell(label[0]);
	        label[1]=new Label(1,1,"ID");
	        sheet.addCell(label[1]);
	        label[2]=new Label(2,1,getLabel("????????????"));
	        sheet.addCell(label[2]);
	        label[3]=new Label(3,1,getLabel("????????????"));
	        
	        for(int i=0;i<length;i++){
	        	label=new Label[4];
	 	        label[0]=new Label(0,i+2,(list.get(i).get("CREATE_DT").toString()).substring(0,10));
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1,i+2,(String)list.get(i).get("LECT_REPLY_NM"));
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2,i+2,(String) list.get(i).get("LECT_NM"));
	 	        sheet.addCell(label[2]);
	 	        label[3]=new Label(3,i+2,(String) list.get(i).get("REPLY_DESC"));
	 	        sheet.addCell(label[3]);
	        }
	        //????????????????????????????????????????????????????????????
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
			
	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getLectReplyType() {
		return lectReplyType;
	}

	public void setLectReplyType(int lectReplyType) {
		this.lectReplyType = lectReplyType;
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
	public int getLectReplyId() {
		return lectReplyId;
	}
	public void setLectReplyId(int lectReplyId) {
		this.lectReplyId = lectReplyId;
	}
	public String getLectId() {
		return lectId;
	}
	public void setLectId(String lectId) {
		this.lectId = lectId;
	}
}
