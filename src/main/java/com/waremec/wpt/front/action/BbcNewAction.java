package com.waremec.wpt.front.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.action.WeixinBaseAction;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.service.KakaoService;
import com.waremec.wpt.front.service.BbcService;

@Controller("bbcNewAction")
@Scope(ScopeType.prototype)
public class BbcNewAction extends WeixinBaseAction {
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
	private int intClbbbc;	  // [클럽회원] 현재BB코인
	private int intClbbbdsq;	  // [클럽게시판댓글] 클럽게시판시퀀스
	private int intClbcstiosq;	  // [클럽비용출금] 클럽비용입출금시퀀스
	private int intClbjinreqsq;	  // [클럽가입신청] 가입신청시퀀스
	private int intClbrnk;	  // [회원별랭킹집계] 기준일클럽랭크
	private int intClbsq;	  // [클럽회칙] 클럽시퀀스
	private int intCorcnt;	  // [경기장] 코트수
	private int intCttmbrsq;	  // [클럽] 쪽지수신클럽회원시퀀스
	private int intExcsq;	  // [운동참석자] 운동시퀀스
	private int intHmeclbsq;	  // [운동] 클럽시퀀스
	private int intJinclbbbc;	  // [클럽회원] 최초부여BB코인
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
	
	@Resource
	protected BbcService bbcService;
	
	@Resource
	protected KakaoService kakaoService;

	//---------------------------------------------------------------
	// [클럽-clb] Club 나의 정보 수정
	//---------------------------------------------------------------
	public String updateMbrInfo(){

		try{

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
				
		 		map.put("JOP_TYPE","K");
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
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return NONE;
	}

	//---------------------------------------------------------------
	// [클럽-clb] Club 나의 정보 수정
	//---------------------------------------------------------------
	public String abcdefg(){

		try{

			String ret="fail";
			
			Map<String, Object> returnMap = new HashMap<String, Object>();
			returnMap.put("ret", ret);
			renderJSON(returnMap);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return NONE;
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

	public int getIntClbbbc() {
		return intClbbbc;
	}

	public void setIntClbbbc(int intClbbbc) {
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

	public int getIntJinclbbbc() {
		return intJinclbbbc;
	}

	public void setIntJinclbbbc(int intJinclbbbc) {
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
	
}
