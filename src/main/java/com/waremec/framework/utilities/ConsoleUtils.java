package com.waremec.framework.utilities;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ConsoleUtils {
	
	 
	public static void output(String str) {

		 String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());
		 
		 System.out.println(date + " //:> " + str);
	}

}
