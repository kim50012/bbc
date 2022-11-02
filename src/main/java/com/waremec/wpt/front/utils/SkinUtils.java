package com.waremec.wpt.front.utils;

public class SkinUtils {

	public static String getReturnUrl(int skinType,String urlPerfix){
		
		String returnUrl = urlPerfix;
		
		if (skinType == 3 || skinType == 4) {		//skin type 3 or 4
			returnUrl += "2";
		}else if (skinType == 5 || skinType == 6) {		//skin type 5 or 6
			returnUrl += "3";
		}else if (skinType == 7 || skinType == 8) {		//skin type 7 or 8
			returnUrl += "4";
		} 		
		
		return returnUrl;
	}
}
