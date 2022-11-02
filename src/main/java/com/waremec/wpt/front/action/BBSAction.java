package com.waremec.wpt.front.action;

import java.io.File;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.waremec.framework.common.DiffConfig;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.service.CommonService;
import com.waremec.framework.utilities.Hzm_StopPageType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.wpt.front.domain.SessionSkin;

@Controller("bbsAction")
@Scope(ScopeType.prototype)
public class BBSAction extends WeixinBaseAction{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	@Qualifier("weixinTemplateMessageService")
	protected WeixinTemplateMessageService weixinTemplateMessageService;
	
	private int custSysId;
	private int pageCurr;
	private int pageUnit;
	private int bbsParentId;
	private int loginFlag;
	private String flag;
	//店铺Id号
	private int shopId;
	//存储文件
	private File fileEntity;
	//存储店铺标志图片的名字
    private String logoFileName="";
    //文件id
    private String fileId="";
    //更新时间
    private String modifiedId="";
  //公告id
    private String bbsId="";
    //标题
    private String title="";
    //内容
    private String body="";
    //图片id1
    private String imgId1="";
    //图片id2
    private String imgId2="";
    //图片id3
    private String imgId3="";
    //图片id4
    private String imgId4="";
    //图片id5
    private String imgId5="";
    //图片id6
    private String imgId6="";
    //图片id7
    private String imgId7="";
    //图片id8
    private String imgId8="";
    //图片id9
    private String imgId9="";
    //图片id10
    private String imgId10="";
    //图片id11
    private String imgId11="";
    //图片id12
    private String imgId12="";
    //图片id13
    private String imgId13="";
    //图片id14
    private String imgId14="";
    //图片id15
    private String imgId15="";
    //图片id16
    private String imgId16="";
    //图片id17
    private String imgId17="";
    //图片id18
    private String imgId18="";
    //图片id19
    private String imgId19="";
    //图片id20
    private String imgId20="";
    //创建时间
    private String createDt="";
    private String jobType="";
    private String bbsSts="";
    private String bbsType="";
    private String qianMing="";
    private String phone="";

    
    
	public String list(){
		
		long startTime = System.currentTimeMillis();
		
		jsSdkStting();
		
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
		Map<String, Object> map = new HashMap<String, Object>();
		
//		int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", pageCurr*5);
		map.put("ORDERBY", null);
		map.put("BBS_TYPE", bbsType);
		List<Map<String, Object>> list = commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		map.put("PARENT_ID", 0);
		List<Map<String, Object>> publishList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		map.put("PAGE_UINT", 99999);
		map.put("PARENT_ID", 1);
		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("list", list);
		request.put("publishList", publishList);
		request.put("replyList", replyList);
		if(publishList.size()>0){
			int totalCount=(Integer)(publishList.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%5==0?totalCount/5:totalCount/5+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		request.put("custSysId", custSysId);
		request.put("bbsType", bbsType);
		request.put("loginFlag", loginFlag);
		
		map.put("CUST_SYS_ID", custSysId);
		map.put("SHOP_ID", shopId);
    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",map);
    	String nickName = "无名氏";
    	if(custMap!=null){
    		nickName = custMap.get("CUST_NICK_NM").toString();
    	}
		
    	request.put("nickName", nickName);
    	request.put("pageCurr", pageCurr);
		LogUtils.getMethodExecuteTime(startTime);
		
		return "list";
		
		
	}
	//朋友圈预览
	public String hzm_Moments(){
		String templateId = null;
		//查询正在使用的模板
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("SHOP_ID", shopId);
		queryMap.put("SET_ID", Hzm_StopPageType.FRIENDS_TYPE);
		List<Map<String, Object>> templateList = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",queryMap);
		
		if(!templateList.isEmpty()){
			templateId = String.valueOf(templateList.get(0).get("VAL_INT"));
			request.put("templateId", templateId );
		}
		
		queryMap.clear();
		
		//查询模板使用的图片
		queryMap.put("SHOP_ID", shopId);
		queryMap.put("SET_ID", Hzm_StopPageType.FRIENDS_TYPE_IMG + templateId + "_%");
		List<Map<String, Object>> imgList = commonService.selectList("AdminGoods.SHOP_SETTING_SELECT",queryMap);
		if(!imgList.isEmpty()){
			request.put("imgList", imgList );
		}
		
		return "hzm_Moments";
	}

	//分页
	public String getNextPage(){
		
//			SessionMember sessionMember = getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
//			int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", pageCurr);
		map.put("PAGE_UINT", pageUnit);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 0);
		map.put("BBS_TYPE", bbsType);
		List<Map<String, Object>> list= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		if(list.size()>0){
			int listSize=list.size();
			int totalCount=(Integer)(list.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%pageUnit==0?totalCount/pageUnit:totalCount/pageUnit+1;
			if(pageCurr<totalPage){
				renderJSON(list);
			}else if(pageCurr==totalPage){
				int lastPageCount=totalCount%pageUnit;
				if(lastPageCount==1){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==2){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==3){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==4){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}else if(lastPageCount==0){
					List<Map<String, Object>> lastPageList=new ArrayList<Map<String, Object>>();
					lastPageList.add(list.get(listSize-5));
					lastPageList.add(list.get(listSize-4));
					lastPageList.add(list.get(listSize-3));
					lastPageList.add(list.get(listSize-2));
					lastPageList.add(list.get(listSize-1));
					renderJSON(lastPageList);
				}
				
			}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
			}
			request.put("pageCount", totalPage);
		}else{
				List<Map<String, Object>> listEmpty=new ArrayList<Map<String, Object>>();
				renderJSON(listEmpty);
		}
		
		return NONE;
	}
		
	//获取分页的评论内容
	public String getNextPageReply(){
		
//			SessionMember sessionMember = getSessionMember();
		Map<String, Object> map = new HashMap<String, Object>();
//			int shopId=sessionMember.getShopId();
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", 999999999);
		map.put("ORDERBY", null);
		map.put("PARENT_ID", 1);
		map.put("BBS_TYPE", bbsType);
		List<Map<String, Object>> list= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		renderJSON(list);
		return NONE;
	}
	
	public String couponPublish() throws Exception{
		
		logger.info("1111111111111111111111111111111111");
		//获取优惠券id
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}

		map.put("custSysId", custSysId);
		map.put("userId", custSysId);
		map.put("bbsType", bbsType);
	    try {
			map=commonService.select("BBS.bbsCouponPublish",map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    logger.info("222222222222222222222222222222222");
	    if(map.get("OUT_ERR_MSG").toString().equals("S")){
	    	logger.info("3333333333333333333333333333333");
	    	String couponId=map.get("COUPON_ID").toString();
	    	map.put("couponId", couponId);
	    	map.put("shopId", shopId);
	    	Map<String,Object> couponMap=commonService.select("BBS.couponSelect",map);
	    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
	    	Date startDate=sdf.parse(couponMap.get("VALIDITY_F_DT1").toString()); 
	    	Date endDate=sdf.parse(couponMap.get("VALIDITY_T_DT1").toString()); 
	    	String couponTitle=couponMap.get("COUPON_NM").toString();
	    	
	    	map.put("SHOP_ID", shopId);
	    	map.put("CUST_SYS_ID", custSysId);
	    	Map<String,Object> custMap=commonService.select("BBS.getCustDetail",map);
	    	String nickName=custMap.get("CUST_NICK_NM").toString();
	    	
	    	AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
	    	
	    	logger.info("444444444444444444444444444444444");
	    	logger.info("=========================================");
	    	logger.info("appInfo==" + appInfo);
	    	logger.info("sessionMember.getOpenid()==" + sessionMember.getOpenid());
	    	logger.info("nickName==" + nickName);
	    	logger.info("couponTitle==" + couponTitle);
	    	logger.info("couponId==" + couponId);
	    	logger.info("startDate==" + startDate);
	    	logger.info("endDate==" + endDate);
	    	logger.info("=========================================");
	    	
	    	weixinTemplateMessageService.sendVoucherMaturityRemind(appInfo,sessionMember.getOpenid() , nickName+",您好",couponTitle,couponId, startDate, endDate, "您有一张10元红包，请点开圃美多商城使用。\n如有问题请在圃美多微信服务号直接向小圃留言~");  
	 	    
	    }
	    map.put("result", map.get("OUT_ERR_MSG").toString());
	    map.put("loginFlag", loginFlag);
	    request.put("loginFlag", loginFlag);
	    renderJSON(map);
		return NONE;
	}
	public String recruitOrder(){
		
		jsSdkStting();
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int custSysId = sessionMember.getCustSysId();
		loginFlag = 0;
		if (sessionSkin != null) {
			loginFlag = 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("bbsType",bbsType);
		map.put("custSysId",custSysId);
		Map<String, Object> Count =commonService.select("BBS.getCount", map);
		int count=(Integer) Count.get("COUNT");
		request.put("bbsType", bbsType);
		request.put("loginFlag", loginFlag);
		request.put("count", count);
		return "recruitOrder";
	}
	//圃美多试吃活动
	public String recruitOrder2(){
		
		jsSdkStting();
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int custSysId = sessionMember.getCustSysId();
		loginFlag = 0;
		if (sessionSkin != null) {
			loginFlag = 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopId", shopId);
		map.put("bbsType",bbsType);
		map.put("custSysId",custSysId);
		Map<String, Object> Count =commonService.select("BBS.getCount", map);
		int count=(Integer) Count.get("COUNT");
		request.put("count", count);
		
		request.put("bbsType", bbsType);
		request.put("loginFlag", loginFlag);
		
		return "recruitOrder2";
	}
	//保存
	public String save(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		int shopId=sessionSkin.getShopId();
		int custSysId = sessionMember.getCustSysId();
		String ret = "success";
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("bbsType",bbsType);
			map.put("bbsId", bbsId);
			map.put("bbsParentId", 0);
			map.put("title", title);
			map.put("body", body);
			map.put("imgId1", imgId1);
			map.put("imgId2", imgId2);
			map.put("imgId3", imgId3);
			map.put("imgId4", imgId4);			
			map.put("imgId5", imgId5);
			map.put("imgId6", imgId6);
			map.put("imgId7", imgId7);
			map.put("imgId8", imgId8);
			map.put("imgId9", imgId9);			
			map.put("imgId10", imgId10);
			map.put("imgId11", imgId11);
			map.put("imgId12", imgId12);
			map.put("imgId13", imgId13);
			map.put("imgId14", imgId14);			
			map.put("imgId15", imgId15);
			map.put("imgId16", imgId16);
			map.put("imgId17", imgId17);
			map.put("imgId18", imgId18);
			map.put("imgId19", imgId19);			
			map.put("imgId20", imgId20);
			map.put("createId", custSysId);
			map.put("createDt", createDt);
			map.put("bbsSts", bbsSts);
			map.put("qianMing", qianMing);
			map.put("phone", phone);
			map.put("jobType", "I");
			
			Map<String, Object> save =commonService.select("BBS.save", map);
		}catch(Exception e){
			e.printStackTrace();
			ret="file";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		returnMap.put("loginFlag", loginFlag);
		returnMap.put("custSysId", custSysId);
		returnMap.put("shopId", shopId);
		renderJSON(returnMap);
		request.put("loginFlag", loginFlag);
		return NONE;
	}
	//图片上传
	public String imgUpload(){
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		int shopId=sessionSkin.getShopId();
		int custSysId = sessionMember.getCustSysId();
		try{
			String ret = "SUCCESS";
			JSONObject jo = new JSONObject();
			UploadResult result = UploadFileUtil.upload(getRequest(), fileEntity, logoFileName, UploadFileUtil.UPLOAD_SHOP);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", shopId);
			map.put("jobType", "I");
			map.put("fileId", fileId);
			map.put("fileNm", result.getOriginalFilename());
			map.put("fileSysNm", result.getDestinationFilename());
			map.put("fileType", 1);
			map.put("fileSize", result.getFileSize());
			map.put("fullUrl", result.getFileUrl());
			map.put("isUse", 1);
			map.put("modifiedId", modifiedId);
			map.put("createdId", custSysId);
			map.put("fileGroup", 3);
			map.put("mediaId",null);
			map.put("imgWidth", result.getWidth());
			map.put("imgHeight", result.getHeight());
			map.put("media_up_dt", null);
			Map<String, Object> imgUpload =commonService.select("BBS.imgUpload", map);
			jo.put("result", ret);
			jo.put("imgUpload", imgUpload);
	  		renderHtml(jo.toJSONString());
		}catch(Exception e){
			e.printStackTrace();
		}
		request.put("loginFlag", loginFlag);
		return NONE;
	}
	
	public String bbsDetail(){
		
		jsSdkStting();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_ID", bbsId);
		map.put("BBS_STS", 2);
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		map.put("USER_ID", custSysId);
		//detail
		Map<String,Object> detail= commonService.select("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		detail.put("loginFlag", loginFlag);
		renderJSON(detail);
		request.put("loginFlag", loginFlag);
		return NONE;
	}
	
	public String detail(){
		
		jsSdkStting();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_ID", bbsId);
		map.put("BBS_STS", 2);
		SessionMember sessionMember = getSessionMember();
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		map.put("USER_ID", custSysId);
		//detail
		Map<String,Object> detail= commonService.select("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("detail", detail);
		//review list
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT",10);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("BBS_ID", null);
//		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("replyList", replyList);
		//bbsLikeList
		map.put("BBS_ID", bbsId);
		List<Map<String, Object>> likeList= commonService.selectList("NewsFeedNongshim.bbsLikeList", map);
		request.put("likeList", likeList);
		
		if(replyList.size()>0){
			int totalCount=(Integer)(replyList.get(0).get("NUM"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		request.put("loginFlag", loginFlag);
		request.put("bbsType", detail.get("BBS_TYPE").toString());
		return "detail";
	}
	
	public String getNextReplyOfDeatil(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("PAGE_CURR", pageCurr);
		map.put("PAGE_UINT",pageUnit);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("BBS_ID", null);
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		map.put("USER_ID", custSysId);
		map.put("BBS_TYPE", bbsType);
		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		renderJSON(replyList);
		return NONE;
	}
	
	public String list2(){
		
//		long startTime = System.currentTimeMillis();
		
		//jsSdkStting();
		
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		int pageCurr = IntegerUtils.valueOf(getRequest().getParameter("pageCurr"),1);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", null);
		map.put("BBS_ID", null);
		map.put("BBS_STS", 2);
		map.put("START_DT", null);
		map.put("END_DT", null);
		map.put("TITLE", null);
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT", pageCurr*5);
		map.put("ORDERBY", null);
		map.put("BBS_TYPE", bbsType);
		List<Map<String, Object>> list = commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		map.put("PARENT_ID", 0);
		List<Map<String, Object>> publishList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		map.put("PAGE_UINT", 99999);
		map.put("PARENT_ID", 1);
		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("list", list);
		request.put("publishList", publishList);
		request.put("replyList", replyList);
		if(publishList.size()>0){
			int totalCount=(Integer)(publishList.get(0).get("TOTAL_PARENT"));
			int totalPage=totalCount%5==0?totalCount/5:totalCount/5+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}

    	map.put("SHOP_ID", shopId);
    	map.put("CUST_SYS_ID", custSysId);
    	map.put("BBS_TYPE", Integer.valueOf(DiffConfig.getValue("bbs.type.pumeiduo.shichibaoming")));
    	map.put("START_DATE", "2015-09-30");
//    	map.put("END_DATE", "2015-09-30");
    	map = commonService.select("BBS.publishedCount",map);
    	if(Integer.valueOf(map.get("PUBLISH_COUNT").toString())==0){
    		request.put("publishFlg", "N");
    	}else{
    		request.put("publishFlg", "Y");
    	}
		request.put("custSysId", custSysId);
		request.put("bbsType", bbsType);
		request.put("loginFlag", loginFlag);
		
		Map<String,Object> custParmasMap = new HashMap<String, Object>(); 
		custParmasMap.put("SHOP_ID", shopId);
		custParmasMap.put("CUST_SYS_ID", custSysId);
    	Map<String,Object> custMap = commonService.select("BBS.getCustDetail",custParmasMap);
    	String nickName = "无名氏";
    	if(custMap!=null){
    		nickName = custMap.get("CUST_NICK_NM").toString();
    	}
		
    	request.put("nickName", nickName);
    	request.put("pageCurr", pageCurr);
    	
//		LogUtils.getMethodExecuteTime(startTime);
		
		return "list2";
	}
	
	//判断是否赞过
	public String getBbsLikeShareCount(){
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		bbsParentId=0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_ID", bbsId);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("CUST_SYS_ID", custSysId);
		map=commonService.select("NewsFeedNongshim.bbsLikeShareSelect", map);
		renderJSON(map);
		return NONE;
	}
	
	//分享
	public String bbsShareInsert(){
		flag="share";
		SessionMember sessionMember = getSessionMember();
		custSysId=sessionMember.getCustSysId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_ID", bbsId);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("CUST_SYS_ID", custSysId);
		map.put("FLG", flag);
		try {
			commonService.select("NewsFeedNongshim.bbsLikeShareInsert", map);
			map.put("status", "success");
		} catch (Exception e) {
			map.put("status", "failed");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		renderJSON(map);
		return NONE;
	}
	
	public String deleteReview(){
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "D");
		map.put("SHOP_ID", shopId);
		map.put("USER_ID", custSysId);
		map.put("BBS_ID", bbsId);
		try {
			commonService.select("NewsFeedNongshim.bbsContentInsert", map);
			map.put("status", "S");// S  or  保存失败
		} catch (Exception e) {
			map.put("status", "F");// S  or  保存失败
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		renderJSON(map);
		return NONE;
	}
	
	
	//评价
	public String bbsContentInsert() throws Exception{
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
//			sessionMember.getCustSysId()
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("JOB_TYPE", "I");
//			map.put("USER_ID", custSysId);
		map.put("SHOP_ID", shopId);
//			bbsType=1;
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("BODY", URLDecoder.decode(body, "UTF-8"));
		map.put("TITLE", "评论");
		map.put("CREATE_ID", custSysId);
		map.put("BBS_STS", 2);
		try {
			commonService.select("NewsFeedNongshim.bbsContentInsert", map);
			map.put("status", "S");// S  or  保存失败
		} catch (Exception e) {
			map.put("status", "F");// S  or  保存失败
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		renderJSON(map);
		return NONE;
	}
	
	public String bbsCustSelect(){
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("SHOP_ID", shopId);
    	map.put("CUST_SYS_ID", custSysId);
    	map=commonService.select("BBS.bbsCustSelect",map);
    	renderJSON(map);
		return NONE;
	}
	
	
	//赞或取消赞
	public String bbsLikeShareInsert(){
		flag="zan";
		custSysId=0;
		SessionMember sessionMember = getSessionMember();
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_TYPE", bbsType);
		map.put("BBS_ID", bbsId);
		map.put("BBS_PARENT_ID", bbsParentId);
		map.put("CUST_SYS_ID", custSysId);
		map.put("FLG", flag);
		try {
			commonService.select("NewsFeedNongshim.bbsLikeShareInsert", map);
			map.put("status", "success");
		} catch (Exception e) {
			map.put("status", "failed");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		renderJSON(map);
		return NONE;
	}
	
	public String detail2(){
		
		jsSdkStting();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BBS_ID", bbsId);
		map.put("BBS_STS", 2);
		SessionMember sessionMember = getSessionMember();
		loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
		}
		if(sessionMember!=null){
			custSysId=sessionMember.getCustSysId();
		}else{
			custSysId=0;
		}
		map.put("USER_ID", custSysId);
		//detail
		Map<String,Object> detail= commonService.select("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("detail", detail);
		//review list
		map.put("PAGE_CURR", 1);
		map.put("PAGE_UINT",10);
		map.put("BBS_PARENT_ID", bbsId);
		map.put("BBS_ID", null);
//		map.put("BBS_TYPE", 1);
		List<Map<String, Object>> replyList= commonService.selectList("BBS.SHOP_BBS_CONTENT_LIST_SELECT_NEW", map);
		request.put("replyList", replyList);
		//bbsLikeList
		map.put("BBS_ID", bbsId);
		List<Map<String, Object>> likeList= commonService.selectList("NewsFeedNongshim.bbsLikeList", map);
		request.put("likeList", likeList);
		
		if(replyList.size()>0){
			int totalCount=(Integer)(replyList.get(0).get("NUM"));
			int totalPage=totalCount%10==0?totalCount/10:totalCount/10+1;
			request.put("pageCount", totalPage);
		}else{
			request.put("pageCount", 0);
		}
		request.put("loginFlag", loginFlag);
		request.put("bbsType", detail.get("BBS_TYPE").toString());
		return "detail2";
	}
	
	public String test(){
		return "test";
	}
	
	public int getCustSysId() { 
		return custSysId;
	}

	public void setCustSysId(int custSysId) {
		this.custSysId = custSysId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUnit() {
		return pageUnit;
	}

	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getBbsParentId() {
		return bbsParentId;
	}

	public void setBbsParentId(int bbsParentId) {
		this.bbsParentId = bbsParentId;
	}

	public File getFileEntity() {
		return fileEntity;
	}

	public void setFileEntity(File fileEntity) {
		this.fileEntity = fileEntity;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getModifiedId() {
		return modifiedId;
	}

	public void setModifiedId(String modifiedId) {
		this.modifiedId = modifiedId;
	}

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getImgId1() {
		return imgId1;
	}

	public void setImgId1(String imgId1) {
		this.imgId1 = imgId1;
	}

	public String getImgId2() {
		return imgId2;
	}

	public void setImgId2(String imgId2) {
		this.imgId2 = imgId2;
	}

	public String getImgId3() {
		return imgId3;
	}

	public void setImgId3(String imgId3) {
		this.imgId3 = imgId3;
	}

	public String getImgId4() {
		return imgId4;
	}

	public void setImgId4(String imgId4) {
		this.imgId4 = imgId4;
	}

	public String getImgId5() {
		return imgId5;
	}

	public void setImgId5(String imgId5) {
		this.imgId5 = imgId5;
	}
	
	public String getImgId6() {
		return imgId6;
	}

	public void setImgId6(String imgId6) {
		this.imgId6 = imgId6;
	}

	public String getImgId7() {
		return imgId7;
	}

	public void setImgId7(String imgId7) {
		this.imgId7 = imgId7;
	}

	public String getImgId8() {
		return imgId8;
	}

	public void setImgId8(String imgId8) {
		this.imgId8 = imgId8;
	}

	public String getImgId9() {
		return imgId9;
	}

	public void setImgId9(String imgId9) {
		this.imgId9 = imgId9;
	}

	public String getImgId10() {
		return imgId10;
	}

	public void setImgId10(String imgId10) {
		this.imgId10 = imgId10;
	}

	public String getImgId11() {
		return imgId11;
	}

	public void setImgId11(String imgId11) {
		this.imgId11 = imgId11;
	}

	public String getImgId12() {
		return imgId12;
	}

	public void setImgId12(String imgId12) {
		this.imgId12 = imgId12;
	}

	public String getImgId13() {
		return imgId13;
	}

	public void setImgId13(String imgId13) {
		this.imgId13 = imgId13;
	}

	public String getImgId14() {
		return imgId14;
	}

	public void setImgId14(String imgId14) {
		this.imgId14 = imgId14;
	}

	public String getImgId15() {
		return imgId15;
	}

	public void setImgId15(String imgId15) {
		this.imgId15 = imgId15;
	}

	public String getImgId16() {
		return imgId16;
	}

	public void setImgId16(String imgId16) {
		this.imgId16 = imgId16;
	}

	public String getImgId17() {
		return imgId17;
	}

	public void setImgId17(String imgId17) {
		this.imgId17 = imgId17;
	}

	public String getImgId18() {
		return imgId18;
	}

	public void setImgId18(String imgId18) {
		this.imgId18 = imgId18;
	}

	public String getImgId19() {
		return imgId19;
	}

	public void setImgId19(String imgId19) {
		this.imgId19 = imgId19;
	}

	public String getImgId20() {
		return imgId20;
	}

	public void setImgId20(String imgId20) {
		this.imgId20 = imgId20;
	}

	public String getCreateDt() {
		return createDt;
	}

	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getBbsSts() {
		return bbsSts;
	}

	public void setBbsSts(String bbsSts) {
		this.bbsSts = bbsSts;
	}

	public String getBbsType() {
		return bbsType;
	}

	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}

	public String getQianMing() {
		return qianMing;
	}

	public void setQianMing(String qianMing) {
		this.qianMing = qianMing;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
