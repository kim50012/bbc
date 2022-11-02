package com.waremec.weixin.action;


import com.waremec.weixin.domain.msg.Image;
import com.waremec.weixin.domain.msg.Music;
import com.waremec.weixin.domain.msg.News;
import com.waremec.weixin.domain.msg.Video;
import com.waremec.weixin.domain.msg.Voice;

public class XmlTemplete {
	 
	/**
	 * @param ToUserName
	 * @param FromUserName
	 * @param CreateTime
	 * @param Content
	 * @return
	 */
	public static String generateTextMsg(String ToUserName, String FromUserName,  String CreateTime, String Content) {

//		<xml>
//		<ToUserName><![CDATA[toUser]]></ToUserName>
//		<FromUserName><![CDATA[fromUser]]></FromUserName>
//		<CreateTime>12345678</CreateTime>
//		<MsgType><![CDATA[text]]></MsgType>
//		<Content><![CDATA[你好]]></Content>
//		</xml>
//		参数				是否必须		描述
//		ToUserName		是	接收方帐号（收到的OpenID）
//		FromUserName	是	开发者微信号
//		CreateTime		是	消息创建时间 （整型）
//		MsgType			是	text
//		Content			是	回复的消息内容（换行：在content中能够换行，微信客户端就支持换行显示）
		
		 String format 	= "<xml>\n" 											
			            + 	"<ToUserName><![CDATA[%1$s]]></ToUserName>\n" 	 
			            + 	"<FromUserName><![CDATA[%2$s]]></FromUserName>\n" 
			            + 	"<CreateTime>%3$s</CreateTime>\n" 			 
			            + 	"<MsgType><![CDATA[text]]></MsgType>\n" 		 
			            + 	"<Content><![CDATA[%4$s]]></Content>\n" 			 
			            + "</xml>" ;
		
		return String.format( format,ToUserName, FromUserName,  CreateTime, Content);
	}
	
	/** 
	* 消息转发到多客服
	* @param ToUserName 接收方帐号（收到的OpenID）
	* @param FromUserName 开发者微信号
	* @param CreateTime 消息创建时间 （整型）
	* @return xml
	*/
	public static String transferCustomerService(String ToUserName, String FromUserName,  String CreateTime) {

//		<xml>
//		<ToUserName><![CDATA[touser]]></ToUserName>
//		<FromUserName><![CDATA[fromuser]]></FromUserName>
//		<CreateTime>1399197672</CreateTime>
//		<MsgType><![CDATA[transfer_customer_service]]></MsgType>
//		</xml>
		
		 String format 	= "<xml>\n" 											
			            + 	"<ToUserName><![CDATA[%1$s]]></ToUserName>\n" 	 
			            + 	"<FromUserName><![CDATA[%2$s]]></FromUserName>\n" 
			            + 	"<CreateTime>%3$s</CreateTime>\n" 			 
			            + 	"<MsgType><![CDATA[transfer_customer_service]]></MsgType>\n" 		 
			            + "</xml>" ;
		
		return String.format( format,ToUserName, FromUserName,  CreateTime);
	}
	
	/** 
	*消息转发到指定客服
	* @param ToUserName 接收方帐号（收到的OpenID）
	* @param FromUserName 开发者微信号
	* @param CreateTime 消息创建时间 （整型）
	* @param KfAccount 指定会话接入的客服账号
	* @return xml
	*/
	public static String transferCustomerService(String ToUserName, String FromUserName,  String CreateTime, String KfAccount) {
		
//		<xml>
//		<ToUserName><![CDATA[touser]]></ToUserName>
//		<FromUserName><![CDATA[fromuser]]></FromUserName>
//		<CreateTime>1399197672</CreateTime>
//		<MsgType><![CDATA[transfer_customer_service]]></MsgType>
//		<TransInfo>
//        	<KfAccount><![CDATA[test1@test]]></KfAccount>
//      </TransInfo>
//		</xml>
		
		String format 	= "<xml>\n" 											
				+ 	"<ToUserName><![CDATA[%1$s]]></ToUserName>\n" 	 
				+ 	"<FromUserName><![CDATA[%2$s]]></FromUserName>\n" 
				+ 	"<CreateTime>%3$s</CreateTime>\n" 			 
				+ 	"<MsgType><![CDATA[transfer_customer_service]]></MsgType>\n" 		 
				+ 	"<TransInfo>\n" 		 
				+ 	"<KfAccount><![CDATA[%4$s]]></KfAccount>\n" 		 
				+ 	"</TransInfo>\n" 		 
				+ "</xml>" ;
		
		return String.format(format,ToUserName, FromUserName,  CreateTime, KfAccount);
	}
	
 
	public static String generateImageMsg(Image image) {
		return image.toString();

	}
	
	public static String generateVoiceMsg(Voice voice) {
		return voice.toString();
	}
	
	public static String generateVideoMsg(Video video) {
		return video.toString();
	}
	
	public static String generateMusicMsg(Music music) {
		return music.toString();
	}
	
	public static String generateNewsMsg(News news) {
		return news.toString();
	}
}
