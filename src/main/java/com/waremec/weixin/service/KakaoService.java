
package com.waremec.weixin.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.dao.WeixinUserDao;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.user.Cust;
import com.waremec.weixin.domain.user.SessionMember;
import com.waremec.weixin.domain.user.UserReturn;
import com.waremec.weixin.domain.user.WXUser;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.DateUtils;
import com.waremec.weixin.utils.WeixinUserUtils;
import com.waremec.wpt.front.domain.BbcAtrClbBbd;
import com.waremec.wpt.front.service.BbcService;

@Service
public class KakaoService extends CommonServiceImpl implements CommonService  {

    private String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";

    private String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";

    private String KAKAO_FRIENDS_INFO_URL = "https://kapi.kakao.com/v1/api/talk/friends";

    private String KAKAO_SEND_MSG_TO_ME_URL = "https://kapi.kakao.com/v2/api/talk/memo/default/send";

    private String REDIRECT_URL = "http://kr.bbcoin.net:8080/front/bbc/mbr/userAddRequest.htm";

    private String REDIRECT_URL2 = "http://kr.bbcoin.net:8080/front/bbc/mbr/kakaoAssign.htm";

    private String KAKAO_API_KEY = "f8b8ac6fcf571cfe300bc86228b077ce";

    @Resource
	protected CommonService commonService;
    
    public String getAccessToken(String authorizationCode, String redirectType) {

        RestTemplate restTemplate = new RestTemplate();

        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("grant_type", "authorization_code");
        if (redirectType.equals("userAddRequest")) {
            map.add("redirect_uri", REDIRECT_URL);
        }
        if (redirectType.equals("kakaoAssign")) {
            map.add("redirect_uri", REDIRECT_URL2);
        }
        map.add("client_id", KAKAO_API_KEY);
        map.add("code", authorizationCode);

        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        String token_type = "";
        String id_token = "";
        String expires_in = "";
        String refresh_token_expires_in = "";
        String scope = "";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=" + KAKAO_API_KEY);  //본인이 발급받은 key
            if (redirectType.equals("userAddRequest")) {
                sb.append("&redirect_uri=" + REDIRECT_URL);     // 본인이 설정해 놓은 경로
            }
            if (redirectType.equals("kakaoAssign")) {
                sb.append("&redirect_uri=" + REDIRECT_URL2);     // 본인이 설정해 놓은 경로
            }            
            sb.append("&code=" + authorizationCode);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            token_type = element.getAsJsonObject().get("token_type").getAsString();
            id_token = element.getAsJsonObject().get("id_token").getAsString();
            expires_in = element.getAsJsonObject().get("expires_in").getAsString();
            refresh_token_expires_in = element.getAsJsonObject().get("refresh_token_expires_in").getAsString();
            scope = element.getAsJsonObject().get("scope").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;        
        
    }
    
    public String getRefreshAccessToken(String mbrSq) {

        String access_token = "";
        String token_type = "";
        String expires_in = "";
        
        try {
        	
			Map<String,Object> searchMap=new HashMap<String, Object>();
			searchMap.put("P1", "SEND_MSG_TO_KAKAO");
			searchMap.put("P2", mbrSq);
			List<Map<String, Object>> tarGetList = commonService.selectList("Bbc.sqlAMS_BADMATCH_PROCEDURE", searchMap);

            System.out.println("tarGetList.size : " + tarGetList.size());
			if (tarGetList.size()>0) {

				String email = String.valueOf(tarGetList.get(0).get("MBR_ID"));
				String refreshToken = String.valueOf(tarGetList.get(0).get("REFRESH_TOKEN"));
				access_token = String.valueOf(tarGetList.get(0).get("ACCESS_TOKEN"));

	            URL url = new URL(KAKAO_TOKEN_URL);

	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	            conn.setDoOutput(true);

	            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=refresh_token");
	            sb.append("&client_id=").append(KAKAO_API_KEY);
	            sb.append("&refresh_token=").append(refreshToken);
	            System.out.println("sb.toString : " + sb.toString());
	            bw.write(sb.toString());
	            bw.flush();

	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            try {
					access_token = element.getAsJsonObject().get("access_token").getAsString();
					token_type = element.getAsJsonObject().get("token_type").getAsString();
					expires_in = element.getAsJsonObject().get("expires_in").getAsString();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            

	    	    Map<String, Object> mapHist = new HashMap<String, Object>();
	    	    mapHist.put("MBR_ID", email);
	    	    mapHist.put("ACCESS_TOKEN", access_token);
	    	    mapHist.put("TOKEN_TYPE", token_type);
	    	    mapHist.put("EXPIRES_IN", expires_in);
	    	    Map<String, Object> mapResultHistory = commonService.select("Bbc.sqlAMS_MBR_TOKEN", mapHist);
	            
	            System.out.println("access_token : " + access_token);

	            br.close();
	            bw.close();
			}
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_token;        
        
    }

    public Map<String, Object> getAccessTokenNew(String authorizationCode, String redirectType) {

        RestTemplate restTemplate = new RestTemplate();

        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("grant_type", "authorization_code");
        if (redirectType.equals("userAddRequest")) {
            map.add("redirect_uri", REDIRECT_URL);
        }
        if (redirectType.equals("kakaoAssign")) {
            map.add("redirect_uri", REDIRECT_URL2);
        }
        map.add("client_id", KAKAO_API_KEY);
        map.add("code", authorizationCode);

        String reqURL = "https://kauth.kakao.com/oauth/token";
        String token_type = "";
        String access_token = "";
        String id_token = "";
        String expires_in = "";
        String refresh_token = "";
        String refresh_token_expires_in = "";
        String scope = "";
        Map<String, Object> returnMap = new HashMap<String, Object>();

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=" + KAKAO_API_KEY);  //본인이 발급받은 key
            if (redirectType.equals("userAddRequest")) {
                sb.append("&redirect_uri=" + REDIRECT_URL);     // 본인이 설정해 놓은 경로
            }
            if (redirectType.equals("kakaoAssign")) {
                sb.append("&redirect_uri=" + REDIRECT_URL2);     // 본인이 설정해 놓은 경로
            }            
            sb.append("&code=" + authorizationCode);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            try {
				access_token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
				token_type = element.getAsJsonObject().get("token_type").getAsString();
//            id_token = element.getAsJsonObject().get("id_token").getAsString();
				expires_in = element.getAsJsonObject().get("expires_in").getAsString();
				refresh_token_expires_in = element.getAsJsonObject().get("refresh_token_expires_in").getAsString();
				scope = element.getAsJsonObject().get("scope").getAsString();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            System.out.println("access_token : " + access_token);
            System.out.println("refresh_token : " + refresh_token);

            returnMap.put("token_type", token_type);
            returnMap.put("access_token", access_token);
            returnMap.put("id_token", id_token);
            returnMap.put("expires_in", expires_in);
            returnMap.put("refresh_token", refresh_token);
            returnMap.put("refresh_token_expires_in", refresh_token_expires_in);
            returnMap.put("scope", scope);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return returnMap;        
        
    }

    public HashMap<String, Object> getUserInfo(String accessToken){

//      요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        try {
            URL url = new URL(KAKAO_USER_INFO_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response url : " + url);
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            JsonObject for_partner = null; // 미리 변수를 선언합니다.
            JsonObject rootObject = element.getAsJsonObject();
            String uuid = element.getAsJsonObject().get("id").getAsString();

            if (rootObject.has("for_partner")) {
                for_partner = rootObject.get("for_partner").getAsJsonObject();
                uuid = for_partner.getAsJsonObject().get("uuid").getAsString();
            }

            String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            String phone_number = "";
            String birthyear = "";
            String gender = "";
            String profile_image = "";

            userInfo.put("accessToken", accessToken);
            userInfo.put("thumbnail_image", thumbnail_image);
            userInfo.put("email", email);
            userInfo.put("uuid", uuid);
            
            if (kakao_account.has("profile_image_url")) {
            	profile_image = kakao_account.getAsJsonObject().get("profile_image_url").getAsString();
            }
            if (kakao_account.has("phone_number")) {
            	phone_number = kakao_account.getAsJsonObject().get("phone_number").getAsString();
            }
            if (kakao_account.has("birthyear")) {
            	birthyear = kakao_account.getAsJsonObject().get("birthyear").getAsString();
            }
            if (kakao_account.has("gender")) {
            	gender = kakao_account.getAsJsonObject().get("gender").getAsString();
            }
            
            userInfo.put("phone_number", phone_number);
            userInfo.put("birthyear", birthyear);
            userInfo.put("gender", gender);
            userInfo.put("profile_image", profile_image);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;

    }

    public HashMap<String, Object> getFriendsInfo(String accessToken){

//      요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        try {
            URL url = new URL(KAKAO_FRIENDS_INFO_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response url : " + url);
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonArray elements = element.getAsJsonObject().get("elements").getAsJsonArray();
            
            String after_url = ""; // 기본값을 null 또는 "" 로 미리 설정
            JsonObject rootObject = element.getAsJsonObject();
            // "after_url" 키가 있는지 먼저 확인
            if (rootObject.has("after_url")) {
                // 키가 존재하면 String으로 가져오기
                after_url = rootObject.get("after_url").getAsString();
            }

            for (JsonElement friendElement : elements) {
                JsonObject friendObject = friendElement.getAsJsonObject();
                long id = friendObject.get("id").getAsLong();
                String uuid = friendObject.get("uuid").getAsString();
                String profile_nickname = friendObject.get("profile_nickname").getAsString();
                String profile_thumbnail_image = friendObject.get("profile_thumbnail_image").getAsString();

        	    Map<String, Object> mapHist = new HashMap<String, Object>();
        	    mapHist.put("KAKAO_ID", id);
        	    mapHist.put("UUID", uuid);
        	    mapHist.put("PROFILE_NICKNAME", profile_nickname);
        	    mapHist.put("PROFILE_THUMBNAIL_IMAGE", profile_thumbnail_image);
        	    Map<String, Object> mapResultHistory = commonService.select("Bbc.sqlAMS_KAKAO_FRIENDS", mapHist);
            }
            
            if (after_url != "") {
            	updateFriendsInfo(accessToken, after_url);
            }
            
            userInfo.put("accessToken", accessToken);
            userInfo.put("elements", elements);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return userInfo;
    }
    

    public void updateFriendsInfo(String accessToken, String nextGetUrl){

//      요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        try {
            URL url = new URL(nextGetUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonArray elements = element.getAsJsonObject().get("elements").getAsJsonArray();
            
            String after_url = null; // 기본값을 null 또는 "" 로 미리 설정
            JsonObject rootObject = element.getAsJsonObject();
            // "after_url" 키가 있는지 먼저 확인
            if (rootObject.has("after_url")) {
                // 키가 존재하면 String으로 가져오기
                after_url = rootObject.get("after_url").getAsString();
            }

            for (JsonElement friendElement : elements) {
                JsonObject friendObject = friendElement.getAsJsonObject();
                long id = friendObject.get("id").getAsLong();
                String uuid = friendObject.get("uuid").getAsString();
                String profile_nickname = friendObject.get("profile_nickname").getAsString();
                String profile_thumbnail_image = friendObject.get("profile_thumbnail_image").getAsString();

        	    Map<String, Object> mapHist = new HashMap<String, Object>();
        	    mapHist.put("KAKAO_ID", id);
        	    mapHist.put("UUID", uuid);
        	    mapHist.put("PROFILE_NICKNAME", profile_nickname);
        	    mapHist.put("PROFILE_THUMBNAIL_IMAGE", profile_thumbnail_image);
        	    Map<String, Object> mapResultHistory = commonService.select("Bbc.sqlAMS_KAKAO_FRIENDS", mapHist);
            }            

            if (after_url != "") {
            	updateFriendsInfo(accessToken, after_url);
            }
            

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    

    public void sendMsgToMe(String accessToken, String msg, String linkUrl){

        try {
            URL url = new URL(KAKAO_SEND_MSG_TO_ME_URL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true); // POST 요청이므로 true로 설정
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            
            JsonObject linkObject = new JsonObject();
            linkObject.addProperty("web_url", linkUrl); // 변수 사용
            linkObject.addProperty("mobile_web_url", linkUrl); // 변수 사용

            JsonObject templateObject = new JsonObject();
            templateObject.addProperty("object_type", "text");
            templateObject.addProperty("text", msg); // 변수 사용
            templateObject.add("link", linkObject); // 위에서 만든 linkMap을 값으로 추가
            templateObject.addProperty("button_title", "상세 내용 확인");
            
            String templateObjectJson = templateObject.toString();
            System.out.println(templateObjectJson);
            
            // 파라미터를 'key=value' 형태로 만듭니다. 값 부분은 반드시 URL 인코딩 되어야 합니다.
            String params = "template_object=" + URLEncoder.encode(templateObjectJson, StandardCharsets.UTF_8.toString());

            // 6. 요청 본문(body) 전송
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = params.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            // 7. 서버 응답 코드 확인
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code : " + responseCode);

            // 8. 서버 응답 메시지 읽기 (성공/실패 여부와 관계없이)
            // 성공 시 conn.getInputStream(), 실패 시 conn.getErrorStream()으로 응답을 받습니다.
            BufferedReader br;
            if (responseCode >= 200 && responseCode < 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8));
            }

            StringBuilder responseSb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                responseSb.append(line);
            }
            br.close();

            System.out.println("Response Body : " + responseSb.toString());

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(responseSb.toString());

            try {
            	
	            System.out.println("result_code : " + responseSb.toString());

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
