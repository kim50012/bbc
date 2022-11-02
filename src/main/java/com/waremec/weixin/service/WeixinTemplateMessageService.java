/**   
、 * @Title: WeixinTemplateMessageService.java 
 * @Package com.waremec.weixin.service 
 * @Description:  
 * @author taebem
 * @date 2015年5月11日 下午10:26:08 
 * @version V1.0   
 */
package com.waremec.weixin.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.weixin.cons.TemplateMessageAdvice;
import com.waremec.weixin.dao.WeixinTemplateMessageDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.template.DataItem;
import com.waremec.weixin.domain.template.TemplateMessageHistory;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.WeixinTemplateUtils;

/**
 * @Package com.waremec.weixin.service
 * @FileName WeixinTemplateMessageService
 * @Description
 * @author taebem
 * @date 2015年5月11日 下午10:26:08
 * 
 */
@Service
public class WeixinTemplateMessageService extends CommonServiceImpl{

	private final transient Log logger = LogFactory.getLog(this.getClass());

	@Resource
	private WeixinService weixinService;

	@Resource
	private WeixinTemplateMessageDao weixinTemplateMessageDao;
	@Resource
	private WeixinTemplateMessageService weixinTemplateMessageService;

	private static final String DEFAUT_COLOR = "#173177";
	
	/** 
	*获得模板ID
	* @param appInfo 公众账号信息
	* @param advice 模板消息
	* @return 模板ID
	*/
	public String getTemplateIdByShortId(AppInfo appInfo, TemplateMessageAdvice advice) {
		
		String shortId = advice.getId();

		String templateId = weixinTemplateMessageDao.getTemplateIdByShortId(appInfo, shortId);

		if (StringUtils.isEmpty(templateId)) {

			String accessToken = weixinService.getAccessToken(appInfo);

			templateId = WeixinTemplateUtils.getTemplateId(accessToken, shortId);

			weixinTemplateMessageDao.saveTemplate(appInfo, shortId, templateId);
		}

		return templateId;
	}


	/** 
	*메시지 전송
	* @return
	*/
	public Long senMsgByMap(AppInfo appInfo, String templateId, String openid, Map<String, DataItem> data, String linkUrl) {
		
		String token = weixinService.getAccessToken(appInfo);
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, linkUrl);
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		return messageId;
	}
	

	/** 
	*회원가입통지
	 * @param appInfo 公众账号信息
	 * @param openid openid
	* @param first first
	* @param keyword1 닉네임
	* @param keyword2 일자
	* @param remark 가입소개내용
	* @return
	*/
	public Long sendNewReviewMsg(AppInfo appInfo, String openid, String first, String keyword1, String keyword2, String keyword3, String linkUrl, String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.TEMP_MSG_05;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);

		//String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, linkUrl);
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	/** 
	*회원가입통지
	 * @param appInfo 公众账号信息
	 * @param openid openid
	* @param first first
	* @param keyword1 닉네임
	* @param keyword2 일자
	* @param remark 가입소개내용
	* @return
	*/
	public Long sendNewUserMsg(AppInfo appInfo, String openid, String first, String keyword1, String linkUrl, String remark) {
		
		
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem((new SimpleDateFormat("yyyy-M-d HH:mm")).format(new Date()), DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);

		//String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, linkUrl);
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}

	/** 
	*회원가입통지
	 * @param appInfo 公众账号信息
	 * @param openid openid
	* @param first first
	* @param keyword1 닉네임
	* @param keyword2 일자
	* @param remark 가입소개내용
	* @return
	*/
	public Long sendResultGameMsg(AppInfo appInfo, String openid, String first, String keyword1, String linkUrl, String keyword3, String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.GAME_RESULT_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, "#df1414"));
		data.put("keyword2", new DataItem((new SimpleDateFormat("yyyy-M-d HH:mm")).format(new Date()), DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, "#2714df"));
		
		String token = weixinService.getAccessToken(appInfo);

		//String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, linkUrl);
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}

	/** 
	*콕신청 통지
	 * @param appInfo 公众账号信息
	 * @param openid openid
	* @param first first
	* @param keyword1 시간
	* @param keyword2 오더번호
	* @param remark 내용(주문내용)
	* @return
	*/
	public Long sendOrderNotPayMsg(AppInfo appInfo, String openid, String first, String keyword1, String keyword2, String linkUrl, String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.ORDER_NOT_PAY_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, "#2714df"));
		data.put("keyword1", new DataItem((new SimpleDateFormat("yyyy-M-d HH:mm")).format(new Date()), DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, "#2714df"));
		
		String token = weixinService.getAccessToken(appInfo);

		//String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, linkUrl);
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}

	/** 
	* 顾客等级变化通知
	* @param appInfo 公众账号信息
	* @param openid openid
	* @param keyword1 会员等级
	* @param keyword2 成功交易次数
	* @param keyword3 累计消费金额
	* @return Long 消息id
	*/
	public Long sendCustLevelChangeNotice(AppInfo appInfo, String openid, String keyword1, String keyword2, String keyword3) {

		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;

		String templateId = getTemplateIdByShortId(appInfo, advice);

		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(advice.getFirst(), DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("remark", new DataItem(advice.getRemark(), DEFAUT_COLOR));

		String token = weixinService.getAccessToken(appInfo);

		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);

		logger.info("msgId=====" + messageId);

		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);

		return messageId;
	}
	
	/** 
	* 积分变化通知
	* @param appInfo 公众账号信息
	* @param openid openid
	* @param keyword1 奖励积分
	* @param keyword2 消费积分
	* @param keyword3 剩余积分
	* @return Long 消息id
	*/
	public Long sendMileageChangeNotice(AppInfo appInfo, String openid, String keyword1, String keyword2, String keyword3) {
 
		
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;

		String templateId = getTemplateIdByShortId(appInfo, advice);

		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(advice.getFirst(), DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("keyword4", new DataItem((new SimpleDateFormat("yyyy年M月d日 HH:mm")).format(new Date()), DEFAUT_COLOR));
		data.put("remark", new DataItem(advice.getRemark(), DEFAUT_COLOR));

		String token = weixinService.getAccessToken(appInfo);

		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);

		logger.info("msgId=====" + messageId);

		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);

		return messageId;
	}
	/** 
	 * 红包领取提醒
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first first
	 * @param keyword1 昵称
	 * @param keyword2 领到
	 * @param keyword3 留言
	 * @param remark remark
	 * @return Long 消息id
	 */
	public Long sendRedPackNotice(AppInfo appInfo, String openid, String first, String keyword1, String keyword2, String keyword3,String remark) {
		
		
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("keyword4", new DataItem((new SimpleDateFormat("yyyy年M月d日 HH:mm")).format(new Date()), DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	public Long sendRedPackNotice(AppInfo appInfo, String openid, String first, String keyword1, String keyword2, String keyword3,String keyword4,String remark) {
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("keyword4", new DataItem(keyword4, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}

	/** 
	*优惠券到期提醒
	 * @param appInfo 公众账号信息
	 * @param openid openid
	* @param title first
	* @param theme 主题
	* @param code 券代号
	* @param startDate 有效期 -start
	* @param endDate 有效期 - end
	* @param remark beizhu
	* @return
	*/
	public Long sendVoucherMaturityRemind(AppInfo appInfo, String openid, String title, String theme, String code, Date startDate, Date endDate, String remark) {
		
		
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.M.d");
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(title, DEFAUT_COLOR));
		data.put("theme", new DataItem(theme, DEFAUT_COLOR));
		data.put("code", new DataItem(code, DEFAUT_COLOR));
		data.put("date", new DataItem(sdf.format(startDate) + "~" + sdf.format(endDate), DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	
	/** 
	* 报名结果通知
	* @param appInfo 公众账号信息
	* @param openid openid
	* @param lectId lectId 演讲ID
	* @param entryId entryId  申请ID
	* @param courseName --项目名称
	* @param time --时间
	* @param address --地点
	* @param limit - 人数
	* @return
	*/
	public Long sendCourseApplyResultNotice(AppInfo appInfo, String openid,Integer lectId, Integer entryId, String courseName, Date time, String address,Integer limit) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		String title  = "感谢您报名参加演讲，我们将对人员进行甄选后另行通知结果，请关注微信，轻松查询申请结果。";
		
		String remark = "人数：" + limit
				      +"\n\n"
				      + "点击【详情】即可查看详细申请记录，\n"
				      + "关注讲师可留言，答疑解惑 。";
		
		SimpleDateFormat sdf = new SimpleDateFormat("M月d日 HH:mm");
		String loctDate = sdf.format(time) + "(" + DateUtil.getWeekOfDate(time) + ")";
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(title, DEFAUT_COLOR));
		data.put("@#!!#@class", new DataItem(courseName, DEFAUT_COLOR));
		data.put("time", new DataItem(loctDate, DEFAUT_COLOR));
		data.put("add", new DataItem(address, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
//		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		String targetUrl = "/front/human/applyMessage/entryDetail.htm?shopId=" + appInfo.getShopId() + "&lectId=" + lectId + "&entryId=" + entryId;
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, targetUrl);
		
		
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId; 
	}
	
	
	/** 
	 * 活动报名成功通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param lectId lectId  演讲ID
	 * @param entryId entryId  申请ID
	 * @param courseName --活动名称
	 * @param time --活动时间
	 * @param address --活动地点
	 * @param limit - 人数
	 * @return
	 */
	public Long sendCourseApprovedNotice(AppInfo appInfo, String openid,Integer lectId, Integer entryId,String courseName, Date time, String address,Integer limit) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		String title  = "恭喜您！\n成功获得参加讲座机会。\n请准时参加，如有变动请及时联系我们。";
		
		String remark = "人数：" + limit
				+"\n\n"
				+ "点击【详情】即可查看详细申请记录，\n"
				+ "关注讲师可留言，答疑解惑 。";
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("M月d日 HH:mm");
		String loctDate = sdf.format(time) + "(" + DateUtil.getWeekOfDate(time) + ")";
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(title, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(courseName, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(loctDate, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(address, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
//		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		String targetUrl = "/front/human/applyMessage/entryDetail.htm?shopId=" + appInfo.getShopId() + "&lectId=" + lectId + "&entryId=" + entryId;
		String url = Oauth2Utils.getAdviceLinkUrl(appInfo, targetUrl);
		
		
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	/** 
	 * 活动报名成功通知 - 倒数通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param countDownDate --倒数时间
	 * @param courseName --活动名称
	 * @param time --活动时间
	 * @param address --活动地点
	 * @param limit - 人数
	 * @return
	 */
	public Long sendCourseCountDownRemind(AppInfo appInfo,  String openid,String countDownDate, String courseName, Date time, String address,Integer limit) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		String title  = "离开讲还有" + countDownDate + "\n请提前安排好时间，准时出席参加哦！";
		
		String remark = "人数：" + limit
				+"\n\n"
				+ "如有变动请务必及时联系我们。";
		
		SimpleDateFormat sdf = new SimpleDateFormat("M月d日 HH:mm");
		String loctDate = sdf.format(time) + "(" + DateUtil.getWeekOfDate(time) + ")";
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(title, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(courseName, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(loctDate, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(address, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	/** 
	 * 公告发布通知 
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param keyword1 发布者
	 * @param keyword2 公告标题
	 * @param remark remark
	 * @return
	 */
	public Long sendNoticePublish(AppInfo appInfo,  String openid,String first, String keyword1, String keyword2,String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	/** 
	 * 任务完成通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param keyword1 礼物名称
	 * @param keyword2 领取时间
	 * @param remark remark
	 * @return
	 */
	public Long sendTaskCompletedAdvice(AppInfo appInfo,  String openid,String first, String keyword1, String keyword2,String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	/** 
	 * 新会员加入提醒
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param keyword1 会员昵称
	 * @param keyword2 会员ID
	 * @param keyword3 关注时间
	 * @param remark remark
	 * @return
	 */
	public Long sendNewMemberJoinRemind(AppInfo appInfo,String openid,String first, String keyword1, String keyword2,String keyword3,String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	/** 
	 * 购买成功通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param product 商品名称
	 * @param price 商品价格
	 * @param time 购买时间
	 * @param remark remark
	 * @return
	 */
	public Long sendPurchaseSuccessNotice(AppInfo appInfo,String openid,String first, String product, String price,String time,String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("product", new DataItem(product, DEFAUT_COLOR));
		data.put("price", new DataItem(price, DEFAUT_COLOR));
		data.put("time", new DataItem(time, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	/** 
	 * 绑定会员通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param keyword1 会员号
	 * @param keyword2 时间
	 * @param remark remark
	 * @return
	 */
	public Long sendMemberBindingNotice(AppInfo appInfo,String openid,String first, String keyword1, String keyword2,String keyword3, String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);//"Nj4xoRKJ_Hm248pONhDQPYM6_TFse4X_LGTBGs1SOjQ";
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		//data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	/** 
	 * 活动结束通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param keyword1 活动名称
	 * @param keyword2参与人数
	 * @param keyword2结束时间
	 * @param remark remark
	 * @return
	 */
	public Long sendEventFinishedNotice(AppInfo appInfo,String openid,String first, String keyword1, String keyword2,String keyword3, String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("keyword3", new DataItem(keyword3, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	
	
	
	
	/** 
	 * 中奖结果通知
	 * @param appInfo 公众账号信息
	 * @param openid openid
	 * @param first 标题
	 * @param keyword1 活动
	 * @param keyword2 奖品
	 * @param remark remark
	 * @return
	 */
	public Long sendWinningResultNotice(AppInfo appInfo,String openid,String first, String keyword1, String keyword2, String remark) {
		
		TemplateMessageAdvice advice = TemplateMessageAdvice.NEW_USER_MSG;
		
		String templateId = getTemplateIdByShortId(appInfo, advice);
		
		Map<String, DataItem> data = new HashMap<String, DataItem>();
		data.put("first", new DataItem(first, DEFAUT_COLOR));
		data.put("keyword1", new DataItem(keyword1, DEFAUT_COLOR));
		data.put("keyword2", new DataItem(keyword2, DEFAUT_COLOR));
		data.put("remark", new DataItem(remark, DEFAUT_COLOR));
		
		String token = weixinService.getAccessToken(appInfo);
		
		String url = null;//Oauth2Utils.getAdviceLinkUrl(appInfo, advice.getUrl());
		Long messageId = WeixinTemplateUtils.sendTemplateMessage(token, openid, templateId, url, data);
		
		logger.info("msgId=====" + messageId);
		
		saveSendTemplateMessageHistory(appInfo, advice, openid, messageId, data);
		
		return messageId;
	}
	
	
	
	
 
	/** 
	* 保存模板消息发送记录
	* @param appInfo 公众账号信息
	* @param advice 模板消息
	* @param openid openid
	* @param messageId 消息Id
	* @param data POST数据
	*/
	public void saveSendTemplateMessageHistory(AppInfo appInfo, TemplateMessageAdvice advice, String openid, Long messageId, Map<String, DataItem> data) {
		TemplateMessageHistory history = new TemplateMessageHistory(appInfo.getShopId(), advice, openid, messageId);
		history.setContent(JSONObject.fromObject(data).toString());
		
		weixinTemplateMessageDao.insertSendTemplateMessageHistory(history);
	}
	
	/** 
	* 更新客户收到模板消息的状态
	* @param messageId 消息id
	* @param status 发送状态
	*/
	public void updateSendStatus(Long messageId, String status) {
		weixinTemplateMessageDao.updateSendStatus(messageId, status);
	}
	
	
	private static void sendZhongjiangTemp(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");

		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
		Long messageId = null;
		System.out.println("*****************中奖消息通知*******************");
		List<String> list = new ArrayList<String>();
		//1等奖
//		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA");
		
		String first = "一起去韩国旅行吧! 中奖名单公布、恭喜您中奖了! 夺得本活动";
		String remark1 = "第一等奖 (大韩航空韩国往返机票)";
		String remark2 = "2015.10.13-2015.12.31";
		String remark = "请您在10月30日之前将姓名, 电话以及收货地址发送至新世界免税店微信(ssgdutyfree)逾期将视为自动放弃奖品.\n"
					  + "十分感谢您的积极参与\n"
					  + "新世界免税店全体恭贺\n"
					+ "本条消息为最后一次通知\n";
		
		for (String openid : list) {
			System.err.print("openid==" + openid);
//			messageId = weixinTemplateMessageService.sendTaskCompletedAdvice(appInfo, openid,first,remark1,remark2,remark );  
//	  		weixinTemplateMessageService.updateSendStatus(messageId, "success");
		}
		
		
		list.clear();
		//2等奖
		list.add("oGKUAwQu9jkCx9-JaokMTTFiT0Sk");
		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA");
		
		remark1 = "第二等奖 (韩国化妆品 “后”)";
		
		for (String openid : list) {
			System.err.print("openid==" + openid);
			messageId = weixinTemplateMessageService.sendTaskCompletedAdvice(appInfo, openid,first,remark1,remark2,remark );  
			weixinTemplateMessageService.updateSendStatus(messageId, "success");
		}
		list.clear();
		//3等奖
		list.add("oGKUAwa0-asLzrLoyht0hnW7_CHI");
		list.add("oGKUAwa16vPtgqJfRs-Lp24E0PQ0");
		list.add("oGKUAwa1-SKNVa_pSfh9qOtihjS0");
		list.add("oGKUAwa36QYvdOC6jqBWCYZatYmM");
		list.add("oGKUAwa3YD2L7ofvD0PbyPh4kBHw");
		list.add("oGKUAwa4wH7QJ2a-zl5YwJu91TWo");
		list.add("oGKUAwa5rtkB8yOsmhntuoxDvyX0");
		list.add("oGKUAwa5xZDOQTlIbM0BU2E97f5I");
		list.add("oGKUAwbLHqYqVoSdmI1QYVgEHqKw");
		list.add("oGKUAwa81sbzW0A0SXkTKqwCCAT8");
		list.add("oGKUAwab0D8mHmYHpVKNo58uvt2s");
		list.add("oGKUAwaDaVzL44-a9EWIjvfQtZFw");
		list.add("oGKUAwaDC6xN_Z9aKMAjf3G65eJU");
		list.add("oGKUAwaEO9WDBGj4Kp0QfFVnQxro");
		list.add("oGKUAwaFfbtlg3hK4DAp91CuqvyQ");
		list.add("oGKUAwaG4_shfG08JbJ3BP1XDTg0");
		list.add("oGKUAwaHefz0C6MpcVWb3zl4lF9c");
		list.add("oGKUAwaHo0tZ-eerRgZptogK36ZM");
		list.add("oGKUAwaiOY--gzrGX12Y1_0mzhug");
		list.add("oGKUAwajGQOIYyZcYs_6YKiF2eqs");
		list.add("oGKUAwaLGwnWInzDltbGtV5abZKo");
		list.add("oGKUAwalQyn_pvtZI-ydtxrk9G4k");
		list.add("oGKUAwaNLmheZYfxOBF6_WSUTKdo");
		list.add("oGKUAwaptzlhbyOZhD5ryoIqkNsQ");
		list.add("oGKUAwaq5JbyQb308up9UbRpLelI");
		list.add("oGKUAwaQGWR4aOB4BDc9sM9U4GWo");
		list.add("oGKUAwaryG_wrwNPpy1tQWSmOIkU");
		list.add("oGKUAwauDcoGc_H5kvlNgKbmT9Ak");
		list.add("oGKUAwaw1-dOslyVz1nXFqaOCnpc");
		list.add("oGKUAway4HwPy9zjDYOqK2vFw3Q4");
		list.add("oGKUAwaYkHhN5CJayEFauDSFdz0Q");
		list.add("oGKUAwaYZPP5n9TuYs4IUBWNB9mY");
		list.add("oGKUAwb-1R-eeAsdbPAkwD0dvsNg");
		list.add("oGKUAwb2Do44dMCj-hIvV6UrrihI");
		list.add("oGKUAwb3pnh2Yk2HbC9Y51K-ek_w");
		list.add("oGKUAwb9QOb4CS7Cxp_IGX4-61NE");
		list.add("oGKUAwbAXmrv0z6NYxiUhySBmXDE");
		list.add("oGKUAwbAZN-mfKr0zTXJxC46ifw4");
		list.add("oGKUAwbDaFunU7gAMQecPAzY_WYI");
		list.add("oGKUAwbfCWiWDAOUf_k7Rf3_dVS0");
		list.add("oGKUAwb-gBgXqeNH3X6RA0OR7IE4");
		list.add("oGKUAwbGcJxv-MI4OWeQmRjAs_i8");
		list.add("oGKUAwbi-l-H5cCmhoCOgNMfMO_4");
		list.add("oGKUAwbkMHEoKqvMinfag9qH2Y2Y");


		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA");
		
		remark1 = "第三等奖 (手机充值卡(30元))";
		
		for (String openid : list) {
			System.err.print("openid==" + openid);
			try {
				messageId = weixinTemplateMessageService.sendTaskCompletedAdvice(appInfo, openid,first,remark1,remark2,remark );  
				weixinTemplateMessageService.updateSendStatus(messageId, "success");
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		System.out.println("********************************************************");
	}
	
	
	private static void tempHumanApplaySuccess(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");

		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(19);
		Long messageId = null;
		System.out.println("*****************申请成功通知*******************");
		List<String> list = new ArrayList<String>();
		
//		list.add("o-DlmxBOC7OxvC59b681E_VotxEs");
//		list.add("o-DlmxEtTi3F9LODq6_9k8del5oA");
//		list.add("o-DlmxCYwLKEUW_KQUkYw_1HLDm8");
//		list.add("o-DlmxH1MnxXJ6plhIxD4lS2AEl8");
//		list.add("o-DlmxJcIeSyErFEjzglkZrWUqi0");
//		list.add("o-DlmxB8jJf0cnf2RQXG0bQI8Ldk");
//		list.add("o-DlmxLbhPu99iQv1ZJOeqM2CD28");
//		list.add("o-DlmxN3tHYxIIVhd1eZExe3io5E");
//		list.add("o-DlmxLeqPhZ9TMSs4VDur3c63UE");
//		list.add("o-DlmxEkH6LEiY4IMRcKLUrih3D4");
//		list.add("o-DlmxOvO8OZeNplyNm3t9l2ERXQ");
//		list.add("o-DlmxBlhp6ZI8khYaRnrCGuIeug");
//		list.add("o-DlmxAev-X19CbpOfYUbbGnzn3s");
//		list.add("o-DlmxC03W3CkXe0lM9oNqZrQ2fQ");
//		list.add("o-DlmxKowGUs5hurrxbuyXay_DIo");
//		list.add("o-DlmxGxvMejYk9_aVRRY_v2erz4");
//		list.add("o-DlmxHQ1TS08-PWcdO9SiZ_YZjo");
//		list.add("o-DlmxEwQzVPBFo8uEYGVsKVUYao");
//		list.add("o-DlmxDPifDKcA7r7Eg8ohRhLIK8");
//		list.add("o-DlmxOe0XQ8ilduW1a-v_fNsNHk");
//		list.add("o-DlmxABsF7nxc8Qjd4zlz9JQAwQ");
//		list.add("o-DlmxN5_HXSv4A1C5vXf5i9trEw");
//		list.add("o-DlmxFLBPTSJ5cFy-KzvDAmV5AU");
//		list.add("o-DlmxLKlb0BWRenLMAHnTQQvCfU");
//		list.add("o-DlmxJ7mremodLiri6r6E1Vf6Q4");
//		list.add("o-DlmxMqc5lnJQaFXO7rm7fYuWOQ");
		list.add("o-DlmxJOkWF5A2_p3ooPetsZw-0Y");
		list.add("o-DlmxDNjgx1f6rnjWyoe_IIfVO4");
		list.add("o-DlmxHtDRcdp5kM_a6oyGjj09iI");
		list.add("o-DlmxLDmSaM9u8J4QP2kzD3_BQo");
		list.add("o-DlmxFvsFvnTd4aflcCTYaSiRzg");
		list.add("o-DlmxJEuKgBZNFYik7q9aSHyjoI");
		list.add("o-DlmxDUbO-2fykcQ-lGw3P1_iX4");
		list.add("o-DlmxHTQLXujlcApd2_txOsauxU");
		list.add("o-DlmxHVaTXv3Yzjclk2ZQRT3Oms");
		list.add("o-DlmxEmhdGnNV_kC1SUZ0FqB8Bo");
		list.add("o-DlmxEHTJ9sQgAQRLUZwQ88WYD4");
		list.add("o-DlmxH8QH49zHRVUwOpElNDv41E");
		list.add("o-DlmxLocy2lytou8FRzyX290atk");
		list.add("o-DlmxB9Rd8wVYfCbnK41QznMvOE");
		list.add("o-DlmxI9tIDecRyy5oH2lMZMSJl4");
		list.add("o-DlmxNgC5AqzFZO82_dEP5mIyLo");
		list.add("o-DlmxDm4hJH36M_tE82NKvwQYoA");
		list.add("o-DlmxNKWcOubwFeq3GbBaZn-5_8");
		list.add("o-DlmxH_8Fvc7hqqXcZOLZW0lBzQ");
		list.add("o-DlmxKF8jn399ptKKsVOJdQ_qKo");
		list.add("o-DlmxHSOSQ9anmOMbPm4EujyuOk");
		list.add("o-DlmxIhYPwUdgeZGEX9RGIPPdLY");
		list.add("o-DlmxHHx1TCcZWnTLvdzj6InO3k");
		list.add("o-DlmxH_oJ3V3rVclIEFiktog54g");
		list.add("o-DlmxIm9gMz4hvClO7vKrGHoU1c");
		list.add("o-DlmxHR19JESuExf79EipqWU25g");
		list.add("o-DlmxHXmw5Go4LYm0ZJHns4qq9I");
		list.add("o-DlmxL2fJ6UKcO3laR_Lpg5qpN0");
		list.add("o-DlmxPHoxEjliqBeaDKyBn-YTpY");
		list.add("o-DlmxLZaApwVp02WvlVDEecpz3w");
		list.add("o-DlmxL3OCbvoNSA-pCcIQVMXuSw");
		list.add("o-DlmxNn28oIze81XcFYvHnddBz4");
		list.add("o-DlmxH-EiEFH1uLT_yoAbmxEWFM");
		list.add("o-DlmxBIcKaa7uZr4B3BqVl6afls");
		list.add("o-DlmxLg9D6rcLwHho50d0WtKTJw");
		list.add("o-DlmxKIKB7cQl9eH2E8J7HS0WCM");
		list.add("o-DlmxMgKPkDiE7h3mEjoFxVRvZM");
		list.add("o-DlmxBlRM2IiQNUmjC_JtTeZ2tQ");
		list.add("o-DlmxOP4r-rMG7j4DAd_Xe_Z2j8");
		list.add("o-DlmxEhCxtsHP-L4wnQiFGeJLRw");
		list.add("o-DlmxMBKLfsSx6JfMICOufYv3nw");
		list.add("o-DlmxLZs3zge9GGLsV_Wi0jN0lw");
		list.add("o-DlmxBkB8GqnryM9cpqwHsE-ADI");
		list.add("o-DlmxIEQZOGXrVdTVU0OmIniBjw");
		list.add("o-DlmxFSUn1f0JBYPyu1CBrzcKVU");
		list.add("o-DlmxPmRSvWrqydH-tMejs8j4C0");
		list.add("o-DlmxC1l5IOr_uGgBg3T1foVBjc");
		list.add("o-DlmxKTQuGyl_eJ0B4h_OBLOnDs");
		list.add("o-DlmxO1ujZB7B61-bZ5EeM7nzBU");
		list.add("o-DlmxC-5zQmbXPcFk9qzMJ7kpes");
		list.add("o-DlmxE5WwdMgTSDaPUQJ4oq2V10");

		
		list.add("o-DlmxM7O88BXutarS6RQ-wP7Qxs");
		
		String first = "《用爱沟通，我从新疆来》提醒您：请于13:30前入场";
		String remark1 = "LG Human Library真人书馆";
		String remark2 = "您报名的《用爱沟通，我从新疆来》，将于2015年10月31日14:00正式开讲，请至少提前30分钟入场，签到落座。";
		String remark = "";
		
		
		for (String openid : list) {
			System.err.print("openid==" + openid);
			try {
				messageId = weixinTemplateMessageService.sendNoticePublish(appInfo, openid, first, remark1, remark2, remark);  
				weixinTemplateMessageService.updateSendStatus(messageId, "success");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}
	 
	
	private static void tempSendNewMemberJoinRemind(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");

		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
		Long messageId = null;
		System.out.println("*****************新会员加入提醒*******************");
		List<String> list = new ArrayList<String>();
		
		
		list.add("oGKUAwfnIgJLgHJy4E7hOFE9ieCA");
		list.add("oGKUAwTFh7kU7VJ6faSXa_79axfw");
		list.add("oGKUAwfPXX6MqXYCIWPFbTA53Z6I");
		list.add("oGKUAwVBvJS01HPPrMKFUKBANVb8");
		list.add("oGKUAwYZWWhmKH8OsHDBtqunHMuk");
		list.add("oGKUAwYhr1ISB-2CKBDDA9oUQss4");
		list.add("oGKUAwSPmpjewePnwKAvMpDePB_A");
		
		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M");
		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA");

		String first = "您好。我们是新世界免税店。"
					+ "\n谢谢参与 ‘绑定账号领取红包’活动。"
					//+ "\n根据活动规则，注册会员后完成邮箱验证成为正式会员才能获得2元红包。（您的现在状态为准会员）"
					//+ "\n活动截止时间为2015.12.03 22:59（北京时间），特此告知您只有在活动结束之前成为正式会员才能获得红包。"
					;
		String keyword1 = "OH SANGHOON";
		String keyword2 = "XXXXXXXX";
		String keyword3 = "2015年12月02日";
		String remark = "根据活动规则，注册会员后完成邮箱验证成为正式会员才能获得2元红包。（您的现在状态为准会员）"
				+ "\n活动截止时间为2015.12.03 22:59（北京时间），特此告知您只有在活动结束之前成为正式会员才能获得红包。"
				;
		
		
		for (String openid : list) {
			System.out.println("openid==" + openid);
			try {
				
				if(openid.equals("oGKUAwfnIgJLgHJy4E7hOFE9ieCA")){
					keyword1 = "倩儿";
					keyword2 = "554300148";
					keyword3 = "2015年12月02日";
				}else if(openid.equals("oGKUAwTFh7kU7VJ6faSXa_79axfw")){
					keyword1 = "老小妮儿";
					keyword2 = "1143073517";
					keyword3 = "2015年10月01日";
				}else if(openid.equals("oGKUAwfPXX6MqXYCIWPFbTA53Z6I")){
					keyword1 = "宝宝";
					keyword2 = "AS512020443";
					keyword3 = "2015年10月01日";
				}else if(openid.equals("oGKUAwVBvJS01HPPrMKFUKBANVb8")){
					keyword1 = "myheartwillgoon";
					keyword2 = "18328307560";
					keyword3 = "2015年12月02日";
				}else if(openid.equals("oGKUAwYZWWhmKH8OsHDBtqunHMuk")){
					keyword1 = "银联POS机代办";
					keyword2 = "15000175412";
					keyword3 = "2015年12月02日";
				}else if(openid.equals("oGKUAwYhr1ISB-2CKBDDA9oUQss4")){
					keyword1 = "爱飞扬";
					keyword2 = "YXTBBAACC";
					keyword3 = "2015年10月01日";
				}else if(openid.equals("oGKUAwSPmpjewePnwKAvMpDePB_A")){
					keyword1 = "飞扬爱";
					keyword2 = "YXT831015";
					keyword3 = "2015年10月01日";
				}else{
					keyword1 = "OH SANGHOON";
					keyword2 = "XXXXXXXX";
					keyword3 = "2015年12月02日";
				}
				
//				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
				messageId = weixinTemplateMessageService.sendNewMemberJoinRemind(appInfo, openid, first, keyword1, keyword2, keyword3, remark);  
				weixinTemplateMessageService.updateSendStatus(messageId, "success");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}
	private static void tempSendPurchaseSuccessNotice(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
		
		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
		Long messageId = null;
		System.out.println("*****************新会员加入提醒*******************");
		List<String> list = new ArrayList<String>();
		
//		list.add("oGKUAwTNscmPZtePZa1f6sBDtyVM^MINDY04^145.33^4.67	      ");
//		list.add("oGKUAwX2s0mZTBt-ifih0GNAwNz8^TOPSHOPHAHA^141.91^8.09	      ");
//		list.add("oGKUAwZbv-CPbB39N-RG6LzkfmSY^865672157^132.76^17.24	      ");
//		list.add("oGKUAwcoREiT1t9tQp62IYg5IXg4^YUYINGGONGYU^119.69^30.31	      ");
//		list.add("oGKUAwVN9FdFek5HBrdRbx08geRQ^LOVE87468281^112.35^37.65	      ");
//		list.add("oGKUAwelQHLAkpRV5O-TnBUrCbtE^ZHANGLING2458^106.46^43.54	      ");
//		list.add("oGKUAwQ-Y_bd1b9ZOAauUyv7PtzM^JINANGA^105.49^44.51	      ");
//		list.add("oGKUAwV7kBVOzFSO-VzApW0nnqyk^WANGSIYAO^100.8^49.2	      ");
//		list.add("oGKUAwcvyngdfmZu2XWmBn9YK1tg^REYICO^98.67^51.33		      ");
//		list.add("oGKUAwQ6QzxUj-lTWsMF8mlLnNUU^LUOWEN198813^97.61^52.39	      ");
//		list.add("oGKUAwdc9t3Kv6k54lojfbsx6QHI^EMZZ01^97.61^52.39		      ");
//		list.add("oGKUAwcEOrz04cCnVKXicBBD48as^MORKER1982^86.33^63.67	      ");
//		list.add("oGKUAwSsGy4_yAE-Ij2wgkb5i6T8^COOLNGOOD7^67.45^82.55	      ");
//		list.add("oGKUAwYtsMVHNH_ttoLjRik-K32Y^XUEREN8519^67.45^82.55	      ");
//		list.add("oGKUAwZdPkEw67slEKDLJnVkjcDs^MANANA034^60.49^89.51		");
		
		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^MANANA034^60.49^89.51		");
		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^MANANA034^60.49^89.51		");
		
		String first = "您好。我们是新世界免税店。"
				+ "\n谢谢参与 ‘绑定账号领取红包’活动。"
				;
		String product = "";
		String price = "";
		String time = "";
		String remark ="";
		
		
		for (String item : list) {
			String[] array = item.split("\\^");
			String oepnid = array[0];
			System.out.println("openid==" + oepnid);
			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
					+ "\n活动截止时间为2015.12.03 22:59（北京时间）， 非常感谢您的支持"
					;
			try {
//				 System.out.println(array[0] + "|" + array[1] + "|" + array[2] + "|" + array[3].trim() + "|");
//				 System.out.println(remark);
//				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
				messageId = weixinTemplateMessageService.sendPurchaseSuccessNotice(appInfo, oepnid, first, product, price, time, remark);
				weixinTemplateMessageService.updateSendStatus(messageId, "success");
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}
	
	/** 
	*新世界 12月7日
	*/
//	private static void tempSendMemberBindingNotice(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************新会员加入提醒*******************");
//		List<String> list = new ArrayList<String>();
//		
//		list.add("oGKUAwTNscmPZtePZa1f6sBDtyVM^MINDY04^145.33^4.67^大瑶韩国代购🙈12.22✈️韩国		");
//		list.add("oGKUAwX2s0mZTBt-ifih0GNAwNz8^TOPSHOPHAHA^141.91^8.09^埃菲尔12.9飞韩国（支持信用卡）	");
//		list.add("oGKUAwZbv-CPbB39N-RG6LzkfmSY^865672157^132.76^17.24^zxcvbnm				");
//		list.add("oGKUAwcoREiT1t9tQp62IYg5IXg4^YUYINGGONGYU^119.69^30.31^✈️瀛小妞韩国代购			");
//		list.add("oGKUAwVN9FdFek5HBrdRbx08geRQ^LOVE87468281^112.35^37.65^cool😄				");
//		list.add("oGKUAwelQHLAkpRV5O-TnBUrCbtE^ZHANGLING2458^106.46^43.54^萱姐妈				");
//		list.add("oGKUAwQ-Y_bd1b9ZOAauUyv7PtzM^JINANGA^105.49^44.51^Ji nang a				");
//		list.add("oGKUAwV7kBVOzFSO-VzApW0nnqyk^WANGSIYAO^100.8^49.2^王有容				");
//		list.add("oGKUAwcvyngdfmZu2XWmBn9YK1tg^REYICO^98.67^51.33^reyico🎈					");
//		list.add("oGKUAwQ6QzxUj-lTWsMF8mlLnNUU^LUOWEN198813^97.61^52.39^🍀天才roro🎀			");
//		list.add("oGKUAwdc9t3Kv6k54lojfbsx6QHI^EMZZ01^97.61^52.39^joo.a.nam🙄				");
//		list.add("oGKUAwcEOrz04cCnVKXicBBD48as^MORKER1982^86.33^63.67^孙永亮				");
//		list.add("oGKUAwSsGy4_yAE-Ij2wgkb5i6T8^COOLNGOOD7^67.45^82.55^good菇🍄				");
//		list.add("oGKUAwYtsMVHNH_ttoLjRik-K32Y^XUEREN8519^67.45^82.55^雪人姐姐⛄				");
//		list.add("oGKUAwZdPkEw67slEKDLJnVkjcDs^MANANA034^60.49^89.51^陳意廷				");
//		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^MANANA034^60.49^89.51^陳意廷				");
//		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^MANANA034^60.49^89.51^陳意廷				");
//		
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘绑定账号领取红包’活动。"
//				;
//		String keyword1 = "";
//		String keyword2 = "";
//		String remark ="";
//		
//		
//		for (String item : list) {
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[4].trim();
//			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
//					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
//					+ "\n活动截止时间为2015.12.03 22:59（北京时间）， 非常感谢您的支持"
//					;
//			try {
//				 System.out.println(keyword1);
//			 System.out.println(remark);
////				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	/** 
	 *新世界 15年12月18日
	 */
//	private static void tempSendMemberBindingNotice20151218(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************新会员加入提醒*******************");
//		List<String> list = new ArrayList<String>();
//		
//		 
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^HLY0502^86.27^64^四川人			");
////		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^HLY0502^86.27^64^四川人			");
//
////		list.add("oGKUAwWXooLIGiIQanULFu-vumIc^025SEVEN1^149.59^1^A-沐沐（12🈷18日✈️韩国）	");
////		list.add("oGKUAwQSFvQ4hgh71ppVKUETRRl0^IREYICO^139.86^11^胡佳洁💢			");
////		list.add("oGKUAwXIJnVxK2EJc3s7obqEGwXc^BLAIR627^138.07^12^Sourire			");
////		list.add("oGKUAwYivOoCbpv3Y4MnICgpRYIM^110518KAIMING^135.63^15^ 姐		");
////		list.add("oGKUAwfjx397WLwsmpMw95Zv2ddc^EVEBLUE128^134.65^16^Eve Chang		");
////		list.add("oGKUAweIld_BuAXQIakhZuz2L46I^POKER0303^126.53^24^李倩琦			");
////		list.add("oGKUAwetGgsnV4DrTLr3Hd9TYQC8^384985676^121.7^29^王晶			");
////		list.add("oGKUAwZ0HaZ8MkJ-PE8TENpQmtRs^WXY127225^116.54^34^EVA妈妈		");
////		list.add("oGKUAwZn4jYwdvdBcBzJwQWFStNU^YANGFAN622^93.09^57^星辰			");
////		list.add("oGKUAwf6QU9kt4ciBFgfoUgSn1ZI^HLY0502^86.27^64^四川人			");
////		list.add("oGKUAwbO7nIoNQM9pnYxQY0KlEK4^ELIEENKK^85.51^65^elieen-10		");
////		list.add("oGKUAwTPNFw6YrAREC69F4ki4PTM^547096812^81.78^69^A     安 -		");
//
//
//		
//		
//		
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘仅限2天 绑定账号领取红包’活动。"
//				;
//		String keyword1 = "";
//		String keyword2 = "";
//		String remark ="";
//		
//		
//		for (String item : list) {
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[4].trim();
//			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
//					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
//					+ "\n活动截止时间为2015.12.18 22:59（中国时间）， 非常感谢您的支持。"
//					;
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
////				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	
	/** 
	 *新世界 15年12月18日 消息1
	 */
//	private static void tempSendMemberBindingNotice20151218_01(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************新会员加入提醒*******************");
//		List<String> list = new ArrayList<String>();
//		
//		
//		
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^OH SANGHOON		      ");
////		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^郑太范		      ");
//		
////		list.add("oGKUAwbndYtpuQBdRooo6t89XfUc^太阳亮了☀			      ");
////		list.add("oGKUAwYtsMVHNH_ttoLjRik-K32Y^雪人姐姐⛄			      ");
////		list.add("oGKUAwXbJyivj0XS8TATtF7Ft8Y0^✨韩智慧👿✨			     ");
////		list.add("oGKUAwYpuPR3Gow5hWqa5XQ0xAZk^海之蓝韵			     ");
////		list.add("oGKUAwalfUqfpUug8oG3auaWJzqs^爱许小花大美妞		     ");
////		list.add("oGKUAwbrWfkPQfqFEiLwYItONBzI^Alltoo韩妆			     ");
////		list.add("oGKUAwePHHLD6fmzvRQZWDT2VRiU^🇰🇷 巍巍 🇰🇷✈️准备中		      ");
////		list.add("oGKUAwUcNDfBBFL9wFK7lpQIPHjc^W.海外代购			     ");
////		list.add("oGKUAwVEsoNZ9-H89wSPZh2hGlS0^aiyamaya_Q韩装馆		     ");
////		list.add("oGKUAwf8OWZRnFVzxrgH6iw2cwL8^🍭王小梦몽가가💃🏻🐾		     ");
////		list.add("oGKUAwWsPFnpMB3MovqIU5p2YzLI^季薇		     ");
////		list.add("oGKUAwelQHLAkpRV5O-TnBUrCbtE^萱姐妈			     ");
////		list.add("oGKUAwa27xI6U1DNdF0yxIdO7Ck4^她的故事			     ");
////		list.add("oGKUAwUqI_Le_sNjChs4inLuP2-M^Sukie			     ");
////		list.add("oGKUAwVN9FdFek5HBrdRbx08geRQ^cool😄			      ");
////		list.add("oGKUAwTXYTSrRl0JwEb7317jmYZc^糯米菓菓			     ");
////		list.add("oGKUAwdc9t3Kv6k54lojfbsx6QHI^joo.a.nam🙄			     ");
////		list.add("oGKUAwdMaF6PdJbAUJStJUzKV-Ek^假装在Seoul		     ");
////		list.add("oGKUAwZEZ8ZBKlUaTgjVo629yDjk^炫羽❤️美丽爱的代购		      ");
////		list.add("oGKUAwdKV--B19-h79y93Kvv3dxE^双子			     ");
////		list.add("oGKUAwf1r3P7XongSmb747sFbybY^zoe			     ");
////		list.add("oGKUAwRX613JEBCbH91ouaSlkxGw^Andrea ^^			     ");
////		list.add("oGKUAwcvyngdfmZu2XWmBn9YK1tg^reyico🎈			      ");
////		list.add("oGKUAwbZ5kRUu9X7kdwV8nKMk0bE^HOBIN			     ");
////		list.add("oGKUAwZbv-CPbB39N-RG6LzkfmSY^zxcvbnm			     ");
////		list.add("oGKUAweR7GVAN2DWpAk0NsfnnxTE^拽拽小男全球购14号飞韩国美国    ");
////		list.add("oGKUAwZrcrw4HZ3nLDTDdU04gOJI^yan			     ");
////		list.add("oGKUAwU5z2OP-hwa3T9eE8Ludupo^请叫我岽方不败。		     ");
////		list.add("oGKUAwTc5KAE1bTu7EG9eT0cuw8c^又是一年			     ");
////		list.add("oGKUAwX-jt9SdqUHanPnKr2M_YfM^Fan Wang			     ");
////		list.add("oGKUAwc3zcpHnMykc5JtONFr00Fs^Daisy			     ");
////		list.add("oGKUAwbWaSjOcP37lOChDoh1qPa4^Narcissus			     ");
////		list.add("oGKUAwQ-Y_bd1b9ZOAauUyv7PtzM^Ji nang a			     ");
////		list.add("oGKUAwXn6_jXHtMJ_89mdx88xMvg^lucia			     ");
////		list.add("oGKUAwVBsNeaVLbH7EjFiAIKIoH0^star			     ");
////		list.add("oGKUAwbanx0w7xw16fOg9h8wLysM^Οo唯⒈de涙💋			      ");
////		list.add("oGKUAwYJZhlQ7nVWNafaTo9j96Ec^Akashi Seijyuurou		     ");
////		list.add("oGKUAwWeccdLnJQ4f1TPTjiDaGZM^진유강			     ");
////		list.add("oGKUAwY6pzF8kc4_zzuOZ1ksAbeQ^海豚			     ");
////		list.add("oGKUAwWvqEwzTcuRWd1VlurFNnfI^🐰				      ");
////		list.add("oGKUAwcncaqhfui7pgmzklvYcAxo^安韩代			     ");
////		list.add("oGKUAwfw65el3Q7Glz-kYwiUlxRE^bright			     ");
////		list.add("oGKUAwegr5VgBGOHILkA_VAyizpc^I will be okay!		     ");
////		list.add("oGKUAwQurIUE2188N3ltsVPT6-10^A.🎀潘潘🎀💯12.11✈韩国✔	      ");
////		list.add("oGKUAwVV5dW_mj5iZ8uik8tonZr8^白,白🌎			      ");
////		list.add("oGKUAwU0AILPU1UF-a7iopLzHxno^         🇫🇷			      ");
////		list.add("oGKUAwSma1FpUt5Ob5sNoxqNkG0o^～范范之辈～		     ");
////		list.add("oGKUAwXjx94rhFSYskkJgPbp_4B0^张婕			     ");
////		list.add("oGKUAwSsGy4_yAE-Ij2wgkb5i6T8^good菇🍄			      ");
////		list.add("oGKUAwT4dkTQPe8JSxlDVDvhZ7Jw^A山东男男csn616 💯14 韩国    ");
////		list.add("oGKUAwcG92zwmYRdCqBRzgoRoHCg^杨茗晶			     ");
////		list.add("oGKUAwdEMKP5EeDPdATpyJMFri0c^王大头童鞋			     ");
////		list.add("oGKUAwagK1r5rArhKaW-V4Cn8f3E^小心				");
//
//		
//		String first = "您好。新世界免税店现在进行‘仅限2天 绑定账号领取红包’活动(12.17~18)。您12.17~18购物满$150以上(以实际付款金额为准)能获得20元红包。"
//				+ "*注 : 1.活动期间内购买的顾客，只限领取一次 2.2016.1.3之前取货或出国的顾客 3.	活动截止时间为2015.12.18 22:59(中国时间）4.红包派发时间（2016.1.5）"
//				;
//		String keyword1 = "";
//		String keyword2 = "";
//		String remark ="非常感谢您的支持。";
//		
//		
//		for (String item : list) {
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[1].trim();
////			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
////					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
////					+ "\n活动截止时间为2015.12.18 22:59（中国时间）， 非常感谢您的支持。"
////					;
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
////				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	
	
	/** 
	 *新世界 15年12月18日 消息1
	 */
//	private static void tempSendMemberBindingNotice20151218_03(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************新会员加入提醒*******************");
//		List<String> list = new ArrayList<String>();
//		
//		
//		
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^OH SANGHOON		      ");
////		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^郑太范		      ");
//		
//		list.add("oGKUAwW4iMxWTJ90ZtNkvSR870Hs^冇冇了💭		 ");
//		list.add("oGKUAwTlTm3kXp1_OZzgUK72Wsl8^Kein		");
//		list.add("oGKUAwemUMasdC-vze7rVSTw4rgs^神话		");
//		list.add("oGKUAwd4PiZe0_Rkje4t1Z18_3nc^爱人		");
//		list.add("oGKUAwfaVSZdaOCK3ka44sFgTJ9E^作战		");
//		list.add("oGKUAwfSqorkYGeAJ8WzMXqyHfaE^砸中牛顿🉐●iphone.🍥	 ");
//		list.add("oGKUAwa44jGijDRVHMFlczRGm3JU^芝			");
//		list.add("oGKUAwfsaybtpvklc71S8htp83Gs^uncle聪		");	
//		
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘仅限2天 绑定账号领取红包’活动。"
//				+ "\n根据活动规则，注册会员后完成邮箱验证成为正式会员才能获得3元红包。（您的现在状态为准会员）活动截止时间为2015.12.18 22:59（中国时间），特此告知您只有在活动结束之前成为正式会员才能获得红包。"
//				;
//		String keyword1 = "";
//		String keyword2 = "";
//		String remark ="非常感谢您的支持。";
//		
//		
//		for (String item : list) {
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[1].trim();
////			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
////					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
////					+ "\n活动截止时间为2015.12.18 22:59（中国时间）， 非常感谢您的支持。"
////					;
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
////				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	
	
	/** 
	 *新世界 15年12月24日 消息1 根据活动规则，注册会员后完成邮箱验证成为正式会员才能获得5元红包
	 */
//	private static void tempSendMemberBindingNotice20151224_01(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************标题绑定会员通知*******************");
//		List<String> list = new ArrayList<String>();
//		
//		
//		
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^OH SANGHOON		      ");
////		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^郑太范		      ");
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^2861512413		");
////		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^2861512413		");
//		
//		list.add("oGKUAwd9-Ir3tw26TRILmRjZ_0us^2861512413		");
//		list.add("oGKUAwamrfZUlIOmhyBmakELxwGc^13683580039	");
//		list.add("oGKUAwUwIWCNjw6qdrhRnMZb0tfE^82272429		");
//		list.add("oGKUAwbrHoUxP8Uq2ZA10rDdVU34^JXSZPJ		");
//		list.add("oGKUAwWxS_wImr7GYHiwXxerAuHI^18186476477	");
//		list.add("oGKUAwclvh0k8pOctfv3PobgmQhc^SHAOXIAOSHAOYE	");
//		list.add("oGKUAwSOtC_WZ1N-ENgKYU4o2zSg^328879775		");
//		list.add("oGKUAwbKFS8bzobptXiHPFHBbwpI^306201743		");
//		list.add("oGKUAwR4BYrqxv-bw-k5QgI4C46A^1083117833		");
//		list.add("oGKUAwXolz7JzTnl2WlP-1ADk2sc^370311817		");
//		list.add("oGKUAwXU7QU5MP23BgVmt3wxXhUo^654368915		");
//		list.add("oGKUAwYMpfkHS_60AZX-aseJXK4w^BUBINGYIN2225	");
//		list.add("oGKUAwSNrXup117zP5wSLXGPTTvQ^18804750924	");
//		list.add("oGKUAwY_Y7WRgc6SGlkBodKDWt5k^NINGJINGLUN14	");
//		list.add("oGKUAwWkuMS7ICD7_gmTocY4KzVs^805240200		");
//		list.add("oGKUAwQaJ7vj4iqKIy0g7SWsvnsc^2728220549		");
//		list.add("oGKUAwZB9KgiPzQ_-IsWNzUrxvrk^245299448		");
//		list.add("oGKUAwcscAmT3t3PiL7k9qG_23AI^1940784775		");
//		list.add("oGKUAwcDr9LtFwWsWN6dxxgZkVGk^123228788		");
//		list.add("oGKUAwTaflEIqSP_7ywBKopxNzEw^JIANGLIIN19	");
//		list.add("oGKUAwSUbKzmPc4RPlNr3lYRFU3c^249363831		");
//		list.add("oGKUAwcVKn5_QC6fZRco9lZrmPb0^JIANGLIIN111	");
//		list.add("oGKUAweJcCRWUiJ62jL-hrLmm9cU^932210748		");
//		list.add("oGKUAwa9fP7hvn9yRFk3d9T3zxlY^2159874461		");
//		list.add("oGKUAwXWpgzoIr8muxXsld2fWqAQ^3155195093		");
//		list.add("oGKUAwX6yf5zA0TSXgy9yDJQrHyM^80255429		");
//		list.add("oGKUAwYfqFam5YRpTBgGsdnnQQWc^420351923		");
//		list.add("oGKUAwavXXM6FltG96CDHwK8CAS0^506437275		");
//		list.add("oGKUAwWRj2Hb_i6s-dC9YROhQv74^3092801647		");
//		list.add("oGKUAwedNNhHP9XfbBaifjcMPsXw^183747311		");
//		list.add("oGKUAweBt7vEMnHru9xwDu1LiFiE^365725996		");
//		list.add("oGKUAwYLZmrFH_t7d7lsIAXzyvaA^15204882409	");
//		list.add("oGKUAwS3K2n3FmT_J2Po1fHZzcqo^13148313425	");
//		list.add("oGKUAwblAblGxAbDCbX89xdO_ClQ^3276990182		");
//		list.add("oGKUAwSkPWXV_jruEiLKDfmEnOXA^3097955632		");
//		list.add("oGKUAwZe7ONZj6GeYQV0E0k0ClbU^1093961974		");
//		list.add("oGKUAwVrPjlaA8Nn8edPanyMZoWQ^95876318		");
//		list.add("oGKUAwfjHqXK3BuvaZ18XxWE-C2A^597065664		");
//		list.add("oGKUAwZaAaBrxxPHhHCUIo2R6w_8^TYBSCSHSWK		");
//		list.add("oGKUAwYalXG-WfY4XOMEBlRmclMg^QQQWERTYAA		");
//		list.add("oGKUAwf_ZnYDu1KztYpY8Q0Ka5P0^JAMESRW		");
//		list.add("oGKUAwa1JIQW4z3XxFSg1TgThwM8^18170016913	");
//		list.add("oGKUAwTH8vjguQYDnuRb1QMhdjuI^1987536646		");
//		list.add("oGKUAwd69m4PKOwaQER0YbPa_Www^740815365		");
//		list.add("oGKUAwZqk_5d495U0izH7iwyioZk^FANYUEHONG		");
//		list.add("oGKUAwaVi89zxhvyGfYzB1ChJFCY^731619761		");
//		list.add("oGKUAwdo7nWbRdfVX-LrNB856XIc^1084641713		");
//		list.add("oGKUAwQc5MmxAnqyzM7APF2gQbac^877108920		");
//		list.add("oGKUAwWcTnhqijUVNy7344kKJGKc^272282799		");
//		list.add("oGKUAwTr-UXY0A-V42MzZRK2wb6I^YZGUANG001		");
//		list.add("oGKUAwemupTKEOfs1qKAHgm7TOpY^13641533039	");
//		list.add("oGKUAwcW17ryy13eQ58peukP_br0^ZSZX111111		");
//		list.add("oGKUAwXQ_ecIVnpz1qlUvVTA_Gv4^GUCBHC		");
//		list.add("oGKUAweA0g3HHBlxdS8W81aNyJew^SHA4809322		");
//		list.add("oGKUAwUoTRMK7Y1-kGjRNmNz2CLY^KUANGXIANNUJIAN	");
//		list.add("oGKUAweIcWM4hqfowN7drbPBVw8w^542117651		");
//		list.add("oGKUAwep40dqz0b05_ripyPWszjY^WWJJSHUWEN		");
//		list.add("oGKUAwYmzzwzB5LsT0kHVV9sDN8Y^YZGUANG002		");
//		list.add("oGKUAwdsNMsiALNAxLHpw666iTYg^2134973183		");
//		list.add("oGKUAwd7vx1TvVskyyY1Oc_Lo3xc^VFFHGFG		");
//		list.add("oGKUAwUkPQaB1ouFA_O6JAfYNreI^QIU9777782		");
//		list.add("oGKUAwcVlkATbBl7HzMgqCWVume8^LAIJIAO1150810	");
//		list.add("oGKUAwd4T9OKbb9st7RAzz3ra8ts^YZGUANG003		");
//		list.add("oGKUAwVpvyinXTYlhvjdGohF50os^VFFFGFG		");
//		list.add("oGKUAwSrBoImLk-fJh7R6PuWWfIA^2035097557		");
//		list.add("oGKUAwQBJy3oG2jTwZl7N1d-n1KU^YZGUANG004		");
//		list.add("oGKUAwfX3gPCXrFPA4M88TSwDMHo^SHUN3658101	");
//		list.add("oGKUAwRayL36QkRgzReIyIrHZVBw^903660745		");
//		list.add("oGKUAwT__UdUgBPWDW8_tfExITCA^3168892312		");	
//
//		
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘圣诞节活动! 仅限2天!绑定账号领取红包吧~’。"
//				+ "\n根据活动规则，注册会员后完成邮箱验证成为正式会员才能获得5元红包。（您的现在状态为准会员）活动截止时间为2015.12.24 22:59（中国时间），特此告知您只有在活动结束之前成为正式会员才能获得红包。"
//				;
//		String keyword1 = "";
//		String keyword2 = "";
//		String remark ="非常感谢您的支持。";
//		
//		
//		for (String item : list) {
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[1].trim();
////			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
////					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
////					+ "\n活动截止时间为2015.12.18 22:59（中国时间）， 非常感谢您的支持。"
////					;
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
////				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	
	
	/** 
	 *新世界 15年12月24日  - 标题绑定会员通知  “150美元”
	 */
//	private static void tempSendMemberBindingNotice20151224_02(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************标题绑定会员通知*******************");
//		List<String> list = new ArrayList<String>();
//		 
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^ZANGXIAONIE^148.34^2^ZANGXIAONIE	       ");
////		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^ZANGXIAONIE^148.34^2^ZANGXIAONIE	       ");
//
//		list.add("oGKUAwa5ZmepV_j6iSe3z3KP9wGo^ZANGXIAONIE^148.34^2^ZANGXIAONIE	       ");
//		list.add("oGKUAwTZ-8fdnrG67nPss6g5dnoM^YOOLIM1211^144.19^6^YOOLIM1211	       ");
//		list.add("oGKUAwYivVQ7BoBrtg4MAguCQ2kU^VALISE^143.68^7^VALISE		       ");
//		list.add("oGKUAwdhawg4ORFqHmZzjb3-Tghk^249948212^142.81^8^249948212	       ");
//		list.add("oGKUAwf3Taz-xSUc2yamWOnxy-8w^ISA0319^123.04^27^ISA0319		       ");
//		list.add("oGKUAwT3FXq8BmDfNIkxgQw204GE^172363448^122.99^28^172363448	       ");
//		list.add("oGKUAwTJj4gF8gjIDyO0O3ywx97Q^ICEGREEN911^102.91^48^ICEGREEN911	       ");
//		list.add("oGKUAwWdXP1sNINvUhGg2K9W9Z24^CALVIN870306^98.08^52^CALVIN870306	       ");
//		list.add("oGKUAwfablf29V71rw7K8klnZ-is^SONEZWBING^89.49^61^SONEZWBING	       ");
//		list.add("oGKUAwdZ24jQWFeYQPcZPveh-OBI^YHMJHZ^89.42^61^YHMJHZ		       ");
//		list.add("oGKUAwVdXqeKLaVyQZVJ44vy0iHQ^CHANGJUAN^89.22^61^CHANGJUAN	       ");
//		list.add("oGKUAwSFrJrmx4m7ioy7V5nlQg1I^WUYU050406LUNBI^85.19^65^WUYU050406LUNBI  ");
//		list.add("oGKUAwRyga-6FFDRX_866FFYn83Y^GAOWENJUAN^75.95^75^GAOWENJUAN	       ");
//		list.add("oGKUAwTn830xz95hGhIWxaB0ED_Y^ZHEN90^69.94^81^ZHEN90		       ");
//		list.add("oGKUAwSAxvj8UBd-whLdvK2QUHho^YOYO9125^68.91^82^YOYO9125		       ");
//		list.add("oGKUAwQQK6k6EDF-0amgFZYN5HXE^251596704^60.3^90^251596704		");
//		
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘圣诞节活动! 仅限2天 绑定账号领取红包吧~’"
//				;
//		String keyword1 = "";
//		String keyword2 = "";
//		String remark ="";
//		
//		
//		for (String item : list) {
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[4].trim();
//			remark = "根据活动规则，购物满$150以上(以实际付款金额为准)的顾客才能获得20元红包。"
//					+ "\n(尊敬的顾客，您现在的购物金额为$" + array[2] + "，还需购满 大约 $" + array[3].trim() + "才能获得红包)"
//					+ "\n活动截止时间为2015.12.24 22:59（中国时间）， 非常感谢您的支持。"
//					;
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
////				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	/** 
	 *新世界免税店 活动 - 迎2016年 元旦快乐！仅限2天 绑定账号领取红包吧！
	 */
//	private static void tempSendEventFinishedNotice20151231(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************新会员加入提醒*******************");
//		
//		List<String> list = new ArrayList<String>();
//		
//		List<Map<String,Object>> openIDList =   weixinTemplateMessageService.selectList("SendMsgAll.selecteOpenId",null);
//	
//		for(int i=0;i<openIDList.size();i++){
//			openIDList.get(i).get("OPENID");
//			list.add(openIDList.get(i).get("OPENID")+"^"+openIDList.get(i).get("OPENID")+"		      ");
//		}
//		 
//		 
//	 	
//		String first = "您好。我们是新世界免税店。"
//				;
//		String keyword1 = "迎2016年 元旦快乐！快绑定账号领取红包吧！";
//		String keyword2 = "新世界免税店 全部用户（此次活动仅限于之前未参加过活动的新会员）";
//		String keyword3 = "2015年12月31日 6PM";
//		String remark ="非常感谢您的支持。";
//		int test = 0;
//		for (String item : list) {
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			System.out.println("*****************************");
//			System.out.println("=============================");
//			System.out.println("=============================");
//			System.out.println("=============================");
//			System.out.println("*****************************");
//			System.out.println(test ++);
//			System.out.println("*****************************");
//			System.out.println("=============================");
//			System.out.println("=============================");
//			System.out.println("=============================");
//			System.out.println("*****************************");
//		 
//			//keyword1 = array[1].trim();
//			remark = "绑定新世界网上免税店账号与微信公众账号，根据如下条件派发红包喽！"
//					+ "\n第一： 注册正式会员+绑定账号=6元"
//					+ "\n第二：在网上购买满￥150以上(以实际付款金额为准）+绑定账号=16元."
//					+ "\n（参与方式：点击“微信活动”查看详情）"
//					;
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
//				System.out.println(keyword1 +" , " + keyword2 +" , " +keyword3);
//				messageId = weixinTemplateMessageService.sendEventFinishedNotice(appInfo, openid, first, keyword1, keyword2,keyword3,remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	

	/** 
	 *新世界 16年1月18日  - 绑定会员通知
	 */
//	private static void tempSendMemberBindingNotice20160118(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************标题绑定会员通知*******************");
//		List<String> list = new ArrayList<String>();
//		 
//
//		list.add("oGKUAwTy4CDwGL49ShGKVCqh_92g^494345432	       "); 
//		list.add("oGKUAwc9ODJ1GP5pItctaeSy3Xo4^841914065	       "); 
//		list.add("oGKUAwSa6gsZLz-4nge8g3bNAiZM^HAITAOXING	       "); 
//		list.add("oGKUAwS7ilz6Yy7PVChKo7wJH1WY^188828285          "); 
//		list.add("oGKUAweW0PRjDmb-G5dBi3xoIBGY^77345124	       "); 
//		list.add("oGKUAwTnOfvCirWxtQj8ZJsgX6mI^279087351	       "); 
//		list.add("oGKUAwUSFePntc3jaFfQjTbdISaM^KENIX49	       "); 
//		list.add("oGKUAwdsx2qbsb-zacx-cHAQ1cqk^37549107	       "); 
//		list.add("oGKUAwZ0ezUiSPYkd17DhcgRvnF8^173495376	       "); 	
//		list.add("oGKUAwbUR1EpvHFWjGygLGZF7JbU^1071104109	       ");
//		list.add("oGKUAwcI2-QIjlKJ9Ur4uMpSAdk8^106106966	       ");
//		list.add("oGKUAwcVnOQltX0KttdHC8tDGUIc^LUHHGF	       ");
//		list.add("oGKUAwZZ4SY1_rRUi4qJ7S0EgKC0^DWR12TZL	       ");
//		list.add("oGKUAwU4efgb4wlUI7jCtV4aKc2M^DWR1TZL	       ");
//		list.add("oGKUAwR4-A6ETlgTL6Z9N_k6sXjM^15605872447	       ");
//		list.add("oGKUAwUzmM9ofVTgslfmDGF6-e6w^TIANLANGYONG10	       ");
//		list.add("oGKUAwZNTxuYBGKci-2VNfpzxow0^2390870608	       ");
//		list.add("oGKUAwXiI4KsG222d9gXzgcmqlFw^439617678	       ");
//		list.add("oGKUAwUAB-6j8YAv5FCd7vV7bRho^438087384	       ");
//		list.add("oGKUAwbJn7v8EcMtD7qV7k7lAy0w^BAIERHUAN	       ");
//		list.add("oGKUAwfUa4_Xl7iD_Jeoka3k7cnM^63478593	       ");
//		list.add("oGKUAweo2GkZvKOxt6jfPcQFfASE^1045215490	       ");
//		list.add("oGKUAwc2-bvPxoZPWZh4s3iYcZLQ^3350224591	       ");
//		list.add("oGKUAwQjhTdvzD29IQW4Mh023puo^KAKOU	       ");	
//		list.add("oGKUAwcCWWpyZhwn0jfPFlC1DBwc^6190717	       ");
//		list.add("oGKUAwYJVI8jiDFkBI3mmdoqFpmc^A250731356	       ");
//		list.add("oGKUAwW_TYojDUTDu_gNMfjxxF_I^15252102789	       ");
//		list.add("oGKUAwfQJNCpVZR6PDgvdKc160lk^1736224771	       ");
//		list.add("oGKUAwWEGLXis7_aKEmL5zfigljs^2420945883	       ");
//		list.add("oGKUAwSa6gkjz24TZOaUKfpVi0cU^KML151218	       ");
//		list.add("oGKUAwd8vSa2OJlCiTBVqQlRaLqg^2210727873	       ");
//		list.add("oGKUAwUktEL6Q2jKhFG5wDzDKj-I^1032135513	       ");
//		list.add("oGKUAwaLCu8zKT4qu8EB1v_ReRfQ^3152577158	       ");
//		list.add("oGKUAwXAV9jaiHrM1DTloj9eb5yI^ZHUANYONGDE	       ");
//		list.add("oGKUAwWGnZRUanVFPNrSjnkdrx5s^728530001	       ");
//		list.add("oGKUAwfarW5vJJAPs0yrIbc3JjT4^1492722688	       ");
//		list.add("oGKUAwU_bvfBd1-dpo8AphqRmnZk^1833406136	       ");
//		list.add("oGKUAwdzSfCmA5PxEGvFhNmdvGWE^3190402677	       ");
//		list.add("oGKUAwaTUBWyzqb62d6vKDDyGOEk^3021922566	       ");
//		list.add("oGKUAwfy9AK-cYs27eXPqINMIqzs^1396146172	       ");
//		list.add("oGKUAwVy3doyrQVABCM6FpFxwPJM^3020291688	       ");	
//		list.add("oGKUAwcwdUnpvW2GwWZc4kLekMwk^747849462	       ");
//		list.add("oGKUAwax7CLyiPh-fLnNb-esDcjg^1215752706	       ");
//		list.add("oGKUAwVnhw-Grv1rkURM0-QqtRks^728206088	       ");
//		list.add("oGKUAwXusYwEb9qJSD5cNZ1_NrXg^710892928	       ");
//		list.add("oGKUAwcZMN5BYmGZNvU7I8htVJD0^2417427404	       ");
//		list.add("oGKUAwY-mpmZ9443R9Y-fvXz_bWI^COUOR	       ");
//		list.add("oGKUAwQUGI8GjnH0UVKsczRhBE-U^13116514587	       ");
//		list.add("oGKUAwSOqnXwazT9dEUzX4civkhQ^WENPENG2710	       ");
//		list.add("oGKUAwc8H_PomnI1p4cYhHAJlC8g^87092188	       ");
//		list.add("oGKUAwSaCUygCXy9k2hrS9W6SOK4^1172616175	       ");
//		list.add("oGKUAwUxuj6AjHev7ZKhWNbIoFXw^897806963	       ");
//		list.add("oGKUAwSd6Zc9XhxgzXFlwIXm6gG0^13017714381	       ");
//		list.add("oGKUAwUhRbnZYRRn4qS2ho5Z91cg^13094714436	       ");
//		list.add("oGKUAwWPsu9uu9OBrPPK_DR3NlGM^1135867175	       ");
//		list.add("oGKUAwUTmC5CIpUj2AOFHwVp4EbY^3308373811	       ");
//		list.add("oGKUAwXqDbKqdwtEIF-rc7UDkHmA^1193287584	       ");
//		list.add("oGKUAwRijziI0XOKG7k7i4ut1ERM^1498415657	       ");
//		list.add("oGKUAwcw7D84ynHMKwE3_EdEocXs^121573787	       ");
//		list.add("oGKUAwfo-Vh5S3ympOTv0iV4l-Js^1622235266	       ");
//		list.add("oGKUAwcGCMBGJgsQwYtnf69hUUz4^785891781	       ");
//		list.add("oGKUAwU22aV1hOZt8NnZ_RXWnlMI^570533175	       ");
//		
//		String first = "您好。谢谢参与‘迎2016年，"
//				+ "\n绑定账号领取红包吧活动！"
//				;
//		String keyword1 = "";
//		String keyword3 = "";
//		String keyword2 = "2016年01月18日 ";
//		String remark ="我们确认您是‘非正式会员的状态’,您绑定成功了， 可是您还没有验证成功,剩下验证您的邮箱的流程 请参考我们菜单【免税信息】>【正式会员指南】。非常感谢！如不是正式会员将无法支付红包，请您谅解！";
//		
//		int i = 0;
//		
//		for (String item : list) {
//			i++;
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			keyword1 = array[1].trim();
//			 
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
//		        System.out.println(keyword1 +" , " + keyword2 +" , " +remark);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2,keyword3, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//				System.out.println(i);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	/** 
	 *新世界 16年01月29日 绑定会员通知
	 */
//	private static void tempSendMemberBindingNotice20160129(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************标题绑定会员通知*******************");
//		List<String> list = new ArrayList<String>();
//		
//		
//		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^OH SANGHOON		      ");
//	    list.add("oGKUAwUziAY1jsTD-XAPAvKI-3QA^美美		      ");
//	    list.add("oGKUAwQ8KldNIKfPvro4Y4hMQU6Y^CPF568975363		      ");
//	    list.add("oGKUAwb-EHvUIm_oPFjMckRW8kyI^二高打印社		      ");
//	    list.add("oGKUAwWDFJLpDwP_WYPg1xJV4hGg^木十三		      ");
//	    list.add("oGKUAwcPK-CcIMqnGR_Hkaym7wnI^哈哈		      ");
//	    list.add("oGKUAwWN0b7augijNw56tG0Y_CSM^司恒		      ");
//	    list.add("oGKUAwaurHUf3Gvm0_MZjYyK_60s^青青		      ");
//	    list.add("oGKUAwSf-DowK2AAom8C1a6l60ko^萌萌		      ");
//	    list.add("oGKUAwfeAjF2SnPHRdOEgPwWe0bY^__Crazyヽ各自安好		      ");
//	    list.add("oGKUAwTb6q4-sH0Zo23m2Mophv0Q^冬冬		      ");
//	    list.add("oGKUAwYnaagiGgKMOade8xaXuOdk^天使1号		      ");
//	    list.add("oGKUAwVMarpyLb2sN3uonqSzeXeY^小雪		      ");
//	    list.add("oGKUAwclwxvX3reodHixbe-APJ9c^小希🎀		      ");
//	    list.add("oGKUAweUJoEEDuUmltBP1BtvVEGg^流云		      ");
//	    list.add("oGKUAwR5GGV_na_er2fkntuQC9Rk^情有独钟i		      ");
//	    list.add("oGKUAwYgg4Dt8tlM6MkTRHqd7H8Q^妞子		      ");
//	    list.add("oGKUAwZHUBgTDtTE-2BChZbWyU6E^in		      ");
//	    list.add("oGKUAwSLAQNDPt9OhRYulcD-TSZU^有苦难言i		      ");
//	    list.add("oGKUAwT_Qan6IZcs-RYMtVOLP0IE^美丽心情		      ");
//	    list.add("oGKUAwb4BEd7kQwyc59CSfKTLCaM^嗯		      ");
//	    list.add("oGKUAwe7des0o8AIzwFQ1tqiOzgY^惠化	      ");
//	    list.add("oGKUAwZsv4JFqud75ze1QyKZjJNU^等待		      ");
//	    list.add("oGKUAwfpdvRk9FvIbsF2h5LgzL9M^留言		      ");
//	    list.add("oGKUAwWanCJA01hDfStorSCvsy6M^向天预定下辈子		      ");
//	    list.add("oGKUAwdsyMRnBEeMkQ8Rv9jWZIMA^deer		      ");
//	    list.add("oGKUAwQ2jVMy-7_srpE8pmB5KDaA^A^喵^		      ");
//	    list.add("oGKUAwQccU9d6ffbE9MMNNqBd2ec^白雪		      ");
//	    list.add("oGKUAwSgsBs2y4BQk7NGyHblroEA^刘江		      ");
//	    list.add("oGKUAwduPtVlUD-8_2sCdISqiOt4^蓝胖子。		      ");
//	    list.add("oGKUAwf6CB1OYoPQlzPYCLFWNLJ4^L		      ");
//	    list.add("oGKUAwRM9JYXwt-UCXsx_7BypaUQ^假如		      ");
//	    list.add("oGKUAwS2V635jr07p4Evhd9M3t8o^              -		      ");
//	    list.add("oGKUAwZR1Oot-gNK7jv6-_3CN4yM^妞妞		      ");
//	    list.add("oGKUAwb8FWSL24aBYd6Pidi3B284^紫雪 		      ");
//	    list.add("oGKUAwRonjjrz0QRopnqeYav6oMs^花非花		      ");
//	    list.add("oGKUAwWtpucNo9AKqL7Ul-0goKNA^安然		      ");
//	    list.add("oGKUAwSL6_9B5nuQydEQRzxhtxXA^莫失莫忘 		      ");
//	    list.add("oGKUAwRGpf4HfI87Nt45-kUhXZuY^Xiao桦Ta	      ");
//	    list.add("oGKUAwTGHffp1whjAH6l0XlVU0Uc^映天		      ");
//	    list.add("oGKUAwaHeySVO7dsrD5cSOCCQtc8^淡忘回忆﹎		      ");
//	    list.add("oGKUAwQ5wAuTtLVWsCvzsMjjWTgE^彼岸倾城		      ");
//	    list.add("oGKUAwUaECHOJzHcHahec20cAv8o^脚印		      ");
//	    list.add("oGKUAwawXS_zcPOwhYYT00kCVeCk^Gina		      ");
//	    list.add("oGKUAwT6C_FKjR9fcvDMjiId3y-Y^星落		      ");
//	    list.add("oGKUAwfF_kzC50Wr8OR-GYtjGv7Y^晓兰 		      ");
//	    list.add("oGKUAwSRhNydrf7Onk9yp6CzwBJk^明雪		      ");
//	    list.add("oGKUAwdLqzuLDLpk7zEehk1LL0e8^An		      ");
//	    list.add("oGKUAwWRaQq7f1LfgCZ2JYoJMDF0^马哥		      ");
//	    list.add("oGKUAwfRuSrMbiVEqhWk3a8VGTl0^为欲而生ノ	      ");
//	    list.add("oGKUAwX7PLyqiMuHB7Tu7qfUmglQ^Cyl		      ");
//	    list.add("oGKUAwW_VqFK-SJAZyJb2ssl2Kfk^嘿哈哈		      ");
//	    list.add("oGKUAwaSkAkkghQcnfMLxhn_m1i4^起个名字先		      ");
//	    list.add("oGKUAweRGawM2l8HBYzNu4G9k61I^明月夜		      ");
//	    list.add("oGKUAwV0XvJL7nqMQkFosXkFVOmU^天上人间		      ");
//		
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘仅限1天!5000名！先到先得, 新世界免税店发红包啦~’活动。";
//
//		String keyword1 = "";
//		String keyword2 = "2016-01-29";
//		String remark ="非常感谢您的支持。";
//		
//		int i = 0;
//		for (String item : list) {
//			i++;
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[1].trim();
//			remark = "根据活动规则，注册会员后您必须完成邮箱验证后才能获得2元红包。（您目前为非正式会员状态）"
//					+"\n请参考‘正式会员指南’(点击【免税信息】->【正式会员指南】） "
//					+"\n验证成功截止时间为2016.02.02 10AM"
//					+"\n特此告知您成为邮箱验证后才能获得红包。谢谢参与";
//				 
//				 
//					 
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
//				System.out.println(keyword1 +" , " + keyword2);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2,"", remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	
	
	
	/** 
	 *新世界 16年02月04日 绑定会员通知
	 */
//	private static void tempSendMemberBindingNotice20160204(){
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//		
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("*****************标题绑定会员通知*******************");
//		List<String> list = new ArrayList<String>();
//		
//		
////		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^OH SANGHOON		      ");
////	    list.add("oGKUAwQVbCQZe08k5wahcnwbJNGE^彭伟		      ");
//		list.add("oGKUAwTffvoSZI_geIvi5ykCGXGE^笨笨熊		      ");
//		list.add("oGKUAwR8VqCzG_g4Ex5FibPCvXfc^緈諨离冭薳		      ");
//		list.add("oGKUAwaT0N1teUHiUxCanaJArVsQ^碟雨		      ");
//		list.add("oGKUAwbrveA5f5zxF45VeOG0xBcs^ご啦啦啦ミ		      ");
//		list.add("oGKUAwf3rG1hf_maqwe7JhoidCZQ^A゜心若相依		      ");
//		list.add("oGKUAwSfM9Pa10SQ6A3si_hhOFvY^乐乐		      ");
//		list.add("oGKUAwfU-Fd_Pelileeyte1a5K5Y^然后呢		      ");	
//		list.add("oGKUAwSFHFS5D_WPcLFI0o15xuHc^背影ingvs	      ");
//		list.add("oGKUAwbPdkeP6m_2bHNnEYwKoXZs^小雪球		      ");
//		list.add("oGKUAwatOQTjhrFk-ZnQS4Z1uqdU^文兄1		      ");	
//		list.add("oGKUAwRZxj4DLyXWvw_sOXa2ILl0^旧梦		      ");
//		list.add("oGKUAweHOyXREwi2czOSatt_2Jt4^潇滨		      ");	
//		list.add("oGKUAwXGtIOqFPMPRnjWVsRs6ja0^Fay😘	      ");	
//		list.add("oGKUAwTxw4vzHRqwMV_0nptA7I_k^霆不了的情，锋不了的爱		      ");
//		list.add("oGKUAwdsQerjiTwgEhP9zrz5qrSo^曽曽		      ");
//		list.add("oGKUAwfeimToroJHvHZdNaqrXQY0^First		      ");	
//		list.add("oGKUAwcHQSjez2Xq3v-JAFbVclN0^庆		      ");
//		list.add("oGKUAwYq80c9MQiYUkGu_m9CXWWo^心		      ");
//		list.add("oGKUAwVVmQCnXyFPmjkUmqQfRHgQ^💏💏💘		      ");
//		list.add("oGKUAwdkwsn0BnkyJKe7kZCHfikQ^幸运儿		      ");
//		list.add("oGKUAwXRyXtFsCQFC5-eu_dFB3Zs^深中亦菲颜毒		      ");
//		list.add("oGKUAwTwAQ47rqGaYHMJMqdUGVRs^妮儿		      ");
//		list.add("oGKUAwVtiFS45XtMgws3UubhGlyA^郑太范		      ");
//		list.add("oGKUAwUxZkUFQNr_DM1vofYbSGTw^星星月亮太阳		      ");
//		list.add("oGKUAweYJTzINyCFSWowUuXJ_F40^明年jsjsk		      ");
//		list.add("oGKUAwUhbt5Ez9tZBaFeq-1v4J_Q^活了		      ");
//		list.add("oGKUAwV5hd8B0TgfpABpBaZUgR0Y^xl		      ");
//		list.add("oGKUAwcf6zFahumjjxPeooRRjj5U^宁静的小丫		      ");
//		list.add("oGKUAwXYl5b46wHfZob07a4f_-T8^月		      ");
//		list.add("oGKUAwftNBIfAm9bAoKftRLggMNc^沉默		      ");
//		list.add("oGKUAwdnXTo6J305jGfX1jl2p6LU^陈晓		      ");	
//		list.add("oGKUAwTAoE8-adzcFJWeOTA-LtI4^寒冰		      ");
//		list.add("oGKUAwVgYDDnYYFIUbznHMMy4mZs^流云		      ");
//		list.add("oGKUAwexQMmoPQa815_SBl4D4VTo^小		      ");
//		list.add("oGKUAwQeqLXJsThn1yKV113Zb92c^幕幕雨		      ");
//		list.add("oGKUAwax_ap_P0XoLybCA5iWOm-c^Fabulous		      ");
//		String first = "您好。我们是新世界免税店。"
//				+ "\n谢谢参与 ‘仅限1天!5000名！先到先得, 新世界免税店发红包啦~’活动。";
//
//		String keyword1 = "";
//		String keyword2 = "2016-02-04";
//		String remark ="非常感谢您的支持。";
//		
//		int i = 0;
//		for (String item : list) {
//			i++;
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//			
//			keyword1 = array[1].trim();
//			remark = "根据活动规则，注册会员后您必须完成邮箱验证后才能获得3元红包。（您的现在状态为非正式会员）"
//					+"\n请参考‘正式会员指南’(点击【免税信息】->【正式会员指南】） "
//					+"\n验证成功截止时间为2016.02.05 10AM"
//					+"\n特此告知您成为邮箱验证后才能获得红包。谢谢参与";
//				 
//				 
//					 
//			try {
//				System.out.println(keyword1);
//				System.out.println(remark);
//				System.out.println(keyword1 +" , " + keyword2);
//				messageId = weixinTemplateMessageService.sendMemberBindingNotice(appInfo, openid, first, keyword1, keyword2,"", remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//				System.out.println(i);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
//		
//	}
	
	
	
	/** 
	 *Hmall 中奖结果通知
	 */
	private static void tempSendWinningResultNotice20160205(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
		
		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
		WeixinService weixinService = ac.getBean(WeixinService.class);
		AppInfo appInfo = weixinService.selectAppInfoByShopId(24);
		Long messageId = null;
		System.out.println("*****************中奖结果通知*******************");
		List<String> list = new ArrayList<String>();
		//CommonService commonService = ac.getBean(CommonService.class);
		Map<String,Object> searchMap = new HashMap<String,Object>();
//		
	    List<Map<String, Object>> list1 = weixinTemplateMessageService.selectList("wxi.getOpenIdTemp", searchMap);
		System.out.println(list1.size());
//		list.add("oGKUAwRpeiTtcocBZKq_-DwqDT_M^OH SANGHOON		      ");
//		list.add("ofH0nw2sXFySwG-q9oG_dSeRZOVM");//崔课长
//		list.add("ofH0nw4-hAkOhrhtsGfqYRncHjoc");//伟红
//		list.add("ofH0nwww-ayiz7lsBoPFPHsNQnrs");//surojung
//		list.add("ofH0nwy0_HlzzD5puCqDjLihfw4s");//서재민 Jaemin Seo
//		list.add("ofH0nwxpgK4n1NUR48gP7E2p4Vbk");//朴理事
//		list.add("ofH0nw5QyZYQjs81IvTxbwQwy5lg");//彭伟
//		list.add("ofH0nw4Zr-SpF9BraLba5AAfqGSg");//金维良

//		
		
		
		
		
		
		String first = "恭喜您参与的活动中奖了！";

		String keyword1 = "关注现代Hmall公众号，领取现金积分！";
		String keyword2 = "现代Hmall的现金积分 '10,000 H-point'";
		String remark ="赠送日期：2016年2月24日(周三)"
					  +"\n积分赠送当天(2月24日)基准，用户必须为关注公众账号的状态。"
					  +"\n"
					  +"\n感谢您的参与。";
	
		int h = 0;
		
		for(int i=0; i<list1.size();i++){
			System.out.println(list1.get(i).get("openid").toString());
			h++;
			messageId = weixinTemplateMessageService.sendWinningResultNotice(appInfo, list1.get(i).get("openid").toString(), first, keyword1, keyword2, remark);
			weixinTemplateMessageService.updateSendStatus(messageId, "success");
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
			System.out.println(h);
		}
//		
//		for (String item : list) {
//			h++;
//			System.out.println("=============================");
//			String[] array = item.split("\\^");
//			String openid = array[0];
//			System.out.println("openid==" + openid);
//		 
//					 
//			try {
//				System.out.println(remark);
//				System.out.println(keyword1 +" , " + keyword2);
//				messageId = weixinTemplateMessageService.sendWinningResultNotice(appInfo, openid, first, keyword1, keyword2, remark);
//				weixinTemplateMessageService.updateSendStatus(messageId, "success");
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//				System.out.println(h);
//			} catch (Exception e) {
//				// TODO: handle exception
//			}
//		}
		
	}
//	
	
	
	
	
	public static void main(String[] args) {
 
		
//		tempHumanApplaySuccess();
		
//		tempSendNewMemberJoinRemind();
//		tempSendPurchaseSuccessNotice();
//		tempSendMemberBindingNotice();
//		tempSendMemberBindingNotice20151218();
//		tempSendMemberBindingNotice20151218_01();
//		tempSendMemberBindingNotice20151218_03();
//		tempSendMemberBindingNotice20151224_01();
//		tempSendMemberBindingNotice20151224_02();
//		tempSendEventFinishedNotice20151231();
//		tempSendMemberBindingNotice20160118();
//		tempSendMemberBindingNotice20160129();
//		tempSendWinningResultNotice20160205();  //中奖结果通知（Hmall）
//		tempSendMemberBindingNotice20160204();
		
		
		
		
		
		
		
		
		
		
		
		
//		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
//
//		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
//		WeixinService weixinService = ac.getBean(WeixinService.class);
//		AppInfo appInfo = weixinService.selectAppInfoByShopId(18);
//		Long messageId = null;
//		System.out.println("********************************************************");
//		System.out.println("********************************************************");
//		System.out.println("********************************************************");
//		Long messageId = weixinTemplateMessageService.sendCustLevelChangeNotice(appInfo, "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY", "银冠会员", "22笔", "1028.5元");
//
// 		weixinTemplateMessageService.updateSendStatus(messageId, "success");
//		System.out.println("********************************************************");		
// 		 messageId = weixinTemplateMessageService.sendMileageChangeNotice(appInfo, "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY", "1000分", "无", "8000分");
//
//  		weixinTemplateMessageService.updateSendStatus(messageId, "success");
//		System.out.println("********************************************************");  		
//		messageId = weixinTemplateMessageService.sendRedPackNotice(appInfo, "orWqcjvAVxJlV06t3Mt03E_mwc4Y", "河兌勋", "5元红包一个", "抱歉，因为系统原因，未正常发出红包，现将红包补发给您，快去查收吧~");
//  		
//  		weixinTemplateMessageService.updateSendStatus(messageId, "success");
//		System.out.println("********************************************************"); 		
//		messageId = weixinTemplateMessageService.sendVoucherMaturityRemind(appInfo, "odMFxs32123iFoQT5vyWw0o_9GDw", "xxx,您好","【试吃专享】10元红包", "1407105862546", new Date(), new Date(), "您有一张10元红包，请点开圃美多商城使用。\n如有问题请在圃美多微信服务号直接向小圃留言~");  
//  		weixinTemplateMessageService.updateSendStatus(messageId, "success");
		
		//, String time, String address,String remark) {
			
//		System.out.println("********************************************************");
//		List<String> list = new ArrayList<String>();
////		list.add("o-DlmxEtTi3F9LODq6_9k8del5oA");
//		
//		for (String openid : list) {
//			System.out.println("openid=" + openid);
//			
//			String first = "我们非常抱歉！\n您所收到的“活动报名成功通知”消息是因系统测试出错所致";
//			String remark1 = "LG Human Library";
//			String remark2 = "“活动报名成功”通知撤销由于系统技术测试问题，“报名成功”的消息属误操作，谅海涵！";
//			String remark = "";
//			
//			messageId = weixinTemplateMessageService.sendNoticePublish(appInfo, openid
//	  				,first
//	  				,remark1
//	  				,remark2
//	  				,remark 
//	  				);  
//	  		weixinTemplateMessageService.updateSendStatus(messageId, "success");
//		}
//		System.out.println("********************************************************");
		
	}

}
