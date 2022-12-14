/**   
* @Title: StatisticIFRequestParamsException.java 
* @Package com.waremec.weixin.exception 
* @Description:  
* @author taebem
* @date 2015年6月25日 下午4:59:43 
* @version V1.0   
*/
package com.waremec.weixin.exception;

/** 
 * @Package com.waremec.weixin.exception 
 * @FileName StatisticIFRequestParamsException
 * @Description  
 * @author taebem 
 * @date 2015年6月25日 下午4:59:43 
 *  
 */
public class StatisticIFRequestParamsException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	private Integer range ;
	private Integer type = 1;
	
	public static final int  DateRangeError 				= 1;
	public static final int  DateFormatError 				= 2;
	public static final int  EndDateMaximumValueError 		= 3;
	public static final int  StartDateGreaterEndDateError 	= 4;
	
	public StatisticIFRequestParamsException(Integer range) {
		this.range = range;
	}
	public StatisticIFRequestParamsException(Integer range, Integer Type) {
		this.range = range;
		this.type = type;
	}

	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		String message = "" ;
		
		switch (type) {
		case DateRangeError:
			message = "日期范围超过最大时间跨度（" + range + "）天!" ;
			break;
		case DateFormatError:
			message = "日期格式错误,正确格式为YYYY-MM-DD!" ;
			break;
		case EndDateMaximumValueError:
			message = "结束日期允许设置的最大值为昨日!" ;
			break;
		case StartDateGreaterEndDateError:
			message = "起始日期不能大于结束日期!" ;
			break;
		default:
			break;
		}
		
		return message;
	}
}
