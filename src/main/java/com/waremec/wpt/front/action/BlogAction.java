package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.StringUtil;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.MainService;

@Controller("blogAction")
@Scope(ScopeType.prototype)
public class BlogAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	 
	private String skinType;
	private String shopId;
	private String tempId;
	private String orderby;
	private String blogTitle;
	private String listClassName;
	private int pageCurr;
	private int pageUnit;
	private int totalPage;
	private int shopGradeClassId;
	private int brandId;
	private int totalCount;
	private int blogGroupId;
	private int blogId;
	private int blogGroupParentId;
	private int pageNO;
	private String reviewPoint;
	private String mesContent;
	private String blogGroupName;


	@Resource
	protected MainService mainService;
	
	public String saveBlogReview(){
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		
		shopId = sessionSkin.getShopId().toString();

		String ret="success";
		try{
			Map<String,Object> map=new HashMap<String, Object>();
			mesContent=new String(mesContent.getBytes("ISO-8859-1"),"UTF-8");
			map.put("shopId", shopId);
			map.put("custSysId", sessionMember.getCustSysId());
			map.put("USER_ID", null);
			map.put("reviewType","1");
			map.put("parentId", blogId);
			map.put("reviewId",null);
			map.put("reviewPId",null);
			map.put("reviewDesc",StringUtil.emptyToNull(mesContent));
			map.put("custSysId",sessionMember.getCustSysId());
			map.put("reviewPoint",reviewPoint);
			map.put("jobType","I");
			Map<String,Object> mapResult=commonService.select("Blog.saveBlogPreview", map);
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
	public String blogList() throws Exception{

		//------------------------------------------------------------------------------------------
		SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
		shopId = sessionSkin.getShopId().toString();
		skinType = sessionSkin.getSkinTypeShop().toString();		

		
		if(listClassName==null){
			listClassName = "list-search-list list-list-view";
		}
		
		//分类
		Map<String,Object> groupMap=new HashMap<String, Object>();
		groupMap.put("SHOP_ID", shopId);
		groupMap.put("USER_ID", null);
		groupMap.put("PAGE_CURR", 1);
		groupMap.put("PAGE_UINT", 99999);
		groupMap.put("ORDERBY", orderby);
		
		if(blogGroupId > 0) {
			groupMap.put("BG_ID", blogGroupId);
		}
		
		if(blogGroupParentId > 0) {
			groupMap.put("BG_PARENT_ID", blogGroupParentId);
		}
		//分类
		List<Map<String,Object>> blogGroupList=commonService.selectList("Blog.blogGetGroupList",groupMap);
		request.put("blogGroupList", blogGroupList);

		if(pageCurr < 1) {
			pageCurr = 1;
			pageUnit = 10;
		}
		
		//blog list
		Map<String,Object> blogMap=new HashMap<String, Object>();
		blogMap.put("SHOP_ID",shopId);
		blogMap.put("USER_ID", null);
		blogMap.put("PAGE_CURR", pageCurr);
		blogMap.put("PAGE_UINT", pageUnit);
		blogMap.put("ORDERBY", orderby);
		blogMap.put("BLOG_ID", null);
		if(blogTitle!=null){
			blogTitle=new String(blogTitle.getBytes("ISO-8859-1"),"UTF-8");
		}
		blogMap.put("BLOG_TITLE", blogTitle);
		
		if ((blogGroupId > 0) || (blogGroupId < 0)) {
			blogMap.put("BLOG_GROUP_ID", blogGroupId);
		}
		
		List<Map<String, Object>> blogList=commonService.selectList("Blog.blogGetList",blogMap);
		ListUtil.convertClob2String(blogList );
		

		if(!blogList.isEmpty()){
			totalCount = (Integer)blogList.get(0).get("TOTAL_CNT");
			System.out.println("totalCount=" + totalCount);
			
			if(blogGroupId != 0) {
				blogGroupName = (String)blogList.get(0).get("BLOG_GROUP_NM");
				System.out.println("blogGroupName=" + blogGroupName);
			}
		}

		request.put("blogGroupName", blogGroupName);
		request.put("blogList", blogList);
		


		//-------------------------------------------------------------------------------------------
		// Return
		//-------------------------------------------------------------------------------------------
		String strReturn = "blogList";
		
		
		//-------------------------------------------------------------------------------------------
		return strReturn;
		//-------------------------------------------------------------------------------------------
		
	}
	
	public String blogDetail() {
		SessionMember sessionMember = getSessionMember();
		SessionSkin sessionSkin = getSessionSkin();
		// 商品详情
		Map<String, Object> searchMap = new HashMap<String, Object>();
		// 图文详情列表		

		//blog list
		Map<String,Object> blogMap=new HashMap<String, Object>();
		blogMap.put("SHOP_ID",shopId);
		blogMap.put("CUST_SYS_ID", sessionMember.getCustSysId());
		blogMap.put("USER_ID", null);
		blogMap.put("PAGE_CURR", 1);
		blogMap.put("PAGE_UINT", 1);
		//blogMap.put("ORDERBY", orderby);
		blogMap.put("BLOG_ID", blogId);
		
		Map<String, Object> blogList = commonService.select("Blog.blogGetList",blogMap);
		//ListUtil.convertClob2String(blogList );
		
		int pageId = 0;
		if(!blogList.isEmpty()){
			//pageId = (Integer)blogList.get(0).get("PAGE_ID");
			pageId = Integer.valueOf(blogList.get("PAGE_ID").toString());
			System.out.println("pageId=" + pageId);
		}
		
		searchMap.clear();
		searchMap.put("SHOP_ID", sessionSkin.getShopId());
		searchMap.put("PAGE_ID", pageId);
		searchMap.put("PAGE_TYPE", 7);
		searchMap.put("SKIN_TYPE", sessionSkin.getSkinTypeShop().toString());
		List<Map<String, Object>> blogDetailList = commonService.selectList("Detail.getGoodsImageList", searchMap);
		
		ListUtil.convertClob2String(blogDetailList );

		 
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
		searchMap.put("CUST_SYS_ID", sessionMember.getCustSysId());
		searchMap.put("REVIEW_TYPE", 1);	//1:blog
		searchMap.put("PARENT_ID", blogId);
		searchMap.put("PAGE_CURR", pageNO);
		searchMap.put("PAGE_UNIT", 10);
		searchMap.put("ORDERBY", "REVIEW_ID");
		List<Map<String, Object>> reviewList = commonService.selectList("Blog.blogGetReviewList", searchMap);

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
		
		
		request.put("blogList", blogList);
		request.put("blogDetailList", blogDetailList);
		request.put("reviewList", reviewList);
		

		return "blogDetail";
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

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public int getBlogGroupId() {
		return blogGroupId;
	}

	public void setBlogGroupId(int blogGroupId) {
		this.blogGroupId = blogGroupId;
	}

	public int getBlogId() {
		return blogId;
	}

	public void setBlogId(int blogId) {
		this.blogId = blogId;
	}

	public int getBlogGroupParentId() {
		return blogGroupParentId;
	}

	public void setBlogGroupParentId(int blogGroupParentId) {
		this.blogGroupParentId = blogGroupParentId;
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

	public String getBlogGroupName() {
		return blogGroupName;
	}

	public void setBlogGroupName(String blogGroupName) {
		this.blogGroupName = blogGroupName;
	}

	
}
