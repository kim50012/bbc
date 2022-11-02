/**   
 * @Title: Event00011Action.java 
 * @Package com.waremec.wpt.front.event.action 
 * @Description:  
 * @author taebem
 * @date 2015年9月11日 下午1:03:19 
 * @version V1.0   
 */
package com.waremec.wpt.front.event.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.pay.SendRedPackRequest;
import com.waremec.weixin.domain.pay.SendRedPackResponse;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.utils.PaymentUtils;
import com.waremec.weixin.utils.WeixinSignUtils;
import com.waremec.weixin.utils.XmlUtils;
import com.waremec.wpt.admin.domain.AdminOrders;
import com.waremec.wpt.admin.domain.OrderStatus;

/**
 * @Package com.waremec.wpt.front.event.action
 * @FileName Event00011Action
 * @Description
 * @author taebem
 * @date 2015年9月11日 下午1:03:19
 * 
 */
@Controller("event00011Action")
@Scope(ScopeType.prototype)
public class Event00011Action extends EventBaseAction {
	private static final long serialVersionUID = 1L;
	
	
	
	public String index() {
		
		Integer eventId = getId();
		
		jsSdkWithEventSttingNotOpenid();
		eventInit();
		
		//SessionMember sessionMember = getSessionMember();
		
		return "index";
	}
	public String getChance() {
		
		logger.info("getChance==========");
		
		Integer eventId = getId();
		
		Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		String openid  = getRequest().getParameter("openid");
		
		
		boolean success = true;
		String err_msg = "";
		Integer chance = 0;
		
		try {
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("SHOP_ID", shopId);
			parmsMap.put("OPENID", openid);
			
			
 			Map<String, Object> returnMap  = eventService.select("Event.SHOP_EVENT_FOLLOW_CHANCE_SELECT",parmsMap);
			chance = (Integer)returnMap.get("CHANCE_CNT");
			 
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
			chance = 0;
		}
		
		 Map<String,Object> rtnMap = new HashMap<String,Object>();
			
		 rtnMap.put("success", success);
		 rtnMap.put("err_msg", err_msg);
		 rtnMap.put("chance", chance);
		 
		 renderJSON(rtnMap);
		
		return NONE;
	}
	public String shareNotice() {
		logger.info("shareNotice==========");
		
		Integer eventId = getId();
		
		Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		String openid  = getRequest().getParameter("openid");
		
		boolean success = true;
		String err_msg = "";
		
		try {
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("SHOP_ID", shopId);
			parmsMap.put("OPENID", openid);
			
			Map<String, Object> returnMap  = eventService.select("Event.SHOP_EVENT_FOLLOW_ACTION_INSERT",parmsMap);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
	public String getBonus() {
		
		logger.info("getBonus==========");
		/*
		if(2 > 1){
			
			Map<String,Object> rtnMap = new HashMap<String,Object>();
			
			rtnMap.put("success", false);
			rtnMap.put("err_msg", "111");
			rtnMap.put("bonus", 3);
			rtnMap.put("bonusErrMsg", "error");
			rtnMap.put("msg", "ddddd");
			
			renderJSON(rtnMap);
			
			return NONE;
			
		}
		*/
		Integer eventId = getId();
		
		Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		String openid  = getRequest().getParameter("openid");
		
		
		boolean success = true;
		String err_msg = "";
		Integer bonus = 0; //0：表示抢红包失败，大于0表示抢中红包金额
		String bonusErrMsg = ""; //
		String msg = ""; //
		
		try {
			Map<String, Object> parmsMap = new HashMap<String, Object>();
			parmsMap.put("SHOP_ID", shopId);
			parmsMap.put("OPENID", openid);
			logger.info("getBonus==========1:" +  openid);
			
 			Map<String, Object> redParkInfo  = eventService.select("Event.SHOP_EVENT_FOLLOW_ACTION_SELECT",parmsMap);
 			logger.info("getBonus==========2:" +  openid);
			try {
				if(redParkInfo != null && !redParkInfo.isEmpty()){
					String result_type  = (String) redParkInfo.get("RESULT_TYPE");
					logger.info("result_type=========" + result_type);
					if("HONGBAO".equalsIgnoreCase(result_type)){
						String mch_billno 	= (String)redParkInfo.get("MCH_BILLNO") ;
						String nick_name 	= (String)redParkInfo.get("NICK_NAME") ;
						String send_name 	= (String)redParkInfo.get("SEND_NAME") ;
						Integer total_amount = IntegerUtils.valueOf((String)redParkInfo.get("TOTAL_AMOUNT")) ;
						String wishing 		= (String)redParkInfo.get("WISHING") ;
						String client_ip 	= "114.112.101.232";//getRequest().getRemoteAddr();
						String act_name 	= (String)redParkInfo.get("ACT_NAME") ;
						String remark 		= (String)redParkInfo.get("REMARK") ;
						String cust_nick_nm  = (String)redParkInfo.get("CUST_NICK_NM") ;
						String prize_desc 	=(String)redParkInfo.get("PRIZE_DESC") ;
						String op_user_id 	= "SYSTEM";
						
						AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
						MchInfo mchInfo = weixinService.selectMchInfoByShopId(shopId);
						
						logger.info("appid=========" + appInfo.getAppId());
						logger.info("mch_id========" + mchInfo.getMchId());
						logger.info("device_info===" + "");
						logger.info("mch_billno====" + mch_billno);
						logger.info("nick_name=====" + nick_name);
						logger.info("send_name=====" + send_name);
						logger.info("openid========" + openid);
						logger.info("total_amount==" + total_amount);
						logger.info("wishing=======" + wishing);
						logger.info("client_ip=====" + client_ip);
						logger.info("act_name======" + act_name);
						logger.info("remark========" + remark);
						logger.info("cust_nick_nm==" + cust_nick_nm);
						logger.info("prize_desc====" + prize_desc);
						
						bonus = total_amount / 100;
						
						SendRedPackRequest interfaceRequest = new SendRedPackRequest(); 
						
						interfaceRequest.setMch_billno(mch_billno) ; //String(28)
						interfaceRequest.setMch_id(mchInfo.getMchId());
						interfaceRequest.setWxappid(appInfo.getAppId());
						interfaceRequest.setNick_name(nick_name); //String(32)
						interfaceRequest.setSend_name(send_name); //String(32)
						interfaceRequest.setRe_openid(openid);
						interfaceRequest.setTotal_amount(total_amount);
						interfaceRequest.setMin_value(total_amount);
						interfaceRequest.setMax_value(total_amount);
						interfaceRequest.setTotal_num(1);
						interfaceRequest.setWishing(wishing);//String(128)
						interfaceRequest.setClient_ip(client_ip);
						interfaceRequest.setAct_name(act_name); //String(32)
						interfaceRequest.setRemark(remark); //String(256)
//						sendRedPackRequest.setLogo_imgurl("商户logo的url");
//						sendRedPackRequest.setShare_content("分享文案");
//						sendRedPackRequest.setShare_url("分享链接");
//						sendRedPackRequest.setShare_imgurl("分享的图片");
						
						String xml = WeixinSignUtils.sendRedPackRequestSign(interfaceRequest , mchInfo); 
						
						CloseableHttpClient httpclient = null;
						CloseableHttpResponse response = null;
						
						try {
							httpclient = PaymentUtils.getCloseableHttpClient(mchInfo);
							logger.info("-----------------sendredpark request start-----------------------");
							HttpPost httppost = new HttpPost("https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack");
							logger.info("executing request:" + httppost.getRequestLine());
							
							logger.info("POST Data=\n" + xml);
							
							httppost.setEntity(new StringEntity(xml, "utf-8"));
							
							response = httpclient.execute(httppost);
							
							logger.info("-----------------sendredpark request end-----------------------");
							HttpEntity entity = response.getEntity();
				 			StringBuffer results = new StringBuffer();
						 
				 			logger.info("-----------------sendredpark response start-----------------------");
				 			logger.info("Response Status: " + response.getStatusLine());
				 			if (entity != null) {
								logger.info("Response content length: " + entity.getContentLength());
								
								String result = EntityUtils.toString(entity, "utf-8");
								results.append(result);
								
								logger.info("Response content:\n" + results.toString());
								logger.info("-----------------sendredpark response end-----------------------");
							}
				 			EntityUtils.consume(entity);
				 			
				 			logger.info("--evnet11 111111111111111111111111111-");
				 			
				 			SendRedPackResponse interfaceResponse = null;
				 			try {
								interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
							} catch (Exception e) {
								logger.error("evnet11 001:" + e.getMessage());
								try {
									String source = results.toString();
									byte[] bs = source.getBytes("gbk");
									//用新的字符编码生成字符串
									String dist = new String(bs, "utf8");
									interfaceResponse = XmlUtils.parseXml2Obj(dist, SendRedPackResponse.class);
								} catch (Exception e2) {
									// TODO: handle exception
									logger.error("evnet11 002:" + e2.getMessage());
									
									interfaceResponse = new SendRedPackResponse();
									interfaceResponse.setErr_code(e2.getMessage());
								}
							}
				 			logger.info("--evnet11 2222222222222222222222222222-");
//				 			SendRedPackResponse interfaceResponse = XmlUtils.parseXml2Obj(results.toString(), SendRedPackResponse.class);
				 			logger.info("interfaceRespons==========" + interfaceResponse);
				 			
				 			if ("SUCCESS".equals(interfaceResponse.getReturn_code()) && "SUCCESS".equals(interfaceResponse.getResult_code())) {
				 				logger.info("---------red park send sccesss----------");
				 				logger.info("interfaceRespons=" + interfaceResponse);
				 				logger.info("openid001==" +  openid);
				 				
				 				Map<String, Object> searchMap = new HashMap<String, Object>();
				 				searchMap.put("SHOP_ID", shopId);
								searchMap.put("OPENID", openid);
								searchMap.put("EVENT_ID", eventId);
								searchMap.put("SEQID", redParkInfo.get("SEQID"));
								searchMap.put("ERRORNO", null);
				 				eventService.saveEvent10RedParkResult(searchMap);
				 				
				 				/*
				 				logger.info("---------red park send sccesss--------1--");
				 				try {
									
									Long messageId = weixinTemplateMessageService.sendRedPackNotice(appInfo, openid, act_name, cust_nick_nm, prize_desc, wishing, remark);
									
									weixinTemplateMessageService.updateSendStatus(messageId, "success");
									logger.info("---------red park send advice message sccesss-------openid=" + openid);
								} catch (Exception e) {
									logger.error("---------red park send advice message error-------openid=" + openid);
									logger.error(e.getMessage());
									e.printStackTrace();
								}
								*/
				 				
				 			}else{
				 				//error
								logger.error("-----------------sendredpark error-----------------------");
								
								logger.info("---------red park send error----------");
				 				logger.info(interfaceResponse.toString());
				 				logger.info("openid001==" +  openid);
				 				
				 				Map<String, Object> searchMap = new HashMap<String, Object>();
				 				searchMap.put("SHOP_ID", appInfo.getShopId());
								searchMap.put("OPENID", openid);
								searchMap.put("EVENT_ID", eventId);
								searchMap.put("SEQID", redParkInfo.get("SEQID"));
								searchMap.put("ERRORNO", interfaceResponse.getErr_code());
				 				eventService.saveEvent10RedParkResult(searchMap);
				 				
				 				logger.info("---------red park send error--------1--");

								String errorMsg = "发送失败!\\n";
								
								if (interfaceResponse.getReturn_code().equals("FAIL")){
									errorMsg += "错误原因=" + interfaceResponse.getReturn_msg();
								}else{
									String err_code =  interfaceResponse.getErr_code();
									String err_code_des =  interfaceResponse.getErr_code_des();
									errorMsg += "错误码=" + err_code + ", 错误描述=" + err_code_des;
								}
								
								bonusErrMsg = "error"; //
								
								logger.error("error00001=" + errorMsg);
								throw new Exception(errorMsg);
				 			}
				 			
						}catch (Exception e) {
							e.printStackTrace();
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
						
					}else{
						msg = (String)redParkInfo.get("MSG") ;
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
				logger.error("event 11 error:" + e.getMessage());
				throw e;
			}
 			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			success = false;
			err_msg = e.getMessage();
		}
		
		Map<String,Object> rtnMap = new HashMap<String,Object>();
		
		rtnMap.put("success", success);
		rtnMap.put("err_msg", err_msg);
		rtnMap.put("bonus", bonus);
		rtnMap.put("bonusErrMsg", bonusErrMsg);
		rtnMap.put("msg", msg);
		
		renderJSON(rtnMap);
		
		return NONE;
	}
}
