/**   
 * @Title: SendReadPark.java 
 * @Package com.jong.readpark 
 * @Description:  
 * @author taebem
 * @date 2015年9月17日 上午9:53:12 
 * @version V1.0   
 */
package com.jong.readpark;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.pay.SendRedPackRequest;
import com.waremec.weixin.domain.pay.SendRedPackResponse;
import com.waremec.weixin.service.WeixinService;
import com.waremec.weixin.service.WeixinTemplateMessageService;
import com.waremec.weixin.thread.ShinSeGaeEvent10ReadParkThread;
import com.waremec.weixin.utils.PaymentUtils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.weixin.utils.XmlUtils;
import com.waremec.wpt.front.service.EventService;

/**
 * @Package com.jong.readpark
 * @FileName SendReadPark
 * @Description
 * @author taebem
 * @date 2015年9月17日 上午9:53:12
 * 
 */
public class ManualSendReadPark {
	private WeixinService weixinService;

	private AppInfo appInfo;
	private String openid;

	public void send(ApplicationContext ac, Integer shopId, String openid) {
		// TODO Auto-generated method stub
		try {

			WeixinService weixinService = ac.getBean(WeixinService.class);
			EventService eventService = ac.getBean(EventService.class);
			WeixinTemplateMessageService weixinTemplateMessageService = ac.getBean(WeixinTemplateMessageService.class);

			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);

			Map<String, Object> searchMap = new HashMap<String, Object>();

			searchMap.put("SHOP_ID", appInfo.getShopId());
			searchMap.put("OPENID", openid);

			Map<String, Object> redParkInfo = eventService.select("Event.SHOP_EVENT_FOLLOW_HONGBAO_SELECT2",searchMap);
			if (redParkInfo != null && !redParkInfo.isEmpty()) {

				String mch_billno = (String) redParkInfo.get("MCH_BILLNO");
				String nick_name = (String) redParkInfo.get("NICK_NAME");
				String send_name = (String) redParkInfo.get("SEND_NAME");
				String openid2 = (String) redParkInfo.get("FROM_OPENID");
				Integer total_amount = IntegerUtils.valueOf((String) redParkInfo.get("TOTAL_AMOUNT"));
				String wishing = (String) redParkInfo.get("WISHING");
				String client_ip = "118.145.2.17";
				String act_name = (String) redParkInfo.get("ACT_NAME");
				String remark = (String) redParkInfo.get("REMARK");
				String cust_nick_nm = (String) redParkInfo.get("CUST_NICK_NM");
				String prize_desc = (String) redParkInfo.get("PRIZE_DESC");
				String op_user_id = "SYSTEM";

				MchInfo mchInfo = weixinService.selectMchInfoByShopId(appInfo.getShopId());
				// MchInfo mchInfo =
				// weixinService.selectMchInfoByKey(appInfo.getSysId());

				System.out.println("appid=========" + appInfo.getAppId());
				System.out.println("mch_id========" + mchInfo.getMchId());
				System.out.println("device_info===" + "");
				System.out.println("mch_billno====" + mch_billno);
				System.out.println("nick_name=====" + nick_name);
				System.out.println("send_name=====" + send_name);
				System.out.println("openid========" + openid2);
				System.out.println("total_amount==" + total_amount);
				System.out.println("wishing=======" + wishing);
				System.out.println("client_ip=====" + client_ip);
				System.out.println("act_name======" + act_name);
				System.out.println("remark========" + remark);
				System.out.println("cust_nick_nm==" + cust_nick_nm);
				System.out.println("prize_desc====" + prize_desc);

				SendRedPackRequest interfaceRequest = new SendRedPackRequest();

				interfaceRequest.setMch_billno(mch_billno); // String(28)
				interfaceRequest.setMch_id(mchInfo.getMchId());
				interfaceRequest.setWxappid(appInfo.getAppId());
				interfaceRequest.setNick_name(nick_name); // String(32)
				interfaceRequest.setSend_name(send_name); // String(32)
				interfaceRequest.setRe_openid(openid2);
				interfaceRequest.setTotal_amount(total_amount);
				interfaceRequest.setMin_value(total_amount);
				interfaceRequest.setMax_value(total_amount);
				interfaceRequest.setTotal_num(1);
				interfaceRequest.setWishing(wishing);// String(128)
				interfaceRequest.setClient_ip(client_ip);
				interfaceRequest.setAct_name(act_name); // String(32)
				interfaceRequest.setRemark(remark); // String(256)
				// sendRedPackRequest.setLogo_imgurl("商户logo的url");
				// sendRedPackRequest.setShare_content("分享文案");
				// sendRedPackRequest.setShare_url("分享链接");
				// sendRedPackRequest.setShare_imgurl("分享的图片");

				String xml = WeixinSignUtils.sendRedPackRequestSign(interfaceRequest, mchInfo);

				CloseableHttpClient httpclient = null;
				CloseableHttpResponse response = null;

				try {
					httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
					System.out.println("-----------------sendredpark request start-----------------------");
					HttpPost httppost = new HttpPost("https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack");
					System.out.println("executing request:" + httppost.getRequestLine());

					System.out.println("POST Data=\n" + xml);

					httppost.setEntity(new StringEntity(xml, "utf-8"));

					response = httpclient.execute(httppost);

					System.out.println("-----------------sendredpark request end-----------------------");
					HttpEntity entity = response.getEntity();
					StringBuffer results = new StringBuffer();

					System.out.println("-----------------sendredpark response start-----------------------");
					System.out.println("Response Status: " + response.getStatusLine());
					if (entity != null) {
						System.out.println("Response content length: " + entity.getContentLength());
//						BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
//						String text;
//						while ((text = bufferedReader.readLine()) != null) {
//							results.append(text);
//							System.out.println(text);
//						}

						String result = EntityUtils.toString(entity, "utf-8");
						results.append(result);
//						System.out.println("utf-8:\n" + result);
						
						System.out.println("Response content:\n" + results.toString());
						System.out.println("-----------------sendredpark response end-----------------------");
					}
					EntityUtils.consume(entity);

					// /////////////////////
					SendRedPackResponse interfaceResponse = null;
					try {
						interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
					} catch (Exception e) {
						System.out.println("sendredpark0000011:" + e.getMessage());
						try {
							String source = results.toString();
							byte[] bs = source.getBytes("gbk");
							// 用新的字符编码生成字符串
							String dist = new String(bs, "utf8");
							interfaceResponse = XmlUtils.parseXml2Obj(dist, SendRedPackResponse.class);
						} catch (Exception e2) {
							// TODO: handle exception
							System.out.println("sendredpark0000012:" + e2.getMessage());
							throw e2;
						}
					}
					// /////////////////////

					// SendRedPackResponse interfaceResponse =
					// XmlUtils.parseXml2Obj(results.toString(),
					// SendRedPackResponse.class);
//					System.out.println(interfaceResponse.toString());

					if (interfaceResponse.getReturn_code().equals("SUCCESS") && interfaceResponse.getResult_code().equals("SUCCESS")) {
						System.out.println("---------red park send sccesss----------");
						System.err.println(interfaceResponse.toString());
						System.out.println("openid001==" + openid);
						System.out.println("openid002==" + openid2);

						searchMap.clear();
						searchMap.put("SHOP_ID", appInfo.getShopId());
						searchMap.put("OPENID", openid);
						searchMap.put("EVENT_ID", 10);
						searchMap.put("SEQID", redParkInfo.get("SEQID"));
						searchMap.put("ERRORNO", null);
						eventService.saveEvent10RedParkResult(searchMap);

						System.out.println("---------red park send sccesss--------1--");
						try {

							Long messageId = weixinTemplateMessageService.sendRedPackNotice(appInfo, openid2, act_name, cust_nick_nm, prize_desc, wishing,
									remark);

							weixinTemplateMessageService.updateSendStatus(messageId, "success");
							System.out.println("---------red park send advice message sccesss-------openid2=" + openid2);
						} catch (Exception e) {
							System.out.println("---------red park send advice message error-------openid2=" + openid2);
							System.out.println(e.getMessage());
							e.printStackTrace();
						}
					} else {
						// error
						System.out.println("-----------------sendredpark error-----------------------");

						System.out.println("---------red park send error----------");
						System.out.println(interfaceResponse.toString());
						System.out.println("openid001==" + openid);
						System.out.println("openid002==" + openid2);

						searchMap.clear();
						searchMap.put("SHOP_ID", appInfo.getShopId());
						searchMap.put("OPENID", openid);
						searchMap.put("EVENT_ID", 10);
						searchMap.put("SEQID", redParkInfo.get("SEQID"));
						searchMap.put("ERRORNO", interfaceResponse.getErr_code());
						eventService.saveEvent10RedParkResult(searchMap);

						System.out.println("---------red park send error--------1--");

						String errorMsg = "发送失败!\\n";

						if (interfaceResponse.getReturn_code().equals("FAIL")) {
							errorMsg += "错误原因=" + interfaceResponse.getReturn_msg();
						} else {
							String err_code = interfaceResponse.getErr_code();
							String err_code_des = interfaceResponse.getErr_code_des();
							errorMsg += "错误码=" + err_code + ", 错误描述=" + err_code_des;
						}

						System.out.println("error00001=" + errorMsg);
					}

				} catch (Exception e) {
					e.printStackTrace();
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

			}

			System.out.println("发送成功....");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("reaprak error 0000000000" + e.getMessage());
			System.out.println("发送失败....");
		}

	}

	public static void main(String[] args) {

		ManualSendReadPark thread = new ManualSendReadPark();
		System.out.println("thread=" + thread);

		ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:spring/applicationContext*.xml");
		Integer shopId = 18;

		EventService eventService = ac.getBean(EventService.class);
		List<String> list = eventService.selectHongbaoUserList();
		
//		List<String> list = new ArrayList<String>();
//		list.add("oGKUAwQ8XZPw596FwDUXRQvDha08");
		
		System.out.println("list.size=" + list.size());
		for (String openid : list) {
			System.out.println("openid=========" + openid);
			thread.send(ac, shopId, openid);
		}

	}

}
