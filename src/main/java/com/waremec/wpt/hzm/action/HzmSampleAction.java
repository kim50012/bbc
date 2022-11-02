package com.waremec.wpt.hzm.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.wpt.admin.service.PromotionService;
             
@Controller("hzmSampleAction")
@Scope(ScopeType.prototype)
public class HzmSampleAction extends BaseAction implements ServletContextAware {

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
	public String sample() {

		shopId = getBackSessionShopId().toString();

		// 商品详情
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("shopId", shopId); // shopId
		List<Map<String,Object>> reProList = commonService.selectList("HzmSample.SAMPLE_PROCEDURE",searchMap);


		request.put("reProList", reProList);
		return "sample";
	}
	
	public String hzm_demo() {
//		shopId = getBackSessionShopId().toString();
//		// 商品详情
//		Map<String, Object> searchMap = new HashMap<String, Object>();
//		searchMap.put("shopId", shopId); // shopId
//		List<Map<String,Object>> reProList = commonService.selectList("HzmSample.SAMPLE_PROCEDURE",searchMap);
//		request.put("reProList", reProList);
		return "hzm_demo";
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
