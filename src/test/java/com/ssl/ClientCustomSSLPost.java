/*
 * ====================================================================
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of the Apache Software Foundation.  For more
 * information on the Apache Software Foundation, please see
 * <http://www.apache.org/>.
 *
 */
package com.ssl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.security.KeyStore;

import javax.net.ssl.SSLContext;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.waremec.weixin.domain.MchInfo;
import com.waremec.weixin.domain.pay.PaySign;
import com.waremec.weixin.utils.WeixinSignUtils;

/**
 * This example demonstrates how to create secure connections with a custom SSL
 * context.
 */
public class ClientCustomSSLPost {

	public static final String KEY_STORE_TYPE = "PKCS12";
	public static final String ACCOUNT = "1225226202";
	public static final String APPID = "wxf4ff15142f410758";
	public static final String OPENID= "o1yuEtw1PN5sc6W6Bxd7Q4hty2hY";
	public static final String APIKEY= "eX3fYhAbuJkLk80ZqF6sWmuzcDryulbR";
	
    public final static void main(String[] args) throws Exception {
        KeyStore keyStore  = KeyStore.getInstance(KEY_STORE_TYPE);
//        KeyStore keyStore  = KeyStore.getInstance("PKCS12");
        FileInputStream instream = new FileInputStream(new File("D:/waremec_apiclient_cert/apiclient_cert.p12"));
        try {
            keyStore.load(instream, ACCOUNT.toCharArray());
        } finally {
            instream.close();
        }

        // Trust own CA and all self-signed certs
        SSLContext sslcontext = SSLContexts.custom()
                .loadKeyMaterial(keyStore, ACCOUNT.toCharArray())
                .build();
        // Allow TLSv1 protocol only
        SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
                sslcontext,
                new String[] { "TLSv1" },
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
        CloseableHttpClient httpclient = HttpClients.custom()
                .setSSLSocketFactory(sslsf)
                .build();
        try {

            HttpPost httppost = new HttpPost("https://api.mch.weixin.qq.com/pay/unifiedorder");

            System.out.println("executing request:" + httppost.getRequestLine());
            
          
            
            String out_trade_no = System.currentTimeMillis() + "waremec";
            String spbill_create_ip = "118.145.1.7";	
       	 
       	 	PaySign sign = new PaySign();
       	 	sign.setAppid(APPID);
            sign.setMch_id(ACCOUNT);
            sign.setBody("JSAPI支付测试");
            sign.setAttach("支付测试");
            sign.setOut_trade_no(out_trade_no);
            sign.setFee_type("CNY");
            sign.setTotal_fee(1);
            sign.setSpbill_create_ip(spbill_create_ip);
            sign.setNotify_url("waremec.com.cn");
            sign.setOpenid(OPENID);
            
            MchInfo mchInfo = new MchInfo();
            mchInfo.setSecretKey(APIKEY);
            
          
        	String xml = WeixinSignUtils.paySign(sign,mchInfo);
        	System.out.println(xml);
         
            System.out.println("params=" + xml);
            
            StringEntity reqEntity = new StringEntity(xml);   
            httppost.setEntity(reqEntity);
            
            CloseableHttpResponse response = httpclient.execute(httppost);
            try {
                HttpEntity entity = response.getEntity();

                System.out.println("----------------------------------------");
                System.out.println(response.getStatusLine());
                if (entity != null) {
                    System.out.println("Response content length: " + entity.getContentLength());
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity.getContent()));
                    String text;
                    while ((text = bufferedReader.readLine()) != null) {
                        System.out.println(text);
                    }
                   
                }
                EntityUtils.consume(entity);
            } finally {
                response.close();
            }
        } finally {
            httpclient.close();
        }
    }

}
