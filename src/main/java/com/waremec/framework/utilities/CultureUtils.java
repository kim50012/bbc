package com.waremec.framework.utilities;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.util.LocalizedTextUtil;
import com.waremec.wpt.domain.EnumerateDomain;

public class CultureUtils {
	public static final String CULTURE_COOKIE_NAME = "CK_CurrentLanguage";
	public static final String CULTURE_SCREEN_UI_KEY = "CULTURE_SCREEN_UI_KEY";
	private static final String[] AvailableCultures = { "zh-CN", "ko-KR", "en-US" };

	public static final String[] months_zhCN = { "1月", "2月","3月","4月","5月","6月", "7月","8月","9月","10月","11月","12月" };
	public static final String[] months_koKR = { "1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월" };
	public static final String[] months_enUS = { "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" };

	// public static String getCurrentUICulture() {
	// return CookieUtils.getCookieValue(CULTURE_COOKIE_NAME);
	// }

	private static boolean isAvailableCultures(String cultureInfo) {
		boolean returns = false;
		for (String item : AvailableCultures) {
			if (item.equalsIgnoreCase(cultureInfo)) {
				returns = true;
				break;
			}
		}
		return returns;
	}

	private static String getAvailableCultures(String cultureInfo) {
		String returns = "zh-CN";
		for (String item : AvailableCultures) {
			if (item.equalsIgnoreCase(cultureInfo)) {
				returns = item;
				break;
			}
		}
		return returns;
	}

	public static String getCurrentUICulture() {
//		String cultureInfo = CookieUtils.getCookieValue(CULTURE_COOKIE_NAME);
//		if (StringUtils.IsNullOrEmpty(cultureInfo)) {
//			cultureInfo = getBrowserCulture();
//		}
//
//		String requestLanguage = RequestUtils.getRequestLanguage();
//		if (isAvailableCultures(requestLanguage)) {
//			cultureInfo = requestLanguage;
//		}
//
//		if (!isAvailableCultures(cultureInfo)) {
//			cultureInfo = "zh-CN";
//		}
//		cultureInfo = getAvailableCultures(cultureInfo);
//		CookieUtils.setCookieValue(CULTURE_COOKIE_NAME, cultureInfo, 7 * 24,
//				DateType.ByHour);
		
		String cultureInfo = "";
		return cultureInfo;
	}

	/**
	 * 获取浏览器的语言设置
	 * 
	 * @return
	 */
	public static String getBrowserCulture() {
		String returns = "zh-CN";
//		try {
//			HttpServletRequest request = ServletActionContext.getRequest();
//			returns = request.getLocale().toString();
//		} catch (Exception e) {
//			returns = "zh-CN";
//		}
//
//		if (StringUtils.IsNullOrEmpty(returns)) {
//			returns = "zh-CN";
//		}
		return returns.replaceAll("_", "-");
	}

	@SuppressWarnings("unchecked")
	public static String GetResource(String item, HttpServletRequest request) {
		String returns = item;

//		List<EnumerateDomain> screenItems = (List<EnumerateDomain>) request
//				.getAttribute(CULTURE_SCREEN_UI_KEY);
//		if (screenItems != null && screenItems.size() > 0) {
//			for (EnumerateDomain screenItem : screenItems) {
//				if (item.equalsIgnoreCase(screenItem.getCode())) {
//					returns = StringUtils.IsNullOrEmpty(screenItem.getName()) ? item
//							: screenItem.getName();
//					break;
//				}
//			}
//		}
		return returns;
	}
	
	public static String GetResource(String item) {
		Locale locale = new Locale(getCurrentUICulture());
		return LocalizedTextUtil.findDefaultText(item, locale);
	}
	
	public static String getMonthName(int month){
		if (month < 1 || month > 12){
			return "";
		}
		String[] months;
		if ("en-US".equalsIgnoreCase(getCurrentUICulture())){
			months = months_enUS;
		} else if ("ko-KR".equalsIgnoreCase(getCurrentUICulture())){
			months = months_koKR;
		} else {
			months = months_zhCN;
		}
		return months[month - 1];
	}

	/*
	 * public static string GetUploadUIResource(string item) { string page =
	 * HttpContext.Current.Server.MapPath(AppSettingUtils.UploadUIResourcePage);
	 * return GetResource(item, page); }
	 * 
	 * public static string GetViewResource(string item) { string returns =
	 * item; try { string page =
	 * HttpContext.Current.Request.RawUrl.Split('?')[0]; page =
	 * HttpContext.Current.Server.MapPath(string.Format("/Views/{0}.xml",
	 * page)); returns = GetResource(item, page); } catch { } return returns; }
	 * public static string GetViewResource(string item, object view) { string
	 * returns = item; try { WebViewPage viewPage = view as WebViewPage; string
	 * page = viewPage.VirtualPath; page = string.Format("{0}.xml",
	 * HttpContext.Current.Server.MapPath(page)); returns = GetResource(item,
	 * page); } catch { } return returns; } private static string
	 * GetResource(string item, string resource) { string returnValue = item;
	 * try { XmlDocument xUserLanguagesDoc = new XmlDocument();
	 * xUserLanguagesDoc.LoadXml(File.ReadAllText(resource));
	 * 
	 * XmlNode x =
	 * xUserLanguagesDoc.DocumentElement.SelectSingleNode(string.Format
	 * ("//root/label[@value='{0}']", item)); if (x != null) { foreach (XmlNode
	 * xmlNode in x.ChildNodes) { if (CurrentUICulture.Equals(xmlNode.Name,
	 * StringComparison.OrdinalIgnoreCase)) { returnValue =
	 * XmlUtils.GetXmlAttributeValue(xmlNode); } } } } catch// (Exception ex) {
	 * //returnValue = ex.Message; returnValue = item; } return returnValue ==
	 * "" ? item : returnValue; }
	 */
}
