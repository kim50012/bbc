package com.waremec.weixin.service;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.LogUtils;
import com.waremec.weixin.action.XmlTemplete;
import com.waremec.weixin.aes.WXBizMsgCrypt;
import com.waremec.weixin.dao.WeixinMessageDao;
import com.waremec.weixin.dao.WeixinTemplateMessageDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.ExecutionLog;
import com.waremec.weixin.domain.dkf.CheckDkf;
import com.waremec.weixin.domain.msg.EventLocation;
import com.waremec.weixin.domain.msg.Image;
import com.waremec.weixin.domain.msg.Link;
import com.waremec.weixin.domain.msg.Location;
import com.waremec.weixin.domain.msg.Text;
import com.waremec.weixin.domain.msg.Video;
import com.waremec.weixin.domain.msg.Voice;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.thread.DownloadImageMsgThread;
import com.waremec.weixin.thread.ExecutionLoggingThread;
import com.waremec.weixin.thread.MenuClickThread;
import com.waremec.weixin.thread.QRCodeEventThread;
import com.waremec.weixin.thread.SendMsgThread;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.ServletRequestUtils;
import com.waremec.weixin.utils.WeixinResponseMessageUtils;
import com.waremec.weixin.utils.XmlUtils;

/** 
* @Package com.waremec.weixin.service 
* @FileName WeixinMessageService
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:06:30 
*  
*/
@Service
public class WeixinMessageService extends CommonServiceImpl implements CommonService {

	private final transient Log logger = LogFactory.getLog(this.getClass());

	@Resource
	private WeixinService weixinService;
	@Resource
	private WeixinUserService weixinUserService;
	@Resource
	private WeixinCustomService weixinCustomService;

	@Resource
	private WeixinMessageDao weixinMessageDao;
	
	@Resource
	private WeixinTemplateMessageDao weixinTemplateMessageDao;
	
	
	/** 
	* 处理微信服务器发送来的消息并回复消息  - 版本2
	* 备注：对于微信服务器推送的消息，将消息先存储，先返回success给微信服务器.
	* 后台可后续再处理消息，如果需要回复用户消息，可通过调用客服消息接口API再回复用户消息.
	* 已此来解决请求超时问题
	* @param request
	* @param appInfo
	* @return
	* @throws Exception
	*/
	public String processingAndReplyMessage(HttpServletRequest request, AppInfo appInfo) throws Exception{
		
		Date startTime =new Date();
		
//		假如服务器无法保证在五秒内处理并回复，必须做出下述回复，
//		这样微信服务器才不会对此作任何处理，并且不会发起重试
//		（这种情况下，可以使用客服消息接口进行异步回复），
//		否则，将出现严重的错误提示。详见下面说明：
//		
//		1、直接回复空串（指字节长度为0的空字符串，而不是XML结构体中content字段的内容为空）
//		2、直接回复success
		String returnMsg = "";
		
		String postData= ServletRequestUtils.readStreamParameter(request);
//		logger.info("===============================postData===============================");
//		logger.info(postData);
//		logger.info("===============================postData===============================");
		if(StringUtils.isEmpty(postData)){
			logger.error("<<WXPR00001>>");
			throw new Exception("postData is null!!!!!!!");
		} 
		
		String signature  	= request.getParameter("signature"); //微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
		String timestamp  	= request.getParameter("timestamp"); //时间戳
		String nonce  		= request.getParameter("nonce");	 //随机数
		String encrypt_type = request.getParameter("encrypt_type");//加密类型 raw:不加密 ,aes:aes加密
		String msg_signature= request.getParameter("msg_signature");//对消息体的签名
		
		logger.info(LogUtils.format("signature") 	+ signature);
		logger.info(LogUtils.format("timestamp") 	+ timestamp);
		logger.info(LogUtils.format("nonce") 		+ nonce);
		logger.info(LogUtils.format("encrypt_type") + encrypt_type);
		logger.info(LogUtils.format("msg_signature")+ msg_signature);
		logger.info(LogUtils.format("postData") 	+ postData);
		
		
		String time 		= "";
		String ToUserName 	= ""; // 开发者微信号
		String FromUserName = ""; // 发送方帐号（一个OpenID）
		String CreateTime 	= ""; // 消息创建时间 （整型）
		String MsgType 		= ""; // 消息类型
		String Event 		= "";// 事件类型
		String EventKey  	= "";// 事件KEY值
		String MsgId	 	= "";// 消息id，64位整型
		
		Map<String,String> requestMap = null;
		WXBizMsgCrypt pc = null;
		
		if(StringUtils.isEmpty(encrypt_type)){
			logger.error("<<WXPR00002>>");
			logger.info("**************** 微信平台 ==> Server ********************");
			logger.info("postData=\n" + postData);
			logger.info("**************** 微信平台 ==> Server end ****************");
			
			// 调用parseXml方法解析xml格式请求消息到map里
			requestMap = XmlUtils.parseXml2Map(postData);
		}else if("aes".equals(encrypt_type)){//消息加密方式 ： 加密
			//解密消息
			pc = new WXBizMsgCrypt(appInfo.getToken(), appInfo.getEncordingAesKey(), appInfo.getAppId());
			String decryptedData =  pc.decryptMsg(msg_signature, timestamp, nonce, postData);
			logger.info("**************** 微信平台 ==> Server ********************");
			logger.info("decryptedData=\n" + decryptedData);
			logger.info("**************** 微信平台 ==> Server end ****************");
			
			// 调用parseXml方法解析xml格式请求消息到map里
			requestMap = XmlUtils.parseXml2Map(decryptedData);
		} 
			
			
		time = System.currentTimeMillis() + "";
		ToUserName 	 = requestMap.get("ToUserName");	// 开发者微信号
		FromUserName = requestMap.get("FromUserName");	// 发送方帐号（一个OpenID）
		CreateTime 	 = requestMap.get("CreateTime");	// 消息创建时间 （整型）
		MsgType 	 = requestMap.get("MsgType");		// 消息类型

		logger.info(LogUtils.format("ToUserName") 	+ ToUserName);
		logger.info(LogUtils.format("FromUserName")	+ FromUserName);
		logger.info(LogUtils.format("CreateTime")  	+ CreateTime);
		logger.info(LogUtils.format("MsgType") 		+ MsgType);
		
		
		if (Constants.MsgType.EVENT.equals(MsgType)) {//接收事件推送
			Event = requestMap.get("Event");// 事件类型
			logger.info(LogUtils.format("Event") + Event);
			
			if (Constants.Event.SUBSCRIBE.equals(Event)) {// 关注事件 OR 扫描带参数二维码事件(用户未关注时，进行关注后的事件推送)
				String token = weixinService.getAccessToken(appInfo);
				// 保存关注用户信息
				WXUser user = new WXUser();
				user.setSysId(appInfo.getSysId());
				user.setOpenid(FromUserName);
				weixinUserService.userSubscribe(token, user);
				
				logger.info("000000000000000000:User SUBSCRIBE");
				
				Thread msgThread = new Thread(new SendMsgThread(request, weixinService,weixinMessageDao, appInfo, requestMap,"关注"));
				msgThread.start();
				logger.info("000000000000000001:User SUBSCRIBE");
				EventKey = requestMap.get("EventKey");// 事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
				if(StringUtils.isNotBlank(EventKey)){
					logger.info(LogUtils.format("EventKey") + EventKey);
					try {
						Thread thread = new Thread(new QRCodeEventThread(request, weixinService,weixinMessageDao, appInfo, requestMap));
						thread.start();
					} catch (Exception e) {
						// TODO: handle exception
						logger.error("thread0000000000:" + e.getMessage());
					}
				}
				
				logger.info("000000000000000002:User SUBSCRIBE");
					
				//新世界发送红包 -ended
//					if(appInfo.getSysId().equals("XB4EPA9I5XSOPQHBE69JILV3AMQJY8VN") 
//							|| appInfo.getSysId().equals("ZPC80I3JVOCTII09AFHKFY10CCYWNJRH")
//							|| appInfo.getSysId().equals("8D6ED58C805242C8BDB129616163CB04")){
//						try {
//							logger.info("000000000000000004:User SUBSCRIBE");
//							logger.info("thread0000000011: send read park>>>>>>>>>>>>>>>>>" );
//							
//							Thread thread = new Thread(new ShinSeGaeEvent10ReadParkThread(request, weixinService,appInfo, FromUserName));
//							thread.start();
//						} catch (Exception e) {
//							// TODO: handle exception
//							logger.error("thread0000000011:" + e.getMessage());
//						}
//					}
				//ShinSeGaeEvent10ReadParkThread
				//新世界发送红包 END
					
					
					
//					// 获取欢迎词
//					returnMsg = WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getSubscribeMessage(appInfo));
					
			}else if (Constants.Event.UNSUBSCRIBE.equals(Event)) {// 取消关注事件
				WXUser user = new WXUser();
				user.setSysId(appInfo.getSysId());
				user.setOpenid(FromUserName);
				weixinUserService.userUnsubscribe(user);
			}else if(Constants.Event.SCAN.equals(Event)) {// 扫描带参数二维码事件(用户已关注时的事件推送)
				EventKey = requestMap.get("EventKey");// 事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
				String Ticket = requestMap.get("Ticket");// Ticket  二维码的ticket，可用来换取二维码图片
				
				logger.info(LogUtils.format("EventKey") + EventKey);
				logger.info(LogUtils.format("Ticket") 	+ Ticket);
				
				try {
					Thread thread = new Thread(new QRCodeEventThread(request, weixinService, weixinMessageDao, appInfo, requestMap));
					thread.start();
				} catch (Exception e) {
					// TODO: handle exception
					logger.error("thread11111111111:" + e.getMessage());
				}
				 
			}else if(Constants.Event.LOCATION.equals(Event)) {// 上报地理位置事件
				String Latitude  = requestMap.get("Latitude");  //地理位置纬度
				String Longitude = requestMap.get("Longitude"); //地理位置经度
				String Precision = requestMap.get("Precision"); //地理位置精度
				
				logger.info(LogUtils.format("Latitude") 	+ Latitude);
				logger.info(LogUtils.format("Longitude") 	+ Longitude);
				logger.info(LogUtils.format("Precision") 	+ Precision);
				
			}else if(Constants.Event.CLICK.equals(Event)) {// 自定义菜单事件(点击菜单拉取消息时的事件推送)
				EventKey = requestMap.get("EventKey"); // 事件KEY值，与自定义菜单接口中KEY值对应
				logger.info(LogUtils.format("EventKey") + EventKey);
				
				
				try {
					Thread thread = new Thread(new MenuClickThread(request, weixinService,weixinMessageDao, appInfo, requestMap,Integer.valueOf(EventKey)));
					thread.start();
				} catch (Exception e) {
					// TODO: handle exception
					logger.error("thread33333333333:" + e.getMessage());
				}
				//用MenuClickThread主动推送的方式代替下面被动回复及菜单点击记录线程
//				try {
//					Thread thread = new Thread(new MenuClickLoggingThread(appInfo,FromUserName,EventKey ,weixinService));
//					thread.start();
//				} catch (Exception e) {
//					// TODO: handle exception
//					logger.error("thread33333333333:" + e.getMessage());
//				}
//				return WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getClickEventReturnMessage(appInfo, Integer.valueOf(EventKey)));
			
			}else if(Constants.Event.VIEW.equals(Event)) {// 自定义菜单事件(点击菜单跳转链接时的事件推送)
				EventKey = requestMap.get("EventKey");// 事件KEY值，设置的跳转URL
				logger.info(LogUtils.format("EventKey") + EventKey);
			}else if(Constants.Event.SCANCODE_PUSH.equals(Event)) {// 自定义菜单事件-(扫码推事件)
				EventKey = requestMap.get("EventKey");
//					Element ScanCodeInfo = root.element("ScanCodeInfo");
//					String ScanType = ScanCodeInfo.elementTextTrim("ScanType");
//					String ScanResult = ScanCodeInfo.elementTextTrim("ScanResult");
				logger.info(LogUtils.format("EventKey") + EventKey);
//					logger.info("ScanType=========" + ScanType);
//					logger.info("ScanResult=========" + ScanResult);
			}else if(Constants.Event.SCANCODE_WAITMSG.equals(Event)) {// 自定义菜单事件-(扫码推事件且弹出“消息接收中”提示框)
				EventKey = requestMap.get("EventKey");
//					Element ScanCodeInfo = root.element("ScanCodeInfo");
//					String ScanType = ScanCodeInfo.elementTextTrim("ScanType");
//					String ScanResult = ScanCodeInfo.elementTextTrim("ScanResult");
				logger.info(LogUtils.format("EventKey") + EventKey);
//					logger.info("ScanType=========" + ScanType);
//					logger.info("ScanResult=========" + ScanResult);
			}else if(Constants.Event.PIC_SYSPHOTO.equals(Event) || Constants.Event.PIC_WEIXIN.equals(Event)
					|| Constants.Event.PIC_PHOTO_OR_ALBUM.equals(Event)) {// 自定义菜单事件-(弹出系统拍照发图,弹出微信相册发图器,弹出拍照或者相册发图)
				EventKey = requestMap.get("EventKey");
				logger.info(LogUtils.format("EventKey") + EventKey);
				// logger.info("Count=========" + Count);
				// logger.info("PicMd5Sum=========" + PicMd5Sum);

			}else if(Constants.Event.LOCATION_SELECT.equals(Event)) {// 自定义菜单事件(弹出地理位置选择器)
				EventKey = requestMap.get("EventKey");
				// Element SendLocationInfo = root.element("SendLocationInfo");
				// String Location_X =
				// SendLocationInfo.elementTextTrim("Location_X");
				// String Location_Y =
				// SendLocationInfo.elementTextTrim("Location_Y");
				// String Scale = SendLocationInfo.elementTextTrim("Scale");
				// String Label = SendLocationInfo.elementTextTrim("Label");
				// String Poiname = SendLocationInfo.elementTextTrim("Poiname");

				logger.info(LogUtils.format("EventKey") + EventKey);
				// logger.info("Location_X=========" + Location_X);
				// logger.info("Location_Y=========" + Location_Y);
				// logger.info("Scale=========" + Scale);
				// logger.info("Label=========" + Label);
				// logger.info("Poiname=========" + Poiname);

			}else if(Constants.Event.KF_CREATE_SESSION.equals(Event)) {// 多客服会话控制-接入会话 
				String KfAccount = requestMap.get("KfAccount"); 
				logger.info(LogUtils.format("KfAccount") + KfAccount);
				// TODO: handle biz
			}else if(Constants.Event.KF_CLOSE_SESSION.equals(Event)) {//  多客服会话控制-关闭会话
				String KfAccount = requestMap.get("KfAccount"); 
				logger.info(LogUtils.format("KfAccount") + KfAccount);
				// TODO: handle biz
			}else if(Constants.Event.KF_SWITCH_SESSION.equals(Event)) {//  多客服会话控制-转接会话
				String FromKfAccount = requestMap.get("FromKfAccount"); 
				String ToKfAccount = requestMap.get("ToKfAccount"); 
				
				logger.info(LogUtils.format("FromKfAccount") + FromKfAccount);
				logger.info(LogUtils.format("ToKfAccount") + ToKfAccount);
				// TODO: handle biz
			}else if (Constants.Event.MASSSENDJOBFINISH.equals(Event)) {//群发任务  
				String MsgID = requestMap.get("MsgID");  //群发的消息ID
				String Status = requestMap.get("Status"); //群发的结构，为“send success”或“send fail”或“err(num)”。
														    //但send success时，也有可能因用户拒收公众号的消息、
														  	//系统错误等原因造成少量用户接收失败。
															//err(num)是审核失败的具体原因，可能的情况如下：
															//		err(10001) - 涉嫌广告 
															//		err(20001) - 涉嫌政治 
															//		err(20004) - 涉嫌社会 
															//		err(20002) - 涉嫌色情 
															//		err(20006) - 涉嫌违法犯罪 
															//		err(20008) - 涉嫌欺诈 
															//		err(20013) - 涉嫌版权 
															//		err(22000) - 涉嫌互推(互相宣传) 
															//		err(21000) - 涉嫌其他
				String TotalCount = requestMap.get("TotalCount"); 	//group_id下粉丝数；或者openid_list中的粉丝数
				String FilterCount = requestMap.get("FilterCount"); //过滤（过滤是指特定地区、性别的过滤、用户设置拒收的过滤，
																	//用户接收已超4条的过滤）后，准备发送的粉丝数，原则上，
																	//FilterCount = SentCount + ErrorCount
				String SentCount = requestMap.get("SentCount"); //发送成功的粉丝数
				String ErrorCount = requestMap.get("ErrorCount"); //发送失败的粉丝数
				
				logger.info(LogUtils.format("MsgID") 		+ MsgID);
				logger.info(LogUtils.format("Status") 		+ Status);
				logger.info(LogUtils.format("TotalCount") 	+ TotalCount);
				logger.info(LogUtils.format("FilterCount") 	+ FilterCount);
				logger.info(LogUtils.format("SentCount") 	+ SentCount);
				logger.info(LogUtils.format("ErrorCount") 	+ ErrorCount);
				
				if("send success".equals(Status)){
					// TODO: handle biz
				}else{
					// TODO: handle biz
				}
			}else if(Constants.Event.TEMPLATESENDJOBFINISH.equals(Event)) {// 模版消息发送任务完成后 
				String MsgID = requestMap.get("MsgID"); //消息id
				String Status = requestMap.get("Status"); //发送状态为成功
				
				logger.info(LogUtils.format("MsgID") 	+ MsgID);
				logger.info(LogUtils.format("Status") 	+ Status);
				
				weixinTemplateMessageDao.updateSendStatus(Long.valueOf(MsgID), Status);
				
				if("success".equals(Status)){
//					1、送达成功时，推送的XML如下：
//					<xml>
//			           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
//			           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
//			           <CreateTime>1395658920</CreateTime>
//			           <MsgType><![CDATA[event]]></MsgType>
//			           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
//			           <MsgID>200163836</MsgID>
//			           <Status><![CDATA[success]]></Status>
//			           </xml>
					// TODO: handle biz
				}else{
//						2、送达由于用户拒收（用户设置拒绝接收公众号消息）而失败时，推送的XML如下：
//						 <xml>
//				           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
//				           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
//				           <CreateTime>1395658984</CreateTime>
//				           <MsgType><![CDATA[event]]></MsgType>
//				           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
//				           <MsgID>200163840</MsgID>
//				           <Status><![CDATA[failed:user block]]></Status>
//				           </xml>
					
//						3、送达由于其他原因失败时，推送的XML如下：
//						 <xml>
//				           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
//				           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
//				           <CreateTime>1395658984</CreateTime>
//				           <MsgType><![CDATA[event]]></MsgType>
//				           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
//				           <MsgID>200163840</MsgID>
//				           <Status><![CDATA[failed: system failed]]></Status>
//				           </xml>
					
					// TODO: handle biz
				}
			}
			
		}else{//接收普通消息
			
			
			
			if (Constants.MsgType.TEXT.equals(MsgType)) {// 接收普通消息 - 文本消息
				String Content = requestMap.get("Content");// 文本消息内容
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("Content") 	+ Content);
				logger.info(LogUtils.format("MsgId") 	+ MsgId);
				
				Text textMsg = new Text(appInfo.getSysId(), MsgId, FromUserName, ToUserName, CreateTime, MsgType, Content);
				insertTextMsg(textMsg);
				logger.info("inserted....");
				
				//判断是否将消息转发至多客服
				CheckDkf checkDkf = weixinCustomService.checkIsUseDkf(appInfo, Content);
				if(checkDkf.isDkf()){//使用多客服系统
					
					logger.info("<<<<<<<<forword to dkf>>>>>>>>");
					logger.info("is auto=>" + checkDkf.isAuto() + ", kf_aacount=>" + checkDkf.getKf_account());
					logger.info("<<<<<<<<forword to dkf>>>>>>>>");
					
					if(checkDkf.isAuto()){//消息转发到多客服
						String responseMsg =  XmlTemplete.transferCustomerService(FromUserName, ToUserName, time);
						logger.info("将消息转发至多客服");
						logger.info("transfer_customer_service1===" + responseMsg);
						if(pc != null){
							return pc.encryptMsg(responseMsg, time, nonce);
						}else{
							return responseMsg;
						}
					}else{//消息转发到指定客服
						String responseMsg =  XmlTemplete.transferCustomerService(FromUserName, ToUserName, time, checkDkf.getKf_account());
						logger.info("消息转发到指定客服");
						logger.info("transfer_customer_service2===" + responseMsg);
						if(pc != null){
							return pc.encryptMsg(responseMsg, time, nonce);
						}else{
							return responseMsg;
						}
					}
					
				}else{
					Thread msgThread = new Thread(new SendMsgThread(request, weixinService,weixinMessageDao, appInfo, requestMap,Content));
					msgThread.start();
					
//						returnMsg = WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getReturnMessage(appInfo, Content));
					
				}
				
				 
				
				
			}else if (Constants.MsgType.IMAGE.equals(MsgType)) {// 接收普通消息 - 图片消息
				String PicUrl = requestMap.get("PicUrl");// 图片链接
				String MediaId = requestMap.get("MediaId");// 图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("PicUrl") 	+ PicUrl);
				logger.info(LogUtils.format("MediaId") 	+ MediaId);
				logger.info(LogUtils.format("MsgId") 	+ MsgId);
				
				com.waremec.weixin.domain.msg.Image image = new com.waremec.weixin.domain.msg.Image(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,PicUrl);
//					insertImageMsg(image);
				
				Thread msgThread = new Thread(new DownloadImageMsgThread(request,appInfo, image));
				msgThread.start();
				
			}else if (Constants.MsgType.VOICE.equals(MsgType)) {// 接收普通消息 - 语音消息
				String MediaId = requestMap.get("MediaId");// 语音消息媒体id，可以调用多媒体文件下载接口拉取数据。。
				String Format = requestMap.get("Format");// 语音格式，如amr，speex等
				@SuppressWarnings("unused")
				String Recognition = requestMap.get("Recognition");// 语音识别结果，UTF8编码
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("MediaId") 		+ MediaId);
				logger.info(LogUtils.format("Format") 		+ Format);
				logger.info(LogUtils.format("Recognition") 	+ Recognition);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				 
				Voice vocie = new Voice(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,Format);
				insertVoiceMsg(vocie);
				
			}else if (Constants.MsgType.VIDEO.equals(MsgType)) {// 接收普通消息 - 视频消息
				String MediaId = requestMap.get("MediaId");// 视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
				String ThumbMediaId = requestMap.get("ThumbMediaId");// 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
			
				logger.info(LogUtils.format("MediaId") 		+ MediaId);
				logger.info(LogUtils.format("ThumbMediaId") + ThumbMediaId);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Video video = new Video(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,ThumbMediaId);
				insertVideoMsg(video);
			}else if (Constants.MsgType.SHORTVIDEO.equals(MsgType)) {// 接收普通消息 - 小视频消息
				String MediaId = requestMap.get("MediaId");// 视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
				String ThumbMediaId = requestMap.get("ThumbMediaId");// 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
			
				logger.info(LogUtils.format("MediaId") 		+ MediaId);
				logger.info(LogUtils.format("ThumbMediaId") + ThumbMediaId);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Video video = new Video(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,ThumbMediaId);
				insertVideoMsg(video);
			}else if (Constants.MsgType.LOCATION.equals(MsgType)) {// 接收普通消息 -
				// 地理位置消息
				String Location_X = requestMap.get("Location_X");// 地理位置维度
				String Location_Y = requestMap.get("Location_Y");// 地理位置经度
				String Scale = requestMap.get("Scale");// 地图缩放大小
				String Label = requestMap.get("Label");// 地理位置信息
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
			 
				logger.info(LogUtils.format("Location_X") 	+ Location_X);
				logger.info(LogUtils.format("Location_Y") 	+ Location_Y);
				logger.info(LogUtils.format("Scale") 		+ Scale);
				logger.info(LogUtils.format("Label") 		+ Label);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Location location = new Location(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, Location_X,Location_Y,Scale,Label);
				insertLocationMsg(location);
			}else if (Constants.MsgType.LINK.equals(MsgType)) {// 接收普通消息 - 链接消息
				String Title = requestMap.get("Title");// 消息标题
				String Description = requestMap.get("Description");// 消息描述
				String Url = requestMap.get("Url");// 消息链接
				MsgId = requestMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("Title") 		+ Title);
				logger.info(LogUtils.format("Description") 	+ Description);
				logger.info(LogUtils.format("Url") 			+ Url);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Link link = new Link(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, Title,Description,Url);
				insertLinkMsg(link);
				
			} 
			
		}
		
		
	 
		
		
		//记录执行时间日志
		long executeTime = System.currentTimeMillis() - startTime.getTime();
		logger.info("executeTime=== "+ executeTime );
		
		ExecutionLog  log = new ExecutionLog();
		log.setSysId(appInfo.getSysId());
		log.setShopId(appInfo.getShopId());
		log.setStartTime(startTime);
		log.setExecuteTime(executeTime);
		log.setToUserName(ToUserName);
		log.setFromUserName(FromUserName);
		log.setCreateTime(CreateTime);
		log.setMsgType(MsgType);
		log.setEvent(Event);
		log.setEventKey(EventKey);
		log.setMsgId(MsgId);
		
		
		Thread thread = new Thread(new ExecutionLoggingThread(weixinService,Constants.LogType.WX_SERVER_IF, log));
		thread.start();
		
		return returnMsg;
	}

	/**
	 * 处理微信服务器发送来的消息并回复消息 - 版本1 将于2015-08-10日取消此方法，用新方法来代替
	 * 
	 * 备注：有时在5秒钟内无法处理消息，导致微信提示错误，所以用改版后的方法来处理
	 * @param requestMap
	 * @return
	 * @throws Exception 
	 */
	@Deprecated
	public String processingAndReturnMessage(HttpServletRequest request, AppInfo appInfo) throws Exception {
		// TODO Auto-generated method stub
		
		String returnMsg = "";
		
		String postData= ServletRequestUtils.readStreamParameter(request);
//		logger.info("===============================postData===============================");
//		logger.info(postData);
//		logger.info("===============================postData===============================");
		if(!StringUtils.isEmpty(postData)){
			String signature  	= request.getParameter("signature"); //微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
			String timestamp  	= request.getParameter("timestamp"); //时间戳
			String nonce  		= request.getParameter("nonce");	 //随机数
			String encrypt_type = request.getParameter("encrypt_type");//加密类型 raw:不加密 ,aes:aes加密
			String msg_signature= request.getParameter("msg_signature");//对消息体的签名
			
			logger.info(LogUtils.format("signature") 	+ signature);
			logger.info(LogUtils.format("timestamp") 	+ timestamp);
			logger.info(LogUtils.format("nonce") 		+ nonce);
			logger.info(LogUtils.format("encrypt_type") + encrypt_type);
			logger.info(LogUtils.format("msg_signature")+ msg_signature);
			logger.info(LogUtils.format("postData") 	+ postData);
			
			if("aes".equals(encrypt_type)){//消息加密方式 ： 加密
				WXBizMsgCrypt pc = new WXBizMsgCrypt(appInfo.getToken(), appInfo.getEncordingAesKey(), appInfo.getAppId());
				String decryptedData =  pc.decryptMsg(msg_signature, timestamp, nonce, postData);
				logger.info("============ 微信平台=>Server =====================");
				logger.info("decryptedData=\n" + decryptedData);
				logger.info("============ 微信平台=>Server END =================");
				
				// 调用parseXml方法解析请求消息
				Map<String,String> requestMap = XmlUtils.parseXml2Map(decryptedData);
			 
				String time = System.currentTimeMillis() + "";
				String fromUserName = requestMap.get("FromUserName");// 发送方帐号
				String toUserName = requestMap.get("ToUserName");// 开发者微信号
				String createTime = requestMap.get("CreateTime");// Time
				String msgType = requestMap.get("MsgType");// 消息类型

				logger.info(LogUtils.format("FromUserName")	+ fromUserName);
				logger.info(LogUtils.format("ToUserName") 	+ toUserName);
				logger.info(LogUtils.format("CreateTime")  	+ createTime);
				logger.info(LogUtils.format("MsgType") 		+ msgType);
				///
				if (Constants.MsgType.EVENT.equals(msgType)) {// 接收事件推送
					// 事件类型
					String event = requestMap.get("Event");
					logger.info(LogUtils.format("Event") + event);
				 
					if (Constants.Event.SUBSCRIBE.equals(event)) {// 关注 OR  扫描带参数二维码事件(用户未关注时，进行关注后的事件推送)
						String token = weixinService.getAccessToken(appInfo);
						// 保存关注用户信息
						WXUser user = new WXUser();
						user.setSysId(appInfo.getSysId());
						user.setOpenid(fromUserName);
						weixinUserService.userSubscribe(token, user);
						
						String eventKey = requestMap.get("EventKey");// 事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
						if(StringUtils.isNotBlank(eventKey)){
							logger.info(LogUtils.format("EventKey") + event);
							try {
								Thread thread = new Thread(new QRCodeEventThread(request, weixinService,weixinMessageDao, appInfo, requestMap));
								thread.start();
							} catch (Exception e) {
								// TODO: handle exception
								logger.error("thread0000000000:" + e.getMessage());
							}
						}
						
						// 获取欢迎词
						return WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getSubscribeMessage(appInfo));
						
					} else if (Constants.Event.UNSUBSCRIBE.equals(event)) {// 取消关注
						
						WXUser user = new WXUser();
						user.setSysId(appInfo.getSysId());
						user.setOpenid(fromUserName);
						weixinUserService.userUnsubscribe(user);
						
					} else if (Constants.Event.SCAN.equals(event)) {// 用户已关注时的事件推送
						String eventKey = requestMap.get("EventKey");// 事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
						String ticket = requestMap.get("Ticket");// Ticket  二维码的ticket，可用来换取二维码图片
						
						logger.info(LogUtils.format("EventKey") + eventKey);
						logger.info(LogUtils.format("Ticket") 	+ ticket);
						
						try {
							Thread thread = new Thread(new QRCodeEventThread(request, weixinService, weixinMessageDao, appInfo, requestMap));
							thread.start();
						} catch (Exception e) {
							// TODO: handle exception
							logger.error("thread11111111111:" + e.getMessage());
						}
						 

					} else if (Constants.Event.LOCATION.equals(event)) {// 上报地理位置事件
						String longitude = requestMap.get("Longitude");
						String latitude = requestMap.get("Latitude");
						String precision = requestMap.get("Precision");
						logger.info("Longitude=========" + longitude);
						logger.info("Latitude=========" + latitude);
						logger.info("Precision=========" + precision);
						
						logger.info(LogUtils.format("Longitude") 	+ longitude);
						logger.info(LogUtils.format("Latitude") 	+ latitude);
						logger.info(LogUtils.format("Precision") 	+ precision);
						
						
						
					} else if (Constants.Event.CLICK.equals(event)) {// 自定义菜单事件-点击菜单拉取消息时的事件推送
						String eventKey = requestMap.get("EventKey");// 事件KEY值，与自定义菜单接口中KEY值对应
						logger.info(LogUtils.format("EventKey") + eventKey);
						return WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getClickEventReturnMessage(appInfo, Integer.valueOf(eventKey)));
						
					} else if (Constants.Event.VIEW.equals(event)) {// 自定义菜单事件-点击菜单跳转链接时的事件推送
						String eventKey = requestMap.get("EventKey");// 事件KEY值，设置的跳转URL
						logger.info(LogUtils.format("EventKey") + eventKey);
					} else if (Constants.Event.SCANCODE_PUSH.equals(event)) {// 自定义菜单事件-
						String eventKey = requestMap.get("EventKey");
//						Element ScanCodeInfo = root.element("ScanCodeInfo");
//						String ScanType = ScanCodeInfo.elementTextTrim("ScanType");
//						String ScanResult = ScanCodeInfo.elementTextTrim("ScanResult");
						logger.info("EventKey=========" + eventKey);
//						logger.info("ScanType=========" + ScanType);
//						logger.info("ScanResult=========" + ScanResult);
					} else if (Constants.Event.SCANCODE_WAITMSG.equals(event)) {// 自定义菜单事件-
						String eventKey = requestMap.get("EventKey");
//						Element ScanCodeInfo = root.element("ScanCodeInfo");
//						String ScanType = ScanCodeInfo.elementTextTrim("ScanType");
//						String ScanResult = ScanCodeInfo.elementTextTrim("ScanResult");
						logger.info("EventKey=========" + eventKey);
//						logger.info("ScanType=========" + ScanType);
//						logger.info("ScanResult=========" + ScanResult);
					} else if (Constants.Event.PIC_SYSPHOTO.equals(event) || Constants.Event.PIC_WEIXIN.equals(event)
							|| Constants.Event.PIC_PHOTO_OR_ALBUM.equals(event)) {// 自定义菜单事件-
						String eventKey = requestMap.get("EventKey");
						logger.info("EventKey=========" + eventKey);
						// logger.info("Count=========" + Count);
						// logger.info("PicMd5Sum=========" + PicMd5Sum);

					} else if (Constants.Event.LOCATION_SELECT.equals(event)) {// 自定义菜单事件-
						String eventKey = requestMap.get("EventKey");
						// Element SendLocationInfo = root.element("SendLocationInfo");
						// String Location_X =
						// SendLocationInfo.elementTextTrim("Location_X");
						// String Location_Y =
						// SendLocationInfo.elementTextTrim("Location_Y");
						// String Scale = SendLocationInfo.elementTextTrim("Scale");
						// String Label = SendLocationInfo.elementTextTrim("Label");
						// String Poiname = SendLocationInfo.elementTextTrim("Poiname");

						logger.info("EventKey=========" + eventKey);
						// logger.info("Location_X=========" + Location_X);
						// logger.info("Location_Y=========" + Location_Y);
						// logger.info("Scale=========" + Scale);
						// logger.info("Label=========" + Label);
						// logger.info("Poiname=========" + Poiname);

					}else if (Constants.Event.KF_CREATE_SESSION.equals(event)) {// 多客服会话控制-接入会话 
						String kfAccount = requestMap.get("KfAccount"); 
						
						logger.info(LogUtils.format("KfAccount") + kfAccount);
						
						// TODO: handle biz
					}else if (Constants.Event.KF_CLOSE_SESSION.equals(event)) {//  多客服会话控制-关闭会话
						String kfAccount = requestMap.get("KfAccount"); 
						logger.info(LogUtils.format("KfAccount") + kfAccount);
						
						// TODO: handle biz
						
					}else if (Constants.Event.KF_SWITCH_SESSION.equals(event)) {//  多客服会话控制-转接会话
						String fromKfAccount = requestMap.get("FromKfAccount"); 
						String toKfAccount = requestMap.get("ToKfAccount"); 
						
						logger.info(LogUtils.format("FromKfAccount") + fromKfAccount);
						logger.info(LogUtils.format("ToKfAccount") + toKfAccount);
						
						// TODO: handle biz
						
					}else if (Constants.Event.MASSSENDJOBFINISH.equals(event)) {//群发任务  
						String msgID = requestMap.get("MsgID"); 
						String status = requestMap.get("Status"); 
						String totalCount = requestMap.get("TotalCount"); 
						String filterCount = requestMap.get("FilterCount"); 
						String sentCount = requestMap.get("SentCount"); 
						String errorCount = requestMap.get("ErrorCount"); 
						
						logger.info(LogUtils.format("MsgID") 		+ msgID);
						logger.info(LogUtils.format("Status") 		+ status);
						logger.info(LogUtils.format("TotalCount") 	+ totalCount);
						logger.info(LogUtils.format("FilterCount") 	+ filterCount);
						logger.info(LogUtils.format("SentCount") 	+ sentCount);
						logger.info(LogUtils.format("ErrorCount") 	+ errorCount);
						
						if("send success".equals(status)){
							// TODO: handle biz
						}else{
							// TODO: handle biz
						}
						
						 
						
						
					}else if (Constants.Event.TEMPLATESENDJOBFINISH.equals(event)) {// 模版消息发送任务完成后 

						String msgID = requestMap.get("MsgID"); 
						String status = requestMap.get("Status"); 
						
						logger.info(LogUtils.format("MsgID") 	+ msgID);
						logger.info(LogUtils.format("Status") 	+ status);
						
						weixinTemplateMessageDao.updateSendStatus(Long.valueOf(msgID), status);
						
						
						if("success".equals(status)){
//						1、送达成功时，推送的XML如下：
//						<xml>
//				           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
//				           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
//				           <CreateTime>1395658920</CreateTime>
//				           <MsgType><![CDATA[event]]></MsgType>
//				           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
//				           <MsgID>200163836</MsgID>
//				           <Status><![CDATA[success]]></Status>
//				           </xml>
							// TODO: handle biz
						}else{
//							2、送达由于用户拒收（用户设置拒绝接收公众号消息）而失败时，推送的XML如下：
//							 <xml>
//					           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
//					           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
//					           <CreateTime>1395658984</CreateTime>
//					           <MsgType><![CDATA[event]]></MsgType>
//					           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
//					           <MsgID>200163840</MsgID>
//					           <Status><![CDATA[failed:user block]]></Status>
//					           </xml>
							
//							3、送达由于其他原因失败时，推送的XML如下：
//							 <xml>
//					           <ToUserName><![CDATA[gh_7f083739789a]]></ToUserName>
//					           <FromUserName><![CDATA[oia2TjuEGTNoeX76QEjQNrcURxG8]]></FromUserName>
//					           <CreateTime>1395658984</CreateTime>
//					           <MsgType><![CDATA[event]]></MsgType>
//					           <Event><![CDATA[TEMPLATESENDJOBFINISH]]></Event>
//					           <MsgID>200163840</MsgID>
//					           <Status><![CDATA[failed: system failed]]></Status>
//					           </xml>
							
							// TODO: handle biz
						}
						
						return "";
						
					}

				}else{
					//
					logger.error("getTransferCustomerService==" + appInfo.getTransferCustomerService());
					if(appInfo.getTransferCustomerService() == 1){
						String responseMsg =  XmlTemplete.transferCustomerService(fromUserName, toUserName, time);
						logger.info("responseMsg===" + responseMsg);
						return  pc.encryptMsg(responseMsg, time, nonce);
					}
					
					if (Constants.MsgType.TEXT.equals(msgType)) {// 接收普通消息 - 文本消息
						String content = requestMap.get("Content");// 文本消息内容
						String msgId = requestMap.get("MsgId");// 消息id，64位整型
						logger.info("MsgId============" + msgId);
						logger.info("Content==========" + content);
						
						Text textMsg = new Text(appInfo.getSysId(), msgId, fromUserName, toUserName, createTime, msgType, content);
						insertTextMsg(textMsg);
						logger.info("inserted....");
						
						return WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getReturnMessage(appInfo, content));
					
					/*	if(content.indexOf("@")> -1){
							String returnUrl = "";
							String[] array = content.split("@");
							if(array.length == 2){
								returnUrl = "http://" + array[0] + ":8002/w/r.htm?t=TEST&u=" + array[1] + "&r=/front/main/main.htm";
							}
							
							String responseMsg =  XmlTemplete.generateTextMsg(fromUserName, toUserName, time,returnUrl);
							logger.info("responseMsg===" + responseMsg);
							return  pc.encryptMsg(responseMsg, time, nonce);
							
						}else{
							Text textMsg = new Text(appInfo.getSysId(), msgId, fromUserName, toUserName, createTime, msgType, content);
							insertTextMsg(textMsg);
							logger.info("inserted....");
							
							return WeixinResponseMessageUtils.genResponseMsg(request,appInfo,requestMap,weixinMessageDao.getReturnMessage(appInfo, content));
						}*/
						
					} else if (Constants.MsgType.IMAGE.equals(msgType)) {// 接收普通消息 - 图片消息
						String picUrl = requestMap.get("PicUrl");// 图片链接
						String mediaId = requestMap.get("MediaId");// 图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
						String msgId = requestMap.get("MsgId");// 消息id，64位整型
						logger.info("PicUrl============" + picUrl);
						logger.info("MediaId==========" + mediaId);
						logger.info("MsgId==========" + msgId);
						
						com.waremec.weixin.domain.msg.Image image = new com.waremec.weixin.domain.msg.Image(appInfo.getSysId(),msgId,fromUserName,toUserName,createTime, msgType, mediaId,picUrl);
						insertImageMsg(image);
						
					} else if (Constants.MsgType.VOICE.equals(msgType)) {// 接收普通消息 - 语音消息
						String mediaId = requestMap.get("MediaId");// 语音消息媒体id，可以调用多媒体文件下载接口拉取数据。。
						String format = requestMap.get("Format");// 语音格式，如amr，speex等
						@SuppressWarnings("unused")
						String recognition = requestMap.get("Recognition");// 语音识别结果，UTF8编码
						String msgId = requestMap.get("MsgId");// 消息id，64位整型
						logger.info("MediaId==========" + mediaId);
						logger.info("Format============" + format);
						logger.info("MsgId==========" + msgId);
						
						Voice vocie = new Voice(appInfo.getSysId(),msgId,fromUserName,toUserName,createTime, msgType, mediaId,format);
						insertVoiceMsg(vocie);
						
					} else if (Constants.MsgType.VIDEO.equals(msgType)) {// 接收普通消息 - 视频消息
						String mediaId = requestMap.get("MediaId");// 视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
						String thumbMediaId = requestMap.get("ThumbMediaId");// 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
						String msgId = requestMap.get("MsgId");// 消息id，64位整型
						logger.info("MediaId==========" + mediaId);
						logger.info("ThumbMediaId============" + thumbMediaId);
						logger.info("MsgId==========" + msgId);
						
						Video video = new Video(appInfo.getSysId(),msgId,fromUserName,toUserName,createTime, msgType, mediaId,thumbMediaId);
						insertVideoMsg(video);
					} else if (Constants.MsgType.LOCATION.equals(msgType)) {// 接收普通消息 -
						// 地理位置消息
						String location_X = requestMap.get("Location_X");// 地理位置维度
						String location_Y = requestMap.get("Location_Y");// 地理位置经度
						String scale = requestMap.get("Scale");// 地图缩放大小
						String label = requestMap.get("Label");// 地理位置信息
						String msgId = requestMap.get("MsgId");// 消息id，64位整型
						logger.info("Location_X==========" + location_X);
						logger.info("Location_Y==========" + location_Y);
						logger.info("Scale==========" + scale);
						logger.info("Label============" + label);
						logger.info("MsgId==========" + msgId);
						
						Location location = new Location(appInfo.getSysId(),msgId,fromUserName,toUserName,createTime, msgType, location_X,location_Y,scale,label);
						insertLocationMsg(location);
					} else if (Constants.MsgType.LINK.equals(msgType)) {// 接收普通消息 - 链接消息
						String title = requestMap.get("Title");// 消息标题
						String description = requestMap.get("Description");// 消息描述
						String url = requestMap.get("Url");// 消息链接
						String msgId = requestMap.get("MsgId");// 消息id，64位整型
						logger.info("Title==========" + title);
						logger.info("Description==========" + description);
						logger.info("Url==========" + url);
						logger.info("MsgId==========" + msgId);
						
						Link link = new Link(appInfo.getSysId(),msgId,fromUserName,toUserName,createTime, msgType, title,description,url);
						insertLinkMsg(link);
						
					}
				}
				
				
				////////////////////////////////////////
//				回复处理
				////////////////////////////////////////
				///
			}else{
				logger.error("===============================acetype is null===============================");
			}
		}else{
			logger.error("===============================postData is null===============================");
			logger.info(postData);
			logger.error("===============================postData is null===============================");
		}
		
		
		
	
	 

		
		return returnMsg;
	}

	
	public Long insertTextMsg(Text text) {
		return weixinMessageDao.insertTextMsg(text);
	}

	public long insertImageMsg(Image image) {
		return weixinMessageDao.insertImageMsg(image); 
	}

	public long insertVoiceMsg(Voice vocie) {
		return weixinMessageDao.insertVoiceMsg(vocie); 
	}

	public long insertVideoMsg(Video video) {
		return weixinMessageDao.insertVideoMsg(video); 
	}

	public long insertLocationMsg(Location location) {
		return weixinMessageDao.insertLocationMsg(location); 
	}

	public long insertLinkMsg(Link link) {
		return weixinMessageDao.insertLinkMsg(link); 
	}

	public long insertEventLocation(EventLocation location) {
		return weixinMessageDao.insertEventLocation(location); 
	}
	
	public Integer saveSendLogging(Map<String, Object> saveMap) {
		// TODO Auto-generated method stub
		return weixinMessageDao.saveSendLogging(saveMap); 
	}
	
	public void test() {
		// TODO Auto-generated method stub
		logger.info("weixinService=" + weixinService);
		logger.info("weixinMessageDao=" + weixinMessageDao);
		
	}
}
