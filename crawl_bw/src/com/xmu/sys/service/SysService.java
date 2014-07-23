package com.xmu.sys.service;

import javax.servlet.http.HttpServletRequest;

import com.xmu.core.service.BaseService;
import com.xmu.sys.pojo.SysUsers;

/**
 * 
 * @author Administrator
 * @function 用户及登录操作接口类
 */
public interface SysService extends BaseService {
	
	
	/**
	 * 
	 * @function 登录验证
	 * @param request 
	 * @param sysUsers 用户实体类
	 * @return String  返回是否登录成功与错误提示
	 */ 
	String login(HttpServletRequest request, SysUsers sysUsers);
	public SysUsers getUserById(Long id);
 
}
