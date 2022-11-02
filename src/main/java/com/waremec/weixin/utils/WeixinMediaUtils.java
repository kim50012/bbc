package com.waremec.weixin.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.axis.utils.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.waremec.weixin.cons.DownloadFileType;
import com.waremec.weixin.domain.WeixinReturn;
import com.waremec.weixin.domain.material.MaterialCountReturn;
import com.waremec.weixin.domain.material.MaterialListReturn;
import com.waremec.weixin.domain.material.MaterialReturn;
import com.waremec.weixin.domain.material.MediaReturn;
import com.waremec.weixin.domain.material.MediaUrlReturn;
import com.waremec.weixin.domain.material.NewsItem;
import com.waremec.weixin.domain.material.NewsMaterialListReturn;
import com.waremec.weixin.domain.material.NewsMaterialReturn;
import com.waremec.weixin.domain.material.VideoMaterialReturn;
import com.waremec.weixin.exception.MediaException;
import com.waremec.weixin.exception.WeixinErrorException;
 
/** 
* @Package com.waremec.weixin.utils 
* @FileName WeixinMediaUtils
* @Description 素材管理接口工具类  
* @author taebem 
* @date 2015年5月7日 下午3:56:21 
*  
*/
public class WeixinMediaUtils extends WeixinBaseUtils{

	private static final transient Log logger = LogFactory.getLog(WeixinMediaUtils.class);
	
	/**  
	 * 新增临时素材接口
	 */
	private static final String MEDIA_UPLOAD_URL = "https://api.weixin.qq.com/cgi-bin/media/upload?access_token=ACCESS_TOKEN&type=TYPE";
	/**  
	 * 获取临时素材接口
	 */
	private static final String MEDIA_GET_URL = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=ACCESS_TOKEN&media_id=MEDIA_ID";
	/**  
	* 新增永久图文素材接口
	*/
	private static final String MATERIAL_ADD_NEWS_URL = "https://api.weixin.qq.com/cgi-bin/material/add_news?access_token=ACCESS_TOKEN";
	/**  
	* 修改永久图文素材接口
	*/
	private static final String MATERIAL_UPDATE_NEWS_URL = "https://api.weixin.qq.com/cgi-bin/material/update_news?access_token=ACCESS_TOKEN";
	
	/**  
	*  新增永久接口 - 图片（image）、语音（voice）、视频（video）和缩略图（thumb）
	*/
	private static final String MATERIAL_ADD_MATERAL_URL = "https://api.weixin.qq.com/cgi-bin/material/add_material?access_token=ACCESS_TOKEN";
	/**  
	* 获取永久素材接口
	*/
	private static final String MATERIAL_GET_MATERIAL_URL = "https://api.weixin.qq.com/cgi-bin/material/get_material?access_token=ACCESS_TOKEN";
	/**  
	* 删除永久素材接口
	*/
	private static final String MATERIAL_DEL_METERIAL_URL = "https://api.weixin.qq.com/cgi-bin/material/del_material?access_token=ACCESS_TOKEN";
	/**  
	* 获取素材总数接口
	*/
	private static final String MATERIAL_GET_METERIALCOUNT_URL = "https://api.weixin.qq.com/cgi-bin/material/get_materialcount?access_token=ACCESS_TOKEN";
	/**  
	* 获取素材列表接口
	*/
	private static final String MATERIAL_BATCHGET_METERIAL_URL = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token=ACCESS_TOKEN";
	
	/**
	 * 新增图片换取微信图片url接口
	 */
	private static final String MEDIA_UPLOADING_URL = "https://api.weixin.qq.com/cgi-bin/media/uploadimg?access_token=ACCESS_TOKEN";

	
	public static void main(String[] args) {

		String token = TokenUtils.getToken(16);
		
		String mediaId = "tEiKeESYqywyvSSoDP7yHZ-cPxxqoPFHo6eQbuUDhuzAlEfDtpgWr_n9D0HG8oW7"; //16
		downloadMedia(token,DownloadFileType.IMAGE, mediaId, "D:\\testddd");
//		String mediaId = "13QaMEc54Q6AeKAicE7ZTUWNSINtBF7gfbhENmmoSB50O_u-LRPyqaDf7Y_ivZiy"; //8
// 		downloadMedia(token,DownloadFileType.VOICE, mediaId, "D:\\testddd");

// 		 getMaterialCount(token) ;
// 		  getMaterialList(token,"image",null,null) ;
		// System.out.println("=====================");
//		 getMaterialList(token,"video",null,null) ;
		// System.out.println("=====================");
// 		 getMaterialList(token,"voice",null,null) ;
		// System.out.println("=====================");
		// ///////////////////////////////////////////////////////
		// NewsMaterialListReturn newsMaterialList = getNewsMaterialList(token,
		// null, null);
		// logger.info(newsMaterialList.toString());
		// if (!newsMaterialList.getItem().isEmpty()) {
		// List<MediaItem> mediaItemList = newsMaterialList.getItem();
		// for (MediaItem mediaItem : mediaItemList) {
		// logger.info(mediaItem.toString());
		// NewsItemContent content = mediaItem.getContent();
		// if (content != null && !content.getNews_item().isEmpty()) {
		// List<NewsItem> newsItemList = content.getNews_item();
		// for (NewsItem newsItem : newsItemList) {
		// logger.info(newsItem.toString());
		// }
		// }
		// }
		// }
		// ///////////////////////////////////////////////////////

// 		  MediaReturn returns = WeixinMediaUtils.uploadMedia(token, "image",  "D:\\dddddddd.jpg");
		// logger.info(returns.toString());
		// System.out.println(returns);
// 		 System.out.println("=================");
// 		 uploadMaterial(token , "image", "D:\\dddddddd.jpg");
// 	   System.out.println("=================");
		// System.out.println("=================");
		// getMaterial(token,"UBlW3Z8uriaiPoCicfIG-bCASv45MvUdLVEEID7eQPc");

		// ///////////////////////////////////////////////////////
		// NewsMaterialReturn newsMaterialReturn =
		// getNewsMaterial(token,"UBlW3Z8uriaiPoCicfIG-bCASv45MvUdLVEEID7eQPc");
		// if(!newsMaterialReturn.getNews_item().isEmpty()){
		// for (NewsItem item : newsMaterialReturn.getNews_item()) {
		// System.out.println(item);
		// }
		// }
		// ///////////////////////////////////////////////////////
		// ///////////////////////////////////////////////////////
//		List<NewsItem> list = new ArrayList<NewsItem>();
//		NewsItem item1 = new NewsItem();
//		NewsItem item2 = new NewsItem();
//		
//		item1.setTitle("testoooo1");
//		item1.setThumb_media_id("UBlW3Z8uriaiPoCicfIG-d7Y4zP24HY38K_kAQjdo-Q");
//		item1.setAuthor("郑太范");
//		item1.setDigest("hahahaha");
//		item1.setShow_cover_pic("1");
//		item1.setContent("<p>tttttttttttttttttt</p>");
//		item1.setContent_source_url("http://www.baidu.com");
//		
//		item2.setTitle("testoo22222oo1");
//		item2.setThumb_media_id("VZEhvYMtd-D-3k5AjnQ-6A3nirSEiNvdFAvoy-ec3Q8");
//		item2.setAuthor("郑太范1111");
//		item2.setDigest("hahahaha");
//		item2.setShow_cover_pic("1");
//		item2.setContent("<p>ttttttttttdtttttttt</p>");
//		item2.setContent_source_url("http://www.baidu.com");
//		list.add(item1);
//		list.add(item2);
// 		addNewsMaterial(token,list);
		// ///////////////////////////////////////////////////////
//		uploadVideoMaterial(token, "D:\\dd\\1007_b5206af5f35c4c9c81f5e3d03ad35797.f10.mp4","aaaa","bbbbb");
		 // ///////////////////////////////////////////////////////
//		 getVoiceMaterial(token,  "4xFfg86GCmYg3iPbnkP3SX6pusWjE53VKohQ1VDY3xY", "D:\\dd");
		// ///////////////////////////////////////////////////////
//  	getImageMaterial(token,  "KVsCzTIWS0Y0KKm8T4K-6i5PC6SCUyrsdCjsXf8CE1c", "D:\\dd");
		// ///////////////////////////////////////////////////////
// 		  getVideoMaterial(token,  "3IkvXFPnee5W_WCy2fDZsq5n3TfGtJm8l9LfgW1URp0", "D:\\dd");
		// ///////////////////////////////////////////////////////
//	  delMaterial(token,"08l39uNuccl6vlusB16jIBy91euZHvivQVfQr7XV7YQ");
		// System.out.println("=================");
	}

	/** 
	* 下载语音素材
	* @param downlaodUrl 素材下载地址
	* @param media_id	素材ID
	* @param savePath	本地保存路径（不包含文件名）	
	* @return String filepath 文件保存全路径
	*/
	private static String downloadVoiceMaterial(String downlaodUrl, String media_id, String savePath) {

		String filePath = null;
		
		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();  
	    CloseableHttpClient httpClient = httpClientBuilder.build();  
		try {
			// 创建HttpPost
			HttpPost httpPost = new HttpPost(downlaodUrl);
			logger.info("Executing Request: " + httpPost.getRequestLine());
			
			//设置post编码   
//			httpPost.setEntity(new UrlEncodedFormEntity(params, HTTP.UTF_8));
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("media_id", media_id);
			httpPost.setEntity(new StringEntity(jsonObject.toString(), Consts.UTF_8));
			
			logger.info("params: " + jsonObject.toString());
			 //设置报文头  
// 			 httpPost.setHeader("Content-Type", "text/xml;charset=" + HTTP.UTF_8);  
			// 执行post请求
			CloseableHttpResponse response = httpClient.execute(httpPost);
			
			try {
				logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ response logging ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
				// 获取响应实体
				HttpEntity entity = response.getEntity();
				// 打印响应状态
				logger.info("Response Status: " + response.getStatusLine());
				if (entity != null) {
					Header[] headers = response.getAllHeaders();
					for (Header header : headers) {
						logger.info("Response Header:" + header.getName() +"===>" + header.getValue());
					} 
					
					String fileName = media_id + ".amr";
					
					File parentPath = new File(savePath);
					 
					if(!parentPath.exists()){
						parentPath.mkdirs();
					}

					if (!savePath.endsWith("\\")) {
						savePath += "\\";
					}
					filePath = savePath + fileName;
					
					InputStream in = entity.getContent();
					try {
						FileOutputStream fout = new FileOutputStream( new File(filePath));
						int l = -1;
						byte[] tmp = new byte[1024];
						while ((l = in.read(tmp)) != -1) {
							fout.write(tmp, 0, l);
							// 注意这里如果用OutputStream.write(buff)的话，图片会失真，大家可以试试
						}
						fout.flush();
						fout.close();
					} finally {
						// 关闭低层流。
						in.close();
					}
				}
				
				EntityUtils.consume(entity); 
				
				String info = String.format("下载媒体文件成功，filePath=" + filePath);
				logger.info(info);
			
				logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ response logging ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			} catch (Exception e) {
				throw e;
			}finally{
				response.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String error = String.format("下载媒体文件失败：%s", e.getMessage());
			logger.info(error);
		}finally {
			//关闭流并释放资源  
			if(httpClient != null){
				try {
					httpClient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}  
			}
		}
		return filePath;
	
	}
	
 
	/** 
	* 下载图片素材
	* @param downlaodUrl 素材下载地址
	* @param media_id	素材ID
	* @param savePath	本地保存路径（不包含文件名）	
	* @return String filepath 文件保存全路径
	*/
	private static String downloadImageMaterial(String downlaodUrl, String media_id, String savePath) {

		String filePath = null;
		
	    CloseableHttpClient httpClient = HttpClientBuilder.create().build();  
		try {
			// 创建HttpPost
			HttpPost httpPost = new HttpPost(downlaodUrl);
			logger.info("Executing Request: " + httpPost.getRequestLine());
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("media_id", media_id);
			httpPost.setEntity(new StringEntity(jsonObject.toString(), Consts.UTF_8));
			
			logger.info("params: " + jsonObject.toString());
			 //设置报文头  
// 			 httpPost.setHeader("Content-Type", "text/xml;charset=" + HTTP.UTF_8);  
			// 执行post请求
			CloseableHttpResponse response = httpClient.execute(httpPost);
			
			try {
				logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ response logging ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
				
				// 获取响应实体
				HttpEntity entity = response.getEntity();
				// 打印响应状态
				logger.info("Response Status: " + response.getStatusLine());
				if (entity != null) {
					
					String fileName = media_id + ".jpg";
					
					File parentPath = new File(savePath);
					 
					if(!parentPath.exists()){
						parentPath.mkdirs();
					}

					if (!savePath.endsWith("\\")) {
						savePath += "\\";
					}
					filePath = savePath + fileName;
					
					InputStream in = entity.getContent();
					try {
						FileOutputStream fout = new FileOutputStream( new File(filePath));
						int l = -1;
						byte[] tmp = new byte[1024];
						while ((l = in.read(tmp)) != -1) {
							fout.write(tmp, 0, l);
							// 注意这里如果用OutputStream.write(buff)的话，图片会失真，大家可以试试
						}
						fout.flush();
						fout.close();
					} finally {
						// 关闭低层流。
						in.close();
					}
				}
				
				EntityUtils.consume(entity); 
				
				String info = String.format("下载媒体文件成功，filePath=" + filePath);
				logger.info(info);
				
				logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ response logging ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			} catch (Exception e) {
				throw e;
			}finally{
				response.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String error = String.format("下载媒体文件失败：%s", e.getMessage());
			logger.info(error);
		}finally {
			//关闭流并释放资源  
			if(httpClient != null){
				try {
					httpClient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}  
			}
		}
		return filePath;
	
	}
	

	/** 
	* 下载视频素材
	* @param downlaodUrl 素材下载地址
	* @param media_id	素材ID
	* @param savePath	本地保存路径（不包含文件名）	
	* @return String filepath 文件保存全路径
	*/
	private static String downloadVideoMaterial(String downlaodUrl, String media_id, String savePath) {
		String filePath = null;
		// 生成一个httpclient对象
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpGet httpget = new HttpGet(downlaodUrl);
		logger.info("Executing Request: " + httpget.getRequestLine());

		try {
			CloseableHttpResponse response = httpClient.execute(httpget);
			try {
				logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ response logging ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
				// 获取响应实体
				HttpEntity entity = response.getEntity();
				// 打印响应状态
				logger.info("Response Status: " + response.getStatusLine());
				/*
				 * Header[] headers = response.getAllHeaders(); for (Header
				 * header : headers) { logger.info("header:" + header.getName()
				 * + "===>" + header.getValue()); }
				 */
				if (entity != null) {
					String fileName = getDownloadMaterialFlieName(response, media_id);
					
					File parentPath = new File(savePath);
				 
					if(!parentPath.exists()){
						parentPath.mkdirs();
					}

					if (!savePath.endsWith("\\")) {
						savePath += "\\";
					}
					filePath = savePath + fileName;
//					logger.info("filePath=" + filePath);
					
					InputStream in = entity.getContent();
					try {
						FileOutputStream fout = new FileOutputStream( new File(filePath));
						int l = -1;
						byte[] tmp = new byte[1024];
						while ((l = in.read(tmp)) != -1) {
							fout.write(tmp, 0, l);
							// 注意这里如果用OutputStream.write(buff)的话，图片会失真，大家可以试试
						}
						fout.flush();
						fout.close();
					} finally {
						// 关闭低层流。
						in.close();
					}
				
				}
				// 销毁
				EntityUtils.consume(entity);
				
				String info = String.format("下载媒体文件成功，filePath=" + filePath);
				logger.info(info);
				
				logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ response logging ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			} catch (IOException e) {
				throw e;
			}finally{
				response.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String error = String.format("下载媒体文件失败：%s", e.getMessage());
			logger.info(error);
		}finally {
			//关闭流并释放资源  
			if(httpClient != null){
				try {
					httpClient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}  
			}
		}	
 
		return filePath;
	}
	
//	/**
//	 * 根据content-type获取文件扩展名
//	 * @param contentType
//	 * @return String 扩展名
//	 */
//	private static String getFileEndWitsh(String contentType) {
//		logger.info("contentType=" + contentType);
//		String ext = "";
//		if ("image/jpeg".equals(contentType)) {
//			ext = ".jpg";
//		} else if ("application/x-jpg".equals(contentType)) {
//			ext = ".jpg";
//		} else if ("audio/amr".equals(contentType)) {
//			ext = ".amr";
//		}
//
//		return ext;
//	}
	
	private static Boolean chechType(String type) {
		return Arrays.asList("image", "voice", "video", "thumb").contains(type);
	}
	
	/** 
	* 获取下载文件名
	* @param response
	* @param media_id
	* @return
	*/
	private static String getDownloadMaterialFlieName(HttpResponse response, String media_id) {

		String fliename = "";
		String fileExt = ".mp4";

		Header contentDisposition = response.getFirstHeader("Content-Disposition");
		if (contentDisposition != null) {
			try {
				String contentDispositionValue = contentDisposition.getValue();
				if (contentDispositionValue.indexOf("filename=") > 0) {
					fliename = contentDispositionValue.split("filename=")[1]; 
					fliename = fliename.replaceAll("\"", ""); 
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		if (StringUtils.isEmpty(fliename)) {
			Header contentType = response.getFirstHeader("Content-Type");

			if (contentType != null) {
				if ("video/mp4".equalsIgnoreCase(contentType.getValue())) {
					fileExt = ".mp4";
				}else if ("image/jpep".equalsIgnoreCase(contentType.getValue())) {
					fileExt = ".jpg";
				}else if ("application/x-jpg".equals(contentType.getValue())) {
					fileExt = ".jpg";
				} else if ("audio/amr".equals(contentType.getValue())) {
					fileExt = ".amr";
				}
			}

			fliename = media_id + fileExt;
		}

		return fliename;
	}

	/**
	 * 新增临时素材 （即上传临时多媒体文件）
	 * 
	 * @param access_token
	 *            调用接口凭证
	 * @param type
	 *            媒体文件类型，分别有图片（image）、语音（voice）、视频（video）和缩略图（thumb）
	 * @param fileUrl
	 * @return
	 * 
	 *         公众号可调用本接口来上传图片、语音、视频等文件到微信服务器，上传后服务器会返回对应的media_id，
	 *         公众号此后可根据该media_id来获取多媒体。请注意，media_id是可复用的，调用该接口需http协议。
	 * 
	 *         注意事项 上传的多媒体文件有格式和大小限制，如下：<br>
	 *         图片（image）: 1M，支持JPG格式<br>
	 *         语音（voice）：2M，播放长度不超过60s，支持AMR\MP3格式<br>
	 *         视频（video）：10MB，支持MP4格式<br>
	 *         缩略图（thumb）：64KB，支持JPG格式<br>
	 *         媒体文件在后台保存时间为3天，即3天后media_id失效<br>
	 */
	public static MediaReturn uploadMedia(String access_token, String type, String fileUrl) {
		
		if (!chechType(type)) {
			throw new MediaException(ErrorCode.CODE_40004.getCode(), ErrorCode.CODE_40004.getDesc());
		}
		String url = getInterfaceUrl(MEDIA_UPLOAD_URL, access_token).replaceAll("TYPE", type);

		File file = new File(fileUrl);
		if (!file.exists() || !file.isFile()) {
			logger.error("不合法的文件路径=" + fileUrl);
			throw new MediaException(ErrorCode.CODE_40005.getCode(), ErrorCode.CODE_40005.getDesc());
		}

		String result = HttpClientUtils.uploadFile(url, fileUrl);

		MediaReturn returns = new Gson().fromJson(result, MediaReturn.class);

		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}

		return returns;

	}

	/**
	 * 获取临时素材(原获取媒体文件) - 后期可能改造用httpclient实现
	 * 
	 * @param access_token
	 *            接口访问凭证
	 * @param fileType 文件类型
	 * @param media_id
	 *            媒体文件id
	 * @param savePath
	 *            文件在服务器上的存储路径
	 * */
	public static String downloadMedia(String access_token, DownloadFileType fileType, String media_id, String savePath) {
		String filePath = null;
		
		String url = getInterfaceUrl(MEDIA_GET_URL, access_token).replaceAll("MEDIA_ID", media_id);
		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();  
	    CloseableHttpClient httpClient = httpClientBuilder.build();  
		try {
			// 创建HttpPost
			HttpGet httpGet = new HttpGet(url);
			logger.info("Executing Request: " + httpGet.getRequestLine());
			 
			// 执行get请求
			CloseableHttpResponse response = httpClient.execute(httpGet);
			
			try {
				logger.info("▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ response logging ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
				// 获取响应实体
				HttpEntity entity = response.getEntity();
				// 打印响应状态
				logger.info("Response Status: " + response.getStatusLine());
				if (entity != null) {
					Header[] headers = response.getAllHeaders();
					for (Header header : headers) {
						logger.info("Response Header:" + header.getName() +"===>" + header.getValue());
					} 
					
//					String fileName = getDownloadMaterialFlieName(response, media_id);
					
					String fileExt = "";
					
					if(fileType == DownloadFileType.IMAGE){
						fileExt = ".jpg";
					}else if(fileType == DownloadFileType.VOICE){
						fileExt = ".amr";
					}
					
					File parentPath = new File(savePath);
					 
					if(!parentPath.exists()){
						parentPath.mkdirs();
					}

					if (!savePath.endsWith("\\")) {
						savePath += "\\";
					}
					String fileName = media_id + fileExt;
					filePath = savePath + fileName ;
					
					InputStream in = entity.getContent();
					try {
						FileOutputStream fout = new FileOutputStream( new File(filePath));
						int l = -1;
						byte[] tmp = new byte[1024];
						while ((l = in.read(tmp)) != -1) {
							fout.write(tmp, 0, l);
							// 注意这里如果用OutputStream.write(buff)的话，图片会失真，大家可以试试
						}
						fout.flush();
						fout.close();
					} finally {
						// 关闭低层流。
						in.close();
					}
				}
				
				EntityUtils.consume(entity); 
				
				String info = String.format("下载媒体文件成功，filePath=" + filePath);
				logger.info(info);
			
				logger.info("▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ response logging ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
			} catch (Exception e) {
				throw e;
			}finally{
				response.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			String error = String.format("下载媒体文件失败：%s", e.getMessage());
			logger.info(error);
		}finally {
			//关闭流并释放资源  
			if(httpClient != null){
				try {
					httpClient.close();
				} catch (IOException e) {
					e.printStackTrace();
				}  
			}
		}
		return filePath;
	}
	
//	/**
//	 * 获取临时素材(原获取媒体文件) - 后期可能改造用httpclient实现
//	 * 
//	 * @param access_token
//	 *            接口访问凭证
//	 * @param media_id
//	 *            媒体文件id
//	 * @param savePath
//	 *            文件在服务器上的存储路径
//	 * */
//	public static String downloadMedia(String access_token, String media_id, String savePath) {
//		String filePath = null;
//		String requestUrl = "https://api.weixin.qq.com/cgi-bin/media/get?access_token=" + access_token + "&media_id=" + media_id;
//		logger.info("executing request[GET]: " + requestUrl);
//		try {
//			URL url = new URL(requestUrl);
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setDoInput(true);
//			conn.setRequestMethod("GET");
//
//			if (!savePath.endsWith("\\")) {
//				savePath += "\\";
//			}
//			// 根据内容类型获取扩展名
//			String fileExt = WeixinMediaUtils.getFileEndWitsh(conn.getHeaderField("Content-Type"));
//			logger.info("conn.getHeaderField(Content-Type)========" + conn.getHeaderField("Content-Type"));
//			logger.info("conn.getHeaderField(Content-disposition)=" + conn.getHeaderField("Content-disposition"));
//			// 将mediaId作为文件名
//			filePath = savePath + media_id + fileExt;
//
//			logger.info("filePath=" + filePath);
//
//			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
//			FileOutputStream fos = new FileOutputStream(new File(filePath));
//			byte[] buf = new byte[8096];
//			int size = 0;
//			while ((size = bis.read(buf)) != -1)
//				fos.write(buf, 0, size);
//			fos.close();
//			bis.close();
//
//			conn.disconnect();
//			String info = String.format("下载媒体文件成功，filePath=" + filePath);
//			logger.info(info);
//		} catch (Exception e) {
//			filePath = null;
//			String error = String.format("下载媒体文件失败：%s", e);
//			logger.info(error);
//		}
//		return filePath;
//	}

	
	/** 
	* 新增永久图文素材
	* @param access_token
	* @param newsItemList 图文列表
	* @return String media_id:永久素材的media_id
	*/
	public static String addNewsMaterial(String access_token, List<NewsItem> newsItemList ) {
	
		String url = getInterfaceUrl(MATERIAL_ADD_NEWS_URL, access_token);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("articles", JSONArray.fromObject(newsItemList));
		
		String result =HttpClientUtils.requestPost(url, jsonObject);
		MaterialReturn returns = new Gson().fromJson(result, MaterialReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		return returns.getMedia_id();
	}
	
	/** 
	* 修改永久图文素材
	* @param access_token
	* @param media_id 要修改的图文消息的id
	* @param index 	要更新的文章在图文消息中的位置（多图文消息时，此字段才有意义），第一篇为0
	* @param newsItemList 图文列表
	*/
	public static void updateNewsMaterial(String access_token,String media_id, Integer index, List<NewsItem> newsItemList ) {
	
		String url = getInterfaceUrl(MATERIAL_UPDATE_NEWS_URL, access_token);	
			
			
		if(index == null || index < 0 || index > 10){
			index = 0;
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("media_id", media_id);
		jsonObject.put("index", index);
		jsonObject.put("articles", JSONArray.fromObject(newsItemList));
		
		String result =HttpClientUtils.requestPost(url, jsonObject);
		MaterialReturn returns = new Gson().fromJson(result, MaterialReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		} 
	}
	
	
	
	/**
	 * 新增永久素材 - 新增其他类型永久素材(图片（image）、语音（voice）、缩略图（thumb）)
	 * 
	 * @param access_token
	 * @param type
	 *            是 媒体文件类型，分别有图片（image）、语音（voice）、缩略图（thumb）
	 * @param fileUrl
	 * @return String media_id:永久素材的media_id
	 */
	public static String addMaterial(String access_token, String type, String fileUrl) {
		
		String url = getInterfaceUrl(MATERIAL_ADD_MATERAL_URL, access_token);
		
		String result = HttpClientUtils.uploadMaterial(url, type, fileUrl);
		MaterialReturn returns = new Gson().fromJson(result, MaterialReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		return returns.getMedia_id();
	}
	
	/** 
	* 新增永久素材 - 新增视频（video） 永久素材 
	* @param access_token
	* @param fileUrl 文件路径
	* @param title 视频素材的标题
	* @param introduction 视频素材的描述
	* @return String media_id:永久素材的media_id
	*/
	public static String addVideoMaterial(String access_token, String fileUrl,String title,String introduction) {
		
		String url = getInterfaceUrl(MATERIAL_ADD_MATERAL_URL, access_token);
		
		String result = HttpClientUtils.uploadVideoMaterial(url, "video", fileUrl,title,introduction);
		MaterialReturn returns = new Gson().fromJson(result, MaterialReturn.class);
		
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		return returns.getMedia_id();
	}
 
	/**************************************************************************************************/
	
	
	/** 
	*获取永久素材 - 语音
	* @param access_token
	* @param media_id	素材ID
	* @param savePath	本地保存路径（不包含文件名）	
	* @return String filepath 文件保存全路径
	*/
	public static String getVoiceMaterial(String access_token, String media_id, String savePath) {

		String url = getInterfaceUrl(MATERIAL_GET_MATERIAL_URL, access_token);

		String filepath =  downloadVoiceMaterial(url, media_id, savePath);
		
		logger.info("filepath==" + filepath);
		 
		return filepath;

	}
	
	
	/** 
	*获取永久素材 - 图片
	* @param access_token
	* @param media_id	素材ID
	* @param savePath	本地保存路径（不包含文件名）	
	* @return String filepath 文件保存全路径
	*/
	public static String getImageMaterial(String access_token, String media_id, String savePath) {

		String url = getInterfaceUrl(MATERIAL_GET_MATERIAL_URL, access_token);

		String filepath =  downloadImageMaterial(url, media_id, savePath);
		
		logger.info("filepath==" + filepath);
		 
		return filepath;
	}
	
	

	/**
	 * 获取永久素材 - 视频
	 * 
	 * @param access_token
	 * @param media_id
	 *            要获取的素材的media_id
	 * @param savePath
	 *            文件保存路径
	 * @return
	 */
	public static VideoMaterialReturn getVideoMaterial(String access_token, String media_id, String savePath) {

		String url = getInterfaceUrl(MATERIAL_GET_MATERIAL_URL, access_token);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("media_id", media_id);

		String result = HttpClientUtils.requestPost(url, jsonObject);

		VideoMaterialReturn returns = new Gson().fromJson(result, VideoMaterialReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}
		
		returns.setFilepath(downloadVideoMaterial(returns.getDown_url(), media_id, savePath));
		
		return returns;

	}

	/**
	 * 获取永久素材 - 图文
	 * 
	 * @param access_token
	 * @param media_id
	 *            要获取的素材的media_id
	 * @return
	 */
	public static NewsMaterialReturn getNewsMaterial(String access_token, String media_id) {
		String url = getInterfaceUrl(MATERIAL_GET_MATERIAL_URL, access_token);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("media_id", media_id);

		String result = HttpClientUtils.requestPost(url, jsonObject);
		NewsMaterialReturn returns = new Gson().fromJson(result, NewsMaterialReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

		return returns;

	}

	/**
	 * 删除永久素材
	 * 
	 * <h3>请注意：</h3>
	 * <ul>
	 * <li>
	 * 	  1、请谨慎操作本接口，因为它可以删除公众号在公众平台官网素材管理模块中新建的图文消息、
	 *   语音、视频等素材（但需要先通过获取素材列表来获知素材的media_id）
	 * </li>
	 * <li>
	 * 	2、临时素材无法通过本接口删除
	 * </li>
	 * <li>
	 * 	3、调用该接口需https协议
	 * </li>
	 * </ul>
	 * @param access_token 调用接口凭证
	 * @param media_id 要获取的素材的media_id
	 * @return void
	 */
	public static void delMaterial(String access_token, String media_id) {
		String url = getInterfaceUrl(MATERIAL_DEL_METERIAL_URL, access_token);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("media_id", media_id);

		String result = HttpClientUtils.requestPost(url, jsonObject);

		WeixinReturn returns = new Gson().fromJson(result, WeixinReturn.class);
//		logger.info(returns);
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

	}

	/**
	 * 获取永久素材总数
	 *  
	 * <h3>请注意：</h3>
	 * <ul>
	 * <li>
	 * 	1.永久素材的总数，也会计算公众平台官网素材管理中的素材
	 * </li>
	 * <li>
	 * 	2.图片和图文消息素材（包括单图文和多图文）的总数上限为5000，其他素材的总数上限为1000
	 * </li>
	 * <li>
	 * 	3.调用该接口需https协议
	 * </li>
	 * </ul>
	 * 
	 * @param access_token
	 * @return MaterialCountReturn
	 */
	public static MaterialCountReturn getMaterialCount(String access_token) {
		String url = getInterfaceUrl(MATERIAL_GET_METERIALCOUNT_URL, access_token);

		String result = HttpClientUtils.requestGet(url);
		MaterialCountReturn returns = new Gson().fromJson(result, MaterialCountReturn.class);

		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

		return returns;

	}

	/**
	 * 获取永久素材的列表 - 图片（image）、视频（video）、语音 （voice）
	 * 
	 * @param access_token
	 * @param type
	 *            素材的类型，图片（image）、视频（video）、语音 （voice）
	 * @param offset
	 *            从全部素材的该偏移位置开始返回，0表示从第一个素材 返回
	 * @param count
	 *            返回素材的数量，取值在1到20之间
	 * @return MaterialListReturn
	 */
	public static MaterialListReturn getMaterialList(String access_token, String type, Integer offset, Integer count) {

		if (!Arrays.asList("image", "voice", "video", "news").contains(type)) {
			throw new MediaException(ErrorCode.CODE_40004.getCode(), ErrorCode.CODE_40004.getDesc());
		}

		String url = getInterfaceUrl(MATERIAL_BATCHGET_METERIAL_URL, access_token);
		JSONObject jsonObject = new JSONObject();
		if (offset == null) {
			offset = 0;
		}
		if (count == null) {
			count = 20;
		}
		jsonObject.put("type", type);
		jsonObject.put("offset", offset);
		jsonObject.put("count", count);

		String result = HttpClientUtils.requestPost(url, jsonObject);

		MaterialListReturn returns = new Gson().fromJson(result, MaterialListReturn.class);
//		logger.info(returns.toString());
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

		return returns;
	}

	/**
	 * 获取永久素材的列表 - 图文（news）
	 * 
	 * @param access_token
	 * @param offset
	 *            从全部素材的该偏移位置开始返回，0表示从第一个素材 返回
	 * @param count
	 *            返回素材的数量，取值在1到20之间
	 * @return NewsMaterialListReturn
	 */
	public static NewsMaterialListReturn getNewsMaterialList(String access_token, Integer offset, Integer count) {

		String url = getInterfaceUrl(MATERIAL_BATCHGET_METERIAL_URL, access_token);
		
		JSONObject jsonObject = new JSONObject();
		if (offset == null) {
			offset = 0;
		}
		if (count == null) {
			count = 20;
		}
		jsonObject.put("type", "news");
		jsonObject.put("offset", offset);
		jsonObject.put("count", count);

		String result = HttpClientUtils.requestPost(url, jsonObject);

		NewsMaterialListReturn returns = new Gson().fromJson(result, NewsMaterialListReturn.class);
//		logger.info(returns.toString());
		if (returns.isError()) {
			throw new WeixinErrorException(returns);
		}

		return returns;
	}
	/**
	 * 将本地图片上传到微信服务器上换取url
	 * @param access_token
	 * @param fileUrl
	 * @return
	 */
	public static MediaUrlReturn uploadingMedia(String access_token,String fileUrl) {

		String url = getInterfaceUrl(MEDIA_UPLOADING_URL, access_token);
		File file = new File(fileUrl);
		if (!file.exists() || !file.isFile()) {
			logger.error("不合法的文件路径=" + fileUrl);
			throw new MediaException(ErrorCode.CODE_40005.getCode(), ErrorCode.CODE_40005.getDesc());
		}

		String result = HttpClientUtils.uploadFile(url, fileUrl);

		MediaUrlReturn returns = new Gson().fromJson(result, MediaUrlReturn.class);
		if(returns.isError()){
			throw new WeixinErrorException(returns);
		}

		return returns;

	}

}
