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

@Controller("adminCustMsgAction")
@Scope(ScopeType.prototype)
public class AdminCustMsgAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	//用户id
	private String cust_sys_id="";
	//最后对话
	private String receiveDt="";
	//COMMENT 备注
	private String comment="";
	//MARK 0 ：不加星  1：加星
	private String mark="";
	private Integer shopId;
	//用户id
	private String userId="";
	//存储客户的ID
	private String custSysId="";
	//是否查询全部  ALL:全部  LAST:最近
	private String flag="LAST";
	//用于存储实际每页多少条数据
	private String pageEntity="";
	Date now = new Date(); 
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格
	//存储查询结束日期
	private String endDate=dateFormat.format(now);
	//存储查询开始日期
	Date lw = new Date(now.getTime() - 1000 * 60 * 60 * 24 * 6);
	private String startDate=dateFormat.format(lw);
	private String languageFlag;
	
	public String msgList() {
		shopId=getBackSessionShopId();
		userId=getBackSessionUserId().toString();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("custSysId", StringUtil.emptyToNull(custSysId));
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("flag", StringUtil.emptyToNull(flag));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("MsgManage.getCustChats", map);
		request.put("list", list);
		request.put("flag", flag);
		
		//分页
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		
		return "msgList";
	}
	
	public String msgListFragment() {
		shopId=getBackSessionShopId();
		userId=getBackSessionUserId().toString();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("custSysId", StringUtil.emptyToNull(custSysId));
		map.put("userId", userId);
		map.put("startDate", StringUtil.emptyToNull(startDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		map.put("flag", StringUtil.emptyToNull(flag));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list = commonService.selectList("MsgManage.getCustChats", map);
		request.put("list", list);
		request.put("flag", flag);
		
		//分页
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		
		
		return "msgListFragment";
	}
	//导出表格
	public String doExcel() throws UnsupportedEncodingException {

		String ret = "";
		Map<String,String> label = LabelUtil.getLabelMap(getServletContext());	
		
		Integer shopId = getBackSessionShopId();
		String userId = getBackSessionUserId();
		String startDate = StringUtils.trimToNull(getRequest().getParameter("startDate"));
		String endDate = StringUtils.trimToNull(getRequest().getParameter("endDate"));
		try {
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
			map.put("flag", StringUtil.emptyToNull(flag));
			map.put("pageCurr",1 );
			map.put("pageUnit", 10000);
			List<Map<String,Object>> list = commonService.selectList("MsgManage.getCustChats", map);
			String statusNm = StringUtils.trimToNull(getLabel("消息管理").replaceAll("\\s*", ""));
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
			sheet.mergeCells(0, 0, 6, 0);
			// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			// 生成一个单元格样式控制对象
			WritableCellFormat titleFormate = new WritableCellFormat(bold);
			// 单元格中的内容水平方向居中
			titleFormate.setAlignment(jxl.format.Alignment.LEFT);
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
			
			String[] titles = {
					"OPENID",
					getLabel("粉丝昵称") ,
					getLabel("粉丝等级") ,
					getLabel("消息接收时间") ,
					getLabel("消息内容") ,
					getLabel("回复时间") ,
					getLabel("回复内容") 
			};
			for (int i = 0; i < titles.length; i++) {
				// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
				sheet.addCell(new Label(col++, row, titles[i]));
			}		
		    row = 2;
		    col = 0;
			for (int i = 0 ; i < list.size(); i++) {
				sheet.addCell(new Label(col++, row, list.get(i).get("WX_IF_OPENID_P").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("CUST_NICK_NM").toString(), titleFormate));
			
				if(list.get(i).get("GRADE_NM") == null){
					sheet.addCell(new Label(col++, row, "", titleFormate));
				}else{
					sheet.addCell(new Label(col++, row, list.get(i).get("GRADE_NM").toString(), titleFormate));
				}
				
				if(list.get(i).get("CUST_RECEIVE_DT") == null){
					sheet.addCell(new Label(col++, row,"", titleFormate));
				}else{
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_RECEIVE_DT").toString(), titleFormate));
				}	
				
				if(list.get(i).get("CUST_MSG_TYPE").equals("text")){
					sheet.addCell(new Label(col++, row, list.get(i).get("CUST_CONTENT").toString(), titleFormate));
				}else if(list.get(i).get("CUST_MSG_TYPE").equals("image")){
					if(list.get(i).get("FULL_URL") == null){
						sheet.addCell(new Label(col++, row, list.get(i).get("CUST_PIC_URL").toString(), titleFormate));
					}else{
						sheet.addCell(new Label(col++, row, list.get(i).get("FULL_URL").toString(), titleFormate));
					}
				}else{
					sheet.addCell(new Label(col++, row,"", titleFormate));
				}
				
				
				if(list.get(i).get("SHOP_RECEIVE_DT") == null){
					sheet.addCell(new Label(col++, row,"", titleFormate));
				}else{
					sheet.addCell(new Label(col++, row, list.get(i).get("SHOP_RECEIVE_DT").toString(), titleFormate));
				}
				
				if(list.get(i).get("SHOP_CONTENT") == null){
					sheet.addCell(new Label(col++, row,"", titleFormate));
				}else{
					sheet.addCell(new Label(col++, row, list.get(i).get("SHOP_CONTENT").toString(), titleFormate));
				}
				
				
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

	public String  chatWindow(){
		//查询出客户信息
		Map<String,Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", getBackSessionShopId());
		searchMap.put("CUST_SYS_ID", cust_sys_id);
		Map<String,Object> custInfo= commonService.select("MsgManage.getChat", searchMap);
		
		searchMap.clear();
		searchMap.put("SHOP_ID", getBackSessionShopId());
		searchMap.put("USER_ID", getBackSessionUserId());
		searchMap.put("CUST_SYS_ID", cust_sys_id);
		searchMap.put("RECEIVE_DT",  StringUtil.emptyToNull(receiveDt));
		searchMap.put("COMMENT", StringUtil.emptyToNull(comment));
		searchMap.put("MARK", StringUtil.emptyToNull(mark));
		
		List<Map<String,Object>> cartHsitList = commonService.selectList("Cust.getChatHist", searchMap);
//		MapUtil.printMap(custInfo);
//		ListUtil.printListMap(cartHsitList);
		request.put("custInfo", custInfo);
		request.put("cartHsitList", cartHsitList);
		
		boolean sendAble = true;
//		
//		if(!cartHsitList.isEmpty()){
//			GregorianCalendar gc=new GregorianCalendar(); 
//			gc.setTime(new Date()); 
//			gc.add(Calendar.DATE,-2); 
//			Date dayBeforeYesterday = gc.getTime();
//			Date lastPurDt = (Date)custInfo.get("LAST_PUR_DT");
//			sendAble = dayBeforeYesterday.before(lastPurDt);
//		}
		
		request.put("sendAble", sendAble);
		
		return "chatWindow";
	}
	public String getCust_sys_id() {
		return cust_sys_id;
	}
	public void setCust_sys_id(String cust_sys_id) {
		this.cust_sys_id = cust_sys_id;
	}
	public String getReceiveDt() {
		return receiveDt;
	}
	public void setReceiveDt(String receiveDt) {
		this.receiveDt = receiveDt;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
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
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getPageEntity() {
		return pageEntity;
	}
	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getLanguageFlag() {
		return languageFlag;
	}
	public void setLanguageFlag(String languageFlag) {
		this.languageFlag = languageFlag;
	}
	
}
