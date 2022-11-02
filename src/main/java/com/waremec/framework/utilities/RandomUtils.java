package com.waremec.framework.utilities;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class RandomUtils {
	
	public static boolean regphone(String value) {
		String regExp = "^[1][0-9]{10}$";  
		Pattern rp = Pattern.compile(regExp);  
		Matcher m = rp.matcher(value);  
		return m.find();
	}

	public static String generateNumberRandom(int length) {
		int max = new Double(Math.pow(10,length)).intValue();
		int min = new Double(Math.pow(10,length - 1)).intValue();
		Random r = new Random();
		int xx = r.nextInt(max);
		while (xx < min) {
			xx = r.nextInt(max);
		}
		return String.valueOf(xx);
	}
	
	public static String generateRandomString(int length) { //length表示生成字符串的长度
	    String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";   
	    Random random = new Random();   
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length());   
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();   
	 }   
	public static String generateRandomString() { //length表示生成字符串的长度
		return generateRandomString(32);   
	}  
	
	
	public static String generateRandomDateString() { //length表示生成字符串的长度
		String random = generateNumberRandom(5);
		
		String data = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
 
		return data + random;   
	}
	public static Integer generateRandomSceneId() { 
		return Integer.valueOf(generateNumberRandom(9));   
	}
	
	/**
	 * @param shopId
	 * @param compNm
	 * @param appid
	 * @param appSecret
	 * @param account_type
	 * @param mchId
	 * @param secretKey
	 */
	
	 
	public static void generateAppInfo(Integer shopId, String compNm,String originalAppId, String appid,String appSecret,Integer account_type,String mchId, String secretKey){
		String domain = "www.hanzhimeng.com";
		String sysId = generateRandomString(32).toUpperCase();
		String url = "http://" +  domain + "/wx/valid.htm?key=" + sysId;
		String token = generateRandomString();
		String EncodingAESKey = generateRandomString(43);
		if(StringUtils.isEmpty(secretKey) || secretKey.length() != 32){
			secretKey = generateRandomString(32);
		}
		
		System.out.println("/***************************************************/");
		System.out.println("/******************* 公众账号信息  *******************/");
		System.out.println("/***************************************************/");
		System.out.println("--url               = " + url);
		System.out.println("--token             = " + token);
		System.out.println("--EncodingAESKey    = " + EncodingAESKey);
		System.out.println("--安全域名                     = " + domain);
		System.out.println("--secretKey         = " + secretKey);
		System.out.println("/***************************************************/");
		System.out.println("/***************  APP INFO INSERT   ****************/");
		System.out.println("/***************************************************/");
		
		
		 
		System.out.println("USE [HZM]");
		System.out.println("GO");
		System.out.println("");
		System.out.println("INSERT INTO [dbo].[WX_APP_INFO]	(");
		System.out.println("		[SYS_ID]");
		System.out.println("		,[SHOP_ID]");
		System.out.println("		,[ORIGINAL_APP_ID]");
		System.out.println("		,[COMP_NM]");
		System.out.println("		,[APP_ID]");
		System.out.println("		,[APP_SECRET]");
		System.out.println("		,[URL]");
		System.out.println("		,[TOKEN]");
		System.out.println("		,[ENCORDING_AES_KEY]");
		System.out.println("		,[WECHAT_NO]");
		System.out.println("		,[ACCOUNT_TYPE]");
		System.out.println("		,[TRANSFER_CUSTOMER_SERVICE]");
		System.out.println("		,[ACCOUNT_STATUS]");
		System.out.println("		,[OPEN_BATCH_JOB]");
		System.out.println("	) VALUES (");
		System.out.println("		'" + sysId + "'");
		System.out.println("		," + shopId );
		System.out.println("		,'" + originalAppId + "'");
		System.out.println("		,'" + compNm + "'");
		System.out.println("		,'" + appid + "'");
		System.out.println("		,'" + appSecret + "'");
		System.out.println("		,'" + "http://" + domain + "'");
		System.out.println("		,'" + token + "'");
		System.out.println("		,'" + EncodingAESKey + "'");
		System.out.println("		," + "''" );
		System.out.println("		," + account_type );
		System.out.println("		," + "0" );
		System.out.println("		," + "1" );
		System.out.println("		," + "1" );
		System.out.println("	)" );
		System.out.println("GO");
		System.out.println("");
				
		System.out.println("/****************************************************/");
		System.out.println("/****************  SHOP AUTH SUCC.   ****************/");
		System.out.println("/****************************************************/");
		System.out.println("UPDATE SHOP SET STS_ID = 1, AUTH_IS_SUCC = 2 WHERE SHOP_ID = " + shopId);
		System.out.println("GO");
		System.out.println(""); 
		System.out.println("/****************************************************/");
		System.out.println("/****************  MCH INFO INSERT   ****************/");
		System.out.println("/****************************************************/");
		System.out.println("INSERT INTO [dbo].[WX_MCH_INFO] (");
		System.out.println("		[SYS_ID]");
		System.out.println("		,[MCH_ID]");
		System.out.println("		,[SECRET_KEY]");
		System.out.println("		,[CERT_EXPIRY_DATE]");
		System.out.println("	) VALUES (");
		System.out.println("		'" + sysId + "'");
		System.out.println("		,'" + mchId + "'");
		System.out.println("		,'" + secretKey + "'");
		System.out.println("		, " + "NULL" + "");
		System.out.println("	)" );
		System.out.println("GO");
		
		
		
		System.out.println("/***********************************************/");
		
		
	}
	public static Map<String,Object>  generateData(Integer shopId, String compNm,String originalAppId, String appid,String appSecret,Integer account_type,String mchId, String secretKey){
		String domain = "www.hanzhimeng.com";
		String sysId = generateRandomString(32).toUpperCase();
		String url = "http://" +  domain + "/wx/valid.htm?key=" + sysId;
		String token = generateRandomString();
		String EncodingAESKey = generateRandomString(43);
		if(StringUtils.isEmpty(secretKey) || secretKey.length() != 32){
			secretKey = generateRandomString(32);
		}
		Map<String, Object> DateMap = new HashMap<String, Object>();
		DateMap.put("shopId", shopId);
		DateMap.put("originalAppId", originalAppId);
		DateMap.put("compNm", compNm);
		DateMap.put("appid", appid);
		DateMap.put("appSecret", appSecret);
		DateMap.put("account_type", account_type);
		DateMap.put("mchId", mchId);
		DateMap.put("secretKey", secretKey);
		DateMap.put("sysId", sysId);
		DateMap.put("domain", domain);
		DateMap.put("token", token);
		DateMap.put("EncodingAESKey", EncodingAESKey);
		return DateMap;
		
	}
	
	public static void main(String[] args) {
		
 		System.out.println(generateRandomString(32));
 		System.out.println(generateRandomString(32));
 		System.out.println(generateRandomString(32));
 		System.out.println(generateRandomString(32));
 		System.out.println(generateRandomString(32));
//  	generateAppInfo(194,"公众号名称",						"orgappid",			"appid",				"appSecret",						1,"mchId","secretKey");
//  		generateAppInfo(17,"上海农心食品有限公司-农心白山水", 	"gh_7c2b6b78912e",	"wx32c3cb5c056615c1",	"appSecret",	1,"mchId","secretKey");
//  		generateAppInfo(18,"北京缘之盟广告有限公司-韩国新世界免税店", 	"gh_e2a2ec327647",	"wxa85cd4a3b8e64ce2",	"dc0d9dbbab3ad89f2823aaa50275ca59",	1,"mchId","secretKey");
//  		generateAppInfo(19,"北京缘之盟广告有限公司-LGHumanLibrary真人书馆", 	"gh_23a1216c1e02",	"wx00619588b1d766e3",	"c460a008f5387d5a0e04310868905ea0",	1,"mchId","secretKey");
//  		generateAppInfo(20,"北京天宇创世科技有限公司-韩国绿十字健康", 	"gh_a34a41bb3980",	"wxfcbf9fe98876f6f9",	"86eae482d914c0d8c64c3aeebe9f8247",	1,"mchId","secretKey");
//  		generateAppInfo(20,"北京天宇创世科技有限公司-韩国绿十字健康管理", 	"gh_1481d7c9e17e",	"wx43ae2843cfb8a019",	"82baa46a154ce235fe4ed3878e736389",	1,"mchId","secretKey");
//  		generateAppInfo(21,"北京东方锦鸿置业有限公司-北京浦项中心", 	"gh_9636043c17e9",	"wx0c9b60353efccbec",	"xxxxxxxxxxxxxx",	1,"mchId","secretKey");
//  		generateAppInfo(34,"北京兴威尔脉科技有限公司-WareMecSNSDemo", 	"gh_5295b63a871f",	"wxee863a7a0f22ba5a",	"c8da8d8a3389563f453e56531a1df282",	1,"mchId","secretKey");
//  		generateAppInfo(22,"勒夫马商贸(北京)有限公司-Lafuma乐飞叶", 	"gh_60604bb0bfd3",	"wx60223659aaadbc4e",	"58ce7d38fc90822dd3411b2dd0d8801a",	1,"mchId","secretKey");
//  			generateAppInfo(25,"韩国文化产业振兴院北京代表处-KoreaContent", 	"gh_4533e77da6cf",	"wxdb884d7a7553f19c",	"e859401ae78f63effb40160588bfeede",	1,"mchId","secretKey");
//  		generateAppInfo(24,"北京天宇创世科技有限公司-韩国现代Hmall", 	"gh_29c3eb995593",	"wx11dbfbf30e6436cd",	"b2a20970a4933a7ce85f7c90d0dcfb86",	1,"mchId","secretKey");
  			generateAppInfo(26,"北京天宇创世科技有限公司 -韩华格乐丽雅免税店", 	"gh_2007ac3f5401",	"wxe14501b04f2f5dd9",	"9b5622294a499a3b564c7b28b5a3b940",	1,"mchId","secretKey");
		//JFUN2LRULZT81XGK7OHBITHAU4KMWMU9
	}

}
