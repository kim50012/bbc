package com.waremec.wpt.admin.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.PageData;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.wpt.admin.domain.AdminVote;
import com.waremec.wpt.admin.service.VoteService;
             
@Controller("adminVoteAction")
@Scope(ScopeType.prototype)
public class AdminVoteAction extends BaseAction implements ServletContextAware {

	private static final long serialVersionUID = 1L;
	private String shopId = "";
	private String userId = "";
	private String voteNm = "";
	private String voteType = "";
	private String voteDt = "";
	private String voteHour = "";
	private String voteMin = "";
	private String votePer = "";
	private String voteQuestions = "";
	private String voteOptions = "";
	private String pageEntity = "";
	private String voteId = "";
	private String questId = "";
	private String optionId = "";
	private String jobType = "";

	private File logo_input = null;
	private String logoFileName = "";
	private ServletContext context = null;
	private String imgUrl="";
	private String voteDesc="";

	@Resource
	private VoteService voteService;

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: 投票调查一页面加载
	 */
	public String voteList() throws UnsupportedEncodingException {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String strVoteNm = voteNm;
		
	/*	if (!voteNm.equals("")) {
			
			strVoteNm = new String(voteNm.getBytes("ISO-8859-1"),"UTF-8");
		}
*/
		AdminVote voteIn = new AdminVote();
		voteIn.setShopId_IN(Integer.parseInt(shopId));
		voteIn.setUserId_IN(userId);
		voteIn.setPageCurr(pageCurr);
		voteIn.setPageUint(pageUnit);
		if (!strVoteNm.equals("")) {
			voteIn.setVoteNm_IN(strVoteNm);
		}
		if (!voteType.equals("")) {
			voteIn.setVoteType_IN(voteType);
		}
		
		List<AdminVote> reList = (List<AdminVote>) voteService.selectList("AdminVote.selectList", voteIn);
		PageData page = new PageData();
		if (!reList.isEmpty()) {
			int totalCount = reList.get(0).getTOTAL_CNT();
			page = new PageData(pageCurr,pageUnit, totalCount , reList);
		}
		
		request.put("page", page);
		request.put("reList", reList);
		request.put("voteNm", strVoteNm);
		request.put("voteType", voteType);

		return "voteList";
	}
	public String voteListFragment(){
		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();
		String strVoteNm = voteNm;
		
	/*	if (!voteNm.equals("")) {
			
			strVoteNm = new String(voteNm.getBytes("ISO-8859-1"),"UTF-8");
		}
*/
		AdminVote voteIn = new AdminVote();
		voteIn.setShopId_IN(Integer.parseInt(shopId));
		voteIn.setUserId_IN(userId);
		voteIn.setPageCurr(pageCurr);
		voteIn.setPageUint(pageUnit);
		if (!strVoteNm.equals("")) {
			voteIn.setVoteNm_IN(strVoteNm);
		}
		if (!voteType.equals("")) {
			voteIn.setVoteType_IN(voteType);
		}
		
		List<AdminVote> reList = (List<AdminVote>) voteService.selectList("AdminVote.selectList", voteIn);
		PageData page = new PageData();
		if (!reList.isEmpty()) {
			int totalCount = reList.get(0).getTOTAL_CNT();
			page = new PageData(pageCurr,pageUnit, totalCount , reList);
		}
		
		request.put("page", page);
		request.put("reList", reList);
		request.put("voteNm", strVoteNm);
		request.put("voteType", voteType);
		return "voteListFragment";
	}
	/**
	 * @author: liyang
	 * @version: v1.0
	 * @throws UnsupportedEncodingException 
	 * @exception: 投票调查一新建
	 */
	public String voteProblems() throws UnsupportedEncodingException {

		String strVoteNm = "";
		
		if (!voteNm.equals("")) {
			
			strVoteNm = new String(voteNm.getBytes("ISO-8859-1"),"UTF-8");
		}
		if (!voteId.equals("")) {
			
			shopId = getBackSessionShopId().toString();
			userId = getBackSessionUserId();
			
			AdminVote voteIn = new AdminVote();
			voteIn.setVoteId_IN(Integer.parseInt(voteId));
			voteIn.setUserId_IN(userId);
			
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
			request.put("voteId", voteId);
			request.put("voteNm", strVoteNm);
			request.put("voteType", voteType);
		} else {
			
			request.put("reVoteHeader", null);
			request.put("reVoteQlist", null);
			request.put("voteId", "");
			request.put("voteNm", "");
			request.put("voteType", "");
		}

		return "voteProblems";
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 投票调查-保存
	 */
	public String save() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {

			AdminVote voteIn = new AdminVote();
			voteIn.setShopId_IN(Integer.parseInt(shopId));
			voteIn.setUserId_IN(userId);
			voteIn.setVoteNm_IN(voteNm);
			voteIn.setVoteDt_IN(voteDt);
			voteIn.setVoteHour_IN(voteHour);
			voteIn.setVoteMin_IN(voteMin);
			voteIn.setVotePer_IN(votePer);
			voteIn.setVoteQuests_IN(voteQuestions);
			voteIn.setVoteOptions_IN(voteOptions);
			voteIn.setVoteDesc(voteDesc);
			voteIn.setImgUrl(imgUrl);
			if (!voteId.equals("")) {
				voteIn.setVoteId_IN(Integer.parseInt(voteId));
			}
			
			voteService.insertDomain("AdminVote.save", voteIn);
			
			returnMap.put("success", true);

		} catch (Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 投票调查-保存
	 */
	public String modify() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {

			AdminVote voteIn = new AdminVote();
			voteIn.setShopId_IN(Integer.parseInt(shopId));
			voteIn.setUserId_IN(userId);
			voteIn.setVoteNm_IN(voteNm);
			voteIn.setVoteDt_IN(voteDt);
			voteIn.setVoteHour_IN(voteHour);
			voteIn.setVoteMin_IN(voteMin);
			voteIn.setVotePer_IN(votePer);
			voteIn.setVoteQuests_IN(voteQuestions);
			voteIn.setVoteOptions_IN(voteOptions);
			voteIn.setVoteDesc(voteDesc);
			voteIn.setImgUrl(imgUrl);
			if (!voteId.equals("")) {
				voteIn.setVoteId_IN(Integer.parseInt(voteId));
			}
			
			voteService.insertDomain("AdminVote.modify", voteIn);
			
			returnMap.put("success", true);

		} catch (Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}

		renderJSON(returnMap);

		return NONE;
	}

	/**
	 * @author: liyang
	 * @version: v1.0
	 * @exception: 投票调查-删除
	 */
	public String voteDelete() {

		shopId = getBackSessionShopId().toString();
		userId = getBackSessionUserId();

		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {

			AdminVote voteIn = new AdminVote();
			voteIn.setShopId_IN(Integer.parseInt(shopId));
			voteIn.setUserId_IN(userId);
			voteIn.setVoteId_IN(Integer.parseInt(voteId));
			voteIn.setJobType_IN(Integer.parseInt(jobType));
			if (jobType.equals("2")) {
				voteIn.setQuestId_IN(Integer.parseInt(questId));
			}
			if (jobType.equals("3")) {
				voteIn.setQuestId_IN(Integer.parseInt(questId));
				voteIn.setOptionId_IN(Integer.parseInt(optionId));
			}
			
			voteService.insertDomain("AdminVote.voteDelete", voteIn);
			
			returnMap.put("success", true);
			
		} catch (Exception e) {
			
			logger.error(e.getMessage());
			returnMap.put("success", false);
			returnMap.put("err_msg", e.getMessage());
		}

		renderJSON(returnMap);

		return NONE;
	}
	
	public static String getNowDate(){
		return new SimpleDateFormat("yyyyMMdd").format(new Date());  
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

	public File getLogo_input() {
		return logo_input;
	}

	public void setLogo_input(File logo_input) {
		this.logo_input = logo_input;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public ServletContext getContext() {
		return context;
	}

	public void setContext(ServletContext context) {
		this.context = context;
	}

	@Override
	public void setServletContext(ServletContext context) {
		// TODO Auto-generated method stub
		
	}

	public VoteService getVoteService() {
		return voteService;
	}

	public void setVoteService(VoteService voteService) {
		this.voteService = voteService;
	}

	public String getVoteNm() {
		return voteNm;
	}

	public void setVoteNm(String voteNm) {
		this.voteNm = voteNm;
	}

	public String getVoteDt() {
		return voteDt;
	}

	public void setVoteDt(String voteDt) {
		this.voteDt = voteDt;
	}

	public String getVoteHour() {
		return voteHour;
	}

	public void setVoteHour(String voteHour) {
		this.voteHour = voteHour;
	}

	public String getVoteMin() {
		return voteMin;
	}

	public void setVoteMin(String voteMin) {
		this.voteMin = voteMin;
	}

	public String getVotePer() {
		return votePer;
	}

	public void setVotePer(String votePer) {
		this.votePer = votePer;
	}

	public String getVoteQuestions() {
		return voteQuestions;
	}

	public void setVoteQuestions(String voteQuestions) {
		this.voteQuestions = voteQuestions;
	}

	public String getVoteOptions() {
		return voteOptions;
	}

	public void setVoteOptions(String voteOptions) {
		this.voteOptions = voteOptions;
	}

	public String getVoteType() {
		return voteType;
	}

	public void setVoteType(String voteType) {
		this.voteType = voteType;
	}

	public String getPageEntity() {
		return pageEntity;
	}

	public void setPageEntity(String pageEntity) {
		this.pageEntity = pageEntity;
	}

	public String getVoteId() {
		return voteId;
	}

	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}

	public String getQuestId() {
		return questId;
	}

	public void setQuestId(String questId) {
		this.questId = questId;
	}

	public String getOptionId() {
		return optionId;
	}

	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getVoteDesc() {
		return voteDesc;
	}

	public void setVoteDesc(String voteDesc) {
		this.voteDesc = voteDesc;
	}
}
