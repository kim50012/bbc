
package com.waremec.weixin.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;


import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

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

@Service
public class KakaoService extends CommonServiceImpl implements CommonService  {

    private String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";

    private String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";

    private String REDIRECT_URL = "http://kr.bbcoin.net:8080/front/bbc/mbr/userAddRequest.htm";

    private String REDIRECT_URL2 = "http://kr.bbcoin.net:8080/front/bbc/mbr/kakaoAssign.htm";

    private String KAKAO_API_KEY = "f8b8ac6fcf571cfe300bc86228b077ce";

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
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String thumbnail_image = properties.getAsJsonObject().get("thumbnail_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            userInfo.put("accessToken", accessToken);
            userInfo.put("thumbnail_image", thumbnail_image);
            userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;

    }

}
