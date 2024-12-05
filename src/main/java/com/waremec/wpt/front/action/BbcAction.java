package com.waremec.wpt.front.action;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.baidu.translate.TransApi;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.ListUtil;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.framework.utilities.UploadResult;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.template.DataItem;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.service.KakaoService;
import com.waremec.weixin.utils.EncryptUtils;
import com.waremec.wpt.front.domain.BbcAtrClbBbd;
import com.waremec.wpt.front.domain.SessionSkin;
import com.waremec.wpt.front.service.BbcService;
import com.waremec.wpt.front.thread.SendMsgThread;

import com.waremec.framework.utilities.LabelUtil;

@Controller("bbcAction")
@Scope(ScopeType.prototype)
public class BbcAction extends WeixinBaseAction {
	private static final long serialVersionUID = 1L;
	
	private String shopId;
	private String pageId;
	private int pageCurr;
	private int pageUnit;
	private int shopGradeClassId;
	private int brandId;
	private int totalCount;
	private int pageTotalCount;
	
	private String strJobtype;
	
	private int intAllclbrnk;	  // [회원별랭킹집계] 전체누적클럽랭크
	private int intAllloscnt;	  // [회원별랭킹집계] 전체누적패배횟수
	private int intAllrcvbbc;	  // [회원별랭킹집계] 전체누적회득BB코인
	private int intAllwincnt;	  // [회원별랭킹집계] 전체누적승리횟수
	private int intAmt;	  // [클럽비용출금] 금액
	private int intAtemscr;	  // [경기] A팀점수
	private int intAttdetno;	  // [공통첨부내용] 첨부순번
	private int intAttsq;	  // [클럽게시판] [첨부시퀀스]
	private int intAwyclbsq;	  // [운동] 클럽시퀀스
	private int intBtemscr;	  // [경기] B팀점수
	private int intBysetscr;	  // [경기] 세트별점수
	private int intCalhndcap;	  // [경기선수] 계산된핸디캡
	private String intClbbbc;	  // [클럽회원] 현재BB코인
	private int intClbbbdsq;	  // [클럽게시판댓글] 클럽게시판시퀀스
	private int intClbcstiosq;	  // [클럽비용출금] 클럽비용입출금시퀀스
	private int intClbjinreqsq;	  // [클럽가입신청] 가입신청시퀀스
	private int intClbrnk;	  // [회원별랭킹집계] 기준일클럽랭크
	private int intClbsq;	  // [클럽회칙] 클럽시퀀스
	private int intCorcnt;	  // [경기장] 코트수
	private int intCttmbrsq;	  // [클럽] 쪽지수신클럽회원시퀀스
	private int intExcsq;	  // [운동참석자] 운동시퀀스
	private int intHmeclbsq;	  // [운동] 클럽시퀀스
	private String intJinclbbbc;	  // [클럽회원] 최초부여BB코인
	private int intJinreqmbrsq;	  // [클럽가입신청] 회원시퀀스
	private int intLoscnt;	  // [회원별랭킹집계] 기준일패배횟수
	private int intLstclbjinreqsq;	  // [클럽회원] 가입신청시퀀스
	private int intLstmodmbrsq;	  // [클럽회원] 최종변경자회원시퀀스
	private int intMaxmbrcnt;	  // [클럽] 최대회원수
	private int intMbrsq;	  // [회원별랭킹집계] 회원시퀀스
	private int intMnulv;	  // [메뉴마스터] 메뉴레벨[1/2]
	private int intMtcclbbbc;	  // [경기선수] 경기결과입력시점BB코인
	private int intMtcsetcnt;	  // [경기] 경기세트수
	private int intMtcsq;	  // [이벤트베팅] 경기시퀀스
	private int intNtesq;	  // [쪽지수신자] 쪽지시퀀스
	private int intPtoattsq;	  // [경기이벤트] [첨부시퀀스]관련사진
	private int intRcmcnt;	  // [클럽게시판] 추천수
	private int intRcvbbc;	  // [회원별랭킹집계] 기준일획득BB코인
	private int intRcvmbrsq;	  // [쪽지수신자] 회원시퀀스
	private int intRegmbrsq;	  // [클럽회칙] 등록회원시퀀스
	private int intRepno;	  // [클럽게시판댓글] 댓글순번
	private int intRgnlv;	  // [지역] 지역레벨[1,2,3]
	private int intRgnsq;	  // [지역] 지역시퀀스
	private int intRuldetno;	  // [클럽회칙] 회칙상세순번
	private int intScr;	  // [경기선수] 점수[반정규화]
	private int intSndmbrsq;	  // [쪽지] 회원시퀀스
	private int intSrtod;	  // [클럽회칙] 정렬순서
	private int intStdsq;	  // [클럽] 경기장시퀀스
	private int intTemplrno;	  // [경기선수] 선수팀내순번[1,2]
	private int intUprepno;	  // [클럽게시판댓글] 상위댓글순번
	private int intUprgnid;	  // [지역] 상위지역시퀀스
	private int intWincnt;	  // [회원별랭킹집계] 기준일승리횟수
	private int intYyclbrnk;	  // [회원별랭킹집계] 기준년클럽랭크
	private int intYyloscnt;	  // [회원별랭킹집계] 기준년누적패배횟수
	private int intYyrcvbbc;	  // [회원별랭킹집계] 기준년획득BB코인
	private int intYywincnt;	  // [회원별랭킹집계] 기준년누적승리횟수
	private int intAtdcnt;		// [운동] 참석자 인원수
	private String datClbjindt;	  // [클럽회원] 가입일시
	private String datEvtfrdt;	  // [경기이벤트] 이벤트시작일시
	private String datEvttodt;	  // [경기이벤트] 이벤트종료일시
	private String datExcfrdt;	  // [운동] 운동시작일시
	private String datExctofr;	  // [운동] 운동종료일시
	private String datJinapvdt;	  // [클럽가입신청] 가입승인일시
	private String datJincnldt;	  // [클럽가입신청] 가입취소일시[신청자만취소가능]
	private String datJindt;	  // [회원] 가입일시
	private String datJinrtndt;	  // [클럽가입신청] 가입반려일시
	private String datLstmoddt;	  // [회원별랭킹집계] 최종변경일시
	private String datMtcfrdt;	  // [경기] 경기시작시간
	private String datMtctodt;	  // [경기] 경기종료시간[승패입력시자동]
	private String datRegdt;	  // [회원별랭킹집계] 등록일시
	private String datReqdt;	  // [클럽가입신청] 클럽가입신청일시
	private String strAttcolnm;	  // [공통첨부마스터] 공통첨부사용컬럼[반정규]
	private String strAttfnm;	  // [공통첨부내용] 첨부파일명
	private String strAttpht;	  // [공통첨부내용] 첨부경로
	private String strAtttabnm;	  // [공통첨부마스터] 공통첨부사용테이블[반정규]
	private String strAtttp;	  // [공통첨부마스터] 공통첨부유형[이미지/파일]
	private String strBasymd;	  // [회원별랭킹집계] 기준일자
	private String strBlgexcyn;	  // [경기] 운동종속경기여부[운동종속이면 운동의 값 상속]
	private String strBthymd;	  // [회원] 생년월일
	private String strChecte;	  // [이벤트베팅] 응원내용
	private String strChetemdv;	  // [이벤트베팅] 응원팀구분
	private String strClbbakimgfnm;	  // [클럽] 클럽배경이미지파일명
	private String strClbbakimgpth;	  // [클럽] 클럽배경이미지경로
	private String strClbbbdcte;	  // [클럽게시판] 게시판내용
	private String strClbbbdst;	  // [클럽게시판] 게시판상태[사용/삭제]
	private String strClbbbdtit;	  // [클럽게시판] 게시판제목
	private String strClbbbdtp;	  // [클럽게시판] 게시판유형[공지/월례회/일반]
	private String strClbcstcd;	  // [클럽비용출금] 클럽비용코드
	private String strClbcstiost;	  // [클럽비용출금] 입출금처리상태[입금대기/출금대기]
	private String strClbgd;	  // [클럽회원] 클럽회원등급[주인장/부주인/일반등/]
	private String strClbitd;	  // [클럽] 클럽소개
	private String strClbjinreqst;	  // [클럽가입신청] 클러가입신청상태[신청/취소/승인]
	private String strClbjinst;	  // [클럽회원] 클럽가입상태[가입/탈퇴]
	private String strClbmaiimgfnm;	  // [클럽] 클럽메인이미지파일명
	private String strClbmaiimgpth;	  // [클럽] 클럽메인이미지경로
	private String strClbniknm;	  // [클럽회원] 클럼내닉네임
	private String strClbnm;	  // [클럽] 클럽명
	private String strClbst;	  // [클럽] 클럽상태[운영/클로즈]
	private String strComcd;	  // [공통코드내용] 공통코드
	private String strComcddv;	  // [공통코드마스터] 공통코드구분
	private String strComcddvdct;	  // [공통코드마스터] 공통코드설명
	private String strComcddvnm;	  // [공통코드마스터] 공통코드구분명
	private String strComcdnm;	  // [공통코드내용] 공통코드명
	private String strCstiodv;	  // [클럽비용출금] 입출금구분
	private String strCstioymd;	  // [클럽비용출금] 입출금일자
	private String strCttemladr;	  // [클럽] 담당자E-Mail
	private String strCttnm;	  // [클럽] 담당자이름
	private String strCttphnno;	  // [클럽] 담당자전화
	private String strDetadr;	  // [경기장] 상세주소
	private String strEmladr;	  // [회원] E-Mail주소
	private String strEvtcte;	  // [경기이벤트] 이벤트내용
	private String strEvthityn;	  // [이벤트베팅] 이벤트적중여부
	private String strEvtregyn;	  // [경기] 이벤트등록여부
	private String strEvtst;	  // [경기이벤트] 이벤트상태[진행중/완료/진행전]
	private String strExcatdtp;	  // [운동] 운동참석자유형[클럽/외부만/클럽+외부]
	private String strExcdct;	  // [운동] 운동내용
	private String strExcjincmt;	  // [운동참석자] 참석자코멘트
	private String strExctit;	  // [운동] 운동제목
	private String strExctmedct;	  // [클럽] 운동시간설명
	private String strExctp;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strGnddv;	  // [회원] 성별구분
	private String strGpslat;	  // [경기장] GPS위도
	private String strGpslot;	  // [경기장] GPS경도
	private String strJinapvmmo;	  // [클럽가입신청] 가입승인메모
	private String strJincnlmmo;	  // [클럽가입신청] 가입취소사유[신청자만입력]
	private String strJingrttxt;	  // [클럽가입신청] 가입인사말
	private String strJinrtnmmo;	  // [클럽가입신청] 가입반려메모
	private String strLngdv;	  // [메뉴명] 언어구분
	private String strLnkactdv;	  // [회원] 연결계정구분
	private String strLnkactid;	  // [회원] 연결계정ID
	private String strMblno;	  // [회원] 휴대폰번호
	private String strMbrbakimgfnm;	  // [회원] 회원배경이미지파일명
	private String strMbrbakimgpth;	  // [회원] 회원배경이미지경로
	private String strMbrgrttxt;	  // [회원] 회원인사말
	private String strMbrid;	  // [회원] 회원ID
	private String strMbrmaiimgfnm;	  // [회원] 회원메인이미지파일명
	private String strMbrmaiimgpth;	  // [회원] 회원메인이미지경로
	private String strMbrnm;	  // [회원] 이름
	private String strMbrpw;	  // [회원] 회원비밀번호
	private String strMbrst;	  // [회원] 회원상태
	private String strMmo;	  // [클럽비용출금] 메모
	private String strMnuid;	  // [메뉴접근가능클럽회원등급] 메뉴ID
	private String strMnunm;	  // [메뉴명] 메뉴명
	private String strMsgdct;	  // [공통메시지마스터] 메시지설명
	private String strMsgid;	  // [공통메시지마스터] 메시지ID
	private String strMsgtp;	  // [공통메시지마스터] 메시지유형[메시지/에러/레이블]
	private String strMsgtxt;	  // [공통메시지내용] 메시지텍스트
	private String strMtctemdv;	  // [경기선수] 팀구분[A,B]
	private String strMtctp;	  // [경기] 경기유형[남단식/남복식/혼복식등]
	private String strNatcd;	  // [회원] 국가코드
	private String strNtectt;	  // [쪽지] 쪽지내용
	private String strNtercvst;	  // [쪽지수신자] 쪽지수신상태[대기/수신/삭제]
	private String strNtesndst;	  // [쪽지] 쪽지발신상태[발신/삭제]
	private String strPubclbyn;	  // [클럽] 공개클럽여부
	private String strRepcte;	  // [클럽게시판댓글] 댓글내용
	private String strRgndv;	  // [지역] 지역구분[국가/성/시/현]
	private String strRgnnm;	  // [지역] 지역명
	private String strRuldct;	  // [클럽회칙] 회칙내용
	private String strRultit;	  // [클럽회칙] 회칙제목
	private String strStdnm;	  // [경기장] 경기장명
	private String strUpmnuid;	  // [메뉴마스터] 상위메뉴ID
	private String strUseyn;	  // [클럽회칙] 사용여부
	private String strVtctemdv;	  // [경기] 승리팀구분
	private String strVtrdv;	  // [경기선수] 승패구분[반정규화]
	private String strZipcd;	  // [지역] 도시우편번호	
	private int intMbrcnt;	  		// [클럽] 회원수
	private String strCorcnt;		// [클럽] 코트수
	private String strAtdadr;		// [클럽] 경기장주소
	private String strAtdadrcd;		// [클럽] 경기장주소코드
	private String strAtdadrdtl;	// [클럽] 경기장상세주소
	private String strBmtgd;	  	// [클럽가입신청] 배드민턴 조(A,B,C,D)
	private String strAgeyy;	  	// [클럽가입신청] 연령(10대,20대...)
	private int intMbrsqa1;			// [경기선수] 선수 A1
	private String intMtcclbbbca1;		// [경기선수] 경기시코인 A1
	private int intMbrsqa2;			// [경기선수] 선수 A2
	private String intMtcclbbbca2;		// [경기선수] 경기시코인 A2
	private int intMbrsqb1;			// [경기선수] 선수 B1
	private String intMtcclbbbcb1;		// [경기선수] 경기시코인 B1
	private int intMbrsqb2;			// [경기선수] 선수 B2
	private String intMtcclbbbcb2;		// [경기선수] 경기시코인 B2
	private String datFrdt;			// 조회 시작 일자
	private String datTodt;			// 조회 끝 일자
	private String strOrderby;
	private int magazineGroupId;
	private String orderby;
	private String returnPageName;
	private String strMbrnma1;
	private String strMbrnma2;
	private String strMbrnmb1;
	private String strMbrnmb2;
	private String strYwday;
	private String strExcTit1;
	private String strExcTit2;
	private String strExcTit3;
	private String strExcTit4;
	private String strExcTit5;
	private String strExcTit6;
	private String strExcTit7;
	private String strExcFrtme1;
	private String strExcFrtme2;
	private String strExcFrtme3;
	private String strExcFrtme4;
	private String strExcFrtme5;
	private String strExcFrtme6;
	private String strExcFrtme7;
	private String strExcTotme1;
	private String strExcTotme2;
	private String strExcTotme3;
	private String strExcTotme4;
	private String strExcTotme5;
	private String strExcTotme6;
	private String strExcTotme7;
	private int intExcjintp;
	private int intExcjindly;
	private String strPtourl;
	private String strHmenm;
	private String strAwynm;
	private String pageName;
	private String dataType;

	private int intCortcnt;
	private int intPartnerbasiccoin;
	private int intTeambasiccoin;
	private int intMbrmingamecnt;
	private String strMbrsqstr;
	private String strMbrgroupstr;
	private String strExcjindlystr;

	private int intCarmbrsq;
	private String strCaryn;

	private String strExcdct1;	  // [운동] 운동내용
	private String strExcdct2;	  // [운동] 운동내용
	private String strExcdct3;	  // [운동] 운동내용
	private String strExcdct4;	  // [운동] 운동내용
	private String strExcdct5;	  // [운동] 운동내용
	private String strExcdct6;	  // [운동] 운동내용
	private String strExcdct7;	  // [운동] 운동내용	

	private String strExctp1;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strExctp2;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strExctp3;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strExctp4;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strExctp5;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strExctp6;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	private String strExctp7;	  // [운동] 운동유형[클럽정기/번개/클럽대항전]
	
	private int intMsgsq;

	private static final String DEFAUT_COLOR = "#173177";
	private static final String RED_COLOR = "#df1414";
	private static final String BLUE_COLOR = "#2714df";

	private String para1;
	private String para2;
	private String para3;
	private String para4;
	private String para5;
	private String para6;
	private String para7;
	private String para8;
	private String para9;
	
	private String code;
	private String error;
	private String error_description;
	private String state;
	
	private File imageFile = null;
	
	@Resource
	protected BbcService bbcService;
	
	@Resource
	protected KakaoService kakaoService;
	
	//---------------------------------------------------------------
	// [회원-mbr] Member
	//---------------------------------------------------------------
	public String mbr(){
		
		try{
			String returnPage = "mbr";
		}
		catch(Exception e){
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}

		return "mbr";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club
	//---------------------------------------------------------------
	public String clb(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbList = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);

			request.put("amsClbList", amsClbList);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbListMy = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);
			
			request.put("amsClbListMy", amsClbListMy);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "B");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbListMatch = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);
			
			request.put("amsClbListMatch", amsClbListMatch);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}

		return "clb";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club One
	//---------------------------------------------------------------
	public String clbOne(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbList = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);

			request.put("amsClbList", amsClbList);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbListMy = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);
			
			request.put("amsClbListMy", amsClbListMy);

			int listSize = amsClbListMy.size();
			
			if (listSize == 1) {
				String clbSq = amsClbListMy.get(0).get("CLB_SQ") + "";
				getResponse().sendRedirect("/front/bbc/clb/clbDetMy.htm?intClbsq="+clbSq);
				return "NONE";
			}
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}

		return "clbOne";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 검색
	//---------------------------------------------------------------
	public String clbSearch() throws Exception{
		
		try{
			//--------- Main Logic

			String loginUserId = "";

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "F");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_ST", "OPEN");
			if (strAtdadr!=null) {
				strAtdadr=new String(strAtdadr.getBytes("ISO-8859-1"),"UTF-8");
				searchMap.put("ATD_ADR",strAtdadr);
			}
			if (strAtdadr==""){
				strAtdadr = null;
			}
			if (strClbnm!=null) {
				strClbnm=new String(strClbnm.getBytes("ISO-8859-1"),"UTF-8");
				searchMap.put("CLB_NM", strClbnm);
			}
			List<Map<String, Object>> amsClbList = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);
			
			request.put("strClbnm", strClbnm);
			request.put("strAtdadr", strAtdadr);
			request.put("amsClbList", amsClbList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbSearch";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 상세조회
	//---------------------------------------------------------------
	public String clbDet(){

		try{

			String loginUserId = "";

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
//			searchMap.put("CLB_ST", "OPEN");
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			request.put("amsClb", amsClb);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbDet";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 수정조회
	//---------------------------------------------------------------
	public String clbView(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
//			searchMap.put("CLB_ST", "OPEN");
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			request.put("amsClb", amsClb);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbView";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 회원 가입신청
	//---------------------------------------------------------------
	public String clbJinSave(){
		
		String loginUserId = "";
		String ret="fail";

		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			loginUserId = "";
			request.put("strLngdv", "ko-KR");
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","I");
			map.put("LOGIN_USER",loginUserId);

			map.put("JIN_REQ_MBR_SQ",sessionMember.getCustSysId());
			map.put("CLB_SQ",intClbsq);
			map.put("CLB_NIK_NM",strClbniknm);
			map.put("JIN_GRT_TXT",strJingrttxt);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			map.put("AGE_YY",strAgeyy);
			map.put("GND_DV",strGnddv);
			map.put("BMT_GD",strBmtgd);
			map.put("BMTYEAR",strYwday);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_CLB_JIN_REQ_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			String openId = (String) mapResult.get("OPENID");
			if(msgOut.equals("S")){
				ret="success";
			}
			
			try{

				String first = "经历(小组A,B,C,D,E) : " + strBmtgd;
				String keyword1 = strClbniknm;
				String strClbsq = String.valueOf(intClbsq);
				String keyword2 = "/front/bbc/clb/clbMbrList.htm?intClbsq="+strClbsq;
				String remark  = strJingrttxt;
				
		    	AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());

				try {
			    	weixinTemplateMessageService.sendNewUserMsg(appInfo,openId, first, keyword1, keyword2, remark);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}catch (Error e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
			}catch(Exception e){
				logger.info("##### Exception==>" +  e.getMessage());
			}
						
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] 나의 Club 상세조회
	//---------------------------------------------------------------
	public String clbDetMy(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			String currLanguage = LabelUtil.getCurrentLanguage();

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			request.put("amsClb", amsClb);
			request.put("loginMbrSq", loginMbrSq);
			request.put("intClbsq", intClbsq);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbDetMy";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 생성
	//---------------------------------------------------------------
	public String clbReg(){

		return "clbReg";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 생성 저장
	//---------------------------------------------------------------
	public String clbRegSave(){

		String loginUserId = "";
		String ret="fail";

		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			loginUserId = "";
			request.put("strLngdv", "ko-KR");
			ret="fail";
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();

			if (imageFile != null) {
				UploadResult result = UploadFileUtil.upload(getRequest(), imageFile, strClbbakimgfnm, UploadFileUtil.UPLOAD_LOGO);
				strClbmaiimgpth = result.getFileUrl();
				strClbmaiimgfnm = result.getFileUrl();
			}
			
	 		map.put("JOP_TYPE","I");
			map.put("LOGIN_USER",loginUserId);

			map.put("CLB_NM",strClbnm);
			map.put("CLB_ITD",strClbitd);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("PUB_CLB_YN",strPubclbyn);
			map.put("EXC_TME_DCT",strExctmedct);
			map.put("CLB_ST","OPEN");
			map.put("CLB_GD",strClbgd);
			map.put("CLB_MAI_IMG_PTH",strClbmaiimgpth);
			map.put("CLB_MAI_IMG_FNM",strClbmaiimgfnm);
			map.put("MAX_MBR_CNT",intMbrcnt);
			map.put("CTT_NM",strCttnm);
			map.put("CTT_PHN_NO",strCttphnno);
			map.put("MBR_CNT",intMbrcnt);
			map.put("COR_CNT",strCorcnt);
			map.put("ATD_ADR",strAtdadr);
			map.put("ATD_ADR_CD",strAtdadrcd);
			map.put("ATD_ADR_DTL",strAtdadrdtl);				

			map.put("CLB_NIK_NM",strClbniknm);
			map.put("AGE_YY",strAgeyy);
			map.put("GND_DV",strGnddv);
			map.put("BMT_GD",strBmtgd);
			map.put("CLB_GD",strClbgd);
			map.put("BMTYEAR",strYwday);
			
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 생성 저장
	//---------------------------------------------------------------
	public String clbUpdate(){
		
		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
			if ("CLSE".equals(strClbst)) {
		 		map.put("JOP_TYPE","D");
				map.put("CLB_ST","CLSE");
			}
			else {
		 		map.put("JOP_TYPE","U");
				map.put("CLB_ST","OPEN");
			}

			if (imageFile != null) {
				UploadResult result = UploadFileUtil.upload(getRequest(), imageFile, strClbbakimgfnm, UploadFileUtil.UPLOAD_LOGO);
				strClbmaiimgpth = result.getFileUrl();
				strClbmaiimgfnm = result.getFileUrl();
			}
			
			map.put("CLB_SQ",intClbsq);
			map.put("LOGIN_USER",loginUserId);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("CLB_GD","A");
			
			map.put("CLB_NM",strClbnm);
			map.put("CLB_ITD",strClbitd);
			map.put("PUB_CLB_YN",strPubclbyn);
			map.put("EXC_TME_DCT",strExctmedct);
			map.put("CLB_MAI_IMG_PTH",strClbmaiimgpth);
			map.put("CLB_MAI_IMG_FNM",strClbmaiimgfnm);

			map.put("MAX_MBR_CNT",intMbrcnt);
			map.put("CTT_NM",strCttnm);
			map.put("CTT_PHN_NO",strCttphnno);
			map.put("COR_CNT",strCorcnt);
			map.put("ATD_ADR",strAtdadr);
			map.put("ATD_ADR_CD",strAtdadrcd);
			map.put("ATD_ADR_DTL",strAtdadrdtl);
			map.put("CLB_GD",strClbgd);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 회원관리
	//---------------------------------------------------------------
	public String clbMbrList(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			request.put("amsClb", amsClb);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_REQ_ST", "REQ");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrClbJinReq = commonService.selectList("Bbc.sqlATR_CLB_JIN_REQ_SELECT",searchMap);
			request.put("atrClbJinReq", atrClbJinReq);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbr", amsClbMbr);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "EXI");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbrExi = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbrExi", amsClbMbrExi);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "BTH");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbrBth = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbrBth", amsClbMbrBth);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbMbrList";
	}

	

	//---------------------------------------------------------------
	// [회원승인] 회원관리
	//---------------------------------------------------------------
	public String mbrReqList(){
		
		try{
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;


			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","S");
			map.put("PASS","Y");
			
			List<Map<String, Object>> mbrReqListY=commonService.selectList("Bbc.sqlUSER_ADD_INSERT", map);
			request.put("mbrReqListY", mbrReqListY);
			
			map.clear();
	 		map.put("JOP_TYPE","S");
			map.put("PASS","N");
			
			List<Map<String, Object>> mbrReqListN=commonService.selectList("Bbc.sqlUSER_ADD_INSERT", map);
			request.put("mbrReqListN", mbrReqListN);


			map.clear();
			map.put("JOP_TYPE", "M");
			map.put("LOGIN_USER", loginUserId);
			map.put("CLB_SQ", intClbsq);
			map.put("CLB_JIN_ST", "JIN");
			map.put("LANG", currLanguage);
			List<Map<String, Object>> amsMbrList = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",map);
			request.put("amsMbrList", amsMbrList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "mbrReqList";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club autoLogin
	//---------------------------------------------------------------
	public String autoLogin(){
		
		try{
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();

			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbr", amsClbMbr);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "autoLogin";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 회원 상세 정보
	//---------------------------------------------------------------
	public String clbMbrInfo(){
		
		try{
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);


			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClbMbr = commonService.select("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbr", amsClbMbr);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbMbrInfo";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 나의 정보
	//---------------------------------------------------------------
	public String clbMyInfo(){
		
		try{
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);


			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClbMbr = commonService.select("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbr", amsClbMbr);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "clbMyInfo";
	}



	//---------------------------------------------------------------
	// [회원-mbr] 회원카드
	//---------------------------------------------------------------
	public String clbMbrCard(){
		
		try{
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;


			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			String strMbrnickname = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = intMbrsq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					strMbrnickname = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("strMbrnickname", strMbrnickname);
			request.put("kewordData", kewordData);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "C");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("MBL_NO", intClbsq);
			searchMap.put("NAT_CD", currLanguage);
			Map<String, Object> amsMbr = commonService.select("Bbc.sqlAMS_MBR_SELECT",searchMap);
			
			request.put("amsMbr", amsMbr);		

			//정기 운동 게임횟수
			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			List<Map<String, Object>> atrMtcMbrEXC = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT_EX",searchMap);
			request.put("atrMtcMbrEXC", atrMtcMbrEXC);

			//베파 BB Coin
			searchMap.clear();
			searchMap.put("JOP_TYPE", "B");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			List<Map<String, Object>> atrMtcMbrB = commonService.selectList("Bbc.sqlATR_MTC_SELECT_CARD",searchMap);
			request.put("atrMtcMbrB", atrMtcMbrB);	
			
			//베파 승률
			searchMap.clear();
			searchMap.put("JOP_TYPE", "W");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			List<Map<String, Object>> atrMtcMbrW = commonService.selectList("Bbc.sqlATR_MTC_SELECT_CARD",searchMap);
			request.put("atrMtcMbrW", atrMtcMbrW);	

			//게임수 우리편
			searchMap.clear();
			searchMap.put("JOP_TYPE", "G");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			List<Map<String, Object>> atrMtcMbrG = commonService.selectList("Bbc.sqlATR_MTC_SELECT_CARD",searchMap);
			request.put("atrMtcMbrG", atrMtcMbrG);	
			
			//천적
			searchMap.clear();
			searchMap.put("JOP_TYPE", "K");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			List<Map<String, Object>> atrMtcMbrK = commonService.selectList("Bbc.sqlATR_MTC_SELECT_CARD",searchMap);
			request.put("atrMtcMbrK", atrMtcMbrK);	
			
			//밥
			searchMap.clear();
			searchMap.put("JOP_TYPE", "J");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			List<Map<String, Object>> atrMtcMbrJ = commonService.selectList("Bbc.sqlATR_MTC_SELECT_CARD",searchMap);
			request.put("atrMtcMbrJ", atrMtcMbrJ);	

		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbMbrCard";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 화면
	//---------------------------------------------------------------
	public String gameReg(){
		
		try{
			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				String errorMessageBbc = "No Authorization.";
				request.put("errorMessageBbc", errorMessageBbc);
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			loginMbrSq = sessionMember.getCustSysId();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					loginNickName = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
					loginBbc = amsClbMbr.get(i).get("CLB_BBC") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("kewordData", kewordData);
			if (intAtemscr==0) {
				request.put("intAtemscr", "");
			}
			else {
				request.put("intAtemscr", intAtemscr);
			}
			if (intBtemscr==0) {
				request.put("intBtemscr", "");
			}
			else {
				request.put("intBtemscr", intBtemscr);
			}
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameReg";
	}
	

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 등록 화면 gameRegWithScoreBoard
	//---------------------------------------------------------------
	public String gameRegWithScoreBoard(){

		try{
			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				String errorMessageBbc = "No Authorization.";
				request.put("errorMessageBbc", errorMessageBbc);
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			loginMbrSq = sessionMember.getCustSysId();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					loginNickName = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
					loginBbc = amsClbMbr.get(i).get("CLB_BBC") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("kewordData", kewordData);
			request.put("intMtcsetcnt", intMtcsetcnt);  // GAME 시퀀스
			
			if (intAtemscr==0) {
				request.put("intAtemscr", "");
			}
			else {
				request.put("intAtemscr", intAtemscr);
			}
			if (intBtemscr==0) {
				request.put("intBtemscr", "");
			}
			else {
				request.put("intBtemscr", intBtemscr);
			}
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameRegWithScoreBoard";
	}
	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 등록 화면 gameRegWithScoreBoard
	//---------------------------------------------------------------
	public String gameRegWithScoreBoard2(){

		try{
			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				String errorMessageBbc = "No Authorization.";
				request.put("errorMessageBbc", errorMessageBbc);
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			loginMbrSq = sessionMember.getCustSysId();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					loginNickName = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
					loginBbc = amsClbMbr.get(i).get("CLB_BBC") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("kewordData", kewordData);
			request.put("intMtcsetcnt", intMtcsetcnt);  // GAME 시퀀스
			
			if (intAtemscr==0) {
				request.put("intAtemscr", "");
			}
			else {
				request.put("intAtemscr", intAtemscr);
			}
			if (intBtemscr==0) {
				request.put("intBtemscr", "");
			}
			else {
				request.put("intBtemscr", intBtemscr);
			}
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameRegWithScoreBoard2";
	}

	
	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 화면
	//---------------------------------------------------------------
	public String gameRegSingle(){
		
		try{
			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				String errorMessageBbc = "No Authorization.";
				request.put("errorMessageBbc", errorMessageBbc);
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			loginMbrSq = sessionMember.getCustSysId();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					loginNickName = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
					loginBbc = amsClbMbr.get(i).get("CLB_BBC") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("kewordData", kewordData);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameRegSingle";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 화면
	//---------------------------------------------------------------
	public String gameView(){
		
		try{
			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			loginMbrSq = sessionMember.getCustSysId();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					loginNickName = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
					loginBbc = amsClbMbr.get(i).get("CLB_BBC") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";


			searchMap.clear();
			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("HME_CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", loginMbrSq);
			searchMap.put("MTC_SQ", intMtcsq);
				
			Map<String,Object> atrMtc=commonService.select("Bbc.sqlATR_MTC_SELECT", searchMap);

			request.put("atrMtc", atrMtc);
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("kewordData", kewordData);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameView";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 조회 화면
	//---------------------------------------------------------------
	public String gameResult(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			loginMbrSq = sessionMember.getCustSysId();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					loginNickName = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
					loginBbc = amsClbMbr.get(i).get("CLB_BBC") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";


			searchMap.clear();
			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("HME_CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", loginMbrSq);
			searchMap.put("MTC_SQ", intMtcsq);
				
			Map<String,Object> atrMtc=commonService.select("Bbc.sqlATR_MTC_SELECT", searchMap);

			request.put("atrMtc", atrMtc);
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("kewordData", kewordData);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameResult";
	}
	

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 등록
	//---------------------------------------------------------------
	public String gameSave(){
		
		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			request.put("strLngdv", "ko-KR");
			renderJSON(mapResult);
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("HME_CLB_SQ",intClbsq);		// [경기] 클럽시퀀스
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());		// [경기] 회원시퀀스
			map.put("A_TEM_SCR",intAtemscr);		// [경기] A팀점수
			map.put("B_TEM_SCR",intBtemscr);		// [경기] B팀점수
			
			map.put("MBR_SQ_A1",intMbrsqa1);		// [경기선수] 회원시퀀스 A1
			map.put("MTC_CLB_BBC_A1",intMtcclbbbca1);	// [경기선수] 경기결과입력시점BB코인 A1
			map.put("MBR_SQ_A2",intMbrsqa2);		// [경기선수] 회원시퀀스 A2
			map.put("MTC_CLB_BBC_A2",intMtcclbbbca2);	// [경기선수] 경기결과입력시점BB코인 A2
			map.put("MBR_SQ_B1",intMbrsqb1);		// [경기선수] 회원시퀀스 B1
			map.put("MTC_CLB_BBC_B1",intMtcclbbbcb1);	// [경기선수] 경기결과입력시점BB코인 B1
			map.put("MBR_SQ_B2",intMbrsqb2);		// [경기선수] 회원시퀀스 B2
			map.put("MTC_CLB_BBC_B2",intMtcclbbbcb2);	// [경기선수] 경기결과입력시점BB코인 B2

			map.put("STD_SQ",intMtcsetcnt);	// GAME 시퀀스

			map.put("A_TEAM_NM",strHmenm);
			map.put("B_TEAM_NM",strAwynm);
			
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MTC_INSERT", map);
	    	renderJSON(mapResult);
	    	/*
			try{
				String openId1 = String.valueOf(mapResult.get("OPENID1"));
				String openId2 = String.valueOf(mapResult.get("OPENID2"));
				String openId3 = String.valueOf(mapResult.get("OPENID3"));
				String openId4 = String.valueOf(mapResult.get("OPENID4"));
				String strMtcsq = String.valueOf(mapResult.get("RST_SQ_OUT"));
				String strClbsq = String.valueOf(mapResult.get("CLB_SQ"));
				String bbc1 = String.valueOf(mapResult.get("BBC_A11"));
				String bbc2 = String.valueOf(mapResult.get("BBC_A21"));
				String bbc3 = String.valueOf(mapResult.get("BBC_B11"));
				String bbc4 = String.valueOf(mapResult.get("BBC_B21"));
				String remark1 = String.valueOf(mapResult.get("TOTAL_BBC_A1"));
				String remark2 = String.valueOf(mapResult.get("TOTAL_BBC_A2"));
				String remark3 = String.valueOf(mapResult.get("TOTAL_BBC_B1"));
				String remark4 = String.valueOf(mapResult.get("TOTAL_BBC_B2"));
				
				String first = strMbrnma1 + "," + strMbrnma2 + " vs " + strMbrnmb1 + "," + strMbrnmb2;
				String keyword1A1 = intAtemscr + "("+bbc1+") : " + intBtemscr+"("+bbc3+")";
				String keyword1A2 = intAtemscr + "("+bbc2+") : " + intBtemscr+"("+bbc3+")";
				String keyword1B1 = intAtemscr + "("+bbc1+") : " + intBtemscr+"("+bbc3+")";
				String keyword1B2 = intAtemscr + "("+bbc1+") : " + intBtemscr+"("+bbc4+")";
				String keyword2 = "/front/bbc/clb/gameResult.htm?intMtcsq="+strMtcsq+"&intClbsq="+strClbsq;
				String keyword3 = "";
				
				if (intAtemscr > intBtemscr) {
					keyword3 = strMbrnma1 + "," + strMbrnma2 + " Victory!!";
				}
				else {
					keyword3 = strMbrnmb1 + "," + strMbrnmb2 + " Victory!!";
				}
								
				if (!openId1.isEmpty()) {
					logger.info("##### sendResultGameMsg==>"+openId1);
			    	AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());

					try {
				    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId1, first, keyword1A1, keyword2, keyword3, remark1);
				    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId2, first, keyword1A2, keyword2, keyword3, remark2);
				    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId3, first, keyword1B1, keyword2, keyword3, remark3);
				    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId4, first, keyword1B2, keyword2, keyword3, remark4);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}catch (Error e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
			}catch(Exception e){
				//e.printStackTrace();
				logger.info("##### Exception==>" +  e.getMessage());
			}
		    	*/
				
	    	
		}catch(Exception e){
			e.printStackTrace();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			renderJSON(mapResult);
		}

		return NONE;
	}	

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 등록
	//---------------------------------------------------------------
	public String gameSaveSingles(){
		
		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			request.put("strLngdv", "ko-KR");
			renderJSON(mapResult);
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("CLB_SQ",intClbsq);		// [경기] 클럽시퀀스
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());		// [경기] 회원시퀀스
			map.put("SCR_A",intAtemscr);		// [경기] A팀점수
			map.put("SCR_B",intBtemscr);		// [경기] B팀점수
			
			map.put("MBR_SQ_A",intMbrsqa1);		// [경기선수] 회원시퀀스 A1
			map.put("MBR_SQ_B",intMbrsqb1);		// [경기선수] 회원시퀀스 B1
			map.put("MTC_SQ",intMtcsq);		// [경기선수] 경기시퀀스
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MTC_SINGLES_INSERT", map);
	    	renderJSON(mapResult);
	    	
			try{
				String openId1 = String.valueOf(mapResult.get("OPENID1"));
				String openId2 = String.valueOf(mapResult.get("OPENID2"));
				String strMtcsq = String.valueOf(mapResult.get("RST_SQ_OUT"));
				String strClbsq = String.valueOf(mapResult.get("CLB_SQ"));
				
				String first = strMbrnma1 + " vs " + strMbrnmb1;
				String keyword1 = intAtemscr + " : " + intBtemscr;
				//String keyword2 = "/front/bbc/clb/gameResult.htm?intMtcsq="+strMtcsq+"&intClbsq="+strClbsq;
				String keyword3 = "";
				
				if (intAtemscr > intBtemscr) {
					keyword3 = strMbrnma1 + " Victory!!";
				}
				else {
					keyword3 = strMbrnmb1 + " Victory!!";
				}
				
				String remark  = "加油~！";
				
				if (!openId1.isEmpty()) {
					logger.info("##### sendResultGameMsg==>"+openId1);
			    	AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());

					try {
				    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId1, first, keyword1, "", keyword3, remark);
				    	weixinTemplateMessageService.sendResultGameMsg(appInfo,openId2, first, keyword1, "", keyword3, remark);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}catch (Error e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
		    	
			}catch(Exception e){
				//e.printStackTrace();
				logger.info("##### Exception==>" +  e.getMessage());
			}
				
	    	
		}catch(Exception e){
			e.printStackTrace();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			renderJSON(mapResult);
		}

		return NONE;
	}	

	
	//---------------------------------------------------------------
	// [클럽-clb] Club 오늘의 경기 등록
	//---------------------------------------------------------------
	public String gameTodaySave(){

		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			request.put("strLngdv", "ko-KR");
			renderJSON(mapResult);
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("CLB_SQ",intClbsq);		// [경기] 클럽시퀀스
			map.put("MBR_SQ",sessionMember.getCustSysId());		// [경기] 회원시퀀스
			map.put("EXC_SQ",intExcsq);		// [경기] 운동 시퀀스
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EXC_JIN_SELECT_GAME", map);
	    	renderJSON(mapResult);
			
		}catch(Exception e){
			e.printStackTrace();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			renderJSON(mapResult);
		}

		return NONE;
	}	
	

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 등록
	//---------------------------------------------------------------
	public String gameUpdate(){

		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			request.put("strLngdv", "ko-KR");
			renderJSON(mapResult);
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("HME_CLB_SQ",intClbsq);		// [경기] 클럽시퀀스
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());		// [경기] 회원시퀀스
			map.put("A_TEM_SCR",intAtemscr);		// [경기] A팀점수
			map.put("B_TEM_SCR",intBtemscr);		// [경기] B팀점수
			
			map.put("MBR_SQ_A1",intMbrsqa1);		// [경기선수] 회원시퀀스 A1
			map.put("MTC_CLB_BBC_A1",intMtcclbbbca1);	// [경기선수] 경기결과입력시점BB코인 A1
			map.put("MBR_SQ_A2",intMbrsqa2);		// [경기선수] 회원시퀀스 A2
			map.put("MTC_CLB_BBC_A2",intMtcclbbbca2);	// [경기선수] 경기결과입력시점BB코인 A2
			map.put("MBR_SQ_B1",intMbrsqb1);		// [경기선수] 회원시퀀스 B1
			map.put("MTC_CLB_BBC_B1",intMtcclbbbcb1);	// [경기선수] 경기결과입력시점BB코인 B1
			map.put("MBR_SQ_B2",intMbrsqb2);		// [경기선수] 회원시퀀스 B2
			map.put("MTC_CLB_BBC_B2",intMtcclbbbcb2);	// [경기선수] 경기결과입력시점BB코인 B2

			map.put("A_TEAM_NM",strHmenm);
			map.put("B_TEAM_NM",strAwynm);
			
			map.put("MTC_SQ",intMtcsq);		// [경기선수] 회원시퀀스 A1
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MTC_INSERT", map);
	    	renderJSON(mapResult);
			
		}catch(Exception e){
			e.printStackTrace();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			renderJSON(mapResult);
		}

		return NONE;
	}	

	//---------------------------------------------------------------
	// [클럽-clb] Club 경기 등록
	//---------------------------------------------------------------
	public String gameDel(){

		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			request.put("strLngdv", "ko-KR");
			renderJSON(mapResult);
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("HME_CLB_SQ",intClbsq);		// [경기] 클럽시퀀스
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());		// [경기] 회원시퀀스
			
			map.put("MTC_SQ",intMtcsq);		// [경기선수] 경기시퀀스
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MTC_INSERT", map);
	    	renderJSON(mapResult);
			
		}catch(Exception e){
			e.printStackTrace();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			renderJSON(mapResult);
		}

		return NONE;
	}	

	//---------------------------------------------------------------
	// [클럽-clb] Club 일일 경기 목록
	//---------------------------------------------------------------
	public String gameTody(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			if (datFrdt == null) {
				String dt1 = (String) amsClb.get("FRDAY");
				String dt2 = (String) amsClb.get("TODAY");
				datFrdt = dt1;
				datTodt = dt2;
			}
			
			request.put("amsClb", amsClb);
			
			loginMbrSq = sessionMember.getCustSysId();

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SELECT_TODAY",searchMap);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "T");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("ORDERBY", "GAME_CNT");
			List<Map<String, Object>> atrMtcListP = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);

			if (intClbsq > 0) {
				searchMap.clear();
				searchMap.put("JOP_TYPE", "S");
				searchMap.put("LOGIN_USER", loginUserId);
				searchMap.put("CLB_SQ", intClbsq);
				searchMap.put("FR_DT", datFrdt);
				searchMap.put("TO_DT", datTodt);
				searchMap.put("MBR_SQ", intMbrsq);
				Map<String, Object> atrMtcMbrList = commonService.select("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
				
				request.put("atrMtcMbrList", atrMtcMbrList);	
			}
			else {
				request.put("atrMtcMbrList", null);	
			}
			
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("atrMtcList", atrMtcList);
			request.put("atrMtcListP", atrMtcListP);
			request.put("atrMtcListCnt", atrMtcList.size());
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameTody";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 단식 경기 목록
	//---------------------------------------------------------------
	public String gameSingleList(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			if (datFrdt == null) {
				String dt1 = (String) amsClb.get("FRDAY_SG");
				String dt2 = (String) amsClb.get("TODAY");
				datFrdt = dt1;
				datTodt = dt2;
			}
			
			request.put("amsClb", amsClb);
			
			loginMbrSq = sessionMember.getCustSysId();

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SINGLES_SELECT",searchMap);
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("atrMtcList", atrMtcList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameSingleList";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 팀 경기 목록
	//---------------------------------------------------------------
	public String gameTeam(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			String strMbrsnma1 = "";
			String strMbrsnma2 = "";
			String strMbrsnmb1 = "";
			String strMbrsnmb2 = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String strMbrsqa1 = intMbrsqa1+"";
				if (checkLoginId.equals(strMbrsqa1)) {
					strMbrsnma1 = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				String strMbrsqa2 = intMbrsqa2+"";
				if (checkLoginId.equals(strMbrsqa2)) {
					strMbrsnma2 = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				String strMbrsqb1 = intMbrsqb1+"";
				if (checkLoginId.equals(strMbrsqb1)) {
					strMbrsnmb1 = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				String strMbrsqb2 = intMbrsqb2+"";
				if (checkLoginId.equals(strMbrsqb2)) {
					strMbrsnmb2 = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("strMbrsnma1", strMbrsnma1);
			request.put("strMbrsnma2", strMbrsnma2);
			request.put("strMbrsnmb1", strMbrsnmb1);
			request.put("strMbrsnmb2", strMbrsnmb2);
			request.put("kewordData", kewordData);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			request.put("amsClb", amsClb);
			
			loginMbrSq = sessionMember.getCustSysId();

			searchMap.clear();
//			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ_A1", intMbrsqa1);
			searchMap.put("MBR_SQ_A2", intMbrsqa2);
			searchMap.put("MBR_SQ_B1", intMbrsqb1);
			searchMap.put("MBR_SQ_B2", intMbrsqb2);
			searchMap.put("JOP_TYPE", strMtctp);
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SELECT_TEAM",searchMap);
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("atrMtcList", atrMtcList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gameTeam";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 기간별 경기 목록
	//---------------------------------------------------------------
	public String gamePeriod(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			if (datFrdt == null) {
				String dt = (String) amsClb.get("TODAY");
				datFrdt = dt;
				datTodt = dt; 
			}
			
			request.put("amsClb", amsClb);
			
			loginMbrSq = sessionMember.getCustSysId();

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", strOrderby);
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);

			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("atrMtcList", atrMtcList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gamePeriod";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 기간별 단식 경기 목록
	//---------------------------------------------------------------
	public String gamePeriodSingle(){
		
		try{
			//--------- Main Logic

			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			if (datFrdt == null) {
				String dt = (String) amsClb.get("TODAY");
				datFrdt = dt;
				datTodt = dt; 
			}
			
			request.put("amsClb", amsClb);
			
			loginMbrSq = sessionMember.getCustSysId();

			searchMap.clear();
			searchMap.put("JOP_TYPE", "P");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", strOrderby);
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);

			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("atrMtcList", atrMtcList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "gamePeriodSingle";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 베스트 파트너
	//---------------------------------------------------------------
	public String bestPartner(){
		
		try{
			//--------- Main Logic
			String loginUserId = "";
			int loginMbrSq;
			String loginNickName = "";
			String loginBbc = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			String strMbrnickname = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = intMbrsq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					strMbrnickname = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("strMbrnickname", strMbrnickname);
			request.put("kewordData", kewordData);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);
			
			loginMbrSq = sessionMember.getCustSysId();

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", strOrderby);
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SELECT_BEST",searchMap);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "C");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrMtcList2 = commonService.selectList("Bbc.sqlATR_MTC_SELECT_BEST",searchMap);

			
			request.put("loginMbrSq", loginMbrSq);
			request.put("loginNickName", loginNickName);
			request.put("loginBbc", loginBbc);
			request.put("atrMtcList", atrMtcList);
			request.put("atrMtcList2", atrMtcList2);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "bestPartner";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 랭킹
	//---------------------------------------------------------------
	public String clbRank(){
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "A");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("ORDERBY", strOrderby);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			List<Map<String, Object>> amsMbrRankListA = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT_RANK",searchMap);

			request.put("amsMbrRankListA", amsMbrRankListA);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("ORDERBY", strOrderby);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			List<Map<String, Object>> amsMbrRankListM = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT_RANK",searchMap);

			request.put("amsMbrRankListM", amsMbrRankListM);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "W");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("ORDERBY", strOrderby);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			List<Map<String, Object>> amsMbrRankListW = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT_RANK",searchMap);

			request.put("amsMbrRankListW", amsMbrRankListW);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("ORDERBY", strOrderby);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			List<Map<String, Object>> amsMbrRankList = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT_RANK",searchMap);

			request.put("amsMbrRankList", amsMbrRankList);

			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbRank";
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 단식랭킹
	//---------------------------------------------------------------
	public String clbRankSingles(){
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("ORDERBY", strOrderby);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			List<Map<String, Object>> amsMbrRankList = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT_RANK_SINGLES",searchMap);

			request.put("amsMbrRankList", amsMbrRankList);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbRankSingles";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 공지사항
	//---------------------------------------------------------------
	public String clbNotice() {
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();


			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClbMbr = commonService.select("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbr", amsClbMbr);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_BBD_TP", "1001");

			List<BbcAtrClbBbd> atrClbBbdList = (List<BbcAtrClbBbd>) bbcService.selectBbcAtrClbBbd("Bbc.sqlATR_CLB_BBD_SELECT", searchMap);
			
			request.put("atrClbBbdList", atrClbBbdList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbNotice";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 회칙
	//---------------------------------------------------------------
	public String clbRule() {
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();


			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClbMbr = commonService.select("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);

			request.put("amsClbMbr", amsClbMbr);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_BBD_TP", "1004");
			
			List<BbcAtrClbBbd> atrClbBbdList = (List<BbcAtrClbBbd>) bbcService.selectBbcAtrClbBbd("Bbc.sqlATR_CLB_BBD_SELECT", searchMap);
			
			request.put("atrClbBbdList", atrClbBbdList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbRule";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 공지사항 등록
	//---------------------------------------------------------------
	public String clbNoticeReg() {
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);

			}
			
			currLanguage = strLngdv;
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_BBD_TP", "1001");
			searchMap.put("CLB_BBD_SQ", intClbbbdsq);
			
			BbcAtrClbBbd atrClbBbdList = (BbcAtrClbBbd) bbcService.selectBbcAtrClbBbdOne("Bbc.sqlATR_CLB_BBD_SELECT", searchMap);
			
			request.put("atrClbBbdList", atrClbBbdList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbNoticeReg";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 회칙등록
	//---------------------------------------------------------------
	public String clbRuleReg() {
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_BBD_TP", "1004");
			searchMap.put("CLB_BBD_SQ", intClbbbdsq);

			BbcAtrClbBbd atrClbBbdList = (BbcAtrClbBbd) bbcService.selectBbcAtrClbBbdOne("Bbc.sqlATR_CLB_BBD_SELECT", searchMap);
			
			request.put("atrClbBbdList", atrClbBbdList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbRuleReg";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 공지사항 저장
	//---------------------------------------------------------------
	public String clbNoticeSave() {

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			request.put("strLngdv", "ko-KR");
			ret="fail";
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);
			
			map.put("CLB_BBD_TP",strClbbbdtp);
			map.put("CLB_SQ",intClbsq);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("CLB_BBD_ST","ACT");
			map.put("CLB_BBD_TIT",strClbbbdtit);
			//map.put("CLB_BBD_CTE",strClbbbdcte);
			map.put("CLB_BBD_CTE", URLDecoder.decode(strClbbbdcte, "UTF-8"));
			map.put("RCM_CNT",intRcmcnt);
			map.put("CLB_BBD_SQ",intClbbbdsq);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_CLB_BBD_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 공지사항 삭제
	//---------------------------------------------------------------
	public String clbNoticeDel() {

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","D");
			map.put("LOGIN_USER",loginUserId);
			
			map.put("CLB_SQ",intClbsq);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("CLB_BBD_SQ",intClbbbdsq);
			
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_CLB_BBD_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
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
	// [클럽-clb] Club 이벤트
	//---------------------------------------------------------------
	public String clbEventList() {
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
//			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrEvtList = commonService.selectList("Bbc.sqlATR_EVT_SELECT", searchMap);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
//			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrEvtcheList = commonService.selectList("Bbc.sqlATR_EVT_CHE_SELECT", searchMap);

			request.put("atrEvtList", atrEvtList);
			request.put("atrEvtcheList", atrEvtcheList);
			request.put("atrEvtEndList", null);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbEventList";
	}
	

	//---------------------------------------------------------------
	// [클럽-clb] Club 이벤트
	//---------------------------------------------------------------
	public String clbEventListEnd() {
		
		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			
			request.put("amsClb", amsClb);
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
//			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrEvtcheList = commonService.selectList("Bbc.sqlATR_EVT_CHE_SELECT", searchMap);


			searchMap.clear();
			searchMap.put("JOP_TYPE", "C");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
//			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrEvtEndList = commonService.selectList("Bbc.sqlATR_EVT_SELECT", searchMap);


			request.put("atrEvtList", null);
			request.put("atrEvtcheList", atrEvtcheList);
			request.put("atrEvtEndList", atrEvtEndList);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbEventListEnd";
	}

	//---------------------------------------------------------------
	// [클럽-clb] 이벤트 댓글 등록
	//---------------------------------------------------------------
	public String atrEvtcheSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE", "I");
			map.put("LOGIN_USER",loginUserId);
			
			
			map.put("MTC_SQ",intMtcsq);
			map.put("CLB_SQ",intClbsq);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			map.put("CHE_TEM_DV",strChetemdv);
			map.put("CHE_CTE",strChecte);

			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EVT_CHE_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 이벤트 등록
	//---------------------------------------------------------------
	public String clbEventReg() {

		return "clbEventReg";
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 이벤트 저장
	//---------------------------------------------------------------
	public String clbEventSave() {

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			if (imageFile != null) {
				UploadResult result = UploadFileUtil.upload(getRequest(), imageFile, strPtourl, UploadFileUtil.UPLOAD_LOGO);
				strPtourl = result.getFileUrl();
			}
			
			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE", "I");
			map.put("LOGIN_USER",loginUserId);
			
			
			//map.put("MTC_SQ",intMtcsq);
			map.put("CLB_SQ",intClbsq);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("PTO_URL",strPtourl);
			map.put("EVT_CTE",strEvtcte);
			map.put("HME_NM",strHmenm);
			map.put("AWY_NM",strAwynm);
			

			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EVT_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}


	//---------------------------------------------------------------
	// [클럽-clb] Club 이벤트 업데이트
	//---------------------------------------------------------------
	public String clbEventUpdate() {

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE", strJobtype);
			map.put("LOGIN_USER",loginUserId);
			
			
			//map.put("MTC_SQ",intMtcsq);
			map.put("CLB_SQ",intClbsq);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("MTC_SQ",intMtcsq);
			map.put("EVT_ST",strEvtst);
			map.put("REG_MBR_SQ",intRegmbrsq);
			map.put("LST_MOD_MBR_SQ",intLstmodmbrsq);
			

			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EVT_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 회원 가입 승인
	//---------------------------------------------------------------
	public String clbMbrSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);
			
			
			map.put("CLB_JIN_REQ_SQ",intClbjinreqsq);
			map.put("JIN_REQ_MBR_SQ",intJinreqmbrsq);
			map.put("CLB_SQ",intClbsq);
			map.put("BMT_GD",strBmtgd);
			
			map.put("MBR_SQ",sessionMember.getCustSysId());
			map.put("CLB_JIN_REQ_ST","ACT");
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_CLB_JIN_REQ_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 회원 정보 수정
	//---------------------------------------------------------------
	public String clbMbrModifyNew(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","U");
			map.put("LOGIN_USER",loginUserId);
			
			map.put("CLB_SQ",intClbsq);
			map.put("MBR_SQ",intMbrsq);
			map.put("CLB_GD",strClbgd);
			map.put("CLB_BBC",intClbbbc);
			map.put("JIN_CLB_BBC",intJinclbbbc);
			map.put("CLB_NIK_NM",strClbniknm);
			map.put("CLB_JIN_ST",strAtttp);
			map.put("LST_MOD_MBR_SQ",intYywincnt);
			map.put("BMT_GD",strBmtgd);
			map.put("GND_DV",strGnddv);
			
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 나의 정보 수정
	//---------------------------------------------------------------
	public String clbMyModify(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","M");
			map.put("LOGIN_USER",loginUserId);
			
			map.put("CLB_SQ",intClbsq);
			map.put("MBR_SQ",intMbrsq);
			map.put("CLB_NIK_NM",strClbniknm);
			map.put("CLB_GD",strClbgd);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}
	
	//---------------------------------------------------------------
	// [클럽-clb] Club 회원 가입 승인
	//---------------------------------------------------------------
	public String clbMbrDelete(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","D");
			map.put("LOGIN_USER",loginUserId);
			
			map.put("CLB_SQ",intClbsq);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}	
	
	
	//---------------------------------------------------------------
	// [운동-exc] Exercise
	//---------------------------------------------------------------
	public String exc(){

		return "exc";
	}
	
	//---------------------------------------------------------------
	// 운동 참여 리스트 목록
	//---------------------------------------------------------------
	public String excDoList(){

		try{
			
			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			List<Map<String, Object>> amsExcList = commonService.selectList("Bbc.sqlATR_EXC_SELECT", searchMap);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "A");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			List<Map<String, Object>> amsExcList2 = commonService.selectList("Bbc.sqlATR_EXC_SELECT", searchMap);

			request.put("amsExcList", amsExcList);
			request.put("amsExcList2", amsExcList2);
			request.put("loginMbrSq", loginMbrSq);
			
			int listSize = amsExcList.size();
			
			if (listSize == 1) {
				String ingExcsq = amsExcList.get(0).get("EXC_SQ_ING") + "";
				String clbSq = amsExcList.get(0).get("HME_CLB_SQ") + "";
				int intIngExcsq = Integer.parseInt(ingExcsq);
				intClbsq = Integer.parseInt(clbSq);
				if (intIngExcsq > 0) {
					
					searchMap.put("JOP_TYPE", "M");
					searchMap.put("LOGIN_USER", loginUserId);
					searchMap.put("CLB_SQ", intClbsq);
					searchMap.put("MBR_SQ", sessionMember.getCustSysId());
					Map<String, Object> atrMtcList = commonService.select("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
					
					request.put("atrMtcList", atrMtcList);				
					
					return "excGame";
				}
			}
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excDoList";
	}
	
	//---------------------------------------------------------------
	// 운동 참여 리스트 목록
	//---------------------------------------------------------------
	public String excGame(){

		try{
			//--------- Main Logic
			
			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			List<Map<String, Object>> amsExcList = commonService.selectList("Bbc.sqlATR_EXC_SELECT", searchMap);

			
			request.put("amsExcList", amsExcList);
			request.put("loginMbrSq", loginMbrSq);

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("MBR_SQ", intMbrsq);
			Map<String, Object> atrMtcList = commonService.select("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
			
			request.put("atrMtcList", atrMtcList);				
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excGame";
	}

	//---------------------------------------------------------------
	// 운동 참여 등록
	//---------------------------------------------------------------
	public String excReg(){

		try{
			//--------- Main Logic
			
			String loginUserId = "";
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbList = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);
			
			request.put("amsClbList", amsClbList);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excReg";
	}

	//---------------------------------------------------------------
	// 정규운동 설정
	//---------------------------------------------------------------
	public String clbExcReg(){
		
		try{
			//--------- Main Logic
			

			String loginUserId = "";
			int loginMbrSq = 0;
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);

			request.put("amsClb", amsClb);
			request.put("loginMbrSq", loginMbrSq);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			//searchMap.put("YW_DAY", strYwday);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			Map<String, Object> amsClbExc = commonService.select("Bbc.sqlAMS_CLB_EXC_SELECT", searchMap);
			
			request.put("amsClbExc", amsClbExc);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbExcReg";
	}
	
	//---------------------------------------------------------------
	// 운동 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String excRegSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","I");
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_TP",strExctp);
			map.put("EXC_FR_DT",datExcfrdt);
			map.put("EXC_TO_FR",datExctofr);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("EXC_DCT",strExcdct);
			map.put("EXC_TIT",strExctit);
			map.put("HME_CLB_SQ",intClbsq);
			map.put("ATD_CNT",intAtdcnt);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EXC_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
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
	// 운동 참여 등록 - 수정 ajax
	//---------------------------------------------------------------
	public String excRegUpdate(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","U");
			map.put("LOGIN_USER",loginUserId);
			
			map.put("EXC_SQ",intExcsq);
			map.put("EXC_TP",strExctp);
			map.put("EXC_FR_DT",datExcfrdt);
			map.put("EXC_TO_FR",datExctofr);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("EXC_DCT",strExcdct);
			map.put("EXC_TIT",strExctit);
			map.put("HME_CLB_SQ",intClbsq);
			map.put("ATD_CNT",intAtdcnt);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EXC_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
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
	// 정규 운동 설정 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String clbExcRegSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","I");
			map.put("LOGIN_USER",loginUserId);
			map.put("CLB_SQ",intClbsq);
			map.put("EXC_DCT",strExcdct);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());

			map.put("EXC_TIT1",strExcTit1);
			map.put("EXC_TIT2",strExcTit2);
			map.put("EXC_TIT3",strExcTit3);
			map.put("EXC_TIT4",strExcTit4);
			map.put("EXC_TIT5",strExcTit5);
			map.put("EXC_TIT6",strExcTit6);
			map.put("EXC_TIT7",strExcTit7);
			map.put("EXC_FR_TME1",strExcFrtme1);
			map.put("EXC_FR_TME2",strExcFrtme2);
			map.put("EXC_FR_TME3",strExcFrtme3);
			map.put("EXC_FR_TME4",strExcFrtme4);
			map.put("EXC_FR_TME5",strExcFrtme5);
			map.put("EXC_FR_TME6",strExcFrtme6);
			map.put("EXC_FR_TME7",strExcFrtme7);
			map.put("EXC_TO_TME1",strExcTotme1);
			map.put("EXC_TO_TME2",strExcTotme2);
			map.put("EXC_TO_TME3",strExcTotme3);
			map.put("EXC_TO_TME4",strExcTotme4);
			map.put("EXC_TO_TME5",strExcTotme5);
			map.put("EXC_TO_TME6",strExcTotme6);
			map.put("EXC_TO_TME7",strExcTotme7);

			map.put("EXC_DCT1",strExcdct1);
			map.put("EXC_DCT2",strExcdct2);
			map.put("EXC_DCT3",strExcdct3);
			map.put("EXC_DCT4",strExcdct4);
			map.put("EXC_DCT5",strExcdct5);
			map.put("EXC_DCT6",strExcdct6);
			map.put("EXC_DCT7",strExcdct7);

			map.put("EXC_TP1",strExctp1);
			map.put("EXC_TP2",strExctp2);
			map.put("EXC_TP3",strExctp3);
			map.put("EXC_TP4",strExctp4);
			map.put("EXC_TP5",strExctp5);
			map.put("EXC_TP6",strExctp6);
			map.put("EXC_TP7",strExctp7);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_EXC_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
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
	// 운동 참여하기
	//---------------------------------------------------------------
	public String excJin(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_EXC_SELECT", searchMap);
			
			request.put("amsExcList", amsExcList);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinListRank = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "P");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinListReply = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);
			
			request.put("loginMbrSq", loginMbrSq);
			request.put("amsJinList", amsJinList);
			request.put("amsJinListRank", amsJinListRank);
			request.put("amsJinListReply", amsJinListReply);
			request.put("intExcsq", intExcsq);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excJin";
	}

	//---------------------------------------------------------------
	// 운동 참여하기
	//---------------------------------------------------------------
	public String excJinSave(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_EXC_SELECT", searchMap);
			
			request.put("amsExcList", amsExcList);

			request.put("loginMbrSq", loginMbrSq);
			request.put("intExcsq", intExcsq);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excJinSave";
	}

	
	
	
	//---------------------------------------------------------------
	// 운동 참여 차량 운행
	//---------------------------------------------------------------
	public String excJinCar(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_EXC_SELECT", searchMap);
			
			request.put("amsExcList", amsExcList);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_EXC_JIN_CAR_SELECT", searchMap);

			request.put("loginMbrSq", loginMbrSq);
			request.put("amsJinList", amsJinList);
			request.put("intExcsq", intExcsq);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excJinCar";
	}
	
	//---------------------------------------------------------------
	// 운동 참여 수정
	//---------------------------------------------------------------
	public String excView(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_EXC_SELECT", searchMap);
			
			request.put("amsExcList", amsExcList);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);

			request.put("loginMbrSq", loginMbrSq);
			request.put("amsJinList", amsJinList);
			request.put("intExcsq", intExcsq);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excView";
	}

	//---------------------------------------------------------------
	// 운동 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String excJinRegSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("EXC_JIN_CMT",strExcjincmt);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			map.put("EXC_JIN_TP",intExcjintp);
			map.put("EXC_JIN_DLY",intExcjindly);
			
			List<Map<String, Object>> mapResult=commonService.selectList("Bbc.sqlATR_EXC_JIN_INSERT", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);

			if (!("S".equals(mapResult.get(0).get("MSG_OUT")))) {
				return NONE;
			}
			
			map.clear();
	 		map.put("JOP_TYPE","S");
			map.put("LOGIN_USER",loginUserId);

			map.put("MBR_SQ",intExcsq);
			map.put("MBR_SQ_F",sessionMember.getCustSysId());
			List<Map<String, Object>> followUserList=commonService.selectList("Bbc.getFollowUser", map);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());
			String strExcsq = String.valueOf(intExcsq);

			try {
				Thread thread = new Thread(new SendMsgThread(weixinService, weixinTemplateMessageService, appInfo, followUserList, strExcsq));
				thread.start();
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("thread0000000000:" + e.getMessage());
			}
			
			return NONE;
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}


	//---------------------------------------------------------------
	// 운동 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String excJinRegSaveG(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("EXC_JIN_CMT",strExcjincmt);
			map.put("MBR_SQ",intMbrsq);
			map.put("EXC_JIN_TP",intExcjintp);
			map.put("EXC_JIN_DLY",intExcjindly);
			
			List<Map<String, Object>> mapResult=commonService.selectList("Bbc.sqlATR_EXC_JIN_INSERT", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);

			if (!("S".equals(mapResult.get(0).get("MSG_OUT")))) {
				return NONE;
			}
			
			map.clear();
	 		map.put("JOP_TYPE","S");
			map.put("LOGIN_USER",loginUserId);

			map.put("MBR_SQ",intExcsq);
			map.put("MBR_SQ_F",intMbrsq);
			List<Map<String, Object>> followUserList=commonService.selectList("Bbc.getFollowUser", map);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());
			String strExcsq = String.valueOf(intExcsq);

			try {
				Thread thread = new Thread(new SendMsgThread(weixinService, weixinTemplateMessageService, appInfo, followUserList, strExcsq));
				thread.start();
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("thread0000000000:" + e.getMessage());
			}
			
			return NONE;
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	

	//---------------------------------------------------------------
	// 운동 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String excJinReplySave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("EXC_JIN_CMT",strExcjincmt);
			map.put("MBR_SQ",intMbrsq);
			map.put("EXC_JIN_TP",sessionMember.getCustSysId());
			
			List<Map<String, Object>> mapResult=commonService.selectList("Bbc.sqlATR_EXC_JIN_INSERT", map);
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);

			
			try {
				for(int i = 0; i < mapResult.size(); i++){
					String openid = mapResult.get(i).get("OPENID").toString();

					if (!openid.isEmpty()) {
						
						String strDt = String.valueOf(mapResult.get(i).get("DT"));
						String strNick = String.valueOf(mapResult.get(i).get("CLB_NIK_NM"));
						
						String first = "운동 참석 공지에 댓글이 달렸습니다.";
						String keyword1 = first;
						String keyword2 = strDt;
						String keyword3 = strNick;
						String linkUrl = "/front/bbc/exc/excJin.htm?intExcsq="+intExcsq;
						
						String remark  = "댓글 보러 가기 ☜";
					
				    	AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());

						try {
					    	weixinTemplateMessageService.sendNewReviewMsg(appInfo, openid, first, keyword1, keyword2, keyword3, linkUrl, remark);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}catch (Error e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}					
					
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return NONE;
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}

	//---------------------------------------------------------------
	// 운동 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String excJinCarRegSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("EXC_JIN_CMT",strExcjincmt);
			map.put("CAR_MBR_SQ",intCarmbrsq);
			map.put("EXC_JIN_TP",intExcjintp);
			map.put("CAR_YN",strCaryn);
			map.put("EXC_JIN_DLY",intExcjindly);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			
			List<Map<String, Object>> mapResult=commonService.selectList("Bbc.sqlATR_EXC_JIN_CAR_INSERT", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);
			

			map.clear();
	 		map.put("JOP_TYPE","C");
			map.put("LOGIN_USER",loginUserId);

			map.put("MBR_SQ",intExcsq);
			map.put("MBR_SQ_F",sessionMember.getCustSysId());
			List<Map<String, Object>> followUserList=commonService.selectList("Bbc.getFollowUser", map);

			try {
				for(int i = 0; i < followUserList.size(); i++){
					String openid = followUserList.get(i).get("OPENID").toString();

					String templateId = "HDxMfVksdC7R87KnyZ2YEtnNsb0HzCLHnn8Xbz2Ajps";	//用车申请通知
					
					String first = followUserList.get(i).get("FIRSTDATA").toString();
					String keyword1 = followUserList.get(i).get("KEYWORD1").toString();
					String keyword2 = followUserList.get(i).get("KEYWORD2").toString();
					String keyword3 = followUserList.get(i).get("KEYWORD3").toString();
					String keyword4 = followUserList.get(i).get("KEYWORD4").toString();
					String keyword5 = followUserList.get(i).get("KEYWORD5").toString();
					String remark = followUserList.get(i).get("REMARK").toString();
					String remark2 = followUserList.get(i).get("REMARK2").toString();
					
					Map<String, DataItem> data = new HashMap<String, DataItem>();
					data.put("first", new DataItem(keyword1 + "님이 " + first, DEFAUT_COLOR));
					data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
					data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
					data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
					data.put("keyword4", new DataItem(keyword4, DEFAUT_COLOR));
					data.put("keyword5", new DataItem(keyword5, DEFAUT_COLOR));
					data.put("remark", new DataItem(remark + " \n" + remark2, DEFAUT_COLOR));					
					
					String linkUrl = "/front/bbc/exc/excJinCar.htm?intExcsq="+intExcsq;
					
					AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());

					try {
						weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openid, data, linkUrl);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}catch (Error e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			
			
			return NONE;


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
	// 운동 참여 삭제 - ajax 
	//---------------------------------------------------------------
	public String excDel(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","D");
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EXC_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
			else {
				ret=msgOut;
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//---------------------------------------------------------------
	// [소개-itd] Introduce
	//---------------------------------------------------------------
	public String itd(){

		try{

			SessionSkin sessionSkin  = (SessionSkin) session.get(SessionUtils.SESSION_SKIN);
			shopId = sessionSkin.getShopId().toString();
			
			pageUnit = 30;
			Map<String,Object> magazineMap=new HashMap<String, Object>();
			magazineMap.put("SHOP_ID",shopId);
			magazineMap.put("USER_ID", null);
			magazineMap.put("PAGE_CURR", pageCurr);
			magazineMap.put("PAGE_UINT", pageUnit);
			magazineMap.put("ORDERBY", orderby);
			magazineMap.put("BLOG_ID", null);
			
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
						
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		
		return "itd";
	}

	//---------------------------------------------------------------
	// [회원-mbr] 마이페이지
	//---------------------------------------------------------------
	public String myPage(){

		try{
			//--------- Main Logic
			
			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				request.put("strLngdv", "ko-KR");
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			//searchMap.put("LANG", currLanguage);
			Map<String, Object> amsMbr = commonService.select("Bbc.sqlAMS_MBR_SELECT",searchMap);
			
			request.put("amsMbr", amsMbr);		
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "myPage";
	}

	//---------------------------------------------------------------
	// [회원-mbr] 마이페이지
	//---------------------------------------------------------------
	public String myPageLang(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","L");
			map.put("LOGIN_USER",loginUserId);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			map.put("NAT_CD",strNatcd);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
				LabelUtil.setLanguage(strNatcd);
				sessionMember.setLang(strNatcd);
			}
			else {
				ret=msgOut;
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
	// 메시지 참여 리스트 목록
	//---------------------------------------------------------------
	public String msgDoList(){

		try{
			
			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			searchMap.put("HME_CLB_SQ", intClbsq);
			List<Map<String, Object>> amsExcList = commonService.selectList("Bbc.sqlATR_MSG_SELECT", searchMap);

			request.put("amsExcList", amsExcList);
			request.put("loginMbrSq", loginMbrSq);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "msgDoList";
	}


	//---------------------------------------------------------------
	// 메시지 참여하기
	//---------------------------------------------------------------
	public String msgJin(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_MSG_SELECT", searchMap);
			
			request.put("amsExcList", amsExcList);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_MSG_JIN_SELECT", searchMap);

			request.put("loginMbrSq", loginMbrSq);
			request.put("amsJinList", amsJinList);
			request.put("intExcsq", intExcsq);
			
			
			searchMap.clear();
			searchMap.put("JOP_TYPE", "R");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("CLB_JIN_ST", "JIN");
			searchMap.put("LANG", strLngdv);
			List<Map<String, Object>> amsClbMbr = commonService.selectList("Bbc.sqlAMS_CLB_MBR_SELECT",searchMap);
			
			String kewordData = "[";
			String comma = "";
			String strMbrnickname = "";
			for(int i = 0; i < amsClbMbr.size(); i++){
				kewordData = kewordData + comma + "{";
				String checkLoginId = amsClbMbr.get(i).get("MBR_SQ") + "";
				String checkLoginId2 = loginMbrSq+"";
				if (checkLoginId.equals(checkLoginId2)) {
					strMbrnickname = amsClbMbr.get(i).get("CLB_NIK_NM") + "";
				}
				
				kewordData = kewordData + "'name':'"+amsClbMbr.get(i).get("CLB_NIK_NM")+"',";
				kewordData = kewordData + "'bbc':'"+amsClbMbr.get(i).get("CLB_BBC")+"',";
				kewordData = kewordData + "'rank':'"+amsClbMbr.get(i).get("CLB_RANK")+"',";
				kewordData = kewordData + "'imgUrl':'"+amsClbMbr.get(i).get("MBR_MAI_IMG_PTH")+"',";
				kewordData = kewordData + "'keyword':'"+amsClbMbr.get(i).get("CLB_NIK_KEYWORD")+"',";
				kewordData = kewordData + "'id':'"+amsClbMbr.get(i).get("MBR_SQ")+"',";
				kewordData = kewordData + "'grade':'"+amsClbMbr.get(i).get("CLB_GD_NM")+"'";
				
				kewordData = kewordData + "}";
				comma = ",";
			}
			kewordData = kewordData + "]";

			request.put("strMbrnickname", strMbrnickname);
			request.put("kewordData", kewordData);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "msgJin";
	}


	//---------------------------------------------------------------
	// 메시지 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String msgJinRegSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("EXC_JIN_CMT",strExcjincmt);
			map.put("MBR_SQ",intMbrsq);
			map.put("EXC_JIN_TP",intExcjintp);
			map.put("EXC_JIN_DLY",intExcjindly);
			map.put("MSG_SQ",intMsgsq);
			
			List<Map<String, Object>> mapResult=commonService.selectList("Bbc.sqlATR_MSG_JIN_INSERT", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);

			if (strJobtype.equals("I")) {

				try{
					Map<String,Object> searchMap=new HashMap<String, Object>();
					searchMap.put("JOP_TYPE", "S");
					searchMap.put("LOGIN_USER", loginUserId);
					searchMap.put("EXC_SQ", intExcsq);
					searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
					searchMap.put("EXC_ATD_TP", strLngdv);
					searchMap.put("EXC_TP", "1001");
					
					Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_MSG_SELECT", searchMap);
					
					String openId = String.valueOf(amsExcList.get("OPENID"));

					if (!openId.isEmpty()) {
						
						String strDt = String.valueOf(amsExcList.get("EXC_DATE"));
						String strTpnm = String.valueOf(amsExcList.get("EXC_TP_NM"));
						String strNick = String.valueOf(amsExcList.get("NICKNAME"));
						
						
						String first = "신규 콕 신청 통지";
						String keyword2 = strDt + " [" + strTpnm + "]";
						String linkUrl = "/front/bbc/exc/msgJin.htm?intClbsq="+intClbsq+"&intExcsq="+intExcsq;
						
						String remark  = strNick + "님 [" + intExcjindly + "통 신청]";
					
				    	AppInfo appInfo = weixinService.selectAppInfoByShopId(sessionMember.getShopId());
				    	weixinTemplateMessageService.sendOrderNotPayMsg(appInfo,openId, first, "", keyword2, linkUrl, remark);
					}
			    	
				}catch(Exception e){
					//e.printStackTrace();
					logger.info("##### Exception==>" +  e.getMessage());
				}		
				
			}
			

			if (strJobtype.equals("U") && intExcjintp == 3 && "1001".equals(mapResult.get(0).get("EXC_TP"))) {

				try {
					
					Map<String,Object> searchMap=new HashMap<String, Object>();
					searchMap.put("JOP_TYPE", "A");
					searchMap.put("LOGIN_USER", loginUserId);
					searchMap.put("EXC_SQ", intMsgsq);
					searchMap.put("REG_MBR_SQ", intMbrsq);
					
					Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_MSG_SELECT", searchMap);

					String openId = String.valueOf(amsExcList.get("OPENID1"));
					String openId2 = String.valueOf(amsExcList.get("OPENID2"));

					String templateId = "roTAZQ0IBQmXwIUE2IebSH3haqCj6uhHiSLg_3DBUwA";	//成为会员通知
					
					String first = "구매하신 콕 배송이 완료 되었습니다.";
					String keyword1 = String.valueOf(amsExcList.get("DT"));
					String keyword2 = String.valueOf(amsExcList.get("EXC_JIN_DLY")) + " 통";
					String keyword3 = String.valueOf(amsExcList.get("DT"));
					String keyword4 = String.valueOf(amsExcList.get("CLB_NIK_NM"));
					String keyword5 = "담당자 : " + String.valueOf(amsExcList.get("NIK"));
					String remark = "배송에 문제가 있는 경우 담당자("+String.valueOf(amsExcList.get("NIK"))+")에게 연락 부탁드립니다.";
					
					Map<String, DataItem> data = new HashMap<String, DataItem>();
					data.put("first", new DataItem(first, RED_COLOR));
					data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
					data.put("keyword2", new DataItem(keyword2, BLUE_COLOR));
					data.put("keyword3", new DataItem(keyword3, BLUE_COLOR));
					data.put("keyword4", new DataItem(keyword4, DEFAUT_COLOR));
					data.put("keyword5", new DataItem(keyword5, DEFAUT_COLOR));
					data.put("remark", new DataItem(remark, BLUE_COLOR));					
					
					AppInfo appInfo = weixinService.selectAppInfoByShopId(68);
					try {
						weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openId, data, "");
						weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openId2, data, "");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}catch (Error e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}			
			
			return NONE;
			
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
	// 메시지 참여 삭제 - ajax
	//---------------------------------------------------------------
	public String msgDel(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","D");
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_SQ",intExcsq);
			map.put("MBR_SQ",sessionMember.getCustSysId());
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MSG_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
			else {
				ret=msgOut;
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}	
	

	//---------------------------------------------------------------
	// 메시지 참여 등록
	//---------------------------------------------------------------
	public String msgReg(){

		try{
			//--------- Main Logic
			
			String loginUserId = "";
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsClbList = commonService.selectList("Bbc.sqlAMS_CLB_SELECT", searchMap);
			
			request.put("amsClbList", amsClbList);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "msgReg";
	}

	//---------------------------------------------------------------
	// 메시지 참여 등록 - 저장 ajax
	//---------------------------------------------------------------
	public String msgRegSave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","I");
			map.put("LOGIN_USER",loginUserId);

			map.put("EXC_TP",strExctp);
			map.put("EXC_FR_DT",datExcfrdt);
			map.put("EXC_TO_FR",datExctofr);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("EXC_DCT",strExcdct);
			map.put("EXC_TIT",strExctit);
			map.put("HME_CLB_SQ",intClbsq);
			map.put("ATD_CNT",intAtdcnt);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MSG_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//---------------------------------------------------------------
	// 메시지 참여 등록 - 수정 ajax
	//---------------------------------------------------------------
	public String msgRegUpdate(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","U");
			map.put("LOGIN_USER",loginUserId);

			map.put("MSG_SQ",intMsgsq);
			map.put("EXC_SQ",intExcsq);
			map.put("EXC_TP",strExctp);
			map.put("EXC_FR_DT",datExcfrdt);
			map.put("EXC_TO_FR",datExctofr);
			map.put("REG_MBR_SQ",sessionMember.getCustSysId());
			map.put("EXC_DCT",strExcdct);
			map.put("EXC_TIT",strExctit);
			map.put("HME_CLB_SQ",intClbsq);
			map.put("ATD_CNT",intAtdcnt);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_MSG_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
	//---------------------------------------------------------------
	// 메시지 참여 수정
	//---------------------------------------------------------------
	public String msgView(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_MSG_SELECT", searchMap);
			
			request.put("amsExcList", amsExcList);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
//			searchMap.put("CLB_ST", "OPEN");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_MSG_JIN_SELECT", searchMap);

			request.put("loginMbrSq", loginMbrSq);
			request.put("amsJinList", amsJinList);
			request.put("intExcsq", intExcsq);
			
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "msgView";
	}	


	//---------------------------------------------------------------
	// 경기 자동 생성
	//---------------------------------------------------------------
	public String excAutoGame(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				// Error Page
				String errorMessageBbc = "권한이 없습니다.";
				request.put("errorMessageBbc", errorMessageBbc);
				return "noAuth";
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("EXC_ATD_TP", strLngdv);
			Map<String, Object> amsExcList = commonService.select("Bbc.sqlATR_EXC_SELECT", searchMap);
			request.put("amsExcList", amsExcList);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "A");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("EXC_SQ", intExcsq);
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);

			request.put("loginMbrSq", loginMbrSq);
			request.put("amsJinList", amsJinList);
			request.put("intExcsq", intExcsq);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "excAutoGame";
	}
	

	//---------------------------------------------------------------
	// 경기 자동 생성
	//---------------------------------------------------------------
	public String amsSelect(){

		try{

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("JOP_TYPE", strJobtype);
			searchMap.put("PARAMA", strExcFrtme1);
			searchMap.put("PARAMB", strExcFrtme2);
			searchMap.put("PARAMC", strExcFrtme3);
			searchMap.put("PARAMD", strExcFrtme4);
			searchMap.put("PARAME", strExcFrtme5);
			searchMap.put("PARAMF", strExcFrtme6);
			searchMap.put("PARAMG", strExcFrtme7);
			List<Map<String, Object>> amsSelect = commonService.selectList("Bbc.sqlAMS_SELECT", searchMap);
			request.put("amsSelect", amsSelect);

			request.put("strJobtype", strJobtype);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "amsSelect";
	}
	

	//---------------------------------------------------------------
	// [클럽-clb] Club 오늘의 경기 등록
	//---------------------------------------------------------------
	public String gameTodaySaveNew(){

		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			request.put("strLngdv", "ko-KR");
			renderJSON(mapResult);
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("LOGIN_USER",loginUserId);

			map.put("CLB_SQ",intClbsq);		// [경기] 클럽시퀀스
			map.put("MBR_SQ",sessionMember.getCustSysId());		// [경기] 회원시퀀스
			map.put("EXC_SQ",intExcsq);		// [경기] 운동 시퀀스
			
			map.put("CORT_CNT",intCortcnt);			//코트수
			map.put("PARTNER_BASIC_COIN",intPartnerbasiccoin);	//파트너찾기 기준 코인
			map.put("TEAM_BASIC_COIN",intTeambasiccoin);		//상대팀찾기 기준 코인
			map.put("MBR_MIN_GAME_CNT",intMbrmingamecnt);		//인당 최소 경기 수
			map.put("TEST_FLAG",0);					//1:테스트, 0:정상
			map.put("MBR_SQ_STR",strMbrsqstr);			//MBR_SQ
			map.put("MBR_GROUP_STR",strMbrgroupstr);		//그룹
			map.put("EXC_JIN_DLY_STR",strExcjindlystr);		//지각여부
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlATR_EXC_JIN_SELECT_GAME_NEW", map);
	    	renderJSON(mapResult);
			
		}catch(Exception e){
			e.printStackTrace();
			Map<String, Object> mapResult = new HashMap<String, Object>();
			mapResult.put("MSG_OUT","System Error.");
			renderJSON(mapResult);
		}

		return NONE;
	}		

	//---------------------------------------------------------------
	// 로그인
	//---------------------------------------------------------------
	public String bbcLogin(){

		try{
			request.put("strPtourl", strPtourl);
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "bbcLogin";
	}


	//---------------------------------------------------------------
	// 로그인
	//---------------------------------------------------------------
	public String userAddRequest(){

		String ret;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try{
			
			String accessToken = kakaoService.getAccessToken(code, "userAddRequest");
			Map<String,Object> userInfo = kakaoService.getUserInfo(accessToken);
	        logger.info(userInfo);
	        String email = userInfo.get("email").toString();
	        String thumbnail_image = userInfo.get("thumbnail_image").toString();
			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","KAKAO");
			map.put("MBR_ID",email);
			map.put("MBR_MAI_IMG_PTH",thumbnail_image);
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_MBR_INSERT", map);
	    	
			String msgOut = (String) mapResult.get("MSG_OUT");
			String strLnkactid = (String) mapResult.get("LNK_ACT_ID");
			
			if(msgOut.equals("S")){
				SessionMember sessionMember = getSessionMember();
				sessionMember = weixinUserService.getSessionMemberById(strLnkactid);
				sessionMember.setUserType("WEB");
				session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				logger.info("BBC0001: new sessionMember.. openid=" + strLnkactid);
				ret="success";
			}
			else {
				ret="addUserInfo";
			}

			request.put("strPtourl",strPtourl);
			request.put("thumbnail_image",thumbnail_image);
			request.put("email",email);
			request.put("ret",ret);
			
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
			request.put("strPtourl",strPtourl);
			request.put("ret",ret);
			return "userAddRequest";
		}
		return "userAddRequest";
	}
	//---------------------------------------------------------------
	// 신규 사용자 접수
	//---------------------------------------------------------------
	public String userAddSave(){

		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE",strJobtype);
			map.put("CLB_SQ",intClbsq);
			map.put("MBR_ID",strMbrid);
			map.put("MBR_NM",strMbrnm);
			map.put("MBR_WECHAT_NM",strLnkactid);
			map.put("MBR_CLB_NICK",strClbniknm);
			map.put("CMT",strMmo);
			map.put("MBR_SQ",intMbrsq);
			map.put("REQ_SQ",intNtesq);
			
			if (strMbrpw != null) {
				String strMbrpw_sha = EncryptUtils.sha256(strMbrpw);
				map.put("PASS",strMbrpw_sha);
			}
			map.put("PASS_ORG",strMbrpw);
			
			List<Map<String, Object>> mapResult=commonService.selectList("Bbc.sqlUSER_ADD_INSERT", map);

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);

			try {

				if ("I".equals(strJobtype)) {
					String openid = "orfEm0_ytIhHG9DajyYhD500MCtk";
					
					if (openid != null) {

						String templateId = "a1UF7jXxDgSuBtoAK4Kxthpqf8zkIeYyBPjwAHqCnvg";
						
						String first = strMbrnm + "님께서 웹 아이디 사용 신청을 하였습니다."+"\n";
						String keyword1 = strMbrid;
						String keyword2 = strMbrpw + " (비밀번호)";
						String keyword3 = strClbniknm;
						String remark = strMmo;
						
						Map<String, DataItem> data = new HashMap<String, DataItem>();
						data.put("first", new DataItem(first, DEFAUT_COLOR));
						data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
						data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
						data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
						data.put("remark", new DataItem(remark, DEFAUT_COLOR));					
						
						String linkUrl = "https://mp.weixin.qq.com/s/O9mXMQ5Z_fYxHpc1jvGbWA";
						
						AppInfo appInfo = weixinService.selectAppInfoByShopId(68);
						weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openid, data, linkUrl);
						
					}
				}
				
				if ("U".equals(strJobtype)) {
					String openid = strLnkactid;
					
					if (openid != null) {

						String templateId = "3I7uRXgeCnjTTd67eaqHCEoWoZ0ATSUVfn0k9-fNfDE";	//用车申请通知
						
						String first = "신청한 웹 아이디 승인이 되었습니다."+"\n";
						String keyword1 = strMbrid;
						String keyword2 = strMbrnm;
						String keyword3 = strMbrpw + " (비밀번호)";
						String keyword4 = datRegdt;
						String remark = "아래 URL 을 복사하시고 위챗이 아닌 일반 인터넷 어플에서 접속하세요." + "\n" + "\n" + "http://39.104.55.19/front/bbc/mbr/bbcLogin.htm";
						
						Map<String, DataItem> data = new HashMap<String, DataItem>();
						data.put("first", new DataItem(first, DEFAUT_COLOR));
						data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
						data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
						data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
						data.put("keyword4", new DataItem(keyword4, DEFAUT_COLOR));
						data.put("remark", new DataItem(remark, DEFAUT_COLOR));					
						
						String linkUrl = "https://mp.weixin.qq.com/s/O9mXMQ5Z_fYxHpc1jvGbWA";
						
						AppInfo appInfo = weixinService.selectAppInfoByShopId(68);
						weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openid, data, linkUrl);
						
					}
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return NONE;
	}
	//---------------------------------------------------------------
	// 로그인 체크
	//---------------------------------------------------------------
	public String bbcLoginCheck(){

		String ret = "fail";
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","C");
			map.put("MBR_ID",strMbrid);
			
//			strMbrpw = EncryptUtils.sha256(strMbrpw);
			
			map.put("MBR_PW",strMbrpw);		// [경기] 운동 시퀀스
						
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_MBR_INSERT", map);
	    	
			String msgOut = (String) mapResult.get("MSG_OUT");
			String strLnkactid = (String) mapResult.get("LNK_ACT_ID");
			
			if(msgOut.equals("S")){
				SessionMember sessionMember = getSessionMember();
				sessionMember = weixinUserService.getSessionMemberById(strLnkactid);
				sessionMember.setUserType("WEB");
				session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				logger.info("BBC0001: new sessionMember.. openid=" + strLnkactid);
				ret="success";
			}

			if(msgOut.equals("KAKAO_NOT_ASSGIN")){
				SessionMember sessionMember = getSessionMember();
				sessionMember = weixinUserService.getSessionMemberById(strLnkactid);
				sessionMember.setUserType("WEB");
				session.put(SessionUtils.SESSION_MEMEBER, sessionMember);
				logger.info("BBC0001: new sessionMember.. openid=" + strLnkactid);
				ret="KAKAO_NOT_ASSGIN";
			}
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);		
		
		return NONE;
	}

	//---------------------------------------------------------------
	// 로그인
	//---------------------------------------------------------------
	public String kakaoAssign(){

		try{

			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			String accessToken = kakaoService.getAccessToken(code, "kakaoAssign");

			logger.info("code ==> " + code);
			logger.info("accessToken ==> " + accessToken);
	        
			Map<String,Object> userInfo = kakaoService.getUserInfo(accessToken);
	        logger.info(userInfo);
	        String email = userInfo.get("email").toString();
	        String thumbnail_image = userInfo.get("thumbnail_image").toString();
			
			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			//searchMap.put("LANG", currLanguage);
			Map<String, Object> amsMbr = commonService.select("Bbc.sqlAMS_MBR_SELECT",searchMap);

			request.put("amsMbr", amsMbr);
			request.put("email", email);
			request.put("strPtourl", strPtourl);
			request.put("thumbnail_image", thumbnail_image);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "kakaoAssign";
	}

	//---------------------------------------------------------------
	// 로그인
	//---------------------------------------------------------------
	public String bbcLoginAssign(){

		try{

			String loginUserId = "";
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}
			
			currLanguage = strLngdv;

			Map<String,Object> searchMap=new HashMap<String, Object>();

			searchMap.put("JOP_TYPE", "S");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			//searchMap.put("LANG", currLanguage);
			Map<String, Object> amsMbr = commonService.select("Bbc.sqlAMS_MBR_SELECT",searchMap);
			
			request.put("amsMbr", amsMbr);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "bbcLoginAssign";
	}
	//---------------------------------------------------------------
	// 로그인 체크
	//---------------------------------------------------------------
	public String bbcLoginAssignSave(){

		String ret = "fail";
		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			intMbrsq = sessionMember.getCustSysId();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","A");
	 		map.put("LOGIN_USER", loginUserId);
	 		map.put("MBR_SQ", intMbrsq);
			map.put("MBR_ID",strMbrid);
			strMbrpw = EncryptUtils.sha256(strMbrpw);
			map.put("MBR_PW",strMbrpw);
						
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}	    	
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);		
		
		return NONE;
	}
	

	//---------------------------------------------------------------
	// [클럽-clb] Club 오늘의 경기 등록
	//---------------------------------------------------------------
	public String bbcBestAward(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();

//			System.out.println("amsClb");

			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			request.put("amsClb", amsClb);

//			System.out.println("atrMtcList");
			
			// 최다 경기상
			searchMap.clear();
			searchMap.put("JOP_TYPE", "BA");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", "GAME_CNT");
			List<Map<String, Object>> atrMtcList = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
			request.put("atrMtcList", atrMtcList);

//			System.out.println("atrMtcListB");

			// 최고 승률 평균 경기 이상
			searchMap.clear();
			searchMap.put("JOP_TYPE", "BB");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", "WIN_RATE");
			List<Map<String, Object>> atrMtcListB = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
			request.put("atrMtcListB", atrMtcListB);

//			System.out.println("atrMtcListC");

			// 최고 승률 100~499 경기  -> 진보 상세 데이터로 변경 (핸디별 획득 BBC)
			searchMap.clear();
			searchMap.put("JOP_TYPE", "BC");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", "WIN_RATE");
			List<Map<String, Object>> atrMtcListC = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
			request.put("atrMtcListC", atrMtcListC);

//			System.out.println("atrMtcListE");

			searchMap.clear();
			searchMap.put("JOP_TYPE", "B");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", 0);
			searchMap.put("LANG", currLanguage);
			List<Map<String, Object>> atrMtcListE = commonService.selectList("Bbc.sqlATR_MTC_SELECT_BEST",searchMap);
			request.put("atrMtcListE", atrMtcListE);

//			System.out.println("atrMtcListBG");

			// 연승 쿼리
			searchMap.clear();
			searchMap.put("JOP_TYPE", "BG");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MTC_SQ", intMtcsq);
			//searchMap.put("MBR_SQ", sessionMember.getCustSysId());
			searchMap.put("FR_DT", datFrdt);
			searchMap.put("TO_DT", datTodt);
			searchMap.put("LANG", currLanguage);
			searchMap.put("ORDERBY", "BBC");
			List<Map<String, Object>> atrMtcListBG = commonService.selectList("Bbc.sqlATR_MTC_SELECT_PERIOD",searchMap);
			request.put("atrMtcListBG", atrMtcListBG);

//			System.out.println("end");
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "bbcBestAward";
	}	
	


	//---------------------------------------------------------------
	// 나의 월간 현황
	//---------------------------------------------------------------
	public String clbMbrMonthly(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();


			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", intMbrsq);
			searchMap.put("LANG", currLanguage);
			searchMap.put("CTT_NM", datFrdt);
			
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			request.put("amsClb", amsClb);
			request.put("datFrdt", datFrdt);
			

			searchMap.clear();
			searchMap.put("JOP_TYPE", "D");
			searchMap.put("LOGIN_USER", currLanguage);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("REG_DT", datFrdt+"-01");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);
			
			request.put("amsJinList", amsJinList);		
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbMbrMonthly";
	}
	

	//---------------------------------------------------------------
	// 월간 참석자 조회
	//---------------------------------------------------------------
	public String clbAttendanceMonthly(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();


			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", intMbrsq);
			searchMap.put("LANG", currLanguage);
			searchMap.put("CTT_NM", datFrdt);
			
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
			request.put("amsClb", amsClb);
			request.put("datFrdt", datFrdt);

			searchMap.clear();
			searchMap.put("JOP_TYPE", "T");
			searchMap.put("LOGIN_USER", currLanguage);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("MBR_SQ", intMbrsq);
			searchMap.put("REG_DT", datFrdt+"-01");
			List<Map<String, Object>> amsJinList = commonService.selectList("Bbc.sqlATR_EXC_JIN_SELECT", searchMap);
			
			request.put("amsJinList", amsJinList);
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return "clbAttendanceMonthly";
	}
	

	//---------------------------------------------------------------
	// clbMbrMonthlyData
	//---------------------------------------------------------------
	public String clbMbrMonthlyData(){

		String ret = "fail";
		String loginUserId = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			intMbrsq = sessionMember.getCustSysId();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","A");
	 		map.put("LOGIN_USER", loginUserId);
	 		map.put("MBR_SQ", intMbrsq);
			map.put("MBR_ID",strMbrid);
			strMbrpw = EncryptUtils.sha256(strMbrpw);
			map.put("MBR_PW",strMbrpw);
						
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}	    	
			

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("mapResult", mapResult);
			renderJSON(returnMap);
			
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);		
		
		return NONE;
	}

	//---------------------------------------------------------------
	// getPage
	//---------------------------------------------------------------
	public String getPage(){

		try{

			String loginUserId = "";
			int loginMbrSq = 0;
			String currLanguage = LabelUtil.getCurrentLanguage();
			
			SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
			if (sessionMember == null) {
				loginUserId = "";
				loginMbrSq = 0;
				request.put("strLngdv", "ko-KR");
			}
			else {
				loginUserId = sessionMember.getOpenid();
				loginMbrSq = sessionMember.getCustSysId();
				strLngdv = sessionMember.getLang();
				request.put("strLngdv", strLngdv);
			}

			Map<String,Object> searchMap=new HashMap<String, Object>();


			searchMap.put("JOP_TYPE", "M");
			searchMap.put("LOGIN_USER", loginUserId);
			searchMap.put("CLB_SQ", intClbsq);
			searchMap.put("REG_MBR_SQ", loginMbrSq);
			searchMap.put("LANG", currLanguage);
			Map<String, Object> amsClb = commonService.select("Bbc.sqlAMS_CLB_SELECT",searchMap);
						
			request.put("amsClb", amsClb);
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

			searchMap.clear();
			searchMap.put("P1", para1);
			searchMap.put("P2", para2);
			searchMap.put("P3", para3);
			searchMap.put("P4", para4);
			searchMap.put("P5", para5);
			searchMap.put("P6", para6);
			searchMap.put("P7", para7);
			searchMap.put("P8", para8);
			searchMap.put("P9", para9);
			List<Map<String, Object>> pageData = commonService.selectList("Bbc.sqlAMS_COMMON_PROCEDURE", searchMap);
			
			request.put("pageData", pageData);		
			
		}
		catch(Exception e){
			// Error Page
			String errorMessageBbc = e.getMessage() ;
			request.put("errorMessageBbc", errorMessageBbc);
			return "noAuth";
		}
		return pageName;
	}
	
	public String translate() {

        TransApi api = new TransApi("20200326000406091", "d9anDSPWm9Rkm65hFSaI");
        
		String ret = "";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			para2 = "kor";
			para3 = "zh";
		}
		else {
			strLngdv = sessionMember.getLang();
			if ("zh-CN".equals(strLngdv)) {
				para2 = "kor";
				para3 = "zh";
			}
			else {
				para2 = "zh";
				para3 = "kor";
			}
		}
		
		try{

			if ("org".equals(para4)) {
				ret = api.getTransResult(para1, para2, para3);
			}
			else {
				ret = api.getTransResult(para1, para3, para2);
			}
			
			renderJSON(ret);
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
		}		
		
		return NONE;
	}

	//---------------------------------------------------------------
	// clbMbrMonthlyData
	//---------------------------------------------------------------
	public String getData(){

		String ret = "fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			intMbrsq = sessionMember.getCustSysId();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}

		try{

			Map<String,Object> searchMap=new HashMap<String, Object>();
			
			searchMap.put("P1", para1);
			searchMap.put("P2", para2);
			searchMap.put("P3", para3);
			searchMap.put("P4", para4);
			searchMap.put("P5", para5);
			searchMap.put("P6", para6);
			searchMap.put("P7", para7);
			searchMap.put("P8", para8);
			searchMap.put("P9", para9);
			List<Map<String, Object>> pageData = commonService.selectList("Bbc.sqlAMS_COMMON_PROCEDURE", searchMap);
			renderJSON(pageData);
			
	    	
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
		}		
		
		return NONE;
	}
	
	public String sendFee() {

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("P1", "SEND_FEE");
			searchMap.put("P2", 9);
			searchMap.put("P3", para3);
			searchMap.put("P4", para4);
			searchMap.put("P5", para5);
			searchMap.put("P6", para6);
			searchMap.put("P7", para7);
			searchMap.put("P8", para8);
			searchMap.put("P9", para9);
			List<Map<String, Object>> followUserList = commonService.selectList("Bbc.sqlAMS_COMMON_PROCEDURE", searchMap);
			
			try {
				for(int i = 0; i < followUserList.size(); i++){

					String templateId = "J78mI9jBFhnt09V9exTz-bls9tJgEN7LDmmP9Tyw7Fs";	//成为会员通知
					String openid = followUserList.get(i).get("OPENID").toString();
					
					String first = "※ 북경 배드민턴 클럽 회비 납부 공지 ※";
					String keyword1 = followUserList.get(i).get("CLB_NIK_NM").toString();
					String keyword2 = followUserList.get(i).get("MOBILE").toString();
					String keyword3 = followUserList.get(i).get("MBR_SQ").toString();
					String keyword4 = followUserList.get(i).get("MMO").toString();
					String keyword5 = followUserList.get(i).get("DT").toString();
					String remark = "\n" + "이 메시지를 클릭하시면 QR 코드로 연결됩니다." + "\n" + "QR 코드를 스캔하시고 친구 추가 후 재무님께 회비 납부 부탁드립니다~";
					
					Map<String, DataItem> data = new HashMap<String, DataItem>();
					data.put("first", new DataItem(first, RED_COLOR));
					data.put("keyword1", new DataItem(keyword1, BLUE_COLOR));
					data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
					data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
					data.put("keyword4", new DataItem(keyword4, DEFAUT_COLOR));
					data.put("keyword5", new DataItem(keyword5, DEFAUT_COLOR));
					data.put("remark", new DataItem(remark, BLUE_COLOR));					
					
					String linkUrl = "http://bbc.manhuaking.cn/images/FEEQR.jpg";
					
					AppInfo appInfo = weixinService.selectAppInfoByShopId(68);
					try {
						weixinTemplateMessageService.senMsgByMap(appInfo, templateId, openid, data, linkUrl);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}catch (Error e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", "SUCCESS");
			renderJSON(returnMap);
			
			return NONE;
			
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}

		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		return NONE;
	}
	

	public String clbExcJinGsave(){

		String loginUserId = "";
		String ret="fail";
		
		SessionMember sessionMember  = (SessionMember) session.get(SessionUtils.SESSION_MEMEBER);
		if (sessionMember == null) {
			ret="fail";
			request.put("strLngdv", "ko-KR");
			return NONE;
		}
		else {
			loginUserId = sessionMember.getOpenid();
			strLngdv = sessionMember.getLang();
			request.put("strLngdv", strLngdv);
		}
		
		try{

			Map<String,Object> map=new HashMap<String, Object>();
			
	 		map.put("JOP_TYPE","I");
			// map.put("LOGIN_USER",loginUserId);
			
			map.put("CLB_SQ",intClbsq);
			map.put("CLB_BBC",intClbbbc);
			map.put("CLB_NIK_NM",strClbniknm);
			map.put("LOGIN_USER",strExcjincmt);
			map.put("MBR_SQ",intExcsq);
			
			Map<String,Object> mapResult=commonService.select("Bbc.sqlAMS_CLB_MBR_INSERT", map);
			String msgOut = (String) mapResult.get("MSG_OUT");
			if(msgOut.equals("S")){
				ret="success";
			}
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ret", ret);
		renderJSON(returnMap);
		
		return NONE;
	}	

	public String oauth() {
		String ret;
		Map<String, Object> returnMap = new HashMap<String, Object>();
		try{
			returnMap.put("code",code);
			returnMap.put("error",error);
			returnMap.put("error_description",error_description);
			returnMap.put("state",state);
			ret="success";
			returnMap.put("ret",ret);
		}catch(Exception e){
			e.printStackTrace();
			ret="fail";
			returnMap.put("ret",ret);
			return "userAddRequest";
		}
		return "userAddRequest";
	}
	
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
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

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public int getIntAllclbrnk() {
		return intAllclbrnk;
	}

	public void setIntAllclbrnk(int intAllclbrnk) {
		this.intAllclbrnk = intAllclbrnk;
	}

	public int getIntAllloscnt() {
		return intAllloscnt;
	}

	public void setIntAllloscnt(int intAllloscnt) {
		this.intAllloscnt = intAllloscnt;
	}

	public int getIntAllrcvbbc() {
		return intAllrcvbbc;
	}

	public void setIntAllrcvbbc(int intAllrcvbbc) {
		this.intAllrcvbbc = intAllrcvbbc;
	}

	public int getIntAllwincnt() {
		return intAllwincnt;
	}

	public void setIntAllwincnt(int intAllwincnt) {
		this.intAllwincnt = intAllwincnt;
	}

	public int getIntAmt() {
		return intAmt;
	}

	public void setIntAmt(int intAmt) {
		this.intAmt = intAmt;
	}

	public int getIntAtemscr() {
		return intAtemscr;
	}

	public void setIntAtemscr(int intAtemscr) {
		this.intAtemscr = intAtemscr;
	}

	public int getIntAttdetno() {
		return intAttdetno;
	}

	public void setIntAttdetno(int intAttdetno) {
		this.intAttdetno = intAttdetno;
	}

	public int getIntAttsq() {
		return intAttsq;
	}

	public void setIntAttsq(int intAttsq) {
		this.intAttsq = intAttsq;
	}

	public int getIntAwyclbsq() {
		return intAwyclbsq;
	}

	public void setIntAwyclbsq(int intAwyclbsq) {
		this.intAwyclbsq = intAwyclbsq;
	}

	public int getIntBtemscr() {
		return intBtemscr;
	}

	public void setIntBtemscr(int intBtemscr) {
		this.intBtemscr = intBtemscr;
	}

	public int getIntBysetscr() {
		return intBysetscr;
	}

	public void setIntBysetscr(int intBysetscr) {
		this.intBysetscr = intBysetscr;
	}

	public int getIntCalhndcap() {
		return intCalhndcap;
	}

	public void setIntCalhndcap(int intCalhndcap) {
		this.intCalhndcap = intCalhndcap;
	}

	public String getIntClbbbc() {
		return intClbbbc;
	}

	public void setIntClbbbc(String intClbbbc) {
		this.intClbbbc = intClbbbc;
	}

	public int getIntClbbbdsq() {
		return intClbbbdsq;
	}

	public void setIntClbbbdsq(int intClbbbdsq) {
		this.intClbbbdsq = intClbbbdsq;
	}

	public int getIntClbcstiosq() {
		return intClbcstiosq;
	}

	public void setIntClbcstiosq(int intClbcstiosq) {
		this.intClbcstiosq = intClbcstiosq;
	}

	public int getIntClbjinreqsq() {
		return intClbjinreqsq;
	}

	public void setIntClbjinreqsq(int intClbjinreqsq) {
		this.intClbjinreqsq = intClbjinreqsq;
	}

	public int getIntClbrnk() {
		return intClbrnk;
	}

	public void setIntClbrnk(int intClbrnk) {
		this.intClbrnk = intClbrnk;
	}

	public int getIntClbsq() {
		return intClbsq;
	}

	public void setIntClbsq(int intClbsq) {
		this.intClbsq = intClbsq;
	}

	public int getIntCorcnt() {
		return intCorcnt;
	}

	public void setIntCorcnt(int intCorcnt) {
		this.intCorcnt = intCorcnt;
	}

	public int getIntCttmbrsq() {
		return intCttmbrsq;
	}

	public void setIntCttmbrsq(int intCttmbrsq) {
		this.intCttmbrsq = intCttmbrsq;
	}

	public int getIntExcsq() {
		return intExcsq;
	}

	public void setIntExcsq(int intExcsq) {
		this.intExcsq = intExcsq;
	}

	public int getIntHmeclbsq() {
		return intHmeclbsq;
	}

	public void setIntHmeclbsq(int intHmeclbsq) {
		this.intHmeclbsq = intHmeclbsq;
	}

	public String getIntJinclbbbc() {
		return intJinclbbbc;
	}

	public void setIntJinclbbbc(String intJinclbbbc) {
		this.intJinclbbbc = intJinclbbbc;
	}

	public int getIntJinreqmbrsq() {
		return intJinreqmbrsq;
	}

	public void setIntJinreqmbrsq(int intJinreqmbrsq) {
		this.intJinreqmbrsq = intJinreqmbrsq;
	}

	public int getIntLoscnt() {
		return intLoscnt;
	}

	public void setIntLoscnt(int intLoscnt) {
		this.intLoscnt = intLoscnt;
	}

	public int getIntLstclbjinreqsq() {
		return intLstclbjinreqsq;
	}

	public void setIntLstclbjinreqsq(int intLstclbjinreqsq) {
		this.intLstclbjinreqsq = intLstclbjinreqsq;
	}

	public int getIntLstmodmbrsq() {
		return intLstmodmbrsq;
	}

	public void setIntLstmodmbrsq(int intLstmodmbrsq) {
		this.intLstmodmbrsq = intLstmodmbrsq;
	}

	public int getIntMaxmbrcnt() {
		return intMaxmbrcnt;
	}

	public void setIntMaxmbrcnt(int intMaxmbrcnt) {
		this.intMaxmbrcnt = intMaxmbrcnt;
	}

	public int getIntMbrsq() {
		return intMbrsq;
	}

	public void setIntMbrsq(int intMbrsq) {
		this.intMbrsq = intMbrsq;
	}

	public int getIntMnulv() {
		return intMnulv;
	}

	public void setIntMnulv(int intMnulv) {
		this.intMnulv = intMnulv;
	}

	public int getIntMtcclbbbc() {
		return intMtcclbbbc;
	}

	public void setIntMtcclbbbc(int intMtcclbbbc) {
		this.intMtcclbbbc = intMtcclbbbc;
	}

	public int getIntMtcsetcnt() {
		return intMtcsetcnt;
	}

	public void setIntMtcsetcnt(int intMtcsetcnt) {
		this.intMtcsetcnt = intMtcsetcnt;
	}

	public int getIntMtcsq() {
		return intMtcsq;
	}

	public void setIntMtcsq(int intMtcsq) {
		this.intMtcsq = intMtcsq;
	}

	public int getIntNtesq() {
		return intNtesq;
	}

	public void setIntNtesq(int intNtesq) {
		this.intNtesq = intNtesq;
	}

	public int getIntPtoattsq() {
		return intPtoattsq;
	}

	public void setIntPtoattsq(int intPtoattsq) {
		this.intPtoattsq = intPtoattsq;
	}

	public int getIntRcmcnt() {
		return intRcmcnt;
	}

	public void setIntRcmcnt(int intRcmcnt) {
		this.intRcmcnt = intRcmcnt;
	}

	public int getIntRcvbbc() {
		return intRcvbbc;
	}

	public void setIntRcvbbc(int intRcvbbc) {
		this.intRcvbbc = intRcvbbc;
	}

	public int getIntRcvmbrsq() {
		return intRcvmbrsq;
	}

	public void setIntRcvmbrsq(int intRcvmbrsq) {
		this.intRcvmbrsq = intRcvmbrsq;
	}

	public int getIntRegmbrsq() {
		return intRegmbrsq;
	}

	public void setIntRegmbrsq(int intRegmbrsq) {
		this.intRegmbrsq = intRegmbrsq;
	}

	public int getIntRepno() {
		return intRepno;
	}

	public void setIntRepno(int intRepno) {
		this.intRepno = intRepno;
	}

	public int getIntRgnlv() {
		return intRgnlv;
	}

	public void setIntRgnlv(int intRgnlv) {
		this.intRgnlv = intRgnlv;
	}

	public int getIntRgnsq() {
		return intRgnsq;
	}

	public void setIntRgnsq(int intRgnsq) {
		this.intRgnsq = intRgnsq;
	}

	public int getIntRuldetno() {
		return intRuldetno;
	}

	public void setIntRuldetno(int intRuldetno) {
		this.intRuldetno = intRuldetno;
	}

	public int getIntScr() {
		return intScr;
	}

	public void setIntScr(int intScr) {
		this.intScr = intScr;
	}

	public int getIntSndmbrsq() {
		return intSndmbrsq;
	}

	public void setIntSndmbrsq(int intSndmbrsq) {
		this.intSndmbrsq = intSndmbrsq;
	}

	public int getIntSrtod() {
		return intSrtod;
	}

	public void setIntSrtod(int intSrtod) {
		this.intSrtod = intSrtod;
	}

	public int getIntStdsq() {
		return intStdsq;
	}

	public void setIntStdsq(int intStdsq) {
		this.intStdsq = intStdsq;
	}

	public int getIntTemplrno() {
		return intTemplrno;
	}

	public void setIntTemplrno(int intTemplrno) {
		this.intTemplrno = intTemplrno;
	}

	public int getIntUprepno() {
		return intUprepno;
	}

	public void setIntUprepno(int intUprepno) {
		this.intUprepno = intUprepno;
	}

	public int getIntUprgnid() {
		return intUprgnid;
	}

	public void setIntUprgnid(int intUprgnid) {
		this.intUprgnid = intUprgnid;
	}

	public int getIntWincnt() {
		return intWincnt;
	}

	public void setIntWincnt(int intWincnt) {
		this.intWincnt = intWincnt;
	}

	public int getIntYyclbrnk() {
		return intYyclbrnk;
	}

	public void setIntYyclbrnk(int intYyclbrnk) {
		this.intYyclbrnk = intYyclbrnk;
	}

	public int getIntYyloscnt() {
		return intYyloscnt;
	}

	public void setIntYyloscnt(int intYyloscnt) {
		this.intYyloscnt = intYyloscnt;
	}

	public int getIntYyrcvbbc() {
		return intYyrcvbbc;
	}

	public void setIntYyrcvbbc(int intYyrcvbbc) {
		this.intYyrcvbbc = intYyrcvbbc;
	}

	public int getIntYywincnt() {
		return intYywincnt;
	}

	public void setIntYywincnt(int intYywincnt) {
		this.intYywincnt = intYywincnt;
	}

	public String getDatClbjindt() {
		return datClbjindt;
	}

	public void setDatClbjindt(String datClbjindt) {
		this.datClbjindt = datClbjindt;
	}

	public String getDatEvtfrdt() {
		return datEvtfrdt;
	}

	public void setDatEvtfrdt(String datEvtfrdt) {
		this.datEvtfrdt = datEvtfrdt;
	}

	public String getDatEvttodt() {
		return datEvttodt;
	}

	public void setDatEvttodt(String datEvttodt) {
		this.datEvttodt = datEvttodt;
	}

	public String getDatExcfrdt() {
		return datExcfrdt;
	}

	public void setDatExcfrdt(String datExcfrdt) {
		this.datExcfrdt = datExcfrdt;
	}

	public String getDatExctofr() {
		return datExctofr;
	}

	public void setDatExctofr(String datExctofr) {
		this.datExctofr = datExctofr;
	}

	public String getDatJinapvdt() {
		return datJinapvdt;
	}

	public void setDatJinapvdt(String datJinapvdt) {
		this.datJinapvdt = datJinapvdt;
	}

	public String getDatJincnldt() {
		return datJincnldt;
	}

	public void setDatJincnldt(String datJincnldt) {
		this.datJincnldt = datJincnldt;
	}

	public String getDatJindt() {
		return datJindt;
	}

	public void setDatJindt(String datJindt) {
		this.datJindt = datJindt;
	}

	public String getDatJinrtndt() {
		return datJinrtndt;
	}

	public void setDatJinrtndt(String datJinrtndt) {
		this.datJinrtndt = datJinrtndt;
	}

	public String getDatLstmoddt() {
		return datLstmoddt;
	}

	public void setDatLstmoddt(String datLstmoddt) {
		this.datLstmoddt = datLstmoddt;
	}

	public String getDatMtcfrdt() {
		return datMtcfrdt;
	}

	public void setDatMtcfrdt(String datMtcfrdt) {
		this.datMtcfrdt = datMtcfrdt;
	}

	public String getDatMtctodt() {
		return datMtctodt;
	}

	public void setDatMtctodt(String datMtctodt) {
		this.datMtctodt = datMtctodt;
	}

	public String getDatRegdt() {
		return datRegdt;
	}

	public void setDatRegdt(String datRegdt) {
		this.datRegdt = datRegdt;
	}

	public String getDatReqdt() {
		return datReqdt;
	}

	public void setDatReqdt(String datReqdt) {
		this.datReqdt = datReqdt;
	}

	public String getStrAttcolnm() {
		return strAttcolnm;
	}

	public void setStrAttcolnm(String strAttcolnm) {
		this.strAttcolnm = strAttcolnm;
	}

	public String getStrAttfnm() {
		return strAttfnm;
	}

	public void setStrAttfnm(String strAttfnm) {
		this.strAttfnm = strAttfnm;
	}

	public String getStrAttpht() {
		return strAttpht;
	}

	public void setStrAttpht(String strAttpht) {
		this.strAttpht = strAttpht;
	}

	public String getStrAtttabnm() {
		return strAtttabnm;
	}

	public void setStrAtttabnm(String strAtttabnm) {
		this.strAtttabnm = strAtttabnm;
	}

	public String getStrAtttp() {
		return strAtttp;
	}

	public void setStrAtttp(String strAtttp) {
		this.strAtttp = strAtttp;
	}

	public String getStrBasymd() {
		return strBasymd;
	}

	public void setStrBasymd(String strBasymd) {
		this.strBasymd = strBasymd;
	}

	public String getStrBlgexcyn() {
		return strBlgexcyn;
	}

	public void setStrBlgexcyn(String strBlgexcyn) {
		this.strBlgexcyn = strBlgexcyn;
	}

	public String getStrBthymd() {
		return strBthymd;
	}

	public void setStrBthymd(String strBthymd) {
		this.strBthymd = strBthymd;
	}

	public String getStrChecte() {
		return strChecte;
	}

	public void setStrChecte(String strChecte) {
		this.strChecte = strChecte;
	}

	public String getStrChetemdv() {
		return strChetemdv;
	}

	public void setStrChetemdv(String strChetemdv) {
		this.strChetemdv = strChetemdv;
	}

	public String getStrClbbakimgfnm() {
		return strClbbakimgfnm;
	}

	public void setStrClbbakimgfnm(String strClbbakimgfnm) {
		this.strClbbakimgfnm = strClbbakimgfnm;
	}

	public String getStrClbbakimgpth() {
		return strClbbakimgpth;
	}

	public void setStrClbbakimgpth(String strClbbakimgpth) {
		this.strClbbakimgpth = strClbbakimgpth;
	}

	public String getStrClbbbdcte() {
		return strClbbbdcte;
	}

	public void setStrClbbbdcte(String strClbbbdcte) {
		this.strClbbbdcte = strClbbbdcte;
	}

	public String getStrClbbbdst() {
		return strClbbbdst;
	}

	public void setStrClbbbdst(String strClbbbdst) {
		this.strClbbbdst = strClbbbdst;
	}

	public String getStrClbbbdtit() {
		return strClbbbdtit;
	}

	public void setStrClbbbdtit(String strClbbbdtit) {
		this.strClbbbdtit = strClbbbdtit;
	}

	public String getStrClbbbdtp() {
		return strClbbbdtp;
	}

	public void setStrClbbbdtp(String strClbbbdtp) {
		this.strClbbbdtp = strClbbbdtp;
	}

	public String getStrClbcstcd() {
		return strClbcstcd;
	}

	public void setStrClbcstcd(String strClbcstcd) {
		this.strClbcstcd = strClbcstcd;
	}

	public String getStrClbcstiost() {
		return strClbcstiost;
	}

	public void setStrClbcstiost(String strClbcstiost) {
		this.strClbcstiost = strClbcstiost;
	}

	public String getStrClbgd() {
		return strClbgd;
	}

	public void setStrClbgd(String strClbgd) {
		this.strClbgd = strClbgd;
	}

	public String getStrClbitd() {
		return strClbitd;
	}

	public void setStrClbitd(String strClbitd) {
		this.strClbitd = strClbitd;
	}

	public String getStrClbjinreqst() {
		return strClbjinreqst;
	}

	public void setStrClbjinreqst(String strClbjinreqst) {
		this.strClbjinreqst = strClbjinreqst;
	}

	public String getStrClbjinst() {
		return strClbjinst;
	}

	public void setStrClbjinst(String strClbjinst) {
		this.strClbjinst = strClbjinst;
	}

	public String getStrClbmaiimgfnm() {
		return strClbmaiimgfnm;
	}

	public void setStrClbmaiimgfnm(String strClbmaiimgfnm) {
		this.strClbmaiimgfnm = strClbmaiimgfnm;
	}

	public String getStrClbmaiimgpth() {
		return strClbmaiimgpth;
	}

	public void setStrClbmaiimgpth(String strClbmaiimgpth) {
		this.strClbmaiimgpth = strClbmaiimgpth;
	}

	public String getStrClbniknm() {
		return strClbniknm;
	}

	public void setStrClbniknm(String strClbniknm) {
		this.strClbniknm = strClbniknm;
	}

	public String getStrClbnm() {
		return strClbnm;
	}

	public void setStrClbnm(String strClbnm) {
		this.strClbnm = strClbnm;
	}

	public String getStrClbst() {
		return strClbst;
	}

	public void setStrClbst(String strClbst) {
		this.strClbst = strClbst;
	}

	public String getStrComcd() {
		return strComcd;
	}

	public void setStrComcd(String strComcd) {
		this.strComcd = strComcd;
	}

	public String getStrComcddv() {
		return strComcddv;
	}

	public void setStrComcddv(String strComcddv) {
		this.strComcddv = strComcddv;
	}

	public String getStrComcddvdct() {
		return strComcddvdct;
	}

	public void setStrComcddvdct(String strComcddvdct) {
		this.strComcddvdct = strComcddvdct;
	}

	public String getStrComcddvnm() {
		return strComcddvnm;
	}

	public void setStrComcddvnm(String strComcddvnm) {
		this.strComcddvnm = strComcddvnm;
	}

	public String getStrComcdnm() {
		return strComcdnm;
	}

	public void setStrComcdnm(String strComcdnm) {
		this.strComcdnm = strComcdnm;
	}

	public String getStrCstiodv() {
		return strCstiodv;
	}

	public void setStrCstiodv(String strCstiodv) {
		this.strCstiodv = strCstiodv;
	}

	public String getStrCstioymd() {
		return strCstioymd;
	}

	public void setStrCstioymd(String strCstioymd) {
		this.strCstioymd = strCstioymd;
	}

	public String getStrCttemladr() {
		return strCttemladr;
	}

	public void setStrCttemladr(String strCttemladr) {
		this.strCttemladr = strCttemladr;
	}

	public String getStrCttnm() {
		return strCttnm;
	}

	public void setStrCttnm(String strCttnm) {
		this.strCttnm = strCttnm;
	}

	public String getStrCttphnno() {
		return strCttphnno;
	}

	public void setStrCttphnno(String strCttphnno) {
		this.strCttphnno = strCttphnno;
	}

	public String getStrDetadr() {
		return strDetadr;
	}

	public void setStrDetadr(String strDetadr) {
		this.strDetadr = strDetadr;
	}

	public String getStrEmladr() {
		return strEmladr;
	}

	public void setStrEmladr(String strEmladr) {
		this.strEmladr = strEmladr;
	}

	public String getStrEvtcte() {
		return strEvtcte;
	}

	public void setStrEvtcte(String strEvtcte) {
		this.strEvtcte = strEvtcte;
	}

	public String getStrEvthityn() {
		return strEvthityn;
	}

	public void setStrEvthityn(String strEvthityn) {
		this.strEvthityn = strEvthityn;
	}

	public String getStrEvtregyn() {
		return strEvtregyn;
	}

	public void setStrEvtregyn(String strEvtregyn) {
		this.strEvtregyn = strEvtregyn;
	}

	public String getStrEvtst() {
		return strEvtst;
	}

	public void setStrEvtst(String strEvtst) {
		this.strEvtst = strEvtst;
	}

	public String getStrExcatdtp() {
		return strExcatdtp;
	}

	public void setStrExcatdtp(String strExcatdtp) {
		this.strExcatdtp = strExcatdtp;
	}

	public String getStrExcdct() {
		return strExcdct;
	}

	public void setStrExcdct(String strExcdct) {
		this.strExcdct = strExcdct;
	}

	public String getStrExcjincmt() {
		return strExcjincmt;
	}

	public void setStrExcjincmt(String strExcjincmt) {
		this.strExcjincmt = strExcjincmt;
	}

	public String getStrExctit() {
		return strExctit;
	}

	public void setStrExctit(String strExctit) {
		this.strExctit = strExctit;
	}

	public String getStrExctmedct() {
		return strExctmedct;
	}

	public void setStrExctmedct(String strExctmedct) {
		this.strExctmedct = strExctmedct;
	}

	public String getStrExctp() {
		return strExctp;
	}

	public void setStrExctp(String strExctp) {
		this.strExctp = strExctp;
	}

	public String getStrGnddv() {
		return strGnddv;
	}

	public void setStrGnddv(String strGnddv) {
		this.strGnddv = strGnddv;
	}

	public String getStrGpslat() {
		return strGpslat;
	}

	public void setStrGpslat(String strGpslat) {
		this.strGpslat = strGpslat;
	}

	public String getStrGpslot() {
		return strGpslot;
	}

	public void setStrGpslot(String strGpslot) {
		this.strGpslot = strGpslot;
	}

	public String getStrJinapvmmo() {
		return strJinapvmmo;
	}

	public void setStrJinapvmmo(String strJinapvmmo) {
		this.strJinapvmmo = strJinapvmmo;
	}

	public String getStrJincnlmmo() {
		return strJincnlmmo;
	}

	public void setStrJincnlmmo(String strJincnlmmo) {
		this.strJincnlmmo = strJincnlmmo;
	}

	public String getStrJingrttxt() {
		return strJingrttxt;
	}

	public void setStrJingrttxt(String strJingrttxt) {
		this.strJingrttxt = strJingrttxt;
	}

	public String getStrJinrtnmmo() {
		return strJinrtnmmo;
	}

	public void setStrJinrtnmmo(String strJinrtnmmo) {
		this.strJinrtnmmo = strJinrtnmmo;
	}

	public String getStrLngdv() {
		return strLngdv;
	}

	public void setStrLngdv(String strLngdv) {
		this.strLngdv = strLngdv;
	}

	public String getStrLnkactdv() {
		return strLnkactdv;
	}

	public void setStrLnkactdv(String strLnkactdv) {
		this.strLnkactdv = strLnkactdv;
	}

	public String getStrLnkactid() {
		return strLnkactid;
	}

	public void setStrLnkactid(String strLnkactid) {
		this.strLnkactid = strLnkactid;
	}

	public String getStrMblno() {
		return strMblno;
	}

	public void setStrMblno(String strMblno) {
		this.strMblno = strMblno;
	}

	public String getStrMbrbakimgfnm() {
		return strMbrbakimgfnm;
	}

	public void setStrMbrbakimgfnm(String strMbrbakimgfnm) {
		this.strMbrbakimgfnm = strMbrbakimgfnm;
	}

	public String getStrMbrbakimgpth() {
		return strMbrbakimgpth;
	}

	public void setStrMbrbakimgpth(String strMbrbakimgpth) {
		this.strMbrbakimgpth = strMbrbakimgpth;
	}

	public String getStrMbrgrttxt() {
		return strMbrgrttxt;
	}

	public void setStrMbrgrttxt(String strMbrgrttxt) {
		this.strMbrgrttxt = strMbrgrttxt;
	}

	public String getStrMbrid() {
		return strMbrid;
	}

	public void setStrMbrid(String strMbrid) {
		this.strMbrid = strMbrid;
	}

	public String getStrMbrmaiimgfnm() {
		return strMbrmaiimgfnm;
	}

	public void setStrMbrmaiimgfnm(String strMbrmaiimgfnm) {
		this.strMbrmaiimgfnm = strMbrmaiimgfnm;
	}

	public String getStrMbrmaiimgpth() {
		return strMbrmaiimgpth;
	}

	public void setStrMbrmaiimgpth(String strMbrmaiimgpth) {
		this.strMbrmaiimgpth = strMbrmaiimgpth;
	}

	public String getStrMbrnm() {
		return strMbrnm;
	}

	public void setStrMbrnm(String strMbrnm) {
		this.strMbrnm = strMbrnm;
	}

	public String getStrMbrpw() {
		return strMbrpw;
	}

	public void setStrMbrpw(String strMbrpw) {
		this.strMbrpw = strMbrpw;
	}

	public String getStrMbrst() {
		return strMbrst;
	}

	public void setStrMbrst(String strMbrst) {
		this.strMbrst = strMbrst;
	}

	public String getStrMmo() {
		return strMmo;
	}

	public void setStrMmo(String strMmo) {
		this.strMmo = strMmo;
	}

	public String getStrMnuid() {
		return strMnuid;
	}

	public void setStrMnuid(String strMnuid) {
		this.strMnuid = strMnuid;
	}

	public String getStrMnunm() {
		return strMnunm;
	}

	public void setStrMnunm(String strMnunm) {
		this.strMnunm = strMnunm;
	}

	public String getStrMsgdct() {
		return strMsgdct;
	}

	public void setStrMsgdct(String strMsgdct) {
		this.strMsgdct = strMsgdct;
	}

	public String getStrMsgid() {
		return strMsgid;
	}

	public void setStrMsgid(String strMsgid) {
		this.strMsgid = strMsgid;
	}

	public String getStrMsgtp() {
		return strMsgtp;
	}

	public void setStrMsgtp(String strMsgtp) {
		this.strMsgtp = strMsgtp;
	}

	public String getStrMsgtxt() {
		return strMsgtxt;
	}

	public void setStrMsgtxt(String strMsgtxt) {
		this.strMsgtxt = strMsgtxt;
	}

	public String getStrMtctemdv() {
		return strMtctemdv;
	}

	public void setStrMtctemdv(String strMtctemdv) {
		this.strMtctemdv = strMtctemdv;
	}

	public String getStrMtctp() {
		return strMtctp;
	}

	public void setStrMtctp(String strMtctp) {
		this.strMtctp = strMtctp;
	}

	public String getStrNatcd() {
		return strNatcd;
	}

	public void setStrNatcd(String strNatcd) {
		this.strNatcd = strNatcd;
	}

	public String getStrNtectt() {
		return strNtectt;
	}

	public void setStrNtectt(String strNtectt) {
		this.strNtectt = strNtectt;
	}

	public String getStrNtercvst() {
		return strNtercvst;
	}

	public void setStrNtercvst(String strNtercvst) {
		this.strNtercvst = strNtercvst;
	}

	public String getStrNtesndst() {
		return strNtesndst;
	}

	public void setStrNtesndst(String strNtesndst) {
		this.strNtesndst = strNtesndst;
	}

	public String getStrPubclbyn() {
		return strPubclbyn;
	}

	public void setStrPubclbyn(String strPubclbyn) {
		this.strPubclbyn = strPubclbyn;
	}

	public String getStrRepcte() {
		return strRepcte;
	}

	public void setStrRepcte(String strRepcte) {
		this.strRepcte = strRepcte;
	}

	public String getStrRgndv() {
		return strRgndv;
	}

	public void setStrRgndv(String strRgndv) {
		this.strRgndv = strRgndv;
	}

	public String getStrRgnnm() {
		return strRgnnm;
	}

	public void setStrRgnnm(String strRgnnm) {
		this.strRgnnm = strRgnnm;
	}

	public String getStrRuldct() {
		return strRuldct;
	}

	public void setStrRuldct(String strRuldct) {
		this.strRuldct = strRuldct;
	}

	public String getStrRultit() {
		return strRultit;
	}

	public void setStrRultit(String strRultit) {
		this.strRultit = strRultit;
	}

	public String getStrStdnm() {
		return strStdnm;
	}

	public void setStrStdnm(String strStdnm) {
		this.strStdnm = strStdnm;
	}

	public String getStrUpmnuid() {
		return strUpmnuid;
	}

	public void setStrUpmnuid(String strUpmnuid) {
		this.strUpmnuid = strUpmnuid;
	}

	public String getStrUseyn() {
		return strUseyn;
	}

	public void setStrUseyn(String strUseyn) {
		this.strUseyn = strUseyn;
	}

	public String getStrVtctemdv() {
		return strVtctemdv;
	}

	public void setStrVtctemdv(String strVtctemdv) {
		this.strVtctemdv = strVtctemdv;
	}

	public String getStrVtrdv() {
		return strVtrdv;
	}

	public void setStrVtrdv(String strVtrdv) {
		this.strVtrdv = strVtrdv;
	}

	public String getStrZipcd() {
		return strZipcd;
	}

	public void setStrZipcd(String strZipcd) {
		this.strZipcd = strZipcd;
	}

	public int getIntAtdcnt() {
		return intAtdcnt;
	}

	public void setIntAtdcnt(int intAtdcnt) {
		this.intAtdcnt = intAtdcnt;
	}

	public String getStrJobtype() {
		return strJobtype;
	}

	public void setStrJobtype(String strJobtype) {
		this.strJobtype = strJobtype;
	}
	
	public int getIntMbrcnt() {
		return intMbrcnt;
	}

	public void setIntMbrcnt(int intMbrcnt) {
		this.intMbrcnt = intMbrcnt;
	}

	public String getStrCorcnt() {
		return strCorcnt;
	}

	public void setStrCorcnt(String strCorcnt) {
		this.strCorcnt = strCorcnt;
	}

	public String getStrAtdadr() {
		return strAtdadr;
	}

	public void setStrAtdadr(String strAtdadr) {
		this.strAtdadr = strAtdadr;
	}

	public String getStrAtdadrcd() {
		return strAtdadrcd;
	}

	public void setStrAtdadrcd(String strAtdadrcd) {
		this.strAtdadrcd = strAtdadrcd;
	}

	public String getStrAtdadrdtl() {
		return strAtdadrdtl;
	}

	public void setStrAtdadrdtl(String strAtdadrdtl) {
		this.strAtdadrdtl = strAtdadrdtl;
	}

	public String getStrBmtgd() {
		return strBmtgd;
	}

	public void setStrBmtgd(String strBmtgd) {
		this.strBmtgd = strBmtgd;
	}

	public String getStrAgeyy() {
		return strAgeyy;
	}

	public void setStrAgeyy(String strAgeyy) {
		this.strAgeyy = strAgeyy;
	}
	
	public int getIntMbrsqa1() {
		return intMbrsqa1;
	}

	public void setIntMbrsqa1(int intMbrsqa1) {
		this.intMbrsqa1 = intMbrsqa1;
	}

	public String getIntMtcclbbbca1() {
		return intMtcclbbbca1;
	}

	public void setIntMtcclbbbca1(String intMtcclbbbca1) {
		this.intMtcclbbbca1 = intMtcclbbbca1;
	}

	public int getIntMbrsqa2() {
		return intMbrsqa2;
	}

	public void setIntMbrsqa2(int intMbrsqa2) {
		this.intMbrsqa2 = intMbrsqa2;
	}

	public String getIntMtcclbbbca2() {
		return intMtcclbbbca2;
	}

	public void setIntMtcclbbbca2(String intMtcclbbbca2) {
		this.intMtcclbbbca2 = intMtcclbbbca2;
	}

	public int getIntMbrsqb1() {
		return intMbrsqb1;
	}

	public void setIntMbrsqb1(int intMbrsqb1) {
		this.intMbrsqb1 = intMbrsqb1;
	}

	public String getIntMtcclbbbcb1() {
		return intMtcclbbbcb1;
	}

	public void setIntMtcclbbbcb1(String intMtcclbbbcb1) {
		this.intMtcclbbbcb1 = intMtcclbbbcb1;
	}

	public int getIntMbrsqb2() {
		return intMbrsqb2;
	}

	public void setIntMbrsqb2(int intMbrsqb2) {
		this.intMbrsqb2 = intMbrsqb2;
	}

	public String getIntMtcclbbbcb2() {
		return intMtcclbbbcb2;
	}

	public void setIntMtcclbbbcb2(String intMtcclbbbcb2) {
		this.intMtcclbbbcb2 = intMtcclbbbcb2;
	}

	public String getDatFrdt() {
		return datFrdt;
	}

	public void setDatFrdt(String datFrdt) {
		this.datFrdt = datFrdt;
	}

	public String getDatTodt() {
		return datTodt;
	}

	public void setDatTodt(String datTodt) {
		this.datTodt = datTodt;
	}

	public String getStrOrderby() {
		return strOrderby;
	}

	public void setStrOrderby(String strOrderby) {
		this.strOrderby = strOrderby;
	}

	public int getMagazineGroupId() {
		return magazineGroupId;
	}

	public void setMagazineGroupId(int magazineGroupId) {
		this.magazineGroupId = magazineGroupId;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getReturnPageName() {
		return returnPageName;
	}

	public void setReturnPageName(String returnPageName) {
		this.returnPageName = returnPageName;
	}

	public String getStrMbrnma1() {
		return strMbrnma1;
	}

	public void setStrMbrnma1(String strMbrnma1) {
		this.strMbrnma1 = strMbrnma1;
	}

	public String getStrMbrnma2() {
		return strMbrnma2;
	}

	public void setStrMbrnma2(String strMbrnma2) {
		this.strMbrnma2 = strMbrnma2;
	}

	public String getStrMbrnmb1() {
		return strMbrnmb1;
	}

	public void setStrMbrnmb1(String strMbrnmb1) {
		this.strMbrnmb1 = strMbrnmb1;
	}

	public String getStrMbrnmb2() {
		return strMbrnmb2;
	}

	public void setStrMbrnmb2(String strMbrnmb2) {
		this.strMbrnmb2 = strMbrnmb2;
	}

	public String getStrYwday() {
		return strYwday;
	}

	public void setStrYwday(String strYwday) {
		this.strYwday = strYwday;
	}

	public String getStrExcTit4() {
		return strExcTit4;
	}

	public void setStrExcTit4(String strExcTit4) {
		this.strExcTit4 = strExcTit4;
	}

	public String getStrExcTit1() {
		return strExcTit1;
	}

	public void setStrExcTit1(String strExcTit1) {
		this.strExcTit1 = strExcTit1;
	}

	public String getStrExcTit2() {
		return strExcTit2;
	}

	public void setStrExcTit2(String strExcTit2) {
		this.strExcTit2 = strExcTit2;
	}

	public String getStrExcTit3() {
		return strExcTit3;
	}

	public void setStrExcTit3(String strExcTit3) {
		this.strExcTit3 = strExcTit3;
	}

	public String getStrExcTit5() {
		return strExcTit5;
	}

	public void setStrExcTit5(String strExcTit5) {
		this.strExcTit5 = strExcTit5;
	}

	public String getStrExcTit6() {
		return strExcTit6;
	}

	public void setStrExcTit6(String strExcTit6) {
		this.strExcTit6 = strExcTit6;
	}

	public String getStrExcTit7() {
		return strExcTit7;
	}

	public void setStrExcTit7(String strExcTit7) {
		this.strExcTit7 = strExcTit7;
	}

	public String getStrExcFrtme1() {
		return strExcFrtme1;
	}

	public void setStrExcFrtme1(String strExcFrtme1) {
		this.strExcFrtme1 = strExcFrtme1;
	}

	public String getStrExcFrtme2() {
		return strExcFrtme2;
	}

	public void setStrExcFrtme2(String strExcFrtme2) {
		this.strExcFrtme2 = strExcFrtme2;
	}

	public String getStrExcFrtme3() {
		return strExcFrtme3;
	}

	public void setStrExcFrtme3(String strExcFrtme3) {
		this.strExcFrtme3 = strExcFrtme3;
	}

	public String getStrExcFrtme4() {
		return strExcFrtme4;
	}

	public void setStrExcFrtme4(String strExcFrtme4) {
		this.strExcFrtme4 = strExcFrtme4;
	}

	public String getStrExcFrtme5() {
		return strExcFrtme5;
	}

	public void setStrExcFrtme5(String strExcFrtme5) {
		this.strExcFrtme5 = strExcFrtme5;
	}

	public String getStrExcFrtme6() {
		return strExcFrtme6;
	}

	public void setStrExcFrtme6(String strExcFrtme6) {
		this.strExcFrtme6 = strExcFrtme6;
	}

	public String getStrExcFrtme7() {
		return strExcFrtme7;
	}

	public void setStrExcFrtme7(String strExcFrtme7) {
		this.strExcFrtme7 = strExcFrtme7;
	}

	public String getStrExcTotme1() {
		return strExcTotme1;
	}

	public void setStrExcTotme1(String strExcTotme1) {
		this.strExcTotme1 = strExcTotme1;
	}

	public String getStrExcTotme2() {
		return strExcTotme2;
	}

	public void setStrExcTotme2(String strExcTotme2) {
		this.strExcTotme2 = strExcTotme2;
	}

	public String getStrExcTotme3() {
		return strExcTotme3;
	}

	public void setStrExcTotme3(String strExcTotme3) {
		this.strExcTotme3 = strExcTotme3;
	}

	public String getStrExcTotme4() {
		return strExcTotme4;
	}

	public void setStrExcTotme4(String strExcTotme4) {
		this.strExcTotme4 = strExcTotme4;
	}

	public String getStrExcTotme5() {
		return strExcTotme5;
	}

	public void setStrExcTotme5(String strExcTotme5) {
		this.strExcTotme5 = strExcTotme5;
	}

	public String getStrExcTotme6() {
		return strExcTotme6;
	}

	public void setStrExcTotme6(String strExcTotme6) {
		this.strExcTotme6 = strExcTotme6;
	}

	public String getStrExcTotme7() {
		return strExcTotme7;
	}

	public void setStrExcTotme7(String strExcTotme7) {
		this.strExcTotme7 = strExcTotme7;
	}

	public int getIntExcjintp() {
		return intExcjintp;
	}

	public void setIntExcjintp(int intExcjintp) {
		this.intExcjintp = intExcjintp;
	}

	public int getIntExcjindly() {
		return intExcjindly;
	}

	public void setIntExcjindly(int intExcjindly) {
		this.intExcjindly = intExcjindly;
	}

	public String getStrPtourl() {
		return strPtourl;
	}

	public void setStrPtourl(String strPtourl) {
		this.strPtourl = strPtourl;
	}

	public String getStrHmenm() {
		return strHmenm;
	}

	public void setStrHmenm(String strHmenm) {
		this.strHmenm = strHmenm;
	}

	public String getStrAwynm() {
		return strAwynm;
	}

	public void setStrAwynm(String strAwynm) {
		this.strAwynm = strAwynm;
	}
	
	public int getIntCarmbrsq() {
		return intCarmbrsq;
	}

	public void setIntCarmbrsq(int intCarmbrsq) {
		this.intCarmbrsq = intCarmbrsq;
	}

	public String getStrCaryn() {
		return strCaryn;
	}

	public void setStrCaryn(String strCaryn) {
		this.strCaryn = strCaryn;
	}

	public int getIntCortcnt() {
		return intCortcnt;
	}

	public void setIntCortcnt(int intCortcnt) {
		this.intCortcnt = intCortcnt;
	}

	public int getIntPartnerbasiccoin() {
		return intPartnerbasiccoin;
	}

	public void setIntPartnerbasiccoin(int intPartnerbasiccoin) {
		this.intPartnerbasiccoin = intPartnerbasiccoin;
	}

	public int getIntTeambasiccoin() {
		return intTeambasiccoin;
	}

	public void setIntTeambasiccoin(int intTeambasiccoin) {
		this.intTeambasiccoin = intTeambasiccoin;
	}

	public int getIntMbrmingamecnt() {
		return intMbrmingamecnt;
	}

	public void setIntMbrmingamecnt(int intMbrmingamecnt) {
		this.intMbrmingamecnt = intMbrmingamecnt;
	}

	public String getStrMbrsqstr() {
		return strMbrsqstr;
	}

	public void setStrMbrsqstr(String strMbrsqstr) {
		this.strMbrsqstr = strMbrsqstr;
	}

	public String getStrMbrgroupstr() {
		return strMbrgroupstr;
	}

	public void setStrMbrgroupstr(String strMbrgroupstr) {
		this.strMbrgroupstr = strMbrgroupstr;
	}

	public String getStrExcjindlystr() {
		return strExcjindlystr;
	}

	public void setStrExcjindlystr(String strExcjindlystr) {
		this.strExcjindlystr = strExcjindlystr;
	}

	public String getStrExcdct1() {
		return strExcdct1;
	}

	public void setStrExcdct1(String strExcdct1) {
		this.strExcdct1 = strExcdct1;
	}

	public String getStrExcdct2() {
		return strExcdct2;
	}

	public void setStrExcdct2(String strExcdct2) {
		this.strExcdct2 = strExcdct2;
	}

	public String getStrExcdct3() {
		return strExcdct3;
	}

	public void setStrExcdct3(String strExcdct3) {
		this.strExcdct3 = strExcdct3;
	}

	public String getStrExcdct4() {
		return strExcdct4;
	}

	public void setStrExcdct4(String strExcdct4) {
		this.strExcdct4 = strExcdct4;
	}

	public String getStrExcdct5() {
		return strExcdct5;
	}

	public void setStrExcdct5(String strExcdct5) {
		this.strExcdct5 = strExcdct5;
	}

	public String getStrExcdct6() {
		return strExcdct6;
	}

	public void setStrExcdct6(String strExcdct6) {
		this.strExcdct6 = strExcdct6;
	}

	public String getStrExcdct7() {
		return strExcdct7;
	}

	public void setStrExcdct7(String strExcdct7) {
		this.strExcdct7 = strExcdct7;
	}

	public String getStrExctp1() {
		return strExctp1;
	}

	public void setStrExctp1(String strExctp1) {
		this.strExctp1 = strExctp1;
	}

	public String getStrExctp2() {
		return strExctp2;
	}

	public void setStrExctp2(String strExctp2) {
		this.strExctp2 = strExctp2;
	}

	public String getStrExctp3() {
		return strExctp3;
	}

	public void setStrExctp3(String strExctp3) {
		this.strExctp3 = strExctp3;
	}

	public String getStrExctp4() {
		return strExctp4;
	}

	public void setStrExctp4(String strExctp4) {
		this.strExctp4 = strExctp4;
	}

	public String getStrExctp5() {
		return strExctp5;
	}

	public void setStrExctp5(String strExctp5) {
		this.strExctp5 = strExctp5;
	}

	public String getStrExctp6() {
		return strExctp6;
	}

	public void setStrExctp6(String strExctp6) {
		this.strExctp6 = strExctp6;
	}

	public String getStrExctp7() {
		return strExctp7;
	}

	public void setStrExctp7(String strExctp7) {
		this.strExctp7 = strExctp7;
	}

	public int getIntMsgsq() {
		return intMsgsq;
	}

	public void setIntMsgsq(int intMsgsq) {
		this.intMsgsq = intMsgsq;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getPara1() {
		return para1;
	}

	public void setPara1(String para1) {
		this.para1 = para1;
	}

	public String getPara2() {
		return para2;
	}

	public void setPara2(String para2) {
		this.para2 = para2;
	}

	public String getPara3() {
		return para3;
	}

	public void setPara3(String para3) {
		this.para3 = para3;
	}

	public String getPara4() {
		return para4;
	}

	public void setPara4(String para4) {
		this.para4 = para4;
	}

	public String getPara5() {
		return para5;
	}

	public void setPara5(String para5) {
		this.para5 = para5;
	}

	public String getPara6() {
		return para6;
	}

	public void setPara6(String para6) {
		this.para6 = para6;
	}

	public String getPara7() {
		return para7;
	}

	public void setPara7(String para7) {
		this.para7 = para7;
	}

	public String getPara8() {
		return para8;
	}

	public void setPara8(String para8) {
		this.para8 = para8;
	}

	public String getPara9() {
		return para9;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getError_description() {
		return error_description;
	}

	public void setError_description(String error_description) {
		this.error_description = error_description;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setPara9(String para9) {
		this.para9 = para9;
	}

	public File getImageFile() {
		return imageFile;
	}

	public void setImageFile(File imageFile) {
		this.imageFile = imageFile;
	}	

}
