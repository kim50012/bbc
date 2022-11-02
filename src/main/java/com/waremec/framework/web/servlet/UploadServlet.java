package com.waremec.framework.web.servlet;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.waremec.framework.service.CommonService;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.framework.utilities.UploadFileUtil;
import com.waremec.weixin.service.WeixinMediaService;
import com.waremec.wpt.admin.domain.AdminShopFileMst;
import com.waremec.wpt.admin.service.ShopService;

public class UploadServlet extends HttpServlet {

 
	private static final long serialVersionUID = 1L;

	private final transient Log logger = LogFactory.getLog(UploadServlet.class);
	
	@Autowired
	@Qualifier("commonService")
	private CommonService commonService;
	@Resource
	private ShopService shopService;
	@Resource
	private WeixinMediaService weixinMediaService;


	private ServletConfig config = null;

	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("getfile") != null && !request.getParameter("getfile").isEmpty()) {
			File file = new File(request.getSession().getServletContext().getRealPath("/") + "imgs/" + request.getParameter("getfile"));
			if (file.exists()) {
				int bytes = 0;
				ServletOutputStream op = response.getOutputStream();

				response.setContentType(UploadFileUtil.getMimeType(file));
				response.setContentLength((int) file.length());
				response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");

				byte[] bbuf = new byte[1024];
				DataInputStream in = new DataInputStream(new FileInputStream(file));

				while ((in != null) && ((bytes = in.read(bbuf)) != -1)) {
					op.write(bbuf, 0, bytes);
				}

				in.close();
				op.flush();
				op.close();
			}
		} else if (request.getParameter("delfile") != null && !request.getParameter("delfile").isEmpty()) {
			File file = new File(request.getSession().getServletContext().getRealPath("/") + "imgs/" + request.getParameter("delfile"));
			if (file.exists()) {
				file.delete(); // TODO:check and report success
			}
		} else if (request.getParameter("getthumb") != null && !request.getParameter("getthumb").isEmpty()) {
		} else {
			PrintWriter writer = response.getWriter();
			writer.write("call POST with multipart form data");
		}
	}

	/**
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		PrintWriter writer = response.getWriter();
		JSONArray json = new JSONArray();

		try {
	
		int fileGroup = 1; // 1:商品   2：素材    3：blog
		int fileType = 1; //1:图片  2：Music 
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new Exception("Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
	 
//		String shopId = (String) request.getSession().getAttribute(SessionUtils.BACK_SHOP_ID_SESSION);
		String shopId = String.valueOf(request.getSession().getAttribute(SessionUtils.BACK_SHOP_ID_SESSION));

		if (shopId == null) {
			throw new Exception("Session为空");
		}

		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());

		

		String fileUrl = UploadFileUtil.ROOT + "/" + shopId + UploadFileUtil.generateFilePath();
		String filePath = request.getSession().getServletContext().getRealPath(fileUrl);

		logger.debug("filePath=======" + filePath);

		File target = new File(filePath);
		if (!target.exists()) {
			target.mkdirs();
		}

		
			List<FileItem> items = uploadHandler.parseRequest(request);

			
			for (FileItem item : items) {
				if (item.isFormField()) {
					String fieldName =item.getFieldName();
					logger.debug("fieldName=" + fieldName + ",fileValue=" + item.getString("utf-8"));
					if(fieldName.equals("fileGroup")){
						fileGroup = IntegerUtils.valueOf(item.getString("utf-8"),1);
					}
					if(fieldName.equals("fileType")){
						fileType = IntegerUtils.valueOf(item.getString("utf-8"),1);
					}
				}
			}
			
			logger.info("fileGroup==" + fileGroup);
			logger.info("fileType==" + fileType);
			
			
			for (FileItem item : items) {

				if (!item.isFormField()) {

					if(fileType == 1){
						if (item.getSize() > 1024 * 1024 * 2) {
							throw new FileUploadException("文件不能大于2M.");
						}  
					}
					
					
					if(fileType == 2){
						if (item.getSize() > 1024 * 1024 * 20) {
							throw new FileUploadException("文件不能大于20M.");
						}  
					}
					if(fileType == 3){
						if (item.getSize() > 1024 * 1024 * 10) {
							throw new FileUploadException("文件不能大于10M.");
						}  
					}
					
//					UploadResult result = UploadFileUtil.upload(request, originalFile, item.getName(), UploadFileUtil.UPLOAD_SHOP);
					
					String newFilename = "";
					
					if(fileGroup == 3){
						newFilename = UploadFileUtil.generateSystemFilename(shopId,item.getName(), UploadFileUtil.UPLOAD_BLOG);
					}else if(fileGroup == 2){
						newFilename = UploadFileUtil.generateSystemFilename(shopId,item.getName(), UploadFileUtil.UPLOAD_MATERIAL);
					}else{
						newFilename = UploadFileUtil.generateSystemFilename(shopId,item.getName(), UploadFileUtil.UPLOAD_SHOP);
					}
					
					fileUrl += newFilename;
					target = new File(filePath, newFilename);
					item.write(target);
					logger.debug("newFilename====" + newFilename);
					logger.debug("fileUrl====" + fileUrl);

//////////////////////
					//上传视频文件到微信服务器
					String mediaId = "";
					if(fileGroup == 2 && fileType == 3){
						mediaId = weixinMediaService.uploadVideoMaterial(Integer.valueOf(shopId), target, item.getName(), item.getName());
					}
					//////////////////////
					
					AdminShopFileMst asfm = new AdminShopFileMst();
					asfm.setJobType("I");
					asfm.setFileGroup(fileGroup);
					asfm.setFileName(item.getName());
					asfm.setFileSize(String.valueOf(item.getSize()));
					asfm.setFileSysname(newFilename);
					asfm.setFileType(String.valueOf(fileType));
					asfm.setIsUseNum("1");
					asfm.setFullURL(fileUrl);
					asfm.setCreatedUserId("0");
					asfm.setModifiedUserId("0");
					asfm.setShopId(shopId);
					asfm.setMediaId(mediaId);
					 
					String fileId = shopService.saveShopFileMst("Shop.saveShopFileMst", asfm);

					JSONObject jsono = new JSONObject();
					jsono.put("success", true);
					jsono.put("fileUrl", fileUrl);
					jsono.put("fileId", fileId);
					json.put(jsono);
				

					// ///////////////
				} 
			}
		} catch (FileUploadException e) {
			JSONObject jsono = new JSONObject();
			jsono.put("success", false);
			jsono.put("message", e.getMessage());
			json.put(jsono);
			
			
		} catch (Exception e) {
			JSONObject jsono = new JSONObject();
			jsono.put("success", false);
			jsono.put("message", e.getMessage());
			json.put(jsono);
		} finally {
			logger.debug("json.toString()==" + json.toString());
			writer.write(json.toString());
			writer.close();
		}

	}

}