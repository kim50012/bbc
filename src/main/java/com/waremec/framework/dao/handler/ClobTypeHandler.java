package com.waremec.framework.dao.handler;

import java.sql.SQLException;



import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

public class ClobTypeHandler implements TypeHandlerCallback {

	@Override
	public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getResult(ResultGetter getter) throws SQLException {
		// TODO Auto-generated method stub
		/*CLOB blob = (CLOB) getter.getClob();*/
		System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		/*if(blob == null || blob.length() == 0){
			return "";
		}else{
			return blob.stringValue();
		}*/
		return "";
	}

	@Override
	public Object valueOf(String s) {
		// TODO Auto-generated method stub
		return null;
	}

}
