package com.waremec.framework.common;

public interface ScopeType {
	String singleton = "singleton";//在spring IOC容器中仅存在一个Bean实例,Bean以单实例的方式存在.
	String prototype = "prototype";//每次从容器中调用Bean时,都返回一个新的实例,即每次调用getBean()时,相当于执行new XxxBean()的操作.
	String request = "request";//  每次HTTP请求都会创建一个新的Bean,该作用域仅适用于webApplicationContext环境.
	String session = "session";// 同一个HTTP session共享一个Bean,不同HTTP session使用不同的Bean,该作用域仅适用于webApplicationContext环境.
	String globalSession = "globalSession";//同一个全局session共享一个Bean,一般用于portlet应用环境,该作用域仅适用于webApplicationContext环境.

}
