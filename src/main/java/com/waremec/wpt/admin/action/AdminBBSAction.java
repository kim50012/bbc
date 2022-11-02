package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.util.Calendar;
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
import com.waremec.framework.utilities.MapUtil;
import com.waremec.framework.utilities.StringUtil;

@Controller("adminBBSAction")
@Scope(ScopeType.prototype)
public class AdminBBSAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	//存储店铺ID
	private String shopId="";
	//存储用户的Id
	private String userId="";
	//bbsId
	private String bbsId="";
	//状态
	private String bbsSts="";
	//起始时间
	private String startDt="";
	//结束时间
	private String endDt="";
	//题目
	private String title="";
	//公告类型
	private String bbsType="";
	
	private String pageEntity="";
//	private int pageUnit=30;
	
	private String tbNm="";
	private String fdNm="";
	private String cdId="";
	private String cdVal="";
	private String cdDesc="";
	private String isDelete="";
	private String jobType="";
	
	public String bbsList() {		
		shopId = getBackSessionShopId().toString();
		/*if(startDt == ""&&endDt == ""){
			startDt = endDt = StringUtil.formartDateTime(new Date(), "yyyy-MM-dd");
		}*/
		try {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", shopId);
			map.put("userId", null);
			map.put("bbsId", StringUtil.emptyToNull(bbsId));
			map.put("bbsSts", StringUtil.emptyToNull(bbsSts));
			map.put("startDt", StringUtil.emptyToNull(startDt));
			map.put("endDt", StringUtil.emptyToNull(endDt));
			map.put("title", StringUtil.emptyToNull(title));
			map.put("bbsType", StringUtil.emptyToNull(bbsType));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("parentId", null);
			map.put("bbsParentId", null);
			
			List<Map<String,Object>> list=commonService.selectList("BBS.listSel", map);
			if (!list.isEmpty()) {
				for(int i=0;i<list.size();i++){
					MapUtil.convertClob2String(list.get(i));
				}
			}
			request.put("list", list);
			
			Map<String,Object> map1=new HashMap<String,Object>();
			map1.put("shopId", shopId);
			map1.put("tbNm", "SHOP_BBS_CONTENT");
			map1.put("fdNm", "BBS_TYPE");
			map1.put("isDelete", 0);
			map1.put("pageCurr", 1);
			map1.put("pageUnit", 10000);
			List<Map<String,Object>> bbs = commonService.selectList("BBS.bbsTypeList",map1);
			request.put("bbs", bbs);
			
			PageData page = new PageData();
			if(!list.isEmpty()){
				int totalCount = (Integer)list.get(0).get("NUM");
				page = new PageData(pageCurr,pageUnit, totalCount , list);
			 
			}
			request.put("page", page);
			request.put("title", title);
			request.put("startDt", startDt);
			request.put("endDt", endDt);
			request.put("bbsSts", bbsSts);	
			request.put("bbsType", bbsType);
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bbsList";
	}
	public String bbsListFragment() {		
		shopId = getBackSessionShopId().toString();
		/*if(startDt == ""&&endDt == ""){
			startDt = endDt = StringUtil.formartDateTime(new Date(), "yyyy-MM-dd");
		}*/
		try {
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", shopId);
			map.put("userId", null);
			map.put("bbsId", StringUtil.emptyToNull(bbsId));
			map.put("bbsSts", StringUtil.emptyToNull(bbsSts));
			map.put("startDt", StringUtil.emptyToNull(startDt));
			map.put("endDt", StringUtil.emptyToNull(endDt));
			map.put("title", StringUtil.emptyToNull(title));
			map.put("bbsType", StringUtil.emptyToNull(bbsType));
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("parentId", null);
			map.put("bbsParentId", null);
			
			List<Map<String,Object>> list=commonService.selectList("BBS.listSel", map);
			request.put("list", list);
			
			Map<String,Object> map1=new HashMap<String,Object>();
			map1.put("shopId", shopId);
			map1.put("tbNm", "SHOP_BBS_CONTENT");
			map1.put("fdNm", "BBS_TYPE");
			map1.put("isDelete", 0);
			map1.put("pageCurr", 1);
			map1.put("pageUnit", 10000);
			List<Map<String,Object>> bbs = commonService.selectList("BBS.bbsTypeList",map1);
			request.put("bbs", bbs);
			
			PageData page = new PageData();
			if(!list.isEmpty()){
				int totalCount = (Integer)list.get(0).get("NUM");
				page = new PageData(pageCurr,pageUnit, totalCount , list);
			 
			}
			request.put("page", page);
			request.put("title", title);
			request.put("startDt", startDt);
			request.put("endDt", endDt);
			request.put("bbsSts", bbsSts);	
			request.put("bbsType", bbsType);
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bbsListFragment";
	}
	//更新状态
	public  String update() {
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		String ret = "success";
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("userId", userId);
			map.put("bbsId", bbsId);
			map.put("bbsSts", bbsSts);
			Map<String, Object> save =commonService.select("BBS.update", map);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);

		return NONE;
	}
	//保存导出的EXCEL文件
	public String createExcel(){
		shopId = getBackSessionShopId().toString();
		String ret="success";
		Map<String,Object> map=new HashMap<String,Object>();
		if(startDt==""|| startDt==null){
			 Calendar ca = Calendar.getInstance();
		     int year = ca.get(Calendar.YEAR);//获取年份
		     int month=ca.get(Calendar.MONTH);//获取月份
		     startDt=year+"-"+(month+1)+"-0";
		}
		map.put("shopId", shopId);
		map.put("userId", null);
		map.put("bbsId", StringUtil.emptyToNull(bbsId));
		map.put("startDt", StringUtil.emptyToNull(startDt));
		map.put("endDt", StringUtil.emptyToNull(endDt));
		map.put("bbsSts", StringUtil.emptyToNull(bbsSts));
		map.put("bbsType", StringUtil.emptyToNull(bbsType));
		map.put("title", StringUtil.emptyToNull(title));
		map.put("pageCurr",1 );
		map.put("pageUnit", 10000);
		map.put("parentId", null);
		map.put("bbsParentId", null);
		
		List<Map<String,Object>> list=commonService.selectList("BBS.listSel", map);
		String statusNm = StringUtils.trimToNull(getLabel("BBS申请管理"));
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
	        int length=list.size();
	        Label[] label=new Label[8];
        	Label title = new Label(0,0,statusNm,titleFormate);
	        sheet.setRowView(0, 400, false);//设置第一行的高度
	        sheet.addCell(title);
	        label[0]=new Label(0,1,"BBS ID");
	        sheet.addCell(label[0]);
	        label[1]=new Label(1,1,getLabel("BBS原文ID"));
	        sheet.addCell(label[1]);
	        label[2]=new Label(2,1,getLabel("BBS类型"));
	        sheet.addCell(label[2]);
	        label[3]=new Label(3,1,getLabel("BBS题目"));
	        sheet.addCell(label[3]);
	        label[4]=new Label(4,1,getLabel("BBS内容"));
	        sheet.addCell(label[4]);
	        label[5]=new Label(5,1,getLabel("提交人"));
	        sheet.addCell(label[5]);
	        label[6]=new Label(6,1,getLabel("提交日期"));
	        sheet.addCell(label[6]);
	        label[7]=new Label(7,1,getLabel("BBS状态"));
	        sheet.addCell(label[7]);
	        
	        for(int i=0;i<length;i++){
	        	label=new Label[8];
	 	        label[0]=new Label(0,i+2,list.get(i).get("BBS_ID").toString());
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1,i+2,list.get(i).get("BBS_PARENT_ID").toString());
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2,i+2,(String)list.get(i).get("CD_DESC"));
	 	        sheet.addCell(label[2]);
	 	        label[3]=new Label(3,i+2,(String)list.get(i).get("TITLE"));
	 	        sheet.addCell(label[3]);
	 	        label[4]=new Label(4,i+2,(String)list.get(i).get("BODY"));
	 	        sheet.addCell(label[4]);
	 	        label[5]=new Label(5,i+2,(String)list.get(i).get("WX_IF_NICK_NM"));
	 	        sheet.addCell(label[5]);
	 	        label[6]=new Label(6,i+2,(String)list.get(i).get("CREATE_DT"));
	 	        sheet.addCell(label[6]);
	 	        if(list.get(i).get("BBS_STS").toString()=="2"|| "2".equals(list.get(i).get("BBS_STS").toString())){
	 	        	label[7]=new Label(7,i+2,"生成");
	 	 	        sheet.addCell(label[7]);
	 	        }else{
	 	        	label[7]=new Label(7,i+2,"已屏蔽");
	 	 	        sheet.addCell(label[7]);
	 	        }
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
	//打开公告类型设置页面
	public String bbsTypeFragment() {
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("tbNm", "SHOP_BBS_CONTENT");
		map.put("fdNm", "BBS_TYPE");
		map.put("isDelete", null);
		map.put("pageCurr",1 );
		map.put("pageUnit", 10000);
		List<Map<String,Object>> list = commonService.selectList("BBS.bbsTypeList",map);
		request.put("list", list);
		return "bbsTypeFragment";
	}
	public String bbsType() {
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("tbNm", "SHOP_BBS_CONTENT");
		map.put("fdNm", "BBS_TYPE");
		map.put("isDelete", null);
		map.put("pageCurr",1 );
		map.put("pageUnit", 10000);
		List<Map<String,Object>> list = commonService.selectList("BBS.bbsTypeList",map);
		request.put("list", list);
		return "bbsType";
	}
	public String bbsTypeInsert() {
		shopId = getBackSessionShopId().toString();
		String ret="success";
		try{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("jobType", jobType);
		map.put("tbNm", "SHOP_BBS_CONTENT");
		map.put("fdNm", "BBS_TYPE");
		map.put("cdId", cdId);
		map.put("cdVal", shopId);
		map.put("cdDesc", cdDesc);
		commonService.select("BBS.bbsTypeInsert",map);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
	    return NONE;
	}
	
	public String getBbsTypeCdId(){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("TB_NM", "SHOP_BBS_CONTENT");
		map.put("FD_NM", "BBS_TYPE");
		map=commonService.select("BBS.getBbstypeCdId",map);
		map.put("newCdId", map.get("CDID").toString());
		renderJSON(map);
		return NONE;
	}
	//公告类型更改
	public String bbsTypeUpdate() {
		shopId = getBackSessionShopId().toString();
		String ret="success";
		try{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("jobType", jobType);
		map.put("cdId", cdId);
		map.put("cdVal", shopId);
		map.put("cdDesc", cdDesc);
		map.put("tbNm", "SHOP_BBS_CONTENT");
		map.put("fdNm", "BBS_TYPE");
		commonService.select("BBS.bbsTypeInsert",map);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
	    return NONE;
	}
	//公告类型删除
	public String bbsTypeDelete() {
		shopId = getBackSessionShopId().toString();
		String ret="success";
		try{
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("jobType", jobType);
		map.put("cdId", cdId);
		map.put("cdVal", shopId);
		map.put("isDelete", isDelete);
		map.put("tbNm", "SHOP_BBS_CONTENT");
		map.put("fdNm", "BBS_TYPE");
		commonService.select("BBS.bbsTypeInsert",map);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
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

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getBbsSts() {
		return bbsSts;
	}

	public void setBbsSts(String bbsSts) {
		this.bbsSts = bbsSts;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getPageEntity() {
		return pageEntity;
	}
	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public String getBbsType() {
		return bbsType;
	}
	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}
	public String getTbNm() {
		return tbNm;
	}
	public void setTbNm(String tbNm) {
		this.tbNm = tbNm;
	}
	public String getFdNm() {
		return fdNm;
	}
	public void setFdNm(String fdNm) {
		this.fdNm = fdNm;
	}
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdVal() {
		return cdVal;
	}
	public void setCdVal(String cdVal) {
		this.cdVal = cdVal;
	}
	public String getCdDesc() {
		return cdDesc;
	}
	public void setCdDesc(String cdDesc) {
		this.cdDesc = cdDesc;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	
}
