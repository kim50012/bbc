/**    
 * <b>文件名：</b>JsonDateValueProcessor.java <br/> 
 * <b>包名：</b>com.dicc.common.util <br/> 
 * <b>描述：</b> <br/> 
 * <b>日期：</b>2011-12-20下午01:42:55  <br/> 
 *  
 * @Copyright (c) 2011 by OpenTide
 *    
 */
package com.waremec.wxi.utilities;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**    
 *     
 * <b>类名称：</b>JsonDateValueProcessor <br/>
 * <b>类描述： </b>json处理Date类型
 *
 * @Create:   	2011-12-20下午01:42:55 
 * @version     1.0 
 *
 */
public class JsonDateValueProcessor
        implements JsonValueProcessor {
    
    /**
     * datePattern
     */
    private String datePattern = "yyyy-MM-dd HH:mm:ss";

    /**
     * JsonDateValueProcessor
     */
    public JsonDateValueProcessor() {
        super();
    }

    /**
     * @param format
     */
    public JsonDateValueProcessor(String format) {
        super();
        this.datePattern = format;
    }

    /**
     * @param value
     * @param jsonConfig
     * @return Object
     */
    public Object processArrayValue(Object value, JsonConfig jsonConfig) {
        return process(value);
    }

    /**
     * @param key
     * @param value
     * @param jsonConfig
     * @return Object
     */
    public Object processObjectValue(String key, Object value,
            JsonConfig jsonConfig) {
        return process(value);
    }

    /**
     * process
     * @param value
     * @return
     */
    private Object process(Object value) {
        try {
            if (value instanceof Date) {
                SimpleDateFormat sdf = new SimpleDateFormat(datePattern,
                        Locale.SIMPLIFIED_CHINESE);
                return sdf.format((Date) value);
            }
            return value == null ? "" : value.toString();
        } catch (Exception e) {
            return "";
        }

    }

    /**
     * @return the datePattern
     */
    public String getDatePattern() {
        return datePattern;
    }

    /**
     * @param pDatePattern the datePattern to set
     */
    public void setDatePattern(String pDatePattern) {
        datePattern = pDatePattern;
    } 
}
