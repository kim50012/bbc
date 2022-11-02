/**   
 * @Title: WeixinQRCodeAction.java 
 * @Package com.waremec.weixin.action 
 * @Description:  
 * @author taebem
 * @date 2015年6月15日 下午5:09:50 
 * @version V1.0   
 */
package com.waremec.weixin.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.framework.utilities.SessionUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.utils.Constants;
import com.waremec.weixin.utils.WeixinQRCodeUtils;
import com.waremec.wpt.admin.service.FileService;

/**
 * @Package com.waremec.weixin.action
 * @FileName WeixinQRCodeAction
 * @Description
 * @author taebem
 * @date 2015年6月15日 下午5:09:50
 * 
 */
@Controller("weixinQRCodeAction")
@Scope(ScopeType.prototype)
public class WeixinQRCodeAction extends WeixinBaseAction {

	private static final long serialVersionUID = 1L;
	
	@Resource
	private FileService fileService;
	
	
	public String index() {
		

		List<AppInfo> appInfoList = weixinService.selectAllAppInfoList();
		request.put("appInfoList", appInfoList);
		
//		request.put("shopId", getRequest().getParameter("shopId"));
		
		return "index";
	}
	
	public String showImg() throws IOException{
		
		HttpServletRequest req = getRequest(); 
		HttpServletResponse res = getResponse();
		
		String fullUrl =  fileService.getRealPath(req);
		System.out.println("fullUrl=" + fullUrl);
	 
		try {
			  // 以byte流的方式打开文件d:\1.gif
	           FileInputStream hFile = new FileInputStream(fullUrl);
	           int i = hFile.available(); // 得到文件大小
	           byte data[] = new byte[i];
	           hFile.read(data); // 读数据
	           hFile.close();
	           res.setContentType("image/*"); // 设置返回的文件类型
	           OutputStream toClient = res.getOutputStream(); // 得到向客户端输出二进制数据的对象
	           toClient.write(data); // 输出数据
	           toClient.close();
	       } catch (IOException e) {// 错误处理
	           PrintWriter toClient = res.getWriter(); // 得到向客户端输出文本的对象
	           res.setContentType("text/html;charset=gb2312");
	           toClient.write("无法打开图片!");
	           toClient.close();
	       }
		
		//File file = new File("D:/java/workspace/WPT/src/main/webapp/uploads/qrcode/16/2015/06/16/","qrcode_2015_06_16_08_47_02_12296.jpg");
		
		
		
		
		return null;
	}
	
	public String show(){
		
		
		Integer  qrcodeId = IntegerUtils.valueOf(getRequest().getParameter("id"));
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("QRCODE_ID", qrcodeId);
		map = weixinQRCodeService.select("WeixinQRCode.WX_QRCODE_MST_SELECT", map);
		request.put("qrCodeMaster", map);
		
		if(!map.isEmpty()){
			String ticket = (String)map.get("TICKET");
			String wxUrl = WeixinQRCodeUtils.showQRCode((String)map.get("TICKET"));
			
			request.put("wxUrl", wxUrl);
		}
		
		return "show";
	}
	
	
	public String create(){
		
		
		String  type = getRequest().getParameter("type");
		
		Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		
		if(shopId == null){
			logger.error("shopId is null ````````````````");
			return "create";
		}
		
		Integer sessionShopId = getBackSessionShopId();
		
		getRequest().getSession().setAttribute(SessionUtils.BACK_SHOP_ID_SESSION ,shopId + "");
		
		String qrcodeType = Constants.QrcodeType.QR_SCENE;
		if("2".equals(type)){
			qrcodeType = Constants.QrcodeType.QR_LIMIT_SCENE;
		}  
		
		String logoRealPath = weixinQRCodeService.getShopLogoRealPath(getRequest(), shopId);
		
		logger.info("logoRealPath===" + logoRealPath);
		Integer qrcodeId = weixinQRCodeService.createQRCode(shopId, qrcodeType, getRequest(),logoRealPath);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("QRCODE_ID", qrcodeId);
		map = weixinQRCodeService.select("WeixinQRCode.WX_QRCODE_MST_SELECT", map);
		request.put("qrCodeMaster", map);
		if(!map.isEmpty()){
			String ticket = (String)map.get("TICKET");
			String wxUrl = WeixinQRCodeUtils.showQRCode((String)map.get("TICKET"));
			
			request.put("wxUrl", wxUrl);
		}
		
		getRequest().getSession().setAttribute(SessionUtils.BACK_SHOP_ID_SESSION ,sessionShopId + "");
		
		return "create";
	}
}
