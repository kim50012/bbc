package com.waremec.wxi.service;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.waremec.framework.service.CommonService;
import com.waremec.framework.service.CommonServiceImpl;
import com.waremec.wxi.domain.DKFAcountDomain;
import com.waremec.wxi.domain.GroupDomain;
import com.waremec.wxi.domain.WeiXinCustom;
import com.waremec.wxi.domain.WeiXinSeatMsg;
import com.waremec.wxi.domain.WeiXinSeatMsgList;
import com.waremec.weixin.dao.WeixinDao;
import com.waremec.weixin.domain.AccessToken;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.WeixinReturn;
import com.waremec.weixin.exception.InvalidAccountException;
import com.waremec.weixin.exception.WeixinAuthException;
import com.waremec.weixin.exception.WeixinErrorException;
import com.waremec.weixin.utils.HttpClientUtils;
import com.waremec.weixin.utils.WeixinUtils;
import com.waremec.wxi.dao.WxiDkfDao;

@Service
public class WxiDkfService extends CommonServiceImpl implements CommonService {

	@Resource
	private WxiDkfDao wxidkfDao;

	@Resource
	private WeixinDao weixinDao;
	
	
	public List<GroupDomain> keywordGroupList(int shopId){
		return wxidkfDao.keywordGroupList(shopId);
	}
	public List<DKFAcountDomain> keywordList(int shopId){
		return wxidkfDao.keywordList(shopId);
	}
	
	public Integer removeKeyword(String keywordIndex,int shopId){
		
		return wxidkfDao.removeKeyword(keywordIndex,shopId);
	}
	
	public Integer keywordInsert(int shopId,String keywordGroup,String keyword,String newsPicType,String arsTitle,String arsImage,String arsContent,String arsUrl,String keywordType){
		
		return wxidkfDao.keywordInsert(shopId,keywordGroup,keyword,newsPicType,arsTitle,arsImage,arsContent,arsUrl,keywordType);
	}
	public Integer keywordUpdate(int shopId,String keywordGroup,String keyword,String newsPicType,String arsTitle,String arsImage,String arsContent,String arsUrl,String keywordType,String keyWordBefore){
		
		return wxidkfDao.keywordUpdate(shopId,keywordGroup,keyword,newsPicType,arsTitle,arsImage,arsContent,arsUrl,keywordType,keyWordBefore);
	}
	public String deleteDKFAccount(String accountName,int shopId) throws Exception{
		String access_Token = getAccessToken(shopId);
		String menu_url = "https://api.weixin.qq.com/customservice/kfaccount/del?access_token="
				+ access_Token+"&kf_account="+accountName;
		String result1 = HttpClientUtils.requestPost(menu_url);
		WeixinReturn returns = new Gson().fromJson(result1, WeixinReturn.class);
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		return "S";
	} 
	public String saveDKFAccount(WeiXinCustom weiXinCustom,int shopId) throws Exception{
		String access_Token = getAccessToken(shopId);
		JSONObject jsonObject = JSONObject.fromObject(weiXinCustom);
		String menu_url = "https://api.weixin.qq.com/customservice/kfaccount/add?access_token="
				+ access_Token;
		String result1 = HttpClientUtils.requestPost(menu_url, jsonObject);
		WeixinReturn returns = new Gson().fromJson(result1, WeixinReturn.class);
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		return "S";
	}
	public String updateDKFAccount(WeiXinCustom weiXinCustom,int shopId) throws Exception{
		String access_Token = getAccessToken(shopId);
		JSONObject jsonObject = JSONObject.fromObject(weiXinCustom);
		String menu_url = "https://api.weixin.qq.com/customservice/kfaccount/update?access_token="
				+ access_Token;
		String result1 = HttpClientUtils.requestPost(menu_url, jsonObject);
		WeixinReturn returns = new Gson().fromJson(result1, WeixinReturn.class);
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		return "S";
	}
	public String getSeatMsg(int shopId) throws Exception{
		String access_Token = getAccessToken(shopId);
		String menu_url = "https://api.weixin.qq.com/cgi-bin/customservice/getkflist?access_token="
				+ access_Token;
		String result1 = HttpClientUtils.requestPost(menu_url);
		WeiXinSeatMsgList returns = new Gson().fromJson(result1, WeiXinSeatMsgList.class);
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		String account = returns.getWeiXinSeatMsgList().get(0).getKf_account();
		String str = account.substring(account.lastIndexOf("@"), account.length());
		return str;
	}
	public List<WeiXinSeatMsg> getSeatList(int shopId) throws Exception{
		String access_Token = getAccessToken(shopId);
		String menu_url = "https://api.weixin.qq.com/cgi-bin/customservice/getkflist?access_token="
				+ access_Token;
		String result1 = HttpClientUtils.requestPost(menu_url);
		WeiXinSeatMsgList returns = new Gson().fromJson(result1, WeiXinSeatMsgList.class);
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		List<WeiXinSeatMsg> list = returns.getWeiXinSeatMsgList();
		return list;
	}
	
	public String sendHeadImg(String filePath,String accountName,int shopId) throws IOException {
		
		String access_Token = getAccessToken(shopId);
		String url = "http://api.weixin.qq.com/customservice/kfaccount/uploadheadimg?access_token="+access_Token+"&kf_account="+accountName;
		String result = null;

		File file = new File(filePath);
		if (!file.exists() || !file.isFile()) {
			throw new IOException("文件不存在");
		}
		/**
		 * 第一部分
		 */
		URL urlObj = new URL(url);
		// 连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		/**
		 * 设置关键字
		 */

		con.setRequestMethod("POST");// 以POST方式提交表单，默认get方式
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);// POST方式不能使用缓存

		// 设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		// 设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary="
				+ BOUNDARY);

		// 请求正文信息

		// 第一部分
		StringBuilder sb = new StringBuilder();
		sb.append("--");// 必须多两道线
		sb.append(BOUNDARY);
		sb.append("\r\n");
		//上传头像和上传多媒体主要是下面这句话有却别  
		//头像：
		sb.append("Content-Disposition: form-data;name=\"media\";filename=\""
				+ file.getName() + "\"\r\n");
		//多媒体：
		//sb.append("Content-Disposition: form-data;name=\"file\";filename=\""+ file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		// 获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		// 输出表头
		out.write(head);

		// 文件正文部分
		// 把文件以流文件的方式推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));

		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1) {
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		// 结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		try {
			// 定义BufferedReader输出流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			if (result == null) {
				result = buffer.toString();
			}
		} catch (IOException e) {
			System.out.println("发送POST请求异常！" + e);
			e.printStackTrace();
			throw new IOException("数据读取异常");
		} finally {
			if (reader != null) {
				reader.close();
			}
		}
		return result;
	}
	/** 
	* 获取 access token
	* @param shopId
	* @return String  access token
	*/
	public String getAccessToken(Integer shopId){
		return getAccessToken(selectAppInfoByShopId(shopId));
	}
	/** 
	*根据shopId获取公众账号信息
	* @param shopId
	* @return AppInfo 公众账号信息
	*/
	public AppInfo selectAppInfoByShopId(Integer shopId) {
		try {
			AppInfo appInfo = weixinDao.selectAppInfoByShopId(shopId);
			if(appInfo == null){
				throw new InvalidAccountException("您没有操作公众账号的权限 shopId=" + shopId);
			}
			return appInfo;
		} catch (InvalidAccountException e) {
			logger.error(e.getMessage());
			throw e;
		}
	}
	/** 
	* 获取 access token
	* @param appInfo
	* @return String  access token
	*/
	public String getAccessToken(AppInfo appInfo){
		if(appInfo == null){
			throw new WeixinAuthException(WeixinAuthException.APP_INFO_ERROR);
		}
		//1.从数据库获取
		String token = weixinDao.getAccessToken(appInfo.getSysId());
		if(StringUtils.isEmpty(token)){
			logger.info("<><><><><><><><><><><><><><><><><><><><>");
			logger.info("access token expires,create new access token");
			token = WeixinUtils.getAccessToken(appInfo.getAppId(), appInfo.getAppSecret());
			logger.info("token======================================================+"+token);
			weixinDao.saveAccessToken(new AccessToken(appInfo.getSysId(),token));
		}
		
		return token;
	}
	
}
