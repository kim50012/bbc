package com.waremec.wpt.admin.domain;

import java.util.ArrayList;
import java.util.List;

public class AdminVote {

	/*----------活动信息IN----------*/
	/* 店铺Id */
	private int shopId_IN;

	/* 用户Id */
	private String userId_IN;

	/* 投票名称*/
	private String voteNm_IN;

	/* 截止日期 */
	private String voteDt_IN;

	/* 截止小时 */
	private String voteHour_IN;

	/* 截止分钟 */
	private String voteMin_IN;

	/* 投票权限*/
	private String votePer_IN;

	/* 投票问题 */
	private String voteQuests_IN;

	/* 投票问题选项 */
	private String voteOptions_IN;

	/* 状态 */
	private String voteType_IN;

	/* 状态 */
	private int voteId_IN;

	/* 状态 */
	private int questId_IN;

	/* 状态 */
	private int optionId_IN;

	/* 状态 */
	private int qId_IN;

	/* 状态 */
	private int jobType_IN;
	
	private int pageCurr = 0;

	private int pageUint = 0;
	
	private String voteDesc="";
	
	private String imgUrl="";

	/*----------活动信息OUT----------*/

	/* 投票id */
	private String VOTE_ID;

	/* 投票名称 */
	private String VOTE_NM;

	/* 投票数量 */
	private String VOTE_NUMBER;

	/* 投票状态 */
	private String VOTE_TYPE;

	/* 投票数量*/
	private int TOTAL_CNT;

	/* 投票数量*/
	private String VOTE_DT;
	private String VOTE_HOUR;
	private String VOTE_MIN;
	
	/* 投票数量*/
	private String VOTE_PER;
	
	/* 投票数量*/
	private int QUEST_ID;
	
	/* 投票数量*/
	private String QUEST_NM;
	
	/* 投票数量*/
	private String RADIO_ONLY;
	
	/* 投票数量*/
	private String OP_ID;
	
	/* 投票数量*/
	private String OP_NM;
	
	/* 投票数量*/
	private String IMG_ID;
	
	/* 投票数量*/
	private String IMG_URL;
	
	List<AdminVote> subList = new ArrayList<AdminVote>();
	

	public int getShopId_IN() {
		return shopId_IN;
	}

	public void setShopId_IN(int shopId_IN) {
		this.shopId_IN = shopId_IN;
	}

	public String getUserId_IN() {
		return userId_IN;
	}

	public void setUserId_IN(String userId_IN) {
		this.userId_IN = userId_IN;
	}

	public int getPageCurr() {
		return pageCurr;
	}

	public void setPageCurr(int pageCurr) {
		this.pageCurr = pageCurr;
	}

	public int getPageUint() {
		return pageUint;
	}

	public void setPageUint(int pageUint) {
		this.pageUint = pageUint;
	}

	public String getVoteNm_IN() {
		return voteNm_IN;
	}

	public void setVoteNm_IN(String voteNm_IN) {
		this.voteNm_IN = voteNm_IN;
	}

	public String getVoteDt_IN() {
		return voteDt_IN;
	}

	public void setVoteDt_IN(String voteDt_IN) {
		this.voteDt_IN = voteDt_IN;
	}

	public String getVoteHour_IN() {
		return voteHour_IN;
	}

	public void setVoteHour_IN(String voteHour_IN) {
		this.voteHour_IN = voteHour_IN;
	}

	public String getVoteMin_IN() {
		return voteMin_IN;
	}

	public void setVoteMin_IN(String voteMin_IN) {
		this.voteMin_IN = voteMin_IN;
	}

	public String getVotePer_IN() {
		return votePer_IN;
	}

	public void setVotePer_IN(String votePer_IN) {
		this.votePer_IN = votePer_IN;
	}

	public String getVoteQuests_IN() {
		return voteQuests_IN;
	}

	public void setVoteQuests_IN(String voteQuests_IN) {
		this.voteQuests_IN = voteQuests_IN;
	}

	public String getVoteOptions_IN() {
		return voteOptions_IN;
	}

	public void setVoteOptions_IN(String voteOptions_IN) {
		this.voteOptions_IN = voteOptions_IN;
	}

	public String getVoteType_IN() {
		return voteType_IN;
	}

	public void setVoteType_IN(String voteType_IN) {
		this.voteType_IN = voteType_IN;
	}

	public String getVOTE_ID() {
		return VOTE_ID;
	}

	public void setVOTE_ID(String vOTE_ID) {
		VOTE_ID = vOTE_ID;
	}

	public String getVOTE_NM() {
		return VOTE_NM;
	}

	public void setVOTE_NM(String vOTE_NM) {
		VOTE_NM = vOTE_NM;
	}

	public String getVOTE_NUMBER() {
		return VOTE_NUMBER;
	}

	public void setVOTE_NUMBER(String vOTE_NUMBER) {
		VOTE_NUMBER = vOTE_NUMBER;
	}

	public String getVOTE_TYPE() {
		return VOTE_TYPE;
	}

	public void setVOTE_TYPE(String vOTE_TYPE) {
		VOTE_TYPE = vOTE_TYPE;
	}

	public int getTOTAL_CNT() {
		return TOTAL_CNT;
	}

	public void setTOTAL_CNT(int tOTAL_CNT) {
		TOTAL_CNT = tOTAL_CNT;
	}

	public int getVoteId_IN() {
		return voteId_IN;
	}

	public void setVoteId_IN(int voteId_IN) {
		this.voteId_IN = voteId_IN;
	}

	public int getqId_IN() {
		return qId_IN;
	}

	public void setqId_IN(int qId_IN) {
		this.qId_IN = qId_IN;
	}

	public int getJobType_IN() {
		return jobType_IN;
	}

	public void setJobType_IN(int jobType_IN) {
		this.jobType_IN = jobType_IN;
	}

	public String getVOTE_DT() {
		return VOTE_DT;
	}

	public void setVOTE_DT(String vOTE_DT) {
		VOTE_DT = vOTE_DT;
	}

	public String getVOTE_HOUR() {
		return VOTE_HOUR;
	}

	public void setVOTE_HOUR(String vOTE_HOUR) {
		VOTE_HOUR = vOTE_HOUR;
	}

	public String getVOTE_MIN() {
		return VOTE_MIN;
	}

	public void setVOTE_MIN(String vOTE_MIN) {
		VOTE_MIN = vOTE_MIN;
	}

	public String getVOTE_PER() {
		return VOTE_PER;
	}

	public void setVOTE_PER(String vOTE_PER) {
		VOTE_PER = vOTE_PER;
	}

	public String getRADIO_ONLY() {
		return RADIO_ONLY;
	}

	public void setRADIO_ONLY(String rADIO_ONLY) {
		RADIO_ONLY = rADIO_ONLY;
	}

	public String getOP_NM() {
		return OP_NM;
	}

	public void setOP_NM(String oP_NM) {
		OP_NM = oP_NM;
	}

	public String getIMG_ID() {
		return IMG_ID;
	}

	public void setIMG_ID(String iMG_ID) {
		IMG_ID = iMG_ID;
	}

	public List<AdminVote> getSubList() {
		return subList;
	}

	public void setSubList(List<AdminVote> subList) {
		this.subList = subList;
	}

	public String getIMG_URL() {
		return IMG_URL;
	}

	public void setIMG_URL(String iMG_URL) {
		IMG_URL = iMG_URL;
	}

	public int getQUEST_ID() {
		return QUEST_ID;
	}

	public void setQUEST_ID(int qUEST_ID) {
		QUEST_ID = qUEST_ID;
	}

	public String getQUEST_NM() {
		return QUEST_NM;
	}

	public void setQUEST_NM(String qUEST_NM) {
		QUEST_NM = qUEST_NM;
	}

	public int getQuestId_IN() {
		return questId_IN;
	}

	public void setQuestId_IN(int questId_IN) {
		this.questId_IN = questId_IN;
	}

	public int getOptionId_IN() {
		return optionId_IN;
	}

	public void setOptionId_IN(int optionId_IN) {
		this.optionId_IN = optionId_IN;
	}

	public String getOP_ID() {
		return OP_ID;
	}

	public void setOP_ID(String oP_ID) {
		OP_ID = oP_ID;
	}

	public String getVoteDesc() {
		return voteDesc;
	}

	public void setVoteDesc(String voteDesc) {
		this.voteDesc = voteDesc;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
}
