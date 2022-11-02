package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.wpt.admin.domain.AdminGrade;
import com.waremec.wpt.admin.service.GradeService;
@Controller("adminCustGradeAction")
@Scope(ScopeType.prototype)
public class AdminCustGradeAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	//--[等级] 店铺ID
	private String shopId="";
	//--[等级] 等级 ID
	private String gradeId="";
	//--[等级] 等级名称
	private String gradeName="";
	//--[等级] 基准每成交易(笔)
	private String baseQty="";
	//--[等级] 基准每购买金额(元)
	private String basePrice="";
	//--[等级] 0:停用 1:使用
	private String isUse="";
	//--更新日期
	private String modifiedDt="";
	//--创建日期				
	private String createdDt="";
	//--更新ID
	private String modifiedId="";
	//--创建ID
	private String createdId="";
	//调用存储过程的类型
	private String jobType="";
	//用户id
	private String userId="";
	//最小等级
	private String minGrade="";
	//评价周期
	private String evCycle="";
	//有效期限
	private String extended="";
	//购买积分
	private String buyPoint="";
	//积分值
	private String sellForCash="";	
	
	
	@Resource
	private GradeService gradeService;
	

	public String getMinGrade() {
		return minGrade;
	}
	public void setMinGrade(String minGrade) {
		this.minGrade = minGrade;
	}
	/** 
	* 跳转到等级列表页面
	* @return
	*/
	public String list() {
		shopId=getBackSessionShopId().toString();
		//查询所有等级
//		AdminGrade gradeSel =new AdminGrade();
//		gradeSel.setShopId(shopId);
//		List<AdminGrade> gradeNum=(List<AdminGrade>)commonService.selectAdminGradeDomain("Grade.gradeSel",gradeSel);
		List<AdminGrade> gradelist =  gradeService.getGradeListByShopId(getBackSessionShopId());
		request.put("gradelist", gradelist);
		request.put("size", gradelist.size());
		
		return "list";
	}
	public String  gradeSelByMaxId(){
		shopId=getBackSessionShopId().toString();
//		AdminGrade gradeSelByNextId =new AdminGrade();
//		gradeSelByNextId.setShopId(shopId);
//		gradeSelByNextId.setGradeId(gradeId);
//		AdminGrade adminGrade1=(AdminGrade)commonService.selectAdminGradeByIdDomain("Grade.gradeSelByNextId",gradeSelByNextId);
//		
//		AdminGrade gradeSelByPrveId =new AdminGrade();
//		gradeSelByPrveId.setShopId(shopId);
//		gradeSelByPrveId.setGradeId(gradeId);
//		AdminGrade adminGrade2=(AdminGrade)commonService.selectAdminGradeByIdDomain("Grade.gradeSelByPrveId",gradeSelByPrveId);

		AdminGrade grade =new AdminGrade();
		grade.setShopId(shopId);
		grade.setGradeId(gradeId);
		AdminGrade adminGrade1 = gradeService.getNextHighLevelGrade(grade);
		AdminGrade adminGrade2 = gradeService.getPrevLowLevelGrade(grade);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		returnMap.put("adminGrade1", adminGrade1);
		returnMap.put("adminGrade2", adminGrade2);
		returnMap.put("result", "success");

		renderJSON(returnMap);
		
		return NONE;
	}
	public String gradeSave(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		
		boolean success = true;
		String err_msg = "";
		
		try{
		AdminGrade saveIn = new AdminGrade();
		saveIn.setShopId(shopId);
		saveIn.setGradeId(gradeId);
		saveIn.setGradeName(gradeName);
		saveIn.setBaseQty(baseQty);
		saveIn.setBasePrice(basePrice);
		isUse="1";
		saveIn.setIsUse(isUse);
		saveIn.setCreatedDt(createdDt);
		saveIn.setModifiedDt(modifiedDt);
		saveIn.setCreatedId(userId);
		saveIn.setModifiedId(userId);
		saveIn.setEvCycle(evCycle);
		saveIn.setExtended(extended);
		saveIn.setBuyPoint(buyPoint);
		saveIn.setSellForCash(sellForCash);
		jobType="I";
//		saveIn.setJobType(jobType);
//		commonService.insertGrade("Grade.gradeSave", saveIn);
		gradeService.addGrade(saveIn);
		
		}catch(Exception e){
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
	public String  gradeSelById(){
		shopId=getBackSessionShopId().toString();
		

		AdminGrade gradeSelById =new AdminGrade();
		gradeSelById.setShopId(shopId);
		gradeSelById.setGradeId(gradeId);
//		AdminGrade adminGrade=(AdminGrade)commonService.selectAdminGradeByIdDomain("Grade.gradeSelById",gradeSelById);
		AdminGrade adminGrade = gradeService.getGradeById(gradeSelById);
				
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if(adminGrade.getGradeId()==""){
			returnMap.put("result", "fail");
		}else{
			returnMap.put("adminGrade", adminGrade);
			returnMap.put("result", "success");
		}
		renderJSON(returnMap);
		
		return NONE;
	}
	public String gradeUpdate(){
		//根据等级id查找等级
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		boolean success = true;
		String err_msg = "";
		try{
		AdminGrade updateIn = new AdminGrade();
		updateIn.setShopId(shopId);
		updateIn.setGradeId(gradeId);
		updateIn.setGradeName(gradeName);
		updateIn.setBaseQty(baseQty);
		updateIn.setBasePrice(basePrice);
		isUse="1";
		updateIn.setIsUse(isUse);
		updateIn.setModifiedDt(modifiedDt);
		updateIn.setModifiedId(userId);
		updateIn.setEvCycle(evCycle);
		updateIn.setExtended(extended);
		updateIn.setBuyPoint(buyPoint);
		updateIn.setSellForCash(sellForCash);
		jobType="U";
//		updateIn.setJobType(jobType);
//		commonService.updateGrade("Grade.gradeSave", updateIn);
		gradeService.modifyGrade(updateIn);
	
		}catch(Exception e){
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
	public String gradeDelete(){
		shopId=getBackSessionShopId().toString();
		//根据等级id查找等级
		boolean success = true;
		String err_msg = "";
		try{
			AdminGrade updateIn = new AdminGrade();
			updateIn.setShopId(shopId);
			updateIn.setGradeId(gradeId);
			updateIn.setGradeName(gradeName);
			updateIn.setBaseQty(baseQty);
			updateIn.setBasePrice(basePrice);
			isUse="0";
			updateIn.setIsUse(isUse);
			jobType="U";
//			updateIn.setJobType(jobType);
//			commonService.updateGrade("Grade.gradeSave", updateIn);
			gradeService.deleteGrade(updateIn);
		}catch(Exception e){
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
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getBaseQty() {
		return baseQty;
	}
	public void setBaseQty(String baseQty) {
		this.baseQty = baseQty;
	}
	public String getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}

	
	public String getModifiedId() {
		return modifiedId;
	}
	public void setModifiedId(String modifiedId) {
		this.modifiedId = modifiedId;
	}
	public String getCreatedId() {
		return createdId;
	}
	public void setCreatedId(String createdId) {
		this.createdId = createdId;
	}
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	public String getModifiedDt() {
		return modifiedDt;
	}
	public void setModifiedDt(String modifiedDt) {
		this.modifiedDt = modifiedDt;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getEvCycle() {
		return evCycle;
	}
	public void setEvCycle(String evCycle) {
		this.evCycle = evCycle;
	}
	public String getExtended() {
		return extended;
	}
	public void setExtended(String extended) {
		this.extended = extended;
	}
	public String getBuyPoint() {
		return buyPoint;
	}
	public void setBuyPoint(String buyPoint) {
		this.buyPoint = buyPoint;
	}
	public String getSellForCash() {
		return sellForCash;
	}
	public void setSellForCash(String sellForCash) {
		this.sellForCash = sellForCash;
	}
	
}
