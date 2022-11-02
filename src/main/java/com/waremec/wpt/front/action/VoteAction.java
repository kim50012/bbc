package com.waremec.wpt.front.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.wpt.admin.domain.AdminVote;
import com.waremec.wpt.admin.service.VoteService;
import com.waremec.wpt.front.domain.SessionSkin;
@Controller("voteAction")
@Scope(ScopeType.prototype)
public class VoteAction extends WeixinBaseAction{
	private static final long serialVersionUID = 1L;
	
	private Integer shopId;
	private Integer custSysId;
	
	@Resource
	private VoteService voteService;
	private String voteId="";
	private String opId="";
	private String questId="";
	private String typeName="";
	/**
	 * 投票选择操作，选择的结果保存
	 * @return
	 */
	public String voteSelect(){
		String ret="success";
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		if (sessionMember != null) {
			custSysId = sessionMember.getCustSysId();
		}
		shopId=sessionSkin.getShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("custSysId", custSysId);
		map.put("questId", questId);
		map.put("opId", opId);
		map.put("voteId", voteId);
		Map<String,Object> mapReturn=commonService.select("Vote.voteSelect", map);
		if(mapReturn.isEmpty()){
			ret="fail";
		}else{
			String msg=(String) mapReturn.get("OUT_ERR_MSG");
			if("S".equals(msg)||msg=="S"){
				ret="success";
			}else{
				if("F".equals(msg) || msg=="F"){
					ret="F";
				}else{
					ret="fail";
				}
			}
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	/**
	 * 打开投票页面
	 * @return
	 */
	public String vote(){
		jsSdkStting();
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
			custSysId = sessionMember.getCustSysId();
		}
		request.put("loginFlag", loginFlag);
		shopId=sessionSkin.getShopId();
		
		AdminVote voteIn = new AdminVote();
		voteIn.setVoteId_IN(Integer.parseInt(voteId));
		
		voteIn.setJobType_IN(1);
		AdminVote reVoteHeader = (AdminVote) voteService.select("AdminVote.selectDList", voteIn);
		
		voteIn.setJobType_IN(2);
		List<AdminVote> reVoteQlist = (List<AdminVote>) voteService.selectList("AdminVote.selectDList", voteIn);
		
		voteIn.setJobType_IN(3);
		for (AdminVote s : reVoteQlist) {
			voteIn.setqId_IN(s.getQUEST_ID());
			List<AdminVote> reVoteOlist = (List<AdminVote>) voteService.selectList("AdminVote.selectDList", voteIn);
			s.setSubList(reVoteOlist);
		}
		
		request.put("reVoteHeader", reVoteHeader);
		request.put("reVoteQlist", reVoteQlist);

		return "vote";
	}
	
	//下拉显示活动信息查询
	public String getNextPromotion(){
		pageUnit=3;
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		if (sessionMember != null) {
			custSysId = sessionMember.getCustSysId();
		}
		shopId=sessionSkin.getShopId();
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("voteType", null);
		map.put("voteNm", null);
		map.put("userId", null);
		map.put("custSysId", custSysId);
		List<Map<String,Object>> list=commonService.selectList("Vote.selectVoteList", map);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		renderJSON(returnMap);
		return NONE;
	}
	/**
	 * 打开投票结果页面
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String voteResult() throws UnsupportedEncodingException{
		jsSdkStting();
		SessionSkin sessionSkin = getSessionSkin();
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
			custSysId = sessionMember.getCustSysId();
		}
		request.put("loginFlag", loginFlag);
		shopId=sessionSkin.getShopId();
		
		AdminVote voteIn = new AdminVote();
		voteIn.setVoteId_IN(Integer.parseInt(voteId));
		
		voteIn.setJobType_IN(1);
		AdminVote reVoteHeader = (AdminVote) voteService.select("AdminVote.selectDList", voteIn);
		
		voteIn.setJobType_IN(2);
		List<AdminVote> reVoteQlist = (List<AdminVote>) voteService.selectList("AdminVote.selectDList", voteIn);
		
		voteIn.setJobType_IN(3);
		for (AdminVote s : reVoteQlist) {
			voteIn.setqId_IN(s.getQUEST_ID());
			List<AdminVote> reVoteOlist = (List<AdminVote>) voteService.selectList("AdminVote.selectDList", voteIn);
			s.setSubList(reVoteOlist);
		}
		
		request.put("reVoteHeader", reVoteHeader);
		request.put("reVoteQlist", reVoteQlist);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("voteId", voteId);
		map.put("custSysId", custSysId);
		List<Map<String,Object>> list=commonService.selectList("Vote.selectVoteResult", map);
		request.put("list", list);
		typeName = new String(typeName.getBytes("ISO-8859-1"),"UTF-8");
		request.put("typeName",typeName);
		return "voteResult";
	}
	/**
	 * 打开投票活动列表页面
	 * @return
	 */
	public String voteList(){
		jsSdkStting();
		pageUnit=3;
		SessionSkin sessionSkin = getSessionSkin();
		shopId=sessionSkin.getShopId();
		SessionMember sessionMember = getSessionMember();
		int loginFlag = 0;
		if (sessionMember != null) {
			loginFlag = 1;
			custSysId = sessionMember.getCustSysId();
		}
		request.put("loginFlag", loginFlag);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("shopId", shopId);
		map.put("pageCurr",pageCurr);
		map.put("pageUint",pageUnit);
		map.put("voteType", null);
		map.put("voteNm", null);
		map.put("userId", null);
		map.put("custSysId", custSysId);
		List<Map<String,Object>> list=commonService.selectList("Vote.selectVoteList", map);
		int pageCountTotal=0;
		if(list.size()!=0){
			int countTotal=(Integer) list.get(0).get("TOTAL_CNT");
			pageCountTotal=countTotal/pageUnit+(countTotal%pageUnit==0?0:1);
		}
		request.put("list", list);
		request.put("pageCount", pageCountTotal);
		return "voteList";
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getCustSysId() {
		return custSysId;
	}

	public void setCustSysId(Integer custSysId) {
		this.custSysId = custSysId;
	}

	public String getVoteId() {
		return voteId;
	}

	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public String getOpId() {
		return opId;
	}
	public void setOpId(String opId) {
		this.opId = opId;
	}
	public String getQuestId() {
		return questId;
	}
	public void setQuestId(String questId) {
		this.questId = questId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
