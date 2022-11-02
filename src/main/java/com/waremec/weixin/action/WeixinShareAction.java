package com.waremec.weixin.action;

import java.io.BufferedOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.waremec.framework.common.ScopeType;
import com.waremec.framework.utilities.DateUtil;
import com.waremec.framework.utilities.IntegerUtils;
import com.waremec.weixin.domain.AppInfo;
import com.waremec.weixin.domain.TemplateData;
import com.waremec.weixin.domain.WxTemplate;
import com.waremec.weixin.utils.Oauth2Utils;
import com.waremec.weixin.utils.TokenUtils;
import com.waremec.weixin.utils.WeixinUtils;

/** 
* @Package com.waremec.weixin.action 
* @FileName WeixinShareAction
* @Description  
* @author taebem 
* @date 2015年5月7日 下午4:05:32 
*  
*/
@Controller("weixinShareAction")
@Scope(ScopeType.prototype)
public class WeixinShareAction extends WeixinBaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private final transient Log logger = LogFactory.getLog(WeixinShareAction.class);
	 
	
	public String index() throws Exception{
		
		logger.info("中文测试");
		
		List<AppInfo> appInfoList = weixinService.selectAllAppInfoList();
		request.put("appInfoList", appInfoList);
		
		request.put("shopId", getRequest().getParameter("shopId"));
		
		return "index";
	}
	public String test() throws Exception{
		 
 
		return "test"; 
	}
	public String generate() {
		
		String type = getRequest().getParameter("type");
		Integer shopId = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
		Integer menuId = IntegerUtils.valueOf(getRequest().getParameter("menuId"));
		Integer letterId = IntegerUtils.valueOf(getRequest().getParameter("letterId"));
		Integer eventId = IntegerUtils.valueOf(getRequest().getParameter("eventId"));
		String openid = getRequest().getParameter("openid");
		String url = getRequest().getParameter("url");
		Integer ssoId = IntegerUtils.valueOf(getRequest().getParameter("ssoId"));
		
		logger.info("shopId=====" + shopId);
		logger.info("type=======" + type);
		logger.info("menuId=====" + menuId);
		logger.info("letterId===" + letterId);
		logger.info("openid=====" + openid);
		logger.info("url========" + url);
		logger.info("ssoId======" + ssoId);
		
		String weixinUrl = "";
		
		
		try {
			
			AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
			
			switch (type) {
				case "menu":
					
					weixinUrl = Oauth2Utils.getMenuIinkUrlNew(appInfo, menuId);
					break;
				case "letter":
					
					weixinUrl = Oauth2Utils.getLetterLinkUrl(appInfo, letterId, openid);
					break;
				case "share":
					
					weixinUrl = Oauth2Utils.getShareLinkUrl(appInfo, url, openid);
					break;
				case "advice":
					weixinUrl = Oauth2Utils.getAdviceLinkUrl(appInfo, url);
					break;
				case "normal":
					weixinUrl = Oauth2Utils.getNormalLinkUrl(appInfo, url);
					break;
				case "event":
					weixinUrl = Oauth2Utils.getEventShareLinkUrl(appInfo, url, openid, eventId);
					break;
				case "sso":
					weixinUrl = Oauth2Utils.getSSOIinkUrl(appInfo, menuId, ssoId);
					break;
	
				case "sso2":
					weixinUrl = Oauth2Utils.getSSO2IinkUrl(appInfo, url);
					break;
					
				default:
					break;
			}
			
			logger.info("****************** weixin url *********************");
			logger.info(weixinUrl);
			logger.info("****************** weixin url *********************");
			JSONObject o = new JSONObject();
			o.put("success", true);
			o.put("url", weixinUrl);
			renderJSON(o.toString());
		} catch (Exception e) {
			JSONObject o = new JSONObject();
			o.put("success", false);
			o.put("err_msg", e.getMessage());
			renderJSON(o.toString());
		}
		
		return NONE; 
	}
	
	
	/**
     * 发送模板消息
     * appId 公众账号的唯一标识
     * appSecret 公众账号的密钥
     * openId 用户标识
     */
    public String send_message() {
    	String shopid = getRequest().getParameter("shopid");
    	String mbopenid = getRequest().getParameter("openid");
    	String biaoti = getRequest().getParameter("title");
    	String showtime = getRequest().getParameter("showtime");
    	String jiangpinxinxi = getRequest().getParameter("jiangpinxinxi");
    	String mbremark = getRequest().getParameter("remark");
    	
    	/*String appId="wxb06504914e40437c";
    	String appSecret="5852e197890ed082f38fef166e2d5283";*/
    	//System.out.println(appId+"-----------"+appSecret+"------------"+openId);
    	String access_token = TokenUtils.getToken(shopid);
        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+access_token;
        WxTemplate temp = new WxTemplate();
        temp.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxb06504914e40437c&redirect_uri=http%3A%2F%2Fwww.hanzhimeng.com%2Fw%2Ft.htm%3Fk%3DXJIY2YYKITMJQ6FTYPTBIOEWWOXVVWWY%26mid%3D10072&response_type=code&scope=snsapi_base&state=m");
        temp.setTouser(mbopenid);
        temp.setTopcolor("#000000");
        temp.setTemplate_id("xmyi_kjmEWhZBdqDHiGTdoeKBoOd_ZGjHWIEzmSevUU");
        Map<String,TemplateData> m = new HashMap<String,TemplateData>();
        TemplateData first = new TemplateData();
        first.setColor("#000000");  
        first.setValue(biaoti);  
        m.put("first", first);  
        TemplateData keyword1 = new TemplateData();  
        keyword1.setColor("#000000");  
        keyword1.setValue(showtime);  
        m.put("keyword1", keyword1);
        TemplateData keyword2 = new TemplateData();  
        keyword2.setColor("#000000");  
        keyword2.setValue(jiangpinxinxi);  
        m.put("keyword2", keyword2);
        TemplateData remark = new TemplateData();  
        remark.setColor("#000000");  
        remark.setValue(mbremark);  
        m.put("remark", remark);
        temp.setData(m);
        String jsonString = JSONObject.fromObject(temp).toString();
        JSONObject jsonObject = WeixinUtils.httpRequest(url, "POST", jsonString);
        System.out.println(jsonObject);
        int result = 0;
        if (null != jsonObject) {  
             if (0 != jsonObject.getInt("errcode")) {  
                 result = jsonObject.getInt("errcode");
                 logger.error("错误 errcode:{} errmsg:{}");  
             }  
         }
        logger.info("模板消息发送结果："+result);
        
        return NONE;
    }
    public String sendMes(){
    	return "sendMes";
    }
    public String getShareData(){
    	return "getShareData";
    }
    public String getTjData(){
    	try {
    		Integer shopId  = IntegerUtils.valueOf(getRequest().getParameter("shopId"));
    		AppInfo appInfo = weixinService.selectAppInfoByShopId(shopId);
    		String start_date =  StringUtils.trimToNull(getRequest().getParameter("startDate")) ;  
    		String  o_date=start_date;
    		String end_Date =  StringUtils.trimToNull(getRequest().getParameter("endDate")) ;  
    		Calendar calendar = Calendar.getInstance();      
    		Date date1 = DateUtil.parseToDate(start_date,"yyyy-MM-dd");
    		calendar.setTime(date1);
    		calendar.set(Calendar.DAY_OF_WEEK, 4);
    		if(calendar.get(Calendar.DAY_OF_WEEK)<4){calendar.add(Calendar.DATE, -7);};
    		date1 =calendar.getTime();
    		start_date=DateUtil.toString(date1, "yyyy-MM-dd");
    		Date date2 = DateUtil.parseToDate(end_Date,"yyyy-MM-dd");
    		weixinStatisticService.syncShareTotal(appInfo, start_date, start_date);
    		 int days = (int)((date2.getTime() - date1.getTime())/(86400000*7));
    		 if(days>0){
    			 for(int i=0;i<days;i++){
    				 calendar.setTime(date1);calendar.add(Calendar.DATE, 7);
    				date1= calendar.getTime();
    				start_date=DateUtil.toString(date1, "yyyy-MM-dd");
    				 weixinStatisticService.syncShareTotal(appInfo, start_date, start_date);
    				 if(i>5)break;
    			 }
    		 }
    		 doExcel(o_date,end_Date);
    		 
		} catch (Exception e) {
			System.out.println("0------------"+e.getMessage());
			request.put("tjdata", e.getMessage());
			return "error";
		}
    	return NONE;
    }
    
    
	public String doExcel(String  start_date,String end_Date) throws UnsupportedEncodingException {
		String ret = "";
		try {
			Map<String,Object> map=new HashMap<String,Object>();
			if(start_date!=""&& start_date!=null){
				map.put("startDate", start_date);
			};
			if(end_Date!=""&& end_Date != null){
				map.put("endDate", end_Date);
			};
			List<Map<String,Object>> list = commonService.selectList("WeixinStatistic.selectShareTotalCount", map);
				List<String> bt=new ArrayList<String>();
				bt.add("MSGID");						
				bt.add(" TITLE");				
				bt.add("开始日期");		
				bt.add("统计日期");		
				bt.add("总粉丝数");		
				bt.add("阅读人数");			
				bt.add("阅读次数");			
				bt.add("分享的人数");			
				bt.add("分享的次数");		
				bt.add("收藏的人数");			
				bt.add("收藏的次数");
				bt.add("朋友圈阅读人数");
				bt.add("朋友圈阅读次数");
				bt.add("好友转发阅读人数");
				bt.add("好友转发阅读次数");
				
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream os = new BufferedOutputStream(response.getOutputStream());
			response.reset();
			response.setContentType("application/vnd.ms-excel;charset=utf-8");
			response.addHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode("群发消息统计", "UTF-8") + ".xls");
			// 创建工作薄
			WritableWorkbook workbook = Workbook.createWorkbook(os);
			WritableSheet sheet = workbook.createSheet("First Sheet", 0);
			sheet.mergeCells(0, 0, 6, 0);
			// 设置字体种类和黑体显示,字体为Arial,字号大小为10,采用黑体显示
			WritableFont bold = new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD);
			// 生成一个单元格样式控制对象
			WritableCellFormat titleFormate = new WritableCellFormat(bold);
			// 单元格中的内容水平方向居中
			titleFormate.setAlignment(jxl.format.Alignment.LEFT);
			// 单元格的内容垂直方向居中
			titleFormate.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
			// 设置第一行合并单元格的文本
			Label title = new Label(0, 0, "群发消息统计", titleFormate);
			sheet.setRowView(0, 600, false);
			sheet.addCell(title);
			int row = 1;
			int col = 0;
			String[] titles =bt.toArray(new String[bt.size()]);
			for (int i = 0; i < titles.length; i++) {
				// 创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
				sheet.addCell(new Label(col++, row, titles[i]));
			}		
		    row = 2;
		    col = 0;

			for (int i = 0 ; i < list.size(); i++) {
				sheet.setColumnView(row, 15); 
				sheet.addCell(new Label(col++, row, list.get(i).get("MSGID").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("TITLE").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("REF_DATE").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("STAT_DATE").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("TARGET_USER").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("IPRUSER").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("IPRCOUNT").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("SHARE_USER").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("SHARE_COUNT").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("ATFUSER").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("ATFCOUNT").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("IFEEDUSER").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("IFEEDCOUNT").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("IFRIENDSUSER").toString(), titleFormate));
				sheet.addCell(new Label(col++, row, list.get(i).get("IFRIENDSCOUNT").toString(), titleFormate));
				row++;
				col = 0;
			}
			// 把创建的内容写入到输出流中，并关闭输出流
			workbook.write();
			workbook.close();
			os.close();

		} catch (Exception e) {
			e.printStackTrace();
			ret = "fail";
		}
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("result", ret);
		renderJSON(returnMap);
		return NONE;
	}
	
    
    
    
    
    
}
