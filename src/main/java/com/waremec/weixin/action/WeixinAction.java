package com.waremec.weixin.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.weixin.aes.AesException;
import com.waremec.weixin.aes.SHA1;
import com.waremec.weixin.cons.DownloadFileType;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.ShareInfo;
import com.waremec.weixin.domain.msg.EventLocation;
import com.waremec.weixin.domain.msg.Image;
import com.waremec.weixin.domain.msg.Link;
import com.waremec.weixin.domain.msg.Location;
import com.waremec.weixin.domain.msg.Text;
import com.waremec.weixin.domain.msg.Video;
import com.waremec.weixin.domain.msg.Voice;
import com.waremec.weixin.domain.user.Data;
import com.waremec.weixin.domain.user.UserListReturn;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.thirdparty.aes.WXBizMsgCrypt;
import com.waremec.weixin.thirdparty.domain.AuthorizationInfo;
import com.waremec.weixin.thirdparty.domain.AuthorizerInfo;
import com.waremec.weixin.thirdparty.domain.GetAuthorizerInfoReturn;
import com.waremec.weixin.thirdparty.domain.QueryAuth;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.ServletRequestUtils;
import com.waremec.weixin.utils.SsgSSOSignUtils;
import com.waremec.weixin.utils.WeixinMediaUtils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.weixin.utils.WeixinUserUtils;
import com.waremec.weixin.utils.XmlUtils;
import com.waremec.wpt.ws.ServiceProxy;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:04:42 
*  
*/
@Controller("weixinAction")
@Scope(ScopeType.prototype)
public class WeixinAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;

	private final transient Log logger = LogFactory.getLog(WeixinAction.class);

	private static final String KEY = "8D6ED58C805242C8BDB129616163CB04";

	// 微信接口验证
	private boolean checkSignature(String token) throws AesException {

		// 加密/校验流程如下：
		// 1. 将token、timestamp、nonce三个参数进行字典序排序
		// 2. 将三个参数字符串拼接成一个字符串进行sha1加密
		// 3. 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
		// String token=TOKEN;
		String signature = getRequest().getParameter("signature");// 微信加密签名，signature结合了开发者填写的token参数和请求中的timestamp参数、nonce参数。
		String timestamp = getRequest().getParameter("timestamp");// 时间戳
		String nonce = getRequest().getParameter("nonce");// 随机数

//		logger.debug("signature====" + signature);
//		logger.debug("timestamp====" + timestamp);
//		logger.debug("nonce========" + nonce);

		String signatureNew = SHA1.getSHA2(token, timestamp, nonce);
//		logger.debug("signature====" + signature);
//		logger.debug("signatureNew====" + signatureNew);
		//
		if (signature.equalsIgnoreCase(signatureNew)) {
			return true;
		} else {
			return false;
		}
	}

	public String valid(){
		
		long startTime = System.currentTimeMillis();
		
		logger.info("========微信服务器-后台服务器交互开始========");
		String result = "";
		String echostr = getRequest().getParameter("echostr");// 随机字符串
//		logger.info("valid >>>>>>>>>>>>>>>>echostr=" + echostr);
		if (key == null || key.length() != 32) {
			request.put("result", "error");
			logger.error("WX00001==============");
			logger.error("key无效");
			return SUCCESS;
		}
		AppInfo appInfo  = null;
		try {
			 appInfo = weixinService.selectAppInfoByKey(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		if (appInfo == null) {
			request.put("result", "error");
			logger.error("WX00002==============");
			logger.error("公众号信息找不到 key=" + key);
			return SUCCESS;
		}

		if (StringUtils.isEmpty(echostr)) {
			try {
				result = weixinMessageService.processingAndReplyMessage(getRequest(), appInfo);
			} catch (Exception e) {
				logger.error("WX00003==============");
				logger.error(e.getMessage());
				result = "success";
			}
		} else {// 验证URL有效性
			try {
				if (checkSignature(appInfo.getToken())) {
					// logger.debug("echostr==== " + echostr);
					result = echostr;
				} else {
					result = "error";
				}
			} catch (AesException e) {
				logger.error("WX00004==============");
				logger.error(e.getMessage());
				result = "error";
			}
		}
		request.put("result", result);
		logger.info("========微信服务器-后台服务器交互END========");
		long executeTime = System.currentTimeMillis() - startTime;
		
		logger.info("executeTime=== "+ executeTime );
		return SUCCESS;
	}

	public String test() throws Exception{
 
		//jsSdkStting();
		
		 String url = getFullUrl();
		 logger.info("url====" + url);
		 String key  =  getRequest().getParameter("key");
		try {
			AppInfo appInfo = weixinService.selectAppInfoByKey(key);
			String ticket = weixinService.getApiTicket(appInfo);
			// logger.debug("ticket=====" + ticket);
			if (StringUtils.isNotEmpty(ticket)) {
				request.put("signInfo", WeixinSignUtils.sign(ticket, url));
			}
			request.put("appInfo", appInfo);
			
			
			String shareUrl = Oauth2Utils.getShareLinkUrl(appInfo, url);
			
			ShareInfo shareInfo = new ShareInfo();
			shareInfo.setTitle("媒体发布会邀请函");
			shareInfo.setDesc("薄艺硬屏/薄艺（Art Slim）电视媒体发布会 2015.4.15 北京");
			shareInfo.setImgUrl(appInfo.getDomain() +  "/uploads/150/2015_01_24/shopFile2015_01_24_15_43_041361.png");	
			shareInfo.setLink(shareUrl);
			
			request.put("shareInfo", shareInfo);

		} catch (Exception e) {
			e.printStackTrace();
		}
 
		return "test"; 
	}

	public String fenxiangresult() {
		String url = getFullUrl();
		// logger.debug("url====" + url);
		try {
			AppInfo appInfo = weixinService.selectAppInfoByKey(KEY);
			String ticket = weixinService.getApiTicket(appInfo);
			// logger.debug("ticket=====" + ticket);
			if (StringUtils.isNotEmpty(ticket)) {
				request.put("signInfo", WeixinSignUtils.sign(ticket, url));
			}
			
			request.put("appInfo", appInfo);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "fenxiangresult";
	}

	public String subscribe() {

//		key = "8D6ED58C805242C8BDB129616163CB04";
//		key = "JFUN2LRULZT81XGK7OHBITHAU4KMWMU9";
 
		AppInfo app = weixinService.selectAppInfoByKey(key);
		logger.debug("====================================");
		String token = weixinService.getAccessToken(app);
		logger.debug("token=" + token);

		UserListReturn userListReturn = WeixinUserUtils.getUserList(token, null);
		if (userListReturn.getErrcode() == 0) {
			Data data = userListReturn.getData();
			for (String openid : data.getOpenid()) {
				WXUser user = new WXUser(openid);
				user.setSysId(key);
				try {
					weixinUserService.userSubscribe(token, user);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		logger.info("==================END==================");
		return SUCCESS;
	}

	public String unsubscribe() {

		WXUser user = new WXUser("o1yuEtw1PN5sc6W6Bxd7Q4hty2hY");
		try {
			weixinUserService.userUnsubscribe(user);
			request.put("result", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("====================================");
		return SUCCESS;
	}

	/**
	 * 模拟接收用户消息
	 * 
	 * @return
	 */
	public String text() {
		key = KEY;

		String decryptedData = "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
				+ "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>" + "<CreateTime>1417757742</CreateTime>"
				+ "<MsgType><![CDATA[text]]></MsgType>" + "<Content><![CDATA[q1]]></Content>" + "<MsgId>6089223135743160205</MsgId>" + "</xml>";
		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String ToUserName = root.elementText("ToUserName");
		String CreateTime = root.elementTextTrim("CreateTime");
		String MsgType = root.elementTextTrim("MsgType");
		String Content = root.elementTextTrim("Content");
		String MsgId = root.elementTextTrim("MsgId");
		Text text = new Text(key, MsgId, FromUserName, ToUserName, CreateTime, MsgType, Content);
		try {
			weixinMessageService.insertTextMsg(text);
			request.put("result", MsgId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String image() {
		key = KEY;
		String decryptedData = "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
				+ "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>"
				+ "<CreateTime>1417761449</CreateTime>"
				+ "<MsgType><![CDATA[image]]></MsgType>"
				+ "<PicUrl><![CDATA[http://mmbiz.qpic.cn/mmbiz/2EhaNNgAhfaWy061uk5W8DtTz7dPCfkC8fufGysE6Cc66TVKOz321jibHwkTbcHh1lkjP3MFH4wP2BvFV4DCH8Q/0]]></PicUrl>"
				+ "<MsgId>6089239057186927631</MsgId>" + "<MediaId><![CDATA[zBIxaXzU4wUM8epcYLkplOsX23ahD8r5bpHcgq5bdJvXSl-MfSzcjPZssws5OkW0]]></MediaId>"
				+ "</xml>";
		// String decryptedData=
		// "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
		// +"<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>"
		// +"<CreateTime>1417757742</CreateTime>"
		// +"<MsgType><![CDATA[text]]></MsgType>"
		// +"<Content><![CDATA[q1]]></Content>"
		// +"<MsgId>6089223135743160205</MsgId>"
		// +"</xml>";
		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String ToUserName = root.elementText("ToUserName");
		String CreateTime = root.elementTextTrim("CreateTime");
		String MsgType = root.elementTextTrim("MsgType");
		String PicUrl = root.elementTextTrim("PicUrl");
		String MediaId = root.elementTextTrim("MediaId");
		String MsgId = root.elementTextTrim("MsgId");

		//
		Image image = new Image(key, MsgId, FromUserName, ToUserName, CreateTime, MsgType, MediaId, PicUrl);

		long id = weixinMessageService.insertImageMsg(image);
		logger.debug(id);

		logger.debug("image=" + image);
		request.put("result", MsgId);

		return SUCCESS;
	}

	public String voice() {
		key = KEY;
		String decryptedData = "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
				+ "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>" + "<CreateTime>1417762763</CreateTime>"
				+ "<MsgType><![CDATA[voice]]></MsgType>" + "<MediaId><![CDATA[fRM5UNtZmWP90uHJnYFoL7rc8OKzuqiTNbOMdKGkCwtA-HVD0diAyYz6eZuNxsk3]]></MediaId>"
				+ "<Format><![CDATA[speex]]></Format>" + "<MsgId>6089244700571598848</MsgId>" + "<Recognition><![CDATA[]]></Recognition>" + "</xml>";

		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String ToUserName = root.elementText("ToUserName");
		String CreateTime = root.elementTextTrim("CreateTime");
		String MsgType = root.elementTextTrim("MsgType");
		String MediaId = root.elementTextTrim("MediaId");
		String MsgId = root.elementTextTrim("MsgId");
		String Format = root.elementTextTrim("Format");

		//
		Voice vocie = new Voice(key, MsgId, FromUserName, ToUserName, CreateTime, MsgType, MediaId, Format);
		long id = weixinMessageService.insertVoiceMsg(vocie);
		logger.debug(id);
		logger.debug("vocie=" + vocie);
		request.put("result", MsgId);
		return SUCCESS;
	}

	public String video() {
		key = KEY;
		String decryptedData = "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
				+ "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>" + "<CreateTime>1417763573</CreateTime>"
				+ "<MsgType><![CDATA[video]]></MsgType>" + "<MediaId><![CDATA[TF60vZz2LB8sFVE8KfZvDM48g_nsBgyCabCRGt8f8kPytgnBeMFWRobu6TZJyl-C]]></MediaId>"
				+ "<ThumbMediaId><![CDATA[C4UDC2MCzKJoQq0VFTDzJJg1tHXJLqE-N_vz7mSITulk8HuDVe_sDZAKApyYObgQ]]></ThumbMediaId>"
				+ "<MsgId>6089248179697465252</MsgId>" + "</xml>";

		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String ToUserName = root.elementText("ToUserName");
		String CreateTime = root.elementTextTrim("CreateTime");
		String MsgType = root.elementTextTrim("MsgType");
		String MediaId = root.elementTextTrim("MediaId");
		String ThumbMediaId = root.elementTextTrim("ThumbMediaId");
		String MsgId = root.elementTextTrim("MsgId");

		//
		Video video = new Video(key, MsgId, FromUserName, ToUserName, CreateTime, MsgType, MediaId, ThumbMediaId);
		long id = weixinMessageService.insertVideoMsg(video);
		logger.debug(id);
		logger.debug("video=" + video);
		request.put("result", MsgId);
		return SUCCESS;
	}

	public String location() {
		key = KEY;
		String decryptedData = "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
				+ "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>" + "<CreateTime>1417764377</CreateTime>"
				+ "<MsgType><![CDATA[location]]></MsgType>" + "<Location_X>37.547159</Location_X>" + "<Location_Y>121.268670</Location_Y>"
				+ "<Scale>15</Scale>" + "<Label><![CDATA[]]></Label>" + "<MsgId>6089251632851171569</MsgId>" + "</xml>";

		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String ToUserName = root.elementText("ToUserName");
		String CreateTime = root.elementTextTrim("CreateTime");
		String MsgType = root.elementTextTrim("MsgType");
		String Location_X = root.elementTextTrim("Location_X");
		String Location_Y = root.elementTextTrim("Location_Y");
		String Scale = root.elementTextTrim("Scale");
		String Label = root.elementTextTrim("Label");
		String MsgId = root.elementTextTrim("MsgId");

		try {

			Location location = new Location(key, MsgId, FromUserName, ToUserName, CreateTime, MsgType, Location_X, Location_Y, Scale, Label);
			long id = weixinMessageService.insertLocationMsg(location);
			logger.debug(id);
			logger.debug("Location=" + location);
			request.put("result", location);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String uploadLocation() {
		key = KEY;
		// String decryptedData=
		// "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
		// +"<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>"
		// +"<CreateTime>1417764377</CreateTime>"
		// +"<MsgType><![CDATA[location]]></MsgType>"
		// +"<Location_X>37.547159</Location_X>"
		// +"<Location_Y>121.268670</Location_Y>"
		// +"<Scale>15</Scale>"
		// +"<Label><![CDATA[]]></Label>"
		// +"<MsgId>6089251632851171569</MsgId>"
		// +"</xml>";
		String decryptedData = "<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>"
				+ "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>" + "<Latitude>37.546413</Latitude>"
				+ "<Longitude>121.263474</Longitude>" + "<Precision>77.784286</Precision>" + "</xml>";

		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String Longitude = root.elementTextTrim("Longitude");
		String Latitude = root.elementTextTrim("Latitude");
		String Precision = root.elementTextTrim("Precision");

		try {
			// public EventLocation(String sysId, String openid, String
			// longitude, String latitude, String precision, Date createDate) {
			EventLocation location = new EventLocation(key, FromUserName, Longitude, Latitude, Precision, new Date());
			long id = weixinMessageService.insertEventLocation(location);
			logger.debug(id);
			logger.debug("Location=" + Longitude + "," + Latitude);
			request.put("result", location);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String link() {
		key = KEY;
		String decryptedData =

		"<xml><ToUserName><![CDATA[gh_c2bb99ea6fa5]]></ToUserName>" + "<FromUserName><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></FromUserName>"
				+ "<CreateTime>1417766647</CreateTime>" + "<MsgType><![CDATA[link]]></MsgType>" + "<Title><![CDATA[逸贷感恩在此刻：今天你感恩了么？]]></Title>"
				+ "<Description><![CDATA[是什么样的倔强，让我们对身边的人总是没法说出心里话。逸贷感恩在此刻，想对TA说，就大声说出来。年底节日重重，]]></Description>"
				+ "<Url><![CDATA[http://mp.weixin.qq.com/s?__biz=MjM5NjQ4NzAwMQ==&mid=437384497&idx=2&sn=badf36ffc2d58e775a365335469fe791#rd]]></Url>"
				+ "<MsgId>6089261382426934445</MsgId>" + "</xml>";
		// 解析xml
		Document document = null;
		try {
			document = DocumentHelper.parseText(decryptedData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (null == document) {
			request.put("result", "");
			return SUCCESS;
		}
		Element root = document.getRootElement();
		String FromUserName = root.elementText("FromUserName");
		String ToUserName = root.elementText("ToUserName");
		String CreateTime = root.elementTextTrim("CreateTime");
		String MsgType = root.elementTextTrim("MsgType");
		String Title = root.elementTextTrim("Title");
		String Description = root.elementTextTrim("Description");
		String Url = root.elementTextTrim("Url");
		String MsgId = root.elementTextTrim("MsgId");

		try {

			Link link = new Link(key, MsgId, FromUserName, ToUserName, CreateTime, MsgType, Title, Description, Url);
			long id = weixinMessageService.insertLinkMsg(link);
			logger.debug(id);
			logger.debug("Link=" + link);
			request.put("result", link);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String downloadMedia() {

		String filePath = UploadFileUtil.getUploadPath(getRequest(), UploadFileUtil.UPLOAD_WEIXIN);
		String fileUrl = UploadFileUtil.getUploadUrl(getRequest(), UploadFileUtil.UPLOAD_WEIXIN);

		AppInfo appInfo = weixinService.selectAppInfoByKey(key);
		String mediaId = getRequest().getParameter("mediaId");
		
		logger.debug("filePath======" + filePath);
		logger.debug("key===========" + key);
		logger.debug("mediaId=======" + mediaId);

		String token = weixinService.getAccessToken(appInfo);

		filePath = WeixinMediaUtils.downloadMedia(token, DownloadFileType.IMAGE, mediaId, filePath);
		if (StringUtils.isNotEmpty(filePath)) {
			File file = new File(filePath);
			fileUrl += file.getName();

			Map<String, Object> returns = new HashMap<String, Object>();

			returns.put("success", true);
			returns.put("mediaId", mediaId);
			returns.put("fileUrl", fileUrl);
			renderJSON(returns);
		} else {

			Map<String, Object> returns = new HashMap<String, Object>();

			returns.put("success", false);
			returns.put("mediaId", mediaId);
			renderJSON(returns);
		}

		return NONE;
	}

	
	public String wechatAutoLogin(){
		
		String shopId = getRequest().getParameter("shopId");
		String openid = getRequest().getParameter("openid");
		String ticket = getRequest().getParameter("ticket");
		String timestamp = getRequest().getParameter("timestamp");
		String sign = getRequest().getParameter("sign");
		

		Map<String,String> signMap = new HashMap<String,String>();
		
		signMap.put("shopId", shopId);
		signMap.put("openid", openid);
		signMap.put("ticket", ticket);
		signMap.put("timestamp", timestamp);
		signMap.put("sign", sign);
		
		if(SsgSSOSignUtils.verify(signMap)){
			
			String hzmIfId = "SSG_IF_ID";			//임시 하드코딩
			String hzmIfPw = "SSG_@)!%!)@)_SYSIFPW";//임시 하드코딩
			String ssoUserId = "1111";				//임시 하드코딩
			timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			signMap.clear();
			signMap.put("hzmIfId", hzmIfId);
			signMap.put("hzmIfPw", hzmIfPw);
			signMap.put("shopId", shopId);
			signMap.put("openid", openid);
			signMap.put("ticket", ticket);
			signMap.put("timestamp", timestamp);
			signMap.put("ssoUserId", ssoUserId);
			sign = SsgSSOSignUtils.sign(signMap);
			
			logger.info("*******************************");
			logger.info("hzmIfId=======" + hzmIfId);
			logger.info("hzmIfPw=======" + hzmIfPw);
			logger.info("shopId=======" + shopId);
			logger.info("openid=======" + openid);
			logger.info("ticket=======" + ticket);
			logger.info("timestamp=======" + timestamp);
			logger.info("ssoUserId=======" + ssoUserId);
			logger.info("sign=======" + sign);
			logger.info("*******************************");
			
			
			 String format 	= "<xml>" 											
			            + 	"<hzmIfId><![CDATA[%1$s]]></hzmIfId>" 	 
			            + 	"<hzmIfPw><![CDATA[%2$s]]></hzmIfPw>" 	 
			            + 	"<shopId><![CDATA[%3$s]]></shopId>" 	 
			            + 	"<openid><![CDATA[%4$s]]></openid>" 	 
			            + 	"<ticket><![CDATA[%5$s]]></ticket>" 	 
			            + 	"<timestamp><![CDATA[%6$s]]></timestamp>" 	 
			            + 	"<ssoUserId><![CDATA[%7$s]]></ssoUserId>" 	 
			            + 	"<sign><![CDATA[%8$s]]></sign>" 	 
			            + "</xml>" ;
			
			 String xml =  String.format( format,hzmIfId, hzmIfPw,shopId,openid,ticket,timestamp,ssoUserId,sign);
			 logger.info("xml=\n" + xml);
			
			 logger.info("##############################################");
			 //调用WebService来验证ticket的有效性 这里用axis1.4生成客户端， 用其他工具实现也可
		 	ServiceProxy proxy = new ServiceProxy();
			 String response = "";
			 try {
				response = proxy.accountVerify(xml);
				logger.info("response=" + response);
				
			} catch ( Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 logger.info("##############################################");
		
			try {
				 Map<String, String> returnMap = XmlUtils.parseXml2Map(response);
				 /*	for(Map.Entry<String, String> entry:returnMap.entrySet()){ 
				       System.out.println(entry.getKey()+"--->"+entry.getValue()); 
				   } 
				  */
				getRequest().setAttribute("returnMap", returnMap);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
		}
		
		
		return "ssologin";
	}
	
	/**
	 * 授权事件接收
	 * 用于接收取消授权通知、授权成功通知、授权更新通知，也用于接收ticket，ticket是验证平台方的重要凭据。
	 * @return
	 * @throws Exception 
	 */
	public String setauth() {
		// TODO Auto-generated catch block
		long startTime = System.currentTimeMillis();
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ WX-Push START @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		String result = "";
		String echostr = getRequest().getParameter("nonce");// 随机字符串
		
		if (key == null || key.length() != 32) {
			request.put("result", "error");
			logger.error("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@WXThirdpartyAction=00001@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			logger.error("key无效");
			return SUCCESS;
		}
		AppInfo appInfo  = null;
		try {
			 appInfo = weixinService.selectAppInfoByKey(key);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (appInfo == null) {
			request.put("result", "error");
			logger.error("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@WXThirdpartyAction=00002@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			logger.error("key找不到=" + key);
			return SUCCESS;
		}
		
		String timestamp  	= getRequest().getParameter("timestamp"); //时间戳
		String msgSignature= getRequest().getParameter("msg_signature");//对消息体的签名
		String postData= ServletRequestUtils.readStreamParameter(getRequest());//data
		
		Map<String,Object> map = new HashMap<String,Object>();
		/**
		 * 获取微信开发平台信息
		 */
		map.put("shopId",null);
		map.put("originalAppId", null);
		map.put("sysId", appInfo.getSysId());
		Map<String,Object> thirdpartyInfo = commonService.select("AdminGroup.weiXinAppInfoSelect", map);
		
		try {
			WXBizMsgCrypt pc = new WXBizMsgCrypt(appInfo.getToken(), appInfo.getEncordingAesKey(), appInfo.getAppId());
			/**
			 * 解密
			 */
			String requestData = pc.decryptMsg(msgSignature, timestamp, echostr, postData);
			
			logger.info(requestData);
			logger.info("pushTime:"+startTime);
			
			try {
				/**
				 * 调用parseXml方法解析xml格式请求消息到map里
				 */
				Map<String, String> data = XmlUtils.parseXml2Map(requestData);
				logger.info("InfoType:"+data.get("InfoType"));

				if(!StringUtils.isBlank(data.get("InfoType")) && "component_verify_ticket".equals(data.get("InfoType"))){
					
					/**
					 * 保存component_verify_ticket
					 */
					thirdpartyService.saveComponentVerifyTicket(data);
				} else if (!StringUtils.isBlank(data.get("InfoType")) && "authorized".equals(data.get("InfoType")) ) {//授权成功通
					Map<String, Object> authCodeMap = thirdpartyService.saveAuthorizationCode(data);
					/**
					 * 使用授权码换取公众号的接口调用凭据和授权信息
					 */
					QueryAuth queryAuth = thirdpartyService.getQueryAuth(authCodeMap, appInfo.getAppSecret());
					AuthorizationInfo authorization_info = queryAuth.getAuthorization_info();
					
					AppInfo oldAppInfo = weixinService.selectAppInfoByAppIdAndNoException(authorization_info.getAuthorizer_appid());
					
					
//					oldAppInfo = null;
					
					
					if(oldAppInfo == null){
						logger.info("insert授权公众号信息: start");

						Map<String,Object> mapResult =  thirdpartyService.saveAuthorizationWeiXinInfo(appInfo, authorization_info);
						if(mapResult.isEmpty()){
							logger.info("保存授权公众号信息: fail, mapResult IS NULL");//保存失败
						}else{
							String errMsg=(String) mapResult.get("OUT_ERR_MSG");
							if("S".equals(errMsg)){
								logger.info("保存授权公众号信息: success");
								GetAuthorizerInfoReturn authorizerInfo = thirdpartyService.getAuthorizerInfo(thirdpartyInfo, authorization_info.getAuthorizer_appid());
								if(authorizerInfo != null){
									AuthorizerInfo info = authorizerInfo.getAuthorizer_info();
									Map<String,Object> reqMap = thirdpartyService.updateAuthorizationWeiXinInfo(info, mapResult.get("OUT_SYS_ID").toString());
									if(reqMap.isEmpty()){
										logger.info("获取授权方的账户信息: fail reqMap IS NULL");//保存失败
									}else{
										String outMsg=(String) reqMap.get("OUT_ERR_MSG");
										if("S".equals(outMsg)){
											logger.info("保存授权公众号信息: success");
											logger.info("insert授权公众号信息: end");
										}
									}
									
								}
								
							}else{
								logger.info("保存授权公众号信息: fail===>" + errMsg);
							}
						}
						
					}else {
						logger.info("重新授权公众号号信息: start");
						/**
						 * 更新数据库信息
						 */
						Map<String, Object> again = thirdpartyService.againSaveAuthorizationWeiXinInfo(thirdpartyInfo, authorization_info, oldAppInfo);
						
						if(again.isEmpty()){
							logger.info("重新授权公众号号信息: error, again == null");//保存失败
						}else{
							String errMsg=(String) again.get("OUT_ERR_MSG");
							if("S".equals(errMsg)){
								logger.info("重新授权公众号号信息: success");//保存成功，获取公众号信息
							}else{
								logger.info("重新授权公众号号信息: error ===>" + errMsg);
							}
						}
					}
				} else if (!StringUtils.isBlank(data.get("InfoType")) && "updateauthorized".equals(data.get("InfoType"))){//授权更新
					Map<String, Object> infoMap = thirdpartyService.saveAuthorizationCode(data);
					QueryAuth queryAuth = thirdpartyService.getQueryAuth(infoMap, appInfo.getAppSecret());
					AuthorizationInfo authorization_info = queryAuth.getAuthorization_info();
					AppInfo oldAppInfo = weixinService.selectAppInfoByAppIdAndNoException(authorization_info.getAuthorizer_appid());
					Map<String, Object> again = thirdpartyService.againSaveAuthorizationWeiXinInfo(thirdpartyInfo, authorization_info, oldAppInfo);
					if(again.isEmpty()){
						logger.info("重新授权公众号号信息: error, again == null");//保存失败
					}else{
						String errMsg=(String) again.get("OUT_ERR_MSG");
						if("S".equals(errMsg)){
							logger.info("重新授权公众号号信息: success");//保存成功，获取公众号信息
						}else{
							logger.info("重新授权公众号号信息: error ===>" + errMsg);
						}
					}
				} else if (!StringUtils.isBlank(data.get("InfoType")) && "unauthorized".equals(data.get("InfoType"))){//取消授权
					logger.info("用户:"+data.get("AuthorizerAppid")+" 取消授权");
					thirdpartyService.deauthorize(data.get("AuthorizerAppid"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (com.waremec.weixin.thirdparty.aes.AesException e1) {
			e1.printStackTrace();
		}
		
		request.put("result", result);
		logger.info("runtime: "+ (System.currentTimeMillis() - startTime) );
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ WX-Push END @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return SUCCESS;
	}
	
};