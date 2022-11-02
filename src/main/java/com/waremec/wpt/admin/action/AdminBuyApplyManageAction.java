package com.waremec.wpt.admin.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
@Controller("adminBuyApplyManageAction")
@Scope(ScopeType.prototype)
public class AdminBuyApplyManageAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	//存储店铺ID
	private String shopId="";
	//存储用户的Id
	private String userId="";
	private String purOrderNo="";
	private String orderBy="";
	private String goodsName="";
	private String adrReceiptorName="";
	private String adrMobile="";
	private String purStatus="";
	private String beginDate="";
	private String endDate="";
	private String emailStatus1="";
	private String emailSendDate1="";
	private String tobeConStatus1="";
	private Date tobeConDate1=null;
	private String emailStatus2="";
	private String emailSendDate2="";
	private String tobeConStatus2="";
	private Date tobeConDate2=null;
	private String stsComId="";
	private Date stsComDate1=null;
	private String purSts="";
	private String email1="";
	private String email2="";
	private String flag="";
	private String flagSubmit="";

	public String buyApplyManage(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		try{
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
			adrReceiptorName=new String(adrReceiptorName.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId",shopId);
			map.put("userId",userId);
			map.put("purOrderNo", StringUtil.emptyToNull(purOrderNo));
			map.put("orderBy", StringUtil.emptyToNull(orderBy));
			map.put("goodsName", StringUtil.emptyToNull(goodsName));
			map.put("adrReceiptorName", StringUtil.emptyToNull(adrReceiptorName));
			map.put("adrMobile", StringUtil.emptyToNull(adrMobile));
			map.put("purStatus", StringUtil.emptyToNull(purStatus));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("pageCurr",pageCurr);
			map.put("pageUnit", pageUnit);
		}catch(Exception e){
			e.printStackTrace();
		}
		List<Map<String,Object>> list=commonService.selectList("BuyApplyManage.getBuyApplyList", map);
		request.put("list", list);
		request.put("beginDate", beginDate);
		request.put("endDate",endDate );
		request.put("purStatus",purStatus );
		request.put("adrMobile", adrMobile);
		request.put("adrReceiptorName", adrReceiptorName);
		request.put("goodsName",goodsName );
		int pageUnitCount=0;//(Integer) mapCount.get("COUNT_NUM");
		if(!list.isEmpty()){
			pageUnitCount=(Integer) list.get(0).get("NUM");
		}
		int pageCount=pageUnitCount/pageUnit+(pageUnitCount%pageUnit==0?0:1);
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUnitCount", pageUnitCount);
		return "buyApplyManage";
	}
	public String buyApplyUpdateJSP(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		if(purSts=="4"){
			stsComDate1=new Date();
			stsComId=userId;
		}
		if(flag=="1"){
			emailStatus1="1";
		}else if(flag=="2"){
			emailStatus2="1";
		}else if(flag=="3"){
			emailStatus1="1";
			emailStatus2="1";
		}
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("userId",userId);
		map.put("purOrderNo", StringUtil.emptyToNull(purOrderNo));
		map.put("jobType", "U");
		map.put("emailStatus1",StringUtil.emptyToNull(emailStatus1));
		map.put("emailSendDate1",StringUtil.emptyToNull(emailSendDate1));
		map.put("tobeConStatus1",StringUtil.emptyToNull(tobeConStatus1));
		map.put("tobeConDate1",tobeConDate1);
		map.put("emailStatus2",StringUtil.emptyToNull(emailStatus2));
		map.put("emailSendDate2",StringUtil.emptyToNull(emailSendDate2));
		map.put("tobeConStatus2",StringUtil.emptyToNull(tobeConStatus2));
		map.put("tobeConDate2",tobeConDate2);
		map.put("stsComId",StringUtil.emptyToNull(stsComId));
		map.put("stsComDate1",stsComDate1);
		map.put("purSts",StringUtil.emptyToNull(purSts));
		Map<String,Object> mapReturn=commonService.select("BuyApplyManage.buyApplyUpdate",map);
		renderJSON(mapReturn);
		return NONE;
	}
	public String buyApplyUpdate(){
		if(flagSubmit=="1" || "1".equals(flagSubmit)){
			tobeConStatus1="1";
			tobeConDate1=new Date();
		}else if(flagSubmit=="2" || "2".equals(flagSubmit)){
			tobeConStatus2="1";
			tobeConDate2=new Date();
		}/*else if(flagSubmit=="3" || "3".equals(flagSubmit)){
			tobeConStatus1="1";
			tobeConDate1=new Date();
			tobeConStatus2="1";
			tobeConDate2=new Date();
		}*/
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId",shopId);
		map.put("userId",userId);
		map.put("purOrderNo", StringUtil.emptyToNull(purOrderNo));
		map.put("jobType", "U");
		map.put("emailStatus1",StringUtil.emptyToNull(emailStatus1));
		map.put("emailSendDate1",StringUtil.emptyToNull(emailSendDate1));
		map.put("tobeConStatus1",StringUtil.emptyToNull(tobeConStatus1));
		map.put("tobeConDate1",tobeConDate1);
		map.put("emailStatus2",StringUtil.emptyToNull(emailStatus2));
		map.put("emailSendDate2",StringUtil.emptyToNull(emailSendDate2));
		map.put("tobeConStatus2",StringUtil.emptyToNull(tobeConStatus2));
		map.put("tobeConDate2",tobeConDate2);
		map.put("stsComId",StringUtil.emptyToNull(stsComId));
		map.put("stsComDate1",stsComDate1);
		map.put("purSts",StringUtil.emptyToNull(purSts));
		Map<String,Object> mapReturn=commonService.select("BuyApplyManage.buyApplyUpdate",map);
		if(mapReturn.isEmpty()){
			return "buyApplyUpdateNo";
		}else{
			String resultStr=(String) mapReturn.get("OUT_ERR_MSG");
			if("S".equals(resultStr)){
				return "buyApplyUpdate";
			}else{
				return "buyApplyUpdateNo";
			}
		}
	}
	
	
	public String email(){
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		try{
			String host = "smtp.163.com";
			int port = 25;
			String username = "dongsun11";
			String password = "wang968177";
			
			Properties javaMailProperties = new Properties();
			javaMailProperties.put("mail.smtp.auth", "true");
			javaMailProperties.put("mail.smtp.starttls.enable", "true");
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			mailSender.setHost(host);
			mailSender.setPort(port);
			mailSender.setUsername(username);
			mailSender.setPassword(password);
			mailSender.setJavaMailProperties(javaMailProperties);
			String email = "dongsun11@163.com";
			//String nickname = "冬笋";
			StringBuffer url=ServletActionContext.getRequest().getRequestURL();
			String urlNow=url.toString();
			urlNow=urlNow.substring(0,urlNow.lastIndexOf("/"));
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper help = new MimeMessageHelper(message, true, "UTF-8");
			help.setFrom("dongsun11@163.com");
			String[] str;
			SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId",shopId);
			map.put("userId",userId);
			map.put("purOrderNo", StringUtil.emptyToNull(purOrderNo));
			map.put("orderBy", StringUtil.emptyToNull(orderBy));
			map.put("goodsName", StringUtil.emptyToNull(goodsName));
			map.put("adrReceiptorName", StringUtil.emptyToNull(adrReceiptorName));
			map.put("adrMobile", StringUtil.emptyToNull(adrMobile));
			map.put("purStatus", StringUtil.emptyToNull(purStatus));
			map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));
			map.put("pageCurr",pageCurr);
			map.put("pageUnit", pageUnit);
			Map<String,Object> mapResult=commonService.select("BuyApplyManage.getBuyApplyList", map);
			if(mapResult.isEmpty()){
				mapResult.put("OUT_ERR_MSG", "fail");
				renderJSON(mapResult);
				return NONE;
			}
			Integer emailStatusFlag1=(Integer) mapResult.get("EMAIL_STATUS1");
			Integer emailStatusFlag2=(Integer) mapResult.get("EMAIL_STATUS2");
			String contenty="<p style='margin-left:40px;margin-top:15px;'>店铺："+mapResult.get("SHOP_NM")
							+"</p><p style='margin-left:40px;margin-top:15px;'>商品名称："+mapResult.get("GOODS_NM")
							+"&nbsp;&nbsp;&nbsp;&nbsp;数量："+mapResult.get("GOODS_QTY")
							+"</p><p style='margin-left:40px;margin-top:15px;'>地址："+mapResult.get("ADR_DETAIL")
							+"</p><a style='border:2px solid #0e9615;height:30px;width:60px;display:inline-block;text-align:center;line-height:30px;margin-left:150px;' href='"+urlNow+"/buyApplyUpdate.htm?purOrderNo="+purOrderNo+"&shopId="+shopId+"&flagSubmit=";
			if(!("".equals(email1))&&(emailStatusFlag1==0 || emailStatusFlag1==2)){
				str=new String[1];
				str[0]=email1;
				flag="1";
				emailSendDate1=sdf.format(new Date());
				help.setTo(str);
				help.setSubject("测试");
				String content=contenty+"1'>确认</a>";
				help.setText(content, true);
				mailSender.send(message);
			}
			if(!("".equals(email2))&&(emailStatusFlag2==0 || emailStatusFlag2==2)){
				str=new String[1];
				str[0]=email2;
				flag="2";
				emailSendDate2=sdf.format(new Date());
				help.setTo(str);
				help.setSubject("测试");
				String content=contenty+"2'>确认</a>";
				help.setText(content, true);
				mailSender.send(message);
			}
			if ((!("".equals(email1))&&(emailStatusFlag1==0 || emailStatusFlag1==2))&&(!("".equals(email2))&&(emailStatusFlag2==0 || emailStatusFlag2==2))){
				flag="3";
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		buyApplyUpdateJSP();
		return NONE;
	}
	//保存导出的EXCEL文件
	public String createExcel(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		String ret="success";
		Map<String,Object> map=new HashMap<String,Object>();
		orderBy=null;
		if(beginDate==""|| beginDate==null || "".equals(beginDate)){
			 Calendar ca = Calendar.getInstance();
		     int year = ca.get(Calendar.YEAR);//获取年份
		     int month=ca.get(Calendar.MONTH);//获取月份
		     beginDate=year+"-"+(month+1)+"-1";
		     endDate=year+"-"+(month+2)+"-1";
		}
		map.put("shopId", shopId);
		map.put("beginDate", StringUtil.emptyToNull(beginDate));
		map.put("endDate", StringUtil.emptyToNull(endDate));
		try{
			goodsName=new String(goodsName.getBytes("ISO-8859-1"),"UTF-8");
			adrReceiptorName=new String(adrReceiptorName.getBytes("ISO-8859-1"),"UTF-8");
			//map.put("shopId",shopId);
			map.put("userId",userId);
			map.put("purOrderNo", StringUtil.emptyToNull(purOrderNo));
			map.put("orderBy", StringUtil.emptyToNull(orderBy));
			map.put("goodsName", StringUtil.emptyToNull(goodsName));
			map.put("adrReceiptorName", StringUtil.emptyToNull(adrReceiptorName));
			map.put("adrMobile", StringUtil.emptyToNull(adrMobile));
			map.put("purStatus", StringUtil.emptyToNull(purStatus));
			/*map.put("beginDate", StringUtil.emptyToNull(beginDate));
			map.put("endDate", StringUtil.emptyToNull(endDate));*/
			map.put("pageCurr",1);
			map.put("pageUnit", 10000);
		}catch(Exception e){
			e.printStackTrace();
		}
		List<Map<String,Object>> list=commonService.selectList("BuyApplyManage.getBuyApplyList", map);
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os= new BufferedOutputStream(response.getOutputStream());  
            response.reset();// 清空输出流   
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            response.addHeader("Content-disposition", "attachment; filename="+java.net.URLEncoder.encode("orderDetail", "UTF-8")+".xls");// 设定输出文件头
			//创建工作薄
	        WritableWorkbook workbook = Workbook.createWorkbook(os);
	        //创建新的一页
	        WritableSheet sheet = workbook.createSheet("First Sheet",0);
	        
	        sheet.mergeCells(0, 0, 19, 0);//添加合并单元格，第一个参数是起始列，第二个参数是起始行，第三个参数是终止列，第四个参数是终止行
	        WritableFont bold = new WritableFont(WritableFont.ARIAL,10,WritableFont.BOLD);//设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
	        WritableCellFormat titleFormate = new WritableCellFormat(bold);//生成一个单元格样式控制对象
	        titleFormate.setAlignment(jxl.format.Alignment.CENTRE);//单元格中的内容水平方向居中
	        titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);//单元格的内容垂直方向居中
	        Label title = new Label(0,0,"商品购买申请管理明细",titleFormate);
	        sheet.setRowView(0, 400, false);//设置第一行的高度
	        sheet.addCell(title);
	      /*  //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
	        excelBody=new String(excelBody.getBytes("ISO-8859-1"),"UTF-8");
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
	        int length=list.size();
	        Label[] label=new Label[20];
	        label[0]=new Label(0,1,"商品名称");
	        sheet.addCell(label[0]);
	        label[1]=new Label(1,1,"数量");
	        sheet.addCell(label[1]);
	        label[2]=new Label(2,1,"收货人姓名");
	        sheet.addCell(label[2]);
	        label[3]=new Label(3,1,"收货人手机号");
	        sheet.addCell(label[3]);
	        label[4]=new Label(4,1,"下单日期");
	        sheet.addCell(label[4]);
	        label[5]=new Label(5,1,"邮件发送日期1");
	        sheet.addCell(label[5]);
	        label[6]=new Label(6,1,"担当确认日期1");
	        sheet.addCell(label[6]);
	        label[7]=new Label(7,1,"邮件发送日期2");
	        sheet.addCell(label[7]);
	        label[8]=new Label(8,1,"担当确认日期2");
	        sheet.addCell(label[8]);
	        label[9]=new Label(9,1,"完成日期1");
	        sheet.addCell(label[9]);
	        label[10]=new Label(10,1,"担当名称1");
	        sheet.addCell(label[10]);
	        label[11]=new Label(11,1,"担当联系方式1");
	        sheet.addCell(label[11]);
	        label[12]=new Label(12,1,"担当邮件2");
	        sheet.addCell(label[12]);
	        label[13]=new Label(13,1,"邮件发送状态1");
	        sheet.addCell(label[13]);
	        label[14]=new Label(14,1,"担当确认状态1");
	        sheet.addCell(label[14]);
	        label[15]=new Label(15,1,"担当名称2");
	        sheet.addCell(label[15]);
	        label[16]=new Label(16,1,"担当联系方式2");
	        sheet.addCell(label[16]);
	        label[17]=new Label(17,1,"担当邮件2");
	        sheet.addCell(label[17]);
	        label[18]=new Label(18,1,"邮件发送状态2");
	        sheet.addCell(label[18]);
	        label[19]=new Label(19,1,"担当确认状态2");
	        sheet.addCell(label[19]);

	        for(int i=0;i<length;i++){
	        	label=new Label[20];
	 	        label[0]=new Label(0,i+2,(String) list.get(i).get("GOODS_NM"));
	 	        sheet.addCell(label[0]);
	 	        label[1]=new Label(1,i+2,list.get(i).get("GOODS_QTY").toString());
	 	        sheet.addCell(label[1]);
	 	        label[2]=new Label(2,i+2,(String) list.get(i).get("ADR_RECEIPTOR_NM"));
	 	        sheet.addCell(label[2]);
	 	        label[3]=new Label(3,i+2,list.get(i).get("ADR_MOBILE").toString());
	 	        sheet.addCell(label[3]);
	 	        label[4]=new Label(4,i+2, list.get(i).get("STS_ORDER_DT").toString());
	 	        sheet.addCell(label[4]);
	 	        label[5]=new Label(5,i+2,(String) list.get(i).get("EMAIL_SEND_DT1"));
	 	        sheet.addCell(label[5]);
	 	        label[6]=new Label(6,i+2,(String) list.get(i).get("TOBE_CON_DT1"));
	 	        sheet.addCell(label[6]);
	 	       label[7]=new Label(7,i+2,(String) list.get(i).get("EMAIL_SEND_DT2"));
	 	        sheet.addCell(label[7]);
	 	        label[8]=new Label(8,i+2,(String) list.get(i).get("TOBE_CON_DT2"));
	 	        sheet.addCell(label[8]);
	 	        label[9]=new Label(9,i+2,(String) list.get(i).get("STS_COM_DT1"));
	 	        sheet.addCell(label[9]);
	 	        label[10]=new Label(10,i+2,(String) list.get(i).get("TOBE_NM1"));
	 	        sheet.addCell(label[10]);
	 	        label[11]=new Label(11,i+2, (String)list.get(i).get("TOBE_CONTACT1"));
	 	        sheet.addCell(label[11]);
	 	        label[12]=new Label(12,i+2,(String) list.get(i).get("TOBE_EMAIL1"));
	 	        sheet.addCell(label[12]);
	 	        label[13]=new Label(13,i+2,(String) list.get(i).get("EMAIL_STATUS1").toString());
	 	        sheet.addCell(label[13]);
	 	       label[14]=new Label(14,i+2,(String) list.get(i).get("TOBE_CON_STATUS1").toString());
	 	        sheet.addCell(label[14]);
	 	        label[15]=new Label(15,i+2,(String) list.get(i).get("TOBE_NM2"));
	 	        sheet.addCell(label[15]);
	 	        label[16]=new Label(16,i+2,(String) list.get(i).get("TOBE_CONTACT2"));
	 	        sheet.addCell(label[16]);
	 	        label[17]=new Label(17,i+2,(String)list.get(i).get("TOBE_EMAIL2"));
	 	        sheet.addCell(label[17]);
	 	        label[18]=new Label(18,i+2, list.get(i).get("EMAIL_STATUS2").toString());
	 	        sheet.addCell(label[18]);
	 	        label[19]=new Label(19,i+2,(String) list.get(i).get("TOBE_CON_STATUS2").toString());
	 	        sheet.addCell(label[19]);
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
	public String getPurOrderNo() {
		return purOrderNo;
	}
	public void setPurOrderNo(String purOrderNo) {
		this.purOrderNo = purOrderNo;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getAdrReceiptorName() {
		return adrReceiptorName;
	}
	public void setAdrReceiptorName(String adrReceiptorName) {
		this.adrReceiptorName = adrReceiptorName;
	}
	public String getAdrMobile() {
		return adrMobile;
	}
	public void setAdrMobile(String adrMobile) {
		this.adrMobile = adrMobile;
	}
	public String getPurStatus() {
		return purStatus;
	}
	public void setPurStatus(String purStatus) {
		this.purStatus = purStatus;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEmailStatus1() {
		return emailStatus1;
	}
	public void setEmailStatus1(String emailStatus1) {
		this.emailStatus1 = emailStatus1;
	}
	public String getEmailSendDate1() {
		return emailSendDate1;
	}
	public void setEmailSendDate1(String emailSendDate1) {
		this.emailSendDate1 = emailSendDate1;
	}
	public String getTobeConStatus1() {
		return tobeConStatus1;
	}
	public void setTobeConStatus1(String tobeConStatus1) {
		this.tobeConStatus1 = tobeConStatus1;
	}
	public Date getTobeConDate1() {
		return tobeConDate1;
	}
	public void setTobeConDate1(Date tobeConDate1) {
		this.tobeConDate1 = tobeConDate1;
	}
	public String getEmailStatus2() {
		return emailStatus2;
	}
	public void setEmailStatus2(String emailStatus2) {
		this.emailStatus2 = emailStatus2;
	}
	public String getEmailSendDate2() {
		return emailSendDate2;
	}
	public void setEmailSendDate2(String emailSendDate2) {
		this.emailSendDate2 = emailSendDate2;
	}
	public String getTobeConStatus2() {
		return tobeConStatus2;
	}
	public void setTobeConStatus2(String tobeConStatus2) {
		this.tobeConStatus2 = tobeConStatus2;
	}
	public Date getTobeConDate2() {
		return tobeConDate2;
	}
	public void setTobeConDate2(Date tobeConDate2) {
		this.tobeConDate2 = tobeConDate2;
	}
	public String getStsComId() {
		return stsComId;
	}
	public void setStsComId(String stsComId) {
		this.stsComId = stsComId;
	}
	public Date getStsComDate1() {
		return stsComDate1;
	}
	public void setStsComDate1(Date stsComDate1) {
		this.stsComDate1 = stsComDate1;
	}
	public String getPurSts() {
		return purSts;
	}
	public void setPurSts(String purSts) {
		this.purSts = purSts;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getFlagSubmit() {
		return flagSubmit;
	}
	public void setFlagSubmit(String flagSubmit) {
		this.flagSubmit = flagSubmit;
	}

}
