package com.waremec.weixin.thirdparty.service;

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
import com.waremec.weixin.domain.msg.resp.TextMessage;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.service.WeixinCustomService;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinUserService;
//import com.waremec.weixin.thirdparty.thread.ThirdpartySendMsgThread;
import com.waremec.weixin.thread.DownloadImageMsgThread;
import com.waremec.weixin.thread.ExecutionLoggingThread;
import com.waremec.weixin.thread.MenuClickThread;
import com.waremec.weixin.thread.QRCodeEventThread;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.ServletRequestUtils;
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
public class ThirdpartyMessageService extends CommonServiceImpl implements CommonService {

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
	@Resource
	private ThirdpartyService thirdpartyService;
	
	
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
	public String thirdpartyProcessingAndReplyMessage(HttpServletRequest request, AppInfo appInfo, String pushAppId) throws Exception{
		
		Date startTime =new Date();
		
//		假如服务器无法保证在五秒内处理并回复，必须做出下述回复，
//		这样微信服务器才不会对此作任何处理，并且不会发起重试
//		（这种情况下，可以使用客服消息接口进行异步回复），
//		否则，将出现严重的错误提示。详见下面说明：
//		
//		1、直接回复空串（指字节长度为0的空字符串，而不是XML结构体中content字段的内容为空）
//		2、直接回复success
		String returnMsg = "";
		Map<String, String> pushMap = null;
		WXBizMsgCrypt pc = null;
		String nonce = request.getParameter("nonce");// 随机字符串
		String timestamp  	= request.getParameter("timestamp"); //时间戳
		String msgSignature= request.getParameter("msg_signature");//签名
		String postData= ServletRequestUtils.readStreamParameter(request);//data
		
		//第三方平台解密开始
		pc = new WXBizMsgCrypt(appInfo.getToken(), appInfo.getEncordingAesKey(), appInfo.getAppId());
		String pushData = pc.decryptMsg(msgSignature, timestamp, nonce, postData);
		logger.info("===============================pushData===============================");
		logger.info(pushData);
		logger.info("===============================pushData===============================");
		
		if(StringUtils.isEmpty(pushData)){
			logger.error("<<Thirdparty00001>>");
			throw new Exception("pushData is null!!!!!!!");
		} else {
			//调用parseXml方法解析xml格式请求消息到map里
			pushMap = XmlUtils.parseXml2Map(pushData);
		}
		
		String time 		= "";
		String ToUserName 	= ""; // 开发者微信号
		String FromUserName = ""; // 发送方帐号（一个OpenID）
		String CreateTime 	= ""; // 消息创建时间 （整型）
		String MsgType 		= ""; // 消息类型
		String Event 		= "";// 事件类型
		String EventKey  	= "";// 事件KEY值
		String MsgId	 	= "";// 消息id，64位整型
		long createTime = System.currentTimeMillis() / 1000;// 消息创建时间 （整型）
		
		time = System.currentTimeMillis() + "";
		ToUserName 	 = pushMap.get("ToUserName");	// 开发者微信号
		FromUserName = pushMap.get("FromUserName");	// 发送方帐号（一个OpenID）
		CreateTime 	 = pushMap.get("CreateTime");	// 消息创建时间 （整型）
		MsgType 	 = pushMap.get("MsgType");		// 消息类型

		logger.info(LogUtils.format("ToUserName") 	+ ToUserName);
		logger.info(LogUtils.format("FromUserName")	+ FromUserName);
		logger.info(LogUtils.format("CreateTime")  	+ CreateTime);
		logger.info(LogUtils.format("MsgType") 		+ MsgType);
		
		
		if (Constants.MsgType.EVENT.equals(MsgType)) {//接收事件推送
			Event = pushMap.get("Event");// 事件类型
			logger.info(LogUtils.format("Event") + Event);
			
			if (Constants.Event.SUBSCRIBE.equals(Event)) {// 关注事件 OR 扫描带参数二维码事件(用户未关注时，进行关注后的事件推送)
//				String token = weixinService.getAccessToken(appInfo);
				
//				String token = "pQSnYGcNyD0Lv8-b1x1wc-KPVrQwMJL1EwFePktH5cQ7naagDXgPe06s7sypjUCT2pPicHIInKoHwjkd9JgIPXmWcQp4Y0VdG3GMZQIcG273dTQwCfPANnNjDFxHaU9LZGVgAIAIPE";
//				// 保存关注用户信息
//				WXUser user = new WXUser();
//				user.setSysId(appInfo.getSysId());
//				user.setOpenid(FromUserName);
//				weixinUserService.userSubscribe(token, user);
				
				//处理消息
				String xml = "";
				
				TextMessage message = new TextMessage();
				
				message.setToUserName(FromUserName);
				message.setFromUserName(ToUserName);
				message.setCreateTime(createTime);
				message.setMsgType("text");
				message.setContent("TEXT");
				
				xml = XmlUtils.messageToXml(message);
				System.out.println("xml=====>"+xml);
				
				returnMsg = xml;
				
				logger.info("000000000000000000:User SUBSCRIBE");
				
//				Thread msgThread = new Thread(new ThirdpartySendMsgThread(request, weixinService,weixinMessageDao, appInfo, pushMap,"关注",componentAccessToken));
//				msgThread.start();
				logger.info("000000000000000001:User SUBSCRIBE");
				EventKey = pushMap.get("EventKey");// 事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
				if(StringUtils.isNotBlank(EventKey)){
					logger.info(LogUtils.format("EventKey") + EventKey);
					try {
						Thread thread = new Thread(new QRCodeEventThread(request, weixinService,weixinMessageDao, appInfo, pushMap));
						thread.start();
					} catch (Exception e) {
						// TODO: handle exception
						logger.error("thread0000000000:" + e.getMessage());
					}
				}
				
				logger.info("000000000000000002:User SUBSCRIBE");
					
					
			}else if (Constants.Event.UNSUBSCRIBE.equals(Event)) {// 取消关注事件
				WXUser user = new WXUser();
				user.setSysId(appInfo.getSysId());
				user.setOpenid(FromUserName);
				weixinUserService.userUnsubscribe(user);
			}else if(Constants.Event.SCAN.equals(Event)) {// 扫描带参数二维码事件(用户已关注时的事件推送)
				EventKey = pushMap.get("EventKey");// 事件KEY值，是一个32位无符号整数，即创建二维码时的二维码scene_id
				String Ticket = pushMap.get("Ticket");// Ticket  二维码的ticket，可用来换取二维码图片
				
				logger.info(LogUtils.format("EventKey") + EventKey);
				logger.info(LogUtils.format("Ticket") 	+ Ticket);
				
//				try {
//					Thread thread = new Thread(new QRCodeEventThread(request, weixinService, weixinMessageDao, appInfo, pushMap));
//					thread.start();
//				} catch (Exception e) {
//					// TODO: handle exception
//					logger.error("thread11111111111:" + e.getMessage());
//				}
				 
			}else if(Constants.Event.LOCATION.equals(Event)) {// 上报地理位置事件
				String Latitude  = pushMap.get("Latitude");  //地理位置纬度
				String Longitude = pushMap.get("Longitude"); //地理位置经度
				String Precision = pushMap.get("Precision"); //地理位置精度
				
				logger.info(LogUtils.format("Latitude") 	+ Latitude);
				logger.info(LogUtils.format("Longitude") 	+ Longitude);
				logger.info(LogUtils.format("Precision") 	+ Precision);
				
			}else if(Constants.Event.CLICK.equals(Event)) {// 自定义菜单事件(点击菜单拉取消息时的事件推送)
				EventKey = pushMap.get("EventKey"); // 事件KEY值，与自定义菜单接口中KEY值对应
				logger.info(LogUtils.format("EventKey") + EventKey);
				
				
//				try {
//					Thread thread = new Thread(new MenuClickThread(request, weixinService,weixinMessageDao, appInfo, pushMap,Integer.valueOf(EventKey)));
//					thread.start();
//				} catch (Exception e) {
//					// TODO: handle exception
//					logger.error("thread33333333333:" + e.getMessage());
//				}
			
			}else if(Constants.Event.VIEW.equals(Event)) {// 自定义菜单事件(点击菜单跳转链接时的事件推送)
				EventKey = pushMap.get("EventKey");// 事件KEY值，设置的跳转URL
				logger.info(LogUtils.format("EventKey") + EventKey);
			}else if(Constants.Event.SCANCODE_PUSH.equals(Event)) {// 自定义菜单事件-(扫码推事件)
				EventKey = pushMap.get("EventKey");
				logger.info(LogUtils.format("EventKey") + EventKey);
			}else if(Constants.Event.SCANCODE_WAITMSG.equals(Event)) {// 自定义菜单事件-(扫码推事件且弹出“消息接收中”提示框)
				EventKey = pushMap.get("EventKey");
				logger.info(LogUtils.format("EventKey") + EventKey);
			}else if(Constants.Event.PIC_SYSPHOTO.equals(Event) || Constants.Event.PIC_WEIXIN.equals(Event)
					|| Constants.Event.PIC_PHOTO_OR_ALBUM.equals(Event)) {// 自定义菜单事件-(弹出系统拍照发图,弹出微信相册发图器,弹出拍照或者相册发图)
				EventKey = pushMap.get("EventKey");
				logger.info(LogUtils.format("EventKey") + EventKey);

			}else if(Constants.Event.LOCATION_SELECT.equals(Event)) {// 自定义菜单事件(弹出地理位置选择器)
				EventKey = pushMap.get("EventKey");

				logger.info(LogUtils.format("EventKey") + EventKey);

			}else if(Constants.Event.KF_CREATE_SESSION.equals(Event)) {// 多客服会话控制-接入会话 
				String KfAccount = pushMap.get("KfAccount"); 
				logger.info(LogUtils.format("KfAccount") + KfAccount);
				// TODO: handle biz
			}else if(Constants.Event.KF_CLOSE_SESSION.equals(Event)) {//  多客服会话控制-关闭会话
				String KfAccount = pushMap.get("KfAccount"); 
				logger.info(LogUtils.format("KfAccount") + KfAccount);
				// TODO: handle biz
			}else if(Constants.Event.KF_SWITCH_SESSION.equals(Event)) {//  多客服会话控制-转接会话
				String FromKfAccount = pushMap.get("FromKfAccount"); 
				String ToKfAccount = pushMap.get("ToKfAccount"); 
				
				logger.info(LogUtils.format("FromKfAccount") + FromKfAccount);
				logger.info(LogUtils.format("ToKfAccount") + ToKfAccount);
				// TODO: handle biz
			}else if (Constants.Event.MASSSENDJOBFINISH.equals(Event)) {//群发任务  
				String MsgID = pushMap.get("MsgID");  //群发的消息ID
				String Status = pushMap.get("Status"); //群发的结构，为“send success”或“send fail”或“err(num)”。
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
				String TotalCount = pushMap.get("TotalCount"); 	//group_id下粉丝数；或者openid_list中的粉丝数
				String FilterCount = pushMap.get("FilterCount"); //过滤（过滤是指特定地区、性别的过滤、用户设置拒收的过滤，
																	//用户接收已超4条的过滤）后，准备发送的粉丝数，原则上，
																	//FilterCount = SentCount + ErrorCount
				String SentCount = pushMap.get("SentCount"); //发送成功的粉丝数
				String ErrorCount = pushMap.get("ErrorCount"); //发送失败的粉丝数
				
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
				String MsgID = pushMap.get("MsgID"); //消息id
				String Status = pushMap.get("Status"); //发送状态为成功
				
				logger.info(LogUtils.format("MsgID") 	+ MsgID);
				logger.info(LogUtils.format("Status") 	+ Status);
				
				weixinTemplateMessageDao.updateSendStatus(Long.valueOf(MsgID), Status);
				
			}
			
		}else{//接收普通消息
			
			if (Constants.MsgType.TEXT.equals(MsgType)) {// 接收普通消息 - 文本消息
				String Content = pushMap.get("Content");// 文本消息内容
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("Content") 	+ Content);
				logger.info(LogUtils.format("MsgId") 	+ MsgId);
				
				String token = "pQSnYGcNyD0Lv8-b1x1wc-KPVrQwMJL1EwFePktH5cQ7naagDXgPe06s7sypjUCT2pPicHIInKoHwjkd9JgIPXmWcQp4Y0VdG3GMZQIcG273dTQwCfPANnNjDFxHaU9LZGVgAIAIPE";
				// 保存关注用户信息
				WXUser user = new WXUser();
				user.setSysId(appInfo.getSysId());
				user.setOpenid(FromUserName);
				weixinUserService.userSubscribe(token, user);
				
				
				
				
				//构建文本消息
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
						return pc.encryptMsg(responseMsg, time, nonce);
					}else{//消息转发到指定客服
						String responseMsg =  XmlTemplete.transferCustomerService(FromUserName, ToUserName, time, checkDkf.getKf_account());
						logger.info("消息转发到指定客服");
						logger.info("transfer_customer_service2===" + responseMsg);
						return pc.encryptMsg(responseMsg, time, nonce);
					}
					
				}else{
					
					String xml = "";
					
					TextMessage message = new TextMessage();
					
					message.setToUserName(FromUserName);
					message.setFromUserName(ToUserName);
					message.setCreateTime(createTime);
					message.setMsgType("text");
					
					message.setContent("TEXT");
					
					xml = XmlUtils.messageToXml(message);
					System.out.println("xml=====>"+xml);
					
					returnMsg = xml;
					
					
					
					
					//执行
//					Thread msgThread = new Thread(new ThirdpartySendMsgThread(request, weixinService,weixinMessageDao, appInfo, pushMap, Content, componentAccessToken ));
//					msgThread.start();
					
				}
				
			}else if (Constants.MsgType.IMAGE.equals(MsgType)) {// 接收普通消息 - 图片消息
				String PicUrl = pushMap.get("PicUrl");// 图片链接
				String MediaId = pushMap.get("MediaId");// 图片消息媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("PicUrl") 	+ PicUrl);
				logger.info(LogUtils.format("MediaId") 	+ MediaId);
				logger.info(LogUtils.format("MsgId") 	+ MsgId);
				
				com.waremec.weixin.domain.msg.Image image = new com.waremec.weixin.domain.msg.Image(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,PicUrl);
				
//				Thread msgThread = new Thread(new DownloadImageMsgThread(request,appInfo, image));
//				msgThread.start();
				
			}else if (Constants.MsgType.VOICE.equals(MsgType)) {// 接收普通消息 - 语音消息
				String MediaId = pushMap.get("MediaId");// 语音消息媒体id，可以调用多媒体文件下载接口拉取数据。。
				String Format = pushMap.get("Format");// 语音格式，如amr，speex等
				@SuppressWarnings("UNUSED")
				String Recognition = pushMap.get("Recognition");// 语音识别结果，UTF8编码
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
				
				logger.info(LogUtils.format("MediaId") 		+ MediaId);
				logger.info(LogUtils.format("Format") 		+ Format);
				logger.info(LogUtils.format("Recognition") 	+ Recognition);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				 
				Voice vocie = new Voice(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,Format);
				insertVoiceMsg(vocie);
				
			}else if (Constants.MsgType.VIDEO.equals(MsgType)) {// 接收普通消息 - 视频消息
				String MediaId = pushMap.get("MediaId");// 视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
				String ThumbMediaId = pushMap.get("ThumbMediaId");// 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
			
				logger.info(LogUtils.format("MediaId") 		+ MediaId);
				logger.info(LogUtils.format("ThumbMediaId") + ThumbMediaId);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Video video = new Video(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,ThumbMediaId);
				insertVideoMsg(video);
			}else if (Constants.MsgType.SHORTVIDEO.equals(MsgType)) {// 接收普通消息 - 小视频消息
				String MediaId = pushMap.get("MediaId");// 视频消息媒体id，可以调用多媒体文件下载接口拉取数据。
				String ThumbMediaId = pushMap.get("ThumbMediaId");// 视频消息缩略图的媒体id，可以调用多媒体文件下载接口拉取数据。
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
			
				logger.info(LogUtils.format("MediaId") 		+ MediaId);
				logger.info(LogUtils.format("ThumbMediaId") + ThumbMediaId);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Video video = new Video(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, MediaId,ThumbMediaId);
				insertVideoMsg(video);
			}else if (Constants.MsgType.LOCATION.equals(MsgType)) {// 接收普通消息 -
				// 地理位置消息
				String Location_X = pushMap.get("Location_X");// 地理位置维度
				String Location_Y = pushMap.get("Location_Y");// 地理位置经度
				String Scale = pushMap.get("Scale");// 地图缩放大小
				String Label = pushMap.get("Label");// 地理位置信息
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
			 
				logger.info(LogUtils.format("Location_X") 	+ Location_X);
				logger.info(LogUtils.format("Location_Y") 	+ Location_Y);
				logger.info(LogUtils.format("Scale") 		+ Scale);
				logger.info(LogUtils.format("Label") 		+ Label);
				logger.info(LogUtils.format("MsgId") 		+ MsgId);
				
				Location location = new Location(appInfo.getSysId(),MsgId,FromUserName,ToUserName,CreateTime, MsgType, Location_X,Location_Y,Scale,Label);
				insertLocationMsg(location);
			}else if (Constants.MsgType.LINK.equals(MsgType)) {// 接收普通消息 - 链接消息
				String Title = pushMap.get("Title");// 消息标题
				String Description = pushMap.get("Description");// 消息描述
				String Url = pushMap.get("Url");// 消息链接
				MsgId = pushMap.get("MsgId");// 消息id，64位整型
				
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
	
}