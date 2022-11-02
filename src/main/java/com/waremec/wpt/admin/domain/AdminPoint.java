package com.waremec.wpt.admin.domain;
/**
 * 存储积分规则的实体类
 * @author Administrator
 *
 */
public class AdminPoint{
	//[积分] 用于存储显示的序号
	private String number="";
	//[积分] 标志字段，判断所要进行的操作。(I 插入数据 U 修改数据  D 删除数据)
	private String jobType="";
	//[积分] 店铺ID	SHOP_ID
	private String shopId="";
	//[积分] 积分 ID	POINT_ID
	private String pointId="";
	//[积分] 积分名称(XX活动积分 等)	POINT_NM
	private String pointName="";
	//[积分] 分享文案(给客户显示名)	POINT_SHARE_NM
	private String pointShareName="";
	//[积分] 积分	POINT
	private String pointNum="";
	//[积分] 1关注 2每成交易(笔) 3每购买金额(元)...	POINT_TYPE
	private String pointType="";
	//[积分] 基准每成交易(笔)	BASE_QTY
	private String baseQTY="";
	//[积分] 基准每购买金额(元)	BASE_PRICE
	private String basePrice="";
	//[积分] 1通知 0不发送	NOTICE_FLAG
	private String noticeFlag="";
	//[积分] (统计)已赠送数量	SUM_GIVE_QTY
	private String sumGiveQTY="";
	//[积分] 修改的日期		MODIFIED_DT
	private String modifiedDate="";
	//[积分]	创建的日期		CREATED_DT
	private String createdDate="";
	//[积分]	修改积分用户的ID	MODIFIED_ID 默认值0 表示无人修改
	private String modifiedUserId="";
	//[积分]	创建积分规则的用户的ID	CREATED_ID
	private String createdUserId="";
	//[积分] 0:停用 1:使用
	private String isUseNum="";
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
	public String getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
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
	public String getIsUseNum() {
		return isUseNum;
	}
	public void setIsUseNum(String isUseNum) {
		this.isUseNum = isUseNum;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
}
