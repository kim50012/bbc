package com.waremec.framework.dao.handler;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

public class YNBooleanTypeHandler implements TypeHandlerCallback {

     static final String TRUE = "Y";
    
     static final String FALSE = "N";

    @Override
    public void setParameter(ParameterSetter setter, Object parameter) throws SQLException {
        if (parameter == null) {
            setter.setString(FALSE);
            return;
        }

        final Boolean bool = (Boolean) parameter;

        if (bool.booleanValue()) {
            setter.setString(TRUE);
        }
        else {
            setter.setString(FALSE);
        }
    }

    @Override
    public Object getResult(ResultGetter getter) throws SQLException {
        final String dbValue = trim(getter.getString());
        final Object result = valueOf(dbValue);

        return result;
    }

    @Override
    public Object valueOf(String s) {
        if (s == null) {
            return Boolean.FALSE;
        }

        final String value = trim(s);

        if (TRUE.equals(value)) {
            return Boolean.TRUE;
        }

        return Boolean.FALSE;
    }

    static String trim(String string) {
        //return (string == null) ? null : string.trim(); pmd-inseok.kang@samsung.com
    	
    	if(string == null){
    		return null;
    	}
    	return string.trim();
    }
}