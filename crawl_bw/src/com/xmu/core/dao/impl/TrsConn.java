/** 
  *TrsConn.java 2009-11-6 xujb
  */
package com.xmu.core.dao.impl;

import org.apache.log4j.Logger;

import com.eprobiti.trs.TRSConnection;
import com.eprobiti.trs.TRSConstant;
import com.xmu.core.util.Constants;

/**
 * @function   
 * @author xujb
 */
public class TrsConn {
	 
		private static Logger logger = Logger.getLogger(TrsConn.class);
		
		//====================索引相关配置======================= 
		
		public static TRSConnection conn = null;
		
		 
		/**
		 * 
		 * @function 单例模式获取trs连接
		 * @Exception 
		 */
	    private static synchronized void syncInit() {
			if(conn==null){
				try{
					conn = new TRSConnection ();
					//参数（服务器 IP, 端口, 用户名, 密码）
					conn.connect (Constants.TrsServer , Constants.TrsPort , Constants.TrsUser , Constants.TrsPassword);
					
					boolean bFlag = false;

					bFlag= TRSConnection.setCharset ( TRSConstant.TCE_CHARSET_GB , true );
					
					if ( bFlag ) logger.error("Trs字符集设置UTF8 ");
					else  logger.error("Trs字符集设置 失败!");
					logger.debug("连接 Trs 成功 "+Constants.TrsServer+" "+Constants.TrsPort+" "+Constants.TrsUser+" "+Constants.TrsPassword);
				}catch(Exception e){
					logger.error("连接失败 "+Constants.TrsServer+" "+Constants.TrsPort+" "+Constants.TrsUser+" "+Constants.TrsPassword,e);
					conn.close();
					conn=null;
				}
			}
	    }

	  
		

		/**
		 * 
		 * @function 获取trs静态连接
		 * @return   TRSConnection 
		 * @Exception
		 */
	    public static TRSConnection getConn() {
			if (conn == null) {
				syncInit();
			}
			return conn;
	    }
	    
	    /**
	     * 
	     * @function 获取一个trs动态连接（ 需要关闭 ）
	     * @return  TRSConnection trs连接
	     * @Exception
	     */
	    public static TRSConnection getNewConn() {
			TRSConnection conn_ = null;
			try{
				conn_ = new TRSConnection ();
				//参数（服务器 IP, 端口, 用户名, 密码）
				conn_.connect (Constants.TrsServer , Constants.TrsPort , Constants.TrsUser , Constants.TrsPassword);
				
				boolean bFlag = false;

				bFlag= TRSConnection.setCharset ( TRSConstant.TCE_CHARSET_GB , true );
				
				if ( bFlag ) logger.debug("Trs字符集设置UTF8 ");
				else  logger.debug("Trs字符集设置 失败!");
				logger.debug("连接 Trs 成功 "+Constants.TrsServer+" "+Constants.TrsPort+" "+Constants.TrsUser+" "+Constants.TrsPassword);
				return conn_;
			}catch(Exception e){
				logger.error("连接 Trs 失败 "+Constants.TrsServer+" "+Constants.TrsPort+" "+Constants.TrsUser+" "+Constants.TrsPassword,e);

				conn_.close();
				conn_=null;
			}
			return null;
			 
		}    
	    /**
	     * 
	     * @function 关闭给定trs连接
	     * @param _conn trs 连接
	     * @Exception
	     */
		public static void closeConn(TRSConnection conn_) {
			try {
				conn_.close();
			} catch (Exception e) {
				logger.error("TRS连接关闭失败！",e);
			}
			conn_ = null;
		}
	    
		/**
		 * 
		 * @function 关闭静态TRS连接 
		 * @Exception
		 */
		public static void closeConn() {
			try {
				conn.close();
			} catch (Exception e) {
				logger.error("TRS连接关闭失败！",e);
			}
			conn = null;
		}

		
		 
}
