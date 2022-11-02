/**   
* @Title: StopWatch.java 
* @Package com.waremec.framework.utilities 
* @Description:  
* @author taebem
* @date 2015年6月24日 上午11:48:34 
* @version V1.0   
*/
package com.waremec.framework.utilities;

/** 
 * @Package com.waremec.framework.utilities 
 * @FileName StopWatch
 * @Description  
 * @author taebem 
 * @date 2015年6月24日 上午11:48:34 
 *  
 */
public class StopWatch {
    
    long start   = 0;
    long current = 0;
    
    /**
     * StopWatch constructor comment.
     */
    public StopWatch() {
        reset();
    }
    
    /**
     * @return long
     */
    public long getElapsed() {
        long now = System.currentTimeMillis();
        long elapsed = (now - current);
        current = now;
        return elapsed;
    }
    
    /**
     * @return long
     */
    public long getTotalElapsed() {
        current = System.currentTimeMillis();
        return (current - start);
    }
    
    /**
     * 
     */
    public void reset() {
        start = System.currentTimeMillis();
        current = start;
    }
}
