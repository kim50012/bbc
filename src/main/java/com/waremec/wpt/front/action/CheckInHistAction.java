package com.waremec.wpt.front.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminCheckIn;
import com.waremec.wpt.admin.domain.AdminCustShop;
import com.waremec.wpt.front.domain.FrontCheckInHist;
import com.waremec.wpt.front.service.CheckInHistService;

@Controller("checkInHistAction")
@Scope(ScopeType.prototype)
public class CheckInHistAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	@Resource
	private CheckInHistService checkInHistService;
	
	//用户Id
	private String userId="";
	//店铺id
	private String shopId="";
	//消费者id
	private String custSysId="";
	//[签到履历] 签到ID	
	private String checkInId;
	//[签到履历] 1进行 2成功 3失败
	private String checkInSts;
	//[签到履历] 签到日期		
	private String checkInDt;
	//调用存储类型
	private String jobType;
	//[客户]消费者id
	private String cust_sys_id;
	//[客户]消费者积分
	private String custPoint;
	//[客户] 创建日期	
	private String created_dt;
	//[客户] 创建日期	
	private String gradeId;
	//[客户] 连续签到日期	
	private String setContinueDays;
	
	Calendar cal = Calendar.getInstance();
	private int year=cal.get(Calendar.YEAR);
	private int month=cal.get(Calendar.MONTH) + 1;
	private int day=cal.get(Calendar.DATE);
	Date now = new Date(); 
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格
	private String createdDt=dateFormat.format(now);
	
	public String checkInHist() {
		SessionMember sessionMember = getSessionMember();
		shopId=sessionMember.getShopId().toString();
		custSysId=sessionMember.getCustSysId().toString();
		//查询出客户信息
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("CUST_SYS_ID", custSysId);
		Map<String,Object> custSel=checkInHistService.selectCust("CheckInHist.getCust", map);
		request.put("custSel", custSel);
		//查询出签到规则信息(全部)
		AdminCheckIn sels = new AdminCheckIn();
		sels.setShopId(shopId);
		List<AdminCheckIn> adminCheckIns=checkInHistService.selectMst("CheckInHist.mstsSel", sels);
		request.put("adminCheckIns", adminCheckIns);
		
		FrontCheckInHist histNum=new FrontCheckInHist();
		histNum.setShopId(shopId);
		histNum.setCustSysId(custSysId);
		int count =checkInHistService.selectCount("CheckInHist.selectCount", histNum);
		request.put("count", count);
		
		AdminCheckIn sel = new AdminCheckIn();
		sel.setShopId(shopId);
		setContinueDays="1";
		sel.setSetContinueDays(setContinueDays);
		AdminCheckIn adminCheckIn=checkInHistService.selectCheckIn("CheckInHist.selOneHist", sel);
		request.put("adminCheckIn", adminCheckIn);
		//查询出签到历史信息
		FrontCheckInHist hist = new FrontCheckInHist();
		hist.setShopId(shopId);
		hist.setCustSysId(custSysId);
		hist.setCreatedDt(createdDt);
		List<FrontCheckInHist> histSel=checkInHistService.selectHist("CheckInHist.histSel", hist);
		request.put("histSel", histSel);
		return "checkInHist";
	}
	//保存
	public String save(){
		SessionMember sessionMember = getSessionMember();
		shopId=sessionMember.getShopId().toString();
		custSysId=sessionMember.getCustSysId().toString();
		checkInSts="2";
		String ret = "success";	
		//得到条数
		FrontCheckInHist histNum=new FrontCheckInHist();
		histNum.setShopId(shopId);
		int count =checkInHistService.selectCount("CheckInHist.selectCount", histNum);
		request.put("count", count);
		//查询出签到规则信息(一条)
		AdminCheckIn sel = new AdminCheckIn();
		sel.setShopId(shopId);
		setContinueDays="1";
		sel.setSetContinueDays(setContinueDays);
		AdminCheckIn adminCheckIn=checkInHistService.selectCheckIn("CheckInHist.selOneHist", sel);
		request.put("adminCheckIn", adminCheckIn);
				
		if(count==0){
			FrontCheckInHist saveIn = new FrontCheckInHist();
			checkInId=adminCheckIn.getCheckInId();
			checkInSts="2";
			saveIn.setShopId(shopId);
			saveIn.setCustSysId(custSysId);
			saveIn.setCheckInId(checkInId);
			saveIn.setCheckInSts(checkInSts);
			saveIn.setCreatedDt(createdDt);
			saveIn.setCheckInDt(checkInDt);
			jobType="I";
			saveIn.setJobType(jobType);
			checkInHistService.insertCheckInHist("CheckInHist.histSave", saveIn);
		}else{
		try{
			
			FrontCheckInHist saveIn = new FrontCheckInHist();
			saveIn.setShopId(shopId);
			saveIn.setCustSysId(custSysId);
			saveIn.setCheckInId(checkInId);
			saveIn.setCheckInSts(checkInSts);
			saveIn.setCreatedDt(createdDt);
			saveIn.setCheckInDt(checkInDt);
			jobType="I";
			saveIn.setJobType(jobType);
			checkInHistService.insertCheckInHist("CheckInHist.histSave", saveIn);
		}catch(Exception e){
			e.printStackTrace();
			ret="false";
		}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("result", ret);
		
		renderJSON(returnMap);
		return NONE;
	}
	//修改客户积分
	public String update(){
		SessionMember sessionMember = getSessionMember();
		shopId=sessionMember.getShopId().toString();
		custSysId=sessionMember.getCustSysId().toString();
		String ret = "success";
		try{
		AdminCustShop updateIn = new AdminCustShop();
		updateIn.setShopId(Integer.parseInt(shopId));
		cust_sys_id=custSysId;
		updateIn.setCust_sys_id(Integer.parseInt(cust_sys_id));
		updateIn.setCustPoint(custPoint);
		jobType="U";
		updateIn.setJobType(jobType);
		checkInHistService.updatePoint("CheckInHist.pointUpdate", updateIn);
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
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getCheckInId() {
		return checkInId;
	}
	public void setCheckInId(String checkInId) {
		this.checkInId = checkInId;
	}
	public String getCheckInSts() {
		return checkInSts;
	}
	public void setCheckInSts(String checkInSts) {
		this.checkInSts = checkInSts;
	}
	
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getCust_sys_id() {
		return cust_sys_id;
	}
	public void setCust_sys_id(String cust_sys_id) {
		this.cust_sys_id = cust_sys_id;
	}
	public String getCustPoint() {
		return custPoint;
	}
	public void setCustPoint(String custPoint) {
		this.custPoint = custPoint;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getCheckInDt() {
		return checkInDt;
	}
	public void setCheckInDt(String checkInDt) {
		this.checkInDt = checkInDt;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCreated_dt() {
		return created_dt;
	}
	public void setCreated_dt(String created_dt) {
		this.created_dt = created_dt;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getSetContinueDays() {
		return setContinueDays;
	}
	public void setSetContinueDays(String setContinueDays) {
		this.setContinueDays = setContinueDays;
	}
	
}
