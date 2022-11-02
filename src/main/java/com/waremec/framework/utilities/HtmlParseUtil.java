/**   
* @Title: HtmlParseUtil.java 
* @Package com.waremec.framework.utilities 
* @Description:  
* @author taebem
* @date 2015年6月24日 上午11:49:07 
* @version V1.0   
*/
package com.waremec.framework.utilities;

import java.text.NumberFormat;

/** 
 * @Package com.waremec.framework.utilities 
 * @FileName HtmlParseUtil
 * @Description  
 * @author taebem 
 * @date 2015年6月24日 上午11:49:07 
 *  
 */
public class HtmlParseUtil {
    
    /**
     * encoding String to Byte and the interception of the String
     * 
     * @param str
     *            src String
     * @param num
     *            length
     * @param encoding
     * @return
     */
    public static final String strFixByte(String str, int num, String encoding) {
        
        if (str == null)
            return "";
        String tmp = str;
        int slen = 0, blen = 0;
        char c;
        try {
            if (tmp.getBytes(encoding).length > num) {
                while (blen + 1 < num) {
                    c = tmp.charAt(slen);
                    blen++;
                    slen++;
                    if (c > 127)
                        blen++; // 2-byte character..
                }
                tmp = tmp.substring(0, slen) + "..";
            }
        }
        catch (java.io.UnsupportedEncodingException e) {
            return "";
        }
        return tmp;
    }
    
    /**
     * hlml Parse
     * 
     * @param s
     * @param textLength
     * @return
     */
    public static String htmlParse(String s, int textLength) {
        return htmlParse(s, 1000, textLength, "utf-8");
    }
    
    /**
     * hlml Parse
     * 
     * @param s
     * @param size
     * @param textLength
     * @return
     */
    public static String htmlParse(String s, int size, int textLength, String encoding) {
        
        if (s == null)
            return null;
        StringBuffer buffer = new StringBuffer();
        
        if (size > 4000)
            size = 4000;
        
        if (s.length() > size)
            s = strFixByte(s, size, encoding);
        
        char[] c = s.toCharArray();
        int len = c.length;
        boolean inTag = false;
        int textSize = 0;
        for (int i = 0; i < len; i++) {
            if (!inTag) {
                if (c[i] == '<')
                    inTag = true;
                else if (c[i] != '	' && c[i] != ' ') {
                    buffer.append(c[i]);
                    textSize++;
                }
            }
            else {
                if (c[i] == '>')
                    inTag = false;
            }
            if (textLength > 0 && textSize == textLength)
                break;
        }
        return buffer.toString();
    }
    
    /**
     * test method
     * 
     * @param args
     */
    public static void main(String args[]) {
        
        String test = "<font color=red>16,768,585,123,123,123,333</font>";
        
        String parse = htmlParse(test, -1);
        
        System.out.println(parse);
        
        float numData = 0;
        
        java.text.NumberFormat nf = NumberFormat.getInstance();
        
        try {
            Number numObj = nf.parse(parse);
            
            numData = numObj.floatValue();
            
        }
        catch (Exception e) {
            e.printStackTrace();
            numData = -1;
        }
        System.out.println(numData);
        
        System.out.println("end");
        
    }
    
}
