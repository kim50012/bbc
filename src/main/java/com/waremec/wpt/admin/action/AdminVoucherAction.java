package com.waremec.wpt.admin.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wpt.admin.domain.AdminGrade;
import com.waremec.wpt.admin.service.CustService;

@Controller("adminVoucherAction")
@Scope(ScopeType.prototype)
public class AdminVoucherAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CustService custService;
	//存储店铺ID
	private String shopId="";
	//存储用户的Id
	private String userId="";
	//优惠券id
	private String couponId="";
	//优惠券名称
	private String couponNm="";
	//当前状态
	private String couponType="";
	//状态Id
	private String statusId="";
	//优惠券金额
	private String faceValue="";
	//发行数量
	private String circulationCnt="";
	//有效期-开始
	private String startDate="";
	//有效期-结束
	private String endDate="";
	//客户等级
	private String custLevel="";
	//购买金额
	private String buyAmount="";
	//背景图片ID
	private String flieId="";
	//等级
	private String gradeSel;
	//昵称
	private String nickName="";
	//客户id
	private String custSysId="";
	private String gradeId="";
	private String grade="";
	private String flag="";
	
	public String voucher() {
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", StringUtil.emptyToNull(userId));
		map.put("couponId",StringUtil.emptyToNull(couponId));
		map.put("couponNm", StringUtil.emptyToNull(couponNm));
		map.put("statusId", StringUtil.emptyToNull(statusId));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("Voucher.voucherSel", map);
		request.put("statusId", statusId);
		request.put("couponNm", couponNm);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (int) list.get(0).get("NUM");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		return "voucher";
	}
	public String voucherListFragment(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", StringUtil.emptyToNull(userId));
		map.put("couponId",StringUtil.emptyToNull(couponId));
		map.put("couponNm", StringUtil.emptyToNull(couponNm));
		map.put("statusId", StringUtil.emptyToNull(statusId));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("Voucher.voucherSel", map);
		request.put("statusId", statusId);
		request.put("couponNm", couponNm);
		request.put("list", list);
		PageData page = new PageData();
		if (!list.isEmpty()) {
			int totalCount = (int) list.get(0).get("NUM");
			page = new PageData(pageCurr,pageUnit, totalCount , list);
		}
		
		request.put("page", page);
		return "voucherListFragment";
	}
	public String voucherCreate(){
		//查询出等级信息
		shopId = getBackSessionShopId().toString();
		AdminGrade adminGrade=new AdminGrade();
		adminGrade.setShopId(shopId);
		List<AdminGrade> grade= custService.selectGrade("Voucher.gradeSelTwo", adminGrade);
		request.put("grade", grade);
		return "voucherCreate";
	}
	public String save(){
		String ret = "success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		//保存
		try {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("couponId",couponId);
		map.put("couponNm",couponNm);
		map.put("faceValue",faceValue);
		map.put("circulationCnt",circulationCnt);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("custLevel",custLevel);
		map.put("buyAmount",buyAmount);
		map.put("flieId",flieId);
		map.put("jobType","I");
		commonService.insert("Voucher.voucherCre", map);
		} catch (Exception e) {
			ret="fail";
			e.printStackTrace();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String voucherUpdate(){
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", StringUtil.emptyToNull(userId));
		map.put("couponId",StringUtil.emptyToNull(couponId));
		map.put("couponNm", StringUtil.emptyToNull(couponNm));
		map.put("statusId", StringUtil.emptyToNull(statusId));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		Map<String,Object> list=commonService.select("Voucher.voucherSel", map);
		request.put("list", list);
		
		//查询出等级信息
		shopId = getBackSessionShopId().toString();
		AdminGrade adminGrade=new AdminGrade();
		adminGrade.setShopId(shopId);
		List<AdminGrade> grade= custService.selectGrade("Voucher.gradeSelTwo", adminGrade);
		request.put("grade", grade);
		return "voucherUpdate";
	}
	public String update(){
		String ret = "success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		//保存
		try {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("couponId",couponId);
		map.put("couponNm",couponNm);
		map.put("faceValue",faceValue);
		map.put("circulationCnt",circulationCnt);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("custLevel",custLevel);
		map.put("buyAmount",buyAmount);
		map.put("flieId",flieId);
		map.put("jobType","U");
		commonService.update("Voucher.voucherCre", map);
		} catch (Exception e) {
			ret="fail";
			e.printStackTrace();
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String custPoupe(){
		shopId = getBackSessionShopId().toString();
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("couponId", StringUtil.emptyToNull(couponId));
		if(flag=="0"||"0".equals(flag)){
			map.put("gradeSel", StringUtil.emptyToNull(gradeId));
		}else{
			map.put("gradeSel", StringUtil.emptyToNull(grade));
		}
		map.put("flag", flag);
		try {
			nickName=new String(nickName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("nickName", StringUtil.emptyToNull(nickName));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		List<Map<String,Object>> list=commonService.selectList("Voucher.custList", map);
		request.put("couponId", couponId);
		request.put("gradeId", gradeId);
		request.put("grade", grade);
		request.put("nickName", nickName);
		request.put("list", list);
		
		Map<String,Object> mapAll=new HashMap<String,Object>();
		mapAll.put("shopId", shopId);
		mapAll.put("couponId", StringUtil.emptyToNull(couponId));
		if(flag=="0"||"0".equals(flag)){
			mapAll.put("gradeSel", StringUtil.emptyToNull(gradeId));
		}else{
			mapAll.put("gradeSel", StringUtil.emptyToNull(grade));
		}
		mapAll.put("flag", flag);
		try {
			nickName=new String(nickName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mapAll.put("nickName", StringUtil.emptyToNull(nickName));
		mapAll.put("pageCurr", 1);
		mapAll.put("pageUnit", 10000);
		List<Map<String,Object>> listAll=commonService.selectList("Voucher.custList", mapAll);
		int pageUintCount=0;
		if(!listAll.isEmpty()){
			pageUintCount=(Integer)listAll.get(0).get("NUM");
		}else{
			pageUintCount=0;
		}
		int pageCount=0;
		if(pageEntity.equals("")||pageEntity==null){
			 pageCount=pageUintCount/pageUnit+(pageUintCount%pageUnit==0?0:1);
		}else{
			 pageCount=pageUintCount/Integer.parseInt(pageEntity)+(pageUintCount%Integer.parseInt(pageEntity)==0?0:1);
		}
		request.put("pageCount", pageCount);
		request.put("pageCurr",pageCurr);
		request.put("pageUnit", pageUnit);
		request.put("pageUintCount", pageUintCount);
		request.put("pageEntity", pageEntity);
		
		//查询出等级信息
		shopId = getBackSessionShopId().toString();
		AdminGrade adminGrade=new AdminGrade();
		adminGrade.setShopId(shopId);
		adminGrade.setGradeId(gradeId);
		List<AdminGrade> gradeList= custService.selectGrade("Voucher.gradeSel", adminGrade);
		request.put("gradeList", gradeList);
		//查询出等级信息
		Map<String,Object> adminGradeOne=new HashMap<String,Object>();
		adminGradeOne.put("shopId", shopId);
		adminGradeOne.put("gradeId", gradeId);
		Map<String,Object> adminGradeOneList= commonService.select("Voucher.gradeSelOne", adminGradeOne);
		request.put("adminGradeOneList", adminGradeOneList);
		return "custPoupe";
	}
	public String send(){
		String ret = "success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("couponId",couponId);
		map.put("custSysId",custSysId);
		Map<String, Object> list=commonService.select("Voucher.send", map);
		String error=(String) list.get("OUT_ERR_MSG");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		returnMap.put("error", error);
		renderJSON(returnMap);
		return NONE;
	}
	public String stop(){
		String ret = "success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("couponId",couponId);
		map.put("jobType","E");
		commonService.update("Voucher.stop", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String start(){
		String ret = "success";
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("userId", userId);
		map.put("couponId",couponId);
		map.put("jobType","I");
		commonService.update("Voucher.stop", map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	public String getGradeSel() {
		return gradeSel;
	}
	public void setGradeSel(String gradeSel) {
		this.gradeSel = gradeSel;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getCouponId() {
		return couponId;
	}
	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}
	public String getCouponNm() {
		return couponNm;
	}
	public void setCouponNm(String couponNm) {
		this.couponNm = couponNm;
	}
	public String getCouponType() {
		return couponType;
	}
	public void setCouponType(String couponType) {
		this.couponType = couponType;
	}
	public String getPageEntity() {
		return pageEntity;
	}
	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getFaceValue() {
		return faceValue;
	}
	public void setFaceValue(String faceValue) {
		this.faceValue = faceValue;
	}
	public String getCirculationCnt() {
		return circulationCnt;
	}
	public void setCirculationCnt(String circulationCnt) {
		this.circulationCnt = circulationCnt;
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
	public String getCustLevel() {
		return custLevel;
	}
	public void setCustLevel(String custLevel) {
		this.custLevel = custLevel;
	}
	public String getBuyAmount() {
		return buyAmount;
	}
	public void setBuyAmount(String buyAmount) {
		this.buyAmount = buyAmount;
	}
	public String getFlieId() {
		return flieId;
	}
	public void setFlieId(String flieId) {
		this.flieId = flieId;
	}
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	private String pageEntity="";
	
}
