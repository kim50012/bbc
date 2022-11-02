package com.waremec.framework.dao.handler;

import java.sql.SQLException;
import java.sql.Types;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

public abstract class EnumTypeHandler<E extends Enum<E>> implements TypeHandlerCallback 
{
	final private Class<E> enumClass;
	
	public EnumTypeHandler(Class<E> enumClass){
		this.enumClass = enumClass;
	}
	
	public Object getResult(ResultGetter getter) throws SQLException {
		String result = getter.getString();
		if (getter.wasNull()) {
			return null;
		}
		return valueOf(result);
	}
	
	@SuppressWarnings("unchecked")
	public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
		if (parameter == null) {
			setter.setNull(Types.VARCHAR);
		} else {
			setter.setString(((E)parameter).name());
		}
	}
	
	public Object valueOf(String s) {
		return Enum.valueOf(enumClass, s.toUpperCase());
	}
}