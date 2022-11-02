package com.waremec.framework.dao.handler;

import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

/**
 * Timestamp를 처리하기 위한 TypeHandler 클래스
 * Timestamp를 사용할 경우 INDEX 처리가 되지 않아 
 * Parameter Setting을 별도 처리함.
 * 
 * @author
 *
 */
public class DateTypeHandler implements TypeHandlerCallback {

    @Override
    public Object getResult(ResultGetter getter) throws SQLException {
        final Object obj = getter.getTimestamp();
        return obj != null ? (Date) obj : null;
    }

    @Override
    public void setParameter(ParameterSetter setter, Object value) throws SQLException {
    	// Setting되는 값을 체크
    	if(value != null){
       	    setter.setDate(new java.sql.Date(((Date) value).getTime()));
            setter.setTime(new Time(((Date) value).getTime()));
    	}
    	else{
    		setter.setDate(null);
    		setter.setTime(null);
    	}
    }

    @Override
    public Object valueOf(String datetime) {
    	return Timestamp.valueOf(datetime);
    }
}