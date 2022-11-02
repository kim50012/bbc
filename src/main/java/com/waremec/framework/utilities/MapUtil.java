package com.waremec.framework.utilities;

import java.sql.Clob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class MapUtil {

	//private static final String  SEPARATOR 		= "==================================================";
	private static final String  SEPARATOR_START = "======================== Show Map Contents Satrt ==========================";
	private static final String  SEPARATOR_END 	= "======================== Show Map Contents End ============================";
	
	public static void printMap(Map<String,Object> map){
		
		System.out.println(SEPARATOR_START);
		if(map != null && !map.isEmpty()){
			
			int i = 0;
			System.out.print("{");
			Iterator<Entry<String, Object>> iter = map.entrySet().iterator(); 
			while(iter.hasNext()){
				Map.Entry<String, Object>  entry = iter.next();
				if(i++ > 0){
					System.out.print(",");
				}
				
				if(entry.getValue() instanceof Date){
					System.out.print("\"" + entry.getKey() + "\":\"" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(entry.getValue()) + "\"");
				}else{
					System.out.print("\"" + entry.getKey() + "\":\"" + entry.getValue()+ "\"");
				}
			}
			System.out.println("}");
		}else{
			System.out.println("Map is Empty!!");
		}
		System.out.println(SEPARATOR_END);
	}
	public static void printMap2(Map<String,String> map){
		
		System.out.println(SEPARATOR_START);
		if(map != null && !map.isEmpty()){
			
			int i = 0;
			System.out.print("{");
			Iterator<Entry<String, String>> iter = map.entrySet().iterator(); 
			while(iter.hasNext()){
				Map.Entry<String, String>  entry = iter.next();
				if(i++ > 0){
					System.out.print(",");
				}
				
			  System.out.print("\"" + entry.getKey() + "\":\"" + entry.getValue()+ "\"");
				 
			}
			System.out.println("}");
		}else{
			System.out.println("Map is Empty!!");
		}
		System.out.println(SEPARATOR_END);
	}
	
	public static void printOrderedMap(Map<String,Object> map){
		
		System.out.println(SEPARATOR_START);
		if(map != null && !map.isEmpty()){
			 
			System.out.print("{");
			
			List<Map.Entry<String, Object>> infoIds = new ArrayList<Map.Entry<String, Object>>(map.entrySet());

			Collections.sort(infoIds, new Comparator<Map.Entry<String, Object>>() {   
			    public int compare(Map.Entry<String, Object> o1, Map.Entry<String, Object> o2) {      
			        //return (o2.getValue() - o1.getValue()); 
			        return (o1.getKey()).toString().compareTo(o2.getKey());
			    }
			}); 
			
			for (int i = 0; i < infoIds.size(); i++) {
			    String key = infoIds.get(i).toString().split("=")[0];
			    Object value = map.get(key);
			    if(i > 0){
					System.out.print(",");
				}
			    if(value instanceof Date){
					System.out.print("\"" + key + "\":\"" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(value) + "\"");
				}else{
					System.out.print("\"" + key + "\":\"" + value+ "\"");
				}
			}
			
			 
			System.out.println("}");
		}else{
			System.out.println("Map is Empty!!");
		}
		System.out.println(SEPARATOR_END);
	}
	 
	
	public static void convertClob2String(Map<String,Object> map){
		for(Map.Entry<String, Object> entry : map.entrySet()){ 
			Object value = entry.getValue();
			if(value instanceof Clob){
				Clob clob = (Clob) value;
				String val = "";
				try {
					int size = (int) clob.length();
					val = clob.getSubString(1, size);     
					entry.setValue(val);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} 
	}
	
	public static void main(String[] args) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nAME", "jong");
		map.put("age", 17);
		map.put("birthdate", new Date());
		
//		printMap(map);
		
//		convertClob2String(map);
		printOrderedMap(map);
		
	}
}

 
