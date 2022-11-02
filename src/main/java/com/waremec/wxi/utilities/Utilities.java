package com.waremec.wxi.utilities;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

public class Utilities {
	

	public static BigDecimal toDecimal(String value) {
		BigDecimal _return = BigDecimal.valueOf(0);
		try {
			_return = BigDecimal.valueOf(toDouble(value));
		} catch (Exception e) {
			_return = BigDecimal.valueOf(0);
		}
		return _return;
	}

	public static float toFloat(String value) {
		float _return = 0;
		try {
			_return = Float.parseFloat(value);
		} catch (Exception e) {
			_return = 0;
		}
		return _return;
	}

	public static double toDouble(String value) {
		double _return = 0;
		try {
			_return = Double.parseDouble(value);
		} catch (Exception e) {
			_return = 0;
		}
		return _return;
	}

	public static boolean toBoolean(String value) {
		boolean _return = false;
		try {
			_return = Boolean.parseBoolean(value);
		} catch (Exception e) {
			_return = false;
		}
		return _return;
	}

	public static int toInt(String value) {
		int _return = 0;
		try {
			_return = Integer.parseInt(value);
		} catch (Exception e) {
			_return = 0;
		}
		return _return;
	}

	public static long toLong(String value) {
		long _return = 0;
		try {
			_return = Long.parseLong(value);
		} catch (Exception e) {
			_return = 0;
		}
		return _return;
	}

	public static String toString(Object value) {
		return isNoE(value) ? "" : String.valueOf(value);
	}

	public static boolean isNoE(Object value) {
		return !(value != null && !"".equals(value));
	}

	@SuppressWarnings("rawtypes")
	public static String toJSONString(List list) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor());
		return JSONArray.fromObject(list, jsonConfig).toString();
	}

	public static String toJSONString(Object object) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class,
				new JsonDateValueProcessor());
		return JSONObject.fromObject(object, jsonConfig).toString();
	}

	public static String toJSONString(String key, Object object) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put(key, object);
		return jsonObject.toString();
	}

	public static JSONObject toJsonObject(String value) {
		JSONObject JSON = (JSONObject) JSONSerializer.toJSON(value);
		return JSON;
	}

	public static String getBasePath(HttpServletRequest request) {
		int serverPort = request.getServerPort();
		String basePath = "";
		if (80 == serverPort) {
			basePath = request.getScheme().concat("://")
					.concat(request.getServerName());
		}else{
			basePath = request.getScheme().concat("://")
					.concat(request.getServerName()).concat(":")
					.concat(toString(serverPort));
		}
		return basePath;
	}

}
