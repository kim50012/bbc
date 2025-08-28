package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.action.BaseAction;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.wpt.domain.SessionMember;
import com.waremec.wpt.front.service.BbcService;
import com.waremec.wpt.front.service.KakaoService;

@Controller("bbcNewAction")
@Scope(ScopeType.prototype)
public class BbcNewAction extends BaseAction{
    private static final long serialVersionUID = 1L;
    private int intClbsq;	  // [클럽회칙] 클럽시퀀스
    private int intMbrsq;	  // [회원별랭킹집계] 회원시퀀스
    private String strClbgd;	  // [클럽회원] 클럽회원등급[주인장/부주인/일반등/]
    private String strClbniknm;	  // [클럽회원] 클럼내닉네임
    private String strLngdv;	  // [메뉴명] 언어구분
    private String pageName;
    private String dataType;
    private String pagePath;
    private int intMsgsq;
    private String code;
    private String strPtourl;
    private String para1;
    private String para2;
    private String para3;
    private String para4;
    private String para5;
    private String para6;
    private String para7;
    private String para8;
    private String para9;
    private String para10;
    private String para11;
    private String para12;
    private String para13;
    private String para14;
    private String para15;
    private String para16;
    private String para17;
    private String para18;
    private String para19;
    private String para20;
    @Resource
    protected BbcService bbcService;
    @Resource
    protected KakaoService kakaoService;

    public int getIntMsgsq(){
	return intMsgsq;
    }

    public void setIntMsgsq(int intMsgsq){
	this.intMsgsq = intMsgsq;
    }

    public String getPageName(){
	return pageName;
    }

    public void setPageName(String pageName){
	this.pageName = pageName;
    }

    public String getDataType(){
	return dataType;
    }

    public void setDataType(String dataType){
	this.dataType = dataType;
    }

    public int getIntClbsq(){
	return intClbsq;
    }

    public void setIntClbsq(int intClbsq){
	this.intClbsq = intClbsq;
    }

    public int getIntMbrsq(){
	return intMbrsq;
    }

    public void setIntMbrsq(int intMbrsq){
	this.intMbrsq = intMbrsq;
    }

    public String getStrClbgd(){
	return strClbgd;
    }

    public void setStrClbgd(String strClbgd){
	this.strClbgd = strClbgd;
    }

    public String getStrClbniknm(){
	return strClbniknm;
    }

    public void setStrClbniknm(String strClbniknm){
	this.strClbniknm = strClbniknm;
    }

    public String getStrLngdv(){
	return strLngdv;
    }

    public void setStrLngdv(String strLngdv){
	this.strLngdv = strLngdv;
    }

    public String getPagePath(){
	return pagePath;
    }

    public void setPagePath(String pagePath){
	this.pagePath = pagePath;
    }

    public String getCode(){
	return code;
    }

    public void setCode(String code){
	this.code = code;
    }

    public String getStrPtourl(){
	return strPtourl;
    }

    public void setStrPtourl(String strPtourl){
	this.strPtourl = strPtourl;
    }

    public String getPara1(){
	return para1;
    }

    public void setPara1(String para1){
	this.para1 = para1;
    }

    public String getPara2(){
	return para2;
    }

    public void setPara2(String para2){
	this.para2 = para2;
    }

    public String getPara3(){
	return para3;
    }

    public void setPara3(String para3){
	this.para3 = para3;
    }

    public String getPara4(){
	return para4;
    }

    public void setPara4(String para4){
	this.para4 = para4;
    }

    public String getPara5(){
	return para5;
    }

    public void setPara5(String para5){
	this.para5 = para5;
    }

    public String getPara6(){
	return para6;
    }

    public void setPara6(String para6){
	this.para6 = para6;
    }

    public String getPara7(){
	return para7;
    }

    public void setPara7(String para7){
	this.para7 = para7;
    }

    public String getPara8(){
	return para8;
    }

    public void setPara8(String para8){
	this.para8 = para8;
    }

    public String getPara9(){
	return para9;
    }

    public void setPara9(String para9){
	this.para9 = para9;
    }

    public String getPara10(){
	return para10;
    }

    public void setPara10(String para10){
	this.para10 = para10;
    }

    public String getPara11(){
	return para11;
    }

    public void setPara11(String para11){
	this.para11 = para11;
    }

    public String getPara12(){
	return para12;
    }

    public void setPara12(String para12){
	this.para12 = para12;
    }

    public String getPara13(){
	return para13;
    }

    public void setPara13(String para13){
	this.para13 = para13;
    }

    public String getPara14(){
	return para14;
    }

    public void setPara14(String para14){
	this.para14 = para14;
    }

    public String getPara15(){
	return para15;
    }

    public void setPara15(String para15){
	this.para15 = para15;
    }

    public String getPara16(){
	return para16;
    }

    public void setPara16(String para16){
	this.para16 = para16;
    }

    public String getPara17(){
	return para17;
    }

    public void setPara17(String para17){
	this.para17 = para17;
    }

    public String getPara18(){
	return para18;
    }

    public void setPara18(String para18){
	this.para18 = para18;
    }

    public String getPara19(){
	return para19;
    }

    public void setPara19(String para19){
	this.para19 = para19;
    }

    public String getPara20(){
	return para20;
    }

    public void setPara20(String para20){
	this.para20 = para20;
    }

    // ---------------------------------------------------------------
    // [클럽-clb] Club 나의 정보 수정
    // ---------------------------------------------------------------
    public String updateMbrInfo(){
	try {
	    String loginUserId = "";
	    String ret = "fail";
	    SessionMember sessionMember = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
	    if (sessionMember == null) {
		ret = "fail";
		request.put("strLngdv", "ko-KR");
		return NONE;
	    } else {
		loginUserId = sessionMember.getOpenid();
		strLngdv = sessionMember.getLang();
		request.put("strLngdv", strLngdv);
	    }
	    try {
		Map<String, Object> map = new HashMap<>();
		map.put("JOP_TYPE", "K");
		map.put("LOGIN_USER", loginUserId);
		map.put("CLB_SQ", intClbsq);
		map.put("MBR_SQ", intMbrsq);
		map.put("CLB_NIK_NM", strClbniknm);
		map.put("CLB_GD", strClbgd);
		Map<String, Object> mapResult = commonService.select("Bbc.sqlAMS_CLB_MBR_INSERT", map);
		String msgOut = (String) mapResult.get("MSG_OUT");
		if (msgOut.equals("S")) {
		    ret = "success";
		}
	    } catch (Exception e) {
		e.printStackTrace();
		ret = "fail";
	    }
	    Map<String, Object> returnMap = new HashMap<>();
	    returnMap.put("ret", ret);
	    renderJSON(returnMap);
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return NONE;
    }

    // ---------------------------------------------------------------
    // getPage
    // ---------------------------------------------------------------
    public String getPage(){
	try {
	    int loginMbrSq = 0;
	    SessionMember sessionMember = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
	    if (sessionMember == null) {
		strLngdv = "ko-KR";
		request.put("strLngdv", strLngdv);
		Map<String, Object> userInfo = new HashMap<>();
		userInfo.put("MBR_SQ", 0);
		userInfo.put("MBR_ID", 0);
		userInfo.put("MBR_NM", "손님");
		userInfo.put("BTH_YMD", "");
		userInfo.put("GND_DV", "");
		userInfo.put("MBR_ST", "");
		userInfo.put("LNK_ACT_DV", "");
		userInfo.put("LNK_ACT_ID", "");
		userInfo.put("MBL_NO", "");
		userInfo.put("EML_ADR", "");
		userInfo.put("JIN_DT", "");
		userInfo.put("REG_DT", "");
		userInfo.put("LST_MOD_DT", "");
		userInfo.put("MBR_PW", "");
		userInfo.put("MBR_MAI_IMG_PTH", "/front/bbc/img/mine1.png");
		userInfo.put("MBR_MAI_IMG_FNM", "/front/bbc/img/mine1.png");
		userInfo.put("MBR_BAK_IMG_PTH", "/front/bbc/img/mine1.png");
		userInfo.put("MBR_BAK_IMG_FNM", "/front/bbc/img/mine1.png");
		userInfo.put("MBR_GRT_TXT", "");
		userInfo.put("WX_NICK", "");
		userInfo.put("MATCH_USER_YN", "N");
		userInfo.put("B_LVL", "");
		userInfo.put("AGE", "");
		userInfo.put("DSC", "");
		userInfo.put("MATCH_JIN_DT", "");
		userInfo.put("CLB", "");
		userInfo.put("AUTH", "");
		userInfo.put("MCH_NM", "");
		request.put("userInfo", userInfo);
	    } else {
		strLngdv = sessionMember.getLang();
		request.put("strLngdv", strLngdv);
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("P1", "BADMATCH_SELECT_USER");
		searchMap.put("P2", loginMbrSq);
		searchMap.put("P3", para3);
		Map<String, Object> userInfo = commonService.select("Bbc.sqlAMS_BADMATCH_PROCEDURE", searchMap);
		request.put("userInfo", userInfo);
	    }
	    if ("sign".equals(pageName)) {
		String ret;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try {
		    String accessToken = kakaoService.getAccessToken(code, "userAddRequest");
		    logger.info(code);
		    Map<String, Object> userInfo = kakaoService.getUserInfo(accessToken);
		    logger.info(userInfo);
		    String email = userInfo.get("email").toString();
		    String thumbnail_image = userInfo.get("thumbnail_image").toString();
		    Map<String, Object> map = new HashMap<String, Object>();
		    map.put("JOP_TYPE", "KAKAO");
		    map.put("MBR_ID", email);
		    map.put("MBR_MAI_IMG_PTH", thumbnail_image);
		    Map<String, Object> mapResult = commonService.select("Bbc.sqlAMS_MBR_INSERT", map);
		    String msgOut = (String) mapResult.get("MSG_OUT");
		    String strLnkactid = (String) mapResult.get("LNK_ACT_ID");
		    if (msgOut.equals("S")) {
			sessionMember = getSessionMember();
			sessionMember = bbcService.getSessionMemberById(strLnkactid);
			sessionMember.setUserType("WEB");
			session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
			ret = "success";
		    } else {
			ret = "addUserInfo";
		    }
		    request.put("strPtourl", strPtourl);
		    request.put("thumbnail_image", thumbnail_image);
		    request.put("email", email);
		    request.put("ret", ret);
		} catch (Exception e) {
		    e.printStackTrace();
		    ret = "fail";
		    request.put("strPtourl", strPtourl);
		    request.put("ret", ret);
		    return "userAddRequest";
		}
	    }
	    request.put("loginMbrSq", loginMbrSq);
	    request.put("para1", para1);
	    request.put("para2", para2);
	    request.put("para3", para3);
	    request.put("para4", para4);
	    request.put("para5", para5);
	    request.put("para6", para6);
	    request.put("para7", para7);
	    request.put("para8", para8);
	    request.put("para9", para9);
	    request.put("para10", para10);
	    request.put("para11", para11);
	    request.put("para12", para12);
	    request.put("para13", para13);
	    request.put("para14", para14);
	    request.put("para15", para15);
	    request.put("para16", para16);
	    request.put("para17", para17);
	    request.put("para18", para18);
	    request.put("para19", para19);
	    request.put("para20", para20);
	} catch (Exception e) {
	    // Error Page
	    String errorMessageBbc = e.getMessage();
	    request.put("errorMessageBbc", errorMessageBbc);
	    return "noAuth";
	}
	this.pagePath = "/front/bbcNew/" + pageName + ".jsp";
	return "getPage";
    }

    // ---------------------------------------------------------------
    // getData
    // ---------------------------------------------------------------
    public String getData(){
	String ret = "fail";
	SessionMember sessionMember = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
	if (sessionMember == null) {
	    strLngdv = "ko-KR";
	    request.put("strLngdv", strLngdv);
	} else {
	    strLngdv = sessionMember.getLang();
	    request.put("strLngdv", strLngdv);
	}
	try {
	    Map<String, Object> searchMap = new HashMap<>();
	    searchMap.put("P1", para1);
	    searchMap.put("P2", para2);
	    searchMap.put("P3", para3);
	    searchMap.put("P4", para4);
	    searchMap.put("P5", para5);
	    searchMap.put("P6", para6);
	    searchMap.put("P7", para7);
	    searchMap.put("P8", para8);
	    searchMap.put("P9", para9);
	    searchMap.put("P10", para10);
	    searchMap.put("P11", para11);
	    searchMap.put("P12", para12);
	    searchMap.put("P13", para13);
	    searchMap.put("P14", para14);
	    searchMap.put("P15", para15);
	    searchMap.put("P16", para16);
	    searchMap.put("P17", para17);
	    searchMap.put("P18", para18);
	    searchMap.put("P19", para19);
	    searchMap.put("P20", para20);
	    List<Map<String, Object>> pageData = commonService.selectList("Bbc.sqlAMS_GET_INFO", searchMap);
	    renderJSON(pageData);
	} catch (Exception e) {
	    e.printStackTrace();
	    ret = "fail";
	    Map<String, Object> returnMap = new HashMap<>();
	    returnMap.put("ret", ret);
	    renderJSON(returnMap);
	}
	return NONE;
    }
}
