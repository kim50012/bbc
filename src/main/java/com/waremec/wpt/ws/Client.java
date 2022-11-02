/**   
* @Title: Client.java 
* @Package com.waremec.wpt.ws 
* @Description:  
* @author taebem
* @date 2015年10月22日 上午11:49:25 
* @version V1.0   
*/
package com.waremec.wpt.ws;

import java.rmi.RemoteException;

/** 
 * @Package com.waremec.wpt.ws 
 * @FileName Client
 * @Description  
 * @author taebem 
 * @date 2015年10月22日 上午11:49:25 
 *  
 */
public class Client {

	/** 
	 *
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServiceProxy proxy = new ServiceProxy();
		try {
			String returns = proxy.accountVerify("xxxxxxxxxxxxxx");
			System.out.println(returns);
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}

}
