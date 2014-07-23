/** 
 *SysServiceImpl.java 2009-11-25 xujb
 */
package com.xmu.sys.service.impl;

import javax.servlet.http.HttpServletRequest;

import com.xmu.core.service.impl.BaseServiceImpl;
import com.xmu.core.util.Constants;
import com.xmu.sys.pojo.SysLogs;
import com.xmu.sys.pojo.SysUsers;
import com.xmu.sys.pojo.UserSession;
import com.xmu.sys.service.SysService;

/**
 * @function
 * @author xujb
 */
public class SysServiceImpl extends BaseServiceImpl implements SysService {

	public String login(HttpServletRequest request, SysUsers sysUsers) {
		//获取用户
		SysUsers loginUsers = (SysUsers) getObject("SysUsers.getLoginUser" , sysUsers);
		if(loginUsers == null){
			return "用户名或密码错误";
		}else{
			SysLogs log = new SysLogs();
			log.setDetail("用户"+sysUsers.getUsername()+"用户登录成功");
			log.setOptype(1);
			log.setIpAddr(request.getRemoteAddr());
			log.setUserid(loginUsers.getId());
			saveObject("SysLogs.add", log);
			UserSession userSession = new UserSession();
			userSession.setId(loginUsers.getId());
			userSession.setUsername(loginUsers.getUsername());
			request.getSession().setAttribute(Constants.USERSESSION, userSession);
			return "登录成功！";
		}
	}

	public SysUsers getUserById(Long id) {
		return null;
	}

}
