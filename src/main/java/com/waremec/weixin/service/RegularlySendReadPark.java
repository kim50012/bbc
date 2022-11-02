/**   
 * @Title: RegularlySendReadPark.java 
 * @Package com.waremec.weixin.service 
 * @Description:  
 * @author taebem
 * @date 2015年9月17日 上午9:53:12 
 * @version V1.0   
 */
package com.waremec.weixin.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.waremec.weixin.dao.WeixinRedparkDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.pay.SendRedPackRequest;
import com.waremec.weixin.domain.pay.SendRedPackResponse;
import com.waremec.weixin.domain.redpark.RedparkHist;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.weixin.utils.PaymentUtils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.weixin.utils.XmlUtils;
import com.waremec.wpt.front.service.EventService;

/**
 * @Package com.waremec.weixin.service
 * @FileName RegularlySendReadPark
 * @Description 신세계 훙뽀우 보내기 
 * @author taebem
 * @date 2015年9月17日 上午9:53:12
 * 
 */
public class RegularlySendReadPark {
	
	private static final transient Log logger = LogFactory.getLog(RegularlySendReadPark.class);
	
	private WeixinService weixinService;

	private AppInfo appInfo;
	private String openid;

	public void send(ApplicationContext ac, Integer shopId, String openid) {}

	public static void main(String[] args) {

		RegularlySendReadPark thread = new RegularlySendReadPark();
		System.out.println("thread=" + thread);

		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
		Integer shopId = 18;

		WeixinService weixinService = ac.getBean(WeixinService.class);
		EventService eventService = ac.getBean(EventService.class);
		WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);
		WeixinRedparkDao weixinRedparkDao = ac.getBean(WeixinRedparkDao.class);
		
		
		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
		MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);
		
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("SHOP_ID", appInfo.getShopId());
		List<Map<String, Object>> targetList = eventService.selectList("Redpark.selectRedParkTargetList",searchMap);
		int i = 0;
		logger.info("list.size=" + targetList.size());
		
		for (Map<String, Object> item : targetList) {
			String openid = (String)item.get("RE_OPENID");
			
			logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!------ " + (++i) + " ------!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			logger.info("openid=========" + openid);

			// TODO Auto-generated method stub
			try {
				
				Integer seqid 			= (Integer)item.get("SEQID");//商户订单号
				String mch_billno 	= (String)item.get("MCH_BILLNO");//商户订单号
				String nick_name 	= (String)item.get("NICK_NAME");//提供方名称
				String send_name 	= (String)item.get("SEND_NAME");//商户名称
				String re_openid 	= (String)item.get("RE_OPENID");//用户openid
				Integer total_amount = (Integer)item.get("TOTAL_AMOUNT");//付款金额
				String wishing 		= (String)item.get("WISHING");//红包祝福语
				String client_ip 	= (String)item.get("CLIENT_IP");//Ip地址
				String act_name 	= (String)item.get("ACT_NAME");//活动名称
				String remark 		= (String)item.get("REMARK");//备注
				String send_msg_yn 	= (String)item.get("AD_YN");//是否发送模板消息
				String msg_first 	= (String)item.get("AD_FIRST");//消息-title
				String msg_keyword1 = (String)item.get("AD_KEYWORD1");//消息-昵称
				String msg_keyword2 = (String)item.get("AD_KEYWORD2");//消息-领到
				String msg_keyword3 = (String)item.get("AD_KEYWORD3");//消息-留言
				String msg_keyword4 = (String)item.get("AD_KEYWORD4");//消息-时间
				String msg_remark 	= (String)item.get("AD_REMARK");//消息备注
 
				logger.info("*********************************");
				logger.info("seqid=========" + seqid);
				logger.info("mch_billno====" + mch_billno);
				logger.info("nick_name=====" + nick_name);
				logger.info("send_name=====" + send_name);
				logger.info("re_openid=====" + re_openid);
				logger.info("total_amount==" + total_amount);
				logger.info("wishing=======" + wishing);
				logger.info("client_ip=====" + client_ip);
				logger.info("act_name======" + act_name);
				logger.info("remark========" + remark);
				logger.info("send_msg_yn===" + send_msg_yn);
				logger.info("msg_first=====" + msg_first);
				logger.info("msg_keyword1==" + msg_keyword1);
				logger.info("msg_keyword2==" + msg_keyword2);
				logger.info("msg_keyword3==" + msg_keyword3);
				logger.info("msg_keyword4==" + msg_keyword4);
				logger.info("msg_remark====" + msg_remark);
				logger.info("*********************************");  
				
				logger.info("*********************************");
				logger.info("appid=========" + appInfo.getAppId());
				logger.info("mch_id========" + mchInfo.getMchId());
				logger.info("*********************************");
				
				RedparkHist redparkHist = new RedparkHist();
				redparkHist.setShopId(shopId);
				redparkHist.setMchBillno(mch_billno);
				redparkHist.setNickName(nick_name);
				redparkHist.setSendName(send_name);
				redparkHist.setReOpenid(re_openid);
				redparkHist.setTotalAmount(total_amount);
				redparkHist.setTotalNum(1);
				redparkHist.setWishing(wishing);
				redparkHist.setClientIp(client_ip);
				redparkHist.setActName(act_name);
				redparkHist.setRemark(remark);
				redparkHist.setRedparkStatus(0);
				redparkHist.setAdYn(send_msg_yn);
				redparkHist.setAdFirst(msg_first);
				redparkHist.setAdKeyword1(msg_keyword1);
				redparkHist.setAdKeyword2(msg_keyword2);
				redparkHist.setAdKeyword3(msg_keyword3);
				redparkHist.setAdKeyword4(msg_keyword4);
				redparkHist.setAdRemark(msg_remark);
				
				
//				Integer seqid = weixinRedparkDao.insertRedparkSendHist(redparkHist);
				redparkHist.setSeqid(seqid);
				
				SendRedPackRequest interfaceRequest = new SendRedPackRequest();  
				interfaceRequest.setMch_billno(mch_billno) ; //String(28)
				interfaceRequest.setMch_id(mchInfo.getMchId());
				interfaceRequest.setWxappid(appInfo.getAppId());
				interfaceRequest.setNick_name(nick_name); //String(32)
				interfaceRequest.setSend_name(send_name); //String(32)
				interfaceRequest.setRe_openid(re_openid);
//				interfaceRequest.setRe_openid("o1yuEtw8Pa1BiDLhP3WfLZuaQyAI");//金东一
				interfaceRequest.setTotal_amount(total_amount);
				interfaceRequest.setMin_value(total_amount);
				interfaceRequest.setMax_value(total_amount);
				interfaceRequest.setTotal_num(1);
				interfaceRequest.setWishing(wishing);//String(128)
				interfaceRequest.setClient_ip(client_ip);
				interfaceRequest.setAct_name(act_name); //String(32)
				interfaceRequest.setRemark(remark); //String(256)
				
				String requestXml = WeixinSignUtils.sendRedPackRequestSign(interfaceRequest , mchInfo); 
				
				CloseableHttpClient httpclient = null;
				CloseableHttpResponse response = null;
				 
				try {
					httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
					logger.info("-----------------sendredpark request start-----------------------");
					HttpPost httppost = new HttpPost("https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack");
					logger.info("executing request:" + httppost.getRequestLine());
			
					logger.info("POST Data=\n" + requestXml);
			
		 			httppost.setEntity(new StringEntity(requestXml, "utf-8"));
		 			
//		 			System.out.println(EntityUtils.getContentCharSet(httppost.getEntity()));
			
					response = httpclient.execute(httppost);
					logger.info("-----------------sendredpark request end-----------------------");
					HttpEntity entity = response.getEntity();
		 			StringBuffer results = new StringBuffer();
				 
					logger.info("-----------------sendredpark response start-----------------------");
					logger.info("Response Status: " + response.getStatusLine());
					if (entity != null) {
						logger.info("Response content length: " + entity.getContentLength());
						 BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
						String text;
						while ((text = bufferedReader.readLine()) != null) {
							results.append(text);
							logger.info(text);
						}

						logger.info("Response content:\n" + results.toString());
						logger.info("-----------------sendredpark response end-----------------------");
					}
					EntityUtils.consume(entity);
					
					SendRedPackResponse interfaceResponse = null;
					try {
						interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
					} catch (Exception e) {
						logger.error("sendredpark0000001:" + e.getMessage());
						try {
							String source = results.toString();
							byte[] bs = source.getBytes("gbk");
							//用新的字符编码生成字符串
							String dist = new String(bs, "utf8");
							interfaceResponse = XmlUtils.parseXml2Obj(dist, SendRedPackResponse.class);
						} catch (Exception e2) {
							// TODO: handle exception
							logger.error("sendredpark0000002:" + e2.getMessage());
							throw e2;
						}
					}
					
					logger.info(interfaceResponse.toString());
					
					if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
						
						redparkHist.setRedparkStatus(2);
						redparkHist.setSendDt(new Date());
						redparkHist.setSend_listid(interfaceResponse.getSend_listid());
						
						weixinRedparkDao.updateRedparkSendHist(redparkHist);
						
						//判断是否发送模板消息
						if("Y".equals(send_msg_yn)){
							try {
								
								Long messageId = weixinTemplateMessageService.sendRedPackNotice(appInfo, re_openid, msg_first, msg_keyword1, msg_keyword2,msg_keyword3,msg_keyword4, msg_remark);
								
								weixinTemplateMessageService.updateSendStatus(messageId, "success");
								weixinRedparkDao.updateRedparkSendAdvice(redparkHist);
								logger.info("---------red park send advice message sccesss-------openid=" + re_openid);
							} catch (Exception e) {
								logger.error("---------red park send advice message error-------openid=" + re_openid);
								logger.error(e.getMessage());
								e.printStackTrace();
							}
	 
						}
						
					}else{
						logger.error("-----------------sendredpark error-----------------------");
						String errorMsg = "发送失败!";
						
						if (interfaceResponse.getReturn_code().equals("FAIL")){
							errorMsg += interfaceResponse.getReturn_msg();
						}else{
							errorMsg +=  interfaceResponse.getErr_code_des();
						}
						
						redparkHist.setRedparkStatus(1);
						redparkHist.setSendDt(new Date());
						redparkHist.setErrCode(interfaceResponse.getErr_code());
						redparkHist.setSend_listid(interfaceResponse.getSend_listid());
						weixinRedparkDao.updateRedparkSendHist(redparkHist);
						
						throw new Exception(errorMsg);
					}
					
					
				} catch (Exception e) {
					logger.error(e.getMessage());
					throw e;
				} finally {
					if (response != null) {
						try {
							response.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					if (httpclient != null) {
						try {
							httpclient.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}

				logger.info("发送完成....");
				logger.info("发送完成....");
				logger.info("发送完成....");
				logger.info("发送完成....");
				logger.info(i);
				logger.info(i);
				logger.info(i);
				logger.info(i);
				logger.info("发送完成....");
				logger.info("发送完成....");
				logger.info("发送完成....");
				logger.info("发送完成....");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.error("error:" + e.getMessage()) ;
				
			}

		
			
			
		}

	}

}
