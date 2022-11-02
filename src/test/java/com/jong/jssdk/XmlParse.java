package com.jong.jssdk;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.mapper.MapperWrapper;

public class XmlParse {

	public XmlParse() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		String xml = "<xml>"
				+ "<appid><![CDATA[wxf4ff15142f410758]]></appid>"
				+ "<attach><![CDATA[key=8D6ED58C805242C8BDB129616163CB04]]></attach>"
				+ "<bank_type><![CDATA[ICBC_CREDIT]]></bank_type>"
				+ "<cash_fee><![CDATA[1]]></cash_fee>"
				+ "<fee_type><![CDATA[CNY]]></fee_type>"
				+ "<is_subscribe><![CDATA[Y]]></is_subscribe>"
				+ "<key><![CDATA[8D6ED58C805242C8BDB129616163CB04]]></key>"
				+ "<mch_id><![CDATA[1225226202]]></mch_id>"
				+ "<nonce_str><![CDATA[gCn7KAxRR0MbbERsXamlLkXWRDfYByiK]]></nonce_str>"
				+ "<openid><![CDATA[o1yuEtw1PN5sc6W6Bxd7Q4hty2hY]]></openid>"
				+ "<out_trade_no><![CDATA[1423827425085waremec]]></out_trade_no>"
				+ "<result_code><![CDATA[SUCCESS]]></result_code>"
				+ "<return_code><![CDATA[SUCCESS]]></return_code>"
				+ "<sign><![CDATA[17FA7F84002F9ED9B5821BC50A31E29B]]></sign>"
				+ "<sysid><![CDATA[8D6ED58C805242C8BDB129616163CB04]]></sysid>"
				+ "<time_end><![CDATA[20150213193719]]></time_end>"
				+ "<total_fee>1</total_fee>"
				+ "<trade_type><![CDATA[JSAPI]]></trade_type>"
				+ "<transaction_id><![CDATA[1008960276201502130016694933]]></transaction_id>"
				+ "</xml>";
		
		
		XStream xstream3 = new XStream(new DomDriver()){
			protected MapperWrapper wrapMapper(MapperWrapper next) {
				return new MapperWrapper(next) {
					public boolean shouldSerializeMember(Class definedIn, String fieldName) {
						return definedIn != Object.class ? super.shouldSerializeMember(definedIn, fieldName) : false;
					}
				};
			}
		};  
    	xstream3.alias("xml", Obj1.class);  
    	Obj1 obj = (Obj1)xstream3.fromXML(xml);
    	System.out.println(obj);

	}

}
