package com.waremec.weixin.utils;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtils {

	public static void main(String[] args) {
//		System.out.println(System.currentTimeMillis());
//		System.out.println(secondsToDate(1426141901l));
//		System.out.println(secondsToDate(1426141901));
		
		GregorianCalendar gc=new GregorianCalendar(); 
		gc.setTime(new Date()); 
		gc.add(Calendar.DATE,-2); 
		Date dayBeforeYesterday = gc.getTime();
		System.out.println(dayBeforeYesterday);
		
		
	}
	
	
	public static Date secondsToDate(long seconds){
		Date date = new Date();
		try {
			date.setTime(seconds * 1000 );
			
		} catch (Exception e) {
			date = null;
		}
		return date;
	}
	public static Date secondsToDate(int seconds){
		Date date = new Date();
		try {
			date.setTime(seconds * 1000l );
			
		} catch (Exception e) {
			date = null;
		}
		return date;
	}
}
