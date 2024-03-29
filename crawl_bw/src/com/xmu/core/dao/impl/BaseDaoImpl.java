package com.xmu.core.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.xmu.core.dao.BaseDao;

/** 
 *Copyright(C):	
 *@n
 *@n File:		  BaseDaoImpl.java
 *@n Function:		
 *@n Author:		xjb整合	 2009-7-9
 */

public class BaseDaoImpl extends SqlMapClientDaoSupport implements BaseDao {
	
	 
	public SqlMapClientTemplate getTemplete(){
		
		return super.getSqlMapClientTemplate();
	}
	 

 
	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和对象插入数据库
     *<br> 入口参数：param sqlName sql方法名称
     *             param obj 对象
     *<br> 返    回：Object 对象
     *<br> ************************************************************************
     */
	public Object saveObject(String sqlName, Object obj) {
		return getSqlMapClientTemplate().insert(sqlName, obj);
	}
	
	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和对象修改数据库
     *<br> 入口参数：param sqlName sql方法名称
     *             param obj 对象
     *<br> 返    回： 
     *<br> ************************************************************************
     */
	public void updateObject(String sqlName, Object obj) {
		getSqlMapClientTemplate().update(sqlName, obj);
	}
	
	/**
     *<br> ************************************************************************
     *<br> 功    能：将批量数据插入数据库中
     *<br> 入口参数：param sqlName 执行插入的sql方法名称
     *             param list 对象
     *<br> 返    回： void
     *<br> ************************************************************************
     */
	public void insertList(String sqlName, List list) throws DataAccessException {
         
		 
		 for (int i = 0, n = list.size(); i < n; i++) {
			 getSqlMapClientTemplate().insert(sqlName, list.get(i));
         }
	}
	
	/**
     *<br> ************************************************************************
     *<br> 功    能：将批量数据更新到数据库中
     *<br> 入口参数：param sqlName 执行插入的sql方法名称
     *             param list 对象
     *<br> 返    回： void
     *<br> ************************************************************************
     */
	public void updateList(String sqlName, List list) throws DataAccessException {
		 for (int i = 0, n = list.size(); i < n; i++) {
			 getSqlMapClientTemplate().update(sqlName, list.get(i));
         }
	}
	
	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和对象id
     *<br> 入口参数：param sqlName sql方法名称
     *             param id id对象
     *<br> 返    回： void
     *<br> ************************************************************************
     */
	public void removeObject(String sqlName, Object id) {
		getSqlMapClientTemplate().delete(sqlName, id);
	}

	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和对象id
     *<br> 入口参数：param sqlName sql方法名称
     *             param ids ids对象数组
     *<br> 返    回： void
     *<br> ************************************************************************
     */
	public void removeObjects(String sqlName, Object[] ids) {
		for (int i = 0; i < ids.length; i++) {
			Object id = ids[i];
			getSqlMapClientTemplate().delete(sqlName, id);
		}
	}
	
	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和条件参数（HashMap）取回查询结果列表
     *<br> 入口参数：param sqlName sql方法名称
     *             param hm 条件参数的值
     *<br> 返    回： List 列表
     *<br> ************************************************************************
     */
	public List getList(String sqlName, HashMap hm) {
		return getSqlMapClientTemplate().queryForList(sqlName, hm);
	}

	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和主键值，取回查询结果列表
     *<br> 入口参数：param sqlName sql方法名称
     *             param obj 主键的值
     *<br> 返    回： List 列表
     *<br> ************************************************************************
     */
	public List getList(String sqlName, Object obj) {
		return getSqlMapClientTemplate().queryForList(sqlName, obj);
	}

	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称取回查询结果列表
     *<br> 入口参数：param sqlName sql方法名称 
     *<br> 返    回： List 列表
     *<br> ************************************************************************
     */
	public List getList(String sqlName) {
		return getSqlMapClientTemplate().queryForList(sqlName);
	}
	
	/**
     *<br> ************************************************************************
     *<br> 功    能：获取HASHMAP
     *<br> 入口参数：param sqlName sql方法名称 
     *			   param obj 参数列表
     *			   param keyFiled 主键
     *			   param valueField 值
     *<br> 返    回： Map
     *<br> ************************************************************************
     */
	public Map getMap(String sqlName,Object obj,String keyFiled,String valueField) {
		return getSqlMapClientTemplate().queryForMap(sqlName, obj, keyFiled, valueField);
	}

	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和条件参数（HashMap）取回查询结果对象
     *<br> 入口参数：param sqlName sql方法名称
     *             param hm 条件参数的值
     *<br> 返    回： 实体对象
     *<br> ************************************************************************
     */
	public Object getObject(String sqlName, HashMap hm) {
		return getSqlMapClientTemplate().queryForObject(sqlName,hm);
	}

	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称和主键值，取回查询结果对象
     *<br> 入口参数：param sqlName sql方法名称
     *             param obj 主键的值
     *<br> 返    回： 实体对象
     *<br> ************************************************************************
     */
	public Object getObject(String sqlName, Object obj) {
		return getSqlMapClientTemplate().queryForObject(sqlName,obj);
	}

	/**
     *<br> ************************************************************************
     *<br> 功    能：根据sql方法名称，取回查询结果对象
     *<br> 入口参数：param sqlName sql方法名称 
     *<br> 返    回： 实体对象
     *<br> ************************************************************************
     */
	public Object getObject(String sqlName) {
		return getSqlMapClientTemplate().queryForObject(sqlName);
	}

	
	  
	
	

	

	

}
