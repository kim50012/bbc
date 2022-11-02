package com.waremec.wxi.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.wxi.domain.DKFAcountDomain;
import com.waremec.wxi.domain.GroupDomain;
import com.waremec.wxi.domain.WeiXinCustom;
import com.waremec.wxi.domain.WeiXinSeatMsg;
import com.waremec.weixin.utils.EncryptUtils;
import com.waremec.wxi.service.WxiDkfFileUploadService;
import com.waremec.wxi.service.WxiDkfService;
@Controller("wxiDkfAction")
@Scope(ScopeType.prototype)
public class WxiDkfAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Resource
	private WxiDkfService wxiDkfService;
	@Resource
	private WxiDkfFileUploadService wxiDkfFileUploadService;
	
	private String kfAcount;
	private String keyword;
	private String status;
	private String keywordIndex;
	private String groupCode;
	
    private String fileName="";
    private File logo_input;
    private File newsPicId;
	
    
    private String groupName;
    private String keyWordAll;
    private String keyWordGroupCodeAll;
    private String jobType;
    private String accountName;
    private String headImgUrl;
    private String nickName;
    private String passWord;
    private String filePath;
    private String userGroupCode;
	private String keywordGroup;
	private String newsPicType;
	private String arsTitle;
	private String arsImage;
	private String arsContent;
	private String arsUrl;
	private String keywordType;
	private String keyWordGroupName;
	private String keyWordGroupCode;
	private String shopId;
	private String keyWordBefore;
	

	public String updateKeyword() throws UnsupportedEncodingException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", getBackSessionShopId());
		keyword=new String(keyword.getBytes("ISO-8859-1"),"UTF-8");
		map.put("keyword", keyword);
		List<Map<String,Object>> list = commonService.selectList("wxi.selectKeywordByKey", map);
		ListUtil.convertClob2String(list);
//		ListUtil.printListMap(newsList);
		request.put("list", list);
		List<GroupDomain> keywordGroupList = wxiDkfService.keywordGroupList(getBackSessionShopId());
		request.put("groupCode",groupCode);
		request.put("keywordGroupList", keywordGroupList);
		request.put("keywordGroupCode",list.get(0).get("KEYWORDGROUP_CODE") );
		request.put("keyword",keyword );
		request.put("arsType",list.get(0).get("ARS_TYPE") );
		return "updateKeyword";
	}
	public String saveUpdateKeyword(){
		Integer	result = wxiDkfService.keywordUpdate(getBackSessionShopId(),keywordGroup,keyword,newsPicType,arsTitle,arsImage,arsContent,arsUrl,keywordType,keyWordBefore);
  		renderJSON(result.toString());
  		return NONE;
	}
	public String dkfManager(){
		
		session.put(SessionUtils.BACK_SHOP_ID_SESSION, shopId);
		
		return "dkfManager";
	}
		
	public String saveNewsPic(){
		JSONObject jo = wxiDkfFileUploadService.saveHeadImage(newsPicId, fileName);
		renderHtml(jo.toJSONString());
		return NONE;
	}
	
	public String addKeyword(){
  		Integer	result = wxiDkfService.keywordInsert(getBackSessionShopId(),keywordGroup,keyword,newsPicType,arsTitle,arsImage,arsContent,arsUrl,keywordType);
  		renderJSON(result.toString());
		return NONE;
	}
	
	public String removeKeyword(){
		
		Integer result = wxiDkfService.removeKeyword(keywordIndex,getBackSessionShopId());
		renderJSON(result.toString());
		return NONE;
	}
	public String worker_account(){
		
		return "worker_account";
	}
	
	public String getKfAcount() {
		return kfAcount;
	}

	public void setKfAcount(String kfAcount) {
		this.kfAcount = kfAcount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getKeywordIndex() {
		return keywordIndex;
	}

	public void setKeywordIndex(String keywordIndex) {
		this.keywordIndex = keywordIndex;
	}
	
	public String MCS_ClientNotify(){
		
		
		return "MCS_ClientNotify";
	}
	
	public String custInfo(){
		
		return "custInfo";
	}
	
	public String goodsList(){
		
		return "goodsList";
	}
	
	public String consultHist(){
		
		return "consultHist";
	}
	public String seatManage(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("accountName",StringUtil.emptyToNull(accountName));
		map.put("shopId", getBackSessionShopId());
		List<Map<String,Object>> list = commonService.selectList("wxi.selectSeatAccount",map);
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			String accountAll = "";
			String headAll = "";
			String nickNameAll="";
			String accountAll1 = "";
			String headAll1 = "";
			String nickNameAll1="";
			String accountAll2 = "";
			String headAll2 = "";
			String nickNameAll2="";
			String accountAll3 = "";
			String headAll3 = "";
			String nickNameAll3="";
			List<WeiXinSeatMsg> seatList = wxiDkfService.getSeatList(getBackSessionShopId());
			if(!seatList.isEmpty()){
				int numU = 0;
				if(list.isEmpty()){
					
				}else{
					for(int i = 0;i<list.size();i++){
						String accountNow = (String) list.get(i).get("ACCOUNT");
						boolean flagDelete = true;
						for(WeiXinSeatMsg seatMsg:seatList){
							String kfAccount = seatMsg.getKf_account();
							if(kfAccount.equals(accountNow) || kfAccount == accountNow){
								flagDelete = false;
							}
						}
						if(flagDelete){
							Map<String,Object> map1 = new HashMap<String,Object>();
							map1.put("accountName", accountNow);
							map1.put("keyWordAll", null);
							map1.put("passWord", null);
							map1.put("keyWordGroupCodeAll", null);
							map1.put("jobType", "U");
							map1.put("nickName",null);
							map1.put("headImgUrl", null);
							map1.put("userGroupCode", null);
							map1.put("shopId", getBackSessionShopId());
							commonService.select("wxi.saveSeat", map1);
						}
					}
				}
				for(WeiXinSeatMsg seatMsg:seatList){
					boolean flagHave = true;
					if(list.isEmpty()){
						flagHave = true;
					}else{
						String kfAccount = seatMsg.getKf_account();
						String headImg = seatMsg.getKf_headimgurl();
						String nickNameC = seatMsg.getKf_nick();
						String accountNow = "";
						String headImgNow = "";
						String nickNameNow = "";
						for(int i = 0;i<list.size();i++){
							accountNow = (String) list.get(i).get("ACCOUNT");
							headImgNow = (String) list.get(i).get("HEAD");
							nickNameNow = (String) list.get(i).get("NICKNAME");
							if(kfAccount.equals(accountNow) || kfAccount == accountNow){
								flagHave = false;
								if((headImg.equals(headImgNow) || headImg == headImgNow)&&(nickNameC == nickNameNow || nickNameC.equals(nickNameNow))){
									
								}else{
									numU++;
									if(numU<=33){
										accountAll1 += seatMsg.getKf_account()+",";
										nickNameAll1 += seatMsg.getKf_nick()+",";
										headAll1 += seatMsg.getKf_headimgurl()+",";
									}else if(numU >33 && numU <= 66){
										accountAll2 += seatMsg.getKf_account()+",";
										nickNameAll2 += seatMsg.getKf_nick()+",";
										headAll2 += seatMsg.getKf_headimgurl()+",";
									}else{
										accountAll3 += seatMsg.getKf_account()+",";
										nickNameAll3 += seatMsg.getKf_nick()+",";
										headAll3 += seatMsg.getKf_headimgurl()+",";
									}
									
								}
								break;
							}
						}
					}
					if(flagHave){
						accountAll += seatMsg.getKf_account()+",";
						nickNameAll += seatMsg.getKf_nick()+",";
						headAll += seatMsg.getKf_headimgurl()+",";
					}
				}
				if(accountAll == ""){
					
				}else{
					accountAll = accountAll.substring(0,accountAll.length()-1);
					nickNameAll = nickNameAll.substring(0,nickNameAll.length()-1);
					headAll = headAll.substring(0,headAll.length()-1);
					map.put("accountAll", accountAll);
					map.put("nickNameAll", nickNameAll);
					map.put("headAll",headAll);
					map.put("keyWordAll", "");
					map.put("passWord", "");
					map.put("keyWordGroupCodeAll", "");
					map.put("jobType", "C");
					map.put("nickName","");
					map.put("headImgUrl", "");
					map.put("userGroupCode", "");
					result = commonService.select("wxi.saveSeatOther", map);
				}
				if(accountAll1 != ""){
					accountAll1 = accountAll1.substring(0,accountAll1.length()-1);
					nickNameAll1 = nickNameAll1.substring(0,nickNameAll1.length()-1);
					headAll1 = headAll1.substring(0,headAll1.length()-1);
					map.put("accountAll", accountAll1);
					map.put("nickNameAll", nickNameAll1);
					map.put("headAll",headAll1);
					map.put("jobType", "H");
					result = commonService.select("wxi.saveSeatOther", map);
				}
				if(accountAll2 != ""){
					accountAll2 = accountAll2.substring(0,accountAll2.length()-1);
					nickNameAll2 = nickNameAll2.substring(0,nickNameAll2.length()-1);
					headAll2 = headAll2.substring(0,headAll2.length()-1);
					map.put("accountAll", accountAll2);
					map.put("nickNameAll", nickNameAll2);
					map.put("headAll",headAll2);
					map.put("jobType", "H");
					result = commonService.select("wxi.saveSeatOther", map);
				}
				if(accountAll3 != ""){
					accountAll3 = accountAll3.substring(0,accountAll3.length()-1);
					nickNameAll3 = nickNameAll3.substring(0,nickNameAll3.length()-1);
					headAll3 = headAll3.substring(0,headAll3.length()-1);
					map.put("accountAll", accountAll3);
					map.put("nickNameAll", nickNameAll3);
					map.put("headAll",headAll3);
					map.put("jobType", "H");
					result = commonService.select("wxi.saveSeatOther", map);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		List<Map<String,Object>> list1 = commonService.selectList("wxi.selectSeatAccount",map);
		request.put("list", list1);
		return "seatManage";
	}
	
	public String keyWordList(){
		List<GroupDomain> groupList = wxiDkfService.keywordGroupList(getBackSessionShopId());
		List<DKFAcountDomain> keywordList = wxiDkfService.keywordList(getBackSessionShopId());
		request.put("groupList", groupList);
		request.put("keywordList", keywordList);
		return "keyWordList";
	}
	public String seatAdd(){
		//List<GroupDomain> groupList = dkfService.keywordGroupList();
		//List<DKFAcountDomain> keywordList = dkfService.keywordList();
		//request.put("groupList", groupList);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupName",null);
		map.put("shopId", getBackSessionShopId());
		List<Map<String,Object>> list = commonService.selectList("wxi.selectSeatGroup",map); 
		request.put("list", list);
		String str="";
		try{
			str = wxiDkfService.getSeatMsg(getBackSessionShopId());
			if(StringUtil.emptyToNull(accountName)==null ){
				//request.put("keywordList", keywordList);
				map.put("groupName","SS-123@");
				map.put("accountName", "SS-123@");
				List<Map<String,Object>> list1 = commonService.selectList("wxi.selectSeatGroup",map); 
				request.put("keywordList", list1);
			}else{
				map.put("groupName",StringUtil.emptyToNull(accountName));
				List<Map<String,Object>> list1 = commonService.selectList("wxi.selectSeatGroup",map); 
				request.put("keywordList", list1);
				map.put("accountName", accountName);
				Map<String,Object> mapResult = commonService.select("wxi.selectSeatAccount",map);
				String accountNow = (String) mapResult.get("ACCOUNT");
				String[] str1 = accountNow.split(str);
				mapResult.put("ACCOUNT", str1[0]);
				request.put("map", mapResult);
			}
			List<Map<String,Object>> list2 = commonService.selectList("wxi.selectKeyWordGroupList",map);
			request.put("groupList", list2);
			request.put("accountName", accountName);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		request.put("str", str);
		return "seatAdd";
	}
	public String seatGroupManage(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupName",StringUtil.emptyToNull(groupName));
		map.put("shopId", getBackSessionShopId());
		List<Map<String,Object>> list = commonService.selectList("wxi.selectSeatGroup",map); 
		request.put("list", list);
		return "seatGroupManage";
	}
	public String seatGroupAdd(){
		//List<GroupDomain> groupList = dkfService.keywordGroupList();
		//List<DKFAcountDomain> keywordList = dkfService.keywordList();
		//request.put("groupList", groupList);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", getBackSessionShopId());
		try{
			if(StringUtil.emptyToNull(groupName)==null ){
				map.put("groupName","SS321@");
				map.put("accountName", "SS-123@");
				List<Map<String,Object>> list = commonService.selectList("wxi.selectSeatGroup",map);
				request.put("keywordList", list);
			}else{
				groupName=new String(groupName.getBytes("ISO-8859-1"),"UTF-8");
				map.put("accountName", groupName);
				map.put("groupName",StringUtil.emptyToNull(groupName));
				List<Map<String,Object>> list = commonService.selectList("wxi.selectSeatGroup",map);
				request.put("keywordList", list);
			}
			List<Map<String,Object>> list2 = commonService.selectList("wxi.selectKeyWordGroupList",map);
			request.put("groupList", list2);
			request.put("groupName", groupName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "seatGroupAdd";
	}
	/**
	 * @author wangbin
	 * @desc 保存坐席组
	 * @return 成功与否
	 */
	public String saveSeatGroup(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("groupName", groupName);
		map.put("keyWordAll", keyWordAll);
		map.put("keyWordGroupCodeAll", keyWordGroupCodeAll);
		map.put("jobType", jobType);
		map.put("groupStatus", 1);
		map.put("shopId", getBackSessionShopId());
		Map<String,Object> result = commonService.select("wxi.saveSeatGroup", map);
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("result", result);
		renderJSON(maps);
		
		return NONE;
	}
	public String deleteSeat(){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			wxiDkfService.deleteDKFAccount(accountName,getBackSessionShopId());
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("accountName", accountName);
			map.put("keyWordAll", keyWordAll);
			map.put("passWord", passWord);
			map.put("keyWordGroupCodeAll", keyWordGroupCodeAll);
			map.put("jobType", jobType);
			map.put("nickName",nickName);
			map.put("headImgUrl", headImgUrl);
			map.put("userGroupCode", userGroupCode);
			map.put("shopId", getBackSessionShopId());
			result = commonService.select("wxi.saveSeat", map);
		}catch(Exception e){
			e.printStackTrace();
			result.put("OUT_ERR_MSG", "操作失败");
		}
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("result", result);
		renderJSON(maps);
		return NONE;
	}
	public String saveSeat(){
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String,Object> result = new HashMap<String,Object>();
		map.put("accountName", accountName);
		map.put("shopId", getBackSessionShopId());
		try{
			WeiXinCustom weiXinCustom = new WeiXinCustom();
			weiXinCustom.setKf_account(accountName);
			weiXinCustom.setNickname(nickName);
			weiXinCustom.setPassword(EncryptUtils.MD5(passWord));
			if(jobType.equals("I")){
				Integer countNum = (Integer) commonService.selectToObject("wxi.selectSeatByName", map);
				if(countNum > 0){
					result.put("OUT_ERR_MSG", "客服账号已存在");
					Map<String, Object> maps = new HashMap<String, Object>();
					maps.put("result", result);
					renderJSON(maps);
					return NONE;
				}
				wxiDkfService.saveDKFAccount(weiXinCustom,getBackSessionShopId());
				wxiDkfService.sendHeadImg(filePath,accountName,getBackSessionShopId());
			}else{
				wxiDkfService.updateDKFAccount(weiXinCustom,getBackSessionShopId());
				if(StringUtil.emptyToNull(filePath) != null){
					wxiDkfService.sendHeadImg(filePath,accountName,getBackSessionShopId());
				}
			}
			map.put("keyWordAll", keyWordAll);
			map.put("passWord", passWord);
			map.put("keyWordGroupCodeAll", keyWordGroupCodeAll);
			map.put("jobType", jobType);
			map.put("nickName",nickName);
			map.put("headImgUrl", headImgUrl);
			map.put("userGroupCode", userGroupCode);
			result = commonService.select("wxi.saveSeat", map);
		}catch(Exception e){
			e.printStackTrace();
			result.put("OUT_ERR_MSG", "操作失败");
		}
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("result", result);
		renderJSON(maps);
		return NONE;
	}
	public String selectMasterSeat(){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("shopId", getBackSessionShopId());
			map.put("accountName", accountName);
			map.put("keyWordAll", keyWordAll);
			map.put("passWord", passWord);
			map.put("keyWordGroupCodeAll", keyWordGroupCodeAll);
			map.put("jobType", jobType);
			map.put("nickName",nickName);
			map.put("headImgUrl", headImgUrl);
			map.put("userGroupCode", userGroupCode);
			result = commonService.select("wxi.saveSeat", map);
		}catch(Exception e){
			e.printStackTrace();
			result.put("OUT_ERR_MSG", "操作失败");
		}
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("result", result);
		renderJSON(maps);
		return NONE;
	}
	public String keyWorldGroupManage(){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", getBackSessionShopId());
		List<Map<String,Object>> list = commonService.selectList("wxi.selectKeyWordGroup",map); 
		request.put("list", list);
		
		return "keyWorldGroupManage";
	}
	public String saveKeyWordGroup(){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("shopId", getBackSessionShopId());
			map.put("keyWordGroupName", keyWordGroupName);
			map.put("jobType", jobType);
			map.put("keyWordGroupCode",keyWordGroupCode);
			result = commonService.select("wxi.saveKeyWordGroup", map);
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("result", result);
		renderJSON(maps);
		return NONE;
	}
	public String getKeyWordListByGroup(){
		Map<String, Object> maps = new HashMap<String, Object>();
		try{
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("shopId", getBackSessionShopId());
			map.put("userGroupCode", userGroupCode);
			List<Map<String,Object>> list = commonService.selectList("wxi.getKeyWordList", map);
			maps.put("list", list);
		}catch(Exception e){
			e.printStackTrace();
		}
		renderJSON(maps);
		return NONE;
	}
	public String keywordAdd(){
		
		List<GroupDomain> keywordGroupList = wxiDkfService.keywordGroupList(getBackSessionShopId());
		String groupName = "";
		try {
			groupName=new String(groupCode.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.put("groupName",groupName);
		request.put("keywordGroupList", keywordGroupList);
		return "keywordAdd";
	}
	
	public String getGroupCode() {
		return groupCode;
	}

	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	
	public String saveHeadImage(){
		
		JSONObject jo = wxiDkfFileUploadService.saveHeadImage(logo_input, fileName);
		renderHtml(jo.toJSONString());
		return NONE;
	}
	
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public File getLogo_input() {
		return logo_input;
	}

	public void setLogo_input(File logo_input) {
		this.logo_input = logo_input;
	}


	public File getNewsPicId() {
		return newsPicId;
	}

	public void setNewsPicId(File newsPicId) {
		this.newsPicId = newsPicId;
	}


	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getKeyWordAll() {
		return keyWordAll;
	}

	public void setKeyWordAll(String keyWordAll) {
		this.keyWordAll = keyWordAll;
	}

	public String getKeyWordGroupCodeAll() {
		return keyWordGroupCodeAll;
	}

	public void setKeyWordGroupCodeAll(String keyWordGroupCodeAll) {
		this.keyWordGroupCodeAll = keyWordGroupCodeAll;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getHeadImgUrl() {
		return headImgUrl;
	}

	public void setHeadImgUrl(String headImgUrl) {
		this.headImgUrl = headImgUrl;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getUserGroupCode() {
		return userGroupCode;
	}

	public void setUserGroupCode(String userGroupCode) {
		this.userGroupCode = userGroupCode;
	}

	 
	public String getKeywordGroup() {
		return keywordGroup;
	}

	public void setKeywordGroup(String keywordGroup) {
		this.keywordGroup = keywordGroup;
	}

	public String getNewsPicType() {
		return newsPicType;
	}

	public void setNewsPicType(String newsPicType) {
		this.newsPicType = newsPicType;
	}

	public String getArsTitle() {
		return arsTitle;
	}

	public void setArsTitle(String arsTitle) {
		this.arsTitle = arsTitle;
	}

	public String getArsImage() {
		return arsImage;
	}

	public void setArsImage(String arsImage) {
		this.arsImage = arsImage;
	}

	public String getArsContent() {
		return arsContent;
	}

	public void setArsContent(String arsContent) {
		this.arsContent = arsContent;
	}

	public String getArsUrl() {
		return arsUrl;
	}

	public void setArsUrl(String arsUrl) {
		this.arsUrl = arsUrl;
	}

	public String getKeywordType() {
		return keywordType;
	}

	public void setKeywordType(String keywordType) {
		this.keywordType = keywordType;
	}

	public String getKeyWordGroupName() {
		return keyWordGroupName;
	}

	public void setKeyWordGroupName(String keyWordGroupName) {
		this.keyWordGroupName = keyWordGroupName;
	}

	public String getKeyWordGroupCode() {
		return keyWordGroupCode;
	}

	public void setKeyWordGroupCode(String keyWordGroupCode) {
		this.keyWordGroupCode = keyWordGroupCode;
	}

 

	public WxiDkfService getWxiDkfService() {
		return wxiDkfService;
	}

	public void setWxiDkfService(WxiDkfService wxiDkfService) {
		this.wxiDkfService = wxiDkfService;
	}

	public WxiDkfFileUploadService getWxiDkfFileUploadService() {
		return wxiDkfFileUploadService;
	}

	public void setWxiDkfFileUploadService(
			WxiDkfFileUploadService wxiDkfFileUploadService) {
		this.wxiDkfFileUploadService = wxiDkfFileUploadService;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getKeyWordBefore() {
		return keyWordBefore;
	}
	public void setKeyWordBefore(String keyWordBefore) {
		this.keyWordBefore = keyWordBefore;
	}
}
