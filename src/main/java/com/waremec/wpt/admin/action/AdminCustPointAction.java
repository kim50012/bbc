package com.waremec.wpt.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.wpt.admin.domain.AdminPoint;
import com.waremec.wpt.admin.service.PointService;

@Controller("adminCustPointAction")
@Scope(ScopeType.prototype)
public class AdminCustPointAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	// 存储用户的ID号
	private String userId = "";
	// [积分] 标志字段，判断所要进行的操作。(I 插入数据 U 修改数据 D 删除数据)
	private String jobType = "";
	// [积分] 店铺ID SHOP_ID
	private String shopId = "";
	// [积分] 积分 ID POINT_ID
	private String pointId = "";
	// [积分] 积分名称(XX活动积分 等) POINT_NM
	private String pointName = "";
	// [积分] 分享文案(给客户显示名) POINT_SHARE_NM
	private String pointShareName = "";
	// [积分] 积分 POINT
	private String pointNum = "";
	// [积分] 1关注 2每成交易(笔) 3每购买金额(元)... POINT_TYPE
	private String pointType = "";
	// [积分] 基准每成交易(笔) BASE_QTY
	private String baseQTY = "";
	// [积分] 基准每购买金额(元) BASE_PRICE
	private String basePrice = "";
	// [积分] 1通知 0不发送 NOTICE_FLAG
	private String noticeFlag = "";
	// [积分] (统计)已赠送数量 SUM_GIVE_QTY
	private String sumGiveQTY = "";
	// [积分] 修改积分用户的ID MODIFIED_ID 默认值0 表示无人修改
	private String modifiedUserId = "";
	// [积分] 创建积分规则的用户的ID CREATED_ID
	private String createdUserId = "";
	@Resource
	private PointService pointService;

	public String deletePoint() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		String ret = "success";
		try {
			AdminPoint adminPoint = new AdminPoint();
			adminPoint.setShopId(shopId);
			adminPoint.setPointId(pointId);
			modifiedUserId = userId;// (String) session.get("");
			adminPoint.setModifiedUserId(modifiedUserId);
			adminPoint.setIsUseNum("0");
			pointService.deletePoint("Point.deletePoint", adminPoint);
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * 修改积分规则
	 * 
	 * @return
	 */
	public String updatePoint() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		String ret = "success";
		jobType = "U";
		AdminPoint adminPoint = new AdminPoint();
		try {
			adminPoint.setBasePrice(basePrice);
			adminPoint.setBaseQTY(baseQTY);
			// 用session获取userId的值
			createdUserId = userId;// (String) session.get("");
			adminPoint.setCreatedUserId(createdUserId);
			adminPoint.setIsUseNum("1");
			adminPoint.setNoticeFlag(noticeFlag);
			adminPoint.setSumGiveQTY("0");
			adminPoint.setPointType(pointType);
			// pointShareName=new
			// String(pointShareName.getBytes("ISO-8859-1"),"UTF-8");
			adminPoint.setPointShareName(pointShareName);
			// pointName=new String(pointName.getBytes("ISO-8859-1"),"UTF-8");
			adminPoint.setPointName(pointName);
			adminPoint.setPointNum(pointNum);
			adminPoint.setJobType(jobType);
			adminPoint.setShopId(shopId);
			adminPoint.setPointId(pointId);
			// 用session获取userId的值
			modifiedUserId = userId;// (String) session.get("");
			adminPoint.setModifiedUserId(modifiedUserId);
			String pointId = pointService.updatePoint("Point.updatePoint", adminPoint);
			// System.out.println(pointId);
			if (pointId.equals("")) {
				ret = "fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}

	/**
	 * 转到point页面，并将其所需要的信息传递过去
	 * 
	 * @return
	 */
	public String pointList() {
		shopId = getBackSessionShopId().toString();
		AdminPoint adminPoint = new AdminPoint();
		adminPoint.setShopId(shopId);
		List<AdminPoint> adminPointList = (List<AdminPoint>) pointService.selectPointList("Point.selectPointList", adminPoint);
		request.put("adminPointList", adminPointList);
		int count = adminPointList.size();
		request.put("count", count);
		return "pointList";
	}

	/**
	 * 修改积分规则时，查询其原本信息。
	 * 
	 * @return
	 */
	public String selectPoint() {
		shopId = getBackSessionShopId().toString();
		AdminPoint adminPointParam = new AdminPoint();
		adminPointParam.setShopId(shopId);
		adminPointParam.setPointId(pointId);
		AdminPoint adminPoint = pointService.selectPoint("Point.selectPoint", adminPointParam);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if (adminPoint.getShopId().equals("")) {
			returnMap.put("result", "fail");
		} else {
			returnMap.put("adminPoint", adminPoint);
			returnMap.put("result", "success");
		}
		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * 存储新建的积分规则
	 * 
	 * @return 是否成功
	 */
	public String savePoint() {
		userId = getBackSessionUserId();
		shopId = getBackSessionShopId().toString();
		try {
			jobType = "I";
			AdminPoint adminPoint = new AdminPoint();
			adminPoint.setBasePrice(basePrice);
			adminPoint.setBaseQTY(baseQTY);
			// 用session获取userId的值
			createdUserId = userId;// (String) session.get("");
			adminPoint.setCreatedUserId(createdUserId);
			adminPoint.setIsUseNum("1");
			adminPoint.setNoticeFlag(noticeFlag);
			adminPoint.setSumGiveQTY("0");
			adminPoint.setPointType(pointType);
			// pointShareName=new
			// String(pointShareName.getBytes("ISO-8859-1"),"UTF-8");
			adminPoint.setPointShareName(pointShareName);
			// pointName=new String(pointName.getBytes("ISO-8859-1"),"UTF-8");
			adminPoint.setPointName(pointName);
			adminPoint.setPointNum(pointNum);
			adminPoint.setJobType(jobType);
			adminPoint.setShopId(shopId);
			adminPoint.setModifiedUserId("0");
			pointId = (String) pointService.savePoint("Point.savePoint", adminPoint);
		} catch (Exception e) {
			e.printStackTrace();
			pointId = "";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("pointId", pointId);
		returnMap.put("shopId", shopId);
		renderJSON(returnMap);
		return NONE;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	public String getPointId() {
		return pointId;
	}

	public void setPointId(String pointId) {
		this.pointId = pointId;
	}

	public String getPointName() {
		return pointName;
	}

	public void setPointName(String pointName) {
		this.pointName = pointName;
	}

	public String getPointShareName() {
		return pointShareName;
	}

	public void setPointShareName(String pointShareName) {
		this.pointShareName = pointShareName;
	}

	public String getPointNum() {
		return pointNum;
	}

	public void setPointNum(String pointNum) {
		this.pointNum = pointNum;
	}

	public String getPointType() {
		return pointType;
	}

	public void setPointType(String pointType) {
		this.pointType = pointType;
	}

	public String getBaseQTY() {
		return baseQTY;
	}

	public void setBaseQTY(String baseQTY) {
		this.baseQTY = baseQTY;
	}

	public String getBasePrice() {
		return basePrice;
	}

	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}

	public String getNoticeFlag() {
		return noticeFlag;
	}

	public void setNoticeFlag(String noticeFlag) {
		this.noticeFlag = noticeFlag;
	}

	public String getSumGiveQTY() {
		return sumGiveQTY;
	}

	public void setSumGiveQTY(String sumGiveQTY) {
		this.sumGiveQTY = sumGiveQTY;
	}

	public String getModifiedUserId() {
		return modifiedUserId;
	}

	public void setModifiedUserId(String modifiedUserId) {
		this.modifiedUserId = modifiedUserId;
	}

	public String getCreatedUserId() {
		return createdUserId;
	}

	public void setCreatedUserId(String createdUserId) {
		this.createdUserId = createdUserId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
