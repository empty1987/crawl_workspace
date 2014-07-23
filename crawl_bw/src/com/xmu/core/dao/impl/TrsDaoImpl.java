/** 
  *TrsDao.java 2009-11-6 xujb
  */
package com.xmu.core.dao.impl;

import org.apache.log4j.Logger;

import com.eprobiti.trs.TRSConnection;
import com.eprobiti.trs.TRSConstant;
import com.eprobiti.trs.TRSException;
import com.eprobiti.trs.TRSResultSet;
import com.xmu.core.dao.TrsDao;

/**
 * @function   
 * @author xujb
 */
public class TrsDaoImpl implements TrsDao{
	
	private static Logger logger = Logger.getLogger(TrsDaoImpl.class);
	


	/**
	 * 
	 * @function 获得Trs连接 不带参数返回静态连接，带参数返回动态连接，动态连接需要手动关闭连接
	 * @param flag 
	 * @return TRSConnection trs连接
	 * @Exception
	 */
	public TRSConnection getTrsConn(int ...flag) {
		
		if(flag != null && flag.length > 0)return TrsConn.getNewConn();
		else return TrsConn.getConn();
	}
	
	/**
	 * @function 关闭trs结果集和连接
	 * @param TRSConnection 需要关闭的trs连接
     * @param TRSResultSet  需要关闭的trs结果集
	 */
	public void close(TRSConnection trsconn, TRSResultSet trsrs) {
		 
		try {
		    if (trsrs != null) {
		    	trsrs.close();
		    }      
			if (trsconn != null) {
				trsconn.close();
		    }      
		  } catch (Exception e) {
		    logger.error("trs关闭结果集及连接时发生错误！",e);
		  }
		  trsrs = null;
		  trsconn = null;
	}
	/**
	 * @function 关闭trs结果集和连接 
     * @param TRSResultSet  需要关闭的trs结果集
	 */
	public void close(TRSResultSet trsrs) {
		 
		try {
		    if (trsrs != null) {
		    	trsrs.close();
		    }     
		  } catch (Exception e) {
		    logger.error("trs关闭结果集及连接时发生错误！",e);
		  }
		  trsrs = null;
		  
	}
	 
	
	/**
	 * 
	 * @function 执行查询返回结果集
	 * @param trsconn trs连接
	 * @param strSources 表名
	 * @param strWhere 查询语句
	 * @param strSortMethod 排序字段（+-符号在内）
	 * @param defaultcolumn  默认检索字段
	 * @return TRSResultSet 检索结果集
	 * @Exception
	 */
	public TRSResultSet executeSelect(TRSConnection trsconn, String strSources, String strWhere, String strSortMethod, String defaultcolumn) throws TRSException {
		
		try{ 
		TRSResultSet trsRs = new TRSResultSet(trsconn);
		logger.debug("Trs执行检索，检索参数为：表名="+strSources+"，查询语句="+strWhere+"，排序字段="+strSortMethod+"，默认检索字段="+defaultcolumn);
		trsRs.executeSelect(strSources, strWhere, strSortMethod, "", defaultcolumn, 0, TRSConstant.TCE_OFFSET, false);
		return trsRs;
		}catch(Exception e){
			logger.error("Trs执行搜索失败，系统默认返回null，检索参数为：表名="+strSources+"，查询语句="+strWhere+"，排序字段="+strSortMethod+"，默认检索字段="+defaultcolumn,e);
		}
		return null;
	}
 
}
