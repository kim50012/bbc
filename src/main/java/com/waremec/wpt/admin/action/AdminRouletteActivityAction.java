package com.waremec.wpt.admin.action;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
@Controller("adminRouletteActivityAction")
@Scope(ScopeType.prototype)
public class AdminRouletteActivityAction  extends BaseAction {
	private static final long serialVersionUID = 1L;
	private String bgImgUrl="";
	private String itemIdStr="";
	private String winPointStr="";
	private String msgStr="";
	private String winVoucherStr="";
	private String winHongBaoStr="";
	private String gameLimitCntStr="";
	private String winTypeStr="";
	private String gameName="";
	private String gameStartDate="";
	private String gameEndDate="";
	private String fileName1="";
	private String fileName2="";
	private File bgImgFile=null;
	private File rouletteImdFile=null;
	private String jobType="";
	private String userId="";
	private String shopId="";
	private String gameId="";
	private String gameLimitCnt="";
	private String isUse="";
	private String isDelete="";
	private String rouletteImgUrl="";
	private String custChanceNum="";
	public String rouletteActivity(){
		try{
			userId=getBackSessionUserId();
			shopId = getBackSessionShopId().toString();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", shopId);
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("gameName", StringUtil.emptyToNull(gameName));
			List<Map<String,Object>> list=commonService.selectList("RouletteActivity.selectRouletteActivityList", map);
			request.put("list", list);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr,pageUnit, totalCount , list);
			}
			
			request.put("page", page);
			request.put("gameName", gameName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "rouletteActivity";
	}
	public String rouletteListFragment(){
		try{
			userId=getBackSessionUserId();
			shopId = getBackSessionShopId().toString();
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("shopId", shopId);
			map.put("pageCurr", pageCurr);
			map.put("pageUnit", pageUnit);
			map.put("gameName", StringUtil.emptyToNull(gameName));
			List<Map<String,Object>> list=commonService.selectList("RouletteActivity.selectRouletteActivityList", map);
			request.put("list", list);
			PageData page = new PageData();
			if (!list.isEmpty()) {
				int totalCount = IntegerUtils.valueOf(list.get(0).get("TOTAL_CNT"));
				page = new PageData(pageCurr,pageUnit, totalCount , list);
			}
			
			request.put("page", page);
			request.put("gameName", gameName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "rouletteListFragment";
	}
	public String addRouletteActivity(){
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		Map<String,Object> mapResult=commonService.select("RouletteActivity.selectShopMsg", map);
		request.put("map", mapResult);
		return "addRouletteActivity";
	}
	//保存摇奖活动信息
	public String saveRouletteActivity(){
		String ret="success";
		/*String [] date1=gameStartDate.split("-");
		gameStartDate=date1[0]+date1[1]+date1[2];
		String [] date2=gameEndDate.split("-");
		gameEndDate=date2[0]+date2[1]+date2[2];*/
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		UploadResult result = UploadFileUtil.upload(getRequest(), rouletteImdFile, fileName2, UploadFileUtil.UPLOAD_LOGO);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("jobType",jobType);
		map.put("userId", userId);
		map.put("shopId", shopId);
		map.put("gameId", StringUtil.emptyToNull(gameId));
		map.put("gameLimitCnt", gameLimitCnt);
		map.put("rouletteImgUrl", result.getFileUrl());
		map.put("isUse", isUse);
		map.put("isDelete", isDelete);
		map.put("createdDate", new Date());
		map.put("createdId", userId);
		map.put("modifyDate", null);
		map.put("modifyId", null);
		map.put("bgImgUrl",bgImgUrl);
		map.put("itemIdStr",itemIdStr);
		map.put("winPointStr",winPointStr);
		map.put("msgStr",msgStr);
		map.put("winVoucherStr",winVoucherStr);
		map.put("winHongBaoStr",winHongBaoStr);
		map.put("gameLimitCntStr",gameLimitCntStr);
		map.put("winTypeStr",winTypeStr);
		map.put("gameName",gameName);
		map.put("gameStartDate",gameStartDate);
		map.put("gameEndDate",gameEndDate);
		map.put("bgImgFile",fileName1);
		map.put("rouletteImgFile",fileName2);
		map.put("custChanceNum", custChanceNum);
		Map<String,Object> mapResult=commonService.select("RouletteActivity.saveRouletteActivity", map);
		Integer gameIdOut=(Integer) mapResult.get("OUT_GAME_ID");
		if(gameIdOut==0 || gameIdOut==null){
			ret="fail";
		}
		JSONObject jo = new JSONObject();
		jo.put("ret",ret);
		renderHtml(jo.toString());
		return NONE;
	}
	public String saveUpdateRouletteActivity(){
		String ret="success";
		if(rouletteImdFile==null){
			
		}else{
			UploadResult result = UploadFileUtil.upload(getRequest(), rouletteImdFile, fileName2, UploadFileUtil.UPLOAD_LOGO);
			rouletteImgUrl=result.getFileUrl();
		}
		/*if(gameStartDate!=""){
			String [] date1=gameStartDate.split("-");
			gameStartDate=date1[0]+date1[1]+date1[2];
			String [] date2=gameEndDate.split("-"); 
			gameEndDate=date2[0]+date2[1]+date2[2];
		}*/
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("jobType",jobType);
		map.put("userId", userId);
		map.put("shopId", shopId);
		map.put("gameId", StringUtil.emptyToNull(gameId));
		map.put("gameLimitCnt", gameLimitCnt);
		map.put("rouletteImgUrl", rouletteImgUrl);
		map.put("isUse", isUse);
		map.put("isDelete", isDelete);
		map.put("createdDate", new Date());
		map.put("createdId", userId);
		map.put("modifyDate", null);
		map.put("modifyId", null);
		map.put("bgImgUrl",bgImgUrl);
		map.put("itemIdStr",itemIdStr);
		map.put("winPointStr",winPointStr);
		map.put("msgStr",msgStr);
		map.put("winVoucherStr",winVoucherStr);
		map.put("winHongBaoStr",winHongBaoStr);
		map.put("gameLimitCntStr",gameLimitCntStr);
		map.put("winTypeStr",winTypeStr);
		map.put("gameName",gameName);
		map.put("gameStartDate",gameStartDate);
		map.put("gameEndDate",gameEndDate);
		map.put("bgImgFile",fileName1);
		map.put("rouletteImgFile",fileName2);
		map.put("custChanceNum",custChanceNum);
		Map<String,Object> mapResult=commonService.select("RouletteActivity.saveRouletteActivity", map);
		Integer gameIdOut=(Integer) mapResult.get("OUT_GAME_ID");
		if(gameIdOut==0 || gameIdOut==null){
			ret="fail";
		}
		JSONObject jo = new JSONObject();
		jo.put("ret",ret);
		renderHtml(jo.toString());
		return NONE;
	}
	//保存背景图片
	public String saveRouletteActivityImg(){
		JSONObject jo = new JSONObject();
		if(bgImgFile==null){
			jo.put("fileUrl","1");
		}else{
			UploadResult result = UploadFileUtil.upload(getRequest(), bgImgFile, fileName1, UploadFileUtil.UPLOAD_LOGO);
			jo.put("fileUrl",result.getFileUrl());
		}
		renderHtml(jo.toString());
		return NONE;
	}
	//打开修改摇奖活动信息的页面
	public String updateRouletteActivity(){
		Map<String,Object> map=new HashMap<String,Object>();
		userId=getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		map.put("shopId", shopId);
		map.put("gameId", gameId);
		List<Map<String,Object>> list=commonService.selectList("RouletteActivity.selectRouletteActivityModify", map);
		request.put("list", list);
		Map<String,Object> mapResult=commonService.select("RouletteActivity.selectShopMsg", map);
		request.put("map", mapResult);
		return "updateRouletteActivity";
	}
	public String getBgImgUrl() {
		return bgImgUrl;
	}
	public void setBgImgUrl(String bgImgUrl) {
		this.bgImgUrl = bgImgUrl;
	}
	public String getItemIdStr() {
		return itemIdStr;
	}
	public void setItemIdStr(String itemIdStr) {
		this.itemIdStr = itemIdStr;
	}
	public String getWinPointStr() {
		return winPointStr;
	}
	public void setWinPointStr(String winPointStr) {
		this.winPointStr = winPointStr;
	}
	public String getMsgStr() {
		return msgStr;
	}
	public void setMsgStr(String msgStr) {
		this.msgStr = msgStr;
	}
	public String getWinVoucherStr() {
		return winVoucherStr;
	}
	public void setWinVoucherStr(String winVoucherStr) {
		this.winVoucherStr = winVoucherStr;
	}
	public String getWinHongBaoStr() {
		return winHongBaoStr;
	}
	public void setWinHongBaoStr(String winHongBaoStr) {
		this.winHongBaoStr = winHongBaoStr;
	}
	public String getGameLimitCntStr() {
		return gameLimitCntStr;
	}
	public void setGameLimitCntStr(String gameLimitCntStr) {
		this.gameLimitCntStr = gameLimitCntStr;
	}
	public String getWinTypeStr() {
		return winTypeStr;
	}
	public void setWinTypeStr(String winTypeStr) {
		this.winTypeStr = winTypeStr;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getGameStartDate() {
		return gameStartDate;
	}
	public void setGameStartDate(String gameStartDate) {
		this.gameStartDate = gameStartDate;
	}
	public String getGameEndDate() {
		return gameEndDate;
	}
	public void setGameEndDate(String gameEndDate) {
		this.gameEndDate = gameEndDate;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public File getBgImgFile() {
		return bgImgFile;
	}
	public void setBgImgFile(File bgImgFile) {
		this.bgImgFile = bgImgFile;
	}
	public File getRouletteImdFile() {
		return rouletteImdFile;
	}
	public void setRouletteImdFile(File rouletteImdFile) {
		this.rouletteImdFile = rouletteImdFile;
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
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getGameId() {
		return gameId;
	}
	public void setGameId(String gameId) {
		this.gameId = gameId;
	}
	public String getGameLimitCnt() {
		return gameLimitCnt;
	}
	public void setGameLimitCnt(String gameLimitCnt) {
		this.gameLimitCnt = gameLimitCnt;
	}
	public String getIsUse() {
		return isUse;
	}
	public void setIsUse(String isUse) {
		this.isUse = isUse;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public String getRouletteImgUrl() {
		return rouletteImgUrl;
	}
	public void setRouletteImgUrl(String rouletteImgUrl) {
		this.rouletteImgUrl = rouletteImgUrl;
	}
	public String getCustChanceNum() {
		return custChanceNum;
	}
	public void setCustChanceNum(String custChanceNum) {
		this.custChanceNum = custChanceNum;
	}
}
