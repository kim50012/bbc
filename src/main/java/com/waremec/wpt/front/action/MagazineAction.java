package com.waremec.wpt.front.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("magazineAction")
@Scope(ScopeType.prototype)
public class MagazineAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String skinType;
	private String shopId;
	private String tempId;
	private String orderby;
	private String magazineTitle;
	private String listClassName;
	private int pageCurr;
	private int pageUnit;
	private int totalPage;
	private int shopGradeClassId;
	private int brandId;
	private int totalCount;
	private int magazineGroupId;
	private int magazineId;
	private int magazineGroupParentId;
	private int pageNO;
	private int loginFlag;
	private int blogId;
	private String reviewPoint;
	private String mesContent;
	private String magazineGroupName;
	private String flag;


	@Resource
	protected MainService mainService;
	
	public String saveMagazineReview(){
		
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		shopId = sessionSkin.getShopId().toString();
		int intCustSysId = 0;
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
		}

		String ret="success";
		try{
			Map<String,Object> map=new HashMap<String, Object>();
			mesContent=new String(mesContent.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId", shopId);
			map.put("custSysId", intCustSysId);
			map.put("USER_ID", null);
			map.put("reviewType","1");
			map.put("parentId", magazineId);
			map.put("reviewId",null);
			map.put("reviewPId",null);
			map.put("reviewDesc",StringUtil.emptyToNull(mesContent));
			map.put("custSysId",intCustSysId);
			map.put("reviewPoint",reviewPoint);
			map.put("jobType","I");
			Map<String,Object> mapResult=commonService.select("Magazine.saveMagazinePreview", map);
			Integer outReviewId=(Integer) mapResult.get("OUT_REVIEW_ID");
			if(outReviewId==0 || outReviewId==null){
				ret="fail";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		/*JSONObject jo = new JSONObject();
		jo.put("ret", ret);
  		renderHtml(jo.toJSONString());*/
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	//---------------------------------------------------------------
	// mobile list
	//---------------------------------------------------------------
	public String magazineList() throws Exception{

		//------------------------------------------------------------------------------------------
		jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		shopId = sessionSkin.getShopId().toString();
		skinType = sessionSkin.getSkinTypeShop().toString();
		
		if(listClassName==null){
			listClassName = "list-search-list list-list-view";
		}
		
		pageUnit = 30;
		Map<String,Object> magazineMap=new HashMap<String, Object>();
		magazineMap.put("SHOP_ID",shopId);
		magazineMap.put("USER_ID", null);
		magazineMap.put("PAGE_CURR", pageCurr);
		magazineMap.put("PAGE_UINT", pageUnit);
		magazineMap.put("ORDERBY", orderby);
		magazineMap.put("BLOG_ID", null);
		if(magazineTitle!=null){
			magazineTitle=new String(magazineTitle.getBytes("ISO-8859-1"),"UTF-8");
		}
		magazineMap.put("BLOG_TITLE", magazineTitle);
		
		if ((magazineGroupId > 0) || (magazineGroupId < 0)) {
			magazineMap.put("BLOG_GROUP_ID", magazineGroupId);
		}
		
		List<Map<String, Object>> magazineList=commonService.selectList("Magazine.magazineGetList",magazineMap);
		ListUtil.convertClob2String(magazineList );
		
		int pageCountTotal=0;
		if(magazineList.size()!=0){
			int countTotal=(Integer) magazineList.get(0).get("TOTAL_CNT");
			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
		}
		request.put("list", magazineList);
		request.put("pageCount", pageCountTotal);
		

		//-------------------------------------------------------------------------------------------
		// Return
		//-------------------------------------------------------------------------------------------
		String strReturn = "magazineList";
		
		
		//-------------------------------------------------------------------------------------------
		return strReturn;
		//-------------------------------------------------------------------------------------------
		
	}

	//---------------------------------------------------------------
	// mobile list
	//---------------------------------------------------------------
	public String magazineList2() throws Exception{

		//------------------------------------------------------------------------------------------
		jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		shopId = sessionSkin.getShopId().toString();
		skinType = sessionSkin.getSkinTypeShop().toString();
		
		if(listClassName==null){
			listClassName = "list-search-list list-list-view";
		}

		SessionMember sessionMember = getSessionMember();
		
		int intCustSysId = 0;
		String imgUrl = "";
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
		}
		
		pageUnit = 10;
		Map<String,Object> magazineMap=new HashMap<String, Object>();
		magazineMap.put("SHOP_ID",shopId);
//		magazineMap.put("USER_ID", null);
//		magazineMap.put("PAGE_CURR", pageCurr);
		magazineMap.put("PAGE_UINT", pageUnit);
//		magazineMap.put("ORDERBY", orderby);
		if (intCustSysId != 0) {
			magazineMap.put("CUST_SYS_ID", intCustSysId);
		}	
		magazineMap.put("BLOG_ID", null);
//		if(magazineTitle!=null){
//			magazineTitle=new String(magazineTitle.getBytes("ISO-8859-1"),"UTF-8");
//		}
//		magazineMap.put("BLOG_TITLE", magazineTitle);
		
//		if ((magazineGroupId > 0) || (magazineGroupId < 0)) {
//			magazineMap.put("BLOG_GROUP_ID", magazineGroupId);
//		}

//		List<Map<String, Object>> magazineList=commonService.selectList("Magazine.magazineGetList",magazineMap);
		List<Map<String, Object>> magazineList=commonService.selectList("Magazine.magazineGetRandomList",magazineMap);
		
		ListUtil.convertClob2String(magazineList );
		
//		int pageCountTotal=0;
//		if(magazineList.size()!=0){
//			int countTotal=(Integer) magazineList.get(0).get("TOTAL_CNT");
//			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
//		}
		request.put("list", magazineList);
//		request.put("pageCount", pageCountTotal);
		

		//-------------------------------------------------------------------------------------------
		// Return
		//-------------------------------------------------------------------------------------------
		String strReturn = "magazineList2";
		
		
		//-------------------------------------------------------------------------------------------
		return strReturn;
		//-------------------------------------------------------------------------------------------
		
	}
	
	public String magazineAjaxList() throws Exception{
		jsSdkStting();
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		shopId = sessionSkin.getShopId().toString();
		skinType = sessionSkin.getSkinTypeShop().toString();
		
		if(listClassName==null){
			listClassName = "list-search-list list-list-view";
		}
		
		Map<String,Object> magazineMap=new HashMap<String, Object>();
		magazineMap.put("SHOP_ID",shopId);
		magazineMap.put("USER_ID", null);
		magazineMap.put("PAGE_CURR", pageCurr);
		magazineMap.put("PAGE_UINT", pageUnit);
		magazineMap.put("ORDERBY", orderby);
		magazineMap.put("BLOG_ID", null);
		if(magazineTitle!=null){
			magazineTitle=new String(magazineTitle.getBytes("ISO-8859-1"),"UTF-8");
		}
		magazineMap.put("BLOG_TITLE", magazineTitle);
		
		if ((magazineGroupId > 0) || (magazineGroupId < 0)) {
			magazineMap.put("BLOG_GROUP_ID", magazineGroupId);
		}
		
		List<Map<String, Object>> magazineList=commonService.selectList("Magazine.magazineGetList",magazineMap);
		ListUtil.convertClob2String(magazineList );
		

		if(!magazineList.isEmpty()){
			totalCount = (Integer)magazineList.get(0).get("TOTAL_CNT");
			System.out.println("totalCount=" + totalCount);
			
			if(magazineGroupId != 0) {
				magazineGroupName = (String)magazineList.get(0).get("BLOG_GROUP_NM");
				System.out.println("magazineGroupName=" + magazineGroupName);
			}
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", magazineList);
		renderJSON(returnMap);
		return NONE;
	}
	
	public String magazineDetail() {
		
		jsSdkStting();
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		int intCustSysId = 0;
		loginFlag = 0;
		String imgUrl = "";
				
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
			imgUrl = sessionMember.getCustImgUrl();
			loginFlag = 1;
		}
		// 商品详情
		Map<String, Object> searchMap = new HashMap<String, Object>();
		// 图文详情列表		

		//magazine list
		Map<String,Object> magazineMap=new HashMap<String, Object>();
		magazineMap.put("SHOP_ID",shopId);
		magazineMap.put("CUST_SYS_ID", intCustSysId);
		magazineMap.put("USER_ID", null);
		magazineMap.put("PAGE_CURR", 1);
		magazineMap.put("PAGE_UINT", 1);
		//magazineMap.put("ORDERBY", orderby);
		magazineMap.put("BLOG_ID", magazineId);
		
		Map<String, Object> magazineList = commonService.select("Magazine.magazineGetList",magazineMap);
		//ListUtil.convertClob2String(magazineList );
		
		
		int pageId = 0;
		if(!magazineList.isEmpty()){
			//pageId = (Integer)magazineList.get(0).get("PAGE_ID");
			pageId = Integer.valueOf(magazineList.get("PAGE_ID").toString());
			System.out.println("pageId=" + pageId);
		}
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", 7);
		searchMap.put("SKIN_TYPE", sessionSkin.getSkinTypeShop().toString());
		List<Map<String, Object>> magazineDetailList = commonService.selectList("Detail.getGoodsImageList", searchMap);
		
		ListUtil.convertClob2String(magazineDetailList );
				
		//magazine NEW list
		Map<String,Object> magazineMap2 = new HashMap<String, Object>();
		magazineMap2.put("SHOP_ID",shopId);
		magazineMap2.put("CUST_SYS_ID", intCustSysId);
		magazineMap2.put("PAGE_UINT", 4);
		
		List<Map<String, Object>> magazineRandomList_4 = commonService.selectList("Magazine.magazineGetRandomList",magazineMap2);
		
		int j=0;
		int k=0;
		List<Map<String, Object>> magazineRandomList_3 = new ArrayList<Map<String, Object>>();
		k = magazineRandomList_4.size();
		k = k + 1;
		for(int i=0;i<k-1;i++){
			Map<String, Object> mp = magazineRandomList_4.get(i); 
			if(!mp.get("BLOG_ID").equals(magazineId)){
				j++;
				if(j == 4) break;
				magazineRandomList_3.add(mp);
			}
		}

		 
		//--------------------------
		//-- initial setting
		//--------------------------
		if (pageNO == 0) {
			pageNO = 1;
		}
		
		//-----------------------------------------------------------------------------------
		// 商品评价列表
		//-----------------------------------------------------------------------------------
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID", intCustSysId);
		searchMap.put("REVIEW_TYPE", 1);	//1:magazine
		searchMap.put("PARENT_ID", magazineId);
		searchMap.put("PAGE_CURR", 1);
		searchMap.put("PAGE_UNIT", 3);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Magazine.magazineGetReviewList", searchMap);

		int totalCount = 0;
		if(!reviewList.isEmpty()){
			totalCount = (Integer)reviewList.get(0).get("TOTAL_CNT");
			request.put("totalRecords", totalCount);
			System.out.println("totalRecords=" + totalCount);
		}

		int pageUnit = 10;

		if (totalCount > 0) {
			if (totalCount % pageUnit == 0) {
				totalPage = totalCount / pageUnit;
			} else {
				totalPage = totalCount / pageUnit + 1;
			}
		}
		//-----------------------------------------------------------------------------------
		if(reviewList.isEmpty()){
			request.put("reviewCnt",0);
		}else{
			request.put("reviewCnt",reviewList.get(0).get("CUST_REVIEW_CNT"));
		}
		
		magazineMap.put("REVIEW_TYPE", 1);	//1:magazine
		
		//阅读数量+1
//		if (sessionMember != null) {
//			intCustSysId = sessionMember.getCustSysId();
//		}
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("SHOP_ID", shopId);
//		map.put("BLOG_ID", magazineList.get("BLOG_ID"));
//		map.put("CUST_SYS_ID", intCustSysId);
//		map.put("FLG", "READ");
//		try {
//			commonService.select("Magazine.magazineLikeShareInsert", map);
//		} catch (Exception e) {
//			map.put("status", "failed");
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		//数量统计
		Map<String, Object> magazineStatis= commonService.select("Magazine.magazineLikeShareSelect",magazineMap);
		
		request.put("magazineList", magazineList);
		request.put("magazineDetailList", magazineDetailList);
		request.put("magazineRandomList", magazineRandomList_3);
		request.put("reviewList", reviewList);
		request.put("loginFlag",loginFlag);
		request.put("magazineStatis", magazineStatis);
		
		request.put("custImgUrl",imgUrl);
		

		return "magazineDetail";
	}
	
	public String magazineRandomAjaxList() throws Exception{
		
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		SessionMember sessionMember = getSessionMember();
		shopId = sessionSkin.getShopId().toString();
		skinType = sessionSkin.getSkinTypeShop().toString();	
		int intCustSysId = 0;
		
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
		}
		
		Map<String,Object> magazineMap2 = new HashMap<String, Object>();
		magazineMap2.put("SHOP_ID",shopId);
		magazineMap2.put("CUST_SYS_ID", intCustSysId);
		magazineMap2.put("PAGE_UINT", 5);
		
		List<Map<String, Object>> magazineRandomList = commonService.selectList("Magazine.magazineGetRandomList",magazineMap2);
		ListUtil.convertClob2String(magazineRandomList );

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", magazineRandomList);
		renderJSON(returnMap);
		return NONE;
	}
	
	public String magazineReviewAjaxList() throws Exception{
		
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		SessionMember sessionMember = getSessionMember();
		shopId = sessionSkin.getShopId().toString();
		skinType = sessionSkin.getSkinTypeShop().toString();
		int intCustSysId = 0;
		
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
		}

		
		if(listClassName==null){
			listClassName = "list-search-list list-list-view";
		}
		
		Map<String,Object> searchMap=new HashMap<String, Object>();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("CUST_SYS_ID",intCustSysId );
		searchMap.put("REVIEW_TYPE", 1);	//1:blog
		searchMap.put("PARENT_ID", magazineId);
		searchMap.put("PAGE_CURR", 1);
		searchMap.put("PAGE_UNIT", 999999);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Magazine.magazineGetReviewList", searchMap);		
		ListUtil.convertClob2String(reviewList );

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", reviewList);
		renderJSON(returnMap);
		return NONE;
	}
	

	 public String home() {
			
		jsSdkStting();

		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		 
		//分类
		Map<String,Object> classMap=new HashMap<String, Object>();
		classMap.put("SHOP_ID", sessionSkin.getShopId());
		
		List<Map<String,Object>> bannerList=commonService.selectList("Main.getShopBannerList",classMap);
		request.put("bannerList", bannerList);		

				
		Map<String,Object> magazineMap2 = new HashMap<String, Object>();
		magazineMap2.put("SHOP_ID",shopId);
		magazineMap2.put("PAGE_UINT", 10);
		
		List<Map<String, Object>> magazineRandomList = commonService.selectList("Magazine.magazineGetRandomList",magazineMap2);
		ListUtil.convertClob2String(magazineRandomList );		

		request.put("magazineRandomList", magazineRandomList);	
		
		return "home";
	}	
		
	public String blogLikeShareInsert(){
		SessionMember sessionMember = getSessionMember();
		int intCustSysId = 0;
		
		if (sessionMember != null) {
			intCustSysId = sessionMember.getCustSysId();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SHOP_ID", shopId);
		map.put("BLOG_ID", blogId);
		map.put("CUST_SYS_ID", intCustSysId);
		map.put("FLG", flag);
		try {
			commonService.select("Magazine.magazineLikeShareInsert", map);
			map.put("status", "success");
		} catch (Exception e) {
			map.put("status", "failed");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		renderJSON(map);
		return NONE;
	}
	
	public String getSkinType() {
		return skinType;
	}

	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getTempId() {
		return tempId;
	}

	public void setTempId(String tempId) {
		this.tempId = tempId;
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

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public int getShopGradeClassId() {
		return shopGradeClassId;
	}

	public void setShopGradeClassId(int shopGradeClassId) {
		this.shopGradeClassId = shopGradeClassId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getMagazineTitle() {
		return magazineTitle;
	}

	public void setMagazineTitle(String magazineTitle) {
		this.magazineTitle = magazineTitle;
	}

	public int getMagazineGroupId() {
		return magazineGroupId;
	}

	public void setMagazineGroupId(int magazineGroupId) {
		this.magazineGroupId = magazineGroupId;
	}

	public int getMagazineId() {
		return magazineId;
	}

	public void setMagazineId(int magazineId) {
		this.magazineId = magazineId;
	}

	public int getMagazineGroupParentId() {
		return magazineGroupParentId;
	}

	public void setMagazineGroupParentId(int magazineGroupParentId) {
		this.magazineGroupParentId = magazineGroupParentId;
	}

	public String getListClassName() {
		return listClassName;
	}

	public void setListClassName(String listClassName) {
		this.listClassName = listClassName;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageNO() {
		return pageNO;
	}

	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}

	public String getReviewPoint() {
		return reviewPoint;
	}

	public void setReviewPoint(String reviewPoint) {
		this.reviewPoint = reviewPoint;
	}

	public String getMesContent() {
		return mesContent;
	}

	public void setMesContent(String mesContent) {
		this.mesContent = mesContent;
	}

	public String getMagazineGroupName() {
		return magazineGroupName;
	}

	public void setMagazineGroupName(String magazineGroupName) {
		this.magazineGroupName = magazineGroupName;
	}

	public int getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	
}
