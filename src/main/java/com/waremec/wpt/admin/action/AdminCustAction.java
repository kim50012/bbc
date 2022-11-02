package com.waremec.wpt.admin.action;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.id.IdentityGenerator.GetGeneratedKeysDelegate;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.wpt.admin.domain.AdminCustShop;
import com.waremec.wpt.admin.domain.AdminGrade;
import com.waremec.wpt.admin.domain.AdminMap;
import com.waremec.wpt.admin.domain.AdminUser;
import com.waremec.wpt.admin.domain.AdminWxMessageInfoEtc;
import com.waremec.wpt.admin.service.CustService;


@Controller("adminCustAction")
@Scope(ScopeType.prototype)
public class AdminCustAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	
	@Resource
	private CustService custService;
	@Resource
	private WeixinTemplateMessageService weixinTemplateMessageService;
	@Resource
	private WeixinService weixinService;
	//用户id
	private String userId="";
	//店铺id
	private String shopId="";
	//用户id
	private String cust_sys_id="";
	//等级值
	private String gradeId="";
	//积分
	private String custPoint="";
	//区域 级别
	private String areaLevel="";
	//昵称
	private String nickName="";
	//性别
	private String sex="";
	//区域
	private String areaSel;
	//start积分
	private String pointStart="";
	//end积分
	private String pointEnd="";
	//等级
	private String gradeSel;
	//start关注时间
	private String dateStart="";
	//end关注时间
	private String dateEnd="";
	//start购买次数
	private String startNum="";
	//end购买次数
	private String endNum="";
	//start最近消费
	private String startConsumeDate="";
	//end最近消费
	private String endConsumeDate="";
	//start商品均价
	private String startGoodsAvg="";
	//end商品均价
	private String endGoodsAvg="";
	//用于存储实际每页多少条数据
	private String pageEntity="";
	
	private String jobType="";
	//店铺发送信息标题
	private String msgTitle="";
	//店铺商品的URL地址
	private String shopGoodsUrl="";
	//发送信息内容
	private String sendMsgBody="";
	//店铺发送信息的ID 
	private String messageId="";
	//发送类型 （1：IMG  2：Music 3：Movie 4：素材）
	private String sendFileType="";
	//存储客户的ID
	private String custSysId="";
	//发送的文件的ID
	private String materialFileId="";
	//封面图片ID
	private String coverPageId="";
	// 发送类型  1--直接发送 2--定时发送
	private String sendType="";
	//存储定时发送时间
	private String sendTime="";
	//最后对话
	private String receiveDt="";
	//是否关注
	private String subscribe="1";
	
	private String cust_type = "";
	//ID	
	private String id="";
	//MARK 0 ：不加星  1：加星
	private String mark="";
	//COMMENT 备注
	private String comment="";
	
	//是否发送通知0：发送  1：不发送
	private String statusId="";
	//微信Id
	private String wxId="";
	//等级名称
	private String gradeName="";
	//购买次数
	private String purTimes="";
	//购买总金额
	private String priceSum="";
	//奖励积分
	private String givecustPoint="";

	public String cust(){
			
		//查询客户信息
		shopId=getBackSessionShopId().toString();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("custSysId", null);
		map.put("nickName", StringUtil.emptyToNull(nickName));
		map.put("sex", StringUtil.emptyToNull(sex));
		map.put("areaSel", StringUtil.emptyToNull(areaSel));
		map.put("pointStart", StringUtil.emptyToNull(pointStart));
		map.put("pointEnd", StringUtil.emptyToNull(pointEnd));
		map.put("gradeSel", StringUtil.emptyToNull(gradeSel));
		map.put("startNum", StringUtil.emptyToNull(startNum));
		map.put("endNum", StringUtil.emptyToNull(endNum));
		map.put("startConsumeDate", StringUtil.emptyToNull(startConsumeDate));
		map.put("endConsumeDate", StringUtil.emptyToNull(endConsumeDate));
		map.put("startGoodsAvg", StringUtil.emptyToNull(startGoodsAvg));
		map.put("endGoodsAvg", StringUtil.emptyToNull(endGoodsAvg));

		map.put("subscribe_time_start", StringUtil.emptyToNull(dateStart));
		map.put("subscribe_time_end", StringUtil.emptyToNull(dateEnd));
		/*map.put("unsubscribe_time_start", StringUtil.emptyToNull(dateStart));
		map.put("unsubscribe_time_end", StringUtil.emptyToNull(dateEnd));*/
		if(subscribe=="2"||"2".equals(subscribe)){
			subscribe="";
		}
		map.put("subscribe", StringUtil.emptyToNull(subscribe));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("cust_type", StringUtil.emptyToNull(cust_type));
		//查询出所有数据
		List<Map<String,Object>> custSel = custService.selectList("Cust.getCust", map);
		
		//分页
		PageData page = new PageData();
		if (!custSel.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(custSel.get(0).get("NUM"));
			page = new PageData(pageCurr,pageUnit, totalCount , custSel);
		}
		
		request.put("page", page);
		
		request.put("custSel", custSel);
		
		request.put("dateStart", dateStart);
		
		request.put("dateEnd", dateEnd);
		
		//查询出等级信息
		AdminGrade adminGrade=new AdminGrade();
		adminGrade.setShopId(shopId);
		List<AdminGrade> grade= custService.selectGrade("Cust.gradeSel", adminGrade);
		request.put("grade", grade);
		
		
		//查询客户区域
		AdminMap areaSel=new AdminMap();
		areaLevel="1";
		areaSel.setAreaLevel(areaLevel);
		List<AdminMap> adminMap = custService.selectMapList("Cust.areaSel", areaSel);
		request.put("adminMap", adminMap);

		return "cust";
	}
	
	public String custFragment() {
		//查询客户信息
		shopId=getBackSessionShopId().toString();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("custSysId", null);
		map.put("nickName", StringUtil.emptyToNull(nickName));
		map.put("sex", StringUtil.emptyToNull(sex));
		map.put("areaSel", StringUtil.emptyToNull(areaSel));
		map.put("pointStart", StringUtil.emptyToNull(pointStart));
		map.put("pointEnd", StringUtil.emptyToNull(pointEnd));
		map.put("gradeSel", StringUtil.emptyToNull(gradeSel));
		map.put("startNum", StringUtil.emptyToNull(startNum));
		map.put("endNum", StringUtil.emptyToNull(endNum));
		map.put("startConsumeDate", StringUtil.emptyToNull(startConsumeDate));
		map.put("endConsumeDate", StringUtil.emptyToNull(endConsumeDate));
		map.put("startGoodsAvg", StringUtil.emptyToNull(startGoodsAvg));
		map.put("endGoodsAvg", StringUtil.emptyToNull(endGoodsAvg));
		map.put("subscribe_time_start", StringUtil.emptyToNull(dateStart));
		map.put("subscribe_time_end", StringUtil.emptyToNull(dateEnd));
		if(subscribe=="2"||"2".equals(subscribe)){
			subscribe="";
		}
		map.put("subscribe", StringUtil.emptyToNull(subscribe));
		map.put("pageCurr", pageCurr);
		map.put("pageUnit", pageUnit);
		map.put("cust_type", StringUtil.emptyToNull(cust_type));
		//查询出所有数据
		List<Map<String,Object>> custSel = custService.selectList("Cust.getCust", map);
		
		//分页
		PageData page = new PageData();
		if (!custSel.isEmpty()) {
			int totalCount = IntegerUtils.valueOf(custSel.get(0).get("NUM"));
			page = new PageData(pageCurr,pageUnit, totalCount , custSel);
		}
		
		request.put("page", page);
		
		request.put("custSel", custSel);
		
		return "custFragment";
	}
	
	public String  getGradeById(){
		shopId=getBackSessionShopId().toString();
		AdminCustShop gradeSel =new AdminCustShop();
		gradeSel.setShopId(Integer.parseInt(shopId));
		gradeSel.setCust_sys_id(Integer.parseInt(cust_sys_id));
		AdminCustShop adminCustShop=(AdminCustShop)custService.selectGardeById("Cust.gradeGetById", gradeSel);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		//System.out.println(adminGrade);
		if(adminCustShop.getGradeId()==""){
			returnMap.put("result", "fail");
		}else{
			returnMap.put("adminGrade", adminCustShop);
			returnMap.put("result", "success");
		}
		renderJSON(returnMap);

		return NONE;
	}
	//更新一条等级
	public String  gradeSave(){
		shopId=getBackSessionShopId().toString();
		boolean success = true;
		String err_msg = "";
		try{
		AdminCustShop updateIn = new AdminCustShop();
		updateIn.setShopId(Integer.parseInt(shopId));
		updateIn.setCust_sys_id(Integer.parseInt(cust_sys_id));
		updateIn.setGradeId(gradeId);
		custService.updateCustShop("Cust.gradeChangeOne", updateIn);
		gradeName=new String(gradeName.getBytes("ISO-8859-1"),"UTF-8");
		if(statusId=="0" || "0".equals(statusId)){
			AppInfo appInfo = weixinService.selectAppInfoByShopId(Integer.parseInt(shopId));
			weixinTemplateMessageService.sendCustLevelChangeNotice(appInfo, wxId, gradeName, purTimes+"笔",priceSum+"元");
		}
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
	//更新一组等级
	public String  gradesSave(){
		shopId=getBackSessionShopId().toString();
		boolean success = true;
		String err_msg = "";
		try{
		AdminCustShop updateIn = new AdminCustShop();
		updateIn.setShopId(Integer.parseInt(shopId));
		updateIn.setGradeId(gradeId);
		gradeName=new String(gradeName.getBytes("ISO-8859-1"),"UTF-8");
		String[] str=cust_sys_id.split(",");
		String[] str1=wxId.split(",");
		String[] str2=purTimes.split(",");
		String[] str3=priceSum.split(",");
		for(int i=1;i<str.length;i++){
			updateIn.setCust_sys_id(Integer.parseInt(str[i]));
			custService.updateCustShop("Cust.gradeChangeOne", updateIn);
			if(statusId=="0" || "0".equals(statusId)){
				AppInfo appInfo = weixinService.selectAppInfoByShopId(Integer.parseInt(shopId));
				weixinTemplateMessageService.sendCustLevelChangeNotice(appInfo, str1[i],gradeName,str2[i]+"笔",str3[i]+"元");
			}
		}
		
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
	//更新一条积分
	public String  pointSave(){
		shopId=getBackSessionShopId().toString();
		boolean success = true;
		String err_msg = "";
		try{
		AdminCustShop updateIn = new AdminCustShop();
		updateIn.setShopId(Integer.parseInt(shopId));
		updateIn.setCust_sys_id(Integer.parseInt(cust_sys_id));
		updateIn.setCustPoint(custPoint);
		custService.updateCustShop("Cust.pointChangeOne", updateIn);
		if(statusId=="0" || "0".equals(statusId)){
			AppInfo appInfo = weixinService.selectAppInfoByShopId(Integer.parseInt(shopId));
			weixinTemplateMessageService.sendMileageChangeNotice(appInfo,wxId, givecustPoint+"分", "无", custPoint+"分");
		}
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
	//更新一组积分
	public String  pointsSave(){
		shopId=getBackSessionShopId().toString();
		boolean success = true;
		String err_msg = "";
		try{
		AdminCustShop updateIn = new AdminCustShop();
		updateIn.setShopId(Integer.parseInt(shopId));
		String[] str=cust_sys_id.split(",");
		String[] str1=custPoint.split(",");
		String[] str2=wxId.split(",");
		for(int i=1;i<str.length;i++){
		updateIn.setCust_sys_id(Integer.parseInt(str[i]));
		updateIn.setCustPoint(str1[i]);
		custService.updateCustShop("Cust.pointChangeOne", updateIn);
		if(statusId=="0" || "0".equals(statusId)){
			AppInfo appInfo = weixinService.selectAppInfoByShopId(Integer.parseInt(shopId));
			weixinTemplateMessageService.sendMileageChangeNotice(appInfo,str2[i], givecustPoint+"分", "无", str1[i]+"分");
		}
		}
		
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
	//打开聊天记录
	public String  chatSel(){
		
		//查询出客户信息
		Map<String,Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", getBackSessionShopId());
		searchMap.put("CUST_SYS_ID", cust_sys_id);
		Map<String,Object> custSel=custService.selectChat("Cust.getChat", searchMap);
		
		searchMap.clear();
		searchMap.put("SHOP_ID", getBackSessionShopId());
		searchMap.put("USER_ID", getBackSessionUserId());
		searchMap.put("CUST_SYS_ID", cust_sys_id);
		searchMap.put("RECEIVE_DT",  StringUtil.emptyToNull(receiveDt));
		searchMap.put("COMMENT", StringUtil.emptyToNull(comment));
		searchMap.put("MARK", StringUtil.emptyToNull(mark));
		List<Map<String,Object>> chatHistSel = custService.selectList("Cust.getChatHist", searchMap);

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("success", true);
		returnMap.put("cust", custSel);
		returnMap.put("chatHistSel", chatHistSel);
		
		renderJSON(returnMap);

		return NONE;
	}
	public String  chatWindow(){
		
		//查询出客户信息
		Map<String,Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", getBackSessionShopId());
		searchMap.put("CUST_SYS_ID", cust_sys_id);
		Map<String,Object> custInfo= custService.selectChat("Cust.getChat", searchMap);
		
		searchMap.clear();
		searchMap.put("SHOP_ID", getBackSessionShopId());
		searchMap.put("USER_ID", getBackSessionUserId());
		searchMap.put("CUST_SYS_ID", cust_sys_id);
		searchMap.put("MSG_ID", null);
		searchMap.put("COMMENT", StringUtil.emptyToNull(comment));
		searchMap.put("MARK", StringUtil.emptyToNull(mark));
		
		List<Map<String,Object>> cartHsitList = custService.selectList("Cust.getChatHist", searchMap);
//		MapUtil.printMap(custInfo);
//		ListUtil.printListMap(cartHsitList);
		request.put("custInfo", custInfo);
		request.put("cartHsitList", cartHsitList);
		
		
		
		//获取登陆用户信息
		AdminUser userInfo = getBackSessionUser();
		request.put("userInfo", userInfo);
		
		
		
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
	
	public String relaodMessage(){
		//查询出客户信息
		//查询出客户信息
		try {
			
			Map<String,Object> searchMap = new HashMap<String, Object>();
			searchMap.put("SHOP_ID", getBackSessionShopId());
			searchMap.put("CUST_SYS_ID", cust_sys_id);
			Map<String,Object> custInfo= custService.selectChat("Cust.getChat", searchMap);
			searchMap.clear();
			
			searchMap.put("SHOP_ID", getBackSessionShopId());
			searchMap.put("USER_ID", getBackSessionUserId());
			searchMap.put("CUST_SYS_ID", cust_sys_id);
			searchMap.put("MSG_ID",  IntegerUtils.valueOf(getRequest().getParameter("lastMsgId")));
			
			List<Map<String,Object>> cartHsitList = custService.selectList("Cust.getChatHist", searchMap);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("custInfo", custInfo);
			returnMap.put("cartHsitList", cartHsitList);
			returnMap.put("userInfo", getBackSessionUser());
			returnMap.put("success", true);
			
			renderJSON(returnMap);
		} catch (Exception e) {
			// TODO: handle exception
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("err_msg", e.getMessage());
			returnMap.put("success", false);
			
			renderJSON(returnMap);
		}
		
		
		return NONE;
		
	}
	
	//备注的保存
	public String  commentSave(){
		String ret = "success";
		AdminWxMessageInfoEtc adminWxMessageInfoEtc = new AdminWxMessageInfoEtc();
		adminWxMessageInfoEtc.setId(id);
		int count=custService.selectById("Cust.selectById", adminWxMessageInfoEtc);
		try{
			if(count==0){
				AdminWxMessageInfoEtc saveIn = new AdminWxMessageInfoEtc();
				saveIn.setId(id);
				comment=new String(comment.getBytes("ISO-8859-1"),"UTF-8");
				saveIn.setComment(comment);
				saveIn.setMark(mark);
				jobType="I";
				saveIn.setJobType(jobType);
				custService.insertWxMessageInfoEtc("Cust.infoEtcSave", saveIn);
			}else{
				AdminWxMessageInfoEtc updateIn = new AdminWxMessageInfoEtc();
				updateIn.setId(id);
				comment=new String(comment.getBytes("ISO-8859-1"),"UTF-8");
				updateIn.setComment(comment);
				jobType="U";
				updateIn.setJobType(jobType);
				custService.insertWxMessageInfoEtc("Cust.infoEtcSave", updateIn);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}
	//加星的保存
	public String  markSave(){
		String ret = "success";
		AdminWxMessageInfoEtc adminWxMessageInfoEtc = new AdminWxMessageInfoEtc();
		adminWxMessageInfoEtc.setId(id);
		int count=custService.selectById("Cust.selectById", adminWxMessageInfoEtc);
		try{
			if(count==0){
				AdminWxMessageInfoEtc saveIn = new AdminWxMessageInfoEtc();
				saveIn.setId(id);
				comment=new String(comment.getBytes("ISO-8859-1"),"UTF-8");
				saveIn.setComment(comment);
				saveIn.setMark(mark);
				jobType="I";
				saveIn.setJobType(jobType);
				custService.insertWxMessageInfoEtc("Cust.infoEtcSave", saveIn);
			}else{
				AdminWxMessageInfoEtc updateIn = new AdminWxMessageInfoEtc();
				updateIn.setId(id);
				updateIn.setMark(mark);
				jobType="U";
				updateIn.setJobType(jobType);
				custService.insertWxMessageInfoEtc("Cust.infoEtcSave", updateIn);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);

		renderJSON(returnMap);

		return NONE;
	}
	public String saveSendMsgAll(){
		shopId=getBackSessionShopId().toString();
		userId=getBackSessionUserId();
		jobType="I";
		//判断操作成功与否的标志字段
		String ret="";
		try{
			Map<String,Object> map=new HashMap<String,Object>();
			Date date=new Date();
			msgTitle=new String(msgTitle.getBytes("ISO-8859-1"),"UTF-8");
			shopGoodsUrl=new String(shopGoodsUrl.getBytes("ISO-8859-1"),"UTF-8");
			sendMsgBody=new String(sendMsgBody.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId", StringUtil.emptyToNull(shopId));
			map.put("userId", userId);
			map.put("jobType", jobType);
			map.put("messageId", StringUtil.emptyToNull(messageId));
			map.put("msgTitle", StringUtil.emptyToNull(msgTitle));
			map.put("sendFileType", StringUtil.emptyToNull(sendFileType));
			map.put("materialFileId", StringUtil.emptyToNull(materialFileId));
			map.put("coverPageId", StringUtil.emptyToNull(coverPageId));
			map.put("shopGoodsUrl", StringUtil.emptyToNull(shopGoodsUrl));
			map.put("sendMsgBody", StringUtil.emptyToNull(sendMsgBody));
			map.put("sendType", StringUtil.emptyToNull(sendType));
			map.put("sendTime", StringUtil.emptyToNull(sendTime));
			map.put("custSysId", StringUtil.emptyToNull(custSysId));
			map.put("gradeId", StringUtil.emptyToNull(gradeId));
			map.put("createdId", userId);
			map.put("modifiedId", null);
			map.put("createdDate", date);
			map.put("modifiedDate", null);
			Map<String,Object> mapFlag=commonService.select("SendMsgAll.saveSendMsgAll", map);
			String flag=(String) mapFlag.get("OUT_ERR_MSG");
			if(flag=="S" || "S".equals(flag)){
				ret="success";
			}else{
				ret="fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	public String modifyCustInfo(){
		
		try {
			Integer custSysId = IntegerUtils.valueOf(getRequest().getParameter("custSysId"));
			String type = getRequest().getParameter("type");
			String value = getRequest().getParameter("value");
			 
			Map<String,Object> saveMap = new HashMap<String,Object>();
			saveMap.put("CUST_SYS_ID", custSysId);
			saveMap.put("TYPE", type);
			saveMap.put("VALUE", value);
			
			custService.modifyCustInfo(saveMap);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", true);
			renderJSON(map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("success", false);
			map.put("msg", e.getMessage());
			renderJSON(map);
		}
		
		
		return NONE;
		
	}
	
	public String getAreaLevel() {
		return areaLevel;
	}
	public void setAreaLevel(String areaLevel) {
		this.areaLevel = areaLevel;
	}

	public CustService getCustService() {
		return custService;
	}

	public void setCustService(CustService custService) {
		this.custService = custService;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getPointStart() {
		return pointStart;
	}

	public void setPointStart(String pointStart) {
		this.pointStart = pointStart;
	}

	public String getPointEnd() {
		return pointEnd;
	}

	public void setPointEnd(String pointEnd) {
		this.pointEnd = pointEnd;
	}


	public String getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		this.dateStart = dateStart;
	}

	public String getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		this.dateEnd = dateEnd;
	}

	public String getStartNum() {
		return startNum;
	}

	public void setStartNum(String startNum) {
		this.startNum = startNum;
	}

	public String getEndNum() {
		return endNum;
	}

	public void setEndNum(String endNum) {
		this.endNum = endNum;
	}

	public String getStartConsumeDate() {
		return startConsumeDate;
	}

	public void setStartConsumeDate(String startConsumeDate) {
		this.startConsumeDate = startConsumeDate;
	}

	public String getEndConsumeDate() {
		return endConsumeDate;
	}

	public void setEndConsumeDate(String endConsumeDate) {
		this.endConsumeDate = endConsumeDate;
	}

	public String getStartGoodsAvg() {
		return startGoodsAvg;
	}

	public void setStartGoodsAvg(String startGoodsAvg) {
		this.startGoodsAvg = startGoodsAvg;
	}

	public String getEndGoodsAvg() {
		return endGoodsAvg;
	}

	public void setEndGoodsAvg(String endGoodsAvg) {
		this.endGoodsAvg = endGoodsAvg;
	}

	public String getAreaSel() {
		return areaSel;
	}

	public void setAreaSel(String areaSel) {
		this.areaSel = areaSel;
	}

	public String getGradeSel() {
		return gradeSel;
	}

	public void setGradeSel(String gradeSel) {
		this.gradeSel = gradeSel;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCustPoint() {
		return custPoint;
	}
	public void setCustPoint(String custPoint) {
		this.custPoint = custPoint;
	}
	public String getCust_sys_id() {
		return cust_sys_id;
	}
	public void setCust_sys_id(String cust_sys_id) {
		this.cust_sys_id = cust_sys_id;
	}
	public String getPageEntity() {
		return pageEntity;
	}
	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
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
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getShopGoodsUrl() {
		return shopGoodsUrl;
	}
	public void setShopGoodsUrl(String shopGoodsUrl) {
		this.shopGoodsUrl = shopGoodsUrl;
	}
	public String getSendMsgBody() {
		return sendMsgBody;
	}
	public void setSendMsgBody(String sendMsgBody) {
		this.sendMsgBody = sendMsgBody;
	}
	public String getMessageId() {
		return messageId;
	}
	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}
	public String getSendFileType() {
		return sendFileType;
	}
	public void setSendFileType(String sendFileType) {
		this.sendFileType = sendFileType;
	}
	public String getCustSysId() {
		return custSysId;
	}
	public void setCustSysId(String custSysId) {
		this.custSysId = custSysId;
	}
	public String getMaterialFileId() {
		return materialFileId;
	}
	public void setMaterialFileId(String materialFileId) {
		this.materialFileId = materialFileId;
	}
	public String getCoverPageId() {
		return coverPageId;
	}
	public void setCoverPageId(String coverPageId) {
		this.coverPageId = coverPageId;
	}
	public String getSendType() {
		return sendType;
	}
	public void setSendType(String sendType) {
		this.sendType = sendType;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getReceiveDt() {
		return receiveDt;
	}
	public void setReceiveDt(String receiveDt) {
		this.receiveDt = receiveDt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCust_type() {
		return cust_type;
	}
	public void setCust_type(String cust_type) {
		this.cust_type = cust_type;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getWxId() {
		return wxId;
	}
	public void setWxId(String wxId) {
		this.wxId = wxId;
	}
	
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getPurTimes() {
		return purTimes;
	}
	public void setPurTimes(String purTimes) {
		this.purTimes = purTimes;
	}
	public String getPriceSum() {
		return priceSum;
	}
	public void setPriceSum(String priceSum) {
		this.priceSum = priceSum;
	}
	public WeixinTemplateMessageService getWeixinTemplateMessageService() {
		return weixinTemplateMessageService;
	}
	public void setWeixinTemplateMessageService(
			WeixinTemplateMessageService weixinTemplateMessageService) {
		this.weixinTemplateMessageService = weixinTemplateMessageService;
	}
	public WeixinService getWeixinService() {
		return weixinService;
	}
	public void setWeixinService(WeixinService weixinService) {
		this.weixinService = weixinService;
	}
	public String getGivecustPoint() {
		return givecustPoint;
	}
	public void setGivecustPoint(String givecustPoint) {
		this.givecustPoint = givecustPoint;
	}
	public String getSubscribe() {
		return subscribe;
	}
	public void setSubscribe(String subscribe) {
		this.subscribe = subscribe;
	}
	
}
